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
        <li class="li2">产品管理</li>
        <li class="li2 li3">编辑</li>
    </ul>
</div>
<div class="mainScAdd ">

    <div class="tableBox">
        <form target="x-frame" action="<?php echo U('goods/edit',array('goods_id'=>$detail['goods_id']));?>" method="post">
        	<input type="hidden" name="goods_id" value="<?php echo ($detail["goods_id"]); ?>"/>
            <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;" >
                <tr>
                    <td class="lfTdBt">产品名称：</td>
                    <td class="rgTdBt"><input type="text" name="data[title]" value="<?php echo (($detail["title"])?($detail["title"]):''); ?>" class="manageInput manageInput2" />

                    </td>
                </tr> 
                <tr>
                    <td  class="lfTdBt">产品副标题：</td>
                    <td class="rgTdBt"><input type="text" name="data[intro]" value="<?php echo (($detail["intro"])?($detail["intro"]):''); ?>" class="manageInput manageInput2" />

                    </td>
                </tr>
                 <tr>
                    <td  class="lfTdBt">产品规格：</td>
                    <td class="rgTdBt"><input type="text" name="data[guige]" value="<?php echo (($detail["guige"])?($detail["guige"]):''); ?>" class="manageInput" />
					<code>可以不填写，暂时不支持多属性</code>
                    </td>
                </tr>  
                  <tr>
                    <td  class="lfTdBt">库存：</td>
                    <td class="rgTdBt"><input type="text" name="data[num]" value="<?php echo (($detail["num"])?($detail["num"]):''); ?>" class="manageInput" />
					<code>请认真填写库存</code>
                    </td>
                </tr>
                 
              <!--增加开始--> 
      		  <tr>
               <td class="lfTdBt">是否免运费：</td>
                 <td class="rgTdBt">
                <input type="radio" name="data[is_reight]" value="0" <?php if($detail[is_reight] == 0): ?>checked="checked"<?php endif; ?> />免运费
				<input type="radio" name="data[is_reight]" value="1" <?php if($detail[is_reight] == 1): ?>checked="checked"<?php endif; ?> />不免运费
                <code>开启了免运费，下面就不要填写重量</code>
                </td>
              </tr>
             
 			   <tr>
                    <td  class="lfTdBt">重量：</td>
                    <td class="rgTdBt"><input type="text" name="data[weight]" value="<?php echo (($detail["weight"])?($detail["weight"]):''); ?>" class="manageInput" />
					<code>填写克数，1000克等于1KG，配送费的首重按照KG计算</code>
                    </td>
               </tr> 
             

				 <tr>
                    <td class="lfTdBt">选择运费模板：</td>
                    <td class="rgTdBt">
                       <select id="kuaidi_id" name="data[kuaidi_id]" class="seleFl w300">
                            <option value="0">请选择</option>
                            <?php if(is_array($kuaidi)): foreach($kuaidi as $key=>$var): ?><option <?php if(($var["id"]) == $detail['kuaidi_id']): ?>selected="selected"<?php endif; ?>value="<?php echo ($var["id"]); ?>"><?php echo ($var["name"]); ?></option><?php endforeach; endif; ?>
                        </select>
                    </td>
                </tr>
                
                    
         
                <tr>
                    <td class="lfTdBt">商家：</td>
                    <td class="rgTdBt"> <div class="lt">
                            <input type="hidden" id="shop_id" name="data[shop_id]" value="<?php echo (($detail["shop_id"])?($detail["shop_id"]):''); ?>"/>
                            <input type="text" id="shop_name" name="shop_name" value="<?php echo ($shop["shop_name"]); ?>" class="manageInput" />
                        </div>
                        <a mini="select"  w="1000" h="600" href="<?php echo U('shop/select');?>" class="remberBtn">选择商家</a>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">分类：</td>
                    <td class="rgTdBt">

                        <select name="parent_id" id="parent_id" class="seleFl w100"  style="display: inline-block; margin-right: 10px;">
                            <option value="0">请选择...</option>
                            <?php if(is_array($cates)): foreach($cates as $key=>$var): if(($var["parent_id"]) == "0"): ?><option value="<?php echo ($var["cate_id"]); ?>"  <?php if(($var["cate_id"]) == $parent_id): ?>selected="selected"<?php endif; ?> ><?php echo ($var["cate_name"]); ?>(<?php echo ($var["rate"]); ?>‰)</option><?php endif; endforeach; endif; ?>
                        </select>
                        <select id="cate_id" name="data[cate_id]" class="seleFl w100" style="display: inline-block; margin-right: 10px;">
                            <option value="0">请选择...</option>
                            <?php if(is_array($cates)): foreach($cates as $key=>$var): if(($var["parent_id"]) == "0"): if(($var["cate_id"]) == $parent_id): if(is_array($cates)): foreach($cates as $key=>$var2): if(($var2["parent_id"]) == $var["cate_id"]): ?><option value="<?php echo ($var2["cate_id"]); ?>"  <?php if(($var2["cate_id"]) == $detail["cate_id"]): ?>selected="selected"<?php endif; ?> ><?php echo ($var2["cate_name"]); ?>(<?php echo ($var["rate"]); ?>‰)</option>
                                    <?php if(is_array($cates)): foreach($cates as $key=>$var3): if(($var3["parent_id"]) == $var2["cate_id"]): ?><option  value="<?php echo ($var3["cate_id"]); ?>"  <?php if(($var3["cate_id"]) == $detail["cate_id"]): ?>selected="selected"<?php endif; ?> >&nbsp;&nbsp;-<?php echo ($var3["cate_name"]); ?>(<?php echo ($var["rate"]); ?>‰)</option><?php endif; endforeach; endif; endif; endforeach; endif; endif; endif; endforeach; endif; ?>
                        </select>
                        <script>
                            $(document).ready(function(e){
                                $("#parent_id").change(function(){
                                    var url = '<?php echo U("goodscate/child",array("parent_id"=>"0000"));?>';
                                    if($(this).val() > 0){
                                        var url2 = url.replace('0000',$(this).val());
                                        $.get(url2,function(data){
                                            $("#cate_id").html(data);
                                        },'html');
                                    }
                                });
                                
                            });
                        </script>
                    </td>
                </tr>    
                  
    

 					<tr> 
                         <td class="lfTdBt">商品类型:</td>
                         <td>                                     
                           <select name="data[shoplx]" id="spec_type" class="form-control seleFl w200" style="width:250px;">
                                <option value="0">选择商品类型</option>
                                   <?php if(is_array($goodsType)): foreach($goodsType as $k=>$vo): ?><option value="<?php echo ($vo["id"]); ?>"<?php if($goodsInfo[shoplx] == $vo[id]): ?>selected="selected"<?php endif; ?> ><?php echo ($vo["name"]); ?></option><?php endforeach; endif; ?>                                        
                           </select>
                         </td>
                     </tr> 
                         <td class="lfTdBt">  
                        </td>  
                         <td>  
                             <div id="ajax_spec_data"></div>
                         </td>  
                     <tr></tr>
                     
                     
                      <tr> 
                      <td class="lfTdBt">商品属性：</td>
                      <td class="rgTdBt">
                            <table class="table table-bordered" id="goods_attr_table">                                
                                <tr>
                                   <td>商品属性:</td>
                                   <td>                                        
                                       <select name="goods_type" id="goods_type" class="form-control seleFl w200" style="width:250px;">
                                            <option value="0">选择商品属性</option>
                                             <?php if(is_array($goodsType)): foreach($goodsType as $k=>$vo): ?><option value="<?php echo ($vo["id"]); ?>" <?php if($goodsInfo[goods_type] == $vo[id]): ?>selected="selected"<?php endif; ?> ><?php echo ($vo["name"]); ?></option><?php endforeach; endif; ?>                                      
                                        </select>
                                    </td>
                                 </tr>                                
                            </table>                                
                      </td>
                   </tr> 
                             
 
		<script>
            $(document).ready(function(){
                $("#spec_type").change(function(){  
                    var goods_id = '<?php echo ($detail["goods_id"]); ?>';
                    var spec_type = $(this).val();
                        $.ajax({
                                type:'GET',
                                data:{goods_id:goods_id,spec_type:spec_type}, 
                                url:"<?php echo U('Goods/ajaxGetSpecSelect');?>",
                                success:function(data){                            
                                      $("#ajax_spec_data").html('')
                                       $("#ajax_spec_data").append(data);
                                       ajaxGetSpecInput();
                                }
                        });                         
                });
                $("#spec_type").trigger('change');
            });
            $(document).ready(function(){
                $("#goods_type").change(function(){        
                    var goods_id = $("input[name='goods_id']").val();
                    var type_id = $(this).val();
                        $.ajax({
                                type:'GET',
                                data:{goods_id:goods_id,type_id:type_id}, 
                                url:"<?php echo U('goods/ajaxGetAttrInput');?>",
                                success:function(data){                            
                                        $("#goods_attr_table tr:gt(0)").remove()
                                        $("#goods_attr_table").append(data);
                                }        
                        });                         
                });
                $("#goods_type").trigger('change');
            });
            function addAttr(a){
                var attr = $(a).parent().parent().prop("outerHTML");    
                attr = attr.replace('addAttr','delAttr').replace('+','-');  
                $(a).parent().parent().after(attr);
            }
            function delAttr(a){
               $(a).parent().parent().remove();
            }
            </script>
    
                
                
               <tr>
                    <td class="lfTdBt">
                缩略图：
                </td>
                 <td class="rgTdBt">
                    <div style="width: 300px;height: 100px; float: left;">
                        <input type="hidden" name="data[photo]" value="<?php echo ($detail["photo"]); ?>" id="data_photo" />
                        <div id="fileToUpload" >上传缩略图</div>
                    </div>
                    <div style="width: 300px;height: 100px; float: left;">
                        <img id="photo_img" width="80" height="80"  src="<?php echo config_img($detail['photo']);?>" />
                        <a href="<?php echo U('setting/attachs');?>">缩略图设置</a>
                        建议尺寸<?php echo ($CONFIG["attachs"]["goods"]["thumb"]); ?>
                    </div>
                    <script>                                            
						var width_good = '<?php echo thumbSize($CONFIG[attachs][goods][thumb],0);?>';                         
						var height_good = '<?php echo thumbSize($CONFIG[attachs][goods][thumb],1);?>';                         
						var uploader = WebUploader.create({                             
						auto: true,                             
						swf: '/static/default/webuploader/Uploader.swf',                             
						server: '<?php echo U("app/upload/uploadify",array("model"=>"goods"));?>',                             
						pick: '#fileToUpload',                             
						resize: true,  
						compress : {width: width_good,height: height_good,quality: 80,allowMagnify: false,crop: true}                       
					});                                                 
					uploader.on( 'uploadSuccess', function( file,resporse) {                             
						$("#data_photo").val(resporse.url);                             
						$("#photo_img").attr('src',resporse.url).show();                         
					});                                                
					uploader.on( 'uploadError', function( file ) {                             
						alert('上传出错');                         
					});                     
                    </script>
                </td>
            </tr>
                <tr>
                  <td class="lfTdBt">更多详情图：</td>
                        <td class="rgTdBt">
                            <div>
                                <div id="moreToUpload" >上传图片</div>
                            </div>							
							<script>                                
									var width_goodspic = '<?php echo thumbSize($CONFIG[attachs][goods][thumb],0);?>';  //获取宽度                              
									var height_goodspic = '<?php echo thumbSize($CONFIG[attachs][goods][thumb],1);?>'; //获取高度 
                       
									var uploader = WebUploader.create({                                    
									auto: true,                                    
									swf: '/static/default/webuploader/Uploader.swf',                                    
									server: '<?php echo U("app/upload/uploadify",array("model"=>"goods"));?>',                                    
									pick: '#moreToUpload',                                    
									fileNumberLimit:10,                                    
									resize: true, 
									crop: false,  
									compress : {width:width_goodspic,height:height_goodspic,quality: 80,allowMagnify: false,crop: true},														
								});                                                               
								uploader.on( 'uploadSuccess', function( file,resporse) {                                    
								var str = '<span style="width: 120px; height: 120px; float: left; margin-left: 5px; margin-top: 10px;">  <img width="200" height="100" src="' + resporse.url + '">  <input type="hidden" name="photos[]" value="' + resporse.url + '" />    <a href="javascript:void(0);">取消</a>  </span>';                                   
								 $(".jq_uploads_img").append(str);                                
									 });                                                            
								 uploader.on( 'uploadError', function( file ) {                                    
									alert('上传出错');                                
								 });                                
								 $(document).on("click", ".jq_uploads_img a", function () {                                    
									 $(this).parent().remove();                                
								 });                            
                             </script>
                            <div class="jq_uploads_img">
                                <?php if(is_array($photos)): foreach($photos as $key=>$item): ?><span style="width: 200px; height: 120px; float: left; margin-left: 5px; margin-top: 10px;"> 
                                        <img width="100" height="100" src="<?php echo config_img($item['photo']);?>">  
                                        <input type="hidden" name="photos[]" value="<?php echo ($item["photo"]); ?>" />  
                                        <a href="javascript:void(0);">取消</a>  
                                    </span><?php endforeach; endif; ?>
                            </div>					
                        </td>
                    </tr>
             <tr>
             
             <tr>
                    <td  class="lfTdBt">属性：</td>
                    <td class="rgTdBt">                                  
                         <label><span>认证商家：</span><input type="checkbox" name="data[is_vs1]" <?php if($detail['is_vs1'] == 1): ?>checked="checked"<?php endif; ?>  value="1" /></label>
                        <label><span style="margin-left: 20px;">正品保证：</span><input type="checkbox" name="data[is_vs2]" <?php if($detail['is_vs2'] == 1): ?>checked="checked"<?php endif; ?> value="1" /></label>
                        <label><span style="margin-left: 20px;">假一赔十：</span><input type="checkbox" name="data[is_vs3]" <?php if($detail['is_vs3'] == 1): ?>checked="checked"<?php endif; ?> value="1" /></label>
                        <label><span style="margin-left: 20px;">当日送达：</span><input type="checkbox" name="data[is_vs4]" <?php if($detail['is_vs4'] == 1): ?>checked="checked"<?php endif; ?> value="1" /></label>
                    
                    </td>
                </tr>        
            <tr>
            <td class="lfTdBt">市场价格：</td>
            <td class="rgTdBt"><input type="text" name="data[price]" value="<?php echo (($detail["price"])?($detail["price"]):''); ?>" class="manageInput" />

            </td>
        </tr><tr>
            <td class="lfTdBt">商城价格：</td>
            <td class="rgTdBt"><input type="text" name="data[mall_price]" value="<?php echo (($detail["mall_price"])?($detail["mall_price"]):''); ?>" class="manageInput" />

            </td>
        </tr><tr>
            <td class="lfTdBt">手机下单优惠价格：</td>
             <td class="rgTdBt"><input type="text" name="data[mobile_fan]" value="<?php echo (($detail["mobile_fan"])?($detail["mobile_fan"]):''); ?>" class="manageInput" />

            </td>
        </tr>
        
        
          <tr>
            <td class="lfTdBt">可使用积分数：</td>
             <td class="rgTdBt"><input type="text" name="data[use_integral]" value="<?php echo (($detail["use_integral"])?($detail["use_integral"]):''); ?>" class="manageInput" />
                 <code>最大可使用的积分数，100积分抵扣1元，不填表示不可使用积分</code>  
            </td>
        </tr>

        
        <tr>
            <td class="lfTdBt">卖出数量：</td>
            <td class="rgTdBt"><input type="text" name="data[sold_num]" value="<?php echo (($detail["sold_num"])?($detail["sold_num"]):''); ?>" class="manageInput" />

            </td>
        </tr><tr>
            <td class="lfTdBt">浏览量：</td>
            <td class="rgTdBt"><input type="text" name="data[views]" value="<?php echo (($detail["views"])?($detail["views"]):''); ?>" class="manageInput" />

            </td>
        </tr>
        
        
         <tr>
                    <td class="lfTdBt">购买须知：</td>
                    <td class="rgTdBt">
                        <script type="text/plain" id="data_instructions" name="data[instructions]" style="width:800px;height:360px;"><?php echo ($detail["instructions"]); ?></script>
                    </td>
                </tr><link rel="stylesheet" href="__PUBLIC__/qiniu_ueditor/themes/default/css/ueditor.min.css" type="text/css">
                    <script type="text/javascript" charset="utf-8" src="__PUBLIC__/qiniu_ueditor/ueditor.config.js"></script>
                    <script type="text/javascript" charset="utf-8" src="__PUBLIC__/qiniu_ueditor/ueditor.all.min.js"></script>
                    <script type="text/javascript" src="__PUBLIC__/qiniu_ueditor/lang/zh-cn/zh-cn.js"></script>
                <script>
                  um2 = UE.getEditor('data_instructions', {
                    lang: 'zh-cn',
					toolbars:[['fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'backcolor', 'fontsize', 'fontfamily', ]],  
                  });
                </script>
                
                
                
                
                   <tr>
                    <td class="lfTdBt">详细内容：</td>
                    <td class="rgTdBt">
                        <script type="text/plain" id="data_details" name="data[details]" style="width:800px;height:360px;"><?php echo ($detail["details"]); ?></script>
                    </td>
                </tr>
                <script>
                    um = UE.getEditor('data_details', {
                        lang: 'zh-cn',
						toolbars:[['fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'backcolor', 'fontsize', 'fontfamily', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', 'link', 'unlink', 'map', 'template', 'background','inserttable','print','attachment',  'emotion',  'snapscreen','insertimage', 'music', 'insertvideo']],  
                        });
                </script>
        
        
        
        
        <tr>
            <td class="lfTdBt">过期时间：</td>
            <td class="rgTdBt"><input type="text" name="data[end_date]" value="<?php echo (($detail["end_date"])?($detail["end_date"]):''); ?>" onfocus="WdatePicker();"  class="inputData" />
			<code>商品有效期</code>
            </td>
        </tr>
        <tr>
            <td class="lfTdBt">排序：</td>
            <td class="rgTdBt"><input type="text" name="data[orderby]" value="<?php echo (($detail["orderby"])?($detail["orderby"]):''); ?>" class="manageInput" />
			<code>作弊使用</code>
            </td>
        </tr>
      	<tr>
          <td class="lfTdBt">是否支持推手：</td>
          <td class="rgTdBt">
          <input type="radio" name="data[is_backers]" value="0" <?php if($detail[is_backers] == 0): ?>checked="checked"<?php endif; ?> />不支持
		  <input type="radio" name="data[is_backers]" value="1" <?php if($detail[is_backers] == 1): ?>checked="checked"<?php endif; ?> />支持
          <code>首先开启推手全局配置>>>分销>>>推手>>>推手配置，然后单个商必须如开启支持推手，待该商品订单用户确认收货后就会分成给推手</code>
          </td>
        </tr>
      
    </table>

    <div style="margin-left:140px;margin-top:20px">
        <input type="submit" value="确认编辑"  class="smtQrIpt"  />
        <div>
            </form>
        </div>
    </div>
      		</div>
	</body>
</html>