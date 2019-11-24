<?php
namespace App\Model;

class CartManager extends AbstractManager
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

    /**
     * Get one row from database by reference_id.
     *
     * @param int $referenceId
     * @return array
     */
    public function selectOneById(int $referenceId)
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT * FROM $this->table WHERE reference_id=:reference_id");
        $statement->bindValue('reference_id', $referenceId, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch();
    }
}
