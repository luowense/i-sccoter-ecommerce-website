<?php

namespace App\Controller;

use App\Model\CartManager;

class CartController extends AbstractController
{
    /**
     * Display Cart Page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function index()
    {
        if (isset($_POST["update"])) {
            $cart = unserialize($_COOKIE["shoppingCart"]);
            $referenceIdList = array_column($cart, 'reference_id');
            foreach ($_POST as $items => $values) {
                if (in_array($items, $referenceIdList)) {
                    foreach ($cart as $key => $article) {
                        if ($article["reference_id"] == $items) {
                            $cart[$key]["quantity"] = $values;
                            $cookiesData = serialize($cart);
                            setcookie('shoppingCart', $cookiesData, time() + 365 * 24 * 3600, "/");
                            header("location:/Cart/index");
                        }
                    }
                }
            }
        }
        $message = "Empty cart";
        if (isset($_COOKIE["shoppingCart"])) {
            $cartData = unserialize($_COOKIE['shoppingCart']);
            $cartDisplay = array();
            if (!empty($cartData)) {
                foreach ($cartData as $referenceId) {
                    $cartManager = new CartManager();
                    $query = $cartManager->selectOneById($referenceId['reference_id']);
                    $cartDisplay[] = $query;
                }
                return $this->twig->render('Cart/cart.html.twig', ['cartDisplay' => $cartDisplay,
                    'cartData' => $cartData]);
            } else {
                return $this->twig->render('Cart/cart.html.twig', ['message' => $message]);
            }
        } else {
            return $this->twig->render('Cart/cart.html.twig', ['message' => $message]);
        }
    }

    public function delete($id)
    {
        $cartData = unserialize($_COOKIE['shoppingCart']);
        foreach ($cartData as $keys => $value) {
            if ($value['reference_id'] == $id) {
                unset($cartData[$keys]);
                $cookiesData = serialize($cartData);
                setcookie('shoppingCart', $cookiesData, time() + 365 * 24 * 3600, "/");
                header("location:/Cart/index");
            }
        }
    }
}
