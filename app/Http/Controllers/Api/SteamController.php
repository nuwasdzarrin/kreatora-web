<?php

namespace App\Http\Controllers\Api;



use App\Http\Controllers\Controller;
use Invisnik\LaravelSteamAuth\SteamAuth;
use Illuminate\Support\Facades\Auth;
use GuzzleHttp\Client;
use App\User;
use Illuminate\Http\Request;
use Invisnik\LaravelSteamAuth\SteamInfo;

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
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function handle(Request $request)
    {
        
        $linkCLient = $this->steam->getParams();
        
            //request data from steam
            $idSteam = preg_replace("/[^0-9]/","",$linkCLient);
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
                $data['token'] = $user->createToken('nApp')->accessToken;
                $user->fcm_token = $request->fcm_token;
                $user->save();

                $data['message'] = $msg;
                $data['data'] = $user;
                $data['redirect_to'] = 'homepage';
                $this->code = 200;
                return response()->json($data, $this->code);
 
            }else {

                //add data steam on db
                $user = new User();
                $user->name = $players->personaname;
                //$user->email = '';
                $user->avatar = $players->avatar;
                $user->password = bcrypt($steamid);
                $user->email_verified_at = now();
                $user->social_id = $steamid;
                $user->social = 'steam';
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

    /**
     * Getting user by info or created if not exists
     *
     * @param $info
     * @return User
     */
    protected function findOrNewUser($info)
    {
        $user = User::where('social_id', $info->steamID64)->first();

        if (!is_null($user)) {
            return $user;
        }

        return User::create([
            'email' => 'x',
            'name' => $info->personaname,
            'avatar' => $info->avatarfull,
            'social_id' => $info->steamID64
        ]);
    }
    
    
}
