<?php

namespace App\Http\Controllers\Api;

use App\CampaignComment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Str;

/**
 * CampaignCommentController
 * @extends Controller
 */
class CampaignCommentController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param CampaignComment $campaign_comment
     * @return array
     */
    public static function rules(Request $request = null, CampaignComment $campaign_comment = null)
    {
        return [
            'store' => [
                'parent_id' => 'exists:campaign_comments,id|nullable',
                'campaign_id' => 'required|exists:campaigns,id',
                'content' => 'required|string|max:255',
            ],
            'update' => [
                'content' => 'string|max:255',
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
        $this->middleware('auth:api')->except(['index', 'show']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function index()
    {
        $campaign_comments = CampaignComment::filter()
            ->paginate()->appends(request()->query());
//        $this->authorize('index', 'App\CampaignComment');

        return Resource::collection($campaign_comments);
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
        $this->authorize('create', 'App\CampaignComment');
        $request->validate(self::rules($request)['store']);

        $campaign_comment = new CampaignComment;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $campaign_comment->{$key} = $request->file($key)->store('campaign_comments');
                } elseif ($request->exists($key)) {
                    $campaign_comment->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $campaign_comment->{$key} = $request->{$key};
            }
        }
        $campaign_comment->save();

        return (new Resource($campaign_comment))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param CampaignComment $campaign_comment
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(CampaignComment $campaign_comment)
    {
//        $this->authorize('view', $campaign_comment);

        return new Resource($campaign_comment);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param CampaignComment $campaign_comment
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, CampaignComment $campaign_comment)
    {
        $this->authorize('update', $campaign_comment);
        $request->validate(self::rules($request, $campaign_comment)['update']);

        foreach (self::rules($request, $campaign_comment)['update'] as $key => $value) {
            if (Str::contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $campaign_comment->{$key} = $request->file($key)->store('campaign_comments');
                } elseif ($request->exists($key)) {
                    $campaign_comment->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $campaign_comment->{$key} = $request->{$key};
            }
        }
        $campaign_comment->save();

        return new Resource($campaign_comment);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param CampaignComment $campaign_comment
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(CampaignComment $campaign_comment)
    {
        $this->authorize('delete', $campaign_comment);
        $campaign_comment->delete();

        return new Resource($campaign_comment);
    }
}
