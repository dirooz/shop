<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\ProductSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php // $form->field($model, 'id') ?>

    <?= $form->field($model, 'title') ?>

    <?php // $form->field($model, 'title_url') ?>

    <?php // $form->field($model, 'text') ?>

    <?php // $form->field($model, 'view') ?>

    <?php  echo $form->field($model, 'status')->dropDownList([1=>'منتشر شده',2=>'پیش نویس']) ?>

    <?php // echo $form->field($model, 'price') ?>

    <?php // echo $form->field($model, 'time') ?>

    <?php // echo $form->field($model, 'order_number') ?>

    <?php // echo $form->field($model, 'links') ?>

    <?php // echo $form->field($model, 'tag') ?>

    <?php // echo $form->field($model, 'img') ?>

    <?php // echo $form->field($model, 'download_times') ?>

    <?php // echo $form->field($model, 'download_number') ?>

    <?php // echo $form->field($model, 'download_size') ?>

    <div class="form-group">
        <?= Html::submitButton('جست و جو', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
