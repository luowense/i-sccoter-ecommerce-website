<?php

namespace App\Functions;

use App\Model\CollectionManager;

class LocationGetter
{
    public function getCurrentLocation($id)
    {
        $collectionManager = new CollectionManager();
        $collections = $collectionManager->selectAll();
        $myCollection = '';
        $mySubCollection = '';
        $myLinks = 0;
        foreach ($collections as $collection) {
            switch ($id) :
                case (!isset($collection['sub_category_id']) and ($collection['id'] == $id)):
                    $myCollection = $collection['name'];
                    $myLinks = $collection['id'];
                    break;
                case ($collection['id'] == $id):
                    $arrayLocation = $collection['sub_category_id' ]-1;
                    $myCollection = $collections[$arrayLocation]['name'];
                    $mySubCollection = $collection['name'];
                    $myLinks = [$collections[$arrayLocation]['id'],$collection['id']];
                    break;
                default:
            endswitch;
        }

        return [$myCollection, $mySubCollection,$myLinks];
    }
}
