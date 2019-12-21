<?php if (!defined('THINK_PATH')) exit(); if(is_array($list)): $index = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($index % 2 );++$index; $shop = D('Shop')->find($item['shop_id']); ?>
    <li>
        <a href="<?php echo U('mall/detail',array('goods_id'=>$item['goods_id']));?>">
            <div class="item-image">
                <img src="<?php echo config_img($item['photo']);?>" width="100%">
            </div>
            <div class="item-inner">
                <div>
                    <p class="item-number" title="<?php echo ($item["job_name"]); ?>">
                        <?php echo ($item["title"]); ?>
                    </p>
                </div>
                <p class="index-item-subtitle">
                    <?php echo ($item["guige"]); ?>
                </p>
                <div class="item-price-row">
                    <p class="price-price" style="padding-bottom: 10px">
                        <span>4000-6000</span>
                        元/月
                    </p>
                </div>
                <div class="item-amount">
                    <p class="hot-mark ">
<!--                        <?php if($item["show_price_type"] < 2): ?>-->
<!--                            工价-->
<!--                            <?php else: ?>-->
<!--                            补贴-->
<!--<?php endif; ?>-->
                        <?php echo ($item['price_title']); ?>
                    </p>
                    <p><?php echo round($item['price']/100,2); echo ($item['price_unit']); ?></p>
                </div>
            </div>
        </a>
    </li><?php endforeach; endif; else: echo "" ;endif; ?>