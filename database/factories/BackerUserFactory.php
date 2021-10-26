<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use NamespacedApp\BackerUser;
use Faker\Generator as Faker;

$factory->define(App\BackerUser::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
    ];
});
