<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\admin\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php  echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('ثبت محصول', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn','header'=>'ردیف'],

//            'id',
            'img'=>
                [
                    'label'=>'تصویر شاخص',
                    'format'=>'raw',
                    'value'=>function($model)
                    {
                        if(!empty($model->img))
                        {
                            $url=Yii::$app->request->baseUrl.'/'.$model->img;
                            return "<img src='$url' style='width:120px' />";
                        }
                        else
                        {
                            return '';
                        }
                    }

                ],
            'title',
            'price'=>
            [
                    'label'=>'هزینه ی محصول',
                    'value'=>function($model)
                    {
                        if(empty($model->price))
                        {
                            return '';
                        }
                        else
                        {
                            return number_format($model->price);
                        }
                    }

            ],
//            'title_url:url',
//            'text:ntext',
            'view',
            'status'=>
                [
                    'label'=>'وضعیت محصول',
                    'format'=>'raw',
                    'value'=>function($model)
                    {
                        if($model->status==1)
                        {
                            return '<div class="btn btn-success"> منتشر شده </div>';
                        }
                        else
                        {
                            return '<div class="btn btn-warning"> پیش نویس </div>';
                        }
                    }

                ],

            //'time:datetime',
            'order_number',
            //'links:ntext',
            //'tag:ntext',
            //'download_times',
            //'download_number',
            //'download_size',

            ['class' => 'yii\grid\ActionColumn', 'header'=>'عملیات',
                'template'=>'{update}  {delete}'
                ],
        ],
    ]); ?>
</div>
