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
		<div class="top-back">
			<a class="top-addr" href="javascript:history.back(-1);"><i class="iconfont icon-angle-left"></i></a>
		</div>
		<div class="top-title">
			提示信息
		</div>
	</header>
	<div class="container">
		<div class="blank-100"></div>
		<?php if($message != null): ?><div class="alert alert-green">
			<strong>操作成功</strong> <p><?php echo($message); ?><span class="text-dot" id="wait-time"></span>秒后自动跳转。</p>
			<a class="button bg" href="<?php echo U('index/index');?>">返回首页</a>
			<a class="button bg-green" href="<?php echo ($jumpUrl); ?>">知道啦！</a>
		</div>
		<?php else: ?>
		<div class="alert alert-red">
			<strong>操作失败</strong> <p><?php echo($error); ?> <span class="text-dot" id="wait-time"></span>秒后自动跳转。</p>
			<a class="button bg" href="<?php echo U('index/index');?>">返回首页</a>
			<a class="button bg-red" href="<?php echo ($jumpUrl); ?>">知道啦！</a>
		</div><?php endif; ?>
		<div class="blank-40"></div>
	</div>
	<script> 
		var secs = 1; //倒计时的秒数 
		var URL ; 
		function Load(url){ 
			URL =url; 
			for(var i=secs;i>=0;i--){ 
				window.setTimeout('timeUpdate(' + i + ')', (secs-i) * 1000); 
			} 
		} 
		function timeUpdate(num){ 
			$("#wait-time").html(num); 
			if(num == 0){
				window.location=URL;
			} 
		}
		Load("<?php echo($jumpUrl); ?>"); //要跳转到的页面 
	</script> 
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