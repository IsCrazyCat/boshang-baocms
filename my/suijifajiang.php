<?php

//随机发奖

header("Content-Type: text/html; charset=UTF-8");

$con = mysql_connect("127.0.0.1","aihuaqian_bs_com","6a8f0e1420d5");
if (!$con)
{
  	die('Could not connect: ' . mysql_error());
}
mysql_select_db("aihuaqian_boshang3710_com", $con);

mysql_query("set names 'UTF8'"); //数据库输出编码 应该与你的数据库编码保持一致.

	$dqtime = time(); //当前时间戳
	$dqdata = strtotime(date("Y-m-d",$dqtime)) ;  //当天零点时间戳
	$zrdata = strtotime(date("Y-m-d",$dqtime))-86400 ;  //昨天零点时间戳
    $jiangchi = 0 ;
	$count == 0;
	
	/*统计昨日奖池*/
	/*$sql =" select SUM(`need_pay`) as sum_need_pay from bao_payment_logs where  is_paid = 1 and pay_time >= '". $zrdata ."'  and pay_time < '". $dqdata ."' " ;
	$result = mysql_query($sql,$con); //查询
	while($rs = mysql_fetch_array($result))
	{
		//$jiangchi = round($rs['sum_need_pay']/100,2) ;
		$jiangchi = $rs['sum_need_pay'];
	}*/
	
	$sql =" select SUM(`gold`) as sum_gold from bao_user_ptgold_logs where   create_time >= '". $zrdata ."'  and create_time < '". $dqdata ."' " ;
	$result = mysql_query($sql,$con); //查询
	while($rs = mysql_fetch_array($result))
	{
		//$jiangchi = round($rs['sum_need_pay']/100,2) ;
		$jiangchi = $rs['sum_gold']*0.1;
	}
	
	
	/*统计昨日奖池*/
	
		
	//sql语句
	$sql="SELECT COUNT(*) AS count FROM bao_record where addtime = '{$dqdata}' ";
	//执行sql
	$query=mysql_query($sql,$con);
	//对结果进行判断
	if( mysql_num_rows( $query ) ){
		$rs=mysql_fetch_array($query);
	    $count=$rs[0];
	}
	if  ( $count == 0 ) {
		 mysql_query("INSERT INTO bao_record (addtime, fjsl, dqtime, jiangchi,fjzhong) 
	VALUES ('{$dqdata}', '0', '{$dqtime}', '{$jiangchi}', '0')");
	} 
	
				

mysql_free_result($result); //关闭数据集
mysql_close($con); //关闭MySQL连接

?>