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
		<a class="top-addr" href="<?php echo U('member/index');?>"><i class="iconfont icon-angle-left"></i></a>
	</div>
		<div class="top-title">
			我的上级
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
<style>
.detail-base {margin-top:20px;margin-bottom: 10px;}
.detail-base p{margin:0;color:#999;}
.detail-base h1{font-size:16px;font-weight:700;margin-bottom:5px;}
.detail-base .pic img{width:80%;height:80%;position:relative;border-radius: 100%;}
.detail-base .pic span.album{position: absolute; right:10%;bottom: 0;width: 20px;height: 20px;line-height: 20px;text-align: center;background-color: rgba(0,0,0,.5);color: #fff;-webkit-transform: scale(.75);-moz-transform: scale(.75);-ms-transform: scale(.75);-o-transform: scale(.75); transform: scale(.75);-webkit-transform-origin: 100% 100%;-moz-transform-origin: 100% 100%;-ms-transform-origin: 100% 100%;-o-transform-origin: 100% 100%; transform-origin: 100% 100%;}
</style>
<div class="container">
	<?php if($MEMBER['fuid1']): ?><div class="line detail-base">
			<div class="x4"><div class="pic"><img src="<?php echo config_img($fuser['face']);?>"></div></div>
			<div class="x8">
				<h1>帐号：<?php echo ($fuser["account"]); ?></h1>
				<p>昵称：<?php echo ($fuser["nickname"]); ?></p>
                <p class="text-small">VIP：<?php echo ($fuser['rank_id']); ?></p>
                <p class="text-small">Email：<?php echo ($fuser["email"]); ?></p>
			</div>
		</div>
	<?php else: ?>
    	<div class="line detail-base">
			<div class="x4">
                <div class="pic">
                	<img src="<?php echo config_img($CONFIG['site']['logo']);?>" />
                </div>
            </div>
			<div class="x8">
				<h1>平台方</h1>
				<p>电话：<?php echo (($CONFIG['site']['tel'])?($CONFIG['site']['tel']):"平台未设置"); ?></p>
                <p class="text-small">QQ：<?php echo (($CONFIG['site']['qq'])?($CONFIG['site']['qq']):"平台未设置"); ?></p>
                <p class="text-small">Email：<?php echo (($CONFIG['site']['email'])?($CONFIG['site']['email']):"平台未设置"); ?></p>
			</div>
		</div><?php endif; ?>
</div>
<div class="blank-10 bg"></div>
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