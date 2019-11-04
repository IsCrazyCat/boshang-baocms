<?php
 $cfg_dbhost = 'localhost';
 $cfg_dbname = 'lvxingshe';
 $cfg_dbuser = 'root';
 $cfg_dbpwd = 'root';
 $cfg_db_language = 'utf8';
 //链接数据库
 $link = mysql_connect($cfg_dbhost,$cfg_dbuser,$cfg_dbpwd);
 mysql_select_db($cfg_dbname);
 //选择编码
 mysql_query("set names ".$cfg_db_language);

 header("Content-type:application/vnd.ms-excel");

 $jobid = isset($_GET['jobid']) ? $_GET['jobid'] : '1';
 $sql = "select `id`,`addtime`,`customerid` from `met085_359_cv` where `jobid` = $jobid and `lang`='cn' ";
 $res = mysql_query($sql);
 $cv_id = '';
 $cv_my = '';
 //id 报名id   addtime 报名发布时间 cv_customerid 信息员
 while($row = mysql_fetch_array($res)){
     $cv_id =  " listid = " . $row['id'] . " or" . $cv_id;
     $cv_my =  $row['id'] . "," . $row['addtime'] . "," . $row['customerid'] . "|" . $cv_my;
 }

$cv_id = substr($cv_id,0,strlen($cv_id)-2);//去掉最后二个字符 or  
$cv_my = substr($cv_my,0,strlen($cv_my)-1);//去掉最后一个字符 |  


	$date = date("Y_m_d",time());
	$fileName = "_bak";
	$fileName .= "_{$date}";
 
 header("Content-Disposition:filename=". $fileName .".xls"); // .xlsx 或 .xls


 

 
 
if ( strlen($cv_id) > 0 ) {

 //$t_field[] = array("信息员","姓名","手机","身份证号","类型","班次","提交时间");
 echo "<table><tr>";
 //导出表头（也就是表中拥有的字段）
  echo "<th > 信 息 员 </th>";
  echo "<th > 姓 名 </th>";
  echo "<th > 手 机 </th>";
  echo "<th > 身 份 证 号 </th>";
  echo "<th > 类 型 </th>";
  echo "<th > 提 交 时 间 </th>";
 echo "</tr>";


	 $myparaid = 0 ;
	 
	 $sql = "select `id`,`listid`,`paraid`,`info` from met085_359_plist where module=6 and lang='cn' and ($cv_id)  ";
	 $res = mysql_query($sql);
	  echo "<tr>";
	 while($row = mysql_fetch_array($res)){
	  //paraid  59  姓名  60  手机  61  身份证号  62  类型   
	  
	    $myparaid = $row['paraid'];
	 
	    echo  "<td>=\"".$row['info']."\"</td>";
			  //echo  "<td>/n/t&nbsp;</td>";
	  
//	  foreach($t_field as $f_key){
//	   echo "<td>";
//	   echo  "=\"".$row[$f_key]."\"</td>";
//	  }
	  
	 }
	 
	   echo "</tr>";
	   echo "</table>";
	   


} else {
	echo "No data";
}
 
 
 


?>
