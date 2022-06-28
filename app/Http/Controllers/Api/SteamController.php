<?php

namespace App\Http\Controllers\Api;



use App\Http\Controllers\Controller;
use Invisnik\LaravelSteamAuth\SteamAuth;
use Illuminate\Support\Facades\Mail;
use App\Mail\EmailCodeVerification;
use Illuminate\Support\Facades\Auth;
use GuzzleHttp\Client;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpKernel\Exception\HttpException;

class SteamController extends Controller
{


    /**
     * The SteamAuth instance.
     *
     * @var SteamAuth
     */
    protected $steam;

    /**
     * The redirect URL.
     *
     * @var string
     */
    protected $redirectURL = '/';

    /**
     * AuthController constructor.
     *
     * @param SteamAuth $steam
     */
    public function __construct(SteamAuth $steam)
    {
        $this->steam = $steam;
    }

    /**
     * Redirect the user to the authentication page
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function redirectToSteam()
    {
        return $this->steam->redirect();
    }

    /**
     * Get user info and log in
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Foundation\Application|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function handle()
    {
        $linkCLient = $this->steam->getParams();
        $idSteam = preg_replace("/[^0-9]/","",$linkCLient);
        $idSteam = count($idSteam) && $idSteam['openid.identity'] ? $idSteam['openid.identity'] : null;
        if (!$idSteam)
            return $this->redirectToSteam();

        $apiKey = config('steam-auth.api_key');
        $urlSteam = 'https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key='.$apiKey.'&steamids='.$idSteam;
        $client = new Client();
        $res = $client->request('GET',$urlSteam, [
            'headers' => [
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',

            ],
        ]);
        $response = json_decode($res->getBody()->getContents());
        $players = $response->response->players[0];

        $steamid = $players->steamid;
        //checking on database
        $user = User::query()->where('social_id', $steamid)->first();

        if ($user != null) {
            $msg = array('Selamat! kamu telah berhasil login!');
            $user->name = $players->personaname;
            $user->avatar = $players->avatarfull;
            $data['token'] = $user->createToken('nApp')->accessToken;
            $user->save();

            $data['message'] = $msg;
            $data['data'] = $user;
            $data['redirect_to'] = 'homepage';
            $this->code = 200;
            return view('auth.steam', $data);

        } else {
            //add data steam on db
            $user = new User();
            $user->name = $players->personaname;
            $user->email = '';
            $user->avatar = $players->avatarfull;
            $user->password = bcrypt($steamid);
            $user->email_verified_at = null;
            $user->social_id = $steamid;
            $user->social = 'steam';
            $user->save();

            $msg = array('Selamat! kamu telah berhasil login!');
            $data['token'] = $user->createToken('nApp')->accessToken;

            $data['message'] = $msg;
            $data['data'] = $user;
            $data['redirect_to'] = 'homepage';
            $this->code = 200;

            return view('auth.steam', $data);
        }
    }

    public function register(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
            'password_confirmation' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'redirect_to' => 'register',
                'message' => $validator->errors()
            ], 401);
        }
        $code = rand(1000,9999);

//        check if user exist
        $user = User::query()->where('email', $request->email)->first();
        if ($user) {
            $steamUser = User::query()->where('social_id', $id)->first();
            if ($user->email_verified_at) {
                $msg = array('Selamat email telah terdaftar dan terverifikasi! silahkan login kembali');
                $this->message = $msg;
                $redirect = 'login';
            } else {
                $user->remember_token = $code;
                Mail::to($request->email)->send(new EmailCodeVerification($code));
                $msg = array('Mohon maaf email yang anda masukan telah terdaftar. Silahkan cek di email anda agar dapat verifikasi.');
                $this->message = $msg;
                $redirect = 'verification';
            }
            if ($steamUser) {
                $user->name = $steamUser->name;
                $user->avatar = $steamUser->avatar;
                $user->password = bcrypt($request->password);
                $user->social = 'steam';
                $user->social_id = $id;
                $user->save();
                $steamUser->forceDelete();
            }
            return response()->json([
                'data' => $user,
                'redirect_to' => $redirect,
                'message' => $this->message
            ], 200);
        } else {
            try {
                DB::beginTransaction();
                Mail::to($request->email)->send(new EmailCodeVerification($code));
                $user = User::query()->where('social_id', $id)->first();
                $user->email = $request['email'];
                $user->password = bcrypt($request['password']);
                $user->remember_token = $code;
                $user->save();

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
    }
}
