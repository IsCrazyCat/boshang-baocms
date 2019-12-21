<?php if (!defined('THINK_PATH')) exit(); $mobile_title = $detail["nickname"]."给你推荐的二维码"; $mobile_description = '点击查看二维码'.$detail["nickname"]."给您分享的二维码，快去看看吧！"; ?>
<!DOCTYPE html>
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
			// var url = "<?php echo ($url); ?>";
			// var geolocation = new BMap.Geolocation();
			// geolocation.getCurrentPosition(function(r){
			// 	if(this.getStatus() === 0) {
			// 		var address = r.address.province + r.address.city + r.address.district + r.address.street;
			// 		$.post("/wap/index/dingwei.html",{lat:r.point.lat,lon:r.point.lng,address:address,url:url,type:'browser'},function(response){
			//
			// 			$("span[attr-ctrl='distance']").each(function(){
			// 				var lat = $(this).attr("attr-lat");
			// 				var lon = $(this).attr("attr-lon");
			// 				d = getGreatCircleDistance(lat,lon,response.lat,response.lon);
			// 				$(this).html(d);
			// 			});
			//
			// 			if(response.code == 1){
			// 				return false;
			// 			}
			//
			// 			//没有匹配到城市
			// 			if(response.code == 6){
			// 				layer.confirm(response.msg, {
			// 				  btn: ['去默认城市','关闭'] //按钮
			// 				},function(){
			// 				  layer.msg('正在带您去默认城市'+response.city_name, {icon:1});
			// 				  location.href = response.url;
			// 				},function(){
			//
			// 				});
			// 			}
			//
			// 			//已经匹配到城市
			// 			if(response.code == 2){
			// 				 layer.confirm(response.msg,{icon: 6}, function(){
			// 					location.href = response.url;
			// 				 });
			// 			}
			//
			//
			//
			// 		});
			// 	}else {
			// 		layer.msg('定位失败，原因：' + this.getStatus(),2000,2);
			// 	}
			// },{enableHighAccuracy: true});
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
        
      


	
<header class="top-fixed bg-yellow bg-inverse">
	<div class="top-back">
		<a class="top-addr" href="<?php echo U('index/index');?>"><i class="iconfont icon-angle-left"></i></a>
	</div>
		<div class="top-title">
			<?php echo ($detail['nickname']); ?>的二维码
		</div>
	<div class="top-signed">
		
	</div>
</header>

<div class="list-media-x" id="list-media">
	<ul>
		<div class="container">

			<div class="padding-large">
				<img src="<?php echo config_img($file);?>" width="100%" />
			</div>
			<p class="text-center">尊敬的<?php echo ($detail['nickname']); ?>，分享当前页面获得奖金。</p>

		</div>

	</ul>
</div>


<script src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript"></script>
<script>
    wx.config({
	debug: false,
	appId: '<?php echo ($signPackage["appId"]); ?>',
    timestamp: '<?php echo ($signPackage["timestamp"]); ?>',
    nonceStr: '<?php echo ($signPackage["nonceStr"]); ?>',
    signature: '<?php echo ($signPackage["signature"]); ?>',
	jsApiList: [
		'checkJsApi',
		'onMenuShareTimeline',
		'onMenuShareAppMessage',
		'onMenuShareQQ',
		'onMenuShareWeibo',
		'onMenuShareQZone'
		]
	});

wx.ready(function () {
    wx.onMenuShareTimeline({
            title: '<?php echo ($detail["nickname"]); ?>."给您分享的二维码"',
        	link: "<?php echo ($CONFIG["site"]["host"]); echo U('wap/api/qrcode',array('fuid'=>$MEMBER['user_id'],'controller'=>$ctl,'action'=>$act,'user_id'=>$MEMBER['user_id']));?>", 
        	imgUrl: "<?php echo config_weixin_img($file);?>", 
            success: function (){
				layer.msg('分享成功');
			},
            cancel: function (){ 
				layer.msg('分享失败');
			}
     });
     //分享给朋友
     wx.onMenuShareAppMessage({
            title: '<?php echo ($detail["nickname"]); ?>."给您分享的二维码"',
            desc: '<?php echo ($detail["nickname"]); ?>."给您分享二维码了，快去扫码看看吧"',
            link: "<?php echo ($CONFIG["site"]["host"]); echo U('wap/api/qrcode',array('fuid'=>$MEMBER['user_id'],'controller'=>$ctl,'action'=>$act,'user_id'=>$MEMBER['user_id']));?>", 
        	imgUrl: "<?php echo config_weixin_img($file);?>", 
            type: '',
            dataUrl: '',
            success: function (){
				layer.msg('分享成功');
			},
            cancel: function (){ 
				layer.msg('分享失败');
			}
      });
});
</script>

<div class="blank-20"></div>
<footer class="foot-fixed">

    <a class="foot-item <?php if($ctl == 'index'): ?>active<?php endif; ?>" href="<?php echo u('wap/index/index');?>">
        <span class="iconfont icon-shouye"></span>
        <span class="foot-label">首页</span>
    </a>

    <a class="foot-item  <?php if(($ctl == 'mall')): ?>active<?php endif; ?>" href="<?php echo u('wap/mall/index');?>">
    <span class="iconfont icon-maidan"></span><span class="foot-label">找工作</span></a>

    <a class="foot-item  <?php if($ctl == 'information'): ?>active<?php endif; ?>" href="<?php echo u('information/index');?>">
    <span class="iconfont icon-guanli"></span><span class="foot-label">排行榜</span></a>

    <a class="foot-item  <?php if($act == 'member'): ?>active<?php endif; ?> " href="<?php echo LinkTo('user/member/index');?>">
    <span class="iconfont icon-fabu"></span><span class="foot-label">个人中心</span></a>
</footer>

</body>
</html>