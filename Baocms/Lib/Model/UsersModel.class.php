<?php
class UsersModel extends CommonModel{
    protected $pk = 'user_id';
    protected $tableName = 'users';
    protected $_integral_type = array(
		'login' => '每日登陆', 
		'dianping_shop' => '商家点评', 
		'thread' => '评论帖子', 
		'mobile' => '手机认证', 
		'email' => '邮件认证'
	);
	
	public function getError() {
        return $this->error;
    }
	
	//推广员功能
    public function checkInvite($uid, $money){
        $uid = (int) $uid;
        $money = (int) $money;
        if ($money <= 0) {
            return false;
        }
        $user = $this->find($uid);
        $invite_t = NOW_TIME - 30 * 86400;
        if (!empty($user['invite_id'])) {
            if ($invite_t < $user['reg_time']) {
                $user2 = $this->find($user['invite_id']);
                $ranks = D('Userrank')->fetchAll();
                $integral = (int) ($money * $ranks[$user2['rank_id']]['rebate'] / 100);
                if ($money <= 0) {
                    return false;
                }
                return array('uid' => $user2['user_id'], 'integral' => $integral);
            }
        }
        return false;
    }
	
	//判断是不是商家
    public function get_is_shop($user_id){
        $Shop = D('Shop')->where(array('user_id'=>$user_id))->find();
        if (empty($Shop)) {
            return false;
        }else{
			return true;	
		}
    }
	//判断是不是配送员
    public function get_is_delivery($user_id){
        $Deliver = D('Delivery')->where(array('user_id'=>$user_id))->find();
        if (empty($Deliver)) {
            return false;
        }else{
			return true;	
		}
    }
    public function getUserByAccount($account){
        $data = $this->find(array('where' => array('account' => $account)));
        return $this->_format($data);
    }
    public function getUserByMobile($mobile){
        $data = $this->find(array('where' => array('mobile' => $mobile)));
        return $this->_format($data);
    }
    //邮件登录暂时不处理
    public function getUserByEmail($email){
        $data = $this->find(array('where' => array('email' => $email)));
        return $this->_format($data);
    }
    public function getUserByUcId($uc_id){
        $data = $this->find(array('where' => array('uc_id' => (int) $uc_id)));
        return $this->_format($data);
    }
    //声望不记录日志了
    public function prestige($user_id, $mdl){
        static $CONFIG;
        if (empty($CONFIG)) {
            $CONFIG = D('Setting')->fetchAll();
        }
        $user = $this->find($user_id);
        if (!empty($user) && $CONFIG['prestige'][$mdl]) {
            $data = array('user_id' => $user_id, 'prestige' => $user['prestige'] + $CONFIG['prestige'][$mdl]);
            $userrank = D('Userrank')->fetchAll();
            foreach ($userrank as $val) {
                if ($val['prestige'] <= $data['prestige']) {
                    $data['rank_id'] = $val['rank_id'];
                }
            }
			$this->add_user_prestige($user_id,$CONFIG['prestige'][$mdl], $this->_integral_type[$mdl].'奖励'.$CONFIG['prestige'][$name]);
            return $this->save($data);
        }
        return false;
    }
	
	//实际销售额返利声望【万能接口】
    public function reward_prestige($user_id, $prestige, $intro){
        $user = $this->find($user_id);
        if (!empty($user) && !empty($prestige)) {
            $data = array('user_id' => $user_id, 'prestige' => $user['prestige'] + $prestige);
            $userrank = D('Userrank')->fetchAll();
            foreach ($userrank as $val) {
                if ($val['prestige'] <= $data['prestige']) {
                    $data['rank_id'] = $val['rank_id'];
                }
            }
			
			$this->add_user_prestige($user_id,$prestige, $intro);
            return $this->save($data);
        }
        return false;
    }
	//写入声望日志，暂时不想做啊
	public function add_user_prestige($user_id,$prestige, $intro){
		   if(!empty($user_id) && !empty($prestige)) {
				D('Userprestigelogs')->add(array(
					'user_id' => $user_id, 
					'prestige' => $prestige, 
					'intro' => $intro, 
					'create_time' => NOW_TIME, 
					'create_ip' => get_client_ip()
				));
			    return true;
		  }
        return false;
    }
	
    public function integral($user_id, $mdl){
        static $CONFIG;
        if (empty($CONFIG)) {
            $CONFIG = D('Setting')->fetchAll();
        }
        if (!isset($this->_integral_type[$mdl])) {
            return false;
        }
        if ($CONFIG['integral'][$mdl]) {
            return $this->addIntegral($user_id, $CONFIG['integral'][$mdl], $this->_integral_type[$mdl]);
        }
        return false;
    }
    //购物返积分
    public function gouwu($user_id, $price, $intro){
        static $CONFIG;
        if (empty($CONFIG)) {
            $CONFIG = D('Setting')->fetchAll();
        }
        if (empty($CONFIG['integral']['gouwu'])) {
            return false;
        }
        $price = (int) ($price / 100);
        $integral = (int) ($price * $CONFIG['integral']['gouwu']);
        if ($integral <= 0) {
            return false;
        }
        return $this->addIntegral($user_id, $integral, $intro);
    }
	
	
	 //积分兑换商品返还积分给商家中间层
    public function return_integral($user_id, $jifen, $intro){
        static $CONFIG;
        if (empty($CONFIG)) {
            $CONFIG = D('Setting')->fetchAll();
        }
        if (empty($CONFIG['integral']['return_integral'])) {
            return false;
        }
        $integral = intval(($jifen * $CONFIG['integral']['return_integral'])/100);
        if ($integral <= 0) {
            return false;
        }
        return $this->addIntegral($user_id, $integral, $intro);
    }
	
	
    public function addGold($user_id, $num, $intro = ''){
		$lenxing = 0;
		if(strstr($intro,"申请提现")){
			$lenxing = 4;
		}
		if(strstr($intro,"到店付款")){
			$lenxing = 2;
		}
		if(strstr($intro,"在线购物")){
			$lenxing = 1;
		}
		
        if ($this->updateCount($user_id, 'gold', $num)) {
            return D('Usergoldlogs')->add(array(
				'user_id' => $user_id, 
				'gold' => $num, 
				'intro' => $intro, 
				'create_time' => NOW_TIME, 
				'create_ip' => get_client_ip(),
				'lenxing' => $lenxing
			));
        }
        return false;
    }
	
	
	public function myaddptGold(  $order_id,$shop_id,$pay_id){
		   
			$paymentlogs = D('paymentlogs')->where(array('log_id' => $pay_id, 'is_paid' => 1))->find();
			if ( (int)$paymentlogs['log_id'] > 0 ) {
				$intro = '';
				
				
				if ( $paymentlogs['type'] == 'goods' ) {
					$intro = '商城购物';
				}
				if ( $paymentlogs['type'] == 'gwmd' ) {
					$intro = '到店付款';
				}
				if ( $paymentlogs['code'] == 'weixin' ) {
					$intro = $intro.'(微信支付)';
				} else if ( $paymentlogs['type'] == 'money' ) {
					$intro = $intro.'(余额支付)';
				} 
				
				$shopmoney = D('shopmoney')->where(array('pay_id' => $pay_id,'shop_id' => $shop_id))->find();
				$usermoneylogs_0 = D('usermoneylogs')->where(" pay_id =  '".$pay_id."' and intro LIKE '%消费奖励%' ")->find();
				$usermoneylogs_1 = D('usermoneylogs')->where(" pay_id =  '".$pay_id."' and intro LIKE '%一级分成%' ")->find();
				$usermoneylogs_2 = D('usermoneylogs')->where(" pay_id =  '".$pay_id."' and intro LIKE '%二级分成%' ")->find();
				$usermoneylogs_3 = D('usermoneylogs')->where(" pay_id =  '".$pay_id."' and intro LIKE '%三级分成%' ")->find();
				$usermoneylogs_L = D('usermoneylogs')->where(" pay_id =  '".$pay_id."' and intro LIKE '%[链店补贴]%' ")->find();
				if ($paymentlogs['ismiandan'] == 1 ) {
					$gold = 0 - (int)$paymentlogs['need_pay'];
				} else {
					$gold = (int)$paymentlogs['need_pay'] - (int)$shopmoney['money'] - (int)$usermoneylogs_0['money'] - (int)$usermoneylogs_1['money'] - (int)$usermoneylogs_2['money'] - (int)$usermoneylogs_3['money'] - (int)$usermoneylogs_L['money'] ;
				}
				if ($usermoneylogs_0['create_time']) {
					$create_time = $usermoneylogs_0['create_time'];
				} else {
					$create_time = NOW_TIME;
				}
				
				$result = D('Userptgoldlogs') ->where(array('pay_id' => $pay_id))->count();
				if ( (int)$result == 0 ) {
					return D('Userptgoldlogs')->add(array(
						'user_id' => $paymentlogs['user_id'], //消费者uid
						'gold' => $gold, //平台获得 
						'intro' => $intro, 
						'create_time' => $create_time, 
						'create_ip' => get_client_ip(),
						'order_id' => $order_id,//支付id
						'shop_id' => $shop_id,//商家id
						'xfz_q' => (int)$usermoneylogs_0['money'],//订单id
						'money' => $paymentlogs['need_pay'],
						'tjr_user_id' => $usermoneylogs_L['user_id'],
						'tjr_q' => (int)$usermoneylogs_L['money'],
						'yj_user_id' => $usermoneylogs_1['user_id'],
						'yj_q' => (int)$usermoneylogs_1['money'],
						'ej_user_id' => $usermoneylogs_2['user_id'],
						'ej_q' => (int)$usermoneylogs_2['money'],
						'sj_user_id' => $usermoneylogs_3['user_id'],
						'sj_q' => (int)$usermoneylogs_3['money'],
						'shop_money' => $shopmoney['money'],
						'is_md' => $paymentlogs['ismiandan'],
						'pay_id' => $pay_id
					));
				} else {
					D('Userptgoldlogs')->save(array('user_id' => $paymentlogs['user_id'],'gold' => $gold, 'intro' => $intro, 'create_time' => $create_time, 'create_ip' => get_client_ip(), 'order_id' => $order_id, 'shop_id' => $shop_id, 'xfz_q' => (int)$usermoneylogs_0['money'], 'money' => $paymentlogs['need_pay'], 'tjr_user_id' => $usermoneylogs_L['user_id'], 'tjr_q' => (int)$usermoneylogs_L['money'], 'yj_user_id' => $usermoneylogs_1['user_id'], 'yj_q' => (int)$usermoneylogs_1['money'], 'ej_user_id' => $usermoneylogs_2['user_id'], 'ej_q' => (int)$usermoneylogs_2['money'], 'sj_user_id' => $usermoneylogs_3['user_id'], 'sj_q' => (int)$usermoneylogs_3['money'], 'shop_money' => $shopmoney['money'], 'is_md' => $paymentlogs['ismiandan']), array('where' => array('pay_id' => $pay_id)));
						
				}
			} else {
				return false;	
			}
       
    }
	
	public function myaddGold($user_id, $num, $intro = '',$order_id,$shop_id,$pay_id,$lenxing){
        if ($this->updateCount($user_id, 'gold', $num)) {
            return D('Usergoldlogs')->add(array(
				'user_id' => $user_id, 
				'gold' => $num, 
				'intro' => $intro, 
				'create_time' => NOW_TIME, 
				'create_ip' => get_client_ip(),
				'order_id' => $order_id,
				'shop_id' => $shop_id,
				'pay_id' => $pay_id,
				'lenxing' => $lenxing
			));
        }
        return false;
    }
	
	//写入商户金块
	  public function Money($user_id, $num, $intro = ''){
        if ($this->updateCount($user_id, 'gold', $num)) {
            return D('Usergoldlogs')->add(array(
				'user_id' => $user_id, 
				'gold' => $num, 
				'intro' => $intro, 
				'create_time' => NOW_TIME, 
				'create_ip' => get_client_ip()
			));
        }
        return false;
    }
	//写入用户余额
    public function addMoney($user_id, $num, $intro = ''){
        if ($this->updateCount($user_id, 'money', $num)) {
			$rank_id = D('Users')->where('user_id='.$user_id)->getField('rank_id');
		    $rankname = D('Userrank')->where('rank_id='.$rank_id)->getField('rank_name');
            return D('Usermoneylogs')->add(array('user_id' => $user_id, 'money' => $num, 'intro' => $intro, 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(), 'rankname' => $rankname));
        }
        return false;
    }
	
	//写入用户余额
    public function add_my_Money($user_id, $num, $intro = '',$shop_id=0,$pay_id=0){
        if ($this->updateCount($user_id, 'money', $num)) {
			$rank_id = D('Users')->where('user_id='.$user_id)->getField('rank_id');
		    $rankname = D('Userrank')->where('rank_id='.$rank_id)->getField('rank_name');
            return D('Usermoneylogs')->add(array('user_id' => $user_id, 'money' => $num, 'intro' => $intro, 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(),'shop_id' => $shop_id, 'pay_id' => $pay_id, 'rankname' => $rankname ));
        }
        return false;
    }

	//写入用户 分享补贴 可提现补贴
    public function add_fxbt_ktxbt_money($user_id, $num, $intro = '',$shop_id=0,$pay_id=0){
        if ($this->updateCount($user_id, 'fxbt_ktxbt_money', $num)) {
			$rank_id = D('Users')->where('user_id='.$user_id)->getField('rank_id');
		    $rankname = D('Userrank')->where('rank_id='.$rank_id)->getField('rank_name');
            return D('Usermoneylogs')->add(array('user_id' => $user_id, 'money' => $num, 'intro' => $intro, 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(),'shop_id' => $shop_id, 'pay_id' => $pay_id, 'rankname' => $rankname ));
        }
        return false;
    }

	//写入用户 链店补贴可提现补贴
    public function add_ldbt_ktxbt_money($user_id, $num, $intro = '',$shop_id=0,$pay_id=0){
        if ($this->updateCount($user_id, 'ldbt_ktxbt_money', $num)) {
            return D('Usermoneylogs')->add(array('user_id' => $user_id, 'money' => $num, 'intro' => $intro, 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(), 'shop_id' => $shop_id, 'pay_id' => $pay_id, 'rankname' => $rankname));
        }
        return false;
    }

    
	
    public function addIntegral($user_id, $num, $intro = ''){
        if ($this->updateCount($user_id, 'integral', $num)) {
            return D('Userintegrallogs')->add(array('user_id' => $user_id, 'integral' => $num, 'intro' => $intro, 'create_time' => NOW_TIME, 'create_ip' => get_client_ip()));
        }
	
        return false;
    }
    public function CallDataForMat($items){
        if (empty($items)) {
            return array();
        }
        $obj = D('Userrank');
        $rank_ids = array();
        foreach ($items as $k => $val) {
            $rank_ids[$val['rank_id']] = $val['rank_id'];
        }
        $userranks = $obj->itemsByIds($rank_ids);
        foreach ($items as $k => $val) {
            $val['rank'] = $userranks[$val['rank_id']];
            $items[$k] = $val;
        }
        return $items;
    }
	//检测积分设置合法性
	public function check_integral_buy($integral_buy){
		$config = D('Setting')->fetchAll();
		if($config['integral']['integral_exchange'] !=1){//没开启返回假
			return false;	
		}else{
			if($integral_buy  == 0 || $integral_buy  == 10 || $integral_buy  == 100){
				 return true;
			}else{
				return false;
			}	
		}
         return true;
    }
	//获取积分兑换设置比例
	public function obtain_integral_scale($integral_buy){
		if($integral_buy  == 0){
			$scale = 1;
			return $scale;
		}elseif($integral_buy  == 10){
			$scale = 10;
			return $scale;
		}elseif($integral_buy  == 100){
			$scale = 100;
			return $scale;
		}else{
			return false;
		}
       return false;
    }
	
	//设置冻结商户资金入账
	public function set_frozen_gold($user_id,$gold,$intro){
		   if(!$detail = D('Users')->find($user_id)){
              $this->error = '没有该用户';
			  return false;
           }
		   if($detail['gold'] < $gold){
			   $this->error = '商户冻结金不得大于商户资金余额';
			   return false;
           }
		   if($gold < $detail['frozen_gold']){
			   $this->error = '恢复冻结金不得大于'.($detail['frozen_gold']/100).'元';
			   return false;
           }
           D('Users')->save(array(
			   'user_id'=>$user_id,
			   'gold'=> $detail['gold'] - $gold,
			   'frozen_gold'=> $detail['frozen_gold'] + $gold,
			   'frozen_gold_time'=>NOW_TIME
		   ));
           D('Usergoldlogs')->add(array(
			   'user_id' => $user_id,
			   'gold'=>$gold,
			   'intro' => $intro,
			   'create_time' => NOW_TIME,
			   'create_ip'  => get_client_ip()
		   ));
		 return true;
    }
	
	//设置冻结会员资金入账
	public function set_frozen_money($user_id,$money,$intro){
		   if(!$detail = D('Users')->find($user_id)){
              $this->error = '没有该用户';
			  return false;
           }
		   if($detail['money'] < $money){
			   $this->error = '会员冻结金不得大于商户资金余额';
			   return false;
           }
		   if($gold < $detail['money_gold']){
			   $this->error = '恢复冻结金不得大于'.($detail['money_gold']/100).'元';
			   return false;
           }
           D('Users')->save(array(
			   'user_id'=>$user_id,
			   'money'=> $detail['money'] - $money,
			   'frozen_money'=> $detail['frozen_money'] + $money,
			   'frozen_money_time'=>NOW_TIME
		   ));
		   $rank_id = D('Users')->where('user_id='.$user_id)->getField('rank_id');
		   $rankname = D('Userrank')->where('rank_id='.$rank_id)->getField('rank_name');
           D('Usermoneylogs')->add(array(
			   'user_id' => $user_id,
			   'money'=>$money,
			   'intro' => $intro,
			   'create_time' => NOW_TIME,
			   'create_ip'  => get_client_ip(),
			   'rankname' => $rankname
		   ));
		 return true;
    }
	
	//检测积分兑换余额的合法性
	public function check_integral_exchange_legitimate($exchange,$scale){
		$config = D('Setting')->fetchAll();
		if($scale == 1){
			if ($exchange % 100 != 0) {
				$this->error = '积分必须为100的倍数';
				return false;
			}
		}elseif($scale == 10){
			if ($exchange % 10 != 0) {
				$this->error = '积分必须为10的倍数';
				return false;
			}
		}elseif($scale == 100){
			if ($exchange % 1 != 0) {
				$this->error = '积分必须为1的倍数，不支持小数点';
				return false;
			}
		}else{
			 $this->error = '网站后台配置有错误请注意检查';
			 return false;
		}
		if($exchange <= $config['integral']['integral_exchange_small']){
			$this->error = '输入的积分小于网站设置的最少积分数量'.$config['integral']['integral_exchange_small'];
			return false;
        }
		if($exchange >= $config['integral']['integral_exchange_big']){
			$this->error = '输入的积分太多了，最多输入积分数量：'.$config['integral']['integral_exchange_big'];
			return false;
        }
		return true;
    }
	
    public function addProfit($user_id, $orderType = 0, $orderId, $num, $is_separate, $shop_id=0 , $pay_id=0){
        return D('Userprofitlogs')->add(array(
			'user_id' => $user_id, 
			'money' => $num, 
			'order_id' => $orderId, 
			'order_type' => $orderType, 
			'create_time' => NOW_TIME, 
			'is_separate' => $is_separate,
			'shop_id' => $shop_id,
			'pay_id' => $pay_id
		));
    }
	
	
	public function addldbt($user_id, $orderType = 0, $orderId, $num, $is_separate,$shop_id=0,$pay_id=0){
        return D('Userldbtlogs')->add(array(
			'user_id' => $user_id, 
			'money' => $num, 
			'order_id' => $orderId, 
			'order_type' => $orderType, 
			'create_time' => NOW_TIME, 
			'is_separate' => $is_separate,
			'shop_id' => $shop_id,
			'pay_id' => $pay_id
		));
    }

	
	//充值余额送积分
    public function return_recharge_integral($logs_id,$user_id, $money){
		$CONFIG = D('Setting')->fetchAll();
        if (!empty($CONFIG['cash']['is_recharge_integral'])) {
			$money = intval($money/100);//先除以100这里获取整数
 			$integral = $this->get_return_recharge_integral($money);
			if($integral !=0){
				$intro = '余额充值订单号'.$logs_id.'返还积分';
				$this->addIntegral($user_id, $integral, $intro);
		    }
			return true;
        }else{
			return true;//忽略报错
		}
    }
	
	public function get_return_recharge_integral($money){
		$CONFIG = D('Setting')->fetchAll();
        if ($CONFIG['cash']['return_recharge_integral'] ==1) {
 			$integral = $money * $CONFIG['cash']['return_recharge_integral'];
			return $integral;
        }elseif($CONFIG['cash']['return_recharge_integral'] ==10){
			$integral = $money * $CONFIG['cash']['return_recharge_integral'];
			return $integral;
		}elseif($CONFIG['cash']['return_recharge_integral'] ==100){
			$integral = $money * $CONFIG['cash']['return_recharge_integral'];
			return $integral;
		}else{
			$integral = 0;
			return $integral;//后台填写错误，但是忽略
		}

    }
	
	
	
	//充值多少送多少
    public function Recharge_Full_Gvie_User_Money($user_id, $money){
		$CONFIG = D('Setting')->fetchAll();
        if (!empty($CONFIG['cash']['is_recharge'])) {
			$money = round($money/100,2);//先除以100再去对比
 			$give_money_array = $this->Check_Gvie_User_Money($money);
			if(!empty($give_money_array)){
				extract($give_money_array); 
				$give_money = $give_money;
				$intro = $intro;
				if($give_money > 0){
					return $this->addMoney($user_id, $give_money*100, $intro);
				}	
		    }
        }else{
			return true;//忽略报错
		}
    }
	
    //检测应该送多少钱
    public function Check_Gvie_User_Money($money){
		$CONFIG = D('Setting')->fetchAll();
		if (!empty($CONFIG['cash']['is_recharge']) && !empty($money)) {
			
		//正常模式，后台填写1,2,3，判断都有，就走这里
		if (!empty($CONFIG['cash']['recharge_full_1']) && !empty($CONFIG['cash']['recharge_full_2']) && !empty($CONFIG['cash']['recharge_full_3'])) {
			if(!empty($CONFIG['cash']['recharge_full_1']) && $money >= $CONFIG['cash']['recharge_full_1'] && $money < $CONFIG['cash']['recharge_full_2']){
				if(!empty($CONFIG['cash']['recharge_give_1'])){
					$give_money = $CONFIG['cash']['recharge_give_1'];
					$intro = '您单笔充值'.$money.'返现'.$CONFIG['cash']['recharge_give_1'].'元';
					return array('give_money' => $give_money, 'intro' =>$intro );
				}else{
					return false;
				}
			}elseif(!empty($CONFIG['cash']['recharge_full_2']) && $money >= $CONFIG['cash']['recharge_full_2'] && $money < $CONFIG['cash']['recharge_full_3']){
				if(!empty($CONFIG['cash']['recharge_give_2'])){
					$give_money = $CONFIG['cash']['recharge_give_2'];
					$intro = '您单笔充值'.$money.'返现'.$CONFIG['cash']['recharge_give_2'].'元';
					return array('give_money' => $give_money, 'intro' =>$intro );
				}else{
					return false;
				}
			}elseif(!empty($CONFIG['cash']['recharge_full_3']) && $money >= $CONFIG['cash']['recharge_full_3']){
				if(!empty($CONFIG['cash']['recharge_give_3'])){
					$give_money = $CONFIG['cash']['recharge_give_3'];
					$intro = '您单笔充值'.$money.'返现'.$CONFIG['cash']['recharge_give_3'].'元';
					return array('give_money' => $give_money, 'intro' =>$intro );
				}else{
					return false;
				}
			}
		}
			
		//1，2模式，后台填写1，2，只有1，2，后面的3是空走这里
		if (!empty($CONFIG['cash']['recharge_full_1']) && !empty($CONFIG['cash']['recharge_full_2']) && empty($CONFIG['cash']['recharge_full_3'])) {
			if(!empty($CONFIG['cash']['recharge_full_1']) && $money >= $CONFIG['cash']['recharge_full_1'] && $money < $CONFIG['cash']['recharge_full_2']){
				if(!empty($CONFIG['cash']['recharge_give_1'])){
					$give_money = $CONFIG['cash']['recharge_give_1'];
					$intro = '您单笔充值'.$money.'返现'.$CONFIG['cash']['recharge_give_1'].'元';
					return array('give_money' => $give_money, 'intro' =>$intro );
				}else{
					return false;
				}
			}elseif(!empty($CONFIG['cash']['recharge_full_2']) && $money >= $CONFIG['cash']['recharge_full_2']){
				if(!empty($CONFIG['cash']['recharge_give_2'])){
					$give_money = $CONFIG['cash']['recharge_give_2'];
					$intro = '您单笔充值'.$money.'返现'.$CONFIG['cash']['recharge_give_2'].'元';
					return array('give_money' => $give_money, 'intro' =>$intro );
				}else{
					return false;
				}
			}
		 }
		
		//1模式，后台填写1，只有1，后面的2并3都是空走这里
		if (!empty($CONFIG['cash']['recharge_full_1']) && empty($CONFIG['cash']['recharge_full_2']) && empty($CONFIG['cash']['recharge_full_3'])) {
			if(!empty($CONFIG['cash']['recharge_full_1']) && $money >= $CONFIG['cash']['recharge_full_1']){
				if(!empty($CONFIG['cash']['recharge_give_1'])){
					$give_money = $CONFIG['cash']['recharge_give_1'];
					$intro = '您单笔充值'.$money.'返现'.$CONFIG['cash']['recharge_give_1'].'元';
					return array('give_money' => $give_money, 'intro' =>$intro );
				}else{
					return false;
				}
			}
		 }
			
		}else{
			return false;
		}
		return false;
    }
	
	//检测会员支付密码
	public function check_pay_password($user_id){
			$Users = D('Users')->find($user_id);
			if(!empty($Users['pay_password'])){
				return true;
			}else{
				return false;
			}
        return false;
    }
	
	
	
}