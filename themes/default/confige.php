<?php
$mysql_server_name='127.0.0.1'; //�ĳ��Լ���mysql���ݿ������
$mysql_username='aihuaqian_bs_com'; //�ĳ��Լ���mysql���ݿ��û���
$mysql_password='6a8f0e1420d5'; //�ĳ��Լ���mysql���ݿ�����
$mysql_database='aihuaqian_boshang3710_com'; //�ĳ��Լ���mysql���ݿ���
$conn=mysql_connect($mysql_server_name,$mysql_username,$mysql_password) or die("error connecting") ; //�������ݿ�
mysql_select_db($mysql_database); //�����ݿ� $_W['os'] 



?>
