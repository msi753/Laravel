<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\User;
use Faker\Generator as Faker;
use Illuminate\Support\Str;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

// tinkering으로 아래 함수를 트리거해서 dummy 데이터를 생성할 수 있다.
// php artisan tinker
// factory(App\User::class)->create();
// factory(App\User::class, 5)->create();   //5개 만들 때
// factory(App\Article::class, 3)->create(['user_id'=>1]);  //user_id가 1인 거 3개 만들 때
$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'email_verified_at' => now(),
        'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // dummy password
        'remember_token' => Str::random(10),
    ];
});
