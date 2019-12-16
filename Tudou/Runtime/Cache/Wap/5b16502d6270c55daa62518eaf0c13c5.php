<?php if (!defined('THINK_PATH')) exit(); if(is_array($goods)): foreach($goods as $key=>$v): ?><li>
		<a href="<?php echo U('wap/mall/detail',array('goods_id'=>$v['goods_id']));?>"
		   class="">
			<div class="item-image">
				<img src="<?php echo ($v['photo']); ?>" width="100%">
			</div>
			<div class="item-inner">
				<div>
					<p class="item-number" title="<?php echo ($v["title"]); ?>">
						<?php echo ($v["title"]); ?>
					</p>
				</div>
				<p class="index-item-subtitle">
					<?php echo ($v["guige"]); ?>
				</p>
				<div class="item-price-row">
					<p class="price-price" style="padding-bottom: 10px">
						<span><?php echo ($v["price_month"]); ?></span>
						元/月
					</p>
				</div>
				<div class="item-amount">
					<p class="hot-mark ">
						<?php if($v["show_price_type"] < 2): ?>工价
							<?php else: ?>
							补贴<?php endif; ?>
					</p>
					<p><?php echo round($v['price']/100,2); echo ($v['price_unit']); ?></p>
				</div>
			</div>
		</a>
	</li><?php endforeach; endif; ?>