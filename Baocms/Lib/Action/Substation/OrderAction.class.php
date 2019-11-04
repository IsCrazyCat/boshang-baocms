<?php
class OrderAction extends CommonAction
{
    public function index()
    {
        $Order = D('Order');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        $map = array('closed' => 0);
        $keyword = $this->_param('keyword', 'htmlspecialchars');
        if ($keyword) {
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
        if ($user_id = (int) $this->_param('user_id')) {
            $users = D('Users')->find($user_id);
            $this->assign('nickname', $users['nickname']);
            $this->assign('user_id', $user_id);
            $map['user_id'] = $user_id;
        }
        if ($shop_id = (int) $this->_param('shop_id')) {
            $map['shop_id'] = $shop_id;
            $shop = D('Shop')->find($shop_id);
            $this->assign('shop_name', $shop['shop_name']);
            $this->assign('shop_id', $shop_id);
        }
        // var_dump($map);die();
        $count = $Order->where($map)->count();
        // 查询满足要求的总记录数
        $Page = new Page($count, 10);
        // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show();
        // 分页显示输出
        $list = $Order->where($map)->order(array('order_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $user_ids = $order_ids = $shop_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
            $shop_ids[$val['shop_id']] = $val['shop_id'];
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
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list);
        // 赋值数据集
        $this->assign('page', $show);
        // 赋值分页输出
        $this->display();
        // 输出模板
    }
    //等待捡货的订单
    public function wait2()
    {
        $Order = D('Order');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        $map = array('closed' => 0, 'status' => 0, 'is_daofu' => 1, 'is_shop' => 0);
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
        if ($user_id = (int) $this->_param('user_id')) {
            $users = D('Users')->find($user_id);
            $this->assign('nickname', $users['nickname']);
            $this->assign('user_id', $user_id);
            $map['user_id'] = $user_id;
        }
        if ($shop_id = (int) $this->_param('shop_id')) {
            $map['shop_id'] = $shop_id;
            $shop = D('Shop')->find($shop_id);
            $this->assign('shop_name', $shop['shop_name']);
            $this->assign('shop_id', $shop_id);
        }
        // var_dump($map);die();
        $count = $Order->where($map)->count();
        // 查询满足要求的总记录数
        $Page = new Page($count, 10);
        // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show();
        // 分页显示输出
        $list = $Order->where($map)->order(array('order_id' => 'asc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $user_ids = $order_ids = $shop_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
            $shop_ids[$val['shop_id']] = $val['shop_id'];
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
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list);
        // 赋值数据集
        $this->assign('page', $show);
        // 赋值分页输出
        $this->assign('picks', session('order'));
        $this->display();
        // 输出模板
    }
    //等待捡货的订单
    public function wait()
    {
        $Order = D('Order');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        $map = array('closed' => 0, 'status' => 1, 'is_shop' => 0);
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
        if ($user_id = (int) $this->_param('user_id')) {
            $users = D('Users')->find($user_id);
            $this->assign('nickname', $users['nickname']);
            $this->assign('user_id', $user_id);
            $map['user_id'] = $user_id;
        }
        if ($shop_id = (int) $this->_param('shop_id')) {
            $map['shop_id'] = $shop_id;
            $shop = D('Shop')->find($shop_id);
            $this->assign('shop_name', $shop['shop_name']);
            $this->assign('shop_id', $shop_id);
        }
        // var_dump($map);die();
        $count = $Order->where($map)->count();
        // 查询满足要求的总记录数
        $Page = new Page($count, 10);
        // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show();
        // 分页显示输出
        $list = $Order->where($map)->order(array('order_id' => 'asc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $user_ids = $order_ids = $shop_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
            $shop_ids[$val['shop_id']] = $val['shop_id'];
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
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list);
        // 赋值数据集
        $this->assign('page', $show);
        // 赋值分页输出
        $this->assign('picks', session('order'));
        $this->display();
        // 输出模板
    }
    //
    public function pick()
    {
        $order_ids = session('order');
        $orders = $this->_post('order_id', false);
        foreach ($orders as $val) {
            if ($detail = D('Order')->find($val)) {
                if ($detail['status'] == 1 || $detail['staus'] == 0 && $detail['is_daofu'] == 1) {
                    $order_ids[$val] = $val;
                }
            }
        }
        session('order', $order_ids);
        if ($this->_get('wait')) {
            $this->baoSuccess('加入捡货单成功！', U('order/wait2'));
        } else {
            $this->baoSuccess('加入捡货单成功！', U('order/wait'));
        }
    }
    public function clean()
    {
        session('order', null);
        if ($this->_get('wait')) {
            $this->baoSuccess('清空捡货队列成功！', U('order/wait2'));
        } else {
            $this->baoSuccess('清空捡货队列成功！', U('order/wait'));
        }
    }
    //创建捡货单
    public function create()
    {
        $order_ids = session('order');
        $local = array();
        foreach ($order_ids as $val) {
            if ($detail = D('Order')->find($val)) {
                if ($detail['status'] == 1 || $detail['staus'] == 0 && $detail['is_daofu'] == 1) {
                    $local[$val] = $val;
                }
            }
        }
        if (empty($local)) {
            $this->baoError('请选择要加入捡货的订单！');
        }
        $data = array('admin_id' => $this->_admin['admin_id'], 'shop_id' => 0, 'create_time' => NOW_TIME, 'create_ip' => get_client_ip(), 'order_ids' => join(',', $local), 'name' => '捡货单' . date('Y-m-d H:i:s'));
        if ($pick_id = D('Orderpick')->add($data)) {
            D('Order')->save(array('status' => 2), array("where" => array('order_id' => array('IN', $local))));
            D('Ordergoods')->save(array('status' => 1), array("where" => array('order_id' => array('IN', $local))));
            session('order', null);
            $this->baoSuccess('创建捡货单成功！', U('order/pickdetail', array('pick_id' => $pick_id)));
        }
        $this->baoError('创建捡货单失败');
    }
    //
    public function picks()
    {
        $Orderpick = D('Orderpick');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        $map = array('shop_id' => 0);
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
        $keyword = $this->_param('keyword', 'htmlspecialchars');
        if ($keyword) {
            $map['name'] = array('LIKE', '%' . $keyword . '%');
        }
        $this->assign('keyword', $keyword);
        $count = $Orderpick->where($map)->count();
        // 查询满足要求的总记录数
        $Page = new Page($count, 25);
        // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show();
        // 分页显示输出
        $list = $Orderpick->where($map)->order('pick_id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('keyword', $keyword);
        $this->assign('list', $list);
        // 赋值数据集
        $this->assign('page', $show);
        // 赋值分页输出
        $this->display();
        // 输出模板
    }
    public function pickdetail($pick_id)
    {
        $pick_id = (int) $pick_id;
        $pick = D('Orderpick')->find($pick_id);
        $orderids = explode(',', $pick['order_ids']);
        $Order = D('Order');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        $map = array('order_id' => array('IN', $orderids));
        $list = $Order->where($map)->order(array('order_id' => 'asc'))->select();
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
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->display();
    }
    public function send($pick_id)
    {
        $pick_id = (int) $pick_id;
        $pick = D('Orderpick')->find($pick_id);
        $orderids = explode(',', $pick['order_ids']);
        $Order = D('Order');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        $map = array('order_id' => array('IN', $orderids));
        $list = $Order->where($map)->order(array('order_id' => 'asc'))->select();
        $user_ids = $order_ids = $shop_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
            $shop_ids[$val['shop_id']] = $val['shop_id'];
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
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list);
        $this->display();
    }
    //发货管理
    public function delivery()
    {
        $Order = D('Order');
        import('ORG.Util.Page');
        // 导入分页类    aihuaqian.boshang3710.com
        $map = array('closed' => 0, 'status' => 2);
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
        if ($user_id = (int) $this->_param('user_id')) {
            $users = D('Users')->find($user_id);
            $this->assign('nickname', $users['nickname']);
            $this->assign('user_id', $user_id);
            $map['user_id'] = $user_id;
        }
        // var_dump($map);die();
        $count = $Order->where($map)->count();
        // 查询满足要求的总记录数
        $Page = new Page($count, 10);
        // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show();
        // 分页显示输出
        $list = $Order->where($map)->order(array('order_id' => 'asc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $user_ids = $order_ids = $shop_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
            $shop_ids[$val['shop_id']] = $val['shop_id'];
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
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list);
        // 赋值数据集
        $this->assign('page', $show);
        // 赋值分页输出
        $this->assign('picks', session('order'));
        $this->display();
        // 输出模板
    }
    //发货管理
 //发货管理
    public function distribution(){
        $order_id = (int) $this->_get('order_id');
		
		$userProfitModel = D('Userprofitlogs');
		$userLdbtModel = D('Userldbtlogs');
		$userModel = D('Users');
		
		
		
        if (!empty($order_id)) {
            $order = D('Order')->find($order_id);
			
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
			if (($logs['user_id']) && ($logs['is_paid'])) {
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
						//$Goodscate = D('Goodscate')->find($gooddetail['cate_id']);
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
                    $this->baoSuccess('发货成功！', U('order/index'));
                }
            }
            $this->baoError('一键发货失败！');
        } else {
            $id = (int) $this->_get('id');
            $goods = D('Ordergoods')->find($id);
            $order = D('Order')->find($goods['order_id']);
            $userobj = D('Users');
			
			$shop_id = $order['shop_id'];
			$wherea['order_id'] = array('eq', $goods['order_id']);	
			$logs = D('Paymentlogs')->where($wherea)->find();
			$pay_id = $logs['log_id'];
			
                $taxrate = 0 ; //结算费率金额
				$result = D('Ordergoods')->where(" order_id = '".$goods['order_id']."' ")->field(" goods_id, total_price ")->select();
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
			
						
			
			
            if ($goods['status'] == 1) {
                D('Ordergoods')->save(array('status' => 8, 'id' => $id));
                if ($goods['is_daofu'] == 0) {
                    $info = '产品ID' . $goods['goods_id'];
                    $tg = $userobj->checkInvite($order['user_id'], $goods['total_price']);
                    if ($tg !== false) {
                        $userobj->addIntegral($tg['uid'], $tg['integral'], "分享获得积分！");
                    }
                    $money = $goods['total_price'];
					
					    $js_price = $goods['total_price']  - $goods['mobile_fan'];//结算价格减去模板立减
						$gooddetail = D('Goods')->find($goods['goods_id']);
						//$Goodscate = D('Goodscate')->find($gooddetail['cate_id']);
						
						
						$jiesuanfeilv = D('Goods')->where('goods_id='.$val['goods_id'])->getField('jiesuanfeilv');
						if ( floor($jiesuanfeilv) > 0 ) { 
							$taxrate_d = intval(($js_price * $jiesuanfeilv)/100);
						}
						$moneyB = $js_price - $taxrate_d;//结算价格，运费不算扣点
						
							 
								
					
					
                    if ($goods['tui_uid']) {
                        //推广员分成
//                        $gooddetail = D('Goods')->find($goods['goods_id']);
//                        if (!empty($gooddetail['commission']) && $gooddetail['commission'] < $gooddetail['mall_price'] && $gooddetail['commission'] < $goods['total_price']) {
//                            //小于的情况下才能返利不然你懂的
//                            $money -= $gooddetail['commission'];
                            $money0 = floor( $taxrate_d / 15 * 1);
							
							if ($money0 > 0) {
								$tui_uid = $goods['tui_uid'];
								$info0 =  '订单ID:' . $goods['order_id'] . ' 产品ID:' . $goods['goods_id'] . ', [链店补贴]商家推荐人返佣 ' . round($money0/100 , 2).' 元' ;
								$wheres['user_id'] = array('eq', $tui_uid);
								$wheres['order_id'] = array('eq', $goods['order_id']);	
								$wheres['order_type'] = array('eq', 1);	
								$mynum0 = $userLdbtModel->where($wheres)->count();
								if ( (int)$mynum0 == 0  ) {  
									$userModel->add_ldbt_ktxbt_money($tui_uid, $money0, $info0, $shop_id, $pay_id);
									$userModel->addldbt($tui_uid, 1, $goods['order_id'], $money0, 1, $shop_id, $pay_id);
								} else {
									$userModel->add_ldbt_ktxbt_money($tui_uid, $money0, $info0, $shop_id, $pay_id);
									$userLdbtModel->save(array('is_separate' => 1,'money' => $money0, 'edit_time' => NOW_TIME), array('where' => array('order_id' => $goods['order_id'], 'order_type' => 1, 'user_id' => $tui_uid)));
								}	
							}							 
							 
                             //D('Users')->addMoney($goods['tui_uid'], $moneyC, '推广佣金');
							 if ( round($taxrate / 100, 2) > 0 ) { 
                             	$info .= ' 扣除了推广员佣金' . round($taxrate / 100, 2).' 元';
							 }
//                        }
                    }
					
					
					
                    
					
					$my_pay_id = D('paymentlogs')->where(array('order_id' => $goods['order_id'], 'is_paid' => 1))->getField('log_id');
					$info .= ' 商城付款 门店收入 支付ID：'.$my_pay_id; 
					//给商户写入资金日志
					D('Shopmoney')->add(array(
						'shop_id' => $goods['shop_id'], 
						'money' => $moneyB, 
						'create_time' => NOW_TIME, 
						'create_ip' => get_client_ip(), 
						'type' => 'goods', 
						'order_id' => $goods['order_id'], 
						'intro' => $info,
						'pay_id' => $my_pay_id
					));
					$my_shop_user_id = D('shop')->where(array('shop_id' => $goods['shop_id']))->getField('user_id');
					if ( (int)$my_shop_user_id > 0 ) {
						//给商户写入资金
						D('Users')->myaddGold($my_shop_user_id, $moneyB, '在线购物',$goods['order_id'],$goods['shop_id'],$my_pay_id,1);
						//平台收入
						D('Users')->myaddptGold( $goods['order_id'],$goods['order_id'],$my_pay_id);
					}
					
					
					
                }
                $this->baoSuccess('发货成功！', U('order/index'));
            }
            $this->baoError('发货失败');
        }
    }
}