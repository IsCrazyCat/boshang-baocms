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
        <li class="li1">设置</li>
        <li class="li2">站点功能</li>
        <li class="li2">功能开关</li>
    </ul>
</div>

<div class="main-jsgl main-sc">

    <p class="attention"><span>注意：</span>支持大部分板块，关闭后只是前台用户看不到，后台还是可看到功能列表。第一步您应该来这里配置功能！</p>

    <form  target="x-frame" action="<?php echo U('setting/operation');?>" method="post">

        <div class="tableBox">

            <table  bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;" >
            
<tr>
<td class="lfTdBt">直接关闭PC：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[pchome]" <?php if(($CONFIG["operation"]["pchome"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启PC</label>
<label><input type="radio" name="data[pchome]"  <?php if(($CONFIG["operation"]["pchome"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭PC</label>
<code>建议关闭PC，一般只用wap下单，PC没有开启的必要，强烈建议哦</code>
</td>
</tr>               
                
                
<tr>
<td class="lfTdBt">商城频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[mall]" <?php if(($CONFIG["operation"]["mall"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[mall]"  <?php if(($CONFIG["operation"]["mall"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>针对本地的商城，目前支持多属性，快递发货，已支持抢单，一般可开启这个频道，如果没有必要的用户可以不开启。</code>
</td>
</tr> 

              
<tr>
<td class="lfTdBt">外卖频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[ele]" <?php if(($CONFIG["operation"]["ele"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[ele]"  <?php if(($CONFIG["operation"]["ele"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>最近优化比较多的板块，完美运营的板块，本地运营可以开启，当然，您已可以关闭。</code>
</td>
</tr> 

<tr>
<td class="lfTdBt">菜市场频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[market]" <?php if(($CONFIG["operation"]["market"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[market]"  <?php if(($CONFIG["operation"]["market"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code></code>
</td>
</tr> 


<tr>
<td class="lfTdBt">便利店频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[store]" <?php if(($CONFIG["operation"]["store"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[store]"  <?php if(($CONFIG["operation"]["store"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>很不错的便利店</code>
</td>
</tr> 


<tr>
<td class="lfTdBt">抢购频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[tuan]" <?php if(($CONFIG["operation"]["tuan"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[tuan]"  <?php if(($CONFIG["operation"]["tuan"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>这个就是团购，模式太老土了，再说已竞争不过其他大平台，个人认为没什么必要开启。</code>
</td>
</tr> 


<tr>
<td class="lfTdBt">家政频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[appoint]" <?php if(($CONFIG["operation"]["appoint"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[appoint]"  <?php if(($CONFIG["operation"]["appoint"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>这个是针对多商家的家政，支持技师，支持店员中心抢单操作，支持退款，支持在线支付，优化得还比较不错的频道。</code>
</td>
</tr>


<tr>
<td class="lfTdBt">预约频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[book]" <?php if(($CONFIG["operation"]["book"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[book]"  <?php if(($CONFIG["operation"]["book"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>这里的预约是基于商家分类拓展的新功能，客户可以根据商家分类进行多选项预约，支持自动定位，上传图片，已支持退款，支持商家抢单，但是不支持配送员抢单操作，算是新频道，新功能，这个看自己的需求，一般的网站是没有必要开启的。</code>
</td>
</tr>


<tr>
<td class="lfTdBt">股权频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[stock]" <?php if(($CONFIG["operation"]["stock"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[stock]"  <?php if(($CONFIG["operation"]["stock"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>股权就是一个简单的功能，客户购买商家的股权后，回在会员中心生成一个股权证书，已可以后台配置自己的团购管理股权，个人认为开启的必要性不大，一般我不建议开启这个频道，反正这个频道优化的不错，建议不开启吧。</code>
</td>
</tr>


<tr>
<td class="lfTdBt">预订频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[booking]" <?php if(($CONFIG["operation"]["booking"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[booking]"  <?php if(($CONFIG["operation"]["booking"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>这个其实就是订座，没毛用，优化得不好，订座可以用外卖就行了，这个就是多余的，不是很完善，我们建议关闭这个频道。</code>
</td>
</tr>


<tr>
<td class="lfTdBt">KTV频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[ktv]" <?php if(($CONFIG["operation"]["ktv"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[ktv]"  <?php if(($CONFIG["operation"]["ktv"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>适合用于本地ktv预订，这个针对性太强，强烈建议除非你只做KTV，否则建议关闭，模块写得还一般，有需要二开的客户后期可以联系我二开。</code>
</td>
</tr>

<tr>
<td class="lfTdBt">教育频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[edu]" <?php if(($CONFIG["operation"]["edu"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[edu]"  <?php if(($CONFIG["operation"]["edu"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>不是很完美的板块，一直没更新过的板块，不过功能很全面，还支持点评哦，可以购买试课，不过个人建议不要开启哦。</code>
</td>
</tr>



<tr>
<td class="lfTdBt">众筹频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[crowd]" <?php if(($CONFIG["operation"]["crowd"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[crowd]"  <?php if(($CONFIG["operation"]["crowd"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>非必须千万不要开启，没必要的功能，简直是多余的。</code>
</td>
</tr>



<tr>
<td class="lfTdBt">酒店频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[hotels]" <?php if(($CONFIG["operation"]["hotels"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[hotels]"  <?php if(($CONFIG["operation"]["hotels"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>酒店频道，还一般的频道，没必要开启，毕竟，这个酒店系统太不专业了。</code>
</td>
</tr>

<tr>
<td class="lfTdBt">农家频道乐：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[farm]" <?php if(($CONFIG["operation"]["farm"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[farm]"  <?php if(($CONFIG["operation"]["farm"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>不是很专业，跟专业的旅游系统没法对比的，看你自己的需求吧，如果觉得必须，就可以开启，否则，没必要开启，毕竟这个市场太小了。</code>
</td>
</tr>



<tr>
<td class="lfTdBt">跑腿频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[running]" <?php if(($CONFIG["operation"]["running"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[running]"  <?php if(($CONFIG["operation"]["running"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>针对网站站长设计的功能，商家中心不支持管理跑腿，自己觉得没多大用，建议关闭。</code>
</td>
</tr>          
        
<tr>
<td class="lfTdBt">五折卡频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[zhe]" <?php if(($CONFIG["operation"]["zhe"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[zhe]"  <?php if(($CONFIG["operation"]["zhe"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>新功能，有需要的可以开启，目前比较完成，可以开启，记得去五折卡设置那边设置下购买周卡，年卡的价格。</code>
</td>
</tr>  

<tr>
<td class="lfTdBt">贴吧部落：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[thread]" <?php if(($CONFIG["operation"]["thread"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[thread]"  <?php if(($CONFIG["operation"]["thread"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>这个是类似论坛，只是功能比较少，如果有运营需要的亲，可以去开启，一般是不建议开启的，看自己的业务需求。</code>
</td>
</tr>


<tr>
<td class="lfTdBt">拼车频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[pinche]" <?php if(($CONFIG["operation"]["pinche"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[pinche]"  <?php if(($CONFIG["operation"]["pinche"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>本地频道功能，还可以的吧，可以开启运营下，反正根据自己的业务来吧。</code>
</td>
</tr>


<tr>
<td class="lfTdBt">新闻资讯：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[news]" <?php if(($CONFIG["operation"]["news"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[news]"  <?php if(($CONFIG["operation"]["news"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>本地发布新闻用这个功能，这个一般都需要的吧。</code>
</td>
</tr>

<tr>
<td class="lfTdBt">分类信息：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[life]" <?php if(($CONFIG["operation"]["life"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[life]"  <?php if(($CONFIG["operation"]["life"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>本地分类信息，支持订阅，支持举报，支持微信模板消息推送，目前所有O2O系统中优化得最好的一个分类信息系统，可以开启，这个功能复杂，需要后台配置好。</code>
</td>
</tr>

<tr>
<td class="lfTdBt">积分商城：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[jifen]" <?php if(($CONFIG["operation"]["jifen"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[jifen]"  <?php if(($CONFIG["operation"]["jifen"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>客户用自己的积分来兑换商品，支持多商家，一般需要开启，还是有用的。</code>
</td>
</tr>

<tr>
<td class="lfTdBt">优惠劵频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[coupon]" <?php if(($CONFIG["operation"]["coupon"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[coupon]"  <?php if(($CONFIG["operation"]["coupon"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>优惠劵频道还行，一般可以开启这个功能，可以跟商城搭配只用效果更佳哦。</code>
</td>
</tr>

<tr>
<td class="lfTdBt">云购频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[cloud]" <?php if(($CONFIG["operation"]["cloud"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[cloud]"  <?php if(($CONFIG["operation"]["cloud"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>因为政策原因，不建议开启，一般没啥用，加上这功能写的就很垃圾，不过这个版本的云购支持在线付款，带了智能付款系统，还行的吧</code>
</td>
</tr> 

<tr>
<td class="lfTdBt">活动频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[huodong]" <?php if(($CONFIG["operation"]["huodong"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[huodong]"  <?php if(($CONFIG["operation"]["huodong"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>本地发布活动需要这个频道，一般不建议开启，这个活动不支持支付定金，所以我们不建议开启哦！</code>
</td>
</tr> 
 
 <tr>
<td class="lfTdBt">小区频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[community]" <?php if(($CONFIG["operation"]["community"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[community]"  <?php if(($CONFIG["operation"]["community"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>本地小区，没鸟用的东西，虽然带了物业管理，物业缴费，但是总觉得这个没有市场，浪费表情的频道！</code>
</td>
</tr> 

<tr>
<td class="lfTdBt">村镇频道：</td>
<td class="rgTdBt">
<label><input type="radio" name="data[village]" <?php if(($CONFIG["operation"]["village"]) == "1"): ?>checked="checked"<?php endif; ?> value="1"  />开启</label>
<label><input type="radio" name="data[village]"  <?php if(($CONFIG["operation"]["village"]) == "0"): ?>checked="checked"<?php endif; ?>  value="0"  />关闭</label>
<code>还是那句话，没鸟用，真的，村镇现在不成熟，做不了的，个人觉得哈，本来农村回上网的人就不多，开启没啥用，个人见解，当然你要运营这个频道你已可以开启！</code>
</td>
</tr>                 

            </table>

        </div>

        <div class="smtQr"><input type="submit" value="确认保存" class="smtQrIpt" /></div>

    </form>

</div>

  		</div>
	</body>
</html>