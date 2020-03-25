<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    //프로젝트가 유저에 속한다.
    public function user() {
        return $this->belongsTo(User::class);   //select * from user where project_id = 1 
    }
}

// hasOne
// hasMany
// belongsTo
// belongsToMany
