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

<body>

<style>
body{padding:0;background:#F8F8F8}
header.user-center-header{position:relative;overflow:hidden;padding:50px 20px 0;width:100%;background-position:center 0;background-size:auto 100%}
header.user-center-header>div{position:relative;z-index:1}
header.user-center-header>div>a{float:left;display:inline-block}
header.user-center-header>div>a>img{width:60px;border:3px solid rgba(255,255,255,.8);border-radius:50%}
header.user-center-header>div>.user-info{margin-left:70px}
header.user-center-header>div>.user-info>h2{margin-top:30px}
header.user-center-header>div>.user-info>h2>a{color:#000;font-size:16px}
header.user-center-header>div>.user-center{position:absolute;top:8px;right:10px}
header.user-center-header>div>.user-center>a>i{color:#FFF;font-size:22px}
header.user-center-header>div>.vip-my{position:absolute;right:0;bottom:10px;display:block;width:80px;height:40px;border-bottom:1px solid #b7903d;border-radius:5px 5px 0 0;text-align:center;line-height:40px}
header.user-center-header>div>.vip-my>a{color:#6b5322;font-size:14px}
header.user-center-header:before{position:absolute;bottom:-1px;left:0;display:block;width:100%;height:23px;background:#FFF;content:''}
header.user-center-header:after{position:absolute;bottom:21px;left:0;z-index:0;width:0;height:0;border-bottom:71px solid #fff;border-left:500px solid transparent;content:''}
.user-center-header>a.home-set{position:absolute;top:10px;right:10px;color:#fff;font-size:14px;opacity:.9}
.user-center-header>a.home-set i{padding-right:5px;font-size:20px}
.user-center-header>a.home-back{position:absolute;top:10px;left:10px;display:block;width:30px;height:30px;border-radius:50%;background:rgba(0,0,0,.6);color:#fff;text-align:center}
.user-center-header>a.home-back i{color:#fff;font-size:20px}
.user-block{border-bottom:1px solid #e8e8e8;background:#FFF;box-shadow:0 3px 7px #eaeaea}
.user-block>h2{padding:0 12px;border-bottom:1px solid #F1F1F1;font-size:16px;line-height:40px}
.user-block>h2>a{display:block}
.user-block>ul>li{padding:10px 0;text-align:center;font-size:14px}
.user-block>ul>li>a{display:block;border-left:1px solid #F1F1F1;font-size:12px}
.user-block>ul>li:first-child>a{border-left:0}
.user-block>ul>li>a>i{display:block;color:#999;font-size:26px;line-height:30px}
.user-block-one{overflow:hidden;background:#FFF}
.user-block-one>ul{margin-right:-1px}
.user-block-one>ul>li{float:left;padding:10px 0;border-right:1px solid #F1F1F1;border-bottom:1px solid #F1F1F1;text-align:center;font-size:14px}
.user-block-one>ul>li>a{display:block;font-size:12px}
.user-block-one>ul>li>a>i{display:block;font-size:26px;line-height:30px}
.user-block-top{display:block;overflow:hidden;border-bottom:1px solid #e8e8e8;background:#FFF;box-shadow:0 3px 7px #eaeaea}
.user-block-top>h2{padding:0 12px;border-bottom:1px solid #F1F1F1;font-size:16px;line-height:40px}
.user-block-top>h2>a{display:block}
.user-block-top>ul>li{float:left!important;padding:10px 0;width:20%;text-align:center;font-size:14px}
.user-block-top>ul>li>a{display:block;border-left:1px solid #F1F1F1;font-size:12px}
.user-block-top>ul>li:first-child>a{border-left:0}
.user-block-top>ul>li>a>i{display:block;color:#999;font-size:26px;line-height:30px}
.personal-btn{margin:10px;border:1px solid #e9e9e9;border-radius:44px;color:#333;text-align:center;font-size:16px;line-height:44px}
.user-panel-list{display:flex}
.user-panel-list ul{padding:0;list-style:none}
.user-panel-list li{float:left;overflow:hidden;padding:.2rem 0;width:25%;height:75px;border-right:thin solid #eee;border-bottom:thin solid #eee;background:#fff;text-align:center}
.user-panel-list li i{float:right;color:#999}
.user-panel-list li span{display:inline-block;margin:2px;width:2rem;height:2rem;vertical-align:top;font-size:24px}
.user-panel-sub li p{height:1rem;color:#888;font-size:12px;line-height:1rem}
.text-little{color:#999}


</style>


<header class="user-center-header" style="background-image: url(/static/default/wap/image/user/user_top_bg-4.jpg)">
     <a href="<?php echo U('wap/index/index');?>" class="dzapp_navbar_left_home z home-back">
     	<i class="iconfont icon-shouye"></i>
     </a>
     <a href="<?php echo U('information/index');?>" class="home-set"><i class="iconfont icon-guanli"></i>设置</a>
    <div class="am-cf">
    	<a href="<?php echo U('information/index');?>"><img src="<?php echo config_img($MEMBER['face']);?>"></a>
    <div class="user-info">
    <h2><a href="<?php echo U('usersaux/index');?>" class="">实名管理</a></h2>
    <div class="am-cf"><a href="<?php echo U('information/index');?>" class=""><?php echo (($MEMBER["nickname"])?($MEMBER["nickname"]):"无昵称"); ?> ID：【<?php echo ($MEMBER["user_id"]); ?>】</a></div></div>
    <div class="user-center"><a href=""><i class="iconfont"></i></a></div>
    <div class="vip-my"><a href="<?php echo U('information/index');?>"><?php echo (($ranks[$MEMBER['rank_id']]['rank_name'])?($ranks[$MEMBER['rank_id']]['rank_name']):"无等级"); ?></a></div>
    </div>
</header>

<div class="user-block-top margin-top">
    <h2>我的信息</h2>
    <ul class="x12">
        <li><a href="<?php echo U('usersaux/index',array('aready'=>'0'));?>"><i class="iconfont icon-daifukuan1"></i>认证信息</a></li>
        <li><a href="<?php echo U('cash/bankInfo');?>"><i class="iconfont icon-tubiao5"></i>银行卡信息</a></li>

    </ul>
</div>
<div class="user-block-top margin-top">
    <h2><a href="<?php echo U('goods/index',array('aready'=>'999'));?>" class="float-right text-little">全部报名工作</a>我的工作</h2>
    <ul class="x12">
        <li><a href="<?php echo U('goods/index',array('aready'=>'0'));?>"><i class="iconfont icon-daifukuan1"></i>已报名</a></li>
        <li><a href="<?php echo U('goods/index',array('aready'=>'1'));?>"><i class="iconfont icon-tubiao5"></i>报名中</a></li>
        <li><a href="<?php echo U('goods/index',array('aready'=>'3'));?>"><i class="iconfont icon-tuikuan1"></i>已拒绝</a></li>
<!--        <li><a href="<?php echo U('goods/index',array('aready'=>'8'));?>"><i class="iconfont icon-vip-dianping"></i>待评价</a></li>-->
        <li><a href="<?php echo U('favorites/index');?>"><i class="iconfont icon-vip-dianping"></i>我的收藏</a></li>
    </ul>
</div>


<div class="user-block-top margin-top">
    <h2>
    	<a href="<?php echo U('money/index');?>" class="float-right text-little">余额充值</a>
        <a href="<?php echo U('cash/index',array('type'=>'user'));?>" class="float-right text-little margin-right">申请提现</a>
        我的钱包
    </h2>
    <ul class="x12">
        <li><a href="<?php echo U('money/index');?>"><i class="iconfont icon-wodeyouhuijuan"></i>余额明细<?php echo round($MEMBER['money']/100,2);?></a></li>
        <li><a href="<?php echo U('logs/moneylogs');?>"><i class="iconfont icon-kecheng"></i>余额日志</a></li>
        <li><a href="<?php echo U('logs/moneylogs');?>"><i class="iconfont icon-kecheng"></i>我的补贴</a></li>
    </ul>
</div>

<div class="user-block-top margin-top">
    <h2>
<!--        <a href="<?php echo U('distribution/index');?>" class="float-right text-little">我的推广</a>-->
        我的推广
    </h2>
    <ul class="x12">
        <li><a href="<?php echo U('user/distribution/superior');?>"><i class="iconfont icon-wodeyouhuijuan"></i>我的推荐人</a></li>
        <li><a href="<?php echo U('user/distribution/subordinate');?>"><i class="iconfont icon-kecheng"></i>我的下级</a></li>
        <li><a href="<?php echo U('wap/api/qrcode',array('fuid'=>$MEMBER['user_id']));?>"><i class="iconfont icon-kecheng"></i>我的二维码</a></li>
    </ul>
</div>



<!--<div class="blank-10"></div>-->
<!--<div class="container text-center">-->
<!--	<a class="button button-block button-big bg-dot" href="<?php echo U('wap/passport/logout');?>">退出后台</a>-->
<!--</div>-->
<!--<div class="blank-40"></div>-->




</body>



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