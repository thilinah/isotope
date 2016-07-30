<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit91d733469d809ee1828b45ab2da48a10
{
    public static $prefixLengthsPsr4 = array (
        'M' => 
        array (
            'Monolog\\' => 8,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Monolog\\' => 
        array (
            0 => __DIR__ . '/..' . '/monolog/monolog/src/Monolog',
        ),
    );

    public static $prefixesPsr0 = array (
        'T' => 
        array (
            'Twig_' => 
            array (
                0 => __DIR__ . '/..' . '/twig/twig/lib',
            ),
        ),
        'P' => 
        array (
            'Psr\\Log\\' => 
            array (
                0 => __DIR__ . '/..' . '/psr/log',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit91d733469d809ee1828b45ab2da48a10::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit91d733469d809ee1828b45ab2da48a10::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInit91d733469d809ee1828b45ab2da48a10::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}