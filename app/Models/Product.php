<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';

    protected $casts = [
        'created_at'  => 'date:Y-m-d H:i:s',
        'updated_at' => 'date:Y-m-d H:i:s'
    ];

    public function category()
    {
        return $this->belongsTo('App\\Models\\Category', 'category_id')
            ->select('id', 'name');
    }

    public function variant()
    {
        return $this->hasMany('App\\Models\\Variant', 'product_id')
            ->select('id', 'product_id', 'name', 'price');
    }
}
