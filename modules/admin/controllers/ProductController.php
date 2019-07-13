<?php

namespace app\modules\admin\controllers;

use app\modules\admin\models\Category;
use app\modules\admin\models\ProductCategory;
use Yii;
use app\modules\admin\models\Product;
use app\modules\admin\models\ProductSearch;
use yii\web\Controller;
use yii\web\Cookie;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\web\UploadedFile;
use yii\widgets\ActiveForm;

/**
 * ProductController implements the CRUD actions for Product model.
 */
class ProductController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Product model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Product model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Product();

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

                $model->view=0;
                $model->time=time();
                $model->order_number=0;
                $url=str_replace('-','',$model->title);
                $url=str_replace('/','',$url);
                $model->title_url=preg_replace('/\s+/','-', $url);

                $model->file=UploadedFile::getInstance($model,'file');

                if(!empty($model->file))
                {
                    $url='upload/'.time().'.'.$model->file->extension;
                    if($model->file->saveAs($url))
                    {
                        $model->img=$url;
                    }
                }


                $model->file='';
                if($model->save())
                {
                    $product_cat=Yii::$app->request->post('product_cat');
                    if(is_array($product_cat))
                    {
                        foreach ($product_cat as $key=>$value)
                        {
                            $p_cat = new ProductCategory();
                            $p_cat->category_id=$value;
                            $p_cat->product_id=$model->id;
                            $p_cat->save();
                        }
                    }
                    return $this->redirect(['update', 'id' => $model->id]);
                }
                else
                {
                    $category=Category::find()->where(['parent_id'=>0])->all();
                    return $this->render('create', [
                        'model' => $model,
                        'category'=>$category
                    ]);
                }

            }
            else
            {
                $category=Category::find()->where(['parent_id'=>0])->all();
                return $this->render('create', [
                    'model' => $model,
                    'category'=>$category
                ]);
            }
        }


    }

    /**
     * Updates an existing Product model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

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
            if ($model->load(Yii::$app->request->post()))
            {
                $url=str_replace('-','',$model->title);
                $url=str_replace('/','',$url);
                $model->title_url=preg_replace('/\s+/','-', $url);
                $model->file=UploadedFile::getInstance($model,'file');

                if(!empty($model->file))
                {

                    $url='upload/'.time().'.'.$model->file->extension;
                    if($model->file->saveAs($url))
                    {
                        $model->img=$url;
                    }
                }


                $model->file='';
                if($model->save())
                {
                    ProductCategory::deleteAll(['product_id'=>$model->id]);
                    $product_cat=Yii::$app->request->post('product_cat');
                    if(is_array($product_cat))
                    {
                        foreach ($product_cat as $key=>$value)
                        {
                            $p_cat = new ProductCategory();
                            $p_cat->category_id=$value;
                            $p_cat->product_id=$model->id;
                            $p_cat->save();
                        }
                    }

                    return $this->redirect(['update', 'id' => $model->id]);
                }
                else
                {
                    $category=Category::find()->where(['parent_id'=>0])->all();
                    return $this->render('update', [
                        'model' => $model,
                        'category'=>$category
                    ]);
                }

            }
            else
            {
                $category=Category::find()->where(['parent_id'=>0])->all();
                return $this->render('update', [
                    'model' => $model,
                    'category'=>$category
                ]);
            }
        }


    }

    /**
     * Deletes an existing Product model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Product model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Product the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Product::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionTest()
    {
        $session=Yii::$app->session;

//        $session->set('test', 'new session');

//        $session->remove('test');
//        echo $session->get('test','not found');

//        var_dump($session->has('test'));

//        $session->setFlash('flash_test', 'test1');

//        var_dump($session->getFlash('flash_test'));

        $cookies=Yii::$app->response->cookies;
//        $cookies->add(new Cookie([
//            'name'=>'new',
//            'value'=>'cookie'
//                ]));

        $cookies->remove('new');
        $c=Yii::$app->request->getCookies()->getValue('new');
        var_dump($c);
    }
}
