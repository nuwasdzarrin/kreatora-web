<?php

namespace App\Http\Controllers\Api;

use App\WalletHistory;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;

/**
 * WalletHistoryController
 * @extends Controller
 */
class WalletHistoryController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param WalletHistory $wallet_history
     * @return array
     */
    public static function rules(Request $request = null, WalletHistory $wallet_history = null)
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
        $wallet_histories = WalletHistory::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\WalletHistory');

        return Resource::collection($wallet_histories);
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
        $this->authorize('create', 'App\WalletHistory');
        $request->validate(self::rules($request)['store']);

        $wallet_history = new WalletHistory;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $wallet_history->{$key} = $request->file($key)->store('wallet_histories');
                } elseif ($request->exists($key)) {
                    $wallet_history->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $wallet_history->{$key} = $request->{$key};
            }
        }
        $wallet_history->save();

        return (new Resource($wallet_history))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param WalletHistory $wallet_history
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(WalletHistory $wallet_history)
    {
        $this->authorize('view', $wallet_history);

        return new Resource($wallet_history);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param WalletHistory $wallet_history
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, WalletHistory $wallet_history)
    {
        $this->authorize('update', $wallet_history);
        $request->validate(self::rules($request, $wallet_history)['update']);

        foreach (self::rules($request, $wallet_history)['update'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $wallet_history->{$key} = $request->file($key)->store('wallet_histories');
                } elseif ($request->exists($key)) {
                    $wallet_history->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $wallet_history->{$key} = $request->{$key};
            }
        }
        $wallet_history->save();

        return new Resource($wallet_history);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param WalletHistory $wallet_history
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(WalletHistory $wallet_history)
    {
        $this->authorize('delete', $wallet_history);
        $wallet_history->delete();

        return new Resource($wallet_history);
    }
}
