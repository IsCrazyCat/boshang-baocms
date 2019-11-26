<?php if (!defined('THINK_PATH')) exit(); if(is_array($hot_jobs)): $index = 0; $__LIST__ = $hot_jobs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($index % 2 );++$index; $shop = D('Shop')->find($item['shop_id']); ?>
    <li>
        <a href="<?php echo U('wap/Job/detail',array('job_id'=>1));?>">
            <div class="item-image">
                <img src="/static/default/wap/image/index/joblogo.jpg" width="100%">
            </div>
            <div class="item-inner">
                <div>
                    <p class="item-number" title="<?php echo ($v["job_name"]); ?>">
                        <?php echo ($v["job_name"]); ?>
                    </p>
                </div>
                <p class="index-item-subtitle">
                    <?php echo ($v["job_tags"]); ?>
                </p>
                <div class="item-price-row">
                    <p class="price-price" style="padding-bottom: 10px">
                        <span><?php echo ($v["job_price_month"]); ?></span>
                        <?php echo ($v["job_price_month_unit"]); ?>
                    </p>
                </div>
                <div class="item-amount">
                    <?php if($v["is_recruit"] == 0): ?><p class="stop-mark">已停招</p>
                        <?php else: ?>
                        <p class="hot-mark ">
                            <?php if($v["show_price_type"] < 2): ?>工价
                                <?php else: ?>
                                补贴<?php endif; ?>
                        </p><?php endif; ?>
                    <?php if($v["show_price_type"] == 0): ?><p><?php echo ($v["job_price_hour"]); echo ($v["job_price_hour_unit"]); ?></p>
                        <?php elseif($v["show_price_type"] == 1): ?>
                        <p><?php echo ($v["job_price_day"]); echo ($v["job_price_day_unit"]); ?></p>
                        <?php elseif($v["show_price_type"] == 2): ?>
                        <p><?php echo ($v["job_subsidy_hour"]); echo ($v["job_subsidy_hour_unit"]); ?></p>
                        <?php elseif($v["show_price_type"] == 3): ?>
                        <p><?php echo ($v["job_subsidy_day"]); echo ($v["job_subsidy_day_unit"]); ?></p>
                        <?php elseif($v["show_price_type"] == 4): ?>
                        <p><?php echo ($v["job_subsidy_month"]); echo ($v["job_subsidy_month_unit"]); ?></p>
                        <?php else: ?>
                        <p><?php echo ($v["job_price_hour"]); echo ($v["job_price_hour_unit"]); ?></p><?php endif; ?>
                </div>
            </div>
        </a>
    </li><?php endforeach; endif; else: echo "" ;endif; ?>