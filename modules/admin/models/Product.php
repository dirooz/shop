<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "product".
 *
 * @property int $id
 * @property string $title
 * @property string $title_url
 * @property string $text
 * @property int $view
 * @property int $status
 * @property int $price
 * @property int $time
 * @property int $order_number
 * @property string $links
 * @property string $tag
 * @property string $img
 * @property string $download_times
 * @property int $download_number
 * @property string $download_size
 */
class Product extends \yii\db\ActiveRecord
{
    public $file;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title','status'], 'required'],
            [['text', 'links', 'tag'], 'string'],
            [['view', 'status', 'price', 'time', 'order_number', 'download_number'], 'integer'],
            [['title', 'title_url'], 'string', 'max' => 255],
            [['img'], 'string', 'max' => 1000],
            [['download_times', 'download_size'], 'string', 'max' => 100],
            [['file'],'file']
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'عنوان محصول',
            'title_url' => 'Title Url',
            'text' => 'توضیحات',
            'view' => 'بازدید',
            'status' => 'وضعیت محصول',
            'price' => 'قیمت',
            'time' => 'Time',
            'order_number' => 'تعداد فروش',
            'links' => 'لینک های دانلود',
            'tag' => 'برچسب',
            'img' => 'تصویر شاخص',
            'download_times' => 'مدت زمان آموزش',
            'download_number' => 'تعداد فایل ها',
            'download_size' => 'حجم فایل ها',
            'file' => 'تصویر شاخص',
        ];
    }
}
