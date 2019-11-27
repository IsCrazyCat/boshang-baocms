<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><?php echo ($job_info[job_name]); ?></title>
    <meta name="keywords" content="<?php echo ($mobile_keywords); ?>" />
    <meta name="description" content="<?php echo ($mobile_description); ?>" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta itemprop="description" content="让求职者高薪就业，从业者终生受益是我们的追求！">
    <link rel="stylesheet" href="/static/default/wap/css/index/sm.min.css">
    <link rel="stylesheet" href="/static/default/wap/css/index/demos.css">
    <link rel="stylesheet" href="/static/default/wap/css/index/swiper-4.2.6.min.css">
    <link rel="stylesheet" href="/static/default/wap/css/index/jobDetails.css">
    <style>
        @media (min-width: 768px) {
            .row .col-33 {
                width: 29.333333333333332%;
            }
        }
    </style>
    <link href="/static/default/wap/css/index/layer.css" type="text/css" rel="styleSheet" id="layermcss">
</head>
<body>

<div class="page-group">
    <div id="page-nav-bar-labels" class="page page-current">

        <div class="content native-scroll">
            <div class="button-back">
                <img src="__STATIC__/images/niuzhi/back.png">
            </div>
            <div id="roll_banner">
                <div class="swiper-container swiper-container-horizontal swiper-container-android"
                     data-space-between="10">
                    <div class="swiper-wrapper"
                         style="transform: translate3d(-1920px, 0px, 0px); transition-duration: 0ms;">
                        <?php if(is_array($job_images)): foreach($job_images as $key=>$v): ?><div class="swiper-slide" data-swiper-slide-index="<?php echo ($index); ?>" style="width: 480px;">
                                <img src="<?php echo ($v['image_url']); ?>" width="100%">
                            </div><?php endforeach; endif; ?>
                    </div>
                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                </div>
                <div class="swiper-pagination swiper-pagination-bullets">
                    <span class="swiper-pagination-bullet"></span>
                    <span class="swiper-pagination-bullet"></span>
                    <span class="swiper-pagination-bullet"></span>
                    <span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
                </div>
            </div>

            <div class="item-prodesc">
                <div class="item-company">
                    <div class="item-company-box">
                        <p class="name"><?php echo ($job_info["company_name"]); ?></p>
                    </div>

                    <p class="job-tag">
                        <?php if(is_array($job_tags)): foreach($job_tags as $key=>$v): ?><span><?php echo ($v); ?></span><?php endforeach; endif; ?>
                    </p>

                    <div class="price">
                        <span class="price-tag">
                            <span style="font-size: .65rem;color: #5e5e5e;font-weight:normal">厂发薪资：</span>
                            <?php if($job_info["job_subsidy"] > 0): echo ($job_info["job_price_month"]); echo ($job_info["job_price_month_unit"]); ?>
                            <?php else: ?>
                                <?php echo ($job_info["job_price_hour"]); echo ($job_info["job_price_hour_unit"]); endif; ?>
                        </span>
                        <span class="sign-num"> 已报名<?php echo ($jion_count); ?>人 </span>
                    </div>
                    <div class="nz-tag guarantee-question">
                        <div class="niuzhi-tag tag-item">平台保障</div>
                        <div class="tag-content">
                            <div>
                                <img src="__STATIC__/images/niuzhi/guarantee-hook.png">
                                <div>安全保障</div>
                            </div>
                            <div>
                                <img src="__STATIC__/images/niuzhi/guarantee-hook.png">
                                <div>工资保障</div>
                            </div>
                            <div>
                                <img src="__STATIC__/images/niuzhi/guarantee-hook.png">
                                <div>补贴保障</div>
                            </div>
                        </div>
                        <div class="tag-jump">
                            <img src="__STATIC__/images/niuzhi/guarantee-right.png">
                        </div>
                    </div>
                    <div class="jobInfo-fee">
                    </div>
                </div>

                <div class="item-common">
                    <div class="card jobInfo-card">
                        <div class="card-header-color">平台补贴
                        </div>
                        <div class="card-content s-bt">
                            <div class=" s-bt-content card-content-inner">
                                <p>
                                </p>
                                <p>
                                    <span class="subsidy-detail" style="margin-left: 0;">
                                        <?php echo ($sub_sidy[0][job_subsidy_desc]); ?>：<?php echo ($sub_sidy[0][job_subsidy]); echo ($sub_sidy[0][job_subsidy_unit]); ?>
                                    </span>
                                </p>

                                <p class="subsidy-content">
                                    <?php echo ($sub_sidy[0][job_subsidy_start]); ?>
                                </p>
                                <p class="subsidy-content">
                                    <?php echo ($sub_sidy[0][job_subsidy_time]); ?>
                                </p>
                                <p class="subsidy-content">备注：<?php echo ($sub_sidy[0][job_subsidy_qualify]); ?></p>
                            </div>
                            <div class="card-content-inner s-btls-content">
                                <?php if(is_array($sub_sidy)): foreach($sub_sidy as $key=>$v): if($index > 0): ?><p class="subsidy">补贴：</p>
                                        <p class="subsidy-content">
                                            <?php echo ($v["job_subsidy_start"]); ?>
                                        </p>
                                        <p class="subsidy-content">
                                            <?php echo ($v["job_subsidy_time"]); ?>
                                        </p>
                                        <p class="subsidy-content">备注：<?php echo ($v["job_subsidy_qualify"]); ?></p><?php endif; endforeach; endif; ?>

                            </div>
                        </div>

                        <div class="s-bt-btn">查看所有补贴</div>
                    </div>
                    <div class="card jobInfo-card">
                        <div class="card-header-color">薪资福利</div>
                        <div class="card-content">
                            <div class="card-content-inner">
                                <?php if(is_array($desc_all)): foreach($desc_all as $key=>$desc): if($key < 5): ?><p>
                                            <br>
                                        </p>
                                        <?php if(is_array($desc)): foreach($desc as $key=>$v): ?><p>
                                                <?php if($v["is_strong"] == 1): ?><b><?php endif; ?>
                                                <?php if($v["content_index"] == 1): echo ($key); ?>、<?php endif; ?>
                                                <?php if($v["content_title"] != ''): echo ($v["content_title"]); ?>：<?php endif; ?>
                                                <?php echo ($v["content"]); ?>
                                                <?php if($v["is_strong"] == 1): ?></b><?php endif; ?>
                                            </p><?php endforeach; endif; endif; endforeach; endif; ?>
                            </div>
                        </div>
                    </div>

                    <div class="card jobInfo-card">
                        <div class="card-header-color">录用条件</div>
                        <div class="card-content">
                            <div class="card-content-inner">
                                <?php if(is_array($desc_all)): foreach($desc_all as $key=>$desc): if($key == 5): ?><p>
                                            <br>
                                        </p>
                                        <?php if(is_array($desc)): foreach($desc as $key=>$v): ?><p>
                                                <?php if($v["is_strong"] == 1): ?><b><?php endif; ?>
                                                <?php if($v["content_index"] == 1): echo ($key); ?>、<?php endif; ?>
                                                <?php if($v["content_title"] != ''): echo ($v["content_title"]); ?>：<?php endif; ?>
                                                <?php echo ($v["content"]); ?>
                                                <?php if($v["is_strong"] == 1): ?></b><?php endif; ?>
                                            </p><?php endforeach; endif; endif; endforeach; endif; ?>
                            </div>
                        </div>
                    </div>

                    <div class="card jobInfo-card">
                        <div class="card-header-color">岗位介绍</div>
                        <div class="card-content">
                            <div class="card-content-inner">
                                <?php if(is_array($desc_all)): foreach($desc_all as $key=>$desc): if($key == 6): ?><p>
                                            <br>
                                        </p>
                                        <?php if(is_array($desc)): foreach($desc as $key=>$v): ?><p>
                                                <?php if($v["is_strong"] == 1): ?><b><?php endif; ?>
                                                <?php if($v["content_index"] == 1): echo ($key); ?>、<?php endif; ?>
                                                <?php if($v["content_title"] != ''): echo ($v["content_title"]); ?>：<?php endif; ?>
                                                <?php echo ($v["content"]); ?>
                                                <?php if($v["is_strong"] == 1): ?></b><?php endif; ?>
                                            </p><?php endforeach; endif; endif; endforeach; endif; ?>
                            </div>
                        </div>
                    </div>

                    <div class="card jobInfo-card">
                        <div class="card-header-color">公司介绍</div>
                        <div class="card-content">
                            <div class="card-content-inner">
                                <?php if(is_array($desc_all)): foreach($desc_all as $key=>$desc): if($key == 7): ?><p>
                                            <br>
                                        </p>
                                        <?php if(is_array($desc)): foreach($desc as $key=>$v): ?><p>
                                                <?php if($v["is_strong"] == 1): ?><b><?php endif; ?>
                                                <?php if($v["content_index"] == 1): echo ($key); ?>、<?php endif; ?>
                                                <?php if($v["content_title"] != ''): echo ($v["content_title"]); ?>：<?php endif; ?>
                                                <?php echo ($v["content"]); ?>
                                                <?php if($v["is_strong"] == 1): ?></b><?php endif; ?>
                                            </p><?php endforeach; endif; endif; endforeach; endif; ?>
                            </div>
                        </div>
                    </div>
                    <div class="card jobInfo-card">
                        <div class="card-header-color">面试地址</div>
                        <div class="card-content">
                            <div class="navigation">
                                <a class="external" id="go-navigation">
                                    <!--                                   href="https://apis.map.qq.com/tools/poimarker?type=0&amp;marker=coord:31.1595191956,121.6330871582;title:%E6%98%8C%E7%A1%95%E7%A7%91%E6%8A%80(%E4%B8%8A%E6%B5%B7)%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8;addr:%E4%B8%AD%E5%9B%BD%E4%B8%8A%E6%B5%B7%E5%B8%82%E4%B8%8A%E6%B5%B7%E5%B8%82%E6%B5%A6%E4%B8%9C%E6%96%B0%E5%8C%BA%E7%94%B3%E6%B2%94%E8%B7%AF&amp;key=JTCBZ-VGHKQ-QLZ5J-G4YC3-B5EHJ-R4BZV&amp;referer=nzJob">-->

                                    <div class="address-detail">中国上海市上海市浦东新区申沔路</div>
                                    <div class="address-city">上海市&nbsp;&nbsp;浦东新区</div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card jobInfo-card">
                        <div class="card-header-color">入职流程</div>
                        <div class="card-content">
                            <div class="entry-process">
                                <div>
                                    <div><img src="__STATIC__/images/niuzhi/apply.png"></div>
                                    <div>报名</div>
                                    <div>选择免费报名<br>或vip报名</div>
                                </div>
                                <div>
                                    <div><img src="__STATIC__/images/niuzhi/start.png"></div>
                                    <div>发车</div>
                                    <div>准确时间与<br>地点上车</div>
                                </div>
                                <div>
                                    <div><img src="__STATIC__/images/niuzhi/interview.png"></div>
                                    <div>面试</div>
                                    <div>面试合格在规<br>定时间入职</div>
                                </div>
                                <div>
                                    <div><img src="__STATIC__/images/niuzhi/entry.png"></div>
                                    <div>入职</div>
                                    <div>入职后<br>上传工牌</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card jobInfo-card">
                        <div class="card-header-color">平台温馨提示</div>
                        <div class="card-content">
                            <div class="card-content-inner">
                                <?php if(is_array($desc_all)): foreach($desc_all as $key=>$desc): if($key == 9): if(is_array($desc)): foreach($desc as $index=>$v): ?><p>
                                                <?php if($v["is_strong"] == 1): ?><b><?php endif; ?>
                                                <?php if($v["content_index"] == 1): echo ($index+1); ?>、<?php endif; ?>
                                                <?php if($v["content_title"] != ''): echo ($v["content_title"]); ?>：<?php endif; ?>
                                                <?php echo ($v["content"]); ?>
                                                <?php if($v["is_strong"] == 1): ?></b><?php endif; ?>
                                            </p><?php endforeach; endif; ?>
                                        <br><?php endif; endforeach; endif; ?>
                                平台工作网，让求职者高薪就业。平台提供的所有岗位真实可靠，如有虚标工价/返费，平台双倍赔付。<br>
                                <a class="btn-call" href="tel:4008291113">客服电话：XXXX-XXX-XXX</a>
                            </div>
                        </div>
                    </div>
                    <div id="random-job" class="card jobInfo-card" style="display: block;">
                        <div class="card-header-color">猜你喜欢</div>
                        <div class="card-content">
                            <div class="row">
                                <?php if(is_array($like_jobs)): foreach($like_jobs as $key=>$v): ?><div id="recommendJob" class="col-33" onclick="jobinfo(<?php echo ($v["job_id"]); ?>)"><img
                                            src="<?php echo ($v["job_img_url"]); ?>">
                                        <div class="random-job-saradjlskjdflskdjfy"><span>
                                            <?php echo ($v["job_price_month"]); echo ($v["job_price_month_unit"]); ?>
                                        </span></div>
                                        <div class="random-job-title"><?php echo ($v["job_name"]); ?></div>
                                    </div><?php endforeach; endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="foot-bottom">
        <div id="apply-btn">
            <input type="hidden" value="510" id="jobInfoId">
            <input type="hidden" value="" id="bath">

            <div class="footer-action">
                <img class="icon-follow" id="followJobImg" src="__STATIC__/images/niuzhi/unfollowed.png">
                <a href="#"
                   id="followJob" class="button">关注</a>
            </div>
<!--                已关注样式-->
<!--            <div class="footer-action">-->
<!--                <img class="icon-follow" id="cancelFollowJobImg" src="/static/images/followed.png"></img>-->
<!--                <a href="#" id="cancelFollowJob" class="button"> 取消</a>-->
<!--            </div>-->

<!--                已报名-->
<!--            <div id="processed"><a href="#" disabled>已处理</a></div>-->
<!--            <div id="goShare">-->
<!--                <a href="#" disabled>分享成为VIP</a>-->
<!--            </div>-->

            <div id="register">
                <a href="<?php echo U('wap/Job/jobRegister',array('job_id'=>$job_info.job_id,'vip_sign_up'=>'0'));?>">
                    <div><?php echo ($bottom_price); ?></div>
                    免费报名
                </a>
            </div>

            <div id="confirmSpell">
                <a href="<?php echo U('wap/Job/jobRegister',array('job_id'=>$job_info.job_id,'vip_sign_up'=>'1'));?>">
                    <div><?php echo ($bottom_price_vip); ?></div>
                    VIP拿高价
                </a>
            </div>
        </div>
    </div>

    <div id="share-dimmer">
        <img src="__STATIC__/images/niuzhi/share.gif">
    </div>
</div>

<div class="nav-index-foat risk">
    <p class="nav-index-text">
        <a href="<?php echo U('wap/job/vipRouter');?>" class="external">
            <img src="/static/default/wap/image/index/vip-img.png" style="width:1.2rem;height:1.2rem"><br>VIP</a>
    </p>
</div>

<!--<div class="nav-index-foat">-->
<!--    <p class="nav-index-text">-->
<!--        <a href="javascript:;" class="external" id="free-external">免费<br>咨询</a>-->
<!--    </p>-->
<!--</div>-->

<!--
    <div id="layer-code">
        <div class="qr-code">
            <img src="/static/images/nzjob-qrcode.jpg">
            <p>长按图片识别图中二维码</p>
            <p>关注微信公众号</p>
        </div>
        <div class="close">
            &times;
        </div>
    </div>
 -->

<div class="guarantee-layer">
    <div id="guarantee">
        <div class="guarantee-header">平台保障</div>
        <div class="guarantee-body">
            <div class="guarantee-body-item">
                <img class="item-icon" src="__STATIC__/images/niuzhi/guarantee-safe.png">
                <div class="item-content">
                    <div class="item-title">安全保障</div>
                    <div class="item-text">所有岗位均经平台审核且为求职者购买保险</div>
                </div>
            </div>
            <div class="guarantee-body-item">
                <img class="item-icon" src="__STATIC__/images/niuzhi/guarantee-salary.png">
                <div class="item-content">
                    <div class="item-title">工资保障</div>
                    <div class="item-text">正常离职不扣款不降价，工资一分不少</div>
                </div>
            </div>
            <div class="guarantee-body-item">
                <img class="item-icon" src="__STATIC__/images/niuzhi/guarantee-subsidy.png">
                <div class="item-content">
                    <div class="item-title">补贴保障</div>
                    <div class="item-text">补贴不经过中介，平台直接发放</div>
                </div>
            </div>
        </div>

        <div class="close-guarantee-btn">
            <img src="__STATIC__/images/niuzhi/subsidy-close.png">
        </div>
    </div>
</div>


<script>
    UVSetCookie("scrollTopFlag", "true", null);
    var jobName = $("#jobName").val();

    function jobinfo(jobid){
        location.href = "http://www.zhaopin.com/index.php/Mobile/Job/jobInfo/job_id/"+jobid+".html";
    }
</script>


</body>
</html>