<?php

namespace App\Controller;

use App\Model\CartManager;

class CheckoutController extends AbstractController
{
    public function index()
    {
        if (empty($_SESSION)) {
            header("location:/Login/index");
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
                return $this->twig->render('checkout/checkout.html.twig', ['cartDisplay' => $cartDisplay,
                    'cartData' => $cartData]);
            } else {
                return $this->twig->render('checkout/checkout.html.twig', ['message' => $message]);
            }
        } else {
            return $this->twig->render('checkout/checkout.html.twig', ['message' => $message]);
        }
    }

    public function success()
    {
        // Set the expiration date to one hour ago
        setcookie("shoppingCart", "", time() - 3600, "/");
        return $this->twig->render('checkout/success.html.twig');
    }
}
