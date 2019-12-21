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
        <li class="li1">会员</li>
        <li class="li2">会员管理</li>
        <li class="li2 li3">会员管理</li>
    </ul>
</div>
<style>
.seleK{height: 30px;}
.seleK label {margin-bottom: 10px;}
.main-sc .jsglNr .selectNr .right span{line-height:30px; height:30px; padding-right: 0;}
.seleK .text{height: 28px; width:120px !important;}
.seleK .sumit{height:30px;padding-left:27px;background-position:6px center;padding-right:10px;line-height:30px}
.main-sc .jsglNr .selectNr .right .select{height: 30px; line-height: 30px;width: 80px;margin-right:5px}
.inptText{width: 120px; height: 28px; line-height: 30px;}
.inptButton{height:36px;line-height:30px;background:rgb(0, 153, 204); width:70px;text-align: center;}
.weixin{ background:#44b549!important;}
.shang, .delivery, .weibo, .qq, .weixin{color:#FFF; padding:0 3px; margin:0 2px;}
.shang{ background:#F00; }
.delivery{ background: #00F;}
.weibo{ background:#903;}
.qq{ background:#09F}
.weixin{ background:#0C0;}
</style>

<div class="main-jsgl main-sc">
    <p class="attention"><span>注意：</span>即将增加设置冻结金功能，冻结金无法提现，管理员可以解冻，冻结金设置后方便用户抢单等操作！</p>
    <div class="jsglNr">
        <div class="selectNr" style="margin-top: 0px; border-top:none;">
            <div class="left">
                <?php echo BA('user/create','','添加会员','load','',700,600);?>
                <a class="remberBtn export"  href="javascript:void(0);" rel="<?php echo U('user/export_code');?>" admin_id="<?php echo ($admin["admin_id"]); ?>" info="导出会员">导出会员</a>
            </div>
            <div class="right">
                <form class="search_form" method="post" action="<?php echo U('user/index');?>">
                    <div class="seleHidden" id="seleHidden">
                    
                    <div class="seleK">
<!--                     <label><span>开始时间</span><input type="text" name="bg_date" placeholder=" 注册开始时间" value="<?php echo (($bg_date)?($bg_date):''); ?>"onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});" class="text"/></label>-->
<!--                        <label><span>结束时间</span><input type="text" name="end_date"  placeholder=" 注册结束时间" value="<?php echo (($end_date)?($end_date):''); ?>"onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});" class="text"/></label>-->
                        <label>
                            <span>账户</span>
                            <input type="text" placeholder=" 账户、昵称、手机号" name="keyword" value="<?php echo ($keyword); ?>" class="inptText" />
                        </label>
                        
<!--                        <label>-->
<!--                            <span><?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>状态</span>-->
<!--                            <select name="is_prestige_frozen" class="select w80">-->
<!--                                <option value="999">请选择</option>-->
<!--                                <option <?php if(($is_prestige_frozen) == "1"): ?>selected="selected"<?php endif; ?>  value="1">已激活</option>-->
<!--                                <option <?php if(($is_prestige_frozen) == "0"): ?>selected="selected"<?php endif; ?>  value="0">未激活</option>-->
<!--                            </select>-->
<!--                        </label>-->
                        
                        <label>
                            <span>实名状态</span>
                            <select name="is_aux" class="select w80">
                                <option value="999">请选择</option>
                                <option <?php if(($is_aux) == "1"): ?>selected="selected"<?php endif; ?>  value="1">已实名</option>
                                <option <?php if(($is_aux) == "0"): ?>selected="selected"<?php endif; ?>  value="0">未实名</option>
                            </select>
                        </label>
                        
<!--                        <label>-->
<!--                            <span>登录锁定状态</span>-->
<!--                            <select name="is_lock" class="select w80">-->
<!--                                <option value="999">请选择</option>-->
<!--                                <option <?php if(($is_lock) == "1"): ?>selected="selected"<?php endif; ?>  value="1">已锁定</option>-->
<!--                                <option <?php if(($is_lock) == "0"): ?>selected="selected"<?php endif; ?>  value="0">未锁定</option>-->
<!--                            </select>-->
<!--                        </label>-->
                        
                        
<!--                        <label>-->
<!--                            <span>推手状态</span>-->
<!--                            <select name="is_backers" class="select w80">-->
<!--                                <option value="999">请选择</option>-->
<!--                                <option <?php if(($is_backers) == "1"): ?>selected="selected"<?php endif; ?>  value="1">是推手</option>-->
<!--                                <option <?php if(($is_backers) == "0"): ?>selected="selected"<?php endif; ?>  value="0">否推手</option>-->
<!--                            </select>-->
<!--                        </label>-->
                        
                                                
                         <label>
                            <span>用户等级：</span>
                            <select name="rank_id" class="select w100">
                                <option value="0">请选择</option>
                                <?php if(is_array($ranks)): foreach($ranks as $key=>$item): ?><option <?php if(($item["rank_id"]) == $rank_id): ?>selected="selected"<?php endif; ?>  value="<?php echo ($item["rank_id"]); ?>"><?php echo ($item["rank_name"]); ?></option><?php endforeach; endif; ?>
                            </select>
                        </label>
                        <label>
                            <input type="submit" value="   搜索"  class="inptButton" />
                        </label>
                    </div> 
                     </div> 
                </form>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
            <div class="selectNr selectNr2">
                <div class="left">
                    <div class="seleK">
                    </div>
                </div>
                <div class="right">
                </div>
        <div class="clear"></div>
    </div>
    <form  target="x-frame" method="post">
        <div class="tableBox">
            <table bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;"  >
                <tr>
                    <td class="w50"><input type="checkbox" class="checkAll" rel="user_id" /></td>
                    <td class="w50">ID</td>
                    <td>账户</td>
                    <td>手机</td>
<!--                    <td>邮箱</td>-->
                    <td>会员等级</td>
                    <td>账户余额</td>
                    <td>补贴金</td>
<!--                    <td><?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>状态</td>-->
                    <td>实名认证</td>
<!--                    <td>登录状态</td>-->
<!--                    <td>推手状态</td>-->
<!--                    <td>股权数量</td>-->
                    <td>注册时间(IP)</td>
                    <td class="w150">操作</td>
                </tr>
                <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
                        <td><input class="child_user_id" type="checkbox" name="user_id[]" value="<?php echo ($var["user_id"]); ?>" /></td>
                        <td><?php echo ($var["user_id"]); ?></td>
                        <td>
                        <?php if(!empty($var['account'])): ?>账户：<?php echo ($var["account"]); endif; ?>
<!--                        <?php if(($var["is_shop"]) == "1"): ?><span class="shang">商</span><?php endif; ?>-->
<!--                        <?php if(($var["is_delivery"]) == "1"): ?><span class="delivery">配</span><?php endif; ?>-->
<!--                        <?php if(($var["is_weixin"]) == "1"): ?><span class="weixin">微信</span><?php endif; ?>-->
<!--                        <?php if(($var["is_qq"]) == "1"): ?><span class="qq">qq</span><?php endif; ?>-->
<!--                        <?php if(($var["is_weibo"]) == "1"): ?><span class="weibo">微博</span><?php endif; ?>-->
                        <?php if(!empty($var['nickname'])): ?><br/>账户：<?php echo ($var["nickname"]); endif; ?>
                        
                        </td>
                        <td><?php echo (($var['mobile'])?($var['mobile']):'未绑定手机'); ?><br/></td>
<!--                        <td><?php echo (($var['email'])?($var['email']):'未设置邮箱'); ?><br/></td>-->
                        <td><?php echo (($rank[$var['rank_id']]['rank_name'])?($rank[$var['rank_id']]['rank_name']):'无等级'); ?><br/></td>
                        <td>
                        余额：&yen; <?php echo round($var['money']/100,2);?> 元<br/>
<!--                        <?php if(($var["is_shop"]) == "1"): ?><span class="shang">商户资金：&yen; <?php echo round($var['gold']/100,2);?>元</span><br/><?php endif; ?>-->
<!--                        积分：<?php echo ($var["integral"]); ?>&nbsp;&nbsp;<?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>：<?php echo ($var["prestige"]); ?>-->
                        </td>
                        <td>
<!--                        <?php if(($var["is_shop"]) == "1"): ?>商户冻结金：&yen; <?php echo round($var['frozen_gold']/100,2);?>元<?php endif; ?><br/>-->
<!--                        会员冻结金&yen; <?php echo round($var['frozen_money']/100,2);?>元-->
                            会员补贴: <?php echo round($var['subsidy_money']/100,2);?>元
                        </td>
<!--                        <td><?php if(($var["is_prestige_frozen"]) == "1"): ?>已激活<?php else: ?>未激活<?php endif; ?></td>-->
                        <td><?php if(($var["is_aux"]) == "1"): ?>已实名<?php else: ?>未实名<?php endif; ?></td>
<!--                        <td><?php if(($var["is_lock"]) == "1"): ?>已锁定<?php else: ?>未锁定<?php endif; ?></td>-->
<!--                        <td><?php if(($var["is_backers"]) == "1"): ?>是推手<?php else: ?>不是推手<?php endif; ?></td>-->
<!--                        <td><?php echo (($var["stock_num"])?($var["stock_num"]):'0'); ?></td>-->
                        <td>
                        <?php echo (date('Y-m-d H:i:s',$var["reg_time"])); ?><br/>
                        <?php echo ($var["reg_ip"]); ?><br/>(<?php echo ($var["reg_ip_area"]); ?>)
                        </td>
                        
                    <td class="w150">
<!--                        <?php echo BA('user/integral',array("user_id"=>$var["user_id"]),'积分','load','remberBtn_small',600,350);?>-->
                        <?php echo BA('user/money',array("user_id"=>$var["user_id"]),'余额','load','remberBtn_small',600,350);?>
                        <?php echo BA('user/edit',array("user_id"=>$var["user_id"]),'编辑','load','remberBtn_small',700,600);?>
                        <?php echo BA('user/delete',array("user_id"=>$var["user_id"]),'删除','act','remberBtn_small');?>
                        <?php if(($var["closed"]) == "-1"): echo BA('user/audit',array("user_id"=>$var["user_id"]),'审核通过','act','remberBtn_small'); endif; ?>  
<!--                        <?php if(($var["is_shop"]) == "1"): ?>-->
<!--                            <?php echo BA('user/frozen_gold',array("user_id"=>$var["user_id"]),'设置商户冻结金','load','remberBtn_small_quxiao',600,350);?>-->
<!--                            <?php echo BA('user/gold',array("user_id"=>$var["user_id"]),'商户资金','load','remberBtn_small_quxiao',600,350);?>  -->
<!--<?php endif; ?>-->
                        <?php echo BA('user/subsidy_money',array("user_id"=>$var["user_id"]),'增加补贴','load','remberBtn_small',600,350);?>
<!--                        <?php echo BA('user/profit',array("user_id"=>$var["user_id"]),'分销设置','','remberBtn_small');?>          -->
                        <a target="_blank" href="<?php echo U('user/manage',array('user_id'=>$var['user_id']));?>" class="remberBtn_small">管理用户</a>
                    </td>
                    </tr><?php endforeach; endif; ?>
            </table>
            <?php echo ($page); ?>
        </div>
        <div class="selectNr" style="margin-bottom: 0px; border-bottom: none;">
            <div class="left">
                <?php echo BA('user/audit','','批量审核','list',' remberBtn');?>
                <?php echo BA('user/delete','','批量删除','list',' a2');?>
            </div>
        </div>
    </form>
</div>
</div>

<script>
            
        </script>
        
        
  		</div>
	</body>
</html>