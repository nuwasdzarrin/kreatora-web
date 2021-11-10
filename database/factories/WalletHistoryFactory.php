<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\WalletHistory;
use Faker\Generator as Faker;

$factory->define(App\WalletHistory::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
    ];
});
