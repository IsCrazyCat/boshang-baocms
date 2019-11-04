<?php
class PaymentlogsAction extends CommonAction{
	
	public function ydbfclbt(){
        $Paymentlogs = D('Paymentlogs');
        import('ORG.Util.Page');

        $map = array();
		
		$nianyue_date = $this->_param('nianyue_date', 'htmlspecialchars');
		if ( strlen($nianyue_date) > 1 ) {
			$bg_time =  strtotime($nianyue_date);
			$end_time = strtotime("+1 month", strtotime($nianyue_date));
			$this->assign('nianyue_date', $nianyue_date);
			$tianshu = (int)date("t",strtotime($nianyue_date));
			//echo $bg_time .' AAA '. $end_time.' BBB '.$tianshu  ;
		} else {
			$dqy = date("Y-m",NOW_TIME);
			$bg_time = strtotime("-1 month", strtotime($dqy) );
			$end_time = strtotime($dqy);
			$this->assign('nianyue_date', date("Y-m",$bg_time));
			$tianshu = (int)date("t",strtotime(date("Y-m",$bg_time)));
			//echo $bg_time .' B '. $end_time.' D '.$tianshu  ;
		}
		$this->assign('tianshu', $tianshu);
		
		
		$map['is_paid'] = array('eq',1);
        if ( ( (int)$bg_time > 0) && ( (int)$end_time > 0) ) {
            $map['pay_time'] = array(array('LT', $end_time), array('EGT', $bg_time));
        } 
        if ($user_id = (int) $this->_param('user_id')) {
            $users = D('Users')->find($user_id);
            $this->assign('nickname', $users['nickname']);
            $this->assign('user_id', $user_id);
            $map['user_id'] = $user_id;
        }
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['order_id|log_id'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        $count = $Paymentlogs->group('user_id')->where($map)->count();
        $Page = new Page($count, 20);
        $show = $Page->show();
        $list = $Paymentlogs->group('user_id')->where($map)->order(array('user_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
		
		$Userydbfclbtlogs = D('Userydbfclbtlogs');
		
		foreach ($list as $k => $val) {
			$wheres['user_id'] = array('eq', $val['user_id']);
			$wheres['is_paid'] = array('eq',1);
			if ( ( (int)$bg_time > 0) && ( (int)$end_time > 0) ) {
				$wheres['pay_time'] = array(array('LT', $end_time), array('EGT', $bg_time));
			} 
			$yuedu = 0;
			$list[$k]['yuedu'] = $yuedu = $Paymentlogs->where($wheres)->sum('need_pay');
			$list[$k]['users'] = D('Users')->find($val['user_id']);
			if ( (int)$list[$k]['users']['rank_id'] > 0 ) {
				$list[$k]['userrank'] = D('Userrank')->find($list[$k]['users']['rank_id']);
			}
			$rijun = 0;
		    $rijun  =  $list[$k]['yuedu']/(int)$tianshu;
			if ( (int)$list[$k]['users']['rank_id'] > 5 ) { 
				if ( round($rijun/100,2) >= round($list[$k]['userrank']['yuedubangfuchalv'],2) ) {
					$list[$k]['shifoudabiao'] = $shifoudabiao = '达标';
					$list[$k]['huodebutie'] = $ydbfclbt_money = $list[$k]['userrank']['yuedubangfuchalv'];
					$is_separate = 1 ;
				} else {
					$list[$k]['shifoudabiao'] = $shifoudabiao = '未达标';
					$list[$k]['huodebutie'] = '0.00';
					$is_separate = 0 ;
					$ydbfclbt_money = 0 ;
				}
			} else {
				$list[$k]['shifoudabiao'] = $shifoudabiao = '等级未达标';	
				$list[$k]['huodebutie'] = '0.00';
				$is_separate = 0 ;
				$ydbfclbt_money = 0 ;
			}
			
			$whereB['user_id'] = array('eq', $val['user_id']);
			$whereB['bg_time'] = array('eq', $bg_time);	
			$infos = $Userydbfclbtlogs->where($whereB)->find();
			$mynum1 = count($infos);
//			if ( (int)$mynum1 == 0 )  {
//				$Userydbfclbtlogs->add(array('user_id' => $val['user_id'], 'money' => $ydbfclbt_money*100, 'intro' => "月度帮扶差旅补贴",  'shifoudabiao' => $shifoudabiao, 'create_time' => NOW_TIME, 'yuedu' => $yuedu, 'rijun' => $rijun, 'tianshu' => $tianshu, 'bg_time' => $bg_time, 'end_time' => $end_time, 'is_separate' => $is_separate ));
//			} else {
//				$Userydbfclbtlogs->save(array('log_id' => $infos['log_id'], 'user_id' => $val['user_id'], 'money' => $ydbfclbt_money*100, 'intro' => "月度帮扶差旅补贴",  'shifoudabiao' => $shifoudabiao, 'edit_time' => NOW_TIME, 'yuedu' => $yuedu, 'rijun' => $rijun, 'tianshu' => $tianshu, 'bg_time' => $bg_time, 'end_time' => $end_time, 'is_separate' => $is_separate ));
//			}
			$whereC['user_id'] = array('eq', $val['user_id']);
			$whereC['ydbfclbt_id'] = array('eq', $infos['log_id']);	
			$mynum2 = D('Usermoneylogs')->where($whereC)->count();
			if ( $mynum2 == 0  ) { 
				if ( ( $is_separate == 1 ) && ( $ydbfclbt_money*100 > 0 ) && ( NOW_TIME > $end_time ) )  {
						if (!($detail = D('Users')->find($val['user_id']))) {
							D('Users')->save(array('user_id' => $val['user_id'], 'money' => $ydbfclbt_money*100 + $detail['money']));
							
							$rank_id = D('Users')->where('user_id='.$val['user_id'])->getField('rank_id');
		                    $rankname = D('Userrank')->where('rank_id='.$rank_id)->getField('rank_name');
							
							D('Usermoneylogs')->add(array('user_id' => $val['user_id'], 'money' => $ydbfclbt_money*100, 'intro' => "月度帮扶差旅补贴", 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(),'ydbfclbt_id' => $infos['log_id'],'rankname' => $rankname ));
						}
				}
			}
			
			
        }
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
	
	
    public function index(){
        $Paymentlogs = D('Paymentlogs');
        import('ORG.Util.Page');
        $map = array();
        if (($bg_date = $this->_param('bg_date', 'htmlspecialchars')) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date);
            $map['create_time|pay_time'] = array(array('ELT', $end_time), array('EGT', $bg_time));
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
        } else {
            if ($bg_date = $this->_param('bg_date', 'htmlspecialchars')) {
                $bg_time = strtotime($bg_date);
                $this->assign('bg_date', $bg_date);
                $map['create_time|pay_time'] = array('EGT', $bg_time);
            }
            if ($end_date = $this->_param('end_date', 'htmlspecialchars')) {
                $end_time = strtotime($end_date);
                $this->assign('end_date', $end_date);
                $map['create_time|pay_time'] = array('ELT', $end_time);
            }
        }
        if ($user_id = (int) $this->_param('user_id')) {
            $users = D('Users')->find($user_id);
            $this->assign('nickname', $users['nickname']);
            $this->assign('user_id', $user_id);
            $map['user_id'] = $user_id;
        }
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['order_id|log_id'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        $count = $Paymentlogs->where($map)->count();
        $Page = new Page($count, 15);
        $show = $Page->show();
        $list = $Paymentlogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
		foreach ($list as $k => $val) {
			$type = $Paymentlogs->get_payment_logs_type($val['type']);
            $list[$k]['type'] = $type;
			$list[$k]['users'] = D('Users')->find($val['user_id']);
        }
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
}