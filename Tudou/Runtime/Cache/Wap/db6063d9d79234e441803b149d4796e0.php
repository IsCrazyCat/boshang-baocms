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
        
      


	
<script src="/static/default/wap/js/global.js"></script>
<style>
    body {
        background: #f0efed;
    }

    .top-fixed .top-title span {
        padding: 0 10px
    }

    .top-fixed .top-title span.on {
        border-bottom: 2px solid #FFF
    }

    .cartadd_num {
        font-size: 12px
    }

    .navContent {
        display: block
    }

    .ui-sx {
        width: 100%;
        overflow: hidden
    }

    .subNavBox {
        overflow: hidden;
        margin-left: 10px;
        padding-bottom: 0;
        margin-right: 10px
    }

    .subNav {
        background-size: auto 13px
    }

    .subNav.on {
        background-size: auto 14px
    }

    .subNav strong {
        display: block;
        width: 100%;
        height: 40px;
        border-bottom: 1px solid #eee;
        color: #666;
        font-weight: 400;
        font-size: 16px;
        line-height: 40px
    }

    .currentDt {
        background-size: auto 13px
    }

    .navContent li {
        overflow: hidden;
        width: 100%
    }

    .navContent li .title {
        width: 100%;
        font-size: 16px;
        line-height: 30px;
        color: #666;
        margin-top: 5px
    }

    .navContent li .item {
        overflow: hidden;
        border-bottom: 1px solid #eee;
        padding-bottom: 5px
    }

    .navContent li .item a {
        padding-left: 10px;
        padding-right: 10px;
        border: 1px solid #CCC;
        line-height: 30px;
        display: inline-block;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        margin-right: 5px;
        margin-bottom: 10px
    }

    .navContent li .item a.hover {
        background: red;
        color: #FFF;
        border: 1px solid red;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px
    }

    .navContent li .purchase {
        font-size: 14px;
        line-height: 25px;
        color: #666
    }

    .navContent li .purchase_v {
        font-size: 16px;
        line-height: 25px;
        color: #dd2724;
        font-weight: 700
    }

    .navContent li h2 {
        font-size: 18px;
        line-height: 30px;
        color: #333;
        font-weight: 400
    }

    .navContent li p {
        width: 95%;
        overflow: hidden;
        height: 25px;
        line-height: 25px;
        margin: auto
    }

    .navContent li .key {
        display: block;
        float: left;
        width: 30%;
        font-size: 14px;
        color: #666;
        text-align: right
    }

    .navContent li .p-price-v {
        display: block;
        width: 70%;
        float: left;
        font-size: 16px;
        color: #dd2724
    }

    .navContent li .title1 {
        width: 100%;
        font-size: 16px;
        height: 20px;
        line-height: 20px;
        color: #666;
        padding-top: 10px
    }

    .navContent li .item1 {
        width: 100%;
        height: 50px;
        overflow: hidden;
        padding-bottom: 5px
    }

    .navContent li .item1 a {
        padding-left: 10px;
        padding-right: 10px;
        border: 1px solid #CCC;
        line-height: 30px;
        display: inline-block;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        margin-right: 5px;
        margin-bottom: 10px
    }

    .navContent li .item1 a.hover {
        background: red;
        color: #FFF;
        border: 0;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px
    }

    .navContent li .item1 .ui-number {
        border: 1px solid #ddd9da;
        overflow: hidden;
        height: 30px;
        display: block;
        width: 106px;
        margin-top: 10px
    }

    .navContent li .item1 .ui-number .decrease {
        display: inline-block;
        background: 0 0;
        font-size: 24px;
        line-height: 30px;
        border: 0;
        width: 30px;
        float: left;
        height: 30px;
        color: #F8849C;
        border-right: 1px solid #ddd9da;
        text-indent: -9999px;
        background-size: 60px
    }

    .navContent li .item1 .ui-number .num {
        display: inline-block;
        border: 0;
        width: 40px;
        height: 30px;
        float: left;
        text-align: center;
        font-size: 12px;
        line-height: 30px;
        color: #666;
        font-size: 20px;
        text-align: center
    }

    .navContent li .item1 .ui-number .increase {
        display: inline-block;
        background: 0 0;
        border: 0;
        border-left: 1px solid #ddd9da;
        float: right;
        width: 30px;
        height: 30px;
        font-size: 24px;
        line-height: 30px;
        color: #F8849C;
        background-size: 60px;
        text-indent: -9999px
    }

    .row {
        padding: 15px 10px
    }

    .tuan-detail2 {
        border-top: 0 solid #eee
    }

    .txt-small .txt {
        border: none
    }

    .margin-small-top2 {
        margin-top: 5px
    }

    .buy_area .detail_coupons, .detail_baitiao {
        position: relative;
        padding: 0 30px 0 10px;
        height: 42px;
        line-height: 42px;
        font-size: 0;
        color: #999;
        word-break: break-word;
        overflow: hidden
    }

    .buy_area .detail_coupons span.num, .detail_baitiao span.num {
        float: right
    }

    .buy_area .detail_coupons span, .detail_baitiao span {
        font-size: 12px
    }

    .buy_area .detail_coupons span.title, .detail_baitiao span.title {
        margin-right: 16px
    }

    .buy_area .detail_coupons .coupon, .detail_baitiao .coupon {
        position: relative;
        display: inline-block;
        margin-right: 5px;
        padding: 0 9px 0 12px;
        border-top: 1px solid #e4393c;
        border-bottom: 1px solid #e4393c;
        height: 18px;
        line-height: 18px;
        color: #e4393c;
        font-size: 10px
    }

    .buy_area .detail_coupons .coupon:before, .detail_baitiao .coupon:before {
        left: 0;
        width: 7px
    }

    .buy_area .detail_coupons .coupon:after, .detail_baitiao .coupon:after {
        right: 0;
        width: 4px;
        background-position: -11px 0
    }

    .buy_area .detail_coupons .coupon:after, .buy_area .detail_coupons .coupon:before, .detail_baitiao .coupon:after, .detail_baitiao .coupon:before {
        content: "";
        position: absolute;
        top: -1px;
        height: 18px;
        background-size: 15px 18px;
        background-repeat: no-repeat
    }

    /*右侧弹窗*/
    .container {
        width: 0;
        position: fixed;
        top: 0;
        right: 0;
        z-index: 10000;
        display: none;
        overflow-x: hidden;
        padding: 0
    }

    .container .area-list, .container .city-list, .container .province-list {
        width: 100%;
        overflow-x: hidden
    }

    .container .city {
        overflow-x: hidden;
        padding: .42667rem;
        background-color: #fff;
        margin-top: 1.6rem
    }

    .container .city p {
        font-size: 12px;
        color: #afafaf;
        width: 95%;
        height: 2.6rem;
        line-height: 2.6rem;
        border-bottom: 1px solid #e8ecf1;
        cursor: pointer
    }

    .container .city p.co_current {
        color: #f23030
    }

    .screen_wi_loc {
        display: block;
        width: 100%;
        position: absolute;
        top: 0;
        right: 0;
        background-color: #f8f8f8
    }

    .screen_wi_loc .suce_ok {
        font-size: 12px
    }

    .classreturn .content .return {
        position: absolute;
        left: 1rem
    }

    .screen_wi_loc .content .search {
        width: 12rem;
        margin-left: 3rem
    }

    .mask-filter-div {
        display: none;
        position: fixed;
        max-width: 100%;
        margin: 0 auto;
        width: 100%;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        z-index: 12;
        background: rgba(0, 0, 0, .4)
    }

    .layui-layer-page .layui-layer-content .service_weixin_qrcode {
        text-align: center
    }

    /*土豆弹窗*/


    .tudou-cart-num-mask .filter-spec-img {
        margin-left: 20px;
        margin-top: 20px;
    }

    .tudou-cart-num-mask .filter-spec-img img {
        width: 3rem;
        height: 3rem;
        border: 1px solid #c2c2c2;
        vertical-align: middle;
    }


    .tudou-cart-num-mask {
        position: fixed;
        display: none;
        z-index: 1200;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.6);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#BF000000, endColorstr=#BF000000);
    }

    .tudou-cart-num-mask .cont {
        position: absolute;
        bottom: 0px;
        left: 0;
        width: 100%;
        background: #fff;
    }

    .tudou-cart-num-mask .title1 {
        overflow: hidden;
        font-size: 14px;
        color: #333;
        line-height: 2.34rem;
        padding: 0 0.6rem;
        background: #f7f7f7;
    }

    .tudou-cart-num-mask .title1 .closs {
        font-size: 16px;
    }

    .tudou-cart-num-mask .nr {
        padding: 0.6rem;
    }

    .tudou-cart-num-int {
        margin: 0.2rem 0;
    }

    .tudou-cart-num-int .table th {
    }

    .tudou-cart-num-int ul li {
        display: block;
        float: left;
    }

    .tudou-cart-num-mask .btn_box {
        border-top: 0.1rem solid #dedede;
        padding: 0.6rem 0 0;
        text-align: center;
    }

    .tudou-cart-num-mask .btn {
        display: inline-block;
        width: 80%;
        height: 2.1rem;
        line-height: 2.1rem;
        background: #2FBDAA;
        border-radius: 0.34rem;
        text-align: center;
        color: #FFF;
        font-size: 14px;
    }

    .job-tag {
        background: #eeeeee;
        height: 1.2rem;
        line-height: 1.2rem;
        padding: 1px 0.2rem 1px 0.2rem;
        color: #9ca0a7;
        font-size: 0.55rem;
        margin-right: 0.2rem;
    }
</style>


<header class="top-fixed bg-yellow bg-inverse detail">
    <div class="top-back">
        <a class="top-addr" href="<?php echo U('mall/index');?>"><i class="iconfont icon-angle-left"></i></a>
    </div>
    <div class="top-title search center">
        <?php echo ($detail['title']); ?>
    </div>
</header>

<div class="xq_details">
    <div class="tuan-detail">
        <div class="line banner">
            <div id="focus" class="focus">
                <div class="hd">
                    <ul></ul>
                </div>
                <div class="bd">
                    <ul>
                        <li><a href="javascript:void(0);"><img src="<?php echo config_img($detail['photo']);?>"/></a></li>
                        <?php if(is_array($pics)): foreach($pics as $key=>$item): ?><li><a href="javascript:void(0);"><img src="<?php echo config_img($item['photo']);?>"/></a></li><?php endforeach; endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        TouchSlide({
            slideCell: "#focus",
            titCell: ".hd ul",
            mainCell: ".bd ul",
            effect: "left",
            autoPlay: true,//自动播放
            autoPage: true, //自动分页
            switchLoad: "_src"
        });
    </script>

    <div class="item-detail">
        <div class="detail-row bb">
            <div class="item-price">
                <h3><?php echo tu_msubstr($detail['title'],0,24);?></h3>
                <div>
                    <span class="job-tag"><?php echo ($detail['guige']); ?></span><br/>
                    厂发薪资 :<span class="price" id="goods_price"><?php echo round($detail['mall_price']/100,2);?>元/小时</span>
                    <span style="float:right;margin-top:7px">已报名：<?php echo ($detail['sold_num']); ?>人</span>
                </div>
            </div>
        </div>
        <div class="detail-row bb">
            <div class="item-tips">
                <em><span class="text-green"><i class="check-circle"></i></span>平台保障</em>
                <em><span class="text-green"><i class="check-circle"></i></span>安全保障</em>
                <em><span class="text-green"><i class="check-circle"></i></span>工资保障</em>
                <em><span class="text-green"><i class="check-circle"></i></span>补贴保障</em>
            </div>
        </div>
    </div>

    <style>
        .item-intro {
            margin-top: 10px;
        }

        .intro-title {
            margin-left: 20px;
            margin-top: 5px;
            font-size: 16px;
            font-weight: bold;
        }

        .intro-bd {
            margin-left: 10px;
        }
    </style>
    <div class="item-intro">
        <div class="intro-title">平台补贴</div>
        <div class="intro-bd"><?php echo ($detail['instructions']); ?></div>
    </div>
    <div class="item-intro">
        <div class="intro-title">薪资待遇</div>
        <div class="intro-bd"><?php echo ($detail['salary']); ?></div>
    </div>
    <div class="item-intro">
        <div class="intro-title">录用条件</div>
        <div class="intro-bd"><?php echo ($detail['enroll']); ?></div>
    </div>
    <div class="item-intro">
        <div class="intro-title">岗位介绍</div>
        <div class="intro-bd"><?php echo ($detail['explain']); ?></div>
    </div>
    <div class="item-intro">
        <div class="intro-title">公司介绍</div>
        <div class="intro-bd">
            <?php echo ($shopdetails['details']); ?>
        </div>
    </div>
    <div class="item-intro">
        <div class="intro-title">面试地址</div>
        <div class="intro-bd">
            <div class="address-detail">中国上海市上海市浦东新区申沔路</div>
            <div class="address-city">上海市&nbsp;&nbsp;浦东新区</div>
        </div>
    </div>

    <div class="item-intro">
        <div class="intro-title">平台温馨提示</div>
        <div class="intro-bd">
            1、 只有在平台报名才能保证自己的利益；<br/>
            2、 平台所有工价及补贴以面试入职当天为准；<br/>
            3、 面试前一晚早点休息，不要喝碳酸饮料、酒、吃辣的，体检会导致转氨酶偏高；<br/>
            4、 去面试的时候把自己收拾的干净点，因为企业喜欢干净利落的人，会分到一个好一点的部门。<br/>
            5、 未明确扣社保的岗位，表明暂不扣缴，后续政策变动交社保时，承担个人部分费用<br/><br/><br/>

            平台工作网，让求职者高薪就业。平台提供的所有岗位真实可靠，如有虚标工价/返费，平台双倍赔付。<br>

        </div>
    </div>

    <!--如果看了又看不等于空-->

    <style>
        .index-items {
            background: #efeff4;
        }

        .index-items p {
            margin: 0px;
            padding: 0px;
        }

        .index-items li {
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

        .items-tag img {
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

        .item-inner {
            width: 70%;
            margin-left: 30%;
            margin-top: 2%;
            border-bottom: 1px #f1f1f1 solid;
        }

        .item-amount {
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

        .item-number {
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
    <?php if(!empty($recom)): ?><div class="blank-10 bg"></div>
        <ul class="index-items" id="index-joblist">
            <li style="padding:10px;font-size: 16px;font-weight: bold">猜你喜欢</li>
            <?php if(is_array($recom)): foreach($recom as $key=>$v): ?><li>
                    <a href="<?php echo U('wap/mall/detail',array('goods_id'=>$v['goods_id']));?>"
                       class="">
                        <div class="item-image">
                            <img src="<?php echo ($v['photo']); ?>" width="100%">
                        </div>
                        <div class="item-inner">
                            <div>
                                <p class="item-number" title="<?php echo ($v["title"]); ?>">
                                    <?php echo ($v["title"]); ?>
                                </p>
                            </div>
                            <p class="index-item-subtitle">
                                <?php echo ($v["guige"]); ?>
                            </p>
                            <div class="item-price-row">
                                <p class="price-price" style="padding-bottom: 10px">
                                    <span>4000-6000</span>
                                    元/月
                                </p>
                            </div>
                            <div class="item-amount">
                                <p class="hot-mark ">
                                    <?php if($v["show_price_type"] < 2): ?>工价
                                        <?php else: ?>
                                        补贴<?php endif; ?>
                                </p>
                                <p><?php echo round($v['price']/100,2);?>元/小时</p>
                            </div>
                        </div>
                    </a>
                </li><?php endforeach; endif; ?>
        </ul><?php endif; ?>


    <div class="blank-20"></div>


    <script>
        $(document).ready(function () {
            $(document).on('click', '#service_weixin_qrcode', function (e) {
                var img = $(this).attr('data');
                layer.open({
                    type: 1,
                    title: false,
                    closeBtn: false,
                    area: '300px;',
                    shade: 0.8,
                    id: 'LAY_layuipro',
                    resize: false,
                    btn: ['关闭窗口'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: '<div class="service_weixin_qrcode"><img src=' + img + '><br/><a>添加客服二维码</a></div>',
                    success: function (layero) {
                        var btn = layero.find('.layui-layer-btn');
                    }
                });

            });

        });
    </script>


    <!--底部footer开始-->
    <div data-spm="action" class="item-action">
<!--        <?php if($shop['service_weixin_qrcode']): ?>-->
<!--            <div class="active-contact">-->
<!--                <a data-spm="dwangwang" id="service_weixin_qrcode"-->
<!--                   data="<?php echo config_img($shop['service_weixin_qrcode']);?>">-->
<!--                    <span class="iconfont icon-31erweima"></span>客服</a>-->
<!--            </div>-->
<!--<?php endif; ?>-->

        <div class="<?php if( !empty($goodsfavorites) ): ?>toggle-collect-news
        <?php else: ?>
        toggle-collect<?php endif; ?>" >
        <a target="x-frame" href="<?php echo U('mall/favorites',array('goods_id'=>$detail['goods_id']));?>">
            <span class="iconfont icon-shouc01"></span>收藏</a>
    </div>

    <div class="go-store">
        <a data-spm="dstore" href="<?php echo U('shop/detail',array('shop_id'=>$detail['shop_id']));?>">
            <span class="iconfont icon-shangjia2"></span>企业</a>
    </div>


    <?php if($filter_spec): ?><div id="bottom-cart-entrance" class="add-to-cart pop-goods-attribute">
            <div style="position: relative;top:-7px;"><?php echo round($detail['price']/100,2); echo ($detail['price_unit']); ?></div>
            <div style="position: relative;top:-37px;">免费报名</div>
        </div>
        <?php if($detail['num'] <= 0): ?><div><a>人数已满</a></div>
            <?php else: ?>
            <div class="buy-now">
                <a href="javascript:" class="pop-goods-attribute">
                    <div style="position: relative;top:-7px;">
                        <?php echo round($detail['mall_price']/100,2); echo ($detail['price_unit']); ?>
                    </div>
                    <div style="position: relative;top:-37px;">VIP拿高价</div>
                </a>
            </div><?php endif; ?>
        <?php else: ?>
        <div id="bottom-cart-entrance" class="add-to-cart cartadd2" style="position: relative;">
            <div style="position: relative;top:-7px;"><?php echo round($detail['price']/100,2); echo ($detail['price_unit']); ?></div>
            <div style="position: relative;top:-37px;">免费报名</div>
        </div>
        <?php if($detail['num'] <= 0): ?><div><a>人数已满</a></div>
            <?php else: ?>
            <div class="buy-now">
                <a href="javascript:" class="buy_now2">
                    <div style="position: relative;top:-7px;">
                        <?php echo round($detail['mall_price']/100,2); echo ($detail['price_unit']); ?>
                    </div>
                    <div style="position: relative;top:-37px;">VIP拿高价</div>
                </a>
            </div><?php endif; endif; ?>
</div>
<!--底部footer结束-->
<script>
    check_user_mobile('<?php echo U("wap/tuan/sendsms");?>','<?php echo U("wap/tuan/tuan_mobile");?>');

    //查看工作详情
    $('.seedeadei').click(function () {
        $('.xq_details').eq(0).hide();
        $('.xq_details').eq(1).show();
        $('body').animate({scrollTop: 0}, 0);
        $('.detail').find('.center').find('span').eq(1).addClass('on');
        $('.detail').find('.center').find('span').eq(0).removeClass('on');
    })

    //评论
    $('.tbv').click(function () {
        $('.xq_details').eq(0).hide();
        $('.xq_details').eq(2).show();
        $('body').animate({scrollTop: 0}, 0);
        $('.detail').find('.center').find('span').eq(2).addClass('on');
        $('.detail').find('.center').find('span').eq(0).removeClass('on');
        $('.gizle').show();
    })


    //顶部导航切换
    $('.detail .search span').click(function () {
        $(this).addClass('on').siblings().removeClass('on');
        var a = $('.detail .search span').index(this);
        $('.xq_details').eq(a).show().siblings('.xq_details').hide();
        $('.xq_details').eq(2).show();
        if ($('.detail .search span').eq(2).hasClass('on')) {
            $('.comment_de').show();
        } else {
            $('.comment_de').hide();
        }
        if ($('.detail .search span').eq(1).hasClass('on')) {
            $('.tab-con-wrapper').hide();
            $('.comment_con').hide();
        } else {
            $('.tab-con-wrapper').show();
            $('.comment_con').show();
        }
    });


    $(".pop-goods-attribute").click(function () {
        $(".tudou-cart-num-mask").show();
    });
    $(".tudou-cart-num-mask").find(".closs").click(function () {
        $(".tudou-cart-num-mask").hide();
    });


    $(document).ready(function () {
        $(".buy_now2").click(function () {

            <?php if(empty($MEMBER['mobile'])): ?>check_user_mobile('<?php echo U("wap/tuan/tuan_sendsms");?>','<?php echo U("wap/tuan/tuan_mobile");?>');
                $('.submit').click(function(){
                    check_user_mobile('<?php echo U("wap/tuan/tuan_sendsms");?>','<?php echo U("wap/tuan/tuan_mobile");?>');
                    return false;
                });<?php endif; ?>
            var url = "<?php echo U('wap/mall/jobsign');?>";
            var goods_id = "<?php echo ($detail["goods_id"]); ?>";
            var shop_id = "<?php echo ($detail["shop_id"]); ?>";
            var num = $("#goods_num").val();
            if (num == 0) {
                layer.msg('当前职位报名人数已满！');
                return;
            }
            $.post(url, {goods_id: goods_id, shop_id: shop_id, is_vip: '1'}, function (data) {

                layer.msg(data.msg);
                setTimeout(function () {
                    window.location.href = data.url;
                }, 2000);

            }, 'json');
        });
        $(".cartadd2").click(function () {
            <?php if(empty($MEMBER['mobile'])): ?>check_user_mobile('<?php echo U("wap/tuan/sendsms");?>','<?php echo U("wap/tuan/tuan_mobile");?>');
            <?php else: ?>
                var url = "<?php echo U('/wap/mall/jobsign');?>";
                var goods_id = "<?php echo ($detail["goods_id"]); ?>";
                var shop_id = "<?php echo ($detail["shop_id"]); ?>";
                var num = $("#goods_num").val();
                if (num == 0) {
                    layer.msg('当前职位报名人数已满！');
                    return;
                }
                $.post(url, {goods_id: goods_id, shop_id: shop_id, is_vip: '0'}, function (data) {
                    alert(data.msg);
                    layer.msg(data.msg);
                    setTimeout(function () {
                        window.location.href = data.url;
                    }, 2000);

                }, 'json');<?php endif; ?>



        });
    });


    //加入购物车
    $(document).ready(function () {
        // $(".cartadd2").click(function () {
        //     var url = "<?php echo U('mall/jobsign');?>";
        //     var goods_id = "<?php echo ($detail["goods_id"]); ?>";
        //     var num = $("#goods_num").val();
        //     var shop_id = "<?php echo ($detail["shop_id"]); ?>";
        //
        //     if (num == 0) {
        //         layer.msg('当前职位报名人数已满！');
        //         return;
        //     }
        //     '<?php echo ($CONFIG["site"]["host"]); ?>/index.php?g=wap&m=mall&a=buy&mt=<?php echo time();?>&goods_id=<?php echo ($detail["goods_id"]); ?>&num=' + num
        //     $.post(url, {goods_id: goods_id, shop_id: shop_id, is_vip: '0'}, function (data) {
        //         if (data.status == 'success') {
        //
        //         } else {
        //             layer.msg(data.msg);
        //         }
        //     }, 'json')
        // })

        //购买链接2可以
        $(document).ready(function () {

            $(document).on('click', '.buy_now', function () {
                var num = $("#goods_num").val();
                var goods_id = "<?php echo ($detail["goods_id"]); ?>";
                var url = '<?php echo ($CONFIG["site"]["host"]); ?>/index.php?g=wap&m=mall&a=buy&mt=<?php echo time();?>&goods_id=<?php echo ($detail["goods_id"]); ?>';

                    if (num == 0) {
                        layer.msg('当前规格没库存啦');
                        return;
                    }


                $.get(url, function (data) {
                    if (data.status == 'success') {
                        layer.msg(data.msg);
                        setTimeout(function () {
                            window.location.href = data.url;
                        }, 2000);
                    } else {
                        layer.msg(data.msg);
                    }
                }, 'json');
            });

        });


    });
</script>

<script type="text/javascript">
    //更新工作价格
    $(document).ready(function () {
        get_goods_price();
    });

    function switch_spec(spec) {
        $(spec).siblings().removeClass('hover');
        $(spec).addClass('hover');
        $(spec).siblings().children('input').prop('checked', false);
        $(spec).children('input').prop('checked', true);
        get_goods_price();//更新工作价格
    }

    function get_goods_price() {
        var goods_price =<?php echo ($goods["mall_price"]); ?>
        ; //工作起始价
        var spec_goods_price = '';//避免空值


    <?php if(!empty($spec_goods_price)): ?>spec_goods_price =<?php echo ($spec_goods_price); ?>;  //规格 对应 价格 库存表<?php endif; ?>

        //如果有属性选择项2
        if (spec_goods_price != null) {
            goods_spec_arr = new Array();
            $("input[name^='goods_spec']:checked").each(function () {
                goods_spec_arr.push($(this).val());
            });
            spec_key = goods_spec_arr.sort(sortNumber).join('_');  //排序后组合成 key	 搞一下就成了全局变量了
            goods_price = spec_goods_price[spec_key]['price']; // 找到对应规格的价格
            store_count = spec_goods_price[spec_key]['store_count']; // 找到对应规格的库存
            if (store_count > 0) {
                $("#goods_num").val(1);
            }
        }

        var goods_num = parseInt($("#goods_num").val());


        //库存不足的情况
        if (goods_num > store_count) {
            goods_num = store_count;
            layer.msg('库存仅剩 ' + store_count + ' 件');
            $("#goods_num").val(goods_num);
        }

        $("#goods_price").html('￥' + goods_price + '元'); // 变动价格显示
        $("#goods-price").html('￥' + goods_price + '元'); // 变动价格显示
        $("#stock").html(store_count);


    }

    function sortNumber(a, b) {
        return a - b;
    }

    function goods_cut() {
        var num_val = document.getElementById('goods_num');
        var new_num = num_val.value;
        var Num = parseInt(new_num);
        if (Num > 1) Num = Num - 1;
        num_val.value = Num;
    }

    function goods_add() {
        var num_val = document.getElementById('goods_num');
        var new_num = num_val.value;
        var Num = parseInt(new_num);
        Num = Num + 1;
        num_val.value = Num;
    }

</script>

<div class="mask-filter-div" style="display: none;"></div>
<iframe id="x-frame" name="x-frame" style="display:none;"></iframe>
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
            title: '<?php echo ($detail["title"]); ?>."推荐的工作"',
            link: "<?php echo ($CONFIG["site"]["host"]); echo U('wap/mall/detail',array('fuid'=>$MEMBER['user_id'],'controller'=>$ctl,'action'=>$act,'goods_id'=>$detail['goods_id']));?>",
            imgUrl: "<?php echo config_weixin_img($detail['photo']);?>",
            success: function () {
                layer.msg('分享成功');
            },
            cancel: function () {
                layer.msg('分享失败');
            }
        });
        //分享给朋友
        wx.onMenuShareAppMessage({
            title: '<?php echo ($detail["title"]); ?>."推荐的工作"',
            desc: '<?php echo ($detail["intro"]); ?>',
            link: "<?php echo ($CONFIG["site"]["host"]); echo U('wap/mall/detail',array('fuid'=>$MEMBER['user_id'],'controller'=>$ctl,'action'=>$act,'goods_id'=>$detail['goods_id']));?>",
            imgUrl: "<?php echo config_weixin_img($detail['photo']);?>",
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