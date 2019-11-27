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
.lfTdBt { width: 200px;}
.profit{ text-align:center; color:#000; font-weight:bold; background:#ECECEC;}
</style>
<div class="mainBt">
    <ul>
        <li class="li1">设置</li>
        <li class="li2">常用功能</li>
        <li class="li2 li3">功能设置</li>
    </ul>
</div>
<div class="main-cate">
    <p class="attention"><span>注意：</span>这里配置的是网站常用API，以及其他的设置，以后不知道分来的尽量写在这里</p>
</div>       
<div class="mainScAdd">
    <div class="tableBox">
        <form  target="x-frame" action="<?php echo U('setting/config');?>" method="post">
            <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;" >
            
             <tr>
                    <td class="lfTdBt">开启会员等级购买：</td>
                    <td class="rgTdBt">
                    <label>
                    	<input type="radio" name="data[is_buy_user_rank]" <?php if(($CONFIG["config"]["is_buy_user_rank"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>
                    	开启
                    </label>
                    <label>
                    	<input type="radio" name="data[is_buy_user_rank]" <?php if(($CONFIG["config"]["is_buy_user_rank"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>
                    	关闭
                    </label>
                    <code>点击开启后，手机版会员中心出现购买等级功能，等级价格到会员》》》会员等级》》》编辑设置，不开启不出现会员等级购买功能。</code>
                    </td>
                </tr>
                
                <tr>
                  <td class="rgTdBt profit" colspan="2"> 下面是快递接口配置，建议申请企业接口更加稳定</td>
                </tr>
                
                <tr>
                    <td class="lfTdBt">快递100接口选择：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[express_api_type]" <?php if(($CONFIG["config"]["express_api_type"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>免费接口</label>
                    <label><input type="radio" name="data[express_api_type]" <?php if(($CONFIG["config"]["express_api_type"]) == "2"): ?>checked="checked"<?php endif; ?> value="2"/>企业接口</label>
                    <code>先选择接口再填写下面的东西，接口申请点击：<a href="https://www.kuaidi100.com/openapi/applypoll.shtml" target="_blank">https://www.kuaidi100.com/openapi/applypoll.shtml</a></code>
                    </td>
                </tr>
              
                <tr>
                    <td class="lfTdBt" >快递100key/customer：</td>
                    <td class="rgTdBt">
                        <input type="text" name="data[express_api_key]" value="<?php echo ($CONFIG["config"]["express_api_key"]); ?>" class="scAddTextName " />
                        <code>←这里填写KEY</code>
                        <input type="text" name="data[express_api_customer]" value="<?php echo ($CONFIG["config"]["express_api_customer"]); ?>" class="scAddTextName " />
                        <code>←这里填写customer,免费版本接口无需填写customer</code>
                    </td>
                </tr>
                
                <tr>
                  <td class="rgTdBt profit" colspan="2"> 下面是网站地图配置，请网站第一次就必须配置好，中途不能更改，否则后果自负</td>
                </tr>
                
                 <tr>
                    <td class="lfTdBt">网站地图选择：</td>
                    <td class="rgTdBt">
                              <select name="data[map]" class="scAddTextName sogn">
                              	  <option value="">请选择地图地图</option>
                                  <option <?php if(($CONFIG["config"]["map"]) == "1"): ?>selected="selected"<?php endif; ?> value="1">百度地图</option>
                                  <option <?php if(($CONFIG["config"]["map"]) == "2"): ?>selected="selected"<?php endif; ?> value="2">谷歌地图</option>
                              </select>
							<code>新版必须选择地图，否则失效，一旦选择数据将不可逆更改，请第一次就选择好地图，否则中途更换地图后数据混乱后概不负责</code>
                    </td>
                </tr>  
                
                
                <tr>
                    <td  class="lfTdBt" >百度LBS地图API链接：</td>
                    <td class="rgTdBt">
                        <input type="text" name="data[baidu_map_api]" value="<?php echo ($CONFIG["config"]["baidu_map_api"]); ?>" class="scAddTextName  manageInput2" />
                        <code>如果您开启的是https，这里请一定要填写https开头，这里是填写整个百度地图链接，http或者https您自己填写，接口申请 <a href="http://lbsyun.baidu.com/" target="_blank">http://lbsyun.baidu.com/</a> 备用API：https://api.map.baidu.com/api?v=2.0&ak=7b92b3afff29988b6d4dbf9a00698ed8</code>
                    </td>
                </tr>
                
                <tr>
                    <td  class="lfTdBt" >谷歌LBS地图API链接：</td>
                    <td class="rgTdBt">
                        <input type="text" name="data[google_map_api]" value="<?php echo ($CONFIG["config"]["google_map_api"]); ?>" class="scAddTextName  manageInput2" />
                        <code>这里是填写整个谷歌地图链接，http或者https您自己填写</code>
                    </td>
                </tr>
                
                
               <tr>
                  <td class="rgTdBt profit" colspan="2"> iocnfont图标调用连接</td>
                </tr>
                
                 <tr>
                    <td  class="lfTdBt" >iocnfont链接：</td>
                    <td class="rgTdBt">
                        <input type="text" name="data[iocnfont]" value="<?php echo (($CONFIG['config']['iocnfont'])?($CONFIG['config']['iocnfont']):"//at.alicdn.com/t/font_295173_pummdrb002uik9.css"); ?>" class="scAddTextName  manageInput2" />
                        <code>这需要加载字体，千万不要放在本地，不然第一次加载卡得你怀疑人生，这里是自己设计的阿里云图标，默认我们的连接是：//at.alicdn.com/t/font_295173_pummdrb002uik9.css  图标预览：<a href="http://www.juhucms.com/forum-37-1.html" target="_blank">http://www.juhucms.com/forum-37-1.html</a>
                        
                        </code>
                    </td>
                </tr>
                
                 <tr>
                    <td  class="lfTdBt" >iocnfont2链接：</td>
                    <td class="rgTdBt">
                        <input type="text" name="data[iocnfont2]" value="<?php echo (($CONFIG['config']['iocnfont2'])?($CONFIG['config']['iocnfont2']):""); ?>" class="scAddTextName  manageInput2" />
                        <code>这里你额外增加的css阿里云的iocnfont图标cnd连接放在这里，然后自己就可以在模板中调用了，这样您可以不管基础库的css</code>
                    </td>
                </tr>
                
                
               
            </table>
            <div class="smtQr"><input type="submit" value="确认添加" class="smtQrIpt" /></div>
        </form>
    </div>
</div>
  		</div>
	</body>
</html>