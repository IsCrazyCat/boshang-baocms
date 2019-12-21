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
        <li class="li2">工作管理</li>
        <li class="li2 li3">编辑</li>
    </ul>
</div>
<div class="mainScAdd ">

    <div class="tableBox">
        <form target="x-frame" action="<?php echo U('goods/edit',array('goods_id'=>$detail['goods_id']));?>" method="post">
            <input type="hidden" name="goods_id" value="<?php echo ($detail["goods_id"]); ?>"/>
            <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"
                   style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;">
                <tr>
                    <td class="lfTdBt">工作名称：</td>
                    <td class="rgTdBt"><input type="text" name="data[title]" value="<?php echo (($detail["title"])?($detail["title"]):''); ?>"
                                              class="manageInput manageInput2"/>

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">工作副标题：</td>
                    <td class="rgTdBt"><input type="text" name="data[intro]" value="<?php echo (($detail["intro"])?($detail["intro"]):''); ?>"
                                              class="manageInput manageInput2"/>

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">工作规格：</td>
                    <td class="rgTdBt"><input type="text" name="data[guige]" value="<?php echo (($detail["guige"])?($detail["guige"]):''); ?>"
                                              class="manageInput"/>
                        <code>可以不填写，暂时不支持多属性</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">招聘人数：</td>
                    <td class="rgTdBt"><input type="text" name="data[num]" value="<?php echo (($detail["num"])?($detail["num"]):''); ?>"
                                              class="manageInput"/>
                        <code>请认真填写招聘人数</code>
                    </td>
                </tr>

                <tr>
                    <td class="lfTdBt">企业：</td>
                    <td class="rgTdBt">
                        <div class="lt">
                            <input type="hidden" id="shop_id" name="data[shop_id]"
                                   value="<?php echo (($detail["shop_id"])?($detail["shop_id"]):''); ?>"/>
                            <input type="text" id="shop_name" name="shop_name" value="<?php echo ($shop["shop_name"]); ?>"
                                   class="manageInput"/>
                        </div>
                        <a mini="select" w="1000" h="600" href="<?php echo U('shop/select');?>" class="remberBtn">选择企业</a>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">分类：</td>
                    <td class="rgTdBt">

                        <select name="parent_id" id="parent_id" class="seleFl w100"
                                style="display: inline-block; margin-right: 10px;">
                            <option value="0">请选择...</option>
                            <?php if(is_array($cates)): foreach($cates as $key=>$var): if(($var["parent_id"]) == "0"): ?><option value="<?php echo ($var["cate_id"]); ?>"
                                    <?php if(($var["cate_id"]) == $parent_id): ?>selected="selected"<?php endif; ?>
                                    ><?php echo ($var["cate_name"]); ?>(<?php echo ($var["rate"]); ?>‰)</option><?php endif; endforeach; endif; ?>
                        </select>
                        <select id="cate_id" name="data[cate_id]" class="seleFl w100"
                                style="display: inline-block; margin-right: 10px;">
                            <option value="0">请选择...</option>
                            <?php if(is_array($cates)): foreach($cates as $key=>$var): if(($var["parent_id"]) == "0"): if(($var["cate_id"]) == $parent_id): if(is_array($cates)): foreach($cates as $key=>$var2): if(($var2["parent_id"]) == $var["cate_id"]): ?><option value="<?php echo ($var2["cate_id"]); ?>"
                                                <?php if(($var2["cate_id"]) == $detail["cate_id"]): ?>selected="selected"<?php endif; ?>
                                                ><?php echo ($var2["cate_name"]); ?>(<?php echo ($var["rate"]); ?>‰)</option>
                                                <?php if(is_array($cates)): foreach($cates as $key=>$var3): if(($var3["parent_id"]) == $var2["cate_id"]): ?><option value="<?php echo ($var3["cate_id"]); ?>"
                                                        <?php if(($var3["cate_id"]) == $detail["cate_id"]): ?>selected="selected"<?php endif; ?>
                                                        >&nbsp;&nbsp;-<?php echo ($var3["cate_name"]); ?>(<?php echo ($var["rate"]); ?>‰)</option><?php endif; endforeach; endif; endif; endforeach; endif; endif; endif; endforeach; endif; ?>
                        </select>
                        <script>
                            $(document).ready(function (e) {
                                $("#parent_id").change(function () {
                                    var url = '<?php echo U("goodscate/child",array("parent_id"=>"0000"));?>';
                                    if ($(this).val() > 0) {
                                        var url2 = url.replace('0000', $(this).val());
                                        $.get(url2, function (data) {
                                            $("#cate_id").html(data);
                                        }, 'html');
                                    }
                                });

                            });
                        </script>
                    </td>
                </tr>


                <tr>
                    <td class="lfTdBt">工作标签<?php echo ($tag_id[0]); ?>:</td>
                    <td class="rgTdBt">
                        <select name="data[tag1]" class="seleFl w100" style="width:250px;float: left;margin-right: 15px">
                            <option value="0">选择工作标签</option>
                            <?php if(is_array($tags)): foreach($tags as $k=>$vo): if($vo['cate_id'] == $tag_id[0]): ?><option value="<?php echo ($vo["cate_id"]); ?>" selected="selected"><?php echo ($vo["cate_name"]); ?></option>
                                <?php else: ?>
                                    <option value="<?php echo ($vo["cate_id"]); ?>" ><?php echo ($vo["cate_name"]); ?></option><?php endif; endforeach; endif; ?>
                        </select>
                        <select name="data[tag2]"  class="seleFl w100" style="width:250px;float: left;margin-right: 15px">
                            <option value="0">选择工作标签</option>
                            <?php if(is_array($tags)): foreach($tags as $k=>$vo): if(!empty($tag_id[1]) AND ($tag_id[1] == $vo['cate_id'])): ?><option value="<?php echo ($vo["cate_id"]); ?>" selected="selected"><?php echo ($vo["cate_name"]); ?></option>
                                <?php else: ?>
                                    <option value="<?php echo ($vo["cate_id"]); ?>" ><?php echo ($vo["cate_name"]); ?></option><?php endif; endforeach; endif; ?>
                        </select>
                        <select name="data[tag3]" class="seleFl w100" style="width:250px;float: left;">
                            <option value="0">选择工作标签</option>
                            <?php if(is_array($tags)): foreach($tags as $k=>$vo): if(!empty($tag_id[2]) AND ($tag_id[2] == $vo['cate_id'])): ?><option value="<?php echo ($vo["cate_id"]); ?>" selected="selected"><?php echo ($vo["cate_name"]); ?></option>
                                <?php else: ?>
                                    <option value="<?php echo ($vo["cate_id"]); ?>" ><?php echo ($vo["cate_name"]); ?></option><?php endif; endforeach; endif; ?>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="lfTdBt">
                        缩略图：
                    </td>
                    <td class="rgTdBt">
                        <div style="width: 300px;height: 100px; float: left;">
                            <input type="hidden" name="data[photo]" value="<?php echo ($detail["photo"]); ?>" id="data_photo"/>
                            <div id="fileToUpload">上传缩略图</div>
                        </div>
                        <div style="width: 300px;height: 100px; float: left;">
                            <img id="photo_img" width="80" height="80" src="<?php echo config_img($detail['photo']);?>"/>
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
                                compress: {
                                    width: width_good,
                                    height: height_good,
                                    quality: 80,
                                    allowMagnify: false,
                                    crop: true
                                }
                            });
                            uploader.on('uploadSuccess', function (file, resporse) {
                                $("#data_photo").val(resporse.url);
                                $("#photo_img").attr('src', resporse.url).show();
                            });
                            uploader.on('uploadError', function (file) {
                                alert('上传出错');
                            });
                        </script>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">更多详情图：</td>
                    <td class="rgTdBt">
                        <div>
                            <div id="moreToUpload">上传图片</div>
                        </div>
                        <script>
                            var width_goodspic = '<?php echo thumbSize($CONFIG[attachs][goods][thumb],0);?>';  //获取宽度
                            var height_goodspic = '<?php echo thumbSize($CONFIG[attachs][goods][thumb],1);?>'; //获取高度

                            var uploader = WebUploader.create({
                                auto: true,
                                swf: '/static/default/webuploader/Uploader.swf',
                                server: '<?php echo U("app/upload/uploadify",array("model"=>"goods"));?>',
                                pick: '#moreToUpload',
                                fileNumberLimit: 10,
                                resize: true,
                                crop: false,
                                compress: {
                                    width: width_goodspic,
                                    height: height_goodspic,
                                    quality: 80,
                                    allowMagnify: false,
                                    crop: true
                                },
                            });
                            uploader.on('uploadSuccess', function (file, resporse) {
                                var str = '<span style="width: 120px; height: 120px; float: left; margin-left: 5px; margin-top: 10px;">  <img width="200" height="100" src="' + resporse.url + '">  <input type="hidden" name="photos[]" value="' + resporse.url + '" />    <a href="javascript:void(0);">取消</a>  </span>';
                                $(".jq_uploads_img").append(str);
                            });
                            uploader.on('uploadError', function (file) {
                                alert('上传出错');
                            });
                            $(document).on("click", ".jq_uploads_img a", function () {
                                $(this).parent().remove();
                            });
                        </script>
                        <div class="jq_uploads_img">
                            <?php if(is_array($photos)): foreach($photos as $key=>$item): ?><span style="width: 200px; height: 120px; float: left; margin-left: 5px; margin-top: 10px;"> 
                                        <img width="100" height="100" src="<?php echo config_img($item['photo']);?>">  
                                        <input type="hidden" name="photos[]" value="<?php echo ($item["photo"]); ?>"/>
                                        <a href="javascript:void(0);">取消</a>  
                                    </span><?php endforeach; endif; ?>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">薪资标题：</td>
                    <td class="rgTdBt">
                        <input type="text" name="data[price_title]" value="<?php echo (($detail["price_title"])?($detail["price_title"]):''); ?>" class="manageInput" />
                    </td>
                </tr>
                <tr>

<!--                <tr>-->
<!--                    <td class="lfTdBt">属性：</td>-->
<!--                    <td class="rgTdBt">-->
<!--                        <label><span>认证企业：</span><input type="checkbox" name="data[is_vs1]"-->
<!--                            <?php if($detail['is_vs1'] == 1): ?>checked="checked"<?php endif; ?>-->
<!--                            value="1" /></label>-->
<!--                        <label><span style="margin-left: 20px;">正品保证：</span><input type="checkbox" name="data[is_vs2]"-->
<!--                            <?php if($detail['is_vs2'] == 1): ?>checked="checked"<?php endif; ?>-->
<!--                            value="1" /></label>-->
<!--                        <label><span style="margin-left: 20px;">假一赔十：</span><input type="checkbox" name="data[is_vs3]"-->
<!--                            <?php if($detail['is_vs3'] == 1): ?>checked="checked"<?php endif; ?>-->
<!--                            value="1" /></label>-->
<!--                        <label><span style="margin-left: 20px;">当日送达：</span><input type="checkbox" name="data[is_vs4]"-->
<!--                            <?php if($detail['is_vs4'] == 1): ?>checked="checked"<?php endif; ?>-->
<!--                            value="1" /></label>-->

<!--                    </td>-->
<!--                </tr>-->
                <tr>
                    <td class="lfTdBt">普通薪资：</td>
                    <td class="rgTdBt"><input type="text" name="data[price]" value="<?php echo (($detail["price"])?($detail["price"]):''); ?>"
                                              class="manageInput"/>

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">VIP薪资：</td>
                    <td class="rgTdBt"><input type="text" name="data[mall_price]"
                                              value="<?php echo (($detail["mall_price"])?($detail["mall_price"]):''); ?>" class="manageInput"/>

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">薪资单位：</td>
                    <td class="rgTdBt"><input type="text" name="data[price_unit]"
                                              value="<?php echo (($detail["price_unit"])?($detail["price_unit"]):'元/小时'); ?>" class="manageInput"/>

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">每月薪资：</td>
                    <td class="rgTdBt"><input type="text" name="data[price_month]"
                                              value="<?php echo ($detail["price_month"]); ?>" class="manageInput"/>

                    </td>
                </tr>
                <!--                <tr>-->
<!--                    <td class="lfTdBt">手机报名增加薪资：</td>-->
<!--                    <td class="rgTdBt"><input type="text" name="data[mobile_fan]"-->
<!--                                              value="<?php echo (($detail["mobile_fan"])?($detail["mobile_fan"]):''); ?>" class="manageInput"/>-->

<!--                    </td>-->
<!--                </tr>-->


                <!--          <tr>-->
                <!--            <td class="lfTdBt">可使用积分数：</td>-->
                <!--             <td class="rgTdBt"><input type="text" name="data[use_integral]" value="<?php echo (($detail["use_integral"])?($detail["use_integral"]):''); ?>" class="manageInput" />-->
                <!--                 <code>最大可使用的积分数，100积分抵扣1元，不填表示不可使用积分</code>  -->
                <!--            </td>-->
                <!--        </tr>-->


                <tr>
                    <td class="lfTdBt">报名人数：</td>
                    <td class="rgTdBt"><input type="text" name="data[sold_num]" value="<?php echo (($detail["sold_num"])?($detail["sold_num"]):''); ?>"
                                              class="manageInput"/>

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">浏览量：</td>
                    <td class="rgTdBt"><input type="text" name="data[views]" value="<?php echo (($detail["views"])?($detail["views"]):''); ?>"
                                              class="manageInput"/>

                    </td>
                </tr>


                <tr>
                    <td class="lfTdBt">平台补贴：</td>
                    <td class="rgTdBt">
                        <script type="text/plain" id="data_instructions" name="data[instructions]"
                                style="width:800px;height:200px;"><?php echo ($detail["instructions"]); ?>
                        </script>
                    </td>
                </tr>
                <link rel="stylesheet" href="__PUBLIC__/qiniu_ueditor/themes/default/css/ueditor.min.css"
                      type="text/css">
                <script type="text/javascript" charset="utf-8"
                        src="__PUBLIC__/qiniu_ueditor/ueditor.config.js"></script>
                <script type="text/javascript" charset="utf-8"
                        src="__PUBLIC__/qiniu_ueditor/ueditor.all.min.js"></script>
                <script type="text/javascript" src="__PUBLIC__/qiniu_ueditor/lang/zh-cn/zh-cn.js"></script>
                <script>
                    um2 = UE.getEditor('data_instructions', {
                        lang: 'zh-cn',
                        toolbars: [['fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'backcolor', 'fontsize', 'fontfamily',]],
                    });
                </script>
                <tr>
                    <td class="lfTdBt">薪资待遇：</td>
                    <td class="rgTdBt">
                        <script type="text/plain" id="data_salary" name="data[salary]"
                                style="width:800px;height:200px;"><?php echo ($detail["salary"]); ?>
                        </script>
                    </td>
                </tr>
                <script>
                    um = UE.getEditor('data_salary', {
                        lang: 'zh-cn',
                        toolbars: [['fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'backcolor', 'fontsize', 'fontfamily', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', 'link', 'unlink', 'map', 'template', 'background', 'inserttable', 'print', 'attachment', 'emotion', 'snapscreen', 'insertimage', 'music', 'insertvideo']],
                    });
                </script>

                <tr>
                    <td class="lfTdBt">录用条件：</td>
                    <td class="rgTdBt">
                        <script type="text/plain" id="data_enroll" name="data[enroll]"
                                style="width:800px;height:200px;"><?php echo ($detail["enroll"]); ?>
                        </script>
                    </td>
                </tr>
                <script>
                    um = UE.getEditor('data_enroll', {
                        lang: 'zh-cn',
                        toolbars: [['fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'backcolor', 'fontsize', 'fontfamily', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', 'link', 'unlink', 'map', 'template', 'background', 'inserttable', 'print', 'attachment', 'emotion', 'snapscreen', 'insertimage', 'music', 'insertvideo']],
                    });
                </script>
                <tr>
                    <td class="lfTdBt">岗位介绍：</td>
                    <td class="rgTdBt">
                        <script type="text/plain" id="data_explain" name="data[explain]"
                                style="width:800px;height:200px;"><?php echo ($detail["explain"]); ?>
                        </script>
                    </td>
                </tr>
                <script>
                    um = UE.getEditor('data_explain', {
                        lang: 'zh-cn',
                        toolbars: [['fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'backcolor', 'fontsize', 'fontfamily', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', 'link', 'unlink', 'map', 'template', 'background', 'inserttable', 'print', 'attachment', 'emotion', 'snapscreen', 'insertimage', 'music', 'insertvideo']],
                    });
                </script>
                <tr>
                    <td class="lfTdBt">温馨提示：</td>
                    <td class="rgTdBt">
                        <script type="text/plain" id="data_reminder" name="data[reminder]"
                                style="width:800px;height:200px;"><?php echo ($detail["reminder"]); ?>
                        </script>
                    </td>
                </tr>
                <script>
                    um = UE.getEditor('data_reminder', {
                        lang: 'zh-cn',
                        toolbars: [['fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'backcolor', 'fontsize', 'fontfamily', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', 'link', 'unlink', 'map', 'template', 'background', 'inserttable', 'print', 'attachment', 'emotion', 'snapscreen', 'insertimage', 'music', 'insertvideo']],
                    });
                </script>
                <tr>
                    <td class="lfTdBt">截止时间：</td>
                    <td class="rgTdBt"><input type="text" name="data[end_date]" value="<?php echo (($detail["end_date"])?($detail["end_date"]):''); ?>"
                                              onfocus="WdatePicker();" class="inputData"/>
                        <code>工作有效期</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">排序：</td>
                    <td class="rgTdBt"><input type="text" name="data[orderby]" value="<?php echo (($detail["orderby"])?($detail["orderby"]):''); ?>"
                                              class="manageInput"/>
                        <code>作弊使用</code>
                    </td>
                </tr>
                <!--      	<tr>-->
                <!--          <td class="lfTdBt">是否支持推手：</td>-->
                <!--          <td class="rgTdBt">-->
                <!--          <input type="radio" name="data[is_backers]" value="0" <?php if($detail[is_backers] == 0): ?>checked="checked"<?php endif; ?> />不支持-->
                <!--		  <input type="radio" name="data[is_backers]" value="1" <?php if($detail[is_backers] == 1): ?>checked="checked"<?php endif; ?> />支持-->
                <!--          <code>首先开启推手全局配置>>>分销>>>推手>>>推手配置，然后单个商必须如开启支持推手，待该工作订单用户确认收货后就会分成给推手</code>-->
                <!--          </td>-->
                <!--        </tr>-->

            </table>

            <div style="margin-left:140px;margin-top:20px">
                <input type="submit" value="确认编辑" class="smtQrIpt"/>
                <div>
        </form>
    </div>
</div>
  		</div>
	</body>
</html>