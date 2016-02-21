<?php

class EchoAction extends AjaxController{

    public function handleRequest($request){
        return new Response(Response::SUCCESS,'Echo');
    }

    public function getAction(){
        return 'echo';
    }

}

AjaxControllerHandler::getInstance()->addAction('echo','EchoAction');

