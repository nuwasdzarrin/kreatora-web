<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\Faq;
use Faker\Generator as Faker;

$factory->define(App\Faq::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
    ];
});
