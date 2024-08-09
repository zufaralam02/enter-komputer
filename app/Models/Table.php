<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Table extends Model
{
    protected $table = 'table';

    protected $casts = [
        'created_at'  => 'date:Y-m-d H:i:s',
        'updated_at' => 'date:Y-m-d H:i:s'
    ];
}
