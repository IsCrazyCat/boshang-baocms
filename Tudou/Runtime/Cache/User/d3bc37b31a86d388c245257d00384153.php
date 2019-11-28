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
			账户信息
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
<?php $mobile = substr_replace($res['mobile'],'****',3,4); ?>
<style>
.layui-layer-molv .layui-layer-title{background-color: #F8F8F8;border-bottom:1px solid #eee;color: #333;}
</style>
<div class="container">
		<div class="blank-10"></div>
		<p><span class="text-dot">小提示：</span> 如果您是微信登录的用户，请绑定手机后都改登录密码，然后就可以登录电脑版了！</p>
	</div>
<div class="panel-list border-top">
	<ul>
		<li>
			<a href="<?php echo U('info/face');?>">
				上传头像
				<i class="iconfont icon-angle-right"></i>
			</a>
		</li>
		<li>
			<a href="<?php echo U('info/nickname');?>">
				用户昵称<em><?php echo ($res["nickname"]); ?> ID：<?php echo ($res["user_id"]); ?></em>
			</a>
		</li>
        <li>
			<a href="">
				登录账户<em><?php echo ($res["account"]); ?> </em>
			</a>
		</li>
        <li>
			<a href="<?php echo U('info/password');?>">
				密码登录<b class="text-dot margin-left">不知道登录密码点击这里？</b>
				<i class="iconfont icon-angle-right float-right"></i>
			</a>
		</li>
		<li>
			<a href="<?php echo u('addrs/index');?>">
				外卖收货地址<em><?php echo ($addr_count); ?>个</em>
			</a>
		</li>
        <li>
			<a href="<?php echo u('wap/address/addlist');?>">
				商城收货地址 <i class="iconfont icon-angle-right"></i>
			</a>
		</li>
        
        
        <li>
			<a href="<?php echo U('info/carbrand');?>">
				汽车品牌设置 <i class="iconfont icon-angle-right"></i>
			</a>
		</li>
        
        
	</ul>
</div>
<div class="blank-10 bg"></div>
<div class="panel-list">
	<ul>
		<li><a href="<?php echo U('money/index');?>">余额充值<i class="iconfont icon-angle-right"></i></a></li>
		<li><a href="<?php echo U('logs/moneylogs');?>">日志列表<i class="iconfont icon-angle-right"></i></a></li>
        <?php if(!empty($CONFIG[integral][integral_exchange])): ?><li><a href="<?php echo U('money/exchange');?>">积分兑换余额<i class="iconfont icon-angle-right"></i></a></li><?php endif; ?>
        <?php if(!empty($CONFIG[cash][is_transfer])): ?><li><a href="<?php echo U('money/transfer');?>">给好友转账<i class="iconfont icon-angle-right"></i></a></li><?php endif; ?>
       
        <li><a href="<?php echo U('money/integral');?>">积分转账<i class="iconfont icon-angle-right"></i></a></li>
        <?php if(!empty($CONFIG[prestige][is_transfer_accounts])): ?><li><a href="<?php echo U('money/prestige');?>"><?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>转账<i class="iconfont icon-angle-right"></i></a></li><?php endif; ?>
	</ul>
</div>
<div class="blank-10 bg"></div>
<div class="panel-list border-top">
	<ul>
		<li>
			<a <?php if(!empty($res['mobile'])): ?>id="change_mobile"<?php else: ?>id="bind_mobile"<?php endif; ?> href="javascript:void(0);">
				绑定手机<?php if(!empty($res["mobile"])): ?><em class="text-green"><?php echo ($mobile); ?></em><?php else: ?><em class="text-gray">未绑定</em><?php endif; ?>
			</a>
		</li>
		<li>
			<?php if(!isset($bind['weixin'])){?>
			<a href="<?php echo u('wap/passport/wxlogin');?>">
				绑定微信<em class="text-gray">绑定老账号</em>
			</a>
			<?php }else{?>
			<a href="javascript:;">
				绑定微信<em class="text-green">已绑定</em>
			</a>
			<?php }?>
		</li>
		<!--<li>
			<?php if(!isset($bind['qq'])){?>
			<a href="<?php echo u('wap/passport/qqlogin');?>">
				绑定QQ<em class="text-gray">未绑定</em>
			</a>
			<?php }else{?>
			<a href="javascript:;">
				绑定QQ<em class="text-green">已绑定</em>
			</a>
			<?php }?>
		</li>
		<li>
			<?php if(!isset($bind['weibo'])){?>
			<a href="<?php echo u('wap/passport/wblogin');?>">
				绑定微博<em class="text-gray">未绑定</em>
			</a>
			<?php }else{?>
			<a href="javascript:;">
				绑定微博<em class="text-green">已绑定</em>
			</a>
			<?php }?>
		</li>-->
        
        <li>
			<a href="<?php echo U('info/password');?>">
				修改密码登录
				<i class="iconfont icon-angle-right"></i>
			</a>
		</li>
        <li>
			<a href="<?php echo U('info/pay_password');?>">
				修改支付密码
				<i class="iconfont icon-angle-right"></i>
			</a>
		</li>
	</ul>
</div>
<div class="blank-10 bg"></div>


<?php if(!empty($res["mobile"])): ?><script>
	$('#change_mobile').click(function(){
		change_user_mobile('<?php echo U("wap/tuan/tuan_sendsms");?>','<?php echo U("wap/tuan/tuan_mobile");?>');
	})
</script>
<?php else: ?>
<script>
	check_user_mobile('<?php echo U("wap/tuan/tuan_sendsms");?>','<?php echo U("wap/tuan/tuan_mobile");?>');
	$('#bind_mobile').click(function(){
		check_user_mobile('<?php echo U("wap/tuan/tuan_sendsms");?>','<?php echo U("wap/tuan/tuan_mobile");?>');
	})
</script><?php endif; ?>
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