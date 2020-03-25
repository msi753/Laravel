<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

// php artisan tinker
// $tag = App\Tag::first();
// $tag->articles;
class Tag extends Model
{
    public function articles() {
        return $this->belongsToMany(Article::class);
    }
}
