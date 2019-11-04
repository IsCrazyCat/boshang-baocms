<?php
$mysql_server_name='127.0.0.1'; //改成自己的mysql数据库服务器
$mysql_username='aihuaqian_bs_com'; //改成自己的mysql数据库用户名
$mysql_password='6a8f0e1420d5'; //改成自己的mysql数据库密码
$mysql_database='aihuaqian_boshang3710_com'; //改成自己的mysql数据库名
$conn=mysql_connect($mysql_server_name,$mysql_username,$mysql_password) or die("error connecting") ; //连接数据库
mysql_select_db($mysql_database); //打开数据库 $_W['os'] 



?>
