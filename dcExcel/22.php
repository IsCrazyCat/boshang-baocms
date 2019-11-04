<?php
error_reporting(E_ALL);
 
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
$objPHPExcel->getActiveSheet()->setTitle('phpexcel demo');
 
//设置默认行高
$objPHPExcel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15);
 
//由PHPExcel根据传入内容自动判断单元格内容类型
$objPHPExcel->getActiveSheet()->setCellValue('A1', "Firstname");
$objPHPExcel->getActiveSheet()->setCellValue('B1', "Lastname");
$objPHPExcel->getActiveSheet()->setCellValue('C1', "Phone");
$objPHPExcel->getActiveSheet()->setCellValue('D1', "Fax");
$objPHPExcel->getActiveSheet()->setCellValue('E1', "Address");
$objPHPExcel->getActiveSheet()->setCellValue('F1', "ZIP");
$objPHPExcel->getActiveSheet()->setCellValue('G1', "DATE");
 
 
$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 8, 'firstname');
$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, 8, 'lastname');
 
 
// utf8格式字符
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A15', 'Miscellaneous glyphs')
            ->setCellValue('A16', 'éàèùâêîôûëïüÿäöüç')
            ->setCellValue('A17', 'phpexcel演示');
 
$objPHPExcel->getActiveSheet()->setCellValue('A9', "502");
$objPHPExcel->getActiveSheet()->setCellValue('B9', "99");
$objPHPExcel->getActiveSheet()->setCellValue('C9', "=SUM(A9:B9)");
 
//设置列宽
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth('20');
 
 
// 设置行高
$objPHPExcel->getActiveSheet()->getRowDimension('9')->setRowHeight(20);
 
// 加粗
$objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
 
// 中文
$objPHPExcel->getActiveSheet()->setCellValue('A2', "小风");
$objPHPExcel->getActiveSheet()->setCellValue('B2', "wang");
 
// 设置单元格格式
$objPHPExcel->getActiveSheet()->getCell('C2')->setValueExplicit('861391327543258', PHPExcel_Cell_DataType::TYPE_NUMERIC);
 
// 日期
$objPHPExcel->getActiveSheet()->setCellValue('G2', '2008-12-31');
$objPHPExcel->getActiveSheet()->getStyle('G2')->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_DATE_YYYYMMDDSLASH);
 
// 时间戳
$time = gmmktime(0,0,0,12,31,2008); // int(1230681600)
$objPHPExcel->getActiveSheet()->setCellValue('G3', PHPExcel_Shared_Date::PHPToExcel($time));
$objPHPExcel->getActiveSheet()->getStyle('G3')->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_DATE_YYYYMMDDSLASH);
 
// url
$objPHPExcel->getActiveSheet()->setCellValue('G11', 'blog.c1gstudio.com');
$objPHPExcel->getActiveSheet()->getCell('G11')->getHyperlink()->setUrl('http://blog.c1gstudio.com');
 
// 另一个sheet
$objPHPExcel->getActiveSheet()->setCellValue('G12', 'sheetb');
$objPHPExcel->getActiveSheet()->getCell('G12')->getHyperlink()->setUrl("sheet://'sheetb'!A1");
 
// 水平居上
$objPHPExcel->getActiveSheet()->getStyle('A9:B9')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_TOP);
 
// 单元格换行
$objPHPExcel->getActiveSheet()->getStyle('G2:G3')->getAlignment()->setWrapText(true);
 
// 合并
$objPHPExcel->getActiveSheet()->mergeCells('A18:E22');
 
 
// 隐藏D列
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setVisible(false);
 
//
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setOutlineLevel(1);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setVisible(false);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setOutlineLevel(1);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setVisible(false);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setCollapsed(true);
 
// 固定第一行
$objPHPExcel->getActiveSheet()->freezePane('A2');
 
// 保护工作表
$objPHPExcel->getActiveSheet()->getProtection()->setPassword('PHPExcel');
$objPHPExcel->getActiveSheet()->getProtection()->setSheet(true);
$objPHPExcel->getActiveSheet()->getProtection()->setSort(true);
$objPHPExcel->getActiveSheet()->getProtection()->setInsertRows(true);
$objPHPExcel->getActiveSheet()->getProtection()->setFormatCells(true);
 
//设置边框
$sharedStyle1 = new PHPExcel_Style();
$sharedStyle1->applyFromArray(
    array('borders' => array(
                                'left'        => array('style' => PHPExcel_Style_Border::BORDER_MEDIUM)
                            )
         ));
$objPHPExcel->getActiveSheet()->setSharedStyle($sharedStyle1, "B1:B10");
 
// 创建一个新的工作表
$objWorksheet1 = $objPHPExcel->createSheet();
$objWorksheet1->setTitle('sheetb');
 
 
$objPHPExcel->setActiveSheetIndex(1);
 
 
// 创建一个图片
$gdImage = @imagecreatetruecolor(200, 20) or die('Cannot Initialize new GD image stream');
$textColor = imagecolorallocate($gdImage, 255, 255, 255);
imagestring($gdImage, 1, 5, 5,  'Created with PHPExcel (c1gstudio.com)', $textColor);
 
// 把创建的图片添加到工作表
$objDrawing = new PHPExcel_Worksheet_MemoryDrawing();
$objDrawing->setName('Sample image');
$objDrawing->setDescription('Sample image');
$objDrawing->setImageResource($gdImage);
$objDrawing->setRenderingFunction(PHPExcel_Worksheet_MemoryDrawing::RENDERING_JPEG);
$objDrawing->setMimeType(PHPExcel_Worksheet_MemoryDrawing::MIMETYPE_DEFAULT);
$objDrawing->setHeight(36);
$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());
 
$objPHPExcel->setActiveSheetIndex(0);
 
// 保存
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('testexcel'.time().'.xls');
 
?>