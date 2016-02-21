<?php

class IndexController extends Controller{

    protected function process($request){
        $data = array();
        $this->render('index.html',$data);
    }

    public function getHeaderController(){
        return null;
    }

    public function getFooterController(){
        return null;
    }
}

Controller::addRoute(Controller::REQUEST_GET, "/", function() {
    $controller = new IndexController();
    $controller->handleRequest($_REQUEST);
});