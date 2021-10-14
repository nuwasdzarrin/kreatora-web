<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\CampaignCategory;
use Faker\Generator as Faker;

$factory->define(App\CampaignCategory::class, function (Faker $faker) {
    return [
        'name' => $faker->word,
        'description' => $faker->sentence(10),
    ];
});
