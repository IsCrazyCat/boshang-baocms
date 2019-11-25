<?php if (!defined('THINK_PATH')) exit(); $mobile_title = $detail['title']; ?>
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
			<a class="top-addr" href="<?php echo U('news/index');?>"><i class="iconfont icon-angle-left"></i></a>
		</div>
		<div class="top-title">
			<?php echo ($cate[cate_name]); ?>
		</div>
		 <div class="top-search" style="display:none;">
			<form method="post" action="<?php echo U('news/index');?>">
				<input name="keyword" placeholder="输入新闻的关键字"  />
				<button type="submit" class="iconfont icon-search"></button> 
			</form>
		</div>
        <div class="top-signed">
			<a id="search-btn" href="javascript:void(0);"><i class="iconfont icon-search"></i></a>
		</div>
	</header>
<style>
.comm-list img {width: 30px;height: 30px;}
.media, .media .media {border-bottom: thin solid #EEE;}
.comm-list .level-1 p {border-bottom: 0;}
.form-button{ padding:5px 10px;}
.comm-list p a.amount {color: #06C1AE;}
.form-button a.x5{ margin-right:10px;}
.layui-layer-page .layui-layer-content{ padding:20px;}
.layui-layer-page .layui-layer-content input[type='text']{ width:100%; height:36px; border:1px solid #ccc; background:#fff; margin-bottom:10px; text-indent:10px; font-size:14px;}
.layui-layer-page .layui-layer-content input[type='button']{ width:100%; height:40px; border:none; background:#33b095; color:#fff; font-size:16px;}
.layui-layer-page .layui-layer-content p{ line-height:28px; color:#999;}
.layui-layer-page .layui-layer-content .check_box{ overflow:hidden; margin-bottom:5px;}
.layui-layer-page .layui-layer-content .check_box label{ display:block; float:left; margin-right:20px; margin-bottom:10px;}
#pay-video{overflow: hidden; position: relative;display: initial;}
#video{ width:100%;height:auto;margin:auto;}


</style>	
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

		});
    </script>
	<div class="detail">
		<div class="blank-10"></div>
		<h1><?php echo ($detail["title"]); ?></h1>
        <p class="detail-des" id="pay-video">
            <?php if(!empty($detail['video'])): ?><!--如果有-->
                <video id="video" controls="" preload="none" mediagroup="myVideoGroup" poster="<?php echo config_img($detail['video_photo']);?>"> 
                      <source id="mp4" src="<?php echo ($detail['video']); ?>" type="video/mp4"> 
                </video><?php endif; ?>
            <script src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script> 
            <script> 
                document.getElementById('car_audio').play(); 
                document.addEventListener("WeixinJSBridgeReady", function () { 
                    document.getElementById('car_audio').play(); 
                    document.getElementById('video').play(); 
                }, false); 
            </script> 
		</p>

		 <p class="detail-des">
         	<?php if($detail['shop']['shop_id']): ?><em class="margin-small-right border-gray text-little"><a class="text-yellow" href="<?php echo U('shop/detail',array('shop_id'=>$detail['shop']['shop_id']));?>">作者：<?php echo ($detail["shop"]["shop_name"]); ?></a></em><?php endif; ?>
			<span>发布日期：<?php echo (date('Y-m-d',$detail["create_time"])); ?></span>
			<span>总浏览：<?php echo ($detail["views"]); ?></span>
		</p>
		<div class="detail-read">
			<?php echo ($detail["details"]); ?> 
		</div>
	</div>
    



   
    <div class="blank-10 bg"></div>
    <div class="container" style="padding:10px 0;">
		<div class="x12 form-button">
           <a class="x5 button button-small bg-blue text-center" target="x-frame"  href="<?php echo U('news/zan',array('article_id'=>$detail['article_id']));?>">赞(<?php echo ($detail["zan"]); ?>)</a >
           <a  href="javascript:void(0);" class="x5 button button-small bg-dot text-center das">打赏(<?php echo ($detail["donate_num"]); ?>)</a>
       </div>
	</div>
    <div class="blank-10 bg"></div>
    
    
     <script>
        $(document).ready(function(){
            $(".das").click(function(){
                layer.open({
                    type: 1,
                    title:'请选择打赏金额',
                    skin: 'layui-layer-rim', //加上边框
                    area: ['90%', '280px'], //宽高
                    content: '<div class="check_box"><label><input type="radio" name="donate" value="1"/>打赏1元</label><label><input type="radio" name="donate" value="2"/>打赏2元</label><label><input type="radio" name="donate" value="5"/>打赏5元</label><label><input type="radio" name="donate" value="10"/>打赏10元</label></div><input type="text" class="donate2" name="donate2" placeholder="请输入打赏金额" value=""/><input type="button" class="sure_das" value="确认打赏"/><p>打赏不可取消，请慎重操作</p>',
                  });
            })
            
            $(document).on('click','.sure_das',function(){
                var url = "<?php echo U('news/donate');?>";
                var article_id = "<?php echo ($detail["article_id"]); ?>";
                var money1 = $("input[name='donate']:checked").val();
                var money2 = $(".donate2").val();
                var money = 0;
                (money2>0) ? money=money2:money=money1;
                layer.confirm('您确认要打赏帖子吗？', {
                    btn: ['是的','不了'] //按钮
                  }, function(){
                    $.post(url,{article_id:article_id,money:money},function(data){
                        if(data.status == 'login'){
                            ajaxLogin();
                        }else if(data.status == 'error'){
                            layer.msg(data.msg);
                        }else{
                            layer.msg(data.msg);
                            setTimeout(function(){
                                window.location.reload(true);
                            },1000)
                        }
                    },'json')
                  });
            })
            
        })
    </script>

    
    <div class="sec-title">	
		<div class="divider"></div>	
		<span>推荐文章</span>
	</div>
    
    <div class="list-media-x" id="list-media">
	<ul>
    <?php if(is_array($rands)): foreach($rands as $key=>$var): ?><li class="line" onclick="location='<?php echo U('news/detail',array('article_id'=>$var['article_id']));?>'">
          <dd class="zhong">
            <div class="x3">
                   <img src="<?php echo config_img($var['photo']);?>" style="width:90%;">
                   </div>
             <div class="9">
                <p class="text-small"><?php echo tu_msubstr($var['title'],0,18);?></p>
                <p class="text-gray" style="font-size:12px;"><?php echo tu_msubstr($var['details'],0,16);?>...</p>     
                <p class="text-small">
                  <i class="icon-commenting-o"></i> <em><?php echo ($var["views"]); ?></em>
				  <i class="icon-clock-o"></i> <em><?php echo (date('Y-m-d',$var["create_time"])); ?></em>
                </p>
             </div>
          </dd>
     </li><?php endforeach; endif; ?>
     </ul>
    </div>
           
    <div class="blank-10 bg"></div>        
	<div class="blank-10"></div>
    <?php if($detail["valuate"] == 0): ?><!--是0才开启评论-->
	<div class="tab" data-toggle="click">
		<div class="tab-head">
			<ul class="tab-nav padding-left">
				<li class="active"><a href="#tab-list">网友评论</a></li>
				<li><a href="#tab-post">我要回复</a></li>
			</ul>
		</div>
	
		<div class="tab-body">
			<div class="tab-panel active" id="tab-list">
				<div class="comm-list">
					<?php if(empty($list)): ?><p>暂时还没有评论，虚位以待很久了，赶紧来抢沙发把！</p><?php endif; ?>
					<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><div class="media media-x level-1">	  				
						<a class="float-left" href="#"><img  class="radius" src="<?php echo config_img($users[$data['user_id']]['face']);?> " /></a>
						<div class="media-body">
							<strong><?php echo config_user_name($data['nickname']);?></strong>
							<?php echo ($data["content"]); ?>
							<p><?php echo formatTime($data['create_time']);?> 
                            <a class="zan" id="cmt-<?php echo ($data['comment_id']); ?>" href="javascript:void(0);" rel="<?php echo U('news/zans',array('comment_id'=>$data['comment_id']));?>">
                            	<i class="icon-thumbs-up"></i>赞(<em><?php echo ($data["zan"]); ?></em>)
                            </a>
                          
                            </p>

						</div>
					</div><?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
			</div>
			<div class="tab-panel" id="tab-post">
				<form class="form padding-left padding-right" action="<?php echo U('news/post');?>"  method="post">
					<input type="hidden" value="0" name="data[parent_id]" />
					<input type="hidden" value="<?php echo ($detail["article_id"]); ?>" name="data[post_id]" />
					<div class="blank-10"></div>
					<div class="form-group">
						<div class="field">
							<textarea class="input" name="data[content]" row="5" placeholder="输入评论内容"></textarea>
						</div>
					</div>
					<div class="blank-10"></div>
					<div class="form-button"><button class="button" type="submit">提交回复</button></div>
				</form>
				<div class="blank-20"></div>
			</div>
		</div>
	</div>
	
	<script>
	//点击"回复"按钮显示或隐藏回复输入框
	$("body").delegate(".comment-reply","click",function(){
		var uid = "<?php echo ($MEMBER[user_id]); ?>";
		if(uid==""){
			location.href = "<?php echo U('passport/login');?>";
		}else{
			if($(this).next().length>0){//判断出回复div已经存在,去除掉
				$(this).next().remove();
			 }else{//添加回复div
				$(".comment-reply").next().remove();//删除已存在的所有回复div	
				//添加当前回复div
				var parent_id = $(this).attr("comment_id");//要回复的评论id
				
				var divhtml = "";
				if('off'!=$(this).attr("replyswitch")){//二级评论回复后三级评论不再提供回复功能,将关闭属性附加到"提交回复"按钮"
					divhtml = "<form class='form margin-small' action='/wap/news/post.html'  method='post'><input type='hidden' value='"+<?php echo ($detail["article_id"]); ?>+"' name='data[post_id]' ><input type='hidden' value='"+parent_id+"' name='data[parent_id]' ><div class='div-reply-txt'><textarea name='data[content]' class='input'></textarea><div style='margin-top:5px;text-align:right;'><button class='comment-submit button' type='submit' >提交回复</button></div></div></form>";
				}		 	
				$(this).after(divhtml);
			 }
		}
	});
	//点赞开始
	$(".zan").click(function(){
		var url = $(this).attr("rel");
		var id = $(this).attr("id");
		$.get(url,function(result){
			if(result == "0"){
				layer.msg("您已经点赞过了！",{icon:2});
			}else{
				layer.msg("点赞成功！",{icon:1});
				$("#"+id).find("em").html(result);
				$("#"+id).addClass("amount");
				$("#"+id).removeClass("zan");
			}
		});
	});
	
	</script><?php endif; ?>
   
   
   
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
            title: '<?php echo ($detail["title"]); ?>."推荐的文章"',
        	link: "<?php echo ($CONFIG["site"]["host"]); echo U('wap/news/detail',array('fuid'=>$MEMBER['user_id'],'controller'=>$ctl,'action'=>$act,'article_id'=>$detail['article_id']));?>", 
        	imgUrl: "<?php echo config_weixin_img($detail['photo']);?>", 
            success: function (){
				layer.msg('分享成功');
			},
            cancel: function (){ 
				layer.msg('分享失败');
			}
        });
        //分享给朋友
        wx.onMenuShareAppMessage({
            title: '<?php echo ($detail["title"]); ?>."推荐的文章"',
            desc: '<?php echo ($detail["profiles"]); ?>',
            link: "<?php echo ($CONFIG["site"]["host"]); echo U('wap/news/detail',array('fuid'=>$MEMBER['user_id'],'controller'=>$ctl,'action'=>$act,'article_id'=>$detail['article_id']));?>", 
        	imgUrl: "<?php echo config_weixin_img($detail['photo']);?>", 
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