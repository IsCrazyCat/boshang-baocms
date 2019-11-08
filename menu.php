<?php
      header("Content-type: text/html; charset=utf-8");
	  define('IN_ECS', true);
	   require('wechat.class.php');
       
         $weixin = new core_lib_wechat($weixinconfig);
		  // var_dump($weixin);
		  $appid="wx0a5face51bfd15e1";
		  $appsecret="548a6ad5fd04b218993dce03daf9728c";
		   $access_token=$weixin->checkAuth($appid,$appsecret);
$jsonmenu = '{
    "button": [
		
		
	  {	
          "type":"view",
          "name":"附近优惠",
          "url":"http://www.blklube.com/wap/index/index"
      },
	    {	
          "type":"view",
          "name":"大家说",
          "url":"http://www.blklube.com/wap/tieba/index.html"
      },
	  {	
          
          
		   "name":"我的账户",
           "sub_button":[
           {    
               "type":"view",
               "name":"会员中心",
              "url":"http://www.blklube.com/user/member/index.html"
            },
             {    
               "type":"view",
               "name":"分销中心",
              "url":"http://www.blklube.com/user/distribution/index.html"
            },
            {    
               "type":"view",
               "name":"商家中心",
              "url":"http://www.blklube.com/Distributors"
            }]
      }
	  
	  
    ]
}';


$url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=".$access_token;

$result = https_request($url, $jsonmenu);
var_dump($result);

function https_request($url,$data = null){
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    if (!empty($data)){
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    }
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $output = curl_exec($curl);
    curl_close($curl);
    return $output;
}

?>