<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\BackerUser;
use Illuminate\Http\Request;
use Midtrans\Config as MidConfig;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;
use App\Payment;
use Illuminate\Http\Resources\Json\Resource;
use GuzzleHttp\Client;
use Exception;
use Illuminate\Support\Arr;

/**
 * PaymentController
 * @extends Controller
 */
class PaymentController extends Controller
{
    /**
     * @var int
     */
    private $code;

    public function __construct()
    {
//        MidConfig::$serverKey = 'Mid-server-gBIgM9uBSAGg7sNQGk4rygFE';
//        MidConfig::$isProduction = false;
//        MidConfig::$isSanitized = true;
//        MidConfig::$is3ds = true;

        //$this->middleware('auth:api')->except(['createPayment', 'status']);
    }
    public static function rules(Request $request = null, BackerUser $backer_user = null)
    {
        return [
            'store' => [
                'campaign_id' => 'required|exists:campaigns,id',
                'reward_id' => 'exists:rewards,id|nullable',
                'amount' => 'required|numeric',
            ],
            'show' => [
                'order_id' => 'required',
            ],
            'update' => [
                'order_id' => 'required',
                'status_code' => 'required|numeric',
                'transaction_status' => 'required',
            ],


        ];
    }

    public function index()
    {
        $payment = Payment::filter()
        ->paginate()->appends(request()->query());
        return Resource::collection($payment);
    }

    public function show (Payment $payment)
    {
        return new Resource($payment);
    }

    public function createPayment(Request $request)
    {

        $request->validate(self::rules($request)['store']);

        $backer_user = new BackerUser;
        $backer_user->user_id = auth()->user();
        
        foreach (self::rules($request)['store'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $backer_user->{$key} = $request->file($key)->store('backer_users');
                } elseif ($request->exists($key)) {
                    $backer_user->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $backer_user->{$key} = $request->{$key};
            }
        }
        $amount = $request->amount;
        $client = new Client();
        $params = array(
            'transaction_details' => array(
                    'order_id' => rand(),
                    'gross_amount' => $amount,
            )
        );
        $codeServer = base64_encode(config('midtrans.server_key'));
        $order_id = $params['transaction_details']['order_id'];
        // jika kurang dari Rp. 10.0000
        if ($amount < 1000) {

            return response()->json([
                'message' => $this->message = array("Minimal donasi Rp. 10.000 ya!"),
                'data' => $backer_user
                ], 400);
        } else {
            try {
                $url_production = 'https://app.midtrans.com';
                $url_sandbox = 'https://app.sandbox.midtrans.com';
                $res = $client->request('POST',$url_sandbox.'/snap/v1/transactions', [
                    'headers' => [
                        'Accept' => 'application/json',
                        'Content-Type' => 'application/json',
                        'Authorization' => 'Basic ' . $codeServer,
                        'X-Override-Notification' => 'kreatora.id, kreatora.id',
                   ],
                   'json' => $params
                ]);
                $myTime = Carbon::now();
                $this->code = 200;
                $backer_user->save();
                $data = json_decode($res->getBody()->getContents());
                $email = $request->email;

                DB::table('payments')->insert([
                    'order_id' => $params['transaction_details']['order_id'],
                    'email' => $email,
                    'amount' => $amount,
                    'payment_link' => $data->redirect_url,
                    'created_at' => $myTime,
                    'updated_at' => $myTime
                ]);
                return response()->json([
                    'message' => $this->message = array("Berhasil mendapatkan link pembayaran!"),
                    'payment' => $data,
                    'detail' => $params,
                    'data' => $backer_user
                    ], $this->code);
            } catch (Exception $e) {
                return $e;
            }
        }
    }

    public function status(Request $request) {
        $request->validate([
            'order_id' => 'required|string'
        ]);
        $id = $request->order_id;
       //$codeServer = base64_encode(config('midtrans.server_key'));
        $codeServer = base64_encode('SB-Mid-server-EQcEwgyjU51i4k3YOH8UDfFg:');
        $url_production = 'https://api.midtrans.com/v2/';
        $url_sandbox = 'https://api.sandbox.midtrans.com/v2/';
        $client = new Client();
        $res = $client->request('GET',$url_sandbox.$id.'/status', [
            'headers' => [
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
                'Authorization' => 'Basic ' . $codeServer
           ],
           'params' => [
               'order_id' => $id
           ]

        ]);
        $this->code = 200;
        $data = json_decode($res->getBody()->getContents());
        if ($data->status_code == "404") {
            return response()->json([
                'message' => array('Maaf transaksi tidak valid! Silahkan coba lagi!'),
            ], $this->code);
        }else {
            DB::table('payments')
            ->where('order_id', $id)
            ->limit(1)
            ->update(array(
                'status' => $data->transaction_status,
                'transaction_time' => $data->transaction_time,
            ));
            return response()->json([
                'data' => $data,
            ], $this->code);

                  
        }
    }

    public function handler(Request $request){

        $request->validate(self::rules($request)['update']);

        $order_id = $request->order_id;
        $status_code = $request->status_code;
        $status = $request->transaction_status;

        $this->code = 200;
        if ($order_id == null) {
            return response()->json([
                'message' => array('Maaf transaksi tidak valid! Silahkan coba lagi!'),
            ], $this->code);
        }else {
            DB::table('payments')
            ->where('order_id', $order_id)
            ->limit(1)
            ->update(array(
                'status_code' => $status_code,
                'status' => $status
            ));
            return response()->json([
                'message' => array('Transaksi Berhasil!'),
            ], $this->code);

        }





    }



}



