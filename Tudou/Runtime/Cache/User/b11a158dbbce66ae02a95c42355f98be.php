<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8">
		<title><?php if(!empty($seo_title)): echo ($seo_title); ?>_<?php endif; echo ($CONFIG["site"]["sitename"]); ?>会员中心</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<link rel="stylesheet" href="/static/default/wap/css/base.css">
        <link rel="stylesheet" href="<?php echo ($CONFIG['config']['iocnfont']); ?>">
		<link rel="stylesheet" href="/static/default/wap/css/mcenter.css"/>
		<script src="/static/default/wap/js/jquery.js"></script>
		<script src="/static/default/wap/js/base.js"></script>
		<script src="/static/default/wap/other/layer.js"></script>
        <script src="/static/default/wap/js/jquery.form.js"></script>
		<script src="/static/default/wap/other/roll.js"></script>
		<script src="/static/default/wap/js/public.js"></script>
 
	</head>
	<body>
<header class="top-fixed bg-yellow bg-inverse">

    <div class="top-title">
        成为VIP
    </div>
</header>


<style>
    .iconfont icon-angle-right{ float:right; font-size:20px;}
</style>
<form class="pay-form" action="<?php echo U('user/job/pay',array('order_id'=>$order['order_id']));?>" method="post" target="x-frame">
    <div class="banner">
        <img style="width: 100%; height: auto;" src="/static/default/wap/image/job/vip_banner.png">
    </div>
    <div class="row">
        <span class="float-left">VIP费用：<?php echo ($rank["price"]); ?></span>
        <span class="float-right">  <?php echo round($rank['price']/100,2);?>元</span>
    </div>
    <hr/>


    <div class="row" style="margin-bottom: 10px;">
        <span class="float-left">实际支付：</span>
        <span class="float-right text-dot">
                <?php echo round($rank['price']/100,2);?>元
        </span>
    </div>
    <!--使用优惠劵逻辑结束-->

    <div class="blank-10 bg"></div>

    <ul id="pay-method" class="pay-method">
        <?php if(is_array($payment)): foreach($payment as $key=>$var): ?><li data-rel="<?php echo ($var["code"]); ?>"  id="<?php echo ($var["code"]); ?>" class="media media-x payment">
                <a class="float-left"  href="javascript:;">
                    <img src="/static/default/wap/image/pay/<?php echo ($var["mobile_logo"]); ?>">
                </a>
                <div class="media-body">
                    <div class="line">
                        <div class="x10">
                            <?php echo ($var["name"]); ?><p>推荐已安装<?php echo ($var["name"]); echo ($var["id"]); ?>客户端的用户使用</p>
                        </div>
                        <div class="x2">
                            <span class="radio txt txt-small radius-circle bg-green"><i class="iconfont icon-qiandao1"></i></span>
                        </div>
                    </div>
                </div>
            </li><?php endforeach; endif; ?>
<!--        <li data-rel="wait" class="media media-x payment">-->
<!--            <a class="float-left" href="javascript:;">-->
<!--                <img src="/static/default/wap/image/pay/dao.png">-->
<!--            </a>-->
<!--            <div class="media-body">-->
<!--                <div class="line">-->
<!--                    <div class="x10">-->
<!--                        线下购买<p>如果您没有网银，可以到店付</p>-->
<!--                    </div>-->
<!--                    <div class="x2">-->
<!--                        <span class="radio txt txt-small radius-circle bg-green"><i class="iconfont icon-qiandao1"></i></span>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </li>-->
    </ul>
    <input id="code" type="hidden" name="code" value="" />

    <div class="text-center padding-left padding-right margin-large-top">
        <button type="submit" class="button button-big button-block bg-yellow">立即支付</button>
    </div>

    <div class="blank-20"></div>
</form>
</div>
<script>

    $(document).ready(function(){
        var name = $("#<?php echo ($CONFIG['pay']['auto']); ?>").attr("data-rel");
        if(name == "<?php echo ($CONFIG['pay']['auto']); ?>"){
            $("#<?php echo ($CONFIG['pay']['auto']); ?>").addClass("active");
            $("#code").val(name);
        }
    });


    $(document).ready(function(){
        $("#pay-method li").click(function(){
            var code = $(this).attr("data-rel");
            $("#code").val(code);
            $("#pay-method li").each(function(){
                $(this).removeClass("active");
            });
            $(this).addClass("active");
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

     <a class="foot-item  <?php if($ctl == 'member'): ?>active<?php endif; ?> " href="<?php echo LinkTo('user/member/index');?>">
     <span class="iconfont icon-fabu"></span><span class="foot-label">个人中心</span></a>

    </footer>


<iframe id="x-frame" name="x-frame" style="display:none;"></iframe>
<style>
.add-message {margin-top: 30px;}
.add-button{ text-align:center;}
.layui-layer-title {border-bottom: 0px solid #eee;}
</style>


</body>
</html>