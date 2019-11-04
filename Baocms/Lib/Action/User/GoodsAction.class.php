<?php
class GoodsAction extends CommonAction{
    public function _initialize(){
        parent::_initialize();
        if ($this->_CONFIG['operation']['mall'] == 0) {
            $this->error('此功能已关闭');
            die;
        }
    }
    public function index(){
        $aready = (int) $this->_param('aready');
        $this->assign('aready', $aready);
        $this->display();
        // 输出模板
    }
    public function goodsloaddata(){
        $Order = D('Order');
        import('ORG.Util.Page');
        $map = array('closed' => 0, 'user_id' => $this->uid);
        $aready = (int) $this->_param('aready');
        if ($aready == 1) {
            $map['status'] = 0;
			$map['is_daofu'] = 0;
        }elseif ($aready == 2) {
            $map['status'] = array('IN', array(1,2));
        }elseif ($aready == 3) {
            $map['status'] = array('IN', array(0,1,2));
			$map['is_daofu'] = 1;//货到付款
        }elseif ($aready == 4) {
            $map['status'] = $aready;
        }elseif ($aready == 5) {
            $map['status'] = $aready;
        }elseif ($aready == 6) {
            $map['status'] = $aready;
        }elseif ($aready == 7) {
            $map['status'] = $aready;
        }elseif ($aready == 8) {
            $map['status'] = $aready;
        }
		
        $count = $Order->where($map)->count();
        $Page = new Page($count, 10);
        $show = $Page->show();
        $var = C('VAR_PAGE') ? C('VAR_PAGE') : 'p';
        $p = $_GET[$var];
        if ($Page->totalPages < $p) {
            die('0');
        }
        $list = $Order->where($map)->order(array('order_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $user_ids = $order_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
        }
        if (!empty($order_ids)) {
            $goods = D('Ordergoods')->where(array('order_id' => array('IN', $order_ids)))->select();
            $goods_ids = $shop_ids = array();
            foreach ($goods as $val) {
                $goods_ids[$val['goods_id']] = $val['goods_id'];
                $shop_ids[$val['shop_id']] = $val['shop_id'];
            }
            $this->assign('goods', $goods);
            $this->assign('products', D('Goods')->itemsByIds($goods_ids));
            $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        }
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Order')->getType());
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
    public function detail($order_id){
        $order_id = (int) $order_id;
        if (empty($order_id) || !($detail = D('Order')->find($order_id))) {
            $this->error('该订单不存在');
        }
        if ($detail['user_id'] != $this->uid) {
            $this->error('请不要操作他人的订单');
        }
        $order_goods = D('Ordergoods')->where(array('order_id' => $order_id))->select();
        $goods_ids = array();
        foreach ($order_goods as $k => $val) {
            $goods_ids[$val['goods_id']] = $val['goods_id'];
        }
        if (!empty($goods_ids)) {
            $this->assign('goods', D('Goods')->itemsByIds($goods_ids));
        }
        $this->assign('ordergoods', $order_goods);
        $this->assign('addr', D('Useraddr')->find($detail['address_id']));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('detail', $detail);
		
		
        $this->display();
    }
    //
	
	 public function queren($order_id = 0){
        if (is_numeric($order_id) && ($order_id = (int) $order_id)) {
            $obj = D('Order');
            if (!($detial = $obj->find($order_id))) {
                $this->fengmiMsg('该订单不存在');
            }
            if ($detial['user_id'] != $this->uid) {
                $this->fengmiMsg('请不要操作他人的订单');
            }
			//检测配送状态
			$shop = D('Shop')->find($detial['shop_id']);
            if ($shop['is_pei'] != 1) {
                 $DeliveryOrder = D('DeliveryOrder')->where(array('type_order_id' => $order_id, 'type' => 0))->find();
//                if ($DeliveryOrder['status'] != 8) {
//                    $this->fengmiMsg('配送员还未完成订单');
//                }
            }
		    if($detial['is_daofu'] == 1) {
			   $into = '货到付款确认收货成功';
            }else{
				if ($detial['status'] != 2) {
                 	$this->fengmiMsg('该订单暂时不能确定收货');
				}
				$into = '确认收货成功A';
			}
			if ($obj->save(array('order_id' => $order_id, 'status' => 3))) {
				
				        
				
						
						$userProfitModel = D('Userprofitlogs');
						$userLdbtModel = D('Userldbtlogs');
						$userModel = D('Users');
						
						if (!empty($order_id)) {
							$order = D('Order')->find($order_id);
							$userobj = D('Users');
							
							$shop_id = $order['shop_id'];
							$wherea['order_id'] = array('eq', $order_id);	
							$logs = D('Paymentlogs')->where($wherea)->find();
							$pay_id = $logs['log_id']; 
							
							$goods_order = D('Order')->where(array('order_id'=>$order_id))->find();
							$goods_order_shop = D('Shop') ->find($goods_order['shop_id']);
							if($goods_order_shop['is_profit'] == 1){
								D('Userprofitlogs')->myprofitFusers(1, $logs['user_id'], $order_id);//单个商品奖励分成和升级等级
							}
							
							
							$taxrate = 0 ; //结算费率金额
							$result = D('Ordergoods')->where(" order_id = '".$order_id."' ")->field(" goods_id, total_price ")->select();
							//开始循环遍历二维数组$result
							foreach($result as $k=>$val){ 
								if ( $val == "" ) {
									continue;
								}
								$jiesuanfeilv = D('goods')->where('goods_id='.$val['goods_id'])->getField('jiesuanfeilv');
								if ( floor($jiesuanfeilv) > 0 ) { 
									$taxrate = $taxrate + $val['total_price'] * $jiesuanfeilv / 100 ; //百分比 
								}
							}
							/*====================================消费者本人返 5%====================================*/
							$xfbe = $taxrate / 15 * 5 ; 
							if ( ($logs['user_id']) && ($logs['is_paid']) ) {
								$userModel->add_my_Money($logs['user_id'], (int)$xfbe, $intro = '平台消费奖励',$shop_id,$pay_id);
							}
							/*====================================消费者本人返 5%====================================*/ 
							
							
							
								D('Order')->save(array( 'order_id' => $order_id));
								$goods = D('Ordergoods')->where(array('order_id' => $order_id))->select();
								if (!empty($goods)) {
									$taxrate = 0 ; //结算费率金额
									D('Ordergoods')->save(array('status' => 8), array('where' => array('order_id' => $order_id)));
									if ($order['is_daofu'] == 0) {
										$ip = get_client_ip();
										foreach ($goods as $val) {
											//if ($val['status'] == 1) {
												$info = '产品ID' . $val['goods_id'];
												$tg = $userobj->checkInvite($order['user_id'], $val['total_price']);
												if ($tg !== false) {
													//推广员分层的判断
													$userobj->addIntegral($tg['uid'], $tg['integral'], "分享获得积分！");
												}
												$money = $val['total_price'];
												
												$js_price = $val['total_price']  - $val['mobile_fan'];//结算价格减去模板立减
												$gooddetail = D('Goods')->find($val['goods_id']);
												//$Goodscate = D('Goodscate')->find($gooddetail['cate_id']);
												$taxrate_d = 0 ;
												$jiesuanfeilv = D('Goods')->where('goods_id='.$val['goods_id'])->getField('jiesuanfeilv');
												if ( floor($jiesuanfeilv) > 0 ) { 
													$taxrate_d = intval(($js_price * $jiesuanfeilv)/100);
												}
												$moneyB = $js_price - $taxrate_d;//结算价格，运费不算扣点
												 
												if ($val['tui_uid']) {
													//推广员分成
														
				//                                    if (!empty($gooddetail['commission']) && $gooddetail['commission'] < $gooddetail['mall_price'] && $gooddetail['commission'] < $val['total_price']) {
														//小于的情况下才能返利不然你懂的
														
														$money0 = floor( $taxrate_d / 15 * 1);
														if ($money0 > 0) {
												
															$tui_uid = $val['tui_uid'];
															$info0 =  '订单ID:' . $val['order_id'] .'产品ID:' . $val['goods_id'] . ', [链店补贴]商家推荐人返佣 ' . round($money0/100 , 2).' 元' ;
															$wheres['user_id'] = array('eq', $tui_uid);
															$wheres['order_id'] = array('eq', $val['order_id']);	
															$wheres['order_type'] = array('eq', 1);	
															$mynum0 = $userLdbtModel->where($wheres)->count();
															if ( (int)$mynum0 == 0  ) {  
																$userModel->add_ldbt_ktxbt_money($tui_uid, $money0, $info0, $shop_id, $pay_id);
																$userModel->addldbt($tui_uid, 1, $val['order_id'], $money0, 1, $shop_id, $pay_id);
															} else {
																$userModel->add_ldbt_ktxbt_money($tui_uid, $money0, $info0, $shop_id, $pay_id);
																$userLdbtModel->save(array('is_separate' => 1,'money' => $money0, 'edit_time' => NOW_TIME), array('where' => array('order_id' => $val['order_id'], 'order_type' => 1, 'user_id' => $tui_uid)));
															}	
														}
				
														
				//                                        $moneyC = round($money / 100*1, 2);
				//                                        D('Users')->addMoney($val['tui_uid'], $moneyC, '推广佣金');
				                                          if ( round($taxrate / 100, 2) > 0 ) { 
														  	$info .= ' 扣除了推广员佣金' . round($taxrate / 100, 2).' 元';
														  }
														
														
				//                                    }
												}
												
												
												
												$my_pay_id = D('paymentlogs')->where(array('order_id' => $order_id, 'is_paid' => 1))->getField('log_id');
												$info .= ' 商城付款 门店收入 支付ID：'.$my_pay_id; 
												//给商户写入资金日志
												D('Shopmoney')->add(array(
													'shop_id' => $val['shop_id'], 
													'money' => $moneyB, 
													'create_time' => NOW_TIME, 
													'create_ip' => $ip, 
													'type' => 'goods', 
													'order_id' => $order_id, 
													'intro' => $info,
													'pay_id' => $my_pay_id
												));
												$my_shop_user_id = D('shop')->where(array('shop_id' => $val['shop_id']))->getField('user_id');
												if ( (int)$my_shop_user_id > 0 ) {
													//给商户写入资金
													D('Users')->myaddGold($my_shop_user_id, $moneyB, '在线购物',$order_id,$val['shop_id'],$my_pay_id,1);
													//平台收入
													D('Users')->myaddptGold( $order_id,$val['shop_id'],$my_pay_id);
												}
												
												
											//}
										}
									}
									
								}
							}
							
						

				
				
				
                D('Order')->overOrder($order_id); //确认到账入口
                $this->fengmiMsg($into, U('goods/index', array('aready' => 8)));
				echo "<script>alert('确认收货成功！');parent.location.href='".U('/user/goods/index', array('aready' => 8))."'; </script>"; 
				header("Location:".U('/user/goods/index', array('aready' => 8)) ); 
				exit();
				//$this->success('确认收货成功！',U('goods/index', array('aready' => 8)));
				
            }else{
				$this->fengmiMsg('操作失败');
			}
        } else {
            $this->fengmiMsg('请选择要确认收货的订单');
        }
    }
    //取消订单重做
    public function orderdel($order_id = 0){
        if (is_numeric($order_id) && ($order_id = (int) $order_id)) {
            $obj = D('Order');
            if (!($detial = $obj->find($order_id))) {
                $this->fengmiMsg('该订单不存在');
            }
            if ($detial['user_id'] != $this->uid) {
                $this->fengmiMsg('请不要操作他人的订单');
            }
			//检测配送状态
			$shop = D('Shop')->find($detial['shop_id']);
            if ($shop['is_pei'] == 0) {
                $DeliveryOrder = D('DeliveryOrder')->where(array('type_order_id' => $order_id, 'type' => 0))->find();
                if ($DeliveryOrder['status'] == 2 || $DeliveryOrder['status'] == 8) {
                    $this->fengmiMsg('配送员都接单了无法取消订单');
                }else{
					D('DeliveryOrder')->where(array('type_order_id' => $order_id, 'type' => 0))->setField('closed', 1);//没接单就关闭配送
				}
            }
			if ($detial['is_daofu'] == 1) {
				$into = '到付订单取消成功';
            }else{
				$into = '订单取消成功';
				if ($detial['status'] != 0) {
					$this->fengmiMsg('该订单暂时不能取消');
				}
			}
			
            if ($obj->save(array('order_id' => $order_id, 'closed' => 1))) {
				$obj-> del_order_goods_closed($order_id);//更新状态
				$obj-> del_goods_num($order_id);//取消后加库存
                if ($detail['use_integral']) {
                    D('Users')->addIntegral($detail['user_id'], $detail['use_integral'], '取消商城购物，订单号：' . $detail['order_id'] . '积分退还');
                }
				//取消订单打印
				if ($shop['is_goods_print'] == 1) {
					$msg = D('Order') -> orderdel_print($detial['order_id'], $detial['address_id']);
					$result = D('Print') -> printOrder($msg, $detial['shop_id']);
					Log::record('打印订单结果：' . $result);
				}
				D('Weixintmpl')->weixin_delete_order_shop($order_id,2);//商城取消订单，传订单ID跟类型
				$this->fengmiMsg($into, U('goods/index', array('aready' => 1)));
            }else{
				$this->fengmiMsg('操作失败');
			}
        } else {
            $this->fengmiMsg('请选择要取消的订单');
        }
    }
	
	public function refund(){
        $order_id = I('order_id', 0, 'trim,intval');
        $Order = D('Order');
        $goods_order = $Order->where('order_id =' . $order_id)->find();
        $var = D('Order')->order_delivery($order_id,$type =0);
		if(empty($var)){
			$this->fengmiMsg('配送状态错误错误！');
		}
        if (!$goods_order) {
            $this->fengmiMsg('错误！');
        } else {
		    if ($goods_order['is_daofu'] == 1) {
                if ($goods_order['status'] != 0) {
					$this->fengmiMsg('订单状态有误');
				 }
            }else{
				 if ($goods_order['status'] != 1) {
					$this->fengmiMsg('当前订单状态不正确');
				 }
			}
            if ($goods_order['user_id'] != $this->uid) {
                $this->fengmiMsg('请不要操作他人的订单');
            }
            $goods_order = $Order->where('order_id =' . $order_id)->setField('status', 4);
			D('Weixintmpl')->weixin_user_refund_shop($order_id,1);//商城申请退款，传订单ID跟类型
            $this->fengmiMsg('申请退款成功！', U('goods/index', array('aready' => 4)));
        }		
		
    }
	
    public function cancel_refund(){
        $order_id = I('order_id', 0, 'trim,intval');
        $Order = D('Order');
        $goods_order = $Order->where('order_id =' . $order_id)->find();
		
		$var = D('Order')->order_delivery($order_id,$type =0);
		if(empty($var)){
			$this->fengmiMsg('配送状态错误错误！');
		}   
        if (!$goods_order) {
            $this->fengmiMsg('错误！');
        } else {
            if ($goods_order['user_id'] != $this->uid) {
                $this->fengmiMsg('请不要操作他人的订单');
            }
			if ($goods_order['is_daofu'] == 1) {
                $goods_order = $Order->where('order_id =' . $order_id)->setField('status', 0);
            }else{
				$goods_order = $Order->where('order_id =' . $order_id)->setField('status', 1);
			}
			$this->fengmiMsg('取消退款成功！',U('goods/index', array('aready' => 2)));
        }
    }
	
    public function dianping($order_id){
        $order_id = (int) $order_id;
        if (empty($order_id) || !($detail = D("Order")->find($order_id))) {
            $this->error("该订单不存在");
        }
        if ($detail['user_id'] != $this->uid) {
            $this->fengmiMsg("请不要操作他人的订单");
        }
        if ($detail['is_dianping'] != 0) {
            $this->fengmiMsg("您已经点评过了");
        }
        $goodss = D('Ordergoods')->where('order_id =' . $detail['order_id'])->find();
        $goods_id = $goodss['goods_id'];
        if ($this->isPost()) {
            $data = $this->checkFields($this->_post("data", FALSE), array("score", "cost", "contents"));
            $data['user_id'] = $this->uid;
            $data['order_id'] = $detail['order_id'];
            $data['shop_id'] = $detail['shop_id'];
            $data['goods_id'] = $goods_id;
            $data['score'] = (int) $data['score'];
            if ($data['score'] <= 0 || 5 < $data['score']) {
                $this->fengmiMsg("请选择评分");
            }
            $data['contents'] = htmlspecialchars($data['contents']);
            if (empty($data['contents'])) {
                $this->fengmiMsg("不说点什么么");
            }
            $data['create_time'] = NOW_TIME;
            $data_mall_dianping = $this->_CONFIG['mobile']['data_mall_dianping'];
            $data['show_date'] = date('Y-m-d', NOW_TIME + $data_mall_dianping * 86400);
            //15天生效
            $data['create_ip'] = get_client_ip();
            $obj = D("Goodsdianping");
            if ($dianping_id = $obj->add($data)) {
                $photos = $this->_post("photos", FALSE);
                $local = array();
                foreach ($photos as $val) {
                    if (isimage($val)) {
                        $local[] = $val;
                    }
                }
                if (!empty($local)) {
                    D("Goodsdianpingpics")->upload($order_id, $local, $goods_id);
                }
                D("Order")->save(array("order_id" => $order_id, "is_dianping" => 1));
                D("Shop")->updateCount($detail['shop_id'], "score_num");
                D("Users")->updateCount($this->uid, "ping_num");
                D("Users")->prestige($this->uid, "dianping");
                $this->fengmiMsg("评价成功", U("user/goods/index/"));
            }
            $this->fengmiMsg("操作失败！");
        } else {
            $this->assign("detail", $detail);
            $goods = D('Goods')->where('goods_id =' . $goods_id)->find();
            $this->assign("goods", $goods);
            $this->display();
        }
    }
}