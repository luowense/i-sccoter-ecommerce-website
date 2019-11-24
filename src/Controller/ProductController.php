<?php

namespace App\Controller;

use App\Model\SubcollectionManager;

class ProductController extends AbstractController
{
    public function show($id)
    {
        $comment = '';
        $firstname = '';
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!empty($_POST['comment']) && isset($_POST['comment'])) {
                $_SESSION['comment'] = $_POST['comment'];
                $comment = $_SESSION['comment'];
            }
        }

        if (!empty($_SESSION['firstname'])) {
            $firstname = $_SESSION['firstname'];
        }


        $productManager = new SubcollectionManager();
        $singleProduct = $productManager->selectOneById($id);
        return $this->twig->render('Product/product.html.twig', [
            'product' => $singleProduct,
            'firstname' => $firstname,
            'comment' => $comment,
            ]);
    }



    public function addToCart()
    {
        if (isset($_POST['add'])) {
            if (isset($_COOKIE["shoppingCart"])) {
                $cart = unserialize($_COOKIE["shoppingCart"]);
            } else {
                $cart = array();
            }

            $referenceIdList = array_column($cart, 'reference_id');

            if (in_array($_POST['hiddenReference'], $referenceIdList)) {
                foreach ($cart as $keys => $value) {
                    if ($cart[$keys]["reference_id"] == $_POST['hiddenReference']) {
                        $value["quantity"] = $cart[$keys]["quantity"] + $_POST['qty'];
                    }
                }
            } else {
                $cookiesTab = [
                    'reference_id' => $_POST['hiddenReference'],
                    'quantity' => $_POST['qty']
                ];
                $cart[] = $cookiesTab;
            }
            $cookiesData = serialize($cart);
            setcookie('shoppingCart', $cookiesData, time() + 365 * 24 * 3600, "/");
            header('Location:/Cart/index');
        }
    }
}
