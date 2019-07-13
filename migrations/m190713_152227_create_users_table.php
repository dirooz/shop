<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%users}}`.
 */
class m190713_152227_create_users_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%users}}', [
            'id' => $this->primaryKey(),
            'fname'=>$this->string(),
            'lname'=>$this->string(),
            'password_hash'=>$this->string(),
            'password_reset_token'=>$this->string(),
            'email'=>$this->string(),
            'username'=>$this->string(),
            'auth_key'=>$this->string(32),
            'role'=>$this->string()
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%users}}');
    }
}
