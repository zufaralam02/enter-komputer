<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Log;

if (!defined("SESSIONID")) define("SESSIONID", uniqid());

class Logging
{
    public function handle($request, Closure $next)
    {
        $log = ["header" => $request->header(), "data" => $request->all()];
        Log::info(SESSIONID . "\t" . $request->ip() . " - [" . $request->method() . "] " . $request->getPathInfo() . ".REQUEST\t\t\t" . json_encode($log));

        return $next($request);
    }
}
