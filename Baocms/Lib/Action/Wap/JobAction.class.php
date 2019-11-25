<?php



class JobAction extends CommonAction {

    public function index() {
        $maps = array('status' => 2,'closed'=>0);
        $this->assign('nav',$nav = D('Navigation') ->where($maps)->order(array('orderby' => 'asc'))->select());
        
        $this->display();
    }
    public function push(){
        $Tuan = D('Tuan');
        import('ORG.Util.Page');
        $lat = addslashes(cookie('lat'));
        $lng = addslashes(cookie('lng'));
        if (empty($lat) || empty($lng)) {
            $lat = $this->city['lat'];
            $lng = $this->city['lng'];
        }
        $map = array('audit' => 1, 'closed' => 0, 'city_id' => $this->city_id, 'end_date' => array('EGT', TODAY));
        $count = $Tuan->where($map)->count();
        $Page = new Page($count, 3);
        $show = $Page->show();
        $var = C('VAR_PAGE') ? C('VAR_PAGE') : 'p';
        $p = $_GET[$var];
        if ($Page->totalPages < $p) {
            die('0');
        }
        $tuans = $Tuan->order(" (ABS(lng - '{$lng}') +  ABS(lat - '{$lat}') ) asc ")->where($map)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        foreach ($tuans as $k => $val) {
            $tuans[$k]['d'] = getDistance($lat, $lng, $val['lat'], $val['lng']);
        }
        $this->assign('tuans', $tuans);
        $this->assign('page', $show);
        $this->display();
    }

}
