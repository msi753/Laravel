<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    //Eloquent Relationsips
    //User가 여러개의 기사와 프로젝트를 만들 수 있음
    // user 1이 쓴 article들을 보고 싶을 때
    // php artisan tinker
    // $user = App\Article::find(1);
    // $user-> articles;
    public function articles() {
        return $this->hasMany(Article::class);  //select * from articles where user_id = 1
    }

    public function projects() {
        return $this->hasMany(Project::class);  //select * from projects where user_id = 1
    }
}
