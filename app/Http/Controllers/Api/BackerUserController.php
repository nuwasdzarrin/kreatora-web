<?php

namespace App\Http\Controllers\Api;

use App\BackerUser;
use App\Campaign;
use App\Payment;
use App\User;
use Carbon\Carbon;
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
        $this->middleware('auth:api')->except(['support']);
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
            'email' => (!$user ? 'required|':'') . 'email|' . ($user ? 'nullable':'')
        ]);

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
            
            $backer_user = new BackerUser;
            $backer_user->user_id = $user->id;
            $backer_user->campaign_id = $request->campaign_id;
            if ($request->reward_id) $backer_user->reward_id = $request->reward_id;
            $backer_user->amount = $request->amount;
            if ($request->tip) $backer_user->tip = $request->tip;
            $backer_user->is_anonymous = $request->is_anonymous;
            $backer_user->save();

            // Payment record
            // ......


            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            throw new HttpException(500, $exception->getMessage(), $exception);
        }

        $res['backer_user'] = $backer_user;
        return response()->json([
            'data' => $res
        ])->setStatusCode(200);
    }

    public function me()
    {
        $data = Campaign::query()->whereHas('backer_users', function (Builder $query){
            return $query->where('user_id', auth()->user()->id);
        })->orderByDesc('id')->paginate(15);
        return response()->json($data);
    }
}
