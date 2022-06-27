<?php

namespace App\Http\Controllers\Api;

use App\Mail\EmailCodeVerification;
use App\User;
use App\Wallet;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use GuzzleHttp\Client;
use Symfony\Component\HttpKernel\Exception\HttpException;
use TCG\Voyager\Models\Role;

/**
 * AuthController
 */
class AuthController extends Controller
{
    private $code;
    private $message;
    /**
    * Instantiate a new controller instance.
    *
    * @return void
    */
    public function __construct()
    {
        $this->middleware('auth:api')->only(['refresh_fcm_token','register_creator','change_password','logout','profile']);
        $this->code = 200;
        $this->message = 'Berhasil!';
    }

    public function login(Request $request)
    {
       
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string',
            'fcm_token' => 'string|nullable',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors()
            ], 401);
        }

        if(Auth::attempt(['email' => $request->email,'password' => $request->password])) {
            $auth = Auth::user();
            if($auth->email_verified_at){
                $msg = array('Selamat! kamu telah berhasil login!');
                $data['token'] = $auth->createToken('nApp')->accessToken;
                $user = User::query()->find($auth->id);
                $user->fcm_token = $request->fcm_token;
                $user->save();
                $data['message'] = $msg;
                $data['data'] = $user;
                $data['redirect_to'] = 'homepage';
                $this->code = 200;
            } else {
                $arrayMsg = array('Mohon maaf email belum diverifikasi!', 'Silahkan verifikasi email anda terlebih dahulu');
                $data['message'] = $arrayMsg;
                $data['data'] = [];
                $data['redirect_to'] = 'verification';
                $this->code = 401;
            }

            return response()->json($data, $this->code);
        } else {
            $arrayMsg = array('Password dan emailmu salah!', 'Tolong cek data anda dengan teliti.');
            return response()->json([
                'message' => $arrayMsg,
                'redirect_to' => 'login'
            ], 401);
        }
    }

    public function google_login(Request $request) {
        $client = new \Google_Client(['client_id' => config('service.google.client_id')]);  // Specify the CLIENT_ID of the app that accesses the backend
        $response = $client->verifyIdToken($request->id_token);
//        dd($response);
        if (!$response) {
            return response()->json([
                'message' => array('Login via google gagal'),
                'redirect_to' => 'login'
            ], 401);
        }
        $google_id = $response["jti"];
        $gmail = $response["email"];
        $name = $response["name"];
        $images = $response["picture"];
        $user = User::query()->where('email', $gmail)->first();
        if($user != null){
            $msg = array('Selamat! kamu telah berhasil login!');
            $data['token'] = $user->createToken('nApp')->accessToken;
            $user->fcm_token = $request->fcm_token;
            $user->save();

            $data['message'] = $msg;
            $data['data'] = $user;
            $data['redirect_to'] = 'homepage';
            $this->code = 200;
            return response()->json($data, $this->code);
        } else {
            $user = new User();
            $user->name = $name;
            $user->email = $gmail;
            $user->avatar = $images;
            $user->password = bcrypt($google_id);
            $user->email_verified_at = now();
            $user->google_id = $google_id;
            $user->fcm_token = $request->fcm_token;
            $user->save();

            $msg = array('Selamat! kamu telah berhasil login!');
            $data['token'] = $user->createToken('nApp')->accessToken;

            $data['message'] = $msg;
            $data['data'] = $user;
            $data['redirect_to'] = 'homepage';
            $this->code = 200;

            return response()->json($data, $this->code);
        }
    }

    public function refresh_fcm_token(Request $request) {
        $validator = Validator::make($request->all(), [
            'fcm_token' => 'string|nullable',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors(),
            ], 401);
        }

        $auth = auth()->user();
        $user = User::query()->find($auth->id);
        $user->fcm_token = $request->fcm_token;
        $user->save();
        $msg = array('Token telah diperbarui!');
        return response()->json([
            'message' => $msg,
            'data' => $user,

        ], 200);
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|email',
//            'password' => [
//                'required', 'string', 'min:6',
//                'regex:/[a-z]/',
//                'regex:/[A-Z]/',
//                'regex:/[0-9]/',
//                'regex:/[@$!%*#?&.s]/'],
            'password' => 'required|string|min:6',
            'password_confirmation' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'redirect_to' => 'register',
                'message' => $validator->errors()
            ], 401);
        }

//        check if user exist
        $user = User::query()->where('email', $request->email)->first();
        if ($user) {
            $redirect = '';
            if (!$user->email_verified_at) {
                $msg = array('Mohon maaf email yang anda masukan telah terdaftar. Silahkan cek di email anda agar dapat verifikasi.');
                $this->message = $msg;
                $redirect = 'verification';
            } else {
                $msg = array('Selamat email telah terdaftar dan terverifikasi! silahkan login kembali');
                $this->message = $msg;
                $redirect = 'login';
            }
            return response()->json([
                'data' => $user,
                'redirect_to' => $redirect,
                'message' => $this->message
            ], 200);
        }


        $code = rand(1000,9999);
        Mail::to($request->email)->send(new EmailCodeVerification($code));

        try {
            DB::beginTransaction();

            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = bcrypt($request->password);
            $user->remember_token = $code;
            $user->save();

            $wallet = new Wallet();
            $wallet->user_id = $user->id;
            $wallet->save();

            $this->message = array("Selamat anda berhasil mendaftar! Silahkan cek email untuk verifikasi.");
            
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            throw new HttpException(500, $exception->getMessage(), $exception);
        }

        return response()->json([
            'message' => $this->message,
            'data' => $user,
            'redirect_to' => 'verification',

        ], 200);
    }

    public function register_creator(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|string|max:15',
            'address' => 'required|string|max:255',
            'latitude' => 'string|max:255|nullable',
            'longitude' => 'string|max:255|nullable',
            'gender' => 'in:male,female,prefer_not_to_tell|nullable',
            'bank_account' => 'required|string|max:255',
            'ktp' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors(),
                'data' => [],

            ], 401);
        }
        $auth = auth()->user();
        if ($request->ktp) {
            $baseString = explode(';base64,', $request->ktp);
            $image = base64_decode($baseString[1]);
            $image = imagecreatefromstring($image);
            $ext = explode('/', $baseString[0]);
            $ext = $ext[1];
            $imgName = 'ktp_'.$auth->name.'_'.rand(100000,999999).'.'.$ext;
            if($ext=='png'){
                imagepng($image,storage_path('app/public/users/ktp/').$imgName,8);
            } else {
                imagejpeg($image,storage_path('app/public/users/ktp/').$imgName,20);
            }
            $request->ktp = 'users/ktp/'.$imgName;
        }
        $role = Role::query()->where('name', 'creator')->first();

        $user = User::query()->find($auth->id);
        $user->role_id = $role->id;
        $user->phone = $request->phone;
        $user->address = $request->address;
        $user->latitude = $request->latitude;
        $user->longitude = $request->longitude;
        $user->gender = $request->gender;
        $user->bank_account = $request->bank_account;
        $user->ktp = $request->ktp;
        $user->save();
        $msg = array('Selamat akun anda telah manjadi kreator!');

        return response()->json([
            'message' => $msg,
            'data' => $user,
            'redirect_to' => 'login',
        ], 200);
    }

    public function email_code(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors(),
                'data' => [],

            ], 401);
        }
        $data = User::where('email', $request->email)->first();

        $msg = array('Mohon maaf email tidak valid, silahkan mencoba dengan email yang lain!');
        $this->code = 404;

        $code = rand(1000,9999);

        if ($data){
            $data->remember_token = $code;
            $data->save();
            $this->code = 200;
            $this->message = array("Berhasil mengirimkan ulang kode verifikasi!");
            Mail::to($request->email)->send(new EmailCodeVerification($code));
        }

        return response()->json([
            'message' => $this->message,
            'data' => [],

        ], $this->code);
    }

    public function email_verification(Request $request){
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'code' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors(),
                'data' => [],
            ], 401);
        }

        $data = User::query()->where([
            ['remember_token', $request->code],
            ['email', $request->email],
            ])->first();
        $this->message = array("Mohon maaf kode tidak valid! Silahkan perbarui kode verifikasi anda.");
        $this->code = 404;

        if ($data){
            if(!$data->email_verified_at){
                $this->code = 200;
                $this->message = array("Berhasil melakukan verifikasi email!");
                $data->email_verified_at = Carbon::now();
                $data->remember_token = null;
                $data->save();
            } else {
                $this->message = array("Email sudah diverifikasi!");
            }
        }

        return response()->json([
            'message' => $this->message,
            'data' => [],
        ], $this->code);
    }

    public function forget_password(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'code' => 'required|numeric',
            'password' => 'required|string|min:6',
            'password_confirmation' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors(),
                'data' => [],
            ], 401);
        }
        $data = User::query()->where('remember_token', $request->code)->first();
        $this->message = array("Mohon maaf kode tidak valid! Silahkan perbarui kode anda.");
        $this->code = 404;

        if ($data){
            $data->email_verified_at = Carbon::now();
            $data->remember_token = null;
            $data->password = bcrypt($request->password);
            $data->save();
            $this->code = 200;
            $this->message = array("Berhasil mengatur ulang password!");
        }

        return response()->json([
            'message' => $this->message,
            'data' => [],
        ], $this->code);
    }

    public function change_password(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:6',
            'password_confirmation' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors(),
                'data' => [],
            ], 401);
        }

        $auth = auth()->user();
        $user = User::query()->find($auth->id);
        $user->password = bcrypt($request->password);
        $user->save();

        $msg = array("Berhasil mengubah password anda!");
        return response()->json([
            'message' => $msg,
            'data' => [],
        ], $this->code);
    }

    public function logout()
    {
        $auth = Auth::user()->tokens->each(function($token, $key) {
            $token->delete();
        });
        if ($auth) {
            $msg = array('Berhasil keluar dari halaman!');
            return response()->json([
                'message' => $msg,
                'data' => [],
            ], $this->code);
        } else {
            $msg = array('Mohon maaf anda belum login!');
            return response()->json([
                'message' => $msg,
                'data' => [],
            ], $this->code);
        }

    }

    public function profile()
    {
        $user =User::query()->with(['wallet'])->findOrFail(Auth::user()->id);
        if ($user) {
            $msg = array('Berhasil mendapatkan data profil!');
            return response()->json([
                'message' => $msg,
                'data' => $user,
            ], $this->code);

        } else {
            $msg = array('Mohon maaf anda belum login!');
            return response()->json([
                'message' => $msg,
                'data' => [],
            ], $this->code);
        }

    }
}
