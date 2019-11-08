<?php
 
  
class MoneyAction extends CommonAction
{
    public function index()
    {
		
		header("Location:".U('mobile/shop/index'));
        die;
		
        //余额充值
        $this->assign('payment', D('Payment')->getPayments(true));
        $this->display();
    }
    public function myindex()
    {
		$shop_id =  I('get.shop_id');
        if ($shop_id) {
			$wx_back_url = 'http://www.blklube.com/mcenter/money/myindex/shop_id/'.$shop_id.'.html';
			cookie('wx_back_url', $wx_back_url);
			cookie('back_url', $wx_back_url);
		}
		
		 else {
		    header("Location:".U('/user/member/index'));
            die;
		
		}
		
		
		$users = D('users')->find($this->uid);
						
		
        //排单返现
		$this->assign('users',$users);
		$this->assign('shop_id',$shop_id);
        $this->assign('payment', D('Payment')->getPayments(true));
        $this->display();
    }
	//提交购物处理
	public function mymoneypay()
    {
        //后期优化
        $money = (int) ($this->_post('money') * 100);//  *100???????????????????????????
        $code = $this->_post('code', 'htmlspecialchars');
		$shop_id = $this->_post('shop_id', 'htmlspecialchars');
		$youname = $this->_post('youname', 'htmlspecialchars');
		$youmobile = $this->_post('youmobile', 'htmlspecialchars');
        if ($money <= 0) {
            $this->error('请填写正确的金额！');
        }
		$mymap = array('user_id' => $this->uid);
		$count = D('Shop')->where($mymap)->count(); // 查询满足要求的总记录数
		if ($count >= 1) {
			$this->error('店主不能参与活动！店主的个人返现不能提现！');	
		}
		
        $payment = D('Payment')->checkPayment($code);
        if (empty($payment)) {
            $this->error('该支付方式不存在');
        }
		if (strlen($youname)<2) {
            $this->error('请填写姓名！');
        }
		if (strlen($youmobile)<10) {
            $this->error('请填写手机号码！');
        }
		if (!isMobile($youmobile)) {
		   $this->error('手机格式不正确');
        }
		
        $logs = array('user_id' => $this->uid, 'type' => 'money', 'code' => $code, 'order_id' => 0, 'need_pay' => $money, 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(), 'shop_id' => $shop_id, 'youname' => $youname, 'youmobile' => $youmobile);
        $logs['log_id'] = D('Paymentlogs')->add($logs);
		
        $this->assign('button', D('Payment')->getCode($logs));
        $this->assign('money', $money);
		$this->assign('shop_id', $shop_id);
        $this->assign('logs', $logs);
        /*判断是否免单  qiu   2019 01 15*/
        $fanxuliehua=D('setting')->where(array('k'=>'noSingle'))->find();
        $fanxulieh=unserialize($fanxuliehua);
        //判断金额是否在可免单范围内
        if($money>=$fanxulieh['min_noSingle_single'] && $money<=$fanxulieh['max_noSingle_single'] ){
            $suijishu=rand(1,100);
            $gail=100-$fanxulieh['prob_noSingle_single']+1;
            if($suijishu>=$gail){
                  $this->fengmiMsg('恭喜您本单获得随机免单奖励！', U('money/recharge'));
            }
        }
        /*判断是否免单  qiu   2019 01 15    end*/
        $this->display();
    }
	
	
    public function moneypay0()
    {
        //后期优化
        $money = (int) ($this->_post('money') * 100);
        $code = $this->_post('code', 'htmlspecialchars');
        if ($money <= 0) {
            $this->error('请填写正确的充值金额！');
        }
        if ($money > 1000000) {
            $this->error('每次充值金额不能大于1万');
        }
        $payment = D('Payment')->checkPayment($code);
        if (empty($payment)) {
            $this->error('该支付方式不存在');
        }
        $logs = array('user_id' => $this->uid, 'type' => 'money', 'code' => $code, 'order_id' => 0, 'need_pay' => $money, 'create_time' => NOW_TIME, 'create_ip' => get_client_ip());
        $logs['log_id'] = D('Paymentlogs')->add($logs);
        $this->assign('button', D('Payment')->getCode($logs));
        $this->assign('money', $money);
        $this->assign('logs', $logs);
        $this->display();
    }
	
	
	
	
    public function recharge()
    {
        //代金券充值
        if ($this->isPost()) {
            $card_key = $this->_post('card_key', htmlspecialchars);
            if (!D('Lock')->lock($this->uid)) {
                //上锁
                $this->fengmiMsg('服务器繁忙，1分钟后再试');
            }
            if (empty($card_key)) {
                D('Lock')->unlock();
                $this->fengmiMsg('充值卡号不能为空');
            }
            if (!($detail = D('Rechargecard')->where(array('card_key' => $card_key))->find())) {
                D('Lock')->unlock();
                $this->fengmiMsg('该充值卡不存在');
            }
            if ($detail['is_used'] == 1) {
                D('Lock')->unlock();
                $this->fengmiMsg('该充值卡已经使用过了');
            }
            $member = D('Users')->find($this->uid);
            $member['money'] += $detail['value'];
            if (D('Users')->save(array('user_id' => $this->uid, 'money' => $member['money']))) {
			    $rank_id = D('Users')->where('user_id='.$this->uid)->getField('rank_id');
		        $rankname = D('Userrank')->where('rank_id='.$rank_id)->getField('rank_name');
                D('Usermoneylogs')->add(array('user_id' => $this->uid, 'money' => +$detail['value'], 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(), 'intro' => '代金券充值' . $detail['card_id'], 'rankname' => $rankname ));
                $res = D('Rechargecard')->save(array('card_id' => $detail['card_id'], 'is_used' => 1));
                if (!empty($res)) {
                    D('Rechargecard')->save(array('card_id' => $detail['card_id'], 'user_id' => $this->uid, 'used_time' => NOW_TIME));
                }
                $this->fengmiMsg('充值成功！', U('money/recharge'));
            }
            D('Lock')->unlock();
        } else {
            $this->display();
        }
    }
}