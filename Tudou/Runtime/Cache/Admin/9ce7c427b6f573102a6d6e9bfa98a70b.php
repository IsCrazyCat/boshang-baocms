<?php if (!defined('THINK_PATH')) exit();?><div class="listBox clfx">
    <div class="menuManage">
        <form target="x-frame" action="<?php echo U('userrank/edit',array('rank_id'=>$detail['rank_id']));?>" method="post">
            <div class="mainScAdd">
                <div class="tableBox">
                    <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;" >
                        <tr>
                            <td class="lfTdBt">等级名称：</td>
                            <td class="rgTdBt"><input type="text" name="data[rank_name]" value="<?php echo (($detail["rank_name"])?($detail["rank_name"]):''); ?>" class="scAddTextName w150" />
                            </td>
                        </tr>
                         <tr>
                            <td class="lfTdBt">购买金额：</td>
                            <td class="rgTdBt"><input type="text" name="data[price]" value="<?php echo round($detail['price']/100,2);?>" class="scAddTextName w150" />
                                <code>购买等级需要金额，全局设置开启会员等级购买后有效，跟分销关联，需要分成请到分销配置里面开启会员购买等级分成</code>
                            </td>
                        </tr>
                        <tr>
                            <td class="lfTdBt">等级推广奖励：</td>
                            <td class="rgTdBt"><input type="text" name="data[reward]" value="<?php echo (($detail["reward"])?($detail["reward"]):''); ?>" class="scAddTextName w80" />
                                <code></code>
                            </td>
                        </tr>
                        <tr>
                            <td class="lfTdBt">推荐人奖励：</td>
                            <td class="rgTdBt"><input type="text" name="data[leader_reward]" value="<?php echo (($detail["leader_reward"])?($detail["leader_reward"]):''); ?>" class="scAddTextName w80" />
                                <code>升级到该等级后，上级推荐人所获得的奖励</code>
                            </td>
                        </tr>
                        <tr>
                            <td class="lfTdBt">等级描述：</td>
                            <td class="rgTdBt">
                                <textarea type="text" name="data[desc]" value="<?php echo (($detail["rank_desc"])?($detail["rank_desc"]):''); ?>" class="scAddTextName" />
                            </td>
                        </tr>
                        <tr>
                            <td class="lfTdBt">备注：</td>
                            <td class="rgTdBt">
                                <textarea type="text" name="data[remark]" value="<?php echo (($detail["rank_remark"])?($detail["rank_remark"]):''); ?>" class="scAddTextName" />
                            </td>
                        </tr>
                        
                    </table>
                </div>
                <div class="smtQr"><input type="submit" value="确定编辑" class="smtQrIpt" /></div>
            </div>
        </form>
    </div>
</div>