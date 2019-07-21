<?php

namespace app\controllers;

use app\models\PasswordResetRequestForm;
use app\models\ResetPasswordForm;
use app\models\Users;
use app\modules\admin\models\Product;
use Yii;
use yii\base\InvalidArgumentException;
use yii\data\Pagination;
use yii\filters\AccessControl;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use yii\widgets\ActiveForm;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['get'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'app\lib\Captcha',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $product= Product::find()->where(['status'=>1]);

        $pages=new Pagination(['totalCount'=>$product->count()]);
        $pages->pageSize=1;
        $pages->pageSizeParam=false;
        $model=$product->offset($pages->offset)->limit($pages->limit)->orderBy('id DESC')->all();
        return $this->render('index',['product'=>$model,'pages'=>$pages]);
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    public function actionShow($slug)
    {
        echo $slug;
    }

    public function actionRegister()
    {
        $model = new Users();

        if(Yii::$app->request->isAjax)
        {
            if ($model->load(Yii::$app->request->post()))
            {
                Yii::$app->response->format=Response::FORMAT_JSON;
                return ActiveForm::validate($model);
            }
        }
        else
        {
            if ($model->load(Yii::$app->request->post())) {
                if ($model->validate()) {

                    $session=Yii::$app->session;
                    if($model->create_user())
                    {
                        $session->setFlash('message_register', 'ثبت نام با موفقیت انجام شد.');
                        $model=new Users();
                    }
                    else
                    {
                        $session->setFlash('message_register', 'در ثبت اطلاعات، خطایی رخ داده - لطفا مجددا تلاش نمایید.');
                    }

                    return $this->render('register', [
                        'model' => $model,
                    ]);

                }
                else
                {
//                    var_dump($model->errors);
                }
            }

            return $this->render('register', [
                'model' => $model,
            ]);
        }

    }

    public function actionTest()
    {
        $auth= Yii::$app->authManager;

        $createPost=$auth->createPermission('createPost');
        $createPost->description='create a post';
        $auth->add($createPost);

        $updatePost=$auth->createPermission('updatePost');
        $updatePost->description='update a post';
        $auth->add($updatePost);

        $author=$auth->createRole('author');
        $auth->add($author);
        $auth->addChild($author,$createPost);

        $admin=$auth->createRole('admin');
        $auth->add($admin);
        $auth->addChild($admin,$author);
        $auth->addChild($admin,$updatePost);

        $auth->assign($author,2);
        $auth->assign($admin,3);
    }

//    public function actionRole()
//    {
//        var_dump( Yii::$app->user->can('createPost'));
//    }

    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            } else {
                Yii::$app->session->setFlash('error', 'Sorry, we are unable to reset password for the provided email address.');
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);

    }

    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidArgumentException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }
}
