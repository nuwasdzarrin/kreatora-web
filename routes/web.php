<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('run_cache', function () {
    try {
        \Illuminate\Support\Facades\Artisan::call('cache:clear');
        dd("Success to cache");
    } catch (Exception $exception){
        throw $exception;
    }
});

Route::get('run_config', function () {
    try {
        \Illuminate\Support\Facades\Artisan::call('config:clear');
        dd("Success to config");
    } catch (Exception $exception){
        throw $exception;
    }
});

Route::get('run_migrate', function () {
    try {
        \Illuminate\Support\Facades\Artisan::call('migrate');
        dd("Success to migrate");
    } catch (Exception $exception){
        throw $exception;
    }
});

Route::get('run_storage', function () {
    try {
        \Illuminate\Support\Facades\Artisan::call('storage:link');
        dd("Success to storage link");
    } catch (Exception $exception){
        throw $exception;
    }
});

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
