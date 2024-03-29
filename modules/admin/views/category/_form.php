<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Category */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="category-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cat_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cat_ename')->textInput(['maxlength' => true]) ?>

    <?php

    $array=[0=>'انتخاب سردسته'];
    $array2=\yii\helpers\ArrayHelper::map($category,'id', 'cat_name');
    $array3=$array+$array2;
    ?>
    <?= $form->field($model, 'parent_id')->dropDownList($array3) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
