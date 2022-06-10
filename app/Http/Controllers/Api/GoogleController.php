<?php

namespace App\Http\Controllers\Api;

use App\User;
use App\Http\Controllers\Controller;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Http\Request;


class GoogleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api')->except(['redirect', 'callback', 'handleCallback']);
    }

    // for redirect to handleCallback
    public function redirect()
    {
        return Socialite::driver('google')->redirect();
    }

    //endpoint callback from console
    public function handleCallback(Request $request)
    {
        try {
            $user_google    = Socialite::driver('google')->stateless()->user();
            $user           = User::where('email', $user_google->getEmail())->first();

            if($user != null){
                $msg = array('Selamat! kamu telah berhasil login!');
                $data['token'] = $user->createToken('nApp')->accessToken;
                $user = User::query()->find($user->id);
                $user->fcm_token = $request->fcm_token;
                $user->save();
                $data['message'] = $msg;
                $data['data'] = $user;
                $data['redirect_to'] = 'homepage';
                $this->code = 200;
                return response()->json($data, $this->code);
            }else{
                $create = User::Create([
                    'email'             => $user_google->getEmail(),
                    'name'              => $user_google->getName(),
                    'password'          => md5($user_google->token),
                    'email_verified_at' => now(),
                    'google_id'         => $user_google->getId(),
                ]);

                $msg = array('Selamat! kamu telah berhasil login!');
                $data['token'] = $create->createToken('nApp')->accessToken;
                $user = User::query()->find($user->id);
                $user->fcm_token = $request->fcm_token;
                $user->save();
                $data['message'] = $msg;
                $data['data'] = $user;
                $data['redirect_to'] = 'homepage';
                $this->code = 200;

                return response()->json($data, $this->code);
            }

        } catch (\Exception $e) {
            return $e;
        }
    }


    // try to get user from request token
    public function callback(Request $request)
    {
        try {
            $user_google    = Socialite::driver('google')->stateless()->userFromToken($request->token);
            $user           = User::query()->where('email', $user_google->getEmail())->first();

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
            }else{
                $user = new User();
                $user->name = $user_google->getName();
                $user->email = $user_google->getEmail();
                $user->password = bcrypt($user_google->token);
                $user->email_verified_at = now();
                $user->google_id = $user_google->getId();
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

        } catch (\Exception $e) {
            return $e;
        }


    }
}
