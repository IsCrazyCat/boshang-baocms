<?php
class UsercashAction extends CommonAction{
    public function index(){
        $Userscash = D('Userscash');
        import('ORG.Util.Page');
        $map = array('type' => user);
		
		if (($bg_date = $this->_param('bg_date', 'htmlspecialchars')) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date) + 86400;
            $map['addtime'] = array(array('ELT', $end_time), array('EGT', $bg_time));
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
        } else {
            if ($bg_date = $this->_param('bg_date', 'htmlspecialchars')) {
                $bg_time = strtotime($bg_date);
                $this->assign('bg_date', $bg_date);
                $map['addtime'] = array('EGT', $bg_time);
            }
            if ($end_date = $this->_param('end_date', 'htmlspecialchars')) {
                $end_time = strtotime($end_date) + 86400;
                $this->assign('end_date', $end_date);
                $map['addtime'] = array('ELT', $end_time);
            }
        }
        
        if ($shop_id = (int) $this->_param('shop_id')) {
				$map['shop_id'] = $shop_id;
				$shop = D('Shop')->find($shop_id);
				$this->assign('shop_name', $shop['shop_name']);
				$this->assign('shop_id', $shop_id);
        }
        if ($account = $this->_param('account', 'htmlspecialchars')) {
            $map['account'] = array('LIKE', '%' . $account . '%');
            $this->assign('account', $account);
        }
		
        $count = $Userscash->where($map)->count();
        $Page = new Page($count, 25);
        $show = $Page->show();
        $list = $Userscash->where($map)->order(array('cash_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $ids = array();
        foreach ($list as $row) {
            $ids[] = $row['user_id'];
        }
        $Usersex = D('Usersex');
        $map = array();
        $map['user_id'] = array('in', $ids);
        $ex = $Usersex->where($map)->select();
        $tmp = array();
        foreach ($ex as $row) {
            $tmp[$row['user_id']] = $row;
        }
        foreach ($list as $key => $row) {
            $list[$key]['bank_name'] = empty($list[$key]['bank_name']) ? $tmp[$row['user_id']]['bank_name'] : $list[$key]['bank_name'];
            $list[$key]['bank_num'] = empty($list[$key]['bank_num']) ? $tmp[$row['user_id']]['bank_num'] : $list[$key]['bank_num'];
            $list[$key]['bank_branch'] = empty($list[$key]['bank_branch']) ? $tmp[$row['user_id']]['bank_branch'] : $list[$key]['bank_branch'];
            $list[$key]['bank_realname'] = empty($list[$key]['bank_realname']) ? $tmp[$row['user_id']]['bank_realname'] : $list[$key]['bank_realname'];
        }
		$this->assign('user_cash', round($user_cash = $Userscash->where(array('type' => user,'status' =>1))->sum('money')/100,2));
		$this->assign('user_cash_commission', round($user_cash_commission = $Userscash->where(array('type' => user,'status' =>1))->sum('commission')/100,2));
        $this->assign('list', $list);
        $this->assign('page', $show);
		
				
	// 上上个月
    $begin_time_2 =  strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,date("m")-2,1,date("Y"))))+0;
    $end_time_2 =  strtotime(date("Y-m-d H:i:s",mktime(23,59,59,date("m")-1 ,0,date("Y"))))+0;
		$ssysr = $Userscash->where(" `type` = 'user' and addtime >= '{$begin_time_2}' and  addtime <= '{$end_time_2}'   ")->sum('gold');  
		$this->assign('ssysr', $ssysr);
		$this->assign('ssy', date("m")-2);
		
	// 上个月的起始时间:
    $begin_time_1 = strtotime(date('Y-m-01 00:00:00',strtotime('-1 month')))+0;
    $end_time_1 = strtotime(date("Y-m-d 23:59:59", strtotime(-date('d').'day')))+0;
		$sysr = $Userscash->where(" `type` = 'user' and addtime >= '{$begin_time_1}' and  addtime <= '{$end_time_1}'   ")->sum('gold');  
		$this->assign('sysr', $sysr);
		$this->assign('sy', date("m")-1);
    //本月起始时间:	
		$begin_time_0 = strtotime(date ( "Y-m-d H:i:s", mktime ( 0, 0, 0, date ( "m" ), 1, date ( "Y" ) ) ))+0;
		$end_time_0 = strtotime(date ( "Y-m-d H:i:s", mktime ( 23, 59, 59, date ( "m" ), date ( "t" ), date ( "Y" ) ) ))+0;
		$bysr = $Userscash->where(" `type` = 'user' and addtime >= '{$begin_time_0}' and  addtime <= '{$end_time_0}'   ")->sum('gold');  
		$this->assign('bysr', $bysr);
		$this->assign('by', date("m"));
				
				
		$cxze = $Userscash->where($map)->sum('gold');  
		$this->assign('cxze', $cxze);	
		
		
		
        $this->display();
    }
	
    public function gold(){
        $Userscash = D('Userscash');
        import('ORG.Util.Page');
        $map = array('type' => shop);
		
		if (($bg_date = $this->_param('bg_date', 'htmlspecialchars')) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date) + 86400;
            $map['addtime'] = array(array('ELT', $end_time), array('EGT', $bg_time));
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
        } else {
            if ($bg_date = $this->_param('bg_date', 'htmlspecialchars')) {
                $bg_time = strtotime($bg_date);
                $this->assign('bg_date', $bg_date);
                $map['addtime'] = array('EGT', $bg_time);
            }
            if ($end_date = $this->_param('end_date', 'htmlspecialchars')) {
                $end_time = strtotime($end_date) + 86400;
                $this->assign('end_date', $end_date);
                $map['addtime'] = array('ELT', $end_time);
            }
        }
        
        if ($shop_id = (int) $this->_param('shop_id')) {
			
				$map['shop_id'] = $shop_id;
				$shop = D('Shop')->find($shop_id);
				$this->assign('shop_name', $shop['shop_name']);
				$this->assign('shop_id', $shop_id);
			
        }
		
		
        if ($account = $this->_param('account', 'htmlspecialchars')) {
            $map['account'] = array('LIKE', '%' . $account . '%');
            $this->assign('account', $account);
        }
        $count = $Userscash->where($map)->count();
        $Page = new Page($count, 25);
        $show = $Page->show();
        $list = $Userscash->where($map)->order(array('cash_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $ids = array();
        foreach ($list as $row) {
            $ids[] = $row['user_id'];
        }
        $Usersex = D('Usersex');
        $map = array();
		
		
				
		
        $map['user_id'] = array('in', $ids);
        $ex = $Usersex->where($map)->select();
        $tmp = array();
        foreach ($ex as $row) {
            $tmp[$row['user_id']] = $row;
        }
        foreach ($list as $key => $row) {
            $list[$key]['bank_name'] = empty($list[$key]['bank_name']) ? $tmp[$row['user_id']]['bank_name'] : $list[$key]['bank_name'];
            $list[$key]['bank_num'] = empty($list[$key]['bank_num']) ? $tmp[$row['user_id']]['bank_num'] : $list[$key]['bank_num'];
            $list[$key]['bank_branch'] = empty($list[$key]['bank_branch']) ? $tmp[$row['user_id']]['bank_branch'] : $list[$key]['bank_branch'];
            $list[$key]['bank_realname'] = empty($list[$key]['bank_realname']) ? $tmp[$row['user_id']]['bank_realname'] : $list[$key]['bank_realname'];
        }
		$this->assign('shop_cash', round($shop_cash = $Userscash->where(array('type' => shop,'status' =>1))->sum('gold')/100,2));
		$this->assign('shop_cash_commission', round($shop_cash_commission = $Userscash->where(array('type' => shop,'status' =>1))->sum('commission')/100,2));
        $this->assign('list', $list);
        $this->assign('page', $show);
		
		
// 上上个月
    $begin_time_2 =  strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,date("m")-2,1,date("Y"))))+0;
    $end_time_2 =  strtotime(date("Y-m-d H:i:s",mktime(23,59,59,date("m")-1 ,0,date("Y"))))+0;
		$ssysr = $Userscash->where(" `type` = 'shop' and addtime >= '{$begin_time_2}' and  addtime <= '{$end_time_2}'   ")->sum('gold');  
		$this->assign('ssysr', $ssysr);
		$this->assign('ssy', date("m")-2);
		
	// 上个月的起始时间:
    $begin_time_1 = strtotime(date('Y-m-01 00:00:00',strtotime('-1 month')))+0;
    $end_time_1 = strtotime(date("Y-m-d 23:59:59", strtotime(-date('d').'day')))+0;
		$sysr = $Userscash->where(" `type` = 'shop' and addtime >= '{$begin_time_1}' and  addtime <= '{$end_time_1}'   ")->sum('gold');  
		$this->assign('sysr', $sysr);
		$this->assign('sy', date("m")-1);
		
    //本月起始时间:	
		$begin_time_0 = strtotime(date ( "Y-m-d H:i:s", mktime ( 0, 0, 0, date ( "m" ), 1, date ( "Y" ) ) ))+0;
		$end_time_0 = strtotime(date ( "Y-m-d H:i:s", mktime ( 23, 59, 59, date ( "m" ), date ( "t" ), date ( "Y" ) ) ))+0;
		$bysr = $Userscash->where(" `type` = 'shop' and addtime >= '{$begin_time_0}' and  addtime <= '{$end_time_0}'   ")->sum('gold');  
		$this->assign('bysr', $bysr);
		$this->assign('by', date("m"));
				
				
		$cxze = $Userscash->where($map)->sum('gold');  
		$this->assign('cxze', $cxze);						
		
		
        $this->display();
    }
    public function audit($cash_id = 0, $status = 0){
        if (!$status) {
            $this->baoError('参数错误');
        }
        $Userscash = D('Userscash');
        if (is_numeric($cash_id) && ($cash_id = (int) $cash_id)) {
            $data = $Userscash->find($cash_id);
            if ($data['status'] == 0) {
                $arr = array();
                $arr['cash_id'] = $cash_id;
                $arr['status'] = $status;
                $Userscash->save($arr);
                D('Weixintmpl')->weixin_cash_user($data['user_id'],2);//申请提现：1会员申请，2商家同意，3商家拒绝
                $this->baoSuccess('操作成功！', U('usercash/index'));
            } else {
                $this->baoError('请不要重复操作');
            }
        } else {
            $cash_id = $this->_post('cash_id', FALSE);
            if (!is_array($cash_id)) {
                $this->baoError('请选择要审核的提现');
            }
            foreach ($cash_id as $id) {
                $data = $Userscash->find($id);
                if ($data['status'] > 0) {
                    continue;
                }
                $arr = array();
                $arr['cash_id'] = $id;
                $arr['status'] = $status;
                $Userscash->save($arr);
                D('Weixintmpl')->weixin_cash_user($data['user_id'],2);//申请提现：1会员申请，2商家同意，3商家拒绝
            }
            $this->baoSuccess('操作成功！', U('usercash/index'));
        }
    }
    //商户提现
    public function audit_gold($cash_id = 0, $status = 0){
        if (!$status) {
            $this->baoError('参数错误');
        }
        $Userscash = D('Userscash');
        if ($cash_id = (int) $cash_id) {
            $data = $Userscash->find($cash_id);
            if ($data['status'] == 0) {
                $arr = array();
                $arr['cash_id'] = $cash_id;
                $arr['status'] = $status;
                $Userscash->save($arr);
                D('Weixintmpl')->weixin_cash_user($data['user_id'],2);//申请提现：1会员申请，2商家同意，3商家拒绝
                $this->baoSuccess('操作成功！', U('usercash/gold'));
            } else {
                $this->baoError('操作失败');
            }
        }
    }
    //拒绝用户提现
    public function jujue(){
        $status = (int) $_POST['status'];
        $cash_id = (int) $_POST['cash_id'];
        $value = $this->_param('value', 'htmlspecialchars');
        if (empty($value)) {
            $this->ajaxReturn(array('status' => 'error', 'msg' => '拒绝理由请填写'));
        }
        if (empty($cash_id) || !($detail = D('Userscash')->find($cash_id))) {
            $this->ajaxReturn(array('status' => 'error', 'msg' => '参数错误'));
        }
        $money = $detail['money'] + $detail['commission'];
        if ($status == 2) {
            D('Users')->addMoney($detail['user_id'], $money, '提现拒绝，退款');
            D('Userscash')->save(array('cash_id' => $cash_id, 'status' => $status, 'reason' => $value));
            D('Weixintmpl')->weixin_cash_user($detail['user_id'],3);//申请提现：1会员申请，2商家同意，3商家拒绝
            $this->ajaxReturn(array('status' => 'success', 'msg' => '拒绝退款操作成功', 'url' => U('usercash/index')));
        }
    }
    //拒绝商家提现
    public function jujue_gold(){
        $status = (int) $_POST['status'];
        $cash_id = (int) $_POST['cash_id'];
        $value = $this->_param('value', 'htmlspecialchars');
        if (empty($value)) {
            $this->ajaxReturn(array('status' => 'error', 'msg' => '拒绝理由请填写'));
        }
        if (empty($cash_id) || !($detail = D('Userscash')->find($cash_id))) {
            $this->ajaxReturn(array('status' => 'error', 'msg' => '参数错误'));
        }
        $money = $detail['gold'] + $detail['commission'];;
        if ($status == 2) {
			//D('Users')->addGold($detail['user_id'], $detail['gold'] + $detail['commission'], '提现ID【'.$cash_id.'】商家申请提现拒绝退款，理由【'.$value.'】');
            D('Users')->Money($detail['user_id'], $money, '提现拒绝，退款');
            D('Userscash')->save(array('cash_id' => $cash_id, 'status' => $status, 'reason' => $value));
            D('Weixintmpl')->weixin_cash_user($detail['user_id'],3);//申请提现：1会员申请，2商家同意，3商家拒绝
            $this->ajaxReturn(array('status' => 'success', 'msg' => '拒绝退款操作成功', 'url' => U('usercash/gold')));
        }
    }
   
}