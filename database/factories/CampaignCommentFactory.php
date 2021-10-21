<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\CampaignComment;
use Faker\Generator as Faker;

$factory->define(App\CampaignComment::class, function (Faker $faker) {
    return [
        'parent_id' => $faker->numberBetween(1, 10),
        'campaign_id' => $faker->numberBetween(44, 53),
        'user_id' => $faker->numberBetween(2, 6),
        'content' => $faker->sentence(10),
    ];
});
