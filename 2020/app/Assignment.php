<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Assignment extends Model
{
    public function complete() {
        $this->completed_at = true;
        $this->save();
    }

}
