<?php

namespace App\Http\Controllers;

use App\Http\Helper;
use App\Models\Table;

class TableController extends Controller
{
    public function __construct() {}

    public function index()
    {
        $table = Table::all();

        if (count($table) <= 0) return Helper::responseError(null, 'Table not found', 200);

        return Helper::responseSuccess($table, 'Get table successfully', 200);
    }
}
