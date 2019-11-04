<?php

class UserprofitlogsModel extends CommonModel {
    protected $pk = 'log_id';
    protected $tableName = 'user_profit_logs';
	
	
	
  //分销
	public function profitFusers($order_type = 0, $uid = 0, $order_id = 0) {
		$users = D('Users')->find($uid);
		$Userrank = D('Userrank')->find($users['rank_id']);
		if ($order_type === 0) {
			$model = D('Tuan');
			$map['o.order_id'] = $order_id;
			$join = ' INNER JOIN ' . C('DB_PREFIX') . 'tuan_order o ON o.tuan_id = t.tuan_id INNER JOIN ' . C('DB_PREFIX') . 'users u ON o.user_id = u.user_id';
			$goods = $model->alias('t')->field('t.*, o.total_price, u.fuid1, u.fuid2, u.fuid3, o.is_separate')->join($join)->where($map)->limit(0, 1)->select();
		}
		else {
			$model = D('Goods');
			$map['og.order_id'] = $order_id;

			$join = ' INNER JOIN ' . C('DB_PREFIX') . 'order_goods og ON g.goods_id = og.goods_id INNER JOIN ' . C('DB_PREFIX') . 'order o ON o.order_id = og.order_id INNER JOIN ' . C('DB_PREFIX') . 'users u ON o.user_id = u.user_id';
			$goods = $model->alias('g')->field('g.*, og.total_price, u.fuid1, u.fuid2, u.fuid3, o.is_separate')->join($join)->where($map)->limit(0, 1)->select();
		}
		$goods = $goods[0];
		
/*==========================================过=======================================================*/			
			if ( $order_type === 0 ) { //团购
			    $taxrate = 0 ; //结算费率金额
				$jiesuanfeilv = D('Tuan')->where('tuan_id='.$goods['tuan_id'])->getField('jiesuanfeilv');
				if ( floor($jiesuanfeilv) > 0 ) { 
					$taxrate = $order['total_price'] * $jiesuanfeilv / 100  ; //百分比 
				}
			}
			if ( $order_type === 1 ) { //商城
			    $taxrate = 0 ; //结算费率金额
				$result = D('Ordergoods')->where(" order_id = '".$order_id."' ")->field(" goods_id,total_price ")->select();
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
			}
/*===========================================过=====================================================*/			
		
		
		
		if ($goods) {
			$userModel = D('Users');
//			if ($goods['profit_rank_id']) {
//				$rank = D('Userrank')->find($goods['profit_rank_id']);
//				if ($rank) {
//					$userModel->save(array('user_id' => $uid, 'rank_id' => $rank['rank_id'], 'prestige' => $rank['prestige']));
//				}
//			}
             
			 
			//自动升级开始 lihongshun 2019.2.19
			$myuser = $userModel->find($uid);
			if ($myuser['__referee']) {
				 $myuser_referee = $myuser['__referee'].','.$uid;
				 $floor_users = $userModel->where("user_id in (".$myuser['__referee'].")")->order('user_id desc')->select();  
				 foreach($floor_users as $rss){
					    $rss_gerenshuju = (int)$rss['gerenshuju']; 
						$rss_tuanduishuju = (int)$rss['tuanduishuju']; 
						$arr_rank_name = array("GD3", "GD2", "GD1", "D4", "D3", "D2", "D1");
						foreach ($arr_rank_name as $my_rank_name) {
							$mapA['rank_name'] = array('LIKE', '%'.$my_rank_name.'%');
							$myrank = D('Userrank')->where($mapA)->find();
							$my_tuanduishuju = $myrank['tuanduishuju'];
							$my_gerenshuju = $myrank['gerenshuju'];
							$my_count2 = M('Users')->where(" fuid1 = '".$rss['user_id']."' ")->count(); 
							if ( (int)$my_count2 <> (int)$rss_gerenshuju ) {
								D('Users')->save(array('user_id' => $rss['user_id'], 'gerenshuju' => $my_count2));
								$rss_gerenshuju = $my_count2;
							} 
							if(strpos($myrank['jianjiegerenshuju'],'除最大数据包外') !==false){
								$mapB['shangxianjihe'] = array('LIKE', '%'.$rss['user_id'].'%');
								$max_xiaxiang_gerenshuju = $userModel->where($mapB)->max('gerenshuju');
								if ( (int)$rss_gerenshuju > (int)$max_xiaxiang_gerenshuju ) {
									$rss_gerenshuju = (int)$rss_gerenshuju - (int)$max_xiaxiang_gerenshuju;
								} 
							}
							if ( ( $rss_tuanduishuju > 0 ) and  ( $rss_gerenshuju > 0 ) ) {
								if ( ( $rss_tuanduishuju >= $my_tuanduishuju ) and  ( $rss_gerenshuju >= $my_gerenshuju ) ) {
									 $userModel->save(array('user_id' => $rss['user_id'], 'rank_id' => $myrank['rank_id'], 'prestige' => $myrank['prestige'] ));
								}
							}
						}
				 }
			}
			//自动升级结束
			

			
			if ($goods['profit_enable']  && !$goods['is_separate']) {
				if ($order_type === 0) {
					$modelOrder = D('Tuanorder');
					$orderTypeName = '团购';
				}
				else {
					$modelOrder = D('Order');
					$orderTypeName = '商城';
				}
				//$profit_rate1 = (int)$goods['profit_rate1'];
				
				if ($goods['fuid1']) {
					$fuser1 = $userModel->find($goods['fuid1']);
					$Userrank_1 = D('Userrank')->find($fuser1['rank_id']);
					$profit_rate1 = round($Userrank_1['yijibutie'],8);
				    
					$money1 = floor( $taxrate / 15 * $profit_rate1 );
					
					if ($money1 > 0) {
						$info1 = $orderTypeName . '订单ID:' . $order_id . ' 一级分成: ' . round($money1 / 100, 2).' 元';
						
						if ($fuser1) {
							//$userModel->add_fxbt_ktxbt_money($goods['fuid1'], $money1, $info1,$shop_id,$pay_id);
							$userModel->addProfit($goods['fuid1'], $order_type, $order_id, $money1, 0,$shop_id,$pay_id);
						}
					}
				}
				//$profit_rate2 = (int)$goods['profit_rate2'];
				
				
				if ($goods['fuid2']) {
					
					$fuser2 = $userModel->find($goods['fuid2']);
					$Userrank_2 = D('Userrank')->find($fuser2['rank_id']);
					$profit_rate2 = round($Userrank_2['erjibutie'],8);
					
					
					$money2 = floor( $taxrate / 15 * $profit_rate2 );
					if ($money2 > 0) {
						$info2 = $orderTypeName . '订单ID:' . $order_id . '  二级分成: ' . round($money2 / 100, 2).' 元';
						
						if ($fuser2) {
							//$userModel->add_fxbt_ktxbt_money($goods['fuid2'], $money2, $info2,$shop_id,$pay_id);
							$userModel->addProfit($goods['fuid2'], $order_type, $order_id, $money2, 0,$shop_id,$pay_id);
						}

					}

				}
				//$profit_rate3 = (int)$goods['profit_rate3'];
				
				
				if ($goods['fuid3']) {
					$fuser3 = $userModel->find($goods['fuid3']);
					$Userrank_3 = D('Userrank')->find($fuser3['rank_id']);
					$profit_rate3 = round($Userrank_3['sanjibutie'],8);
					
					
					$money3 = floor( $taxrate / 15 * $profit_rate3 );			
					if ($money3 > 0) {
						$info3 = $orderTypeName . '订单ID:' . $order_id . '  三级分成: ' . round($money3 / 100, 2).' 元';
						
						if ($fuser3) {
							//$userModel->add_fxbt_ktxbt_money($goods['fuid3'], $money3, $info3,$shop_id,$pay_id);
							$userModel->addProfit($goods['fuid3'], $order_type, $order_id, $money3, 0,$shop_id,$pay_id);
						}
					}
				}
				$modelOrder->save(array('order_id' => $order_id, 'is_separate' => 0, 'is_profit' => 0));
			}
		}
	}
   //三级分销结束
   
   
   
  //确认收货后分销
	public function myprofitFusers($order_type = 0, $uid = 0, $order_id = 0) {
		$users = D('Users')->find($uid);
		$Userrank = D('Userrank')->find($users['rank_id']);
		if ($order_type === 0) {
			$model = D('Tuan');
			$map['o.order_id'] = $order_id;
			$join = ' INNER JOIN ' . C('DB_PREFIX') . 'tuan_order o ON o.tuan_id = t.tuan_id INNER JOIN ' . C('DB_PREFIX') . 'users u ON o.user_id = u.user_id';
			$goods = $model->alias('t')->field('t.*, o.total_price, u.fuid1, u.fuid2, u.fuid3, o.is_separate')->join($join)->where($map)->limit(0, 1)->select();
		}
		else {
			$model = D('Goods');
			$map['og.order_id'] = $order_id;

			$join = ' INNER JOIN ' . C('DB_PREFIX') . 'order_goods og ON g.goods_id = og.goods_id INNER JOIN ' . C('DB_PREFIX') . 'order o ON o.order_id = og.order_id INNER JOIN ' . C('DB_PREFIX') . 'users u ON o.user_id = u.user_id';
			$goods = $model->alias('g')->field('g.*, og.total_price, u.fuid1, u.fuid2, u.fuid3, o.is_separate')->join($join)->where($map)->limit(0, 1)->select();
		}
		$goods = $goods[0];
		
/*=================================================================================================*/			
            if ( $order_type === 0 ) { //团购
			    $taxrate = 0 ; //结算费率金额
				$jiesuanfeilv = D('Tuan')->where('tuan_id='.$goods['tuan_id'])->getField('jiesuanfeilv');
				if ( floor($jiesuanfeilv) > 0 ) { 
					$taxrate = $order['total_price'] * $jiesuanfeilv / 100  ; //百分比 
				}
			}
			if ( $order_type === 1 ) { //商城
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
			}
/*=================================================================================================*/			
		
		if ($goods) {
			$userModel = D('Users');
			$userProfitModel = D('Userprofitlogs');
			$userLdbtModel = D('Userldbtlogs');
			
			$shop_id = $goods['shop_id'];
			$wherea['order_id'] = array('eq', $goods['order_id']);	
			$logs = D('Paymentlogs')->where($wherea)->find();
			$pay_id = $logs['log_id'];
			
//			if ($goods['profit_rank_id']) {
//				$rank = D('Userrank')->find($goods['profit_rank_id']);
//				if ($rank) {
//					$userModel->save(array('user_id' => $uid, 'rank_id' => $rank['rank_id'], 'prestige' => $rank['prestige']));
//				}
//			}
		
			 
			//自动升级开始 lihongshun 2019.2.19
			$myuser = $userModel->find($uid);
			if ($myuser['__referee']) {
				 $myuser_referee = $myuser['__referee'].','.$uid;
				 $floor_users = $userModel->where("user_id in (".$myuser['__referee'].")")->order('user_id desc')->select();  
				 foreach($floor_users as $rss){
					    $rss_gerenshuju = (int)$rss['gerenshuju']; 
						$rss_tuanduishuju = (int)$rss['tuanduishuju']; 
						$arr_rank_name = array("GD3", "GD2", "GD1", "D4", "D3", "D2", "D1");
						foreach ($arr_rank_name as $my_rank_name) {
							$mapA['rank_name'] = array('LIKE', '%'.$my_rank_name.'%');
							$myrank = D('Userrank')->where($mapA)->find();
							$my_tuanduishuju = $myrank['tuanduishuju'];
							$my_gerenshuju = $myrank['gerenshuju'];
							$my_count2 = M('Users')->where(" fuid1 = '".$rss['user_id']."' ")->count(); 
							if ( (int)$my_count2 <> (int)$rss_gerenshuju ) {
								D('Users')->save(array('user_id' => $rss['user_id'], 'gerenshuju' => $my_count2));
								$rss_gerenshuju = $my_count2;
							} 
							if(strpos($myrank['jianjiegerenshuju'],'除最大数据包外') !==false){
								$mapB['shangxianjihe'] = array('LIKE', '%'.$rss['user_id'].'%');
								$max_xiaxiang_gerenshuju = $userModel->where($mapB)->max('gerenshuju');
								if ( (int)$rss_gerenshuju > (int)$max_xiaxiang_gerenshuju ) {
									$rss_gerenshuju = (int)$rss_gerenshuju - (int)$max_xiaxiang_gerenshuju;
								} 
							}
							if ( ( $rss_tuanduishuju > 0 ) and  ( $rss_gerenshuju > 0 ) ) {
								if ( ( $rss_tuanduishuju >= $my_tuanduishuju ) and  ( $rss_gerenshuju >= $my_gerenshuju ) ) {
									 $userModel->save(array('user_id' => $rss['user_id'], 'rank_id' => $myrank['rank_id'], 'prestige' => $myrank['prestige'] ));
								}
							}
						}
				 }
			}
			//自动升级结束
			

			
			if ($goods['profit_enable']  && !$goods['is_separate']) {
				if ($order_type === 0) {
					$modelOrder = D('Tuanorder');
					$orderTypeName = '团购';
				}
				else {
					$modelOrder = D('Order');
					$orderTypeName = '商城';
				}
				//$profit_rate1 = (int)$goods['profit_rate1'];
				
				if ($goods['fuid1']) {
					$fuser1 = $userModel->find($goods['fuid1']);
					$Userrank_1 = D('Userrank')->find($fuser1['rank_id']);
					$profit_rate1 = round($Userrank_1['yijibutie'],8);
					$money1 = floor( $taxrate / 15 * $profit_rate1 );
				   
					
					if ($money1 > 0) {
						$info1 = $orderTypeName . '订单ID:' . $order_id . ' 一级分成: ' . round($money1 / 100, 2).' 元';
						
						if ($fuser1) {
							
							$wheres['user_id'] = array('eq', $goods['fuid1']);
							$wheres['order_id'] = array('eq', $order_id);	
							$wheres['order_type'] = array('eq', $order_type);	
							$mynum1 = $userProfitModel->where($wheres)->count();
							if ( (int)$mynum1 == 0  ) {  
								 $userModel->add_fxbt_ktxbt_money($goods['fuid1'], $money1, $info1,$shop_id,$pay_id);
							     $userModel->addProfit($goods['fuid1'], $order_type, $order_id, $money1, 1,$shop_id,$pay_id);
							} else {
								 $userModel->add_fxbt_ktxbt_money($goods['fuid1'], $money1, $info1,$shop_id,$pay_id);
								 $userProfitModel->save(array('is_separate' => 1,'money' => $money1 , 'edit_time' => NOW_TIME), array('where' => array('order_id' => $order_id, 'order_type' => $order_type, 'user_id' => $goods['fuid1'])));
							}							
							
							
						}
					}
				}
				//$profit_rate2 = (int)$goods['profit_rate2'];
				if ($goods['fuid2']) {
					$fuser2 = $userModel->find($goods['fuid2']);
					$Userrank_2 = D('Userrank')->find($fuser2['rank_id']);
					$profit_rate2 = round($Userrank_2['yijibutie'],8);
					$money2 = floor( $taxrate / 15 * $profit_rate2 );
				   
					
					if ($money2 > 0) {
						$info2 = $orderTypeName . '订单ID:' . $order_id . '  二级分成: ' . round($money2 / 100, 2).' 元';
						
						if ($fuser2) {
							
							$wheres['user_id'] = array('eq', $goods['fuid2']);
							$wheres['order_id'] = array('eq', $order_id);	
							$wheres['order_type'] = array('eq', $order_type);	
							$mynum2 = $userProfitModel->where($wheres)->count();
							if ( (int)$mynum2 == 0  ) {  
								 $userModel->add_fxbt_ktxbt_money($goods['fuid2'], $money2, $info2,$shop_id,$pay_id);
							     $userModel->addProfit($goods['fuid2'], $order_type, $order_id, $money2, 1,$shop_id,$pay_id);
							} else {
								 $userModel->add_fxbt_ktxbt_money($goods['fuid2'], $money2, $info2,$shop_id,$pay_id);
								 $userProfitModel->save(array('is_separate' => 1,'money' => $money2 , 'edit_time' => NOW_TIME), array('where' => array('order_id' => $order_id, 'order_type' => $order_type, 'user_id' => $goods['fuid2'])));
							}							
							
							
						}
					}
				}
				
				
				//$profit_rate3 = (int)$goods['profit_rate3'];
				
				
				if ($goods['fuid3']) {
					$fuser3 = $userModel->find($goods['fuid3']);
					$Userrank_3 = D('Userrank')->find($fuser3['rank_id']);
					$profit_rate3 = round($Userrank_3['sanjibutie'],8);
					
					
					$money3 = floor( $taxrate / 15 * $profit_rate3 );			
					if ($money3 > 0) {
						$info3 = $orderTypeName . '订单ID:' . $order_id . '  三级分成: ' . round($money3 / 100, 2);
						
						if ($fuser3) {
							
							
							$wheres['user_id'] = array('eq', $goods['fuid3']);
							$wheres['order_id'] = array('eq', $order_id);	
							$wheres['order_type'] = array('eq', $order_type);	
							$mynum3 = $userProfitModel->where($wheres)->count();
							if ( (int)$mynum3 == 0  ) {  
								$userModel->add_fxbt_ktxbt_money($goods['fuid3'], $money3, $info3,$shop_id,$pay_id);
							    $userModel->addProfit($goods['fuid3'], $order_type, $order_id, $money3, 1,$shop_id,$pay_id);
							} else {
								$userModel->add_fxbt_ktxbt_money($goods['fuid3'], $money3, $info3,$shop_id,$pay_id);
								$userProfitModel->save(array('is_separate' => 1,'money' => $money3 , 'edit_time' => NOW_TIME), array('where' => array('order_id' => $order_id, 'order_type' => $order_type, 'user_id' => $goods['fuid3'])));
							}								
							
							
						}
					}
				}
				$modelOrder->save(array('order_id' => $order_id, 'is_separate' => 1, 'is_profit' => 1));
			}
		}
	}
   //三级分销结束
   
   
   
   

}
