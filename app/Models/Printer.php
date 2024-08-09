<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Printer extends Model
{
    protected $table = 'printer';

    protected $casts = [
        'created_at'  => 'date:Y-m-d H:i:s',
        'updated_at' => 'date:Y-m-d H:i:s'
    ];
}
