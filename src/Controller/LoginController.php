<?php


namespace App\Controller;

class LoginController extends AbstractController
{
    public function index()
    {
        $emailError = '';
        $passwordError = '';
        if (!empty($_POST['email']) && !empty($_POST['password'])) {
            $_SESSION['userEmail'] = $_POST['email'];
            $_SESSION['userPassword'] = $_POST['password'];
            header('location: /user/index');
        } elseif (empty($_POST['email']) || empty($_POST['password'])) {
            if (empty($_POST['email'])) {
                $emailError = 'Please input your email';
            }
            if (empty($_POST['password'])) {
                $passwordError = 'Please input a passsword';
            }



            return $this->twig->render('Login/login.html.twig', [
                'emailError' => $emailError,
                'passwordError' => $passwordError,
            ]);
        }
    }
}
