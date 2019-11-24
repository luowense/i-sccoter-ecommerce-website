<?php

namespace App\Functions;

use App\Model\HomeManager;

class CookiesGetter
{
    public static function getMyCookie()
    {
        $nbArticles = 0;
        if (isset($_COOKIE["shoppingCart"])) {
            $cookie = unserialize($_COOKIE["shoppingCart"]);
            foreach ($cookie as $items) {
                $nbArticles += $items["quantity"];
            }
        }
        return $nbArticles;
    }
}
