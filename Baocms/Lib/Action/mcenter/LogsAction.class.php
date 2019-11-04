<?php



class LogsAction extends CommonAction {

    public function goldlogs() {   //金块日志
        $Usergoldlogs = D('Usergoldlogs');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('user_id' => $this->uid);
        $count = $Usergoldlogs->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Usergoldlogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();

        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display(); // 输出模板
    }
    
    public function moneylogs() {   //余额日志
        $Usermoneylogs = D('Usermoneylogs');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('user_id' => $this->uid);
		$map = array('shop_id' => 0);
		
        $count = $Usermoneylogs->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Usermoneylogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }
	
	 public function mymoneylogs() {   //排单返现
        $Usermoneylogs = D('Usermoneylogs');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('user_id' => $this->uid);
		$map['shop_id']  = array('gt',0);
		//$map = array('shop_id' => $this->uid);
        $count = $Usermoneylogs->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 20); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Usermoneylogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }
	
	
	
	 public function myorder() {   //我的订单
	 
	    
        $Usermoneylogs = D('Usermoneylogs');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('user_id' => $this->uid);
		$map['shop_id']  = array('gt',0);
		//$map = array('shop_id' => $this->uid);
        $count = $Usermoneylogs->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 20); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Usermoneylogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }

	
	public function mylogsPaid() {
		$pay_id = (int) $this->_get('pay_id');
		$shop_id = 0;
		$my_shop_id = D('Shop') -> where(array('user_id' => $this->uid,'closed' => 0,'audit' => 1)) -> getField('shop_id');
		$Paymentlogs = D('Paymentlogs')->where(array('log_id' => $pay_id))->find();
		if ( ( (int)$my_shop_id == (int)$Paymentlogs['shop_id'] ) && ($Paymentlogs['is_paid']==0) ) {
			D('Payment')->logsPaid($pay_id);
			$this->success('审核成功', U('mcenter/logs/gold'));
		} elseif($Paymentlogs['is_paid']==1) {
		   $this->success('此条记录已经审核过', U('mcenter/logs/gold'));	
		} else {
		   $this->error('您没有权限操作！');die;	
		}
	}
	
	public function gold() {   //排单返现
        $Usergoldlogs = D('Usergoldlogs');
        import('ORG.Util.Page'); // 导入分页类
		$my_shop_id = D('Shop') -> where(array('user_id' => $this->uid,'closed' => 0,'audit' => 1)) -> getField('shop_id');
        if ( (int)$my_shop_id > 0 ) {
		   $map['shop_id']  = array('eq',$my_shop_id);
		} else {
		   $map = array('user_id' => $this->uid);
		   $map['shop_id']  = array('gt',0);
		} 
		//$map = array('shop_id' => $this->uid);
        $count = $Usergoldlogs->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 20); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Usergoldlogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
		
		$this->assign('my_shop_id', $my_shop_id); 
		
        $this->display();
    }
	
	public function mymoneylogs_a() {   //奖池明细
        $Usermoneylogs = D('Usermoneylogs');
        import('ORG.Util.Page'); // 导入分页类
        //$map = array('user_id' => $this->uid);
		
		$Shop = D('Shop') -> where(array('user_id' => $this->uid,'closed' => 0,'audit' => 1)) -> find();
		if ( (int)$Shop['shop_id'] > 0 ) {
			$map['shop_id']  = array('eq',$Shop['shop_id']);
		}
		$map['intro'] = array('like','%我的返现%');
		//$map = array('shop_id' => $this->uid);
        $count = $Usermoneylogs->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Usermoneylogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
		
		foreach ($list as $k => $val) {
			//$myPaymentLogs = D('Paymentlogs') -> where(array('log_id' => $val['pay_id'])) -> find();
			$myusers = D('Users') -> where(array('user_id' => $var['user_id'])) -> find();
			$myintro = ' 会员ID:'. $var['user_id'] .' 昵称：'.$myusers['nickname'].' 姓名：'.$myusers['truename'].' 手机：'.$myusers['mobile']; 
			$val_intro = $pieces = explode("），", $val['intro']);
            $list[$k]['intro'] = $val_intro[1].' '.$myintro; 
        }
		
		
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }
	
	public function mymoneylogs_b() {   //门店奖励明细
        $Usermoneylogs = D('Usermoneylogs');
        import('ORG.Util.Page'); // 导入分页类
        //$map = array('user_id' => $this->uid);
		$Shop = D('Shop') -> where(array('user_id' => $this->uid,'closed' => 0,'audit' => 1)) -> find();
		if ( (int)$Shop['shop_id'] > 0 ) {
			$map['shop_id']  = array('eq',$Shop['shop_id']);
		}
		$map['intro'] = array('like','%门店返现%');
		//$map = array('shop_id' => $this->uid);
        $count = $Usermoneylogs->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Usermoneylogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
		
		
		foreach ($list as $k => $val) {
			
			//$myPaymentLogs = D('Paymentlogs') -> where(array('log_id' => $val['pay_id'])) -> find();
			$myusers = D('Users') -> where(array('user_id' => $var['user_id'])) -> find();
			$myintro = '支付ID:'. $val['pay_id'] .' 会员ID:'. $var['user_id'] .' 昵称：'.$myusers['nickname'].' 姓名：'.$myusers['truename'].' 手机：'.$myusers['mobile']; 
            $list[$k]['intro'] = $myintro; 
        }
		
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }


    
    public function cashlogs() {  //提现日志
        $Userscash = D('Userscash');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('user_id'=>$this->uid,'type'=>user);
        $count = $Userscash->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Userscash->where($map)->order(array('cash_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }
    
    
    public function integral() { //积分日志
        $Userintegrallogs = D('Userintegrallogs');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('user_id' => $this->uid);
        $count = $Userintegrallogs->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Userintegrallogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display(); // 输出模板
    }
	
	
	public function rechargecard() { //代金券使用列表
        $Rechargecard = D('Rechargecard');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('user_id' => $this->uid, 'is_used' => 1);
        $count = $Rechargecard->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Rechargecard->where($map)->order(array('card_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display(); // 输出模板
    }
	
	
    
}