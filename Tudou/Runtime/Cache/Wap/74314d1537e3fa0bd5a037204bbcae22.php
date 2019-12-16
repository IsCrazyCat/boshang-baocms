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
        
      


	   
	<header class="top-fixed bg-yellow bg-inverse">
		<div class="top-back">
			<a class="top-addr" href="javascript:history.back();"><i class="iconfont icon-angle-left"></i></a>
		</div>
		<div class="top-title">
			订单支付
		</div>
	</header>  
    
<style>
.layui-layer-page .layui-layer-content{ padding:20px;}
.layui-layer-page .layui-layer-content input[type='password']{ width:100%; height:36px; border:1px solid #ccc; background:#fff; margin-bottom:10px; text-indent:10px; font-size:14px;}
.layui-layer-page .layui-layer-content input[type='button']{ width:100%; height:40px; border:none; background:#2FBDAA; color:#fff; font-size:16px;cursor:pointer}
.reset_password{cursor:pointer}
.layui-layer-page .layui-layer-content input.blue{background:#33b095;}
.layui-layer-page .layui-layer-content p{ line-height:28px; color:#999;}
.layui-layer-page .layui-layer-content .check_box{ overflow:hidden; margin-bottom:5px;}
.layui-layer-page .layui-layer-content .check_box label{ display:block; float:left; margin-right:20px; margin-bottom:10px;}
</style>	


	<div class="tuan-order">
		<div class="blank-10 bg"></div>
		<div class="line border-top border-bottom">
			<div class="container">
				<div class="x12 row border-bottom">
					<span class="float-left">
						支付编号
					</span>
					<span class="float-right">
						<?php echo ($logs["log_id"]); ?>
					</span>
				</div>
				<div class="x12 row border-bottom">
					<span class="float-left">
						付款缘由
					</span>
					<span class="float-right">
						<?php echo ($types[$logs['type']]); ?>
					</span>
				</div>
                <div class="x12 row border-bottom">
					<span class="float-left">
						支付方式
					</span>
					<span class="float-right">
						<?php echo ($paytypes[$logs['code']]); ?>
					</span>
				</div>
				<div class="x12 row">
					<span class="float-left">
						实际支付金额
					</span>
					<span class="float-right text-dot">
					&yen; <?php echo round($logs['need_pay']/100,2);?>元
					</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="blank-50"></div>
	<div class="container">
	<?php echo ($button); ?>
	</div>
    
<div class="blank-20"></div>



<!--支付宝支付-->
<?php if($paytype[$logs['code']]['code'] == alipay): ?><script type="text/javascript">
	$(document).ready(function(){
		$("#alipaysubmit").submit();
	});
</script><?php endif; ?>


<!--微信公众号支付-->
<?php if($logs['code'] == weixin): ?><script type="text/javascript">
		callpay();
    </script><?php endif; ?>




<!--余额支付-->   
<?php if($paytype[$logs['code']]['code'] == money): ?><script type="text/javascript">
	$(document).ready(function(){
	 	var url = "<?php echo ($host); echo U('user/member/pay',array('logs_id'=>$logs['log_id'],'code'=>'money'));?>";
		layer.msg('正在启动余额支付，请稍后......');
		if(url){
			setTimeout(function (){
				window.location.href = url;
			},1000);
		}
	});
</script><?php endif; ?>

<!--积分支付-->   
<?php if($paytype[$logs['code']]['code'] == integral): ?><script type="text/javascript">
	$(document).ready(function(){
	 	var url = "<?php echo ($host); echo U('user/member/pay',array('logs_id'=>$logs['log_id'],'code'=>'integral'));?>";
		layer.msg('正在启动积分支付，请稍后......');
		if(url){
			setTimeout(function (){
				window.location.href = url;
			},1000);
		}
	});
</script><?php endif; ?>


<!--微信APP支付-->   
<script type="text/javascript">
	function wxpay(){
       var out_trade_no = "<?php echo ($logs['log_id']); ?>";
        $.ajax({
            type:'post',
            url: "<?php echo U('app/pay/order');?>", 
            dataType:'json',
            data: {log_id: out_trade_no},
            async: true,
            timeout: 200000,
            success: function(data){
                pay(data);
            }
        });
    }
    function pay(data){
        var order = data;
        payType(order, "WEIXIN", "payResult");
    }
    function payResult(r) {
        if(r == 0){
            setTimeout(function(){
				layer.msg('支付成功');
			}, 2000);
            window.location.href="<?php echo U('wap/payment/yes',array('log_id'=>$logs['log_id']));?>";
        }else{
            setTimeout(function(){
				layer.msg('支付失败请刷新后再试');
			}, 2000);
        }
    }
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