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
        <li class="li1">商城</li>
        <li class="li2">企业产品</li>
        <li class="li2 li3">工作类别</li>
    </ul>
</div>
<div class="main-cate">
	<p class="attention"><span>注意：</span>新版已取消结算费率，新版商城结算费率在企业》》》企业列表》》》编辑》》》佣金处设置，这里具体参考企业编辑那边，不懂的联系qq286099981</p>
    <div class="jsglNr">
        <form id="cate_action" action="" target="x-frame" method="post">
            <div class="selectNr" style="border-top: 1px solid #dbdbdb;">
                <div class="left">
                    <?php echo BA('goodscate/create','','添加一级分类','load','',600,450);?>
                </div>
                <div class="right">
                    <?php echo BA('goodscate/update','','更新','list','remberBtn');?>
                </div>
            </div>
            <div class="tableBox">
                <table bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF; text-align:center;">
                    <tr bgcolor="#f1f1f1" height="48px;" style="color:#333; font-size:16px; line-height:48px;">
                        <td>分类</td>
                        <td>排序</td>
                        <td>图标</td>
                        <td>工作类型ID</td>
                        <td>工作类型名称</td>
                        <td>工作数量</td>
                        <td>代卖编码</td>
                        <td>代卖名称</td>
                        <td>操作</td>
                    </tr>
                    <?php if(is_array($list)): foreach($list as $key=>$var): if(($var["parent_id"] == 0)): ?><tr bgcolor="#F4F4F4" height="48px" style="font-size:14px; color:#545454; text-align:left; line-height:48px;">
                                <td style="padding-left:20px;"><?php echo ($var["cate_name"]); ?>(<?php echo ($var["cate_id"]); ?>)</td>
                                <td style="padding-left:70px;"><input name="orderby[<?php echo ($var["cate_id"]); ?>]" value="<?php echo ($var["orderby"]); ?>" type="text" class="remberinput w80" /></td> 
                                <td>
                                    <?php if(!empty($var['photo'])): ?><img style="padding:5px;width:60px;" src="<?php echo config_img($var['photo']);?>" />
                                    <?php else: ?>
                                        无图标<?php endif; ?>
                                </td>
                                <td style="padding-left:20px;"><?php echo ($var["type_id"]); ?></td>
                                <td style="padding-left:20px;"><?php echo ($var["name"]); ?></td>
                                <td style="padding-left:20px;"><?php echo ($var["goods_num"]); ?></td>
                                <td style="padding-left:20px;"><?php echo ($var["commId"]); ?></td>
                                <td style="padding-left:20px;"><?php echo ($var["commIdName"]); ?></td>
                                <td style="text-align: center;">
                                    <?php echo BA('goodscate/create',array("parent_id"=>$var["cate_id"]),'添加子分类','load','remberBtn',600,450);?>
                                    <?php echo BA('goodscate/edit',array("cate_id"=>$var["cate_id"]),'编辑','load','remberBtn',600,450);?>
                                    <?php echo BA('goodscate/delete',array("cate_id"=>$var["cate_id"]),'删除','act','remberBtn');?>
                                </td>
                            </tr>
                            <?php if(is_array($list)): foreach($list as $key=>$var2): if(($var2["parent_id"]) == $var["cate_id"]): ?><tr height="48px" style="font-size:14px; color:#545454; text-align:center; line-height:48px; background:#FFF">
                                    <td><?php echo ($var2["cate_name"]); ?>(<?php echo ($var2["cate_id"]); ?>)</td>
                                    <td><input name="orderby[<?php echo ($var2["cate_id"]); ?>]" value="<?php echo ($var2["orderby"]); ?>" type="text" class="remberinput w80" /></td>
                                    <td>
                                        <?php if(!empty($var2['photo'])): ?><img style="padding:5px;width:60px;" src="<?php echo config_img($var2['photo']);?>" />
                                        <?php else: ?>
                                            无图标<?php endif; ?>
                                    </td>
                                    <td><?php echo ($var2["type_id"]); ?></td>
                                	<td><?php echo ($var2["name"]); ?></td>
                                    <td><?php echo ($var2["goods_num"]); ?></td>
                                    <td><?php echo ($var2["commId"]); ?></td>
                                	<td><?php echo ($var2["commIdName"]); ?></td>
                                    <td>
                                        <?php echo BA('goodscate/edit',array("cate_id"=>$var2["cate_id"]),'编辑','load','remberBtn',600,450);?>
                                        <?php echo BA('goodscate/delete',array("cate_id"=>$var2["cate_id"]),'删除','act','remberBtn');?>
                                    </td>
                                </tr><?php endif; endforeach; endif; endif; endforeach; endif; ?>        
                </table>
            </div>
        </form>
    </div>
</div>
  		</div>
	</body>
</html>