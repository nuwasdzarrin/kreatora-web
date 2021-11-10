<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\Wallet;
use Faker\Generator as Faker;

$factory->define(App\Wallet::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
    ];
});
