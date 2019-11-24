<?php


namespace App\Controller;

class StoryController extends AbstractController
{
    public function index()
    {
        return $this->twig->render('Story/index.html.twig');
    }
}
