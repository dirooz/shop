<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AdminAsset;

AdminAsset::register($this);
?>

<?php $this->beginPage() ?>
    <!DOCTYPE html>
    <html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?php $this->registerCsrfMetaTags() ?>
        <title>ورود به پنل مدیریت</title>
        <?php $this->head() ?>


    </head>

    <body>
    <?php $this->beginBody() ?>

    <div class="row">

        <div class="col-md-6 col-md-offset-3">
            <?= $content ?>
        </div>
    </div>


    <?php $this->endBody() ?>
    </body>

    </html>
<?php $this->endPage() ?>