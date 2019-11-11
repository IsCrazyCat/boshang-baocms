<?php


/**
 * 定时任务类
 * Class CronTabAction
 */
class CronTabAction
{
    public function __construct()
    {
        set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__);
        spl_autoload_register(function ($class_name) {
            //需要将引入的文件全部小写
            spl_autoload($class_name, '.php');
        });
    }

    /**
     * 购买会员卡返现
     */
    public function back_money()
    {
        $crons = D('CronBackmoney')->where(array('closed' => 0, 'status' => array('IN', '0,1')))->select();
        foreach ($crons as $key => $cron) {
            //获取总的执行次数，即多少次返现完毕
            $cronLogs = D('CronLog')->where(array('cron_id' => $cron['cron_id'], 'closed' => 0, 'status' => 0))->select();
            $suc_count = count($cronLogs);//定时任务成功执行次数即成功返现次数
            $cron_status = 1;//该定时任务的执行状态， 1执行中
            if ($suc_count == $cron['back_num']) {
                //执行成功次数 = 定时任务设定次数 定时任务结束
                $cron_status = 2;
            }
            $suc_money = 0;//当前返现成功总金额
            $suc_percentage = 0;
            foreach ($cronLogs as $lkey => $log) {
                if (empty($cron['back_percentage'])) {
                    //百分比为空 说明是设置的每次返现金额
                    $suc_money += $log['back_data'];
                } else {
                    $suc_percentage += $log['back_percentage'];
                }
            }
            if (empty($cron['back_percentage'])) {
                //返现金额大于总返现金额 定时任务结束
                if ((int)$suc_money >= (int)$cron['money']) {
                    $cron_status = 2;
                }
            } else {
                //返现百分比 到达100% 定时任务结束
                if ((int)$suc_percentage >= 100) {
                    $cron_status = 2;
                }
            }
            D('CronBackmoney')->save(array('cron_id' => $cron['cron_id'], 'status' => $cron_status));
            if ($cron_status == 2) {
                //本次任务结束
                continue;
            }

            //进行返现 返现至指定用户余额中
            $back_money = 0;
            if (empty($cron['back_percentage'])) {
                $back_money = ((int)$cron['money']) * ((int)$cron['back_percentage']) / 100;
            } else {
                $back_money = $cron['back_money'];
            }
            $cur_user = D('users')->find($cron['user_id']);
            //增加用户余额
            $result = D('users')->save(array('user_id' => $cron['user_id'], 'money' => ($cur_user['money'] + $back_money)));
            if ($result) {
                //增加余额成功 记录用户余额变更日志
                $userlogdata['user_id'] = $cron['user_id'];
                $userlogdata['money'] = $cur_user['money'] + $back_money;
                $userlogdata['intro'] = '定时任务：' . $cron['cron_id'] . ',返现:' . $back_money . '元';
                $userlogdata['create_time'] = time();
                $userlogdata['create_ip'] = get_client_ip();
                D('Usermoneylogs')->add($userlogdata);
                //记录任务执行日志
                $cronlogdata['cron_id'] = $cron['cron_id'];
                $cronlogdata['user_id'] = $cron['user_id'];
                $cronlogdata['back_data'] = $back_money;
                $cronlogdata['back_percentage'] = $cron['back_percentage'];
                $cronlogdata['status'] = 0;
                $cronlogdata['create_time'] = time();
                D('CronLog')->add($cronlogdata);
            } else {
                //记录任务执行日志
                $cronlogdata['cron_id'] = $cron['cron_id'];
                $cronlogdata['user_id'] = $cron['user_id'];
                $cronlogdata['back_data'] = $back_money;
                $cronlogdata['back_percentage'] = $cron['back_percentage'];
                $cronlogdata['status'] = 1;
                $cronlogdata['msg'] = '失败';
                $cronlogdata['err_msg'] = '用户余额增加失败';
                $cronlogdata['create_time'] = time();
                D('CronLog')->add($cronlogdata);
            }
        }

    }

    public function test()
    {
        exit("test");
    }
}
