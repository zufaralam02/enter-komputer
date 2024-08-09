<?php

namespace App\Http\Controllers;

use App\Http\Helper;
use App\Models\Product;

class ProductController extends Controller
{
    public function __construct() {}

    public function index()
    {
        $product = Product::with(['category', 'variant'])->get();

        if (count($product) <= 0) return Helper::responseError(null, 'Product not found', 200);

        return Helper::responseSuccess($product, 'Get product successfully', 200);
    }
}
