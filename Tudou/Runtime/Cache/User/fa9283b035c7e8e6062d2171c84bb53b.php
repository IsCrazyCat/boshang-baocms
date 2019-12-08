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
<link rel="stylesheet" type="text/css" href="/static/default/wap/other/webuploader.css">
<script src="/static/default/webuploader/webuploader.min.js"></script>
<header class="top-fixed bg-yellow bg-inverse">
    <div class="top-back">
        <a class="top-addr" href="javascript:history.back(-1);"><i class="iconfont icon-angle-left"></i></a>
    </div>
    <div class="top-title">
        实名认证
    </div>
</header>
<style>
    #login-input input.mapinputs{ width:48%; float:left; margin-right:5px;}
    #login-input input.mapinputs2{ width:100%; float:left; margin:10px 0px;}
</style>


    <form class="fabu-form" method="post"  target="x-frame" action="<?php echo U('usersaux/index');?>">
        <div class="blank-10 bg"></div>

        <div class="row">
            <div class="line">
                <span class="x3">姓名</span>
                <span class="x9">
                <input type="text" class="text-input" name="data[name]" value="<?php echo ($detail['name']); ?>"/>
</span>
</div>
</div>

<div class="row">
    <div class="line">
        <span class="x3">手机号</span>
        <span class="x5">
            <input type="text" class="text-input" id="mobile" name="data[mobile]" value="<?php if($MEMBER["mobile"] != null): echo ($MEMBER["mobile"]); endif; ?>"/>
        </span>
        <span class="x4" id="yzmspan"><a class="button button-small bg-dot" id="m_zcyz" href="javascript:void(0);">获取验证码</a></span>

    </div>
</div>
<div class="row" id="yzmdiv">
    <div class="line">
        <span class="x3">验证码</span>
        <span class="x9">
            <input type="text" class="text-input" name="data[yzm]" value=""/>
        </span>

    </div>
</div>
<div class="row">
    <div class="line">
        <span class="x3">身份证</span>
        <span class="x9">
                <input type="text" class="text-input" name="data[card_id]" value="<?php echo (($detail["card_id"])?($detail["card_id"]):''); ?>"/>
            </span>
    </div>
</div>

        <div class="container">
            <div class="line" style="padding:10px">
                <div class="x12">
                    <?php if(empty($detail)): ?><input type="hidden" value="1" id="flag">
                        <button  type="submit" class="button button-block button-big bg-dot">立即认证</button>
                    <?php elseif($detail['audit'] == 0): ?>
                        <a class="button button-block button-big bg-dot text-center">审核中</a>
                        <div class="blank-20"></div>
                        <a class="button button-block button-big bg-yellow text-center" href="<?php echo U('user/member/index');?>">返回会员中心</a>
                        <!--                    <h1>审核中，加快审核联系电话<?php echo ($CONFIG["site"]["tel"]); ?> <a class="button button-small bg-yellow" href="<?php echo U('usersaux/edit',array('user_id'=>$detail['user_id']));?>">编辑</a></h1>-->
                    <?php elseif($detail['audit'] == -1): ?>
                        <h1>已驳回，拒绝理由：<?php echo ($detail["reason"]); ?> <a class="button button-small bg-dot" href="<?php echo U('usersaux/edit',array('user_id'=>$detail['user_id']));?>">重新编辑</a></h1>
                    <?php elseif($detail['audit'] == 1): ?>
                        <a class="button button-block button-big bg-dot text-center">已通过实名认证</a>
                        <div class="blank-20"></div>
                        <a class="button button-block button-big bg-yellow text-center" href="<?php echo U('user/member/index');?>">返回会员中心</a><?php endif; ?>
                </div>
            </div>
        </div>
</form>
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

<script>
    if($("#flag").val() != 1){

        $("input").attr("readonly",true);
        $("#yzmspan").hide();
        $("#yzmdiv").hide();
    }


    var mobile_timeout;
    var mobile_count = 100;
    var mobile_lock = 0;
    $(function () {

        $("#m_zcyz").click(function () {
            if (mobile_lock == 0) {
                mobile_lock = 1;
                var mobile = $("#mobile").val();
                if(mobile=="" || mobile=="请输入手机号码"){
                    layer.msg('请先输入手机号码', function(){
                        setTimeout(function () {
                            window.location.href = "<?php echo U('usersaux/index');?>";
                        }, 1000);
                    });
                    exit;//如果没绑定手机，不执行下面的代码
                }
                $.ajax({
                    url: '<?php echo U("usersaux/sendsms");?>',
                    data: 'mobile=' + $("#mobile").val(),
                    type: 'post',
                    success: function (data) {
                        if (data == 1) {
                            mobile_count = 60;
                            $("#m_zcyz").addClass("on");
                            $('#m_zcyz').attr("disabled", "disabled");
                            BtnCount();
                        } else {
                            mobile_lock = 0;
                            layer.msg('请检查必填项是否填写，或者该手机已经存在', function(){
                            });
                        }
                    }
                });
            }
        });
    });




    BtnCount = function () {
        if (mobile_count == 0) {
            $("#m_zcyz").removeClass("on");
            $('#m_zcyz').removeAttr("disabled");
            $('#m_zcyz').html("重新发送");
            mobile_lock = 0;
            clearTimeout(mobile_timeout);
        }
        else {
            mobile_count--;
            $('#m_zcyz').html("获取(" + mobile_count.toString() + ")秒");
            mobile_timeout = setTimeout(BtnCount, 1000);
        }
    };


</script>