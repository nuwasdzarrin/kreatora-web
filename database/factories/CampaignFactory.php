<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\Campaign;
use Faker\Generator as Faker;

$factory->define(App\Campaign::class, function (Faker $faker) {
    return [
//        'campaign_category_id' => function () {
//            return factory(\App\CampaignCategory::class)->create()->getKey();
//        },
//        'user_id' => function () {
//            return factory(\App\User::class)->create()->getKey();
//        },
        'campaign_category_id' => $faker->numberBetween(7, 9),
        'user_id' => $faker->numberBetween(2, 6),
        'title' => $faker->sentence(3),
        'short_desc' => $faker->sentence(10),
        'long_desc' => $faker->text(100),
        'risk' => $faker->text(100),
        'goal' => $faker->numberBetween(50000, 500000),
        'start' => $faker->dateTime('now'),
        'end' => $faker->dateTimeBetween('now', '+1 years'),
        'status' => 'waiting_list',
        'images' => [
            'posts/post'.$faker->numberBetween(1,4).'-medium.jpg',
            'posts/post'.$faker->numberBetween(1,4).'-medium.jpg'
        ],
    ];
});
