<?php 


$shop_id = isset($_GET['shop_id']) ? $_GET['shop_id'] : 0;

if ( (int)$shop_id > 0 ) {
	
include 'phpqrcode.php';




$con = mysql_connect("127.0.0.1","aihuaqian_bs_com","6a8f0e1420d5");
if (!$con)
{
  	die('Could not connect: ' . mysql_error());
}
mysql_select_db("aihuaqian_boshang3710_com", $con);

mysql_query("set names 'UTF8'"); //数据库输出编码 应该与你的数据库编码保持一致.


$sql =" select logo from bao_shop where  shop_id =  '". $shop_id ."' " ;
$result = mysql_query($sql,$con); //查询
while($rs = mysql_fetch_array($result))
{
	$logo = 'http://aihuaqian.boshang3710.com/'.$rs['logo'];
}

$value = 'http://aihuaqian.boshang3710.com/User/money/myindex/shop_id/'.$shop_id; //二维码内容
$errorCorrectionLevel = 'L';//容错级别
$matrixPointSize = 7;//生成图片大小
//生成二维码图片
QRcode::png($value, 'qrcode.png', $errorCorrectionLevel, $matrixPointSize, 2);
//$logo = 'http://aihuaqian.boshang3710.com/attachs/2019/05/13/thumb_5cd93c2390e12.JPG';//准备好的logo图片
$QR = 'qrcode.png';//已经生成的原始二维码图
   
if ($logo !== FALSE) {
 $QR = imagecreatefromstring(file_get_contents($QR));
 $logo = imagecreatefromstring(file_get_contents($logo));
 $QR_width = imagesx($QR);//二维码图片宽度
 $QR_height = imagesy($QR);//二维码图片高度
 $logo_width = imagesx($logo);//logo图片宽度
 $logo_height = imagesy($logo);//logo图片高度
 $logo_qr_width = $QR_width / 5;
 $scale = $logo_width/$logo_qr_width;
 $logo_qr_height = $logo_height/$scale;
 $from_width = ($QR_width - $logo_qr_width) / 2;
 //重新组合图片并调整大小
 imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width,
 $logo_qr_height, $logo_width, $logo_height);
}
//输出图片
imagepng($QR, 'helloweba.png');
echo '<div style="width:100%; margin:auto 0; text-align:center;"><img src="helloweba.png"></a>';

}