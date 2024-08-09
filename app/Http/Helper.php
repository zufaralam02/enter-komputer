<?php

namespace App\Http;

use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

if (!defined("SESSIONID")) define("SESSIONID", uniqid());

class Helper
{
    public static function responseSuccess($data = null, $message = "Success", $code = 200)
    {
        if (isset($data["data"]) && is_array($data) && count($data["data"]) < 1) $data["data"] = null;

        $log = $res = [
            "status"    => true,
            "code"      => $code,
            "message"   => $message,
            "data"      => $data
        ];

        if (is_array($log["data"]) && ($dataRow = count($log["data"])) > 100) $log["data"] = "Found " . $dataRow . " rows";
        if (isset($log["data"]["data"]) && is_array($log["data"]["data"]) && ($dataDataRow = count($log["data"]["data"])) > 100) $log["data"]["data"] = "Found " . $dataDataRow . " rows";

        $log = json_encode($log);

        Log::info(SESSIONID . "\tRESPONSE\t\t\t" . $log);

        return new Response($res, $code);
    }

    public static function responseError($data = null, $message = "Error", $code = 200)
    {
        if (isset($data["data"]) && count($data["data"]) < 1) $data["data"] = null;

        $log = $res = [
            "status"    => false,
            "code"      => $code,
            "message"   => $message,
            "data"      => $data
        ];

        if (is_array($log["data"]) && ($dataRow = count($log["data"])) > 100) $log["data"] = "Found " . $dataRow . " rows";
        if (isset($log["data"]["data"]) && is_array($log["data"]["data"]) && ($dataDataRow = count($log["data"]["data"])) > 100) $log["data"]["data"] = "Found " . $dataDataRow . " rows";

        $log = json_encode($log);

        Log::info(SESSIONID . "\tRESPONSE\t\t\t" . $log);

        return new Response($res, $code);
    }
}
