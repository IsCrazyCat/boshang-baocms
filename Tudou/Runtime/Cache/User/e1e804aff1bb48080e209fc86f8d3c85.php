<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0046)https://niuzhigongzuo.com/share2?invite=000oM6 -->
<html class="pixel-ratio-1"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>山东歌尔小时工不错,我想去上班,帮我点一下,我能多拿100元</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/static/default/wap/css/index/sm.min.css">
    <link rel="stylesheet" href="/static/default/wap/css/index/font_890015_osg9yt949rd.css">
    <link rel="stylesheet" href="/static/default/wap/css/index/share.css">
</head>
<body>

<div class="container">
    <div class="share-banner">
        <div id="share-banner-regular">规则</div>
    </div>
    <div id="share-job-wrapper" data-job-id="598">
        <div class="share-job" id="share-job">
            <div class="share-job-img">
                <div>
                    <img src="__STATIC__/images/niuzhi/04e39350-ecee-46a3-ad23-ee4393af8112-1503244547604.jpg" width="100%">
                </div>
            </div>
            <div class="share-job-detail">
                <div class="share-job-name">山东歌尔小时工</div>
                <div class="share-job-price">
                    <div class="price-title">普通价：</div>
                    <div class="price-text"><span>23.8</span>元/小时</div>
                    <div style="clear: both"></div>
                </div>
                <div class="share-job-price">
                    <div class="price-title">VIP价：</div>
                    <div class="price-text"><span>24</span>元/小时</div>
                    <div style="clear: both"></div>
                </div>
            </div>
            <div style="clear: both"></div>
        </div>
        <div class="share-job-status-wrapper">
            <input type="hidden" id="countDown" value="1295969">
            <div class="item-price-row row-3">
                <div>
                    <span>距任务结束</span>
                    <i class="count-down">1</i>
                    <i class="count-down">4</i>
                    <span>天</span>
                    <i class="count-down">2</i>
                    <i class="count-down">3</i>
                    <span>时</span>
                    <i class="count-down">5</i>
                    <i class="count-down">9</i>
                    <span>分</span>
                    <i class="count-down">3</i>
                    <i class="count-down">0</i>
                    <span>秒</span>
                </div>
            </div>
        </div>

        <div class="vip-progress">
            <div class="vip-progress-title">
                <div>VIP进度</div>
            </div>
            <div class="vip-progress-img-wrapper">
                <div class="vip-progress-bar-wraper">
                    <div class="vip-progress-bar">
                        <div class="vip-progress-bar-length" style="width: 0%"></div>
                    </div>
                </div>
            </div>
            <div class="vip-progress-slider">0%</div>
            <div style="clear: both"></div>
        </div>
    </div>
    <div class="share-detail-wraper">
        <div class="share-detail-title">
            我的好友 <span class="j-counter">0</span> 位
        </div>
        <div class="share-detail-list-wrapper">
            <div class="share-detail-list-template" style="display: none;">
                <div class="avatar">
                    <div class="user-img">
                        <img src="https://niuzhigongzuo.com/share2?invite=000oM6">
                    </div>
                </div>
                <div class="user-info">
                    <div class="user-info-time"></div>
                </div>
                <div style="clear: both"></div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" value="219380" id="customerId1">
<input type="hidden" value="219380" id="customerId2">
<input type="hidden" value="0" id="progress">

<div id="share-success-wrap">
    <div class="share-success">
        <div class="success-header"><i class="iconfont icon-success"></i>推广成功<i class="close">×</i></div>
        <div class="success-content">
            <p style="display: none"><span id="success-txt">完成每日推广任务</span>，坚持3天成功率高达99%哦～</p>
            <button style="display: none" id="j-continues-share" class="button button-fill">继续推广</button>
            <p class="recommend-tit">高价岗位推荐</p>
            <p>90%的人都在这里发现了心仪的工作！</p>
            <a href="https://niuzhigongzuo.com/index" class="button">前往牛职工作网首页</a>
        </div>
    </div>
</div>
<script src="__STATIC__/js/niuzhi/zepto.min.js" charset="utf-8"></script>
<script src="__STATIC__/js/niuzhi/sm.min.js"></script>
<script src="__STATIC__/js/niuzhi/jsbridge-mini.js"></script>
<script src="__STATIC__/js/niuzhi/oojs.js"></script>
<script src="__STATIC__/js/niuzhi/share.js"></script>
<script src="__STATIC__/js/niuzhi/jweixin-1.2.0.js"></script>
<script>
    $.post('https://niuzhigongzuo.com/wx/getWechatJsTicket', {
        url: location.href.split('#')[0]
    },function (data) {
        wx.config({
            debug: false,
            appId: data.appId,
            timestamp: data.timestamp,
            nonceStr: data.nonceStr,
            signature: data.signature,
            jsApiList: [
                'onMenuShareTimeline',
                'onMenuShareAppMessage'
            ]
        });
    });
    wx.ready(function () {
        // 判断当前版本是否支持指定 JS 接口，支持批量判断
        wx.checkJsApi({
            jsApiList: [
                'onMenuShareTimeline',
                'onMenuShareAppMessage'
            ],
            success: function (res) {
                console.log(JSON.stringify(res));
            }
        });

        // 获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
        wx.onMenuShareTimeline({
            title: '山东歌尔小时工 不错,我想去上班,要不要一起去？',
            desc: '20.0元/小时，除工资外，另外牛职补贴4.0元/小时',
            link: location.href,
            imgUrl: 'https://niuzhigongzuo.com/static/images/logo@x1024.jpg',
            success: function () {
                $.ajax({
                    url : '/shareTimeline',
                    type: "POST",
                    dataType: "json",
                    data : {
                        'applyId' : applyId
                    },
                    success: function (data) {
                        if(data.response==='success') {
                            var list = data.data.applyShare.applyShareDetailList;
                            var progress = data.data.applyShare.progress;
                            $('#share-success-wrap').show();
                            // $('#share-dimmer').hide();
                            shareFriend(progress,false);
                            createShareList(list);
                            counter.html(list.length);
                            if(progress<100) {
                                progressBg.css('width',progress+'%');
                                progressTxt.html(progress+'%');
                                // difference.html(100-progress+'%');
                            }
                            else if(progress===100) {
                                $('.success-content p').eq(0).html('恭喜您推广成功');
                                $('.success-header').html('恭喜推广成功');
                                shareDetail.html('<p>恭喜您推广成功!</p>');
                                progressBg.css('width','100%');
                                progressTxt.html('100%');
                                shareJob.append('<img class="success-chapter" src="/static/images/success-chapter.png" alt="">');
                                shareBtn.html('<a href="javascript:;">恭喜推广成功</a>');
                            }
                        }else {
                            // $('#share-dimmer').hide();
                            $.alert('分享朋友圈只能增加一次进度！','提示',function(){
                                location.reload();
                            });
                        }
                    }
                });
            },
            cancel: function () {
                alertStr('用户取消分享！');
            },
            fail: function (res) {
                console.log(JSON.stringify(res));
                alertStr('分享失败！');
            }
        });

        // 获取“分享给朋友”按钮点击状态及自定义分享内容接口
        wx.onMenuShareAppMessage({
            title: '山东歌尔小时工 不错,我想去上班,要不要一起去？',
            desc: '20.0元/小时，除工资外，另外牛职补贴4.0元/小时',
            link: location.href,
            imgUrl: 'https://niuzhigongzuo.com/static/images/logo@x1024.jpg',
            type: 'link',
            success: function () {
                $.ajax({
                    url : '/shareAppMessage',
                    type: "POST",
                    dataType: "json",
                    data : {
                        'applyId' : applyId
                    },
                    success: function (data) {
                        if(data.response==='success') {
                            var list = data.data.applyShare.applyShareDetailList;
                            var progress = data.data.applyShare.progress;
                            $('#share-success-wrap').show();
                            // $('#share-dimmer').hide();
                            shareFriend(progress,false);
                            createShareList(list);
                            counter.html(list.length);
                            if(progress<100) {
                                progressBg.css('width',progress+'%');
                                progressTxt.html(progress+'%');
                                // difference.html(100-progress+'%');
                            }
                            else if(progress===100) {
                                $('.success-content p').eq(0).html('恭喜您推广成功！');
                                $('.success-header').html('恭喜推广成功');
                                shareDetail.html('<p>恭喜您推广成功!</p>');
                                progressBg.css('width','100%');
                                progressTxt.html('100%');
                                shareJob.append('<img class="success-chapter" src="/static/images/success-chapter.png" alt="">');
                                shareBtn.html('<a href="javascript:;">恭喜推广成功</a>');
                            }
                        }else {
                            // $('#share-dimmer').hide();
                            $.alert('分享好友或群一天可分享5次！','提示',function () {
                                location.reload();
                            });
                        }
                    }
                });
            },
            cancel: function () {
                alertStr('用户取消分享！');
            },
            fail: function (res) {
                console.log(JSON.stringify(res));
                alertStr('分享失败！');
            }
        });
    });
    // 步骤五：通过error接口处理失败验证
    wx.error(function(res){
        console.log(res);
    });
</script>


</body></html>