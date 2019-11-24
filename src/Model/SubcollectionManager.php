<?php

namespace App\Model;

class SubcollectionManager extends AbstractManager
{
    /**
     *
     */
    const TABLE = 'article';

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function selectSubcategory(int $id)
    {
        //prepared request
        $statement = $this->pdo->prepare("SELECT * FROM $this->table WHERE category_id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetchAll();
    }
}
