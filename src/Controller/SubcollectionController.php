<?php

namespace App\Controller;

use App\Model\CollectionManager;
use App\Model\SubcollectionManager;
use App\Functions\LocationGetter;

class SubcollectionController extends AbstractController
{
    /**
     * Display Subcollection listing
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */

    public function show($id)
    {

        $details = new LocationGetter();
        $colInfo = $details->getCurrentLocation($id);
        $productManager = new SubcollectionManager();
        $products = $productManager->selectSubcategory($id);
        $bob = 'Subcollection/productSubcollection.html.twig';
        $bib = ['products' => $products, 'locationArr' => $colInfo];
        return $this->twig->render($bob, $bib);
    }
}
