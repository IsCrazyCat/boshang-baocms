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
<link rel="stylesheet" type="text/css" href="__PUBLIC__/easyui/easyui.css">
<link rel="stylesheet" type="text/css" href="__PUBLIC__/easyui/icon.css">
<script type="text/javascript" src="__PUBLIC__/easyui/jquery.easyui.min.js"></script>

<div class="mainBt">
    <ul>
        <li class="li1">分销</li>
        <li class="li2">分销管理</li>
        <li class="li2 li3">族谱表</li>
    </ul>
</div>


<div class="main-wrap">
        
        <div class="result-wrap">
           
                <div class="config-items">
                   
                    <div class="result-content">
                        
<table title="推荐图" class="easyui-treegrid" style="width:100%;height:550px"
			data-options="
                url: '<?php echo ($CONFIG["site"]["host"]); ?>/backstage/user/family',
				method: 'get',
				lines: true,
				rownumbers: true,
				idField: 'user_id',
				treeField: 'nickname',
			">
		<thead>
			<tr>
				<th data-options="field:'nickname'" width="220">账号</th>
				
				<th data-options="field:'prestige'" width="150"><?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?></th>
				<th data-options="field:'integral'" width="150">积分</th>
				<th data-options="field:'rank_id'" width="150">级别</th>
			</tr>
		</thead>
	</table>
                    </div>
                </div>
         
        </div>
    </div>
       
</div>
</div>
  		</div>
	</body>
</html>