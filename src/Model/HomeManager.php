<?php


namespace App\Model;

/**
 *
 */
class HomeManager extends AbstractManager
{
    /**
     *
     */
    const TABLE = 'category';

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }


    /**
     * @param array $item
     * @return int
     */
    public function insert(array $item): int
    {
        // prepared request
        $statement = $this->pdo->prepare("INSERT INTO $this->table (`title`) VALUES (:title)");
        $statement->bindValue('title', $item['title'], \PDO::PARAM_STR);

        if ($statement->execute()) {
            return (int)$this->pdo->lastInsertId();
        }
    }


    /**
     * @param int $id
     */
    public function delete(int $id): void
    {
        // prepared request
        $statement = $this->pdo->prepare("DELETE FROM $this->table WHERE id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
    }


    /**
     * @param array $item
     * @return bool
     */
    public function update(array $item): bool
    {

        // prepared request
        $statement = $this->pdo->prepare("UPDATE $this->table SET `title` = :title WHERE id=:id");
        $statement->bindValue('id', $item['id'], \PDO::PARAM_INT);
        $statement->bindValue('title', $item['title'], \PDO::PARAM_STR);

        return $statement->execute();
    }

    public function getForeign()
    {
        $statement = $this->pdo->prepare("SELECT * FROM $this->table WHERE category_id_category IS NULL");
        return $statement->execute();
    }

    public function parentForSubcat($subcat)
    {

        //prepared request
        $statement = $this->pdo->prepare("SELECT * FROM $this->table WHERE id=:subcat");
        $statement->bindValue('subcat', $subcat['sub_category_id'], \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetch();
    }

    public function getParentForSubcat($subcat)
    {
        $parent = $subcat;
        while ($parent['sub_category_id'] != null) {
            $parent = $this->parentForSubcat($parent);
        }
        return $parent;
    }

    public function getSubCat($mainCollection)
    {
        return $this->pdo->query("SELECT * FROM category WHERE sub_category_id= $mainCollection")->fetchAll();
    }

    public function getRandomProducts($id)
    {
        $query = 'SELECT A.id, A.name, A.image, A.category_id , A.price
FROM article as A JOIN category AS C ON A.category_id=C.id 
WHERE C.sub_category_id=' . $id . ' ORDER BY RAND() LIMIT 6';
        return $this->pdo->query($query)->fetchAll();
    }
}
