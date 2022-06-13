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


Route::post('login', 'Api\AuthController@login')->name('api.login');
Route::post('register', 'Api\AuthController@register')->name('api.register');
Route::post('register_creator', 'Api\AuthController@register_creator')->name('api.register_creator');
Route::post('email_code', 'Api\AuthController@email_code')->name('api.email_code');
Route::post('email_verification', 'Api\AuthController@email_verification')->name('api.email_verification');
Route::post('forget_password', 'Api\AuthController@forget_password')->name('api.forget_password');
Route::post('change_password', 'Api\AuthController@change_password')->name('api.change_password');
Route::post('refresh_fcm_token', 'Api\AuthController@refresh_fcm_token')->name('api.refresh_fcm_token');
Route::get('logout', 'Api\AuthController@logout')->name('api.logout');
Route::get('profile', 'Api\AuthController@profile')->name('api.profile');
Route::post('auth', 'Api\GoogleController@auth')->name('api.auth');


Route::apiResource('users', 'Api\UserController', [ 'as' => 'api' ]);
Route::apiResource('campaign_categories', 'Api\CampaignCategoryController', [ 'as' => 'api' ]);
Route::get('campaigns/home', 'Api\CampaignController@home')->name('campaigns.home');
Route::get('campaigns/me', 'Api\CampaignController@me')->name('campaigns.me');
Route::get('campaigns/slug/{slug}', 'Api\CampaignController@slug')->name('campaigns.slug');
Route::apiResource('campaigns', 'Api\CampaignController', [ 'as' => 'api' ]);
Route::post('faqs/ask', 'Api\FaqController@ask')->name('faqs.ask');
Route::put('faqs/answer/{id}', 'Api\FaqController@answer')->name('faqs.answer');
Route::apiResource('faqs', 'Api\FaqController', [ 'as' => 'api' ]);
Route::apiResource('rewards', 'Api\RewardController', [ 'as' => 'api' ]);
Route::apiResource('updates', 'Api\UpdateController', [ 'as' => 'api' ]);
Route::apiResource('campaign_comments', 'Api\CampaignCommentController', [ 'as' => 'api' ]);

Route::post('support', 'Api\BackerUserController@support')->name('support.create');
Route::get('my_backer', 'Api\BackerUserController@myBacker')->name('backer.my_backer');
Route::get('my_backer/{order_id}', 'Api\BackerUserController@myBackerDetail')->name('backer.my_backer_detail');
Route::apiResource('backer_users', 'Api\BackerUserController', [ 'as' => 'api' ]);

Route::post('payment/createPayment', 'Api\PaymentController@createPayment')->name('payment.createPayment');
Route::get('payment/status', 'Api\PaymentController@status')->name('payment.status');
Route::apiResource('payment', 'Api\PaymentController', [ 'as' => 'api' ]);
Route::post('payment/handler', 'Api\PaymentController@handler')->name('payment.handler');
Route::get('payment/virtual_accounts', 'Api\Payment\XenditController@virtual_accounts')->name('payment.virtual_accounts');
Route::post('payment/virtual_accounts', 'Api\Payment\XenditController@create_virtual_accounts')->name('payment.create_virtual_accounts');
Route::post('payment/callback_virtual_accounts', 'Api\Payment\XenditController@callback_virtual_accounts')->name('payment.callback_virtual_accounts');
Route::post('payment/e_wallet', 'Api\Payment\XenditController@e_wallet')->name('payment.e_wallet');
Route::post('payment/callback_e_wallet', 'Api\Payment\XenditController@callback_e_wallet')->name('payment.callback_e_wallet');
Route::get('shipping/province', 'Api\ShippingController@province')->name('api.shipping.province');
Route::get('shipping/city', 'Api\ShippingController@city')->name('api.shipping.city');
Route::get('shipping/subdistrict', 'Api\ShippingController@subdistrict')->name('api.shipping.subdistrict');
Route::get('shipping/cost', 'Api\ShippingController@cost')->name('api.shipping.cost');
Route::get('wallets/me', 'Api\WalletController@me')->name('api.wallets.me');
Route::apiResource('wallets', 'Api\WalletController', [ 'as' => 'api' ]);
Route::apiResource('wallet_histories', 'Api\WalletHistoryController', [ 'as' => 'api' ]);
