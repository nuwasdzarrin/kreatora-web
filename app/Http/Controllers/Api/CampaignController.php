<?php

namespace App\Http\Controllers\Api;

use App\Campaign;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

/**
 * CampaignController
 * @extends Controller
 */
class CampaignController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param Campaign $campaign
     * @return array
     */
    public static function rules(Request $request = null, Campaign $campaign = null)
    {
        return [
            'store' => [
                'campaign_category_id' => 'required|exists:campaign_categories,id',
                'title' => 'required|string|max:255',
                'short_desc' => 'string|max:255|nullable',
                'long_desc' => 'string|nullable',
                'risk' => 'string|nullable',
                'goal' => 'required|numeric',
                'start' => 'required|date|after:now',
                'end' => 'required|date|after:start',
                'status' => 'in:waiting_list,accepted,rejected,canceled|nullable',
                'images' => 'array|nullable',
            ],
            'update' => [
                'campaign_category_id' => 'exists:campaign_categories,id',
                'title' => 'string|max:255',
                'short_desc' => 'string|max:255',
                'long_desc' => 'string',
                'risk' => 'string',
                'goal' => 'numeric',
                'start' => 'date|after:now',
                'end' => 'date|after:start',
                'status' => 'in:waiting_list,accepted,rejected,canceled',
                'images' => 'array|nullable',
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
        $this->middleware('auth:api')->except(['home','index','show']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function index()
    {
        $campaigns = Campaign::filter()
            ->paginate()->appends(request()->query());
//        $this->authorize('index', 'App\Campaign');

        return Resource::collection($campaigns);
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
        $this->authorize('create', 'App\Campaign');
        $request->validate(self::rules($request)['store']);

        if ($request->has('images')) {
            foreach ($request->images as $image) {
                $validator = Validator::make(['image' => $image], [
                    'image' => 'required|mimes:jpg,jpeg,png|max:2048',
                ]);
                if ($validator->fails()) {
                    return response()->json([
                        'data' => [],
                        'message' => $validator->errors()
                    ], 401);
                }
            }
        }

        $campaign = new Campaign;
        $campaign->user_id = auth()->user()->id;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $campaign->{$key} = $request->file($key)->store('campaigns');
                } elseif ($request->exists($key)) {
                    $campaign->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                if ($key == 'images') {
                    $images = [];
                    foreach ($request->{$key} as $k => $file) {
                        $image = Storage::disk('public')->put('campaigns', $file);
                        if ($image)
                            array_push($images, $image);
                    }
                    $campaign->{$key} = $images;
                } else {
                    $campaign->{$key} = $request->{$key};
                }
            }
        }
        $campaign->save();

        return (new Resource($campaign))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param Campaign $campaign
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Campaign $campaign)
    {
//        $this->authorize('view', $campaign);

        return new Resource($campaign);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param Campaign $campaign
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, Campaign $campaign)
    {
        $this->authorize('update', $campaign);
        $request->validate(self::rules($request, $campaign)['update']);

        foreach (self::rules($request, $campaign)['update'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $campaign->{$key} = $request->file($key)->store('campaigns');
                } elseif ($request->exists($key)) {
                    $campaign->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $campaign->{$key} = $request->{$key};
            }
        }
        $campaign->save();

        return new Resource($campaign);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Campaign $campaign
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(Campaign $campaign)
    {
        $this->authorize('delete', $campaign);
        $campaign->delete();

        return new Resource($campaign);
    }

    public function home()
    {
        Carbon::now();
        $will_end = Campaign::query()
            ->whereNotNull('end')
            ->whereBetween('end', [Carbon::now(), Carbon::now()->addYears(2)])
            ->orderBy('end', 'asc')
            ->limit(5)
            ->get();
        $latest = Campaign::query()->latest('created_at')->limit(5)->get();

        $data = [];
        $data['data']['trending'] = [];
        $data['data']['will_end'] = $will_end;
        $data['data']['popular'] = [];
        $data['data']['latest'] = $latest;
        $data['message'] = 'success';

        return response()->json($data, 200);
    }
}
