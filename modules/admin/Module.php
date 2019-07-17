<?php

namespace app\modules\admin;

use yii\base\ErrorException;
use yii\web\HttpException;

/**
 * admin module definition class
 */
class Module extends \yii\base\Module
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'app\modules\admin\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }

//    public function beforeAction($action)
//    {
//        if(!\Yii::$app->user->isGuest)
//        {
//            if(\Yii::$app->user->identity->role=='admin')
//            {
//                return true;
//            }
//            else
//            {
//                throw  new HttpException('403', 'شما امکان دسترسی به این قسمت را ندارید.');
//            }
//        }
//        else
//        {
//            $url=\Yii::$app->request->baseUrl;
//            return \Yii::$app->response->redirect($url);
//        }
//    }
}
