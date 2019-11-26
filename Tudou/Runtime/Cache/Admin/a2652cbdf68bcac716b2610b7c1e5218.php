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
        <li class="li2">商品规格</li>
        <li class="li2 li3">规格列表</li>
    </ul>
</div>
<div class="main-jsgl main-sc">
    <p class="attention"><span>注意：</span>注意小心添加</p>
    <div class="jsglNr">
        <div class="selectNr" style="margin-top: 0px; border-top:none;">
            <div class="left">
                <?php echo BA('Goodsattr/addEditSpec','','添加规格');?>  
            </div>
            <div class="right">
                <form method="post" action="<?php echo U('Goodsattr/index');?>">
                    <div class="seleHidden" id="seleHidden">
                        <div class="seleK">
                        <span>  选择分类：</span>   
                        <select class="inptText" name="audit">
                            <option value="0"><?php if(!empty($type_id)): echo ($goodsTypeList[$type_id]['name']); else: ?>所有分类<?php endif; ?></option>
                               <?php if(is_array($goodsTypeList)): foreach($goodsTypeList as $k=>$v): ?><option value="<?php echo ($v['id']); ?>"><?php echo ($v['name']); ?></option><?php endforeach; endif; ?>
                        </select>
                        </div>
                    </div>
                    <input type="submit" value=" 筛选"  class="inptButton" />
                </form>
            </div>
        </div>
		 <form  target="x-frame" method="post">
            <div class="tableBox">
                <table bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;"  >
                    <tr>
                        <td class="w50"><input type="checkbox" class="checkAll" rel="id" /></td>
                        <td class="w50">ID</td>
                        <td>规格类型</td>
                        <td>规格名称</td>
                        <td>规格项</td>
                        <td>排序</td>
                        <td>操作</td>
                    </tr>
                    <?php if(is_array($specList)): $i = 0; $__LIST__ = $specList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><tr>
                            <td><input class="child_id" type="checkbox" name="id[]" value="<?php echo ($list["id"]); ?>" /> </td>
                            <td><?php echo ($list["id"]); ?></td>
                            <td><?php echo ($goodsTypeList[$list[type_id]][name]); ?></td>
                            <td><?php echo ($list["name"]); ?></td>
                            <td><?php echo ($list["spec_item"]); ?></td>
                            <td>  <input type="text" class="form-control input-sm" onchange="updateSort('spec','id','<?php echo ($list["id"]); ?>','order',this)" onkeyup="this.value=this.value.replace(/[^d]/g,'')" onpaste="this.value=this.value.replace(/[^d]/g,'')"  size="4" value="<?php echo ($list["order"]); ?>" /></td>
                            <td>
                             <?php echo BA('Goodsattr/addEditSpec',array("id"=>$list['id']),'编辑','','remberBtn');?>
                             <?php echo BA('Goodsattr/delGoodsSpec',array("id"=>$list['id']),'删除','act','remberBtn');?>
                            </td>
                           
                        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </table>
                <?php echo ($page); ?>
            </div>
            <div class="selectNr" style="margin-bottom: 0px; border-bottom: none;">
                <div class="left">
                    <?php echo BA('Goodsattr/delGoodsSpec','','批量删除','list','a2');?>
                </div>
            </div>
        </form>
      
    </div>
<script>
    $(document).ready(function(){		
		<?php
 if($_GET['type_id']) { echo "$('#type_id').val(".$_GET['type_id'].");"; } ?>
			$('#button-filter').trigger('click');
    });
	
	 // 点击分页触发的事件，要重写
    $(".pagination  a").click(function(){
        cur_page = $(this).data('p');
        ajax_get_table('search-form2',cur_page);
    }); 	 	
	 
</script> 
      		</div>
	</body>
</html>