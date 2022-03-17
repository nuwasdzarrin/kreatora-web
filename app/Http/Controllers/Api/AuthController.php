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
        $this->message = 'Success';
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
                $data['token'] = $auth->createToken('nApp')->accessToken;
                $user = User::query()->find($auth->id);
                $user->fcm_token = $request->fcm_token;
                $user->save();
                $data['data'] = $user;
                $data['message'] = 'login successfully';
                $this->code = 200;
            } else {
                $data['data'] = [];
                $data['message'] = "Email belum diverifikasi";
                $this->code = 401;
            }

            return response()->json($data, $this->code);
        } else {
            return response()->json([
                'data' => [],
                'message' => 'wrong email or password'
            ], 401);
        }
    }

    public function refresh_fcm_token(Request $request) {
        $validator = Validator::make($request->all(), [
            'fcm_token' => 'string|nullable',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors()
            ], 401);
        }

        $auth = \auth()->user();
        $user = User::query()->find($auth->id);
        $user->fcm_token = $request->fcm_token;
        $user->save();
        return response()->json([
            'data' => $user,
            'message' => 'fcm token has been updated'
        ], 200);
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => [
                'required', 'string', 'min:6',
                'regex:/[a-z]/',
                'regex:/[A-Z]/',
                'regex:/[0-9]/',
                'regex:/[@$!%*#?&.s]/'],
            'password_confirmation' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors()
            ], 401);
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

            $this->message = "Sukses mendaftar akun, silahkan cek email untuk verifikasi";
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            throw new HttpException(500, $exception->getMessage(), $exception);
        }

        return response()->json([
            'data' => $user,
            'message' => $this->message
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
            'ktp' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors()
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

        $this->message = "Selamat akun anda telah manjadi kreator";
        return response()->json([
            'data' => $user,
            'message' => $this->message
        ], 200);
    }

    public function email_code(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors()
            ], 401);
        }
        $data = User::where('email', $request->email)->first();

        $this->message = "Email tidak valid";
        $this->code = 404;

        $code = rand(100000,999999);

        if ($data){
            $data->remember_token = $code;
            $data->save();

            $this->code = 200;
            $this->message = "Sukses mengirimkan ulang kode verifikasi";

            Mail::to($request->email)->send(new EmailCodeVerification($code));
        }

        return response()->json([
            'data' => [],
            'message' => $this->message
        ], $this->code);
    }

    public function email_verification(Request $request){
        $validator = Validator::make($request->all(), [
            'code' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors()
            ], 401);
        }
        $data = User::query()->where('remember_token', $request->code)->first();
        $this->message = "Kode tidak valid silahkan perbarui kode verifikasi anda";
        $this->code = 404;

        if ($data){
            if(!$data->email_verified_at){
                $this->code = 200;
                $this->message = "Sukses melakukan verifikasi email";

                $data->email_verified_at = Carbon::now();
                $data->remember_token = null;
                $data->save();
            } else {
                $this->message = "Email sudah diverifikasi";
            }
        }

        return response()->json([
            'data' => [],
            'message' => $this->message
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
                'data' => [],
                'message' => $validator->errors()
            ], 401);
        }
        $data = User::query()->where('remember_token', $request->code)->first();
        $this->message = "Kode tidak valid silahkan perbarui kode anda";
        $this->code = 404;

        if ($data){
            $data->email_verified_at = Carbon::now();
            $data->remember_token = null;
            $data->password = bcrypt($request->password);
            $data->save();

            $this->code = 200;
            $this->message = "reset password successfully";
        }

        return response()->json([
            'data' => [],
            'message' => $this->message
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
                'data' => [],
                'message' => $validator->errors()
            ], 401);
        }

        $auth = auth()->user();
        $user = User::query()->find($auth->id);
        $user->password = bcrypt($request->password);
        $user->save();

        return response()->json([
            'data' => [],
            'message' => 'change password successfully'
        ], $this->code);
    }

    public function logout()
    {
        Auth::user()->tokens->each(function($token, $key) {
            $token->delete();
        });

        return response()->json([
            'data' => [],
            'message' => 'Logout successfully'
        ], $this->code);
    }

    public function profile()
    {
        $user =User::query()->with(['wallet'])->findOrFail(Auth::user()->id);
        return response()->json($user, $this->code);
    }
}
