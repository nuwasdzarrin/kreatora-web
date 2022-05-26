<?php

namespace App\Http\Controllers\Api;

use App\BackerUser;
use App\Campaign;
use App\CampaignComment;
use App\Payment;
use App\Reward;
use App\User;
use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Xendit\VirtualAccounts;
use Xendit\Xendit;

/**
 * BackerUserController
 * @extends Controller
 */
class BackerUserController extends Controller
{

    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param BackerUser $backer_user
     * @return array
     */
    public static function rules(Request $request = null, BackerUser $backer_user = null)
    {
        return [
            'store' => [
                'campaign_id' => 'required|exists:campaigns,id',
                'reward_id' => 'exists:rewards,id|nullable',
                'amount' => 'required|numeric',
                'tip' => 'numeric|nullable',
            ],
            'update' => [
                'campaign_id' => 'exists:campaigns,id',
                'reward_id' => 'exists:rewards,id|nullable',
                'amount' => 'numeric',
                'tip' => 'numeric|nullable',
            ]
        ];
    }

    /**
    * Instantiate a new controller instance.
    *
    * @return void
    */
    public function __construct()
    {
        $this->api_key = config('payment.xendit.api_key');
        $this->middleware('auth:api')->except(['support','myBackerDetail']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function index()
    {
        $backer_users = BackerUser::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\BackerUser');

        return Resource::collection($backer_users);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function store(Request $request)
    {
        $this->authorize('create', 'App\BackerUser');
        $request->validate(self::rules($request)['store']);

        $backer_user = new BackerUser;
        $backer_user->user_id = auth()->user()->id;
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
        $backer_user->save();

        return (new Resource($backer_user))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param BackerUser $backer_user
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(BackerUser $backer_user)
    {
        $this->authorize('view', $backer_user);

        return new Resource($backer_user);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param BackerUser $backer_user
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, BackerUser $backer_user)
    {
        $this->authorize('update', $backer_user);
        $request->validate(self::rules($request, $backer_user)['update']);

        foreach (self::rules($request, $backer_user)['update'] as $key => $value) {
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
        $backer_user->save();

        return new Resource($backer_user);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param BackerUser $backer_user
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(BackerUser $backer_user)
    {
        $this->authorize('delete', $backer_user);
        $backer_user->delete();

        return new Resource($backer_user);
    }

    public function support(Request $request)
    {
//        $this->authorize('create', 'App\BackerUser');
        $user = auth()->user();
        $request->validate([
            'campaign_id' => 'required|exists:campaigns,id',
            'reward_id' => 'required|exists:rewards,id|nullable',
            'amount' => 'required|numeric',
            'tip' => 'numeric|nullable',
            'is_anonymous' => 'boolean|nullable',
            'name' => (!$user ? 'required|':'') . 'string|' . ($user ? 'nullable':''),
            'email' => (!$user ? 'required|':'') . 'email|' . ($user ? 'nullable':''),
            'comment' => 'string|nullable'
        ]);

        DB::beginTransaction();
        try {
            if (!$user) {
                $is_email_exist = User::query()->where('email', $request->email)->first();
                if ($is_email_exist) {
                    $user = $is_email_exist;
                } else {
                    $user = new User;
                    $user->name = $request->name;
                    $user->email = $request->email;
                    $user->save();
                }
            }

            $reward = null;
            if ($request->reward_id) {
                $reward = Reward::query()->findOrFail($request->reward_id);
            }
            $amount = $reward && $reward->min_donation ? $reward->min_donation : $request->amount;

            // Payment record
            $client = new Client();
            $amount = $amount + $request->tip;
            $params = array(
                'transaction_details' => array(
                    'order_id' => rand(10000,99999).$user->id,
                    'gross_amount' => $amount,
                )
            );
            $codeServer = base64_encode(config('midtrans.server_key'));
            // jika kurang dari Rp. 10.0000
            if ($amount < 10000) {
                return response()->json([
                    'message' => $this->message = array("Minimal donasi Rp. 10.000 ya!"),
                    'data' => new \stdClass()
                ], 400);
            } else {
                try {
                    $is_production = config('midtrans.is_production');
                    $url_production = 'https://app.midtrans.com';
                    $url_sandbox = 'https://app.sandbox.midtrans.com';
                    $res = $client->request('POST',$is_production ? $url_production : $url_sandbox.'/snap/v1/transactions', [
                        'headers' => [
                            'Accept' => 'application/json',
                            'Content-Type' => 'application/json',
                            'Authorization' => 'Basic ' . $codeServer,
                            'X-Override-Notification' => 'kreatora.id, kreatora.id',
                        ],
                        'json' => $params
                    ]);
                    $code = 200;
                    $data = json_decode($res->getBody()->getContents());
                    $email = $user->email;

                    $backer_user = new BackerUser;
                    $backer_user->user_id = $user->id;
                    $backer_user->campaign_id = $request->campaign_id;
                    if ($request->reward_id) $backer_user->reward_id = $request->reward_id;
                    $backer_user->amount = $amount; // amount from reward if available
                    if ($request->tip) $backer_user->tip = $request->tip;
                    $backer_user->is_anonymous = $request->is_anonymous;
                    $backer_user->save();

                    $payment = new Payment();
                    $payment->backer_user_id = $backer_user->id;
                    $payment->order_id = $params['transaction_details']['order_id'];
                    $payment->transaction_id = $data->token;
                    $payment->email = $email;
                    $payment->payment_link = $data->redirect_url;
                    $payment->save();

                    if ($request->comment) {
                        $campaign_comment = new CampaignComment;
                        $campaign_comment->user_id = $user->id;
                        $campaign_comment->campaign_id = $request->campaign_id;
                        $campaign_comment->payment_id = $payment->id;
                        $campaign_comment->content = $request->comment;
                        $campaign_comment->save();
                    }

                } catch (\Exception $e) {
                    throw new HttpException(500, $e->getMessage(), $e);
                }
            }
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            throw new HttpException(500, $exception->getMessage(), $exception);
        }
        return response()->json([
            'message' => $this->message = array("Berhasil mendapatkan link pembayaran!"),
            'payment' => $data,
            'detail' => $params,
            'data' => $backer_user
        ], $code);
    }

    public function myBacker()
    {
        $data = BackerUser::query()->where('user_id', auth()->user()->id)->with(['campaign', 'payment'])
            ->orderByDesc('id')->paginate(15);
        $data = $data->map(function ($item, $key) {
            return [
                "id" => $item->id,
                "amount" => $item->amount,
                "tip" => $item->tip,
                "is_anonymous" => $item->is_anonymous,
                "created_at" => $item->created_at,
                "campaign" => [
                    "title" => $item->campaign->title,
                    "pictures" => $item->campaign->pictures
                ],
                "payment" => [
                    "order_id" => $item->payment ? $item->payment->order_id : null,
                    "transaction_id" => $item->payment ? $item->payment->transaction_id : null,
                    "status_code" => $item->payment ? $item->payment->status_code : null,
                    "metode" => $item->payment ? $item->payment->metode : null,
                    "status" => $item->payment ? $item->payment->status : null,
                    "payment_link" => $item->payment ? $item->payment->payment_link : null,
                    "transaction_time" => $item->payment ? $item->payment->transaction_time : null,
                ]
            ];
        });
        return response()->json($data);
    }

    public function myBackerDetail($order_id)
    {
        //request data from midtrans
        $codeServer = base64_encode(config('midtrans.server_key'));
        $is_production = config('midtrans.is_production');
        $url_production = 'https://api.midtrans.com/v2/';
        $url_sandbox = 'https://api.sandbox.midtrans.com/v2/';
        $client = new Client();
        $res = $client->request('GET',$is_production ? $url_production : $url_sandbox.$order_id.'/status', [
            'headers' => [
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
                'Authorization' => 'Basic ' . $codeServer
           ],
           'params' => [
               'order_id' => $order_id
           ]

        ]);
        $detail = json_decode($res->getBody()->getContents());
        //check if order id valid or nah
        if ($detail->status_code == 404) {
            return response()->json([
                'data' => new \stdClass(),
                'message' => array('Mohon maaf, ID Order yang anda masukan salah!'),
            ]);
        }else {
            //update status
            Payment::where('order_id', $order_id)
            ->limit(1)
            ->update(array(
                'status_code' => $detail->status_code,
                'metode' => $detail->payment_type,
                'status' => $detail->transaction_status,
                'transaction_time' => $detail->transaction_time,
        ));
        }

       //get data from payment table
        $data = BackerUser::query()->whereHas('payment', function ($q) use ($order_id) {
            return $q->where('order_id', $order_id);
        })->with(['campaign', 'payment'])->first();

        if (!$data) {
            return response()->json([
                'data' => new \stdClass(),
                'message' => array('Mohon maaf, ID Order yang anda masukan salah!'),
            ]);
        } else {
            $data = [
                "id" => $data->id,
                "amount" => $data->amount,
                "tip" => $data->tip,
                "is_anonymous" => $data->is_anonymous,
                "created_at" => $data->created_at,
                "campaign" => [
                    "title" => $data->campaign->title,
                    "pictures" => $data->campaign->pictures,
                    "creator_name" => $data->campaign->creator_name
                ],
                "payment" => [
                    "order_id" => $data->payment ? $data->payment->order_id : null,
                    "transaction_id" => $data->payment ? $data->payment->transaction_id : null,
                    "status_code" => $data->payment ? $data->payment->status_code : null,
                    "metode" => $data->payment ? $data->payment->metode : null,
                    "status" => $data->payment ? $data->payment->status : null,
                    "payment_link" => $data->payment ? $data->payment->payment_link : null,
                    "transaction_time" => $data->payment ? $data->payment->transaction_time : null,
                ]
            ];
            return response()->json([
                'message' => array('Berhasil mendapatkan detail transaksi.'),
                'data' => $data
            ]);
        }
    }
}
