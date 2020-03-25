<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Article;
use Faker\Generator as Faker;

// 생성하기
// php artisan make:facrory ArticleFactory -m "App\Article"
$factory->define(Article::class, function (Faker $faker) {
    return [
        'user_id' => factory(\App\User::class), //User테이블의 user_id와 연관되어 생성
        'title' => $faker->sentence,
        'excerpt' => $faker->sentence,
        'body' => $faker->paragraph
    ];
});
