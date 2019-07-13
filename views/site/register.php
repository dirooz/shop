<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $form ActiveForm */
?>
<div class="site-register">

    <?php $form = ActiveForm::begin(['enableAjaxValidation'=>true]); ?>

    <?= $form->field($model, 'fname') ?>
    <?= $form->field($model, 'lname') ?>
    <?= $form->field($model, 'email') ?>
    <?= $form->field($model, 'password1')->passwordInput() ?>
    <?= $form->field($model, 'password2')->passwordInput() ?>


    <div class="form-group">
        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
    </div>
    <?php ActiveForm::end(); ?>

</div><!-- site-register -->
