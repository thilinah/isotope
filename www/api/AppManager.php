<?php

class AppManager {

    private static $me = null;

    private function __construct(){

    }

    public static function getInstance(){
        if(empty(self::$me)){
            self::$me = new AppManager();
        }

        return self::$me;
    }
}