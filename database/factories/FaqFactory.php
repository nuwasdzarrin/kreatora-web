<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\Faq;
use Faker\Generator as Faker;

$factory->define(App\Faq::class, function (Faker $faker) {
    return [
        'campaign_id' => $faker->numberBetween(44, 53),
        'user_question_id' => $faker->numberBetween(2, 6),
        'user_answer_id' => $faker->numberBetween(2, 6),
        'question' => $faker->sentence(5).'?',
        'answer' => $faker->sentence(10),
    ];
});
