<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/profile', function (Request $request) {
    return $request->user();
});
Route::post('login', 'Api\AuthController@login')->name('api.login');
Route::post('register', 'Api\AuthController@register')->name('api.register');
Route::post('register_creator', 'Api\AuthController@register_creator')->name('api.register_creator');
Route::post('email_code', 'Api\AuthController@email_code')->name('api.email_code');
Route::post('email_verification', 'Api\AuthController@email_verification')->name('api.email_verification');
Route::post('forget_password', 'Api\AuthController@forget_password')->name('api.forget_password');
Route::post('change_password', 'Api\AuthController@change_password')->name('api.change_password');
Route::get('logout', 'Api\AuthController@logout')->name('api.logout');
Route::apiResource('users', 'Api\UserController', [ 'as' => 'api' ]);
Route::apiResource('categories', 'Api\CategoryController', [ 'as' => 'api' ]);
