<?php

namespace App\Http\Controllers\Api;

use App\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;

/**
 * CategoryController
 * @extends Controller
 */
class CategoryController extends Controller
{
    /**
     * Rules
     * @param  \Illuminate\Http\Request|null $request
     * @param Category $category
     * @return array
     */
    public static function rules(Request $request = null, Category $category = null)
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
        $categories = Category::filter()
            ->paginate()->appends(request()->query());
        $this->authorize('index', 'App\Category');

        return Resource::collection($categories);
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
        $this->authorize('create', 'App\Category');
        $request->validate(self::rules($request)['store']);

        $category = new Category;
        foreach (self::rules($request)['store'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $category->{$key} = $request->file($key)->store('categories');
                } elseif ($request->exists($key)) {
                    $category->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $category->{$key} = $request->{$key};
            }
        }
        $category->save();

        return (new Resource($category))->response()->setStatusCode(201);
    }

    /**
     * Display the specified resource.
     *
     * @param Category $category
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Category $category)
    {
        $this->authorize('view', $category);

        return new Resource($category);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param Category $category
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function update(Request $request, Category $category)
    {
        $this->authorize('update', $category);
        $request->validate(self::rules($request, $category)['update']);

        foreach (self::rules($request, $category)['update'] as $key => $value) {
            if (str_contains($value, [ 'file', 'image', 'mimetypes', 'mimes' ])) {
                if ($request->hasFile($key)) {
                    $category->{$key} = $request->file($key)->store('categories');
                } elseif ($request->exists($key)) {
                    $category->{$key} = $request->{$key};
                }
            } elseif ($request->exists($key)) {
                $category->{$key} = $request->{$key};
            }
        }
        $category->save();

        return new Resource($category);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Category $category
     * @return Resource
     * @throws \Illuminate\Auth\Access\AuthorizationException
     * @throws \Exception
     */
    public function destroy(Category $category)
    {
        $this->authorize('delete', $category);
        $category->delete();

        return new Resource($category);
    }
}
