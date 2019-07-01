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
        $params=[':id'=>3,':name'=>'فریم ورک yii2'];
        $cat=\Yii::$app->db->createCommand('SELECT * FROM category WHERE id=:id AND cat_name=:name')
        ->bindValues($params)->queryOne();
        var_dump($cat);

//        return $this->render('index');
    }
}
