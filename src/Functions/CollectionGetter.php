<?php

namespace App\Functions;

use App\Model\HomeManager;

class CollectionGetter
{


    public static function getMyCollection()
    {
        $homeManager = new HomeManager();
        $getAllCollections = $homeManager->selectAll();
        $mainCollections = [];
        foreach ($getAllCollections as $collection) {
            if ($collection['sub_category_id'] == null) {
                $mainCollections[] = $collection;
            }
        }
        $finalCollection = [];
        foreach ($mainCollections as $mainCollection) {
            $subCats = $homeManager->getSubCat($mainCollection['id']);
            $finalCollection[] = [
                "category" => $mainCollection,
                "subcats" => $subCats
            ];
        }
        return $finalCollection;
    }
}
