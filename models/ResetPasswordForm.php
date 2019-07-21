<?php
namespace app\models;

use yii\base\InvalidArgumentException;
use yii\base\Model;
use app\models\User;

/**
 * Password reset form
 */
class ResetPasswordForm extends Model
{
    public $password;
    public $password2;

    /**
     * @var \app\models\User
     */
    private $_user;


    /**
     * Creates a form model given a token.
     *
     * @param string $token
     * @param array $config name-value pairs that will be used to initialize the object properties
     * @throws InvalidArgumentException if token is empty or not valid
     */
    public function __construct($token, $config = [])
    {
        if (empty($token) || !is_string($token))
        {
            return \Yii::$app->response->redirect(['site/index']);
//            throw new InvalidArgumentException('Password reset token cannot be blank.');
        }
        $this->_user = \app\models\User::findByPasswordResetToken($token);
        if (!$this->_user) {

            return \Yii::$app->response->redirect(['site/index']);
//            throw new InvalidArgumentException('Wrong password reset token.');
        }
        parent::__construct($config);
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['password', 'password2'], 'required'],
            [['password', 'password2'], 'string', 'min' => 6],
            ['password', 'check_password'],
        ];
    }

    /**
     * Resets password.
     *
     * @return bool if password was reset.
     */
    public function resetPassword()
    {
        $user = $this->_user;
        if($user)
        {
            $user->setPassword($this->password);
            $user->removePasswordResetToken();

            return $user->save(false);
        }

    }

    public function attributeLabels()
    {
        return
        [
            'password'=>'کلمه ی عبور',
            'password2'=>'تکرار کلمه ی عبور'
        ];
    }

    public function check_password($attribute, $params, $validator)
    {
        if(!empty($this->password) && !empty($this->password2))
        {
            if($this->password != $this->password2)
            {
                return $this->addError($attribute , 'تکرار کلمه ی عبور مطابقت ندارد');
            }
        }
    }
}
