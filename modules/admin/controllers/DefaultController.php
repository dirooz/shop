<?php

namespace app\modules\admin\controllers;

use yii\web\Controller;

/**
 * Default controller for the `admin` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $params=[':id'=>2];
        $cat=\Yii::$app->db->createCommand()->insert('category',
            [
                'cat_name'=>'aaaaaa',
                'cat_ename'=>'aa',
                'parent_id'=>0
            ])->execute();


        echo "<pre>";
        var_dump($cat);
        echo "</pre>";
//        return $this->render('index');
    }
}
