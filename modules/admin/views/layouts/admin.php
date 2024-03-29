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
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>


</head>

<body>
<?php $this->beginBody() ?>

<div class="row">

    <div class="col-md-3">


<div class="nav-side-menu">
    <div class="brand">پنل مدیریت</div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>

    <div class="menu-list">

        <ul id="menu-content" class="menu-content collapse out">
            <li>
                <a href="#">
                    <i class="fa fa-dashboard fa-lg"></i>    منوی اول
                </a>
            </li>

            <li>
                <a href="#">
                    <i class="fa fa-dashboard fa-lg"></i> منوی دوم
                </a>
            </li>

            <li>
                <a href="#">
                    <i class="fa fa-dashboard fa-lg"></i> منوی سوم
                </a>
            </li>

            <li>
                <a href="#">
                    <i class="fa fa-dashboard fa-lg"></i> منوی چهارم
                </a>
            </li>

<!--            <li data-toggle="collapse" data-target="#products" class="collapsed active">-->
<!--                <a href="#"><i class="fa fa-gift fa-lg"></i> UI Elements <span class="arrow"></span></a>-->
<!--            </li>-->
<!--            <ul class="sub-menu collapse" id="products">-->
<!--                <li class="active"><a href="#">CSS3 Animation</a></li>-->
<!--                <li><a href="#">General</a></li>-->
<!--                <li><a href="#">Buttons</a></li>-->
<!--                <li><a href="#">Tabs & Accordions</a></li>-->
<!--                <li><a href="#">Typography</a></li>-->
<!--                <li><a href="#">FontAwesome</a></li>-->
<!--                <li><a href="#">Slider</a></li>-->
<!--                <li><a href="#">Panels</a></li>-->
<!--                <li><a href="#">Widgets</a></li>-->
<!--                <li><a href="#">Bootstrap Model</a></li>-->
<!--            </ul>-->
<!---->
<!---->
<!--            <li data-toggle="collapse" data-target="#service" class="collapsed">-->
<!--                <a href="#"><i class="fa fa-globe fa-lg"></i> Services <span class="arrow"></span></a>-->
<!--            </li>-->
<!--            <ul class="sub-menu collapse" id="service">-->
<!--                <li>New Service 1</li>-->
<!--                <li>New Service 2</li>-->
<!--                <li>New Service 3</li>-->
<!--            </ul>-->
<!---->
<!---->
<!--            <li data-toggle="collapse" data-target="#new" class="collapsed">-->
<!--                <a href="#"><i class="fa fa-car fa-lg"></i> New <span class="arrow"></span></a>-->
<!--            </li>-->
<!--            <ul class="sub-menu collapse" id="new">-->
<!--                <li>New New 1</li>-->
<!--                <li>New New 2</li>-->
<!--                <li>New New 3</li>-->
<!--            </ul>-->
<!---->
<!---->
<!--            <li>-->
<!--                <a href="#">-->
<!--                    <i class="fa fa-user fa-lg"></i> Profile-->
<!--                </a>-->
<!--            </li>-->
<!---->
<!--            <li>-->
<!--                <a href="#">-->
<!--                    <i class="fa fa-users fa-lg"></i> Users-->
<!--                </a>-->
<!--            </li>-->
        </ul>
    </div>


</div>


    </div>
    <div class="col-md-9">
<?= $content ?>
    </div>
</div>


<?php $this->endBody() ?>
</body>

</html>
<?php $this->endPage() ?>