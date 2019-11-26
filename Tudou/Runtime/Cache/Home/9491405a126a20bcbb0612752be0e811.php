<?php if (!defined('THINK_PATH')) exit();?><style>

.y {
    float: right;
}
.mt_5 {
    margin-top: -5px;
}
.mt_20 {
    margin-top: -10px;
}
.topTwo_cart_list_box .box2 {
    padding: 10px;
    position: relative;
    margin-top: 16px;
}
#vipcenter_menu {border: 0;background: none;z-index: 999999 !important;}
.member_card-li {background-repeat: no-repeat;width: 280px;height: 170px;background-size: 330px auto;padding: 25px;position: relative;box-sizing: content-box;}
.member-cardName {filter: alpha(Opacity=50);opacity: .5;color: #4e576f;font-size: 30px;font-weight: 700;font-family: Arial;line-height: 30px;}
#vipcenter_menu>.member_card-li>.member-cardpay, #vipcenter_menu>.member_card-li>.member-cardinfo {color: #979CAB;}
#vipcenter_menu>.member_card-li>.member-cardinfo>span>h2 {font-family: Arial;}
#vipcenter_menu>.member_card-li>.member-cardinfo>span.y {line-height: 32px;margin-right: 10px;}
#vipcenter_menu>.member_card-li>a {color: #979CAB;position: absolute;right: 25px;bottom: 55px;}
#vipcenter_menu>.member_card-li>a:hover {background: none;}

#vipcenter_menu>.member_card-li>.card_num {margin-top:10px;}
#vipcenter_menu>.member_card-li>.card_num a{font-size:24px;}
#vipcenter_menu>.member_card-li>.card_num2>em {display: block;width: 20px;height: 20px;}

#vipcenter_menu>.member_card-li>.member-cardtime {width: 200px;color: #979CAB; overflow: hidden;}
.card_vip_level {height: 24px;display: block; line-height: 24px; border-radius: 4px; font-size: 14px; color: #fff; padding: 0 5px;margin-right: 10px;}
.card_vip_level>i{ font-size: 16px;}

.vip_no_login {background: url("/themes/default/Home/statics/images/vip_no_login.png") no-repeat 0 0;margin-top: 20px;margin-left: -11px;margin-right: -3px;line-height: 55px;color: #A5A9B5;padding-left: 10px;}
.vip_no_login>a, .vip_no_login>a:hover {float: right;background: url("/themes/default/Home/statics/images/vip_no_login_a.png") no-repeat 0 2px;line-height: 55px;width: 104px;text-align: center;color: #FFFFFF;padding: 0;}
.vip_no_login>a:hover {margin-right: -5px;}

</style>

<ul id="vipcenter_menu" class="p_pop">
    <div class="member_card-li " style="background-image: url(/themes/default/Home/statics/images/card_bg.png)">
    <div class="member-cardName">
    	<span class="y f_18 no_b"><i class="card_vip_level mr_10" style=" background-color: #DFB767"><i class="iconfont">V</i><?php echo ($MEMBER['rank_id']); ?></i></span>
    VIPCARD</div>
    <div class="card_num">
        <i class="num2 ord-num2"><a>NO.<?php echo ($card["card_num"]); ?></a></i>
    </div>
    <div class="member-cardpay mt_20 ">余额: <?php echo round($MEMBER['money']/100,2);?> &nbsp;&nbsp; 积分: <?php echo ($MEMBER["integral"]); ?> &nbsp;&nbsp; <?php echo (($CONFIG["prestige"]["name"])?($CONFIG["prestige"]["name"]):'威望'); ?>: <?php echo ($MEMBER["prestige"]); ?></div>
    <div class="member-cardtime mt_5"><span class="y">过期时间：<?php echo ($card["end_date"]); ?></span></div>
    </div>
</ul>