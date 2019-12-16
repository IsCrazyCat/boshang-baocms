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
        <li class="li1">分销</li>
        <li class="li2">分销管理</li>
        <li class="li2 li3">订单列表</li>
    </ul>
</div>
<style>
.seleK{height: 30px;}
.seleK label {margin-bottom: 10px;}
.main-sc .jsglNr .selectNr .right span{line-height:30px; height: 30px; padding-right: 0;}
.seleK .text{height: 28px; width:120px !important;}
.seleK .sumit{height:30px;padding-left:27px;background-position:6px center;padding-right:10px;line-height:30px}
.main-sc .jsglNr .selectNr .right .select{height: 30px; line-height: 30px;width: 80px;margin-right:5px}
.inptText{width: 120px; height: 28px; line-height: 30px;}
.inptButton{height: 30px;line-height:30px;background:rgb(0, 153, 204); width:70px;text-align: center;}
</style>
<div class="main-jsgl main-sc">


		
<p class="attention"><span>注意：</span> 这里可以筛选各种订单分销记录，已可以取消分成，不过只能单笔取消，分成记录不可以删除！</p>
    <div class="jsglNr">
        <div class="selectNr" style="border-top: none; margin-top: 0px;">
            <div class="right">
                <form method="post" action="<?php echo U('profit/order');?>">
                    <div class="seleHidden" id="seleHidden">
                        <div class="seleK">
                        <label>
                            <span>开始时间</span>
                            <input type="text" name="bg_date" value="<?php echo (($bg_date)?($bg_date):''); ?>"  onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"  class="text w150" />
                        </label>
                        <label>
                            <span>结束时间</span>
                            <input type="text" name="end_date" value="<?php echo (($end_date)?($end_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"  class="text w150" />
                        </label>
                            <label>
                                <input type="hidden" id="shop_id" name="shop_id" value="<?php echo (($shop_id)?($shop_id):''); ?>"/>
                                <input type="text"   id="shop_name" name="shop_name" value="<?php echo ($shop_name); ?>" class="text " />
                                <a mini="select"  w="1000" h="600" href="<?php echo U('shop/select');?>" class="sumit">选择企业</a>
                            </label>
                            <label>
                                <input type="hidden" id="user_id" name="user_id" value="<?php echo (($user_id)?($user_id):''); ?>" />
                                <input type="text" name="nickname" id="nickname"  value="<?php echo ($nickname); ?>"   class="text " />
                                <a mini="select"  w="800" h="600" href="<?php echo U('user/select');?>" class="sumit">选择用户</a>
                            </label>
                            <label>
                                <span>订单类型：</span>
                                <select class="select w120" name="type">
                                 <option <?php if(($type) == "999"): ?>selected="selected"<?php endif; ?> value="999">请选择</option>
                                	<?php if(is_array($types)): foreach($types as $key=>$item): ?><option <?php if(($type) == $key): ?>selected="selected"<?php endif; ?>  value="<?php echo ($key); ?>"><?php echo ($item); ?></option><?php endforeach; endif; ?>
                                </select>
                            </label>
                            <label>
                                <span>状态：</span>
                                <select class="select w120" name="is_separate">
                                 <option <?php if(($is_separate) == "999"): ?>selected="selected"<?php endif; ?> value="999">请选择</option>
                                	<?php if(is_array($separates)): foreach($separates as $key=>$item): ?><option <?php if(($is_separate) == $key): ?>selected="selected"<?php endif; ?>  value="<?php echo ($key); ?>"><?php echo ($item); ?></option><?php endforeach; endif; ?>
                                </select>
                            </label>
                            
                            <label>
                                <span>  订单ID：</span>   
                                <input type="text" name="log_id" value="<?php echo (($log_id)?($log_id):''); ?>" class="inptText" />
                                <input type="submit" class="inptButton" value="搜索" /></label>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <form  target="x-frame" method="post">
            <div class="tableBox">
                <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;" >
                    <tr>
                        <td class="w50"><input type="checkbox" class="checkAll" rel="log_id" /></td>
                        <td class="w50">ID</td>
                        <td>用户</td>
                        <td>企业</td>
                        <td>金额</td>
                        <td>类型</td>
                        <td>原始订单ID</td>
                        <td>状态</td>
                        <td>时间</td>
                        <td>分成说明</td>
                        <td>操作</td>
                    </tr>
                    <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
                            <td><input class="child_log_id" type="checkbox" name="log_id[]" value="<?php echo ($var["log_id"]); ?>" /></td>
                            <td><?php echo ($var["log_id"]); ?></td>
                            <td><?php echo ($users[$var['user_id']]['nickname']); ?></td>
                            <td><?php echo (($shops[$var['shop_id']]['shop_name'])?($shops[$var['shop_id']]['shop_name']):'其他类型'); ?></td>
                            <td>&yen;<?php echo round($var['money']/100,2);?></td>
                            <td><?php echo ($var["type_name"]); ?></td>
                            <td><?php echo ($var["order_id"]); ?></td>
                            <td><?php echo ($separates[$var['is_separate']]); ?></td>
                        <td><?php echo (date("Y-m-d H:i:s",$var["create_time"])); ?></td>
                        <td><?php echo ($var["info"]); ?></td>
                        <td>
                        <?php if(($var["is_separate"]) == "1"): echo BA('profit/cancel',array("log_id"=>$var["log_id"]),'取消分成','act','remberBtn'); endif; ?>
             
                        </td>
                        </tr><?php endforeach; endif; ?>
                </table>
                <?php echo ($page); ?>
            </div>
            <div class="selectNr" style="margin-bottom: 0px; border-bottom: none;">
                <div class="left">
                </div>
            </div>
        </form>
    </div>
</div>

  		</div>
	</body>
</html>