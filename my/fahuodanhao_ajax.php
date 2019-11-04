<?php 
ini_set('date.timezone','Asia/Shanghai');
header("Content-Type: text/html;charset=utf-8"); 

require_once("../themes/default/confige.php"); 
mysql_query("set names 'UTF8'"); //数据库输出编码 应该与你的数据库编码保持一致.


$order_id = isset($_POST['order_id']) ? $_POST['order_id'] : 0;
$fahuodanhao = isset($_POST['fahuodanhao']) ? $_POST['fahuodanhao'] : '';
$fahuodanhao = trim($fahuodanhao);

if ( (int)$order_id > 0 ) {
	mysql_query("UPDATE bao_order SET fahuodanhao = '{$fahuodanhao}' WHERE  order_id = '{$order_id}' ");
	echo 1;
}  else {
	echo 0;
}
//mysql_free_result($result); //关闭数据集

mysql_close(); //关闭MySQL连接

?>


