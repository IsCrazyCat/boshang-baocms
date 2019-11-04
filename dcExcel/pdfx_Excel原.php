<?php
error_reporting(E_ALL);

//俺的添加 开始 9.13
$jobid = isset($_GET['jobid']) ? $_GET['jobid'] : '1';

 $cfg_dbhost = '127.0.0.1';
 $cfg_dbname = 'xinlingshou_weixinguanfang_com';
 $cfg_dbuser = 'xinlingshou_wx_c';
 $cfg_dbpwd = '34eb2d113444';
 $cfg_db_language = 'utf8';
 //链接数据库
 $link = mysql_connect($cfg_dbhost,$cfg_dbuser,$cfg_dbpwd);
 mysql_select_db($cfg_dbname);
 //选择编码
 mysql_query("set names ".$cfg_db_language);
 
 
$shop_id = isset($_GET['shop_id']) ? $_GET['shop_id'] : 0;
//$is_paid = isset($_GET['is_paid']) ? $_GET['is_paid'] : NULL;
$is_paid = 1;


$bg_date = isset($_GET['bg_date']) ? $_GET['bg_date'] : NULL;
$end_date = isset($_GET['end_date']) ? $_GET['end_date'] : NULL;
if (strlen($bg_date)>0) {
	$lastmonth_start = strtotime($bg_date); 
}
if (strlen($end_date)>0) {
	$lastmonth_end = strtotime($end_date); 
}

//俺的添加 结束
 
require_once 'PHPExcel.php';
 
 
$objPHPExcel = new PHPExcel();
 
// 设置文件属性
$objPHPExcel->getProperties()->setCreator("C1G")
                             ->setLastModifiedBy("C1G")
                             ->setTitle("phpexcel Test Document")
                             ->setSubject("phpexcel Test Document")
                             ->setDescription("Test document for phpexcel, generated using PHP classes.")
                             ->setKeywords("office 2007 openxml php c1gstudio")
                             ->setCategory("Test");
 
//设置当前活动的sheet
$objPHPExcel->setActiveSheetIndex(0);
 
//设置sheet名字
$objPHPExcel->getActiveSheet()->setTitle('排单返现列表 （'.$bg_date.'至'.$end_date.')');
 
//设置默认行高
$objPHPExcel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15);
 
//由PHPExcel根据传入内容自动判断单元格内容类型
$objPHPExcel->getActiveSheet()->setCellValue('A1', "支付ID");
$objPHPExcel->getActiveSheet()->setCellValue('B1', "微信昵称");
$objPHPExcel->getActiveSheet()->setCellValue('C1', "会员ID");
$objPHPExcel->getActiveSheet()->setCellValue('D1', "真实姓名");
$objPHPExcel->getActiveSheet()->setCellValue('E1', "手机号");
$objPHPExcel->getActiveSheet()->setCellValue('F1', "金额");
$objPHPExcel->getActiveSheet()->setCellValue('G1', "商家名称");
$objPHPExcel->getActiveSheet()->setCellValue('H1', "商家ID");
$objPHPExcel->getActiveSheet()->setCellValue('I1', "是否支付");
$objPHPExcel->getActiveSheet()->setCellValue('J1', "创建时间");
$objPHPExcel->getActiveSheet()->setCellValue('K1', "支付时间");

	$objPHPExcel->getActiveSheet()->getStyle('A1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 

	$objPHPExcel->getActiveSheet()->getStyle('B1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 

	$objPHPExcel->getActiveSheet()->getStyle('C1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 

	$objPHPExcel->getActiveSheet()->getStyle('D1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 

	$objPHPExcel->getActiveSheet()->getStyle('E1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 

	$objPHPExcel->getActiveSheet()->getStyle('F1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	
	$objPHPExcel->getActiveSheet()->getStyle('G1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('H1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('I1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('J1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('K1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
 
//$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 8, 'firstname');
//$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, 8, 'lastname');
 
 
//// utf8格式字符
//$objPHPExcel->setActiveSheetIndex(0)
//            ->setCellValue('A15', 'Miscellaneous glyphs')
//            ->setCellValue('A16', 'éàèùâêîôûëïüÿäöüç')
//            ->setCellValue('A17', 'phpexcel演示');


//$objPHPExcel->getActiveSheet()->setCellValue('A9', "502");
//$objPHPExcel->getActiveSheet()->setCellValue('B9', "99");
//$objPHPExcel->getActiveSheet()->setCellValue('F1', "=SUM(F2:F1000)");//计算总额

//设置列宽




$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth('10');  //支付ID
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth('35'); //微信昵称
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth('10'); //会员ID
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth('20'); //真实姓名
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth('20'); //手机号
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth('15'); //金额
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth('30'); //商家名称
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth('10'); //商家ID
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth('25'); //是否支付
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth('25'); //创建时间
$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth('25'); //支付时间

// 设置行高
$objPHPExcel->getActiveSheet()->getRowDimension('9')->setRowHeight(20);
 
//// 加粗
//$objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
$zongji = "0.00";//总计
$zongji_cg = "0.00";//已支付
$zongji_sb = "0.00";//未支付
$num  = 2;
 
$where = " where 1 = 1 ";

if( is_numeric( $is_paid ) ) 
{ 
	$where.= "  and `is_paid` = '".$is_paid."'  ";
}
if( (int)$shop_id > 0 ) 
{
	$where.= "  and `shop_id` = '".$shop_id."'  ";
} else {
	$where.= "  and `shop_id` >= 0  ";
}

if ( ( $lastmonth_start > 0 ) and ( $lastmonth_end > 0 ) ){
	$where.= "  and  `create_time`>='".$lastmonth_start."' and `create_time`<='".$lastmonth_end."'  ";
} elseif ( $lastmonth_start > 0 ) {
	$where.= "  and  `create_time`>='".$lastmonth_start."' ";
} elseif ( $lastmonth_end > 0 ) {
	$where.= "  and `create_time`<='".$lastmonth_end."'  ";
}
 
$sql = "select * from `bao_payment_logs`  ".$where." order by `shop_id` desc ,  `log_id` desc " ;
$res = mysql_query($sql);
while($row = mysql_fetch_array($res)){
	$objPHPExcel->getActiveSheet()->setCellValue('A'.$num, $row['log_id']);//支付ID
	$objPHPExcel->getActiveSheet()->getStyle('A'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);
	
	$sql0 = "select `nickname` from `bao_users` where `user_id` = '".$row['user_id']."' ";
	$res0 = mysql_query($sql0);
	while($row0 = mysql_fetch_array($res0)){
		
		$objPHPExcel->getActiveSheet()->setCellValue('B'.$num, $row0['nickname']);//微信昵称
		$objPHPExcel->getActiveSheet()->getStyle('B'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		);	
	}
	
		 
	$objPHPExcel->getActiveSheet()->setCellValue('C'.$num, $row['user_id']);//会员ID
	$objPHPExcel->getActiveSheet()->getStyle('C'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->setCellValue('D'.$num, $row['youname']);//真实姓名
	$objPHPExcel->getActiveSheet()->getStyle('D'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	
	
	$objPHPExcel->getActiveSheet()->setCellValue('E'.$num, $row['youmobile']);//手机号
	$objPHPExcel->getActiveSheet()->getStyle('E'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	
	
	 
	$objPHPExcel->getActiveSheet()->setCellValue('F'.$num, round($row['need_pay']/100,2));//金额
	$objPHPExcel->getActiveSheet()->getStyle('F'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);
	$zongji = $zongji + $row['need_pay'];
	
	if ( (int)$row['shop_id'] > 0 ) {
		$sql1 = "select `shop_name` from `bao_shop` where `shop_id` = '".$row['shop_id']."' ";
		$res1 = mysql_query($sql1);
		while($row1 = mysql_fetch_array($res1)){
			$shop_name = $row1['shop_name'];
			$objPHPExcel->getActiveSheet()->setCellValue('G'.$num, $shop_name);//商家名称
			$objPHPExcel->getActiveSheet()->getStyle('G'.$num)->applyFromArray(
				array(
					'alignment' => array(
						'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
			);	
		}
	}

	if 	( (int)$row['create_time'] > 0 ) {
		$objPHPExcel->getActiveSheet()->setCellValue('H'.$num, $row['shop_id']);//商家ID
		$objPHPExcel->getActiveSheet()->getStyle('H'.$num)->applyFromArray(
				array(
					'alignment' => array(
						'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
		);
	}
	
	if( is_numeric( $row['is_paid'] ) ) { 
	    if ($row['is_paid'] == 1){
			$my_is_paid = "已支付";
			$zongji_cg = $zongji_cg + $row['need_pay'];
		} else {
			$my_is_paid = "未支付";
			$zongji_sb = $zongji_sb + $row['need_pay'];
		}  
		$objPHPExcel->getActiveSheet()->setCellValue('I'.$num, $my_is_paid);//是否支付
		$objPHPExcel->getActiveSheet()->getStyle('I'.$num)->applyFromArray(
				array(
					'alignment' => array(
						'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
		);	
	}
	
	if 	( (int)$row['create_time'] > 0 ) {
		$objPHPExcel->getActiveSheet()->setCellValue('J'.$num, date("Y-m-d H:i:s",$row['create_time']));//创建时间
		$objPHPExcel->getActiveSheet()->getStyle('J'.$num)->applyFromArray(
				array(
					'alignment' => array(
						'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
		);	
	}
	
	if 	( (int)$row['pay_time'] > 0 ) {
		$objPHPExcel->getActiveSheet()->setCellValue('K'.$num, date("Y-m-d H:i:s",$row['pay_time']));//支付时间
		$objPHPExcel->getActiveSheet()->getStyle('K'.$num)->applyFromArray(
				array(
					'alignment' => array(
						'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
		);	
	}
	
	
	 
	$num = $num + 1;	
	 
 }
 
$dpnum = $num + 1;
$objPHPExcel->getActiveSheet()->setCellValue('A'.$dpnum, "已支付:");
$objPHPExcel->getActiveSheet()->setCellValue('B'.$dpnum, round($zongji_cg/100,2) ."元");
//$objPHPExcel->getActiveSheet()->setCellValue('G'.$dpnum, "未支付：");
//$objPHPExcel->getActiveSheet()->setCellValue('H'.$dpnum, round($zongji_sb/100,2) ."元");
$objPHPExcel->getActiveSheet()->setCellValue('I'.$dpnum, "总计:");
$objPHPExcel->getActiveSheet()->setCellValue('J'.$dpnum, round($zongji/100,2) ."元");

//// 设置单元格格式
//$objPHPExcel->getActiveSheet()->getCell('C2')->setValueExplicit('861391327543258', PHPExcel_Cell_DataType::TYPE_NUMERIC);
// 
//// 日期
//$objPHPExcel->getActiveSheet()->setCellValue('G2', '2008-12-31');
//$objPHPExcel->getActiveSheet()->getStyle('G2')->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_DATE_YYYYMMDDSLASH);
 
//// 时间戳
//$time = gmmktime(10,14,13,12,31,2008); // int(1230681600)
//$objPHPExcel->getActiveSheet()->setCellValue('G3', PHPExcel_Shared_Date::PHPToExcel($time));
//$objPHPExcel->getActiveSheet()->getStyle('G3')->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_DATE_YYYYMMDDSLASH);
 
//// url
//$objPHPExcel->getActiveSheet()->setCellValue('G11', 'blog.c1gstudio.com');
//$objPHPExcel->getActiveSheet()->getCell('G11')->getHyperlink()->setUrl('http://blog.c1gstudio.com');
 
//// 另一个sheet
//$objPHPExcel->getActiveSheet()->setCellValue('G12', 'sheetb');
//$objPHPExcel->getActiveSheet()->getCell('G12')->getHyperlink()->setUrl("sheet://'sheetb'!A1");
 
//// 水平居上
//$objPHPExcel->getActiveSheet()->getStyle('A9:B9')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_TOP);
// 
//// 单元格换行
//$objPHPExcel->getActiveSheet()->getStyle('G2:G3')->getAlignment()->setWrapText(true);
 
//// 合并
//$objPHPExcel->getActiveSheet()->mergeCells('A18:E22');
 
 
// 隐藏D列
//$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setVisible(false);
// 
////
//$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setOutlineLevel(1);
//$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setVisible(false);

 
// 固定第一行
$objPHPExcel->getActiveSheet()->freezePane('A2');
 
//// 保护工作表
//$objPHPExcel->getActiveSheet()->getProtection()->setPassword('PHPExcel');
//$objPHPExcel->getActiveSheet()->getProtection()->setSheet(true);
//$objPHPExcel->getActiveSheet()->getProtection()->setSort(true);
//$objPHPExcel->getActiveSheet()->getProtection()->setInsertRows(true);
//$objPHPExcel->getActiveSheet()->getProtection()->setFormatCells(true);
 
////设置边框
//$sharedStyle1 = new PHPExcel_Style();
//$sharedStyle1->applyFromArray(
//    array('borders' => array(
//                                'left'        => array('style' => PHPExcel_Style_Border::BORDER_MEDIUM)
//                            )
//         ));
//$objPHPExcel->getActiveSheet()->setSharedStyle($sharedStyle1, "B1:B10");
 
//// 创建一个新的工作表
//$objWorksheet1 = $objPHPExcel->createSheet();
//$objWorksheet1->setTitle('sheetb');
// 
// 
//$objPHPExcel->setActiveSheetIndex(1);
// 
// 
//// 创建一个图片
//$gdImage = @imagecreatetruecolor(200, 20) or die('Cannot Initialize new GD image stream');
//$textColor = imagecolorallocate($gdImage, 255, 255, 255);
//imagestring($gdImage, 1, 5, 5,  'Created with PHPExcel (c1gstudio.com)', $textColor);
// 
//// 把创建的图片添加到工作表
//$objDrawing = new PHPExcel_Worksheet_MemoryDrawing();
//$objDrawing->setName('Sample image');
//$objDrawing->setDescription('Sample image');
//$objDrawing->setImageResource($gdImage);
//$objDrawing->setRenderingFunction(PHPExcel_Worksheet_MemoryDrawing::RENDERING_JPEG);
//$objDrawing->setMimeType(PHPExcel_Worksheet_MemoryDrawing::MIMETYPE_DEFAULT);
//$objDrawing->setHeight(36);
//$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());
 
$objPHPExcel->setActiveSheetIndex(0);
 
// 保存


ob_end_clean();
header('Content-Type: application/vnd.ms-excel');


$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$myExcelUrl = 'pdfx_'.$shop_id.'_'.$bg_date.'_'.$end_date.'.xlsx' ;
$objWriter->save($myExcelUrl);

header("location: /dcExcel/".$myExcelUrl);
exit;


 
?>