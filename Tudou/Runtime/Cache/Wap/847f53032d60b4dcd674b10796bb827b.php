<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8">
		<title><?php if(!empty($mobile_title)): echo ($mobile_title); ?>_<?php endif; echo ($CONFIG["site"]["sitename"]); ?></title>
        <meta name="keywords" content="<?php echo ($mobile_keywords); ?>" />
        <meta name="description" content="<?php echo ($mobile_description); ?>" />
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<link rel="stylesheet" href="/static/default/wap/css/base.css">
        <link rel="stylesheet" href="<?php echo ($CONFIG['config']['iocnfont']); ?>">
        <link rel="stylesheet" href="<?php echo ($CONFIG['config']['iocnfont2']); ?>">
        <link rel="stylesheet" href="/static/default/wap/css/<?php echo ($ctl); ?>.css?v=<?php echo ($today); ?>"/>
        <link rel="stylesheet" href="/static/default/wap/css/animate.css">
	
        
		<script src="/static/default/wap/js/jquery.js"></script>
        <script src="/static/default/wap/js/base.js"></script>
		<script src="/static/default/wap/other/layer.js"></script>
        <script src="/static/default/wap/js/jquery.form.js"></script>
		<script src="/static/default/wap/other/roll.js"></script>
		<script src="/static/default/wap/js/public.js?v=<?php echo ($today); ?>"></script>
	    <script src="/static/default/wap/js/mobile_common.js?v=jszj"></script>
        <script src="/static/default/wap/js/iscroll-probe.js"></script>
        <script src="/static/default/wap/js/app.js"></script>
    </head>
<body>

<?php if(empty($lat)): ?><script>
		doLocation();		
		//获取距离
		function initLocation(){
			var url = "<?php echo ($url); ?>";
			var geolocation = new BMap.Geolocation();
			geolocation.getCurrentPosition(function(r){
				if(this.getStatus() === 0) {
					var address = r.address.province + r.address.city + r.address.district + r.address.street;
					$.post("/wap/index/dingwei.html",{lat:r.point.lat,lon:r.point.lng,address:address,url:url,type:'browser'},function(response){
						
						$("span[attr-ctrl='distance']").each(function(){   
							var lat = $(this).attr("attr-lat");
							var lon = $(this).attr("attr-lon");
							d = getGreatCircleDistance(lat,lon,response.lat,response.lon);
							$(this).html(d);
						});
						
						if(response.code == 1){
							return false;
						}
						
						//没有匹配到城市
						if(response.code == 6){
							layer.confirm(response.msg, {
							  btn: ['去默认城市','关闭'] //按钮
							},function(){
							  layer.msg('正在带您去默认城市'+response.city_name, {icon:1});
							  location.href = response.url;
							},function(){
							  
							});
						}
						
						//已经匹配到城市
						if(response.code == 2){
							 layer.confirm(response.msg,{icon: 6}, function(){
								location.href = response.url;
							 });
						}
				
						
						
					});
				}else {
					layer.msg('定位失败，原因：' + this.getStatus(),2000,2);
				}        
			},{enableHighAccuracy: true});
		}
		function doLocation(){
			var script = document.createElement("script");
			script.src ="https://api.map.baidu.com/api?v=2.0&ak=te1e01OcptQgwrg4SyBdPx6h&callback=initLocation";
			document.body.appendChild(script);
		}
		
		//计算距离
		var EARTH_RADIUS = 6378137.0; 
		var PI = Math.PI;
		function getRad(d){
			return d*PI/180.0;
		}
		//定为换算
		function getGreatCircleDistance(lat1,lng1,lat2,lng2){
			var radLat1 = getRad(lat1);
			var radLat2 = getRad(lat2);
			var a = radLat1 - radLat2;
			var b = getRad(lng1) - getRad(lng2);
			var s = 2*Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) + Math.cos(radLat1)*Math.cos(radLat2)*Math.pow(Math.sin(b/2),2)));
			s = s*EARTH_RADIUS;
			s = Math.round(s*10000)/10000000.0;
			s = s.toFixed(2) + 'KM';
			return s;
		}
    </script><?php endif; ?>
        
      


	
<?php $areas = D('Area')->where(array('city_id'=>$city_id))->select(); foreach ($areas as $val) { $area_ids[$val['area_id']] = $val['area_id']; } $bizs = D('Business')->where(array('area_id'=>array('IN',$area_ids)))->select(); $Area = D('Area')->find($area); $business = D('Business')->find($business); ?>


<script src="/static/default/wap/js/fontscroll.js"></script>
<link rel="stylesheet" href="/static/default/wap/css/mall.css"/>
<style>
    .top-fixed .top-title{width:80%;}
    .item-list h5 { height: inherit;}
    .is_renzheng{background: #33b095;padding: 0 3px;color: #fff !important;font-size: 12px;margin-right: 5px; height: 16px;line-height: 16px;margin-top: 3px;}
    .cate-wrap{font-size:0;background-color:#fff;border-bottom:1px solid #f3f3f3;width:100%;overflow:hidden;}
    .cate-wrap li{box-sizing:border-box;width:20%;float:left}
    .icon2{color:#555;font-size:16px;text-align:center;display:block;padding:.6rem 0}
    .cate-img{background-size:6rem auto;display:inline-block}
    .cate-img img{width:2.6rem;height:2.6rem}
    .cate-desc{display:block}
    .cate-desc{padding-top:.4rem}
    .container {margin-top: 0rem;}
    .item-list img{position:relative;padding:0px; }
    .item-list li span.album{ font-size:12px; color:#FFF;margin-right: 1px;position:absolute;bottom:0;width:100%;height:20px;line-height:20px;text-align:center;background: rgba(0,0,0,0.3);}
    .tuiguang{background:#F63;padding: 0 3px;color: #fff !important;font-size: 12px;margin-right: 5px;height: 16px;line-height: 16px;margin-top: 3px;}

    .tudou_scroll{position:relative;height: 220px;}
    .tudou_scroll_box {width:auto;height: 30px;position:relative;background: rgba(138, 134, 134, 0.55);background-position: 5px;background-size: 50px auto;top: 4rem;position: absolute;border-radius: 1.08rem;}
    .tudou_scroll_box .tudou_scroll {padding-left:5px; height: 30px;line-height: 30px;overflow: Hidden; margin: 0 auto;}
    .tudou_scroll_box .tudou_scroll li {height: 30px;line-height: 30px;overflow: hidden;}
    .tudou_scroll_box .tudou_scroll img { border-radius:100%}
    .tudou_scroll_box .tudou_scroll li i {float: right;height: 30px;line-height: 30px;padding: 0 10px 0 20px;font-size: 12px;color: #999;}
    .tudou_scroll_box .tudou_scroll li a {font-size: 12px;color:#fff;}


</style>

<style>
    .focus-banner-bottom {
        display: -webkit-box;
        height: 3px
    }

    .focus-banner-bottom li {
        width: 20%;
        display: block;
        -moz-box-flex: 1;
        -webkit-box-flex: 1;
        box-flex: 1
    }
    .index-items{
        background: #efeff4;
    }
    .index-items p{
        margin:0px;
        padding:0px;
    }
    .index-items li{
        list-style-type: none;
        margin: 0 .2rem;
        position: relative;
        clear: both;
        overflow: hidden;
        background: #FFF;
    }
    .item-image {
        padding: .3rem .3rem;
        float: left;
        width: 25%;
        height: auto;
        position: relative;
    }

    .items-tag img{
        width: 60%;
        margin-left: 20%;
        margin-top: 15px;
        margin-bottom: 15px;
    }

    .item-image img {
        display: block;
        height: 4rem;
    }
    .item-image img {
        border-radius: 0.22rem;
        margin-top: .3rem;
        margin-left: 0.25rem;
        width: 100%;
        object-fit: cover;
    }
    .item-inner{
        width:70%;
        margin-left:30%;
        margin-top:4%;
        border-bottom: 1px #f1f1f1 solid;
    }
    .item-amount{
        position: absolute;
        text-align: center;
        font-size: .6rem;
        width: 3.8rem;
        height: 2.5rem;
        line-height: 1.25rem;
        right: 10px;
        top: 50%;
        transform: translateY(-40%);
    }
    .item-inner .item-amount p:first-child {
        background: #0894ec;
        color: #FFF;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
    }
    .item-inner .item-amount p:last-child {
        font-size: .6rem;
        color: #fd9f2d;
        border-left: 1px solid #fd9f2d;
        border-right: 1px solid #fd9f2d;
        border-bottom: 1px solid #fd9f2d;
        border-bottom-left-radius: 3px;
        border-bottom-right-radius: 3px;
    }
    .item-inner .item-amount p {
        height: 1.0rem;
        line-height: 1.0rem;
    }
    .hot-mark {
        background: #fd9f2d !important;
    }
    .stop-mark {
        background: #859199 !important;
        border: 1px solid #859199;
    }
    .item-number{
        font-size: 0.9rem;
        font-weight: bold;
    }
    .index-item-subtitle {
        font-size: .5rem;
        line-height: 1.5rem;
        height: 1.5rem;
        color: #626262;
        width: 65%;
        overflow: hidden;
    }
    .item-inner .item-price-row p {
        font-size: .425rem;
        color: #939393;
        vertical-align: middle;
        line-height: 1.0rem;
    }
    .item-inner .item-price-row .price-price span {
        font-size: .9rem;
        color: #fd9f2d;
        margin-top: 5px;
        font-weight: bold;
    }

</style>
<header class="top-fixed bg-yellow bg-inverse">
    <div class="top-back">
        <a class="top-addr" href="<?php echo U('index/index');?>"><i class="iconfont icon-angle-left"></i></a>
    </div>
    <?php if(empty($keyword)): ?><div class="top-title  get-map-marker">工作首页</div><?php endif; ?>

    <div class="top-search" style="<?php if(empty($keyword)): ?>display:none;<?php endif; ?>">
    <form method="post" action="<?php echo LinkTo('mall/index',$linkArr,array('keyword'=>'0'));?>">
        <input name="keyword" placeholder="<?php echo (($keyword)?($keyword):'输入工作的关键字'); ?>"  />
        <button type="submit" class="iconfont icon-search"></button>
    </form>
    </div>
    <?php if(empty($keyword)): ?><div class="top-signed">
            <a id="search-btn" href="javascript:void(0);"><i class="iconfont icon-search"></i></a>
        </div><?php endif; ?>
</header>

<script>
    $(function(){
        $("#search-btn").click(function(){
            if($(".top-search").css("display")=='block'){
                $(".top-search").hide();
                $(".top-title").show(200);
            }
            else{
                $(".top-search").show();
                $(".top-title").hide(200);
            }
        });
        var time = "3000";
        $('#tudou_scroll').FontScroll({time:time,num:1});
    });
</script>

<?php if(empty($cat) && empty($cate_id) && empty($business_id) && empty($order) && empty($keyword)): ?><ul class="cate-wrap bbOnepx">
        <?php $a = 0; ?>
        <?php if(is_array($goodscates)): $i = 0; $__LIST__ = $goodscates;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i; if(($item["parent_id"]) == "0"): $a++; ?>
                <?php if($a < 11): ?><li>
                        <a class="icon2" href="<?php echo U('mall/index',array('cat'=>$item['cate_id']));?>" tongji_tag="m_home_job_new">
                            <span class="cate-img" id="job"><img src="<?php echo config_img($item['photo']);?>" /></span>
                            <span class="cate-desc"><?php echo tu_msubstr($item['cate_name'],0,4,false);?></span>
                        </a>
                    </li><?php endif; endif; endforeach; endif; else: echo "" ;endif; ?>
    </ul><?php endif; ?>


<?php if(!empty($cat)): ?><ul class="cate-wrap bbOnepx">
        <?php $a = 0; ?>
        <?php if(is_array($goodscates)): $i = 0; $__LIST__ = $goodscates;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i; if(($item["parent_id"]) == $cat): $a++; ?>
                <?php if($a < 11): ?><li>
                        <a class="icon2" href="<?php echo U('mall/index',array('cate_id'=>$item['cate_id']));?>" tongji_tag="m_home_job_new">
                            <span class="cate-img" id="job"><img src="<?php echo config_img($item['photo']);?>" /></span>
                            <span class="cate-desc" <?php if(($item['cate_id']) == $cate_id): ?>style="color:#F00"<?php endif; ?> ><?php echo tu_msubstr($item['cate_name'],0,4,false);?></span>
                        </a>
                    </li><?php endif; endif; endforeach; endif; else: echo "" ;endif; ?>
    </ul><?php endif; ?>



<div id="filter2" class="filter2">
    <ul class="tab clearfix">
        <li class="item">
            <a href="javascript:void(0);">


                <?php if($cate_id): ?><span id="str_b_node" style="color:#f60"> <?php echo ($goodscates[$cate_id]['cate_name']); ?></span>
                    <?php else: ?>
                    <?php if($cat): ?><span id="str_b_node" style="color:#f60"> <?php echo ($goodscates[$cat]['cate_name']); ?></span>
                        <?php else: ?>
                        <span id="str_b_node">选择分类</span><?php endif; endif; ?>

                <em></em>
            </a>
        </li>
        <li class="item">
            <a href="javascript:void(0);">
                <?php if(!empty($business)): ?><span id="str_b_node" style="color:#f60;"><?php echo ($business['business_name']); ?></span>
                    <?php else: ?>
                    <?php if(!empty($area)): ?><span id="str_b_node" style="color:#f60;"><?php echo ($areass[$area]['area_name']); ?></span>
                        <?php else: ?>
                        <span id="str_d_node">选择地区</span><?php endif; endif; ?><em></em>
            </a>
        </li>
        <li class="item">
            <a href="javascript:void(0);">
                <?php if(empty($order)): ?><span id="str_e_node">选择排序</span>
                    <?php elseif($order == 1): ?>
                    <span id="str_b_node" style="color:#f60;">时间排序</span>
                    <?php elseif($order == 2): ?>
                    <span id="str_b_node" style="color:#f60;">销量排序</span>
                    <?php elseif($order == 3): ?>
                    <span id="str_b_node" style="color:#f60;">价格最高</span>
                    <?php elseif($order == 4): ?>
                    <span id="str_b_node" style="color:#f60;">价格最低</span>
                    <?php elseif($order == 5): ?>
                    <span id="str_b_node" style="color:#f60;">置顶商品</span><?php endif; ?>
                <em></em>
            </a>
        </li>

        <?php if(!empty($cat) or !empty($cate_id)): ?><li class="item">
                <a href="javascript:void(0);">
                    <span id="str_b_node">筛选属性</span>
                    <em></em>
                </a>
            </li><?php endif; ?>


    </ul>

    <div class="inner" style=" display:none">
        <ul>
            <li class="item">
                <a class="rights" href="<?php echo LinkTo('mall/index',$linkArr,array('cat'=>'0','cate_id'=>'0'));?>">全部分类</a>
            </li>
            <?php if(is_array($goodscates)): foreach($goodscates as $key=>$var): if($var["parent_id"] == 0): ?><li id="cat_<?php echo ($var['cate_id']); ?>"><a class="rights hasUlLink" title="<?php echo ($var["cate_name"]); ?>" href="javascript:void(0);>"><?php echo ($var["cate_name"]); ?><span class="num"></span></a>
                        <ul id="items0">
                            <?php if(is_array($goodscates)): foreach($goodscates as $key=>$product): if($product["parent_id"] == $var['cate_id']): ?><li><a title="<?php echo ($product["cate_name"]); ?>" href="<?php echo LinkTo('mall/index',$linkArr,array('cate_id'=>$product['cate_id']));?>"><?php echo ($product["cate_name"]); ?></a><?php endif; endforeach; endif; ?>
                        </ul>
                    </li><?php endif; endforeach; endif; ?>

        </ul><!--1级end-->

    </div>


    <div class="inner" style=" display:none">
        <ul id="inner2">
            <li class="item">
                <a class="rights" href="<?php echo LinkTo('mall/index',$linkArr,array('cat'=>$cat));?>">全部地区</a>
            </li>
            <?php if(is_array($areas)): foreach($areas as $key=>$var): if($var['city_id'] == $city_id){ ?>
                <li id="cat_<?php echo ($var['cate_id']); ?>"><a class="rights hasUlLink" title="<?php echo ($var["cate_name"]); ?>" href="javascript:void(0);>"><?php echo ($var["area_name"]); ?></a>
                    <ul id="items0">
                        <li><a href="<?php echo LinkTo('mall/index',$linkArr,array('area'=>$area_id));?>" class="<?php if(empty($business_id)): ?>on<?php endif; ?>">全部商圈</a></li>
                        <?php if(is_array($bizs)): foreach($bizs as $key=>$product): if($product["area_id"] == $var['area_id']): ?><li><a title="<?php echo ($product["business_name"]); ?>" href="<?php echo LinkTo('mall/index',$linkArr,array('area'=>$var['area_id'],'business'=>$product['business_id']));?>"> <?php echo ($product["business_name"]); ?></a><?php endif; endforeach; endif; ?>
                    </ul>
                </li>
                <?php } endforeach; endif; ?>
        </ul>
    </div>



    <div class="inner" style="display:none;">
        <ul>
            <li><a <?php if(empty($order)): ?>style="color:red;"<?php endif; ?> href="<?php echo LinkTo('mall/index',$linkArr,array('order'=>'0'));?>">默认排序</a></li>
            <li><a <?php if($order == 1): ?>style="color:red;"<?php endif; ?> href="<?php echo LinkTo('mall/index',$linkArr,array('order'=>'1'));?>">时间排序</a></li>
            <li><a <?php if($order == 2): ?>style="color:red;"<?php endif; ?> href="<?php echo LinkTo('mall/index',$linkArr,array('order'=>'2'));?>">销量排序</a></li>
            <li><a <?php if($order == 3): ?>style="color:red;"<?php endif; ?> href="<?php echo LinkTo('mall/index',$linkArr,array('order'=>'3'));?>">价格最高</a></li>
            <li><a <?php if($order == 4): ?>style="color:red;"<?php endif; ?> href="<?php echo LinkTo('mall/index',$linkArr,array('order'=>'4'));?>">价格最低</a></li>
        </ul>
    </div>


    <div class="inner" style=" display:none">
        <ul id="inner2">
            <li class="item"><a style="color:#F00" class="rights" href="<?php echo LinkTo('mall/index',array('cat'=>$cat,'cate_id'=>$cate_id));?>">重新筛选</a></li>
            <?php if(is_array($TpGoodsAttribute)): foreach($TpGoodsAttribute as $key=>$item): ?><li><a class="rights hasUlLink" title="<?php echo ($item["attr_name"]); ?>" href="javascript:void(0);>"><?php echo ($item["attr_name"]); ?></a>
                    <ul id="items0">

                        <?php $attr_id = trim($item['attr_id']); $v3 = 'values_'.$attr_id; $v2 = trim($v3); ?>

                        <li><a <?php if(empty($query[$v2])): ?>style="color:#F00"<?php endif; ?> href="<?php echo LinkTo('mall/index',$linkArr,array('attr_id'=>$attr_id,$v2=>'0'));?>">全部属性</a></li>
                        <?php if(is_array($item['attr_values'])): foreach($item['attr_values'] as $key=>$item2): $value = trim($item2); $attr_id = trim($item['attr_id']); $val2 = 'values_'.$attr_id; foreach($query as $kkk=>$vvv){ $querys[]= trim($vvv); } $item3 = trim($item2); ?>
                            <li><a <?php if(in_array($item3,$querys)){?> style="color:#F00" <?php }?>href="<?php echo LinkTo('mall/index',$linkArr,array('attr_id'=>$attr_id,$val2=>$value));?>"> <?php echo ($item2); ?></a><?php endforeach; endif; ?>
                    </ul>
                </li><?php endforeach; endif; ?>
        </ul>
    </div>





    <div id="parent_container" class="inner_parent" style="display:none;"><div class="innercontent"></div></div>
    <div id="inner_container" class="inner_child" style="display:none;"><div class="innercontent"></div></div>
</div>
<!--end-->

<div id="fullbg" class="fullbg" style="display: none; height: 250px;"><i class="pull2"></i></div>

<div id="job-list">
    <ul class="index-items" id="index-joblist"></ul>
</div>

<script>
    $(document).ready(function () {
        showFilter({ibox:'filter2',content1:'parent_container',content2:'inner_container',fullbg:'fullbg'});
        loaddata('<?php echo ($nextpage); ?>', $("#job-list ul"), true);

    });
</script>



   
<div class="footer">
    
    当前城市：<a class="button button-small text-yellow" href="<?php echo U('city/index',array('type'=>$ctl));?>" title="<?php echo tu_msubstr($city_name,0,4,false);?>"><?php echo tu_msubstr($city_name,0,4,false);?></a>   
    
    <?php $SHOP = D('Shop')->where(array('user_id'=>$MEMBER['user_id']))->find(); $footer_menu = $CONFIG['other']['footer_menu'] ? $CONFIG['other']['footer_menu'] : '5'; ?>
    
	<style>
       .footer-search{padding:15px;background:#fff;border-bottom:thin solid #eee;padding-bottom:5px}
	   <?php if($footer_menu == 3): ?>.foot-fixed .foot-item {width:33.3333333336% !important;}
	   <?php elseif($footer_menu == 4): ?>
	   		.foot-fixed .foot-item {width:25% !important;}
	   <?php elseif($footer_menu == 5): ?>
	   		.foot-fixed .foot-item {width:20% !important;}
	   <?php elseif($footer_menu == 6): ?>
	   		.foot-fixed .foot-item {width:16.666666667% !important;}<?php endif; ?>
    </style>   
        
    <?php if(empty($SHOP)): if($ctl == index): ?><a href="<?php echo U('user/apply/index');?>"> 入驻商家</a><?php endif; ?>
    	<?php if($ctl == shop): ?><a href="<?php echo U('user/apply/index');?>"> 入驻商家</a><?php endif; ?>
        <?php if($ctl == ele): ?><a href="<?php echo U('user/apply/index');?>"> 入驻外卖频道</a><?php endif; ?>
        <?php if($ctl == coupon): ?><a href="<?php echo U('user/apply/index');?>"> 我要发布优惠券</a><?php endif; ?>
        <?php if($ctl == farm): ?><a href="<?php echo U('user/apply/index');?>"> 入驻农家乐</a><?php endif; ?>
        <?php if($ctl == market): ?><a href="<?php echo U('user/apply/index');?>"> 入驻菜市场乐</a><?php endif; ?>
        <?php if($ctl == store): ?><a href="<?php echo U('user/apply/index');?>"> 入驻便利店</a><?php endif; ?>
        <?php if($ctl == mall): ?><a href="<?php echo U('user/apply/index');?>"> 我要发布商品</a><?php endif; endif; ?>
    
    <?php if($MEMBER['user_id']): ?><a href="<?php echo U('user/member/index');?>" title="个人中心">个人中心</a>
    <?php else: ?>
    	<a href="<?php echo U('wap/passport/login');?>" title="登录">登录</a>
        <a href="<?php echo U('wap/passport/register');?>" title="注册">注册</a><?php endif; ?>
</div>




<div class="blank-20"></div>
<?php if($CONFIG[other][footer] == 1): ?><footer class="foot-fixed">
    	<?php $kkkk=0; ?>
        <?php if(is_array($nav_footer)): $i = 0; $__LIST__ = $nav_footer;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i; $kkkk++;if($kkkk <= $footer_menu){ ?>
                <a class="foot-item <?php if($ctl == $item['title']): ?>active<?php endif; ?>" href="<?php echo config_navigation_url($item['url'],2);?>?nav_id=<?php echo ($item['nav_id']); ?>">		
                    <span class="<?php echo ($item["ioc"]); ?> iconfont"></span>
                    <span class="foot-label"><?php echo tu_msubstr($item['nav_name'],0,2,false);?></span>
                </a>
            <?php } endforeach; endif; else: echo "" ;endif; ?>
    </footer><?php endif; ?>




<iframe id="x-frame" name="x-frame" style="display:none;"></iframe>
</body>
</html>