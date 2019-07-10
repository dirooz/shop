<?php

namespace app\modules\admin\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\admin\models\Product;

/**
 * ProductSearch represents the model behind the search form of `app\modules\admin\models\Product`.
 */
class ProductSearch extends Product
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'view', 'status', 'price', 'time', 'order_number', 'download_number'], 'integer'],
            [['title', 'title_url', 'text', 'links', 'tag', 'img', 'download_times', 'download_size'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Product::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,

            'Pagination'=>
            [
                'pageSize'=>10,
                'pageSizeParam'=>false
            ],

            'sort'=>
            [
                'defaultOrder'=>
                [
                    'id'=>SORT_DESC
                ]
            ]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'view' => $this->view,
            'status' => $this->status,
            'price' => $this->price,
            'time' => $this->time,
            'order_number' => $this->order_number,
            'download_number' => $this->download_number,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'title_url', $this->title_url])
            ->andFilterWhere(['like', 'text', $this->text])
            ->andFilterWhere(['like', 'links', $this->links])
            ->andFilterWhere(['like', 'tag', $this->tag])
            ->andFilterWhere(['like', 'img', $this->img])
            ->andFilterWhere(['like', 'download_times', $this->download_times])
            ->andFilterWhere(['like', 'download_size', $this->download_size]);

        return $dataProvider;
    }
}
