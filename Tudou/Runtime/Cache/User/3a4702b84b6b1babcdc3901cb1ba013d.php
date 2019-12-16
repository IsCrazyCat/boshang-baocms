<?php if (!defined('THINK_PATH')) exit();?>
<?php if(is_array($list)): foreach($list as $key=>$job): ?><li class="apply-item">
        <div class="item-title">
            <?php if($job['cancal'] == 0): ?><div class="cancel">已取消</div>
            <?php elseif($job['audit'] == 0): ?>
                <div class="apply">审核中</div>
            <?php elseif($job['audit'] == 1): ?>
                <div class="apply">已审核</div>
            <?php elseif($job['audit'] == 2): ?>
                <div class="cancel">审核失败</div><?php endif; ?>
        </div>
        <div class="item-content clear-both-after">
            <div class="content-img">
                <div class="img-div">
                    <img style="width: 100%; height: 100%;" src="/static/default/wap/image/job/516da779-a7cc-4df3-984e-c83b4f8a8247-1557624439233.jpg" alt="">
                </div>
            </div>
            <div class="content-text">
                <div class="content-item-title">
                    <?php echo ($job['good']['title']); ?>
                </div>
                <div class="content-item-text">
                    <span class="text-title">薪资待遇：</span>

                    <span class="text-text">
                                                    <span class="price"><?php echo round($job['good']['price']/100,2);?></span>
                                                    <span class="price-unit">
                                                        <?php echo ($job['good']['price_unit']); ?>
                                                    </span>
                                                </span>
                </div>
                <div class="content-item-text show-job-detail" onclick="location='<?php echo U('wap/mall/detail',array('goods_id'=>$job['goods_id']));?>'">
                    <span>查看工作详情</span>
                    <img src="/static/default/wap/image/job/apply-right.png">
                </div>
            </div>
        </div>
        <div class="item-detail">
            <div>
                <div>招聘企业</div>
                <div><a href="<?php echo U('wap/shop/detail',array('shop_id'=>$job['shop']['shop_id']));?>"><?php echo ($job['shop']['shop_name']); ?></a></div>
            </div>
            <div>
                <div>每月薪资</div>
                <div><?php echo ($job['good']['price_month']); ?>元/月</div>
            </div>
            <div>
                <div>报名时间</div>
                <div><?php echo (date('Y-m-d H:i:s',$job["creat_time"])); ?></div>
            </div>
        </div>
        <div class="item-footer clear-both-after">
            <div class="item-btn btn-4 vip-share" data-invite="000oMc" onclick="location='<?php echo U('wap/job/vipRouter');?>'">
                VIP高价
            </div>
            <div class="item-btn btn-4 perfect-information" onclick="location='<?php echo U('user/usersaux/index');?>'">
                完善信息
            </div>
            <?php if($job['audit'] == 0): ?><div class="item-btn btn-4 cancel-apply" onclick="location='<?php echo U('user/job/jobCanalSign',array('goods_id'=>$job['goods_id'],'apply_id'=>$job['id']));?>'">
                    取消报名
                </div><?php endif; ?>
        </div>
    </li>
    <div class="blank-10 bg"></div><?php endforeach; endif; ?>