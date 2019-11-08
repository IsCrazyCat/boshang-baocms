<?php

class CarAction extends CommonAction
{

    public function index()
    {
        $cars = array();
        $map['parent_id'] = 0;
        $map['is_open'] = '1';
        $map['closed']=0;
        if ($keyword2 = $this->_param('keyword2', 'htmlspecialchars')) {
            $map = array('name|english_name|short_name' => array('LIKE', '%' . $keyword2 . '%'));
            $citlist = D('car')->where($map)->select();
            $cars = $citlist;
            $this->assign('keyword2', $keyword2);
        }


        $carlists = array();
        if(empty($cars)){
            $cars = D('Car')->where($map)->select();
        }

        foreach ($cars as $val) {
            if ($val['is_open'] == 1) {
                $first_letter = strtoupper($val['first_letter']);
                $carlists[$first_letter][] = $val;
            }
        }

        ksort($carlists);
        $this->assign('carlists', $carlists);
        $this->display();
    }

    public function vehicle()
    {
        $parent_id = $this->_param('parent_id');

        $this->assign('nextpage', LinkTo('car/loaddata', array('parent_id' => $parent_id,'p' => '0000')));
        $this->display();
    }
    public function loaddata(){
        $parent_id = $this->_param('parent_id');
        import('ORG.Util.Page');

        if ($keyword2 = $this->_param('keyword2', 'htmlspecialchars')) {
            $map = array('name|english_name|short_name' => array('LIKE', '%' . $keyword2 . '%'));
            $this->assign('keyword2', $keyword2);
        }

        $map['parent_id'] = $parent_id;
        $map['is_open'] = '1';
        $map['closed']=0;


        $count = D('Car')->where($map)->count();
        $Page = new Page($count, 10);
        $show = $Page->show();
        $var = C('VAR_PAGE') ? C('VAR_PAGE') : 'p';
        $p = $_GET[$var];
        if ($Page->totalPages < $p) {
            die('0');
        }
        $cars = D('Car')->where($map)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        if(!empty($cars)){
            foreach ($cars as $key=>$car){
                $cars[$key]['catesInfo'] = get_car_goods($car['car_id']);
            }
        }


        $this->assign('list', $cars);
        $this->assign('page', $show);
        $this->display();
    }

    public function vehicle1(){
        $keyword = $this->_param('keyword', 'htmlspecialchars');
        $this->assign('keyword', $keyword);
        $cat = (int) $this->_param('cat');
        $area = (int) $this->_param('area');
        $business = (int) $this->_param('business');
        $cate_id = (int) $this->_param('cate_id');
        $order = (int) $this->_param('order');
        $this->assign('area', $area);
        $this->assign('business', $business);
        $this->assign('cate_id', $cate_id);
        $this->assign('order', $order);
        $this->assign('cat', $cat);
        $this->assign('nextpage', LinkTo('mall/loaddata', array('cat' => $cat, 'order' => $order, 'area' => $area, 'business' => $business, 'cate_id' => $cate_id, 'keyword' => $keyword, 'p' => '0000')));
        $this->display();
    }

    public function loaddata1(){
        $Goods = D('Goods');
        import('ORG.Util.Page');
        $area = (int) $this->_param('area');
        $order = (int) $this->_param('order');
        $business = (int) $this->_param('business');
        if ($area) {
            $map['area_id'] = $area;
        }
        $cate_id = (int) $this->_param('cate_id');
        if ($cate_id) {
            $map['cate_id'] = $cate_id;
        }
        $map['audit'] = 1;
        $map['closed'] = 0;
        $map['end_date'] = array('egt', TODAY);
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['title'] = array('LIKE', '%' . $keyword . '%');
        }
        $cat = (int) $this->_param('cat');
        if ($cat) {
            $catids = D('Goodscate')->getChildren($cat);
            if (!empty($catids)) {
                $map['cate_id'] = array('IN', $catids);
            } else {
                $map['cate_id'] = $cat;
            }
        }
        $map['city_id'] = $this->city_id;
        $count = $Goods->where($map)->count();
        $Page = new Page($count, 10);
        $show = $Page->show();
        $var = C('VAR_PAGE') ? C('VAR_PAGE') : 'p';
        $p = $_GET[$var];
        if ($Page->totalPages < $p) {
            die('0');
        }
        if ($order == '1') {
            $order_arr = 'create_time desc';
        } elseif ($order == '2') {
            $order_arr = 'sold_num desc';
        } elseif ($order == '3') {
            $order_arr = 'mall_price desc';
        } elseif ($order == '4') {
            $order_arr = 'mall_price asc';
        } else {
            $order_arr = 'orderby desc';
        }
        $list = $Goods->where($map)->order($order_arr)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        foreach ($list as $k => $val) {
            if ($val['shop_id']) {
                $shop_ids[$val['shop_id']] = $val['shop_id'];
            }
            $val['end_time'] = strtotime($val['end_date']) - NOW_TIME + 86400;
            $list[$k] = $val;
        }
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
}