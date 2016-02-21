<?php
class FooterController extends SubController{
    protected function process($request){
        $data = array();
        $this->render('footer.html',$data);
    }
}