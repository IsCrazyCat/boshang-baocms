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
<link rel="stylesheet" href="/static/default/wap/css/index/sm.min.css">
<link rel="stylesheet" href="/static/default/wap/css/index/jobApplysList.css">

<style>
	ul{padding-left: 0px}
</style>
<header class="top-fixed bg-yellow bg-inverse">
	<div class="top-back">
		<a class="top-addr" href="javascript:history.back(-1);"><i class="iconfont icon-angle-left"></i></a>
	</div>
		<div class="top-title">
			我的工作
		</div>
	<div class="top-signed">
		<?php if($msg_day > 0): ?><a href="<?php echo u('user/message/index');?>">
<i class="iconfont icon-tubiao1tieba1"></i>
<span class="badge bg-red jiaofei"><?php echo ($msg_day); ?></span>
</a>
<?php else: ?>
    <?php if(empty($sign_day)): ?><a href="<?php echo u('wap/sign/signed');?>" class="top-addr iconfont icon-qiandao"></a>    
    <?php else: ?>
    <a href="<?php echo u('wap/passport/logout');?>" class="top-addr iconfont icon-tuichu2"></a><?php endif; endif; ?>
	</div>
</header>


<ul id="shangjia_tab">
	<li style="width:20%;font-size: 14px;"><a href="<?php echo LinkTo('goods/index',array('aready'=>999));?>" <?php if(($aready) == "999"): ?>class="on"<?php endif; ?>>全部</a></li>
	<li style="width:20%;font-size: 14px;"><a href="<?php echo LinkTo('goods/index',array('aready'=>0));?>" <?php if(($aready) == "0"): ?>class="on"<?php endif; ?>>待审核</a></li>
	<li style="width:20%;font-size: 14px;"><a href="<?php echo LinkTo('goods/index',array('aready'=>1));?>" <?php if(($aready) == "1"): ?>class="on"<?php endif; ?>>审核成功</a></li>
	<li style="width:20%;font-size: 14px;"><a href="<?php echo LinkTo('goods/index',array('aready'=>2));?>" <?php if(($aready) == "2"): ?>class="on"<?php endif; ?>>审核失败</a></li>
	<li style="width:20%;font-size: 14px;"><a href="<?php echo LinkTo('goods/index',array('aready'=>3));?>" <?php if(($aready) == "3"): ?>class="on"<?php endif; ?>>已取消</a></li>
</ul>



<div class="list-media-x" id="list-media">
	<div class="blank-10 bg"></div>
	<div class="top-container">
		<ul class="apply-item-list">
		</ul>
	</div>
</div>

<script>
	$(document).ready(function () {

		loaddata('<?php echo U("goods/goodsloaddata",array("aready"=>$aready,"goods_id"=>$goods_id,"t"=>$nowtime,"p"=>"0000"));?>', $("#list-media ul"), true);

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