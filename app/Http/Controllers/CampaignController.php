<?php

namespace App\Http\Controllers;

use App\Campaign;
use Illuminate\Http\Request;

/**
 * CampaignController
 */
class CampaignController extends Controller
{
    /**
     * Relations
     * @param  \Illuminate\Http\Request|null $request
     * @param Campaign $campaign
     * @return array
     */
    public static function relations(Request $request = null, Campaign $campaign = null)
    {
        return [
            'campaign' => [
                'belongsToMany' => [], // also for morphToMany
                'hasMany' => [
                    //[ 'name' => 'children', 'label' => ucwords(__('campaigns.children')) ],
                ], // also for morphMany, hasManyThrough
                'hasOne' => [
                    //[ 'name' => 'child', 'label' => ucwords(__('campaigns.child')) ],
                ], // also for morphOne
            ]
        ];
    }

    /**
     * Visibles
     * @param  \Illuminate\Http\Request|null $request
     * @param Campaign $campaign
     * @return array
     */
    public static function visibles(Request $request = null, Campaign $campaign = null)
    {
        return [
            'index' => [
                'campaign' => [
                    //[ 'name' => 'parent', 'label' => ucwords(__('campaigns.parent')), 'column' => 'name' ], // Only support belongsTo, hasOne
                    [ 'name' => 'name', 'label' => ucwords(__('campaigns.name')) ],
                ]
            ],
            'show' => [
                'campaign' => [
                    //[ 'name' => 'parent', 'label' => ucwords(__('campaigns.parent')), 'column' => 'name' ], // Only support belongsTo, hasOne
                    [ 'name' => 'name', 'label' => ucwords(__('campaigns.name')) ],
                ]
            ]
        ];
    }

    /**
     * Fields
     * @param  \Illuminate\Http\Request|null $request
     * @param Campaign $campaign
     * @return array
     */
    public static function fields(Request $request = null, Campaign $campaign = null)
    {
        return [
            'create' => [
                'campaign' => [
                    //[ 'field' => 'select', 'name' => 'parent_id', 'label' => ucwords(__('campaigns.parent')), 'required' => true, 'options' => \App\Parent::filter()->get()->map(function ($parent) {
                    //    return [ 'value' => $parent->id, 'text' => $parent->name ];
                    //})->prepend([ 'value' => '', 'text' => '-' ])->toArray() ],
                    [ 'field' => 'input', 'type' => 'text', 'name' => 'name', 'label' => ucwords(__('campaigns.name')), 'required' => true ],
                ]
            ],
            'edit' => [
                'campaign' => [
                    //[ 'field' => 'select', 'name' => 'parent_id', 'label' => ucwords(__('campaigns.parent')), 'options' => \App\Parent::filter()->get()->map(function ($parent) {
                    //    return [ 'value' => $parent->id, 'text' => $parent->name ];
                    //})->prepend([ 'value' => '', 'text' => '-' ])->toArray() ],
                    [ 'field' => 'input', 'type' => 'text', 'name' => 'name', 'label' => ucwords(__('campaigns.name')) ],
                ]
            ]
        ];
    }

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
                //'parent_id' => 'required|exists:parents,id',
                'name' => 'required|string|max:255',
            ],
            'update' => [
                //'parent_id' => 'exists:parents,id',
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
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function index()
    {
        $campaigns = Campaign::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\Campaign');

        return response()->view('campaigns.index', [
            'campaigns' => $campaigns,
            'relations' => self::relations(request()),
            'visibles' => self::visibles(request())['index']
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function create()
    {
        $this->authorize('create', 'App\Campaign');

        return response()->view('campaigns.create', [
            'fields' => self::fields(request())['create']
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function store(Request $request)
    {
        $this->authorize('create', 'App\Campaign');
        $request->validate(self::rules($request)['store']);

        $campaign = new Campaign;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
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

        if (request()->filled('redirect') && starts_with(request()->redirect, request()->root()))
            $response = response()->redirectTo(request()->redirect);
        else
            $response = response()->redirectToRoute('campaigns.show', $campaign->getKey());

        return $response->withInput([ $campaign->getForeignKey() => $campaign->getKey() ])
            ->with('status', __('Success'));
    }

    /**
     * Display the specified resource.
     *
     * @param Campaign $campaign
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Campaign $campaign)
    {
        $this->authorize('view', $campaign);

        return response()->view('campaigns.show', [
            'campaign' => $campaign,
            'relations' => self::relations(request(), $campaign),
            'visibles' => self::visibles(request(), $campaign)['show'],
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Campaign $campaign
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function edit(Campaign $campaign)
    {
        $this->authorize('update', $campaign);

        return response()->view('campaigns.edit', [
            'campaign' => $campaign,
            'fields' => self::fields(request(), $campaign)['edit']
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param Campaign $campaign
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, Campaign $campaign)
    {
        $this->authorize('update', $campaign);
        $request->validate(self::rules($request, $campaign)['update']);

        foreach (self::rules($request, $campaign)['update'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
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

        if (request()->filled('redirect') && starts_with(request()->redirect, request()->root()))
            $response = response()->redirectTo(request()->redirect);
        else
            $response = response()->redirectToRoute('campaigns.show', $campaign->getKey());

        return $response->withInput([ $campaign->getForeignKey() => $campaign->getKey() ])
            ->with('status', __('Success'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Campaign $campaign
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(Campaign $campaign)
    {
        $this->authorize('delete', $campaign);
        $campaign->delete();

        if (request()->filled('redirect') && starts_with(request()->redirect, request()->root()) && !str_contains(request()->redirect, '/campaigns/'.$campaign->getKey()))
            $response = response()->redirectTo(request()->redirect);
        else
            $response = response()->redirectToRoute('campaigns.index');

        return $response->with('status', __('Success'));
    }
}
