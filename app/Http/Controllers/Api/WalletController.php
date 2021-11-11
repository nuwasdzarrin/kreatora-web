<?php

namespace App\Http\Controllers\Api;

use App\Wallet;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Facades\Auth;

/**
 * WalletController
 * @extends Controller
 */
class WalletController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param Wallet $wallet
     * @return array
     */
    public static function rules(Request $request = null, Wallet $wallet = null)
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
        $wallets = Wallet::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\Wallet');

        return Resource::collection($wallets);
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
        $this->authorize('create', 'App\Wallet');
        $request->validate(self::rules($request)['store']);

        $wallet = new Wallet;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $wallet->{$key} = $request->file($key)->store('wallets');
                } elseif ($request->exists($key)) {
                    $wallet->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $wallet->{$key} = $request->{$key};
            }
        }
        $wallet->save();

        return (new Resource($wallet))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param Wallet $wallet
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Wallet $wallet)
    {
        $this->authorize('view', $wallet);

        return new Resource($wallet);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param Wallet $wallet
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, Wallet $wallet)
    {
        $this->authorize('update', $wallet);
        $request->validate(self::rules($request, $wallet)['update']);

        foreach (self::rules($request, $wallet)['update'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $wallet->{$key} = $request->file($key)->store('wallets');
                } elseif ($request->exists($key)) {
                    $wallet->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $wallet->{$key} = $request->{$key};
            }
        }
        $wallet->save();

        return new Resource($wallet);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Wallet $wallet
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(Wallet $wallet)
    {
        $this->authorize('delete', $wallet);
        $wallet->delete();

        return new Resource($wallet);
    }

    public function me()
    {
        $auth = Auth::user();
        $wallet = Wallet::query()->where('user_id',$auth->id)->first();
        return response()->json($wallet);
    }
}
