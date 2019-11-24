<?php
/**
 * Created by PhpStorm.
 * User: aurelwcs
 * Date: 08/04/19
 * Time: 18:40
 */

namespace App\Controller;

use App\Model\CollectionManager;

use App\Model\HomeManager;
use App\Model\SubcollectionManager;

class HomeController extends AbstractController
{
    /**
     * Display home page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function index()
    {
        $homeManager = new HomeManager();
        $home = $homeManager->selectAll();
        $productPageManager = new SubcollectionManager();
        $products = $productPageManager->selectAll();
        $newArray = [];
        $firstCategory = $homeManager->getRandomProducts(1);
        $secondCategory = $homeManager->getRandomProducts(2);
        $thirdCategory = $homeManager->getRandomProducts(3);
        $randomProducts = [1 => $firstCategory,
            2 => $secondCategory,
            3 => $thirdCategory];
        foreach ($home as $collection) {
            $newArray[$collection['id']] = [];
            foreach ($products as $product) {
                if ($collection['sub_category_id'] == null) {
                    $newArray[$collection['id']][] = $product;
                }
            }
        }


        return $this->twig->render('Home/index.html.twig', ['collections' => $home,
            'products' => $products,
            'newArray' => $newArray,
            'randomProducts' => $randomProducts,
        ]);
    }

    public function foreign()
    {
        $homeManager = new HomeManager();
        $home = $homeManager->getForeign();
        return $this
            ->twig->render('Home/_1collection-section.html.twig', ['collections' => $home]);
    }

    /**
     * Display item informations specified by $id
     *
     * @param int $id
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function show(int $id)
    {
        $homeManager = new HomeManager();
        $home = $homeManager->selectOneById($id);

        return $this->twig->render('Home/index.html.twig', ['collections' => $home]);
    }

    /**
     * Display item edition page specified by $id
     *
     * @param int $id
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function edit(int $id): string
    {
        $homeManager = new HomeManager();
        $home = $homeManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $home['title'] = $_POST['title'];
            $homeManager->update($home);
        }

        return $this->twig->render('Home/index.html.twig', ['collections' => $home]);
    }
}
