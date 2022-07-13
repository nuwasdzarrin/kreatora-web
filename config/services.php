<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Stripe, Mailgun, SparkPost and others. This file provides a sane
    | default location for this type of information, allowing packages
    | to have a conventional place to find your various credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
    ],

    'ses' => [
        'key' => env('SES_KEY'),
        'secret' => env('SES_SECRET'),
        'region' => 'us-east-1',
    ],

    'sparkpost' => [
        'secret' => env('SPARKPOST_SECRET'),
    ],

    'stripe' => [
        'model' => App\User::class,
        'key' => env('STRIPE_KEY'),
        'secret' => env('STRIPE_SECRET'),
    ],

    'google' => [
        'client_id' => env('GOOGLE_CLIENT_ID','362844505116-9hsro776fj7h7pugpnkvmjao35ndf3ha.apps.googleusercontent.com'),
        'client_secret' => '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',
//        'client_id' => env('GOOGLE_CLIENT_ID','879549587031-ohodmoqbqe3lu01jng08j6v3dj09rb09.apps.googleusercontent.com'),
//        'client_secret' => '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',
        'redirect' => 'http://127.0.0.1:8000/google/callback',
    ],
];
