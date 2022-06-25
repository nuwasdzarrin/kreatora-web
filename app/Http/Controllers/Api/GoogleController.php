<?php

namespace App\Http\Controllers\Api;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Client;


class GoogleController extends Controller
{
    public function auth(Request $request){
        $client = new Client();
        $token = $request->access_token;
        $res = $client->request('GET','https://www.googleapis.com/oauth2/v1/userinfo?access_token='.$token, [
            'headers' => [
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',

           ],
           'params' => [
               'access_token' => $request->access_token,

           ]
        ]);
        $response = json_decode($res->getBody()->getContents());
        $google_id = $response->id;
        $gmail = $response->email;
        $name = $response->name;
        $images = $response->picture;
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
        }else{
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
}
