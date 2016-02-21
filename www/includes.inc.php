<?php
include(dirname(__FILE__).'/config.php');

include(APP_BASE_PATH.'include.common.php');
include(APP_BASE_PATH.'server.includes.inc.php');
include(dirname(__FILE__).'/api/Macaw.php');
include(dirname(__FILE__).'/api/AppManager.php');
include(dirname(__FILE__).'/api/Controller.php');


include(dirname(__FILE__)."/composer/vendor/autoload.php");

//Include all controllers
foreach (glob(dirname(__FILE__).'/controller/*.php') as $filename)
{
    include $filename;
}

$sm = SettingsManager::getInstance();