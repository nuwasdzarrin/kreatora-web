<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\Reward;
use Faker\Generator as Faker;

$factory->define(App\Reward::class, function (Faker $faker) {
    return [
        'campaign_id' => $faker->numberBetween(44, 53),
        'title' => $faker->sentence(3),
        'description' => $faker->sentence(10),
        'min_donation' => $faker->numberBetween(50000, 100000),
        'max_backer' => $faker->numberBetween(20, 50),
    ];
});
