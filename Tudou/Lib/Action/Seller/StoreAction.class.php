 <?php
class StoreAction extends CommonAction{
    private $create_fields = array('product_name', 'desc', 'cate_id', 'photo', 'cost_price','price', 'tableware_price','is_new', 'is_hot', 'is_tuijian', 'create_time', 'create_ip');
    private $edit_fields = array('product_name', 'desc', 'cate_id', 'photo','cost_price', 'price','tableware_price', 'is_new', 'is_hot', 'is_tuijian');
	
    public function _initialize(){
        parent::_initialize();
		if(empty($this->_CONFIG['operation']['store'])){
            $this->error('菜市场功能已关闭');
            die;
        }
        $this->store = D('Store')->find($this->shop_id);
        if(empty($this->store) && ACTION_NAME != 'apply'){
            $this->error('您还没有入住菜市场频道,即将为您跳转', U('storeapply/apply'));
        }
        if($this->store['audit'] == 0){
            $this->error('您的菜市场还在审核中哦', U('storeapply/apply'));
        }
        if($this->store['audit'] == 2){
            $this->error('您的审核未通过哦', U('storeapply/apply'));
        }
        $this->assign('store', $this->store);
        $getStoreCate = D('Store')->getStoreCate();
        $this->assign('getStoreCate', $getStoreCate);
        $this->storecates = D('Storecate')->where(array('shop_id' => $this->shop_id, 'closed' => 0))->select();
        $this->assign('storecates', $this->storecates);
    }
	
    public function gears(){
        if ($this->isPost()) {
            $is_open = (int) $_POST['is_open'];
            $busihour = $_POST['busihour'];
            $tags = $_POST['tags'];
            D('Store')->save(array('shop_id' => $this->shop_id, 'is_open' => $is_open, 'busihour' => $busihour, 'tags' => $tags));
            $this->tuMsg('操作成功', U('store/index'));
        }else{
			
        }
        $this->assign('store', $this->store);
        $this->display();
    }
	
	//订单语音提示
    public function voice_alert(){
		if(IS_AJAX){
            session_start();
			if (empty($_SESSION['last_check'])){
				$_SESSION['last_check'] = time();
			}
			$condition['create_time'] = array(array('egt', $_SESSION['last_check']));      
			$condition['status'] = 1; //已付款
			$condition['shop_id'] = $this->shop_id;
			$list = D('Storeorder')->where($mapd)->select();
			if($list){
				$_SESSION['last_check'] = time();
				$this->ajaxReturn(array('status'=>'2','message'=>'有新的菜市场订单了'));
			}else{
				$this->ajaxReturn(array('status'=>'0','message'=>'没有新的订单'));
			}
        }      
    }
	
	
    public function storecate(){
        $obj = D('Storecate');
        import('ORG.Util.Page');
        $map = array('closed' => '0');
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['cate_name'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        if ($shop_id = $this->shop_id) {
            $map['shop_id'] = $shop_id;
            $shop = D('Shop')->find($shop_id);
            $this->assign('shop_name', $shop['shop_name']);
            $this->assign('shop_id', $shop_id);
        }
        $count = $obj->where($map)->count();
        $Page = new Page($count, 25);
        $show = $Page->show();
        $list = $obj->where($map)->order(array('cate_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $shop_ids = array();
        foreach ($list as $k => $val) {
            if ($val['shop_id']) {
                $shop_ids[$val['shop_id']] = $val['shop_id'];
            }
        }
        if ($shop_ids) {
            $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        }
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
	
	
    public function create(){
        if (IS_AJAX){
            $shop_id = $this->shop_id;
            $cate_name = I('cate_name', '', 'trim,htmlspecialchars');
            if(empty($cate_name)){
                $this->ajaxReturn(array('status' => 'error', 'message' => '分类名称不能为空！'));
            }
            $obj = D('Storecate');
            $data = array('shop_id' => $shop_id, 'cate_name' => $cate_name, 'num' => 0, 'closed' => 0);
            if($obj->add($data)){
                $this->ajaxReturn(array('status' => 'success', 'message' => '添加成功！'));
            }
            $this->ajaxReturn(array('status' => 'error', 'message' => '添加失败！'));
        }
    }
	
    public function edit(){
        if (IS_AJAX) {
            $cate_id = I('v', '', 'intval,trim');
            if ($cate_id) {
                $obj = D('Storecate');
                if(!($detail = $obj->find($cate_id))){
                    $this->ajaxReturn(array('status' => 'error', 'message' => '请选择要编辑的工作分类'));
                }
                if($detail['shop_id'] != $this->shop_id){
                    $this->ajaxReturn(array('status' => 'error', 'message' => '请不要操作其他企业的工作分类'));
                }
                $cate_name = I('cate_name', '', 'trim,htmlspecialchars');
                if(empty($cate_name)){
                    $this->ajaxReturn(array('status' => 'error', 'message' => '分类名称不能为空！'));
                }
                $data = array('cate_name' => $cate_name);
                if (false !== $obj->where('cate_id =' . $cate_id)->setField($data)) {
                    $this->ajaxReturn(array('status' => 'success', 'message' => '操作成功！'));
                }
                $this->ajaxReturn(array('status' => 'error', 'message' => '操作失败'));
            }else{
                $this->ajaxReturn(array('status' => 'error', 'message' => '请选择要编辑的工作分类'));
            }
        }
    }
	
    public function index(){
        $obj = D('Storeproduct');
        import('ORG.Util.Page');
        $map = array('closed' => 0);
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['product_name'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        if ($shop_id = $this->shop_id) {
            $map['shop_id'] = $shop_id;
            $this->assign('shop_id', $shop_id);
        }
        $count = $obj->where($map)->count();
        $Page = new Page($count, 10);
        $show = $Page->show();
        $list = $obj->where($map)->order(array('product_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $cate_ids = array();
        foreach($list as $k => $val){
            if($val['cate_id']) {
                $cate_ids[$val['cate_id']] = $val['cate_id'];
            }
        }
        if($cate_ids){
            $this->assign('cates', D('Storecate')->itemsByIds($cate_ids));
        }
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
	
    public function shelves(){
        $obj = D('Storeproduct');
        import('ORG.Util.Page');
        $map = array('closed' => 1);
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['product_name'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        if ($shop_id = $this->shop_id) {
            $map['shop_id'] = $shop_id;
            $this->assign('shop_id', $shop_id);
        }
        $count = $obj->where($map)->count();
        $Page = new Page($count, 10);
        $show = $Page->show();
        $list = $obj->where($map)->order(array('product_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $cate_ids = array();
        foreach($list as $k => $val){
            if($val['cate_id']) {
                $cate_ids[$val['cate_id']] = $val['cate_id'];
            }
        }
        if($cate_ids){
            $this->assign('cates', D('Storecate')->itemsByIds($cate_ids));
        }
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
   
   
    public function status(){
        $status = I('status', '', 'trim,intval');
        $order_id = I('order_id', '', 'trim,intval');
        $obj = D('StoreOrder');
        $detail = $obj->where('order_id =' . $order_id)->find();
        $Shop = D('Shop')->where(array('shop_id'=>$this->shop_id))->find();
        if($status == 0) {
            if($detail['status'] == 0) {
                $this->tuMsg('买家未付款不能操作');
            }
        }elseif($status == 1) {
            if($Shop['is_store_pei'] == 1){
                D('Storeorder')->store_delivery_order($order_id);//便利店接单时候给配送
                $this->tuMsg('恭喜您便利店接单成功，订单已经进去配送中心', U('store/storeorder', array('status' => 2)));
            }else{
                if($detail['status'] == 1){
					$update = $obj->save(array('order_id' => $order_id, 'status' => 2,'orders_time' => NOW_TIME));
					D('Weixinmsg')->weixinTmplOrderMessage($order_id,$cate = 1,$type =9,$status = 1);//通知买家
                }else{
                    $this->tuMsg('状态错误');
                }
            }
        }else{
            $this->tuMsg('没有检测到订单状态');
        }
		
        if($update){
            $this->tuMsg('设置成功', U('store/storeorder', array('status' => 2)));
        }else{
            $this->tuMsg('数据库操作失败!');
        }
    }
	
	
    public function detail(){
        $order_id = I('order_id', '', 'intval,trim');
        if(!($order = D('StoreOrder')->find($order_id))){
            $this->error('错误');
        }else{
            $op = D('StoreOrderProduct')->where('order_id =' . $order['order_id'])->select();
            if($op){
                $ids = array();
                foreach($op as $k => $v){
                    $ids[$v['product_id']] = $v['product_id'];
                }
                $ep = D('StoreProduct')->where(array('product_id' => array('in', $ids)))->select();
                $ep2 = array();
                foreach($ep as $kk => $vv){
                    $ep2[$vv['product_id']] = $vv;
                }
                $this->assign('ep', $ep2);
                $this->assign('op', $op);
                $addr = D('UserAddr')->find($order['addr_id']);
                $this->assign('addr', $addr);
                $do = D('DeliveryOrder')->where(array('type'=>4,'type_order_id'=>$order['order_id']))->find();
                if($do){
                    if($do['delivery_id'] > 0){
                        $delivery = D('Delivery')->find($do['delivery_id']);
                        $this->assign('delivery', $delivery);
                    }
                    $this->assign('do', $do);
                }
            }
            $this->assign('order', $order);
            $this->display();
        }
    }
	
	
	public function storeorder(){
        $status = I('status', '', 'intval,trim');
        $this->assign('status', $status);
		$keyword = $this->_param('keyword', 'htmlspecialchars');
        $this->assign('keyword', $keyword);
        $bg_time = (int) $this->_param('bg_time');
        $this->assign('bg_time', $bg_time);
        $this->assign('nextpage', LinkTo('store/storeorder_lada_data',array('status'=>$status,'keyword'=>$keyword,'t' => NOW_TIME, 'p' => '0000')));
        $this->display();
    }
	

    public function storeorder_lada_data(){
        $obj = D('Storeorder');
        import('ORG.Util.Page');
        $map = array('closed' => 0, 'shop_id' => $this->shop_id);
		$status = (int) $this->_param('status');
        if($status){
            $map['status'] = $status;
        }
        if(($bg_date = $this->_param('bg_date', 'htmlspecialchars')) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date);
            $map['create_time'] = array(array('ELT', $end_time), array('EGT', $bg_time));
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
        }else{
            if($bg_date = $this->_param('bg_date', 'htmlspecialchars')){
                $bg_time = strtotime($bg_date);
                $this->assign('bg_date', $bg_date);
                $map['create_time'] = array('EGT', $bg_time);
            }
            if($end_date = $this->_param('end_date', 'htmlspecialchars')){
                $end_time = strtotime($end_date);
                $this->assign('end_date', $end_date);
                $map['create_time'] = array('ELT', $end_time);
            }
        }
        if($keyword = $this->_param('keyword', 'htmlspecialchars')){
            $map['order_id'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        if(isset($_GET['st']) || isset($_POST['st'])){
            $st = (int) $this->_param('st');
            if($st != 999){
                $map['status'] = $st;
            }
            $this->assign('st', $st);
        }else{
            $this->assign('st', 999);
        }
        $count = $obj->where($map)->count();
        $Page = new Page($count, 10);
        $show = $Page->show();
		
		$var = C('VAR_PAGE') ? C('VAR_PAGE') : 'p';
        $p = $_GET[$var];
        if ($Page->totalPages < $p) {
            die('0');
        }
		
        $list = $obj->where($map)->order(array('order_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $user_ids = $order_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
        }
		
        $store_shop = D('Shop')->where(array('shop_id'=>$this->shop_id))->find();
        if($store_shop['is_pei'] == 0){
            $DeliveryOrder = D('DeliveryOrder')->where(array('type' =>4,'type_order_id' => array('IN', $order_ids)))->select();
            $delivery_ids = array();
            foreach ($DeliveryOrder as $val){
                $delivery_ids[$val['delivery_id']] = $val['delivery_id'];
            }
            $this->assign('Delivery', D('Delivery')->itemsByIds($delivery_ids));
            $this->assign('DeliveryOrder', $DeliveryOrder);
        }
        if(!empty($order_ids)){
            $goods = D('Storeorderproduct')->where(array('order_id' => array('IN', $order_ids)))->select();
            $goods_ids = array();
            foreach($goods as $val){
                $goods_ids[$val['product_id']] = $val['product_id'];
            }
            $this->assign('goods', $goods);
            $this->assign('products', D('Storeproduct')->itemsByIds($goods_ids));
        }

        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('store_shop', $store_shop);
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->display();
    }
	
	
    //下架工作
    public function delete($product_id = 0){
        $product_id = (int) $product_id;
        if(empty($product_id)){
            $this->ajaxReturn(array('status' => 'error', 'msg' => '访问错误！'));
        }
        $obj = D('Storeproduct');
        if (!($detail = $obj->where(array('shop_id' => $this->shop_id, 'product_id' => $product_id))->find())) {
            $this->ajaxReturn(array('status' => 'error', 'msg' => '请选择要下架的工作管理！'));
        }
        D('Storecate')->updateNum($detail['cate_id']);
        $obj->save(array('product_id' => $product_id, 'closed' => 1));
        $this->ajaxReturn(array('status' => 'success', 'msg' => '下架成功', U('store/shelves')));
    }
	
    //上架工作
    public function updates($product_id = 0){
        $product_id = (int) $product_id;
        if (empty($product_id)) {
            $this->ajaxReturn(array('status' => 'error', 'msg' => '访问错误！'));
        }
        $obj = D('Storeproduct');
        if (!($detail = $obj->where(array('shop_id' => $this->shop_id, 'product_id' => $product_id))->find())) {
            $this->ajaxReturn(array('status' => 'error', 'msg' => '请选择要上架的工作管理！'));
        }
        D('Storecate')->updateNum($detail['cate_id']);
        $obj->save(array('product_id' => $product_id, 'closed' => 0));
        $this->ajaxReturn(array('status' => 'success', 'msg' => '上架成功', U('store/index')));
    }
	
    //确认订单
    public function send($order_id){
        $order_id = (int) $order_id;
        if(!($detail = D('Storeorder')->find($order_id))){
            $this->tuMsg('没有该订单');
        }
        if($detail['shop_id'] != $this->shop_id){
            $this->tuMsg('您无权管理该企业');
        }
        $shop = D('Shop')->where(array('shop_id'=>$this->shop_id))->find();
        if ($shop['is_store_pei'] == 1) {
            $DeliveryOrder = D('DeliveryOrder')->where(array('type_order_id' => $order_id, 'type' =>4))->find();
            if(!empty($DeliveryOrder)){
                $this->tuMsg('您开通了配送员配货，无权管理');
            }
        }else{
            if($detail['create_time'] < $t && $detail['status'] == 2){
                D('Storeorder')->overOrder($order_id);
                $this->tuMsg('确认完成，资金已经结算到账户', U('store/storeorder', array('status' => 1)));
            }else{
                $this->tuMsg('操作失败,客户还未收货或者没到自动确认收货时间');
            }
        }
    }
	
    public function create2(){
        if ($this->isPost()) {
            $data = $this->createCheck();
            $obj = D('Storeproduct');
            if ($obj->add($data)) {
                D('Storecate')->updateNum($data['cate_id']);
                $this->tuMsg('添加成功', U('store/index'));
            }
            $this->tuMsg('操作失败');
        } else {
            $this->display();
        }
    }
	
	
    private function createCheck(){
        $data = $this->checkFields($this->_post('data', false), $this->create_fields);
        $data['product_name'] = htmlspecialchars($data['product_name']);
        if (empty($data['product_name'])) {
            $this->tuMsg('工作名不能为空');
        }
        $data['desc'] = htmlspecialchars($data['desc']);
        if (empty($data['desc'])) {
            $this->tuMsg('工作介绍不能为空');
        }
        $data['shop_id'] = $this->shop_id;
		
        $data['cate_id'] = (int) $data['cate_id'];
        if(empty($data['cate_id'])) {
            $this->tuMsg('分类不能为空');
        }
		$res = D('Storecate')->where(array('cate_id'=>$data['cate_id']))->find();
		if($res['parent_id'] == 0){
			$this->tuMsg('请选择二级分类');
		}
		
        $data['photo'] = htmlspecialchars($data['photo']);
        if (empty($data['photo'])) {
            $this->tuMsg('请上传缩略图');
        }
        if (!isImage($data['photo'])) {
            $this->tuMsg('缩略图格式不正确');
        }
		$data['cost_price'] = (int) ($data['cost_price'] * 100);
        $data['price'] = (int) ($data['price'] * 100);
        if (empty($data['price'])) {
            $this->tuMsg('价格不能为空');
        }
		if($data['cost_price']){
			if($data['price'] >= $data['cost_price']){
				$this->tuMsg('售价不能高于原价');
			}
		}
		$data['tableware_price'] = (int) ($data['tableware_price'] * 100);
        $data['settlement_price'] = (int) ($data['price'] - $data['price'] * $this->store['rate'] / 1000);
		
		if(false == D('Storeproduct')->gauging_tableware_price($data['tableware_price'],$data['settlement_price'])){
			$this->tuMsg(D('Storeproduct')->getError());//检测餐具费合理性
		}
	
        $data['is_new'] = (int) $data['is_new'];
        $data['is_hot'] = (int) $data['is_hot'];
        $data['is_tuijian'] = (int) $data['is_tuijian'];
        $data['create_time'] = NOW_TIME;
        $data['create_ip'] = get_client_ip();
        $data['audit'] = 0;
        return $data;
    }
	
	
    public function edit2($product_id = 0){
        if ($product_id = (int) $product_id) {
            $obj = D('Storeproduct');
            if (!($detail = $obj->find($product_id))) {
                $this->error('请选择要编辑的工作管理');
            }
            if ($detail['shop_id'] != $this->shop_id) {
                $this->error('请不要操作其他企业的工作管理');
            }
            if ($this->isPost()) {
                $data = $this->editCheck();
                $data['product_id'] = $product_id;
                if (false !== $obj->save($data)) {
                    D('Storecate')->updateNum($data['cate_id']);
                    $this->tuMsg('操作成功', U('store/index'));
                }
				$this->assign('parent_id',$parent_id = D('Storecate')->getParentsId($detail['cate_id']));
                $this->tuMsg('操作失败');
            } else {
                $this->assign('detail', $detail);
                $this->display();
            }
        } else {
            $this->error('请选择要编辑的工作管理');
        }
    }
    private function editCheck(){
        $data = $this->checkFields($this->_post('data', false), $this->edit_fields);
        $data['product_name'] = htmlspecialchars($data['product_name']);
        if (empty($data['product_name'])) {
            $this->tuMsg('工作名不能为空');
        }
        $data['desc'] = htmlspecialchars($data['desc']);
        if (empty($data['desc'])) {
            $this->tuMsg('工作介绍不能为空');
        }
		
        $data['cate_id'] = (int) $data['cate_id'];
        if(empty($data['cate_id'])) {
            $this->tuMsg('分类不能为空');
        }
		$res = D('Storecate')->where(array('cate_id'=>$data['cate_id']))->find();
		if($res['parent_id'] == 0){
			$this->tuMsg('请选择二级分类');
		}
		
        $data['photo'] = htmlspecialchars($data['photo']);
        if (empty($data['photo'])) {
            $this->tuMsg('请上传缩略图');
        }
        if (!isImage($data['photo'])) {
            $this->tuMsg('缩略图格式不正确');
        }
		$data['cost_price'] = (int) ($data['cost_price'] * 100);
        $data['price'] = (int) ($data['price'] * 100);
        if (empty($data['price'])) {
            $this->tuMsg('价格不能为空');
        }
		if($data['cost_price']){
			if($data['price'] >= $data['cost_price']){
				$this->tuMsg('售价不能高于原价');
			}
		}
		$data['tableware_price'] = (int) ($data['tableware_price'] * 100);
        $data['settlement_price'] = (int) ($data['price'] - $data['price'] * $this->store['rate'] / 1000);
		if(false == D('Storeproduct')->gauging_tableware_price($data['tableware_price'],$data['settlement_price'])){
			$this->tuMsg(D('Storeproduct')->getError());//检测餐具费合理性
		}
        $data['is_new'] = (int) $data['is_new'];
        $data['is_hot'] = (int) $data['is_hot'];
        $data['is_tuijian'] = (int) $data['is_tuijian'];
        return $data;
    }
	
	//分类请求
	public function child($parent_id=0){
        $datas = D('Storecate')->select();
        $str = '';
        foreach($datas as $var){
            if($var['parent_id'] == 0 && $var['cate_id'] == $parent_id){
                foreach($datas as $var2){
                    if($var2['parent_id'] == $var['cate_id']){
                        $str.='<option value="'.$var2['cate_id'].'">'.$var2['cate_name'].'</option>'."\n\r";
                        foreach($datas as $var3){
                            if($var3['parent_id'] == $var2['cate_id']){
                               $str.='<option value="'.$var3['cate_id'].'">&nbsp;&nbsp;--'.$var3['cate_name'].'</option>'."\n\r"; 
                            }
                        }
                    }  
                }
            }           
        }
        echo $str;die;
    }
}