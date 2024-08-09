<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Variant extends Model
{
    protected $table = 'variant';

    protected $casts = [
        'created_at'  => 'date:Y-m-d H:i:s',
        'updated_at' => 'date:Y-m-d H:i:s'
    ];
}
