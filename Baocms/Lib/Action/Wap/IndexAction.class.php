<?php


class IndexAction extends CommonAction {
	
	

      public function index() {
		  
		  

        $this->assign('lifecate', D('Lifecate')->fetchAll());
        $this->assign('channel', D('Lifecate')->getChannelMeans());
		
//		$lat_ok = $this->_get('lat_ok', 'htmlspecialchars');
//        $lng_ok = $this->_get('lng_ok', 'htmlspecialchars');
//        cookie('lat_ok', $lat_ok);
//        cookie('lng_ok', $lng_ok);
//		
//		//获取用户自定坐标
		$lat = cookie('lat_ok');
		$lng = cookie('lng_ok');
		if(empty($lat) || empty($lng)){
			$lat = cookie('lat');
			$lng = cookie('lng');
		}

        if (empty($lat) || empty($lng)) {
            $lat = $this->_CONFIG['site']['lat'];
            $lng = $this->_CONFIG['site']['lng'];
        }

        $orderby = " (ABS(lng - '{$lng}') +  ABS(lat - '{$lat}') ) asc ";
        $shoplist = D('Shop')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'audit' => 1))->order($orderby)->limit(0, 5)->select();
		foreach ($shoplist as $k => $val) {
            $shoplist[$k]['d'] = getDistance($lat, $lng, $val['lat'], $val['lng']);
			//$shoplist[$k]['ddd'] = mygetDistance($lat, $lng, $val['lat'], $val['lng']);
        }
		
		 $shop_brand_list = D('Shop')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'is_brand' => 1, 'audit' => 1))->order($orderby)->select();
         $shop_hot_list = D('Shop')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'is_hot' => 1, 'audit' => 1))->order($orderby)->select();
		 
		    
            foreach ($shop_hot_list as $k => $val) {
                $shop_hot_list[$k]['d'] = getDistance($lat, $lng, $val['lat'], $val['lng']);
				//$shop_hot_list[$k]['ddd'] = mygetDistance($lat, $lng, $val['lat'], $val['lng']);
                //$d = getDistanceNone($lat, $lng, $val['lat'], $val['lng']);
                //$shop_hot_list[$d][] = $k;
            }
            
            
		 
		 $this->assign('shop_brand_list', $shop_brand_list);
		 $this->assign('shop_hot_list', $shop_hot_list);


          $news = D('Article')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'audit' => 1))->order(array('create_time' => 'desc'))->limit(0, 5)->select();
		$community = D('Community')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'audit' => 1,))->order($orderby)->limit(0, 5)->select();
		foreach ($community as $k => $val) {
            $community[$k]['d'] = getDistance($lat, $lng, $val['lat'], $val['lng']);
			//$community[$k]['ddd'] = mygetDistance($lat, $lng, $val['lat'], $val['lng']);
        }
		
        $this->assign('shop_brand_list', $shop_brand_list);
        $this->assign('shop_hot_list', $shop_hot_list);

        $this->assign('shoplist', $shoplist);		   
		   
		   
        $news = D('Article')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'audit' => 1))->order(array('create_time' => 'desc'))->limit(0, 5)->select();
		$community = D('Community')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'audit' => 1,))->order($orderby)->limit(0, 5)->select();
		foreach ($community as $k => $val) {
            $community[$k]['d'] = getDistance($lat, $lng, $val['lat'], $val['lng']);
			//$community[$k]['ddd'] = mygetDistance($lat, $lng, $val['lat'], $val['lng']);
        }
		
        $this->assign('shoplist', $shoplist);
        $this->assign('news', $news);
		$this->assign('community', $community);
		
		

		$maps = array('status' => 2,'closed'=>0);
		$this->assign('nav',$nav = D('Navigation') ->where($maps)->order(array('orderby' => 'asc'))->select());
		$bg_time = strtotime(TODAY);
		$this->assign('sign_day', $sign_day = (int) D('Usersign')->where(array('user_id' => $this->uid, 'create_time' => array(array('ELT', NOW_TIME), array('EGT', $bg_time))))->count());
        
		
		//新商品展示 lihongshun 2019/2/16
		$today  =  strtotime(date('Y-m-d'));
		$Goods = D('Goods')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'audit' => 1,'end_date' => array('EGT', $today)))->order(array('orderby' => 'asc','sold_num' => 'desc'))->limit(0, 10)->select();
		$this->assign('Goods',$Goods); 
        //分类信息展示  lihongshun 2019/2/16
		$Life = D('Life');
		$map = array('audit' => 1, 'city_id' => $this->city_id, 'closed' => 0);
		$orderby = " (ABS(lng - '{$lng}') +  ABS(lat - '{$lat}') ) asc ";
		$list = $Life->where($map)->order($orderby)->limit(0, 10)->select();
        $this->assign('list', $list);
		

               //推荐商圈 lishibo 2019/1/2
          $hostbs =  D('Business')->where(array('is_hot'=>1 ))->order(array('orderby' => 'desc'))->select();
          foreach ($hostbs as $k => $val) {
            $bid = $hostbs[$k]['business_id'];
            $hostbs[$k]['shops'] =  D('Shop')
                ->where(array('business_id'=>$bid ))
                ->order(array('orderby' => 'desc'))
                //->limit(0, 3)
                ->select();
          }
          $this->assign('hostbs',$hostbs);
               //时间内有推荐&&效活动 lishibo 2019/1/2
          $huodong = D('Activity');
          $map_activity = array('audit' => 1,'is_recommend' => 1,'city_id'=>$this->city_id, 'closed' => 0, 'sign_end' => array('EGT', TODAY));
          $activity_index_list = $huodong->where($map_activity)->select();
        //  print_r($activity_index_list);
          $this->assign('activity_index_list',$activity_index_list);
		  
		  
		  
		  /*贴吧*/
		$tieba = D('Post')->where(array('audit' =>1,'is_fine' =>1))->order('post_id desc')->limit(0, 10)->select();
		
		$ids = array();
        foreach ($tieba as $k => $val) {
            if ($val['user_id']) {
                $ids[$val['user_id']] = $val['user_id'];
            }
        }
        $this->assign('users', D('Users')->itemsByIds($ids));
		
		$this->assign('tieba',$tieba);
		
//		$cat = (int) $this->_param('cat');
//        $this->assign('cat', $cat);
//        $order = (int) $this->_param('order');
//        $this->assign('order', $order);
//        $keyword = $this->_param('keyword', 'htmlspecialchars');
//        $this->assign('keyword', $keyword);
//        $areas = D('Area')->fetchAll();
//        $area = (int) $this->_param('area');
//        $this->assign('area_id', $area);
//        $biz = D('Business')->fetchAll();
//        $business = (int) $this->_param('business');
//        $this->assign('business_id', $business);
//        $this->assign('areas', $areas);
//        $this->assign('biz', $biz); 
//		
//		$this->assign('nextpage', LinkTo('shop/loaddata', array('cat' => $cat, 'area' => $area, 'business' => $business, 'order' => $order, 't' => NOW_TIME, 'keyword' => $keyword, 'p' => '0000')));
  
		  
        $this->display();
    }
	
	
	
	
	public function index0() {
        
		$lat0 = $this->_get('lat', 'htmlspecialchars');
        $lng0 = $this->_get('lng', 'htmlspecialchars');
		if ( ( (int)$lat0>0 ) && ( (int)$lng0>0 )  ) { 
			cookie('lat', $lat0);
			cookie('lng', $lng0);
			cookie('lat_ok', $lat0);
			cookie('lng_ok', $lng0);	
		}
		
		
		
		$lat = addslashes(cookie('lat_ok'));
		$lng = addslashes(cookie('lng_ok'));
		if(empty($lat) || empty($lng)){
			$lat = addslashes(cookie('lat'));
			$lng = addslashes(cookie('lng'));
		}
        
		
       
        if (empty($lat) || empty($lng)) {
            $lat = $this->_CONFIG['site']['lat'];
            $lng = $this->_CONFIG['site']['lng'];
        }
        if (empty($lat) || empty($lng)) {
          $lat = $this->city['lat'];
          $lng = $this->city['lng'];
        }
	   
		  
		  
        $this->display();
    }
   
   public function push(){
	  
//	    $lat = $this->_get('lat_ok', 'htmlspecialchars');
//        $lng = $this->_get('lng_ok', 'htmlspecialchars');
//        cookie('lat', $lat);
//        cookie('lng', $lng);
	   
        $Shop = D('Shop');
        import('ORG.Util.Page');
        $map = array('closed' => 0, 'audit' => 1, 'city_id' => $this->city_id);
        $cat = (int) $this->_param('cat');
        if ($cat) {
            $catids = D('Shopcate')->getChildren($cat);
            if (!empty($catids)) {
                $map['cate_id'] = array('IN', $catids);
            } else {
                $map['cate_id'] = $cat;
            }
        }
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['shop_name|addr'] = array('LIKE', '%' . $keyword . '%');
        }
        $area = (int) $this->_param('area');
        if ($area) {
            $map['area_id'] = $area;
        }
        $business = (int) $this->_param('business');
        if ($business) {
            $map['business_id'] = $business;
        }
        $order = (int) $this->_param('order');
		
		$lat = addslashes(cookie('lat_ok'));
		$lng = addslashes(cookie('lng_ok'));
		if(empty($lat) || empty($lng)){
			$lat = addslashes(cookie('lat'));
			$lng = addslashes(cookie('lng'));
		}
        if (empty($lat) || empty($lng)) {
          $lat = addslashes($this->city['lat']);
          $lng = addslashes($this->city['lng']);
        }
        if (empty($lat) || empty($lng)) {
            $lat = addslashes($this->_CONFIG['site']['lat']);
            $lng = addslashes($this->_CONFIG['site']['lng']);
        }
		
        switch ($order) {
            case 2:
                $orderby = array('orderby' => 'asc', 'ranking' => 'desc');
                break;
            default:
                $orderby = " (ABS(lng - '{$lng}') +  ABS(lat - '{$lat}') ) asc ";
                break;
        }
        $count = $Shop->where($map)->count();
        $Page = new Page($count, 20);
        $show = $Page->show();
        $var = C('VAR_PAGE') ? C('VAR_PAGE') : 'p';
        $p = $_GET[$var];
        if ($Page->totalPages < $p) {
            die('0');
        }
        $list = $Shop->where($map)->order($orderby)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        
		$reloaded = $this->_param('reloaded');
		
		foreach ($list as $k => $val) {
            $list[$k]['d'] = getDistance($lat, $lng, $val['lat'], $val['lng']);
			//$list[$k]['ddd'] = mygetDistance($lat, $lng, $val['lat'], $val['lng']);
			
			$myd = str_replace("m","",$list[$k]['d']);
			$myd = str_replace("k","",$myd);
			if ( (int)$myd > 6500 ) {
				$lat = addslashes(cookie('lat_ok'));
				$lng = addslashes(cookie('lng_ok'));
				if(empty($lat) || empty($lng)){
					$lat = addslashes(cookie('lat'));
					$lng = addslashes(cookie('lng'));
				}
				$this->assign('myd', $myd);
				cookie('myd', $myd);
				
				//<script language='JavaScript'>dingwei('<{:U(\"wap/index/dingwei\",array(\"t\"=>".time().",\"lat\"=>\"".$lat."\",\"lng\"=>\"".$lng."\"))}>', ".$lat.", ".$lng.");
				
				/*echo "<script>setTimeout(g,2000);</script>";*/
				
				/*if ( strlen(cookie('reloaded'))>0) {
					echo "<script>alert('".cookie('reloaded')."');</script>";
				}else{//不管用
				   echo "<script language='JavaScript'>location.href=location.href+'#reloaded';location.reload();</script>";
				}*/

			} 
			
        }
        $shop_ids = array();
        foreach ($list as $key => $v) {
            $shop_ids[$v['shop_id']] = $v['shop_id'];
			
        }
        $shopdetails = D('Shopdetails')->itemsByIds($shop_ids);
        foreach ($list as $k => $val) {
            $list[$k]['price'] = $shopdetails[$val['shop_id']]['price'];
			$list[$k]['favnum'] = D('Shopfavorites')->where(array('shop_id' => $val['shop_id']))->count();
        }
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
	
    /**
     * @desc arraySort php二维数组排序 按照指定的key 对数组进行排序
     * @param array $arr 将要排序的数组
     * @param string $keys 指定排序的key
     * @param string $type 排序类型 asc | desc
     * @return array
     */
public function arraySort($arr, $keys, $type = 'asc') {
        $keysvalue = $new_array = array();
        foreach ($arr as $k => $v){
            $keysvalue[$k] = $v[$keys];
        }
        $type == 'asc' ? asort($keysvalue) : arsort($keysvalue);
        reset($keysvalue);
        foreach ($keysvalue as $k => $v) {
           $new_array[$k] = $arr[$k];
        }
        return $new_array;
}	
	
 public function mypush(){
	  
	    $lat = $this->_get('lat_ok', 'htmlspecialchars');
        $lng = $this->_get('lng_ok', 'htmlspecialchars');
//        cookie('lat', $lat);
//        cookie('lng', $lng);
	   
        $Shop = D('Shop');
        import('ORG.Util.Page');
         // $map = array('closed' => 0, 'audit' => 1, 'city_id' => $this->city_id);
		 
		 $map = array('closed' => 0, 'audit' => 1);
//        $cat = (int) $this->_param('cat');
//        if ($cat) {
            //$catids = D('Shopcate')->getChildren($cat);
			$catids = ' 1 , 2 , 42 , 43 ,  44 ,  45 ,  100 ,  101 ,  102 , 103 , 104 , 105  , 106  , 107  ,  108  ,  109';
            if (!empty($catids)) {
                $map['cate_id'] = array('IN', $catids);
            } else {
                $map['cate_id'] = $cat;
            }
//        }
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['shop_name|addr'] = array('LIKE', '%' . $keyword . '%');
        }
        $area = (int) $this->_param('area');
        if ($area) {
            $map['area_id'] = $area;
        }
        $business = (int) $this->_param('business');
        if ($business) {
            $map['business_id'] = $business;
        }
        $order = (int) $this->_param('order');
		
		$lat = addslashes(cookie('lat_ok'));
		$lng = addslashes(cookie('lng_ok'));
		if(empty($lat) || empty($lng)){
			$lat = addslashes(cookie('lat'));
			$lng = addslashes(cookie('lng'));
		}
        if (empty($lat) || empty($lng)) {
          $lat = addslashes($this->city['lat']);
          $lng = addslashes($this->city['lng']);
        }
        if (empty($lat) || empty($lng)) {
            $lat = addslashes($this->_CONFIG['site']['lat']);
            $lng = addslashes($this->_CONFIG['site']['lng']);
        }
		
//        switch ($order) {
//            case 2:
//                $orderby = array('orderby' => 'asc', 'ranking' => 'desc');
//                break;
//            default:
//                $orderby = " (ABS(lng - '{$lng}') +  ABS(lat - '{$lat}') ) asc ";
//                break;
//        }
		$orderby = " (ABS(lng - '{$lng}') +  ABS(lat - '{$lat}') ) asc ";
        $count = $Shop->where($map)->count();
        $Page = new Page($count, 100);
        $show = $Page->show();
        $var = C('VAR_PAGE') ? C('VAR_PAGE') : 'p';
        $p = $_GET[$var];
        if ($Page->totalPages < $p) {
            die('0');
        }
        $list = $Shop->where($map)->order($orderby)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        
		$reloaded = $this->_param('reloaded');
		
		foreach ($list as $k => $val) {
            $list[$k]['d'] = getDistance($lat, $lng, $val['lat'], $val['lng']);
			$ddd[$k] = $list[$k]['ddd'] = mygetDistance($lat, $lng, $val['lat'], $val['lng']);
			
			$myd = str_replace("m","",$list[$k]['d']);
			$myd = str_replace("k","",$myd);
			if ( (int)$myd > 6500 ) {
				$lat = addslashes(cookie('lat_ok'));
				$lng = addslashes(cookie('lng_ok'));
				if(empty($lat) || empty($lng)){
					$lat = addslashes(cookie('lat'));
					$lng = addslashes(cookie('lng'));
				}
				$this->assign('myd', $myd);
				cookie('myd', $myd);
				
				//<script language='JavaScript'>dingwei('<{:U(\"wap/index/dingwei\",array(\"t\"=>".time().",\"lat\"=>\"".$lat."\",\"lng\"=>\"".$lng."\"))}>', ".$lat.", ".$lng.");
				
				/*echo "<script>setTimeout(g,2000);</script>";*/
				
				/*if ( strlen(cookie('reloaded'))>0) {
					echo "<script>alert('".cookie('reloaded')."');</script>";
				}else{//不管用
				   echo "<script language='JavaScript'>location.href=location.href+'#reloaded';location.reload();</script>";
				}*/

			} 
			
        }
        $shop_ids = array();
        foreach ($list as $key => $v) {
            $shop_ids[$v['shop_id']] = $v['shop_id'];
			
        }
        $shopdetails = D('Shopdetails')->itemsByIds($shop_ids);
        foreach ($list as $k => $val) {
            $list[$k]['price'] = $shopdetails[$val['shop_id']]['price'];
			$list[$k]['favnum'] = D('Shopfavorites')->where(array('shop_id' => $val['shop_id']))->count();
        }
		

        $list2 =  $this->arraySort($list, 'ddd', 'asc');
		
        $this->assign('list', $list2);
        $this->assign('page', $show);
        $this->display();
    }  
   
    public function my() {

        $this->assign('lifecate', D('Lifecate')->fetchAll());
        $this->assign('channel', D('Lifecate')->getChannelMeans());
		
		//获取用户自定坐标
		$lat = cookie('lat');
		$lng = cookie('lng');
		if(empty($lat) || empty($lng)){
			$lat = cookie('lat');
			$lng = cookie('lng');
		}
        if (empty($lat) || empty($lng)) {
            $lat = $this->_CONFIG['site']['lat'];
            $lng = $this->_CONFIG['site']['lng'];
        }
        $orderby = " (ABS(lng - '{$lng}') +  ABS(lat - '{$lat}') ) asc ";
        $shoplist = D('Shop')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'audit' => 1))->order($orderby)->limit(0, 5)->select();
		foreach ($shoplist as $k => $val) {
            $shoplist[$k]['d'] = getDistance($lat, $lng, $val['lat'], $val['lng']);
			//$shoplist[$k]['ddd'] = mygetDistance($lat, $lng, $val['lat'], $val['lng']);
        }
		
		 $shop_brand_list = D('Shop')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'is_brand' => 1))->order($orderby)->select();
           $this->assign('shop_brand_list', $shop_brand_list);
        $news = D('Article')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'audit' => 1))->order(array('create_time' => 'desc'))->limit(0, 5)->select();
		$community = D('Community')->where(array('city_id'=>$this->city_id, 'closed' => 0, 'audit' => 1,))->order($orderby)->limit(0, 5)->select();
		foreach ($community as $k => $val) {
            $community[$k]['d'] = getDistance($lat, $lng, $val['lat'], $val['lng']);
			//$community[$k]['ddd'] = mygetDistance($lat, $lng, $val['lat'], $val['lng']);
        }
		
        $this->assign('shoplist', $shoplist);
        $this->assign('news', $news);
		$this->assign('community', $community);

		$maps = array('status' => 2,'closed'=>0);
		$this->assign('nav',$nav = D('Navigation') ->where($maps)->order(array('orderby' => 'asc'))->select());
		$bg_time = strtotime(TODAY);
		$this->assign('sign_day', $sign_day = (int) D('Usersign')->where(array('user_id' => $this->uid, 'create_time' => array(array('ELT', NOW_TIME), array('EGT', $bg_time))))->count());



               //推荐商圈 lishibo 2019/1/2
          $hostbs =  D('Business')->where(array('is_hot'=>1 ))->order(array('orderby' => 'desc'))->select();
          foreach ($hostbs as $k => $val) {
            $bid = $hostbs[$k]['business_id'];
            $hostbs[$k]['shops'] =  D('Shop')
                ->where(array('business_id'=>$bid ))
                ->order(array('orderby' => 'desc'))
                //->limit(0, 3)
                ->select();
          }
          $this->assign('hostbs',$hostbs);
               //时间内有推荐&&效活动 lishibo 2019/1/2
          $huodong = D('Activity');
          $map_activity = array('audit' => 1,'is_recommend' => 1,'city_id'=>$this->city_id, 'closed' => 0, 'sign_end' => array('EGT', TODAY));
          $activity_index_list = $huodong->where($map_activity)->select();
        //  print_r($activity_index_list);
          $this->assign('activity_index_list',$activity_index_list);
        $this->display();
    }
   

    public function search() {
        $keys = D('Keyword')->fetchAll();
        $keytype = D('Keyword')->getKeyType();
        $this->assign('keys',$keys);
        $this->display();
    }
	
	//获取定位
	public function dingwei(){
        $lat = I('lat');
        $lng = I('lon');
		$url = I('url');
		$address = I('address');
		cookie('lat',$lat,3600);
        cookie('lng',$lng,3600);
		cookie('url', $url);//保存clookie
		list($code,$city_id,$city_name,$msg,$address,$url) = $this->getDingwei($lat, $lng);
		//p($code.'---'.$city_id.'---'.$city_name.'---'.$msg.'---'.$address.'---'.$url);die;			
        $this->ajaxReturn(array('la'=>$lat,'lon'=>$lng,'code'=>$code,'city_id'=> $city_id,'city_name'=> $city_name,'msg'=> $msg,'address'=>$address,'url'=>$url));
    }
	
	//返回定位
	public function getDingwei($lat, $lng){
		$config = D('Setting')->fetchAll();
		$addr = $this->getArea($lat, $lng);
		cookie('addr',$addr, 3600);
		if(!empty($addr)) {
			cookie('location', 2);
		}
		$city = mb_substr($addr['city'], 0, -1, 'utf-8');
		$district = mb_substr($addr['district'], 0, -1, 'utf-8');
	
		$position = $city . $district;
		$city = D('Pinyin')->pinyin($city);//城市拼音
		$district = D('Pinyin')->pinyin($district);//地区拼音
		
		$town = D('City')->where(array('pinyin'=>$district,'is_open' =>1))->find();//城市
		$county = D('City')->where(array('pinyin'=>$city,'is_open' =>1))->find();//县城
		
		
		$city_id = cookie('city_id');
		$cityop = cookie('cityop');
		
		
		
		if(!empty($city_id)){
				if($city_id == $county['city_id'] || $city_id == $town['city_id'] || $cityop == 1) {
					//return array($code = 1,$city_id = 999,$city_name = '有城市了',$msg = '不弹出了',$position);
					return array($code = 1,$city_id = $config['site']['city_id'],$city_name = '有城市了',$msg = '不弹出了',$position);
				}else{
					if(!empty($county)){
						return array($code = 2,$city_id = $county['city_id'],$city_name = $county['name'],$msg = '县城位置【'.$position.'】',$position,$url = U('city/change', array('city_id' => $county['city_id'],'type'=>3)));
					}elseif(!empty($town)) {
						return array($code = 2,$city_id = $town['city_id'],$city_name = $town['name'],$msg = '城市位置【'.$position.'】',$position,$url = U('city/change', array('city_id' => $town['city_id'],'type'=>3)));
					}
				}
			}else{
				if(!empty($county)){
					return array($code = 2,$city_id = $county['city_id'],$city_name = $county['name'],$msg = '当前县城：'.$position,$position,$url = U('city/change', array('city_id' => $county['city_id'],'type'=>3)));
				}elseif(!empty($town)) {
					return array($code = 2,$city_id = $town['city_id'],$city_name = $town['name'],$msg = '当前城市：'.$position,$position,$url = U('city/change', array('city_id' => $town['city_id'],'type'=>3)));
				}else{
					$detail = D('City')->find($config['site']['city_id']);//城市
					return array($code = 6,$city_id = $config['site']['city_id'],$city_name = $detail['name'],$msg = '当前位置：'.$position.'没有匹配到城市 ',$position,$url = U('city/change', array('city_id' => $config['site']['city_id'],'type'=>3)));
				}
			}
		
		
		
	}
	
	//通过接口将坐标转地理位置
    function getArea($lat, $lng){
        $url = 'https://api.map.baidu.com/geocoder/v2/?ak=C9613fa45f450daa331d85184c920119&location=' . $lat . ',' . $lng . '&output=json&pois=1';
        $arr = file_get_contents($url);
        $arr = json_decode($arr);
        $place = $pois = $po = array();
        foreach ($arr->result->pois as $value) {
            $po['name'] = $value->name;
            $po['addr'] = $value->addr;
            $pois[] = $po;
        }
        $place['formatted_address'] = $arr->result->formatted_address;
		$place['city'] = $arr -> result -> addressComponent -> city;
		$place['district'] = $arr -> result -> addressComponent -> district;
        $place['pois'] = $pois;
        return $place;
    }
	
	//中转站
	public function url(){
		$config = D('Setting')->fetchAll();
		$index_mask_cookie = ($config['other']['index_mask_cookie'] >= 7200) ? $config['other']['index_mask_cookie'] : 3600*4;
		if($config['other']['index_mask_show'] && $config['other']['index_mask_url']){
			cookie('index_mask_show',$config['other']['index_mask_cookie'],$config['other']['index_mask_cookie']);
			header("Location:" . $config['other']['index_mask_url']);
			die;
		}else{
			cookie('index_mask_show',$index_mask_cookie);
			header("Location:" . U('Wap/index/index'));
         	die;
		}
    }

	public function more() {
		$maps = array('status' => 2,'closed'=>0);
		$this->assign('nav',$nav = D('Navigation') ->where($maps)->order(array('orderby' => 'asc'))->select());
		$this->display();
	}
	
	
}
