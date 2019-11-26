<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><?php echo ($CONFIG["site"]["title"]); ?>管理后台</title>
        <meta name="description" content="<?php echo ($CONFIG["site"]["title"]); ?>管理后台" />
        <meta name="keywords" content="<?php echo ($CONFIG["site"]["title"]); ?>管理后台" />
        <link href="__TMPL__statics/css/style.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/land.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/pub.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/main.css" rel="stylesheet" type="text/css" />
        <link href="__PUBLIC__/js/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script> var TU_PUBLIC = '__PUBLIC__'; var TU_ROOT = '__ROOT__'; </script>
        <script src="__PUBLIC__/js/jquery.js"></script>
        <script src="__PUBLIC__/js/jquery-ui.min.js"></script>
        <script src="__PUBLIC__/js/my97/WdatePicker.js"></script>
        <script src="/Public/js/layer/layer.js"></script>
        <script src="__PUBLIC__/js/admin.js"></script>
        <script src="__PUBLIC__/js/echarts-all-3.js"></script>
        <link rel="stylesheet" type="text/css" href="/static/default/webuploader/webuploader.css">
		<script src="/static/default/webuploader/webuploader.min.js"></script>
    </head>
    
    
    </head>
<style type="text/css">
#ie9-warning{ background:#F00; height:38px; line-height:38px; padding:10px;
position:absolute;top:0;left:0;font-size:12px;color:#fff;width:97%;text-align:left; z-index:9999999;}
#ie6-warning a {text-decoration:none; color:#fff !important;}
</style>

<!--[if lte IE 9]>
<div id="ie9-warning">您正在使用 Internet Explorer 9以下的版本，请用谷歌浏览器访问后台、部分浏览器可以开启极速模式访问！不懂点击这里！ <a href="http://www.juhucms.com/10478.html" target="_blank">查看为什么？</a>
</div>
<script type="text/javascript">
function position_fixed(el, eltop, elleft){  
       // check if this is IE6  
       if(!window.XMLHttpRequest)  
              window.onscroll = function(){  
                     el.style.top = (document.documentElement.scrollTop + eltop)+"px";  
                     el.style.left = (document.documentElement.scrollLeft + elleft)+"px";  
       }  
       else el.style.position = "fixed";  
}
       position_fixed(document.getElementById("ie9-warning"),0, 0);
</script>
<![endif]-->


    <body>
         <iframe id="x-frame" name="x-frame" style="display:none;"></iframe>
   <div class="main">
<div class="mainBt">
    <ul>
        <li class="li1">功能:</li>
        <li class="li2">活动管理</li>
        <li class="li2 li3">活动分类</li>
    </ul>
</div>
<div class="main-cate">
    <p class="attention"><span>注意：</span>这里是一级分类，自动统计分类下面的活动列表，已删除的活动不统计，新增商家中心发布活动管理！</p>
    <div class="jsglNr">
        <form  target="x-frame" method="post">
            <div class="selectNr" style="border-top: 1px solid #e1e6eb;">
                <div class="left">
                    <?php echo BA('activitycate/create','','添加分类','load','',600,300);?>
                </div>
                <div class="right">
                    <?php echo BA('activitycate/update','','更新','list','remberBtn');?>
                </div>
            </div>
            <div class="tableBox">
                <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF; text-align:center;">
                    <tr bgcolor="#F5F6FA" height="35px;" style="color:#333; font-size:16px; line-height:35px;">

                        <th>分类</th>
                        <th>排序</th>
                        <th>数量</th>
                        <th>操作</th>
                    </tr>
                    <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr bgcolor="#f1f1f1" height="48px" style="font-size:14px; color:#545454;  line-height:48px;">
                            <td ><?php echo ($var["cate_name"]); ?></td>
                            <td><input name="orderby[<?php echo ($var["cate_id"]); ?>]" value="<?php echo ($var["orderby"]); ?>" type="text" class="remberinput w80" /></td>
                            <?php $num = D(Activity)->where(array('cate_id'=>$var['cate_id'],'closed'=>0))->count(); ?>
                            <td ><?php echo ($num); ?></td>
                            <td >
                                <?php echo BA('activitycate/edit',array("cate_id"=>$var["cate_id"]),'编辑','load','remberBtn',600,300);?>
                                <?php echo BA('activitycate/delete',array("cate_id"=>$var["cate_id"]),'删除','act','remberBtn');?>
                            </td>  
                        </tr><?php endforeach; endif; ?>       
                </table>
                <?php echo ($page); ?>
        </form>
    </div>
      		</div>
	</body>
</html>