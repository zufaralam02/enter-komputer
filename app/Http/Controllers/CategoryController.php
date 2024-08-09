<?php

namespace App\Http\Controllers;

use App\Http\Helper;
use App\Models\Category;

class CategoryController extends Controller
{
    public function __construct() {}

    public function index()
    {
        $category = Category::all();

        if (count($category) <= 0) return Helper::responseError(null, 'Category not found', 200);

        return Helper::responseSuccess($category, 'Get category successfully', 200);
    }
}
