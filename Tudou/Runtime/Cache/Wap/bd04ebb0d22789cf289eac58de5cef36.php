<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>推荐好友</title>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="email=no">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1">
    <meta itemprop="description" content="让求职者高薪就业，从业者终生受益是我们的追求！">
    <link rel="stylesheet" href="/static/default/wap/css/sm.min.css">
    <link rel="stylesheet" href="/static/default/wap/css/font_816809_f8ojixb913b.css">
    <link rel="stylesheet" href="/static/default/wap/css/demos.css">
    <link rel="stylesheet" href="/static/default/wap/css/referFriend.css">
    <script src="/static/default/wap/js/jquery.js"></script>
</head>
<body>

<div class="page-group" id="page-nav-bar-labels">
    <div id="page-label-input" class="page page-current">
        <div class="top-container">
            <div class="outer-container">
                <div class="inner-container">
                    <div class="banner">
                        <div class="banner-title"></div>
                        <div class="banner-text">
                            <?php echo ($remark); ?>
                        </div>
                    </div>
                    <div id="refer-ranking">
                        <div class="ranking-body">
                            <div class="ranking-title">
<!--                                <span><?php echo date('m',time()); ?></span>月份-->
                                推荐排行榜
                            </div>
                            <div class="ranking-list">
                                <?php if(is_array($users)): foreach($users as $index=>$user): ?><div class="ranking-item ranking-item-even">
                                        <div class="am-u-sm-3 serial">
                                            <?php if($index == 0): ?><img src="/static/default/wap/image/ranking/rank1.png">
                                            <?php elseif($index == 1): ?>
                                                <img src="/static/default/wap/image/ranking/rank2.png">
                                            <?php elseif($index == 2): ?>
                                                <img src="/static/default/wap/image/ranking/rank3.png">
                                            <?php else: ?>
                                                <?php echo ($index); endif; ?>
                                        </div>
                                        <div class="am-u-sm-5 username">
                                            <?php echo ($user['user']['nickname']); ?>
                                        </div>
                                        <div class="am-u-sm-4 reward"><span></span><?php echo ($user['cnt']); ?>人</div>
                                    </div><?php endforeach; endif; ?>

<!--                                <div class="ranking-item ranking-item-odd">-->
<!--                                    <div class="am-u-sm-3 serial">...</div>-->
<!--                                    <div class="am-u-sm-5 username"></div>-->
<!--                                    <div class="am-u-sm-4 reward"></div>-->
<!--                                </div>-->
<!--                                <div class="ranking-item ranking-item-even">-->
<!--                                    <div class="am-u-sm-3 serial">1559</div>-->
<!--                                    <div class="am-u-sm-5 username">我</div>-->
<!--                                    <div class="am-u-sm-4 reward"><span></span>1人</div>-->
<!--                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer">
                    <div class="refer-btn-wrapper">
                        <script>
                            $(function () {
                                $("#my-refer-btn").on("click",function(){
                                    window.location.href="<?php echo U('user/distribution/subordinate',array('user_id'=>$user_id));?>";
                                    return;
                                });
                                $("#recommend-btn").on("click",function(){
                                    window.location.href="<?php echo U('api/qrcode',array('fuid'=>$user_id));?>";
                                    return;
                                });
                            });
                        </script>
                        <div id="recommend-btn">立即推荐</div>
                        <div id="my-refer-btn">我的推荐</div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="text-center recommend-txt"><?php echo ($remark1); ?></div>
                </div>
            </div>
        </div>
    </div>
</div>

</body></html>