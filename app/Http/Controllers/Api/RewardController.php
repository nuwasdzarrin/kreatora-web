<?php

namespace App\Http\Controllers\Api;

use App\Reward;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;

/**
 * RewardController
 * @extends Controller
 */
class RewardController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param Reward $reward
     * @return array
     */
    public static function rules(Request $request = null, Reward $reward = null)
    {
        return [
            'store' => [
                'name' => 'required|string|max:255',
            ],
            'update' => [
                'name' => 'string|max:255',
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
        $rewards = Reward::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\Reward');

        return Resource::collection($rewards);
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
        $this->authorize('create', 'App\Reward');
        $request->validate(self::rules($request)['store']);

        $reward = new Reward;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $reward->{$key} = $request->file($key)->store('rewards');
                } elseif ($request->exists($key)) {
                    $reward->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $reward->{$key} = $request->{$key};
            }
        }
        $reward->save();

        return (new Resource($reward))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param Reward $reward
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Reward $reward)
    {
        $this->authorize('view', $reward);

        return new Resource($reward);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param Reward $reward
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, Reward $reward)
    {
        $this->authorize('update', $reward);
        $request->validate(self::rules($request, $reward)['update']);

        foreach (self::rules($request, $reward)['update'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $reward->{$key} = $request->file($key)->store('rewards');
                } elseif ($request->exists($key)) {
                    $reward->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $reward->{$key} = $request->{$key};
            }
        }
        $reward->save();

        return new Resource($reward);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Reward $reward
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(Reward $reward)
    {
        $this->authorize('delete', $reward);
        $reward->delete();

        return new Resource($reward);
    }
}
