<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 11/10/17
 * Time: 15:38
 * PHP version 7
 */

namespace App\Controller;

use App\Functions\CollectionGetter ;
use App\Functions\CookiesGetter;
use Twig\Environment;
use Twig\Extension\DebugExtension;
use Twig\Loader\FilesystemLoader;

/**
 *
 */
abstract class AbstractController
{
    /**
     * @var Environment
     */
    protected $twig;


    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        $loader = new FilesystemLoader(APP_VIEW_PATH);
        $this->twig = new Environment(
            $loader,
            [
                'cache' => !APP_DEV,
                'debug' => APP_DEV,
            ]
        );


        //Variable Superglobale où l'on récupère nos catégories et sous-catégories
        $coll = new CollectionGetter();
        $mainCollections = $coll->getMyCollection();
        $this->twig->addGlobal('globalCollections', $mainCollections);
        $this->twig->addGlobal('session', $_SESSION);
        $this->twig->addExtension(new DebugExtension());

        //Display number of articles in cart
        $cookies = new CookiesGetter();
        $nbArticles = $cookies->getMyCookie();
        $this->twig->addGlobal('nbArticles', $nbArticles);
    }
}
