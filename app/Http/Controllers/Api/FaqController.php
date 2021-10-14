<?php

namespace App\Http\Controllers\Api;

use App\Faq;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;

/**
 * FaqController
 * @extends Controller
 */
class FaqController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param Faq $faq
     * @return array
     */
    public static function rules(Request $request = null, Faq $faq = null)
    {
        return [
            'store' => [
                'campaign_id' => 'required|exists:campaigns,id',
                'user_question_id' => 'required|exists:users,id',
                'user_answer_id' => 'required|exists:users.id',
                'question' => 'required|string|max:255',
                'answer' => 'string|max:255|nullable',
            ],
            'update' => [
                'campaign_id' => 'exists:campaigns,id',
                'user_question_id' => 'exists:users,id',
                'user_answer_id' => 'exists:users.id',
                'question' => 'string|max:255',
                'answer' => 'string|max:255',
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
        $faqs = Faq::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\Faq');

        return Resource::collection($faqs);
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
        $this->authorize('create', 'App\Faq');
        $request->validate(self::rules($request)['store']);

        $faq = new Faq;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $faq->{$key} = $request->file($key)->store('faqs');
                } elseif ($request->exists($key)) {
                    $faq->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $faq->{$key} = $request->{$key};
            }
        }
        $faq->save();

        return (new Resource($faq))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param Faq $faq
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Faq $faq)
    {
        $this->authorize('view', $faq);

        return new Resource($faq);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param Faq $faq
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, Faq $faq)
    {
        $this->authorize('update', $faq);
        $request->validate(self::rules($request, $faq)['update']);

        foreach (self::rules($request, $faq)['update'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $faq->{$key} = $request->file($key)->store('faqs');
                } elseif ($request->exists($key)) {
                    $faq->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $faq->{$key} = $request->{$key};
            }
        }
        $faq->save();

        return new Resource($faq);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Faq $faq
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(Faq $faq)
    {
        $this->authorize('delete', $faq);
        $faq->delete();

        return new Resource($faq);
    }

    public function ask(Request $request)
    {
        $request->validate([
            'campaign_id' => 'required|exists:campaigns,id',
            'question' => 'required|string|max:255'
        ]);
        $faq = new Faq;
        $faq->campaign_id = $request->campaign_id;
        $faq->user_question_id = auth()->user()->id;
        $faq->question = $request->question;
        $faq->save();
        return new Resource($faq);
    }

    public function answer(Request $request, $id)
    {
        $request->validate([
            'answer' => 'required|string|max:255'
        ]);
        $faq = Faq::query()->findOrFail($id);
        $faq->user_answer_id = auth()->user()->id;
        $faq->answer = $request->answer;
        $faq->save();
        return new Resource($faq);
    }
}
