<!DOCTYPE HTML>
<html>
<head>
<title>恭喜您 获得随机免单</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
    <meta content="telephone=no" name="format-detection" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta content="" name="keywords">
    <meta content="" name="description">
	 
    <link rel="stylesheet" href="css/register-wap.css" />
</head>

<body style="margin:0px; padding:0px; background-color:#000; color:#FFF;">
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td>&nbsp;</td>
    <td><?php 
header("Content-Type: text/html; charset=UTF-8");

$con = mysql_connect("127.0.0.1","aihuaqian_bs_com","6a8f0e1420d5");
if (!$con)
{
  	die('Could not connect: ' . mysql_error());
}
mysql_select_db("aihuaqian_boshang3710_com", $con);

mysql_query("set names 'UTF8'"); //数据库输出编码 应该与你的数据库编码保持一致.


$my_log_id = isset($_SESSION['my_log_id']) ? $_SESSION['my_log_id'] : 0;
$my_uid = isset($_SESSION['my_uid']) ? $_SESSION['my_uid'] : 0;

$my_log_id = isset($_GET['log_id']) ? $_GET['log_id'] : 0;

//'ding_price'=>sprintf("%.2f",$ding_price/100);
$ismiandan=0;
if (  (int)$my_log_id > 0  ) {    
	
		 
		$sql ="select * from `bao_payment_logs` where log_id = '".$my_log_id."'   "; //SQL语句
		$result = mysql_query($sql,$con); //查询
		while($rs = mysql_fetch_array($result)) {
			
			if ( $rs['ismiandan'] == 1 ) {
				echo '支付ID:'.$rs['log_id'].' 支付时间:'.date("Y-m-d H:i:s",$rs['pay_time']).'<br>'.'姓名:'.$rs['youname'].' '.'手机:'.$rs['youmobile'].'<br>';
			}
			$ismiandan=(int)$rs['ismiandan'];
			$sql1 ="select * from `bao_users` where user_id = '".$rs['user_id']."'   "; //SQL语句
			$result1 = mysql_query($sql1,$con); //查询
			while($rs1 = mysql_fetch_array($result1)) { 
				echo '微信昵称:'.$rs1['nickname'].' '.'用户ID:'.$rs1['user_id'].'<br>';
			} 
			
			
		}
		
		
}

	

mysql_free_result($result); //关闭数据集
mysql_close($con); //关闭MySQL连接

?></td>
    <td>&nbsp;</td>
  </tr>
</table>

<img src="<?php  if ($ismiandan == 1){ echo 'zhongjiang.jpg';} else { echo 'weizhongjiang.jpg'; } ?>" border="0"  class="img" usemap="#mymap" onclick="window.location.href='http://aihuaqian.boshang3710.com/wap/payment/yes/log_id/<?php echo $my_log_id;?>.html'" />


</body>

</html>
<style type="text/css">
.img{display: block;
height: auto;
max-width: 100%;}
</style>