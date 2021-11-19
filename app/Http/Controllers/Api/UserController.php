<?php

namespace App\Http\Controllers\Api;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Str;

/**
 * UserController
 * @extends Controller
 */
class UserController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param User $user
     * @return array
     */
    public static function rules(Request $request = null, User $user = null)
    {
        return [
            'store' => [
                'role_id' => 'exists:roles,id|nullable',
                'name' => 'required|string|max:255',
                'email' => 'required|string|max:255',
                'password' => 'required|string|max:255',
                'phone' => 'string|max:255|nullable',
                'address' => 'string|max:255|nullable',
                'latitude' => 'string|max:255|nullable',
                'longitude' => 'string|max:255|nullable',
                'gender' => 'string|max:255|nullable',
                'bank_account' => 'string|max:255|nullable',
                'fcm_token' => 'string|max:255|nullable',
                'avatar' => 'mimes:jpg,jpeg,png|max:2048|nullable',
                'ktp' => 'string|max:255|nullable',
            ],
            'update' => [
                'role_id' => 'exists:roles,id',
                'name' => 'string|max:255',
                'email' => 'string|max:255',
                'password' => 'string|max:255',
                'phone' => 'string|max:255',
                'address' => 'string|max:255',
                'latitude' => 'string|max:255',
                'longitude' => 'string|max:255',
                'gender' => 'string|max:255',
                'bank_account' => 'string|max:255',
                'fcm_token' => 'string|max:255',
                'avatar' => 'mimes:jpg,jpeg,png|max:2048',
                'ktp' => 'string|max:255',
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
        $users = User::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\User');

        return Resource::collection($users);
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
        $this->authorize('create', 'App\User');
        $request->validate(self::rules($request)['store']);

        $user = new User;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $user->{$key} = $request->file($key)->store('users');
                } elseif ($request->exists($key)) {
                    $user->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $user->{$key} = $request->{$key};
            }
        }
        $user->save();

        return (new Resource($user))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param User $user
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(User $user)
    {
        $this->authorize('view', $user);

        return new Resource($user);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param User $user
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, User $user)
    {
        $this->authorize('update', $user);
        $request->validate(self::rules($request, $user)['update']);

        $role = User::query()->where('name', 'creator')->first();
        if ($role) {
            $user->role_id = $role->id;
        }
        foreach (self::rules($request, $user)['update'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $user->{$key} = $request->file($key)->store('users');
                } elseif ($request->exists($key)) {
                    $user->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $user->{$key} = $request->{$key};
            }
        }
        $user->save();

        return new Resource($user);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param User $user
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(User $user)
    {
        $this->authorize('delete', $user);
        $user->delete();

        return new Resource($user);
    }
}
