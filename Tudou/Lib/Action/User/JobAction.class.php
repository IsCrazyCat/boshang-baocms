<?php

class JobAction extends CommonAction {

   public function index(){

		if(empty($this->uid)){

			redirect('wap/passport/login');

		}else{
			redirect("http://" . $_SERVER['HTTP_HOST'] . "/user/member/index.html");

		}

   }
    public function jobSign(){
        if(empty($this->uid)){
            header('Location:'.U('wap/passport/login'));
            die;
        }else{
            $this->success('恭喜您报名成功！',U('user/job/signInfo'));
            die;
        }
    }
    public function signInfo(){
       $this->display();
    }
}



