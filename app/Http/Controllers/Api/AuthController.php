<?php

namespace App\Http\Controllers\Api;

use App\Mail\EmailCodeVerification;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

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
        $this->middleware('auth:api')->only(['register_creator','change_password','logout']);
        $this->code = 200;
        $this->message = 'Success';
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors()
            ], 401);
        }

        if(Auth::attempt(['email' => $request->email,'password' => $request->password])) {
            $user = Auth::user();
            if($user->email_verified_at){
                $data['data'] = $user;
                $data['token'] = $user->createToken('nApp')->accessToken;
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

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:6',
            'password_confirmation' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors()
            ], 401);
        }

        $code = rand(100000,999999);
        Mail::to($request->email)->send(new EmailCodeVerification($code));

        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->remember_token = $code;
        $user->save();

        $this->message = "Sukses mendaftar akun, silahkan cek email untuk verifikasi";

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
            'ktp' => 'required|mimes:jpg,jpeg,png|max:2048',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'data' => [],
                'message' => $validator->errors()
            ], 401);
        }
        $auth = auth()->user();
        $ktp = null;
        if ($request->hasFile('ktp')) {
            $ktp = $request
                ->file('ktp')
                ->storeAs('users', 'ktp_'.$auth->name.'_'.rand(100000,999999).'.'.$request->ktp->getClientOriginalExtension(), 'public');
        }

        $user = User::query()->find($auth->id);
        $user->phone = $request->phone;
        $user->address = $request->address;
        $user->latitude = $request->latitude;
        $user->longitude = $request->longitude;
        $user->gender = $request->gender;
        $user->bank_account = $request->bank_account;
        $user->ktp = $ktp;
        $user->save();

        $this->message = "Sukses mendaftar akun, silahkan cek email untuk verifikasi";
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
}
