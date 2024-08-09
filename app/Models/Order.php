<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'order';

    protected $casts = [
        'created_at'  => 'date:Y-m-d H:i:s',
        'updated_at' => 'date:Y-m-d H:i:s'
    ];

    public function order_detail()
    {
        return $this->hasMany('App\\Models\\OrderDetail', 'order_code', 'code');
    }
}
