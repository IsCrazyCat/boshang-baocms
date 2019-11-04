<?php
error_reporting(E_ALL);

//俺的添加 开始 9.13
$jobid = isset($_GET['jobid']) ? $_GET['jobid'] : '1';

 $cfg_dbhost = '127.0.0.1';
 $cfg_dbname = 'aihuaqian_boshang3710_com';
 $cfg_dbuser = 'xinlingshou_wx_c';
 $cfg_dbpwd = '5ee3cd21e684';
 $cfg_db_language = 'utf8';
 //链接数据库
 $link = mysql_connect($cfg_dbhost,$cfg_dbuser,$cfg_dbpwd);
 mysql_select_db($cfg_dbname);
 //选择编码
 mysql_query("set names ".$cfg_db_language);
 
 
 
$lastmonth_start = mktime(0,0,0,date('m')-1,1,date('Y')); 
$lastmonth_end = time()+86400; 
$bg_date = date("Y-m-d",$lastmonth_start);
$end_date = date("Y-m-d",$lastmonth_end);
 
$bg_date = isset($_GET['bg_date']) ? $_GET['bg_date'] : $bg_date;
$end_date = isset($_GET['end_date']) ? $_GET['end_date'] : $end_date;
if (isset($_GET['bg_date'])) {
	$lastmonth_start = strtotime($bg_date); 
}
if (isset($_GET['end_date'])) {
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
$objPHPExcel->getActiveSheet()->setTitle('商品信息表 （'.$bg_date.'至'.$end_date.')');
 
//设置默认行高
$objPHPExcel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15);
 
//由PHPExcel根据传入内容自动判断单元格内容类型
$objPHPExcel->getActiveSheet()->setCellValue('A1', "商品ID");
$objPHPExcel->getActiveSheet()->setCellValue('B1', "会员账户(ID)");
$objPHPExcel->getActiveSheet()->setCellValue('C1', "姓名");
$objPHPExcel->getActiveSheet()->setCellValue('D1', "职务");
$objPHPExcel->getActiveSheet()->setCellValue('E1', "手机号");
$objPHPExcel->getActiveSheet()->setCellValue('F1', "预约总数");
$objPHPExcel->getActiveSheet()->setCellValue('G1', "待提预约");
$objPHPExcel->getActiveSheet()->setCellValue('H1', "待审预约");
$objPHPExcel->getActiveSheet()->setCellValue('I1', "成功预约");
$objPHPExcel->getActiveSheet()->setCellValue('J1', "失败预约");

$objPHPExcel->getActiveSheet()->setCellValue('K1', "成功钱数");
$objPHPExcel->getActiveSheet()->setCellValue('L1', "失败钱数");
$objPHPExcel->getActiveSheet()->setCellValue('M1', "待审钱数");
$objPHPExcel->getActiveSheet()->setCellValue('N1', "待提钱数");
$objPHPExcel->getActiveSheet()->setCellValue('O1', "总计钱数");




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
 
//$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 8, 'firstname');
//$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, 8, 'lastname');
 
 
//// utf8格式字符
//$objPHPExcel->setActiveSheetIndex(0)
//            ->setCellValue('A15', 'Miscellaneous glyphs')
//            ->setCellValue('A16', 'éàèùâêîôûëïüÿäöüç')
//            ->setCellValue('A17', 'phpexcel演示');


//$objPHPExcel->getActiveSheet()->setCellValue('A9', "502");
//$objPHPExcel->getActiveSheet()->setCellValue('B9', "99");
//$objPHPExcel->getActiveSheet()->setCellValue('C9', "=SUM(A9:B9)");//计算总额
 
//设置列宽
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth('10');  //商品ID
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth('20'); //会员账户
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth('18'); //姓名
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth('18'); //职务
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth('18'); //手机号
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth('10'); //预约总数
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth('10'); //待提预约
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth('10'); //待审预约
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth('10'); //成功预约
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth('10'); //失败预约

$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth('10'); //成功钱数
$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth('10'); //失败钱数
$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth('10'); //待审钱数
$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setWidth('10'); //待提钱数
$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth('10'); //预约总钱数

// 设置行高
$objPHPExcel->getActiveSheet()->getRowDimension('9')->setRowHeight(20);
 
//// 加粗
//$objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
$zongji = "0.00";//总计

 $num  = 2;
 
 $sql = "select * from `bao_shop_worker` where `status` = 1 and `closed` = 0 ";
 $res = mysql_query($sql);
 while($row = mysql_fetch_array($res)){
	 $objPHPExcel->getActiveSheet()->setCellValue('A'.$num, $row['worker_id']);//商品ID
	$objPHPExcel->getActiveSheet()->getStyle('A'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);
	
	
	$sql1 = "select `ext0` from `bao_users` where `user_id` = '".$row['user_id']."' ";
		 $res1 = mysql_query($sql1);
		 while($row1 = mysql_fetch_array($res1)){
			$ext0 = $row1['ext0'];
		$objPHPExcel->getActiveSheet()->setCellValue('B'.$num, $ext0.'('.$row['user_id'].')');//会员账户
	}	
	
		 
	$objPHPExcel->getActiveSheet()->getStyle('B'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	 $objPHPExcel->getActiveSheet()->setCellValue('C'.$num, $row['name']);//姓名
	$objPHPExcel->getActiveSheet()->getStyle('C'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	 $objPHPExcel->getActiveSheet()->setCellValue('D'.$num, $row['work']);//职务
	$objPHPExcel->getActiveSheet()->getStyle('D'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	 $objPHPExcel->getActiveSheet()->setCellValue('E'.$num, $row['mobile']);//手机号
	$objPHPExcel->getActiveSheet()->getStyle('E'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	
	
	$sql1 = "select count(*),SUM(`jiaofei`) from `bao_shop_yuyue`  where `worker_id` = '".$row['worker_id']."' and `create_time`>='".$lastmonth_start."' and `create_time`<='".$lastmonth_end."' ";
	$res1 = mysql_query($sql1);
	 while($row1 = mysql_fetch_array($res1)){
		 $objPHPExcel->getActiveSheet()->setCellValue('F'.$num, $row1[0]);//预约总数
		 $objPHPExcel->getActiveSheet()->getStyle('F'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		 );	

		 $objPHPExcel->getActiveSheet()->setCellValue('O'.$num, $row1[1]);//预约总数
		 $objPHPExcel->getActiveSheet()->getStyle('O'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		 );	
		 
	}	
	
	//待提预约
	$sql1 = "select count(*),SUM(`jiaofei`) from `bao_shop_yuyue`  where `worker_id` = '".$row['worker_id']."' and  shenche_zt = -1 and `create_time`>='".$lastmonth_start."' and `create_time`<='".$lastmonth_end."' ";
	$res1 = mysql_query($sql1);
	while($row1 = mysql_fetch_array($res1)){
		 $objPHPExcel->getActiveSheet()->setCellValue('G'.$num, $row1[0]);//待提预约
		 $objPHPExcel->getActiveSheet()->getStyle('G'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		 );	
		 
		 $objPHPExcel->getActiveSheet()->setCellValue('N'.$num, $row1[1]);//待提钱数
		 $objPHPExcel->getActiveSheet()->getStyle('N'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		 );	
	}	

	//待审预约
	$sql1 = "select count(*),SUM(`jiaofei`) from `bao_shop_yuyue`  where `worker_id` = '".$row['worker_id']."' and  shenche_zt = 0 and `create_time`>='".$lastmonth_start."' and `create_time`<='".$lastmonth_end."' ";
	$res1 = mysql_query($sql1);
	 while($row1 = mysql_fetch_array($res1)){
		 $objPHPExcel->getActiveSheet()->setCellValue('H'.$num, $row1[0]);//待审预约
		 $objPHPExcel->getActiveSheet()->getStyle('H'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		 );	
		 
		 $objPHPExcel->getActiveSheet()->setCellValue('M'.$num, $row1[1]);//待审钱数
		 $objPHPExcel->getActiveSheet()->getStyle('M'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		 );	
		 
	}	
	//成功预约
	$sql1 = "select count(*),SUM(`jiaofei`) from `bao_shop_yuyue`  where `worker_id` = '".$row['worker_id']."'  and  shenche_zt = 1 and `create_time`>='".$lastmonth_start."' and `create_time`<='".$lastmonth_end."' ";
	$res1 = mysql_query($sql1);
	 while($row1 = mysql_fetch_array($res1)){
		 $objPHPExcel->getActiveSheet()->setCellValue('I'.$num, $row1[0]);//成功预约
		 $objPHPExcel->getActiveSheet()->getStyle('I'.$num)->applyFromArray(
				array(
					'alignment' => array(
						'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
		 );	
		 
		 $objPHPExcel->getActiveSheet()->setCellValue('K'.$num, $row1[1]);//成功钱数
		 $objPHPExcel->getActiveSheet()->getStyle('K'.$num)->applyFromArray(
				array(
					'alignment' => array(
						'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
		 );	
		 
	}	
	//失败预约 
	$sql1 = "select count(*),SUM(`jiaofei`) from `bao_shop_yuyue`  where `worker_id` = '".$row['worker_id']."'  and  shenche_zt = 2 and `create_time`>='".$lastmonth_start."' and `create_time`<='".$lastmonth_end."' ";
	$res1 = mysql_query($sql1);
	 while($row1 = mysql_fetch_array($res1)){
		 $objPHPExcel->getActiveSheet()->setCellValue('J'.$num, $row1[0]);//失败预约
		 $objPHPExcel->getActiveSheet()->getStyle('J'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		 );	
		 
		 
		 $objPHPExcel->getActiveSheet()->setCellValue('L'.$num, $row1[1]);//失败钱数
		 $objPHPExcel->getActiveSheet()->getStyle('L'.$num)->applyFromArray(
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
$objPHPExcel->getActiveSheet()->setCellValue('J'.$dpnum, "统计：");
$objPHPExcel->getActiveSheet()->setCellValue('K'.$dpnum, "=SUM(K2:K".$num.")");
$objPHPExcel->getActiveSheet()->setCellValue('L'.$dpnum, "=SUM(L2:L".$num.")");
$objPHPExcel->getActiveSheet()->setCellValue('M'.$dpnum, "=SUM(M2:M".$num.")");
$objPHPExcel->getActiveSheet()->setCellValue('N'.$dpnum, "=SUM(N2:N".$num.")");
$objPHPExcel->getActiveSheet()->setCellValue('O'.$dpnum, "=SUM(O2:O".$num.")");
 
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


$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$myExcelUrl = 'yuangong_'.$bg_date.'_'.$end_date.'.xls' ;
$objWriter->save($myExcelUrl);

header("location: /dcExcel/".$myExcelUrl);
exit;


 
?>