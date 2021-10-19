<?php

namespace App\Http\Controllers\Api;

use App\CampaignCategory;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Str;

/**
 * CampaignCategoryController
 * @extends Controller
 */
class CampaignCategoryController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param CampaignCategory $campaign_category
     * @return array
     */
    public static function rules(Request $request = null, CampaignCategory $campaign_category = null)
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
        $this->middleware('auth:api')->except(['index']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function index()
    {
        $campaign_categories = CampaignCategory::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\CampaignCategory');

        return Resource::collection($campaign_categories);
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
        $this->authorize('create', 'App\CampaignCategory');
        $request->validate(self::rules($request)['store']);

        $campaign_category = new CampaignCategory;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $campaign_category->{$key} = $request->file($key)->store('campaign_categories');
                } elseif ($request->exists($key)) {
                    $campaign_category->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $campaign_category->{$key} = $request->{$key};
            }
        }
        $campaign_category->save();

        return (new Resource($campaign_category))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param CampaignCategory $campaign_category
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(CampaignCategory $campaign_category)
    {
        $this->authorize('view', $campaign_category);

        return new Resource($campaign_category);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param CampaignCategory $campaign_category
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, CampaignCategory $campaign_category)
    {
        $this->authorize('update', $campaign_category);
        $request->validate(self::rules($request, $campaign_category)['update']);

        foreach (self::rules($request, $campaign_category)['update'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $campaign_category->{$key} = $request->file($key)->store('campaign_categories');
                } elseif ($request->exists($key)) {
                    $campaign_category->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $campaign_category->{$key} = $request->{$key};
            }
        }
        $campaign_category->save();

        return new Resource($campaign_category);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param CampaignCategory $campaign_category
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(CampaignCategory $campaign_category)
    {
        $this->authorize('delete', $campaign_category);
        $campaign_category->delete();

        return new Resource($campaign_category);
    }
}
