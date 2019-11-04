<?php
class ShopmoneyAction extends CommonAction{
    public function myindex(){
        $Userptgoldlogs = D('Userptgoldlogs');
		
	// 上上个月
    $begin_time_2 =  strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,date("m")-2,1,date("Y"))))+0;
    $end_time_2 =  strtotime(date("Y-m-d H:i:s",mktime(23,59,59,date("m")-1 ,0,date("Y"))))+0;
		$wherea['create_time'] = array(array('ELT', $begin_time_2), array('EGT', $end_time_2));
		$ssysr = $Userptgoldlogs->where(" create_time >= '{$begin_time_2}' and  create_time <= '{$end_time_2}'   ")->sum('money');  
		$ssysr_g = $Userptgoldlogs->where(" create_time >= '{$begin_time_2}' and  create_time <= '{$end_time_2}'   ")->sum('gold');  
		$this->assign('ssysr', $ssysr);
		$this->assign('ssysr_g', $ssysr_g);
		$this->assign('ssy', date("m")-2);
		
	// 上个月的起始时间:
    $begin_time_1 = strtotime(date('Y-m-01 00:00:00',strtotime('-1 month')))+0;
    $end_time_1 = strtotime(date("Y-m-d 23:59:59", strtotime(-date('d').'day')))+0;
		$whereb['create_time'] = array(array('ELT', $begin_time_1), array('EGT', $end_time_1));
		$sysr = $Userptgoldlogs->where(" create_time >= '{$begin_time_1}' and  create_time <= '{$end_time_1}'   ")->sum('money');  
		$sysr_g = $Userptgoldlogs->where(" create_time >= '{$begin_time_1}' and  create_time <= '{$end_time_1}'   ")->sum('gold');  
		$this->assign('sysr', $sysr);
		$this->assign('sysr_g', $sysr_g);
		$this->assign('sy', date("m")-1);
		
    //本月起始时间:	
	$begin_time_0 = strtotime(date ( "Y-m-d H:i:s", mktime ( 0, 0, 0, date ( "m" ), 1, date ( "Y" ) ) ))+0;
    $end_time_0 = strtotime(date ( "Y-m-d H:i:s", mktime ( 23, 59, 59, date ( "m" ), date ( "t" ), date ( "Y" ) ) ))+0;
		$wherec['create_time'] = array(array('ELT', $begin_time_0), array('EGT', $end_time_0));
		$bysr = $Userptgoldlogs->where(" create_time >= '{$begin_time_0}' and  create_time <= '{$end_time_0}'   ")->sum('money');  
		$bysr_g = $Userptgoldlogs->where(" create_time >= '{$begin_time_0}' and  create_time <= '{$end_time_0}'   ")->sum('gold');  
		$this->assign('bysr', $bysr);
		$this->assign('bysr_g', $bysr_g);
		$this->assign('by', date("m"));
				
		
		
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
		
    
		
        $map = array();
        if (($bg_date = $this->_param('bg_date', 'htmlspecialchars')) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date) + 86400;
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
                $end_time = strtotime($end_date) + 86400;
                $this->assign('end_date', $end_date);
                $map['create_time'] = array('ELT', $end_time);
            }
        }
		
		if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['order_id'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }

        
        if ($shop_id = (int) $this->_param('shop_id')) {
            $map['shop_id'] = $shop_id;
            $shop = D('Shop')->find($shop_id);
            $this->assign('shop_name', $shop['shop_name']);
            $this->assign('shop_id', $shop_id);
        }
		
		if ($user_id = (int) $this->_param('user_id')) {
            $map['user_id'] = $user_id;
            $Users = D('Users')->find($user_id);
            $this->assign('nickname', $Users['nickname']);
            $this->assign('user_id', $user_id);
        }
        $count = $Userptgoldlogs->where($map)->count();
        $Page = new Page($count, 20);
        $show = $Page->show();
        $list = $Userptgoldlogs->where($map)->order(array('log_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $shop_ids = array();
		$user0_ids = array();
		$user1_ids = array();
		$user2_ids = array();
		$user3_ids = array();
		$userL_ids = array();
        foreach ($list as $val) {
            $shop_ids[$val['shop_id']] = $val['shop_id'];
			$user0_ids[$val['user_id']] = $val['user_id'];
			if ( $val['yj_user_id'] ) {  
 				$user1_ids[$val['yj_user_id']] = $val['yj_user_id'];
			}
			if ( $val['ej_user_id'] ) {  
				$user2_ids[$val['ej_user_id']] = $val['ej_user_id'];
			}
			if ( $val['sj_user_id'] ) {  
				$user3_ids[$val['sj_user_id']] = $val['sj_user_id'];
			}
			if ( $val['tjr_user_id'] ) {  
				$userL_ids[$val['tjr_user_id']] = $val['tjr_user_id'];
			}
       }
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
		$this->assign('users0', D('users')->itemsByIds($user0_ids));
		$this->assign('users1', D('users')->itemsByIds($user1_ids));
		$this->assign('users2', D('users')->itemsByIds($user2_ids));
		$this->assign('users3', D('users')->itemsByIds($user3_ids));
		$this->assign('usersL', D('users')->itemsByIds($userL_ids));
        $this->assign('list', $list);
        $this->assign('page', $show);
		
		$cxze = $Userptgoldlogs->where($map)->sum('money');  
		$this->assign('cxze', $cxze);
		
		$cxze_g = $Userptgoldlogs->where($map)->sum('gold');  
		$this->assign('cxze_g', $cxze_g);
		
        $this->display();
    }
	
	public function index(){
        $Shopmoney = D('Shopmoney');
		
	// 上上个月
    $begin_time_2 =  strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,date("m")-2,1,date("Y"))))+0;
    $end_time_2 =  strtotime(date("Y-m-d H:i:s",mktime(23,59,59,date("m")-1 ,0,date("Y"))))+0;
		$wherea['create_time'] = array(array('ELT', $begin_time_2), array('EGT', $end_time_2));
		$ssysr = $Shopmoney->where(" create_time >= '{$begin_time_2}' and  create_time <= '{$end_time_2}'   ")->sum('money');  
		$this->assign('ssysr', $ssysr);
		$this->assign('ssy', date("m")-2);
		
	// 上个月的起始时间:
    $begin_time_1 = strtotime(date('Y-m-01 00:00:00',strtotime('-1 month')))+0;
    $end_time_1 = strtotime(date("Y-m-d 23:59:59", strtotime(-date('d').'day')))+0;
		$whereb['create_time'] = array(array('ELT', $begin_time_1), array('EGT', $end_time_1));
		$sysr = $Shopmoney->where(" create_time >= '{$begin_time_1}' and  create_time <= '{$end_time_1}'   ")->sum('money');  
		$this->assign('sysr', $sysr);
		$this->assign('sy', date("m")-1);
		
    //本月起始时间:	
	$begin_time_0 = strtotime(date ( "Y-m-d H:i:s", mktime ( 0, 0, 0, date ( "m" ), 1, date ( "Y" ) ) ))+0;
    $end_time_0 = strtotime(date ( "Y-m-d H:i:s", mktime ( 23, 59, 59, date ( "m" ), date ( "t" ), date ( "Y" ) ) ))+0;
		$wherec['create_time'] = array(array('ELT', $begin_time_0), array('EGT', $end_time_0));
		$bysr = $Shopmoney->where(" create_time >= '{$begin_time_0}' and  create_time <= '{$end_time_0}'   ")->sum('money');  
		$this->assign('bysr', $bysr);
		$this->assign('by', date("m"));
				
		
		
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
		
    
		
        $map = array();
        if (($bg_date = $this->_param('bg_date', 'htmlspecialchars')) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date) + 86400;
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
                $end_time = strtotime($end_date) + 86400;
                $this->assign('end_date', $end_date);
                $map['create_time'] = array('ELT', $end_time);
            }
        }
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['order_id'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        if ($shop_id = (int) $this->_param('shop_id')) {
            $map['shop_id'] = $shop_id;
            $shop = D('Shop')->find($shop_id);
            $this->assign('shop_name', $shop['shop_name']);
            $this->assign('shop_id', $shop_id);
        }
        $count = $Shopmoney->where($map)->count();
        $Page = new Page($count, 20);
        $show = $Page->show();
        $list = $Shopmoney->where($map)->order(array('money_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $shop_ids = array();
        foreach ($list as $val) {
            $shop_ids[$val['shop_id']] = $val['shop_id'];
        }
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('list', $list);
        $this->assign('page', $show);
		
		$cxze = $Shopmoney->where($map)->sum('money');  
		$this->assign('cxze', $cxze);
		
		
        $this->display();
    }
	
	
    public function tjmonth(){
        $Shopmoney = D('Shopmoney');
        import('ORG.Util.Page');
        if ($month = $this->_param('month', 'htmlspecialchars')) {
            $this->assign('month', $month);
        }
        if ($shop_id = (int) $this->_param('shop_id')) {
            $map['shop_id'] = $shop_id;
            $shop = D('Shop')->find($shop_id);
            $this->assign('shop_name', $shop['shop_name']);
            $this->assign('shop_id', $shop_id);
        }
        $count = $Shopmoney->tjmonthCount($month, $shop_id);
        $Page = new Page($count, 15);
        $show = $Page->show();
        $list = $Shopmoney->tjmonth($month, $shop_id, $Page->firstRow, $Page->listRows);
        $shop_ids = array();
        foreach ($list as $val) {
            $shop_ids[$val['shop_id']] = $val['shop_id'];
        }
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
    public function tjyear(){
        $Shopmoney = D('Shopmoney');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        if ($year = $this->_param('year', 'htmlspecialchars')) {
            $this->assign('year', $year);
        }
        if ($shop_id = (int) $this->_param('shop_id')) {
            $map['shop_id'] = $shop_id;
            $shop = D('Shop')->find($shop_id);
            $this->assign('shop_name', $shop['shop_name']);
            $this->assign('shop_id', $shop_id);
        }
        $count = $Shopmoney->tjyearCount($year, $shop_id);
        $Page = new Page($count, 15);
        $show = $Page->show();
        $list = $Shopmoney->tjyear($year, $shop_id, $Page->firstRow, $Page->listRows);
        $shop_ids = array();
        foreach ($list as $val) {
            $shop_ids[$val['shop_id']] = $val['shop_id'];
        }
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
    public function tjday(){
        $Shopmoney = D('Shopmoney');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        if ($day = $this->_param('day', 'htmlspecialchars')) {
            $this->assign('day', $day);
        }
        if ($shop_id = (int) $this->_param('shop_id')) {
            $map['shop_id'] = $shop_id;
            $shop = D('Shop')->find($shop_id);
            $this->assign('shop_name', $shop['shop_name']);
            $this->assign('shop_id', $shop_id);
        }
        $count = $Shopmoney->tjdayCount($day, $shop_id);
        $Page = new Page($count, 15);
        $show = $Page->show();
        $list = $Shopmoney->tjday($day, $shop_id, $Page->firstRow, $Page->listRows);
        $shop_ids = array();
        foreach ($list as $val) {
            $shop_ids[$val['shop_id']] = $val['shop_id'];
        }
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
    public function create(){
        if ($this->isPost()) {
            $data = $this->_post('data', false);
            $add = array('create_time' => NOW_TIME, 'create_ip' => get_client_ip());
            if (!$data['shop_id']) {
                $this->baoError('请选择商家');
            }
            $add['shop_id'] = (int) $data['shop_id'];
            if (!$data['money']) {
                $this->baoError('请数据MONEY');
            }
            $add['money'] = (int) ($data['money'] * 100);
            if (!$data['type']) {
                $this->baoError('请选择类型');
            }
            $add['type'] = htmlspecialchars($data['type']);
            if (!$data['order_id']) {
                $this->baoError('请填写原始订单');
            }
            $add['order_id'] = (int) $data['order_id'];
            if (!$data['intro']) {
                $this->baoError('请填写说明');
            }
            $add['intro'] = htmlspecialchars($data['intro']);
            D('Shopmoney')->add($add);
            $shop = D('Shop')->find($add['shop_id']);
            D('Users')->addMoney($shop['user_id'], $add['money'], $add['intro']);
            $this->baoSuccess('操作成功', U('shopmoney/index'));
        } else {
            $this->display();
        }
    }
}