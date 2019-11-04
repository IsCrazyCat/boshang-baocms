<?php
class OrderAction extends CommonAction{
    public function index(){
        $Tuanorder = D('Tuanorder');
        import('ORG.Util.Page');
        $map = array('user_id' => $this->uid, 'closed' => 0);
        if (($bg_date = $this->_param('bg_date', 'htmlspecialchars')) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date);
            $map['create_time'] = array(array('ELT', $end_time), array('EGT', $bg_time));
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
        } else {
            if ($bg_date = $this->_param('bg_date', 'htmlspecialchars')) {
                $bg_time = strtotime($bg_date);
                $this->assign('bg_date', $bg_date);
                $map['create_time'] = array('EGT', $bg_time);
            }
            if ($end_date = $this->_param('end_date', 'htmlspecialchars')) {
                $end_time = strtotime($end_date);
                $this->assign('end_date', $end_date);
                $map['create_time'] = array('ELT', $end_time);
            }
        }
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['order_id'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        if (isset($_GET['st']) || isset($_POST['st'])) {
            $st = (int) $this->_param('st');
            if ($st != 999) {
                $map['status'] = $st;
            }
            $this->assign('st', $st);
        } else {
            $this->assign('st', 999);
        }
        $count = $Tuanorder->where($map)->count();
        $Page = new Page($count, 10);
        $show = $Page->show();
        $list = $Tuanorder->where($map)->order(array('order_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $shop_ids = $tuan_ids = $order_ids = array();
        foreach ($list as $k => $val) {
            if (!empty($val['shop_id'])) {
                $shop_ids[$val['shop_id']] = $val['shop_id'];
            }
            $order_ids[$val['order_id']] = $val['order_id'];
            $tuan_ids[$val['tuan_id']] = $val['tuan_id'];
        }
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('tuan', D('Tuan')->itemsByIds($tuan_ids));
        $this->assign('dianping', D('Tuandianping')->itemsByIds($order_ids));
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
    //PC团购详情
    public function detail($order_id)
    {
        $order_id = (int) $order_id;
        if (empty($order_id) || !($detail = D('Tuanorder')->find($order_id))) {
            $this->error('该订单不存在');
        }
        if ($detail['user_id'] != $this->uid) {
            $this->error('请不要操作他人的订单');
        }
        if (!($dianping = D('Tuandianping')->where(array('order_id' => $order_id, 'user_id' => $this->uid))->find())) {
            $detail['dianping'] = 0;
        } else {
            $detail['dianping'] = 1;
        }
        $this->assign('tuans', D('Tuan')->find($detail['tuan_id']));
        $this->assign('detail', $detail);
        $this->display();
    }
    public function noindex()
    {
        $Tuanorder = D('Tuanorder');
        import('ORG.Util.Page');
        $map = array('user_id' => $this->uid, 'closed' => 0);
        $lists = $Tuanorder->where($map)->order(array('order_id' => 'desc'))->select();
        $dianping = D('Tuandianping')->where(array('user_id' => $this->uid))->select();
        $orders = array();
        foreach ($dianping as $key => $v) {
            $orders[] = $v['order_id'];
        }
        foreach ($lists as $kk => $vv) {
            if (in_array($vv['order_id'], $orders)) {
                unset($lists[$kk]);
            }
        }
        $count = count($lists);
        $Page = new Page($count, 10);
        $show = $Page->show();
        $list = array_slice($lists, $Page->firstRow, $Page->listRows);
        $shop_ids = $tuan_ids = $order_ids = array();
        foreach ($list as $k => $val) {
            if (!empty($val['shop_id'])) {
                $shop_ids[$val['shop_id']] = $val['shop_id'];
            }
            $order_ids[$val['order_id']] = $val['order_id'];
            $tuan_ids[$val['tuan_id']] = $val['tuan_id'];
        }
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('tuan', D('Tuan')->itemsByIds($tuan_ids));
        $this->assign('dianping', D('Tuandianping')->itemsByIds($order_ids));
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
    public function delete($order_id){
        $order_id = I('order_id', 0, 'trim,intval');
        $obj = D('Tuanorder');
        if (!($detail = D('Tuanorder')->find($order_id))) {
            $this->baoError('团购不存在', U('order/index'));
        }
        if ($detail['status'] == -1) {
            $Tuancode = D('Tuancode');
            $tuan_code_is_used = $Tuancode->where(array('order_id' => $order_id, 'status' => 0, 'is_used' => 1))->select();
            $maps['order_id'] = array('eq', $order_id);
            $maps['status'] = array('gt', 0);
            $tuan_code_status = $Tuancode->where($maps)->select();
            if (!empty($tuan_code_is_used)) {
                $this->baoError('已有团购劵验证不能取消订单');
            } elseif (!empty($tuan_code_status)) {
                $this->baoError('已有团购劵申请退款不行执行此操作');
            } else {
                $tuan_code = $Tuancode->where(array('order_id' => $order_id, 'status' => 0, 'is_used' => 0))->select();
                foreach ($tuan_code as $k => $value) {
                    $Tuancode->save(array('code_id' => $value['code_id'], 'closed' => 1));
                }
                $obj->save(array('order_id' => $order_id, 'closed' => 1));
                D('Users')->addIntegral($detail['user_id'], $detail['use_integral'], '取消团购订单' . $detail['order_id'] . '积分退还');
                //返积分
                $this->baoSuccess('取消订单成功!', U('tuan/index'));
            }
        } elseif ($detail['status'] != 0) {
            $this->baoSuccess('状态不正确', U('order/index'));
        } elseif ($detial['closed'] == 1) {
            $this->baoSuccess('团购已关闭', U('order/index'));
        } elseif ($detail['user_id'] != $this->uid) {
            $this->baoSuccess('不能操作别人的团购', U('order/index'));
        } else {
            if ($obj->save(array('order_id' => $order_id, 'closed' => 1))) {
                D('Users')->addIntegral($detail['user_id'], $detail['use_integral'], '取消团购订单' . $detail['order_id'] . '积分退还');
                //返积分
                $this->baoSuccess('取消订单成功!', U('order/index'));
            } else {
                $this->baoError('操作失败');
            }
        }
    }
    //我的订单
    public function goods(){
        $Order = D('Order');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        $map = array('closed' => 0, 'user_id' => $this->uid);
        $keyword = $this->_param('keyword', 'htmlspecialchars');
        if ($keyword) {
            $map['order_id'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        if (($bg_date = $this->_param('bg_date', 'htmlspecialchars')) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date);
            $map['create_time'] = array(array('ELT', $end_time), array('EGT', $bg_time));
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
        } else {
            if ($bg_date = $this->_param('bg_date', 'htmlspecialchars')) {
                $bg_time = strtotime($bg_date);
                $this->assign('bg_date', $bg_date);
                $map['create_time'] = array('EGT', $bg_time);
            }
            if ($end_date = $this->_param('end_date', 'htmlspecialchars')) {
                $end_time = strtotime($end_date);
                $this->assign('end_date', $end_date);
                $map['create_time'] = array('ELT', $end_time);
            }
        }
        if (isset($_GET['st']) || isset($_POST['st'])) {
            $st = (int) $this->_param('st');
            if ($st != 999) {
                $map['status'] = $st;
            }
            $this->assign('st', $st);
        } else {
            $this->assign('st', 999);
        }
        $count = $Order->where($map)->count();
        $Page = new Page($count, 10);
        $show = $Page->show();
        $list = $Order->where($map)->order(array('order_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $user_ids = $order_ids = $shop_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
            $shop_ids[$val['shop_id']] = $val['shop_id'];
        }
        if (!empty($shop_ids)) {
            $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        }
        if (!empty($order_ids)) {
            $goods = D('Ordergoods')->where(array('order_id' => array('IN', $order_ids)))->select();
            $goods_ids = array();
            foreach ($goods as $val) {
                $goods_ids[$val['goods_id']] = $val['goods_id'];
            }
            $this->assign('goods', $goods);
            $this->assign('products', D('Goods')->itemsByIds($goods_ids));
        }
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
    public function refund(){
        $order_id = I('order_id', 0, 'trim,intval');
        $Order = D('Order');
        $goods_order = $Order->where('order_id =' . $order_id)->find();
        $var = D('Order')->order_delivery($order_id, $type = 0);
        if (empty($var)) {
            $this->baoError('配送状态错误错误！');
        }
        if (!$goods_order) {
            $this->baoError('错误！');
        } else {
            if ($goods_order['is_daofu'] == 1) {
                if ($goods_order['status'] != 0) {
                    $this->baoError('订单状态有误');
                }
            } else {
                if ($goods_order['status'] != 1) {
                    $this->baoError('当前订单状态不正确');
                }
            }
            if ($goods_order['user_id'] != $this->uid) {
                $this->baoError('请不要操作他人的订单');
            }
            $goods_order = $Order->where('order_id =' . $order_id)->setField('status', 2);
			D('Weixintmpl')->weixin_user_refund_shop($order_id,1);//商城申请退款，传订单ID跟类型
            $this->baoSuccess('申请退款成功！', U('order/goods'));
        }
    }
    public function cancel_refund(){
        $order_id = I('order_id', 0, 'trim,intval');
        $Order = D('Order');
        $goods_order = $Order->where('order_id =' . $order_id)->find();
        $var = D('Order')->order_delivery($order_id, $type = 0);
        if (empty($var)) {
            $this->baoError('配送状态错误错误！');
        }
        if (!$goods_order) {
            $this->baoError('错误！');
        } else {
            if ($goods_order['user_id'] != $this->uid) {
                $this->baoError('请不要操作他人的订单');
            }
            if ($goods_order['is_daofu'] == 1) {
                $goods_order = $Order->where('order_id =' . $order_id)->setField('status', 0);
            } else {
                $goods_order = $Order->where('order_id =' . $order_id)->setField('status', 1);
            }
            $this->baoSuccess('取消退款成功！', U('order/goods'));
        }
    }
	
    public function goodsshou($order_id = 0){
        if (is_numeric($order_id) && ($order_id = (int) $order_id)) {
            $obj = D('Order');
            if (!($detial = $obj->find($order_id))) {
                $this->baoError('该订单不存在');
            }
            if ($detial['user_id'] != $this->uid) {
                $this->baoError('请不要操作他人的订单');
            }
            //检测配送状态
            $shop = D('Shop')->find($detial['shop_id']);
            if ($shop['is_pei'] != 1) {
                $DeliveryOrder = D('DeliveryOrder')->where(array('type_order_id' => $order_id, 'type' => 0))->find();
                if ($DeliveryOrder['status'] != 8) {
                    $this->baoError('配送员还未完成订单A');
                }
            }
            if ($detial['is_daofu'] == 1) {
                $into = '货到付款确认收货成功';
            } else {
                if ($detial['status'] != 2) {
                    $this->baoError('该订单暂时不能确定收货');
                }
                $into = '确认收货成功';
            }
            if ($obj->save(array('order_id' => $order_id, 'status' => 3))) {
				D('Ordergoods')->save(array('order_id' => $order_id, 'status' => 3));
                D('Order')->overOrder($order_id);
				
/*分成开始*/

		
			$userProfitModel = D('Userprofitlogs');
			$userLdbtModel = D('Userldbtlogs');
			$userModel = D('Users');
			
			$order = D('Order')->find($order_id);
				
			
			$shop_id = $order['shop_id'];
			$wherea['order_id'] = array('eq', $order_id);	
			$logs = D('Paymentlogs')->where($wherea)->find();
			$pay_id = $logs['log_id']; 
			
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
			
			
            $userobj = D('Users');
            if ($order['status'] == 2) {
                D('Order')->save(array('status' => 8, 'order_id' => $order_id));
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
		//						$Goodscate = D('Goodscate')->find($gooddetail['cate_id']);
								$jiesuanfeilv = D('goods')->where('goods_id='.$val['goods_id'])->getField('jiesuanfeilv');
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
												$userLdbtModel->save(array('is_separate' => 1,'money' => $money0, 'edit_time' => NOW_TIME, 'shop_id' => $shop_id, 'pay_id' => $pay_id), array('where' => array('order_id' => $val['order_id'], 'order_type' => 1, 'user_id' => $tui_uid)));
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
					
                   // $this->baoSuccess('发货成功！',  $_SERVER['HTTP_REFERER']);
                }
            }
        


/*分成结束*/
				
				
                //确认到账入口
                $this->baoSuccess($into, U('order/goods'));
            } else {
                $this->baoError('操作失败');
            }
        } else {
            $this->baoError('请选择要确认收货的订单');
        }
    }
    //PC取消订单重做
    public function goodsdel($order_id = 0){
        if (is_numeric($order_id) && ($order_id = (int) $order_id)) {
            $obj = D('Order');
            if (!($detial = $obj->find($order_id))) {
                $this->baoError('该订单不存在');
            }
            if ($detial['user_id'] != $this->uid) {
                $this->baoError('请不要操作他人的订单');
            }
            //检测配送状态
            $shop = D('Shop')->find($detial['shop_id']);
            if ($shop['is_pei'] == 0) {
                $DeliveryOrder = D('DeliveryOrder')->where(array('type_order_id' => $order_id, 'type' => 0))->find();
                if ($DeliveryOrder['status'] == 2 || $DeliveryOrder['status'] == 8) {
                    $this->baoError('配送员都接单了无法取消订单');
                } else {
                    D('DeliveryOrder')->where(array('type_order_id' => $order_id, 'type' => 0))->setField('closed', 1);
                    //没接单就关闭配送
                }
            }
            if ($detial['is_daofu'] == 1) {
                $into = '到付订单取消成功';
            } else {
                $into = '订单取消成功';
                if ($detial['status'] != 0) {
                    $this->baoError('该订单暂时不能取消');
                }
            }
            if ($obj->save(array('order_id' => $order_id, 'closed' => 1))) {
                $obj->del_order_goods_closed($order_id);
                //更新状态
                $obj->del_goods_num($order_id);//取消后加库存
                if ($detail['use_integral']) {
                    D('Users')->addIntegral($detail['user_id'], $detail['use_integral'], '取消商城购物，订单号：' . $detail['order_id'] . '积分退还');
                }
				D('Weixintmpl')->weixin_delete_order_shop($order_id,2);//商城取消订单，传订单ID跟类型
                $this->baoSuccess($into, U('order/goods'));
            } else {
                $this->baoError('操作失败');
            }
        } else {
            $this->baoError('请选择要取消的订单');
        }
    }
    //PC商城详情
    public function details($order_id){
        $order_id = (int) $order_id;
        if (empty($order_id) || !($detail = D('Order')->find($order_id))) {
            $this->error('该订单不存在');
        }
        if ($detail['user_id'] != $this->uid) {
            $this->error('请不要查看他人的订单');
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
        $this->assign('addr', D('Useraddr')->find($detail['addr_id']));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Order')->getType());
        $this->assign('detail', $detail);
        $this->display();
    }
    public function dianping($order_id) {
        $order_id = (int) $order_id;
        if (!($detail = D('Order')->find($order_id))) {
            $this->baoError('没有该商品');
        } else {
            if ($detail['user_id'] != $this->uid) {
                $this->baoError('不要评价别人的商品');
                die;
            }
        }
        if (D('Goodsdianping')->check($order_id, $this->uid)) {
            $this->baoError('已经评价过了');
        }
        $goodss = D('Ordergoods')->where('order_id =' . $detail['order_id'])->find();
        $goods_id = $goodss['goods_id'];
        if ($this->_Post()) {
            $data = $this->checkFields($this->_post('data', false), array('score', 'cost', 'contents'));
            $data['user_id'] = $this->uid;
            $data['shop_id'] = $detail['shop_id'];
            $data['goods_id'] = $goods_id;
            $data['order_id'] = $order_id;
            $data['score'] = (int) $data['score'];
            if (empty($data['score'])) {
                $this->baoError('评分不能为空');
            }
            if ($data['score'] > 5 || $data['score'] < 1) {
                $this->baoError('评分为1-5之间的数字');
            }
            $data['cost'] = (int) $data['cost'];
            $data['contents'] = htmlspecialchars($data['contents']);
            if (empty($data['contents'])) {
                $this->baoError('评价内容不能为空');
            }
            if ($words = D('Sensitive')->checkWords($data['contents'])) {
                $this->baoError('评价内容含有敏感词：' . $words);
            }
            $data_mall_dianping = $this->_CONFIG['mobile']['data_mall_dianping'];
            $data['show_date'] = date('Y-m-d', NOW_TIME + $data_mall_dianping * 86400);//15天生效
            $data['create_time'] = NOW_TIME;
            $data['create_ip'] = get_client_ip();
            if (D('Goodsdianping')->add($data)) {
                $photos = $this->_post('photos', false);
                $local = array();
                foreach ($photos as $val) {
                    if (isImage($val)) {
                        $local[] = $val;
                    }
                }
                if (!empty($local)) {
                    D('Goodsdianpingpics')->upload($order_id, $local);
                }
                D('Order')->save(array('order_id' => $order_id, 'is_dianping' => 1));
                D('Users')->prestige($this->uid, 'dianping');
                D('Users')->updateCount($this->uid, 'ping_num');
                $this->baoSuccess('恭喜您点评商品成功!', U('members/order/goods'));
            }
            $this->baoError('点评失败！');
        } else {
            $goodsdetails = D('Goods')->where('goods_id =' . $goods_id)->find();
            $this->assign('goodsdetails', $goodsdetails);
            $this->assign('order_id', $order_id);
            $this->display();
        }
    }
}