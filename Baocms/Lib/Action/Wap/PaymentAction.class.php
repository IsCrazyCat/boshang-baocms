<?php

class PaymentAction extends CommonAction {

	protected function ele_success($message, $detail) {
		$order_id = $detail['order_id'];
		$eleorder = D('Eleorder') -> find($order_id);
		$detail['single_time'] = $eleorder['create_time'];
		$detail['settlement_price'] = $eleorder['settlement_price'];
		$detail['new_money'] = $eleorder['new_money'];
		$detail['fan_money'] = $eleorder['fan_money'];
		$addr_id = $eleorder['addr_id'];
		$product_ids = array();
		$ele_goods = D('Eleorderproduct') -> where(array('order_id' => $order_id)) -> select();
		foreach ($ele_goods as $k => $val) {
			if (!empty($val['product_id'])) {
				$product_ids[$val['product_id']] = $val['product_id'];
			}
		}
		$addr = D('Useraddr') -> find($addr_id);
		$this -> assign('addr', $addr);
		$this -> assign('ele_goods', $ele_goods);
		$this -> assign('products', D('Eleproduct') -> itemsByIds($product_ids));
		$this -> assign('message', $message);
		$this -> assign('detail', $detail);
		$this -> assign('paytype', D('Payment') -> getPayments());
		$this -> display('ele');
	}

	protected function goods_success($message, $detail) {
		$order_ids = array();
		if (!empty($detail['order_id'])) {
			$order_ids[] = $detail['order_id'];
		} else {
			$order_ids = explode(',', $detail['order_ids']);
		}
		$goods = $good_ids = $addrs = array();
		foreach ($order_ids as $k => $val) {
			if (!empty($val)) {
				$order = D('Order') -> find($val);
				$addr = D('Useraddr') -> find($order['addr_id']);
				$ordergoods = D('Ordergoods') -> where(array('order_id' => $val)) -> select();
				foreach ($ordergoods as $a => $v) {
					$good_ids[$v['goods_id']] = $v['goods_id'];
				}
			}
			$goods[$k] = $ordergoods;
			$addrs[$k] = $addr;
		}
		$this -> assign('addr', $addrs[0]);
		$this -> assign('goods', $goods);
		$this -> assign('good', D('Goods') -> itemsByIds($good_ids));
		$this -> assign('detail', $detail);
		$this -> assign('message', $message);
		$this -> assign('paytype', D('Payment') -> getPayments());
		$this -> display('goods');
	}

	public function booking($order_id) {
		$Bookingorder = D('Bookingorder');
		$Bookingyuyue = D('Bookingyuyue');
		$Bookingmenu = D('Bookingmenu');
		if (!$order = $Bookingorder -> where('order_id = ' . $order_id) -> find()) {
			$this -> baoError('该订单不存在');
		} else if (!$yuyue = $Bookingyuyue  -> where('ding_id = ' . $order['ding_id']) -> find()) {
			$this -> baoError('该订单不存在');
		} else if ($yuyue['user_id'] != $this -> uid) {
			$this -> error('非法操作');
		} else {
			$arr = $Bookingorder -> get_detail($this -> shop_id, $order, $yuyue);
			$menu = $Bookingmenu -> shop_menu($this -> shop_id);
			$this -> assign('yuyue', $yuyue);
			$this -> assign('order', $order);
			$this -> assign('order_id', $order_id);
			$this -> assign('arr', $arr);
			$this -> assign('menu', $menu);
			$this -> display();
		}
	}

	protected function booking_success($message, $detail) {
		$Bookingorder = D('Bookingorder');
		$Bookingyuyue = D('Bookingyuyue');
		$Bookingmenu = D('Bookingmenu');

		if (!$order = $Bookingorder -> where('order_id = ' . $detail['order_id']) -> find()) {
			$this -> error('该订单不存在');
		} else if (!$yuyue = $Bookingyuyue -> where('ding_id = ' . $order['ding_id']) -> find()) {
			$this -> error('该订单不存在');
		} else if ($yuyue['user_id'] != $this -> shop_id) {
			$this -> error('非法操作');
		} else {
			$arr = $Bookingorder -> get_detail($yuyue['shop_id'], $order, $yuyue);
			$menu = $Bookingmenu -> shop_menu($yuyue['shop_id']);
			$this -> assign('yuyue', $yuyue);
			$this -> assign('order', $order);
			$this -> assign('order_id', $detail['order_id']);
			$this -> assign('arr', $arr);
			$this -> assign('menu', $menu);
			$this -> assign('message', $message);
			$this -> assign('paytype', D('Payment') -> getPayments());
			$this -> display('ding');
		}
	}

	protected function other_success($message, $detail) {
		$tuanorder = D('Tuanorder') -> find($detail['order_id']);
		if (!empty($tuanorder['branch_id'])) {
			$branch = D('Shopbranch') -> find($tuanorder['branch_id']);
			$addr = $branch['addr'];
		} else {
			$shop = D('Shop') -> find($tuanorder['shop_id']);
			$addr = $shop['addr'];
		}

		$this -> assign('addr', $addr);
		$tuans = D('Tuan') -> find($tuanorder['tuan_id']);
		$this -> assign('tuans', $tuans);
		$this -> assign('tuanorder', $tuanorder);
		$this -> assign('message', $message);
		$this -> assign('detail', $detail);
		$this -> assign('paytype', D('Payment') -> getPayments());
		$this -> display('other');
	}
	
	
	protected function gwmd_success($message, $detail) {
		$tuanorder = D('Tuanorder') -> find($detail['order_id']);
		if (!empty($tuanorder['branch_id'])) {
			$branch = D('Shopbranch') -> find($tuanorder['branch_id']);
			$addr = $branch['addr'];
		} else {
			$shop = D('Shop') -> find($tuanorder['shop_id']);
			$addr = $shop['addr'];
		}

		$this -> assign('addr', $addr);
		$tuans = D('Tuan') -> find($tuanorder['tuan_id']);
		$this -> assign('tuans', $tuans);
		$this -> assign('tuanorder', $tuanorder);
		$this -> assign('message', $message);
		$this -> assign('detail', $detail);
		$this -> assign('paytype', D('Payment') ->getPayments());
		$this -> display('gwmd');
	}
	
	//家政支付成功
	 protected function appoint_success($message, $detail){
        $order_id = (int) $detail['order_id'];
        $order = D('Appointorder')->find($order_id);
        $Appoint = D('Appoint')->find($order['appoint_id']);//获取众筹商品
        $this->assign('order', $order);
        $this->assign('appoint', $Appoint);
        $this->assign('detail', $detail);
        $this->assign('message', $message);
        $this->assign('paytype', D('Payment')->getPayments());
        $this->display('appoint');
    }
	
	//跑腿支付成功
	 protected function running_success($message, $detail){
        $running_id = (int) $detail['order_id'];
        $running = D('Running')->find($running_id);
        $this->assign('running', $running);
        $this->assign('message', $message);
        $this->assign('paytype', D('Payment')->getPayments());
        $this->display('running');
    }

     //云购支付成功
	 protected function cloud_success($message, $detail){
        $log_id = (int) $detail['order_id'];
        $cloudlogs = D('Cloudlogs')->find($log_id);
        $cloudgoods = D('Cloudgoods')->find($cloudlogs['goods_id']);//获取商品
        $this->assign('cloudlogs', $cloudlogs);
        $this->assign('cloudgoods', $cloudgoods);
        $this->assign('detail', $detail);
        $this->assign('message', $message);
        $this->assign('paytype', D('Payment')->getPayments());
        $this->display('cloud');
    }
	protected function pintuan_success($message, $detail) {
		$tuan = D('Porder') -> find($detail['order_id']);
		//var_dump($detail);die;
		if ($tuan['tstatus'] == 0) {
			D('Porder') -> where(array('id' => $detail['order_id'])) -> save(array('order_status' => 3));
			header("Location:" . U('user/pintuan/groups'));
		} elseif ($tuan['tstatus'] == 1 || $tuan['tstatus'] == 2) {
			$Ptuanteam = D('Ptuanteam') -> where(array('tuan_id' => $tuan['tuan_id'], 'tuan_status' => 2)) -> select();
			$tuanrenCount = count($Ptuanteam);
			if ($tuan['renshu'] <= $tuanrenCount) {
				D('Ptuan') -> save(array('id' => $tuan['tuan_id'], 'tuan_status' => 3, 'success_time' => time()));
				foreach ($Ptuanteam as $key => $val) {
					$uid = $val['user_id'];
					D('Porder') -> where(array('id' => $val['order_id'], 'order_status' => 2)) -> save(array('tuan_status' => 3, 'order_status' => 3));
					//====================拼团成功通知===========================
					include_once "Baocms/Lib/Net/Wxmesg.class.php";
					$_data_ctsuccess = array(//整体变更
					'url' => "http://" . $_SERVER['HTTP_HOST'] . "/wap/pintuan/tuan/id/" . $tuan['tuan_id'] . ".html", 'topcolor' => '#F55555', 'first' => '您参团的商品［' . $tuan['goods_name'] . '］已组团成功，即将发货，请注意查收！', 'payprice' => round($detail['need_pay'] / 100, 2) . '元', 'orderno' => $detail['log_id'], 'remark' => '点击查看订单详情', );
					$ctsuccess_data = Wxmesg::ctsuccess($_data_ctsuccess);
					$return = Wxmesg::net($uid, 'OPENTM401153728', $ctsuccess_data);
					//结束
					//====================拼团成功通知===============================
				}

			}
			header("Location:" . U('pintuan/tuan', array('id' => $tuan['tuan_id'])));
		}
	}

	public function respond() {
		$code = $this -> _get('code');
		if (empty($code)) {
			$this -> error('没有该支付方式！');
			die ;
		}
		$ret = D('Payment') -> respond($code);
		if ($ret == false) {
			$this -> error('支付验证失败！');
			die ;
		}
		if ($this -> isPost()) {
			echo 'SUCESS';
			die ;
		}
		$type = D('Payment') -> getType();
		$log_id = D('Payment') -> getLogId();
		$detail = D('Paymentlogs') -> find($log_id);
		if (!empty($detail)) {
			if ($detail['type'] == 'ele') {

				$this -> ele_success('恭喜您支付成功啦！', $detail);

			} elseif ($detail['type'] == 'booking') {
				$this -> booking_success('恭喜您支付成功啦！', $detail);
			} elseif ($detail['type'] == 'goods') {
				if (empty($detail['order_id'])) {
					$this -> success('合并付款成功', U('user/goods/index'));
				} else {
					$this -> goods_success('恭喜您支付成功啦！', $detail);
				}

			} elseif ($detail['type'] == 'gold' || $detail['type'] == 'money'|| $detail['type'] == 'fzmoney'|| $detail['type'] == 'breaks') {
				$this -> success('恭喜您充值成功', U('user/member/index'));
			} elseif ($detail['type'] == 'pintuan') {
				$this -> pintuan_success('恭喜您支付成功啦！', $detail);
			}elseif ($detail['type'] == 'appoint') {//家政
				$this -> appoint_success('恭喜您家政支付成功啦！', $detail);
			} elseif ($detail['type'] == 'running') {
				$this -> running_success('恭喜您跑腿支付成功啦！', $detail);
			}elseif ($detail['cloud'] == 'cloud') {
				$this->cloud_success('恭喜您云购支付成功啦！', $detail);
			} elseif ($detail['cloud'] == 'gwmd') {
				$this->gwmd_success('恭喜您到店扫码支付成功啦！', $detail);
			} else {
				$this -> other_success('恭喜您支付成功啦！', $detail);
			}
		} else {
			$this -> success('支付成功！', U('user/member/index'));
		}

	}

	public function respondapp() {
		$logs_id = I('Logs_id', '', 'intval,trim');
		$ok = I('Ok', '', 'intval,trim');
		if ($ok == 1) {
			D('Payment') -> logsPaid($logs_id);
			$order = D('Paymentlogs') -> where(array('log_id' => $logs_id)) -> find();
			switch ($order['type']) {
				case 'goods' :
					$outArr = array('tstatus' => 200, );
							echo json_encode($outArr);
							exit ;
					break;
					case 'money' :
					$outArr = array('tstatus' => 200, );
							echo json_encode($outArr);
							exit ;
					break;
				case 'pintuan' :
					$Porder = D('Porder') -> where(array('id' => $order['order_id'])) -> find();
					$tstatus = $Porder['tstatus'];
					$tuan_id = $Porder['tuan_id'];
					if (!empty($Porder)) {
						if ($tstatus == 0) {
							D('Porder') -> where(array('id' => $order['order_id'])) -> save(array('order_status' => 3));
							$outArr = array('tstatus' => 200, );
							echo json_encode($outArr);
							exit ;
						} else if ($tstatus == 1 || $tstatus == 2) {
							$Ptuanteam = D('Ptuanteam') -> where(array('tuan_id' => $tuan_id, 'tuan_status' => 2)) -> select();
							$tuanrenCount = count($Ptuanteam);
							if ($Porder['renshu'] <= $tuanrenCount) {
								D('Ptuan') -> save(array('id' => $tuan_id, 'tuan_status' => 3, 'success_time' => time()));
								foreach ($Ptuanteam as $key => $val) {
									$uid = $val['user_id'];
									D('Porder') -> where(array('id' => $val['order_id'], 'order_status' => 2)) -> save(array('tuan_status' => 3, 'order_status' => 3));
									//====================拼团成功通知===========================
									include_once "Baocms/Lib/Net/Wxmesg.class.php";
									$_data_ctsuccess = array(//整体变更
									'url' => "http://" . $_SERVER['HTTP_HOST'] . "/wap/pintuan/tuan/id/" . $tuan_id . ".html", 'topcolor' => '#F55555', 'first' => '您参团的商品［' . $Porder['goods_name'] . '］已组团成功，即将发货，请注意查收！', 'payprice' => round($order['need_pay'] / 100, 2) . '元', 'orderno' => $order['log_id'], 'remark' => '点击查看订单详情', );
									$ctsuccess_data = Wxmesg::ctsuccess($_data_ctsuccess);
									$return = Wxmesg::net($uid, 'OPENTM401153728', $ctsuccess_data);
									//结束
									//====================拼团成功通知===============================
								}
							}
							$outArr = array('tstatus' => 300, 'tuan_id' => $tuan_id, );
							echo json_encode($outArr);
							exit ;
						}
					}
					break;
			}
		} else {
			$outArr = array('status' => 11111);
			echo json_encode($outArr);
			exit ;
		}
	}

	public function yes($log_id) {
		$log_id = (int)$log_id;
		$logs = D('Paymentlogs') -> find($log_id);
		
		
		$info = D('Paymentlogs')->where(" is_paid = 1  and type = 'gwmd' ")->order('log_id desc')->find();
		
		if ( ( $logs['type'] == 'gwmd' ) && ( $logs['ismiandan'] == 0 ) && ( $logs['log_id'] == $info['log_id'] ) ) {
			
				
			    //判断金额是否在可免单范围内
				$config = D('Setting')->fetchAll();
				//$fanxuliehua = D('setting')->where(array('k'=>'noSingle'))->find();
				//$fanxulieh=unserialize($fanxuliehua);
				$is_noSingle_single = $config['noSingle']['is_noSingle_single'];
				$min_noSingle_single = round($config['noSingle']['min_noSingle_single'],2);
				$max_noSingle_single = round($config['noSingle']['max_noSingle_single'],2);
				$prob_noSingle_single = round($config['noSingle']['prob_noSingle_single'],2);
				$mymoney = round($money/100,2);
				
				
				
				if ( ($is_noSingle_single) && ( (int)$logs['create_time'] >= (int)NOW_TIME - 30  ) ) { 
				  
						if ( ( $mymoney >= $min_noSingle_single) && ( $mymoney <= $max_noSingle_single ) ) {
								$suijishu=rand(1,100);
								$gail= 100 - $prob_noSingle_single;
						 
							if((int)$suijishu>=(int)$gail){
									
									$wheres['log_id'] = array('neq', $log_id);
									$wheres['user_id'] = array('eq', $this->uid);
									$wheres['type'] = array('eq', 'gwmd');
					                $loglog = D('Paymentlogs')->where($wheres)->order('create_time desc')->find();
						            if ( (int)$loglog['create_time'] + 30 >= NOW_TIME  ) {
							            $this ->error('请不要频繁刷新！'); 
							            //$this->fengmiMsg('请不要频繁刷新！', U('/wap/index/index'));
										$mylogs['log_id'] = $log_id;
							            $mylogs['create_time'] = NOW_TIME  ;
							            D('Paymentlogs')->save($mylogs);
						            }
                                    
									$ip = get_client_ip();
									
	                                $addtime = strtotime(date("Y-m-d",NOW_TIME)) ;
									
									
			                        $record = D('Record') ->where(array('addtime' => $addtime))->find();
									
									   	
                                   
										
										$my_need_pay = (int)$record['fjzhong'] + (int)$logs['need_pay'] ; 
										
										
										
										if ( (int)$record['jiangchi'] >= (int)$my_need_pay  ) {
										
										
			                             //$this -> error('oka'.$my_need_pay);
											D('Record')->save(array( 'fjsl' => $record['fjsl'] + 1, 'fjzhong'=> $my_need_pay ),array( 'where' => array('addtime'=>$addtime) ));
										
											D('Paymentlogs')->save( array( 'ismiandan' => 1 , 'mdid' => $record['id'] ),array('where'=>array('log_id'=>$log_id)));
											if (!($detail = D('Users')->find($logs['user_id']))) {
												D('Users')->save(array('user_id' => $logs['user_id'], 'money' => $logs['need_pay'] + $detail['money']));
												
												$rank_id = D('Users')->where('user_id='.$logs['user_id'])->getField('rank_id');
		                                        $rankname = D('Userrank')->where('rank_id='.$rank_id)->getField('rank_name');
												D('Usermoneylogs')->add(array('user_id' => $logs['user_id'], 'money' => $logs['need_pay'], 'intro' => "随机免单获得", 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(),'$rankname' =>$rankname));
											}
											
										
											
									//D('Paymentlogs')->save(array('ismiandan'=>1,'pay_time'=>NOW_TIME,'is_paid'=>1,'pay_ip' => $ip),array('where'=>array('log_id'=>$log_id)));
						// echo "<script>alert('AAA".$logs['log_id']."BBB')</ script>";
						 //die(0);
								//$this->fengmiMsg($logs['log_id'], '/my/zhongjiang.htm');	
									
									
									cookie('my_log_id', $log_id);
									session('my_log_id', $log_id);
									$my_uid = $this -> uid;
									 cookie('my_uid', $my_uid);
									 session('my_uid', $my_uid);
									 //$this -> gwmd_success('恭喜您 获得随机免单!', "http://aihuaqian.boshang3710.com/my/zhongjiang.php?log_id=".$log_id );
									
									 $this -> success('恭喜您获得随机免单!请稍等...', '/my/zhongjiang.php?log_id='.$log_id);
									  header('Location:/my/zhongjiang.php?log_id='.$log_id);
									 break;
									 //include("/my/zhongjiang.php?log_id=".$log_id);
									 die;
									 exit;
											
											
										
										}  
										
									
													
							} 
						}
				} 
			
			
			
		} 
		
		switch ($logs['type']) {
			case 'ele' :
				$this -> ele_success('恭喜您支付成功啦！', $logs);
				break;
			case 'goods' :
				if (empty($logs['order_id'])) {
					$this -> success('合并付款成功', U('user/goods/index'));
				} else {
					$this -> goods_success('恭喜您支付成功啦！', $logs);
				}
				break;
			case 'booking' :
				$this -> booking_success('恭喜您支付成功啦！', $logs);
				break;
			case 'appoint' :
				$this -> appoint_success('恭喜您家政支付成功啦！', $logs);//家政
				break;
			case 'running' :
				$this -> running_success('恭喜您跑腿支付成功啦！', $logs);//
				break;
			case 'cloud' :
				$this -> cloud_success('恭喜您云购支付成功啦！', $logs);//
				break;
			case 'tuan' :
				$this -> other_success('恭喜您支付成功啦！', $logs);
				break;
			case 'pintuan' :
				$this -> pintuan_success('恭喜您支付成功啦！', $logs);
				break;
			case 'gwmd' :
			
				$this -> gwmd_success('恭喜您到店扫码支付成功啦！', $logs);
				break;	
					
			default :
			 
			    
			 
			 $this -> success('恭喜您支付成功', U('user/member/index'));
				break;
			 
				
		}
	}

	public function payment($log_id) {
		if (empty($this -> uid)) {
			header("Location:" . U('passport/login'));
			die ;
		}
		$log_id = (int)$log_id;

		$logs = D('Paymentlogs') -> find($log_id);
		if (empty($logs) || $logs['user_id'] != $this -> uid || $logs['is_paid'] == 1) {
			$this -> error('没有有效的支付记录！');
			die ;
		}
		$this -> assign('button', D('Payment') -> getCode($logs));
		$this -> assign('types', D('Payment') -> getTypes());
		$this -> assign('logs', $logs);
		$this -> assign('paytype', D('Payment') -> getPayments());
		$check_pay_password = D('Users')->check_pay_password($this->uid);
		$this->assign('user_pay_password',$check_pay_password);
		
		
		
		
		$this -> display();
	}
	
	 //检测支付密码
	 public function check_pay_password() {
		$user_id = I('user_id', 0, 'trim,intval');
		$pay_password = I('pay_password', 0, 'trim');
        $Users = D('Users')->find($user_id);
		if (empty($pay_password)){
           $this->ajaxReturn(array('status' => 'error', 'msg' => '支付密码不能为空'));
        }
		if ($Users['pay_password'] != md5(md5($pay_password)) ) {
           $this->ajaxReturn(array('status' => 'error', 'msg' => '支付密码错误'));
        }else{
           session('session_pay_password', $session_pay_password = rand_string(32, 1));
		   $this->ajaxReturn(array('status' => 'success', 'msg' => '密码正确，点击支付按钮支付'));
		}
    }
	
	//设置支付密码
	 public function set_pay_password() {
		$user_id = I('user_id', 0, 'trim,intval');
		$pay_password = I('pay_password', 0, 'trim');
        $Users = D('Users')->find($user_id);
		if (empty($pay_password)){
           $this->ajaxReturn(array('status' => 'error', 'msg' => '支付密码不能为空'));
        }
		if (strlen($pay_password) < 6 || strlen($pay_password) >= 20){
           $this->ajaxReturn(array('status' => 'error', 'msg' => '支付密码大于等于6位，或者大于20位数，请重新设置'));
        }

		if (D('Passport')->set_pay_password($Users['account'], $pay_password)) {
			 $this->ajaxReturn(array('status' => 'success', 'msg' => '成功'));
		}else{
			 $this->ajaxReturn(array('status' => 'error', 'msg' => '操作失败，请重试'));
		}
    }

}
