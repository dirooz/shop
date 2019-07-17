<?php

namespace app\lib;

use yii\captcha\CaptchaAction;

class Captcha extends CaptchaAction
{
    public function generateVerifyCode()
    {
        $word='';
        $letters='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $len=strlen($letters);
        for ($i=0;$i<5;$i++)
        {
            $letter=$letters[rand(0,$len-1)];
            $word.=$letter;
        }
        return $word;
    }
}