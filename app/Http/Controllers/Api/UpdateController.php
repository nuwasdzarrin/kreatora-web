<?php

namespace App\Http\Controllers\Api;

use App\Update;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Str;

/**
 * UpdateController
 * @extends Controller
 */
class UpdateController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param Update $update
     * @return array
     */
    public static function rules(Request $request = null, Update $update = null)
    {
        return [
            'store' => [
                'campaign_id' => 'required|exists:campaigns,id',
                'title' => 'required|string|max:255',
                'description' => 'required|string|max:255',
            ],
            'update' => [
                'title' => 'string|max:255',
                'description' => 'string|max:255',
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
        $updates = Update::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\Update');

        return Resource::collection($updates);
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
        $this->authorize('create', 'App\Update');
        $request->validate(self::rules($request)['store']);

        $index = Update::query()->where('campaign_id', $request->campaign_id)->count();
        $index += 1;
        $update = new Update;
        $update->index = $index;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $update->{$key} = $request->file($key)->store('updates');
                } elseif ($request->exists($key)) {
                    $update->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $update->{$key} = $request->{$key};
            }
        }
        $update->save();

        return (new Resource($update))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param Update $update
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Update $update)
    {
        $this->authorize('view', $update);

        return new Resource($update);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param Update $update
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, Update $update)
    {
        $this->authorize('update', $update);
        $request->validate(self::rules($request, $update)['update']);

        foreach (self::rules($request, $update)['update'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $update->{$key} = $request->file($key)->store('updates');
                } elseif ($request->exists($key)) {
                    $update->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $update->{$key} = $request->{$key};
            }
        }
        $update->save();

        return new Resource($update);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Update $update
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(Update $update)
    {
        $this->authorize('delete', $update);
        $update->delete();

        return new Resource($update);
    }
}
