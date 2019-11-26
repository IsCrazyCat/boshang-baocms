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
        <li class="li1">功能</li>
        <li class="li2">汽车品牌管理</li>
        <li class="li2 li3">汽车品牌列表</li>
    </ul>
</div>
<div class="main-jsgl main-sc">
    <p class="attention"><span>注意：</span> 汽车品牌请谨慎操作！</p>
    <div class="jsglNr">
        <div class="selectNr" style="margin-top: 0px; border-top:none;">
            <div class="left">
                <?php echo BA('carbrand/create','','添加内容');?>
            </div>
            <div class="right">
                <form  method="post"  action="<?php echo U('carbrand/index');?>"> 

                    <div class="seleHidden" id="seleHidden">
                        <div class="seleK">
                            <span>标题</span>
                            <input type="text"  class="inptText" name="keyword" value="<?php echo ($keyword); ?>"  />
                            <input type="submit" value=" 搜索"  class="inptButton" />
                        </div>
                    </div> 
                </form>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
        <form  target="x-frame" method="post">
            <div class="tableBox">
                <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;"  >
                    <tr>

                        <td class="w50"><input type="checkbox" class="checkAll" rel="brand_id" /></td>
                        <td>汽车品牌ID</td>  
                        <td>品牌名称</td>
                        <td>品牌图片</td>
                        <td>排序</td>
                        <td>添加时间</td>
                        <td>添加IP</td>
                        <td>操作</td>
                    <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
                            <td><input class="child_brand_id" type="checkbox" name="brand_id[]" value="<?php echo ($var["brand_id"]); ?>" /> </td>
                            <td><?php echo ($var["brand_id"]); ?></td>
                            <td><?php echo ($var["name"]); ?></td>
                            <td><img src="<?php echo config_img($var['photo']);?>"/></td>
                            <td><?php echo ($var["orderby"]); ?></td>
                            <td><?php echo (date("Y-m-d H:i:s",$var["create_time"])); ?></td>
                            <td><?php echo ($var["create_ip"]); ?></td>
                        <td>
                            <?php echo BA('carbrand/edit',array("brand_id"=>$var["brand_id"]),'编辑','','remberBtn');?>
                            <?php echo BA('carbrand/delete',array("brand_id"=>$var["brand_id"]),'删除','act','remberBtn');?>

                        </td>
                        </tr><?php endforeach; endif; ?>
                </table>
                <?php echo ($page); ?>
            </div>
            <div class="selectNr" style="margin-bottom: 0px; border-bottom: none;">
                <div class="left">
                    <?php echo BA('carbrand/delete','','批量删除','list',' a2');?>
                </div>
            </div>

        </form>
    </div>
</div>
  		</div>
	</body>
</html>