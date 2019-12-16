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
        <li class="li2">分销</li>
        <li class="li2 li3">分销设置</li>
    </ul>
</div>

<p class="attention"><span>注意：</span>1：这里开通分销，2：这里给模块开启分销，3：给企业开启分销权限，4：这页面配置分成比例，5：用户确认收货后即可给上级分成</p>
<form  target="x-frame" action="<?php echo U('setting/profit');?>" method="post">

    <div class="mainScAdd">
        <div class="tableBox">
            <table  bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;" >
               

                

                <!--分销开始-->
                
                
                <tr>
                    <td class="lfTdBt">开启三级分销功能：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit]" <?php if(($CONFIG["profit"]["profit"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启分销</label>
                    <label><input type="radio" name="data[profit]"  <?php if(($CONFIG["profit"]["profit"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭分销</label>
                    <code>不运营分销的可以关闭，关闭后不再分成。</code>
                    </td>
                </tr>


                <tr>
                    <td class="lfTdBt">推荐时效：</td>
                    <td class="rgTdBt"><input type="number" min="1" max="1000" name="data[profit_expire]" value='<?php echo ($CONFIG["profit"]["profit_expire"]); ?>' class="scAddTextName w80" />小时<code>访问者点击某推荐人的网址后，在此时间段内注册、下单，均认为是该推荐人所介绍的</code></td>
                </tr>
                <tr>
                
                
                <tr>
                    <td class="lfTdBt">拥有分销权限用户最低等级：</td>
                    <td class="rgTdBt">
						<select name="data[profit_min_rank_id]" class="seleFl w200">
							<option value="0">不限制</option>
							<?php if(is_array($ranks)): foreach($ranks as $key=>$item): ?><option <?php if(($item["rank_id"]) == $CONFIG["profit"]["profit_min_rank_id"]): ?>selected="selected"<?php endif; ?> value="<?php echo ($item["rank_id"]); ?>"><?php echo ($item["rank_name"]); ?></option><?php endforeach; endif; ?>
						</select>
					</td>
                </tr>

                
                <tr><td class="rgTdBt profit" colspan = "2"> 推荐积分奖励，不建议填写，如果需要这个功能，请认真填写谢谢！</td></tr>
                

                    <td class="lfTdBt">一级会员注册分成积分数：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="1000" name="data[profit_integral1]" value='<?php echo ($CONFIG["profit"]["profit_integral1"]); ?>' class="scAddTextName w80" /> <code>下级注册后上级获取的积分，如果不需要积分不填写！</code></td>
                </tr>
                <tr>

                    <td class="lfTdBt">二级会员注册分成积分数：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="1000" name="data[profit_integral2]" value='<?php echo ($CONFIG["profit"]["profit_integral2"]); ?>' class="scAddTextName w80" /><code>下级注册后上的级的上级获取的积分，如果不需要积分不填写！</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">三级会员注册分成积分数：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="1000" name="data[profit_integral3]" value='<?php echo ($CONFIG["profit"]["profit_integral3"]); ?>' class="scAddTextName w80" /><code>下级注册后上的级的上级的上级获取的积分，如果不需要积分不填写！</code></td>

                </tr>
                
                
                 <tr><td class="rgTdBt profit" colspan = "2"> 推荐<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>奖励，不建议填写，如果需要这个功能，请认真填写谢谢！</td></tr>
                

                    <td class="lfTdBt">一级会员注册分成<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>数：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="1000" name="data[profit_prestige1]" value='<?php echo ($CONFIG["profit"]["profit_prestige1"]); ?>' class="scAddTextName w80" /> <code>下级注册后上级获取的<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>，如果不需要<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>不填写！</code></td>
                </tr>
                <tr>

                    <td class="lfTdBt">二级会员注册分成<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>数：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="1000" name="data[profit_prestige2]" value='<?php echo ($CONFIG["profit"]["profit_prestige2"]); ?>' class="scAddTextName w80" /><code>下级注册后上的级的上级获取的<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>，如果不需要<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>不填写！</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">三级会员注册分成<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>数：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="1000" name="data[profit_prestige3]" value='<?php echo ($CONFIG["profit"]["profit_prestige3"]); ?>' class="scAddTextName w80" /><code>下级注册后上的级的上级的上级获取的<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>，如果不需要<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>不填写！</code></td>

                </tr>
                
                <tr><td class="rgTdBt  profit" colspan = "2" >下面控制分销分成的，请认真填写，切勿乱写，切勿随意更改</td></tr>
                
                
                
                  <tr>
                    <td class="lfTdBt">开启抢购分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_tuan]" <?php if(($CONFIG["profit"]["profit_is_tuan"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_tuan]" <?php if(($CONFIG["profit"]["profit_is_tuan"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后抢购订单结算给企业时候会分成。</code>
                    </td>
                </tr>
                
                
               <tr>
                    <td class="lfTdBt">开启外卖分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_ele]" <?php if(($CONFIG["profit"]["profit_is_ele"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_ele]" <?php if(($CONFIG["profit"]["profit_is_ele"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后外卖订单结算给企业时候会分成。</code>
                    </td>
                </tr>
                
                <tr>
                    <td class="lfTdBt">开启菜市场分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_market]" <?php if(($CONFIG["profit"]["profit_is_market"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_market]" <?php if(($CONFIG["profit"]["profit_is_market"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后菜市场订单结算给企业时候会分成。</code>
                    </td>
                </tr>
                
                <tr>
                    <td class="lfTdBt">开启便利店分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_store]" <?php if(($CONFIG["profit"]["profit_is_store"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_store]" <?php if(($CONFIG["profit"]["profit_is_store"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后便利店订单结算给企业时候会分成。</code>
                    </td>
                </tr>


				<tr>
                    <td class="lfTdBt">开启农家乐分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_farm]" <?php if(($CONFIG["profit"]["profit_is_farm"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_farm]" <?php if(($CONFIG["profit"]["profit_is_farm"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后农家乐订单结算给企业时候会分成。</code>
                    </td>
                </tr>
                
                <tr>
                    <td class="lfTdBt">开启商城分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_goods]" <?php if(($CONFIG["profit"]["profit_is_goods"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_goods]" <?php if(($CONFIG["profit"]["profit_is_goods"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后商城订单结算给企业时候会分成。</code>
                    </td>
                </tr>
                
                <tr>
                    <td class="lfTdBt">开启订座分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_booking]" <?php if(($CONFIG["profit"]["profit_is_booking"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_booking]" <?php if(($CONFIG["profit"]["profit_is_booking"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后订座订单结算给企业时候会分成。</code>
                    </td>
                </tr>
                
                
                <tr>
                    <td class="lfTdBt">开启酒店分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_hotel]" <?php if(($CONFIG["profit"]["profit_is_hotel"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_hotel]" <?php if(($CONFIG["profit"]["profit_is_hotel"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后酒店订单结算给企业时候会分成。</code>
                    </td>
                </tr>
                
                <tr>
                    <td class="lfTdBt">开启优惠买单分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_breaks]" <?php if(($CONFIG["profit"]["profit_is_breaks"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_breaks]" <?php if(($CONFIG["profit"]["profit_is_breaks"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后优惠买单订单结算给企业时候会分成。</code>
                    </td>
                </tr>
                
                <tr>
                    <td class="lfTdBt">开启五折卡分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_is_zhe]" <?php if(($CONFIG["profit"]["profit_is_zhe"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_is_zhe]" <?php if(($CONFIG["profit"]["profit_is_zhe"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>无折卡订单结算的时候会有分成。</code>
                    </td>
                </tr>
                  <tr>
                    <td class="lfTdBt">开启会员等级购买分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_buy_user_rank]" <?php if(($CONFIG["profit"]["profit_buy_user_rank"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_buy_user_rank]" <?php if(($CONFIG["profit"]["profit_buy_user_rank"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>首先开启会员等级可购买功能，设置》》》常用设置》》》常用功能设置》》》里面开启会员等级购买，然后这里开启后下级购买会员等级后有分成，分成比例按照下面的订单分成比例分成。</code>
                    </td>
                </tr>
                
                 <tr>
                    <td class="lfTdBt">开启企业购买等级分销：</td>
                    <td class="rgTdBt">
                    <label><input type="radio" name="data[profit_buy_shop_grade]" <?php if(($CONFIG["profit"]["profit_buy_shop_grade"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"/>开启</label>
                    <label><input type="radio" name="data[profit_buy_shop_grade]" <?php if(($CONFIG["profit"]["profit_buy_shop_grade"]) == "0"): ?>checked="checked"<?php endif; ?> value="0"/>关闭</label>
                    <code>开启后，当会员推荐的企业购买等级后，推荐人有分成，分成比例还是按照下面的订单比例分成。</code>
                    </td>
                </tr>


                
                 <tr>
                    <td class="lfTdBt">分成金额类型：</td>
                    <td class="rgTdBt">
                        <select name="data[profit_price_type]"  class="scAddTextName sogn">
                            <option value="0">请选择分成金额类型</option>
                            <option value="1" <?php if($CONFIG['profit']['profit_price_type'] == 1): ?>selected='selected'<?php endif; ?>>用户实付金额</option>
                            <option value="2" <?php if($CONFIG['profit']['profit_price_type'] == 2): ?>selected='selected'<?php endif; ?>>企业结算金额</option>
                            <option value="3" <?php if($CONFIG['profit']['profit_price_type'] == 3): ?>selected='selected'<?php endif; ?>>用户实付金额-企业结算金额=差价</option>
                        </select>
                        <code>选择后，请不要轻易修改哦，毕竟差别还是挺大的，建议选择【用户实付金额-企业结算金额=差价】</code></td>
                </tr>
                
                
                <tr><td class="rgTdBt profit" colspan = "2"> 团购、外卖、菜市场、便利店、订座、分成通用设置，1-3级相加不得高于100%，如果需要给网站留利润，可1-3级相加=30%这样设置，具体参考上面发分成比例</td></tr>
                <tr>
                    <td class="lfTdBt">通用订单一级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[currency_profit_rate1]" value='<?php echo ($CONFIG["profit"]["currency_profit_rate1"]); ?>' class="scAddTextName w80" />% 
                    <code>团购、外卖、菜市场、便利店、订座、酒店、农家乐订单一级会员分成比例</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">通用订单二级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[currency_profit_rate2]" value='<?php echo ($CONFIG["profit"]["currency_profit_rate2"]); ?>' class="scAddTextName w80" />% 
                    <code>团购、外卖、菜市场、便利店、订座、酒店、农家乐订单二级会员分成比例</code></td>
                </tr>
               

                <tr>
                    <td class="lfTdBt">通用订单三级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[currency_profit_rate3]" value='<?php echo ($CONFIG["profit"]["currency_profit_rate3"]); ?>' class="scAddTextName w80" />% 
                    <code>团购、外卖、菜市场、便利店、订座、酒店、农家乐订单三级会员分成比例</code></td>
                </tr>




				<tr><td class="rgTdBt profit" colspan = "2"> 商城分成通用单独设置，1-3级相加不得高于100%，如果需要给网站留利润，可1-3级相加=30%这样设置，具体参考上面发分成比例</td></tr>
                <tr>
                    <td class="lfTdBt">商城订单一级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[goods_profit_rate1]" value='<?php echo ($CONFIG["profit"]["goods_profit_rate1"]); ?>' class="scAddTextName w80" />% 
                    <code>商城订单一级会员分成比例</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">商城订单二级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[goods_profit_rate2]" value='<?php echo ($CONFIG["profit"]["goods_profit_rate2"]); ?>' class="scAddTextName w80" />% 
                    <code>商城订单二级会员分成比例</code></td>
                </tr>

                <tr>
                    <td class="lfTdBt">商城订单三级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[goods_profit_rate3]" value='<?php echo ($CONFIG["profit"]["goods_profit_rate3"]); ?>' class="scAddTextName w80" />% 
                    <code>商城订单三级会员分成比例</code></td>
                </tr>
                
                
                
                <tr><td class="rgTdBt profit" colspan = "2"> 酒店分成通用单独设置，1-3级相加不得高于100%，如果需要给网站留利润，可1-3级相加=30%这样设置，具体参考上面发分成比例</td></tr>
                <tr>
                    <td class="lfTdBt">酒店订单一级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[hotel_profit_rate1]" value='<?php echo ($CONFIG["profit"]["hotel_profit_rate1"]); ?>' class="scAddTextName w80" />% 
                    <code>酒店订单一级会员分成比例</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">酒店订单二级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[hotel_profit_rate2]" value='<?php echo ($CONFIG["profit"]["hotel_profit_rate2"]); ?>' class="scAddTextName w80" />% 
                    <code>酒店订单二级会员分成比例</code></td>
                </tr>

                <tr>
                    <td class="lfTdBt">酒店订单三级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[hotel_profit_rate3]" value='<?php echo ($CONFIG["profit"]["hotel_profit_rate3"]); ?>' class="scAddTextName w80" />% 
                    <code>酒店订单三级会员分成比例</code></td>
                </tr>
                
                
                
                <tr><td class="rgTdBt profit" colspan = "2"> 农家乐分成通用单独设置，1-3级相加不得高于100%，如果需要给网站留利润，可1-3级相加=30%这样设置，具体参考上面发分成比例</td></tr>
                <tr>
                    <td class="lfTdBt">农家乐订单一级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[farm_profit_rate1]" value='<?php echo ($CONFIG["profit"]["farm_profit_rate1"]); ?>' class="scAddTextName w80" />% 
                    <code>农家乐订单一级会员分成比例</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">农家乐订单二级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[farm_profit_rate2]" value='<?php echo ($CONFIG["profit"]["farm_profit_rate2"]); ?>' class="scAddTextName w80" />% 
                    <code>农家乐订单二级会员分成比例</code></td>
                </tr>

                <tr>
                    <td class="lfTdBt">农家乐订单三级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[farm_profit_rate3]" value='<?php echo ($CONFIG["profit"]["farm_profit_rate3"]); ?>' class="scAddTextName w80" />% 
                    <code>农家乐订单三级会员分成比例</code></td>
                </tr>
                
                <tr><td class="rgTdBt profit" colspan = "2"> 无折卡分成通用单独设置，1-3级相加不得高于100%，如果需要给网站留利润，可1-3级相加=30%这样设置，具体参考上面发分成比例</td></tr>
                <tr>
                    <td class="lfTdBt">五折卡订单一级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[zhe_profit_rate1]" value='<?php echo ($CONFIG["profit"]["zhe_profit_rate1"]); ?>' class="scAddTextName w80" />% 
                    <code>五折卡订单一级会员分成比例</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">五折卡订单二级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[zhe_profit_rate2]" value='<?php echo ($CONFIG["profit"]["zhe_profit_rate2"]); ?>' class="scAddTextName w80" />% 
                    <code>五折卡订单二级会员分成比例</code></td>
                </tr>

                <tr>
                    <td class="lfTdBt">五折卡订单三级订单分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[zhe_profit_rate3]" value='<?php echo ($CONFIG["profit"]["zhe_profit_rate3"]); ?>' class="scAddTextName w80" />% 
                    <code>五折卡订单三级会员分成比例</code></td>
                </tr>
                
                
                
                <tr><td class="rgTdBt profit" colspan = "2"> 会员等级购买设置，1-3级相加不得高于100%，如果需要给网站留利润，可1-3级相加=30%这样设置，这里计算金额是用户购买等级实际支付金额</td></tr>
                <tr>
                    <td class="lfTdBt">会员等级购买一级分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[rank_profit_rate1]" value='<?php echo ($CONFIG["profit"]["rank_profit_rate1"]); ?>' class="scAddTextName w80" />% 
                    <code>会员购买等时候的一级分成比例</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">会员等级购买二级分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[rank_profit_rate2]" value='<?php echo ($CONFIG["profit"]["rank_profit_rate2"]); ?>' class="scAddTextName w80" />% 
                    <code>会员购买等时候的二级分成比例</code></td>
                </tr>

                <tr>
                    <td class="lfTdBt">会员等级购买三级分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[rank_profit_rate3]" value='<?php echo ($CONFIG["profit"]["rank_profit_rate3"]); ?>' class="scAddTextName w80" />% 
                    <code>会员购买等时候的三级分成比例</code></td>
                </tr>
                
                
                <tr><td class="rgTdBt profit" colspan = "2"> 企业等级购买分成设置，1-3级相加不得高于100%，如果需要给网站留利润，可1-3级相加=30%这样设置，这里计算金额是企业购买等级实际支付金额</td></tr>
                <tr>
                    <td class="lfTdBt">企业等级购买一级分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[grade_profit_rate1]" value='<?php echo ($CONFIG["profit"]["grade_profit_rate1"]); ?>' class="scAddTextName w80" />% 
                    <code>企业购买等时候的一级分成比例</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">企业等级购买二级分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[grade_profit_rate2]" value='<?php echo ($CONFIG["profit"]["grade_profit_rate2"]); ?>' class="scAddTextName w80" />% 
                    <code>企业购买等时候的二级分成比例</code></td>
                </tr>

                <tr>
                    <td class="lfTdBt">企业等级购买三级分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[grade_profit_rate3]" value='<?php echo ($CONFIG["profit"]["grade_profit_rate3"]); ?>' class="scAddTextName w80" />% 
                    <code>企业购买等时候的三级分成比例</code></td>
                </tr>
                
                
                 <tr><td class="rgTdBt profit" colspan = "2">优惠买单分成设置，1-3级相加不得高于100%，如果需要给网站留利润，可1-3级相加=30%这样设置，这里计算金额是企业购买等级实际支付金额</td></tr>
                <tr>
                    <td class="lfTdBt">优惠买单一级分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[breaks_profit_rate1]" value='<?php echo ($CONFIG["profit"]["breaks_profit_rate1"]); ?>' class="scAddTextName w80" />% 
                    <code>优惠买单等时候的一级分成比例</code></td>
                </tr>
                <tr>
                    <td class="lfTdBt">优惠买单二级分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[breaks_profit_rate2]" value='<?php echo ($CONFIG["profit"]["breaks_profit_rate2"]); ?>' class="scAddTextName w80" />% 
                    <code>优惠买单时候的二级分成比例</code></td>
                </tr>

                <tr>
                    <td class="lfTdBt">优惠买单三级分成比例：</td>
                    <td class="rgTdBt"><input type="number" min="0" max="100" name="data[breaks_profit_rate3]" value='<?php echo ($CONFIG["profit"]["breaks_profit_rate3"]); ?>' class="scAddTextName w80" />% 
                    <code>商优惠买单时候的三级分成比例</code></td>
                </tr>



            </table>

        </div>

        <div class="smtQr"><input type="submit" value="确认保存" class="smtQrIpt" /></div>

    </div>

</form>

  		</div>
	</body>
</html>