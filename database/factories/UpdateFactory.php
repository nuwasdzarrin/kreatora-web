<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\Update;
use Faker\Generator as Faker;

$factory->define(App\Update::class, function (Faker $faker) {
    return [
        'campaign_id' => $faker->numberBetween(44, 53),
        'index' => $faker->numberBetween(1, 100),
        'title' => $faker->sentence(3),
        'description' => $faker->sentence(15),
    ];
});
