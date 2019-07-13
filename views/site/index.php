<?php

/* @var $this yii\web\View */

$this->title = 'فروشگاه فایل';
?>
<div class="container">

    <br>  <p class="text-center">More bootstrap 4 components on <a href="http://bootstrap-ecommerce.com/"> Bootstrap-ecommerce.com</a></p>
    <hr>
    <div class="row">
<?php
foreach ($product as $key=>$value)
{
?>

    <div class="col-md-4">
        <figure class="card card-product">
            <div class="img-wrap">
                <?php
                if(!empty($value->img))
                {
                    ?><img src="<?=Yii::$app->request->baseUrl.'/'.$value->img ?>"></div><?php
                }
                ?>


            <figcaption class="info-wrap">
                <a href="<?=Yii::$app->request->baseUrl.'/'.$value->title_url ?>"><?= \yii\helpers\Html::encode($value->title_url) ?></a>
                <h4 class="title">مدرس دوره: حسین عبداله زاده</h4>
                <p class="desc">توضیحات دوره: آموزش پروژه محور برنامه نویسی</p>
                <div class="rating-wrap">
                    <div class="label-rating">قیمت: </div>
                    <div class="label-rating">
                        <?php
                        if(!empty($value->price))
                        {
                            echo number_format($value->price).' ریال';
                        }
                        else
                        {
                            echo 'رایگان';
                        }

                        ?>
                    </div>
                </div> <!-- rating-wrap.// -->
            </figcaption>
            <div class="bottom-wrap">
                <a href="" class="btn btn-sm btn-primary float-right">Order Now</a>
                <div class="price-wrap h5">
                    <span class="price-new">$1280</span> <del class="price-old">$1980</del>
                </div> <!-- price-wrap.// -->
            </div> <!-- bottom-wrap.// -->
        </figure>
    </div> <!-- col // -->


<?php
}
?>


    </div> <!-- row.// -->

    <?php
    echo \yii\widgets\LinkPager::widget([
        'pagination'=>$pages,
        'nextPageLabel'=>'صفحه ی بعدی',
        'prevPageLabel'=>'صفحه ی قبلی',
//        'firstPageLabel'=>'اولین صفحه',
//        'lastPageLabel'=>'آخرین صفحه'
    ]);
    ?>


</div>
<!--container.//-->
