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
        
      


	
<style>
.input {font-size: 16px;}
</style>
	<header class="top-fixed bg-yellow bg-inverse">
		<div class="top-back">
			<a class="top-addr" href="<?php echo U('index/index');?>"><i class="iconfont icon-angle-left"></i></a>
		</div>
		<div class="top-title">
			用户注册
		</div>
		<div class="top-share">
			<a href="<?php echo U('passport/login');?>">登录</a>
		</div>
	</header>

		<form class="reg-form" target="x-frame" action="<?php echo U('passport/register');?>" method="post" >
            <?php if($fuser): ?><div class="line padding border-bottom">
                    <span class="x3"><label>推荐人</label></span>
                    <span class="x9"><?php echo ($fuser['nickname']); ?><input type="hidden" name="fuid" value="<?php echo ($fuser['user_id']); ?>" /></span>
                </div><?php endif; ?>
			<div class="line padding border-bottom">
				<span class="x3"><label>手机号码：</label></span>
				<span class="x9"><input id="mobile" type="text" class="text-input" name="account" placeholder="请输入手机号码"></span>
			</div>
            <?php if($CONFIG[register][wap_register_yzm] == 1): ?><div class="line padding border-bottom">
				<span class="x3"><label>图片验证：</label></span>
				<span class="x4"><input id="sms_yzm" type="text" class="text-input" name="sms_yzm" placeholder="图片验证码"></span>
				<span class="x5"><a rel="tu_img_code" class="yzm_code" href="javascript:void(0);"><img id="tu_img_code" src="__ROOT__/index.php?g=app&m=verify&a=index&mt=<?php echo time();?>" width="60" height="30" /></a><em><a rel="tu_img_code" class="yzm_code" href="javascript:void(0);">换一张</a></span>
			</div><?php endif; ?>

			<div class="line padding border-bottom">
				<span class="x3"><label>短信验证：</label></span>
				<span class="x6"><input id='yzm' type="text" class="text-input" name="scode" placeholder="请输入短信验证码"></span>
				<span class="x3"><button id="m_zcyz" type="button" class="button button-little bg-dot m_zcyz">获取验证码</button></span>
			</div>

			<div class="line padding border-bottom">
				<span class="x3"><label>输入密码：</label></span>
				<span class="x9"><input id='password' type="password" class="text-input" name="data[password]" placeholder="请输入<?php echo ($CONFIG['register']['register_password']); ?>-20位密码"></span>
			</div>
            <?php if($CONFIG[register][wap_register_password2] == 1): ?><div class="line padding border-bottom">
				<span class="x3"><label>确认密码：</label></span>
				<span class="x9"><input id='password_confirm' type="password" class="text-input" name="password2" placeholder="请确认密码"></span>
			</div><?php endif; ?>
            
			<div class="blank-20"></div>
			<div class="container">
				<button type="submit" class="button button-block button-big bg-dot">提交并注册</button>
			</div>

			<div class="blank-20"></div>
			<div class="container">
				<input name="checkbox" type="checkbox" checked="checked"  />
				我能遵守<?php echo ($CONFIG['site']['sitename']); ?>的用户使用协议和国家的法律法规
			</div>
		</form>

	

    <script>
        var mobile_timeout;
        var mobile_count = 100;
        var mobile_lock = 0;
        $(function () {
			var time = "<?php echo time(); ?>";
			$('.yzm_code').click(function(){
				var l = "__ROOT__/index.php?g=app&m=verify&a=index&mt=";
				time = time + 1;
				$('#tu_img_code').attr('src',l+time);
			})
		
            $("#m_zcyz").click(function () {
                if (mobile_lock == 0) {
                    mobile_lock = 1;
					var mobile = $("#mobile").val();
					if(mobile=="" || mobile=="请输入手机号码"){
						layer.msg('请先输入手机号码', function(){
							setTimeout(function () {
							   window.location.href = "<?php echo U('passport/register');?>";
							}, 1000);
						});
						exit;//如果没绑定手机，不执行下面的代码
					}
                    $.ajax({
                        url: '<?php echo U("passport/sendsms");?>',
						data: 'mobile=' + $("#mobile").val() + '&sms_yzm=' + $("#sms_yzm").val(),
                        type: 'post',
                        success: function (data) {
                            if (data == 1) {
                                mobile_count = 60;
                                $(".m_zcyz").addClass("on");
                                $('#m_zcyz').attr("disabled", "disabled");
                                BtnCount();
                            } else {
                                mobile_lock = 0;
                                layer.msg('请检查必填项是否填写，或者该手机已经存在', function(){
								});
                            }
                        }
                    });
                }
            });
        });
		
	


        BtnCount = function () {
            if (mobile_count == 0) {
                $(".m_zcyz").removeClass("on");
                $('#m_zcyz').removeAttr("disabled");
                $('#m_zcyz').html("重新发送");
                mobile_lock = 0;
                clearTimeout(mobile_timeout);
            }
            else {
                mobile_count--;
                $('#m_zcyz').html("获取(" + mobile_count.toString() + ")秒");
                mobile_timeout = setTimeout(BtnCount, 1000);
            }
        };

		
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