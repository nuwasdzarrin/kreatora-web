<?php

namespace App\Http\Controllers\Api;

use App\BackerUser;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Str;

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
}
