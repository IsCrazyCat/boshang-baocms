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
        
      


	


<!--
<?php if(empty($index_mask_show) and $CONFIG['other']['index_mask_show']): ?><div id="notice" style="visibility:visible;display:block;">
        <div class="mask" onclick="showDig()"></div>
        <div class="mask2 ">
            <div class="iboxx n-cus-bb animated bounceIn animationd05">
                <div class="n-cus-b">
                    <div class="top1">
                        <h2><?php echo ($CONFIG[other][index_mask_title]); ?></h2>
                        <span style="left:0px;"><?php echo ($CONFIG[other][index_mask_intro]); ?></span>
                    </div>

                    <div class="bottom1">
                        <div class="notice"><?php echo ($CONFIG[other][index_mask_textarea]); ?></div>
                        <div class="bs">
                            <a href="javascript:;" onclick="showDig('<?php echo U('index/url');?>')" class="url">抢红包</a>
                            <a href="javascript:;" onclick="showDig('<?php echo U('news/index');?>')" class="url2">今日头条</a>
                        </div>
                    </div>
                </div>
            </div>
            <i class="close iconfont animated bounceIn animationd05" onclick="showDig()"></i>
        </div>
    </div><?php endif; ?>

<style>
.mask{background:rgba(0,0,0,.55);position:absolute;height:110%;width:100%;top:0;left:0;overflow:hidden}
#notice .n-cus-bb{z-index:1001;width:100%;background:#fff;position:relative}
#notice{display:none;position:fixed;top:0;left:0;width:100%;height:100%;z-index:1001;box-sizing:border-box;padding-top:30%}
#notice .n-cus-bb i{z-index:6;font-size:35px;position:absolute;display:block;right:43%;bottom:0;color:#fff}
#notice .mask{display:block;z-index:1001}
#notice .iboxx{overflow:hidden;height:auto;background-color:#fff;margin:0 auto;border-radius:10px 10px 10px 10px}
#notice .top1{background-size:cover;height:80px;text-align:center;padding:20px 20px 20px 20px;background-image:url(/static/default/wap/image/index/bgimg.png)}
#notice .bottom1{height:auto;padding:20px 20px 20px 20px;background-color:#fff}
#notice .top1>h2{color:rgba(248,250,90,.93);height:30px;overflow:hidden;margin-bottom:5px}
#notice .notice{height:auto;color:grey;margin-bottom:15px;font-size:14px;line-height:1.8em}
#notice .bs>a:visited{color:#fff}
#notice .bs>a:link{color:#fff}
#notice .bs{height:40px;width:100%;margin:0 auto;margin-top:20px}
#notice .bs a{height:40px;background-color:#ffd800;text-align:center;color:#fff;line-height:40px;border-radius:20px 20px 20px 20px;float:left;margin-right:10%;width:45%;display:inline-block}
#notice .bs .url2{background-color:rgba(255,106,0,.97);float:right;margin:0}
#notice .imgg{margin-top:20px;background-color:#fff;width:35px;height:35px;border-radius:50%;line-height:50px}
#notice .imgg img{width:23px;height:18px;position:relative;top:-4px}
#notice .top1>span{font-size:13px;color:#fff;position:relative;right:-25px}
#notice .mask2{height:auto;width:80%;margin:0 auto;border-radius:10px 10px 30px 10px;z-index:13}
#notice .close{z-index:1001;font-size:35px;position:relative;display:block;color:#fff;text-align:center;bottom:-10px}
#notice .iboxx .top1 .audio-play{box-shadow:0 0 10px 1px rgba(0,0,0,.06);text-align:center;line-height:40px;width:40px;height:40px;border-radius:50%;box-shadow:0 0 10px #e0e6ec;position:absolute;left:20px;margin-top:10px;text-align:center;background-color:#fff}
#notice .iboxx .audio-play>.music{margin-top:35px;margin-left:13px;position:relative;top:-5px;left:-5px}
#triangle-right1{width:0;height:0;position:absolute;left:13px;top:12px;border-top:10px solid transparent;border-left:20px solid #c00;border-bottom:10px solid transparent}
#notice audio{display:none}
#notice .hidd{display:none}
</style>
<script>
      
        function showDig(url) {
            if($("#notice:visible").length==1){
                if(url != undefined)
					window.location.href = url;
					$("#notice").remove();
            }else{
				$("#notice").show();
			}
        }
    </script>
-->

<?php if(empty($index_mask_show) and $CONFIG['other']['index_mask_show']): ?><div id="notice" style="visibility:visible;display:block;">
        <div class="mask" onclick="showDig()"></div>
        <div class="mask2 ">
            <div class="iboxx n-cus-bb animated bounceIn animationd05">
                <div class="n-cus-b">
                    <div class="top1">
                        <h2><?php echo ($CONFIG[other][index_mask_title]); ?></h2>
                        <span style="left:0px;"><?php echo ($CONFIG[other][index_mask_intro]); ?></span>
                    </div>

                    <div class="bottom1">
                        <div class="notice"><?php echo ($CONFIG[other][index_mask_textarea]); ?></div>
                        <div class="bs">
                            <a href="javascript:;" onclick="showDig('<?php echo U('index/url');?>')" class="url">抢红包</a>
                            <a href="javascript:;" onclick="showDig('<?php echo U('news/index');?>')" class="url2">今日头条</a>
                        </div>
                    </div>
                </div>
            </div>
            <i class="close iconfont animated bounceIn animationd05" onclick="showDig()"></i>
        </div>
    </div><?php endif; ?>

<style>
.mask{background:rgba(0,0,0,.55);position:absolute;height:110%;width:100%;top:0;left:0;overflow:hidden}
#notice .n-cus-bb{z-index:1001;width:100%;background:#fff;position:relative}
#notice{display:none;position:fixed;top:0;left:0;width:100%;height:100%;z-index:1001;box-sizing:border-box;padding-top:30%}
#notice .n-cus-bb i{z-index:6;font-size:35px;position:absolute;display:block;right:43%;bottom:0;color:#fff}
#notice .mask{display:block;z-index:1001}
#notice .iboxx{overflow:hidden;height:auto;background-color:#fff;margin:0 auto;border-radius:10px 10px 10px 10px}
#notice .top1{background-size:cover;height:80px;text-align:center;padding:20px 20px 20px 20px;background-image:url(/static/default/wap/image/index/bgimg.png)}
#notice .bottom1{height:auto;padding:20px 20px 20px 20px;background-color:#fff}
#notice .top1>h2{color:rgba(248,250,90,.93);height:30px;overflow:hidden;margin-bottom:5px}
#notice .notice{height:auto;color:grey;margin-bottom:15px;font-size:14px;line-height:1.8em}
#notice .bs>a:visited{color:#fff}
#notice .bs>a:link{color:#fff}
#notice .bs{height:40px;width:100%;margin:0 auto;margin-top:20px}
#notice .bs a{height:40px;background-color:#ffd800;text-align:center;color:#fff;line-height:40px;border-radius:20px 20px 20px 20px;float:left;margin-right:10%;width:45%;display:inline-block}
#notice .bs .url2{background-color:rgba(255,106,0,.97);float:right;margin:0}
#notice .imgg{margin-top:20px;background-color:#fff;width:35px;height:35px;border-radius:50%;line-height:50px}
#notice .imgg img{width:23px;height:18px;position:relative;top:-4px}
#notice .top1>span{font-size:13px;color:#fff;position:relative;right:-25px}
#notice .mask2{height:auto;width:80%;margin:0 auto;border-radius:10px 10px 30px 10px;z-index:13}
#notice .close{z-index:1001;font-size:35px;position:relative;display:block;color:#fff;text-align:center;bottom:-10px}
#notice .iboxx .top1 .audio-play{box-shadow:0 0 10px 1px rgba(0,0,0,.06);text-align:center;line-height:40px;width:40px;height:40px;border-radius:50%;box-shadow:0 0 10px #e0e6ec;position:absolute;left:20px;margin-top:10px;text-align:center;background-color:#fff}
#notice .iboxx .audio-play>.music{margin-top:35px;margin-left:13px;position:relative;top:-5px;left:-5px}
#triangle-right1{width:0;height:0;position:absolute;left:13px;top:12px;border-top:10px solid transparent;border-left:20px solid #c00;border-bottom:10px solid transparent}
#notice audio{display:none}
#notice .hidd{display:none}
</style>
<script>
      
        function showDig(url) {
            if($("#notice:visible").length==1){
                if(url != undefined)
					window.location.href = url;
					$("#notice").remove();
            }else{
				$("#notice").show();
			}
        }
    </script>


<script src="/static/default/wap/js/jquery.flexslider-min.js" type="text/javascript"></script>

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
    .index-items li .item-image {
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
        margin-top:2%;
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
        font-size: 1rem;
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

<header class="top-fixed bg-yellow bg-inverse header">
    <div class="top-local">
        <a href="<?php echo U('city/index');?>" class="top-addr">
            <i class="icon-daohang iconfont"></i><?php echo tu_msubstr($city_name,0,4,false);?></a>
    </div>
    <div class="top-search" style="display:none;">
        <form method="post" action="<?php echo U('wap/mall/index');?>">
            <input name="keyword" placeholder="<?php echo (($CONFIG[other][wap_search_title])?($CONFIG[other][wap_search_title]):'输入关键字'); ?>"/>
            <button type="submit" class="iconfont icon-search"></button>
        </form>
    </div>
    <div class="top-signed">
        <a id="search-btn" href="javascript:void(0);"><i class="iconfont icon-search"></i></a>
    </div>
</header>

<div id="focus" class="focus">
    <div class="hd">
        <ul></ul>
    </div>
    <div class="bd">
        <ul>
            <?php  $cache = cache(array('type'=>'File','expire'=> 7200)); $token = md5("Ad, closed=0 AND site_id=57 AND city_id IN ({$city_ids}) and bg_date <= '{$today}' AND end_date >= '{$today}' ,0,3,7200,orderby asc,,"); if(!$items= $cache->get($token)){ $items = D("Ad")->where(" closed=0 AND site_id=57 AND city_id IN ({$city_ids}) and bg_date <= '{$today}' AND end_date >= '{$today}' ")->order("orderby asc")->limit("0,3")->select(); $cache->set($token,$items); } ; $index=0; foreach($items as $item): $index++; ?><li>
                    <a href="<?php echo U('wap/ad/click',array('ad_id'=>$item['ad_id'],'aready'=>2));?>"><img
                            src="<?php echo config_img($item['photo']);?>"/></a>
                </li> <?php endforeach; ?>
        </ul>
        <div class="focus-banner-bottom">
            <li class="bg-dot"></li>
            <li class="bg-mix"></li>
            <li class="bg-yellow"></li>
            <li class="bg-blue"></li>
            <li class="bg-gray"></li>
        </div>
    </div>
</div>

<div class="blank-10 bg"></div>
<div id="jin-app-block-102" class="bg-white border-bottom cl">
<!--    <div class="jin-home-kx cl"><span class="k-new bg-red text-white">早知道</span>-->
<!--        <div id="index-notice" style="height:22px;line-height:22px;overflow:hidden;">-->
<!--            <ul class="clear">-->
<!--                <li class="bd clear">-->
<!--                    <a>今天：<?php echo ($today); ?></a>-->
<!--                    <?php if(is_array($news)): foreach($news as $key=>$item): ?>-->
<!--                        <a href="<?php echo U('news/detail',array('article_id'=>$item['article_id']));?>">-->
<!--                            <dt><?php echo tu_msubstr($item['title'],0,20,false);?></dt>-->
<!--                        </a>-->
<!--<?php endforeach; endif; ?>-->
<!--                </li>-->
<!--            </ul>-->
<!--        </div>-->
<!--    </div>-->

    <script type="text/javascript">
        $(function () {
            $("#search-btn").click(function () {
                if ($(".top-search").css("display") == 'block') {
                    $(".top-search").hide();
                    $(".top-title").show(200);
                } else {
                    $(".top-search").show();
                    $(".top-title").hide(200);
                }
            });
        });

        $(window).scroll(function () {
            if (($(".top-fixed").length > 0)) {
                if (($(this).scrollTop() > 0) && ($(window).width() > 100)) {
                    $("header").removeClass("header");
                    $("#search-btn").addClass("search-btn");
                    $("#home-follow-public").addClass("home-follow-public-none");
                    $("#home-follow-public").show(200);
                } else {
                    $("#home-follow-public").hide(200);
                    $("header").addClass("header");
                    $("#search-btn").removeClass("search-btn");
                }
            }
            ;
        });

        function closeDiv() {
            var p = $("#home-follow-public").css("display");
            if (typeof (p) == "undefined" || p == "" || p == "block") {
                $("#home-follow-public").css("display", "none");
            } else {
                $("#home-follow-public").css("display", "block");
            }
        }

        $(document).ready(function () {
            $('.navigation_index_cate').flexslider({
                directionNav: true,
                pauseOnAction: false,
            });
            $('.flexslider_cate').flexslider({
                directionNav: true,
                pauseOnAction: false,
            });
        });
        TouchSlide({slideCell: "#index-notice", autoPlay: true, effect: "leftLoop", interTime: 3000});
        TouchSlide({
            slideCell: "#focus",
            titCell: ".hd ul",
            mainCell: ".bd ul",
            effect: "left",
            autoPlay: true,
            autoPage: true,
            switchLoad: "_src",
        });
    </script>


    <div id="index" class="page-center-box">

        <?php if($CONFIG[other][wap_navigation] == 1): ?><div class="banner_navigation">
                <div class="navigation_index_cate">
                    <ul class="slides">
                        <?php if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i; if($i%10 == 1): ?><li class="list">
                                    <ul class="cate">
                                        <li>
                                            <a href="<?php echo config_navigation_url($item['url'],2);?>?nav_id=<?php echo ($item['nav_id']); ?>"><img
                                                    src="<?php echo config_img($item['photo']);?>">
                                                <p><?php echo ($item["nav_name"]); ?></p></a>
                                        </li>
                                        <?php elseif($i%10 == 0): ?>

                                        <li>
                                            <a href="<?php echo config_navigation_url($item['url'],2);?>?nav_id=<?php echo ($item['nav_id']); ?>"><img
                                                    src="<?php echo config_img($item['photo']);?>">
                                                <p><?php echo ($item["nav_name"]); ?></p></a>
                                        </li>
                                    </ul>
                                </li>
                                <?php else: ?>
                                <li>
                                    <a href="<?php echo config_navigation_url($item['url'],2);?>?nav_id=<?php echo ($item['nav_id']); ?>"><img
                                            src="<?php echo config_img($item['photo']);?>">
                                        <p><?php echo ($item["nav_name"]); ?></p></a>
                                </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            </div>
            <?php else: ?>

            <div class="banner mb10">
                <div class="flexslider_cate">
                    <ul class="slides">
                        <?php if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i; if($i%10 == 1): ?><li class="list">
                                    <ul class="cate">
                                        <li>
                                            <a href="<?php echo config_navigation_url($item['url'],2);?>?nav_id=<?php echo ($item['nav_id']); ?>">
                                                <div class="iconfont <?php echo ($item["ioc"]); ?> <?php echo ($item["colour"]); ?>"></div>
                                                <p>
                                                    <?php echo ($item["nav_name"]); ?>
                                                </p>
                                            </a>
                                        </li>
                                        <?php elseif($i%10 == 0): ?>
                                        <li>
                                            <a href="<?php echo config_navigation_url($item['url'],2);?>?nav_id=<?php echo ($item['nav_id']); ?>">
                                                <div class="iconfont <?php echo ($item["ioc"]); ?> <?php echo ($item["colour"]); ?>"></div>
                                                <p>
                                                    <?php echo ($item["nav_name"]); ?>
                                                </p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <?php else: ?>
                                <li>
                                    <a href="<?php echo config_navigation_url($item['url'],2);?>?nav_id=<?php echo ($item['nav_id']); ?>">
                                        <div class="iconfont <?php echo ($item["ioc"]); ?> <?php echo ($item["colour"]); ?>"></div>
                                        <p>
                                            <?php echo ($item["nav_name"]); ?>
                                        </p>
                                    </a>
                                </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div><?php endif; ?>
    </div>

    <ul class="index-items" id="index-joblist">
        <div class="items-tag">
            <img src="/static/default/wap/image/index/index-hot-job.png" />
        </div>
        <script>
            $(document).ready(function() {
                loaddata('<?php echo U("mall/push",array("t"=>$nowtime,"p"=>"0000"));?>', $("#index-joblist"), true);
            });
        </script>
    </ul>

<!--    <div style="margin-top: 15px;width: 80%;margin-left: 10%;">-->
<!--        <ul>-->
<!--            <a class="button button-block button-big bg-yellow text-center"-->
<!--               href="<?php echo U('wap/mall/index');?>">查看更多工作 <i class="iconfont icon-angle-right"></i></a>-->
<!--        </ul>-->
<!--    </div>-->
    <div class="blank-10"></div>

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
                title: '<?php echo ($CONFIG["site"]["title"]); ?>',
                link: "<?php echo ($CONFIG["site"]["description"]); ?>",
                imgUrl: "<?php echo config_weixin_img($CONFIG['site']['logo']);?>",
                success: function () {
                    layer.msg('分享成功');
                },
                cancel: function () {
                    layer.msg('分享失败');
                }
            });
            //分享给朋友
            wx.onMenuShareAppMessage({
                title: '<?php echo ($CONFIG["site"]["title"]); ?>',
                desc: '<?php echo ($CONFIG["site"]["description"]); ?>',
                link: "<?php echo ($CONFIG["site"]["host"]); ?>",
                imgUrl: "<?php echo config_weixin_img($CONFIG['site']['logo']);?>",
                type: '',
                dataUrl: '',
                success: function () {
                    layer.msg('分享成功');
                },
                cancel: function () {
                    layer.msg('分享失败');
                }
            });
        });


    </script>