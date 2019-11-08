<?php
class DistributionAction extends CommonAction{
    public function _initialize(){
        parent::_initialize();
        $distributions = (int) $this->_CONFIG['profit']['profit'];
        //赋值分销开关
        if ($distributions == 0) {
            $this->error('暂无此功能');
            die;
        }
        $profit_min_rank_id = (int) $this->_CONFIG['profit']['profit_min_rank_id'];
        $fuser = $this->member;
        if ($fuser) {
            $flag = false;
            if ($profit_min_rank_id) {
                $modelRank = D('Userrank');
                $rank = $modelRank->find($profit_min_rank_id);
                $userRank = $modelRank->find($fuser['rank_id']);
                if ($rank) {
                    if ($userRank && $userRank['prestige'] >= $rank['prestige']) {
                        $flag = true;
                    } else {
                        $flag = false;
                    }
                } else {
                    $flag = false;
                }
            } else {
                $flag = true;
            }
            if (!$flag) {
                $this->error('对不起您必须达到' . $rank['rank_name'] . '及以上等级才有分销权限');
            }
        }
    }
    public function index(){
        if (empty($this->uid)) {
            header("Location: " . U('Wap/passport/login'));
            die;
        }
		
		$wx_back_url = 'http://www.blklube.com/user/distrbution/index';
		cookie('wx_back_url', $wx_back_url);
		cookie('back_url', $wx_back_url);
		session('backurl', 'http://www.blklube.com/user/distrbution/index');
		
		$User = D('Users');
		
		//累计分享补贴	XX元
		$profit_ok = 0.00;
		$profit_ok = D('Userprofitlogs')->where(array('user_id' => $this->uid,'is_separate' =>1))->sum('money');
		$this->assign('profit_ok', $profit_ok);
		
		//可提现补贴	XX元
		$fxbt_ktxbt_money = 0.00;
		$fxbt_ktxbt_money = $MEMBER['fxbt_ktxbt_money'];
		$this->assign('fxbt_ktxbt_money', $fxbt_ktxbt_money);
		
		//未结算补贴	XX元
		$profit_wjsbt = 0.00;
		$profit_wjsbt = D('Userprofitlogs')->where(array('user_id' => $this->uid,'is_separate' =>0))->sum('money');
		$this->assign('profit_wjsbt', $profit_wjsbt);
		
		//$this->assign('profit_cancel',$profit_cancel = D('Userprofitlogs')->where(array('user_id' => $this->uid,'is_separate' =>2))->sum('money')); //已取消补贴
		
		//分享数据  	XX个
		$fxbt_fxsj = 0;
		//个人数据
		$tmpLevel1 = $User->where(" fuid1 = '".$this->uid."' ")->count(); 
		if ( (int)$tmpLevel1 <> (int)$MEMBER['gerenshuju'] ) {
			D('Users')->save(array('user_id' => $this->uid, 'gerenshuju' => $gerenshuju_count));
		} 
		$MEMBER['gerenshuju'] = (int)$tmpLevel1;
		//个人数据
		$fxbt_fxsj = $MEMBER['gerenshuju']; //实际上为 个人数据
		$this->assign('fxbt_fxsj',$fxbt_fxsj);
		
		//裂变数据	XX个
		$fxbt_lbsj = 0;
		$tmpLevel1 =  0;
		$tmpLevel1 = $User->where(" fuid1 = '".$this->uid."' ")->count(); 
		$tmpLevel2 =  0;
		$tmpLevel2 = $User->where(" fuid2 = '".$this->uid."' ")->count();
		$tmpLevel3 =  0;
 		$tmpLevel3 = $User->where(" fuid3 = '".$this->uid."' ")->count();
		
		$fxbt_lbsj = (int)$tmpLevel1+(int)$tmpLevel2+(int)$tmpLevel3; //统计一级、二级、三级裂变数据量
		$this->assign('fxbt_lbsj',$fxbt_lbsj);
		
		//数据总量	XX个
		$fxbt_sjzl = 0;
		$tuanduishuju_count = M('Users')->where(" shangxianjihe LIKE '%,".$this->uid.",%' ")->count(); 
		if ( (int)$tuanduishuju_count <> (int)$MEMBER['tuanduishuju'] ) {
			D('Users')->save(array('user_id' => $this->uid, 'tuanduishuju' => $tuanduishuju_count));
		} 
		$MEMBER['tuanduishuju'] = (int)$tuanduishuju_count;
		$fxbt_sjzl = $MEMBER['tuanduishuju']; //实际上为 团队数据
		$this->assign('fxbt_sjzl',$fxbt_sjzl);
		
			
		//累计链店补贴	XX元
		$ldbt_ljldbt = 0.00; 
		$ldbt_ljldbt = D('Userldbtlogs')->where(array('user_id' => $this->uid,'is_separate' =>1))->sum('money');
		$this->assign('ldbt_ljldbt',$ldbt_ljldbt);
		
		//链店补贴可提现补贴	XX元
		$ldbt_ktxbt_money = 0.00;
		$ldbt_ktxbt_money = $MEMBER['ldbt_ktxbt_money'];
		$this->assign('ldbt_ktxbt_money',$ldbt_ktxbt_money);
		
		//未结算补贴	XX元
		$ldbt_wjsbt = 0.00;
		$ldbt_wjsbt = D('Userldbtlogs')->where(array('user_id' => $this->uid,'is_separate' =>0))->sum('money');
		$this->assign('ldbt_wjsbt',$ldbt_wjsbt);
		
		//链店数量	XX个
		$fxbt_ldsl = 0;
		$fxbt_ldsl = D('Shop')->where(" tui_uid = '".$this->uid."' and audit = 1  ")->count();
		$this->assign('fxbt_ldsl',$fxbt_ldsl);
		

		
		
			

		//股东差旅补贴 上月差旅补贴	XX元
		$gdclbt_syclbt = 0.00;
		$gdclbt_syclbt = $this->gdclbt(1);
		$this->assign('gdclbt_syclbt',$gdclbt_syclbt);
		
		//股东差旅补贴 本月差旅补贴	XX元
		$gdclbt_byclbt = 0.00;
		$gdclbt_byclbt = $this->gdclbt(2);
		$this->assign('gdclbt_byclbt',$gdclbt_byclbt);
	
		//股东差旅补贴 累计差旅补贴	XX元
		$gdclbt_ljclbt = 0.00;
		$gdclbt_ljclbt = $this->gdclbt(0);
		$this->assign('gdclbt_ljclbt',$gdclbt_ljclbt);
		
		//股东分红奖金 累计分红奖金	XX元
		$gdfh_ljfh = 0.00;
		//$gdfh_ljfh = $profit_ok + $ldbt_ljldbt + $gdclbt_ljclbt ;//累计分享补贴 + 累计链店补贴 + 
		$gdfh_ljfh = $gdclbt_ljclbt ;//累计分享补贴 + 累计链店补贴 + 
		$this->assign('gdfh_ljfh',$gdfh_ljfh);
		
		//股东分红奖金 本月分红奖金	XX元
		$gdfh_byfh = 0.00;
		$gdfh_byfh = $gdclbt_byclbt;
		$this->assign('gdfh_byfh',$gdfh_byfh);
		
		/*开始*/
		$dqy = date("Y-m",NOW_TIME);
		$s_bg_time = strtotime("-1 month", strtotime($dqy) );//上月1号时间戳
		$s_end_time = strtotime($dqy);//本月1号时间戳
		$b_bg_time = strtotime($dqy);//本月1号时间戳
		$b_end_time = strtotime("+1 month", strtotime($dqy) );//下月1号时间戳
		/*结束*/
		
		//股东分红奖金 上月收入（分红奖金外）	XX元
		$gdfh_sysr = 0.00;
		
		$this->assign('gdfh_sysr',$gdfh_sysr);
		
		//股东分红奖金 本月收入（分红奖金外）	XX元
		$gdfh_bysr = 0.00;
		
		$this->assign('gdfh_bysr',$gdfh_bysr);
		
		
		
		
		
		$this->assign('gdclbt_ljclbt',$gdclbt_ljclbt);
		
		$this->display();
		
		
    }
	
	public function gdclbt($mytype) { 
	
		$Paymentlogs = D('Paymentlogs');
		$Userydbfclbtlogs = D('Userydbfclbtlogs');
		$wheres = array();
		$wheres['is_paid'] = array('eq',1);
		$dqy = date("Y-m",NOW_TIME);
		$wheres['user_id'] = array('eq', $this->uid);
		
		switch ($mytype) { 
			case 1 ://上月差旅补贴
					$bg_time = strtotime("-1 month", strtotime($dqy) );//上月1号时间戳
					$end_time = strtotime($dqy);//本月1号时间戳
					$tianshu = (int)date("t",strtotime(date("Y-m",$bg_time)));
				break;
			case 2 ://本月差旅补贴
					$bg_time = strtotime($dqy);//本月1号时间戳
					$end_time = strtotime("+1 month", strtotime($dqy) );//下月1号时间戳
					$tianshu = (int)date("t",strtotime(date("Y-m",$bg_time)));
				break;
			case 0 ://累计差旅补贴
				$bg_time = 0;
				$end_time = 0;
				$gdclbt = $Userydbfclbtlogs->where($wheres)->sum('money');
				return $gdclbt; 
				break;
		}
		
		
		if ( ( (int)$bg_time > 0) && ( (int)$end_time > 0) ) {
            $wheres['pay_time'] = array(array('LT', $end_time), array('EGT', $bg_time));
        } 
		$yuedu = 0;
		$yuedu = $Paymentlogs->where($wheres)->sum('need_pay')+0;
		$myusers = D('Users')->find($this->uid);
		if ( (int)$myusers['rank_id'] > 0 ) {
			$userrank = D('Userrank')->find($myusers['rank_id']);
		}
		$rijun = 0;
		$rijun  =  $yuedu/(int)$tianshu;
		if ( (int)$myusers['rank_id'] > 5 ) { 
			if ( round($rijun/100,2) >= round($userrank['yuedubangfuchalv'],2) ) {
				$shifoudabiao = '达标';
				$ydbfclbt_money = $userrank['yuedubangfuchalv'];
				$is_separate = 1 ;
			} else {
				$shifoudabiao = '未达标';
				$ydbfclbt_money = '0';
				$is_separate = 0 ;
			}
		} else {
			$shifoudabiao = '等级未达标';	
			$ydbfclbt_money = '0';
			$is_separate = 0 ;
		}
		
		$whereB['user_id'] = array('eq', $this->uid);
		$whereB['bg_time'] = array('eq', $bg_time);	
		$infos = $Userydbfclbtlogs->where($whereB)->find();
		$mynum1 = count($infos);
//		if ( (int)$mynum1 == 0 )  {
//			$Userydbfclbtlogs->add(array('user_id' => $this->uid, 'money' => $ydbfclbt_money*100, 'intro' => "月度帮扶差旅补贴",  'shifoudabiao' => $shifoudabiao, 'create_time' => NOW_TIME, 'yuedu' => $yuedu, 'rijun' => $rijun, 'tianshu' => $tianshu, 'bg_time' => $bg_time, 'end_time' => $end_time, 'is_separate' => $is_separate ));
//		} else {
//			$Userydbfclbtlogs->save(array('log_id' => $infos['log_id'], 'money' => $ydbfclbt_money*100,   'shifoudabiao' => $shifoudabiao, 'edit_time' => NOW_TIME, 'yuedu' => $yuedu, 'rijun' => $rijun, 'tianshu' => $tianshu, 'bg_time' => $bg_time, 'end_time' => $end_time, 'is_separate' => $is_separate ));
//		}
		$whereC['user_id'] = array('eq', $this->uid);
		$whereC['ydbfclbt_id'] = array('eq', $infos['log_id']);	
		$mynum2 = D('Usermoneylogs')->where($whereC)->count();
		if ( $mynum2 == 0  ) {  
			if ( ( $is_separate == 1 ) && ( $ydbfclbt_money*100 > 0 ) && ( NOW_TIME > $end_time ) )  {
					if (!($detail = D('Users')->find($this->uid))) {
						D('Users')->save(array('user_id' => $this->uid, 'money' => $ydbfclbt_money*100 + $detail['money']));
						$rank_id = D('Users')->where('user_id='.$this->uid)->getField('rank_id');
		                $rankname = D('Userrank')->where('rank_id='.$rank_id)->getField('rank_name');
						D('Usermoneylogs')->add(array('user_id' => $this->uid, 'money' => $ydbfclbt_money*100, 'intro' => "月度帮扶差旅补贴", 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(),'ydbfclbt_id' => $infos['log_id'],'rankname' => $rankname));
					}
			}
		}

        if ( ( $mytype == 1) or ( $mytype == 2 ) ) {
		    $whereC['bg_time'] = array('eq', $bg_time);	
			$gdclbt = $Userydbfclbtlogs->where($whereC)->getfield('money');
			return $gdclbt; 		
		}
		
		
		
	}	
	
	
	public function liandian(){
		$list = D('Shop') -> where(array('user_id' => $this->uid,'closed' => 0,'audit' => 1)) -> select();
		$this->assign('list', $list);
        $this->mobile_title = '链店列表';
		$this->display(); // 输出模板		
    }
	
    public function profit(){
		$status = (int) $this->_param('status');
		$this->assign('status', $status);
		$this->assign('nextpage', LinkTo('distribution/profitloaddata',array('status'=>$status,'t' => NOW_TIME, 'p' => '0000')));
        $this->mobile_title = '门店付款';
		$this->display(); // 输出模板		
    }
	public function profitloaddata(){
        $status = (int) $this->_param('status');
        if (!in_array($status, array(0, 1, 2, 3))) {
            $status = 1;
        }
        $model = D('Userprofitlogs');
        import('ORG.Util.Page');
        $map = array('user_id' => $this->uid, 'is_separate' => $status);
        $count = $model->where($map)->count();
        $Page = new Page($count, 2000);
        $show = $Page->show();
        $var = 'p';
		$p = $_GET[$var];
		if ($Page->totalPages < $p) {
			die('0');
		}
        $orderby = array('log_id' => 'DESC');
        $list = $model->where($map)->order($orderby)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->assign('status', $status);
		$this->display();
		
	}
	
    public function subordinate(){
		$level = (int) $this->_param('level');
		$this->assign('level', $level);
		$this->assign('nextpage', LinkTo('distribution/subordinateloaddata',array('level'=>$level,'t' => NOW_TIME, 'p' => '0000')));
        $this->mobile_title = '裂变数据（我的团队）';
		$this->display(); // 输出模板		
    }

    public function fxsubordinate(){
		$level = (int) $this->_param('level');
		$this->assign('level', $level);
		$this->assign('nextpage', LinkTo('distribution/subordinateloaddata',array('level'=>$level,'t' => NOW_TIME, 'p' => '0000')));
        $this->mobile_title = '分享数据（我的一级）';
		$this->display(); // 输出模板		
    }


	
	public function subordinateloaddata(){
		$level = (int) $this->_param('level');
        if (!in_array($level, array(1, 2, 3))) {
            $level = 1;
        }
        $user = D('Users');
        import('ORG.Util.Page');
        $map = array('closed' => 0, 'fuid' . $level => $this->uid);
        $count = $user->where($map)->count();
        $Page = new Page($count, 2000);
        $show = $Page->show();
        $var =  'p';
        $p = $_GET[$var];
        $orderby = array('user_id' => 'DESC');
		
		
        $list = $user->where($map)->order($orderby)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->assign('level', $level);
        $this->display();
		 
	}
    public function qrcode(){
        $token = 'fuid_' . $this->uid;
        $url = U('Wap/passport/register', array('fuid' => $this->uid));
        $file = baoQrCode($token, $url);
        $this->assign('file', $file);
        $this->display();
    }
    public function poster()
    {
        $token = 'fuid_' . $this->uid;
        $url = U('Wap/passport/register', array('fuid' => $this->uid));
        $file = baoQrCode($token, $url);
        $this->assign('file', $file);
        $this->display();
    }
    public function superior()
    {
        $user = D('Users');
        if ($this->member['fuid1']) {
            $fuser = $user->find($this->member['fuid1']);
        }
        $this->assign('fuser', $fuser);
        $this->display();
    }
}