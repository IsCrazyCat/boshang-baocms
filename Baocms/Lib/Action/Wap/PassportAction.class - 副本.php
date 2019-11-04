<?php
class PassportAction extends CommonAction{
    private $create_fields = array('account', 'password', 'nickname');
    public function register()
    {
        if ($this->isPost()) {
            if (isMobile(htmlspecialchars($_POST['account']))) {
                if (!($scode = trim($_POST['scode']))) {
                    $this->fengmiMsg('请输入短信验证码！');
                }
                $scode2 = session('scode');
                if (empty($scode2)) {
                    $this->fengmiMsg('请获取短信验证码！');
                }
                if ($scode != $scode2) {
                    $this->fengmiMsg('请输入正确的短信验证码！');
                }
            }
            $data = $this->createCheck();
            $invite_id = (int) cookie('invite_id');
            if (!empty($invite_id)) {
                $data['invite_id'] = $invite_id;
            }
			if (empty($data['password'])) {
               $this->fengmiMsg('请输入密码');
            }
            $wap_register_password2 = $this->_CONFIG['register']['wap_register_password2'];
            if ($wap_register_password2 == 1) {
                $password2 = $this->_post('password2');
                if ($password2 !== $data['password']) {
                    $this->fengmiMsg('两次密码不一致');
                }
            }
			
            //开始其他的判断了
            if (true == D('Passport')->register($data)) {
				
				
				$this->uid = getUid();
                if ((int)$this->uid > 0) {
					
					
						//自动升级开始 lihongshun 2019.2.19
						$myuser = D('Users')->find($this->uid);
						if ($myuser['__referee']) {
							 $myuser_referee = $myuser['__referee'].','.$this->uid;
							 $floor_users = $userModel->where("user_id in (".$myuser['__referee'].")")->order('user_id desc')->select();  
							 foreach($floor_users as $rss){
									$rss_gerenshuju = (int)$rss['gerenshuju']; 
									$gerenshuju_count = M('Users')->where(" fuid1 = '".$rss['user_id']."' ")->count(); 
									if ( (int)$gerenshuju_count > 0  ) {
										if ( (int)$gerenshuju_count <> (int)$rss['gerenshuju'] ) {
											 D('Users')->save(array('user_id' => $rss['user_id'], 'gerenshuju' => $gerenshuju_count));
										}
										$rss_gerenshuju = $gerenshuju_count;
									}
									$rss_tuanduishuju = (int)$rss['tuanduishuju'];
									$tuanduishuju_count = M('Users')->where(" shangxianjihe LIKE '%,".$rss['user_id'].",%' ")->count(); 
									if ( (int)$tuanduishuju_count > 0 ) {
										if ( (int)$tuanduishuju_count <> (int)$rss['tuanduishuju'] ) {
											 D('Users')->save(array('user_id' => $rss['user_id'], 'tuanduishuju' => $tuanduishuju_count));
										}
										$rss_tuanduishuju = $tuanduishuju_count;
									}
			
									$arr_rank_name = array("GD3", "GD2", "GD1", "D4", "D3", "D2", "D1");
									foreach ($arr_rank_name as $my_rank_name) {
										$mapA['rank_name'] = array('LIKE', '%'.$my_rank_name.'%');
										$myrank = D('Userrank')->where($mapA)->find();
										$my_tuanduishuju = $myrank['tuanduishuju'];
										$my_gerenshuju = $myrank['gerenshuju'];
										if(strpos($myrank['jianjiegerenshuju'],'除最大数据包外') !==false){
											$mapB['shangxianjihe'] = array('LIKE', '%'.$rss['user_id'].'%');
											$max_xiaxiang_gerenshuju = $userModel->where($mapB)->max('gerenshuju');
											if ( (int)$rss_gerenshuju > (int)$max_xiaxiang_gerenshuju ) {
												$rss_gerenshuju = (int)$rss_gerenshuju - (int)$max_xiaxiang_gerenshuju;
											} 
										}
										if ( ( $rss_tuanduishuju > 0 ) and  ( $rss_gerenshuju > 0 ) ) {
											if ( ( $rss_tuanduishuju >= $my_tuanduishuju ) and  ( $rss_gerenshuju >= $my_gerenshuju ) ) {
												 $userModel->save(array('user_id' => $rss['user_id'], 'rank_id' => $myrank['rank_id'], 'prestige' => $myrank['prestige'] ));
											}
										}
										
									}
									
									//普通会员升级D1 一级就达到20人的情况下，二三级没人，也可以升级
									$rank_id = M('Users')->where(" user_id = '".$rss['user_id']."' ")->field('rank_id');
									if ((int)$rank_id == 1) {
										if ( (int)$rss_gerenshuju >= 20 ) {
											$userModel->save(array( 'user_id' => $rss['user_id'], 'rank_id' => 2 ));
										}
									} 
									
							 }
						}
						//自动升级结束
					
					
				}
				
				
				
				
				
//							$is_weixin = is_weixin();
//							if ($is_weixin) {
//									$state = md5(uniqid(rand(), TRUE));
//									session('state', $state);
//									$login_url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx0a5face51bfd15e1&redirect_uri=' . urlencode(__HOST__ . U('passport/wxstart')) . '&response_type=code&scope=snsapi_userinfo&state=' . $state . '#wechat_redirect';
//									header("location:{$login_url}");
//									die;
//							}				
				
//				$login_url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx0a5face51bfd15e1&redirect_uri=' . urlencode(__HOST__ . U('passport/wxstart')) . '&response_type=code&scope=snsapi_userinfo&state=' . $state . '#wechat_redirect';
//				header("location:{$login_url}");
									
//				$is_weixin = is_weixin();
//				if ($is_weixin) {
	                
					$wx_back_url = 'http://aihuaqian.boshang3710.com/user/member/index';
			cookie('wx_back_url', $wx_back_url);
			cookie('back_url', $wx_back_url);
			session('backurl', $wx_back_url);
	
	
					$this->fengmiMsg('恭喜您，注册成功！', U('wap/passport/wxlogin'));
//				} else {
//					$this->fengmiMsg('恭喜您，注册成功！', U('user/member/index'));
//				}

            }
            $this->error(D('Passport')->getError());
        } else {
			
			$wx_back_url = 'http://aihuaqian.boshang3710.com/user/member/index';
			cookie('wx_back_url', $wx_back_url);
			cookie('back_url', $wx_back_url);
			session('backurl', $wx_back_url);

			
            //分销开始
            
			$fuid = $_GET['fuid'];
			if ($fuid) {
			}else{
				$fuid = (int)cookie('fuid');
				if ($fuid) {
				} else {
					$fuid = (int)cookie('invite_id');
				}
			}
            if ($fuid) {
				
				$fuid = (int)cookie('fuid');
			    $invite_id = (int)cookie('invite_id');
				
                $profit_min_rank_id = (int) $this->_CONFIG['profit']['profit_min_rank_id'];
                $fuser = D('Users')->find($fuid);
                if ($fuser) {
                    $flag = false;
                    if ($profit_min_rank_id) {
                        $modelRank = D('Userrank');
                        $rank = $modelRank->find($profit_min_rank_id);
                        $userRank = $modelRank->find($fuser['rank_id']);
                        if ($rank) {
                            if ($userRank && $userRank['prestige'] >= $rank['prestige']) {
                                $flag = true;
                            } else {
                                $flag = false;
                            }
                        } else {
                            $flag = false;
                        }
                    } else {
                        $flag = true;
                    }
                    $fuser['nickname'] = empty($fuser['nickname']) ? $fuser['account'] : $fuser['nickname'];
                    if ($flag) {
                        $this->assign('fuser', $fuser);
                    }
                }
            }
			
				//echo '微信内置浏览器';
				 // header('Location:' . U('/wap/passport/wxlogin'));
				 //header('Location:' . U('/wap/index/index'));
				 // $this->wxlogin();
                 //die;
				 
				 
/*					if (empty($this->uid)) { 
						
						$is_weixin = is_weixin();
							if ($is_weixin) {
									$state = md5(uniqid(rand(), TRUE));
									session('state', $state);
									$login_url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx0a5face51bfd15e1&redirect_uri=' . urlencode(__HOST__ . U('passport/wxstart')) . '&response_type=code&scope=snsapi_userinfo&state=' . $state . '#wechat_redirect';
									header("location:{$login_url}");
									die;
							}
					}				 
*/				 
				 
				 
				 
				 
				 
			
			
            //分销结束
            $this->display();
        }
    }
    private function createCheck()
    {
        $data = $this->checkFields($this->_post('data', false), $this->create_fields);
		

		$data['fuid1'] = htmlspecialchars($_POST['fuid1']);
		
		$_POST['tjrmobile'] = trim($_POST['tjrmobile']);
		$tjrmobile = htmlspecialchars($_POST['tjrmobile']);
		$tjrmobile = str_replace("请输入推荐人手机","",$tjrmobile);
		if ( strlen($tjrmobile) > 10 ) {
			$this->fengmiMsg($tjrmobile);
			if (!isMobile($tjrmobile)) {
				$this->fengmiMsg('推广手机号不正确，请检查~');
			} 
			if ($tjruser = D('Users')->where(array('mobile' => $tjrmobile))->find()) {
				$data['fuid1'] = (int)$tjruser['user_id'];
			}
		}
		
        //微信自动分享
        $data['account'] = htmlspecialchars($_POST['account']);
		$data['account'] = str_replace("请输入手机号码","",$data['account']);
        if (!isMobile($data['account'])) {
            session('verify', null);
            $this->fengmiMsg('只允许手机号注册，请检查~');
        }
        $data['password'] = htmlspecialchars($data['password']);
        //整合UC的时候需要
        $register_password = $this->_CONFIG['register']['register_password'];
        if (empty($data['password']) || strlen($data['password']) < $register_password) {
            session('verify', null);
            $this->fengmiMsg('请输入正确的密码!密码长度必须要在' . $register_password . '个字符以上', 2000, true);
        }
		$ext0 = htmlspecialchars(trim($_POST['ext0']));
		$ext0 = str_replace("请输入真实姓名(选填)","",$ext0);
		if ( strlen(trim($_POST['ext0'])) > 1 ) {
			$data['nickname'] = $ext0;
		} else {
			$data['nickname'] = $data['account'];
		}
        $data['token'] = $data['token'];
		
        $data['ext0'] = $ext0;
        //兼容UCENTER
        $data['mobile'] = $data['account'];
        $data['reg_ip'] = get_client_ip();
        $data['reg_time'] = NOW_TIME;
        return $data;
    }
    public function sendsms()
    {
        if (!($mobile = htmlspecialchars($_POST['mobile']))) {
            die('请输入正确的手机号码');
        }
        if (!isMobile($mobile)) {
            die('请输入正确的手机号码');
        }
        if ($user = D('Users')->getUserByAccount($mobile)) {
            die('手机号码已经存在！');
        }
        $wap_register_yzm = $this->_CONFIG['register']['wap_register_yzm'];
        if ($wap_register_yzm == 1) {
            $sms_yzm = htmlspecialchars($_POST['sms_yzm']);
            if (strtolower($sms_yzm) != strtolower(session('verify'))) {
                session('verify', null);
                die('请输入正确的验证码后获取手机短信');
            }
        }
        $randstring = session('scode');
        if (empty($randstring)) {
            $randstring = rand_string(4, 1);
            session('scode', $randstring);
        }
        if ($this->_CONFIG['sms']['dxapi'] == 'dy') {
            D('Sms')->DySms($this->_CONFIG['site']['sitename'], 'sms_yzm', $mobile, array('sitename' => $this->_CONFIG['site']['sitename'], 'code' => $randstring));
        } else {
            D('Sms')->sendSms('sms_code', $mobile, array('code' => $randstring));
        }
        die('1');
    }
    public function bind()
    {
        $this->display();
    }
    public function index()
    {
        $this->redirect('login');
    }
    public function login()
    {
		$shop_id =  I('get.shop_id');
        if ((int)$shop_id>0) {
			$wx_back_url = 'http://aihuaqian.boshang3710.com/user/money/myindex/shop_id/'.$shop_id;
			cookie('wx_back_url', $wx_back_url);
			cookie('back_url', $wx_back_url);
			session('backurl', 'http://aihuaqian.boshang3710.com/user/money/myindex/shop_id/'.$shop_id);
		} else {
			$wx_back_url = 'http://aihuaqian.boshang3710.com/user/member/index';
			cookie('wx_back_url', $wx_back_url);
			cookie('back_url', $wx_back_url);
			session('backurl', $wx_back_url);
	
		}
        if ($this->isPost()) {
            $account = $this->_post('account');
            if (empty($account)) {
                $this->fengmiMsg('请输入用户名!');
            }
            $password = $this->_post('password');
            if (empty($password)) {
                $this->fengmiMsg('请输入登录密码!');
            }
            $backurl = $this->_post('backurl', 'htmlspecialchars');
            if (empty($backurl)) {
				
					$backurl = U('user/member/index');
                
            }
            if (true == D('Passport')->login($account, $password)) {
                $this->fengmiMsg('恭喜您登录成功！', $backurl);
            } else {
                $this->fengmiMsg(D('Passport')->getError());
            }
        } else {
            if (!empty($_SERVER['HTTP_REFERER']) && strstr($_SERVER['HTTP_REFERER'], $_SERVER['HTTP_HOST']) && !strstr($_SERVER['HTTP_REFERER'], 'passport')) {
               $backurl = $_SERVER['HTTP_REFERER'];
            } else {
				if ( strlen(cookie('wx_back_url')) > 1 ) {
				    $backurl = cookie('wx_back_url');
				} elseif( strlen( session('backurl') ) > 1 ) {
					$backurl = session('backurl');
				} elseif( strlen( cookie('back_url') ) > 1 ) {
					$backurl = cookie('backurl');
				}  else {
					$backurl = U('user/member/index/#01');
				}
				
				//$backurl = U('user/member/index');
            }
            $this->assign('backurl', $backurl);
			
			
			//if (empty($this->uid)) {
				$is_weixin = is_weixin();
				if ($is_weixin) {
//				    if (strpos(cookie('wx_back_url'), 'myindex/shop_id') !== false) {
//				        header('Location:' . cookie('wx_back_url'));
//					    die;
//			        } elseif (strpos(session('backurl'), 'myindex/shop_id') !== false) {
//				        header('Location:' . session('backurl'));
//					    die;
//			        }  else {
//						header('Location:' . $backurl);
//					    die;
//					}
				}
			//}
			
			
			
            $this->display();
        }
    }
    public function wblogin(){
        $login_url = 'https://api.weibo.com/oauth2/authorize?client_id=' . $this->_CONFIG['connect']['wb_app_id'] . '&response_type=code&redirect_uri=' . urlencode(__HOST__ . U('passport/wbcallback'));
        header("Location:{$login_url}");
        die;
    }
    public function qqlogin(){
        $state = md5(uniqid(rand(), TRUE));
        session('state', $state);
        $login_url = 'https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=' . $this->_CONFIG['connect']['qq_app_id'] . '&redirect_uri=' . urlencode(__HOST__ . U('passport/qqcallback')) . '&state=' . $state . '&scope=';
        header("Location:{$login_url}");
        die;
    }
    public function wxlogin(){
        $state = md5(uniqid(rand(), TRUE));
        if ( strlen(cookie('wx_back_url')) == 0 ) {
			cookie('wx_back_url', $_SERVER['HTTP_REFERER']);
		}
        session('state', $state);
		
		$shop_id =  I('get.shop_id');
		if ( $shop_id  ) {
			$wx_back_url = 'http://aihuaqian.boshang3710.com/user/money/myindex/shop_id/'.$shop_id;
			cookie('wx_back_url', $wx_back_url);
			cookie('back_url', $wx_back_url);
			session('backurl', $wx_back_url);
		}
		
//		header("Location: " . U('Wap/passport/login'));
//      die;
		
		
		
		
        $login_url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $this->_CONFIG['weixin']['appid'] . '&redirect_uri=' . urlencode(__HOST__ . U('passport/wxcallback')) . '&response_type=code&scope=snsapi_base&state=' . $state . '#wechat_redirect';
        header("Location:{$login_url}");
        die;
    }
    public function wbcallback()
    {
        import('@/Net.Curl');
        $curl = new Curl();
        $params = array('grant_type' => 'authorization_code', 'code' => $_REQUEST['code'], 'client_id' => $this->_CONFIG['connect']['wb_app_id'], 'client_secret' => $this->_CONFIG['connect']['wb_app_key'], 'redirect_uri' => __HOST__ . U('passport/qqcallback'));
        $url = 'https://api.weibo.com/oauth2/access_token';
        $response = $curl->post($url, http_build_query($params));
        $params = json_decode($response, true);
        if (isset($params['error'])) {
            echo '<h3>error:</h3>' . $params['error'];
            echo '<h3>msg  :</h3>' . $params['error_code'];
            die;
        }
        $url = 'https://api.weibo.com/2/account/get_uid.json?source=' . $this->_CONFIG['connect']['wb_app_key'] . '&access_token=' . $params['access_token'];
        $result = $curl->get($url);
        $user = json_decode($result, true);
        if (isset($user['error'])) {
            echo '<h3>error:</h3>' . $user['error'];
            echo '<h3>msg  :</h3>' . $user['error_code'];
            die;
        }
        $data = array('type' => 'weibo', 'open_id' => $user['uid'], 'token' => $params['access_token']);
        $this->thirdlogin($data);
    }
    public function wxcallback()
	
    {
		
		
        if ($_REQUEST['state'] == session('state')) {
            import('@/Net.Curl');
            $curl = new Curl();
            if (empty($_REQUEST['code'])) {
//				header("Location: " . U('Wap/passport/login'));
//                 die;
                $this->error('授权后才能登陆！', U('passport/login'));
            }
			
            $token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $this->_CONFIG['weixin']['appid'] . '&secret=' . $this->_CONFIG['weixin']['appsecret'] . '&code=' . $_REQUEST['code'] . '&grant_type=authorization_code';
            $str = $curl->get($token_url);
            $params = json_decode($str, true);
            if (!empty($params['errcode'])) {
                echo '<h3>error:</h3>' . $params['errcode'];
                echo '<h3>msg  :</h3>' . $params['errmsg'];
                die;
            }
			
            if (empty($params['openid'])) {
//				header("Location: " . U('Wap/passport/login'));
//                 die;
                $this->error('登录失败', U('passport/login'));
				
            }
			//$this->error(print_r($params));
//			$access_token = $this->getAccessToken();
//			 $mydata = json_decode(file_get_contents("access_token.json"));
//             $access_token = $mydata->access_token;
//			$wx_user_info = D('Connect')->wx_user_info($params['openid'], $access_token);
//			$myurl = 'https://api.weixin.qq.com/cgi-bin/user/info?access_token='.$access_token.'&openid='.$params['open_id'].'&lang=zh_CN';
//			$mystr = $curl->get($myurl);
//			$wx_user_info = json_decode($mystr, true);
           // $data = array('type' => 'weixin', 'open_id' => $params['openid'], 'token' => $params['refresh_token'], 'nickname' => $wx_user_info['nickname'], 'headimgurl' => $wx_user_info['headimgurl'],'unionid' => $wx_user_info['unionid'],'province' => $wx_user_info['province']);
			
			$info_url = 'https://api.weixin.qq.com/sns/userinfo?access_token=' . $params['access_token'] . '&openid=' . $params['openid'] . '&lang=zh_CN';
            $info = $curl->get($info_url);
            $info = json_decode($info, true);
            $data = array(
				'type' => 'weixin', 
				'open_id' => $params['openid'], 
				'token' => $params['refresh_token'], 
				'nickname' => $info['nickname'], 
				'headimgurl' => $info['headimgurl'],
				'unionid' => $info['unionid'],
				'province' => $info['province']
			);								
			
			
            $this->thirdlogin($data);
        } else {
			header("Location: " . U('Wap/passport/login'));
            die;	
		}
    }
	
    public 	function getAccessToken() {
    // access_token 应该全局存储与更新，以下代码以写入到文件中做示例
	
	
    $data = json_decode(file_get_contents("access_token.json"));
    if ($data->expire_time < time()) {
      // 如果是企业号用以下URL获取access_token
      // $url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$this->appId&corpsecret=$this->appSecret";
      $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appId&secret=$this->appSecret";
      $res = json_decode($this->httpGet($url));
      $access_token = $res->access_token;
      if ($access_token) {
        $data->expire_time = time() + 7000;
        $data->access_token = $access_token;
        $fp = fopen("access_token.json", "w");
        fwrite($fp, json_encode($data));
        fclose($fp);
      }
    } else {
      $access_token = $data->access_token;
    }
    return $access_token;
  }
	
    public function qqcallback()
    {
        import('@/Net.Curl');
        $curl = new Curl();
        if ($_REQUEST['state'] == session('state')) {
            $token_url = 'https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&' . 'client_id=' . $this->_CONFIG['connect']['qq_app_id'] . '&redirect_uri=' . urlencode(__HOST__ . U('passport/qqcallback')) . '&client_secret=' . $this->_CONFIG['connect']['qq_app_key'] . '&code=' . $_REQUEST['code'];
            $response = $curl->get($token_url);
            if (strpos($response, 'callback') !== false) {
                $lpos = strpos($response, '(');
                $rpos = strrpos($response, ')');
                $response = substr($response, $lpos + 1, $rpos - $lpos - 1);
                $msg = json_decode($response);
                echo '<h3>error:</h3>' . $msg->error;
                echo '<h3>msg  :</h3>' . $msg->error_description;
                die;
            }
            $params = array();
            parse_str($response, $params);
            if (empty($params)) {
                die;
            }
            $graph_url = 'https://graph.qq.com/oauth2.0/me?access_token=' . $params['access_token'];
            $str = $curl->get($graph_url);
            if (strpos($str, 'callback') !== false) {
                $lpos = strpos($str, '(');
                $rpos = strrpos($str, ')');
                $str = substr($str, $lpos + 1, $rpos - $lpos - 1);
            }
            $user = json_decode($str, true);
            if (isset($user['error'])) {
                echo '<h3>error:</h3>' . $user['error'];
                echo '<h3>msg  :</h3>' . $user['error_description'];
                die;
            }
            if (empty($user['openid'])) {
                die;
            }
            $data = array('type' => 'qq', 'client_id' => $user['client_id'], 'open_id' => $user['openid'], 'token' => $params['access_token']);
            $this->thirdlogin($data);
        }
    }
    public function wxstart()
    {
        if ($_REQUEST['state'] == session('state')) {
            import('@/Net.Curl');
            $curl = new Curl();
            if (empty($_REQUEST['code'])) {
                $this->error('授权后才能登陆！', U('passport/login'));
            }
            $token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $this->_CONFIG['weixin']['appid'] . '&secret=' . $this->_CONFIG['weixin']['appsecret'] . '&code=' . $_REQUEST['code'] . '&grant_type=authorization_code';
            $str = $curl->get($token_url);
            $params = json_decode($str, true);
            if (!empty($params['errcode'])) {
                echo '<h3>error:</h3>' . $params['errcode'];
                echo '<h3>msg  :</h3>' . $params['errmsg'];
                die;
            }
            if (empty($params['openid'])) {
                $this->error('登录失败', U('passport/login'));
            }
            $info_url = 'https://api.weixin.qq.com/sns/userinfo?access_token=' . $params['access_token'] . '&openid=' . $params['openid'] . '&lang=zh_CN';
            $info = $curl->get($info_url);
            $info = json_decode($info, true);
            $data = array(
				'type' => 'weixin', 
				'open_id' => $params['openid'], 
				'token' => $params['refresh_token'], 
				'nickname' => $info['nickname'], 
				'headimgurl' => $info['headimgurl']
			);
            $this->wxconn($data);
        }
    }
    //微信自动注册为用户
    private function wxconn($data) {
        $connect = D('Connect')->getConnectByOpenid($data['type'], $data['open_id']);
        if (empty($connect)) {
            $connect = $data;
            $connect['connect_id'] = D('Connect')->add($data);
        } else {
            D('Connect')->save(array('connect_id' => $connect['connect_id'], 'token' => $data['token'], 'nickname' => $data['nickname'], 'headimgurl' => $data['headimgurl']));
        }
        if (empty($connect['uid'])) {
            session('connect', $connect['connect_id']);
            // 用户数据整理
            $host = explode('.', $this->_CONFIG['site']['host']);
            $account = uniqid() . '@hmd.com' ;
            if ($data['nickname'] == '') {
                $nickname = $data['type'] . $connect['connect_id'];
            } else {
                $nickname = $data['nickname'];
            }
            $user = array(
				'account' => $account, 
				'password' => rand(10000000, 999999999), 
				'nickname' => $nickname, 
				'ext0' => $nickname, 
				'face' => $data['headimgurl'], 
				'token' => $data['token'], 
				'reg_time' => NOW_TIME, 
				'reg_ip' => get_client_ip()
			);
			
			$fuid = (int)cookie('fuid');	
			if ( $fuid  ) {
			} else {
				$fuid = (int)cookie('invite_id');	
			} 
			$fuser = D('Users')->find($fuid);
			if ($fuser) {
				if  ( (int)$fuser['user_id']<>(int)$this->uid ) {
					$user['fuid1'] = $fuser['user_id'];
				}
				if  ( (int)$fuser['fuid1']<>(int)$this->uid ) {
					$user['fuid2'] = (int)$fuser['fuid1'];
				}
				if  ( (int)$fuser['fuid2']<>(int)$this->uid ) {
					$user['fuid3'] = (int)$fuser['fuid2'];
				}
			}
            //注册用户资料
            if (!D('Passport')->register($user)) {
                $this->error('创建帐号失败');
            }
            // 注册第三方接口
            $token = D('Passport')->getToken();
            $connect['uid'] = $token['uid'];
            D('Connect')->save(array('connect_id' => $connect['connect_id'], 'uid' => $connect['uid']));// 注册成功智能跳转
            $backurl = session('backurl');
			
			$backurl = strtolower($backurl);
			if(strpos($backurl,'/login')!== false){ 
				$backurl = U('user/member/index/#02');
			}
			
			setcookie("fuid", "", time() - 3600, "/");
			setcookie("invite_id", "", time() - 3600, "/");
			
            if (!empty($backurl)) {
                header("Location:{$backurl}");
            } else {
                header('Location:' . U('user/member/index/#02'));
            }
        } else {
            setuid($connect['uid']);
            session('access', $connect['connect_id']);
            // 注册成功智能跳转
            $backurl = session('backurl');
			
			$backurl = strtolower($backurl);
			if(strpos($backurl,'/login')!== false){ 
				$backurl = U('user/member/index/#02');
			}
			
			setcookie("fuid", "", time() - 3600, "/");
			setcookie("invite_id", "", time() - 3600, "/");
            if (!empty($backurl)) {
                header("Location:{$backurl}");
            } else {
                header('Location:' . U('user/member/index/#03'));
            }
        }
        die;
    }
    private function thirdlogin($data){
		
        if ($this->_CONFIG['connect']['debug']) {
			

            $connect = D('Connect')->getConnectByOpenid($data['type'], $data['open_id']);
            if (empty($connect)) {
                $connect = $data;
                $connect['connect_id'] = D('Connect')->add($data);
            } else {
                D('Connect')->save(array('connect_id' => $connect['connect_id'], 'token' => $data['token'], 'nickname' => $data['nickname'], 'headimgurl' => $data['headimgurl']));
            }
            //如果是qq登录则获取
            if ($data['type'] == 'qq') {
                $user_info = D('Connect')->user_info($data['client_id'], $data['open_id'], $data['token']);
                $nickname = $user_info['nickname'];
                $face = $user_info['figureurl_qq_2'] == '' ? $user_info['figureurl_qq_1'] : $user_info['figureurl_qq_2'];
            }
			
			
			
            //结束
            if (empty($connect['uid'])) {
				
				if (empty($this->uid)) {
					
					header("Location: " . U('Wap/passport/register'));
                    die;
					
//					$account = $data['type'] . rand(100000, 999999) . '@wx.com';
//					$user = array('account' => $account, 'password' => rand(100000, 999999), 'nickname' => $data['nickname'], 'face' => $data['headimgurl'], 'ext0' => $data['nickname'],'token' => $data['token'],  'create_time' => NOW_TIME, 'create_ip' => get_client_ip());
//					if (!D('Passport')->register($user)) {
//						//$this->error('创建帐号失败');
//					}
				}
                 
                $token = D('Passport')->getToken();
				if ( (int)$token['uid'] > 0 ) {
					$connect['uid'] = $token['uid'];
				} else {
					$connect['uid'] = $this->uid;
				}
                D('Connect')->save(array('connect_id' => $connect['connect_id'], 'uid' => $connect['uid'], 'nickname' => $data['nickname'], 'headimgurl' => $data['headimgurl'], 'unionid' => $data['unionid'] ));
				D('Users')->save(array('user_id' => $connect['uid'], 'nickname' => $data['nickname'], 'face' => $data['headimgurl'],  'province' => $data['province'],'token' => $data['token']));
				
            }
            setuid($connect['uid']);
            session('access', $connect['connect_id']);
			
			if ( (int)$connect['uid'] > 0 ) {
				$gerenshuju_count = M('Users')->where(" fuid1 = '".$connect['uid']."' ")->count(); 
				if ( (int)$gerenshuju_count > 0  ) {
					D('Users')->save(array('user_id' => $connect['uid'], 'gerenshuju' => $gerenshuju_count));
				}
				$tuanduishuju_count = M('Users')->where(" shangxianjihe LIKE '%,".$connect['uid'].",%' ")->count(); 
				if ( (int)$tuanduishuju_count > 0 ) { 
					D('Users')->save( array('user_id' => $connect['uid'], 'tuanduishuju' => $tuanduishuju_count) );
				}
			}
			    //D('connect')->where(' uid is null or uid = 0')->delete(); 
				
			    if ( strlen(cookie('wx_back_url')) > 1 ) {
				    $backurl = cookie('wx_back_url');
				} elseif( strlen( session('backurl') ) > 1 ) {
					$backurl = session('backurl');
				} elseif( strlen( cookie('back_url') ) > 1 ) {
					$backurl = cookie('backurl');
				}  else {
					$backurl = U('user/member/index/#04');
				}
				$backurl = strtolower($backurl);
				if(strpos($backurl,'port/login')!== false){ 
				    $backurl = U('user/member/index/#04');
				}
				if(strpos($backurl,'port/register')!== false){ 
					$backurl = U('user/member/index/#05');
				}
                header('Location:' . $backurl);
			
			
            //header('Location:' . U('user/member/index'));
            die;
        } else {
            $connect = D('Connect')->getConnectByOpenid($data['type'], $data['open_id']);
            if (empty($connect)) {
                $connect = $data;
                $connect['connect_id'] = D('Connect')->add($data);
            } else {
                D('Connect')->save(array('connect_id' => $connect['connect_id'], 'token' => $data['token'], 'nickname' => $data['nickname'], 'headimgurl' => $data['headimgurl']));
            }
			
            if (empty($connect['uid'])) {
                session('connect', $connect['connect_id']);
                header('Location: ' . U('passport/bind'));
            } else {
                setuid($connect['uid']);
                session('access', $connect['connect_id']);
				
				if ( strlen(cookie('wx_back_url')) > 1 ) {
				    $backurl = cookie('wx_back_url');
				} elseif( strlen( session('backurl') ) > 1 ) {
					$backurl = session('backurl');
				} elseif( strlen( cookie('back_url') ) > 1 ) {
					$backurl = cookie('backurl');
				}  else {
					$backurl = U('user/member/index/#05');
				}
			     
				$backurl = strtolower($backurl);
				if(strpos($backurl,'/login')!== false){ 
				    $backurl = U('user/member/index/#05');
				} 
			
                header('Location:' . $backurl);
				
				
               // header('Location:' . U('user/member/index'));
            }
            die;
        }
    }
    public function logout()
    {
        cookie('BAOCMS_TOKEN', 0);
        cookie('goods', null);
        D('Passport')->logout();
        $this->success('退出登录成功！', U('Wap/passport/login'));
    }
    public function weixincheck()
    {
        $state = $this->_param('state');
        if (empty($state)) {
            $this->error('非法访问', U('wap/index/index'));
        }
        if ($this->uid) {
            $wxconn = D('Weixinconn')->where(array('state' => $state))->find();
            $data = array();
            $data['conn_id'] = $wxconn['conn_id'];
            $data['status'] = 1;
            $data['user_id'] = $this->uid;
            D('Weixinconn')->save($data);
            $this->success('扫描成功，请等待电脑端响应！', U('user/member/index'));
        }
    }
    public function forget(){
        $way = (int) $this->_param('way');
        $this->assign('way', $way);
        $this->display();
    }
    public function newpwd()
    {
        $account = $this->_post('account');
        if (empty($account)) {
            session('verify', null);
            $this->fengmiMsg('请输入用户名!');
        }
        $user = D('Users')->getUserByAccount($account);
        if (empty($user)) {
            session('verify', null);
            $this->fengmiMsg('用户不存在!');
        }
        $way = (int) $this->_param('way');
        $password = rand_string(8, 1);
        if ($way == 1) {
            $yzm = $this->_post('yzm');
            if (strtolower($yzm) != strtolower(session('verify'))) {
                session('verify', null);
                $this->fengmiMsg('验证码不正确!');
            }
            $email = $this->_post('email');
            if (empty($email) || $email != $user['email']) {
                $this->fengmiMsg('邮件不正确');
            }
            D('Passport')->uppwd($user['account'], '', $password);
            D('Email')->sendMail('email_newpwd', $email, '重置密码', array('newpwd' => $password));
        } elseif ($way == 2) {
            $mobile = htmlspecialchars($_POST['mobile']);
            if (!($scode = trim($_POST['scode']))) {
                $this->fengmiMsg('请输入短信验证码！');
            }
            $scode2 = session('scode');
            if (empty($scode2)) {
                $this->fengmiMsg('请获取短信验证码！');
            }
            if ($scode != $scode2) {
                $this->fengmiMsg('请输入正确的短信验证码！');
            }
            D('Passport')->uppwd($user['account'], '', $password);
            if ($this->_CONFIG['sms']['dxapi'] == 'dy') {
                D('Sms')->DySms($this->_CONFIG['site']['sitename'], 'sms_user_newpwd', $mobile, array(
					'sitename' => $this->_CONFIG['site']['sitename'], 
					'newpwd' => $password
				));
            } else {
                D('Sms')->sendSms('sms_newpwd', $mobile, array('sitename' => $this->_CONFIG['site']['sitename'], 'newpwd' => $password));
            }
        }
        $this->fengmiMsg('重置密码成功！', U('passport/suc', array('way' => $way)));
    }
    public function findsms()
    {
        if (!($mobile = htmlspecialchars($_POST['mobile']))) {
            die('请输入正确的手机号码');
        }
        if (!isMobile($mobile)) {
            die('请输入正确的手机号码');
        }
        if (!($account = htmlspecialchars($_POST['account']))) {
            die('请填写账号');
        }
        if ($user = D('Users')->getUserByAccount($account)) {
            if (empty($user['mobile'])) {
                die('你还未绑定手机号，请选择其他方式！');
            } else {
                if ($user['mobile'] != $mobile) {
                    die('请填写您的绑定手机号！');
                }
            }
        }
        $randstring = session('scode');
        if (empty($randstring)) {
            $randstring = rand_string(4, 1);
            session('scode', $randstring);
        }
        //大鱼短信
        if ($this->_CONFIG['sms']['dxapi'] == 'dy') {
            D('Sms')->DySms($this->_CONFIG['site']['sitename'], 'sms_yzm', $mobile, array(
				'sitename' => $this->_CONFIG['site']['sitename'], 
				'code' => $randstring));
        } else {
            D('Sms')->sendSms('sms_code', $mobile, array('code' => $randstring));
        }
        die('1');
    }
    public function suc()
    {
        $way = (int) $this->_get('way');
        switch ($way) {
            case 1:
                $this->success('密码重置成功！请登录邮箱查看！', U('passport/login'));
                break;
            default:
                $this->success('密码重置成功！请查看验证手机！', U('passport/login'));
                break;
        }
    }
    //增加的
    public function avatar($user_id)
    {
        $user = D('Users')->find($user_id);
        if ($user['face'] != '') {
            $fileres = file_get_contents($this->CONFIG['site']['host'] . "/attachs/{$user['face']}");
        } else {
            $fileres = file_get_contents($this->CONFIG['site']['host'] . '/attachs/avatar.jpg');
        }
        header('Content-type:image/jpg');
        echo $fileres;
    }
}