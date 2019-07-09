<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "{{%category}}".
 *
 * @property int $id
 * @property string $cat_name
 * @property string $cat_ename
 * @property int $parent_id
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%category}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cat_name', 'cat_ename', 'parent_id'], 'required'],
            [['parent_id'], 'integer'],
            [['cat_name', 'cat_ename'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'cat_name' => Yii::t('app', 'Cat Name'),
            'cat_ename' => Yii::t('app', 'Cat Ename'),
            'parent_id' => Yii::t('app', 'Parent ID'),
        ];
    }

    public function getParent()
    {
        return $this->hasOne(Category::className(),['id'=>'parent_id']);
    }

    public function getChild()
    {
        return $this->hasMany(Category::className(),['parent_id'=>'id']);
    }

//    public function getProductCat()
//    {
//        return $this->hasOne(ProductCategory::className(),['category_id'=>'id']);
//    }

    public function check_cat($id)
    {
        return $this->hasOne(ProductCategory::className(),['category_id'=>'id'])->where(['product_id'=>$id])->count();
    }
}
