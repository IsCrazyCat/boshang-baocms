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

<style>
    .audit{
        background-color: #65cea7;
        height: 30px;
        font-family: "微软雅黑";
        font-size: 14px;
        line-height: 30px;
        color: #FFF;
        display: inline-block;
        border-radius: 3px;
        padding-left: 30px;
        background-repeat: no-repeat;
        background-position: 5px center;
        margin-right: 10px;
        padding-right: 10px;
        border: 1px solid #3ec291;
    }
</style>

<div class="mainBt">
    <ul>
        <li class="li1">商城</li>
        <li class="li2">企业工作</li>
        <li class="li2 li3">工作列表</li>
    </ul>
</div>
<div class="main-jsgl main-sc">
    <p class="attention"><span></span></p>
    <div class="jsglNr">
        <div class="selectNr" style="margin-top: 0px; border-top:none;">
            <div class="right">
                <form method="post" action="<?php echo U('goods/index');?>">
                    <div class="seleHidden" id="seleHidden">
                        <div class="seleK">
<!--                        <span>分类</span>-->
<!--                        <select id="cate_id" name="cate_id" class="selecttop w120">-->
<!--                            <option value="0">请选择...</option>-->
<!--                            <?php if(is_array($cates)): foreach($cates as $key=>$var): ?>-->
<!--                                <?php if(($var["parent_id"]) == "0"): ?>-->
<!--                                <option value="<?php echo ($var["cate_id"]); ?>"  <?php if(($var["cate_id"]) == $cate_id): ?>selected="selected"<?php endif; ?> ><?php echo ($var["cate_name"]); ?></option>                -->
<!--                                <?php if(is_array($cates)): foreach($cates as $key=>$var2): ?>-->
<!--                                    <?php if(($var2["parent_id"]) == $var["cate_id"]): ?>-->
<!--                                    <option value="<?php echo ($var2["cate_id"]); ?>"  <?php if(($var2["cate_id"]) == $cate_id): ?>selected="selected"<?php endif; ?> > &nbsp;&nbsp;<?php echo ($var2["cate_name"]); ?></option>-->
<!--<?php endif; ?>-->
<!--<?php endforeach; endif; ?>-->
<!--<?php endif; ?>-->
<!--<?php endforeach; endif; ?>-->
<!--                        </select>-->
                        <span>  状态：</span>   

                        <select class="selecttop" name="audit">
                            <option value="0"  >全部</option>
                            <option value="-1" <?php if(($audit) == "-1"): ?>selected="selected"<?php endif; ?> >等待审核</option>
                            <option value="1" <?php if(($audit) == "1"): ?>selected="selected"<?php endif; ?>>正常</option>
                        </select>
                        <span>  关键字：</span>  
                        <input type="text" name="keyword" value="<?php echo (($keyword)?($keyword):''); ?>" class="inptText" /><input type="submit" class="inptButton" value="  搜索" />
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <form  target="x-frame" method="post">
            <div class="tableBox">
                <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;"  >
                    <tr>
                        <td class="w50"><input type="checkbox" class="checkAll" rel="goods_id" /></td>
                        <td class="w50">用户ID</td>
                        <td>企业</td>
                        <td>姓名</td>
                        <td>电话</td>
                        <td>证件号</td>
                        <td>VIP报名</td>
                        <td>报名时间</td>
                        <td>状态</td>
                        <td>备注</td>
                        <td>操作</td>
                    </tr>
                    <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
                            <td><input class="child_goods_id" type="checkbox" name="applys_id[]" value="<?php echo ($var["id"]); ?>" /> </td>
                            <td><?php echo ($var["user_id"]); ?></td>
                            <td><?php echo ($shopinfo["shop_name"]); ?></td>
                            <td><?php echo ($var['user']['ext0']); ?></td>
                            <td><?php echo ($var['user']['mobile']); ?></td>
                            <td><?php echo ($var['aux']['card_id']); ?></td>
                            <td>
                                <?php if($var['is_vip'] == 0): ?>是
                                <?php else: ?>
                                    否<?php endif; ?>
                            </td>
                            <td><?php echo (date('Y-m-d H:i:s',$var["creat_time"])); ?></td>
                            <td>
                                <?php if($var['cancal'] == 0): ?>已取消
                                <?php elseif($var['audit'] == 1): ?>
                                    已审核
                                <?php elseif($var['audit'] == 2): ?>
                                    已驳回
                                <?php else: ?>
                                    审核中<?php endif; ?>
                            </td>
                            <td><?php echo ($var["remark"]); ?></td>

                            <td>
                                <?php if(($var["audit"]) == "0"): echo BA('goods/applyaudit',array("goods_id"=>$var["goods_id"],"apply_ids"=>$var["id"]),'审核','load','remberBtn',600,450); endif; ?>
                                <?php echo BA('goods/applydelete',array("goods_id"=>$var["goods_id"],"apply_ids"=>$var["id"]),'删除','act','remberBtn');?>
                            </td>
                        </tr><?php endforeach; endif; ?>
                </table>
                <?php echo ($page); ?>
            </div>
            <div class="selectNr" style="margin-bottom: 0px; border-bottom: none;">
                <div class="left">
                    <?php echo BA('goods/delete','','批量删除','list','a2');?>
                    <?php echo BA('goods/audit','','批量审核','list','remberBtn');?>
                </div>
            </div>
        </form>
    </div>
    
     <script>
       $(document).ready(function (e) {
			$(".tips").click(function () {
				var tipnr = $(this).attr('rel');
				layer.tips(tipnr, $(this), {
					tips: [4, '#1ca290'],
					time: 4000
				});
			})
		});
    </script>
    
    
      		</div>
	</body>
</html>