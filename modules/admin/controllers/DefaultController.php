<?php

namespace app\modules\admin\controllers;

use app\modules\admin\models\AdminLogin;
use yii\web\Controller;

/**
 * Default controller for the `admin` module
 */
class DefaultController extends Controller
{


    public function actions()
    {
        return [

            'captcha' => [
                'class' => 'app\lib\Captcha',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionLogin()
    {
        $this->layout='login';
        if(\Yii::$app->user->isGuest)
        {
            $model=new AdminLogin();
            if($model->load(\Yii::$app->request->post()))
            {
//                var_dump($model->login());
                if($model->login())
                {
                    $url=\Yii::$app->request->baseUrl.'/admin';
                    return $this->redirect($url);
                }
                else
                {
                    return $this->render('login',[ 'model'=>$model]);
                }
            }
            return $this->render('login',[ 'model'=>$model]);
        }
        else
        {
            return $this->goHome();
        }
    }

    public function actionIndex()
    {
        return $this->render('index');
    }
}
