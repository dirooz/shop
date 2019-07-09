<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Product */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-form">

    <?php $form = ActiveForm::begin(['enableAjaxValidation'=>true]); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true, 'style'=>'width:75%']) ?>


    <?= $form->field($model, 'text')->textarea(['rows' => 6,'class'=>'ckeditor'])->label(false) ?>

    <?= $form->field($model, 'view')->textInput() ?>

    <?= $form->field($model, 'status')->radioList([1=>'منشر شده', 2=>'پیش نویس']) ?>

    <?= $form->field($model, 'price')->textInput() ?>

    <div class="form-group" style="background: #f9f9f9">

        <ul class="list-unstyled">

            <?php
                foreach ($category as $ky=>$value)
                {
                    ?>
                    <li><input type="checkbox" <?php if($value->check_cat($model->id)==1){ ?> checked="checked" <?php } ?> name="product_cat[]" value="<?=$value->id ?>" style="margin-left: 5px;">
                    <?= Html::encode($value->cat_name) ?>
                        <ul>
                            <?php
                            if(!empty($value->child))
                            {
                                foreach ($value->child as $kay2=>$value2)
                                {
                                    ?>
                            <li><input type="checkbox" <?php if($value2->check_cat($model->id)==1){ ?> checked="checked" <?php } ?> name="product_cat[]" value="<?=$value2->id ?>" style="margin-left: 5px;">
                                <?= Html::encode($value2->cat_name) ?>
                                    <?php
                                }
                            }

                            ?>
                        </ul>
                    </li>
                    <?php
                }
            ?>

        </ul>

    </div>

    <?= $form->field($model, 'time')->textInput() ?>

    <?= $form->field($model, 'order_number')->textInput() ?>

    <?= $form->field($model, 'links')->textarea(['rows' => 6, 'style'=>'width:75%']) ?>

    <?= $form->field($model, 'tag')->textarea(['rows' => 6, 'style'=>'width:75%']) ?>

    <?= $form->field($model, 'file')->fileInput() ?>

    <?= $form->field($model, 'download_times')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'download_number')->textInput() ?>

    <?= $form->field($model, 'download_size')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php
$this->registerJsFile(Yii::$app->request->baseUrl.'/ckeditor/ckeditor.js');
?>