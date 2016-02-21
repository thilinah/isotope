<?php
class SingleController extends Controller{

    protected function process($request){
        $data = array();
        $this->render('single.html',$data);
    }

    public function getHeaderController(){
        return new HeaderController();
    }

    public function getFooterController(){
        return new FooterController();
    }
}

Controller::addRoute(Controller::REQUEST_GET, "/single", function() {
    $controller = new SingleController();
    $controller->handleRequest($_REQUEST);
});