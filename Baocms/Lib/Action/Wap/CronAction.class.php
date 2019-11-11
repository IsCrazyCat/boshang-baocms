<?php



class CronAction extends CommonAction {

    public function _initialize() {
        require  BASE_PATH.'/'.APP_NAME.'/lib/Action/Wap/cron/crontab.php';
    }

    public function index() {
        $this->display(); // 输出模板
    }
    public function active(){
        $cron   = new Crontab();
        $active = $cron->listJobs();
        echo json_encode($active);
    }
    public function add(){

        $cron = new Crontab();

        if (isset($_POST['minute']) && $_POST['minute'] != '') $cron->onMinute($_POST['minute']);
        if (isset($_POST['hour']) && $_POST['hour'] != '') $cron->onHour($_POST['hour']);
        if (isset($_POST['month']) && $_POST['month'] != '') $cron->onMonth($_POST['month']);
        if (isset($_POST['dayweek']) && $_POST['dayweek'] != '') $cron->onDayOfWeek($_POST['dayweek']);
        if (isset($_POST['daymonth']) && $_POST['daymonth'] != '') $cron->onDayOfMonth($_POST['daymonth']);
        if (isset($_POST['command']) && $_POST['command'] != '') $cron->doJob($_POST['command']);

        if ($cron->activate())
        {
            echo json_encode($cron);
        }
        else
        {
            echo FALSE;
        }
    }
    public function deleteall(){
        $cron = new Crontab();
        $cron->deleteAllJobs();
    }
    public function deletejob(){

        $cron = new Crontab();
        $cron->deleteJob($_POST['jobid']);
    }
}
