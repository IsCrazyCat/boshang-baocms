<?php if (!defined('THINK_PATH')) exit(); if(is_array($list)): foreach($list as $key=>$item): ?><li class="line">
        <dt>
            <a class="x3">ID：<?php echo ($item['user_id']); ?></a>
            <a class="x9 text-right">注册时间：<?php echo (date('Y-m-d H:i',$item["reg_time"])); ?> </a>
        </dt>
        
          <dd class="zhong">
                <div class="x12">
                    <p> 账户：<?php echo ($item['account']); ?></p>
                    <p> 昵称：<?php echo ($item['nickname']); ?></p>
                    <p class="text-small">
                        会员等级：
                        <?php if(empty($item['rank_id']) != true ): echo ($ranks[$item['rank_id']]['rank_name']); ?>
                        <?php else: ?>
                            无等级<?php endif; ?>
                    </p>
              </div>
          </dd>
    </li>
    <div class="blank-10 bg"></div><?php endforeach; endif; ?>