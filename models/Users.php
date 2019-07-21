<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "users".
 *
 * @property int $id
 * @property string $fname
 * @property string $lname
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $email
 * @property string $username
 * @property string $auth_key
 * @property string $role
 */
class Users extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */

    public $password1;
    public $password2;
    public static function tableName()
    {
        return 'users';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fname', 'lname', 'email', 'password1', 'password2'], 'required' ],
            [['fname', 'lname', 'password_hash', 'password_reset_token', 'email', 'username', 'role'], 'string', 'max' => 255],
            [['auth_key'], 'string', 'max' => 32],
            [['email'], 'email'],
            [['password1', 'password2'], 'string', 'min'=>6],
            ['password1', 'check_password'],
            [['email'], 'unique']
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'fname' => 'نام',
            'lname' => 'نام خانوادگی',
            'password_hash' => 'Password Hash',
            'password_reset_token' => 'Password Reset Token',
            'email' => 'ایمیل',
            'username' => 'Username',
            'auth_key' => 'Auth Key',
            'role' => 'Role',
            'password1'=> 'کلمه ی عبور',
            'password2'=> 'تکرار کلمه ی عبور',
        ];
    }

    public function check_password($attribute, $params, $validator)
    {
        if(!empty($this->password1) && !empty($this->password2))
        {
            if($this->password1 != $this->password2)
            {
                return $this->addError($attribute , 'تکرار کلمه ی عبور مطابقت ندارد');
            }
        }
    }

    public function create_user()
    {
        $this->password_hash=Yii::$app->security->generatePasswordHash($this->password1);
        $this->role='user';
        $this->auth_key=Yii::$app->security->generateRandomString();
        if($this->save())
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}
