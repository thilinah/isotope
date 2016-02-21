<?php
/*
include(dirname(__FILE__).'/includes.inc.php');
$controller = new IndexController();
$controller->handleRequest($_REQUEST);
*/

include(dirname(__FILE__).'/includes.inc.php');
use \NoahBuscher\Macaw\Macaw;

Macaw::get('/a/(:any)', function($action) {
    $actionClass = AjaxControllerHandler::getInstance()->getActionClass($action);
    $actionClass->process($_REQUEST);
});

foreach(Controller::$routes as $path=>$data){
    $method = $data[0];
    $function = $data[1];
    Macaw::$method($path, $function);
}

/*
Macaw::get('/', function() {
    $controller = new IndexController();
    $controller->handleRequest($_REQUEST);
});

Macaw::get('/single', function() {
    $controller = new SingleController();
    $controller->handleRequest($_REQUEST);
});

Macaw::get('/a/(:any)', function($action) {
    LogManager::getInstance()->debug('Action: ' . $action);
    $actionClass = AjaxControllerHandler::getInstance()->getActionClass($action);
    $actionClass->process($_REQUEST);
});

Macaw::error(function() {
    $controller = new ErrorController();
    $controller->handleRequest($_REQUEST);
});

*/

Macaw::dispatch();