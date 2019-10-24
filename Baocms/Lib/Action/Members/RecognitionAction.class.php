<?php
class RecognitionAction extends CommonAction
{
    public function index()
    {
        $Shoprecognition = D('Shoprecognition');
        import('ORG.Util.Page');
        $map = array('user_id' => $this->uid);
        $count = $Shoprecognition->where($map)->count();
        $Page = new Page($count, 25);
        $show = $Page->show();
        $list = $Shoprecognition->where($map)->order(array('recognition_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $shop_ids = array();
        foreach ($list as $k => $val) {
            $val['create_ip_area'] = $this->ipToArea($val['create_ip']);
            $list[$k] = $val;
            $shop_ids[$val['shop_id']] = $val['shop_id'];
        }
        if (!empty($shop_ids)) {
            $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        }
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
}