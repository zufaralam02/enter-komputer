<?php

namespace App\Http\Controllers;

use App\Http\Helper;
use App\Models\Printer;

class PrinterController extends Controller
{
    public function __construct() {}

    public function index()
    {
        $printer = Printer::all();

        if (count($printer) <= 0) return Helper::responseError(null, 'Printer not found', 200);

        return Helper::responseSuccess($printer, 'Get printer successfully', 200);
    }
}
