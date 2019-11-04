<?php 

ini_set('date.timezone','Asia/Shanghai');
header("Content-Type: text/html;charset=utf-8"); 

require_once("../themes/default/confige.php"); 
mysql_query("set names 'UTF8'"); //数据库输出编码 应该与你的数据库编码保持一致.

//0 未发货 1 待发货 2 已发货（待收货） 3 已收货（确认收货）

$order_id = isset($_POST['order_id']) ? $_POST['order_id'] : 0;
$status = isset($_POST['status']) ? $_POST['status'] : 0;

if ( (int)$order_id > 0 ) {
	mysql_query("UPDATE bao_order SET status = '{$status}' WHERE  order_id = '{$order_id}' ");
	mysql_query("UPDATE bao_order_goods SET status = '{$status}' WHERE  order_id = '{$order_id}' ");
	echo 1;
}  else {
	echo 0;
}

//mysql_free_result($result); //关闭数据集

mysql_close(); //关闭MySQL连接

?>


