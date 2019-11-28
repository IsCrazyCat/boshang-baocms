<?php if (!defined('THINK_PATH')) exit();?><div class="mainScAdd ">
    <div class="tableBox">
        <form  target="x-frame" action="<?php echo U('goodscate/create',array('parent_id'=>$parent_id));?>" method="post">
            <table  bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;" >
                <tr>
                    <td class="lfTdBt">分类：</td>
                    <td class="rgTdBt"><input type="text" name="data[cate_name]" value="<?php echo (($detail["cate_name"])?($detail["cate_name"]):''); ?>" class="manageInput" />

                    </td>
                </tr>
                
                 <tr>
                    <td class="lfTdBt">商品类别：</td>
                      <td class="rgTdBt">
                          <select id="star" name="data[type_id]" class="seleFl w210">
                              <option value="">=选择商品类型=</option>
                                <?php if(is_array($goodstypes)): $index = 0; $__LIST__ = $goodstypes;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$var): $mod = ($index % 2 );++$index;?><option <?php if(($detail["type_id"]) == $var["id"]): ?>selected='selected'<?php endif; ?> value="<?php echo ($var["id"]); ?>"><?php echo ($var["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                           </select>
                        <code>这里对应的是商品类型的ID，这里一级分类跟二级分类建议填写一致，同时影响编辑或者添加商品的时候筛选属性功能</code>
                     </td>
                 </tr>
                
               <tr>
                    <td class="lfTdBt">代卖ID：</td>
                      <td class="rgTdBt">
                          <select id="star" name="data[commId]" class="seleFl w210">
                              <option value="">=选择类型=</option>
                              
                                <?php if(is_array($commIds)): $index = 0; $__LIST__ = $commIds;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$var): $mod = ($index % 2 );++$index;?><option <?php if(($detail["commId"]) == $var["sellNumber"]): ?>selected='selected'<?php endif; ?> value="<?php echo ($var["sellNumber"]); ?>"><?php echo ($var["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                           </select>
                        <code>这里对接的国家商务部的代卖的ID，不是必须选择，没有对接国家商务部的不要填写</code>
                     </td>
                 </tr>
                 
                 <tr>
                    <td class="lfTdBt">分类图标：</td>
                 <td class="rgTdBt">
                    <div style="width: 300px;height: 100px; float: left;">
                        <input type="hidden" name="data[photo]" value="<?php echo ($detail["photo"]); ?>" id="data_photo" />
                        <div id="fileToUpload" >上传缩略图</div>
                    </div>
                    <div style="width: 300px;height: 100px; float: left;">
                        <img id="photo_img" width="60" height="60"  src="<?php echo config_img($detail['photo']);?>" />
                         <a href="<?php echo U('setting/attachs');?>">缩略图设置</a>
                        建议尺寸<?php echo ($CONFIG["attachs"]["navigation"]["thumb"]); ?>
                    </div>
                    <script>                                            
						var width_goods_cate = '<?php echo thumbSize($CONFIG[attachs][goods_cate][thumb],0);?>';                         
						var height_goods_cate = '<?php echo thumbSize($CONFIG[attachs][goods_cate][thumb],1);?>'; 
						var uploader = WebUploader.create({                             
						auto: true,                             
						swf: '/static/default/webuploader/Uploader.swf',                             
						server: '<?php echo U("app/upload/uploadify",array("model"=>"goods_cate"));?>',                             
						pick: '#fileToUpload',                             
						resize: true,  
						compress : {width: width_goods_cate,height: height_goods_cate,quality: 80,allowMagnify: false,crop: true}                         
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
                    <td class="lfTdBt">排序：</td>
                    <td class="rgTdBt"><input type="text" name="data[orderby]" value="<?php echo (($detail["orderby"])?($detail["orderby"]):''); ?>" class="manageInput" />
                        <code>数字越小越高</code>
                    </td>
                </tr>
            </table>
            <div class="smtQr"><input type="submit" value="确认添加" class="smtQrIpt" /></div>
        </form>
    </div>
</div>