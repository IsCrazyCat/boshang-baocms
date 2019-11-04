<?php
error_reporting(E_ALL);

//俺的添加 开始 9.13

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
 
 
$shop_id = isset($_GET['shop_id']) ? $_GET['shop_id'] : 0;
$leixing = isset($_GET['leixing']) ? $_GET['leixing'] : 0;
$user_id = isset($_GET['user_id']) ? $_GET['user_id'] : 0;





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
$objPHPExcel->getActiveSheet()->setTitle('返现明细列表 （'.$bg_date.'至'.$end_date.')');
 
//设置默认行高
$objPHPExcel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15);
 
//由PHPExcel根据传入内容自动判断单元格内容类型
$objPHPExcel->getActiveSheet()->setCellValue('A1', "日志ID");
$objPHPExcel->getActiveSheet()->setCellValue('B1', "获得者（微信昵称）");
$objPHPExcel->getActiveSheet()->setCellValue('C1', "获得者（会员ID）");
$objPHPExcel->getActiveSheet()->setCellValue('D1', "获得者（真实姓名）");
$objPHPExcel->getActiveSheet()->setCellValue('E1', "获得者（手机号）");
$objPHPExcel->getActiveSheet()->setCellValue('F1', "获得金额");
$objPHPExcel->getActiveSheet()->setCellValue('G1', "创建时间");
$objPHPExcel->getActiveSheet()->setCellValue('H1', "日志详情");
$objPHPExcel->getActiveSheet()->setCellValue('I1', "门店名称");
$objPHPExcel->getActiveSheet()->setCellValue('J1', "门店ID");

$objPHPExcel->getActiveSheet()->setCellValue('K1', " ");

$objPHPExcel->getActiveSheet()->setCellValue('L1', "支付ID");
$objPHPExcel->getActiveSheet()->setCellValue('M1', "支付金额");
$objPHPExcel->getActiveSheet()->setCellValue('N1', "是否支付");
$objPHPExcel->getActiveSheet()->setCellValue('O1', "支付时间");
$objPHPExcel->getActiveSheet()->setCellValue('P1', "返现状态");
$objPHPExcel->getActiveSheet()->setCellValue('Q1', "支付者（微信昵称）");
$objPHPExcel->getActiveSheet()->setCellValue('R1', "支付者（会员ID）");
$objPHPExcel->getActiveSheet()->setCellValue('S1', "支付者（真实姓名）");
$objPHPExcel->getActiveSheet()->setCellValue('T1', "支付者（手机号）");



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
	$objPHPExcel->getActiveSheet()->getStyle('L1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('M1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('N1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);
	
	$objPHPExcel->getActiveSheet()->getStyle('O1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('P1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('Q1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('R1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('S1')->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	$objPHPExcel->getActiveSheet()->getStyle('T1')->applyFromArray(
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




$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth('10');  //日志ID
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth('30'); //获得者（微信昵称）
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth('15'); //获得者（会员ID）
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth('20'); //获得者（真实姓名）
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth('20'); //获得者（手机号）
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth('15'); //获得金额
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth('20'); //发生时间
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth('45'); //日志详情
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth('35'); //门店名称
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth('10'); //门店ID

$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth('15'); // 

$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth('10'); //支付ID 
$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth('15'); //支付金额 
$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setWidth('20'); //是否支付 
$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth('20'); //支付时间
$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setWidth('20'); //返现状态 
$objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setWidth('30'); //支付者（微信昵称）
$objPHPExcel->getActiveSheet()->getColumnDimension('R')->setWidth('15'); //支付者（会员ID）
$objPHPExcel->getActiveSheet()->getColumnDimension('S')->setWidth('20'); //支付者（真实姓名）
$objPHPExcel->getActiveSheet()->getColumnDimension('T')->setWidth('20'); //支付者（手机号）" 


// 设置行高
$objPHPExcel->getActiveSheet()->getRowDimension('9')->setRowHeight(20);
 
//// 加粗
//$objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
$hdjesum = "0.00";//获得总金额
$zfjesum = "0.00";//支付总金额
$jianchisum = "0.00";//总奖池

$md_hdjesum = "0.00";//门店获得总金额
$md_zfjesum = "0.00";//门店支付总金额


$num  = 2;
 
$where = " where 1 = 1 ";

switch ($leixing)
{
	case 1:
	  $where.= "  and `intro` LIKE '%门店返现%'  ";
	  break;
	case 2:
	  $where.= "  and `intro` LIKE '%我的返现%'  ";
	  break;
	case 3:
	  $where.= "  and `intro` LIKE '%我的购物%'  ";
	  break;
	case 4:
	  $where.= "  and `shop_id` = 0  ";
	  $shop_id = 0;
	  break;
	default:
	  $where.= "  and `shop_id` > 0  ";
}


if( (int)$shop_id > 0 ) 
{
	$where.= "  and `shop_id` = '".$shop_id."'  ";
	
	$sql = "select `jianchi`,`jianli` from `bao_shop` where `shop_id` = '".$shop_id."' ";
		$res = mysql_query($sql);
		while($row = mysql_fetch_array($res)){
			$jianchisum =  $row['jianchi'];
		}	
	
} else {
	//$where.= "  and `shop_id` >= 0  ";
}


//启动session的初始化
session_start();
//注册session变量，赋值为一个用户的名称
$_SESSION["shop_id"] = $shop_id;
//注册session变量，赋值为一个用户的ID


if( (int)$user_id > 0 ) 
{
	$where.= "  and `user_id` = '".$user_id."'  ";
} else {
	//$where.= "  and `shop_id` >= 0  ";
}


if ( ( $lastmonth_start > 0 ) and ( $lastmonth_end > 0 ) ){
	$where.= "  and  `create_time`>='".$lastmonth_start."' and `create_time`<='".$lastmonth_end."'  ";
} elseif ( $lastmonth_start > 0 ) {
	$where.= "  and  `create_time`>='".$lastmonth_start."' ";
} elseif ( $lastmonth_end > 0 ) {
	$where.= "  and `create_time`<='".$lastmonth_end."'  ";
}



 
$sql = "select * from `bao_user_money_logs`  ".$where ." order by `shop_id` desc ,  `log_id` desc " ;
$res = mysql_query($sql);
while($row = mysql_fetch_array($res)){
	
	
	
	
	
	
	$objPHPExcel->getActiveSheet()->setCellValue('A'.$num, $row['log_id']);//日志ID
	$objPHPExcel->getActiveSheet()->getStyle('A'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);

	
	$objPHPExcel->getActiveSheet()->setCellValue('L'.$num, $row['pay_id']);//支付ID
	$objPHPExcel->getActiveSheet()->getStyle('L'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);
	
	
	$objPHPExcel->getActiveSheet()->setCellValue('C'.$num, $row['user_id']);//获得者（会员ID）
	$objPHPExcel->getActiveSheet()->getStyle('C'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);	 
	
	$sql0 = "select `nickname`,`truename`,`mobile` from `bao_users` where `user_id` = '".$row['user_id']."' ";
	$res0 = mysql_query($sql0);
	while($row0 = mysql_fetch_array($res0)){
		
		$objPHPExcel->getActiveSheet()->setCellValue('B'.$num, $row0['nickname']);//获得者（微信昵称）
		$objPHPExcel->getActiveSheet()->getStyle('B'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		);	
		  
		
		$objPHPExcel->getActiveSheet()->setCellValue('D'.$num, $row0['truename']);//获得者（真实姓名）
		$objPHPExcel->getActiveSheet()->getStyle('D'.$num)->applyFromArray(
				array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
		);	
		
		$objPHPExcel->getActiveSheet()->setCellValue('E'.$num, $row0['mobile']);//获得者（手机号）
		$objPHPExcel->getActiveSheet()->getStyle('E'.$num)->applyFromArray(
				array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
		);	
		
	}
	
	
	$objPHPExcel->getActiveSheet()->setCellValue('F'.$num, round($row['money']/100,2));//获得金额
	$objPHPExcel->getActiveSheet()->getStyle('F'.$num)->applyFromArray(
            array(
                'alignment' => array(
                    'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
                )
            )
	);
	$hdjesum = $hdjesum + $row['money'];
	
	
	//if (  ( (int)$row['shop_id'] > 0 ) &&  ( (int)$_SESSION['shop_id'] > 0 ) ) {
		if (  (int)$row['shop_id'] == (int)$shop_id ) {
			$md_hdjesum = $md_hdjesum + $row['money'];
		}
	//}

	
	
	
	
	if 	( (int)$row['create_time'] > 0 ) {
		$objPHPExcel->getActiveSheet()->setCellValue('G'.$num, date("Y-m-d H:i:s",$row['create_time']));//创建时间
		$objPHPExcel->getActiveSheet()->getStyle('G'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
		);	
	}
	
	
	
	$objPHPExcel->getActiveSheet()->setCellValue('H'.$num, $row['intro']);//日志详情
	$objPHPExcel->getActiveSheet()->getStyle('H'.$num)->applyFromArray(
		array(
			'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
			)
		)
	);	
	
	
	 
	if ( (int)$row['shop_id'] > 0 ) {
		
		
		$sql1 = "select `shop_name`,`closed`,`audit` from `bao_shop` where `shop_id` = '".$row['shop_id']."' ";
		$res1 = mysql_query($sql1);
		while($row1 = mysql_fetch_array($res1)){
			$shop_name = $row1['shop_name'];
			if ($row1['closed'] == 1){
				$shop_name = $shop_name . '(已关停)';
			} 
			if ($row1['audit'] == 0){
				$shop_name = $shop_name . '(未审核)';
			} 
			$objPHPExcel->getActiveSheet()->setCellValue('I'.$num, $shop_name);//门店名称
			$objPHPExcel->getActiveSheet()->getStyle('I'.$num)->applyFromArray(
				array(
					'alignment' => array(
						'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
					)
				)
			);	
		}
		
		
		
		
		
	}
	
	
	$objPHPExcel->getActiveSheet()->setCellValue('J'.$num, $row['shop_id']);//门店ID
	$objPHPExcel->getActiveSheet()->getStyle('J'.$num)->applyFromArray(
			array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
				)
			)
	);
	

	if ( (int)$row['pay_id'] > 0 ) {
		
		$sql1 = "select * from `bao_payment_logs` where `log_id` = '".$row['pay_id']."' ";
		$res1 = mysql_query($sql1);
		while($row1 = mysql_fetch_array($res1)){
			
					if( is_numeric( $row1['is_paid'] ) ) { 
						if ( $row1['is_paid'] == 0 ) {
							$my_is_paid = '未支付';
						}
						if ( $row1['is_paid'] == 1 ) {
							$my_is_paid = '已支付';
						}
						$objPHPExcel->getActiveSheet()->setCellValue('N'.$num, $my_is_paid);//是否支付
						$objPHPExcel->getActiveSheet()->getStyle('N'.$num)->applyFromArray(
								array(
									'alignment' => array(
										'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
									)
								)
						);	
					}
					
					if( is_numeric( $row1['online'] ) ) { 
						if ( $row1['online'] == 0 ) {
							$my_is_online = '排队中';
						}
						if ( $row1['online'] == 1 ) {
							$my_is_online = '已返现';
						}
						$objPHPExcel->getActiveSheet()->setCellValue('P'.$num, $my_is_online);//是否支付
						$objPHPExcel->getActiveSheet()->getStyle('P'.$num)->applyFromArray(
								array(
									'alignment' => array(
										'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
									)
								)
						);	
					}
					
					
					
					
					$objPHPExcel->getActiveSheet()->setCellValue('M'.$num, round($row1['need_pay']/100,2));//支付金额
					$objPHPExcel->getActiveSheet()->getStyle('M'.$num)->applyFromArray(
						array(
									'alignment' => array(
										'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
							)
						)
					);
					$zfjesum = $zfjesum + $row1['need_pay'];
					
					//if (  ( (int)$row['shop_id'] > 0 ) &&  ( (int)$_SESSION['shop_id'] > 0 ) ) {
						if (  (int)$row['shop_id'] == (int)$shop_id ) {
							$md_zfjesum = $md_zfjesum + $row1['need_pay'];
						}
					//}

					
					
					
					if 	( (int)$row1['pay_time'] > 0 ) {
						$objPHPExcel->getActiveSheet()->setCellValue('O'.$num, date("Y-m-d H:i:s",$row1['pay_time']));//支付时间
						$objPHPExcel->getActiveSheet()->getStyle('O'.$num)->applyFromArray(
								array(
									'alignment' => array(
										'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
									)
								)
						);	
					}
					
					
			   $objPHPExcel->getActiveSheet()->setCellValue('R'.$num, $row1['user_id']);//支付者（会员ID）
				$objPHPExcel->getActiveSheet()->getStyle('R'.$num)->applyFromArray(
			            array(
									'alignment' => array(
									'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
			                )
			            )
				);	
				
				$objPHPExcel->getActiveSheet()->setCellValue('S'.$num, $row1['youname']);//支付者（真实姓名）
				$objPHPExcel->getActiveSheet()->getStyle('S'.$num)->applyFromArray(
						array(
									'alignment' => array(
									'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
							)
						)
				);	
				
				$objPHPExcel->getActiveSheet()->setCellValue('T'.$num, $row1['youmobile']);//支付者（手机号）
				$objPHPExcel->getActiveSheet()->getStyle('T'.$num)->applyFromArray(
						array(
									'alignment' => array(
										'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
							)
						)
				);
					 
				
					$sql9 = "select `nickname` from `bao_users` where `user_id` = '".$row1['user_id']."' ";
					$res9 = mysql_query($sql9);
					while($row9 = mysql_fetch_array($res9)){
						$objPHPExcel->getActiveSheet()->setCellValue('Q'.$num, $row9['nickname']);//支付者（微信昵称）
						$objPHPExcel->getActiveSheet()->getStyle('Q'.$num)->applyFromArray(
							array(
									'alignment' => array(
										'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER
								)
							)
						);	
					}
		
			
		}
		
		
		
		
		
		
		
		
	}
	
	$num = $num + 1;	
	 
 }

 
 
$dpnum = $num + 2;
$objPHPExcel->getActiveSheet()->setCellValue('E'.$dpnum, "总发放:");
$objPHPExcel->getActiveSheet()->setCellValue('F'.$dpnum, round($hdjesum/100,2) ."元");

$objPHPExcel->getActiveSheet()->setCellValue('J'.$dpnum, "总剩余奖池:");
$objPHPExcel->getActiveSheet()->setCellValue('K'.$dpnum, round($jianchisum/100,2) ."元");


//$objPHPExcel->getActiveSheet()->setCellValue('L'.$dpnum, "总支付:");
//$objPHPExcel->getActiveSheet()->setCellValue('M'.$dpnum, round($zfjesum/100,2) ."元");

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

unset($_SESSION['shop_id']);

header("location: /dcExcel/".$myExcelUrl);
exit;


 
?>