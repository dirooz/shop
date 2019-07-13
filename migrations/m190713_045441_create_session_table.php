<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%session}}`.
 */
class m190713_045441_create_session_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%session}}', [
            'id' => $this->string(40)->notNull(),
            'expire'=>$this->integer(),
            'data'=>$this->binary()


        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%session}}');
    }
}
