<?php

namespace App\Controller;

use App\Functions\LocationGetter;
use App\Model\CollectionManager;
use App\Model\ItemManager;

class CollectionController extends AbstractController
{
    /**
     * Display Collection PAge
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */

    public function index()
    {
        $collectionManager = new CollectionManager();
        $collections = $collectionManager->selectAll();

        return $this->twig->render('Collection/collection.html.twig', [
            'collections' => $collections,
        ]);
    }

    /**
     * Display collection informations specified by $id
     *
     * @param int $id
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function show(int $id)
    {
        $details = new LocationGetter();
        $colInfo = $details->getCurrentLocation($id);
        $subcollectionManager = new CollectionManager();
        $subcollections = $subcollectionManager->selectSubcategory($id);
        return $this->twig->render('Collection/collection.html.twig', [
            'subcollections' => $subcollections,'locationArr' => $colInfo
        ]);
    }

    /**
     * Display collection  edition page specified by $id
     *
     * @param int $id
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function edit(int $id): string
    {
        $collectionManager = new CollectionManager();
        $collections = $collectionManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $collections['title'] = $_POST['title'];
            $collectionManager->update($collections);
        }

        return $this->twig->render('Collection/collection.html.twig', ['collections' => $collections]);
    }

    /**
     * Display collection creation page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */

    public function add()
    {

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $collectionManager = new CollectionManager();
            $collections = [
                'title' => $_POST['title'],
            ];
            $id = $collectionManager->insert($collections);
            header('Location:/Collection/show/' . $id);
            return $this->twig->render('Collection/collection.html.twig', ['collections' => $collections]);
        }
    }

    /**
     * Handle collection deletion
     *
     * @param int $id
     */
    public function delete(int $id)
    {
        $collectionManager = new CollectionManager();
        $collectionManager->delete($id);
        header('Location:/item/index');
    }
}
