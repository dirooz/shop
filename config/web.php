<?php

$params = require __DIR__ . '/params.php';
$db = require __DIR__ . '/db.php';

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'language'=>'fa',
    'bootstrap' => ['log'],
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '5CQrwVV5XdBRbyqEPip-7kRV_G3Ono_t',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'useFileTransport' => true,
            'transport'=>[
                'class'=> 'Swift_SmtpTransport',
                'host'=> 'smtp.gmail.com',
                'username'=>'dirooz@chmail.ir',
                'password'=>'www.1z2z3z4z',
                'port'=>'465',
                'encryption'=> 'ssl',
            ],
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => $db,

        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' =>
            [
                'page/<page:\d+>'=>'site/index',
                'admin'=>'/admin/default/index',
                '<slug>'=>'site/show',
                'admin/login'=>'admin/default/login'
            ],
        ],

        'authManager'=>
        [
            'class'=>'yii\rbac\DbManager',
        ],

        'session'=>
        [
            'class'=>'yii\web\DBSession',
            'sessionTable'=>'session'
        ],

    ],
    'params' => $params,

    'modules' => [
        'admin' => [
            'class' => 'app\modules\admin\Module',
            'layout'=>'admin'
        ],
    ],

];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
}

return $config;
