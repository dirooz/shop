<?php

namespace app\modules\admin\models;
use app\models\User;
use Yii;
use yii\base\Model;

class AdminLogin extends Model
{
    public $username;
    public $password;
    public $rememberMe = true;
    public $captcha;

    private $_user = false;

    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password'], 'required'],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            // password is validated by validatePassword()
            ['password', 'validatePassword'],
//            ['captcha','captcha','captchaAction'=>'/admin/default/captcha']
        ];
    }

    public function attributeLabels()
    {
        return
            [
                'username'=> 'نام کاربری',
                'password'=> 'کلمه ی عبور',
                'rememberMe'=> 'مرا به خاطر بسپار',
                'captcha'=> 'تصویر امنیتی'

            ];
    }

    public function getUser()
    {
        if ($this->_user === false) {
            $this->_user = User::findByUsername($this->username,'admin');
        }

        return $this->_user;
    }

    public function login()
    {
        if ($this->validate()) {
            return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600*24*30 : 0);
        }
        return false;
    }

    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();

            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, 'ایمیل یا کلمه ی عبور اشتباه می باشد.');
            }
        }
    }

}
