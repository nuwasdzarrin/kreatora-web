<?php

namespace App\Http\Controllers\Api;

use App\BackerUser;
use App\Payment;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Facades\DB;
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
    private $api_key;
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
        $this->middleware('auth:api');
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
        $this->authorize('create', 'App\BackerUser');
        $request->validate([
            'campaign_id' => 'required|exists:campaigns,id',
            'reward_id' => 'exists:rewards,id|nullable',
            'amount' => 'required|numeric',
            'tip' => 'numeric|nullable',
            'bank_code' => 'required|string'
        ]);

        try {
            $backer_user = new BackerUser;
            $backer_user->user_id = auth()->user()->id;
            $backer_user->campaign_id = $request->campaign_id;
            if ($request->reward_id) $backer_user->reward_id = $request->reward_id;
            $backer_user->amount = $request->amount;
            if ($request->tip) $backer_user->tip = $request->tip;
            $backer_user->save();

            $total = $request->amount + $request->tip;
            Xendit::setApiKey($this->api_key);
            $params = [
                "external_id" => uniqid().'va'.$backer_user->id,
                "bank_code" => $request->bank_code,
                "name" => auth()->user()->name,
                "expected_amount" => $total,
                "expiration_date" => Carbon::now()->addDays(1)->toISOString(),
                "is_closed" => true,
                "is_single_use" => true
            ];
            $va = VirtualAccounts::create($params);

            $payment = new Payment;
            $payment->backer_user_id = $backer_user->id;
            $payment->owner_id = $va['owner_id'];
            $payment->external_id = $va['external_id'];
            $payment->name = $va['name'];
            $payment->account_number = $va['account_number'];
            $payment->bank_code = $va['bank_code'];
            $payment->amount = $va['expected_amount'];
            $payment->expiration_date = Carbon::parse($va['expiration_date'])->format('Y-m-d H:i:s');
            $payment->channel = "virtual_account";
            $payment->status = $va['status'];
            $payment->save();

            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            throw new HttpException(500, $exception->getMessage(), $exception);
        }

        $va['backer_user_id'] = $backer_user->id;
        return response()->json([
            'data' => $va
        ])->setStatusCode(200);

    }
}
