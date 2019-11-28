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
    <h2><a href="<?php echo U('goods/index',array('aready'=>'999'));?>" class="float-right text-little">全部报名工作</a>我的工作</h2>
    <ul class="x12">
        <li><a href="<?php echo U('goods/index',array('aready'=>'0'));?>"><i class="iconfont icon-daifukuan1"></i>已报名</a></li>
        <li><a href="<?php echo U('goods/index',array('aready'=>'1'));?>"><i class="iconfont icon-tubiao5"></i>报名中</a></li>
        <li><a href="<?php echo U('goods/index',array('aready'=>'3'));?>"><i class="iconfont icon-tuikuan1"></i>已拒绝</a></li>
        <li><a href="<?php echo U('goods/index',array('aready'=>'8'));?>"><i class="iconfont icon-vip-dianping"></i>待评价</a></li>
    </ul>
</div>
<!--<div class="user-block-top">-->
<!--	<h2><a href="#">常用菜单</a></h2>-->
<!--    <ul class="x12">-->
<!--    	<?php if($CONFIG['operation']['mall']): ?>-->
<!--        	<li><a href="<?php echo LinkTo('goods/index',array('aready'=>1));?>"><i class="iconfont icon-27"></i>购物</a></li>-->
<!--<?php endif; ?> -->
<!--        <?php if($CONFIG['operation']['ele']): ?>-->
<!--        	<li><a href="<?php echo U('eleorder/index');?>"><i class="iconfont icon-waimai1"></i>外卖</a></li>-->
<!--<?php endif; ?> -->
<!--        <?php if($CONFIG['operation']['book']): ?>-->
<!--        	<li><a href="<?php echo U('book/index');?>"><i class="iconfont icon-book"></i>订座</a></li>-->
<!--<?php endif; ?> -->
<!--        <?php if($CONFIG['operation']['appoint']): ?>-->
<!--        	<li><a href="<?php echo U('appoint/index');?>"><i class="iconfont icon-jiazhengfuwu"></i>家政</a></li>-->
<!--<?php endif; ?> -->
<!--        <li><a href="<?php echo U('breaks/index');?>"><i class="iconfont icon-maidan"></i>买单</a></li>-->
<!--    </ul>-->
<!--</div>-->



<div class="user-block-top margin-top">
    <h2>
    	<a href="<?php echo U('money/index');?>" class="float-right text-little">余额充值</a>
        <a href="<?php echo U('cash/index',array('type'=>'user'));?>" class="float-right text-little margin-right">申请提现</a>
        我的钱包
    </h2>
    <ul class="x12">
        <li><a href="<?php echo U('money/index');?>"><i class="iconfont icon-wodeyouhuijuan"></i>余额明细<?php echo round($MEMBER['money']/100,2);?></a></li>
        <li><a href="<?php echo U('logs/moneylogs');?>"><i class="iconfont icon-kecheng"></i>余额日志</a></li>
        <li><a href="<?php echo U('logs/integral');?>"><i class="iconfont icon-chongzhi1"></i>积分账户<?php echo ($MEMBER["integral"]); ?></a></li>
        <li><a href="<?php echo U('logs/integral');?>"><i class="iconfont icon-kecheng"></i>积分明细</a></li>
        <li><a href="<?php echo U('prestige/index');?>"><i class="iconfont icon-zhongchou1"></i><?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); echo ($MEMBER["prestige"]); ?></a></li>
    </ul>
</div>



<!--<div class="user-block-top margin-top">-->
<!--    <h2><a href="<?php echo U('eleorder/index',array('aready'=>'999'));?>" class="float-right text-little">全部外卖订单</a>我的外卖</h2>-->
<!--    <ul class="x12">-->
<!--        <li><a href="<?php echo U('eleorder/index',array('aready'=>'0'));?>"><i class="iconfont icon-daifukuan1"></i>待付款</a></li>-->
<!--        <li><a href="<?php echo U('eleorder/index',array('aready'=>'1'));?>"><i class="iconfont icon-daifukuan2"></i>已付款</a></li>-->
<!--        <li><a href="<?php echo U('eleorder/index',array('aready'=>'3'));?>"><i class="iconfont icon-tuikuan1"></i>退款中</a></li>-->
<!--        <li><a href="<?php echo U('eleorder/index',array('aready'=>'2'));?>"><i class="iconfont icon-peisong"></i>已配送</a></li>-->
<!--        <li><a href="<?php echo U('eleorder/index',array('aready'=>'8'));?>"><i class="iconfont icon-kecheng"></i>已完成</a></li>-->
<!--    </ul>-->
<!--</div>-->


<!--<div class="user-block-top margin-top">-->
<!--    <h2><a href="<?php echo U('goods/index',array('aready'=>'999'));?>" class="float-right text-little">全部商城订单</a>我的商城</h2>-->
<!--    <ul class="x12">-->
<!--        <li><a href="<?php echo U('goods/index',array('aready'=>'0'));?>"><i class="iconfont icon-daifukuan1"></i>待付款</a></li>-->
<!--        <li><a href="<?php echo U('goods/index',array('aready'=>'1'));?>"><i class="iconfont icon-tubiao5"></i>待发货</a></li>-->
<!--        <li><a href="<?php echo U('goods/index',array('aready'=>'3'));?>"><i class="iconfont icon-tuikuan1"></i>退款中</a></li>-->
<!--        <li><a href="<?php echo U('goods/index',array('aready'=>'2'));?>"><i class="iconfont icon-peisong"></i>已配送</a></li>-->
<!--        <li><a href="<?php echo U('goods/index',array('aready'=>'8'));?>"><i class="iconfont icon-vip-dianping"></i>待评价</a></li>-->
<!--    </ul>-->
<!--</div>-->

 <?php $worker = D('Shopworker')->where(array('user_id'=>$MEMBER['user_id']))->find(); $user_delivery = D('Delivery')->where(array('user_id'=>$MEMBER['user_id'],'audit'=>1,'closed'=>0))->find(); $config = D('Setting')->fetchAll(); ?>

<!--<div class="user-block-top margin-top">-->
<!--    <h2><a href="<?php echo U('eleorder/index');?>">常用操作</a></h2>-->
<!--    <div class="user-panel-list">-->
<!--        <ul>-->
<!--        -->
<!--            <?php if($shop): ?>-->
<!--                <li><a href="<?php echo U('seller/index/index');?>"><span class="iconfont icon-shangjia2"></span><p>管理商家</p></a></li>-->
<!--<?php endif; ?>-->
<!--            <?php if($user_delivery): ?>-->
<!--                <li><a href="<?php echo U('delivery/index/index');?>"><span class="iconfont icon-trlogonline"></span><p>配送员</p></a></li>-->
<!--<?php endif; ?>-->
<!--            <?php if($worker): ?>-->
<!--                <li><a class="text-yellow"  href="<?php echo U('worker/index/index');?>"><span class="iconfont icon-iconuser text-yellow"></span><p>店员管理</p></a></li>-->
<!--<?php endif; ?>-->
<!--            <li><a href="<?php echo U('money/index');?>"><span class="iconfont icon-chongzhi3"></span><p>余额充值</p></a></li>-->
<!--            <li><a href="<?php echo U('guide/index');?>"><span class="iconfont icon-zhongchou1"></span><p>城市合伙人</p></a></li>-->
<!--            -->
<!--            <?php if($CONFIG['config']['is_buy_user_rank']): ?>-->
<!--                <li><a href="<?php echo U('information/buy');?>"><span class="iconfont icon-chongzhi1"></span><p>购买会员等级</p></a></li>-->
<!--<?php endif; ?>-->
<!--            -->
<!--           <?php if($CONFIG['operation']['tuan']): ?>-->
<!--                <li><a href="<?php echo U('tuancode/index');?>"><span class="iconfont icon-qianggou1"></span><p>抢购券</p></a></li>-->
<!--                <li><a href="<?php echo U('tuan/index');?>"><span class="iconfont icon-qianggou3"></span><p>抢购订单</p></a></li>-->
<!--<?php endif; ?> -->
<!--            -->
<!--           -->
<!--            -->
<!--            <?php if($CONFIG['operation']['zhe']): ?>-->
<!--                <li><a href="<?php echo U('member/zhe');?>"><span class="iconfont icon-youhui"></span><p>五折卡</p></a></li>-->
<!--<?php endif; ?>-->
<!--            <?php if($CONFIG['operation']['appoint']): ?>-->
<!--            	<li><a class="text-dot"  href="<?php echo U('appoint/card');?>"><span class="iconfont icon-wodeyouhuijuan text-dot"></span><p>家政优惠卡</p></a></li>-->
<!--<?php endif; ?>-->
<!--            -->
<!--            <?php if($CONFIG['profit']['profit']): ?>-->
<!--                <li><a class="text-yellow" href="<?php echo U('distribution/index');?>"><span class="iconfont icon-xianjinfencheng text-yellow"></span><p>分成</p></a></li>-->
<!--<?php endif; ?> -->
<!--            -->
<!--            -->
<!--            -->
<!--            <?php if($CONFIG['operation']['running']): ?>-->
<!--                <li><a href="<?php echo U('running/index');?>"><span class="iconfont icon-trlogonline"></span><p>跑腿</p></a></li>  -->
<!--<?php endif; ?> -->
<!--            <?php if($CONFIG['operation']['ktv']): ?>-->
<!--                <li><a href="<?php echo U('ktv/index');?>"><span class="iconfont icon-ktv3"></span><p>KTV</p></a></li> -->
<!--<?php endif; ?>-->
<!--            -->
<!--            <?php if($CONFIG['operation']['market']): ?>-->
<!--                <li><a href="<?php echo U('market/index');?>"><span class="iconfont icon-ktv3"></span><p>菜市场</p></a></li> -->
<!--<?php endif; ?>-->
<!--            -->
<!--            <?php if($CONFIG['operation']['store']): ?>-->
<!--                <li><a href="<?php echo U('store/index');?>"><span class="iconfont icon-fenleixinxi"></span><p>便利店</p></a></li> -->
<!--<?php endif; ?>-->
<!--            -->
<!--            -->
<!--            <?php if($CONFIG['operation']['hotels']): ?>-->
<!--                <li><a href="<?php echo U('hotels/index');?>"><span class="iconfont icon-jiudian1"></span><p>酒店</p></a></li>      -->
<!--<?php endif; ?>-->
<!--            <?php if($CONFIG['operation']['edu']): ?>-->
<!--                <li><a href="<?php echo U('edu/index');?>"><span class="iconfont icon-kecheng"></span><p>课程</p></a></li>  -->
<!--<?php endif; ?>-->
<!--            <?php if($CONFIG['operation']['village']): ?>-->
<!--                <?php if($CONFIG['village']['user_is_show']): ?>-->
<!--                    <li><a href="<?php echo U('village/index');?>"><span class="iconfont icon-nostalgia"></span><p>乡村</p></a></li>  -->
<!--<?php endif; ?>      -->
<!--<?php endif; ?>-->
<!--            <?php if($CONFIG['operation']['life']): ?>-->
<!--                <li><a href="<?php echo U('life/index');?>"><span class="iconfont icon-fenleixinxi"></span><p>同城信息</p></a></li>  -->
<!--<?php endif; ?> -->
<!--            <?php if($CONFIG['operation']['thread']): ?>-->
<!--                <li><a href="<?php echo U('thread/index');?>"><span class="iconfont icon-tubiao1tieba1"></span><p>贴吧</p></a></li>  -->
<!--<?php endif; ?>  -->
<!--            <?php if($CONFIG['operation']['stock']): ?>-->
<!--                <li><a href="<?php echo U('stock/index');?>"><span class="iconfont iconfont icon-chongzhi1"></span><p>股权订单</p></a></li>-->
<!--<?php endif; ?> -->
<!--            -->
<!--            <?php if($CONFIG['operation']['ktv']): ?>-->
<!--                <li><a href="<?php echo U('ktv/index');?>"><span class="iconfont icon-yiyuanyungou-"></span><p>KTV订单</p></a></li>-->
<!--<?php endif; ?> -->
<!--            -->
<!--            <?php if($CONFIG['operation']['cloud']): ?>-->
<!--                <li><a href="<?php echo U('cloud/index');?>"><span class="iconfont icon-yiyuanyungou-"></span><p>一元云购</p></a></li>-->
<!--<?php endif; ?> -->
<!--            -->
<!--            <?php if($CONFIG['operation']['crowd']): ?>-->
<!--                <li><a href="<?php echo U('crowd/index',array('aready'=>1));?>"><span class="iconfont icon-zhongchou1"></span><p>众筹</p></a></li>   -->
<!--<?php endif; ?>-->
<!--            -->
<!--            <?php if($CONFIG['operation']['pinche']): ?>-->
<!--                <li><a href="<?php echo U('pinche/index');?>"><span class="iconfont icon-pin"></span><p>拼车</p></a></li>        -->
<!--<?php endif; ?>-->
<!--            -->
<!--            <?php if($CONFIG['operation']['community']): ?>-->
<!--                <li><a href="<?php echo U('community/index');?>"><span class="iconfont icon-wodexiaoqu1"></span><p>小区</p></a></li>        -->
<!--<?php endif; ?>-->
<!--      -->
<!--    -->
<!--            <?php if($CONFIG['operation']['jifen']): ?>-->
<!--                <li><a href="<?php echo U('exchange/index');?>"><span class="iconfont icon-lipin4"></span><p>礼品</p> </a></li>-->
<!--<?php endif; ?> -->
<!--            -->
<!--            <?php if($CONFIG['operation']['coupon']): ?>-->
<!--                <li><a href="<?php echo U('coupon/index');?>"><span class="iconfont icon-wodeyouhuijuan"></span><p>优惠券</p></a></li>-->
<!--<?php endif; ?> -->
<!--            <li><a class="text-blue" href="<?php echo U('user/message/index');?>"><span class="iconfont icon-xiaoxi3 text-blue"></span><p>消息</p></a></li>-->
<!--            <li><a href="<?php echo U('favorites/index');?>"><span class="iconfont icon-fill85"></span><p>收藏</p></a></li> -->
<!--            <li><a href="<?php echo U('yuyue/index',array('status'=>1));?>"><span class="iconfont icon-yuyue1"></span><p>预约</p></a></li>-->
<!--            -->
<!--        </ul>-->
<!--    </div>-->
<!--</div>-->


<div class="blank-10"></div>
<div class="container text-center">
	<a class="button button-block button-big bg-dot" href="<?php echo U('wap/passport/logout');?>">退出后台</a>
</div>
<div class="blank-40"></div>




</body>



<div class="blank-20"></div>
 <footer class="foot-fixed">
  <?php if(($ctl == 'member') AND ($act == 'index')): ?><a class="foot-item <?php if(($ctl == 'member') AND ($act != 'fabu')): ?>active<?php endif; ?>" href="<?php echo u('wap/index/index');?>">		
    <span class="iconfont icon-shouye"></span>
    <span class="foot-label">首页</span>
    </a>
  <?php else: ?>
  <a class="foot-item" href="<?php echo u('member/index');?>">		
    <span class="iconfont icon-shouye"></span>
    <span class="foot-label">首页</span>
    </a><?php endif; ?>
    
    <a class="foot-item  <?php if($act == 'fabu'): ?>active<?php endif; ?> " href="<?php echo LinkTo('member/fabu');?>">			
    <span class="iconfont icon-fabu"></span><span class="foot-label">发布</span></a>
    
    <a class="foot-item  <?php if(($ctl == 'breaks')): ?>active<?php endif; ?>" href="<?php echo u('breaks/index');?>">			
    <span class="iconfont icon-maidan"></span><span class="foot-label">买单</span></a>
    
    <a class="foot-item  <?php if(($ctl == 'message') ||($act == 'xiaoxizhongxin')): ?>active<?php endif; ?>" href="<?php echo u('message/index');?>">	
        <span class="iconfont icon-tubiao1tieba1"></span>
        <span class="foot-label <?php if($msg_day): ?>text-dot<?php endif; ?>"> <?php if($msg_day): ?>有新<?php endif; ?>消息</span>
    </a>
    
    <a class="foot-item  <?php if($ctl == 'information'): ?>active<?php endif; ?>" href="<?php echo u('information/index');?>">			
    <span class="iconfont icon-guanli"></span><span class="foot-label">设置</span></a>
    </footer>


<iframe id="x-frame" name="x-frame" style="display:none;"></iframe>
<style>
.add-message {margin-top: 30px;}
.add-button{ text-align:center;}
.layui-layer-title {border-bottom: 0px solid #eee;}
</style>


</body>
</html>