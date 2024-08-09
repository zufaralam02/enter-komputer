<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    protected $table = 'order_detail';

    protected $casts = [
        'created_at'  => 'date:Y-m-d H:i:s',
        'updated_at' => 'date:Y-m-d H:i:s'
    ];

    public function category()
    {
        return $this->belongsTo('App\\Models\\Category', 'category_id')
            ->select('id', 'name');
    }

    public function product()
    {
        return $this->belongsTo('App\\Models\\Product', 'product_id')
            ->select('id', 'name', 'has_variant');
    }

    public function variant()
    {
        return $this->belongsTo('App\\Models\\Variant', 'variant_id')
            ->select('id', 'name');
    }
}
