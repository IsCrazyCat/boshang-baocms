/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.5.5-10.1.8-MariaDB : Database - zhaopin.weixinguanfang.com
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`zhaopin.weixinguanfang.com` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `zhaopin.weixinguanfang.com`;

/*Table structure for table `tu_activity` */

DROP TABLE IF EXISTS `tu_activity`;

CREATE TABLE `tu_activity` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) DEFAULT '0',
  `shop_id` int(10) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT '0',
  `city_id` int(11) unsigned DEFAULT '0',
  `area_id` int(11) unsigned DEFAULT '0',
  `business_id` int(11) unsigned DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `thumb` text,
  `details` text,
  `price` decimal(32,0) DEFAULT NULL,
  `bg_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `time` varchar(64) DEFAULT NULL,
  `sign_end` date DEFAULT NULL,
  `addr` varchar(1024) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  `audit` tinyint(2) DEFAULT '0',
  `closed` tinyint(2) DEFAULT '0',
  `sign_num` int(10) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `template` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_activity` */

/*Table structure for table `tu_activity_cate` */

DROP TABLE IF EXISTS `tu_activity_cate`;

CREATE TABLE `tu_activity_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` tinyint(3) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_activity_cate` */

insert  into `tu_activity_cate`(`cate_id`,`cate_name`,`parent_id`,`orderby`) values (2,'活动一级分类',0,1);

/*Table structure for table `tu_activity_sign` */

DROP TABLE IF EXISTS `tu_activity_sign`;

CREATE TABLE `tu_activity_sign` (
  `sign_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`sign_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_activity_sign` */

/*Table structure for table `tu_ad` */

DROP TABLE IF EXISTS `tu_ad`;

CREATE TABLE `tu_ad` (
  `ad_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0',
  `city_id` int(11) unsigned DEFAULT '0',
  `user_id` int(11) DEFAULT NULL COMMENT '购买人ID',
  `title` varchar(64) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `code` varchar(1024) DEFAULT NULL,
  `prestore_integral` int(11) DEFAULT '0' COMMENT '预存积分',
  `click` int(11) NOT NULL DEFAULT '0',
  `is_target` tinyint(1) NOT NULL DEFAULT '0',
  `bg_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reset_time` int(11) DEFAULT NULL COMMENT '点击量更新时间',
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ad` */

insert  into `tu_ad`(`ad_id`,`site_id`,`city_id`,`user_id`,`title`,`link_url`,`photo`,`code`,`prestore_integral`,`click`,`is_target`,`bg_date`,`end_date`,`reset_time`,`closed`,`orderby`) values (213,57,0,NULL,'手机首页720*240','https://zhaopin.weixinguanfang.com/wap/ele','/attachs/2019/11/25/5ddb4a8ff104c.jpg','',770,9,0,'2018-01-13','2022-01-20',NULL,0,1),(214,62,0,NULL,'房产楼盘','https://www.baidu.com','http://images4.5maiche.cn/2018-01-14_5a5b0f848d42d.png','汇聚每日新房',0,0,0,'2018-01-14','2020-01-16',NULL,0,1),(215,63,0,NULL,'求职招聘','https://zhaopin.weixinguanfang.com/wap/life','http://images4.5maiche.cn/2018-01-14_5a5b0fca98c6f.png','更多人才招聘',0,0,0,'2018-01-14','2020-12-31',NULL,0,2),(216,64,0,NULL,'贴吧信息','http://zhaopin.weixinguanfang.com/wap/thread','http://images4.5maiche.cn/2018-01-14_5a5b0fec882e1.png','头条早知道',0,0,0,'2018-01-14','2020-01-16',NULL,0,3),(217,65,0,NULL,'小区家政','http://zhaopin.weixinguanfang.com/wap/appoint','http://images4.5maiche.cn/2018-01-14_5a5b10089ad16.png','最好的技师在这里',0,0,0,'2018-01-14','2020-01-16',NULL,0,4),(218,57,0,NULL,'测试站内信推送','http://zhaopin.weixinguanfang.com','/attachs/2019/11/25/5ddb4aa571e0f.png','',0,0,0,'2018-01-14','2020-01-23',NULL,0,0),(219,67,0,NULL,'顶部广告','http://www.juhucms.com/forum-36-1.html','/attachs/2018/05/31/5b0f72c4f2ba1.jpg','',0,0,0,'2015-04-30','2022-05-18',NULL,0,1),(220,2,0,NULL,'首页轮播','','/attachs/2018/05/22/5b03afd24e905.jpg','',0,0,0,'2016-05-19','2022-05-19',NULL,0,1),(221,1,0,NULL,'首页轮播','http://zhaopin.weixinguanfang.com','/attachs/2018/05/23/5b04f01d19ba5.png','',0,9,0,'2013-05-02','2020-06-06',NULL,0,1),(222,1,0,NULL,'首页轮播2','http://zhaopin.weixinguanfang.com','/attachs/2018/05/23/5b04f02a6dac0.png','',0,7,0,'2016-05-19','2021-05-22',NULL,0,2),(223,14,0,NULL,'外卖','www.juhucms.com','/attachs/2018/05/31/5b0fa8ddc35b0.jpg','',0,6,0,'2018-05-08','2022-05-13',NULL,0,1);

/*Table structure for table `tu_ad_record` */

DROP TABLE IF EXISTS `tu_ad_record`;

CREATE TABLE `tu_ad_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(11) DEFAULT NULL COMMENT '用户ID',
  `title` varchar(30) DEFAULT NULL COMMENT '广告名称',
  `active_time` tinyint(1) NOT NULL DEFAULT '0' COMMENT '有效时间（单位月）',
  `prestore_integral` int(11) DEFAULT NULL COMMENT '预存积分',
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `ad_id` int(11) DEFAULT NULL COMMENT '广告编号',
  `city_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ad_record` */

/*Table structure for table `tu_ad_record_logs` */

DROP TABLE IF EXISTS `tu_ad_record_logs`;

CREATE TABLE `tu_ad_record_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL COMMENT '城市ID',
  `site_id` int(11) DEFAULT NULL COMMENT '广告位',
  `id` int(11) DEFAULT NULL COMMENT '购买id',
  `user_id` tinyint(11) DEFAULT NULL COMMENT '用户ID',
  `nickname` varchar(64) DEFAULT NULL COMMENT '会员昵称',
  `title` varchar(30) DEFAULT NULL COMMENT '广告名称',
  `integral` int(11) DEFAULT NULL COMMENT '消耗积分',
  `intro` varchar(256) DEFAULT NULL COMMENT '说明',
  `link_url` varchar(128) DEFAULT NULL COMMENT '点击连接',
  `create_time` varchar(32) DEFAULT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ad_record_logs` */

/*Table structure for table `tu_ad_site` */

DROP TABLE IF EXISTS `tu_ad_site`;

CREATE TABLE `tu_ad_site` (
  `site_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(32) DEFAULT NULL,
  `site_name` varchar(64) DEFAULT NULL,
  `site_type` tinyint(1) DEFAULT NULL,
  `site_place` smallint(5) DEFAULT '0',
  `site_price` int(11) DEFAULT '0' COMMENT '广告位销售价格',
  PRIMARY KEY (`site_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ad_site` */

insert  into `tu_ad_site`(`site_id`,`theme`,`site_name`,`site_type`,`site_place`,`site_price`) values (1,'default','PC首页热门关注轮播图片广告位888',2,1,10),(2,'default','PC首页右侧轮播图片广告位',2,1,0),(3,'default','PC活动首页轮播图片广告位',2,3,0),(4,'default','PC上门服务图片广告位',2,4,0),(5,'default','PC商城首页3张轮播750*300',2,5,0),(6,'default','PC商城首页3张轮播下面250*100广告3张（1）上',2,5,0),(7,'default','PC商城首页3张轮播下面250*170广告3张（2）下',2,5,0),(8,'default','PC同城优购主页1楼图片广告',2,5,0),(9,'default','PC同城优购主页2楼图片广告',2,5,0),(10,'default','PC同城优购主页3楼图片广告',2,5,0),(11,'default','PC同城优购主页4楼图片广告',2,5,0),(12,'default','PC同城优购主页5楼图片广告',2,5,0),(13,'default','PC同城优购主页6楼图片广告',2,5,0),(14,'default','PC外卖首页轮播图片广告位',2,6,0),(15,'default','PC订座首页右侧轮播图片广告',2,7,0),(16,'default','PC订座列表右侧轮播图片广告',2,7,0),(17,'default','PC订座新单右侧轮播图片广告',2,7,0),(18,'default','PC订座热门右侧轮播图片广告',2,7,0),(19,'default','PC同城信息主页头部轮播图片广告位',2,8,0),(20,'default','PC同城信息主页右侧轮播图片广告位',2,8,0),(21,'default','PC同城信息主页底部轮播图片广告位',2,8,0),(22,'default','PC同城信息首页右侧轮播图片广告位',2,8,0),(23,'default','PC优惠券首页轮播图片广告位',2,9,0),(24,'default','PC积分商城首页轮播图片广告位',2,11,0),(25,'default','PC专题1首页图片广告位',2,13,0),(26,'default','PC专题2首页图片广告位',2,13,0),(27,'default','PC专题3首页图片广告位',2,13,0),(28,'default','PC专题4首页图片广告位',2,13,0),(29,'default','PC专题5首页图片广告位',2,13,0),(30,'default','手机活动首页720*240',2,18,10),(31,'default','手机家政首页720*240',2,19,12),(32,'default','手机农家乐首页720*240',2,23,121),(33,'default','手机拼车首页720*240',2,24,1),(34,'default','手机新闻首页720*240',2,25,5),(35,'default','手机乡村首页720*240',2,29,1),(81,'default','手机股权首页720*240',1,30,9),(37,'default','手机APP首页轮播图片广告位',2,33,0),(38,'default','PC酒店首页幻灯',2,34,0),(84,'red','随时',2,18,3),(57,'default','手机首页720*240',1,14,120),(59,'default','PC登录注册广告',2,33,0),(60,'default','PC一元云购首页轮播',1,12,0),(61,'default','手机小区首页720*240',1,28,2),(62,'default','wap首页4格_1_70*70',1,14,1),(63,'default','wap首页4格_2_70*70',1,14,0),(64,'default','wap首页4格_1_70*703',1,14,3),(65,'default','wap首页4格_4_70*704',1,14,4),(66,'default','pc新闻首页1200*200',1,4,0),(67,'default','pc全局顶部横幅1200*60',2,1,0),(68,'default','手机抢购首页720*240',1,15,10),(69,'default','PC贴吧1200*400',1,13,0),(70,'default','手机分类信息首页720*240',2,27,0),(83,'default','手机其他【店主精选】首页720*240',1,32,100),(73,'default','手机外卖首页720*240',2,20,0),(74,'default','手机大抢购',2,2,0),(75,'default','手机企业首页720*240',2,16,10),(77,'default','手机商城首页720*240',1,17,10),(78,'default','手机订座首页720*240',1,21,2),(79,'default','手机酒店首页720*240',1,22,3),(80,'default','手机积分商城首页720*240',1,26,8),(82,'default','手机云购首页720*240',1,31,9);

/*Table structure for table `tu_admin` */

DROP TABLE IF EXISTS `tu_admin`;

CREATE TABLE `tu_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `lock_admin_mum` int(11) DEFAULT '0',
  `is_admin_lock` tinyint(1) DEFAULT '0',
  `is_admin_lock_time` int(10) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `is_ip` tinyint(1) NOT NULL DEFAULT '0',
  `is_username_lock` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_admin` */

insert  into `tu_admin`(`admin_id`,`username`,`password`,`role_id`,`city_id`,`mobile`,`lock_admin_mum`,`is_admin_lock`,`is_admin_lock_time`,`create_time`,`create_ip`,`last_time`,`last_ip`,`is_ip`,`is_username_lock`,`closed`) values (1,'admin','7fef6171469e80d32c0559f88b377245',1,0,'15000000000',0,0,0,1441880203,'127.0.0.1',1575339605,'61.156.248.146',0,0,0),(69,'admin2','e10adc3949ba59abbe56e057f20f883e',13,0,'17162729877',0,0,0,1526973282,'111.37.71.184',1575339605,'61.156.248.146',0,0,0);

/*Table structure for table `tu_admin_action_logs` */

DROP TABLE IF EXISTS `tu_admin_action_logs`;

CREATE TABLE `tu_admin_action_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL COMMENT '城市',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型',
  `admin_id` int(11) DEFAULT NULL COMMENT '操作员iD',
  `intro` varchar(256) DEFAULT NULL COMMENT '操作日志',
  `create_time` varchar(32) DEFAULT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_admin_action_logs` */

/*Table structure for table `tu_appoint` */

DROP TABLE IF EXISTS `tu_appoint`;

CREATE TABLE `tu_appoint` (
  `appoint_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) DEFAULT '0',
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `shop_id` int(10) DEFAULT '0',
  `lng` varchar(32) DEFAULT NULL,
  `lat` varchar(32) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `intro` varchar(64) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `one_full_money` int(11) DEFAULT '0' COMMENT '首单满减',
  `unit` varchar(32) DEFAULT NULL,
  `gongju` varchar(64) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `thumb` text,
  `user_name` varchar(32) DEFAULT NULL,
  `user_mobile` varchar(32) DEFAULT NULL,
  `biz_time` varchar(64) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `contents` text,
  `yuyue_num` int(11) DEFAULT '0',
  `is_orders` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0自己配送，1进入阿姨端抢单',
  `views` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`appoint_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint` */

insert  into `tu_appoint`(`appoint_id`,`cate_id`,`city_id`,`area_id`,`business_id`,`shop_id`,`lng`,`lat`,`title`,`intro`,`price`,`one_full_money`,`unit`,`gongju`,`photo`,`thumb`,`user_name`,`user_mobile`,`biz_time`,`end_date`,`contents`,`yuyue_num`,`is_orders`,`views`,`audit`,`closed`) values (1,15,32,57,59,1,'116.417881','39.916683','家政月嫂','家政月嫂',10000,500,'1','','/attachs/2018/05/31/thumb_5b0f78b96093f.jpg','a:1:{i:0;s:43:\"/attachs/2018/05/31/thumb_5b0f78c1d6cb3.jpg\";}','张慧','15114445454','早8晚24点','2025-05-08','<p>欢迎咨询</p>',0,0,9,1,0);

/*Table structure for table `tu_appoint_card` */

DROP TABLE IF EXISTS `tu_appoint_card`;

CREATE TABLE `tu_appoint_card` (
  `card_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `cardNumber` varchar(32) DEFAULT NULL COMMENT '卡号',
  `fullMoney` int(11) DEFAULT '0' COMMENT '满多少减才能使用',
  `cardMoney` int(11) DEFAULT '0' COMMENT '面值',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态',
  `bg_date` date DEFAULT NULL COMMENT '开始时间',
  `end_date` date DEFAULT NULL COMMENT '过期时间',
  `used_time` int(11) DEFAULT NULL COMMENT '验证时间',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_card` */

/*Table structure for table `tu_appoint_card_logs` */

DROP TABLE IF EXISTS `tu_appoint_card_logs`;

CREATE TABLE `tu_appoint_card_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `appoint_id` int(11) DEFAULT NULL COMMENT '家政ID',
  `user_id` int(11) DEFAULT NULL COMMENT '使用ID',
  `shop_id` int(11) DEFAULT NULL,
  `card_id` varchar(32) DEFAULT NULL COMMENT '优惠卡卡号',
  `money` int(11) DEFAULT '0' COMMENT '抵扣面值',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `cate_id` (`card_id`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_card_logs` */

/*Table structure for table `tu_appoint_cate` */

DROP TABLE IF EXISTS `tu_appoint_cate`;

CREATE TABLE `tu_appoint_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `photo` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_cate` */

insert  into `tu_appoint_cate`(`cate_id`,`cate_name`,`parent_id`,`photo`,`orderby`) values (4,'家政',0,'http://images4.5maiche.cn/2017-06-19_59476bcb38de8.jpg',1),(5,'丽人',0,'http://images4.5maiche.cn/2017-06-17_5944aed6a6cba.png',2),(6,'汽车',0,'http://images4.5maiche.cn/2017-06-17_5944aee1db961.png',3),(7,'生活',0,'http://images4.5maiche.cn/2017-06-17_5944aeecd5d84.png',4),(8,'日常保洁',4,'',3),(9,'洗衣机清洗',4,'',4),(10,'深度保洁',4,'',5),(11,'手机维修',4,'',6),(12,'甲醛治理',4,'',7),(13,'开锁换锁',4,'',8),(14,'空调清洗',4,'',2),(15,'月嫂',4,'http://images4.5maiche.cn/2018-01-11_5a56e52051bcb.jpg',1),(16,'美甲',5,'',4),(17,'修护及卸甲',5,'',1),(18,'美睫',5,'',2),(19,'化妆',5,'',3),(20,'上门洗车',6,'',1),(21,'维修保养',6,'',2),(22,'抛光打蜡',6,'',3),(23,'汽车陪练',6,'',4),(24,'推拿按摩',7,'',2),(26,'上门理发',7,'',1),(27,'保洁',0,'http://images4.5maiche.cn/2017-06-17_5944aeca92019.png',1),(28,'222',27,'',22);

/*Table structure for table `tu_appoint_cert` */

DROP TABLE IF EXISTS `tu_appoint_cert`;

CREATE TABLE `tu_appoint_cert` (
  `cert_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `appoint_id` int(11) unsigned DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL COMMENT '技师ID',
  `cert` tinyint(1) DEFAULT '0' COMMENT '星级',
  `name` varchar(32) DEFAULT NULL,
  `photo` varchar(256) DEFAULT NULL COMMENT '图片',
  `intro` varchar(128) DEFAULT NULL COMMENT '证书说明',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '是否显示',
  `views` int(10) DEFAULT '0' COMMENT '证书浏览量',
  `audit` tinyint(1) DEFAULT '0' COMMENT '审核',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `create_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`cert_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_cert` */

/*Table structure for table `tu_appoint_dianping` */

DROP TABLE IF EXISTS `tu_appoint_dianping`;

CREATE TABLE `tu_appoint_dianping` (
  `dianping_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0' COMMENT '企业ID',
  `order_id` int(11) DEFAULT NULL,
  `appoint_id` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `d1` tinyint(3) DEFAULT '0',
  `d2` tinyint(3) DEFAULT '0',
  `d3` tinyint(3) DEFAULT '0',
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `reply_time` int(11) DEFAULT NULL COMMENT '回复时间',
  `reply_ip` varchar(15) DEFAULT NULL COMMENT '回复IP',
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`dianping_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_dianping` */

/*Table structure for table `tu_appoint_dianping_pics` */

DROP TABLE IF EXISTS `tu_appoint_dianping_pics`;

CREATE TABLE `tu_appoint_dianping_pics` (
  `pic_id` int(10) NOT NULL AUTO_INCREMENT,
  `dianping_id` int(11) unsigned DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_dianping_pics` */

/*Table structure for table `tu_appoint_order` */

DROP TABLE IF EXISTS `tu_appoint_order`;

CREATE TABLE `tu_appoint_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT NULL,
  `appoint_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL COMMENT '优惠卡ID',
  `cardNumber` varchar(32) DEFAULT NULL COMMENT '优惠卡卡号',
  `cardMoney` int(11) DEFAULT '0' COMMENT '优惠卡抵扣费用',
  `oneReduceMoney` int(11) DEFAULT '0' COMMENT '首单免减费用',
  `svctime` varchar(20) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `orderType` tinyint(1) DEFAULT '0' COMMENT '订单类型',
  `status` tinyint(1) DEFAULT '0',
  `comment_status` int(1) NOT NULL DEFAULT '0' COMMENT '点评状态',
  `need_pay` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `buy_num` tinyint(3) DEFAULT '0',
  `contents` varchar(1024) DEFAULT NULL,
  `is_real` tinyint(1) DEFAULT '0' COMMENT '1代表客服已经确认过是有效的',
  `num` tinyint(3) DEFAULT '0' COMMENT '未填数字就代表使用全局的',
  `money` int(10) DEFAULT '0' COMMENT '未填数字代表应用全局的设置',
  `is_print` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1代表已打印，0代表未打印',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `svc_id` (`cate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_order` */

/*Table structure for table `tu_appoint_order_buy` */

DROP TABLE IF EXISTS `tu_appoint_order_buy`;

CREATE TABLE `tu_appoint_order_buy` (
  `buy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appoint_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`buy_id`) USING BTREE,
  UNIQUE KEY `appoint_id` (`appoint_id`,`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_order_buy` */

/*Table structure for table `tu_appoint_orders` */

DROP TABLE IF EXISTS `tu_appoint_orders`;

CREATE TABLE `tu_appoint_orders` (
  `orders_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '键名',
  `type` tinyint(1) unsigned NOT NULL COMMENT '0是商城，1是外卖，2是快件',
  `appoint_order_id` int(10) unsigned NOT NULL COMMENT '家政原始订单ID',
  `delivery_id` int(10) unsigned NOT NULL COMMENT '配送员ID',
  `shop_id` int(10) unsigned NOT NULL,
  `city_id` int(10) NOT NULL COMMENT '订单城市',
  `area_id` int(10) DEFAULT NULL COMMENT '订单企业地区',
  `business_id` int(10) DEFAULT NULL COMMENT '订单企业商圈ID',
  `lat` varchar(15) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `shop_name` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `addr_id` int(10) DEFAULT NULL COMMENT '外卖地址',
  `address_id` int(11) DEFAULT NULL COMMENT '商城地址',
  `logistics_price` int(11) DEFAULT NULL,
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接单时间',
  `end_time` int(10) DEFAULT '0' COMMENT '完成时间 ',
  `status` tinyint(1) unsigned NOT NULL COMMENT '0是货到付款，1是已付款，2是配送中，8是已完成。',
  `closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_orders` */

/*Table structure for table `tu_appoint_worker` */

DROP TABLE IF EXISTS `tu_appoint_worker`;

CREATE TABLE `tu_appoint_worker` (
  `worker_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `appoint_id` int(11) unsigned DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL COMMENT '父级类型',
  `city_id` int(11) DEFAULT NULL COMMENT '父级类型',
  `area_id` int(11) DEFAULT NULL COMMENT '父级地区',
  `business_id` int(11) DEFAULT NULL COMMENT '父级商圈',
  `star` tinyint(1) DEFAULT '0' COMMENT '星级',
  `date_id` varchar(128) DEFAULT NULL COMMENT '日期',
  `price` int(10) DEFAULT NULL,
  `photo` varchar(128) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `office` varchar(32) DEFAULT NULL COMMENT '员工职务',
  `height` int(6) DEFAULT NULL COMMENT '身高',
  `age` int(6) DEFAULT NULL COMMENT '年龄',
  `zodiac` int(6) DEFAULT NULL COMMENT '生肖',
  `constellatory` int(6) DEFAULT NULL COMMENT '星座',
  `culture` varchar(32) DEFAULT NULL COMMENT '文化水平',
  `working_age` varchar(32) DEFAULT NULL COMMENT '工作年龄',
  `household` varchar(32) DEFAULT NULL COMMENT '户籍地',
  `mandarin` varchar(32) DEFAULT NULL COMMENT '普通话水平',
  `intro` varchar(64) NOT NULL COMMENT '简短介绍',
  `mobile` varchar(13) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `skill` varchar(128) DEFAULT NULL COMMENT '技师技能',
  `views` int(10) NOT NULL DEFAULT '0' COMMENT '技师浏览量',
  `content` text,
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `create_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`worker_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_appoint_worker` */

insert  into `tu_appoint_worker`(`worker_id`,`appoint_id`,`cate_id`,`city_id`,`area_id`,`business_id`,`star`,`date_id`,`price`,`photo`,`name`,`office`,`height`,`age`,`zodiac`,`constellatory`,`culture`,`working_age`,`household`,`mandarin`,`intro`,`mobile`,`is_recommend`,`skill`,`views`,`content`,`audit`,`closed`,`create_time`,`create_ip`) values (1,1,15,32,57,59,5,'1,2,3,4,5,6,7,8,9,10,11,12,13,20,31',5500,'/attachs/2018/05/31/thumb_5b0f79ad31a8a.jpg','张敏','按摩',1,18,6,4,'大专','1','北京','1','漂亮','15114445454',1,'按摩八怪',10,'好评',1,0,1527740851,'111.37.66.253');

/*Table structure for table `tu_area` */

DROP TABLE IF EXISTS `tu_area`;

CREATE TABLE `tu_area` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT '0',
  `area_name` varchar(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `Name` varchar(32) DEFAULT NULL COMMENT '名称',
  `LevelType` tinyint(6) DEFAULT NULL COMMENT '等级',
  `CityCode` tinyint(6) DEFAULT NULL,
  `ZipCode` tinyint(6) DEFAULT NULL,
  `MergerName` varchar(32) DEFAULT NULL,
  `lng` varchar(32) DEFAULT NULL,
  `Lat` varchar(32) DEFAULT NULL,
  `pinyin` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_area` */

insert  into `tu_area`(`area_id`,`city_id`,`area_name`,`user_id`,`Name`,`LevelType`,`CityCode`,`ZipCode`,`MergerName`,`lng`,`Lat`,`pinyin`,`orderby`) values (2,1,'新站',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(57,32,'朝阳区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(59,33,'聊城市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);

/*Table structure for table `tu_article` */

DROP TABLE IF EXISTS `tu_article`;

CREATE TABLE `tu_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL COMMENT '关联的企业文章ID',
  `title` varchar(128) DEFAULT NULL,
  `cate_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `shop_id` int(10) NOT NULL DEFAULT '0',
  `source` varchar(32) DEFAULT NULL,
  `profiles` text,
  `keywords` varchar(256) DEFAULT NULL,
  `orderby` tinyint(4) NOT NULL DEFAULT '100',
  `photo` varchar(128) DEFAULT NULL,
  `audio` varchar(128) DEFAULT NULL COMMENT '音乐URL',
  `video` varchar(128) DEFAULT NULL COMMENT '视频URL',
  `video_photo` varchar(128) DEFAULT NULL,
  `details` text,
  `istop` int(2) NOT NULL DEFAULT '0',
  `isroll` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `zan` int(6) NOT NULL DEFAULT '0',
  `donate_num` int(10) DEFAULT '0',
  `closed` tinyint(2) NOT NULL DEFAULT '0',
  `valuate` tinyint(2) DEFAULT '0',
  `audit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_article` */

insert  into `tu_article`(`article_id`,`news_id`,`title`,`cate_id`,`city_id`,`area_id`,`shop_id`,`source`,`profiles`,`keywords`,`orderby`,`photo`,`audio`,`video`,`video_photo`,`details`,`istop`,`isroll`,`create_time`,`create_ip`,`views`,`zan`,`donate_num`,`closed`,`valuate`,`audit`) values (1,0,'zhaopin新闻',5,0,0,0,'','111111111','',0,'','','','/attachs/default.jpg','<p>11111111111</p>',0,0,1526968814,'111.37.71.184',2,0,0,0,0,1),(2,0,'买综合本地020找zhaopin',5,0,0,0,'','买综合本地020找zhaopin','',1,'/attachs/2018/05/22/thumb_5b03b21f830c8.png','','','/attachs/default.jpg','<p><img src=\"/attachs/editor/2018/05/22/1526968892110613.png\" title=\"1526968892110613.png\" alt=\"QQ截图20180522135408.png\"/></p>',1,0,1526968904,'111.37.71.184',4,0,0,0,0,1),(3,0,'zhaopin',5,0,0,0,'','买综合本地020找zhaopin','',0,'','','','/attachs/default.jpg','<p>买综合本地020找zhaopin</p>',0,0,1526968940,'111.37.71.184',7,2,0,0,0,1),(4,0,'020综合商城外卖',5,0,0,0,'','买综合本地020找zhaopin','',0,'/attachs/2018/05/22/thumb_5b03b290b8471.png','','','/attachs/default.jpg','<p>买综合本地020找zhaopin QQ：26099981</p>',0,0,1526968988,'111.37.71.184',15,2,0,0,0,1),(5,0,'zhaopin QQ：26099981',5,0,0,0,'','买综合本地020找zhaopin QQ：26099981','',0,'','','','/attachs/default.jpg','<p>买综合本地020找zhaopin QQ：26099981</p>',0,0,1526969011,'111.37.71.184',12,2,0,0,0,1),(6,0,'本地020找zhaopin QQ：26099981',5,0,0,0,'','买综合本地020找zhaopin QQ：26099981','',0,'','','','/attachs/default.jpg','<p>买综合本地020找zhaopin QQ：26099981</p>',0,0,1526969029,'111.37.71.184',8,2,0,0,0,1),(7,0,'zhaopin',2,0,0,0,'','zhaopinzhaopinzhaopin','',0,'','','','/attachs/default.jpg','<p>zhaopinzhaopin</p>',0,0,1526969125,'111.37.71.184',10,2,0,0,0,1);

/*Table structure for table `tu_article_cate` */

DROP TABLE IF EXISTS `tu_article_cate`;

CREATE TABLE `tu_article_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL COMMENT '企业ID，备用',
  `user_id` int(11) DEFAULT NULL COMMENT '会员ID，备用',
  `price` int(11) DEFAULT NULL COMMENT '购买价格，备份',
  `intro` varchar(128) NOT NULL COMMENT '分类简介',
  `orderby` tinyint(3) DEFAULT '100',
  `create_time` int(11) NOT NULL COMMENT '时间',
  `create_ip` varchar(15) NOT NULL COMMENT 'IP',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1代表删除',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_article_cate` */

insert  into `tu_article_cate`(`cate_id`,`cate_name`,`parent_id`,`shop_id`,`user_id`,`price`,`intro`,`orderby`,`create_time`,`create_ip`,`closed`) values (1,'家庭琐事',0,NULL,NULL,NULL,'',1,0,'',0),(2,'重庆大事记',1,NULL,NULL,NULL,'',1,0,'',0),(7,'其他新闻',1,NULL,NULL,NULL,'',2,0,'',0),(4,'本地新闻',0,NULL,NULL,NULL,'',0,0,'',0),(5,'民生',4,NULL,NULL,NULL,'',1,0,'',0),(6,'乡镇',4,NULL,NULL,NULL,'',2,0,'',0),(8,'问答求助',0,NULL,NULL,NULL,'',2,0,'',0),(9,'数码家电',8,NULL,NULL,NULL,'',1,0,'',0),(10,'美女',8,NULL,NULL,NULL,'',2,0,'',0),(11,'摆龙门阵',0,NULL,NULL,NULL,'',3,0,'',0),(12,'杂事',11,NULL,NULL,NULL,'',0,0,'',0),(13,'测试1',6,NULL,NULL,NULL,'',1,0,'',0);

/*Table structure for table `tu_article_comment` */

DROP TABLE IF EXISTS `tu_article_comment`;

CREATE TABLE `tu_article_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级评论id,若是一级评论则为0',
  `nickname` varchar(100) DEFAULT NULL COMMENT '评论人昵称',
  `user_id` int(11) DEFAULT NULL COMMENT '评论人UID',
  `post_id` int(11) DEFAULT NULL COMMENT '新闻编号',
  `content` text COMMENT '评论内容',
  `zan` int(6) NOT NULL DEFAULT '0',
  `cai` int(6) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '评论或回复发表时间',
  `create_ip` varchar(20) NOT NULL,
  `audit` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_article_comment` */

/*Table structure for table `tu_article_donate` */

DROP TABLE IF EXISTS `tu_article_donate`;

CREATE TABLE `tu_article_donate` (
  `donate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `city_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL COMMENT '新闻编号',
  `money` varchar(10) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '评论或回复发表时间',
  `create_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`donate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_article_donate` */

/*Table structure for table `tu_article_photos` */

DROP TABLE IF EXISTS `tu_article_photos`;

CREATE TABLE `tu_article_photos` (
  `pic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_article_photos` */

/*Table structure for table `tu_book_order` */

DROP TABLE IF EXISTS `tu_book_order`;

CREATE TABLE `tu_book_order` (
  `order_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL COMMENT '城市',
  `cate_id` int(11) unsigned DEFAULT NULL,
  `attr_id` int(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `shop_id` int(11) DEFAULT NULL COMMENT '抢单企业ID',
  `addr_id` int(11) DEFAULT NULL COMMENT '本地地址ID',
  `gotime` int(11) DEFAULT NULL COMMENT '预约日期',
  `price` int(11) DEFAULT NULL COMMENT '支付价格',
  `name` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL COMMENT '地址',
  `lat` varchar(11) DEFAULT NULL,
  `lng` varchar(11) DEFAULT NULL,
  `introduce` varchar(256) DEFAULT NULL COMMENT '详细介绍',
  `code` varchar(11) DEFAULT NULL COMMENT '支付方式',
  `status` int(6) DEFAULT NULL COMMENT '状态',
  `closed` tinyint(1) DEFAULT '0' COMMENT '1关闭，0开启',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(20) DEFAULT NULL,
  `pay_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `orders_time` int(11) DEFAULT NULL COMMENT '接单时间',
  `complete_time` int(11) DEFAULT NULL COMMENT '完成时间',
  `refund_time` int(11) DEFAULT NULL COMMENT '退款时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_book_order` */

/*Table structure for table `tu_book_photos` */

DROP TABLE IF EXISTS `tu_book_photos`;

CREATE TABLE `tu_book_photos` (
  `pic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_book_photos` */

/*Table structure for table `tu_booking` */

DROP TABLE IF EXISTS `tu_booking`;

CREATE TABLE `tu_booking` (
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shop_name` varchar(32) DEFAULT '',
  `tel` varchar(15) DEFAULT '',
  `mobile` varchar(15) DEFAULT '',
  `photo` varchar(128) DEFAULT '',
  `addr` varchar(128) DEFAULT '',
  `city_id` int(10) DEFAULT '0',
  `area_id` int(10) DEFAULT '0',
  `business_id` int(10) DEFAULT '0',
  `price` int(10) DEFAULT '0',
  `deposit` int(10) DEFAULT '0',
  `orders` int(10) DEFAULT '0',
  `comments` int(10) DEFAULT '0',
  `score` float(2,1) DEFAULT '0.0',
  `kw_score` float(2,1) DEFAULT '0.0',
  `hj_score` float(2,1) DEFAULT '0.0',
  `fw_score` float(2,1) DEFAULT '0.0',
  `lat` varchar(15) DEFAULT '',
  `lng` varchar(15) DEFAULT '',
  `stime` varchar(10) DEFAULT '',
  `ltime` varchar(10) DEFAULT '',
  `is_open` tinyint(1) DEFAULT '1',
  `details` text,
  `update_time` int(10) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT '',
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking` */

insert  into `tu_booking`(`shop_id`,`shop_name`,`tel`,`mobile`,`photo`,`addr`,`city_id`,`area_id`,`business_id`,`price`,`deposit`,`orders`,`comments`,`score`,`kw_score`,`hj_score`,`fw_score`,`lat`,`lng`,`stime`,`ltime`,`is_open`,`details`,`update_time`,`update_ip`,`audit`,`closed`,`create_time`,`create_ip`) values (1,'zhaopin','1716-2729-877','17162729877','/attachs/2018/05/22/thumb_5b03c00f58274.jpg','北京朝阳国贸A102',32,57,59,1000,100,0,0,0.0,0.0,0.0,0.0,'','','','',1,'<p>zhaopin订座系统</p>',0,'',1,0,1526972488,'111.37.71.184');

/*Table structure for table `tu_booking_attr` */

DROP TABLE IF EXISTS `tu_booking_attr`;

CREATE TABLE `tu_booking_attr` (
  `type_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_id`,`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_booking_attr` */

insert  into `tu_booking_attr`(`type_id`,`shop_id`) values (1,1),(1,2),(1,7),(1,12),(1,47),(2,1),(2,2),(2,7),(2,12),(2,13),(2,47),(2,59),(3,1),(3,2),(3,7),(3,12),(3,47);

/*Table structure for table `tu_booking_cate` */

DROP TABLE IF EXISTS `tu_booking_cate`;

CREATE TABLE `tu_booking_cate` (
  `cate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `cate_name` varchar(64) DEFAULT '',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_cate` */

/*Table structure for table `tu_booking_dianping` */

DROP TABLE IF EXISTS `tu_booking_dianping`;

CREATE TABLE `tu_booking_dianping` (
  `dianping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `dianping_id` (`dianping_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_dianping` */

/*Table structure for table `tu_booking_dianping_pic` */

DROP TABLE IF EXISTS `tu_booking_dianping_pic`;

CREATE TABLE `tu_booking_dianping_pic` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE,
  KEY `dianping_id` (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_dianping_pic` */

/*Table structure for table `tu_booking_menu` */

DROP TABLE IF EXISTS `tu_booking_menu`;

CREATE TABLE `tu_booking_menu` (
  `menu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(64) DEFAULT '',
  `shop_id` int(11) DEFAULT '0',
  `cate_id` int(11) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  `price` int(11) DEFAULT '0',
  `ding_price` int(11) DEFAULT '0',
  `sold_num` int(10) NOT NULL DEFAULT '0',
  `is_tuijian` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新品',
  `is_sale` tinyint(1) DEFAULT '0' COMMENT '是否优惠',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_menu` */

/*Table structure for table `tu_booking_order` */

DROP TABLE IF EXISTS `tu_booking_order`;

CREATE TABLE `tu_booking_order` (
  `order_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) unsigned DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `comment_status` tinyint(1) DEFAULT '0',
  `order_status` tinyint(1) DEFAULT '0',
  `ding_date` date DEFAULT NULL,
  `ding_time` varchar(20) DEFAULT '',
  `ding_num` varchar(20) DEFAULT '',
  `ding_type` tinyint(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `amount` int(10) DEFAULT '0',
  `menu_amount` int(10) DEFAULT '0',
  `user_id` mediumint(8) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '1',
  `note` mediumtext,
  `is_profit` tinyint(1) DEFAULT '0' COMMENT '1代表已分销，0未分销',
  `update_time` int(10) DEFAULT '0',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_order` */

/*Table structure for table `tu_booking_order_menu` */

DROP TABLE IF EXISTS `tu_booking_order_menu`;

CREATE TABLE `tu_booking_order_menu` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT '0',
  `menu_id` int(10) DEFAULT '0',
  `price` int(10) DEFAULT '0',
  `menu_name` varchar(32) DEFAULT '',
  `num` int(10) DEFAULT '0',
  `amount` int(10) DEFAULT '0',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_order_menu` */

/*Table structure for table `tu_booking_pics` */

DROP TABLE IF EXISTS `tu_booking_pics`;

CREATE TABLE `tu_booking_pics` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_pics` */

/*Table structure for table `tu_booking_room` */

DROP TABLE IF EXISTS `tu_booking_room`;

CREATE TABLE `tu_booking_room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `intro` varchar(64) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `thumb` text NOT NULL,
  `money` int(11) DEFAULT '0',
  `last_date` date DEFAULT NULL,
  `last_t` tinyint(3) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0' COMMENT '1 代表该包厢已经不能被预定了',
  PRIMARY KEY (`room_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_room` */

/*Table structure for table `tu_booking_setting` */

DROP TABLE IF EXISTS `tu_booking_setting`;

CREATE TABLE `tu_booking_setting` (
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(11) DEFAULT NULL COMMENT '有单了，通知手机号',
  `money` int(11) DEFAULT '0' COMMENT '包厢需要缴纳定金',
  `tu_time` tinyint(3) DEFAULT '0' COMMENT '包厢预定间隔小时',
  `start_time` varchar(11) DEFAULT '0' COMMENT '开始接客时间',
  `end_time` varchar(11) DEFAULT '0' COMMENT '打烊时间',
  `is_bao` tinyint(1) DEFAULT '0' COMMENT '1代表包厢有位子',
  `is_ting` tinyint(1) DEFAULT '0' COMMENT '1代表大厅有位置',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_setting` */

/*Table structure for table `tu_booking_yuyue` */

DROP TABLE IF EXISTS `tu_booking_yuyue`;

CREATE TABLE `tu_booking_yuyue` (
  `booking_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `room_id` mediumint(8) NOT NULL,
  `shop_id` mediumint(8) DEFAULT NULL,
  `last_date` date NOT NULL,
  `last_t` tinyint(3) NOT NULL,
  `menu` varchar(50) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  `number` int(3) DEFAULT NULL,
  `order_no` int(10) DEFAULT NULL,
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '1代表已经付款购买   0未付款',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`booking_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_booking_yuyue` */

/*Table structure for table `tu_breaks_order` */

DROP TABLE IF EXISTS `tu_breaks_order`;

CREATE TABLE `tu_breaks_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `amount` decimal(8,2) DEFAULT '0.00',
  `exception` decimal(8,2) DEFAULT '0.00',
  `need_pay` decimal(8,2) DEFAULT '0.00',
  `deduction` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未支付，1已支付',
  `is_separate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_profit` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_breaks_order` */

/*Table structure for table `tu_business` */

DROP TABLE IF EXISTS `tu_business`;

CREATE TABLE `tu_business` (
  `business_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `business_name` varchar(32) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL COMMENT '经度',
  `lat` varchar(15) DEFAULT NULL COMMENT '纬度',
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`business_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_business` */

insert  into `tu_business`(`business_id`,`business_name`,`area_id`,`lng`,`lat`,`orderby`,`is_hot`) values (1,'生态公园',2,NULL,NULL,1,1),(59,'朝阳公园',57,NULL,NULL,2,0),(60,'开发区',59,NULL,NULL,0,0);

/*Table structure for table `tu_car_brand` */

DROP TABLE IF EXISTS `tu_car_brand`;

CREATE TABLE `tu_car_brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `create_time` varchar(15) DEFAULT NULL COMMENT '时间',
  `create_ip` int(11) DEFAULT NULL COMMENT 'IP',
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_car_brand` */

/*Table structure for table `tu_city` */

DROP TABLE IF EXISTS `tu_city`;

CREATE TABLE `tu_city` (
  `city_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `agent_id` int(11) DEFAULT NULL COMMENT '代理ID',
  `photo` varchar(255) DEFAULT NULL,
  `pinyin` varchar(32) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0',
  `domain` tinyint(1) NOT NULL DEFAULT '0',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `first_letter` char(1) DEFAULT NULL,
  `theme` varchar(21) NOT NULL DEFAULT 'default',
  `pid` smallint(6) DEFAULT '0' COMMENT '上级城市ID',
  `ShortName` varchar(6) DEFAULT NULL COMMENT '城市名称',
  `LevelType` tinyint(6) DEFAULT NULL COMMENT '等级',
  `CityCode` tinyint(6) DEFAULT NULL COMMENT '行政区划代码',
  `ZipCode` tinyint(6) DEFAULT NULL COMMENT '邮编代码',
  `MergerName` varchar(32) DEFAULT NULL COMMENT '连贯地区总和',
  `ParentId` int(6) DEFAULT NULL COMMENT '父级',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` varchar(15) DEFAULT NULL,
  `create_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_city` */

insert  into `tu_city`(`city_id`,`name`,`user_id`,`agent_id`,`photo`,`pinyin`,`is_open`,`domain`,`lng`,`lat`,`orderby`,`first_letter`,`theme`,`pid`,`ShortName`,`LevelType`,`CityCode`,`ZipCode`,`MergerName`,`ParentId`,`closed`,`create_time`,`create_ip`) values (1,'成都',1,2,'/attachs/2018/05/22/thumb_5b03ac6d16130.png','chengdu',1,0,'117.193374','34.270643',1,'X','',0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(32,'北京',1,NULL,'/attachs/2018/05/22/thumb_5b03ac9130c6f.png','beijing',1,0,'116.413396','39.911049',1,'B','',0,NULL,NULL,NULL,NULL,NULL,NULL,0,'1526967464','111.37.71.184'),(33,'山东',5,NULL,'/attachs/2019/12/02/thumb_5de4a6e2a4e70.jpg','shandong',1,0,'116.044048','36.461372',0,'S','',0,NULL,NULL,NULL,NULL,NULL,NULL,0,'1575266055','27.222.125.72');

/*Table structure for table `tu_city_agents` */

DROP TABLE IF EXISTS `tu_city_agents`;

CREATE TABLE `tu_city_agents` (
  `agent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL COMMENT '企业ID，备用',
  `user_id` int(11) DEFAULT NULL COMMENT '会员ID，备用',
  `price` int(11) DEFAULT NULL COMMENT '购买价格，备份',
  `intro` varchar(128) NOT NULL COMMENT '分类简介',
  `orderby` tinyint(3) DEFAULT '100',
  `create_time` int(11) NOT NULL COMMENT '时间',
  `create_ip` varchar(15) NOT NULL COMMENT 'IP',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1代表删除',
  PRIMARY KEY (`agent_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_city_agents` */

/*Table structure for table `tu_cloud_goods` */

DROP TABLE IF EXISTS `tu_cloud_goods`;

CREATE TABLE `tu_cloud_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT '0' COMMENT '0表示后台发布',
  `city_id` int(10) DEFAULT '0',
  `area_id` int(10) DEFAULT '0',
  `business_id` int(10) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '1表示1元夺宝，2代表5元夺宝，3代表10元夺宝',
  `title` varchar(64) DEFAULT '',
  `intro` varchar(255) DEFAULT '',
  `details` text,
  `join` int(10) DEFAULT '0' COMMENT '已参与',
  `price` int(10) DEFAULT '0' COMMENT '总价格',
  `max` int(10) DEFAULT '0' COMMENT '该件商品最大允许的参与数',
  `settlement_price` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  `thumb` text,
  `status` tinyint(4) DEFAULT '0' COMMENT '0表示正在云购中，1表示已结束',
  `win_user_id` int(10) DEFAULT '0' COMMENT '中奖UID',
  `win_number` int(10) DEFAULT '0' COMMENT '中奖编号',
  `closed` tinyint(1) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0',
  `lottery_time` int(10) DEFAULT '0' COMMENT '开奖时间',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_cloud_goods` */

/*Table structure for table `tu_cloud_logs` */

DROP TABLE IF EXISTS `tu_cloud_logs`;

CREATE TABLE `tu_cloud_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `shop_id` int(11) unsigned DEFAULT NULL,
  `num` int(10) DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1表示1元夺宝，2代表5元夺宝，3代表10元夺宝',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '应付款金额',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '未付款，1已付款，2已成功，3已失败',
  `create_time` int(10) DEFAULT '0',
  `microtime` varchar(3) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_cloud_logs` */

/*Table structure for table `tu_community` */

DROP TABLE IF EXISTS `tu_community`;

CREATE TABLE `tu_community` (
  `community_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT '物业管理员',
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT '0',
  `name` varchar(200) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `tel` varchar(50) NOT NULL,
  `pic` varchar(64) NOT NULL,
  `village_id` smallint(5) DEFAULT NULL,
  `property` varchar(128) DEFAULT NULL COMMENT '物业',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `tag` varchar(200) NOT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `orderby` int(5) DEFAULT '100',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`community_id`) USING BTREE,
  KEY `city_id` (`city_id`,`area_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='小区表';

/*Data for the table `tu_community` */

/*Table structure for table `tu_community_access_list` */

DROP TABLE IF EXISTS `tu_community_access_list`;

CREATE TABLE `tu_community_access_list` (
  `list_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `lock_sn` varchar(64) DEFAULT NULL,
  `sim_no` varchar(32) NOT NULL COMMENT 'SIM号码',
  `intro` varchar(128) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL COMMENT '状态',
  `state_code` varchar(32) DEFAULT NULL COMMENT '状态说明',
  `online` tinyint(1) DEFAULT NULL COMMENT '设备状态',
  `create_time` int(10) DEFAULT '0',
  `query_time` int(11) DEFAULT NULL COMMENT '查询时间',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`list_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_access_list` */

/*Table structure for table `tu_community_access_user` */

DROP TABLE IF EXISTS `tu_community_access_user`;

CREATE TABLE `tu_community_access_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(11) DEFAULT NULL COMMENT '设备ID',
  `community_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `owner_id` int(11) DEFAULT NULL COMMENT '业主ID',
  `bg_date` date DEFAULT NULL COMMENT '生效时间',
  `end_date` date DEFAULT NULL COMMENT '失效时间',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_access_user` */

/*Table structure for table `tu_community_access_user_open` */

DROP TABLE IF EXISTS `tu_community_access_user_open`;

CREATE TABLE `tu_community_access_user_open` (
  `open_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '0默认开门，1二维码扫码开门',
  `list_id` int(11) DEFAULT NULL COMMENT '设备ID',
  `community_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `owner_id` int(11) DEFAULT NULL COMMENT '业主ID',
  `intro` varchar(64) DEFAULT NULL COMMENT '备注',
  `open_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`open_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_access_user_open` */

/*Table structure for table `tu_community_ad` */

DROP TABLE IF EXISTS `tu_community_ad`;

CREATE TABLE `tu_community_ad` (
  `ad_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `title` varchar(64) DEFAULT '',
  `link_url` varchar(128) DEFAULT '',
  `photo` varchar(128) DEFAULT '',
  `click` int(11) DEFAULT '0',
  `orderby` tinyint(1) DEFAULT '100',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_ad` */

/*Table structure for table `tu_community_news` */

DROP TABLE IF EXISTS `tu_community_news`;

CREATE TABLE `tu_community_news` (
  `news_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(1024) DEFAULT NULL,
  `details` text,
  `views` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_news` */

/*Table structure for table `tu_community_order` */

DROP TABLE IF EXISTS `tu_community_order`;

CREATE TABLE `tu_community_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_ids` varchar(32) DEFAULT NULL COMMENT '订单ID截取',
  `community_id` int(11) DEFAULT NULL,
  `order_date` char(7) DEFAULT '2015-10',
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_order` */

/*Table structure for table `tu_community_order_logs` */

DROP TABLE IF EXISTS `tu_community_order_logs`;

CREATE TABLE `tu_community_order_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `money` int(10) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_order_logs` */

/*Table structure for table `tu_community_order_products` */

DROP TABLE IF EXISTS `tu_community_order_products`;

CREATE TABLE `tu_community_order_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '1水费  2电费 3燃气费 4停车费 5物业费',
  `order_id` int(10) DEFAULT '0',
  `money` int(10) DEFAULT '0',
  `bg_date` char(10) DEFAULT NULL,
  `end_date` char(10) DEFAULT NULL,
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '0未缴 1已缴',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_community_order_products` */

/*Table structure for table `tu_community_owner` */

DROP TABLE IF EXISTS `tu_community_owner`;

CREATE TABLE `tu_community_owner` (
  `owner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `name` varchar(32) DEFAULT '' COMMENT '称呼',
  `number` int(10) DEFAULT '0' COMMENT '户号',
  `location` varchar(64) DEFAULT '' COMMENT '具体地址',
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0' COMMENT '1代表删除',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`owner_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_owner` */

/*Table structure for table `tu_community_posts` */

DROP TABLE IF EXISTS `tu_community_posts`;

CREATE TABLE `tu_community_posts` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(80) NOT NULL,
  `community_id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `views` int(11) DEFAULT '0',
  `audit` tinyint(11) DEFAULT '0',
  `gallery` varchar(500) NOT NULL,
  `view_num` int(10) NOT NULL DEFAULT '0',
  `reply_num` int(10) NOT NULL DEFAULT '0',
  `zan_num` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(30) NOT NULL,
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_posts` */

/*Table structure for table `tu_community_replys` */

DROP TABLE IF EXISTS `tu_community_replys`;

CREATE TABLE `tu_community_replys` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT,
  `community_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL DEFAULT '0',
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `gallery` varchar(500) NOT NULL,
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `audit` int(11) DEFAULT '0',
  PRIMARY KEY (`reply_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_community_replys` */

/*Table structure for table `tu_community_users` */

DROP TABLE IF EXISTS `tu_community_users`;

CREATE TABLE `tu_community_users` (
  `join_id` int(10) NOT NULL AUTO_INCREMENT,
  `community_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`join_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_community_users` */

/*Table structure for table `tu_connect` */

DROP TABLE IF EXISTS `tu_connect`;

CREATE TABLE `tu_connect` (
  `connect_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('weibo','test','weixin','qq') DEFAULT 'qq' COMMENT 'test 作为调试的时候使用！以免不懂得用户误会小弟啊',
  `open_id` varchar(32) DEFAULT NULL,
  `token` varchar(512) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `headimgurl` varchar(500) DEFAULT NULL,
  `unionid` varchar(32) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `rd_session` char(32) NOT NULL DEFAULT '''''' COMMENT '小程序登录状态',
  `session_key` char(64) NOT NULL DEFAULT '''''' COMMENT '小程序秘钥',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`connect_id`) USING BTREE,
  UNIQUE KEY `type` (`type`,`open_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_connect` */

insert  into `tu_connect`(`connect_id`,`type`,`open_id`,`token`,`nickname`,`headimgurl`,`unionid`,`uid`,`rd_session`,`session_key`,`create_time`,`create_ip`) values (1,'weixin','o8YIj1Z-J87XdphJUW0UtQ_8Nw7s','27_lO7-jIMVCkXfNOx4vsPi4Tn6ZYe7j1glzJMyNQK-pOBR_OXsdzz3IkD-B5O_ypuJkhKVrINOo60n2Bc9tPSXwg','????','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJAVQB8Z7Axx6ETIV6nJ9Z9dtBhKrkKqDYejSpxNicButcAnvDTTqc9OxbS3xLB6LS0Fiaiat3a5RHBQ/132',NULL,4,'\'\'','\'\'',NULL,NULL),(2,'weixin','o8YIj1T_VprX52sbiQwgEMxEhKNk','28_JdWJ_UYajRtfN5-XupR5zK16c2EfgQp3GrIxqxpsaCf05NhiRjzHus4l1sQyvcEmajBCHIa6uowqFHUtlURI6OJ1VFdMU0zMmWZdiq-gbIQ','山东柒姐招工～已满','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIj8jQKX5nCTPMTd6KemATj6H3nibYaafw4zTnZibU43yPl1jJMB0SrxmQpx8GRh8uIs8tc6gXiajcwA/132',NULL,6,'\'\'','\'\'',NULL,NULL),(3,'weixin','o8YIj1UoM1R8MYS9rVYpjVMw4pVc','28_ljr-sDHIz7k07U08t-U1oP_Ce8T7rXdXpTMocubkU5_HOKH5Z0Ns9y2P5N0nl8MCVLAyJop7U99Opi4Nfz23JmD34X7_6cyzLHPn5BhYC8E','A..宁小子','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL3llotQibiaFvTjEhSA2X1BicQ5YqZETozW1rVObUW9NibvtIiamDzjZzEVaoCFO5BAYwgxwiarPdarT7g/132',NULL,7,'\'\'','\'\'',NULL,NULL);

/*Table structure for table `tu_convenient_phone` */

DROP TABLE IF EXISTS `tu_convenient_phone`;

CREATE TABLE `tu_convenient_phone` (
  `phone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` smallint(6) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `orderby` tinyint(4) DEFAULT NULL,
  `details` text NOT NULL,
  `audit` int(11) DEFAULT NULL,
  PRIMARY KEY (`phone_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_convenient_phone` */

/*Table structure for table `tu_convenient_phone_maps` */

DROP TABLE IF EXISTS `tu_convenient_phone_maps`;

CREATE TABLE `tu_convenient_phone_maps` (
  `phone_id` int(11) DEFAULT NULL,
  `community_id` smallint(6) DEFAULT NULL,
  `audit` int(2) NOT NULL DEFAULT '0',
  UNIQUE KEY `phone_id` (`phone_id`,`community_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_convenient_phone_maps` */

/*Table structure for table `tu_convenient_phone_villages` */

DROP TABLE IF EXISTS `tu_convenient_phone_villages`;

CREATE TABLE `tu_convenient_phone_villages` (
  `phone_id` int(11) DEFAULT NULL,
  `village_id` smallint(6) DEFAULT NULL,
  UNIQUE KEY `phone_id` (`phone_id`,`village_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_convenient_phone_villages` */

/*Table structure for table `tu_coupon` */

DROP TABLE IF EXISTS `tu_coupon`;

CREATE TABLE `tu_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` smallint(6) DEFAULT NULL,
  `city_id` smallint(6) DEFAULT '0',
  `area_id` smallint(6) DEFAULT '0',
  `business_id` smallint(6) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `full_price` int(11) DEFAULT NULL COMMENT '满多少钱',
  `reduce_price` int(11) DEFAULT NULL COMMENT '减多少钱',
  `discount` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `downloads` int(11) DEFAULT '0',
  `intro` varchar(1024) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `num` int(11) DEFAULT '9999999',
  `limit_num` tinyint(3) DEFAULT '0' COMMENT '0代表不限制',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`coupon_id`) USING BTREE,
  KEY `cate_id` (`cate_id`,`area_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_coupon` */

insert  into `tu_coupon`(`coupon_id`,`shop_id`,`cate_id`,`city_id`,`area_id`,`business_id`,`title`,`photo`,`full_price`,`reduce_price`,`discount`,`expire_date`,`views`,`downloads`,`intro`,`audit`,`num`,`limit_num`,`closed`,`create_time`,`create_ip`) values (1,1,69,32,57,0,'zhaopin优惠卷','/attachs/2018/05/22/thumb_5b03bf8735d23.jpg',20000,1000,NULL,'2020-05-30',6,0,'zhaopin优惠卷',1,2222,11,0,1526972260,'111.37.71.184');

/*Table structure for table `tu_coupon_download` */

DROP TABLE IF EXISTS `tu_coupon_download`;

CREATE TABLE `tu_coupon_download` (
  `download_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `mobile` char(11) DEFAULT NULL,
  `code` char(8) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  `is_sms` tinyint(1) DEFAULT '0',
  `used_time` int(11) DEFAULT NULL,
  `used_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`download_id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_coupon_download` */

/*Table structure for table `tu_crowd` */

DROP TABLE IF EXISTS `tu_crowd`;

CREATE TABLE `tu_crowd` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(64) NOT NULL,
  `cate_id` int(11) DEFAULT NULL COMMENT '众筹类别',
  `city_id` int(10) DEFAULT NULL COMMENT '城市',
  `area_id` int(11) DEFAULT NULL COMMENT '地区',
  `user_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `photo` varchar(128) DEFAULT NULL,
  `all_price` int(11) DEFAULT NULL COMMENT '众筹金额',
  `commission` int(11) DEFAULT NULL COMMENT '佣金，固定结算',
  `have_price` int(11) DEFAULT '0' COMMENT '已筹金额',
  `zan_num` int(11) NOT NULL DEFAULT '0',
  `have_num` int(11) NOT NULL DEFAULT '0',
  `follow_num` int(16) DEFAULT '0' COMMENT '收藏人数',
  `views` int(11) DEFAULT '0',
  `details` text COMMENT '详情',
  `lat` varchar(32) NOT NULL,
  `lng` varchar(32) NOT NULL,
  `ltime` date DEFAULT NULL COMMENT '众筹过期时间',
  `end_date` date NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `orderby` tinyint(4) DEFAULT '100',
  `audit` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd` */

/*Table structure for table `tu_crowd_ask` */

DROP TABLE IF EXISTS `tu_crowd_ask`;

CREATE TABLE `tu_crowd_ask` (
  `ask_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) DEFAULT NULL,
  `ask_c` text,
  `answer_c` text,
  `goods_id` mediumint(8) DEFAULT NULL,
  `answer_time` int(11) DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`ask_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_ask` */

/*Table structure for table `tu_crowd_cate` */

DROP TABLE IF EXISTS `tu_crowd_cate`;

CREATE TABLE `tu_crowd_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `theme` varchar(32) DEFAULT NULL COMMENT '选择模板',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_cate` */

insert  into `tu_crowd_cate`(`cate_id`,`cate_name`,`parent_id`,`orderby`,`theme`) values (16,'摄影',12,1,'0'),(11,'科技',0,3,'0'),(12,'影视',0,2,'0'),(22,'专辑',14,2,'0'),(14,'音乐',0,1,'0'),(17,'微电影',12,2,'0'),(18,'IT行业',11,3,'0'),(19,'电子发明',11,2,'0'),(20,'互联网',11,1,'0'),(23,'唱片',14,3,'0');

/*Table structure for table `tu_crowd_follow` */

DROP TABLE IF EXISTS `tu_crowd_follow`;

CREATE TABLE `tu_crowd_follow` (
  `zan_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `type` enum('follow','zan') DEFAULT NULL,
  `uid` mediumint(8) DEFAULT NULL,
  `goods_id` mediumint(8) DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`zan_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_crowd_follow` */

/*Table structure for table `tu_crowd_format` */

DROP TABLE IF EXISTS `tu_crowd_format`;

CREATE TABLE `tu_crowd_format` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `mall_price` int(10) DEFAULT NULL,
  `store` int(10) DEFAULT NULL,
  `format_title` varchar(128) DEFAULT '',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `content` (`content`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_format` */

/*Table structure for table `tu_crowd_list` */

DROP TABLE IF EXISTS `tu_crowd_list`;

CREATE TABLE `tu_crowd_list` (
  `list_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned DEFAULT '0' COMMENT '代表对应的订单ID',
  `uid` mediumint(8) DEFAULT NULL,
  `type_id` mediumint(8) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `addr` varchar(500) DEFAULT NULL,
  `price` varchar(11) DEFAULT NULL,
  `is_zhong` tinyint(1) unsigned DEFAULT '0',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) DEFAULT NULL,
  `dateline` int(10) DEFAULT NULL,
  PRIMARY KEY (`list_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_list` */

/*Table structure for table `tu_crowd_order` */

DROP TABLE IF EXISTS `tu_crowd_order`;

CREATE TABLE `tu_crowd_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '购买用户',
  `uid` int(11) DEFAULT NULL COMMENT '创建众筹用户',
  `goods_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL COMMENT '全国收货地址ID',
  `price` int(11) DEFAULT NULL COMMENT '售价',
  `yunfei` int(11) DEFAULT NULL COMMENT '众筹运费',
  `need_pay` int(11) DEFAULT NULL COMMENT '实际付款价格',
  `code` varchar(32) DEFAULT NULL COMMENT '众筹劵',
  `is_mobile` int(1) NOT NULL DEFAULT '0' COMMENT '1代表手机众筹',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `check_time` int(11) DEFAULT '0' COMMENT '众筹劵验证时间',
  `check_ip` varchar(15) DEFAULT NULL COMMENT '众筹劵验证IP',
  `is_check` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '1代表已付款，2代表申请退款，3已退款，8代表已完成',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_order` */

/*Table structure for table `tu_crowd_photos` */

DROP TABLE IF EXISTS `tu_crowd_photos`;

CREATE TABLE `tu_crowd_photos` (
  `pic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_photos` */

/*Table structure for table `tu_crowd_project` */

DROP TABLE IF EXISTS `tu_crowd_project`;

CREATE TABLE `tu_crowd_project` (
  `project_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) DEFAULT NULL,
  `content` text,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_project` */

/*Table structure for table `tu_crowd_prove` */

DROP TABLE IF EXISTS `tu_crowd_prove`;

CREATE TABLE `tu_crowd_prove` (
  `prove_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) DEFAULT NULL,
  `city_id` int(10) NOT NULL,
  `type_id` int(1) NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `contents` varchar(128) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0代表已举报，1代表举报成功，2代表举报失败',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`prove_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_prove` */

/*Table structure for table `tu_crowd_report` */

DROP TABLE IF EXISTS `tu_crowd_report`;

CREATE TABLE `tu_crowd_report` (
  `report_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) DEFAULT NULL,
  `goods_id` mediumint(8) DEFAULT NULL,
  `name` varchar(31) DEFAULT NULL COMMENT '举报姓名',
  `mobile` int(16) DEFAULT NULL COMMENT '电话',
  `contents` varchar(128) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0代表已举报，1代表举报成功，2代表举报失败',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_report` */

/*Table structure for table `tu_crowd_type` */

DROP TABLE IF EXISTS `tu_crowd_type`;

CREATE TABLE `tu_crowd_type` (
  `type_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `max_num` mediumint(8) DEFAULT NULL,
  `have_num` mediumint(8) DEFAULT '0',
  `content` text,
  `img` varchar(200) DEFAULT NULL,
  `yunfei` smallint(3) DEFAULT '0',
  `choujiang` tinyint(1) DEFAULT NULL,
  `fahuo` smallint(3) DEFAULT '30',
  `dateline` int(10) DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_crowd_type` */

/*Table structure for table `tu_dayu_sms` */

DROP TABLE IF EXISTS `tu_dayu_sms`;

CREATE TABLE `tu_dayu_sms` (
  `sms_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sign` varchar(32) DEFAULT NULL,
  `code` varchar(1024) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `status` int(1) unsigned DEFAULT NULL COMMENT '0失败，1成功',
  `info` varchar(128) DEFAULT NULL,
  `content` varchar(500) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`sms_id`) USING BTREE,
  UNIQUE KEY `sms_key` (`sign`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_dayu_sms` */

/*Table structure for table `tu_dayu_tag` */

DROP TABLE IF EXISTS `tu_dayu_tag`;

CREATE TABLE `tu_dayu_tag` (
  `dayu_id` int(11) NOT NULL AUTO_INCREMENT,
  `dayu_local` varchar(60) DEFAULT NULL,
  `dayu_name` varchar(128) DEFAULT NULL,
  `dayu_tag` varchar(36) DEFAULT NULL,
  `dayu_note` varchar(256) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`dayu_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_dayu_tag` */

insert  into `tu_dayu_tag`(`dayu_id`,`dayu_local`,`dayu_name`,`dayu_tag`,`dayu_note`,`is_open`) values (1,'sms_shop_recognition_admin','认领企业通知网站管理员','SMS_7265626','尊敬的管理员，${name}认领的企业${shopName}，请登录网站查看',1),(2,'sms_yzm','验证码','SMS_116590507','验证码：${code}，如非本人操作，请忽略此短信',1),(4,'sms_shop_yuyue_code','预约企业给用户发送电子优惠券','SMS_6840016','尊敬的用户您好,您预约了${shopName}的电子优惠券：${code},亲可以前往${shopName}进行消费;企业地址:${shopAddr},电话${shopTel}',1),(27,'tuancode_refund_user','抢购劵退款短信通知用户','SMS_11555673','你好，您申请的抢购订单号${orderId}，已退款${realMoney}元。',1),(6,'sms_user_newpwd','找回密码','SMS_7225707','尊敬的用户：您好，您在${siteName}的密码被重置成${newpwd}您可以使用${newpwd}重新登录',1),(7,'sms_mall_tz_shop','商城订单通知企业短信','SMS_6745739','您好，您的商城在${sitename}有新的订单',1),(8,'sms_tuan_tz_shop','团购订单通知企业','SMS_6720153','您好，您在${sitename}有新的抢购订单',1),(32,'sms_booking_user','预订后通知用户手机','SMS_12200125','你已成功预订${bookingName}，请及时消费哦',1),(10,'sms_ele_tz_shop','新订单通知外卖企业','SMS_6700154','您好，您在${sitename}有新的外卖订单',1),(31,'sms_hotel_shop','用户酒店预订成功给企业发送短信','SMS_12150003','你好${shopName}，您的酒店房间${title}已被成功预订',1),(30,'sms_hotel_user','用户酒店预订成功发送短信到用户手机','SMS_12210144','您成功预订${hotelName}，电话${tel}，入驻时间${stime}',1),(14,'sms_tuan_user','客户下单后，发送团购劵到用户手机上','SMS_6735153','尊敬的${user}，您在${shopName}预定的抢购验证密码为：${code}，请及时消费哦',0),(29,'coupon_download_user','下载优惠劵发送短信到用户手机','SMS_11490719','您已成功下载${couponTitle},电子优惠劵${code}，过期时间${expireDate}',1),(28,'eleorder_refund_user','外卖退款通知用户','SMS_11505834','你好，您申请的外卖退款订单号${orderId}，已退款${needPay}元',1),(17,'sms_shop_recognition_user','认领企业成功通知用户','SMS_7280671','尊敬的${userName}，您认领的企业${shopName}已通过审核，请登录${sitename}查看',1),(18,'sms_yuyue_notice_shop','用户预约企业通知企业','SMS_7275592','尊敬的企业，${name}，合计${number}人，手机：${mobile},预约时间{yuyueDate}',1),(19,'tuan_TZ_user','抢购劵验证后通知用户已验证','SMS_8205249','您抢购的${name}.已于${data}成功消费.如有问题请联系客服${tel}',1),(20,'sms_admin_login_admin','后台账户异地IP登陆短信通知','SMS_8896080','尊敬的${userName}，你的后台于${time}账户操作异常，请查看',1),(21,'sms_life_dingyue_tongzhi_user','发送分类信息推送到用户手机','SMS_8921422','你好，${userName}发布了${title}，手机：${userMobile}，${sitename}',1),(22,'sms_shop_news_user','企业给会员推送短信模板','SMS_9515003','企业${shopName}举办${title}，地址${shopAddr}',1),(43,'sms_appoint_TZ_user','家政预约成功通知用户','SMS-288888888','您好，您成功预约家政${appointName}，时间${time}，预约地址${addr}',1),(24,'sms_breaks_tz_shop','用户优惠买单后通知企业','SMS_10245094','${shopName},${userName}买单${amount}元，实付${money}元',1),(25,'sms_breaks_tz_user','用户优惠买单后发动短信到用户自己手机上','SMS_10270032','你好${userName}，你在企业${shopName}处于${data}买单${money}元',1),(26,'goods_refund_user','商城订单退款给会员短信通知','SMS_10395078','你好，您申请的购物订单号${orderId}，已退款${needPay}元',1),(33,'sms_booking_shop','预订后通知企业','SMS_12210143','你好你的${bookingName}被成功预订，请及时处理',1),(34,'sms_crowd_user','众筹成功通知用户','SMS_12205865','尊敬的${userName}，你成功众筹${title}',1),(35,'sms_crowd_uid','众筹成功通知发起人','SMS_12145762','尊敬的${userName}，你的产品已被成功众筹',1),(36,'sms_appoint_refund_user','家政用户申请退款后通知到手机','SMS_12845602','尊敬的${userName}，你的家政订单号${orderId}已成功退款${refundMoney}元',1),(37,'sms_delivery_user','快递员抢单短信通知','SMS_12936181','您好，配送中心有新的${info}订单了，订单生成时间：${data}',1),(38,'sms_running_user','用户发布跑腿短信通知用户','SMS_13185667','你好${userName}，您发布的跑腿${runningId}已成功付费${needPay}，${time}',1),(39,'sms_running_delivery_user','配送员接单通知用户万能短信接口','SMS_13196831','尊敬的${userName}，${info}',1),(40,'sms_coupon_user','用户下载优惠劵万能短信接口','SMS_13181994','尊敬的${userName}，您成功下载优惠劵${title}，验证码${code}，${expireDate}过期',1),(41,'register_account_give_coupon','用户赠送优惠劵给朋友自动账户','SMS_13216763','尊敬的${userName},您的朋友${giveUserName}赠送你一张优惠劵，请及时消费',1),(42,'sms_cloud_win_user','云购中奖通知用户','sms-809792','尊敬的${userName}，您参与的拼吧${title}已成功获得，编号${number}',1),(44,'sms_appoint_TZ_shop','家政预约成功通知企业','SMS-288888889','您好${shopName}，用户预约家政${appointName}，时间${time}，地址${addr}',1),(45,'sms_push_mass_sms','全局推送短信通知','111','您好，${sitename}有新的通知：${title}',1),(46,'sms_zhe_notice_user','五折卡购买成功通知买家','SMS-909090','尊敬的${userName}，您成功购买${type}，编号${number}，有效期截止${endTime}',1),(47,'sms_edu_notice_user','用户购买课程短信通知','SMS-89080','尊敬的${userName}，您成功购买课程${title}，兑换码${code}，价格${needPay}元',1),(48,'sms_edu_notice_shop','用户购买课程短信通知企业','SMS-890800','尊敬的${shopName}，您卖出课程${title}，价格${needPay}元',1),(49,'sms_zhe_yuyue_user','用户预约五折卡后短信通知','SMS-898091','尊敬的${userName}，你成功预约五折卡${zheName}，兑换码${code}，时间${date}',1),(50,'sms_zhe_yuyue_shop','用户预约五折卡后通知企业','SMS-8980913','${shopName}，您的五折卡${zheName}已被卖出，购买会员昵称${userName}，手机${userMobile}',1),(51,'sms_zhe_yuyue_is_used_user','五折卡验证后通知买家','SMS-898098','尊敬的${userName}，您预约的五折卡${zheName}已成功验证，时间${usedTime}',1),(52,'sms_ele_reminder_shop','外卖用户催单短信通知企业','SMS-52345435','尊敬的${shopName}，${userName}对外卖订单编号${orderId}进行催单，请尽快配送',0),(53,'sms_hotel_refund_shop','酒店用户申请退款通知企业','SMS-43325235','尊敬的${shopName}，用户${refundName}预订的酒店房间${roomTitle}已申请退款，订单号{$orderId}，请及时处理',1),(54,'sms_hotel_refund_user','酒店企业同意退款通知用户','SMS-4332523','尊敬的${refundName}，您预订的房间${roomTitle}已成功退款${refundMoney}元，订单号${orderId}',1),(55,'sms_stock_user','股权购买通知买家','SMS-000001','尊敬的${userName}，您成功购买股权${title}，编号：${stockNumber}，购买价格${needPayPrice}',0),(56,'sms_stock_shop','股权购买通知企业','SMS-000002','尊敬的${shopName}，您成功卖出股权商品${title}，销售总价${needPayPrice}',0),(57,'sms_yuyue_notice_shop','用户预约企业通知买家','SMS_7275590','您成功预约企业${shopName}，电话${shopTel}，企业地址${shopAddr}，消费码${code}',0),(58,'register','新用户注册短信通知会员','sms-15456456','您被企业${shopName}邀请成功注册${sitename}会员，注册ID${userId}，账户${userAccount}，密码${userPassword}',0),(59,'sms_shop_news_push','企业批量给粉丝推送文章','SMS-15456400','企业${newsSource}有新的文章标题${newsTitle}，请注意查看',1),(60,'sms_order_change_price_user','企业改价通知买家','sms-5435436','尊敬的${userName}，您的商城订单id${orderId}订单总价已经修改为${changePrice}，请及时付款',1);

/*Table structure for table `tu_delivery` */

DROP TABLE IF EXISTS `tu_delivery`;

CREATE TABLE `tu_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `addr` varchar(64) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `delivery_type` tinyint(1) NOT NULL DEFAULT '0',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_weixin` tinyint(1) NOT NULL DEFAULT '0',
  `is_music` tinyint(1) NOT NULL DEFAULT '0',
  `audit` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `username` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_delivery` */

insert  into `tu_delivery`(`id`,`user_id`,`photo`,`name`,`mobile`,`addr`,`add_time`,`delivery_type`,`is_sms`,`is_weixin`,`is_music`,`audit`,`closed`,`create_time`,`create_ip`) values (1,1,'/attachs/2018/06/05/thumb_5b15f65992544.jpg','深圳','13658785478','徐城城东大道南段',0,0,0,0,0,1,0,1528165988,'27.13.25.234');

/*Table structure for table `tu_delivery_comment` */

DROP TABLE IF EXISTS `tu_delivery_comment`;

CREATE TABLE `tu_delivery_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT '0',
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0商城1外卖',
  `type_order_id` int(11) DEFAULT NULL COMMENT '原始订单ID',
  `delivery_id` int(11) DEFAULT NULL COMMENT '配送员ID',
  `score` tinyint(1) DEFAULT '0',
  `d1` tinyint(1) DEFAULT '0' COMMENT '点评1',
  `d2` tinyint(1) DEFAULT '0' COMMENT '点评2',
  `d3` tinyint(1) DEFAULT '0' COMMENT '点评3',
  `content` varchar(1024) DEFAULT '',
  `tag` varchar(64) DEFAULT NULL COMMENT '标签',
  `reply` varchar(1024) DEFAULT '',
  `reply_time` int(10) DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT '',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) NOT NULL DEFAULT '',
  `closed` tinyint(1) DEFAULT '0' COMMENT '1代表删除',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_delivery_comment` */

/*Table structure for table `tu_delivery_comment_pics` */

DROP TABLE IF EXISTS `tu_delivery_comment_pics`;

CREATE TABLE `tu_delivery_comment_pics` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_delivery_comment_pics` */

/*Table structure for table `tu_delivery_comment_tag` */

DROP TABLE IF EXISTS `tu_delivery_comment_tag`;

CREATE TABLE `tu_delivery_comment_tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0商城1外卖',
  `tagName` varchar(64) DEFAULT NULL COMMENT '标签名字',
  `orderby` int(11) DEFAULT '100' COMMENT '排序',
  `closed` tinyint(1) DEFAULT '0' COMMENT '1代表删除',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_delivery_comment_tag` */

/*Table structure for table `tu_delivery_order` */

DROP TABLE IF EXISTS `tu_delivery_order`;

CREATE TABLE `tu_delivery_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '0是商城，1是外卖，2是快件',
  `type_order_id` int(10) unsigned NOT NULL COMMENT '关联的分类中的订单编号',
  `delivery_id` int(10) unsigned NOT NULL COMMENT '配送员ID',
  `shop_id` int(10) unsigned NOT NULL,
  `city_id` int(10) NOT NULL COMMENT '订单城市',
  `area_id` int(10) DEFAULT NULL COMMENT '订单企业地区',
  `business_id` int(10) DEFAULT NULL COMMENT '订单企业商圈ID',
  `lat` varchar(15) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `shop_name` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `addr_id` int(10) DEFAULT NULL COMMENT '外卖地址',
  `address_id` int(11) DEFAULT NULL COMMENT '商城地址',
  `logistics_price` int(11) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL COMMENT '抢单备注',
  `is_appoint` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不指定，1指定配送员',
  `appoint_user_id` int(11) DEFAULT NULL COMMENT '指定配送员ID',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接单时间',
  `end_time` int(10) DEFAULT '0' COMMENT '完成时间 ',
  `status` tinyint(1) unsigned NOT NULL COMMENT '0是货到付款，1是已付款，2是配送中，8是已完成。',
  `closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_delivery_order` */

/*Table structure for table `tu_edu` */

DROP TABLE IF EXISTS `tu_edu`;

CREATE TABLE `tu_edu` (
  `edu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0',
  `edu_name` varchar(32) DEFAULT '',
  `intro` varchar(128) DEFAULT '',
  `tel` varchar(20) DEFAULT '',
  `photo` varchar(128) DEFAULT '',
  `addr` varchar(128) DEFAULT '',
  `cate_id` int(10) DEFAULT NULL COMMENT '分类ID',
  `city_id` int(10) DEFAULT '0',
  `area_id` int(10) DEFAULT '0',
  `business_id` int(10) DEFAULT '0',
  `lat` varchar(15) DEFAULT '',
  `lng` varchar(15) DEFAULT '',
  `rate` int(11) NOT NULL DEFAULT '0' COMMENT '结算费率',
  `details` text,
  `update_time` int(10) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT '',
  `audit` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`edu_id`,`shop_id`) USING BTREE,
  UNIQUE KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_edu` */

/*Table structure for table `tu_edu_cate` */

DROP TABLE IF EXISTS `tu_edu_cate`;

CREATE TABLE `tu_edu_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `photo` varchar(200) NOT NULL,
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_edu_cate` */

insert  into `tu_edu_cate`(`cate_id`,`cate_name`,`parent_id`,`orderby`,`photo`) values (13,'早教中心',0,2,'http://images4.5maiche.cn/2016-11-01_581822f855517.jpg'),(14,'文体艺术',0,1,''),(15,'0~3岁早教',13,1,''),(16,'智力潜能开发',13,2,''),(17,'幼儿托教',13,3,''),(18,'幼小衔接',13,4,''),(28,'哈哈',0,2,'http://images4.5maiche.cn/2017-11-23_5a16324b467a9.jpg'),(23,'高中教育',0,2,'/attachs/2017/06/15/thumb_59422b3767b7e.png'),(24,'语文',23,1,'/attachs/2017/06/15/thumb_59422b59b89bd.png'),(25,'数学',23,3,'/attachs/2017/06/15/thumb_59422b87813bd.png'),(26,'英语',23,4,'/attachs/2017/06/15/thumb_59422b9909b47.png'),(27,'物理',23,4,'/attachs/2017/06/15/thumb_59422bb794068.jpg');

/*Table structure for table `tu_edu_comment` */

DROP TABLE IF EXISTS `tu_edu_comment`;

CREATE TABLE `tu_edu_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT '0',
  `shop_id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT '0',
  `course_id` int(10) DEFAULT '0',
  `score` tinyint(1) DEFAULT '0',
  `have_photo` tinyint(1) DEFAULT '0',
  `content` varchar(1024) DEFAULT '',
  `reply` varchar(1024) DEFAULT '',
  `reply_time` int(10) DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT '',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_edu_comment` */

/*Table structure for table `tu_edu_comment_pics` */

DROP TABLE IF EXISTS `tu_edu_comment_pics`;

CREATE TABLE `tu_edu_comment_pics` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_edu_comment_pics` */

/*Table structure for table `tu_edu_course` */

DROP TABLE IF EXISTS `tu_edu_course`;

CREATE TABLE `tu_edu_course` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `edu_id` int(10) unsigned DEFAULT '0',
  `title` varchar(128) DEFAULT '',
  `photo` varchar(256) DEFAULT NULL COMMENT '课程主图',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '1代表完整课程，2代表试课',
  `intro` varchar(128) DEFAULT '',
  `price` int(11) DEFAULT '0' COMMENT '原价',
  `course_price` int(11) NOT NULL DEFAULT '0' COMMENT '完整课程价格',
  `test_price` int(11) NOT NULL DEFAULT '0' COMMENT '试课价格',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `age_id` int(11) DEFAULT NULL COMMENT '年龄段ID',
  `time_id` int(11) DEFAULT NULL COMMENT '时间段ID',
  `type_id` int(11) DEFAULT NULL COMMENT '类别ID',
  `class_id` int(11) DEFAULT NULL COMMENT '类型ID',
  `class_time` varchar(64) NOT NULL COMMENT '课时',
  `course_time` varchar(64) NOT NULL COMMENT '上课时间',
  `apply_time` varchar(64) NOT NULL COMMENT '报名时间',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1代表可以随时退',
  `views` int(10) NOT NULL COMMENT '浏览量',
  `orderby` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `sale` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1代表审核',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1关闭',
  `details` text NOT NULL COMMENT '描述',
  `create_time` varchar(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `	create_ip` int(10) DEFAULT NULL COMMENT '创建IP',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_edu_course` */

/*Table structure for table `tu_edu_order` */

DROP TABLE IF EXISTS `tu_edu_order`;

CREATE TABLE `tu_edu_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL COMMENT '订单企业ID',
  `edu_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL COMMENT '课程ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '1代表课程，2代表试课',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '原价',
  `need_pay` int(10) unsigned DEFAULT '0' COMMENT '订单实付价格',
  `order_status` tinyint(1) DEFAULT '0' COMMENT '状态，0未付款，-1已取消，1已付款，3申请退款，4已退款，8已完成',
  `code` int(11) DEFAULT NULL COMMENT '验证码',
  `is_used_code` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已验证，0没有严重',
  `is_used_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单验证时间',
  `comment_status` tinyint(1) unsigned DEFAULT '0',
  `create_time` int(10) unsigned DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  `closed` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_edu_order` */

/*Table structure for table `tu_ele` */

DROP TABLE IF EXISTS `tu_ele`;

CREATE TABLE `tu_ele` (
  `shop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(64) DEFAULT NULL COMMENT '冗余方便查询',
  `city_id` int(11) unsigned DEFAULT NULL,
  `area_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT '0',
  `cate` varchar(64) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0' COMMENT '1 代表营业中',
  `is_coupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不支持，1支持',
  `busihour` varchar(100) NOT NULL,
  `is_radius` int(11) DEFAULT NULL,
  `given_distribution` int(11) DEFAULT NULL,
  `is_print_deliver` tinyint(1) NOT NULL DEFAULT '0',
  `is_voice` tinyint(1) NOT NULL DEFAULT '0',
  `is_refresh` tinyint(1) NOT NULL DEFAULT '0',
  `is_refresh_second` int(3) DEFAULT NULL,
  `tags` varchar(128) DEFAULT NULL,
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '1代表支持在线付款',
  `is_daofu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不支持，1支持',
  `is_fan` tinyint(1) DEFAULT '0' COMMENT '1 代表返现',
  `fan_money` int(10) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `full_money` int(10) DEFAULT '0' COMMENT '满多少MONEY 立刻减几元',
  `new_money` int(10) DEFAULT '0' COMMENT '减多少钱  比如说 满20减5元 那么  每增加10块钱 将额外减一元',
  `is_full` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启满减',
  `order_price_full_1` int(11) DEFAULT NULL COMMENT '满多少1',
  `order_price_reduce_1` int(11) DEFAULT NULL COMMENT '减多少1',
  `order_price_full_2` int(11) DEFAULT NULL COMMENT '满多少2',
  `order_price_reduce_2` int(11) DEFAULT NULL COMMENT '减多少2',
  `logistics` int(10) DEFAULT '0' COMMENT '0代表不收取配送费 填写其他的将代表收取',
  `logistics_full` int(11) DEFAULT NULL COMMENT '满多少金额免配送费',
  `since_money` int(10) DEFAULT NULL COMMENT '起送价',
  `sold_num` int(10) DEFAULT NULL,
  `month_num` int(10) DEFAULT NULL,
  `intro` varchar(1024) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100' COMMENT '数字越小排序越高',
  `distribution` tinyint(3) DEFAULT '30' COMMENT '分钟  配送时间',
  `audit` tinyint(3) unsigned DEFAULT '0' COMMENT '0审核中1成功入驻2未通过',
  `rate` int(11) DEFAULT '60' COMMENT '费率 每个商品的结算价格',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ele` */

insert  into `tu_ele`(`shop_id`,`shop_name`,`city_id`,`area_id`,`business_id`,`cate`,`lng`,`lat`,`is_open`,`is_coupon`,`busihour`,`is_radius`,`given_distribution`,`is_print_deliver`,`is_voice`,`is_refresh`,`is_refresh_second`,`tags`,`is_pay`,`is_daofu`,`is_fan`,`fan_money`,`is_new`,`full_money`,`new_money`,`is_full`,`order_price_full_1`,`order_price_reduce_1`,`order_price_full_2`,`order_price_reduce_2`,`logistics`,`logistics_full`,`since_money`,`sold_num`,`month_num`,`intro`,`orderby`,`distribution`,`audit`,`rate`) values (1,'zhaopin',32,57,0,'1,2,3,4,5,6,7,8','116.417881','39.916683',0,0,'',NULL,NULL,0,0,0,NULL,NULL,1,0,1,1200,0,500000,20000,0,NULL,NULL,NULL,NULL,700,NULL,1000,NULL,NULL,'11111111',100,100,1,60);

/*Table structure for table `tu_ele_cate` */

DROP TABLE IF EXISTS `tu_ele_cate`;

CREATE TABLE `tu_ele_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`cate_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ele_cate` */

insert  into `tu_ele_cate`(`cate_id`,`shop_id`,`cate_name`,`num`,`closed`) values (12,3,'凉菜',2,0),(13,3,'热菜',2,0),(14,1,'面食',1,0),(15,2,'回锅肉',4,0),(16,9,'中餐',5,0),(17,1,'凉菜',1,0),(18,1,'熟食',18,0),(19,1,'甜点',0,0),(20,1,'海鲜',0,0),(21,1,'拌菜',1,0),(22,1,'蒸菜',1,0),(23,1,'水果',0,0),(24,1,'小吃',0,0),(25,43,'小吃',3,0),(26,43,'水',1,0),(27,1,'韩餐',1,0),(28,47,'饮料',1,0),(29,58,'寿司',2,0),(30,58,'前菜',0,0),(31,58,'刺身',0,0),(32,58,'6元寿司',0,0),(33,58,'8元寿司',0,0),(34,58,'10元寿司',0,0),(35,58,'12元寿司',0,0),(36,58,'15元寿司',0,0),(37,58,'6元寿司',0,0),(38,58,'8元寿司',0,0),(39,58,'18元寿司',0,0),(40,58,'20元寿司',0,0),(41,58,'22元寿司',0,0),(42,1,'小吃',0,0),(43,59,'中餐',1,0),(44,1,'测试红酒',0,0),(45,1,'测试茅台',0,0),(46,52,'麻辣小龙虾',1,0),(47,52,'干锅包菜',0,0),(48,53,'卤菜',2,0),(49,53,'水果',1,0),(50,53,'蔬菜',0,0),(51,75,'水果',1,0),(52,76,'烧菜',2,0),(53,76,'西餐',1,0),(54,76,'中餐',1,0),(55,82,'0101',1,0),(56,2,'测试分类1',1,0),(57,2,'测试分类2',1,0),(58,12,'分类名称1',1,0),(59,12,'分类名称2',1,0),(60,2,'测试一下分类',1,0),(61,1,'宝石',0,0),(62,1,'玉佩',0,0),(63,1,'大理石',0,0),(64,1,'玛瑙',0,0),(65,1,'项链珍珠玉石',0,0),(66,13,'十寸超值现烤披萨',3,0),(67,14,'汉堡专区',2,0),(68,14,'微辣专区',1,0),(69,14,'单人餐专区',1,0),(70,1,'泥鳅芋头',0,1),(71,1,'家乡特色菜',1,0),(72,1,'纯炒青菜',1,0),(73,21,'1',3,0),(74,21,'2',0,0),(75,21,'3',0,0);

/*Table structure for table `tu_ele_dianping` */

DROP TABLE IF EXISTS `tu_ele_dianping`;

CREATE TABLE `tu_ele_dianping` (
  `dianping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `speed` tinyint(3) unsigned DEFAULT '0',
  `cost` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `dianping_id` (`dianping_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ele_dianping` */

/*Table structure for table `tu_ele_dianping_pics` */

DROP TABLE IF EXISTS `tu_ele_dianping_pics`;

CREATE TABLE `tu_ele_dianping_pics` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE,
  KEY `dianping_id` (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ele_dianping_pics` */

/*Table structure for table `tu_ele_order` */

DROP TABLE IF EXISTS `tu_ele_order`;

CREATE TABLE `tu_ele_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `addr_id` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT '0',
  `logistics` int(11) DEFAULT '0',
  `need_pay` int(11) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `new_money` int(11) DEFAULT '0',
  `logistics_full_money` int(11) DEFAULT '0' COMMENT '满多少配送费立减费用',
  `download_coupon_id` int(11) DEFAULT NULL COMMENT '使用下载优惠劵ID',
  `reduce_coupun_money` int(11) DEFAULT NULL COMMENT '使用优惠劵减去费用',
  `full_reduce_price` int(11) NOT NULL DEFAULT '0' COMMENT '满减费用',
  `tableware_price` int(11) DEFAULT '0' COMMENT '餐具费用',
  `settlement_price` int(11) DEFAULT '0',
  `settlementIntro` varchar(256) DEFAULT NULL COMMENT '结算备注',
  `status` tinyint(3) DEFAULT '0' COMMENT '1等待处理  2代表已经确认  8代表配送完成',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '0是货到付款，1是在线支付',
  `is_daofu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为在线支付，1为货到付款',
  `is_store` tinyint(1) NOT NULL DEFAULT '0',
  `is_profit` tinyint(1) DEFAULT '0' COMMENT '1代表已分销，0未分销',
  `is_print` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `pay_time` int(11) DEFAULT NULL COMMENT '外卖付款时间',
  `refund_time` int(11) DEFAULT NULL COMMENT '退款时间',
  `orders_time` int(11) DEFAULT NULL COMMENT '接单时间',
  `end_time` int(11) DEFAULT NULL COMMENT '订单完成时间',
  `create_ip` varchar(15) DEFAULT NULL,
  `audit_time` int(11) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `month` int(11) DEFAULT '201501',
  `message` varchar(100) DEFAULT NULL,
  `is_dianping` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ele_order` */

/*Table structure for table `tu_ele_order_product` */

DROP TABLE IF EXISTS `tu_ele_order_product`;

CREATE TABLE `tu_ele_order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT NULL,
  `tableware_price` int(11) DEFAULT '0' COMMENT '订单菜单表新增餐具费',
  `month` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_ele_order_product` */

/*Table structure for table `tu_ele_product` */

DROP TABLE IF EXISTS `tu_ele_product`;

CREATE TABLE `tu_ele_product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(32) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `cost_price` int(11) DEFAULT NULL COMMENT '原价',
  `price` int(11) DEFAULT NULL,
  `tableware_price` int(11) DEFAULT '0' COMMENT '餐具费',
  `settlement_price` int(11) unsigned DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_tuijian` tinyint(1) DEFAULT '0',
  `sold_num` int(11) DEFAULT '0',
  `month_num` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ele_product` */

insert  into `tu_ele_product`(`product_id`,`product_name`,`desc`,`shop_id`,`cate_id`,`photo`,`cost_price`,`price`,`tableware_price`,`settlement_price`,`is_new`,`is_hot`,`is_tuijian`,`sold_num`,`month_num`,`create_time`,`create_ip`,`closed`,`audit`) values (1,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,14,'/attachs/2018/05/22/thumb_5b03c49d4143e.png',12100,1200,100,1128,1,1,1,0,0,1526973603,'111.37.71.184',0,1),(2,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973686,'111.37.71.184',0,1),(3,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973687,'111.37.71.184',0,1),(4,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973687,'111.37.71.184',0,1),(5,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973687,'111.37.71.184',0,1),(6,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973687,'111.37.71.184',0,1),(7,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973687,'111.37.71.184',0,1),(8,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973688,'111.37.71.184',0,1),(9,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973688,'111.37.71.184',0,1),(10,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973688,'111.37.71.184',0,1),(11,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973688,'111.37.71.184',0,1),(12,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973688,'111.37.71.184',0,1),(13,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973688,'111.37.71.184',0,1),(14,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973689,'111.37.71.184',0,1),(15,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973689,'111.37.71.184',0,1),(16,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973689,'111.37.71.184',0,1),(17,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973689,'111.37.71.184',0,1),(18,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973689,'111.37.71.184',0,1),(19,'蜀国烤鱼（海府大厦店）','蜀国烤鱼（海府大厦店）',1,18,'/attachs/2018/05/22/thumb_5b03c4ea0fac9.png',45300,4400,100,4136,1,1,1,0,0,1526973689,'111.37.71.184',0,1);

/*Table structure for table `tu_ele_reminder` */

DROP TABLE IF EXISTS `tu_ele_reminder`;

CREATE TABLE `tu_ele_reminder` (
  `reminder_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL COMMENT '外卖催单企业ID',
  `create_time` int(11) DEFAULT NULL COMMENT '外卖催单时间',
  `create_ip` varchar(32) DEFAULT NULL COMMENT '外卖催单IP',
  PRIMARY KEY (`reminder_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ele_reminder` */

/*Table structure for table `tu_email` */

DROP TABLE IF EXISTS `tu_email`;

CREATE TABLE `tu_email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(32) DEFAULT NULL,
  `email_explain` varchar(1024) DEFAULT NULL,
  `email_tmpl` text,
  `is_open` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`) USING BTREE,
  UNIQUE KEY `email_key` (`email_key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_email` */

insert  into `tu_email`(`email_id`,`email_key`,`email_explain`,`email_tmpl`,`is_open`) values (1,'email_rz','邮件认证模版支持标签：\r\n{link}','<p>尊敬的用户：</p><p>&nbsp; &nbsp; &nbsp;您复制以下链接即可完成邮件认证！</p><p>&nbsp; &nbsp; &nbsp;{link}</p><p>&nbsp; &nbsp; &nbsp;成为认证客户后可以申请更多的推广机会！</p><p>&nbsp; &nbsp; &nbsp;<strong>{sitename}</strong>祝您在本平台获得更多客户！客服联系电话：{tel}</p>',1),(2,'email_newpwd','找回密码：\r\n1、{newpwd}新密码','<p>尊敬的用户：您好，您再{sitename}的密码被重置成{newpwd}您可以使用{newpwd}重新登录！【{sitename}】</p>',1),(11,'send_email_link_audit','前台站长申请友情链接审核后通知站长的邮箱','<p>尊敬的{link_name}，您好，贵站申请的友情链接{link_url}已通过审核，审核时间{link_audit_time}</p>',1);

/*Table structure for table `tu_express` */

DROP TABLE IF EXISTS `tu_express`;

CREATE TABLE `tu_express` (
  `express_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `city_id` int(10) DEFAULT '0',
  `area_id` int(10) DEFAULT '0',
  `cid` int(10) DEFAULT '0',
  `business_id` int(10) DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `from_name` varchar(32) DEFAULT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `from_mobile` varchar(11) DEFAULT NULL,
  `to_name` varchar(32) DEFAULT NULL,
  `to_addr` varchar(255) DEFAULT NULL,
  `to_mobile` varchar(11) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0未处理，1已接单，2已完成，-1已拒收',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `update_time` int(20) DEFAULT NULL,
  PRIMARY KEY (`express_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_express` */

/*Table structure for table `tu_farm` */

DROP TABLE IF EXISTS `tu_farm`;

CREATE TABLE `tu_farm` (
  `farm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0',
  `farm_name` varchar(32) DEFAULT '',
  `intro` varchar(128) DEFAULT '',
  `tel` varchar(20) DEFAULT '',
  `photo` varchar(128) DEFAULT '',
  `addr` varchar(128) DEFAULT '',
  `city_id` int(10) DEFAULT '0',
  `area_id` int(10) DEFAULT '0',
  `business_id` int(10) DEFAULT '0',
  `orders` int(10) DEFAULT '0',
  `comments` int(10) DEFAULT '0',
  `good_comments` int(10) DEFAULT '0',
  `score` int(10) DEFAULT '0',
  `lat` varchar(15) DEFAULT '',
  `lng` varchar(15) DEFAULT '',
  `business_time` varchar(64) DEFAULT '',
  `details` text,
  `notice` text,
  `environmental` text,
  `update_time` int(10) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT '',
  `audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  `have_room` tinyint(1) DEFAULT '0',
  `have_washchange` tinyint(1) DEFAULT '0',
  `have_wifi` tinyint(1) DEFAULT '0',
  `have_shower` tinyint(1) DEFAULT '0',
  `have_tv` tinyint(1) DEFAULT '0',
  `have_ticket` tinyint(1) DEFAULT '0',
  `have_toiletries` tinyint(1) DEFAULT '0',
  `have_hotwater` tinyint(1) DEFAULT '0',
  `price` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`farm_id`,`shop_id`) USING BTREE,
  UNIQUE KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_farm` */

/*Table structure for table `tu_farm_comment` */

DROP TABLE IF EXISTS `tu_farm_comment`;

CREATE TABLE `tu_farm_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT '0',
  `shop_id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT '0',
  `farm_id` int(10) DEFAULT '0',
  `score` tinyint(1) DEFAULT '0',
  `have_photo` tinyint(1) DEFAULT '0',
  `content` varchar(1024) DEFAULT '',
  `reply` varchar(1024) DEFAULT '',
  `reply_time` int(10) DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT '',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_farm_comment` */

/*Table structure for table `tu_farm_comment_pics` */

DROP TABLE IF EXISTS `tu_farm_comment_pics`;

CREATE TABLE `tu_farm_comment_pics` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_farm_comment_pics` */

/*Table structure for table `tu_farm_group_attr` */

DROP TABLE IF EXISTS `tu_farm_group_attr`;

CREATE TABLE `tu_farm_group_attr` (
  `attr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_id`,`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_farm_group_attr` */

/*Table structure for table `tu_farm_order` */

DROP TABLE IF EXISTS `tu_farm_order`;

CREATE TABLE `tu_farm_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned DEFAULT '0',
  `jiesuan_amount` int(10) unsigned DEFAULT '0',
  `name` varchar(32) DEFAULT '',
  `mobile` varchar(11) DEFAULT '',
  `note` text,
  `gotime` int(10) unsigned DEFAULT '0',
  `order_status` tinyint(1) DEFAULT '0',
  `comment_status` tinyint(1) unsigned DEFAULT '0',
  `is_profit` tinyint(1) DEFAULT '0' COMMENT '1代表已分销，0未分销',
  `create_time` int(10) unsigned DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  `closed` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_farm_order` */

/*Table structure for table `tu_farm_package` */

DROP TABLE IF EXISTS `tu_farm_package`;

CREATE TABLE `tu_farm_package` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` int(10) unsigned DEFAULT '0',
  `title` varchar(128) DEFAULT '',
  `price` int(10) unsigned DEFAULT '0',
  `jiesuan_price` int(10) unsigned DEFAULT '0',
  `intro` varchar(128) DEFAULT '',
  `intro2` varchar(128) DEFAULT '',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_farm_package` */

/*Table structure for table `tu_farm_pics` */

DROP TABLE IF EXISTS `tu_farm_pics`;

CREATE TABLE `tu_farm_pics` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_farm_pics` */

/*Table structure for table `tu_farm_time_attr` */

DROP TABLE IF EXISTS `tu_farm_time_attr`;

CREATE TABLE `tu_farm_time_attr` (
  `attr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_id`,`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_farm_time_attr` */

/*Table structure for table `tu_feedback` */

DROP TABLE IF EXISTS `tu_feedback`;

CREATE TABLE `tu_feedback` (
  `feed_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `details` text,
  `reply` text,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `reply_time` int(11) DEFAULT NULL,
  `reply_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`feed_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_feedback` */

/*Table structure for table `tu_found` */

DROP TABLE IF EXISTS `tu_found`;

CREATE TABLE `tu_found` (
  `found_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`found_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_found` */

/*Table structure for table `tu_goods` */

DROP TABLE IF EXISTS `tu_goods`;

CREATE TABLE `tu_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `guige` varchar(64) DEFAULT NULL,
  `is_reight` int(10) DEFAULT '0',
  `weight` int(10) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `shopcate_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `city_id` varchar(64) DEFAULT NULL,
  `branch_id` varchar(64) DEFAULT NULL,
  `kuaidi_id` int(10) DEFAULT NULL,
  `goods_type` int(11) DEFAULT NULL COMMENT '商品属性类别',
  `photo` varchar(128) DEFAULT NULL,
  `wei_pic` varchar(256) DEFAULT NULL COMMENT '购物二维码',
  `price` int(11) DEFAULT NULL,
  `mall_price` int(11) DEFAULT NULL,
  `price_unit` varchar(255) DEFAULT NULL COMMENT '薪资单位',
  `price_month` varchar(255) DEFAULT NULL COMMENT '月薪资',
  `mobile_fan` int(11) NOT NULL,
  `min_price` int(11) NOT NULL,
  `settlement_price` int(11) DEFAULT '0',
  `sold_num` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `instructions` text,
  `details` text,
  `salary` text COMMENT '薪资待遇',
  `enroll` text COMMENT '录用条件',
  `explain` text COMMENT '岗位介绍',
  `end_date` date DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `is_mall` tinyint(3) DEFAULT '0',
  `is_vs1` int(2) DEFAULT '0',
  `is_vs2` int(2) DEFAULT '0',
  `is_vs3` int(2) DEFAULT '0',
  `is_vs4` int(2) DEFAULT '0',
  `is_vs5` int(2) DEFAULT '0',
  `is_vs6` int(2) DEFAULT '0',
  `commission` int(11) DEFAULT '0',
  `share` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `top_time` varchar(32) DEFAULT NULL COMMENT '置顶时间',
  `is_backers` tinyint(1) DEFAULT '0' COMMENT '1支持推手，0不支持',
  `orderby` tinyint(4) DEFAULT '100',
  `use_integral` int(11) DEFAULT '0' COMMENT '可使用积分数',
  `shoplx` smallint(8) NOT NULL COMMENT '商品类型',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_goods` */

insert  into `tu_goods`(`goods_id`,`title`,`intro`,`num`,`guige`,`is_reight`,`weight`,`cate_id`,`shopcate_id`,`area_id`,`business_id`,`shop_id`,`city_id`,`branch_id`,`kuaidi_id`,`goods_type`,`photo`,`wei_pic`,`price`,`mall_price`,`price_unit`,`price_month`,`mobile_fan`,`min_price`,`settlement_price`,`sold_num`,`views`,`instructions`,`details`,`salary`,`enroll`,`explain`,`end_date`,`audit`,`closed`,`is_mall`,`is_vs1`,`is_vs2`,`is_vs3`,`is_vs4`,`is_vs5`,`is_vs6`,`commission`,`share`,`create_time`,`create_ip`,`top_time`,`is_backers`,`orderby`,`use_integral`,`shoplx`) values (6,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(5,'机械厂流水线工2','机械厂流水线工人2',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(4,'机械厂流水线工人3','机械厂流水线工人3',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(7,'机械厂流水线工人4','机械厂流水线工人4',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(8,'机械厂流水线工人5','机械厂流水线工人5',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(9,'机械厂流水线工人6','机械厂流水线工人6',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(10,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(11,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(12,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(13,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(14,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(15,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(16,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(17,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(18,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(19,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(20,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,57,59,2,'32',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf31b89a4e3.jpg','0',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"subsidy-detail\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-right: 0.25rem; font-size: 0.7rem; color: var(--secondaryColor); border: none; margin-left: 0px;\">平台补足至：9元/小时</span></p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33),(21,'机械厂流水线工人1','机械厂流水线工人1',1000,'18-60岁;提供住宿;有补贴',0,0,20,NULL,59,60,2,'33',NULL,0,0,'/attachs/2019/11/28/thumb_5ddf4027db026.jpg','https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHF8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRE45UElWTjJjemwxMDAwMGcwM1QAAgTTveVdAwQAAAAA',1800,2000,'元/小时','4000-6000',0,0,0,2,22,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; min-height: 0.75rem; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">平台补足至：9元/小时</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自 2019年09月27日 起 入职即可领取</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">补贴时长：补3个月</p><p class=\"subsidy-content\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; font-size: 16.64px; border: none; min-height: 0.75rem; color: rgb(94, 94, 94); font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">备注：每个月补贴降2元，不满15天离职不无补贴</p><p><br/></p>',NULL,'<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">薪资福利：</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">综合工资： 4800-6000元/月</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资发放日： 每月10日(26-2号)</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">拿返费日期： 打卡满满足条件后，30天内拿到补贴</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">企业出名单： 每周二和周五各出1次名单（1周出2次名单）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">薪资说明：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工资计算： 基本工资2550+津贴+奖金</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 加班费： 加班基数2550元，平时1.5倍，周六日2倍，国假3倍</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 夜班津贴9元/班</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 年资加给： 150-300元</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">食宿介绍：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 住宿： 住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 伙食： 刷卡吃饭，吃多少扣多少</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">保险说明： 缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"/></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">注意事项：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 工厂人多，面试比较乱，保管好随身财物</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 做不满两个月不批辞职；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 当天打卡上班时间不满8小时不计入返费时间</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买</p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">录用条件：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 年龄： 18-40岁，（79年全年）男女不限；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 认识，会背会写26个英文字母，会写简单汉字；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、 无大面积纹身烟疤（男生脱上衣检查文身）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、 无案底，体内无钢板假牙牙套等异物；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、 前三根手指舞残缺，后面手指有残缺可以进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、 世硕和昌硕、华硕属于1次系统</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 正常离职满一个月个月，自离满两个月可以再进</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 厂里会让填是否有返费，需要配合驻厂填写费用</span></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">10、 查色盲，不查色弱</span></p><p><br/></p>','<p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">班制及优势：</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 两班制： 班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 生产线上均有中央空调并且为恒温车间，需穿静电服；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、 企业主要工作内容： 部分坐着工作、部份流水线、不穿无尘服 ；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">合同签署： 企业签订</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">体检说明： 企业指定的医院，体检费100元自理；</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">面试时间： 每天上午11:30集合（缺工时周六日面试）</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、 接站点： 昌硕招募中心</p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin-top: 0px; margin-bottom: 0px; color: rgb(94, 94, 94); font-size: 16.64px; font-family: &quot;Helvetica Neue&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; font-weight: 700;\">9、 乘车路线： 上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）</span></p><p><br/></p>','2020-11-29',1,0,1,0,0,0,0,0,0,0,0,1574908486,'127.0.0.1',NULL,0,0,0,33);

/*Table structure for table `tu_goods_cate` */

DROP TABLE IF EXISTS `tu_goods_cate`;

CREATE TABLE `tu_goods_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '商品类型ID',
  `commId` int(11) DEFAULT NULL COMMENT '代买/卖编码',
  `orderby` tinyint(3) DEFAULT '100',
  `photo` varchar(200) NOT NULL,
  `rate` int(11) DEFAULT '60' COMMENT '结算费率',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_goods_cate` */

insert  into `tu_goods_cate`(`cate_id`,`cate_name`,`parent_id`,`type_id`,`commId`,`orderby`,`photo`,`rate`) values (19,'机械厂',0,0,0,0,'',60),(20,'流水线工人',19,0,0,0,'',60);

/*Table structure for table `tu_goods_dianping` */

DROP TABLE IF EXISTS `tu_goods_dianping`;

CREATE TABLE `tu_goods_dianping` (
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT '0',
  `score` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_goods_dianping` */

/*Table structure for table `tu_goods_dianping_pics` */

DROP TABLE IF EXISTS `tu_goods_dianping_pics`;

CREATE TABLE `tu_goods_dianping_pics` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0',
  `order_id` int(11) unsigned DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE,
  KEY `dianping_id` (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_goods_dianping_pics` */

/*Table structure for table `tu_goods_favorites` */

DROP TABLE IF EXISTS `tu_goods_favorites`;

CREATE TABLE `tu_goods_favorites` (
  `favorites_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`favorites_id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_goods_favorites` */

insert  into `tu_goods_favorites`(`favorites_id`,`user_id`,`goods_id`,`create_time`,`create_ip`) values (1,3,6,1574911037,'127.0.0.1'),(2,3,21,1575163156,'127.0.0.1'),(3,4,6,1575250002,'27.222.125.72'),(4,4,21,1575265187,'27.222.125.72');

/*Table structure for table `tu_goods_photos` */

DROP TABLE IF EXISTS `tu_goods_photos`;

CREATE TABLE `tu_goods_photos` (
  `pic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_goods_photos` */

insert  into `tu_goods_photos`(`pic_id`,`goods_id`,`photo`) values (2,1,'/attachs/2018/05/22/thumb_5b03bd6f3daca.png'),(11,2,'/attachs/2018/05/22/thumb_5b03be7a3d735.png'),(10,2,'/attachs/2018/05/22/thumb_5b03be7a2e311.png'),(9,2,'/attachs/2018/05/22/thumb_5b03be7a58274.png'),(12,3,'/attachs/2019/11/28/thumb_5ddf26b6aedf5.jpg'),(13,4,'/attachs/2019/11/28/thumb_5ddf31bb3c47f.png'),(18,21,'/attachs/2019/11/28/thumb_5ddf4030d452d.jpg');

/*Table structure for table `tu_goods_shopcate` */

DROP TABLE IF EXISTS `tu_goods_shopcate`;

CREATE TABLE `tu_goods_shopcate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_goods_shopcate` */

/*Table structure for table `tu_hotel` */

DROP TABLE IF EXISTS `tu_hotel`;

CREATE TABLE `tu_hotel` (
  `hotel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT '0',
  `hotel_name` varchar(32) DEFAULT '',
  `tel` varchar(20) DEFAULT '',
  `photo` varchar(128) DEFAULT '',
  `addr` varchar(128) DEFAULT '',
  `city_id` int(10) DEFAULT '0',
  `area_id` int(10) DEFAULT '0',
  `business_id` int(10) DEFAULT '0',
  `star` tinyint(1) DEFAULT '0',
  `cate_id` tinyint(1) DEFAULT '0',
  `price` int(10) DEFAULT '0',
  `sold_num` int(10) DEFAULT '0',
  `comments` int(10) DEFAULT '0',
  `score` int(10) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `is_wifi` tinyint(1) DEFAULT '0',
  `is_kt` tinyint(1) DEFAULT '0',
  `is_nq` tinyint(1) DEFAULT '0',
  `is_xyj` tinyint(1) DEFAULT '0',
  `is_tv` tinyint(1) DEFAULT '0',
  `is_ly` tinyint(1) DEFAULT '0',
  `is_bx` tinyint(1) DEFAULT '0',
  `is_base` tinyint(1) DEFAULT '0',
  `is_rsh` tinyint(1) DEFAULT '0',
  `in_time` varchar(32) NOT NULL,
  `out_time` varchar(32) NOT NULL,
  `lat` varchar(15) DEFAULT '',
  `lng` varchar(15) DEFAULT '',
  `details` text,
  `update_time` int(10) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT '',
  `audit` tinyint(1) DEFAULT '0',
  `reason` varchar(256) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`hotel_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_hotel` */

insert  into `tu_hotel`(`hotel_id`,`shop_id`,`hotel_name`,`tel`,`photo`,`addr`,`city_id`,`area_id`,`business_id`,`star`,`cate_id`,`price`,`sold_num`,`comments`,`score`,`type`,`is_wifi`,`is_kt`,`is_nq`,`is_xyj`,`is_tv`,`is_ly`,`is_bx`,`is_base`,`is_rsh`,`in_time`,`out_time`,`lat`,`lng`,`details`,`update_time`,`update_ip`,`audit`,`reason`,`closed`,`create_time`,`create_ip`) values (1,1,'如家酒店','4008204454','/attachs/2018/05/31/thumb_5b0f7b9342742.jpg','北京朝阳国贸A102',32,57,59,5,1,200,0,0,0,0,1,1,1,1,1,1,1,1,0,'9点','12','0.004775','-0.002875','<p>如家<br/></p>',0,'',1,NULL,0,1527741358,'111.37.66.253');

/*Table structure for table `tu_hotel_brand` */

DROP TABLE IF EXISTS `tu_hotel_brand`;

CREATE TABLE `tu_hotel_brand` (
  `type` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT '',
  `orderby` tinyint(3) DEFAULT '100',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_hotel_brand` */

/*Table structure for table `tu_hotel_comment` */

DROP TABLE IF EXISTS `tu_hotel_comment`;

CREATE TABLE `tu_hotel_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT '0',
  `shop_id` int(11) unsigned NOT NULL,
  `user_id` int(10) DEFAULT '0',
  `hotel_id` int(10) DEFAULT '0',
  `score` tinyint(1) DEFAULT '0',
  `have_photo` tinyint(1) DEFAULT '0',
  `content` varchar(1024) DEFAULT '',
  `reply` varchar(1024) DEFAULT '',
  `reply_time` int(10) DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT '',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_hotel_comment` */

/*Table structure for table `tu_hotel_comment_pics` */

DROP TABLE IF EXISTS `tu_hotel_comment_pics`;

CREATE TABLE `tu_hotel_comment_pics` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_hotel_comment_pics` */

/*Table structure for table `tu_hotel_order` */

DROP TABLE IF EXISTS `tu_hotel_order`;

CREATE TABLE `tu_hotel_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT '0',
  `room_id` int(10) DEFAULT '0',
  `amount` int(10) DEFAULT '0',
  `jiesuan_amount` int(10) DEFAULT '0',
  `price` int(10) DEFAULT '0',
  `num` smallint(5) DEFAULT '0',
  `stime` date DEFAULT NULL,
  `ltime` date DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT '',
  `note` text,
  `order_status` tinyint(1) DEFAULT '0',
  `comment_status` tinyint(1) DEFAULT '0',
  `online_pay` tinyint(1) DEFAULT '0',
  `last_time` varchar(15) DEFAULT '',
  `is_profit` tinyint(1) DEFAULT '0' COMMENT '1代表已分销，0未分销',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_hotel_order` */

/*Table structure for table `tu_hotel_pics` */

DROP TABLE IF EXISTS `tu_hotel_pics`;

CREATE TABLE `tu_hotel_pics` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_hotel_pics` */

/*Table structure for table `tu_hotel_room` */

DROP TABLE IF EXISTS `tu_hotel_room`;

CREATE TABLE `tu_hotel_room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(10) DEFAULT '0',
  `title` varchar(32) DEFAULT '',
  `photo` varchar(128) DEFAULT '',
  `type` tinyint(1) DEFAULT '0',
  `area` smallint(5) DEFAULT '0',
  `is_zc` tinyint(1) DEFAULT '0',
  `is_kd` tinyint(1) DEFAULT '0',
  `is_cancel` tinyint(1) DEFAULT '0',
  `sku` smallint(5) DEFAULT '0',
  `price` int(10) DEFAULT '0',
  `settlement_price` int(10) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_hotel_room` */

/*Table structure for table `tu_huodong` */

DROP TABLE IF EXISTS `tu_huodong`;

CREATE TABLE `tu_huodong` (
  `huodong_id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `limit_num` int(6) NOT NULL DEFAULT '0',
  `intro` varchar(128) DEFAULT NULL,
  `time` varchar(64) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `addr` varchar(1024) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `traffic` tinyint(2) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `views` int(10) NOT NULL DEFAULT '0',
  `sign_num` int(11) DEFAULT '0',
  `ping_num` int(10) NOT NULL DEFAULT '0',
  `lat` varchar(15) DEFAULT '' COMMENT '纬度',
  `lng` varchar(15) DEFAULT '0' COMMENT '经度',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`huodong_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_huodong` */

/*Table structure for table `tu_huodong_dianping` */

DROP TABLE IF EXISTS `tu_huodong_dianping`;

CREATE TABLE `tu_huodong_dianping` (
  `dianping_id` int(11) NOT NULL,
  `huodong_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`dianping_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_huodong_dianping` */

/*Table structure for table `tu_huodong_looks` */

DROP TABLE IF EXISTS `tu_huodong_looks`;

CREATE TABLE `tu_huodong_looks` (
  `huodong_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`huodong_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_huodong_looks` */

/*Table structure for table `tu_huodong_sign` */

DROP TABLE IF EXISTS `tu_huodong_sign`;

CREATE TABLE `tu_huodong_sign` (
  `sign_id` int(10) NOT NULL AUTO_INCREMENT,
  `huodong_id` int(11) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`sign_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_huodong_sign` */

/*Table structure for table `tu_integral_exchange` */

DROP TABLE IF EXISTS `tu_integral_exchange`;

CREATE TABLE `tu_integral_exchange` (
  `exchange_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `addr_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0' COMMENT '1代表后台已经确认了那么发货是前台发货还是什么流程',
  PRIMARY KEY (`exchange_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_integral_exchange` */

/*Table structure for table `tu_integral_goods` */

DROP TABLE IF EXISTS `tu_integral_goods`;

CREATE TABLE `tu_integral_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `face_pic` varchar(64) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '1代表只能是本店的VIP 才能兑换该物品',
  `integral` int(11) DEFAULT '0',
  `price` int(11) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `limit_num` int(11) DEFAULT '0',
  `exchange_num` int(11) DEFAULT '0',
  `details` text,
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(255) DEFAULT NULL,
  `audit` tinyint(4) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0' COMMENT '1代表已经下架',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_integral_goods` */

/*Table structure for table `tu_job` */

DROP TABLE IF EXISTS `tu_job`;

CREATE TABLE `tu_job` (
  `job_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作岗位ID',
  `job_name` varchar(255) DEFAULT NULL COMMENT '工作名称',
  `company_id` mediumint(8) unsigned NOT NULL COMMENT '所属公司',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `job_img_url` varchar(255) DEFAULT NULL COMMENT '工作缩略图',
  `job_age_up` tinyint(2) unsigned DEFAULT '0' COMMENT '年龄上限,默认0,无限制',
  `job_age_down` tinyint(2) unsigned DEFAULT '0' COMMENT '年龄下限,默认0,无限制',
  `job_tags` varchar(200) DEFAULT NULL COMMENT '工作标签，多个标签使用 ; 分割 展示前3个',
  `job_price_hour` varchar(100) DEFAULT NULL COMMENT '每小时薪资',
  `job_price_hour_vip` varchar(100) DEFAULT NULL COMMENT 'VIP每小时薪资',
  `job_price_hour_unit` varchar(50) DEFAULT NULL COMMENT '每小时薪资单位 元/时 元/月',
  `job_price_day` varchar(100) DEFAULT NULL COMMENT '每日薪资',
  `job_price_day_vip` varchar(100) DEFAULT NULL COMMENT 'VIP日薪资',
  `job_price_day_unit` varchar(50) DEFAULT NULL COMMENT '每日薪资单位 元/时 元/月',
  `job_price_month` varchar(100) DEFAULT NULL COMMENT '每月薪资',
  `job_price_month_vip` varchar(100) DEFAULT NULL COMMENT 'VIP每月薪资',
  `job_price_month_unit` varchar(50) DEFAULT NULL COMMENT '每月薪资单位 元/时 元/月',
  `job_subsidy_hour` varchar(100) DEFAULT NULL COMMENT '每小时补贴',
  `job_subsidy_hour_vip` varchar(100) DEFAULT NULL COMMENT 'VIP每小时补贴',
  `job_subsidy_hour_unit` varchar(50) DEFAULT NULL COMMENT '补贴单位 元/时',
  `job_subsidy_day` varchar(100) DEFAULT NULL COMMENT '每日补贴',
  `job_subsidy_day_vip` varchar(100) DEFAULT NULL COMMENT 'VIP每日补贴',
  `job_subsidy_day_unit` varchar(50) DEFAULT NULL COMMENT '补贴单位 元/日',
  `job_subsidy_month` varchar(100) DEFAULT NULL COMMENT '每月补贴',
  `job_subsidy_month_vip` varchar(100) DEFAULT NULL COMMENT 'VIP每月补贴',
  `job_subsidy_month_unit` varchar(50) DEFAULT NULL COMMENT '补贴单位 元/时 元',
  `is_recruit` tinyint(2) DEFAULT '1' COMMENT '是否正在招工 0否 1是',
  `show_price_type` tinyint(2) DEFAULT '0' COMMENT '前端展示薪资类型，默认0 0小时 1天 2月 3补贴/小时 4补贴/日 5补贴/月',
  `job_order` int(10) DEFAULT '999' COMMENT '排序，默认999最靠后',
  `is_hot` tinyint(2) DEFAULT '0' COMMENT '是否热门工作,0不 1热门',
  `is_tuijian` tinyint(2) DEFAULT '0' COMMENT '是否推荐,0不 1推荐',
  `is_able` tinyint(2) DEFAULT '1' COMMENT '是否还有效,0无效 1有效',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `creat_time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='工作岗位表';

/*Data for the table `tu_job` */

insert  into `tu_job`(`job_id`,`job_name`,`company_id`,`company_name`,`job_img_url`,`job_age_up`,`job_age_down`,`job_tags`,`job_price_hour`,`job_price_hour_vip`,`job_price_hour_unit`,`job_price_day`,`job_price_day_vip`,`job_price_day_unit`,`job_price_month`,`job_price_month_vip`,`job_price_month_unit`,`job_subsidy_hour`,`job_subsidy_hour_vip`,`job_subsidy_hour_unit`,`job_subsidy_day`,`job_subsidy_day_vip`,`job_subsidy_day_unit`,`job_subsidy_month`,`job_subsidy_month_vip`,`job_subsidy_month_unit`,`is_recruit`,`show_price_type`,`job_order`,`is_hot`,`is_tuijian`,`is_able`,`remark`,`creat_time`) values (1,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月','19','22','元/小时','','','','','','',1,0,0,1,1,1,NULL,NULL),(2,'水泥厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'20','30','元/天','','','',0,1,1,1,1,1,NULL,NULL),(3,'屠宰场小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','600','650','元',1,0,2,1,1,1,NULL,NULL),(4,'水果长小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月','19','22','元/小时','','','','','','',0,2,3,1,1,1,NULL,NULL),(5,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'2','3','元/天','','','',1,3,4,1,1,1,NULL,NULL),(6,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','600','650','元',1,4,5,1,1,1,NULL,NULL),(7,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'','','','19','22','元/小时','','','','','','',1,0,0,1,1,1,NULL,NULL),(8,'水泥厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','','','',NULL,NULL,NULL,'20','30','元/天','','','',1,1,1,1,1,1,NULL,NULL),(9,'屠宰场小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','400 - 600','450 - 650','元/月',1,0,2,1,1,1,NULL,NULL),(10,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月','19','22','元/小时','','','','','','',1,0,0,1,1,1,NULL,NULL),(11,'水泥厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'20','30','元/天','','','',0,1,1,1,1,1,NULL,NULL),(12,'屠宰场小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','600','650','元',1,0,2,1,1,1,NULL,NULL),(13,'水果长小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月','19','22','元/小时','','','','','','',0,2,3,1,1,1,NULL,NULL),(14,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'2','3','元/天','','','',1,3,4,1,1,1,NULL,NULL),(15,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','600','650','元',1,4,5,1,1,1,NULL,NULL),(16,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'','','','19','22','元/小时','','','','','','',1,0,0,1,1,1,NULL,NULL),(17,'水泥厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','','','',NULL,NULL,NULL,'20','30','元/天','','','',1,1,1,1,1,1,NULL,NULL),(18,'屠宰场小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','400 - 600','450 - 650','元/月',1,0,2,1,1,1,NULL,NULL),(19,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月','19','22','元/小时','','','','','','',1,0,0,1,1,1,NULL,NULL),(20,'水泥厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'20','30','元/天','','','',0,1,1,1,1,1,NULL,NULL),(21,'屠宰场小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','600','650','元',1,0,2,1,1,1,NULL,NULL),(22,'水果长小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月','19','22','元/小时','','','','','','',0,2,3,1,1,1,NULL,NULL),(23,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'2','3','元/天','','','',1,3,4,1,1,1,NULL,NULL),(24,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','600','650','元',1,4,5,1,1,1,NULL,NULL),(25,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'','','','19','22','元/小时','','','','','','',1,0,0,1,1,1,NULL,NULL),(26,'水泥厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','','','',NULL,NULL,NULL,'20','30','元/天','','','',1,1,1,1,1,1,NULL,NULL),(27,'屠宰场小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','400 - 600','450 - 650','元/月',1,0,2,1,1,1,NULL,NULL),(28,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月','19','22','元/小时','','','','','','',1,0,0,1,1,1,NULL,NULL),(29,'水泥厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'20','30','元/天','','','',0,1,1,1,1,1,NULL,NULL),(30,'屠宰场小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','600','650','元',1,0,2,1,1,1,NULL,NULL),(31,'水果长小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月','19','22','元/小时','','','','','','',0,2,3,1,1,1,NULL,NULL),(32,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'2','3','元/天','','','',1,3,4,1,1,1,NULL,NULL),(33,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','600','650','元',1,4,5,1,1,1,NULL,NULL),(34,'电子厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'','','','19','22','元/小时','','','','','','',1,0,0,1,1,1,NULL,NULL),(35,'水泥厂小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','','','','150','170','元/天','','','',NULL,NULL,NULL,'20','30','元/天','','','',1,1,1,1,1,1,NULL,NULL),(36,'屠宰场小时工',1,'电子厂工厂','/template/mobile/new2/static/images/niuzhi/job_logo_test.jpg',18,60,'18-60岁;提供住宿;有补贴','18','20','元/小时',NULL,NULL,NULL,'4000 - 6000','4500 - 6500','元/月',NULL,NULL,NULL,'','','','400 - 600','450 - 650','元/月',1,0,2,1,1,1,NULL,NULL);

/*Table structure for table `tu_job_apply` */

DROP TABLE IF EXISTS `tu_job_apply`;

CREATE TABLE `tu_job_apply` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '工作id，这里工作表使用的是goods表，因此这里用goods_id',
  `audit` tinyint(1) DEFAULT '0' COMMENT '是否审核 0审核中 1已审核 2审核失败',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0未申请  1申请中 2申请成功 3申请失败',
  `msg` varchar(255) DEFAULT NULL COMMENT '描述',
  `cancal` tinyint(1) DEFAULT '1' COMMENT '用户是否取消 0已取消 1未取消',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `closed` tinyint(1) DEFAULT NULL COMMENT '0有效 1无效',
  `creat_time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `job_id` (`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_job_apply` */

insert  into `tu_job_apply`(`id`,`user_id`,`goods_id`,`audit`,`status`,`msg`,`cancal`,`remark`,`closed`,`creat_time`) values (19,3,21,0,1,NULL,1,NULL,0,'1575164896'),(20,3,6,0,1,NULL,1,NULL,0,'1575166151'),(21,4,21,0,1,NULL,1,NULL,0,'1575183695'),(22,4,6,0,1,NULL,1,NULL,0,'1575336855'),(23,6,6,0,1,NULL,1,NULL,0,'1575339394');

/*Table structure for table `tu_job_collect` */

DROP TABLE IF EXISTS `tu_job_collect`;

CREATE TABLE `tu_job_collect` (
  `collect_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `job_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '工作岗位id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`collect_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `goods_id` (`job_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_job_collect` */

/*Table structure for table `tu_job_company` */

DROP TABLE IF EXISTS `tu_job_company`;

CREATE TABLE `tu_job_company` (
  `company_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `company_name` varchar(50) NOT NULL COMMENT '公司名称',
  `company_level` int(11) NOT NULL COMMENT '公司等级',
  `company_leader_name` varchar(50) DEFAULT NULL COMMENT '公司负责人',
  `compay_type_id` int(11) NOT NULL COMMENT '公司分类',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '公司所在省份ID',
  `city_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '公司所在城市ID',
  `district` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '公司所在地区ID',
  `company_address` varchar(100) NOT NULL COMMENT '详细地区',
  `company_zip` varchar(10) NOT NULL COMMENT '邮政编码',
  `company_state` tinyint(1) NOT NULL DEFAULT '2' COMMENT '公司状态，0关闭，1开启，2审核中',
  `company_close_info` varchar(255) DEFAULT NULL COMMENT '公司关闭原因',
  `company_sort` int(11) NOT NULL DEFAULT '0' COMMENT '公司排序',
  `company_rebate_paytime` varchar(10) NOT NULL COMMENT '公司结算类型',
  `company_start_time` int(11) DEFAULT NULL COMMENT '公司成立时间',
  `company_end_time` int(11) DEFAULT NULL COMMENT '公司关闭时间',
  `company_logo` varchar(255) DEFAULT NULL COMMENT '公司logo',
  `company_banner` varchar(255) DEFAULT NULL COMMENT '公司横幅',
  `company_avatar` varchar(150) DEFAULT NULL COMMENT '公司头像',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT '公司seo关键字',
  `seo_description` varchar(255) DEFAULT NULL COMMENT '公司seo描述',
  `company_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `company_phone` varchar(20) DEFAULT NULL COMMENT '企业电话',
  `company_zy` text COMMENT '主营商品',
  `company_domain` varchar(50) DEFAULT NULL COMMENT '公司二级域名',
  `company_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `company_theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '公司当前主题',
  `company_credit` int(10) NOT NULL DEFAULT '0' COMMENT '公司信用',
  `company_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公司被收藏数量',
  `company_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `mb_slide` text COMMENT '手机公司 轮播图链接地址',
  `mb_slide_url` text COMMENT '手机版广告链接',
  `company_assets` decimal(12,2) DEFAULT '0.00' COMMENT '公司资产',
  `deleted` tinyint(1) unsigned zerofill NOT NULL COMMENT '未删除0，已删除1',
  `service_phone` varchar(20) DEFAULT NULL COMMENT '客服电话',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`company_id`) USING BTREE,
  KEY `company_name` (`company_name`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `district` (`district`) USING BTREE,
  KEY `company_state` (`company_state`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='公司数据表';

/*Data for the table `tu_job_company` */

insert  into `tu_job_company`(`company_id`,`company_name`,`company_level`,`company_leader_name`,`compay_type_id`,`province_id`,`city_id`,`district`,`company_address`,`company_zip`,`company_state`,`company_close_info`,`company_sort`,`company_rebate_paytime`,`company_start_time`,`company_end_time`,`company_logo`,`company_banner`,`company_avatar`,`seo_keywords`,`seo_description`,`company_qq`,`company_phone`,`company_zy`,`company_domain`,`company_recommend`,`company_theme`,`company_credit`,`company_collect`,`company_workingtime`,`mb_slide`,`mb_slide_url`,`company_assets`,`deleted`,`service_phone`,`remark`) values (1,'电子厂公司',0,'电子厂',1,1,1,1,'郊外电子厂','00000',1,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',0,0,NULL,NULL,NULL,'0.00',0,NULL,NULL);

/*Table structure for table `tu_job_description` */

DROP TABLE IF EXISTS `tu_job_description`;

CREATE TABLE `tu_job_description` (
  `description_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作描述ID',
  `job_id` mediumint(8) unsigned NOT NULL COMMENT '工作岗位ID',
  `desc_type` int(2) NOT NULL COMMENT '类型：0薪资福利 1薪资说明 2食宿介绍 3保险说明 4注意事项 5录用条件 6岗位介绍 7公司介绍 8入职流程 9平台提示',
  `content_title` varchar(255) DEFAULT NULL COMMENT '描述内容标题',
  `content` text NOT NULL COMMENT '描述内容',
  `content_index` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示数字标示 默认0不显示 1显示 即 1,2,3,4',
  `content_order` int(10) NOT NULL DEFAULT '999' COMMENT '内容排序 默认999最靠后',
  `content_color` varchar(50) DEFAULT NULL COMMENT '颜色，这里使用色值表示',
  `is_strong` int(2) NOT NULL DEFAULT '0' COMMENT '是否加粗，默认0 不加粗 1为加粗',
  `desc_order` int(10) NOT NULL DEFAULT '999' COMMENT '描述排序 默认999最靠后',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `creat_time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`description_id`) USING BTREE,
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岗位相关描述表';

/*Data for the table `tu_job_description` */

insert  into `tu_job_description`(`description_id`,`job_id`,`desc_type`,`content_title`,`content`,`content_index`,`content_order`,`content_color`,`is_strong`,`desc_order`,`remark`,`creat_time`) values (1,1,0,'薪资福利','',0,0,NULL,1,0,NULL,'2019-09-28 14:34:38'),(2,1,0,'综合工资','4800-6000元/月',0,1,NULL,0,0,NULL,'2019-09-28 14:34:38'),(3,1,0,'薪资发放日','每月10日(26-2号)',0,2,NULL,0,0,NULL,'2019-09-28 14:34:38'),(4,1,0,'拿返费日期','打卡满满足条件后，30天内拿到补贴',0,3,NULL,0,0,NULL,'2019-09-28 14:34:38'),(5,1,0,'企业出名单','每周二和周五各出1次名单（1周出2次名单）',0,4,NULL,0,0,NULL,'2019-09-28 14:34:38'),(6,1,1,'薪资说明','',0,0,NULL,0,0,NULL,'2019-09-28 14:34:38'),(7,1,1,'工资计算','基本工资2550+津贴+奖金',1,1,NULL,0,0,NULL,'2019-09-28 14:34:38'),(8,1,1,'加班费','加班基数2550元，平时1.5倍，周六日2倍，国假3倍',1,2,NULL,0,0,NULL,'2019-09-28 14:34:38'),(9,1,1,NULL,'夜班津贴9元/班',1,3,NULL,0,0,NULL,'2019-09-28 14:34:38'),(10,1,1,'年资加给','150-300元',1,4,NULL,0,0,NULL,'2019-09-28 14:34:38'),(11,1,2,'食宿介绍','',0,0,NULL,0,2,NULL,'2019-09-28 14:34:38'),(12,1,2,'住宿','住宿费160元/月，配有空调，卫生间等基础设施，有厂车接送；面试当天安排住宿，带好行李物品；水电费超出再扣。',1,1,NULL,0,2,NULL,'2019-09-28 14:34:38'),(13,1,2,'伙食','刷卡吃饭，吃多少扣多少',1,2,NULL,0,2,NULL,'2019-09-28 14:34:38'),(14,1,3,'保险说明','缴纳社会保五险400元/月，随国家政策会有调整，如未交上社保，会在每个月的25号之前分批陆续退给员工，未退则真实交上社保，可领取社保卡',0,0,NULL,0,3,NULL,'2019-09-28 14:34:38'),(15,1,4,'注意事项','',0,0,NULL,0,4,NULL,'2019-09-28 14:34:38'),(16,1,4,'','工厂人多，面试比较乱，保管好随身财物',1,1,NULL,0,4,NULL,'2019-09-28 14:34:38'),(17,1,4,'','做不满两个月不批辞职；',1,2,NULL,0,4,NULL,'2019-09-28 14:34:38'),(18,1,4,'','当天打卡上班时间不满8小时不计入返费时间',1,3,NULL,0,4,NULL,'2019-09-28 14:34:38'),(19,1,4,'','厂里体检会需要现金，备100元现金比较好，能自带被子的话，也可以省钱去买',1,4,NULL,0,4,NULL,'2019-09-28 14:34:38'),(20,1,5,'录用条件','',0,0,NULL,0,5,NULL,'2019-09-28 14:34:38'),(21,1,5,'年龄','18-40岁，（79年全年）男女不限；',1,1,NULL,0,5,NULL,'2019-09-28 14:34:38'),(22,1,5,'','认识，会背会写26个英文字母，会写简单汉字；',1,2,NULL,0,5,NULL,'2019-09-28 14:34:38'),(23,1,5,'','身份证原件（无磁、临时身份证都可）及复印件6张，1寸彩照8张',1,3,NULL,0,5,NULL,'2019-09-28 14:34:38'),(24,1,5,'','无大面积纹身烟疤（男生脱上衣检查文身）',1,4,NULL,0,5,NULL,'2019-09-28 14:34:38'),(25,1,5,'','无案底，体内无钢板假牙牙套等异物；',1,5,NULL,0,5,NULL,'2019-09-28 14:34:38'),(26,1,5,'','前三根手指舞残缺，后面手指有残缺可以进',1,6,NULL,0,5,NULL,'2019-09-28 14:34:38'),(27,1,5,'','世硕和昌硕、华硕属于1次系统',1,7,NULL,0,5,NULL,'2019-09-28 14:34:38'),(28,1,5,'','正常离职满一个月个月，自离满两个月可以再进',1,8,NULL,0,5,NULL,'2019-09-28 14:34:38'),(29,1,5,'','厂里会让填是否有返费，需要配合驻厂填写费用',1,9,NULL,1,5,NULL,'2019-09-28 14:34:38'),(30,1,5,'','查色盲，不查色弱',1,10,NULL,1,5,NULL,'2019-09-28 14:34:38'),(31,1,6,'班制及优势','',0,0,NULL,0,6,NULL,'2019-09-28 14:34:38'),(32,1,6,'两班制','班8:00-20:00，晚班20:00-8:00；半个月或一个月倒一次，坐着为主，具体由企业统一安排；',1,1,NULL,0,6,NULL,'2019-09-28 14:34:39'),(33,1,6,'','生产线上均有中央空调并且为恒温车间，需穿静电服；',1,2,NULL,0,6,NULL,'2019-09-28 14:34:39'),(34,1,6,'企业主要工作内容','部分坐着工作、部份流水线、不穿无尘服 ；',1,3,NULL,0,6,NULL,'2019-09-28 14:34:39'),(35,1,6,'','研发、生产、组装：卫星通信系统设备制造、卫星导航定位接收设备及关键零部件制造、手机，第三代及后续移动通信手机、基站、核心网设备及网络检测设备等',0,4,NULL,0,6,NULL,'2019-09-28 14:34:39'),(36,1,6,'合同签署','企业签订',0,5,NULL,0,6,NULL,'2019-09-28 14:34:39'),(37,1,6,'体检说明','企业指定的医院，体检费100元自理；',0,6,NULL,0,6,NULL,'2019-09-28 14:34:39'),(38,1,6,'面试时间','每天上午11:30集合（缺工时周六日面试）',0,7,NULL,0,6,NULL,'2019-09-28 14:34:39'),(39,1,6,'接站点','昌硕招募中心',1,8,NULL,0,6,NULL,'2019-09-28 14:34:39'),(40,1,6,'乘车路线','上海市浦东新区康桥东路1159弄108号（上海火车站下车后坐地铁1号线到徐家汇站下车不要出站换乘11号线到康新公路地铁站下车，然后打的到康桥东路1159弄108号松港产业园）',1,9,NULL,1,6,NULL,'2019-09-28 14:34:39'),(41,1,7,'','昌硕科技（上海）有限公司座落于上海浦东新区康桥工业园,占地面积 3200 亩，母公司为和联集团，主要从事高科技电子产品的生产，为全球五大笔记本电脑生产企业之一，公司拥有世界级工程技术研发团队，为消费者、企业用户提供最具创新的科技解决方案。企业有员工共6万人。 企业地址：上海浦东新区康桥镇康桥东路1159弄108号宿舍（康桥物业）',0,0,NULL,0,7,NULL,'2019-09-28 14:34:39'),(42,1,9,'','只有在平台报名才能保证自己的利益；',1,0,NULL,0,9,NULL,'2019-09-28 14:40:53'),(43,1,9,'','平台所有工价及补贴以面试入职当天为准；',1,0,NULL,0,9,NULL,'2019-09-28 14:40:53'),(44,1,9,'','面试前一晚早点休息，不要喝碳酸饮料、酒、吃辣的，体检会导致转氨酶偏高；',1,0,NULL,0,9,NULL,'2019-09-28 14:40:53'),(45,1,9,'','去面试的时候把自己收拾的干净点，因为企业喜欢干净利落的人，会分到一个好一点的部门。',1,0,NULL,0,9,NULL,'2019-09-28 14:40:53'),(46,1,9,'','未明确扣社保的岗位，表明暂不扣缴，后续政策变动交社保时，承担个人部分费用',1,0,NULL,0,9,NULL,'2019-09-28 14:40:53');

/*Table structure for table `tu_job_images` */

DROP TABLE IF EXISTS `tu_job_images`;

CREATE TABLE `tu_job_images` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id 自增',
  `job_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '工作岗位id',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`img_id`) USING BTREE,
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_job_images` */

insert  into `tu_job_images`(`img_id`,`job_id`,`image_url`) values (1,1,'/template/mobile/new2/static/images/niuzhi/info1.jpg'),(2,1,'/template/mobile/new2/static/images/niuzhi/info2.jpg'),(3,1,'/template/mobile/new2/static/images/niuzhi/info3.jpg'),(4,2,'/template/mobile/new2/static/images/niuzhi/info4.jpg'),(5,3,'/template/mobile/new2/static/images/niuzhi/info1.jpg'),(6,3,'/template/mobile/new2/static/images/niuzhi/info2.jpg'),(7,4,'/template/mobile/new2/static/images/niuzhi/info3.jpg'),(8,4,'/template/mobile/new2/static/images/niuzhi/info4.jpg'),(9,4,'/template/mobile/new2/static/images/niuzhi/info1.jpg'),(10,5,'/template/mobile/new2/static/images/niuzhi/info2.jpg');

/*Table structure for table `tu_job_subsidy` */

DROP TABLE IF EXISTS `tu_job_subsidy`;

CREATE TABLE `tu_job_subsidy` (
  `subsidy_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作补贴ID',
  `job_id` mediumint(8) unsigned NOT NULL COMMENT '所属工作岗位ID',
  `job_subsidy` decimal(10,0) DEFAULT NULL COMMENT '补贴',
  `job_subsidy_vip` decimal(10,0) DEFAULT NULL COMMENT 'VIP补贴',
  `job_subsidy_unit` varchar(50) DEFAULT NULL COMMENT '补贴单位 元/时 元/月 元',
  `job_subsidy_start` varchar(500) DEFAULT NULL COMMENT '补贴开始领取时间描述',
  `job_subsidy_time` varchar(200) DEFAULT NULL COMMENT '补贴时长',
  `job_subsidy_desc` varchar(500) DEFAULT NULL COMMENT '补贴描述',
  `job_subsidy_qualify` varchar(500) DEFAULT NULL COMMENT '补贴获取条件描述',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `creat_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`subsidy_id`) USING BTREE,
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岗位补贴表';

/*Data for the table `tu_job_subsidy` */

insert  into `tu_job_subsidy`(`subsidy_id`,`job_id`,`job_subsidy`,`job_subsidy_vip`,`job_subsidy_unit`,`job_subsidy_start`,`job_subsidy_time`,`job_subsidy_desc`,`job_subsidy_qualify`,`remark`,`creat_time`) values (1,1,'9','9','元/小时','自 2019年09月27日 起 入职即可领取','补贴时长：补3个月','平台补足至','每个月补贴降2元，不满15天离职不无补贴',NULL,2019),(2,1,'9','9','元/小时','自 2019年09月27日 起 入职即可领取','补贴时长：补3个月','平台补足至','每个月补贴降2元，不满15天离职不无补贴',NULL,2019),(3,1,'9','9','元/小时','自 2019年09月27日 起 入职即可领取','补贴时长：补3个月','平台补足至','每个月补贴降2元，不满15天离职不无补贴',NULL,2019),(4,2,'2800','2900','元','自 2019年09月26日 起','补贴时长：上班补7元/天','除工资外平台补','男女不限，满360天，返2880元',NULL,2019),(5,2,'2800','2900','元','自 2019年09月26日 起','补贴时长：上班补7元/天','除工资外平台补','男女不限，满360天，返2880元',NULL,2019),(6,2,'2800','2900','元','自 2019年09月26日 起','补贴时长：上班补7元/天','除工资外平台补','男女不限，满360天，返2880元',NULL,2019);

/*Table structure for table `tu_keyword` */

DROP TABLE IF EXISTS `tu_keyword`;

CREATE TABLE `tu_keyword` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '0' COMMENT '搜索关键字，0不限，1表示团购，2表示企业',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`key_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_keyword` */

insert  into `tu_keyword`(`key_id`,`keyword`,`type`,`create_time`,`create_ip`) values (4,'聚餐',1,1420630623,'127.0.0.1'),(10,'美食',6,1439453303,'127.0.0.1'),(15,'细',1,1511407825,'101.81.230.32');

/*Table structure for table `tu_ktv` */

DROP TABLE IF EXISTS `tu_ktv`;

CREATE TABLE `tu_ktv` (
  `ktv_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ktv_name` varchar(32) DEFAULT '',
  `intro` varchar(128) DEFAULT NULL COMMENT '简介',
  `tel` varchar(20) DEFAULT '',
  `photo` varchar(128) DEFAULT '',
  `addr` varchar(128) DEFAULT '',
  `city_id` int(10) DEFAULT '0',
  `area_id` int(10) DEFAULT '0',
  `business_id` int(10) DEFAULT '0',
  `lat` varchar(15) DEFAULT '',
  `lng` varchar(15) DEFAULT '',
  `date_id` varchar(64) DEFAULT NULL COMMENT '日期选择',
  `details` text,
  `orderby` int(11) DEFAULT '100' COMMENT '默认100，排序',
  `orders_num` int(11) DEFAULT '0' COMMENT '订单数量',
  `views` int(11) DEFAULT '0' COMMENT '浏览量',
  `audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`ktv_id`,`shop_id`) USING BTREE,
  UNIQUE KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ktv` */

/*Table structure for table `tu_ktv_order` */

DROP TABLE IF EXISTS `tu_ktv_order`;

CREATE TABLE `tu_ktv_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `ktv_id` int(10) unsigned NOT NULL,
  `shop_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL COMMENT '房间ID',
  `price` int(10) unsigned DEFAULT '0' COMMENT '价格',
  `jiesuan_price` int(10) unsigned DEFAULT '0' COMMENT '结算价格',
  `code` varchar(32) NOT NULL COMMENT '验证码',
  `is_used_code` tinyint(1) DEFAULT '0' COMMENT '1代表验证',
  `name` varchar(32) DEFAULT '',
  `mobile` varchar(11) DEFAULT '',
  `note` text,
  `gotime` int(10) unsigned DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未付款，1已付款，2已失效，3退款中，4已退款，8已完成',
  `create_time` int(10) unsigned DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  `closed` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ktv_order` */

/*Table structure for table `tu_ktv_room` */

DROP TABLE IF EXISTS `tu_ktv_room`;

CREATE TABLE `tu_ktv_room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ktv_id` int(10) unsigned DEFAULT '0',
  `title` varchar(128) DEFAULT '',
  `intro` varchar(128) DEFAULT NULL COMMENT '简介',
  `num` int(11) DEFAULT '0' COMMENT '每天可预订次数',
  `photo` varchar(128) DEFAULT '',
  `price` int(10) unsigned DEFAULT '0',
  `small_price` int(11) DEFAULT NULL COMMENT '最低消费金额',
  `daofu_price` int(11) DEFAULT '0' COMMENT '到店付多少钱',
  `accommodate_number` varchar(11) DEFAULT '0' COMMENT '可容纳人数',
  `jiesuan_price` int(10) unsigned DEFAULT '0' COMMENT '结算价格',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1代表删除',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_ktv_room` */

/*Table structure for table `tu_life` */

DROP TABLE IF EXISTS `tu_life`;

CREATE TABLE `tu_life` (
  `life_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `cate_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `area_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `is_shop` tinyint(1) DEFAULT '0',
  `text1` varchar(64) DEFAULT NULL,
  `text2` varchar(64) DEFAULT NULL,
  `text3` varchar(64) DEFAULT NULL,
  `text4` varchar(256) DEFAULT NULL,
  `text5` varchar(256) DEFAULT NULL,
  `num1` int(11) DEFAULT NULL,
  `num2` int(11) DEFAULT NULL,
  `select1` int(11) DEFAULT NULL,
  `select2` int(11) DEFAULT NULL,
  `select3` int(11) DEFAULT NULL,
  `select4` int(11) DEFAULT NULL,
  `select5` int(11) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL COMMENT '标签,分割',
  `urgent_date` date DEFAULT '0000-00-00',
  `top_date` date DEFAULT '0000-00-00',
  `photo` varchar(64) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `money` int(11) DEFAULT '0' COMMENT '购买单价',
  `buy_num` int(11) DEFAULT '0' COMMENT '购买人次',
  `status` tinyint(1) DEFAULT NULL COMMENT '信息支付状态',
  `need_pay` int(11) DEFAULT NULL COMMENT '信息实际支付',
  `views` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`life_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life` */

/*Table structure for table `tu_life_buy` */

DROP TABLE IF EXISTS `tu_life_buy`;

CREATE TABLE `tu_life_buy` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `city_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `life_id` int(11) DEFAULT NULL COMMENT '信息编号',
  `money` varchar(10) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '发表时间',
  `create_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`buy_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_buy` */

/*Table structure for table `tu_life_cate` */

DROP TABLE IF EXISTS `tu_life_cate`;

CREATE TABLE `tu_life_cate` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` tinyint(3) DEFAULT '0',
  `cate_name` varchar(32) DEFAULT NULL,
  `price` int(11) DEFAULT '0' COMMENT '分类扣费',
  `num` int(11) DEFAULT '0' COMMENT '信息数冗余',
  `text1` varchar(32) DEFAULT NULL COMMENT '文本字段一',
  `text2` varchar(32) DEFAULT NULL COMMENT '文本字段2',
  `text3` varchar(32) DEFAULT NULL,
  `text4` varchar(32) DEFAULT NULL,
  `text5` varchar(32) DEFAULT NULL,
  `num1` varchar(32) DEFAULT NULL,
  `num2` varchar(32) DEFAULT NULL COMMENT '5个text字段，如果text 字段没有设置那么就不启用',
  `unit1` varchar(32) DEFAULT NULL,
  `unit2` varchar(32) DEFAULT NULL,
  `select1` varchar(32) DEFAULT NULL,
  `select2` varchar(32) DEFAULT NULL,
  `select3` varchar(32) DEFAULT NULL,
  `select4` varchar(32) DEFAULT NULL COMMENT '多选1',
  `select5` varchar(32) DEFAULT NULL COMMENT '多选2',
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_cate` */

insert  into `tu_life_cate`(`cate_id`,`channel_id`,`cate_name`,`price`,`num`,`text1`,`text2`,`text3`,`text4`,`text5`,`num1`,`num2`,`unit1`,`unit2`,`select1`,`select2`,`select3`,`select4`,`select5`,`orderby`,`is_hot`) values (1,1,'手机及配件',0,0,'新旧程度','','',NULL,NULL,'原价','现价','元','元','供求','品牌','价格','','',100,1),(2,1,'数码产品',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','分类','价格','','',100,1),(3,1,'门票卡券',0,0,'','','',NULL,NULL,'原价','现价','','','供求','类型','价格','','',100,0),(4,1,'家用电器',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','分类','价格','','',100,1),(5,1,'日常用品',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','类型','价格','','',100,1),(8,1,'运动/图书/乐器',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','类型','价格','','',100,0),(6,1,'办公经营设备',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','类型','价格','','',100,0),(7,1,'服装/配饰/鞋包',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','类型','价格','','',100,0),(9,1,'笔记本',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','品牌','价格','','',100,1),(10,1,'家具/办公家具',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','类型','价格','','',100,1),(11,1,'手机号码',68,0,'','','',NULL,NULL,'价格','','','','供求','类型','价格','','',1,1),(12,1,'母婴/玩具',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','类型','价格','','',100,1),(13,1,'工艺品/收藏品',0,0,'商品描述','','',NULL,NULL,'价格','','','','供求','类型','价格','','',100,0),(14,1,'台式电脑及配件',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','品牌','价格','','',100,1),(15,1,'食品/农产品',0,0,'商品描述','','',NULL,NULL,'价格','','','','供求','类型','价格','','',100,0),(16,1,'设备租赁',0,0,'设备功能描述','','',NULL,NULL,'价格','','','','供求','服务内容','价格','','',100,0),(17,1,'平板电脑',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','供求','品牌','价格','','',100,1),(18,1,'工业设备',0,0,'功能描述','','',NULL,NULL,'原价','现价','','','供求','类型','价格','','',100,0),(19,1,'其他物品',0,0,'商品描述','','',NULL,NULL,'价格','','','','供求','价格','','','',100,0),(20,1,'物品回收',0,0,'','','',NULL,NULL,'','','','','','类型','','','',100,0),(21,2,'二手轿车',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','价格','车型级别','品牌','','',100,1),(23,2,'个人车源',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','价格','车型级别','品牌','','',100,0),(24,2,'电动车',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','分类','品牌','价格','','',100,1),(25,2,'自行车',0,0,'新旧描述','','',NULL,NULL,'原价','现价','','','类型','品牌','价格','','',100,1),(26,2,'二手货车',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','类型','品牌','价格','','',100,1),(27,2,'摩托车/燃气车',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','类型','品牌','价格','','',100,1),(28,2,'拼车/顺风车',0,0,'','','',NULL,NULL,'','','','','车辆情况','类型','','','',100,0),(29,2,'汽车用品/配件',0,0,'商品描述','','',NULL,NULL,'价格','','','','供求','类型','价格','','',100,0),(30,2,'新车优惠/4S店',0,0,'','','',NULL,NULL,'价格','','','','品牌','价格','','','',100,0),(31,2,'汽修保养',0,0,'服务描述','','',NULL,NULL,'','','','','服务类型','','','','',100,0),(32,2,'二手工程车',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','类型','品牌','价格','','',100,0),(33,2,'过户/验车',0,0,'','','',NULL,NULL,'','','','','类型','','','','',100,0),(34,2,'面包车/客车',0,0,'','新旧程度','',NULL,NULL,'原价','现价','','','类型','品牌','价格','','',100,0),(35,2,'拖拉机/收割机',0,0,'新旧程度','','',NULL,NULL,'原价','现价','','','类型','品牌','价格','','',100,0),(36,2,'本地下线车',0,0,'','','',NULL,NULL,'价格','','','','车辆级别','品牌','价格','','',100,0),(37,2,'车辆收购/评估',0,0,'','','',NULL,NULL,'','','','','分类','','','','',100,0),(38,3,'全职求职意向',0,0,'','','',NULL,NULL,'','','','','求职意向','性别','学历','','',100,0),(39,3,'兼职求职意向',0,0,'','','',NULL,NULL,'','','','','求职意向','性别','','','',100,0),(40,4,'结伴活动',0,0,'','','',NULL,NULL,'','','','','类型','性别','','','',100,1),(41,4,'征婚',0,0,'','','',NULL,NULL,'','','','','性别','年龄','','','',100,1),(43,4,'婚介服务',0,0,'','','',NULL,NULL,'','','','','','','','','',100,0),(44,4,'技能交流',0,0,'','','',NULL,NULL,'','','','','我会','','','','',100,0),(45,4,'找人/寻物',0,0,'','','',NULL,NULL,'','','','','类型','','','','',100,0),(46,4,'拼车/顺风车',0,0,'','','',NULL,NULL,'','','','','车辆情况','类型','','','',100,1),(47,5,'租房/出租',0,0,'','','',NULL,NULL,'','','','','租房类型','租金','房型','测试','对不对',100,1),(48,5,'个人租房',0,0,'','','',NULL,NULL,'','','','','租房类型','租金','房型','','',100,1),(49,5,'二手房出售',0,0,'','','',NULL,NULL,'原价','现价','','','面积','价格','房型','','',100,1),(50,5,'商铺出售',0,0,'','','',NULL,NULL,'','','','','类型','面积','价格','','',100,0),(51,5,'店铺转让/出租',0,0,'','','',NULL,NULL,'','','','','类型','面积','租金','','',100,0),(52,5,'求租/求购',0,0,'','','',NULL,NULL,'','','','','','','','','',100,1),(53,5,'写字楼出租',0,0,'','','',NULL,NULL,'','','','','类型','面积','价格','','',100,0),(54,5,'日租/短租',0,0,'','','',NULL,NULL,'','','','','类型','出租形式','租金','','',100,0),(55,5,'厂房/仓库/土地',0,0,'','','',NULL,NULL,'','','','','面积','价格','','','',100,0),(56,5,'写字楼出售',0,0,'','','',NULL,NULL,'','','','','类型','面积','价格','','',100,0),(57,5,'新房出售',0,0,'','','',NULL,NULL,'','','','','面积','价格','房型','','',100,0),(58,6,'中小学教育',0,0,'','','',NULL,NULL,'','','','','培训类型','课程费用','','','',100,1),(59,6,'职业技能',0,0,'','','',NULL,NULL,'','','','','培训类型','课程费用','','','',100,1),(61,6,'电脑培训',0,0,'','','',NULL,NULL,'','','','','培训类型','课程费用','','','',100,1),(62,6,'艺术培训',0,0,'','','',NULL,NULL,'','','','','培训类型','课程费用','','','',100,0),(63,6,'外语培训',0,0,'','','',NULL,NULL,'','','','','培训类型','课程费用','','','',100,1),(64,6,'设计培训',0,0,'','','',NULL,NULL,'','','','','培训类型','课程费用','','','',100,1),(65,6,'婴幼儿教育',0,0,'','','',NULL,NULL,'','','','','培训类型','课程费用','','','',100,0),(66,6,'体育培训',0,0,'','','',NULL,NULL,'','','','','培训类型','课程费用','','','',100,0),(67,7,'工人/技工',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,1),(68,7,'销售/金融',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,1),(69,7,'保健按摩',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,1),(70,7,'美工/设计',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,1),(71,7,'人事/行政/文员',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,1),(72,7,'营业员/促销/零售',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','工作时间','','',100,1),(73,7,'服务员/收银员',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,0),(74,7,'厨师/切配',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,0),(75,7,'送货/快递/仓管',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,0),(76,7,'保安',0,0,'','','',NULL,NULL,'','','','','薪资水平','','','','',100,0),(77,7,'家政/保洁',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,0),(78,7,'司机/驾驶员',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,0),(79,7,'老师/培训师',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,0),(80,7,'财务/会计',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,0),(81,7,'淘宝招聘',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','工作时间','','',100,0),(82,7,'客服',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,1),(83,7,'美容美发',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,0),(84,7,'计算机/网络/通信',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','经验要求','','',100,1),(85,7,'市场/公关/媒介',0,0,'','','',NULL,NULL,'','','','','职位类别','薪资水平','','','',100,0),(86,7,'人才招聘会',0,0,'地点、时间','','',NULL,NULL,'','','','','','','','','',100,0),(87,7,'翻译',0,0,'','','',NULL,NULL,'','','','','翻译语种','薪资水平','','','',100,0),(88,7,'出国劳务',0,0,'工作描述','','',NULL,NULL,'','','','','','','','','',100,0),(89,7,'其他招聘',0,0,'工作描述','','',NULL,NULL,'','','','','薪资水平','','','','',100,0),(91,8,'担保/贷款',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(92,8,'家电维修',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(94,8,'公司注册',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(95,8,'房屋装修',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,1),(96,8,'投资理财',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(98,8,'电脑维修',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(99,8,'快递/物流',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(100,8,'农林牧副渔',0,0,'','','',NULL,NULL,'','','','','类别','','','','',100,0),(101,8,'设计策划',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(102,8,'管道疏通',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(103,8,'租车服务',0,0,'','','',NULL,NULL,'','','','','服务内容','价格/天','','','',100,0),(106,8,'保洁/清洗',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(107,8,'陪驾/代驾',0,0,'','','',NULL,NULL,'','','','','价格','','','','',100,0),(108,8,'搬家服务',0,0,'搬家说明','','',NULL,NULL,'','','','','','','','','',100,0),(109,8,'驾校服务',0,0,'','','',NULL,NULL,'','','','','驾驶证类型','价格','','','',100,0),(110,8,'开锁/修锁',0,0,'','','',NULL,NULL,'','','','','','','','','',100,0),(113,8,'机票/签证',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(115,8,'家具维修',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(116,8,'美容纤体',0,0,'','','',NULL,NULL,'','','','','服务内容','价格','','','',100,0),(117,8,'保姆/月嫂',0,0,'','','',NULL,NULL,'','','','','发布人','服务内容','','','',100,0),(120,8,'婚庆/化妆',0,0,'','','',NULL,NULL,'','','','','服务内容','价格','','','',100,0),(123,8,'外卖/送水',0,0,'','','',NULL,NULL,'','','','','服务内容','','','','',100,0),(124,8,'酒店/宾馆',0,0,'','','',NULL,NULL,'','','','','服务内容','价格/天','','','',100,0),(127,8,'整形美容',0,0,'','','',NULL,NULL,'','','','','服务类别','','','','',100,0),(130,9,'其他兼职',0,0,'','','',NULL,NULL,'','','','','兼职类型','工资/天','','','',100,0),(131,9,'家教/老师',0,0,'','','',NULL,NULL,'','','','','类型','工资/小时','','','',100,0),(132,9,'派发/促销',0,0,'','','',NULL,NULL,'','','','','类型','工资/小时','','','',100,0),(134,9,'学生兼职',0,0,'','','',NULL,NULL,'','','','','工资/小时','','','','',100,0),(137,9,'会计/财务',0,0,'','','',NULL,NULL,'','','','','工资/天','','','','',100,0),(139,9,'市场调查',0,0,'','','',NULL,NULL,'','','','','工资/天','','','','',100,0),(142,10,'狗狗',0,0,'狗狗描述','','',NULL,NULL,'','','','','品种','价格','公母','','',100,1),(143,10,'其它宠物',0,0,'描述','','',NULL,NULL,'','','','','分类','价格','','','',100,1),(145,10,'猫猫',5668,0,'猫猫描述','','',NULL,NULL,'','','','','品种','价格','公母','','',100,0);

/*Table structure for table `tu_life_cate_attr` */

DROP TABLE IF EXISTS `tu_life_cate_attr`;

CREATE TABLE `tu_life_cate_attr` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `attr_name` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`attr_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2688 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_cate_attr` */

insert  into `tu_life_cate_attr`(`attr_id`,`cate_id`,`type`,`attr_name`,`orderby`) values (1,1,'select1','供应',1),(2,1,'select1','求购',2),(3,1,'select2','苹果',2),(4,1,'select2','三星',3),(5,1,'select2','魅族',4),(6,1,'select2','htc',5),(7,1,'select3','500元以下',2),(8,1,'select3','500-1000元',3),(9,1,'select3','1000-2000元',4),(10,1,'select3','2000-3000元',5),(11,1,'select3','3000-4000元',6),(12,1,'select3','4000-5000元',7),(13,1,'select3','5000元以上',8),(1705,67,'select2','2000元以下',2),(15,2,'select1','供应',1),(16,2,'select1','求购',2),(36,2,'select2','MP3/MP4',4),(37,2,'select2','镜头/配件',5),(38,2,'select2','其他',6),(34,2,'select2','相机',2),(35,2,'select2','手机及其配件',3),(24,3,'select1','供应',1),(25,3,'select1','求购',2),(26,3,'select3','50以下',2),(27,3,'select3','50—150',3),(28,3,'select3','150—300',4),(29,3,'select3','300—500',5),(30,3,'select3','500—1000',6),(31,3,'select3','1000以上',7),(32,4,'select1','供应',1),(33,4,'select1','求购',2),(39,2,'select3','200以下',2),(40,2,'select3','200—500',3),(41,2,'select3','500—1000',4),(42,2,'select3','1000—2000',5),(43,2,'select3','2000以上',6),(44,4,'select2','空调',2),(45,4,'select2','冰箱/冰柜',3),(46,4,'select2','厨房电器',4),(47,4,'select2','电视机',5),(48,4,'select2','居家电器',6),(49,4,'select2','洗衣机',7),(50,4,'select2','卫浴/护理器',8),(51,4,'select2','音响电器',9),(52,4,'select2','其它',10),(53,4,'select3','200以下',2),(54,4,'select3','200—500',3),(55,4,'select3','500—800',4),(56,4,'select3','800—1200',5),(57,4,'select3','1200—1600',6),(58,4,'select3','1600—2200',7),(59,4,'select3','2200—3000',8),(60,4,'select3','3000以上',9),(61,3,'select2','健身/游泳',2),(62,3,'select2','旅游/景点/酒店',3),(63,3,'select2','演出/电影',4),(64,3,'select2','超市',5),(65,3,'select2','美食',6),(66,3,'select2','月饼券',7),(91,3,'select2','其它',8),(68,5,'select1','供应',1),(69,5,'select1','求购',2),(70,5,'select2','家居用品',2),(71,5,'select2','化妆品',3),(72,5,'select2','家纺',4),(73,5,'select2','烟酒',5),(74,5,'select2','其它',6),(75,5,'select3','50以下',2),(76,5,'select3','50—150',3),(77,5,'select3','150—350',4),(78,5,'select3','350—600',5),(79,5,'select3','600—1000',6),(80,5,'select3','1000—2000',7),(81,5,'select3','2000以上',8),(82,1,'select2','小米',6),(83,1,'select2','诺基亚',7),(84,1,'select2','华为',8),(85,1,'select2','联想',9),(86,1,'select2','中兴',10),(87,1,'select2','oppo',11),(88,1,'select2','步步高',12),(89,1,'select2','金立',13),(90,1,'select2','其它',14),(92,6,'select1','供应',1),(93,6,'select1','求购',2),(94,6,'select2','打印机',2),(95,6,'select2','复印/扫描/投影',3),(96,6,'select2','文具',4),(97,6,'select2','其它',5),(98,6,'select3','50以下',2),(99,6,'select3','50—150',3),(100,6,'select3','150—300',4),(101,6,'select3','300—500',5),(102,6,'select3','500—800',6),(103,6,'select3','800—1200',7),(104,6,'select3','1200以上',8),(105,7,'select1','供应',1),(106,7,'select1','求购',2),(120,7,'select2','女装',2),(121,7,'select2','男装',3),(122,7,'select2','鞋子',4),(123,7,'select2','手表',5),(124,7,'select2','配饰',6),(125,7,'select2','羽绒服',7),(126,7,'select2','其他',8),(128,7,'select3','30以下',2),(129,7,'select3','30—50',3),(130,7,'select3','50—100',4),(131,7,'select3','100—150',5),(132,7,'select3','150—200',6),(133,7,'select3','200—300',7),(134,7,'select3','300—500',8),(135,7,'select3','500以上',9),(136,8,'select1','供应',1),(137,8,'select1','求购',2),(139,8,'select2','运动器材',2),(140,8,'select2','图书/音响',3),(141,8,'select2','器材',4),(142,8,'select2','其它',5),(144,8,'select3','300以下',2),(145,8,'select3','300—500',3),(146,8,'select3','500—800',4),(147,8,'select3','800—1200',5),(148,8,'select3','1200—1600',6),(149,8,'select3','1600以上',6),(150,9,'select1','供应',1),(151,9,'select1','求购',2),(153,9,'select2','Gateway/捷威',2),(154,9,'select2','QHTF/清华同方',3),(155,9,'select2','Toshiba/东芝',4),(156,9,'select2','ASUS/华硕',5),(157,9,'select2','Dell/戴尔',6),(158,9,'select2','Lenovo/联想',7),(159,9,'select2','Acer/宏碁',8),(160,9,'select2','SAMSUNG/三星',9),(161,9,'select2','Apple/苹果',10),(162,9,'select2','HP/惠普',11),(163,9,'select2','联想ThinkPad/IBMA',12),(164,9,'select2','Fujitsu/富士通',13),(165,9,'select2','山寨/高仿',14),(166,9,'select2','Haier/海尔',15),(167,9,'select2','BENQ/明基',16),(168,9,'select2','日立',17),(169,9,'select2','NEC',18),(170,9,'select2','HASEE/神舟',19),(171,9,'select2','方正',20),(172,9,'select2','其它',21),(174,9,'select3','500以下',2),(175,9,'select3','500—800',3),(176,9,'select3','800—1200',4),(177,9,'select3','1200—1600',5),(178,9,'select3','1600—2000',6),(179,9,'select3','2000—3000',7),(180,9,'select3','3000以上',8),(181,10,'select1','供应',1),(182,10,'select1','求购',2),(184,10,'select2','桌子/椅子/凳子',2),(185,10,'select2','床/床垫',3),(186,10,'select2','沙发/茶几',4),(187,10,'select2','架子',5),(188,10,'select2','柜橱',6),(189,10,'select2','其它',7),(191,10,'select3','100以下',2),(192,10,'select3','100—200',3),(193,10,'select3','200—400',4),(194,10,'select3','400—600',5),(195,10,'select3','600—800',6),(196,10,'select3','800—1200',7),(197,10,'select3','1200以上',8),(198,11,'select1','供应',1),(199,11,'select1','求购',2),(200,11,'select2','移动',2),(201,11,'select2','联通',3),(202,11,'select2','电信',4),(203,11,'select2','小灵通/固话',5),(204,11,'select2','QQ/微信',6),(206,11,'select2','流量卡',7),(207,11,'select2','游戏帐号',8),(208,11,'select2','其它',9),(210,11,'select3','20以下',2),(211,11,'select3','20—50',3),(212,11,'select3','50—100',4),(213,11,'select3','100—200',5),(214,11,'select3','200—500',6),(215,11,'select3','500以上',7),(216,12,'select1','供应',1),(217,12,'select1','求购',2),(219,12,'select2','婴孩服饰',2),(220,12,'select2','食品/奶粉',3),(221,12,'select2','玩具',4),(222,12,'select2','母婴用品',5),(223,12,'select2','婴儿床',6),(224,12,'select2','婴儿车',7),(225,12,'select2','其它',8),(227,12,'select3','50以下',2),(228,12,'select3','50—100',3),(229,12,'select3','100—200',4),(230,12,'select3','200—300',5),(231,12,'select3','300—500',6),(232,12,'select3','500以上',7),(233,13,'select1','供应',1),(234,13,'select1','求购',2),(236,13,'select2','十字绣',2),(237,13,'select2','珠宝/玉器/名石',3),(238,13,'select2','书画',4),(239,13,'select2','钱币/邮票/票证',5),(240,13,'select2','古玩',6),(241,13,'select2','钟表',7),(242,13,'select2','瓷器',8),(243,13,'select2','其它',9),(245,13,'select3','300以下',2),(246,13,'select3','300—500',3),(247,13,'select3','500—1000',4),(248,13,'select3','1000—2000',5),(249,13,'select3','2000—4000',6),(250,13,'select3','4000—8000',7),(251,13,'select3','8000—12000',8),(252,13,'select3','12000—20000',9),(253,13,'select3','20000以上',10),(254,14,'select1','供应',1),(255,14,'select1','求购',2),(257,14,'select2','Gateway/捷威',2),(258,14,'select2','QHTF/清华同方',3),(259,14,'select2','Toshiba/东芝',4),(260,14,'select2','ASUS/华硕',5),(261,14,'select2','Dell/戴尔',6),(262,14,'select2','Lenovo/联想',7),(263,14,'select2','Acer/宏碁',8),(264,14,'select2','SAMSUNG/三星',9),(265,14,'select2','Apple/苹果',10),(266,14,'select2','HP/惠普',11),(267,14,'select2','联想ThinkPad/IBMA',12),(268,14,'select2','Fujitsu/富士通',13),(269,14,'select2','山寨/高仿',14),(270,14,'select2','Haier/海尔',15),(271,14,'select2','BENQ/明基',16),(272,14,'select2','日立',17),(273,14,'select2','NEC',18),(274,14,'select2','HASEE/神舟',19),(275,14,'select2','方正',20),(276,14,'select2','其它',21),(278,14,'select3','300以下',2),(279,14,'select3','300—500',3),(280,14,'select3','500—1000',4),(281,14,'select3','1000—2000',5),(282,14,'select3','2000—3000',6),(283,14,'select3','3000—5000',7),(284,14,'select3','5000以上',8),(285,15,'select1','供应',1),(286,15,'select1','求购',2),(288,15,'select2','苗木/种子',2),(289,15,'select2','茶叶/饮品',3),(290,15,'select2','肉蛋禽/生鲜',4),(291,15,'select2','休闲/保健食品',5),(292,15,'select2','粮油/蔬果',6),(293,15,'select2','其它',7),(295,15,'select3','20以下',2),(296,15,'select3','20—50',3),(297,15,'select3','50—200',4),(298,15,'select3','200—500',5),(299,15,'select3','500以上',6),(300,16,'select1','供应',1),(301,16,'select1','强哥',2),(303,16,'select2','机械设备',2),(304,16,'select2','工程车械',3),(305,16,'select2','物品租赁',4),(306,16,'select2','灯光影响',5),(307,16,'select2','场地租赁',6),(308,16,'select2','服装租赁',7),(309,16,'select2','办公用品租赁',8),(310,16,'select2','家具租赁',9),(311,16,'select2','汽车租赁',10),(312,16,'select2','脚手架租赁',11),(313,16,'select2','其它',12),(315,16,'select3','200以下',2),(316,16,'select3','200—500',3),(317,16,'select3','500—1000',4),(318,16,'select3','1000—2000',5),(319,16,'select3','2000—5000',6),(320,16,'select3','5000以上',7),(321,17,'select1','供应',1),(322,17,'select1','求购',2),(324,17,'select2','纽曼',2),(325,17,'select2','摩托罗拉',3),(326,17,'select2','ThinkPad',4),(327,17,'select2','索尼',5),(328,17,'select2','戴尔',6),(329,17,'select2','华硕',7),(330,17,'select2','宏碁',8),(331,17,'select2','汉王',9),(332,17,'select2','爱可视',10),(333,17,'select2','e途',11),(334,17,'select2','HTC',12),(335,17,'select2','KindleFire',13),(336,17,'select2','山寨/高仿',14),(337,17,'select2','华为',15),(338,17,'select2','三星',16),(339,17,'select2','优派',17),(340,17,'select2','Google',18),(341,17,'select2','iPad',19),(342,17,'select2','联想',20),(343,17,'select2','其它',21),(345,17,'select3','200以下',2),(346,17,'select3','200—500',3),(347,17,'select3','500—800',4),(348,17,'select3','800—1200',5),(349,17,'select3','1200—1800',6),(350,17,'select3','1800—2500',7),(351,17,'select3','2500以上',8),(352,18,'select1','供应',1),(353,18,'select1','求购',2),(355,18,'select2','械仪器仪表',2),(356,18,'select2','印刷/塑料机',3),(357,18,'select2','发电/化工设备',4),(358,18,'select2','纺织/农业/木工',5),(359,18,'select2','食品机械',6),(360,18,'select2','工程机械机床',7),(361,18,'select2','其它',8),(363,18,'select3','300以下',2),(364,18,'select3','300—600',3),(365,18,'select3','600—1000',4),(366,18,'select3','1000—1800',5),(367,18,'select3','1800—3000',6),(368,18,'select3','3000以上',7),(369,19,'select1','供应',1),(370,19,'select1','求购',2),(372,19,'select2','50以下',2),(373,19,'select2','50—200',3),(374,19,'select2','200—500',4),(375,19,'select2','500—1000',5),(376,19,'select2','1000以上',6),(378,20,'select2','礼品回收',2),(379,20,'select2','卡券回收',3),(380,20,'select2','办公耗材回收',4),(381,20,'select2','数码产品回收',5),(382,20,'select2','设备机械回收',6),(383,20,'select2','家具回收',7),(384,20,'select2','黄金回收',8),(385,20,'select2','家电回收',9),(386,20,'select2','电脑回收',10),(387,20,'select2','废旧物品回收',11),(389,21,'select1','2万以下',2),(390,21,'select1','2万—5万',3),(391,21,'select1','5万—8万',4),(392,21,'select1','8万—12万',5),(393,21,'select1','12万—18万',6),(394,21,'select1','18万—25万',7),(395,21,'select1','25万以上',8),(397,21,'select2','跑车',2),(398,21,'select2','MPV/商务车',3),(399,21,'select2','豪华车',4),(400,21,'select2','中型车',5),(401,21,'select2','SUV/越野车',6),(402,21,'select2','小型车',7),(404,21,'select2','其它',8),(406,21,'select3','东风',2),(407,21,'select3','奔驰',3),(408,21,'select3','标致',4),(409,21,'select3','福田',5),(410,21,'select3','马自达',6),(411,21,'select3','比亚迪',7),(412,21,'select3','瑞麒',8),(413,21,'select3','长安',9),(414,21,'select3','起亚',10),(415,21,'select3','福特',11),(416,21,'select3','宝马',12),(417,21,'select3','奥迪',13),(418,21,'select3','丰田',14),(419,21,'select3','雪佛兰',15),(420,21,'select3','日产',16),(421,21,'select3','江淮',17),(422,21,'select3','本田',18),(423,21,'select3','别克',19),(424,21,'select3','现代',20),(425,21,'select3','大众',21),(426,21,'select3','奇瑞',22),(427,21,'select3','长城   ',23),(428,21,'select3',' 雪铁龙   ',24),(429,21,'select3','中华  ',25),(430,21,'select3',' 荣威  ',26),(431,21,'select3',' 铃木 ',27),(432,21,'select3',' MG ',42),(433,21,'select3',' 开瑞   ',43),(434,21,'select3','一汽   ',44),(435,21,'select3','沃尔沃   ',45),(436,21,'select3','金杯',46),(437,21,'select3','三菱',47),(438,21,'select3','莲花   ',48),(439,21,'select3','凯迪拉克    ',49),(440,21,'select3','海马   ',50),(441,21,'select3','哈飞   ',51),(442,21,'select3','长丰     ',52),(443,21,'select3','东南    ',41),(444,21,'select3','吉利    ',40),(445,21,'select3','斯柯达    ',39),(446,21,'select3','夏利    ',28),(447,21,'select3','昌河   ',29),(448,21,'select3','双环   ',30),(449,21,'select3','双龙   ',31),(450,21,'select3','西安奥拓   ',32),(451,21,'select3','斯巴鲁    ',33),(452,21,'select3','萨博    ',34),(453,21,'select3','中兴   ',35),(454,21,'select3','宝骏    ',36),(455,21,'select3','众泰   ',37),(456,21,'select3','MINI(迷你)   ',38),(457,21,'select3','解放    ',53),(458,21,'select3','保时捷    ',54),(459,21,'select3','北汽制造    ',55),(460,21,'select3','宾利    ',56),(461,21,'select3','奔腾   ',57),(462,21,'select3','英菲尼迪         ',58),(463,21,'select3','吉利英伦   ',59),(464,21,'select3','新凯   ',60),(465,21,'select3','东风风神     ',61),(466,21,'select3','江铃   ',62),(467,21,'select3','东风风行    ',63),(468,21,'select3','捷豹    ',64),(469,21,'select3','菲亚特   ',65),(470,21,'select3','克莱斯勒    ',66),(471,21,'select3','吉普   ',67),(472,21,'select3','吉奥  ',68),(473,21,'select3','红旗    ',69),(474,21,'select3','华普    ',70),(475,21,'select3','华泰   ',71),(476,21,'select3','黄海   ',72),(477,21,'select3','雷克萨斯    ',73),(478,21,'select3','雷诺    ',74),(479,21,'select3','欧宝   ',75),(480,21,'select3','吉利帝豪   ',76),(481,21,'select3','道奇   ',77),(482,21,'select3','大迪    ',78),(483,21,'select3','讴歌    ',79),(484,21,'select3','路虎    ',80),(485,21,'select3','力帆     ',81),(486,21,'select3','林肯    ',82),(487,21,'select3','法拉利    ',83),(488,21,'select3','陆风川汽  ',84),(489,21,'select3',' 野马   ',85),(490,21,'select3','玛莎拉蒂',86),(491,21,'select3','兰博基尼',87),(492,21,'select3','其他',88),(494,22,'select1','2万以下',2),(495,22,'select1','2万—4万',3),(496,22,'select1','4万—8万',4),(497,22,'select1','8万—12万',5),(498,22,'select1','12万—18万',6),(499,22,'select1','18万—25万',7),(500,22,'select1','25万—50万',8),(501,22,'select1','50万以上',9),(503,22,'select2','小型车',2),(504,22,'select2','中型车',3),(505,22,'select2','SUV/越野车',4),(506,22,'select2','豪华车',5),(507,22,'select2','MPV/商务车',6),(508,22,'select2','跑车',7),(509,22,'select2','其它',8),(511,22,'select3','奇瑞   ',46),(512,22,'select3','大众   ',55),(513,22,'select3','现代   ',56),(514,22,'select3','别克   ',58),(515,22,'select3','本田   ',59),(516,22,'select3','江淮   ',60),(517,22,'select3','日产   ',61),(518,22,'select3','雪佛兰   ',64),(519,22,'select3','丰田   ',54),(520,22,'select3','奥迪   ',66),(521,22,'select3','宝马   ',65),(522,22,'select3','福特  ',62),(523,22,'select3','起亚  ',47),(524,22,'select3','长安   ',48),(525,22,'select3','瑞麒   ',49),(526,22,'select3','比亚迪    ',50),(527,22,'select3','马自达   ',51),(528,22,'select3','福田    ',52),(529,22,'select3','标致    ',53),(530,22,'select3','奔驰   ',67),(531,22,'select3','东风   ',79),(532,22,'select3','长城   ',72),(533,22,'select3','雪铁龙   ',80),(534,22,'select3','中华  ',81),(535,22,'select3','荣威  ',82),(536,22,'select3','铃木  ',83),(537,22,'select3','MG  ',57),(538,22,'select3','开瑞   ',84),(539,22,'select3','一汽   ',85),(540,22,'select3','沃尔沃   ',86),(541,22,'select3','金杯   ',87),(542,22,'select3','三菱   ',78),(543,22,'select3','莲花   ',77),(544,22,'select3','凯迪拉克   ',68),(545,22,'select3',' 海马  ',63),(546,22,'select3',' 哈飞   ',70),(547,22,'select3','长丰     ',71),(548,22,'select3','东南    ',73),(549,22,'select3','吉利    ',74),(550,22,'select3','斯柯达    ',75),(551,22,'select3','夏利    ',69),(552,22,'select3','昌河  ',44),(553,22,'select3',' 双环   ',76),(554,22,'select3','双龙   ',45),(555,22,'select3','西安奥拓   ',13),(556,22,'select3','斯巴鲁   ',14),(557,22,'select3',' 萨博    ',15),(558,22,'select3','中兴   ',16),(559,22,'select3','宝骏    ',17),(560,22,'select3','众泰   ',18),(561,22,'select3','MINI(迷你)   ',19),(562,22,'select3','解放    ',20),(563,22,'select3','保时捷    ',21),(564,22,'select3','北汽制造    ',12),(565,22,'select3','宾利    ',11),(566,22,'select3','奔腾   ',2),(567,22,'select3','英菲尼迪         ',3),(568,22,'select3','吉利英伦   ',4),(569,22,'select3','新凯   ',5),(570,22,'select3','东风风神     ',6),(571,22,'select3','江铃   ',7),(572,22,'select3','东风风行    ',8),(573,22,'select3','捷豹    ',9),(574,22,'select3','菲亚特   ',10),(575,22,'select3','克莱斯勒    ',22),(576,22,'select3','吉普   ',23),(577,22,'select3','吉奥  ',24),(578,22,'select3','红旗    ',36),(579,22,'select3','华普    ',37),(580,22,'select3','华泰   ',38),(581,22,'select3','黄海   ',39),(582,22,'select3','雷克萨斯    ',40),(583,22,'select3','雷诺    ',41),(584,22,'select3','欧宝   ',42),(585,22,'select3','吉利帝豪   ',43),(586,22,'select3','道奇   ',35),(587,22,'select3','大迪    ',34),(588,22,'select3','讴歌    ',33),(589,22,'select3','路虎    ',25),(590,22,'select3','力帆     ',26),(591,22,'select3','林肯    ',27),(592,22,'select3','法拉利   ',28),(593,22,'select3',' 陆风川汽   ',29),(594,22,'select3','野马   ',30),(595,22,'select3','玛莎拉蒂',31),(596,22,'select3','拉博基尼',32),(597,22,'select3','其它',88),(599,23,'select1','2万以下',2),(600,23,'select1','2万—5万',3),(601,23,'select1','5万—10万',4),(602,23,'select1','10万—20万',5),(603,23,'select1','20万—30万',6),(604,23,'select1','30万以上',7),(607,23,'select2','小型车   ',2),(608,23,'select2','SUV/越野车      ',3),(609,23,'select2','中型车      ',4),(610,23,'select2','豪华车    ',5),(611,23,'select2','MPV/商务车     ',6),(612,23,'select2','跑车    ',7),(613,23,'select2','其他',8),(614,23,'select3','奇瑞    ',2),(615,23,'select3','大众   ',3),(616,23,'select3','现代   ',4),(617,23,'select3','别克   ',5),(618,23,'select3','本田   ',6),(619,23,'select3','江淮   ',7),(620,23,'select3','日产   ',8),(621,23,'select3','雪佛兰   ',9),(622,23,'select3','丰田   ',10),(623,23,'select3','奥迪   ',11),(624,23,'select3','宝马   ',12),(625,23,'select3','福特  ',13),(626,23,'select3','起亚  ',14),(627,23,'select3','长安   ',15),(628,23,'select3','瑞麒   ',16),(629,23,'select3','比亚迪    ',17),(630,23,'select3','马自达   ',18),(631,23,'select3','福田    ',19),(632,23,'select3','标致    ',20),(633,23,'select3','奔驰   ',21),(634,23,'select3','东风   ',22),(635,23,'select3','长城   ',23),(636,23,'select3','雪铁龙   ',24),(637,23,'select3','中华  ',25),(638,23,'select3','荣威  ',26),(639,23,'select3','铃木  ',27),(640,23,'select3','MG  ',28),(641,23,'select3','开瑞   ',29),(642,23,'select3','一汽   ',30),(643,23,'select3','沃尔沃   ',31),(644,23,'select3','金杯   ',32),(645,23,'select3','三菱   ',33),(646,23,'select3','莲花   ',34),(647,23,'select3','凯迪拉克    ',35),(648,23,'select3','海马   ',36),(649,23,'select3','哈飞   ',37),(650,23,'select3','长丰     ',38),(651,23,'select3','东南    ',39),(652,23,'select3','吉利    ',40),(653,23,'select3','斯柯达    ',41),(654,23,'select3','夏利    ',42),(655,23,'select3','昌河   ',43),(656,23,'select3','双环   ',44),(657,23,'select3','双龙   ',45),(658,23,'select3','西安奥拓   ',46),(659,23,'select3','斯巴鲁    ',47),(660,23,'select3','萨博    ',48),(661,23,'select3','中兴   ',49),(662,23,'select3','宝骏    ',50),(663,23,'select3','众泰   ',51),(664,23,'select3','MINI(迷你)   ',52),(665,23,'select3','解放    ',53),(666,23,'select3','保时捷    ',54),(667,23,'select3','北汽制造    ',55),(668,23,'select3','宾利    ',56),(669,23,'select3','奔腾   ',57),(670,23,'select3','英菲尼迪         ',58),(671,23,'select3','吉利英伦   ',59),(672,23,'select3','新凯   ',60),(673,23,'select3','东风风神     ',61),(674,23,'select3','江铃   ',62),(675,23,'select3','东风风行    ',63),(676,23,'select3','捷豹    ',64),(677,23,'select3','菲亚特   ',65),(678,23,'select3','克莱斯勒    ',66),(679,23,'select3','吉普   ',67),(680,23,'select3','吉奥  ',68),(681,23,'select3','红旗    ',69),(682,23,'select3','华普    ',70),(683,23,'select3','华泰   ',71),(684,23,'select3','黄海   ',72),(685,23,'select3','雷克萨斯    ',73),(686,23,'select3','雷诺    ',74),(687,23,'select3','欧宝   ',75),(688,23,'select3','吉利帝豪   ',76),(689,23,'select3','道奇   ',77),(690,23,'select3','大迪    ',78),(691,23,'select3','讴歌    ',79),(692,23,'select3','路虎    ',80),(693,23,'select3','力帆     ',81),(694,23,'select3','林肯    ',82),(695,23,'select3','法拉利    ',83),(696,23,'select3','陆风川汽   ',84),(697,23,'select3','野马   ',85),(698,23,'select3','玛莎拉蒂',86),(699,23,'select3','兰博基尼',87),(700,23,'select3','其他',88),(702,24,'select1','电动摩托车',2),(703,24,'select1','电动自行车',3),(704,24,'select1','电动三轮车',4),(705,24,'select1','其它',5),(707,24,'select2','爱玛',2),(708,24,'select2','新日',3),(709,24,'select2','绿源',4),(710,24,'select2','立马',5),(711,24,'select2','雅迪',6),(712,24,'select2','小刀',7),(713,24,'select2','其它',8),(715,24,'select3','300元以下',2),(716,24,'select3','300元—600元',3),(717,24,'select3','600元—1000元',4),(718,24,'select3','1000元—1500元',5),(719,24,'select3','1500元—2000元',6),(720,24,'select3','2000元以上',7),(722,25,'select1','山地车 ',2),(723,25,'select1','死飞    ',3),(724,25,'select1','普通车    ',4),(725,25,'select1','公路车    ',5),(726,25,'select1','折叠车    ',6),(727,25,'select1','休闲车    ',7),(728,25,'select1','三轮车    ',8),(729,25,'select1','折叠童车',9),(730,25,'select1','其他',10),(732,25,'select2','捷安特   ',2),(733,25,'select2','美利达   ',3),(734,25,'select2','凤凰   ',4),(735,25,'select2','永久   ',5),(736,25,'select2','富士达    ',6),(737,25,'select2','喜德盛    ',7),(738,25,'select2','捷马   ',8),(739,25,'select2','飞鸽    ',9),(740,25,'select2','飞跃   ',10),(741,25,'select2','英克莱  ',11),(742,25,'select2','其他',12),(744,25,'select3','100元以下',2),(745,25,'select3','100元—200元',3),(746,25,'select3','200元—500元',4),(747,25,'select3','500元—1000元',5),(748,25,'select3','1000以上',6),(750,26,'select1','自卸车   ',2),(751,26,'select1','厢式货车    ',3),(752,26,'select1','平板车    ',4),(753,26,'select1','半挂车    ',5),(754,26,'select1','油罐车    ',6),(755,26,'select1','水泥罐车   ',7),(756,26,'select1','牵引车  ',8),(757,26,'select1','随车吊   ',9),(758,26,'select1','其他',10),(760,26,'select2','瑞沃奥威   ',2),(761,26,'select2','欧曼   ',3),(762,26,'select2','解放    ',4),(763,26,'select2','江淮   ',5),(764,26,'select2','时代金刚   ',6),(765,26,'select2','东风天龙   ',7),(766,26,'select2','高栏   ',8),(767,26,'select2','东风   ',9),(768,26,'select2','福田   ',10),(769,26,'select2','陕汽德龙       ',11),(770,26,'select2','斯太尔   ',12),(771,26,'select2','豪沃      ',13),(772,26,'select2','红岩    ',14),(773,26,'select2','陕汽奥龙   ',15),(774,26,'select2','康明斯   ',16),(775,26,'select2','悍威   ',17),(776,26,'select2','新大威    ',18),(777,26,'select2','解放赛龙    ',19),(778,26,'select2','跃进   ',20),(779,26,'select2','威铃    ',21),(780,26,'select2','凯马   ',22),(781,26,'select2','中国重汽    ',23),(782,26,'select2','江铃   ',24),(783,26,'select2','中国重汽豪运   ',25),(784,26,'select2','其他',26),(786,26,'select3','5万以下',2),(787,26,'select3','5万—8万',3),(788,26,'select3','8万—12万',4),(789,26,'select3','12万—18万',5),(790,26,'select3','18万—25万',6),(791,26,'select3','25万以上',7),(793,27,'select1','踏板',2),(794,27,'select1','轻骑',3),(795,27,'select1','跑车',4),(796,27,'select1','越野',5),(797,27,'select1','其它',6),(799,27,'select2','建设    ',2),(800,27,'select2','雅马哈    ',3),(801,27,'select2','本田   ',4),(802,27,'select2','铃木  ',5),(803,27,'select2','轻骑   ',6),(804,27,'select2','豪爵   ',7),(805,27,'select2','钱江   ',8),(806,27,'select2','光阳   ',9),(807,27,'select2','宗申  ',10),(808,27,'select2','金城   ',11),(809,27,'select2','隆鑫   ',12),(810,27,'select2','踏板   ',13),(811,27,'select2','巧格   ',14),(812,27,'select2','力帆   ',15),(813,27,'select2','迅鹰   ',16),(814,27,'select2','三阳   ',17),(815,27,'select2','川崎   ',18),(816,27,'select2','新大洲    ',19),(817,27,'select2','林海   ',20),(818,27,'select2','凌鹰   ',21),(819,27,'select2','哈雷   ',22),(820,27,'select2','春风   ',23),(821,27,'select2','飞鹰   ',24),(822,27,'select2','街车   ',25),(823,27,'select2','劲隆       ',26),(824,27,'select2','小帅哥    ',27),(825,27,'select2','呈捷    ',28),(826,27,'select2','大地鹰王    ',29),(827,27,'select2','钻豹   ',30),(828,27,'select2','龟王   ',31),(829,27,'select2','天剑   ',32),(830,27,'select2','越野    ',33),(831,27,'select2','大阳    ',34),(832,27,'select2','祖玛   ',35),(833,27,'select2','重庆大运         ',36),(834,27,'select2','马杰斯特   ',37),(835,27,'select2','公主   ',38),(836,27,'select2','大帅哥   ',39),(837,27,'select2','太子   ',40),(838,27,'select2','高赛   ',41),(839,27,'select2','南方   ',42),(840,27,'select2','铁马   ',43),(841,27,'select2','猎鹰   ',44),(842,27,'select2','五羊   ',45),(843,27,'select2','邦德   ',46),(844,27,'select2','巡洋舰   ',47),(845,27,'select2','福喜  ',48),(846,27,'select2','小未战    ',49),(847,27,'select2','大未战   ',50),(848,27,'select2','海王星    ',51),(849,27,'select2','幸福   ',52),(850,27,'select2','大绵羊    ',53),(851,27,'select2','长江   ',54),(852,27,'select2','其他',55),(854,27,'select3','500元以下',2),(855,27,'select3','500元—1000元',3),(856,27,'select3','1000元—2000元',4),(857,27,'select3','2000元—3000元',5),(858,27,'select3','3000元以上',6),(861,28,'select1','没车',2),(862,28,'select1','有车',3),(863,28,'select2','长途拼车',2),(864,28,'select2','上下班拼车',3),(865,28,'select2','上下学拼车',4),(866,28,'select2','其它拼车',5),(867,29,'select1','供应',1),(868,29,'select1','求购',2),(870,29,'select2','配件   ',2),(871,29,'select2','影音电器    ',3),(872,29,'select2','清洁保养   ',4),(873,29,'select2','GPS   ',5),(874,29,'select2','外饰    ',6),(875,29,'select2','内饰',7),(876,29,'select2','坐垫/脚垫   ',8),(877,29,'select2',' 轮胎/轮毂    ',9),(878,29,'select2','其他',10),(880,29,'select3','50元以下',2),(881,29,'select3','50元—150元',3),(882,29,'select3','150元—300元',4),(883,29,'select3','300元—500元',5),(884,29,'select3','500元—1000元',6),(885,29,'select3','1000元以上',7),(887,30,'select1','吉利   ',2),(888,30,'select1','比亚迪    ',3),(889,30,'select1','吉利帝豪    ',4),(890,30,'select1','奇瑞    ',5),(891,30,'select1','大众    ',6),(892,30,'select1','荣威    ',7),(893,30,'select1','MG   ',8),(894,30,'select1','东风   ',9),(895,30,'select1','东风风神    ',10),(896,30,'select1','别克        ',11),(897,30,'select1','起亚     ',12),(898,30,'select1','宝马    ',13),(899,30,'select1','福特    ',14),(900,30,'select1','现代    ',15),(901,30,'select1','铃木    ',16),(902,30,'select1','本田    ',17),(903,30,'select1','雪佛兰    ',18),(904,30,'select1','奥迪   ',19),(905,30,'select1','江铃   ',20),(906,30,'select1','沃尔沃    ',21),(907,30,'select1','解放    ',22),(908,30,'select1','开瑞   ',23),(909,30,'select1','奔驰    ',24),(910,30,'select1','雪铁龙    ',25),(911,30,'select1','道奇   ',26),(912,30,'select1','江淮    ',27),(913,30,'select1','捷豹    ',28),(914,30,'select1','北汽制造     ',29),(915,30,'select1','一汽    ',30),(916,30,'select1','标致    ',31),(917,30,'select1','莲花   ',32),(918,30,'select1','东风风行   ',33),(919,30,'select1','瑞麒   ',34),(920,30,'select1','三菱    ',35),(921,30,'select1','斯巴鲁   ',36),(922,30,'select1','奔腾    ',37),(923,30,'select1','日产   ',38),(924,30,'select1','斯柯达    ',39),(925,30,'select1','萨博    ',40),(926,30,'select1','双环    ',41),(927,30,'select1','西安奥拓    ',42),(928,30,'select1','双龙    ',43),(929,30,'select1','保时捷  ',44),(930,30,'select1','中兴   ',45),(931,30,'select1','中华    ',46),(932,30,'select1','众泰    ',47),(933,30,'select1','宝骏   ',48),(934,30,'select1','MINI(迷你)   ',49),(935,30,'select1','长丰    ',50),(936,30,'select1','长城   ',51),(937,30,'select1','新凯   ',52),(938,30,'select1','英菲尼迪  ',53),(939,30,'select1','吉利英伦   ',54),(940,30,'select1','长安  ',55),(941,30,'select1','夏利   ',56),(942,30,'select1','马自达   ',57),(943,30,'select1','华泰    ',58),(944,30,'select1','华普   ',59),(945,30,'select1','黄海  ',60),(946,30,'select1','吉奥   ',61),(947,30,'select1','大迪    ',62),(948,30,'select1','吉普    ',63),(949,30,'select1','红旗   ',64),(950,30,'select1','海马   ',65),(951,30,'select1','丰田     ',66),(952,30,'select1','菲亚特  ',67),(953,30,'select1','东南   ',68),(954,30,'select1','福田   ',69),(955,30,'select1','哈飞    ',70),(956,30,'select1','金杯   ',71),(957,30,'select1','川汽野马   ',72),(958,30,'select1','路虎   ',73),(959,30,'select1','陆风   ',74),(960,30,'select1','法拉利    ',75),(961,30,'select1','讴歌    ',76),(962,30,'select1','欧宝    ',77),(963,30,'select1','昌河    ',78),(964,30,'select1','林肯',79),(965,30,'select1','克莱斯勒   ',80),(966,30,'select1','凯迪拉克    ',81),(967,30,'select1','雷克萨斯   ',82),(968,30,'select1','雷诺   ',83),(969,30,'select1','力帆   ',84),(970,30,'select1','宾利   ',85),(971,30,'select1','玛莎拉蒂',86),(972,30,'select1','兰博基尼',87),(973,30,'select1','其他',88),(975,30,'select2','10万以下',2),(976,30,'select2','10万—20万',3),(977,30,'select2','20万—30万',4),(978,30,'select2','30万—50万',5),(979,30,'select2','50万—100万',6),(980,30,'select2','100万以上',7),(982,31,'select1','汽车保养',2),(983,31,'select1','汽车美容',3),(984,31,'select1','汽车改装',4),(985,31,'select1','汽车检修',5),(986,31,'select1','洗车',6),(987,31,'select1','其它',7),(989,32,'select1','装载机',2),(990,32,'select1','叉车',3),(991,32,'select1','挖掘机',4),(992,32,'select1','吊车',5),(993,32,'select1','搅拌车',6),(994,32,'select1','推土机',7),(995,32,'select1','压路机',8),(996,32,'select1','随车吊',9),(997,32,'select1','其他',10),(999,32,'select2','龙工',2),(1000,32,'select2','柳工',3),(1001,32,'select2','小松',4),(1002,32,'select2','临工',5),(1003,32,'select2','徐工',6),(1004,32,'select2','玉柴',7),(1005,32,'select2','豪沃',8),(1006,32,'select2','日立',9),(1007,32,'select2','山推',10),(1008,32,'select2','现代',11),(1009,32,'select2','山河智能',12),(1010,32,'select2','尼桑',13),(1011,32,'select2','东方红',14),(1012,32,'select2','卡特',15),(1013,32,'select2','长江',16),(1014,32,'select2','宣化',17),(1015,32,'select2','三一重工',18),(1016,32,'select2','其他',19),(1018,32,'select3','2万以下',2),(1019,32,'select3','2万—5万',3),(1020,32,'select3','5万—8万',4),(1021,32,'select3','8万—12万',5),(1022,32,'select3','12万—18万',6),(1023,32,'select3','18万—25万',7),(1024,32,'select3','25万以上',8),(1026,33,'select1','过户上牌',2),(1027,33,'select1','年检验车',3),(1028,33,'select1','车辆保险',4),(1030,34,'select1','面包车',2),(1031,34,'select1','小巴车',3),(1032,34,'select1','中巴车',4),(1033,34,'select1','大客车',5),(1035,34,'select2','五菱',2),(1036,34,'select2','长安',3),(1037,34,'select2','东风小康',4),(1038,34,'select2','江淮',5),(1039,34,'select2','开瑞',6),(1040,34,'select2','哈飞',7),(1041,34,'select2','金杯',8),(1042,34,'select2','金龙',9),(1043,34,'select2','东南',10),(1044,34,'select2','依维柯',11),(1045,34,'select2','佳宝',12),(1046,34,'select2','昌河',13),(1047,34,'select2','松花江',14),(1048,34,'select2','宇通',15),(1049,34,'select2','福田',16),(1050,34,'select2','少林',17),(1051,34,'select2','全顺',18),(1052,34,'select2','丰田',19),(1053,34,'select2','江铃',20),(1054,34,'select2','其他',21),(1056,34,'select3','2万以下',2),(1057,34,'select3','2万—3万',3),(1058,34,'select3','3万—5万',4),(1059,34,'select3','5万—8万',5),(1060,34,'select3','8万—12万',6),(1061,34,'select3','12万—20万',7),(1062,34,'select3','20万以上',8),(1064,35,'select1','拖拉机',2),(1065,35,'select1','收割机',3),(1066,35,'select1','旋耕/微耕机',4),(1067,35,'select1','插秧机',5),(1068,35,'select1','抽水机',6),(1069,35,'select1','其他',7),(1072,35,'select2','常林',2),(1073,35,'select2','常发',3),(1074,35,'select2','五征',4),(1075,35,'select2','四方',5),(1076,35,'select2','黄金海马',6),(1077,35,'select2','沭河',7),(1078,35,'select2','约翰迪尔',8),(1079,35,'select2','福田雷沃',9),(1080,35,'select2','东风',10),(1081,35,'select2','纽荷兰',11),(1082,35,'select2','时风',12),(1083,35,'select2','东方红',13),(1084,35,'select2','其他',14),(1085,35,'select3','1万以下',2),(1086,35,'select3','1万—2万',3),(1087,35,'select3','2万—4万',4),(1088,35,'select3','4万—6万',5),(1089,35,'select3','6万—8万',6),(1090,35,'select3','8万以上',7),(1092,36,'select1','小型车',2),(1093,36,'select1','SUV/越野车',3),(1094,36,'select1','中型车',4),(1095,36,'select1','豪华车',5),(1096,36,'select1','MPV/商务车',6),(1097,36,'select1','跑车',7),(1098,36,'select1','面包车',8),(1101,36,'select1','其它',9),(1102,36,'select2','奇瑞   ',2),(1103,36,'select2','大众    ',3),(1104,36,'select2','现代   ',4),(1105,36,'select2','别克   ',5),(1106,36,'select2','本田   ',6),(1107,36,'select2','江淮   ',7),(1108,36,'select2','日产   ',8),(1109,36,'select2','雪佛兰   ',9),(1110,36,'select2','丰田   ',10),(1111,36,'select2','奥迪   ',11),(1112,36,'select2','宝马   ',12),(1113,36,'select2','福特  ',13),(1114,36,'select2','起亚  ',14),(1115,36,'select2','长安   ',15),(1116,36,'select2','瑞麒   ',16),(1117,36,'select2','比亚迪    ',17),(1118,36,'select2','马自达   ',18),(1119,36,'select2','福田    ',19),(1120,36,'select2','标致    ',20),(1121,36,'select2','奔驰   ',21),(1122,36,'select2','东风   ',22),(1123,36,'select2','长城   ',23),(1124,36,'select2','雪铁龙   ',24),(1125,36,'select2','中华  ',25),(1126,36,'select2','荣威  ',26),(1127,36,'select2','铃木  ',27),(1128,36,'select2','MG  ',28),(1129,36,'select2','开瑞   ',29),(1130,36,'select2','一汽   ',30),(1131,36,'select2','沃尔沃   ',31),(1132,36,'select2','金杯   ',32),(1133,36,'select2','三菱   ',33),(1134,36,'select2','莲花   ',34),(1135,36,'select2','凯迪拉克    ',35),(1136,36,'select2','海马   ',36),(1137,36,'select2','哈飞   ',37),(1138,36,'select2','长丰     ',38),(1139,36,'select2','东南    ',39),(1140,36,'select2','吉利    ',40),(1141,36,'select2','斯柯达    ',41),(1142,36,'select2','夏利    ',42),(1143,36,'select2','昌河   ',43),(1144,36,'select2','双环   ',44),(1145,36,'select2','双龙   ',45),(1146,36,'select2','西安奥拓   ',46),(1147,36,'select2','斯巴鲁    ',47),(1148,36,'select2','萨博    ',48),(1149,36,'select2','中兴   ',49),(1150,36,'select2','宝骏    ',50),(1151,36,'select2','众泰   ',51),(1152,36,'select2','MINI(迷你)   ',52),(1153,36,'select2','解放    ',53),(1154,36,'select2','保时捷    ',54),(1155,36,'select2','北汽制造    ',55),(1156,36,'select2','宾利    ',56),(1157,36,'select2','奔腾   ',57),(1158,36,'select2','英菲尼迪         ',58),(1159,36,'select2','吉利英伦   ',59),(1160,36,'select2','新凯   ',60),(1161,36,'select2','东风风神     ',61),(1162,36,'select2','江铃   ',62),(1163,36,'select2','东风风行    ',63),(1164,36,'select2','捷豹    ',64),(1165,36,'select2','菲亚特   ',65),(1166,36,'select2','克莱斯勒    ',66),(1167,36,'select2','吉普   ',67),(1168,36,'select2','吉奥  ',68),(1169,36,'select2','红旗    ',69),(1170,36,'select2','华普    ',70),(1171,36,'select2','华泰   ',71),(1172,36,'select2','黄海   ',72),(1173,36,'select2','雷克萨斯    ',73),(1174,36,'select2','雷诺    ',74),(1175,36,'select2','欧宝   ',75),(1176,36,'select2','吉利帝豪   ',76),(1177,36,'select2','道奇   ',77),(1178,36,'select2','大迪    ',78),(1179,36,'select2','讴歌    ',79),(1180,36,'select2','路虎    ',80),(1181,36,'select2','力帆     ',81),(1182,36,'select2','林肯    ',82),(1183,36,'select2','法拉利    ',83),(1184,36,'select2','陆风川汽   ',84),(1185,36,'select2','野马   ',85),(1186,36,'select2','玛莎拉蒂',86),(1187,36,'select2','兰博基尼',87),(1188,36,'select2','其他',88),(1189,36,'select3','1万以下',2),(1190,36,'select3','1万—2万',3),(1191,36,'select3','2万—4万',4),(1192,36,'select3','4万以上',5),(1194,37,'select1','车辆收购',2),(1195,37,'select1','车辆评估',3),(1199,38,'select1','快递员',2),(1200,38,'select1','送货员',3),(1201,38,'select1','保安',4),(1202,38,'select1','编辑',5),(1203,38,'select1','前台',6),(1204,38,'select1','收银员',7),(1205,38,'select1','店长',8),(1206,38,'select1','摄影/影视',9),(1207,38,'select1','广告/美工/设计',10),(1208,38,'select1','保健按摩',11),(1209,38,'select1','KTV/酒吧',12),(1210,38,'select1','美容美发',13),(1211,38,'select1','网管',14),(1212,38,'select1','翻译',15),(1213,38,'select1','仓管',16),(1214,38,'select1','切配',17),(1215,38,'select1','厨师',18),(1216,38,'select1','司机',19),(1217,38,'select1','文员',20),(1218,38,'select1','人事',21),(1219,38,'select1','客服',22),(1220,38,'select1','服务员',23),(1221,38,'select1','营业员',24),(1222,38,'select1','工人/技工',25),(1223,38,'select1','行政',26),(1224,38,'select1','房产经纪人',27),(1225,38,'select1','助理',28),(1226,38,'select1','教育/培训/咨询',29),(1227,38,'select1','金融/银行/保险',30),(1228,38,'select1','财务/会计/出纳',31),(1229,38,'select1','家政',32),(1230,38,'select1','保洁',33),(1231,38,'select1','销售/业务员',34),(1232,38,'select1','程序工程师',35),(1233,38,'select1','其他',36),(1234,38,'select2','女',2),(1235,38,'select2','男',3),(1236,38,'select3','本科及以上',2),(1237,38,'select3','大专',3),(1238,38,'select3','高中/中专',4),(1239,38,'select3','初中及以下',5),(1241,39,'select1','翻译',2),(1242,39,'select1','演员',3),(1243,39,'select1','客服',4),(1244,39,'select1','充场/座谈会',5),(1245,39,'select1','摄影',6),(1246,39,'select1','网站',7),(1247,39,'select1','会计',8),(1248,39,'select1','模特',9),(1249,39,'select1','礼仪',10),(1250,39,'select1','设计',11),(1251,39,'select1','家教',12),(1252,39,'select1','服务员',13),(1253,39,'select1','场地布置',14),(1254,39,'select1','其他',15),(1256,39,'select2','女',2),(1257,39,'select2','男',3),(1259,40,'select1','旅游',2),(1260,40,'select1','运动',3),(1261,40,'select1','唱歌/泡吧',4),(1262,40,'select1','创业',5),(1263,40,'select1','做公益',6),(1264,40,'select1','逛街',7),(1265,40,'select1','学习',8),(1266,40,'select1','玩桌游',9),(1267,40,'select1','看演出',10),(1268,40,'select1','晨跑',11),(1269,40,'select1','广场活动',12),(1270,40,'select1','其他',13),(1272,40,'select2','女',2),(1273,40,'select2','男',3),(1275,41,'select1','女',2),(1276,41,'select1','男',3),(1278,41,'select2','25岁以下',2),(1279,41,'select2','25岁—30岁',3),(1280,41,'select2','30岁—40岁',4),(1281,41,'select2','40岁—50岁',5),(1282,41,'select2','50岁—60岁',6),(1283,41,'select2','60岁以上',7),(1285,42,'select1','女',2),(1286,42,'select1','男',3),(1288,42,'select2','20岁以下',2),(1289,42,'select2','20岁—25岁',3),(1290,42,'select2','25岁—30岁岁',4),(1291,42,'select2','30岁—40岁',5),(1292,42,'select2','40岁—50岁',6),(1293,42,'select2','50岁以上',7),(1295,44,'select1','魔术',17),(1296,44,'select1','古玩鉴赏',18),(1297,44,'select1','电器维修',19),(1298,44,'select1','唱歌',20),(1299,44,'select1','方言',21),(1300,44,'select1','理财/金融',22),(1301,44,'select1','数理化',23),(1302,44,'select1','武术',24),(1303,44,'select1','电工',25),(1304,44,'select1','象棋/围棋',26),(1305,44,'select1','中医',27),(1306,44,'select1','平面设计',28),(1307,44,'select1','服装设计',29),(1308,44,'select1','会计/财务',16),(1309,44,'select1','乐器',15),(1310,44,'select1','美容/按摩',2),(1311,44,'select1','外语',3),(1312,44,'select1','开车',4),(1313,44,'select1','电脑',5),(1314,44,'select1','体育/打球',6),(1315,44,'select1','跳舞',7),(1316,44,'select1','室内设计',8),(1317,44,'select1','摄影',9),(1318,44,'select1','销售',10),(1319,44,'select1','书法绘画',11),(1320,44,'select1','烹饪',12),(1321,44,'select1','投资/开店',13),(1322,44,'select1','电脑程序',14),(1323,44,'select1','其他',30),(1325,45,'select1','寻人启事',2),(1326,45,'select1','寻物启事',3),(1327,45,'select1','寻宠物启事',4),(1328,45,'select1','老乡',5),(1329,45,'select1','其他',6),(1331,46,'select1','没车',2),(1332,46,'select1','有车',3),(1334,46,'select2','长途拼车',2),(1335,46,'select2','上下班拼车',3),(1336,46,'select2','上下学拼车',4),(1337,46,'select2','其他拼车',5),(1339,47,'select1','整套出租',2),(1340,47,'select1','单间出租',3),(1341,47,'select1','床位出租',4),(1343,47,'select2','500元以下',2),(1344,47,'select2','500元—1000元',3),(1345,47,'select2','1000元—1500元',4),(1346,47,'select2','1500元—2500元',5),(1347,47,'select2','2500元—3500元',6),(1348,47,'select2','3500元以上',7),(1350,47,'select3','4室及以上',2),(1351,47,'select3','3室',3),(1352,47,'select3','2室',4),(1353,47,'select3','1室',5),(1355,48,'select1','整套出租',2),(1356,48,'select1','单间出租',3),(1357,48,'select1','床位出租',4),(1359,48,'select2','500元以下',2),(1360,48,'select2','500元—1000元',3),(1361,48,'select2','1000元—1500元',4),(1362,48,'select2','1500元—2500元',5),(1363,48,'select2','2500元—3500元',6),(1364,48,'select2','3500元以上',7),(1366,48,'select3','4室及以上',2),(1367,48,'select3','3室',3),(1368,48,'select3','2室',4),(1369,48,'select3','1室',5),(1371,49,'select1','限70平米以下',2),(1372,49,'select1','70平米—90平米',3),(1373,49,'select1','90平米—110平米',4),(1374,49,'select1','110平米—150平米',5),(1375,49,'select1','150平米以上',6),(1377,49,'select2','30万以下',2),(1378,49,'select2','30万—40万',3),(1379,49,'select2','40万—50万',4),(1380,49,'select2','50万—70万',5),(1381,49,'select2','70万—90万',6),(1382,49,'select2','90万—120万',7),(1383,49,'select2','120万以上',8),(1385,49,'select3','4室及以上',2),(1386,49,'select3','3室2厅2卫',3),(1387,49,'select3','3室2厅1卫',4),(1388,49,'select3','3室1厅1卫',5),(1389,49,'select3','2室2厅2卫',6),(1390,49,'select3','1室1厅1卫',7),(1391,49,'select3','2室1厅1卫',8),(1392,49,'select3','2室2厅1卫',9),(1393,49,'select3','1室0厅1卫',10),(1394,49,'select3','其它',11),(1396,50,'select1','临街店铺',2),(1397,50,'select1','购物中心',3),(1398,50,'select1','住宅底商摊位/柜台',4),(1399,50,'select1','写字楼底商',5),(1400,50,'select1','其他',6),(1402,50,'select2','50平米以下',2),(1403,50,'select2','50平米—100平米',3),(1404,50,'select2','100平米—150平米',4),(1405,50,'select2','150平米—250平米',5),(1406,50,'select2','250平米以上',6),(1408,50,'select3','30万以下',2),(1409,50,'select3','30万—50万',3),(1410,50,'select3','50万—80万',4),(1411,50,'select3','80万—120万',5),(1412,50,'select3','120万—300万',6),(1413,50,'select3','300万—500万',7),(1414,50,'select3','500万以上',8),(1418,51,'select1','餐饮美食',2),(1419,51,'select1','空铺转让',3),(1420,51,'select1','服饰鞋包',4),(1421,51,'select1','休闲娱乐',5),(1422,51,'select1','美容美发',6),(1423,51,'select1','酒店宾馆',7),(1424,51,'select1','超市零售',8),(1425,51,'select1','生活服务',9),(1426,51,'select1','汽修美容',10),(1427,51,'select1','家居建材',11),(1428,51,'select1','电子通讯',12),(1429,51,'select1','教育培训',13),(1430,51,'select1','专柜转让',14),(1431,51,'select1','医药保健',15),(1432,51,'select1','其它',16),(1433,51,'select2','50平米以下',2),(1434,51,'select2','50平米—80平米',3),(1435,51,'select2','80平米—120平米',4),(1436,51,'select2','120平米—200平米',5),(1437,51,'select2','200平米以上',6),(1438,51,'select3','2000元/月以下',2),(1439,51,'select3','2000元/月—3000元/月',3),(1440,51,'select3','3000元/月—5000元/月',4),(1441,51,'select3','5000元/月—8000元/月',5),(1442,51,'select3','8000元/月—15000元/月',6),(1443,51,'select3','15000元/月以上',7),(1447,53,'select1','纯写字楼',2),(1448,53,'select1','商务中心',3),(1449,53,'select1','商住楼',4),(1450,53,'select1','园区办公',5),(1451,53,'select1','其他',6),(1452,53,'select2','50平米以下',2),(1453,53,'select2','50平米—100平米',3),(1454,53,'select2','100平米—150平米',4),(1455,53,'select2','150平米—200平米',5),(1456,53,'select2','200平米—300平米',6),(1457,53,'select2','300平米以上',7),(1458,53,'select3','50元/平米/天以下',2),(1459,53,'select3','50—100元/平米/天',3),(1460,53,'select3','100—200元/平米/天',4),(1461,53,'select3','200—400元/平米/天',5),(1462,53,'select3','400以上元/平米/天',6),(1466,54,'select1','家庭旅馆',2),(1467,54,'select1','宾馆酒店',3),(1468,54,'select1','高档公寓',4),(1469,54,'select1','其他',5),(1470,54,'select2','床位',2),(1471,54,'select2','单间',3),(1472,54,'select2','整套',4),(1473,54,'select3','20元/天以下',2),(1474,54,'select3','20元/天—50元/天',3),(1475,54,'select3','50元/天—100元/天',4),(1476,54,'select3','100元/天—200元/天',5),(1477,54,'select3','200元/天—400元/天',6),(1478,54,'select3','400元/天以上',7),(1480,55,'select1','50平米以下',2),(1481,55,'select1','50平米—150平米',3),(1482,55,'select1','150平米—300平米',4),(1483,55,'select1','300平米—500平米',5),(1484,55,'select1','500平米—1000平米',6),(1485,55,'select1','1000平米—3000平米',7),(1486,55,'select1','3000平米以上',8),(1488,55,'select2','50元/平米/天以下',2),(1489,55,'select2','50—100元/平米/天',3),(1490,55,'select2','100—200元/平米/天',4),(1491,55,'select2','200—400元/平米/天',5),(1492,55,'select2','400元/平米/天以上',6),(1496,56,'select1','纯写字楼',2),(1497,56,'select1','商务中心',3),(1498,56,'select1','商住楼',4),(1499,56,'select1','园区办公',5),(1500,56,'select1','其他',6),(1501,56,'select2','50平米以下',2),(1502,56,'select2','50平米—80平米',3),(1503,56,'select2','80平米—120平米',4),(1504,56,'select2','120平米—180平米',5),(1505,56,'select2','180平米—250平米',6),(1506,56,'select2','250平米以上',7),(1507,56,'select3','30万元以下',2),(1508,56,'select3','30万元—50万元',3),(1509,56,'select3','50万元—100万元',4),(1510,56,'select3','100万元—200万元',5),(1511,56,'select3','200万元—300万元',6),(1512,56,'select3','300万元—500万元',7),(1513,56,'select3','500万元以上',8),(1515,57,'select1','50平米以下',2),(1516,57,'select1','50平米—80平米',3),(1517,57,'select1','80平米—120平米',4),(1518,57,'select1','120平米—150平米',5),(1519,57,'select1','150平米—250平米',6),(1520,57,'select1','250平米以上',7),(1522,57,'select2','30万元以下',2),(1523,57,'select2','30万元—50万元',3),(1524,57,'select2','50万元—80万元',4),(1525,57,'select2','80万元—120万元',5),(1526,57,'select2','120万元—200万元',6),(1527,57,'select2','200万元以上',7),(1529,57,'select3','4室及以上',2),(1530,57,'select3','3室2厅2卫',3),(1531,57,'select3','3室2厅1卫',4),(1532,57,'select3','3室1厅1卫',5),(1533,57,'select3','2室2厅2卫',6),(1534,57,'select3','1室1厅1卫',7),(1535,57,'select3','2室1厅1卫',8),(1536,57,'select3','2室2厅1卫1',9),(1537,57,'select3','室0厅1卫',10),(1538,57,'select3','其它',11),(1540,58,'select1','初中',2),(1541,58,'select1','高中',3),(1542,58,'select1','小学',4),(1543,58,'select1','小升初',5),(1544,58,'select1','初升高',6),(1545,58,'select1','其他',7),(1547,58,'select2','30元/小时以下',2),(1548,58,'select2','30元/小时—50元/小时',3),(1549,58,'select2','50元/小时—100元/小时',4),(1550,58,'select2','100元/小时—200元/小时',5),(1551,58,'select2','200元/小时以上',6),(1553,59,'select1','财会/金融',2),(1554,59,'select1','建筑',3),(1555,59,'select1','公务员',4),(1556,59,'select1','美容美发',5),(1557,59,'select1','经营/管理',6),(1558,59,'select1','技工',7),(1559,59,'select1','教师',8),(1560,59,'select1','心理/医疗/保健',9),(1561,59,'select1','厨师',10),(1562,59,'select1','外贸/采购/物流',11),(1563,59,'select1','司法考试',12),(1564,59,'select1','网络技术',13),(1565,59,'select1','面点',14),(1566,59,'select1','其他',15),(1568,59,'select2','200元以下',2),(1569,59,'select2','200元—500元',3),(1570,59,'select2','500元—1000元',4),(1571,59,'select2','1000元—3000元',5),(1572,59,'select2','3000元—7000元',6),(1573,59,'select2','7000元以上',7),(1575,60,'select1','自考',2),(1576,60,'select1','专科/本科',3),(1577,60,'select1','网络/远程',4),(1578,60,'select1','成人高考',5),(1579,60,'select1','在职研究生',6),(1580,60,'select1','出国留学',7),(1581,60,'select1','考研',8),(1582,60,'select1','其他',9),(1584,60,'select2','500元以下',2),(1585,60,'select2','500元—2000元',3),(1586,60,'select2','2000元—5000元',4),(1587,60,'select2','5000元—10000元',5),(1588,60,'select2','10000元以上',6),(1591,61,'select1','办公自动化',2),(1592,61,'select1','网络营销',3),(1593,61,'select1','认证培训',4),(1594,61,'select1','网络工程/管理',5),(1595,61,'select1','硬件技术/维修',6),(1596,61,'select1','影视动画',7),(1597,61,'select1','软件开发',8),(1598,61,'select1','数据库培训',9),(1599,61,'select1','计算机等级考试',10),(1600,61,'select1','计算机软考',11),(1601,61,'select1','app开发',12),(1602,61,'select1','游戏开发',13),(1603,61,'select1','其他',14),(1604,61,'select2','500元以下',2),(1605,61,'select2','500元—1000元',3),(1606,61,'select2','1000元—3000元',4),(1607,61,'select2','3000元—7000元',5),(1608,61,'select2','7000元以上',6),(1611,62,'select1','书法',2),(1612,62,'select1','美术',3),(1613,62,'select1','舞蹈',4),(1614,62,'select1','乐器',5),(1615,62,'select1','声乐',6),(1616,62,'select1','表演/礼仪',7),(1617,62,'select1','其他',8),(1618,62,'select2','500元以下',2),(1619,62,'select2','500—1000',3),(1620,62,'select2','1000—2000',4),(1621,62,'select2','2000—4000',5),(1622,62,'select2','4000—7000',6),(1623,62,'select2','7000以上',7),(1626,63,'select1','韩语',2),(1627,63,'select1','英语',3),(1628,63,'select1','日语',4),(1629,63,'select1','俄语',5),(1630,63,'select1','考试类英语',6),(1631,63,'select1','西班牙语',7),(1632,63,'select1','法语',8),(1633,63,'select1','德语',9),(1634,63,'select1','其他语种',10),(1635,63,'select2','500元以下',2),(1636,63,'select2','500元—1000元',3),(1637,63,'select2','1000元—2000元',4),(1638,63,'select2','2000元—3000元',5),(1639,63,'select2','3000元以上',6),(1642,64,'select1','室内设计',2),(1643,64,'select1','平面设计',3),(1644,64,'select1','模具设计',4),(1645,64,'select1','网页设计',5),(1646,64,'select1','广告设计',6),(1647,64,'select1','建筑设计',7),(1648,64,'select1','景观/园林设计',8),(1649,64,'select1','家具设计',9),(1650,64,'select1','形象设计',10),(1651,64,'select1','动漫设计',11),(1652,64,'select1','包装设计',12),(1653,64,'select1','服装设计',13),(1654,64,'select1','其他',14),(1655,64,'select2','500元以下',2),(1656,64,'select2','500元—1000元',3),(1657,64,'select2','1000元—3000元',4),(1658,64,'select2','3000元—5000元',5),(1659,64,'select2','5000元—8000元',6),(1660,64,'select2','8000元以上',7),(1662,65,'select1','学前教育',2),(1663,65,'select1','亲子教育',3),(1664,65,'select1','胎教',4),(1665,65,'select1','母婴护理',5),(1666,65,'select1','其他',6),(1668,65,'select2','500元以下',2),(1669,65,'select2','500元—1000元',3),(1670,65,'select2','1000元—3000元',4),(1671,65,'select2','3000元—5000元',5),(1672,65,'select2','5000元以上',6),(1674,66,'select1','跆拳道',2),(1675,66,'select1','球类',3),(1676,66,'select1','游泳',4),(1677,66,'select1','健身',5),(1678,66,'select1','武术',6),(1679,66,'select1','瑜伽',7),(1680,66,'select1','棋类',8),(1681,66,'select1','其他',9),(1683,66,'select2','500元以下',2),(1684,66,'select2','500元—1000元',3),(1685,66,'select2','1000元—3000元',4),(1686,66,'select2','3000元以上',5),(1688,67,'select1','普工',2),(1689,67,'select1','安装/维修工',3),(1690,67,'select1','焊工',4),(1691,67,'select1','电工',5),(1692,67,'select1','装卸/搬运工',6),(1693,67,'select1','建筑/装修工',7),(1694,67,'select1','缝纫/制衣工',8),(1695,67,'select1','车工/铣工/钳工',9),(1696,67,'select1','模具工',10),(1697,67,'select1','油漆工',11),(1698,67,'select1','木工',12),(1699,67,'select1','生产主管/组长',13),(1700,67,'select1','钳工',14),(1701,67,'select1','车间主任',15),(1702,67,'select1','厂长/副厂长',16),(1703,67,'select1','其他',17),(1706,67,'select2','2000元—3000元',3),(1707,67,'select2','3000元—5000元',4),(1708,67,'select2','5000元—8000元',5),(1709,67,'select2','8000元—12000元',6),(1710,67,'select2','12000元以上',7),(1712,68,'select1','销售专员',2),(1713,68,'select1','电话销售',3),(1714,68,'select1','销售经理/主管',4),(1715,68,'select1','保险/金融顾问',5),(1716,68,'select1','跟单员/助理',6),(1717,68,'select1','网络销售',7),(1718,68,'select1','房产经纪人',8),(1719,68,'select1','保险经纪人',9),(1720,68,'select1','证券/期货/外汇经纪人',10),(1721,68,'select1','信用卡/银行卡业务',11),(1722,68,'select1','股票/期货操盘手',12),(1723,68,'select1','银行会计/柜员',13),(1724,68,'select1','证券经理/总监',14),(1725,68,'select1','银行经理/主任',15),(1726,68,'select1','其他',16),(1728,68,'select2','2000元以下',2),(1729,68,'select2','2000元—3000元',3),(1730,68,'select2','3000元—5000元',4),(1731,68,'select2','5000元—8000元',5),(1732,68,'select2','8000元—12000元',6),(1733,68,'select2','12000元以上',7),(1735,69,'select1','足疗师',2),(1736,69,'select1','按摩师',3),(1737,69,'select1','保健师',4),(1738,69,'select1','其他',5),(1740,69,'select2','2000元以下',2),(1741,69,'select2','2000元—3000元',3),(1742,69,'select2','3000元—5000元',4),(1743,69,'select2','5000元—8000元',5),(1744,69,'select2','8000元—12000元',6),(1745,69,'select2','12000元以上',7),(1747,70,'select1','室内设计',2),(1748,70,'select1','平面设计',3),(1749,70,'select1','广告设计',4),(1750,70,'select1','CAD制图',5),(1751,70,'select1','网页设计',6),(1752,70,'select1','店面/陈列设计',7),(1753,70,'select1','摄影师',8),(1754,70,'select1','包装设计',9),(1755,70,'select1','服装设计',10),(1756,70,'select1','其它',11),(1758,70,'select2','2000元以下',2),(1759,70,'select2','2000元—3000元',3),(1760,70,'select2','3000元—5000元',4),(1761,70,'select2','5000元—8000元',5),(1762,70,'select2','8000元—12000元',6),(1763,70,'select2','12000元以上',7),(1765,71,'select1','文员',2),(1766,71,'select1','行政专员/助理',3),(1767,71,'select1','前台/总机/接待',4),(1768,71,'select1','人事专员/助理',5),(1769,71,'select1','秘书/助理',6),(1770,71,'select1','编辑/文案',7),(1771,71,'select1','后勤',8),(1772,71,'select1','招聘经理/主管',9),(1773,71,'select1','招聘专员/助理',10),(1774,71,'select1','行政经理/主管',11),(1775,71,'select1','人事经理/主管',12),(1776,71,'select1','记者/采编',13),(1777,71,'select1','猎头',14),(1778,71,'select1','行政总监',15),(1779,71,'select1','总编/副总编/主编',16),(1780,71,'select1','其他',17),(1782,71,'select2','2000元以下',2),(1783,71,'select2','2000元—3000元',3),(1784,71,'select2','3000元—5000元',4),(1785,71,'select2','5000元—8000元',5),(1786,71,'select2','8000元—12000元',6),(1787,71,'select2','12000元以上',7),(1789,72,'select1','营业员',2),(1790,72,'select1','导购员',3),(1791,72,'select1','促销员',4),(1792,72,'select1','店长',5),(1793,72,'select1','理货员',6),(1794,72,'select1','其他',7),(1797,72,'select2','2000元以下',2),(1798,72,'select2','2000元—3000元',3),(1799,72,'select2','3000元—5000元',4),(1800,72,'select2','5000元—8000元',5),(1801,72,'select2','8000元—12000元',6),(1802,72,'select2','12000元以上',7),(1803,72,'select3','做六休一',2),(1804,72,'select3','做二休一',3),(1805,72,'select3','做五休二',4),(1806,72,'select3','做一休一',5),(1807,72,'select3','其他',6),(1809,73,'select1','餐厅服务员',2),(1810,73,'select1','收银员',3),(1811,73,'select1','大堂服务员',4),(1812,73,'select1','客房服务员',5),(1813,73,'select1','大堂经理/领班',6),(1814,73,'select1','迎宾/接待',7),(1815,73,'select1','其他',8),(1817,73,'select2','2000元以下',2),(1818,73,'select2','2000元—3000元',3),(1819,73,'select2','3000元—5000元',4),(1820,73,'select2','5000元—8000元',5),(1821,73,'select2','8000元—12000元',6),(1822,73,'select2','12000元以上',7),(1824,74,'select1','厨师',2),(1825,74,'select1','切配/厨工',3),(1826,74,'select1','面点师',4),(1827,74,'select1','洗碗工',5),(1828,74,'select1','其他',6),(1830,74,'select2','2000元以下',2),(1831,74,'select2','2000元—3000元',3),(1832,74,'select2','3000元—5000元',4),(1833,74,'select2','5000元—8000元',5),(1834,74,'select2','8000元—12000元',6),(1835,74,'select2','12000元以上',7),(1837,75,'select1','送货员',2),(1838,75,'select1','快递员',3),(1839,75,'select1','仓库管理员',4),(1840,75,'select1','跟单员',5),(1841,75,'select1','送餐员',6),(1842,75,'select1','调度员',7),(1843,75,'select1','其它',8),(1845,75,'select2','2000元以下',2),(1846,75,'select2','2000元—3000元',3),(1847,75,'select2','3000元—5000元',4),(1848,75,'select2','5000元—8000元',5),(1849,75,'select2','8000元—12000元',6),(1850,75,'select2','12000元以上',7),(1852,76,'select1','900元以下',2),(1853,76,'select1','900元—2000元',3),(1854,76,'select1','2000元—3000元',4),(1855,76,'select1','3000元以上',5),(1857,77,'select1','保洁',2),(1858,77,'select1','保姆',3),(1859,77,'select1','钟点工',5),(1860,77,'select1','陪护',6),(1861,77,'select1','育婴师',6),(1862,77,'select1','月嫂',7),(1863,77,'select1','其它',8),(1865,77,'select2','900元以下',2),(1866,77,'select2','900元—2000元',3),(1867,77,'select2','2000元—3000元',4),(1868,77,'select2','3000元以上',5),(1870,78,'select1','货车',2),(1871,78,'select1','出租车',3),(1872,78,'select1','轿车',4),(1873,78,'select1','面包车',5),(1874,78,'select1','客车',6),(1875,78,'select1','挖掘机',7),(1876,78,'select1','叉车/铲车/吊车',8),(1877,78,'select1','驾校教练/陪驾',9),(1878,78,'select1','其他',10),(1880,78,'select2','2000元以下',2),(1881,78,'select2','2000元—3000元',3),(1882,78,'select2','3000元—5000元',4),(1883,78,'select2','5000元—8000元',5),(1884,78,'select2','8000元—12000元',6),(1885,78,'select2','12000元以上',7),(1887,79,'select1','中小学教师',2),(1888,79,'select1','家教',3),(1889,79,'select1','早教',4),(1890,79,'select1','文艺/体育教师',5),(1891,79,'select1','企业培训',6),(1892,79,'select1','运动/健身教练',7),(1893,79,'select1','校长',8),(1894,79,'select1','瑜伽/舞蹈老师',9),(1895,79,'select1','其他',10),(1897,79,'select2','2000元以下',2),(1898,79,'select2','2000元—3000元',3),(1899,79,'select2','3000元—5000元',4),(1900,79,'select2','5000元—8000元',5),(1901,79,'select2','8000元—12000元',6),(1902,79,'select2','12000元以上',7),(1904,80,'select1','会计',2),(1905,80,'select1','财务',3),(1906,80,'select1','出纳',4),(1907,80,'select1','统计员',5),(1908,80,'select1','审计',6),(1909,80,'select1','税务',7),(1910,80,'select1','其他',8),(1912,80,'select2','2000元以下',2),(1913,80,'select2','2000元—3000元',3),(1914,80,'select2','3000元—5000元',4),(1915,80,'select2','5000元—8000元',5),(1916,80,'select2','8000元—12000元',6),(1917,80,'select2','12000元以上',7),(1919,81,'select1','淘宝美工',2),(1920,81,'select1','淘宝客服',3),(1921,81,'select1','网店店长',4),(1922,81,'select1','店铺运营/推广',5),(1923,81,'select1','其它',6),(1925,81,'select2','2000元以下',2),(1926,81,'select2','2000元—3000元',3),(1927,81,'select2','3000元—5000元',4),(1928,81,'select2','5000元—8000元',5),(1929,81,'select2','8000元—12000元',6),(1930,81,'select2','12000元以上',7),(1932,81,'select3','做六休一',2),(1933,81,'select3','做二休一',3),(1934,81,'select3','做五休二',4),(1935,81,'select3','做一休一',5),(1936,81,'select3','其他',6),(1938,82,'select1','客服专员/助理',2),(1939,82,'select1','客服经理/主管',3),(1940,82,'select1','其他',4),(1942,82,'select2','2000元以下',2),(1943,82,'select2','2000元—3000元',3),(1944,82,'select2','3000元—5000元',4),(1945,82,'select2','5000元以上',5),(1947,83,'select1','美发师',2),(1948,83,'select1','化妆师',3),(1949,83,'select1','美容师',4),(1950,83,'select1','美发助理/学徒',5),(1951,83,'select1','美容助理/学徒',6),(1952,83,'select1','美甲师',7),(1953,83,'select1','洗头工',8),(1954,83,'select1','其它',9),(1956,83,'select2','2000元以下',2),(1957,83,'select2','2000元—3000元',3),(1958,83,'select2','3000元—5000元',4),(1959,83,'select2','5000元—8000元',5),(1960,83,'select2','8000元—12000元',6),(1961,83,'select2','12000元以上',7),(1963,84,'select1','技术支持/维护',2),(1964,84,'select1','游戏设计/开发',3),(1965,84,'select1','网络工程师',4),(1966,84,'select1','网站运营',5),(1967,84,'select1','网站编辑',6),(1968,84,'select1','技术专员/助理',7),(1969,84,'select1','程序员',8),(1970,84,'select1','网络管理员',9),(1971,84,'select1','硬件工程师',10),(1972,84,'select1','技术总监/经理',11),(1973,84,'select1','软件工程师',12),(1974,84,'select1','产品经理/专员',13),(1975,84,'select1','测试员',14),(1976,84,'select1','通信工程师',15),(1977,84,'select1','架构师',16),(1978,84,'select1','数据库管理',17),(1979,84,'select1','其他',18),(1981,84,'select2','2000元以下',2),(1982,84,'select2','2000元—3000元',3),(1983,84,'select2','3000元—5000元',4),(1984,84,'select2','5000元—8000元',5),(1985,84,'select2','8000元—12000元',6),(1986,84,'select2','12000元以上',7),(1988,84,'select3','无经验',2),(1989,84,'select3','一年经验',3),(1990,84,'select3','二年经验',4),(1991,84,'select3','三年经验',5),(1992,84,'select3','三年以上经验',6),(1994,85,'select1','市场专员/助理',2),(1995,85,'select1','营销经理',3),(1996,85,'select1','市场经理/主管',4),(1997,85,'select1','客户经理/主管',5),(1998,85,'select1','公关专员/助理',6),(1999,85,'select1','公关经理/主管',7),(2000,85,'select1','大客户经理',8),(2001,85,'select1','其他',9),(2003,85,'select2','2000元以下',2),(2004,85,'select2','2000元—3000元',3),(2005,85,'select2','3000元—5000元',4),(2006,85,'select2','5000元—8000元',5),(2007,85,'select2','8000元—12000元',6),(2008,85,'select2','12000元以上',7),(2010,87,'select1','德语',2),(2011,87,'select1','英语',3),(2012,87,'select1','韩语',4),(2013,87,'select1','日语',5),(2014,87,'select1','俄语',6),(2015,87,'select1','西班牙语',7),(2016,87,'select1','法语',8),(2017,87,'select1','其它',9),(2019,87,'select2','2000元以下',2),(2020,87,'select2','2000元—3000元',3),(2021,87,'select2','3000元—5000元',4),(2022,87,'select2','5000元—8000元',5),(2023,87,'select2','8000元—12000元',6),(2024,87,'select2','12000元以上',7),(2026,89,'select1','2000元以下',2),(2027,89,'select1','2000元—3000元',3),(2028,89,'select1','3000元—5000元',4),(2029,89,'select1','5000元—8000元',5),(2030,89,'select1','8000元—12000元',6),(2031,89,'select1','12000元以上',7),(2033,90,'select1','产品代理',2),(2034,90,'select1','服装箱包',3),(2035,90,'select1','餐饮加盟',4),(2036,90,'select1','教育培训',5),(2037,90,'select1','建材家居',6),(2038,90,'select1','干洗加盟',7),(2039,90,'select1','美容保健',8),(2040,90,'select1','快递物流',9),(2041,90,'select1','礼品饰品',10),(2042,90,'select1','农业养殖',11),(2043,90,'select1','母婴用品',12),(2044,90,'select1','其他',13),(2046,91,'select1','无抵押贷款',2),(2047,91,'select1','企业/个体户贷款',3),(2048,91,'select1','汽车抵押贷款',4),(2049,91,'select1','房产抵押贷款',5),(2050,91,'select1','买房贷款',6),(2051,91,'select1','买车贷款',7),(2052,91,'select1','其它',8),(2054,92,'select1','空调维修',2),(2055,92,'select1','热水器维修',3),(2056,92,'select1','空调移机',4),(2057,92,'select1','洗衣机维修',5),(2058,92,'select1','冰箱维修',6),(2059,92,'select1','电视机维修',7),(2060,92,'select1','饮水机维修',8),(2061,92,'select1','电饭煲维修',9),(2062,92,'select1','抽油烟机维修',10),(2063,92,'select1','电磁炉维修',11),(2064,92,'select1','其他',12),(2066,93,'select1','吊顶',2),(2067,93,'select1','门窗',3),(2068,93,'select1','涂料',4),(2069,93,'select1','钢材',5),(2070,93,'select1','五金',6),(2071,93,'select1','墙纸',7),(2072,93,'select1','地板',8),(2073,93,'select1','油漆',9),(2074,93,'select1','卫浴洁具',10),(2075,93,'select1','玻璃',11),(2076,93,'select1','瓷砖',12),(2077,93,'select1','窗帘',13),(2078,93,'select1','灯具',14),(2079,93,'select1','水泥',15),(2080,93,'select1','橱柜',16),(2081,93,'select1','厨卫电器',17),(2082,93,'select1','暖气地暖',18),(2083,93,'select1','其它',19),(2085,94,'select1','公司注册',2),(2086,94,'select1','工商年检',3),(2087,94,'select1','商标注册',4),(2088,94,'select1','公司转让',5),(2089,94,'select1','专利注册',6),(2090,94,'select1','海外公司注册',7),(2091,94,'select1','专项审批',8),(2092,94,'select1','香港公司注册',9),(2093,94,'select1','公司注销',10),(2094,94,'select1','验资开户',11),(2095,94,'select1','资质认证',12),(2096,94,'select1','外资公司注册',13),(2097,94,'select1','其它',14),(2099,95,'select1','新房装修',2),(2100,95,'select1','店铺装修',3),(2101,95,'select1','办公室/写字楼装修',4),(2102,95,'select1','二手房装修',5),(2103,95,'select1','厂房装修',6),(2104,95,'select1','拆旧',7),(2105,95,'select1','学校/幼儿园装修',8),(2106,95,'select1','商场/超市装修',9),(2107,95,'select1','酒店装修',10),(2108,95,'select1','其他',11),(2110,96,'select1','理财产品',2),(2111,96,'select1','期货',3),(2112,96,'select1','股票',4),(2113,96,'select1','黄金',5),(2114,96,'select1','证券',6),(2115,96,'select1','信用卡',7),(2116,96,'select1','基金',8),(2117,96,'select1','外汇',9),(2118,96,'select1','保险',10),(2119,96,'select1','其它',11),(2121,97,'select1','会计',2),(2122,97,'select1','审计',3),(2124,98,'select1','电脑维修',2),(2125,98,'select1','笔记本维修',3),(2126,98,'select1','网络布线',4),(2127,98,'select1','IT外包',5),(2128,98,'select1','打印机维修',6),(2129,98,'select1','数据恢复',7),(2130,98,'select1','传真机维修',8),(2131,98,'select1','安防监控',9),(2132,98,'select1','ipad/平板电脑维修',10),(2133,98,'select1','机房建设',11),(2134,98,'select1','其它',12),(2136,99,'select1','货运',2),(2137,99,'select1','快递',3),(2138,99,'select1','仓储',4),(2139,99,'select1','行李托运',5),(2140,99,'select1','进出口报关',6),(2141,99,'select1','其它',7),(2143,100,'select1','农产品加工/代理',2),(2144,100,'select1','农作物',3),(2145,100,'select1','畜禽养殖',4),(2146,100,'select1','水产',5),(2147,100,'select1','园林花卉',6),(2148,100,'select1','动植物种苗',7),(2149,100,'select1','农机具/设备',8),(2150,100,'select1','饲料/兽药',9),(2151,100,'select1','农药/肥料',10),(2152,100,'select1','其它',11),(2154,101,'select1','活动策划',12),(2155,101,'select1','广告策划',11),(2156,101,'select1','平面设计',10),(2157,101,'select1','网页设计',9),(2158,101,'select1','Logo设计/VI设计',8),(2159,101,'select1','工业设计',7),(2160,101,'select1','景观设计',6),(2161,101,'select1','影视/动画制作',5),(2162,101,'select1','室内设计',4),(2163,101,'select1','名片设计',3),(2164,101,'select1','服装设计',2),(2165,101,'select1','其它',13),(2167,102,'select1','管道疏通',2),(2168,102,'select1','下水道疏通',3),(2169,102,'select1','马桶疏通',4),(2170,102,'select1','化粪池疏通',5),(2171,102,'select1','管道清淤',6),(2172,102,'select1','打捞',7),(2174,103,'select1','带司机租车',2),(2175,103,'select1','商务租车',3),(2176,103,'select1','旅游租车',4),(2177,103,'select1','婚车',5),(2178,103,'select1','豪华车',6),(2179,103,'select1','货车',7),(2180,103,'select1','其他',8),(2182,103,'select2','100元以下',2),(2183,103,'select2','200元—300元',3),(2184,103,'select2','300元—500元',4),(2185,103,'select2','500元—800元',5),(2186,103,'select2','800元—1200元',6),(2187,103,'select2','1200元以上',7),(2189,104,'select1','周边游',2),(2190,104,'select1','农家乐',3),(2191,104,'select1','旅行社',4),(2192,104,'select1','导游',5),(2193,104,'select1','港澳台游',6),(2194,104,'select1','温泉',7),(2195,104,'select1','出国游',8),(2196,104,'select1','其它',9),(2198,105,'select1','婚纱摄影',2),(2199,105,'select1','艺术照',3),(2200,105,'select1','写真',4),(2201,105,'select1','摄像',5),(2202,105,'select1','商业摄影',6),(2203,105,'select1','儿童摄影',7),(2204,105,'select1','其他',8),(2206,106,'select1','日常保洁',2),(2207,106,'select1','擦玻璃',3),(2208,106,'select1','开荒保洁',4),(2209,106,'select1','抽油烟机清洗',5),(2210,106,'select1','地毯清洗',6),(2211,106,'select1','外墙清洗',7),(2212,106,'select1','干洗',8),(2213,106,'select1','石材翻新/养护',9),(2214,106,'select1','地板打蜡',10),(2215,106,'select1','沙发清洗',11),(2216,106,'select1','空调清洗',12),(2217,106,'select1','灯具清洗',13),(2218,106,'select1','空气净化',14),(2219,106,'select1','瓷砖美缝',15),(2220,106,'select1','其他',16),(2222,107,'select1','100元以下',2),(2223,107,'select1','100元—200元',3),(2224,107,'select1','200元—300元',4),(2225,107,'select1','300元—500元',5),(2226,107,'select1','500元以上',6),(2228,109,'select1','C1(手动档汽车)',2),(2229,109,'select1','C2(自动挡汽车)',3),(2230,109,'select1','B1(中型客车)',4),(2231,109,'select1','B2(大型货车)',5),(2232,109,'select1','E(二轮摩托车)',6),(2233,109,'select1','F(轻便摩托车)',7),(2234,109,'select1','D(三轮摩托车)',8),(2235,109,'select1','A2(牵引车)',9),(2236,109,'select1','C3(载货汽车)',10),(2237,109,'select1','C4(三轮汽车)',11),(2238,109,'select1','C5(残疾人专用)',12),(2239,109,'select1','A(大型客车)',13),(2240,109,'select1','A3(城市公交车)',14),(2242,109,'select2','2000元以下',2),(2243,109,'select2','2000元—5000元',3),(2244,109,'select2','5000元—8000元',4),(2245,109,'select2','8000元以上',5),(2247,111,'select1','健身',2),(2248,111,'select1','瑜伽',3),(2249,111,'select1','按摩',4),(2250,111,'select1','足疗',5),(2251,111,'select1','会所',6),(2252,111,'select1','KTV',7),(2253,111,'select1','洗浴',8),(2254,111,'select1','酒吧',9),(2255,111,'select1','桌游',10),(2256,111,'select1','演唱会',11),(2257,111,'select1','演出票务',12),(2258,111,'select1','电影票',13),(2259,111,'select1','其他',14),(2261,112,'select1','印刷',2),(2262,112,'select1','喷绘',3),(2263,112,'select1','名片',4),(2264,112,'select1','制卡',5),(2265,112,'select1','灯箱',6),(2266,112,'select1','易拉宝',7),(2267,112,'select1','其他',8),(2269,113,'select1','签证',2),(2270,113,'select1','机票',3),(2271,113,'select1','移民',4),(2273,114,'select1','礼品定制',2),(2274,114,'select1','商务礼品',3),(2275,114,'select1','其它',4),(2277,115,'select1','水电维修',2),(2278,115,'select1','马桶维修',3),(2279,115,'select1','防水补漏',4),(2280,115,'select1','淋浴房维修',5),(2281,115,'select1','家具维修',6),(2282,115,'select1','门窗维修',7),(2283,115,'select1','沙发维修',8),(2284,115,'select1','其他',9),(2286,116,'select1','美容',10),(2287,116,'select1','减肥瘦身',9),(2288,116,'select1','祛痘/祛斑',8),(2289,116,'select1','spa',7),(2290,116,'select1','丰胸',6),(2291,116,'select1','美发',5),(2292,116,'select1','除皱',4),(2293,116,'select1','脱毛',3),(2294,116,'select1','美甲',2),(2297,116,'select2','100元以下',2),(2298,116,'select2','100元—200元',3),(2299,116,'select2','200元—400元',4),(2300,116,'select2','400元—800元',5),(2301,116,'select2','800元—1200元',6),(2302,116,'select2','1200元—1500元',7),(2303,116,'select2','1500元以上',8),(2305,117,'select1','家政公司',2),(2306,117,'select1','保姆',3),(2307,117,'select1','东家',4),(2308,117,'select1','其它',5),(2310,117,'select2','钟点工',2),(2311,117,'select2','做饭',3),(2312,117,'select2','保姆',4),(2313,117,'select2','照顾孩子',5),(2314,117,'select2','住家阿姨',6),(2315,117,'select2','照顾老人',7),(2316,117,'select2','育婴师/育儿嫂',8),(2317,117,'select2','月嫂',9),(2318,117,'select2','催乳师',10),(2319,117,'select2','护工/陪护',11),(2320,117,'select2','其它',12),(2322,118,'select1','网站建设',2),(2323,118,'select1','网站推广',3),(2324,118,'select1','网站维护/外包',4),(2325,118,'select1','域名注册',5),(2326,118,'select1','服务器',6),(2327,118,'select1','企业邮箱',7),(2328,118,'select1','其它',8),(2330,119,'select1','绿植/盆栽',2),(2331,119,'select1','园艺用品',3),(2332,119,'select1','鲜花',4),(2333,119,'select1','其它',5),(2335,120,'select1','新娘化妆',2),(2336,120,'select1','婚车租赁',3),(2337,120,'select1','婚庆公司',4),(2338,120,'select1','婚礼跟拍',5),(2339,120,'select1','婚纱礼服',6),(2340,120,'select1','司仪',7),(2341,120,'select1','婚礼用品',8),(2342,120,'select1','婚宴',9),(2343,120,'select1','喜糖',10),(2344,120,'select1','婚戒首饰',11),(2345,120,'select1','其他',12),(2347,120,'select2','500元以下',2),(2348,120,'select2','500元—1000元',3),(2349,120,'select2','1000元—2000元',4),(2350,120,'select2','2000元—4000元',5),(2351,120,'select2','4000元以上',6),(2353,121,'select1','庆典公司',2),(2354,121,'select1','场地布置',3),(2355,121,'select1','灯光音响',4),(2356,121,'select1','礼仪模特',5),(2357,121,'select1','乐队演出',6),(2358,121,'select1','司仪',7),(2359,121,'select1','化妆',8),(2360,121,'select1','其它',9),(2362,122,'select1','债务纠纷',2),(2363,122,'select1','合同纠纷',3),(2364,122,'select1','交通事故',4),(2365,122,'select1','离婚',5),(2366,122,'select1','刑事辩护',6),(2367,122,'select1','知识产权',7),(2368,122,'select1','房产纠纷',8),(2369,122,'select1','法律援助',9),(2370,122,'select1','劳动纠纷',10),(2371,122,'select1','其它',11),(2373,123,'select1','快餐',2),(2374,123,'select1','送水',3),(2375,123,'select1','食材配送',4),(2376,123,'select1','宴会外卖',5),(2377,123,'select1','承包食堂',6),(2378,123,'select1','其它',7),(2380,124,'select1','星级酒店',2),(2381,124,'select1','经济型酒店',3),(2382,124,'select1','宾馆',4),(2383,124,'select1','青年旅舍',5),(2384,124,'select1','中等',6),(2385,124,'select1','度假村',7),(2386,124,'select1','连锁酒店',8),(2387,124,'select1','其它',9),(2389,124,'select2','100元以下',2),(2390,124,'select2','100元—200元',3),(2391,124,'select2','200元—300元',4),(2392,124,'select2','300元—500元',5),(2393,124,'select2','500元—800元',6),(2394,124,'select2','800元以上',7),(2396,125,'select1','购物',2),(2397,125,'select1','休闲娱乐',3),(2398,125,'select1','论坛',4),(2399,125,'select1','新闻',5),(2400,125,'select1','交通地图',6),(2401,125,'select1','游戏',7),(2402,125,'select1','KTV',8),(2403,125,'select1','会所',9),(2404,125,'select1','茶庄',10),(2405,125,'select1','其他',11),(2407,126,'select1','笔译',2),(2408,126,'select1','口译',3),(2409,126,'select1','速记',4),(2410,126,'select1','同声传译',5),(2411,126,'select1','其它',6),(2413,127,'select1','面部整形',2),(2414,127,'select1','眼部整形',3),(2415,127,'select1','鼻部整形',4),(2416,127,'select1','唇部整形',5),(2417,127,'select1','牙齿美容',6),(2418,127,'select1','皮肤美容',7),(2419,127,'select1','胸部整形',8),(2420,127,'select1','微整形',9),(2421,127,'select1','吸脂溶脂减肥',10),(2422,127,'select1','私密整形',11),(2423,127,'select1','激光脱毛',12),(2424,127,'select1','假体取出',13),(2425,127,'select1','其他',14),(2427,128,'select1','肾病科',2),(2428,128,'select1','皮肤病科',3),(2429,128,'select1','风湿科',4),(2430,128,'select1','眼科',5),(2431,128,'select1','骨科',6),(2432,128,'select1','儿科',7),(2433,128,'select1','泌尿科',8),(2434,128,'select1','肝病科',9),(2435,128,'select1','不孕不育',10),(2436,128,'select1','妇科',11),(2437,128,'select1','性交障碍',12),(2438,128,'select1','性病科',13),(2439,128,'select1','内分泌科',14),(2440,128,'select1','肿瘤科',15),(2441,128,'select1','男科',16),(2442,128,'select1','其它',17),(2444,130,'select1','摄影',2),(2445,130,'select1','翻译',3),(2446,130,'select1','装卸工',4),(2447,130,'select1','地勤',5),(2448,130,'select1','杂务',6),(2449,130,'select1','其他',7),(2451,130,'select2','100元以下',2),(2452,130,'select2','100元—200元',3),(2453,130,'select2','200元—300元',4),(2454,130,'select2','300元—500元',5),(2455,130,'select2','500元以上',6),(2457,131,'select1','中学理科',2),(2458,131,'select1','小学英语',3),(2459,131,'select1','中学文科',4),(2460,131,'select1','文艺体育',5),(2461,131,'select1','奥数',6),(2462,131,'select1','其他',7),(2464,131,'select2','30元以下',2),(2465,131,'select2','30元—50元',3),(2466,131,'select2','50元—70元',4),(2467,131,'select2','70元—100元',5),(2468,131,'select2','100元—150元',6),(2469,131,'select2','150元以上',7),(2471,132,'select1','派发',2),(2472,132,'select1','促销',3),(2473,132,'select1','其它 ',4),(2475,132,'select2','10元以下',2),(2476,132,'select2','10元—20元',3),(2477,132,'select2','20元—30元',4),(2478,132,'select2','30元—70元',5),(2479,132,'select2','70元以上',6),(2481,133,'select1','礼仪',2),(2482,133,'select1','模特',3),(2483,133,'select1','其它',4),(2485,133,'select2','20元以下',2),(2486,133,'select2','20元—30元',3),(2487,133,'select2','30元—60元',4),(2488,133,'select2','60元—100元',5),(2489,133,'select2','100元—150元',6),(2490,133,'select2','150元以上',7),(2492,134,'select1','10元以下',2),(2493,134,'select1','10元—20元',3),(2494,134,'select1','20元—40元',4),(2495,134,'select1','40元—70元',5),(2496,134,'select1','70元以上',6),(2498,135,'select1','10元以下',2),(2499,135,'select1','10元—20元',3),(2500,135,'select1','20元—30元',4),(2501,135,'select1','30元以上',5),(2503,135,'select2','上午',2),(2504,135,'select2','中午',3),(2505,135,'select2','下午',4),(2506,135,'select2','晚间',5),(2507,135,'select2','晚9点以后',6),(2508,135,'select2','其它',7),(2510,136,'select1','设计',2),(2511,136,'select1','网站',3),(2512,136,'select1','其它',4),(2514,136,'select2','50元以下',2),(2515,136,'select2','50—100',3),(2516,136,'select2','100—200',4),(2517,136,'select2','200以上',5),(2519,137,'select1','50元以下',2),(2520,137,'select1','50元—100元',3),(2521,137,'select1','100元—200元',4),(2522,137,'select1','200元以上',5),(2524,138,'select1','50元以下',2),(2525,138,'select1','50元—100元',3),(2526,138,'select1','100元—200元',4),(2527,138,'select1','200元以上',5),(2529,139,'select1','50元以下',2),(2530,139,'select1','50元—100元',3),(2531,139,'select1','100元—200元',4),(2532,139,'select1','200元—500元',5),(2533,139,'select1','500元以上',6),(2535,140,'select1','50元以下',2),(2536,140,'select1','50元—100元',3),(2537,140,'select1','100元—200元',4),(2538,140,'select1','200元以上',5),(2540,141,'select1','50元以下',2),(2541,141,'select1','50元—100元',3),(2542,141,'select1','100元—200元',5),(2543,141,'select1','200元以上',6),(2545,142,'select1','泰迪',2),(2546,142,'select1','金毛',3),(2547,142,'select1','比熊',4),(2548,142,'select1','萨摩耶',5),(2549,142,'select1','阿拉斯加',6),(2550,142,'select1','博美',7),(2551,142,'select1','哈士奇',8),(2552,142,'select1','拉布拉多',9),(2553,142,'select1','德国牧羊犬',10),(2554,142,'select1','松狮',11),(2555,142,'select1','秋田犬',12),(2556,142,'select1','吉娃娃',13),(2557,142,'select1','藏獒',14),(2558,142,'select1','雪纳瑞',15),(2559,142,'select1','贵宾',16),(2560,142,'select1','边境牧羊犬',17),(2561,142,'select1','巴哥犬',18),(2562,142,'select1','古牧',19),(2563,142,'select1','罗威纳',20),(2564,142,'select1','银狐犬',21),(2565,142,'select1','杜宾犬',22),(2566,142,'select1','京巴',23),(2567,142,'select1','比特',24),(2568,142,'select1','苏格兰牧羊犬',25),(2569,142,'select1','高加索犬',26),(2570,142,'select1','灵缇犬',27),(2571,142,'select1','西高地',28),(2572,142,'select1','马犬',29),(2573,142,'select1','喜乐蒂',30),(2574,142,'select1','牛头梗',31),(2575,142,'select1','雪橇犬',32),(2576,142,'select1','西施犬',33),(2577,142,'select1','大白熊',34),(2578,142,'select1','卡斯罗',35),(2579,142,'select1','沙皮犬',36),(2580,142,'select1','蝴蝶犬',37),(2581,142,'select1','伯恩山犬',38),(2582,142,'select1','斗牛犬',39),(2583,142,'select1','万能梗',40),(2584,142,'select1','小鹿犬',41),(2585,142,'select1','猎狐梗',42),(2586,142,'select1','威玛烈犬',43),(2587,142,'select1','柴犬',44),(2588,142,'select1','斑点狗',45),(2589,142,'select1','巴吉度猎犬',46),(2590,142,'select1','阿富汗猎犬',47),(2591,142,'select1','格力犬',48),(2592,142,'select1','比格犬',49),(2593,142,'select1','大丹犬',50),(2594,142,'select1','腊肠犬',51),(2595,142,'select1','可卡犬',52),(2596,142,'select1','柯基犬',53),(2597,142,'select1','圣伯纳',54),(2598,142,'select1','其他',55),(2600,142,'select2','100元以下',2),(2601,142,'select2','100元—300元',3),(2602,142,'select2','300元—500元',4),(2603,142,'select2','500元—800元',5),(2604,142,'select2','800元—1200元',6),(2605,142,'select2','1200元—2000元',7),(2606,142,'select2','2000元以上',8),(2608,142,'select3','公',2),(2609,142,'select3','牧',3),(2611,143,'select1','其他水族',2),(2612,143,'select1','奇石盆景',3),(2613,143,'select1','玩赏鸟',4),(2614,143,'select1','观赏鱼',5),(2615,143,'select1','其他',6),(2617,143,'select2','100元以下',2),(2618,143,'select2','100元—300元',3),(2619,143,'select2','300元—500元',4),(2620,143,'select2','500元—800元',5),(2621,143,'select2','800元—1200元',6),(2622,143,'select2','1200元—2000元',7),(2623,143,'select2','2000元以上',8),(2625,144,'select1','赠送',2),(2626,144,'select1','求赠',3),(2628,144,'select2','狗',2),(2629,144,'select2','猫',3),(2630,144,'select2','鼠',4),(2631,144,'select2','兔',5),(2632,144,'select2','鸟',6),(2633,144,'select2','水族',7),(2634,144,'select2','蛇',8),(2635,144,'select2','猪',9),(2636,144,'select2','其他',10),(2638,145,'select1','蓝猫',2),(2639,145,'select1','短毛猫',3),(2640,145,'select1','折耳猫',4),(2641,145,'select1','加菲猫',5),(2642,145,'select1','虎斑猫',6),(2643,145,'select1','金吉拉',7),(2644,145,'select1','波斯猫',8),(2645,145,'select1','暹罗猫',9),(2646,145,'select1','豹猫',10),(2647,145,'select1','其他',11),(2649,145,'select2','100元以下',2),(2650,145,'select2','100元—300元',3),(2651,145,'select2','300元—500元',4),(2652,145,'select2','500元—800元',5),(2653,145,'select2','800元—1200元',6),(2654,145,'select2','1200元—2000元',7),(2655,145,'select2','2000元以上',8),(2657,145,'select3','公',2),(2658,145,'select3','母',3),(2660,146,'select1','配种',2),(2661,146,'select1','训练',3),(2662,146,'select1','寄养',4),(2663,146,'select1','医院',5),(2664,146,'select1','美容',6),(2665,146,'select1','托运',7),(2666,146,'select1','临时照看',8),(2667,146,'select1','其他',9),(2669,147,'select1','宠物衣服',2),(2670,147,'select1','宠物除毛器',3),(2671,147,'select1','宠物粮',4),(2672,147,'select1','宠物链',5),(2673,147,'select1','宠物鞋',6),(2674,147,'select1','宠物配饰',7),(2675,147,'select1','宠物其它应用',8),(2676,147,'select1','宠物其它食品',9),(2677,147,'select1','其它',10),(2679,147,'select2','供应',2),(2680,147,'select2','求购',3),(2681,147,'select3','测试1',100),(2682,147,'select3','测试2',100),(2683,147,'select3','测试3',100),(2684,47,'select4','测试1',1),(2685,47,'select4','测试2',2),(2686,47,'select5','对不对1',1),(2687,47,'select5','对不对2',2);

/*Table structure for table `tu_life_cate_tag` */

DROP TABLE IF EXISTS `tu_life_cate_tag`;

CREATE TABLE `tu_life_cate_tag` (
  `tag_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `tag_name` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2691 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_cate_tag` */

insert  into `tu_life_cate_tag`(`tag_id`,`cate_id`,`type`,`tag_name`,`orderby`) values (2688,145,'select145','测试11',1),(2689,145,'select145','测试22',2),(2690,145,'select145','测试33',3);

/*Table structure for table `tu_life_details` */

DROP TABLE IF EXISTS `tu_life_details`;

CREATE TABLE `tu_life_details` (
  `life_id` int(11) NOT NULL DEFAULT '0',
  `details` text,
  PRIMARY KEY (`life_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_details` */

/*Table structure for table `tu_life_love` */

DROP TABLE IF EXISTS `tu_life_love`;

CREATE TABLE `tu_life_love` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `life_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `life_id` (`life_id`,`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_love` */

/*Table structure for table `tu_life_packet` */

DROP TABLE IF EXISTS `tu_life_packet`;

CREATE TABLE `tu_life_packet` (
  `packet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `life_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `packet_num` int(11) DEFAULT '0' COMMENT '红包数量',
  `packet_money` int(11) DEFAULT '0' COMMENT '单个红包多少钱',
  `packet_total_money` int(11) DEFAULT '0' COMMENT '红包总金额',
  `packet_surplus_money` int(11) DEFAULT '0' COMMENT '红包剩余用于退款',
  `packet_sold_num` int(11) DEFAULT '0' COMMENT '已领红包数量',
  `packet_is_command` tinyint(1) DEFAULT '0' COMMENT '是否口令',
  `packet_command` varchar(32) DEFAULT NULL COMMENT '口令内容',
  `status` int(11) DEFAULT '0' COMMENT '1正常,3退款中，4已退款，8已完结',
  `closed` tinyint(1) DEFAULT '0' COMMENT '关闭',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`packet_id`) USING BTREE,
  UNIQUE KEY `life_id` (`life_id`,`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_packet` */

/*Table structure for table `tu_life_packet_logs` */

DROP TABLE IF EXISTS `tu_life_packet_logs`;

CREATE TABLE `tu_life_packet_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `life_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT NULL COMMENT '红包分类',
  `user_id` int(11) DEFAULT '0',
  `money` int(11) DEFAULT '0' COMMENT '金额',
  `intro` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_packet_logs` */

/*Table structure for table `tu_life_photos` */

DROP TABLE IF EXISTS `tu_life_photos`;

CREATE TABLE `tu_life_photos` (
  `pic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `life_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_photos` */

/*Table structure for table `tu_life_report` */

DROP TABLE IF EXISTS `tu_life_report`;

CREATE TABLE `tu_life_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(6) DEFAULT NULL,
  `life_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL COMMENT '举报图片单张',
  `type` int(3) DEFAULT NULL,
  `content` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_report` */

/*Table structure for table `tu_life_share_logs` */

DROP TABLE IF EXISTS `tu_life_share_logs`;

CREATE TABLE `tu_life_share_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `life_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT NULL COMMENT '扩展分类',
  `user_id` int(11) DEFAULT '0',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `intro` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_share_logs` */

/*Table structure for table `tu_life_subscribe` */

DROP TABLE IF EXISTS `tu_life_subscribe`;

CREATE TABLE `tu_life_subscribe` (
  `subscribe_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `city_id` int(10) DEFAULT NULL,
  `area_id` int(10) DEFAULT NULL,
  `business_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL COMMENT '类目ID',
  `create_time` int(11) DEFAULT NULL COMMENT '发表时间',
  `create_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`subscribe_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_life_subscribe` */

/*Table structure for table `tu_links` */

DROP TABLE IF EXISTS `tu_links`;

CREATE TABLE `tu_links` (
  `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL COMMENT '城市ID',
  `link_name` varchar(32) DEFAULT NULL COMMENT '网站名称',
  `link_url` varchar(128) DEFAULT NULL COMMENT '网站连接',
  `link_email` varchar(64) DEFAULT NULL COMMENT '申请人电子邮箱',
  `link_intro` varchar(256) DEFAULT NULL COMMENT '申请人网站介绍',
  `colsed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1代表删除',
  `orderby` tinyint(3) DEFAULT '100' COMMENT '排序',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  `create_time` int(11) NOT NULL COMMENT '申请时间',
  `create_ip` varchar(32) NOT NULL COMMENT '申请IP',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_links` */

insert  into `tu_links`(`link_id`,`city_id`,`link_name`,`link_url`,`link_email`,`link_intro`,`colsed`,`orderby`,`audit`,`create_time`,`create_ip`) values (1,32,'BAOCMS','http://zhaopin.weixinguanfang.com','','',0,0,1,1526973411,'111.37.71.184');

/*Table structure for table `tu_live` */

DROP TABLE IF EXISTS `tu_live`;

CREATE TABLE `tu_live` (
  `live_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0' COMMENT '所属企业',
  `cate_id` int(11) DEFAULT NULL COMMENT '类别',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '商品ID',
  `name` varchar(255) DEFAULT NULL COMMENT '直播名称',
  `intro` varchar(256) DEFAULT NULL COMMENT '介绍',
  `photo` varchar(256) DEFAULT NULL COMMENT '图片',
  `url` varchar(256) DEFAULT NULL COMMENT '直播链接',
  `lng` varchar(255) DEFAULT NULL COMMENT '直播位置',
  `lat` varchar(255) DEFAULT NULL,
  `views` int(11) DEFAULT '0' COMMENT '播放次数',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`live_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='直播';

/*Data for the table `tu_live` */

insert  into `tu_live`(`live_id`,`shop_id`,`cate_id`,`goods_id`,`name`,`intro`,`photo`,`url`,`lng`,`lat`,`views`,`create_time`,`create_ip`) values (1,1,69,NULL,'我皮任我皮[]~(~▽~)','我皮任我皮[]~(~▽~)','/attachs/2018/05/30/thumb_5b0e162dbb4c1.jpg','staticlive.douyucdn.cn/common/share/play.swf?room_id=1164160','116.384929','39.977747',9,1527650307,'');

/*Table structure for table `tu_lock` */

DROP TABLE IF EXISTS `tu_lock`;

CREATE TABLE `tu_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `t` char(8) DEFAULT '0' COMMENT 'UID 操作分钟级别锁',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`t`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_lock` */

/*Table structure for table `tu_logistics` */

DROP TABLE IF EXISTS `tu_logistics`;

CREATE TABLE `tu_logistics` (
  `express_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `express_com` varchar(255) DEFAULT NULL,
  `express_name` varchar(11) DEFAULT NULL,
  `orderby` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`express_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_logistics` */

/*Table structure for table `tu_market` */

DROP TABLE IF EXISTS `tu_market`;

CREATE TABLE `tu_market` (
  `shop_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(64) DEFAULT NULL COMMENT '冗余方便查询',
  `city_id` int(11) unsigned DEFAULT NULL,
  `area_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT '0',
  `cate` varchar(64) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0' COMMENT '1 代表营业中',
  `is_coupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不支持，1支持',
  `busihour` varchar(100) NOT NULL,
  `is_radius` int(11) DEFAULT NULL,
  `given_distribution` int(11) DEFAULT NULL,
  `is_print_deliver` tinyint(1) NOT NULL DEFAULT '0',
  `is_voice` tinyint(1) NOT NULL DEFAULT '0',
  `is_refresh` tinyint(1) NOT NULL DEFAULT '0',
  `is_refresh_second` int(3) DEFAULT NULL,
  `tags` varchar(128) DEFAULT NULL,
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '1代表支持在线付款',
  `is_daofu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不支持，1支持',
  `is_fan` tinyint(1) DEFAULT '0' COMMENT '1 代表返现',
  `fan_money` int(10) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `full_money` int(10) DEFAULT '0' COMMENT '满多少MONEY 立刻减几元',
  `new_money` int(10) DEFAULT '0' COMMENT '减多少钱  比如说 满20减5元 那么  每增加10块钱 将额外减一元',
  `is_full` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启满减',
  `order_price_full_1` int(11) DEFAULT NULL COMMENT '满多少1',
  `order_price_reduce_1` int(11) DEFAULT NULL COMMENT '减多少1',
  `order_price_full_2` int(11) DEFAULT NULL COMMENT '满多少2',
  `order_price_reduce_2` int(11) DEFAULT NULL COMMENT '减多少2',
  `logistics` int(10) DEFAULT '0' COMMENT '0代表不收取配送费 填写其他的将代表收取',
  `logistics_full` int(11) DEFAULT NULL COMMENT '满多少金额免配送费',
  `since_money` int(10) DEFAULT NULL COMMENT '起送价',
  `sold_num` int(10) DEFAULT NULL,
  `month_num` int(10) DEFAULT NULL,
  `intro` varchar(1024) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100' COMMENT '数字越小排序越高',
  `distribution` tinyint(3) DEFAULT '30' COMMENT '分钟  配送时间',
  `audit` tinyint(3) unsigned DEFAULT '0' COMMENT '0审核中1成功入驻2未通过',
  `rate` int(11) DEFAULT '60' COMMENT '费率 每个商品的结算价格',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_market` */

/*Table structure for table `tu_market_cate` */

DROP TABLE IF EXISTS `tu_market_cate`;

CREATE TABLE `tu_market_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`cate_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_market_cate` */

insert  into `tu_market_cate`(`cate_id`,`shop_id`,`cate_name`,`num`,`closed`) values (66,1,'菜市场分类1',1,0),(67,2,'油粮米面',1,0),(68,13,'分类测试',1,0),(69,13,'蔬菜',2,0),(70,13,'水果类',0,1),(71,13,'肉类',1,0),(72,13,'水果类',2,0),(73,13,'海鲜类',1,0),(74,13,'干菜类',1,0),(75,13,'调料类',1,0),(76,13,'凉菜类',0,0),(77,13,'其他类',1,0),(78,1,'ty',1,0);

/*Table structure for table `tu_market_dianping` */

DROP TABLE IF EXISTS `tu_market_dianping`;

CREATE TABLE `tu_market_dianping` (
  `dianping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `speed` tinyint(3) unsigned DEFAULT '0',
  `cost` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `dianping_id` (`dianping_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_market_dianping` */

/*Table structure for table `tu_market_dianping_pics` */

DROP TABLE IF EXISTS `tu_market_dianping_pics`;

CREATE TABLE `tu_market_dianping_pics` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE,
  KEY `dianping_id` (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_market_dianping_pics` */

/*Table structure for table `tu_market_order` */

DROP TABLE IF EXISTS `tu_market_order`;

CREATE TABLE `tu_market_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `addr_id` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT '0',
  `logistics` int(11) DEFAULT '0',
  `need_pay` int(11) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `new_money` int(11) DEFAULT '0',
  `logistics_full_money` int(11) DEFAULT '0' COMMENT '满多少配送费立减费用',
  `download_coupon_id` int(11) DEFAULT NULL COMMENT '使用下载优惠劵ID',
  `reduce_coupun_money` int(11) DEFAULT NULL COMMENT '使用优惠劵减去费用',
  `full_reduce_price` int(11) NOT NULL DEFAULT '0' COMMENT '满减费用',
  `tableware_price` int(11) DEFAULT '0' COMMENT '餐具费用',
  `settlement_price` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0' COMMENT '1等待处理  2代表已经确认  8代表配送完成',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '0是货到付款，1是在线支付',
  `is_daofu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为在线支付，1为货到付款',
  `is_store` tinyint(1) NOT NULL DEFAULT '0',
  `is_profit` tinyint(1) DEFAULT '0' COMMENT '1代表已分销，0未分销',
  `is_print` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `pay_time` int(11) DEFAULT NULL COMMENT '外卖付款时间',
  `refund_time` int(11) DEFAULT NULL COMMENT '退款时间',
  `orders_time` int(11) DEFAULT NULL COMMENT '接单时间',
  `end_time` int(11) DEFAULT NULL COMMENT '订单完成时间',
  `create_ip` varchar(15) DEFAULT NULL,
  `audit_time` int(11) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `month` int(11) DEFAULT '201501',
  `message` varchar(100) DEFAULT NULL,
  `is_dianping` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_market_order` */

/*Table structure for table `tu_market_order_product` */

DROP TABLE IF EXISTS `tu_market_order_product`;

CREATE TABLE `tu_market_order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `user_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `shop_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `city_id` int(11) DEFAULT NULL COMMENT '城市ID',
  `area_id` int(11) DEFAULT NULL COMMENT '地区ID',
  `num` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT NULL,
  `tableware_price` int(11) DEFAULT '0' COMMENT '订单菜单表新增餐具费',
  `month` int(11) DEFAULT NULL,
  `create_time` varchar(15) DEFAULT NULL COMMENT '\r\n\r\n创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_market_order_product` */

/*Table structure for table `tu_market_product` */

DROP TABLE IF EXISTS `tu_market_product`;

CREATE TABLE `tu_market_product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(32) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `cost_price` int(11) DEFAULT NULL COMMENT '原价',
  `price` int(11) DEFAULT NULL,
  `tableware_price` int(11) DEFAULT '0' COMMENT '餐具费',
  `settlement_price` int(11) unsigned DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_tuijian` tinyint(1) DEFAULT '0',
  `sold_num` int(11) DEFAULT '0',
  `month_num` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_market_product` */

/*Table structure for table `tu_market_reminder` */

DROP TABLE IF EXISTS `tu_market_reminder`;

CREATE TABLE `tu_market_reminder` (
  `reminder_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL COMMENT '外卖催单企业ID',
  `create_time` int(11) DEFAULT NULL COMMENT '外卖催单时间',
  `create_ip` varchar(32) DEFAULT NULL COMMENT '外卖催单IP',
  PRIMARY KEY (`reminder_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_market_reminder` */

/*Table structure for table `tu_menu` */

DROP TABLE IF EXISTS `tu_menu`;

CREATE TABLE `tu_menu` (
  `menu_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(32) DEFAULT NULL,
  `menu_action` varchar(64) DEFAULT NULL,
  `parent_id` smallint(5) DEFAULT '0',
  `orderby` tinyint(3) unsigned DEFAULT '100' COMMENT '1排序第一',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '0代表不直接显示',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1030 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_menu` */

insert  into `tu_menu`(`menu_id`,`menu_name`,`menu_action`,`parent_id`,`orderby`,`is_show`) values (1,'系统','',0,1,1),(2,'设置','',0,2,1),(3,'企业','',0,5,1),(4,'会员','',0,3,1),(5,'商城','',0,7,1),(203,'支付方式','payment/index',202,1,1),(7,'功能','',0,14,0),(8,'运营','',0,21,0),(9,'管理员管理','',1,2,1),(11,'后台设置','',1,1,1),(12,'菜单列表','menu/index',11,2,1),(13,'新增菜单','menu/create',11,3,0),(14,'编辑菜单','menu/edit',11,1,0),(15,'删除菜单','menu/delete',11,3,0),(16,'更新菜单','menu/update',11,4,0),(17,'批量菜单','menu/action',11,1,0),(18,'角色管理','role/index',9,2,1),(25,'新增角色','role/create',9,7,0),(26,'编辑角色','role/edit',9,1,0),(27,'删除角色','role/delete',9,2,0),(28,'角色授权','role/auth',9,8,0),(29,'管理员管理','admin/index',9,1,1),(30,'新增管理员','admin/create',9,2,0),(31,'编辑管理员','admin/edit',9,2,0),(32,'删除管理员','admin/delete',9,4,0),(33,'会员管理','',4,1,1),(34,'会员管理','user/index',33,1,1),(35,'新增会员','user/create',33,100,0),(36,'编辑会员','user/edit',33,100,0),(37,'删除会员','user/delete',33,100,0),(60,'企业预约','',3,8,0),(39,'缓存管理','',8,9,1),(40,'清空缓存','clean/cache',39,100,1),(41,'审核会员','user/audit',33,100,0),(42,'企业分类','',3,1,1),(43,'企业管理','',3,3,1),(44,'分类列表','shopcate/index',42,1,1),(45,'新增分类','shopcate/create',42,2,0),(46,'编辑分类','shopcate/edit',42,3,0),(47,'删除分类','shopcate/delete',42,4,0),(48,'更新排序','shopcate/update',42,5,0),(49,'基础设置','',2,1,1),(50,'区域设置','',2,3,1),(51,'区域管理','area/index',50,3,1),(52,'新增区域','area/create',50,100,0),(53,'编辑区域','area/edit',50,100,0),(54,'删除区域','area/delete',50,100,0),(55,'商圈管理','business/index',50,100,0),(56,'新增商圈','business/create',50,100,0),(57,'编辑商圈','business/edit',50,100,0),(58,'删除商圈','business/delete',50,100,0),(277,'审核企业','shop/audit',43,100,0),(61,'文章内容','',915,1,1),(62,'抢购管理','',896,6,1),(65,'友情链接','',8,8,0),(66,'广告管理','',8,1,1),(202,'支付设置','',2,5,1),(215,'微信','',0,17,1),(70,'友情链接','links/index',65,100,1),(71,'添加友情','links/create',65,100,0),(72,'修改友情','links/edit',65,100,0),(73,'删除友情','links/delete',65,100,0),(278,'积分兑换','integralexchange/index',234,2,1),(279,'设为已完成兑换','integralexchange/audit',234,2,0),(280,'设为热门分类','shopcate/hots',42,6,0),(80,'站点设置','setting/site',49,1,1),(81,'附件设置','setting/attachs',49,4,0),(270,'选择分类','activitycate/select',244,100,0),(85,'企业列表','shop/index',43,2,1),(86,'新增企业','shop/create',43,100,0),(87,'修改企业','shop/edit',43,100,0),(88,'删除企业','shop/delete',43,100,0),(90,'异步选择会员','user/select',33,100,0),(91,'异步查询商圈','business/child',50,100,0),(95,'预定合作','shop/yuyue',43,100,0),(96,'企业新闻','shopnews/index',228,2,1),(97,'发布新闻','shopnews/create',228,1,1),(98,'修改新闻','shopnews/edit',228,3,0),(99,'删除新闻','shopnews/delete',228,4,0),(100,'审核新闻','shopnews/audit',228,5,0),(101,'企业异步查询','shop/select',43,100,0),(102,'企业图片','shoppic/index',43,4,1),(103,'删除图片','shoppic/delete',43,42,0),(104,'异步查询','articlecate/child',61,8,0),(105,'更新排序','articlecate/update',61,9,0),(106,'删除分类','articlecate/delete',61,10,0),(107,'编辑分类','articlecate/edit',61,11,0),(108,'新增分类','articlecate/create',61,12,0),(109,'分类列表','articlecate/index',61,1,1),(110,'文章列表','article/index',61,3,1),(111,'新增文章','article/create',61,2,1),(112,'编辑文章','article/edit',61,13,0),(113,'删除文章','article/delete',61,14,0),(114,'贴吧管理','',915,2,1),(115,'敏感词过滤','sensitive/index',49,5,0),(116,'新增敏感词','sensitive/create',49,6,0),(117,'编辑敏感词','sensitive/edit',49,7,0),(118,'删除敏感词','sensitive/delete',49,8,0),(509,'会员提现','',4,3,1),(125,'抢购列表','tuan/index',62,1,1),(126,'新增抢购','tuan/create',62,14,0),(127,'编辑抢购','tuan/edit',62,11,0),(128,'删除抢购','tuan/delete',62,12,0),(129,'审核抢购','tuan/audit',62,13,0),(130,'订单管理','tuanorder/index',62,20,1),(206,'支付日志','paymentlogs/index',202,4,1),(134,'优惠券','',7,4,1),(135,'优惠券管理','coupon/index',134,1,1),(136,'新增优惠券','coupon/create',134,2,0),(137,'编辑优惠券','coupon/edit',134,3,0),(138,'删除优惠券','coupon/delete',134,4,0),(139,'审核优惠券','coupon/audit',134,5,0),(140,'优惠券下载','coupondownload/index',134,6,1),(817,'酒店审核列表','hotel/noaudit',804,2,1),(816,'众筹订单列表','crowd/order',809,3,1),(156,'短信设置','setting/sms',49,9,1),(157,'邮件设置','setting/mail',49,10,0),(158,'模版管理','',2,6,0),(159,'短信宝模版','sms/index',158,3,1),(160,'新增短信模版','sms/create',158,12,0),(161,'编辑短信模版','sms/edit',158,13,0),(162,'关闭短信模版','sms/delete',158,14,0),(163,'邮件模版','email/index',158,21,1),(164,'新增邮件模版','email/create',158,22,0),(165,'编辑邮件模版','email/edit',158,23,0),(166,'关闭邮件模版','email/delete',158,24,0),(167,'SEO模版','seo/index',158,31,1),(168,'新增SEO模版','seo/create',158,100,0),(169,'编辑SEO模版','seo/edit',158,100,0),(170,'删除SEO模版','seo/delete',158,100,0),(171,'网站风格','template/index',158,40,1),(172,'安装风格','template/install',158,42,0),(173,'卸载风格','template/uninstall',158,41,0),(174,'配置风格','template/setting',158,43,0),(175,'批量开启短信','sms/audit',158,15,0),(176,'开启邮件模版','email/audit',158,25,0),(177,'企业点评','shopdianping/index',230,22,1),(178,'发布点评','shopdianping/create',230,21,1),(179,'编辑点评','shopdianping/edit',230,23,0),(180,'删除点评','shopdianping/delete',230,24,0),(181,'企业预约','shopyuyue/index',60,31,1),(182,'新增预约','shopyuyue/create',60,32,0),(183,'编辑预约','shopyuyue/edit',60,33,0),(184,'删除预约','shopyuyue/delete',60,34,0),(185,'系统文章','systemcontent/index',61,7,1),(186,'新增系统文章','systemcontent/create',61,16,0),(187,'编辑系统文章','systemcontent/edit',61,16,0),(188,'删除系统文章','systemcontent/delete',61,17,0),(189,'广告位置','adsite/index',66,2,1),(494,'人才招聘','',335,10,1),(495,'人才招聘','work/index',494,1,1),(193,'广告管理','ad/index',66,100,0),(194,'新增广告','ad/create',66,100,0),(195,'编辑广告','ad/edit',66,100,0),(196,'删除广告','ad/delete',66,100,0),(197,'设为默认模版','template/df',158,44,0),(198,'新增挂件','template/add',158,45,0),(199,'编辑挂件','template/edit',158,46,0),(200,'删除挂件','template/delete',158,47,0),(201,'更新模版','template/update',158,48,0),(204,'安装支付','payment/install',202,2,0),(205,'卸载支付','payment/uninstall',202,3,0),(259,'积分设置','setting/integral',49,11,0),(441,'资金记录','shopmoney/index',440,1,1),(209,'抢购券管理','tuancode/index',62,33,1),(210,'删除抢购券','tuancode/delete',62,34,0),(211,'会员积分日志','userintegrallogs/index',291,40,0),(212,'增加积分','user/integral',33,100,0),(213,'商户资金日志','usergoldlogs/index',291,42,0),(214,'增加金块','user/gold',33,100,0),(216,'微信配置','',215,1,1),(217,'企业微信','',215,4,0),(218,'微信配置','setting/weixin',216,1,1),(219,'微信关键字','weixinkeyword/index',216,2,1),(220,'新增关键字','weixinkeyword/create',216,3,0),(221,'编辑关键字','weixinkeyword/edit',216,4,0),(222,'删除关键字','weixinkeyword/delete',216,5,0),(993,'工作列表','goods/index',231,1,1),(228,'企业新闻','',3,9,0),(230,'企业点评','',3,10,0),(231,'工作列表','',5,4,1),(797,'家政服务列表','appoint/index',796,1,1),(234,'积分商城','',876,5,1),(235,'商品列表','integralgoods/index',234,1,1),(236,'新增商品','integralgoods/create',234,1,0),(237,'修改商品','integralgoods/edit',234,1,0),(238,'删除商品','integralgoods/delete',234,1,0),(239,'审核商品','integralgoods/audit',234,1,0),(240,'会员等级','userrank/index',33,2,1),(241,'新增等级','userrank/create',33,100,0),(242,'编辑等级','userrank/edit',33,100,0),(243,'删除等级','userrank/delete',33,100,0),(244,'活动管理','',7,5,1),(245,'活动列表','activity/index',244,2,1),(246,'活动添加','activity/create',244,100,0),(247,'活动审核','activity/audit',244,100,0),(248,'活动编辑','activity/edit',244,100,0),(249,'活动删除','activity/delete',244,100,0),(262,'新增地址','useraddr/create',260,100,0),(260,'会员收货地址','',4,4,0),(261,'外卖收货地址','useraddr/index',260,1,1),(255,'分类列表','activitycate/index',244,1,1),(256,'添加分类','activitycate/create',244,100,0),(257,'编辑分类','activitycate/edit',244,100,0),(258,'删除分类','activitycate/delete',244,100,0),(263,'编辑地址','useraddr/edit',260,100,0),(264,'删除地址','useraddr/delete',260,100,0),(265,'工作类别','goodscate/index',897,1,1),(266,'新增分类','goodscate/create',231,100,0),(267,'编辑分类','goodscate/edit',231,100,0),(268,'更新分类','goodscate/update',231,100,0),(269,'删除分类','goodscate/delete',231,100,0),(271,'添加子分类','activitycate/child',244,100,0),(274,'微信消息列表','weixinmsg/index',932,11,1),(275,'第三方登录','setting/connect',33,10,0),(281,'热门商圈','business/hots',50,100,0),(903,'微店列表','weidian/index',900,2,1),(296,'抢购券退款','tuancode/refund',62,34,1),(289,'团购金额','tongji/money',282,12,1),(290,'威望设置','setting/prestige',49,12,0),(291,'会员日志','',4,2,1),(292,'会员余额日志','usermoneylogs/index',291,43,1),(297,'抢购券退款操作','tuancode/refunding',62,35,0),(298,'抢购券过期','tuancode/overdue',62,35,1),(299,'抢购券过期退款操作','tuancode/overdueing',62,35,0),(490,'生成卡密','usercard/create',488,2,0),(303,'站内信','',8,3,1),(305,'新增发现','found/create',303,2,0),(306,'编辑发现','found/edit',303,3,0),(307,'删除发现','found/delete',303,4,0),(308,'审核发现','found/audit',303,5,0),(309,'消息管理','msg/index',303,6,1),(310,'新增消息','msg/create',303,7,0),(311,'编辑消息','msg/edit',303,8,0),(312,'删除消息','msg/delete',303,9,0),(313,'报名管理','activitysign/index',244,3,1),(314,'商品订单','',5,5,0),(315,'订单列表','order/index',314,1,1),(316,'等待捡货','order/wait',314,2,0),(317,'捡货单管理','order/picks',314,4,0),(318,'发货管理','order/delivery',314,5,0),(319,'加入捡货单','order/pick',314,100,0),(320,'清空拣货单','order/clean',314,100,0),(321,'创建捡货单','order/create',314,100,0),(322,'捡货单详情','order/pickdetail',314,100,0),(324,'打印配送单','order/send',314,100,0),(325,'订单发货','order/distribution',314,100,0),(326,'增加余额','user/money',33,100,0),(327,'新增企业资金','shopmoney/create',43,100,0),(328,'待审核企业','shop/apply',43,1,1),(814,'帖子列表','threadpost/index',114,3,1),(813,'贴吧分类','threadcate/index',114,1,1),(812,'贴吧管理','thread/index',114,5,1),(335,'频道','',0,15,0),(336,'自定义菜单','setting/weixinmenu',216,6,1),(337,'删除微信消息','weixinmsg/delete',216,12,0),(338,'信息列表','',916,3,1),(339,'分类管理','lifecate/index',943,1,1),(340,'新增分类','lifecate/create',943,100,0),(341,'编辑分类','lifecate/edit',943,100,0),(342,'删除分类','lifecate/delete',943,100,0),(343,'属性设置','lifecate/setting',943,100,0),(344,'抢购分类','',896,5,1),(345,'分类列表','tuancate/index',344,1,1),(346,'添加分类','tuancate/create',344,100,0),(347,'添加子分类','tuancate/child',344,100,0),(348,'删除分类','tuancate/delete',344,100,0),(349,'编辑分类','tuancate/edit',344,100,0),(350,'选择分类','tuancate/select',344,100,0),(351,'删除属性','lifecate/delattr',338,100,0),(352,'信息列表','life/index',338,11,1),(353,'新增信息','life/create',338,100,0),(354,'编辑信息','life/edit',338,100,0),(355,'删除信息','life/delete',338,100,0),(356,'审核信息','life/audit',338,100,0),(357,'分类异步查询','lifecate/ajax',338,100,0),(358,'抢购点评','',896,7,1),(359,'抢购点评','tuandianping/index',358,2,1),(360,'发布点评','tuandianping/create',358,1,1),(361,'删除点评','tuandianping/delete',358,100,1),(362,'编辑点评','tuandianping/edit',358,100,1),(850,'会员回收站','user/recycle',33,4,0),(517,'新增站点','city/create',50,100,0),(519,'删除站点','city/delete',50,100,0),(518,'编辑站点','city/edit',50,100,0),(375,'查看结果','vote/result',364,2,0),(527,'微信模板消息','weixintmpl/index',932,13,1),(387,'关键字列表','shopweixinkeyword/index',217,100,1),(388,'新增关键字','shopweixinkeyword/create',217,100,0),(389,'编辑关键字','shopweixinkeyword/edit',217,100,0),(390,'删除关键字','shopweixinkeyword/delete',217,100,0),(391,'添加群发消息','weixinkeyword/mass',933,2,1),(392,'货到付款捡货','order/wait2',314,3,0),(408,'关键字管理','',8,7,1),(410,'关键字列表','keyword/index',408,1,1),(411,'添加关键字','keyword/create',408,100,0),(412,'编辑关键字','keyword/edit',408,100,0),(413,'删除关键字','keyword/delete',408,100,0),(418,'设置热门分类','life/hots',338,100,0),(416,'外卖企业列表','',901,1,1),(516,'城市站点','city/index',50,2,1),(419,'举报信息','lifereport/index',944,20,1),(818,'农家乐列表',NULL,335,4,1),(421,'企业列表','ele/index',416,1,1),(422,'新增企业','ele/create',416,100,0),(423,'编辑企业','ele/edit',416,100,0),(424,'删除企业','ele/delete',416,100,0),(425,'打样管理','ele/opened',416,100,0),(489,'会员卡管理','usercard/index',488,1,1),(780,'分销设置','setting/profit',731,5,0),(488,'会员卡管理','',4,6,0),(430,'外卖菜单管理','eleproduct/index',911,2,1),(431,'新增菜单','eleproduct/create',911,100,0),(432,'编辑菜单','eleproduct/edit',911,100,0),(433,'删除菜单','eleproduct/delete',911,100,0),(434,'进入企业中心','shop/login',43,100,0),(435,'卡密管理','rechargecard/index',202,5,1),(436,'添加充值卡','rechargecard/create',202,100,0),(437,'删除充值卡','rechargecard/delete',202,100,0),(438,'餐饮订单管理','eleorder/index',912,3,1),(439,'删除订单','eleorder/delete',912,100,0),(440,'结算管理','',8,5,1),(442,'对账单管理','settlement/index',440,2,0),(443,'新增对账单','settlement/create',440,3,0),(444,'对账单详情','settlementshop/index',440,4,0),(794,'家政分类',NULL,793,1,1),(793,'家政',NULL,0,11,0),(792,'商品快递列表','logistics/index',899,5,1),(791,'商品类型','goodstype/index',898,4,1),(790,'商品规格','goodsattr/index',898,3,1),(789,'商品属性','goodstype/goodsAttributeList',898,2,1),(788,'运费模板列表','shopkuaidi/index',902,1,1),(786,'退款订单','goodsrefund/index',314,3,1),(785,'优惠买单分成','profit/breaks',636,3,1),(784,'买单订单列表','breaks/index',782,2,1),(643,'跑腿管理','',335,8,1),(783,'优惠企业列表','shopyouhui/index',782,1,1),(782,'企业优惠买单',NULL,3,7,0),(644,'跑腿订单列表','running/index',643,100,1),(796,'家政列表',NULL,793,2,1),(795,'家政分类','appointcate/index',794,1,1),(491,'会员卡删除','usercard/delete',488,3,0),(492,'导入会员卡','usercard/import',488,4,0),(493,'确定导入','usercard/importok',488,5,0),(496,'审核招聘','work/audit',494,2,0),(497,'删除招聘','work/delete',494,3,0),(585,'数据库备份','database/index',534,2,1),(510,'会员提现管理','usercash/index',509,1,1),(904,'企业认领',NULL,3,5,0),(521,'开通订座','shop/ding',43,100,0),(515,'微店分类','weidiancate/index',900,1,1),(772,'拼车管理',NULL,335,7,1),(523,'配送员管理','',901,4,1),(524,'配送员列表','delivery/index',523,2,1),(525,'添加配送员','delivery/create',523,100,0),(526,'配送记录','delivery/lists',918,100,0),(190,'添加广告位','adsite/create',66,4,1),(528,'UC整合','setting/ucenter',33,100,0),(530,'缴费管理','',487,7,1),(532,'缴费类型','bill/billtype',530,1,1),(533,'缴费订单','bill/billorder',530,2,1),(534,'系统维护','',1,3,1),(536,'销售流水','',8,6,0),(537,'资金记录','shopmoney/index',536,1,1),(538,'月订单汇总','shopmoney/tjmonth',536,2,1),(539,'日订单汇总','shopmoney/tjday',536,3,1),(540,'年订单汇总','shopmoney/tjyear',536,4,1),(913,'外卖评价管理',NULL,901,6,1),(822,'跑腿设置','setting/running',731,12,0),(555,'小区内容管理','',914,5,1),(557,'新增小区','community/create',555,100,0),(558,'编辑小区','community/edit',555,100,0),(559,'删除小区','community/delete',555,100,0),(562,'智慧乡村','',980,2,1),(563,'社区村镇管理','village/index',562,1,1),(564,'编辑','village/edit',562,100,0),(565,'通知以及活动管理','village/notice',562,100,0),(566,'工作人员管理','village/worker',562,100,0),(567,'社区村评论删除','village/bbs_replys_delete',562,100,0),(568,'社区村帖子删除','village/bbs_delete',562,100,0),(569,'社区村帖子查看','village/bbs_view',562,100,0),(570,'社区村意见删除','village/reply_delete',562,100,0),(571,'社区村工作人员删除','village/worker_delete',562,100,0),(572,'社区村添加','village/create',562,100,0),(573,'社区村工作人员编辑','village/worker_edit',562,100,0),(574,'社区村通知以及活动删除','village/notice_delete',562,100,0),(575,'社区村通知以及活动编','village/notice_edit',562,100,0),(576,'社区村通知以及活动新增','village/notice_create',562,100,0),(577,'删除','village/delete',562,100,0),(578,'帖子管理','village/bbs',562,100,0),(579,'意见管理','village/suggestion',562,100,0),(580,'社区村工作人员添加','village/worker_create',562,100,0),(581,'小区便民电话','convenientphone/index',555,7,1),(582,'添加便民电话','convenientphone/create',555,100,0),(583,'删除便民电话','convenientphone/delete',555,100,0),(584,'编辑便民电话','convenientphone/edit',555,100,0),(651,'商品点评管理','malldianping/index',650,2,1),(648,'预订预约','bookingyuyue/index',646,3,0),(650,'商品点评','',5,6,0),(590,'黄页系统','',7,6,1),(591,'包年词条','pois/word',590,100,1),(592,'黄页包年','pois/stick',590,100,1),(593,'黄页列表','pois/index',590,100,1),(594,'邻居聊天记录','message/index',555,6,1),(595,'推广金奖励','user/fzmoney',541,100,0),(596,'批准推广金奖励','user/fzmoneyyes',541,100,0),(597,'增加余额','user/money',541,100,0),(902,'商品运费模板',NULL,5,8,0),(820,'农家乐列表','farm/index',818,2,1),(741,'商户购买短信包设置','setting/sms_shop',731,6,0),(625,'文章回收站','article/recovery',61,6,1),(626,'文章回复','articlereply/index',61,5,1),(627,'企业回收站','shop/recovery',43,3,1),(905,'认领申请列表','shoprecognition/index',904,1,1),(914,'小区',NULL,0,10,0),(915,'文章',NULL,0,12,0),(819,'待审核农家乐','farm/noaudit',818,1,1),(956,'企业短信列表','smsshop/index',955,1,1),(955,'企业短信',NULL,3,12,1),(645,'外卖评价管理','eledianping/index',913,5,1),(646,'预订管理','',335,5,1),(647,'预订点评','bookingdianping/index',646,4,1),(652,'新增商品点评','malldianping/create',650,1,1),(861,'小区贴吧管理','communityposts/index',555,3,1),(746,'商品管理',NULL,745,2,1),(951,'配置管理','setting/profit',948,1,1),(950,'分销商管理',NULL,947,3,1),(949,'分销订单',NULL,947,2,1),(948,'分销配置',NULL,947,1,1),(946,'信息购买记录','life/buy',945,1,1),(945,'购买记录',NULL,916,4,1),(944,'举报管理',NULL,916,5,1),(943,'信息分类',NULL,916,2,1),(933,'群发消息',NULL,215,3,0),(932,'模板消息',NULL,215,2,0),(666,'一元云购','',335,9,1),(667,'云购商品列表','cloudgoods/index',666,1,1),(668,'添加商品','cloudgoods/create',666,100,0),(669,'编辑商品 ','cloudgoods/edit',666,100,0),(670,'删除商品 ','cloudgoods/delete',666,100,0),(671,'商城ajax分类','goodscate/child',231,100,0),(672,'消息详情','msg/detail',303,10,0),(673,'微店编辑','weidian/edit',43,100,0),(674,'微店删除','weidian/delete',43,100,0),(675,'异步查询分站全部','fenzhan/cab',50,100,0),(676,'异步查询分站地区','fenzhan/cityarea',50,100,0),(677,'企业图片审核','shoppic/audit',43,100,0),(678,'认领企业审核','shoprecognition/audit',43,100,0),(679,'认领企业编辑','shoprecognition/edit',43,100,0),(680,'认领企业删除','shoprecognition/delete',43,100,0),(681,'商品点评编辑','malldianping/edit',650,100,0),(682,'商品点评删除','malldianping/delete',650,100,0),(683,'抢购劵删除','tuancode/delete',62,100,0),(684,'文章回复编辑','articlereply/edit',61,20,0),(685,'文章回复删除','articlereply/delete',61,19,0),(686,'外卖评价编辑','eledianping/edit',416,100,0),(687,'外卖评价删除','eledianping/delete',416,100,0),(688,'预订点评编辑','bookingdianping/edit',646,100,0),(689,'预订点评删除','bookingdianping/delete',646,100,0),(690,'预订预约删除','bookingyuyue/delete',646,100,0),(691,'跑腿编辑','running/edit',643,100,0),(692,'跑腿删除','running/delete',643,100,0),(693,'菜单删除','leproduct/delete',416,100,0),(694,'分站','',0,18,0),(695,'分站列表','',694,1,1),(697,'分站列表','fenzhancity/index',695,1,1),(912,'外卖订单列表',NULL,901,3,1),(704,'等待认证企业删除','audit/delete',43,100,0),(705,'企业认证审核','audit/audit',43,100,0),(706,'企业资质认证编辑','audit/edit',43,100,0),(711,'推送管理','',8,4,1),(715,'商户提现管理','usercash/gold',509,2,0),(716,'分站财务',NULL,694,3,1),(717,'分站企业资金记录','fenzhanshopmoney/index',716,1,1),(724,'推送管理','push/index',711,2,1),(721,'分站企业提现',NULL,694,2,1),(722,'分站商户提现','fenzhanshopcash/index',721,1,1),(723,'大于短信模板','dayu/index',158,1,1),(725,'家政点评编辑','lifeservicedianping/edit',498,100,0),(726,'家政点评删除','lifeservicedianping/delete',498,100,0),(727,'家政点评新增','lifeservicedianping/create',498,100,0),(728,'外卖评价增加','eledianping/create',416,100,0),(729,'文章审核','article/audit',61,18,0),(744,'商户短信增加','smsshop/create',742,2,1),(731,'常用设置',NULL,2,2,1),(732,'站点功能开关','setting/operation',731,2,0),(733,'网站导航管理','navigation/index',731,3,1),(734,'登录与注册','setting/register',731,4,1),(735,'分享设置','setting/share',731,11,0),(736,'模板功能配置','setting/other',731,10,0),(737,'点评管理','setting/mobile',731,9,0),(738,'充值/提现/转账管理','setting/cash',731,8,1),(739,'采集管理（新）','setting/collects',731,7,0),(740,'常用功能设置','setting/config',731,1,0),(942,'商城收货地址','address/index',260,2,1),(941,'店员列表','worker/index',940,1,1),(940,'企业店员管理',NULL,3,11,0),(939,'推手等级折扣日志','backers/discount',935,4,1),(938,'推手推荐分成日志','backers/reward',935,3,1),(937,'推手列表','backers/index',935,2,1),(936,'推手设置','setting/backers',935,1,1),(935,'推手管理',NULL,947,4,1),(934,'推手设置','setting/backers',731,19,0),(767,'抢购推荐置顶','tuantop/index',66,7,1),(953,'分销商列表','profit/user',950,1,1),(952,'分销订单','profit/order',949,1,1),(768,'分站企业财务统计','fenzhanshopbalance/index',716,2,1),(821,'待审核酒店列表','hotel/noaudit',802,2,1),(773,'拼车列表','pinche/index',772,2,1),(775,'图片上传设置',NULL,2,4,1),(776,'七牛云配置','upset/index',775,1,1),(777,'分类信息订阅',NULL,916,6,1),(778,'订阅l列表','life/subscribe',777,1,1),(947,'分销',NULL,0,16,0),(781,'企业列表','booking/index',646,1,1),(798,'家政订单',NULL,793,4,1),(799,'家政点评',NULL,793,5,1),(800,'家政评价列表','appointdianping/index',799,1,1),(801,'家政订单列表','appointorder/index',798,1,1),(802,'酒店管理',NULL,335,3,1),(803,'酒店品牌','hotelbrand/index',802,1,1),(804,'酒店列表','hotel/index',802,3,1),(805,'品牌列表','hotelbrand/index',803,1,1),(806,'酒店列表','hotel/index',804,1,1),(807,'订单列表','booking/order',646,3,1),(808,'待审核企业','booking/noaudit',646,2,1),(809,'轻松筹',NULL,335,6,1),(810,'众筹列表','crowd/index',809,2,1),(811,'众筹分类','crowdcate/index',809,1,1),(823,'大于短信发送记录','dayusms/index',158,2,1),(824,'短信宝发送记录','smsbao/index',158,4,1),(834,'家政设置','setting/appoint',731,15,0),(828,'支付设置','setting/pay',731,13,0),(829,'小区设置','setting/community',49,13,0),(830,'小区设置','setting/community',731,14,0),(831,'企业等级管理',NULL,3,2,0),(832,'企业等级列表','shopgrade/index',831,1,1),(833,'等级购买列表','shopgradeorder/index',831,2,0),(835,'外卖设置','setting/ele',731,16,0),(836,'商城设置','setting/goods',731,17,0),(837,'五折卡设置','setting/zhe',731,18,0),(838,'文章打赏列表','article/donate',61,4,1),(839,'贴吧打赏列表','thread/donate',114,6,1),(840,'五折卡',NULL,7,3,1),(841,'五折卡企业列表','zhe/index',840,1,1),(842,'配送订单列表','delivery/order',918,2,1),(843,'配送员财务记录','delivery/finance',918,3,1),(844,'云购订单列表','cloudgoods/order',666,2,1),(845,'酒店订单列表','hotel/order',802,4,1),(846,'农家乐订单列表','farm/order',818,3,1),(847,'酒店点评列表','hotel/comment',802,5,1),(848,'农家乐点评列表','farm/comment',818,4,1),(860,'小区报修管理','feedback/index',555,2,1),(851,'会员绑定列表','user/binding',33,3,1),(852,'教育频道',NULL,335,3,1),(853,'待审核教育企业','edu/noaudit',852,2,1),(854,'教育企业列表','edu/index',852,3,1),(855,'教育订单列表','edu/order',852,4,1),(856,'教育点评列表','edu/comment',852,5,1),(857,'教育企业分类','edu/cate',852,1,1),(858,'五折卡订单','zhe/order',840,2,1),(859,'预约列表','zhe/yuyue',840,3,1),(863,'小区通知管理','communitynews/index',555,4,1),(864,'外卖催单记录','eleorder/reminder',912,4,1),(911,'外卖菜品管理',NULL,901,2,1),(868,'会员认证',NULL,4,5,1),(869,'会员认证列表','usersaux/index',868,2,1),(871,'添加企业资金记录','shopmoney/create',536,100,0),(872,'股权',NULL,0,13,0),(873,'股权管理',NULL,872,3,1),(874,'股权商品列表','stock/index',873,1,1),(875,'股权订单列表','stock/order',873,2,1),(876,'积分',NULL,0,4,0),(877,'积分配置',NULL,876,1,1),(878,'积分基础配置','setting/integral',877,1,1),(879,'积分库',NULL,876,2,1),(880,'积分库管理','integral/library',879,1,1),(881,'积分返还',NULL,876,3,1),(882,'积分返还列表','integral/restore',881,1,1),(883,'积分核销',NULL,876,4,1),(884,'积分核销列表','integral/cancel',883,1,1),(885,'积分日志',NULL,876,6,1),(886,'积分日志列表','userintegrallogs/index',885,1,1),(887,'管理架构层',NULL,872,2,1),(888,'队伍管理列表','stockteam/index',887,1,1),(889,'团队管理列表','stockjury/index',887,2,1),(895,'代理联动库','cityagent/index',50,1,0),(897,'工作分类',NULL,5,1,1),(896,'抢购',NULL,0,8,0),(898,'商品规格',NULL,5,2,0),(899,'商品快递公司',NULL,5,7,0),(900,'微店分类',NULL,5,3,0),(901,'外卖',NULL,0,6,0),(906,'待认领企业','shop/recognition',904,2,1),(907,'会员推荐企业',NULL,3,4,0),(908,'会员推荐企业列表','shop/guide',907,1,1),(909,'企业认证',NULL,3,6,0),(910,'企业资质认证','audit/index',909,1,1),(916,'信息',NULL,0,9,0),(917,'会员推荐分成列表','userguidelogs/index',907,2,1),(918,'外卖配送订单',NULL,901,5,1),(919,'代理',NULL,0,20,0),(920,'代理配置',NULL,919,1,1),(921,'代理地区联动',NULL,919,2,1),(922,'代理申请列表',NULL,919,3,1),(923,'代理城市管理',NULL,919,4,1),(924,'代理城市配置','setting/city',920,1,1),(925,'代理联动列表','cityagent/index',921,1,1),(926,'代理申请列表','agent/index',922,1,1),(927,'城市列表','city/index',923,1,1),(928,'区域列表','area/index',923,2,1),(929,'KTV管理',NULL,335,1,1),(930,'ktv企业列表','ktv/index',929,1,1),(931,'ktv订单列表','ktv/order',929,2,1),(957,'预约服务管理',NULL,335,2,1),(958,'预约服务订单','book/order',957,3,1),(959,'基本配置',NULL,916,1,1),(960,'基本配置','setting/life',959,1,1),(961,'企业设置','setting/shop',731,20,0),(962,'族谱图','user/tree',950,2,1),(964,'积分','user/integral',33,100,0),(965,'智慧乡村','setting/village',49,14,0),(966,'智能门禁',NULL,914,6,1),(967,'门禁列表','access/lists',966,1,1),(968,'小区设置',NULL,914,1,1),(969,'基本配置','setting/community',968,1,1),(970,'小区列表',NULL,914,2,1),(971,'小区列表','community/index',970,1,1),(972,'开门记录','access/open',966,2,1),(973,'业主管理',NULL,914,3,1),(974,'业主列表','community/owner',973,1,1),(975,'小区账单',NULL,914,4,1),(976,'账单列表','community/order',975,1,1),(977,'账单缴费日志','logs/index',975,2,1),(978,'群发列表','weixinmass/index',933,1,1),(979,'拼车设置','setting/pinche',772,1,1),(980,'乡村',NULL,0,19,0),(981,'智慧乡村配置',NULL,980,1,1),(982,'基础配置','setting/village',981,1,1),(983,'股权配置',NULL,872,1,1),(984,'股权基本配置','setting/stock',983,1,1),(986,'微店审核列表','weidian/index',43,100,0),(989,'添加商品','goods/create',231,100,0),(988,'订单改价记录','order/change',314,2,1),(990,'删除商品','goods/delete',231,100,0),(991,'编辑商品','goods/edit',231,100,0),(992,'审核商品','goods/audit',231,100,0),(994,'信息红包管理',NULL,916,7,1),(995,'信息红包创建记录','Lifepacket/index',994,1,1),(996,'信息红包领取记录','Lifepacket/logs',994,2,1),(997,'会员认证编辑','usersaux/edit',868,3,1),(998,'菜市场',NULL,7,1,1),(999,'便利店',NULL,7,2,1),(1000,'便利店基础配置','setting/store',999,1,1),(1001,'便利店企业列表','store/index',999,2,1),(1002,'便利店商品列表','storeproduct/index',999,3,1),(1003,'便利店订单列表','storeorder/index',999,4,1),(1004,'便利店点评管理','storedianping/index',999,5,1),(1005,'菜市场基础配置','setting/market',998,1,1),(1006,'菜市场企业列表','market/index',998,2,1),(1007,'菜市场商品列表','marketproduct/index',998,3,1),(1008,'菜市场订单管理','marketorder/index',998,5,1),(1009,'菜市场评价管理','marketdianping/index',998,6,1),(1010,'汽车品牌',NULL,4,7,0),(1011,'品牌管理','carbrand/index',1010,1,1),(1012,'菜市场销售记录','marketproduct/logs',998,4,1),(1013,'广告购买配置','setting/ad',66,1,1),(1014,'广告购买记录','adrecord/index',66,5,1),(1016,'信息分享记录',NULL,916,8,1),(1017,'微信分享信息日志','life/share',1016,1,1),(1022,'家政优惠卡',NULL,793,3,1),(1023,'家政优惠卡','appoint/card',1022,1,1),(1024,'家政优惠卡使用记录','appoint/logs',1022,2,1),(1025,'广告列表','ad/index',66,3,1),(1026,'广告点击扣费记录','adrecord/logs',66,6,1),(1027,'配送员点评','delivery/comment',523,4,1),(1028,'配送员点评标签','delivery/tag',523,3,1),(1029,'配送员基本配置','setting/delivery',523,1,1);

/*Table structure for table `tu_message` */

DROP TABLE IF EXISTS `tu_message`;

CREATE TABLE `tu_message` (
  `msg_id` int(15) NOT NULL AUTO_INCREMENT,
  `parent_id` int(15) NOT NULL DEFAULT '0',
  `send_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `read_time` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_message` */

/*Table structure for table `tu_msg` */

DROP TABLE IF EXISTS `tu_msg`;

CREATE TABLE `tu_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) DEFAULT NULL,
  `type` int(1) DEFAULT '0' COMMENT '分类',
  `city_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `community_id` int(10) DEFAULT NULL,
  `delivery_id` int(10) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL COMMENT '可以为空 如果为空',
  `rank_id` int(11) DEFAULT NULL COMMENT '等级ID',
  `grade_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `details` text,
  `views` int(11) NOT NULL DEFAULT '0',
  `is_push` int(1) DEFAULT '0' COMMENT '是否推送',
  `push_time` varchar(32) DEFAULT NULL COMMENT '推送时间',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`msg_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_msg` */

/*Table structure for table `tu_msg_read` */

DROP TABLE IF EXISTS `tu_msg_read`;

CREATE TABLE `tu_msg_read` (
  `read_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`read_id`) USING BTREE,
  UNIQUE KEY `msg_id` (`msg_id`,`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_msg_read` */

/*Table structure for table `tu_nav_cate` */

DROP TABLE IF EXISTS `tu_nav_cate`;

CREATE TABLE `tu_nav_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `photo` varchar(256) DEFAULT NULL COMMENT '图片',
  `url` varchar(256) DEFAULT NULL COMMENT '链接',
  `intro` varchar(128) NOT NULL COMMENT '分类简介',
  `orderby` tinyint(3) DEFAULT '100',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '1显示',
  `create_time` int(11) NOT NULL COMMENT '时间',
  `create_ip` varchar(15) NOT NULL COMMENT 'IP',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1代表删除',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_nav_cate` */

/*Table structure for table `tu_navigation` */

DROP TABLE IF EXISTS `tu_navigation`;

CREATE TABLE `tu_navigation` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(32) DEFAULT NULL,
  `ioc` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `url` varchar(60) DEFAULT NULL COMMENT 'url连接',
  `photo` varchar(80) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1代表手机底部导航，2代表手机首页导航，3代表电脑顶部导航，4代表电脑主导航，5代表电脑底部导航，6代表电脑会员中心导航',
  `colour` varchar(16) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `target` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `click` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nav_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_navigation` */

insert  into `tu_navigation`(`nav_id`,`nav_name`,`ioc`,`title`,`parent_id`,`orderby`,`url`,`photo`,`status`,`colour`,`closed`,`target`,`is_new`,`click`) values (39,'首页','','index',0,1,'/index/index.html','2015/12/23/567a228a043cf.jpg',4,'',1,0,0,959),(43,'贴吧','','thread',0,13,'/thread/index.html','',4,'',1,0,0,760),(46,'外卖','','ele',0,4,'/ele/index.html','',4,'',1,0,0,975),(48,'众筹','','crowd',0,8,'/crowd/index.html','',4,'',1,0,0,1074),(49,'拼购','','cloud',0,9,'/cloud/index.html','',4,'',1,0,1,841),(51,'家政','','appoint',0,10,'/appoint/index.html','',4,'',1,0,0,912),(52,'企业','','shop',0,7,'/shop/index.html','',4,'',1,0,0,1022),(53,'教育','icon-iconfontshuben','edu',0,17,'edu/course.html','http://images4.5maiche.cn/2016-07-28_57997ff02fa18.png',2,'bg-yellow',1,0,0,493),(54,'外卖','icon-waimai1','ele',0,6,'ele/index.html','http://images4.5maiche.cn/2016-11-08_5821e8890b9e1.png',2,'bg-gray',1,0,0,1548),(55,'购物','icon-gouwu','mall',0,10,'mall/index.html','http://images4.5maiche.cn/2016-07-28_5799801d11cec.png',2,'bg-yellow',1,0,0,1064),(56,'企业','icon-shangjia2','shop',0,7,'shop/index.html','http://images4.5maiche.cn/2016-07-28_5799802c01212.png',2,'bg-green',1,0,0,776),(57,'新版家政','icon-jiazhengfuwu','appoint',0,13,'appoint/index.html','http://images4.5maiche.cn/2016-07-28_57997fc778768.png',2,'bg-dot',1,0,0,813),(59,'众筹','icon-zhongchou1','crowd',0,20,'crowd/index.html','http://images4.5maiche.cn/2016-07-28_579980c4e70ae.png',2,'bg-dot',1,0,0,544),(61,'高薪工作','icon-fenleixinxi','life',0,9,'wap/mall/index.html','http://images4.5maiche.cn/2016-07-28_57998001139c4.png',2,'bg-sub',0,0,0,677),(62,'酒店','icon-jiudian2','hotels',0,8,'hotels/index.html','http://images4.5maiche.cn/2016-07-28_57997d46b7275.png',2,'bg-green',1,0,0,511),(63,'五折卡','icon-youhui','zhe',0,4,'zhe/index.html','http://images4.5maiche.cn/2016-07-28_57997f904c4af.png',2,'bg-main',1,0,0,379),(65,'个人中心','icon-xiaoqu11','geren',0,11,'http://zhaopin.weixinguanfang.com/user/member/index','http://images4.5maiche.cn/2016-07-28_5799803b72727.png',2,'bg-dot',0,0,0,637),(66,'跑腿','icon-trlogonline','running',0,18,'running/index.html','http://images4.5maiche.cn/2016-07-28_57998049c7575.png',2,'bg-dot',1,0,0,195),(67,'拼车','icon-pin','pinche',0,19,'pinche/index.html','http://images4.5maiche.cn/2016-11-08_5821e75e2ed02.png',2,'bg-yellow',1,0,0,717),(68,'跑腿','icon-trlogonline','running',0,15,'running/index.html','http://images4.5maiche.cn/2016-07-28_579980b6e35a4.png',2,'bg-dot',1,0,0,456),(69,'新闻','','news',0,2,'/news/index.html','',4,'',1,0,0,718),(70,'预订','','booking',0,11,'/booking/index.html','',4,'',1,0,0,650),(72,'在线抢购','icon-qianggou2','activity',0,12,'tuan/index.html','http://images4.5maiche.cn/2016-07-28_5799805a86b71.png',2,'bg-green',1,0,0,789),(71,'酒店','','Hotels',0,12,'/hotels/index.html','',4,'',1,0,0,693),(74,'五折卡','','zhe',0,5,'/zhe/index.html','',4,'',1,0,0,773),(75,'股权','icon-guquanchoujiang','booking',0,5,'stock/index.html','',2,'bg-main',1,0,0,424),(76,'优惠券','icon-wodeyouhuijuan','coupon',0,16,'coupon/index.html','http://images4.5maiche.cn/2017-05-03_59095b3d75f4a.jpg',2,'bg-green',1,0,0,279),(83,'新闻','icon-dongtai1','news',0,14,'news/index.html','http://images4.5maiche.cn/2017-06-19_5947245f44b3d.png',2,'bg-dot',1,0,0,193),(86,'首页','icon-shouye','index',0,1,'wap/index','',1,'bg-green',1,0,0,2565),(87,'企业','icon-shangjia2','shop',0,2,'shop/index','',1,'bg-green',1,0,0,870),(88,'信息','icon-fenleixinxi','life',0,4,'life/index','',1,'bg-green',1,0,0,894),(89,'贴吧','icon-tubiao1tieba1','thread',0,5,'thread/index','',1,'bg-green',1,0,0,517),(90,'我的','icon-wo','user',0,6,'http://www.bao17.com/user/member/index?nav_id=90','',1,'bg-green',1,0,0,0),(93,'直播','','live',0,3,'/live/index.html','',4,'',1,0,0,166),(99,'农家乐','icon-icon12','nongjiale',0,30,'farm/index','',2,'bg-green',1,0,0,95),(100,'家政','icon-jiudian2','appoint',0,3,'appoint/worker_list','',1,'bg-green',1,0,0,116),(102,'便利店','icon-youhui bg-main','BIAN',0,0,'/merchant/index/index.html','',2,'',1,1,0,0);

/*Table structure for table `tu_online` */

DROP TABLE IF EXISTS `tu_online`;

CREATE TABLE `tu_online` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) unsigned DEFAULT NULL COMMENT '企业ID',
  `rptDate` varchar(32) DEFAULT NULL COMMENT '日期',
  `code` varchar(16) DEFAULT NULL COMMENT '站点编码同shop_id',
  `name` varchar(32) DEFAULT NULL COMMENT '站点名称',
  `countyType` int(11) DEFAULT NULL COMMENT '站点类型',
  `buyOrder` int(11) DEFAULT NULL COMMENT '代买总订单数量',
  `saleOrder` int(10) DEFAULT NULL COMMENT '代卖总订单数量',
  `data` text COMMENT '序列化站点信息',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未推送，1已推送',
  `return` varchar(32) DEFAULT NULL COMMENT '推送后返回值',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `push_time` int(11) DEFAULT '0' COMMENT '推送时间',
  `push_ip` varchar(15) DEFAULT NULL COMMENT '推送IP',
  PRIMARY KEY (`online_id`) USING BTREE,
  KEY `order_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_online` */

/*Table structure for table `tu_order` */

DROP TABLE IF EXISTS `tu_order`;

CREATE TABLE `tu_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addr_id` int(11) DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT '0',
  `mobile_fan` int(11) DEFAULT '0' COMMENT '手机下单立减',
  `need_pay` int(11) DEFAULT NULL COMMENT '用户实际付款金额',
  `express_price` int(11) DEFAULT NULL COMMENT '订单总快递费',
  `address_id` int(10) DEFAULT NULL COMMENT '会员地址ID',
  `download_id` int(11) DEFAULT '0' COMMENT '优惠劵ID',
  `coupon_price` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '0.0.0.0',
  `update_time` int(11) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0代表等待付款 1代表等待发货 2代表已发货 4代表申请退款 5代表已经退款 8代表已完成',
  `message` varchar(500) NOT NULL,
  `is_daofu` tinyint(1) DEFAULT '0',
  `is_mobile` tinyint(1) DEFAULT NULL,
  `is_shop` tinyint(1) DEFAULT '0' COMMENT '1 代表企业发货',
  `is_print` tinyint(1) NOT NULL DEFAULT '0',
  `is_change` tinyint(1) DEFAULT '0' COMMENT '是否改价',
  `express_id` int(10) DEFAULT NULL,
  `express_number` varchar(32) DEFAULT NULL COMMENT '快递单号',
  `closed` tinyint(1) DEFAULT '0',
  `use_integral` int(11) DEFAULT '0' COMMENT '订单使用积分数',
  `can_use_integral` int(11) DEFAULT '0' COMMENT '可使用的积分数',
  `is_separate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_profit` tinyint(1) NOT NULL DEFAULT '0',
  `is_dianping` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_order` */

/*Table structure for table `tu_order_change_logs` */

DROP TABLE IF EXISTS `tu_order_change_logs`;

CREATE TABLE `tu_order_change_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `change_price` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '0.0.0.0',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_order_change_logs` */

/*Table structure for table `tu_order_goods` */

DROP TABLE IF EXISTS `tu_order_goods`;

CREATE TABLE `tu_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL COMMENT '商品分类ID',
  `weight` int(11) DEFAULT '0' COMMENT '商品重量',
  `num` int(11) DEFAULT NULL,
  `kuaidi_id` int(10) DEFAULT NULL COMMENT '会员地址ID',
  `price` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `mobile_fan` int(11) DEFAULT NULL COMMENT '手机下单立减',
  `express_price` int(10) DEFAULT NULL COMMENT '商品中运费',
  `js_price` int(11) DEFAULT '0' COMMENT '结算价',
  `status` tinyint(1) DEFAULT '0' COMMENT '1代表已经发货 2代表申请退款  3代表已经退款',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `update_time` int(11) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT NULL,
  `is_profit` tinyint(1) DEFAULT '0' COMMENT '1代表已分销，0未分销',
  `is_daofu` tinyint(1) DEFAULT '0',
  `tui_uid` int(11) DEFAULT '0',
  `key` varchar(255) DEFAULT NULL COMMENT '规格',
  `key_name` varchar(255) DEFAULT NULL COMMENT '规格中文名',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_order_goods` */

/*Table structure for table `tu_order_pick` */

DROP TABLE IF EXISTS `tu_order_pick`;

CREATE TABLE `tu_order_pick` (
  `pick_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `order_ids` text,
  PRIMARY KEY (`pick_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_order_pick` */

/*Table structure for table `tu_order_single` */

DROP TABLE IF EXISTS `tu_order_single`;

CREATE TABLE `tu_order_single` (
  `single_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `user_id` int(1) DEFAULT NULL,
  `order_id` int(11) DEFAULT '0',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`single_id`) USING BTREE,
  UNIQUE KEY `single_id` (`single_id`) USING BTREE,
  KEY `cate_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_order_single` */

/*Table structure for table `tu_paddlist` */

DROP TABLE IF EXISTS `tu_paddlist`;

CREATE TABLE `tu_paddlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` tinyint(3) unsigned DEFAULT '0' COMMENT '地域等级',
  `upid` mediumint(8) unsigned DEFAULT '0' COMMENT '上级地域',
  `displayorder` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_upid` (`upid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=45052 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='地址库';

/*Data for the table `tu_paddlist` */


/*Table structure for table `tu_paddress` */

DROP TABLE IF EXISTS `tu_paddress`;

CREATE TABLE `tu_paddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `default` int(1) DEFAULT NULL COMMENT '默认地址',
  `xm` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `province_id` int(11) DEFAULT '0' COMMENT '省',
  `city_id` int(11) DEFAULT '0' COMMENT '市',
  `area_id` int(11) DEFAULT '0' COMMENT '县/区',
  `area_str` varchar(255) DEFAULT NULL COMMENT '区域详细字段',
  `info` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户地址库';

/*Data for the table `tu_paddress` */

/*Table structure for table `tu_payment` */

DROP TABLE IF EXISTS `tu_payment`;

CREATE TABLE `tu_payment` (
  `payment_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `logo` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `mobile_logo` varchar(32) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `setting` text,
  `is_mobile_only` tinyint(1) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0',
  `error_intro` varchar(64) DEFAULT NULL COMMENT '微信支付错误说明',
  PRIMARY KEY (`payment_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_payment` */

insert  into `tu_payment`(`payment_id`,`name`,`logo`,`code`,`mobile_logo`,`contents`,`setting`,`is_mobile_only`,`is_open`,`error_intro`) values (1,'支付宝','alipay.png','alipay','alipay_mobile.png','需要企业即时到账接口：不懂联系：Q.28.60.99.981','',0,1,NULL),(2,'微信支付','weixin.png','weixin','weixin_mobile.png','认证服务号并必须绑定本网站并设置好支付授权目录，技术支持：QQ.2860.99981','a:4:{s:5:\"appid\";s:3:\"123\";s:9:\"appsecret\";s:6:\"321312\";s:5:\"mchid\";s:6:\"123123\";s:6:\"appkey\";s:6:\"321312\";}',1,1,'商户号mch_id与appid不匹配'),(3,'余额支付','money.png','money','money_mobile.png','余额支付是最方便快捷的，需要二开Q.28.609.998.1','{s:5:\"appid\";s:0:\"\";s:10:\"paysignkey\";s:0:\"\";s:9:\"appsecret\";s:0:\"\";s:9:\"partnerid\";s:0:\"\";s:10:\"partnerkey\";s:0:\"\";}',0,1,NULL),(4,'微信扫码支付(native)','native.png','native','native_mobile.png','不懂的联系QQ：2860.9998.1 配置。','a:4:{s:5:\"appid\";s:3:\"123\";s:9:\"appsecret\";s:3:\"123\";s:5:\"mchid\";s:3:\"123\";s:6:\"appkey\";s:3:\"123\";}',0,1,NULL),(5,'欧付宝','opay.png','opay','opay.png','需要欧付宝账接口：不懂联系：Q.28.6.0.99.98.1 需要接口','a:3:{s:7:\"HashKey\";s:16:\"SDhqoFxzis8btsV3\";s:6:\"HashIV\";s:16:\"rCReXDhTsg1sqIDd\";s:10:\"MerchantID\";s:7:\"1441522\";}',0,0,NULL),(6,'paypal','paypal.png','paypal','paypal_mobile.png','国外的支付接口：不懂联系：Q.28.60.99.98.1','a:4:{s:18:\"paypal_ec_username\";s:0:\"\";s:18:\"paypal_ec_password\";s:0:\"\";s:19:\"paypal_ec_signature\";s:0:\"\";s:18:\"paypal_ec_currency\";s:3:\"AUD\";}',0,0,NULL),(7,'微信H5支付','weixinh5.png','weixinh5','weixinh5_mobile.png','微信支付跟微信公众号不一样，这里只适合手机浏览器支付，需要联系qq2860#99981','a:5:{s:5:\"appid\";s:3:\"123\";s:9:\"appsecret\";s:6:\"321312\";s:5:\"mchid\";s:6:\"123123\";s:6:\"appkey\";s:6:\"321312\";s:10:\"notify_url\";s:65:\"http://zhaopin.weixinguanfang.com/wap/payment/respond/code/weixinh5/type/1\";}',1,1,'');

/*Table structure for table `tu_payment_logs` */

DROP TABLE IF EXISTS `tu_payment_logs`;

CREATE TABLE `tu_payment_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `type` enum('tuan','farm','money','ele','booking','goods','pintuan','breaks','hotel','crowd','donate','appoint','running','cloud','zhe','edu','stock','book','market','store','ktv','community') DEFAULT 'tuan' COMMENT '支付类型',
  `types` varchar(32) DEFAULT NULL COMMENT '订单类型2',
  `order_id` int(11) DEFAULT '0',
  `order_ids` text COMMENT '如果该支付方式支持多个订单（合并付款）',
  `code` varchar(32) DEFAULT NULL,
  `need_pay` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `pay_time` int(11) DEFAULT NULL,
  `pay_ip` varchar(15) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT '0',
  `return_order_id` varchar(32) DEFAULT NULL COMMENT '返回订单id',
  `return_trade_no` varchar(32) DEFAULT NULL COMMENT '返回交易号',
  `return_code` varchar(32) DEFAULT NULL COMMENT '返回状态码',
  `return_msg` varchar(32) DEFAULT NULL COMMENT '返回说明',
  `return_date` varchar(32) DEFAULT NULL COMMENT '返回支付时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_payment_logs` */

insert  into `tu_payment_logs`(`log_id`,`user_id`,`type`,`types`,`order_id`,`order_ids`,`code`,`need_pay`,`create_time`,`create_ip`,`pay_time`,`pay_ip`,`is_paid`,`return_order_id`,`return_trade_no`,`return_code`,`return_msg`,`return_date`) values (1,1,'money',NULL,0,NULL,'weixinh5',100,1528342545,'111.37.70.112',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(2,2,'money',NULL,0,NULL,'weixinh5',500,1528347190,'125.68.94.176',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(3,1,'money',NULL,0,NULL,'weixinh5',100,1528970318,'111.34.65.245',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(4,1,'money',NULL,0,NULL,'alipay',100,1528970329,'111.34.65.245',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(5,4,'money',NULL,0,NULL,'weixin',10,1575181917,'39.90.2.114',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(6,4,'money',NULL,0,NULL,'weixin',10,1575182014,'223.104.190.36',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(7,4,'money',NULL,0,NULL,'weixin',10,1575182038,'223.104.190.36',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(8,4,'money',NULL,0,NULL,'weixin',100,1575182705,'223.104.190.36',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(9,4,'money',NULL,0,NULL,'weixin',100,1575338724,'27.222.98.103',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(10,4,'money',NULL,0,NULL,'weixin',100,1575338756,'27.222.98.103',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `tu_pcate` */

DROP TABLE IF EXISTS `tu_pcate`;

CREATE TABLE `tu_pcate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `csort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拼团分类';

/*Data for the table `tu_pcate` */

insert  into `tu_pcate`(`id`,`name`,`picurl`,`csort`) values (1,'拼团一级分类','2016/04/13/570e1e2d8b212.jpg',1);

/*Table structure for table `tu_pgoods` */

DROP TABLE IF EXISTS `tu_pgoods`;

CREATE TABLE `tu_pgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `list_pic` varchar(255) DEFAULT NULL COMMENT '列表页图片',
  `pics1` varchar(255) DEFAULT NULL COMMENT '产品幻灯片',
  `pics2` varchar(255) DEFAULT NULL COMMENT '产品幻灯片',
  `pics3` varchar(255) DEFAULT NULL COMMENT '产品幻灯片',
  `describe` varchar(255) DEFAULT NULL COMMENT '产品描述',
  `content` text COMMENT '产品详情',
  `is_yunfei` int(11) DEFAULT NULL,
  `yunfei_ids` text,
  `zhongliang` int(11) DEFAULT NULL COMMENT '重量',
  `kuaidi` int(11) DEFAULT NULL COMMENT '快递',
  `sales_num` int(11) DEFAULT '0' COMMENT '销售数量',
  `virtual_sales_num` int(11) DEFAULT NULL COMMENT '虚拟销量',
  `xiangou_num` int(11) DEFAULT NULL COMMENT '库存',
  `market_price` int(11) DEFAULT NULL COMMENT '市场价',
  `one_price` int(11) DEFAULT NULL COMMENT '单独购买价',
  `tuanz_price` int(11) DEFAULT NULL COMMENT '团长价',
  `tuan_num` int(11) DEFAULT NULL COMMENT '默认团人数',
  `tuan_price` int(11) DEFAULT NULL COMMENT '默认团价格',
  `tuan_num2` int(11) DEFAULT NULL COMMENT '二级团人数',
  `tuan_price2` int(11) DEFAULT NULL COMMENT '二级团价格',
  `tuan_num3` int(11) DEFAULT NULL COMMENT '三级团人数',
  `tuan_price3` int(11) DEFAULT NULL COMMENT '三级团价格',
  `open_tuanj` int(1) DEFAULT NULL COMMENT '启用团等级',
  `tuan_status` int(11) DEFAULT NULL COMMENT '开启时间',
  `tuan_hours` int(11) DEFAULT '24' COMMENT '开团后时间限制',
  `goods_unit` varchar(32) DEFAULT NULL COMMENT '规格',
  `goods_pic` varchar(255) DEFAULT NULL COMMENT '分享图片',
  `is_show` int(1) DEFAULT NULL COMMENT '是否上架',
  `paixu` int(11) DEFAULT '100' COMMENT '排序',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `edit_time` int(11) DEFAULT NULL COMMENT '编辑时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_is_show` (`is_show`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拼团商品';

/*Data for the table `tu_pgoods` */

/*Table structure for table `tu_pinche` */

DROP TABLE IF EXISTS `tu_pinche`;

CREATE TABLE `tu_pinche` (
  `pinche_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `area_id` int(10) DEFAULT NULL,
  `community_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `start_time_more` varchar(32) DEFAULT NULL,
  `goplace` varchar(32) DEFAULT NULL COMMENT '出发地',
  `toplace` varchar(10) DEFAULT NULL,
  `middleplace` varchar(32) DEFAULT NULL,
  `num_1` varchar(80) DEFAULT NULL,
  `num_2` varchar(80) DEFAULT NULL,
  `num_3` varchar(80) DEFAULT NULL,
  `num_4` varchar(80) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `details` varchar(256) DEFAULT NULL,
  `views` int(11) DEFAULT '0' COMMENT '浏览量',
  `lat` varchar(15) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `top_time` int(11) DEFAULT NULL COMMENT '置顶时间',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pinche_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_pinche` */

insert  into `tu_pinche`(`pinche_id`,`cate_id`,`city_id`,`area_id`,`community_id`,`user_id`,`photo`,`start_time`,`start_time_more`,`goplace`,`toplace`,`middleplace`,`num_1`,`num_2`,`num_3`,`num_4`,`mobile`,`details`,`views`,`lat`,`lng`,`closed`,`top_time`,`create_time`,`create_ip`) values (1,1,32,NULL,NULL,2,NULL,'2018-05-30','','北京','山东','选填','1','','','','13954646464','',2,'','',0,NULL,1527638013,'203.109.153.182'),(2,2,32,NULL,NULL,2,NULL,'2018-05-30','','北京','上海','选填','','2','','','13664646464','',0,'39.889585','116.847433',0,NULL,1527638132,'203.109.153.182'),(3,2,32,NULL,NULL,2,NULL,'2018-05-30','','北京','上海','选填','','2','','','13664646464','',5,'39.889585','116.847433',0,NULL,1527638133,'203.109.153.182'),(4,1,32,NULL,NULL,1,'/attachs/2018/05/31/thumb_5b0f7431a54b1.jpg','2020-07-24','','北京','上海','河北','5','','','','15310004141','',0,'','',0,NULL,1527739543,'111.37.66.253'),(5,1,32,NULL,NULL,1,'/attachs/2018/05/31/thumb_5b0f74c6b0458.jpg','2020-05-29','','郑州','土耳其','澳门、香港','7','','','','13548777002','',5,'','',0,NULL,1527739630,'111.37.66.253');

/*Table structure for table `tu_pkuaidi` */

DROP TABLE IF EXISTS `tu_pkuaidi`;

CREATE TABLE `tu_pkuaidi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('goods','pintuan') DEFAULT 'goods',
  `shop_id` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `audit` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_pkuaidi` */

/*Table structure for table `tu_pois_content` */

DROP TABLE IF EXISTS `tu_pois_content`;

CREATE TABLE `tu_pois_content` (
  `pois_id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `address` varchar(250) NOT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `is_lock` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `orderby` int(11) NOT NULL DEFAULT '1000' COMMENT '默认排名1000',
  `create_time` int(12) NOT NULL,
  `stick` varchar(100) NOT NULL,
  `stick_time` int(11) NOT NULL,
  PRIMARY KEY (`pois_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_pois_content` */

/*Table structure for table `tu_pois_word` */

DROP TABLE IF EXISTS `tu_pois_word`;

CREATE TABLE `tu_pois_word` (
  `word_id` int(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  `pois_id` int(10) NOT NULL,
  `over_time` int(10) NOT NULL,
  PRIMARY KEY (`word_id`) USING BTREE,
  UNIQUE KEY `text` (`text`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_pois_word` */

/*Table structure for table `tu_porder` */

DROP TABLE IF EXISTS `tu_porder`;

CREATE TABLE `tu_porder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tstatus` int(11) DEFAULT '0' COMMENT '订单类型，普通订单、开团订单、参团订单',
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `goods_id` int(11) DEFAULT '0',
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_num` int(11) DEFAULT '0',
  `goods_price` int(11) DEFAULT '0',
  `pay_price` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `xm` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `express_name` varchar(255) DEFAULT NULL,
  `express_no` varchar(255) DEFAULT NULL,
  `express_time` int(11) DEFAULT '0',
  `express_price` int(11) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT '0' COMMENT '参团ID',
  `tuan_status` int(11) DEFAULT '1' COMMENT '组团状态',
  `prepay_id` varchar(255) DEFAULT NULL,
  `order_status` int(11) DEFAULT '1',
  `pay_time` int(11) DEFAULT '0',
  `order_time` int(11) DEFAULT '0',
  `order_beizu` varchar(255) DEFAULT NULL,
  `pay_name` varchar(32) DEFAULT NULL,
  `renshu` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_order_no` (`order_no`) USING BTREE,
  KEY `idx_uid_status` (`user_id`,`order_status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拼团订单';

/*Data for the table `tu_porder` */

/*Table structure for table `tu_post` */

DROP TABLE IF EXISTS `tu_post`;

CREATE TABLE `tu_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `cate_id` smallint(6) DEFAULT '0',
  `details` text,
  `pic` text NOT NULL,
  `views` int(11) DEFAULT '0',
  `reply_num` int(11) DEFAULT '0',
  `zan_num` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `last_id` int(11) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100' COMMENT '1就是第一名',
  `is_fine` tinyint(1) DEFAULT '0' COMMENT '1代表精华',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_post` */

/*Table structure for table `tu_post_reply` */

DROP TABLE IF EXISTS `tu_post_reply`;

CREATE TABLE `tu_post_reply` (
  `reply_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `zan_num` int(11) DEFAULT '0',
  `contents` text,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`reply_id`) USING BTREE,
  KEY `post_id` (`post_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_post_reply` */

/*Table structure for table `tu_post_zan` */

DROP TABLE IF EXISTS `tu_post_zan`;

CREATE TABLE `tu_post_zan` (
  `zan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`zan_id`) USING BTREE,
  UNIQUE KEY `post_id` (`post_id`,`create_ip`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_post_zan` */

/*Table structure for table `tu_pshop` */

DROP TABLE IF EXISTS `tu_pshop`;

CREATE TABLE `tu_pshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `mianyunfei` int(11) DEFAULT NULL,
  `tongchen` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拼团企业';

/*Data for the table `tu_pshop` */

/*Table structure for table `tu_ptuan` */

DROP TABLE IF EXISTS `tu_ptuan`;

CREATE TABLE `tu_ptuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `prolong_hours` int(11) DEFAULT '0',
  `tlevel` int(11) DEFAULT '1',
  `tuan_time` int(11) DEFAULT '0',
  `success_time` int(11) DEFAULT '0',
  `tuan_status` int(11) DEFAULT '1',
  `do_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='开团管理';

/*Data for the table `tu_ptuan` */

/*Table structure for table `tu_ptuanteam` */

DROP TABLE IF EXISTS `tu_ptuanteam`;

CREATE TABLE `tu_ptuanteam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tuan_id` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `tuan_status` int(11) DEFAULT '1',
  `add_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_tuid_tyid` (`tuan_id`,`type_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='开团成员列表';

/*Data for the table `tu_ptuanteam` */

/*Table structure for table `tu_push` */

DROP TABLE IF EXISTS `tu_push`;

CREATE TABLE `tu_push` (
  `push_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL COMMENT '类别',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `user_id` int(10) DEFAULT NULL,
  `rank_id` int(10) DEFAULT NULL,
  `grade_id` int(11) DEFAULT NULL COMMENT '企业等级ID',
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL COMMENT '内容',
  `url` varchar(128) DEFAULT NULL COMMENT '链接',
  `create_time` int(11) DEFAULT NULL,
  `push_num` int(11) DEFAULT '0' COMMENT '人数',
  `push_time` varchar(32) NOT NULL COMMENT '推送时间',
  `is_push` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`push_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_push` */

/*Table structure for table `tu_pyunfei` */

DROP TABLE IF EXISTS `tu_pyunfei`;

CREATE TABLE `tu_pyunfei` (
  `yunfei_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('goods','pintuan') DEFAULT 'goods',
  `shop_id` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `kuaidi_id` int(11) DEFAULT NULL,
  `shouzhong` int(11) DEFAULT NULL,
  `xuzhong` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `create_time` int(15) DEFAULT NULL COMMENT '时间',
  `create_ip` varchar(11) DEFAULT NULL COMMENT 'IP',
  PRIMARY KEY (`yunfei_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_pyunfei` */

/*Table structure for table `tu_pyunfei_provinces` */

DROP TABLE IF EXISTS `tu_pyunfei_provinces`;

CREATE TABLE `tu_pyunfei_provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yunfei_id` int(10) DEFAULT NULL,
  `kuaidi_id` int(11) DEFAULT NULL COMMENT '所属于快递ID',
  `province_id` int(11) DEFAULT NULL COMMENT '地区ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_pyunfei_provinces` */

/*Table structure for table `tu_qrcode_census` */

DROP TABLE IF EXISTS `tu_qrcode_census`;

CREATE TABLE `tu_qrcode_census` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `year` smallint(5) DEFAULT '0',
  `month` tinyint(2) DEFAULT '0',
  `day` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shop_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_qrcode_census` */

/*Table structure for table `tu_recharge_card` */

DROP TABLE IF EXISTS `tu_recharge_card`;

CREATE TABLE `tu_recharge_card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '0',
  `card_key` char(32) DEFAULT '0',
  `value` int(10) DEFAULT '0',
  `end_date` date DEFAULT '0000-00-00',
  `is_used` tinyint(3) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `used_time` int(11) DEFAULT '0',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_recharge_card` */

/*Table structure for table `tu_register_ip` */

DROP TABLE IF EXISTS `tu_register_ip`;

CREATE TABLE `tu_register_ip` (
  `ip_id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `is_lock` int(11) NOT NULL,
  KEY `ip` (`ip`) USING BTREE,
  KEY `ip_id` (`ip_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_register_ip` */

/*Table structure for table `tu_role` */

DROP TABLE IF EXISTS `tu_role`;

CREATE TABLE `tu_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_role` */

insert  into `tu_role`(`role_id`,`role_name`) values (1,'系统管理员'),(2,'分站管理'),(9,'公司员工'),(10,'物业管理员'),(13,'系统管理员2');

/*Table structure for table `tu_role_maps` */

DROP TABLE IF EXISTS `tu_role_maps`;

CREATE TABLE `tu_role_maps` (
  `role_id` smallint(5) DEFAULT NULL,
  `menu_id` smallint(5) DEFAULT NULL,
  UNIQUE KEY `role_id` (`role_id`,`menu_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_role_maps` */

insert  into `tu_role_maps`(`role_id`,`menu_id`) values (2,40),(2,44),(2,51),(2,85),(2,96),(2,97),(2,102),(2,110),(2,111),(2,125),(2,130),(2,177),(2,178),(2,181),(2,185),(2,189),(2,190),(2,209),(2,245),(2,265),(2,296),(2,298),(2,313),(2,315),(2,328),(2,339),(2,359),(2,360),(2,361),(2,362),(2,421),(2,430),(2,438),(2,441),(2,516),(2,524),(2,537),(2,538),(2,539),(2,540),(2,581),(2,594),(2,625),(2,626),(2,627),(2,645),(2,651),(2,652),(2,697),(2,717),(2,722),(2,767),(2,768),(2,783),(2,784),(2,786),(2,788),(2,792),(2,838),(2,843),(2,860),(2,861),(2,863),(2,905),(2,906),(2,908),(2,910),(2,917),(2,924),(2,925),(2,926),(2,927),(2,928),(2,941),(2,969),(2,971),(2,974),(2,976),(2,977),(2,988),(2,993),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,34),(3,35),(3,36),(3,37),(3,40),(3,41),(3,44),(3,45),(3,46),(3,47),(3,48),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,70),(3,71),(3,72),(3,73),(3,80),(3,81),(3,85),(3,86),(3,87),(3,88),(3,90),(3,91),(3,95),(3,96),(3,97),(3,98),(3,99),(3,100),(3,101),(3,102),(3,103),(3,104),(3,105),(3,106),(3,107),(3,108),(3,109),(3,110),(3,111),(3,112),(3,113),(3,115),(3,116),(3,117),(3,118),(3,119),(3,120),(3,121),(3,122),(3,123),(3,125),(3,126),(3,127),(3,128),(3,129),(3,130),(3,135),(3,136),(3,137),(3,138),(3,139),(3,140),(3,142),(3,143),(3,144),(3,145),(3,146),(3,156),(3,157),(3,159),(3,160),(3,161),(3,162),(3,163),(3,164),(3,165),(3,166),(3,167),(3,168),(3,169),(3,170),(3,171),(3,172),(3,173),(3,174),(3,175),(3,176),(3,177),(3,178),(3,179),(3,180),(3,181),(3,182),(3,183),(3,184),(3,185),(3,186),(3,187),(3,188),(3,189),(3,190),(3,193),(3,194),(3,195),(3,196),(3,197),(3,198),(3,199),(3,200),(3,201),(3,203),(3,204),(3,205),(3,206),(3,209),(3,210),(3,211),(3,212),(3,213),(3,214),(3,218),(3,219),(3,220),(3,221),(3,222),(3,223),(3,224),(3,225),(3,226),(3,227),(3,235),(3,236),(3,237),(3,238),(3,239),(3,240),(3,241),(3,242),(3,243),(3,245),(3,246),(3,247),(3,248),(3,249),(3,255),(3,256),(3,257),(3,258),(3,259),(3,261),(3,262),(3,263),(3,264),(3,265),(3,266),(3,267),(3,268),(3,269),(3,270),(3,271),(3,274),(3,275),(3,277),(3,278),(3,279),(3,280),(3,281),(3,283),(3,289),(3,290),(3,292),(3,296),(3,297),(3,298),(3,299),(3,305),(3,306),(3,307),(3,308),(3,309),(3,310),(3,311),(3,312),(3,313),(3,315),(3,316),(3,317),(3,318),(3,319),(3,320),(3,321),(3,322),(3,324),(3,325),(3,326),(3,327),(3,328),(3,329),(3,330),(3,331),(3,332),(3,333),(3,334),(3,336),(3,337),(3,339),(3,340),(3,341),(3,342),(3,343),(3,345),(3,346),(3,347),(3,348),(3,349),(3,350),(3,351),(3,352),(3,353),(3,354),(3,355),(3,356),(3,357),(3,359),(3,360),(3,361),(3,362),(3,387),(3,388),(3,389),(3,390),(3,391),(3,392),(3,410),(3,411),(3,412),(3,413),(3,414),(3,418),(3,419),(3,421),(3,422),(3,423),(3,424),(3,425),(3,430),(3,431),(3,432),(3,433),(3,434),(3,435),(3,436),(3,437),(3,438),(3,439),(3,441),(3,442),(3,443),(3,444),(3,446),(3,447),(3,448),(3,449),(3,450),(3,451),(3,452),(3,453),(3,454),(3,455),(3,456),(3,468),(3,469),(3,470),(3,471),(3,472),(3,473),(3,475),(3,476),(3,478),(3,482),(3,484),(3,485),(3,486),(3,489),(3,490),(3,491),(3,492),(3,493),(3,495),(3,496),(3,497),(3,499),(3,500),(3,501),(3,502),(3,510),(3,515),(3,516),(3,517),(3,518),(3,519),(3,520),(3,521),(3,522),(3,524),(3,525),(3,526),(3,527),(3,528),(3,532),(3,533),(3,537),(3,538),(3,539),(3,540),(3,542),(3,543),(3,544),(3,548),(3,549),(3,550),(3,551),(3,552),(3,553),(3,554),(3,556),(3,557),(3,558),(3,559),(3,560),(3,561),(3,563),(3,564),(3,565),(3,566),(3,567),(3,568),(3,569),(3,570),(3,571),(3,572),(3,573),(3,574),(3,575),(3,576),(3,577),(3,578),(3,579),(3,580),(3,581),(3,582),(3,583),(3,584),(3,586),(3,587),(3,588),(3,589),(3,591),(3,592),(3,593),(3,594),(3,595),(3,596),(3,597),(3,600),(3,601),(3,602),(3,603),(3,604),(3,605),(3,606),(3,607),(3,608),(3,609),(3,610),(3,611),(3,612),(3,613),(3,614),(3,615),(3,616),(3,617),(3,619),(3,620),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,34),(4,35),(4,36),(4,37),(4,40),(4,41),(4,44),(4,45),(4,46),(4,47),(4,48),(4,51),(4,52),(4,53),(4,54),(4,55),(4,56),(4,57),(4,58),(4,70),(4,71),(4,72),(4,73),(4,80),(4,81),(4,85),(4,86),(4,87),(4,88),(4,90),(4,91),(4,95),(4,96),(4,97),(4,98),(4,99),(4,100),(4,101),(4,102),(4,103),(4,104),(4,105),(4,106),(4,107),(4,108),(4,109),(4,110),(4,111),(4,112),(4,113),(4,115),(4,116),(4,117),(4,118),(4,125),(4,126),(4,127),(4,128),(4,129),(4,130),(4,135),(4,136),(4,137),(4,138),(4,139),(4,140),(4,156),(4,157),(4,159),(4,160),(4,161),(4,162),(4,163),(4,164),(4,165),(4,166),(4,167),(4,168),(4,169),(4,170),(4,171),(4,172),(4,173),(4,174),(4,175),(4,176),(4,177),(4,178),(4,179),(4,180),(4,181),(4,182),(4,183),(4,184),(4,185),(4,186),(4,187),(4,188),(4,189),(4,190),(4,193),(4,194),(4,195),(4,196),(4,197),(4,198),(4,199),(4,200),(4,201),(4,203),(4,204),(4,205),(4,206),(4,209),(4,210),(4,211),(4,212),(4,213),(4,214),(4,218),(4,219),(4,220),(4,221),(4,222),(4,223),(4,224),(4,225),(4,226),(4,227),(4,235),(4,236),(4,237),(4,238),(4,239),(4,240),(4,241),(4,242),(4,243),(4,245),(4,246),(4,247),(4,248),(4,249),(4,255),(4,256),(4,257),(4,258),(4,259),(4,261),(4,262),(4,263),(4,264),(4,265),(4,266),(4,267),(4,268),(4,269),(4,270),(4,271),(4,274),(4,275),(4,277),(4,278),(4,279),(4,280),(4,281),(4,290),(4,292),(4,296),(4,297),(4,298),(4,299),(4,305),(4,306),(4,307),(4,308),(4,309),(4,310),(4,311),(4,312),(4,313),(4,315),(4,316),(4,317),(4,318),(4,319),(4,320),(4,321),(4,322),(4,324),(4,325),(4,326),(4,327),(4,328),(4,336),(4,337),(4,339),(4,340),(4,341),(4,342),(4,343),(4,345),(4,346),(4,347),(4,348),(4,349),(4,350),(4,351),(4,352),(4,353),(4,354),(4,355),(4,356),(4,357),(4,359),(4,360),(4,361),(4,362),(4,387),(4,388),(4,389),(4,390),(4,391),(4,392),(4,410),(4,411),(4,412),(4,413),(4,418),(4,419),(4,421),(4,422),(4,423),(4,424),(4,425),(4,430),(4,431),(4,432),(4,433),(4,434),(4,435),(4,436),(4,437),(4,438),(4,439),(4,441),(4,442),(4,443),(4,444),(4,489),(4,490),(4,491),(4,492),(4,493),(4,495),(4,496),(4,497),(4,510),(4,515),(4,516),(4,517),(4,518),(4,519),(4,520),(4,521),(4,524),(4,525),(4,526),(4,527),(4,528),(4,537),(4,538),(4,539),(4,540),(4,556),(4,557),(4,558),(4,559),(4,560),(4,561),(4,563),(4,564),(4,565),(4,566),(4,567),(4,568),(4,569),(4,570),(4,571),(4,572),(4,573),(4,574),(4,575),(4,576),(4,577),(4,578),(4,579),(4,580),(4,581),(4,582),(4,583),(4,584),(4,585),(4,591),(4,592),(4,593),(4,594),(4,619),(4,625),(4,626),(4,627),(4,628),(4,634),(4,635),(4,640),(4,641),(4,642),(4,644),(4,645),(4,647),(4,648),(4,651),(4,652),(4,653),(4,657),(4,658),(4,659),(4,660),(4,661),(4,662),(4,663),(4,664),(4,665),(4,667),(4,668),(4,669),(4,670),(4,671),(4,672),(4,673),(4,674),(4,675),(4,676),(4,677),(4,678),(4,679),(4,680),(4,681),(4,682),(4,683),(4,684),(4,685),(4,686),(4,687),(4,688),(4,689),(4,690),(4,691),(4,692),(4,693),(4,697),(4,703),(4,704),(4,705),(4,706),(4,712),(4,715),(4,717),(4,722),(4,723),(4,724),(4,728),(4,729),(4,732),(4,733),(4,734),(4,735),(4,736),(4,737),(4,738),(4,739),(4,740),(4,741),(4,743),(4,744),(4,750),(4,751),(4,752),(4,753),(4,754),(4,757),(4,758),(4,759),(4,760),(4,761),(4,762),(4,763),(4,765),(4,766),(4,767),(4,768),(4,773),(4,774),(4,776),(4,778),(4,779),(4,780),(4,781),(4,783),(4,784),(4,785),(4,786),(4,788),(4,789),(4,790),(4,791),(4,792),(4,795),(4,797),(4,800),(4,801),(4,807),(4,808),(4,810),(4,811),(4,812),(4,813),(4,814),(4,816),(9,34),(9,275),(9,803),(9,804),(9,821),(9,845),(9,847),(9,850),(9,851),(10,581),(10,594),(10,860),(10,861),(10,863),(10,967),(10,969),(10,971),(10,972),(10,974),(10,976),(10,977),(11,12),(11,13),(11,14),(11,15),(11,16),(11,17),(11,18),(11,25),(11,26),(11,27),(11,28),(11,29),(11,30),(11,31),(11,32),(11,51),(11,52),(11,53),(11,54),(11,55),(11,56),(11,57),(11,58),(11,80),(11,81),(11,91),(11,115),(11,116),(11,117),(11,118),(11,156),(11,157),(11,159),(11,160),(11,161),(11,162),(11,163),(11,164),(11,165),(11,166),(11,167),(11,168),(11,169),(11,170),(11,171),(11,172),(11,173),(11,174),(11,175),(11,176),(11,197),(11,198),(11,199),(11,200),(11,201),(11,203),(11,204),(11,205),(11,206),(11,259),(11,281),(11,290),(11,435),(11,436),(11,437),(11,516),(11,517),(11,518),(11,519),(11,585),(11,675),(11,676),(11,723),(11,732),(11,733),(11,734),(11,735),(11,736),(11,737),(11,738),(11,739),(11,740),(11,741),(11,776),(11,780),(11,822),(11,823),(11,824),(11,828),(11,829),(11,830),(11,834),(11,835),(11,836),(11,837),(11,895),(11,934),(11,961),(11,965),(13,12),(13,18),(13,29),(13,34),(13,40),(13,44),(13,51),(13,70),(13,80),(13,81),(13,85),(13,96),(13,97),(13,102),(13,109),(13,110),(13,111),(13,115),(13,125),(13,130),(13,135),(13,140),(13,156),(13,157),(13,159),(13,163),(13,167),(13,171),(13,177),(13,178),(13,181),(13,185),(13,189),(13,190),(13,203),(13,206),(13,209),(13,211),(13,213),(13,218),(13,219),(13,235),(13,240),(13,245),(13,255),(13,259),(13,261),(13,265),(13,274),(13,275),(13,278),(13,290),(13,292),(13,296),(13,298),(13,309),(13,313),(13,315),(13,328),(13,336),(13,339),(13,345),(13,352),(13,359),(13,360),(13,361),(13,362),(13,387),(13,391),(13,410),(13,419),(13,421),(13,430),(13,435),(13,438),(13,441),(13,489),(13,495),(13,510),(13,515),(13,516),(13,524),(13,527),(13,537),(13,538),(13,539),(13,540),(13,563),(13,581),(13,585),(13,591),(13,592),(13,593),(13,594),(13,625),(13,626),(13,627),(13,644),(13,645),(13,647),(13,651),(13,652),(13,667),(13,697),(13,715),(13,717),(13,722),(13,723),(13,724),(13,732),(13,733),(13,734),(13,735),(13,736),(13,737),(13,738),(13,739),(13,740),(13,741),(13,767),(13,768),(13,773),(13,776),(13,778),(13,780),(13,781),(13,783),(13,784),(13,786),(13,788),(13,789),(13,790),(13,791),(13,792),(13,795),(13,797),(13,800),(13,801),(13,803),(13,804),(13,807),(13,808),(13,810),(13,811),(13,812),(13,813),(13,814),(13,816),(13,819),(13,820),(13,821),(13,822),(13,823),(13,824),(13,828),(13,829),(13,830),(13,832),(13,833),(13,834),(13,835),(13,836),(13,837),(13,838),(13,839),(13,841),(13,842),(13,843),(13,844),(13,845),(13,846),(13,847),(13,848),(13,850),(13,851),(13,853),(13,854),(13,855),(13,856),(13,857),(13,858),(13,859),(13,860),(13,861),(13,863),(13,864),(13,869),(13,874),(13,875),(13,878),(13,880),(13,882),(13,884),(13,886),(13,888),(13,889),(13,895),(13,903),(13,905),(13,906),(13,908),(13,910),(13,917),(13,924),(13,925),(13,926),(13,927),(13,928),(13,930),(13,931),(13,934),(13,936),(13,937),(13,938),(13,939),(13,941),(13,942),(13,946),(13,951),(13,952),(13,953),(13,956),(13,958),(13,960),(13,961),(13,962),(13,965),(13,967),(13,969),(13,971),(13,972),(13,974),(13,976),(13,977),(13,978),(13,979),(13,982),(13,984),(13,988),(13,993),(13,995),(13,996),(13,997),(13,1000),(13,1001),(13,1002),(13,1003),(13,1004),(13,1005),(13,1006),(13,1007),(13,1008),(13,1009),(13,1011),(13,1012),(13,1013),(13,1014),(13,1017),(13,1023),(13,1024),(13,1025),(13,1026),(13,1027),(13,1028),(13,1029);

/*Table structure for table `tu_running` */

DROP TABLE IF EXISTS `tu_running`;

CREATE TABLE `tu_running` (
  `running_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `cid` int(11) unsigned NOT NULL COMMENT '配送员ID',
  `city_id` int(10) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `thumb` text NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `price` int(11) NOT NULL COMMENT '价格',
  `freight` int(11) NOT NULL COMMENT '运费，后台设置',
  `need_pay` int(11) NOT NULL COMMENT '实际付款',
  `lat` varchar(15) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lbs_addr` varchar(60) NOT NULL COMMENT 'lbs地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未付款，1已付款，2配送中，3已完成配送 8用户已确认',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `update_time` int(20) DEFAULT NULL,
  `end_time` int(20) NOT NULL,
  PRIMARY KEY (`running_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_running` */

/*Table structure for table `tu_running_money` */

DROP TABLE IF EXISTS `tu_running_money`;

CREATE TABLE `tu_running_money` (
  `money_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `money` int(11) DEFAULT '0' COMMENT '补贴金额',
  `type` enum('ele','running','goods') NOT NULL DEFAULT 'ele' COMMENT 'ele代表外卖，goods代表商城，running代表跑腿',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`money_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_running_money` */

/*Table structure for table `tu_seller_goods` */

DROP TABLE IF EXISTS `tu_seller_goods`;

CREATE TABLE `tu_seller_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID主键',
  `type_id` tinyint(1) DEFAULT '0' COMMENT '1商品，2抢购，3企业',
  `id` int(11) DEFAULT NULL COMMENT '商品ID',
  `user_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶',
  `is_tuijian` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE,
  UNIQUE KEY `username` (`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_seller_goods` */

insert  into `tu_seller_goods`(`goods_id`,`type_id`,`id`,`user_id`,`is_top`,`is_tuijian`,`closed`,`create_time`,`create_ip`) values (1,1,6,3,0,0,1,1574910112,'127.0.0.1');

/*Table structure for table `tu_seller_setting` */

DROP TABLE IF EXISTS `tu_seller_setting`;

CREATE TABLE `tu_seller_setting` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seller_sign` varchar(128) DEFAULT NULL COMMENT 'seller店招',
  `seller_photo` varchar(128) DEFAULT NULL COMMENT '店招',
  `seller_banner` text COMMENT 'seller海报多张',
  `seller_name` varchar(32) DEFAULT NULL COMMENT '店名',
  `seller_intro` varchar(128) DEFAULT NULL COMMENT '店铺简介',
  `audit` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_seller_setting` */

/*Table structure for table `tu_sensitive_words` */

DROP TABLE IF EXISTS `tu_sensitive_words`;

CREATE TABLE `tu_sensitive_words` (
  `words_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `words` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`words_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_sensitive_words` */

insert  into `tu_sensitive_words`(`words_id`,`words`) values (1,'弹药'),(2,'枪支');

/*Table structure for table `tu_seo` */

DROP TABLE IF EXISTS `tu_seo`;

CREATE TABLE `tu_seo` (
  `seo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seo_key` varchar(32) DEFAULT NULL,
  `seo_explain` varchar(1024) DEFAULT NULL,
  `seo_title` varchar(1024) DEFAULT NULL,
  `seo_keywords` varchar(1024) DEFAULT NULL,
  `seo_desc` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`seo_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_seo` */

insert  into `tu_seo`(`seo_id`,`seo_key`,`seo_explain`,`seo_title`,`seo_keywords`,`seo_desc`) values (1,'index_index','首页SEO配置\r\n','{city_name}在线-{city_name}第一网络媒体,{city_name}房产,{city_name}招聘!【官网】','{sitename},{sitename}网,{city_name}门户,{city_name}门户网','{city_name}{sitename}网-{city_name}抢购首选,专业品质{city_name}{sitename}网!为您提供{city_name}美食,电影票,KTV,酒店,旅游等{city_name}{sitename}大全,{city_name}网站大全{city_name}{sitename}网,您身边的吃喝玩乐好帮手!'),(3,'news_detail','文章详情\r\n1、{title}标题\r\n2、{keywords}关键字\r\n3、{desc}描述\r\n4、{cate_name}分类','{title}-{sitename}','{keywords}','{desc}'),(5,'coupon_index','优惠券列表\r\n1、{area_name}地区\r\n2、{cate_name}','{area_name}{cate_name}商户哪家好？{sitename}','{area_name}{cate_name}商户哪家好？{sitename}','{area_name}{cate_name}商户哪家好？{sitename}'),(6,'coupon_detail','优惠券详情\r\n1、{shop_name}企业名称\r\n2、{title}优惠券标题\r\n','商户{shop_name}的优惠券“{title}”','商户{shop_name}的优惠券“{title}”','商户{shop_name}的优惠券“{title}”'),(7,'tuan_detail','生活抢购详情\r\n1、{shop_name}企业名称\r\n2、{title}优惠券标题','{title} -{city_name}{sitename}网。\r\n','{cate_area},{cate_business},{cate_name},{shop_name},{city_name}抢购,打折,{city_name}打折,{sitename}{city_name}站,{sitename}','{intro}'),(8,'tuan_index','团购列表\r\n1、{area_name}地区\r\n2、{cate_name}\r\n3、{business_name}','{city_name}{area_name}{business_name}{cate_name}本地生活团购！吃喝玩乐一切都在{sitename}！','{city_name}{area_name}{business_name}{cate_name}本地生活团购！吃喝玩乐一切都在{sitename}！','{city_name}{area_name}{business_name}{cate_name}本地生活团购！吃喝玩乐一切都在{sitename}！'),(9,'news_index','新闻列表\r\n1、{cate_name} 分类','{sitename}_{city_name}资讯网','{cate_name}，{sitename}','{sitename}_{city_name}本地最具有价值的资讯网站'),(13,'shop_index','企业列表\r\n','{city_name}{sitename}企业大全','{area_name}{cate_name}{business_name}企业列表，{city_name}{sitename}','{city_name}{sitename}最权威的企业展示平台。'),(14,'shop_detail','企业详情\r\n','{shop_name}{shop_tel}','{shop_name}，{shop_tel}，{addr},{cate_area},{cate_business}','{details}'),(15,'app_index','APP页面','{sitename}_手机客户端下载','手机客户端，{sitename}手机客户端','{sitename}手机客户端是服务于{city_name}地区的专业生活服务软件。'),(18,'activity_index','活动类型：1、{cate_name} 2、{area_name}','{city_name}{area_name}活动首页','{city_name}{area_name},{cate_name}活动,{sitename}','{city_name}{area_name}最全的{cate_name}活动.'),(19,'activity_detail','活动详情\r\n1、{title}标题\r\n2、{shop_name}企业名称','{title}-{city_name}{sitename}','{cate_name},{shop_name},{cate_area},{cate_business},{title},{addr}','{intro}'),(20,'ele_ding','订座列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈','{area_name}{cate_name}{business_name}订座列表','{area_name}{cate_name}{business_name}订座列表','{area_name}{cate_name}{business_name}订座列表'),(21,'mall_index','购物列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈','{city_name}{area_name}{cate_name}{business_name}网上购物商城','{area_name}{cate_name}{business_name}','{area_name}{cate_name}{business_name}{city_name}{sitename}'),(22,'mall_detail','购物详情\r\n1、{shop_name}企业名称\r\n2、{title}商品标题','{title}-{city_name}{sitename}','{cate_name}，{cate_area}，{cate_business}，{shop_name}','{intro}'),(25,'jifen_index','积分兑换列表','积分兑换列表','积分兑换列表','积分兑换列表'),(26,'jifen_detail','积分商品&quot;{title}&quot;详情','积分商品&quot;{title}&quot;详情','积分商品&quot;{title}&quot;详情','积分商品&quot;{title}&quot;详情'),(27,'ele_detail','订餐详情\r\n1、{shop_name}企业名称\r\n2、{shop_tel}订餐电话','{city_name}{shop_name}的订餐电话“{shop_tel}”。','{shop_name}，{city_name}{shop_name}，{shop_tel}','{shop_name}是{city_name}{shop_name}最优秀的外卖企业。'),(28,'ele_shop','订餐详情','{city_name}{sitename}点餐页','{sitename}','{sitename}外卖，是最好的外卖。'),(29,'ele_index','餐饮美食首页','点外卖上{city_name}{sitename}','{city_name}{sitename}外卖，{city_name}{sitename}点餐，{city_name}{sitename}包厢，{city_name}{sitename}送餐','{city_name}当地做好的外卖网站。'),(30,'life_index','分类搜索页','{city_name}新{channel_name}{cate_name}- {sitename}分类信息网！','{city_name}分类信息网,{sitename}新{channel_name}{cate_name},{area_name}{business_name}新{channel_name}{cate_name}','{city_name}{channel_name}{cate_name}频道为您提供{channel_name}{cate_name}信息，在此有大量{channel_name}{cate_name}信息供您选择，您可以免费查看和发布{channel_name}{cate_name}信息。'),(31,'life_detail','生活信息详情\r\n','{title} - {city_name}{channel} {cate}- {sitename}','{text1}{channel}{cate},价格{num},{title},{channel}{cate}','{desc}-{sitename}。'),(32,'life_main','分类信息首页','{city_name}分类信息网-免费发布信息-{sitename}信息网','{city_name},{city_name}分类信息,{city_name}免费发布分类信息，{city_name}{city_name}网','{city_name}分类信息网为您提供中国分类信息，您可以免费查找{city_name}最新最全的二手物品交易、二手车买卖、房屋租售、宠物、招聘、兼职、求职、交友活动、生活服务信息。免费发布尽在找啥有分类信息网。'),(33,'life_fabu','发布生活信息','{city_name}发布生活信息','{city_name}发布生活信息','{city_name}发布生活信息'),(34,'shop_apply','企业入驻','{city_name}企业入驻申请','{city_name}企业入驻申请','{city_name}企业入驻申请，做一个优秀发本地O2O平台。'),(36,'ele_main','餐饮美食主页','点外卖上{city_name}{sitename}','{city_name}{sitename}外卖，{city_name}{sitename}点餐，{city_name}{sitename}包厢，{city_name}{sitename}送餐','{city_name}当地做好的外卖网站。'),(37,'ele_takeout','外卖点餐','{city_name}{sitename}点餐首页','{city_name}{sitename}点餐','最好的外卖网站，{city_name}{sitename}网。'),(38,'ele_pay','订单支付页面','{city_name}外卖订单支付','订单支付','订单支付-{sitename}'),(39,'tuan_main','抢购首页','{sitename}-{sitename}网抢购-超人气抢购网站-抢购上{sitename}','抢购,{city_name},{sitename},{sitename}抢购,{sitename}抢购网,抢购大全','{city_name}{sitename}抢购，是做好的在线抢购网站！'),(41,'billboard_index','榜单首页','{city_name}{sitename}榜单首页','{city_name}{sitename}榜单，{city_name}{sitename}企业排行榜，{city_name}{sitename}抢购排行，{city_name}{sitename}商品排行','{city_name}{sitename}权威的数据中心。'),(42,'billboard_bdlist','榜单内容','{city_name}{cate_name} 榜单','{city_name}{cate_name}， {city_name}{sitename}','{city_name}{sitename}榜单中心。'),(43,'billborder_bddetails','榜单详情','{title}-{city_name}{sitename}','{title},{city_name}{sitename}','{city_name}{sitename}榜单排行网站。'),(44,'jifen_detail','积分主页','{title}{city_name}{sitename}','{price},{num},{title},{sitename}','{details}'),(45,'jifen_inex','积分首页','{city_name}{sitename}一积分兑换','{city_name}积分兑换，{city_name}积分，{city_name}礼品兑换，{city_name}兑换商品，{sitename}','可用积分在{city_name}{sitename}上兑换商品哦！'),(63,'appoint_index','\r\n1、{area_name}地区\r\n2、{cate_name}\r\n3、{business_name}','{city_name}{area_name}{business_name}{cate_name}家政，预约家政来{sitename}','{city_name}{area_name}{business_name}{cate_name}家政，预约家政来{sitename}','{city_name}{area_name}{business_name}{cate_name}家政，预约家政来{sitename}'),(64,'appoint_detail','{city_name}详情页','{title} -{city_name}{sitename}','{cate_area},{cate_business},{cate_name},{shop_name},{city_name}家政,{sitename}{city_name}站,{sitename}','{intro}');

/*Table structure for table `tu_session` */

DROP TABLE IF EXISTS `tu_session`;

CREATE TABLE `tu_session` (
  `session_id` varchar(64) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_session` */

insert  into `tu_session`(`session_id`,`session_expire`,`session_data`) values ('9bk2cikgvh22cd16iv345j2dp0',1575343035,'state%7Cs%3A32%3A%221328e95df0318c24dd5fdc157b79b4b3%22%3Bbackurl%7Cs%3A23%3A%22%2Fwap%2Fjob%2FvipRouter.html%22%3B'),('eu5bmjmuggs2htctevo44dfjk5',1575343037,'state%7Cs%3A32%3A%22618fb140d00fd31dd2dbaf5bb9250dcb%22%3Bbackurl%7Cs%3A27%3A%22%2Fwap%2Fapi%2Fqrcode%2Ffuid%2F6.html%22%3B'),('bj1e452p2ar4pt2uic1bf7rjq5',1575343070,'state%7Cs%3A32%3A%226e2587d302c2214f516d614f86540a33%22%3Bbackurl%7Cs%3A21%3A%22%2Fwap%2Findex%2Findex.html%22%3B'),('t0lvko6nbrq0ht05lbei94en16',1575342694,'verify%7Cs%3A4%3A%22OIYH%22%3Buser_index_list%7Ca%3A1%3A%7Bs%3A6%3A%22closed%22%3Ba%3A2%3A%7Bi%3A0%3Bs%3A2%3A%22IN%22%3Bi%3A1%3Bs%3A4%3A%220%2C-1%22%3B%7D%7D'),('vh4f900mnqlh63jgian0ukh1o4',1575343317,'state%7Cs%3A32%3A%2202839e51f73ab788574462f788f89cfb%22%3Bbackurl%7Cs%3A21%3A%22%2Fwap%2Findex%2Findex.html%22%3Bconnect%7Ci%3A3%3B'),('vs2jngk51num1jfosqacqi4ff7',1575343329,'state%7Cs%3A32%3A%2234f24100128be98490eec410abc7fc3d%22%3Bbackurl%7Cs%3A21%3A%22%2Fwap%2Findex%2Findex.html%22%3Bverify%7Cs%3A4%3A%22BVFO%22%3Badmin%7Ca%3A17%3A%7Bs%3A8%3A%22admin_id%22%3Bs%3A1%3A%221%22%3Bs%3A8%3A%22username%22%3Bs%3A5%3A%22admin%22%3Bs%3A8%3A%22password%22%3Bs%3A32%3A%227fef6171469e80d32c0559f88b377245%22%3Bs%3A7%3A%22role_id%22%3Bs%3A1%3A%221%22%3Bs%3A7%3A%22city_id%22%3Bs%3A1%3A%220%22%3Bs%3A6%3A%22mobile%22%3Bs%3A11%3A%2215000000000%22%3Bs%3A14%3A%22lock_admin_mum%22%3Bs%3A1%3A%220%22%3Bs%3A13%3A%22is_admin_lock%22%3Bs%3A1%3A%220%22%3Bs%3A18%3A%22is_admin_lock_time%22%3Bs%3A1%3A%220%22%3Bs%3A11%3A%22create_time%22%3Bs%3A10%3A%221441880203%22%3Bs%3A9%3A%22create_ip%22%3Bs%3A9%3A%22127.0.0.1%22%3Bs%3A9%3A%22last_time%22%3Bs%3A10%3A%221575333521%22%3Bs%3A7%3A%22last_ip%22%3Bs%3A13%3A%2227.222.98.103%22%3Bs%3A5%3A%22is_ip%22%3Bs%3A1%3A%220%22%3Bs%3A16%3A%22is_username_lock%22%3Bs%3A1%3A%220%22%3Bs%3A6%3A%22closed%22%3Bs%3A1%3A%220%22%3Bs%3A9%3A%22role_name%22%3Bs%3A15%3A%22%E7%B3%BB%E7%BB%9F%E7%AE%A1%E7%90%86%E5%91%98%22%3B%7D'),('qb15pqi9s60hs6prqc0c9ffl90',1575343000,'state%7Cs%3A32%3A%222a4374bedba1876e8a1f453d31ff4762%22%3Bbackurl%7Cs%3A21%3A%22%2Fwap%2Findex%2Findex.html%22%3Bconnect%7Ci%3A2%3B'),('p19j5rts4q1pvdm7j83d7panq0',1575343002,'state%7Cs%3A32%3A%224ed3a142511afdd15d629a1d67932b66%22%3Bbackurl%7Cs%3A21%3A%22%2Fwap%2Findex%2Findex.html%22%3B'),('m55kogefplrceai3klur6rgk65',1575343010,'state%7Cs%3A32%3A%22cb8da295f2dfb509d8d084f3c0a9ccc0%22%3Bbackurl%7Cs%3A39%3A%22%2Fwap%2Fcity%2Fchange%2Fcity_id%2F33%2Ftype%2F3.html%22%3B'),('iba1haih4331hr4ghji6q9b0b2',1575343334,'state%7Cs%3A32%3A%2215fbcc8d5736ec5107441c220820bd60%22%3Bbackurl%7Cs%3A21%3A%22%2Fwap%2Findex%2Findex.html%22%3Bverify%7Cs%3A4%3A%22VCJP%22%3Badmin%7Ca%3A17%3A%7Bs%3A8%3A%22admin_id%22%3Bs%3A1%3A%221%22%3Bs%3A8%3A%22username%22%3Bs%3A5%3A%22admin%22%3Bs%3A8%3A%22password%22%3Bs%3A32%3A%227fef6171469e80d32c0559f88b377245%22%3Bs%3A7%3A%22role_id%22%3Bs%3A1%3A%221%22%3Bs%3A7%3A%22city_id%22%3Bs%3A1%3A%220%22%3Bs%3A6%3A%22mobile%22%3Bs%3A11%3A%2215000000000%22%3Bs%3A14%3A%22lock_admin_mum%22%3Bs%3A1%3A%220%22%3Bs%3A13%3A%22is_admin_lock%22%3Bs%3A1%3A%220%22%3Bs%3A18%3A%22is_admin_lock_time%22%3Bs%3A1%3A%220%22%3Bs%3A11%3A%22create_time%22%3Bs%3A10%3A%221441880203%22%3Bs%3A9%3A%22create_ip%22%3Bs%3A9%3A%22127.0.0.1%22%3Bs%3A9%3A%22last_time%22%3Bs%3A10%3A%221575339604%22%3Bs%3A7%3A%22last_ip%22%3Bs%3A13%3A%22119.178.17.23%22%3Bs%3A5%3A%22is_ip%22%3Bs%3A1%3A%220%22%3Bs%3A16%3A%22is_username_lock%22%3Bs%3A1%3A%220%22%3Bs%3A6%3A%22closed%22%3Bs%3A1%3A%220%22%3Bs%3A9%3A%22role_name%22%3Bs%3A15%3A%22%E7%B3%BB%E7%BB%9F%E7%AE%A1%E7%90%86%E5%91%98%22%3B%7Duser_index_list%7Ca%3A1%3A%7Bs%3A6%3A%22closed%22%3Ba%3A2%3A%7Bi%3A0%3Bs%3A2%3A%22IN%22%3Bi%3A1%3Bs%3A4%3A%220%2C-1%22%3B%7D%7D');

/*Table structure for table `tu_setting` */

DROP TABLE IF EXISTS `tu_setting`;

CREATE TABLE `tu_setting` (
  `k` varchar(255) DEFAULT NULL,
  `v` text,
  UNIQUE KEY `k` (`k`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_setting` */

insert  into `tu_setting`(`k`,`v`) values ('site','a:38:{s:8:\"sitename\";s:9:\"工作网\";s:4:\"host\";s:33:\"http://zhaopin.weixinguanfang.com\";s:5:\"https\";s:1:\"0\";s:6:\"hostdo\";s:18:\"weixinguanfang.com\";s:11:\"host_prefix\";s:7:\"zhaopin\";s:6:\"imgurl\";s:26:\"zhaopin.weixinguanfang.com\";s:7:\"android\";s:0:\"\";s:3:\"ios\";s:0:\"\";s:4:\"logo\";s:0:\"\";s:6:\"wxcode\";s:0:\"\";s:2:\"qq\";s:0:\"\";s:3:\"tel\";s:0:\"\";s:5:\"email\";s:0:\"\";s:3:\"icp\";s:0:\"\";s:5:\"title\";s:0:\"\";s:7:\"keyword\";s:9:\"工作网\";s:11:\"description\";s:9:\"工作网\";s:8:\"headinfo\";s:0:\"\";s:6:\"tongji\";s:0:\"\";s:7:\"city_id\";s:2:\"33\";s:3:\"lng\";s:10:\"115.991983\";s:3:\"lat\";s:9:\"36.518393\";s:5:\"goods\";s:0:\"\";s:3:\"ele\";s:0:\"\";s:6:\"market\";s:0:\"\";s:5:\"store\";s:0:\"\";s:9:\"postaudit\";s:1:\"0\";s:10:\"replyaudit\";s:1:\"0\";s:17:\"xiaoqu_post_audit\";s:1:\"0\";s:18:\"xiaoqu_reply_audit\";s:1:\"0\";s:19:\"article_reply_audit\";s:1:\"0\";s:17:\"xiaoqu_news_audit\";s:1:\"0\";s:10:\"tribeaudit\";s:1:\"0\";s:15:\"fabu_life_audit\";s:1:\"0\";s:13:\"config_mobile\";s:11:\"18864874770\";s:12:\"config_email\";s:0:\"\";s:9:\"web_close\";s:1:\"1\";s:15:\"web_close_title\";s:0:\"\";}'),('attachs','a:54:{s:15:\"pic_wap_quality\";a:1:{s:5:\"thumb\";s:2:\"80\";}s:14:\"pic_pc_quality\";a:1:{s:5:\"thumb\";s:2:\"80\";}s:8:\"shoplogo\";a:1:{s:5:\"thumb\";s:7:\"150X150\";}s:16:\"shop_environment\";a:1:{s:5:\"thumb\";s:7:\"600X400\";}s:8:\"sitelogo\";a:1:{s:5:\"thumb\";s:6:\"180X55\";}s:8:\"shopnews\";a:1:{s:5:\"thumb\";s:7:\"260X260\";}s:11:\"lifeservice\";a:2:{s:5:\"thumb\";s:7:\"350X285\";s:4:\"icon\";s:6:\"120X80\";}s:8:\"activity\";a:1:{s:5:\"thumb\";s:7:\"470X275\";}s:6:\"coupon\";a:1:{s:5:\"thumb\";s:7:\"577X430\";}s:5:\"cloud\";a:1:{s:5:\"thumb\";s:7:\"410X380\";}s:7:\"article\";a:1:{s:5:\"thumb\";s:7:\"260X260\";}s:13:\"integralgoods\";a:1:{s:5:\"thumb\";s:7:\"350X350\";}s:4:\"dian\";a:1:{s:5:\"thumb\";s:7:\"340X270\";}s:8:\"dingroom\";a:1:{s:5:\"thumb\";s:7:\"340X270\";}s:12:\"shopdianping\";a:1:{s:5:\"thumb\";s:7:\"380X260\";}s:8:\"dianping\";a:1:{s:5:\"thumb\";s:7:\"300X200\";}s:4:\"user\";a:1:{s:5:\"thumb\";a:3:{s:5:\"thumb\";s:7:\"200X200\";s:6:\"middle\";s:7:\"120X120\";s:5:\"small\";s:5:\"60X60\";}}s:9:\"shopphoto\";a:1:{s:5:\"thumb\";s:7:\"300X300\";}s:9:\"recommend\";a:1:{s:5:\"thumb\";s:7:\"180X180\";}s:4:\"tuan\";a:1:{s:5:\"thumb\";s:7:\"480X275\";}s:4:\"life\";a:1:{s:5:\"thumb\";s:7:\"320X320\";}s:7:\"lifepic\";a:1:{s:5:\"thumb\";s:7:\"600X400\";}s:5:\"tieba\";a:1:{s:5:\"thumb\";s:7:\"300X200\";}s:6:\"weixin\";a:1:{s:5:\"thumb\";s:7:\"320X120\";}s:5:\"goods\";a:1:{s:5:\"thumb\";s:7:\"470X250\";}s:10:\"shopbanner\";a:1:{s:5:\"thumb\";s:7:\"320X120\";}s:11:\"shopbanner1\";a:1:{s:5:\"thumb\";s:8:\"1000X300\";}s:10:\"eleproduct\";a:1:{s:5:\"thumb\";s:7:\"300X300\";}s:8:\"dingmenu\";a:1:{s:5:\"thumb\";s:7:\"600X450\";}s:10:\"weidianpic\";a:1:{s:5:\"thumb\";s:7:\"640X320\";}s:10:\"shop_audit\";a:1:{s:5:\"thumb\";s:8:\"1000X800\";}s:7:\"village\";a:1:{s:5:\"thumb\";s:7:\"400X300\";}s:14:\"village_worker\";a:1:{s:5:\"thumb\";s:7:\"150X150\";}s:6:\"xiaoqu\";a:1:{s:5:\"thumb\";s:7:\"640X320\";}s:2:\"ad\";a:1:{s:5:\"thumb\";s:7:\"640X320\";}s:5:\"hotle\";a:1:{s:5:\"thumb\";s:7:\"400X300\";}s:6:\"pinche\";a:1:{s:5:\"thumb\";s:7:\"640X320\";}s:7:\"appoint\";a:1:{s:5:\"thumb\";s:7:\"300X200\";}s:18:\"appoint_cate_photo\";a:1:{s:5:\"thumb\";s:5:\"80X80\";}s:16:\"appoint_dianping\";a:1:{s:5:\"thumb\";s:7:\"300X200\";}s:14:\"appoint_worker\";a:1:{s:5:\"thumb\";s:7:\"200X300\";}s:19:\"delivery_user_photo\";a:1:{s:5:\"thumb\";s:7:\"600X450\";}s:11:\"thread_logo\";a:1:{s:5:\"thumb\";s:7:\"160X160\";}s:13:\"thread_banner\";a:1:{s:5:\"thumb\";s:8:\"1200X260\";}s:6:\"thread\";a:1:{s:5:\"thumb\";s:7:\"300X200\";}s:7:\"running\";a:1:{s:5:\"thumb\";s:7:\"400X300\";}s:4:\"rank\";a:1:{s:5:\"thumb\";s:5:\"80X80\";}s:3:\"zhe\";a:1:{s:5:\"thumb\";s:7:\"280X215\";}s:19:\"zhe_card_background\";a:1:{s:5:\"thumb\";s:7:\"534X318\";}s:3:\"edu\";a:1:{s:5:\"thumb\";s:7:\"400X300\";}s:6:\"course\";a:1:{s:5:\"thumb\";s:7:\"400X300\";}s:4:\"book\";a:1:{s:5:\"thumb\";s:7:\"400X300\";}s:5:\"hotel\";a:1:{s:5:\"thumb\";s:7:\"400X300\";}s:6:\"editor\";a:1:{s:5:\"thumb\";s:7:\"600X600\";}}'),('ucenter','a:15:{s:7:\"charset\";s:1:\"0\";s:10:\"UC_CONNECT\";s:5:\"mysql\";s:9:\"UC_DBHOST\";s:9:\"localhost\";s:9:\"UC_DBUSER\";s:4:\"root\";s:7:\"UC_DBPW\";s:6:\"123456\";s:9:\"UC_DBNAME\";s:6:\"ultrax\";s:12:\"UC_DBCHARSET\";s:4:\"utf8\";s:13:\"UC_DBTABLEPRE\";s:19:\"ultrax.pre_ucenter_\";s:12:\"UC_DBCONNECT\";s:1:\"0\";s:6:\"UC_KEY\";s:39:\"9ee6F9YQ0bzQof9b9RTbUIORIvL2f8DQEmakk6Q\";s:6:\"UC_API\";s:29:\"http://www.test.com/uc_server\";s:10:\"UC_CHARSET\";s:5:\"utf-8\";s:5:\"UC_IP\";s:0:\"\";s:8:\"UC_APPID\";s:1:\"2\";s:6:\"UC_PPP\";s:2:\"20\";}'),('sms','a:11:{s:5:\"dxapi\";s:2:\"bo\";s:3:\"url\";s:96:\"http://api.smsbao.com/sms?u=nlgliuyang&p=3ccd69fda19bef1f2f7a10d62db78619&m={mobile}&c={content}\";s:7:\"charset\";s:1:\"0\";s:15:\"sms_bao_account\";s:10:\"nlgliuyang\";s:16:\"sms_bao_password\";s:7:\"3832050\";s:4:\"code\";s:0:\"\";s:12:\"dayu_version\";s:1:\"0\";s:4:\"sign\";s:0:\"\";s:5:\"dykey\";s:0:\"\";s:8:\"dysecret\";s:0:\"\";s:10:\"yunpianApi\";s:0:\"\";}'),('mail','a:5:{s:4:\"smtp\";s:11:\"smtp.qq.com\";s:4:\"port\";s:3:\"587\";s:8:\"username\";s:16:\"286099981@qq.com\";s:8:\"password\";s:6:\"312312\";s:4:\"from\";s:16:\"286099981@qq.com\";}'),('weixin','a:15:{s:5:\"token\";s:32:\"ocmgarixts23jdpwocmgarixts23jdpb\";s:5:\"appid\";s:18:\"wxd6b2365cb2a420b0\";s:9:\"appsecret\";s:32:\"096f4c94a36bf265d5b3e176c9aa7b3f\";s:2:\"id\";s:15:\"gh_938fc0e4c936\";s:4:\"type\";s:1:\"1\";s:11:\"description\";s:24:\"你好，欢迎关注！\";s:5:\"title\";s:27:\"你还，欢迎关注我们\";s:7:\"linkurl\";s:22:\"http://www.lzamai.com/\";s:5:\"photo\";s:54:\"http://images4.5maiche.cn/2016-05-21_57406ca94935d.jpg\";s:9:\"user_auto\";s:1:\"1\";s:8:\"user_add\";s:1:\"1\";s:12:\"is_subscribe\";s:1:\"1\";s:4:\"bind\";s:1:\"1\";s:11:\"home_follow\";s:1:\"1\";s:5:\"gourl\";s:33:\"http://zhaopin.weixinguanfang.com\";}'),('integral','a:24:{s:3:\"buy\";s:1:\"0\";s:10:\"is_restore\";s:1:\"1\";s:12:\"restore_type\";s:1:\"3\";s:14:\"restore_points\";s:1:\"0\";s:16:\"is_goods_restore\";s:1:\"1\";s:14:\"is_ele_restore\";s:1:\"1\";s:15:\"is_tuan_restore\";s:1:\"1\";s:15:\"return_integral\";s:1:\"0\";s:6:\"return\";s:1:\"0\";s:20:\"tuan_return_integral\";s:1:\"0\";s:20:\"mall_return_integral\";s:1:\"0\";s:17:\"integral_exchange\";s:1:\"1\";s:21:\"integral_exchange_tax\";s:1:\"0\";s:23:\"integral_exchange_small\";s:2:\"10\";s:21:\"integral_exchange_big\";s:4:\"1000\";s:5:\"share\";s:1:\"5\";s:5:\"reply\";s:1:\"1\";s:6:\"mobile\";s:3:\"100\";s:5:\"email\";s:3:\"100\";s:4:\"sign\";s:1:\"5\";s:8:\"register\";s:3:\"188\";s:7:\"useraux\";s:1:\"5\";s:9:\"firstsign\";s:2:\"50\";s:4:\"life\";s:1:\"1\";}'),('connect','a:5:{s:5:\"debug\";s:1:\"1\";s:9:\"qq_app_id\";s:9:\"286099981\";s:10:\"qq_app_key\";s:31:\"b2e2c379cf030301674de38bda0ef95\";s:9:\"wb_app_id\";s:9:\"286099981\";s:10:\"wb_app_key\";s:32:\"b2e2c379cf0304301674de38bda0ef95\";}'),('prestige','a:11:{s:4:\"name\";s:12:\"分红积分\";s:8:\"activate\";s:3:\"100\";s:20:\"is_transfer_accounts\";s:1:\"1\";s:8:\"is_goods\";s:1:\"1\";s:5:\"login\";s:1:\"1\";s:13:\"dianping_shop\";s:1:\"1\";s:6:\"thread\";s:1:\"1\";s:6:\"mobile\";s:2:\"10\";s:5:\"email\";s:2:\"10\";s:4:\"sign\";s:1:\"1\";s:7:\"useraux\";s:2:\"50\";}'),('weixinmenu','a:2:{s:6:\"button\";a:3:{i:1;a:2:{s:4:\"name\";s:6:\"首页\";s:3:\"url\";s:0:\"\";}i:2;a:2:{s:4:\"name\";s:6:\"新版\";s:3:\"url\";s:0:\"\";}i:3;a:2:{s:4:\"name\";s:6:\"一级\";s:3:\"url\";s:0:\"\";}}s:5:\"child\";a:3:{i:1;a:5:{i:1;a:2:{s:4:\"name\";s:7:\"外卖2\";s:3:\"url\";s:30:\"http://zhaopin.weixinguanfang.com/wap/ele/\";}i:2;a:2:{s:4:\"name\";s:7:\"商城2\";s:3:\"url\";s:26:\"http://zhaopin.weixinguanfang.com/wap/\";}i:3;a:2:{s:4:\"name\";s:7:\"企业3\";s:3:\"url\";s:30:\"http://zhaopin.weixinguanfang.com/wap/shop\";}i:4;a:2:{s:4:\"name\";s:9:\"自媒体\";s:3:\"url\";s:30:\"http://zhaopin.weixinguanfang.com/wap/news\";}i:5;a:2:{s:4:\"name\";s:12:\"分类信息\";s:3:\"url\";s:25:\"http://zhaopin.weixinguanfang.com/wap\";}}i:2;a:5:{i:1;a:2:{s:4:\"name\";s:6:\"团购\";s:3:\"url\";s:30:\"http://zhaopin.weixinguanfang.com/wap/tuan\";}i:2;a:2:{s:4:\"name\";s:15:\"一元云购物\";s:3:\"url\";s:31:\"http://zhaopin.weixinguanfang.com/wap/cloud\";}i:3;a:2:{s:4:\"name\";s:6:\"家政\";s:3:\"url\";s:37:\"http://zhaopin.weixinguanfang.com/wap/lifeservice\";}i:4;a:2:{s:4:\"name\";s:6:\"小区\";s:3:\"url\";s:35:\"http://zhaopin.weixinguanfang.com/wap/community\";}i:5;a:2:{s:4:\"name\";s:12:\"社区村镇\";s:3:\"url\";s:33:\"http://zhaopin.weixinguanfang.com/wap/village\";}}i:3;a:5:{i:1;a:2:{s:4:\"name\";s:13:\"店员管理1\";s:3:\"url\";s:28:\"http://zhaopin.weixinguanfang.com/worker\";}i:2;a:2:{s:4:\"name\";s:13:\"小区管理2\";s:3:\"url\";s:26:\"http://zhaopin.weixinguanfang.com/wuye\";}i:3;a:2:{s:4:\"name\";s:13:\"商户管理3\";s:3:\"url\";s:28:\"http://zhaopin.weixinguanfang.com/seller\";}i:4;a:2:{s:4:\"name\";s:13:\"物流平台4\";s:3:\"url\";s:29:\"http://zhaopin.weixinguanfang.comdelivery\";}i:5;a:2:{s:4:\"name\";s:12:\"会员中心\";s:3:\"url\";s:26:\"http://zhaopin.weixinguanfang.com/user\";}}}}'),('shop','a:6:{s:11:\"is_shop_zan\";s:1:\"1\";s:11:\"day_zan_num\";s:1:\"5\";s:16:\"day_shop_zan_num\";s:1:\"2\";s:19:\"zan_reward_integral\";s:1:\"1\";s:17:\"shop_apply_prrice\";s:0:\"\";s:4:\"time\";i:1507981174;}'),('mobile','a:11:{s:7:\"amazeui\";s:1:\"1\";s:14:\"delivery_price\";s:1:\"3\";s:18:\"data_shop_dianping\";s:1:\"1\";s:18:\"data_tuan_dianping\";s:1:\"1\";s:20:\"data_waimai_dianping\";s:1:\"1\";s:21:\"data_booking_dianping\";s:1:\"1\";s:18:\"data_mall_dianping\";s:1:\"1\";s:21:\"data_appoint_dianping\";s:1:\"1\";s:19:\"data_hotel_dianping\";s:1:\"1\";s:18:\"data_farm_dianping\";s:1:\"1\";s:17:\"data_edu_dianping\";s:1:\"1\";}'),('ele','a:4:{s:19:\"tableware_price_max\";s:3:\"1.3\";s:20:\"tableware_price_mini\";s:1:\"0\";s:23:\"past_due_ele_order_time\";s:2:\"15\";s:4:\"time\";i:1511154791;}'),('housework','a:2:{s:5:\"money\";s:2:\"10\";s:3:\"num\";s:1:\"3\";}'),('weidian','a:5:{s:10:\"bianlidian\";s:2:\"16\";s:11:\"xianhuadian\";s:2:\"33\";s:13:\"shengxiandian\";s:2:\"44\";s:9:\"kaoyadian\";s:1:\"2\";s:10:\"dangaodian\";s:2:\"43\";}'),('mall','a:16:{s:5:\"ming1\";s:9:\"烤鸭店\";s:5:\"dian1\";s:1:\"1\";s:5:\"ming2\";s:9:\"蛋糕店\";s:5:\"dian2\";s:1:\"9\";s:5:\"ming3\";s:9:\"鲜花店\";s:5:\"dian3\";s:2:\"10\";s:5:\"ming4\";s:9:\"水果店\";s:5:\"dian4\";s:2:\"11\";s:5:\"ming5\";s:9:\"便利店\";s:5:\"dian5\";s:2:\"12\";s:5:\"ming6\";s:9:\"坚果店\";s:5:\"dian6\";s:1:\"6\";s:5:\"ming7\";s:9:\"奶茶店\";s:5:\"dian7\";s:1:\"7\";s:5:\"ming8\";s:9:\"茶叶店\";s:5:\"dian8\";s:1:\"8\";}'),('quanming','a:21:{s:7:\"content\";s:30:\"全民经济人内容描述。\";s:5:\"intro\";s:36:\"全民经济人活动规则描述。\";s:7:\"is_tuan\";s:1:\"1\";s:7:\"is_mall\";s:1:\"0\";s:6:\"is_ele\";s:1:\"0\";s:8:\"is_money\";s:1:\"0\";s:5:\"money\";s:3:\"300\";s:9:\"money_day\";s:2:\"90\";s:6:\"money1\";s:1:\"1\";s:6:\"money2\";s:1:\"2\";s:6:\"money3\";s:1:\"3\";s:6:\"money4\";s:1:\"4\";s:6:\"money5\";s:1:\"5\";s:6:\"money6\";s:1:\"6\";s:4:\"rate\";s:1:\"5\";s:5:\"rate1\";s:1:\"1\";s:5:\"rate2\";s:1:\"2\";s:5:\"rate3\";s:1:\"3\";s:5:\"rate4\";s:1:\"4\";s:5:\"rate5\";s:1:\"5\";s:5:\"rate6\";s:1:\"6\";}'),('other','a:14:{s:15:\"pc_search_title\";s:15:\"后台可配置\";s:16:\"wap_search_title\";s:9:\"鸡公煲\";s:5:\"color\";s:7:\"#2fbdaa\";s:8:\"url_jump\";s:1:\"1\";s:6:\"footer\";s:1:\"1\";s:14:\"wap_navigation\";s:1:\"0\";s:11:\"footer_menu\";s:1:\"6\";s:17:\"check_connect_uid\";s:1:\"1\";s:15:\"index_mask_show\";s:1:\"1\";s:17:\"index_mask_cookie\";s:2:\"12\";s:16:\"index_mask_title\";s:12:\"测试标题\";s:16:\"index_mask_intro\";s:15:\"测试副标题\";s:19:\"index_mask_textarea\";s:105:\"1、一卡在手，全城打折。<br>\r\n2、可打折，可积分。<br>\r\n3、优惠期间8折购卡。\r\n\";s:14:\"index_mask_url\";s:1:\"#\";}'),('register','a:12:{s:21:\"register_distribution\";s:1:\"1\";s:16:\"register_service\";s:1:\"1\";s:20:\"register_service_url\";s:21:\"http://zhaopin.weixinguanfang.com\";s:15:\"register_mobile\";s:1:\"0\";s:12:\"register_yzm\";s:1:\"0\";s:17:\"register_password\";s:1:\"4\";s:16:\"wap_register_yzm\";s:1:\"0\";s:22:\"wap_register_password2\";s:1:\"0\";s:18:\"register_lock_numl\";s:1:\"5\";s:21:\"register_is_lock_time\";s:3:\"900\";s:24:\"register_register_ip_num\";s:1:\"5\";s:30:\"register_register_is_lock_time\";s:3:\"600\";}'),('operation','a:27:{s:6:\"pchome\";s:1:\"0\";s:4:\"mall\";s:1:\"1\";s:3:\"ele\";s:1:\"1\";s:6:\"market\";s:1:\"1\";s:5:\"store\";s:1:\"1\";s:4:\"tuan\";s:1:\"1\";s:7:\"appoint\";s:1:\"1\";s:4:\"book\";s:1:\"1\";s:5:\"stock\";s:1:\"1\";s:7:\"booking\";s:1:\"1\";s:3:\"ktv\";s:1:\"1\";s:3:\"edu\";s:1:\"1\";s:5:\"crowd\";s:1:\"1\";s:6:\"hotels\";s:1:\"1\";s:4:\"farm\";s:1:\"1\";s:7:\"running\";s:1:\"1\";s:3:\"zhe\";s:1:\"1\";s:6:\"thread\";s:1:\"1\";s:6:\"pinche\";s:1:\"1\";s:4:\"news\";s:1:\"1\";s:4:\"life\";s:1:\"1\";s:5:\"jifen\";s:1:\"1\";s:6:\"coupon\";s:1:\"1\";s:5:\"cloud\";s:1:\"1\";s:7:\"huodong\";s:1:\"1\";s:9:\"community\";s:1:\"1\";s:7:\"village\";s:1:\"1\";}'),('share','a:6:{s:9:\"qzone_uid\";s:9:\"421313131\";s:9:\"qzone_key\";s:18:\"857435645634643654\";s:7:\"qwb_uid\";s:6:\"345326\";s:7:\"qwb_key\";s:14:\"56865967235465\";s:9:\"weibo_uid\";s:5:\"24325\";s:9:\"weibo_key\";s:13:\"8645346452124\";}'),('cash','a:30:{s:7:\"is_cash\";s:1:\"1\";s:14:\"is_weixin_cash\";s:1:\"1\";s:14:\"is_alipay_cash\";s:1:\"0\";s:4:\"user\";s:1:\"0\";s:8:\"user_big\";s:1:\"0\";s:20:\"user_cash_commission\";s:1:\"0\";s:4:\"shop\";s:1:\"0\";s:8:\"shop_big\";s:1:\"0\";s:20:\"shop_cash_commission\";s:1:\"0\";s:13:\"renzheng_shop\";s:3:\"200\";s:17:\"renzheng_shop_big\";s:4:\"5000\";s:16:\"user_cash_second\";s:1:\"5\";s:16:\"shop_cash_second\";s:1:\"4\";s:11:\"is_recharge\";s:1:\"1\";s:15:\"recharge_full_1\";s:1:\"0\";s:15:\"recharge_give_1\";s:1:\"0\";s:15:\"recharge_full_2\";s:1:\"0\";s:15:\"recharge_give_2\";s:1:\"0\";s:15:\"recharge_full_3\";s:1:\"0\";s:15:\"recharge_give_3\";s:1:\"0\";s:11:\"is_transfer\";s:1:\"0\";s:18:\"is_transferrank_id\";s:1:\"0\";s:17:\"is_transfer_small\";s:3:\"100\";s:15:\"is_transfer_big\";s:4:\"5000\";s:25:\"is_transfer_interval_time\";s:3:\"900\";s:22:\"is_transfer_commission\";s:1:\"3\";s:20:\"is_recharge_integral\";s:1:\"0\";s:24:\"return_recharge_integral\";s:1:\"1\";s:20:\"is_recharge_prestige\";s:1:\"0\";s:24:\"return_recharge_prestige\";s:3:\"100\";}'),('collects','a:3:{s:4:\"open\";s:1:\"1\";s:9:\"community\";s:1:\"4\";s:4:\"shop\";s:1:\"9\";}'),('search','a:1:{s:7:\"keyword\";s:27:\"搜抢购、企业、小区\";}'),('sms_shop','a:4:{s:14:\"sms_shop_money\";s:4:\"0.06\";s:14:\"sms_shop_small\";s:3:\"100\";s:12:\"sms_shop_big\";s:4:\"1000\";s:14:\"shop_audit_sms\";s:2:\"80\";}'),('profit','a:46:{s:6:\"profit\";s:1:\"1\";s:13:\"profit_expire\";s:2:\"72\";s:18:\"profit_min_rank_id\";s:1:\"0\";s:16:\"profit_integral1\";s:2:\"20\";s:16:\"profit_integral2\";s:2:\"10\";s:16:\"profit_integral3\";s:1:\"5\";s:16:\"profit_prestige1\";s:3:\"100\";s:16:\"profit_prestige2\";s:2:\"50\";s:16:\"profit_prestige3\";s:2:\"10\";s:14:\"profit_is_tuan\";s:1:\"0\";s:13:\"profit_is_ele\";s:1:\"0\";s:16:\"profit_is_market\";s:1:\"0\";s:15:\"profit_is_store\";s:1:\"0\";s:14:\"profit_is_farm\";s:1:\"0\";s:15:\"profit_is_goods\";s:1:\"0\";s:17:\"profit_is_booking\";s:1:\"0\";s:15:\"profit_is_hotel\";s:1:\"0\";s:16:\"profit_is_breaks\";s:1:\"0\";s:13:\"profit_is_zhe\";s:1:\"0\";s:20:\"profit_buy_user_rank\";s:1:\"0\";s:21:\"profit_buy_shop_grade\";s:1:\"0\";s:17:\"profit_price_type\";s:1:\"1\";s:21:\"currency_profit_rate1\";s:1:\"3\";s:21:\"currency_profit_rate2\";s:1:\"2\";s:21:\"currency_profit_rate3\";s:1:\"1\";s:18:\"goods_profit_rate1\";s:1:\"4\";s:18:\"goods_profit_rate2\";s:1:\"3\";s:18:\"goods_profit_rate3\";s:1:\"2\";s:18:\"hotel_profit_rate1\";s:1:\"5\";s:18:\"hotel_profit_rate2\";s:1:\"4\";s:18:\"hotel_profit_rate3\";s:1:\"3\";s:17:\"farm_profit_rate1\";s:1:\"6\";s:17:\"farm_profit_rate2\";s:1:\"5\";s:17:\"farm_profit_rate3\";s:1:\"4\";s:16:\"zhe_profit_rate1\";s:1:\"8\";s:16:\"zhe_profit_rate2\";s:1:\"7\";s:16:\"zhe_profit_rate3\";s:1:\"6\";s:17:\"rank_profit_rate1\";s:1:\"7\";s:17:\"rank_profit_rate2\";s:1:\"6\";s:17:\"rank_profit_rate3\";s:1:\"5\";s:18:\"grade_profit_rate1\";s:1:\"8\";s:18:\"grade_profit_rate2\";s:1:\"7\";s:18:\"grade_profit_rate3\";s:1:\"6\";s:19:\"breaks_profit_rate1\";s:0:\"\";s:19:\"breaks_profit_rate2\";s:0:\"\";s:19:\"breaks_profit_rate3\";s:0:\"\";}'),('running','a:6:{s:7:\"freight\";s:1:\"1\";s:13:\"interval_time\";s:2:\"60\";s:6:\"prompt\";s:84:\"文字在后台》》站点设置》》其他设置》》跑腿设置里面修改！\";s:10:\"local_addr\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:10:\"thumb_limt\";s:1:\"3\";}'),('pay','a:3:{s:13:\"force_respond\";s:1:\"1\";s:4:\"auto\";s:6:\"weixin\";s:4:\"cash\";s:6:\"weixin\";}'),('community','a:6:{s:5:\"appid\";s:10:\"wmj_X5uOre\";s:9:\"appsecret\";s:26:\"o50SeyBJPT0U841WTmCTidSEBh\";s:6:\"aeskey\";s:20:\"rZge7FSEGM9Y67jQGSpT\";s:27:\"community_phone_expiry_date\";s:3:\"365\";s:23:\"community_phone_orderby\";s:3:\"100\";s:21:\"community_phone_audit\";s:1:\"1\";}'),('appoint','a:4:{s:2:\"d1\";s:12:\"描述相符\";s:2:\"d2\";s:12:\"服务态度\";s:2:\"d3\";s:12:\"快速守时\";s:8:\"contract\";s:1959:\"乙方指定的家政服务人员须遵守以下行为准则：\r\n\r\n　　（1）遵守国家各项法律、法规和社会公德；执行《公民道德建设实施纲要》，自尊自强，爱岗敬业；遵守企业各项规章制度，维护经营者和甲方的合法权益。\r\n\r\n　　（2）遵守职业道德，尊重甲方生活习俗，主动适应甲方，视甲方如亲人，不虐待所照看的老、幼、病、残人员；不泄露甲方隐私；不参与甲方家庭及邻里的矛盾纠纷，不传闲话，以免激化矛盾；不向甲方借钱或索要财物；在离开甲方家庭时，要主动打开自己的包裹让其检查，以示尊重。\r\n\r\n　　（3）遵守合同条款，不无故违约，不无故要求换户或不辞而别。如与甲方发生矛盾，出现甲方侵犯家政服务人员合法权益，或变更服务地址、服务工种等，无论何种原因家政服务人员均应先行告知经营者，不要擅自处理。\r\n\r\n　　（4）努力学习服务技能，完成经营者和甲方安排的工作任务。对不会使用的器具，未经经营者指导和甲方允许不要使用。未经甲方同意不使用其通讯工具和电脑等设备。\r\n\r\n　　（5）保证自身和甲方的安全。不要与异性成、青年人同居一室；不带亲朋好友在甲方家中停留或食宿；不擅自外出或夜不归宿，如有特殊情况不能按时返回，要征得甲方同意；要注意防火、防盗。\r\n\r\n　　第九条 服务人员仪态仪表\r\n\r\n　　乙方指定的家政服务人员须遵守以下仪态仪表要求：\r\n\r\n　　（1）讲究个人卫生，着装整洁大方，不能过于随意，不穿紧身衣裤或过于暴露的服装。\r\n\r\n　　（2）佩戴饰物要适当，不浓妆艳抹，不留长指甲和涂指甲油。\r\n\r\n　　（3）言谈举止大方得体，与甲方交流时要正视对方，不要左顾右盼，不能双臂交叉或双手插在兜里。\r\n\";}'),('goods','a:40:{s:3:\"top\";s:3:\"1.6\";s:11:\"scroll_open\";s:1:\"1\";s:5:\"order\";s:1:\"1\";s:5:\"limit\";s:1:\"6\";s:11:\"scroll_time\";s:4:\"3000\";s:11:\"cate_1_name\";s:7:\"类别1\";s:10:\"cate_1_num\";s:3:\"0.1\";s:11:\"cate_2_name\";s:7:\"类别2\";s:10:\"cate_2_num\";s:3:\"5.6\";s:11:\"cate_3_name\";s:7:\"类别3\";s:10:\"cate_3_num\";s:3:\"5.2\";s:11:\"cate_4_name\";s:7:\"类别4\";s:10:\"cate_4_num\";s:3:\"3.5\";s:11:\"cate_5_name\";s:7:\"类别5\";s:10:\"cate_5_num\";s:3:\"6.5\";s:11:\"cate_6_name\";s:7:\"类别6\";s:10:\"cate_6_num\";s:4:\"45.2\";s:11:\"cate_7_name\";s:7:\"类别7\";s:10:\"cate_7_num\";s:4:\"23.4\";s:11:\"cate_8_name\";s:7:\"类别8\";s:10:\"cate_8_num\";s:4:\"12.4\";s:11:\"cate_9_name\";s:7:\"类别9\";s:10:\"cate_9_num\";s:3:\"2.3\";s:12:\"cate_10_name\";s:8:\"类别10\";s:11:\"cate_10_num\";s:3:\"4.5\";s:12:\"cate_11_name\";s:8:\"类别11\";s:11:\"cate_11_num\";s:4:\"23.0\";s:12:\"cate_12_name\";s:8:\"类别12\";s:11:\"cate_12_num\";s:4:\"12.5\";s:12:\"cate_13_name\";s:8:\"类别13\";s:11:\"cate_13_num\";s:4:\"45.2\";s:12:\"cate_14_name\";s:8:\"类别14\";s:11:\"cate_14_num\";s:4:\"12.9\";s:12:\"cate_15_name\";s:8:\"类别15\";s:11:\"cate_15_num\";s:4:\"23.5\";s:12:\"cate_16_name\";s:8:\"类别16\";s:11:\"cate_16_num\";s:4:\"44.2\";s:12:\"cate_17_name\";s:8:\"类别17\";s:11:\"cate_17_num\";s:5:\"85.25\";s:4:\"time\";i:1509523057;}'),('life','a:10:{s:3:\"top\";s:3:\"0.8\";s:6:\"urgent\";s:3:\"1.0\";s:15:\"packet_top_date\";s:2:\"30\";s:6:\"hb_sxf\";s:0:\"\";s:6:\"ft_xuz\";s:3:\"111\";s:11:\"scroll_open\";s:1:\"1\";s:5:\"order\";s:1:\"1\";s:5:\"limit\";s:2:\"20\";s:11:\"scroll_time\";s:4:\"2000\";s:4:\"time\";i:1526976398;}'),('zhe','a:6:{s:15:\"week_card_price\";s:4:\"19.9\";s:15:\"year_card_price\";s:3:\"168\";s:6:\"number\";s:4:\"8000\";s:12:\"limit_number\";s:1:\"2\";s:19:\"zhe_card_background\";s:54:\"http://images4.5maiche.cn/2016-11-06_581f0445116a0.png\";s:4:\"time\";i:1484217953;}'),('config','a:8:{s:16:\"is_buy_user_rank\";s:1:\"1\";s:16:\"express_api_type\";s:1:\"2\";s:15:\"express_api_key\";s:12:\"BdVvErwV9287\";s:20:\"express_api_customer\";s:32:\"450FC04BC664E61B85FF5D5068AAB887\";s:3:\"map\";s:1:\"1\";s:13:\"baidu_map_api\";s:71:\"https://api.map.baidu.com/api?v=2.0&ak=7b92b3afff29988b6d4dbf9a00698ed8\";s:14:\"google_map_api\";s:0:\"\";s:8:\"iocnfont\";s:48:\"//at.alicdn.com/t/font_295173_pummdrb002uik9.css\";}'),('city','a:1:{s:16:\"apply_city_price\";s:6:\"300000\";}'),('backers','a:5:{s:4:\"open\";s:1:\"1\";s:5:\"intro\";s:75:\"1：申请实名认证，2：申请推手，3：分享二维码推荐下级\";s:9:\"is_reward\";s:1:\"1\";s:11:\"is_discount\";s:1:\"1\";s:4:\"time\";i:1493811843;}'),('village','a:4:{s:12:\"user_is_show\";s:1:\"1\";s:19:\"goods_enter_is_show\";s:1:\"1\";s:18:\"tuan_enter_is_show\";s:1:\"1\";s:4:\"time\";i:1497745385;}'),('pinche','a:2:{s:3:\"top\";s:2:\"50\";s:4:\"time\";i:1511405946;}'),('stock','a:2:{s:9:\"deduction\";s:1:\"3\";s:10:\"settlement\";s:2:\"40\";}'),('market','a:4:{s:19:\"tableware_price_max\";s:3:\"1.3\";s:20:\"tableware_price_mini\";s:0:\"\";s:26:\"past_due_market_order_time\";s:2:\"15\";s:4:\"time\";i:1511161834;}'),('store','a:4:{s:19:\"tableware_price_max\";s:3:\"1.3\";s:20:\"tableware_price_mini\";s:0:\"\";s:25:\"past_due_store_order_time\";s:2:\"15\";s:4:\"time\";i:1505874892;}'),('ad','a:4:{s:10:\"ad_consume\";s:1:\"5\";s:8:\"ad_chief\";s:1:\"2\";s:7:\"ad_user\";s:1:\"1\";s:8:\"ad_month\";s:4:\"2000\";}'),('online','a:4:{s:6:\"userId\";s:10:\"4501260001\";s:10:\"countyType\";s:1:\"1\";s:4:\"code\";s:10:\"4501260001\";s:4:\"name\";s:12:\"不知道啊\";}'),('delivery','a:4:{s:13:\"interval_time\";s:3:\"250\";s:2:\"d1\";s:12:\"描述相符\";s:2:\"d2\";s:12:\"服务态度\";s:2:\"d3\";s:12:\"快速守时\";}');

/*Table structure for table `tu_share_cate` */

DROP TABLE IF EXISTS `tu_share_cate`;

CREATE TABLE `tu_share_cate` (
  `cate_id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_share_cate` */

/*Table structure for table `tu_shop` */

DROP TABLE IF EXISTS `tu_shop`;

CREATE TABLE `tu_shop` (
  `shop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父级分店ID',
  `user_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `grade_id` int(11) DEFAULT NULL COMMENT '企业等级',
  `wap_template_id` tinyint(1) DEFAULT '0' COMMENT '手机模板',
  `pc_template_id` tinyint(1) DEFAULT '0' COMMENT '电脑模板',
  `area_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT '0',
  `type_id` char(20) DEFAULT '0',
  `business_id` int(11) DEFAULT NULL,
  `shop_name` varchar(64) DEFAULT NULL,
  `logo` varchar(64) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `service_weixin_qrcode` varchar(255) DEFAULT NULL COMMENT '客服微信二维码',
  `tel` varchar(64) DEFAULT NULL,
  `extension` varchar(8) DEFAULT NULL,
  `qq` varchar(10) NOT NULL,
  `mobile` varchar(11) DEFAULT '0',
  `contact` varchar(32) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `score` tinyint(3) DEFAULT '0' COMMENT '评价',
  `score_num` int(11) DEFAULT '0',
  `fans_num` int(11) DEFAULT '0',
  `zan_num` int(11) DEFAULT '0' COMMENT '点赞数量',
  `d1` tinyint(3) DEFAULT '0',
  `d2` tinyint(3) DEFAULT '0',
  `d3` tinyint(3) DEFAULT '0' COMMENT '点评项目',
  `panorama_url` varchar(128) DEFAULT NULL COMMENT '企业全景URL',
  `orderby` int(11) DEFAULT '100' COMMENT '越小排序越高',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `ding_num` int(10) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0' COMMENT '1代表已经审核',
  `recognition` tinyint(1) NOT NULL DEFAULT '0',
  `is_online` int(11) DEFAULT '0' COMMENT '1是农村电商',
  `is_tuan_pay` tinyint(1) DEFAULT '1' COMMENT '抢购在线支付',
  `is_hotel_pay` tinyint(1) DEFAULT '1' COMMENT '酒店在线支付',
  `is_mall_pay` tinyint(1) DEFAULT '1' COMMENT '商城在线支付',
  `is_ele_pay` tinyint(1) DEFAULT '1' COMMENT '外卖在线支付',
  `is_ele_pei` tinyint(1) DEFAULT '0' COMMENT '外卖配送',
  `is_market_pei` int(1) DEFAULT '0' COMMENT '菜市场配送',
  `is_store_pei` int(1) DEFAULT '0' COMMENT '便利店配送',
  `is_goods_pei` tinyint(1) DEFAULT '0' COMMENT '商城配送',
  `is_ding` tinyint(1) DEFAULT '0' COMMENT '针对餐饮行业的订座',
  `is_biz` tinyint(1) DEFAULT '0',
  `is_profit` tinyint(1) DEFAULT '0',
  `is_renzheng` int(1) NOT NULL DEFAULT '0',
  `is_ele_print` tinyint(4) DEFAULT '1',
  `is_tuan_print` tinyint(4) DEFAULT '0',
  `is_goods_print` tinyint(4) DEFAULT '0',
  `is_booking_print` tinyint(4) DEFAULT '0' COMMENT '1开启家政打印',
  `is_appoint_print` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1开启家政打印',
  `is_goods_backers` tinyint(1) DEFAULT '0' COMMENT '1开启商城推手',
  `is_ele_backers` tinyint(1) DEFAULT '0' COMMENT '1开启外卖推手',
  `tags` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `tui_uid` int(11) DEFAULT '0' COMMENT '代理商',
  `apiKey` varchar(100) NOT NULL,
  `mKey` varchar(100) NOT NULL,
  `partner` varchar(100) NOT NULL,
  `machine_code` varchar(100) NOT NULL,
  `service` text COMMENT '各种统计代码',
  `service_audit` tinyint(1) NOT NULL DEFAULT '0',
  `express_price` int(11) DEFAULT '0' COMMENT '抢单模式下配送费为0给抢单员默认运费',
  `commission` int(11) DEFAULT '0' COMMENT '企业佣金用于商城结算',
  `bg_date` date DEFAULT NULL COMMENT '开始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`shop_id`) USING BTREE,
  KEY `cate_id` (`cate_id`,`area_id`,`business_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop` */

insert  into `tu_shop`(`shop_id`,`parent_id`,`user_id`,`cate_id`,`grade_id`,`wap_template_id`,`pc_template_id`,`area_id`,`city_id`,`type_id`,`business_id`,`shop_name`,`logo`,`photo`,`service_weixin_qrcode`,`tel`,`extension`,`qq`,`mobile`,`contact`,`addr`,`score`,`score_num`,`fans_num`,`zan_num`,`d1`,`d2`,`d3`,`panorama_url`,`orderby`,`lng`,`lat`,`ding_num`,`closed`,`view`,`audit`,`recognition`,`is_online`,`is_tuan_pay`,`is_hotel_pay`,`is_mall_pay`,`is_ele_pay`,`is_ele_pei`,`is_market_pei`,`is_store_pei`,`is_goods_pei`,`is_ding`,`is_biz`,`is_profit`,`is_renzheng`,`is_ele_print`,`is_tuan_print`,`is_goods_print`,`is_booking_print`,`is_appoint_print`,`is_goods_backers`,`is_ele_backers`,`tags`,`create_time`,`create_ip`,`tui_uid`,`apiKey`,`mKey`,`partner`,`machine_code`,`service`,`service_audit`,`express_price`,`commission`,`bg_date`,`end_date`) values (1,NULL,1,69,12,12,0,57,32,'0',59,'zhaopin','/attachs/2018/05/22/thumb_5b03c55b268ff.png','/attachs/2018/05/22/thumb_5b03c561b3b4c.png','/attachs/2018/05/22/thumb_5b03bc951f7f6.jpg','1716-2729-877','','286099981','17162729877','张亮','北京朝阳国贸A102',0,0,0,0,0,0,0,'',100,'116.417881','39.916683',0,1,22,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,'zhaopin',1526969353,'111.37.71.184',0,'','','','','',0,300,0,'0000-00-00','2020-05-21'),(2,NULL,5,94,0,0,0,59,33,'0',60,'网招工作网','/attachs/2019/12/03/thumb_5de5af31aed30.jpg','/attachs/2019/12/03/thumb_5de5af3557178.jpg',NULL,'18864874770','','','18864874770','郭果果','山东省聊城市东昌府区创业大厦',0,0,1,1,0,0,0,'',1,'116.044057','36.461365',0,0,13,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,'网招，工作',1575333843,'27.222.98.103',0,'','','','',NULL,0,0,0,NULL,NULL);

/*Table structure for table `tu_shop_audit` */

DROP TABLE IF EXISTS `tu_shop_audit`;

CREATE TABLE `tu_shop_audit` (
  `audit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `zhucehao` varchar(128) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `zuzhidaima` varchar(128) DEFAULT NULL,
  `user_name` varchar(128) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`audit_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_audit` */

/*Table structure for table `tu_shop_banner` */

DROP TABLE IF EXISTS `tu_shop_banner`;

CREATE TABLE `tu_shop_banner` (
  `banner_id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT '0',
  `is_mobile` tinyint(1) DEFAULT '1',
  `photo` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`banner_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_banner` */

/*Table structure for table `tu_shop_branch` */

DROP TABLE IF EXISTS `tu_shop_branch`;

CREATE TABLE `tu_shop_branch` (
  `branch_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `score` tinyint(3) DEFAULT '0',
  `password` varchar(32) DEFAULT '',
  `shop_id` int(11) DEFAULT '0',
  `cate_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT '0',
  `area_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT '0',
  `photo` varchar(128) NOT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `telephone` varchar(11) NOT NULL DEFAULT '',
  `business_time` varchar(64) DEFAULT NULL,
  `d1` tinyint(3) DEFAULT '0',
  `d2` tinyint(3) DEFAULT '0',
  `d3` tinyint(3) DEFAULT '0',
  `score_num` int(10) unsigned NOT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `fans_num` int(11) DEFAULT '0',
  `details` text NOT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`branch_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_branch` */

/*Table structure for table `tu_shop_cate` */

DROP TABLE IF EXISTS `tu_shop_cate`;

CREATE TABLE `tu_shop_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(1) DEFAULT '0',
  `d1` varchar(32) DEFAULT '价格',
  `d2` varchar(32) DEFAULT '环境',
  `d3` varchar(32) DEFAULT '服务',
  `book_num` int(11) DEFAULT '0' COMMENT '分类预约人次',
  `title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_cate` */

insert  into `tu_shop_cate`(`cate_id`,`cate_name`,`parent_id`,`orderby`,`is_hot`,`d1`,`d2`,`d3`,`book_num`,`title`) values (93,'工作网',0,0,0,'','','',0,''),(94,'工作网',93,0,0,'','','',0,'');

/*Table structure for table `tu_shop_cate_attr` */

DROP TABLE IF EXISTS `tu_shop_cate_attr`;

CREATE TABLE `tu_shop_cate_attr` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `attr_name` varchar(32) DEFAULT NULL,
  `attr_price` int(11) DEFAULT '0' COMMENT '预售价格',
  `attr_intro` varchar(128) DEFAULT NULL COMMENT '简介',
  `attr_book_num` int(11) DEFAULT '0' COMMENT '预约人次',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`attr_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2691 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_cate_attr` */

insert  into `tu_shop_cate_attr`(`attr_id`,`cate_id`,`type`,`attr_name`,`attr_price`,`attr_intro`,`attr_book_num`,`orderby`) values (2689,72,'select1','线路不良',8888,'为什么是',-1,1),(2690,72,'select1','显示器不亮',28888,'这里显示器为什么不良',-2,2);

/*Table structure for table `tu_shop_comment` */

DROP TABLE IF EXISTS `tu_shop_comment`;

CREATE TABLE `tu_shop_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级评论id,若是一级评论则为0',
  `nickname` varchar(100) DEFAULT NULL COMMENT '评论人昵称',
  `user_id` int(11) DEFAULT NULL COMMENT '评论人UID',
  `post_id` int(11) DEFAULT NULL COMMENT '新闻编号',
  `content` text COMMENT '评论内容',
  `zan` int(6) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '评论或回复发表时间',
  `create_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_comment` */

/*Table structure for table `tu_shop_details` */

DROP TABLE IF EXISTS `tu_shop_details`;

CREATE TABLE `tu_shop_details` (
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `details` text,
  `theme_id` int(11) DEFAULT '0',
  `theme_expir_time` int(11) DEFAULT NULL,
  `discounts` varchar(32) DEFAULT NULL,
  `business_time` varchar(32) DEFAULT '9:00-18:00',
  `price` int(10) DEFAULT NULL,
  `near` varchar(64) DEFAULT NULL,
  `wei_pic` varchar(256) DEFAULT NULL,
  `is_dingyue` tinyint(1) DEFAULT '0' COMMENT '是否是订阅号',
  `app_id` varchar(32) DEFAULT NULL,
  `app_key` varchar(256) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `weixin_msg` text,
  `menus` text,
  `seo_title` varchar(32) DEFAULT NULL,
  `seo_keywords` varchar(32) DEFAULT NULL,
  `seo_description` varchar(32) DEFAULT NULL,
  `icp` varchar(32) DEFAULT NULL,
  `sitelogo` varchar(64) DEFAULT NULL,
  `bank` varchar(1024) DEFAULT NULL,
  `delivery_time` tinyint(3) DEFAULT '30' COMMENT '接单倒计时（单位：分钟）',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_details` */

insert  into `tu_shop_details`(`shop_id`,`details`,`theme_id`,`theme_expir_time`,`discounts`,`business_time`,`price`,`near`,`wei_pic`,`is_dingyue`,`app_id`,`app_key`,`token`,`weixin_msg`,`menus`,`seo_title`,`seo_keywords`,`seo_description`,`icp`,`sitelogo`,`bank`,`delivery_time`) values (1,'<p>zhaopin官方演示店铺&nbsp;<br/></p>',0,NULL,NULL,'8:00-24：00',0,'','0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30),(2,'<p>分享工作快乐，创建美好生活。</p>',0,NULL,NULL,'8:00-19：00',0,'','https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQG98TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycVREY0k2TjJjemwxMDAwME0wM1EAAgTVr_VdAwQAAAAA',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);

/*Table structure for table `tu_shop_dianping` */

DROP TABLE IF EXISTS `tu_shop_dianping`;

CREATE TABLE `tu_shop_dianping` (
  `dianping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT '0',
  `evaluate` tinyint(1) DEFAULT '0' COMMENT '1表示好评，2表示中评，3表示差评',
  `score` tinyint(3) DEFAULT NULL,
  `d1` tinyint(3) DEFAULT '0',
  `d2` tinyint(3) DEFAULT '0',
  `d3` tinyint(3) DEFAULT '0',
  `cost` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`dianping_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_dianping` */

/*Table structure for table `tu_shop_dianping_pics` */

DROP TABLE IF EXISTS `tu_shop_dianping_pics`;

CREATE TABLE `tu_shop_dianping_pics` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `dianping_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE,
  KEY `dianping_id` (`dianping_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_dianping_pics` */

/*Table structure for table `tu_shop_dingyue` */

DROP TABLE IF EXISTS `tu_shop_dingyue`;

CREATE TABLE `tu_shop_dingyue` (
  `dingyue_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `sitelist` text CHARACTER SET latin1 NOT NULL,
  `catlist` text CHARACTER SET latin1 NOT NULL,
  `status` int(10) DEFAULT NULL,
  `create_time` int(20) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `sms` int(11) NOT NULL,
  `audit` int(11) NOT NULL COMMENT '1:通过  0审核中  -1审核失败',
  `sms_number` int(11) DEFAULT NULL,
  `select1` text,
  `select2` text,
  `select3` text,
  `select4` text,
  `select5` text,
  PRIMARY KEY (`dingyue_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_dingyue` */

/*Table structure for table `tu_shop_dingyue_set` */

DROP TABLE IF EXISTS `tu_shop_dingyue_set`;

CREATE TABLE `tu_shop_dingyue_set` (
  `dingyueset_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `one_cate` int(11) NOT NULL,
  `two_cate` int(11) NOT NULL,
  `count_list` int(11) NOT NULL,
  `count_number` int(11) NOT NULL,
  `sms_number` int(11) NOT NULL,
  `sms_open` int(11) NOT NULL,
  PRIMARY KEY (`dingyueset_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_dingyue_set` */

/*Table structure for table `tu_shop_expand` */

DROP TABLE IF EXISTS `tu_shop_expand`;

CREATE TABLE `tu_shop_expand` (
  `expand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `expand` tinyint(3) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`expand_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_expand` */

/*Table structure for table `tu_shop_favorites` */

DROP TABLE IF EXISTS `tu_shop_favorites`;

CREATE TABLE `tu_shop_favorites` (
  `favorites_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `last_news_id` int(11) DEFAULT '0',
  `read_id` int(11) DEFAULT '0',
  `is_sms` tinyint(1) NOT NULL DEFAULT '1',
  `is_email` tinyint(1) NOT NULL DEFAULT '0',
  `is_weixin` tinyint(1) NOT NULL DEFAULT '1',
  `is_msg` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`favorites_id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`shop_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_favorites` */

insert  into `tu_shop_favorites`(`favorites_id`,`user_id`,`shop_id`,`last_news_id`,`read_id`,`is_sms`,`is_email`,`is_weixin`,`is_msg`,`closed`,`create_time`,`create_ip`) values (1,4,2,0,0,1,0,1,0,0,1575337675,'27.222.98.103');

/*Table structure for table `tu_shop_grade` */

DROP TABLE IF EXISTS `tu_shop_grade`;

CREATE TABLE `tu_shop_grade` (
  `grade_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(32) DEFAULT NULL,
  `photo` varchar(256) DEFAULT NULL,
  `money` varchar(11) DEFAULT '0' COMMENT '单独升级购买费用',
  `gold` int(11) NOT NULL DEFAULT '0' COMMENT '需要多少商户资金自动升级',
  `content` varchar(256) NOT NULL COMMENT '等级描述',
  `is_mall` tinyint(1) NOT NULL DEFAULT '0',
  `is_tuan` tinyint(1) NOT NULL DEFAULT '0',
  `is_ele` tinyint(1) NOT NULL DEFAULT '0',
  `is_market` int(11) DEFAULT NULL,
  `is_store` int(11) DEFAULT NULL,
  `is_news` tinyint(1) NOT NULL DEFAULT '0',
  `is_hotel` tinyint(1) NOT NULL DEFAULT '0',
  `is_booking` tinyint(1) NOT NULL DEFAULT '0',
  `is_farm` tinyint(1) NOT NULL DEFAULT '0',
  `is_appoint` tinyint(1) NOT NULL DEFAULT '0',
  `is_huodong` tinyint(1) NOT NULL DEFAULT '0',
  `is_coupon` tinyint(1) NOT NULL DEFAULT '0',
  `is_life` tinyint(1) NOT NULL DEFAULT '0',
  `is_jifen` tinyint(1) NOT NULL DEFAULT '0',
  `is_cloud` tinyint(1) NOT NULL DEFAULT '0',
  `is_book` tinyint(1) NOT NULL DEFAULT '0',
  `is_stock` tinyint(1) NOT NULL DEFAULT '0',
  `is_edu` tinyint(1) NOT NULL DEFAULT '0',
  `is_zhe` tinyint(1) NOT NULL DEFAULT '0',
  `is_ktv` tinyint(1) DEFAULT '0' COMMENT 'KTV',
  `is_mall_num` int(11) NOT NULL DEFAULT '0',
  `is_tuan_num` int(11) NOT NULL DEFAULT '0',
  `is_ele_num` int(11) NOT NULL DEFAULT '0',
  `is_market_num` int(11) DEFAULT NULL,
  `is_store_num` int(11) DEFAULT NULL,
  `is_news_num` int(11) NOT NULL DEFAULT '0',
  `is_hotel_num` int(11) NOT NULL DEFAULT '0',
  `is_booking_num` int(11) NOT NULL DEFAULT '0',
  `is_farm_num` int(11) NOT NULL DEFAULT '0',
  `is_appoint_num` int(11) NOT NULL DEFAULT '0',
  `is_huodong_num` int(11) NOT NULL DEFAULT '0',
  `is_coupon_num` int(11) NOT NULL DEFAULT '0',
  `is_life_num` int(11) NOT NULL DEFAULT '0',
  `is_jifen_num` int(11) NOT NULL DEFAULT '0',
  `is_cloud_num` int(11) NOT NULL DEFAULT '0',
  `is_book_num` int(11) NOT NULL DEFAULT '0',
  `is_stock_num` int(11) NOT NULL DEFAULT '0',
  `is_edu_num` int(11) NOT NULL DEFAULT '0',
  `is_zhe_num` int(11) NOT NULL DEFAULT '0',
  `is_ktv_num` int(11) DEFAULT '0' COMMENT 'KTV数量',
  `orderby` int(11) NOT NULL DEFAULT '10' COMMENT '排序，默认10，当然可以修改',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`grade_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_grade` */

insert  into `tu_shop_grade`(`grade_id`,`grade_name`,`photo`,`money`,`gold`,`content`,`is_mall`,`is_tuan`,`is_ele`,`is_market`,`is_store`,`is_news`,`is_hotel`,`is_booking`,`is_farm`,`is_appoint`,`is_huodong`,`is_coupon`,`is_life`,`is_jifen`,`is_cloud`,`is_book`,`is_stock`,`is_edu`,`is_zhe`,`is_ktv`,`is_mall_num`,`is_tuan_num`,`is_ele_num`,`is_market_num`,`is_store_num`,`is_news_num`,`is_hotel_num`,`is_booking_num`,`is_farm_num`,`is_appoint_num`,`is_huodong_num`,`is_coupon_num`,`is_life_num`,`is_jifen_num`,`is_cloud_num`,`is_book_num`,`is_stock_num`,`is_edu_num`,`is_zhe_num`,`is_ktv_num`,`orderby`,`closed`,`create_time`,`create_ip`) values (7,'专营店','http://images4.5maiche.cn/2016-09-29_57ec76376cad7.jpg','10000',100000,'专营店是最好的等级',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,100,10,10,0,0,10,0,13,0,0,0,10,10,0,0,0,0,0,0,0,1,1,NULL,NULL),(8,'旗舰店','http://images4.5maiche.cn/2016-09-29_57ec7655332c5.jpg','10000',1000000,'你好，功能更多了',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,0,2,1,NULL,NULL),(9,'vip','http://images4.5maiche.cn/2017-05-17_591c41fe66151.jpg','29500',50000,'算了',0,1,1,NULL,NULL,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,NULL,NULL),(10,'外卖','http://images4.5maiche.cn/2017-11-02_59fae3f6a06d7.jpg','1000000',10000000,'外卖',0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,1,NULL,NULL),(11,'商城','http://images4.5maiche.cn/2017-11-02_59fae463ba0c2.jpg','10000000',100000000,'商城',0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,1,NULL,NULL),(12,'黄金等级店铺','http://images4.5maiche.cn/2017-11-21_5a13e9f45cd23.jpg','300000',200000,'哈哈',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,11,1,NULL,NULL);

/*Table structure for table `tu_shop_grade_order` */

DROP TABLE IF EXISTS `tu_shop_grade_order`;

CREATE TABLE `tu_shop_grade_order` (
  `order_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '购买人的会员ID',
  `grade_id` int(11) DEFAULT NULL COMMENT '购买等级',
  `money` int(11) DEFAULT NULL COMMENT '付款金额不做促销',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未付款，1已付款',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0代表正常，1代表删除',
  `shop_name` varchar(50) DEFAULT NULL COMMENT '购买企业名称',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_grade_order` */

/*Table structure for table `tu_shop_guide` */

DROP TABLE IF EXISTS `tu_shop_guide`;

CREATE TABLE `tu_shop_guide` (
  `guide_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `shop_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `rate` int(11) DEFAULT NULL COMMENT '千分比分成',
  `intro` varchar(128) DEFAULT NULL COMMENT '备注',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`guide_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_guide` */

/*Table structure for table `tu_shop_life_service` */

DROP TABLE IF EXISTS `tu_shop_life_service`;

CREATE TABLE `tu_shop_life_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `cate_id` smallint(5) unsigned NOT NULL,
  `area_id` smallint(5) unsigned NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `business_id` smallint(5) unsigned NOT NULL,
  `shop_name` varchar(64) NOT NULL,
  `logo` varchar(64) NOT NULL,
  `photo` varchar(64) NOT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `extension` varchar(8) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `create_ip` varchar(15) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_life_service` */

/*Table structure for table `tu_shop_logs` */

DROP TABLE IF EXISTS `tu_shop_logs`;

CREATE TABLE `tu_shop_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `type` enum('yuyue','card','wei','bao') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_logs` */

/*Table structure for table `tu_shop_money` */

DROP TABLE IF EXISTS `tu_shop_money`;

CREATE TABLE `tu_shop_money` (
  `money_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `branch_id` smallint(5) DEFAULT NULL,
  `money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `type` enum('tuan','ele','booking','goods','breaks','hotel','crowd','farm','appoint','cloud','edu','book','stock','ktv','market','store') DEFAULT 'tuan',
  `order_id` int(11) DEFAULT '0',
  `intro` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`money_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_money` */

/*Table structure for table `tu_shop_nav` */

DROP TABLE IF EXISTS `tu_shop_nav`;

CREATE TABLE `tu_shop_nav` (
  `shop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nav1_name` varchar(64) DEFAULT NULL COMMENT '冗余方便查询',
  `nav2_name` varchar(32) DEFAULT NULL,
  `nav3_name` varchar(32) DEFAULT NULL,
  `nav4_name` varchar(32) DEFAULT NULL,
  `nav5_name` varchar(32) DEFAULT NULL,
  `nav6_name` varchar(32) DEFAULT NULL,
  `nav7_name` varchar(32) DEFAULT NULL,
  `nav8_name` varchar(32) DEFAULT NULL,
  `nav1_is_open` int(11) NOT NULL DEFAULT '0',
  `nav2_is_open` int(11) NOT NULL DEFAULT '0',
  `nav3_is_open` int(11) NOT NULL DEFAULT '0',
  `nav4_is_open` int(11) NOT NULL DEFAULT '0',
  `nav5_is_open` int(11) NOT NULL DEFAULT '0',
  `nav6_is_open` int(11) NOT NULL DEFAULT '0',
  `nav7_is_open` int(11) NOT NULL DEFAULT '0',
  `nav8_is_open` int(11) NOT NULL DEFAULT '0',
  `nav1_is_orderby` int(11) NOT NULL DEFAULT '10',
  `nav2_is_orderby` int(11) NOT NULL DEFAULT '10',
  `nav3_is_orderby` int(11) NOT NULL DEFAULT '10',
  `nav4_is_orderby` int(11) NOT NULL DEFAULT '10',
  `nav5_is_orderby` int(11) NOT NULL DEFAULT '10',
  `nav6_is_orderby` int(11) NOT NULL DEFAULT '10',
  `nav7_is_orderby` int(11) NOT NULL DEFAULT '10',
  `nav8_is_orderby` int(11) NOT NULL DEFAULT '10',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(32) DEFAULT NULL COMMENT '更新IP',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_nav` */

/*Table structure for table `tu_shop_news` */

DROP TABLE IF EXISTS `tu_shop_news`;

CREATE TABLE `tu_shop_news` (
  `news_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` smallint(5) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `source` varchar(120) DEFAULT NULL,
  `profiles` varchar(255) DEFAULT NULL,
  `keywords` varchar(256) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `details` text,
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `is_tuisong_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_tuisong_weixin` tinyint(1) NOT NULL DEFAULT '0',
  `is_tuisong_email` tinyint(1) NOT NULL DEFAULT '0',
  `is_tuisong_msg` tinyint(1) NOT NULL DEFAULT '0',
  `is_tuisong_sms_time` int(10) DEFAULT NULL,
  `is_tuisong_weixin_time` int(10) DEFAULT NULL,
  `is_tuisong_email_time` int(10) DEFAULT NULL,
  `is_tuisong_msg_time` int(10) DEFAULT NULL,
  `orderby` tinyint(1) DEFAULT '50',
  `audit` tinyint(1) DEFAULT '0',
  `city_id` smallint(5) DEFAULT '0',
  PRIMARY KEY (`news_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE,
  KEY `cate_id` (`cate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_news` */

/*Table structure for table `tu_shop_pic` */

DROP TABLE IF EXISTS `tu_shop_pic`;

CREATE TABLE `tu_shop_pic` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `audit` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_pic` */

/*Table structure for table `tu_shop_recognition` */

DROP TABLE IF EXISTS `tu_shop_recognition`;

CREATE TABLE `tu_shop_recognition` (
  `recognition_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `shop_id` int(11) unsigned DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `reply` varchar(256) DEFAULT NULL COMMENT '管理员回复',
  `audit` tinyint(1) DEFAULT '0' COMMENT '1代表审核通过，0代表没通过！',
  PRIMARY KEY (`recognition_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_recognition` */

/*Table structure for table `tu_shop_weixin_access` */

DROP TABLE IF EXISTS `tu_shop_weixin_access`;

CREATE TABLE `tu_shop_weixin_access` (
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `access_token` varchar(256) DEFAULT NULL,
  `expir_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_weixin_access` */

/*Table structure for table `tu_shop_weixin_keyword` */

DROP TABLE IF EXISTS `tu_shop_weixin_keyword`;

CREATE TABLE `tu_shop_weixin_keyword` (
  `keyword_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `keyword` varchar(32) DEFAULT NULL,
  `type` enum('news','text') DEFAULT 'text' COMMENT '0普通消息 1图片消息',
  `title` varchar(128) DEFAULT NULL,
  `contents` text,
  `url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`keyword_id`) USING BTREE,
  UNIQUE KEY `shop_id` (`shop_id`,`keyword`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_weixin_keyword` */

/*Table structure for table `tu_shop_worker` */

DROP TABLE IF EXISTS `tu_shop_worker`;

CREATE TABLE `tu_shop_worker` (
  `worker_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NOT NULL,
  `shop_id` int(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `qq` varchar(20) NOT NULL,
  `weixin` varchar(40) NOT NULL,
  `work` varchar(80) NOT NULL,
  `addr` varchar(200) NOT NULL,
  `tuan` int(1) NOT NULL DEFAULT '0',
  `coupon` int(1) NOT NULL DEFAULT '0',
  `yuyue` int(1) NOT NULL DEFAULT '0',
  `is_mall` int(1) NOT NULL DEFAULT '0',
  `is_job` int(1) NOT NULL DEFAULT '0',
  `is_ding` int(1) NOT NULL DEFAULT '0',
  `is_dianping` int(1) NOT NULL DEFAULT '0',
  `is_yuyue` int(1) NOT NULL DEFAULT '0',
  `is_life` int(1) NOT NULL DEFAULT '0',
  `is_news` int(1) NOT NULL DEFAULT '0',
  `is_appoint` tinyint(1) NOT NULL DEFAULT '0',
  `is_booking` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`worker_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_worker` */

/*Table structure for table `tu_shop_youhui` */

DROP TABLE IF EXISTS `tu_shop_youhui`;

CREATE TABLE `tu_shop_youhui` (
  `yh_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(1) DEFAULT '0' COMMENT '0：折扣，1：满减',
  `shop_id` int(10) DEFAULT '0',
  `discount` decimal(5,1) DEFAULT '0.0' COMMENT '折扣',
  `deduction` decimal(5,1) DEFAULT '0.0',
  `min_amount` decimal(8,2) DEFAULT '0.00' COMMENT '满多少',
  `vacuum` decimal(8,2) DEFAULT '0.00',
  `amount` decimal(8,2) DEFAULT '0.00' COMMENT '减多少',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '0关闭，1开启',
  `audit` tinyint(1) DEFAULT '0',
  `use_count` int(10) DEFAULT '0' COMMENT '使用次数',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`yh_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_youhui` */

/*Table structure for table `tu_shop_yuyue` */

DROP TABLE IF EXISTS `tu_shop_yuyue`;

CREATE TABLE `tu_shop_yuyue` (
  `yuyue_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `shop_id` int(11) unsigned DEFAULT '0',
  `pois_id` int(11) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0是企业，1是黄页，2是后面的',
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `yuyue_date` date DEFAULT NULL,
  `yuyue_time` varchar(32) DEFAULT NULL,
  `number` smallint(5) unsigned DEFAULT '0',
  `content` varchar(200) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL COMMENT '图片',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付，1已支付，2已核销',
  `need_pay` int(11) DEFAULT NULL COMMENT '实付金额',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `used` tinyint(1) DEFAULT '0',
  `used_time` int(11) DEFAULT '0',
  `used_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`yuyue_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_yuyue` */

insert  into `tu_shop_yuyue`(`yuyue_id`,`user_id`,`shop_id`,`pois_id`,`type`,`name`,`mobile`,`yuyue_date`,`yuyue_time`,`number`,`content`,`code`,`photo`,`status`,`need_pay`,`create_time`,`create_ip`,`used`,`used_time`,`used_ip`) values (1,1,1,NULL,0,'11','17162729877','2022-05-20','12:00',1,NULL,'10663802',NULL,0,NULL,1526972832,'111.37.71.184',0,0,'');

/*Table structure for table `tu_shop_zan` */

DROP TABLE IF EXISTS `tu_shop_zan`;

CREATE TABLE `tu_shop_zan` (
  `zan_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`zan_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_shop_zan` */

insert  into `tu_shop_zan`(`zan_id`,`user_id`,`shop_id`,`closed`,`create_time`,`create_ip`) values (1,4,2,0,1575337684,'27.222.98.103');

/*Table structure for table `tu_sms` */

DROP TABLE IF EXISTS `tu_sms`;

CREATE TABLE `tu_sms` (
  `sms_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sms_key` varchar(32) DEFAULT NULL,
  `sms_explain` varchar(1024) DEFAULT NULL,
  `sms_tmpl` varchar(2048) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`sms_id`) USING BTREE,
  UNIQUE KEY `sms_key` (`sms_key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_sms` */

insert  into `tu_sms`(`sms_id`,`sms_key`,`sms_explain`,`sms_tmpl`,`is_open`) values (46,'sms_breaks_tz_shop','用户优惠买单后通知企业','{shopName},{userName}买单{amount}元，实付{money}元【{sitename}】',1),(47,'sms_breaks_tz_user','用户优惠买单后发动短信到用户自己手机上','你好{userName}，你在企业{shopName}处于{data}买单{money}元。【{sitename}】',1),(44,'sms_life_dingyue_tongzhi_user','发送分类信息推送到用户手机','你好，{userName}发布了{title}，手机：{userMobile}，{sitename}【{sitename}】',1),(45,'sms_shop_news_user','企业给会员推送短信模板','企业{shopName}举办{title}，地址{shopAddr}：敬请关注！【{sitename}】',1),(42,'tuan_TZ_user','抢购劵验证后通知用户已验证','您抢购的{name}.已于{data}成功消费.如有问题请联系客服{tel}.【{sitename}】',1),(43,'sms_admin_login_admin','后台账户异地IP登陆短信通知','尊敬的{userName}，你的后台于{time}账户操作异常，请查看！【{sitename}】',1),(41,'sms_yuyue_notice_shop','用户预约企业通知企业','尊敬的企业，{name}，合计{number}人，手机：{mobile},预约时间{yuyueDate}【{sitename}】',1),(40,'sms_shop_recognition_user','认领企业成功通知用户','尊敬的{name}，您认领的企业{shopName}已通过审核，请登录{sitename}查看【{sitename}】',1),(39,'sms_tuan_user','客户下单后，发送团购劵到用户手机上','尊敬的{user}，您在{shopName}预定的抢购验证密码为：{code}，请及时消费哦【{sitename}】',1),(38,'sms_ele_tz_shop','新订单通知外卖企业','您好，您在{sitename}有新的外卖订单【{sitename}】',1),(37,'sms_tuan_tz_shop','团购订单通知企业','您好，您在{sitename}有新的订单【{sitename}】',1),(36,'sms_mall_tz_shop','商城订单通知企业短信','您好，您的商城在{sitename}有新的订单【{sitename}】',1),(35,'sms_user_newpwd','找回密码','尊敬的用户：您好，您在{sitename}的密码被重置成{newpwd}您可以使用{newpwd}重新登录【{sitename}】',1),(34,'sms_shop_yuyue_code','预约企业给用户发送电子优惠券','尊敬的用户您好,您预约了{shopName}的电子优惠券：{code},亲可以前往{shopName}进行消费;企业地址:{shopAddr},电话{shop_tel};【{sitename}】',1),(33,'sms_yzm','验证码','您在{sitename}手机认证的验证码是{code}千万别告诉别人',1),(32,'sms_shop_recognition_admin','认领企业通知网站管理员','尊敬的管理员，{userName}认领的企业{shopName}，请登录网站查看【{sitename}】',1),(48,'goods_refund_user','商城订单退款给会员短信通知','你好，您申请的购物订单号{orderId}，已退款{needPay}元。【{sitename}】',1),(49,'tuancode_refund_user','抢购劵退款短信通知用户','你好，您申请的抢购订单号{orderId}，已退款{realMoney}元【{sitename}】',1),(50,'eleorder_refund_user','外卖退款通知用户','你好，您申请的外卖退款订单号{orderId}，已退款{needPay}元【{sitename}】',1),(51,'coupon_download_user','下载优惠劵发送短信到用户手机','您已成功下载{couponTitle},电子优惠劵{code}，过期时间{expireDate}【{sitename}】',1),(52,'sms_hotel_user','用户酒店预订成功发送短信到用户手机','您成功预订{hotelName}，电话{tel}，入驻时间{stime}【{sitename}】',1),(53,'sms_hotel_shop','用户酒店预订成功给企业发送短信','你好{shopName}，您的酒店房间{title}已被成功预订【{sitename}】',1),(54,'sms_booking_user','预订后通知用户手机','你已成功预订{bookingName}，请及时消费哦【{sitename}】',1),(55,'sms_booking_shop','预订后通知企业','你好你的{bookingName}被成功预订，请及时处理【{sitename}】',0),(56,'sms_crowd_user','众筹成功通知用户','尊敬的{userName}，你成功众筹{title}【{sitename}】',1),(57,'sms_crowd_uid','众筹成功通知发起人','尊敬的{userName}，你的产品已被成功众筹【{sitename}】',1),(58,'sms_appoint_refund_user','家政用户申请退款后通知到手机','尊敬的{userName}，你的家政订单号{orderId}已成功退款{refundMoney}元【{sitename}】',1),(59,'sms_delivery_user','快递员抢单短信通知','您好，配送中心有新的{info}订单了，订单生成时间：{data}【{sitename}】',1),(60,'sms_running_user','用户发布跑腿短信通知用户','你好{userName}，您发布的跑腿{runningId}已成功付费{needPay}，{time}【{sitename}】',1),(61,'sms_running_delivery_user','配送员接单通知用户万能短信接口','尊敬的{userName}，{info}【{sitename}】',1),(62,'sms_coupon_user','用户下载优惠劵万能短信接口','尊敬的{userName}，您成功下载优惠劵{title}，验证码{code}，{expireDate}过期【{sitename}】',1),(63,'register_account_give_coupon','用户赠送优惠劵给朋友自动账户','尊敬的{userName},您的朋友{giveUserName}赠送你一张优惠劵，请及时消费【{sitename}】',1),(64,'sms_cloud_win_user','云购中奖通知用户','尊敬的{userName}，您参与的拼吧{title}已成功获得，编号{number}【{sitename}】',1),(65,'sms_appoint_TZ_user','家政预约成功通知用户','您好，您成功预约家政{appointName}，时间{time}，预约地址{addr}【{sitename}】',1),(66,'sms_push_mass_sms','全局推送短信通知','您好，{sitename}有新的通知：{title}【{sitename}】',1),(67,'sms_zhe_notice_user','五折卡购买成功通知买家','尊敬的{userName}，您成功购买{type}，编号${number}，有效期截止{endTime}【{sitename}】',1),(68,'sms_edu_notice_user','用户购买课程短信通知','尊敬的{userName}，您成功购买课程{title}，兑换码{code}，价格{needPay}元【{sitename}】',1),(69,'sms_edu_notice_shop','用户购买课程短信通知企业','尊敬的{shopName}，您卖出课程{title}，价格{needPay}元【{sitename}】',1),(70,'sms_zhe_yuyue_user','五折卡预约后通知用户','尊敬的{userName}，您成功购买{type}，兑换码{code}，有效期截止{endTime}【{sitename}】',1),(71,'sms_zhe_yuyue_shop','五折卡预约后通知企业','您的五折卡{zheName}已被卖出，购买会员昵称{userName}，手机{userMobile}【{sitename}】',1),(72,'sms_zhe_yuyue_is_used_user','五折卡验证后通知用户','尊敬${userName}，您预约的五折卡{zheName}已成功验证，时间{usedTime}【{sitename}】',1),(73,'sms_code','验证码','手机认证的验证码是{code}千万别告诉别人',1),(74,'sms_ele_reminder_shop','外卖用户催单短信通知企业','尊敬的{shopName}，{userName}对外卖订单编号{orderId}进行催单，请尽快配送【{sitename}】',1),(75,'sms_hotel_refund_shop','用户申请退款通知企业-【酒店订单】','尊敬的{shopName}，用户{refundName}预订的酒店房间{roomTitle}已申请退款，订单号{order_id}，请及时处理【{sitename}】',1),(76,'sms_hotel_refund_user','酒店企业同意退款通知用户','尊敬的{refundName}，您预订的房间{room_title}已成功退款{refundMoney}元，订单号{orderId}【{sitename}】',1),(77,'sms_stock_user','股权购买通知买家','尊敬的{userName}，您成功购买股权{title}，编号：{scorkNumber}，购买价格{needPayPrice}【{sitename}】',1),(78,'sms_stock_shop','股权购买通知企业','尊敬的{shopName}，您成功卖出股权商品{title}，销售总价{needPayPrice}【{sitename}】',1),(79,'sms_ktv_notice_user','KTV购买成功通知买家','尊敬的{userName}，你成功预约KTV房间{title}，成功支付{price}元，验证码{code}【{sitename}】',1),(80,'sms_ktv_notice_shop','KTV购买成功通知买家','尊敬的{shopName}，您KTV房间{title}被预定，成功支付{price}元，预订人姓名{name}，预订人电话{mobile}【{sitename}】',1),(81,'sms_ktv_refund_shop','KTV用户申请退款通知企业','尊敬的{shopName}，你KTV订单{orderId}已被用户申请退款，退款{price}元,请及时处理【{sitename}】',1),(82,'sms_ktv_refund_user','KTV用户申请退款成功通知买家','尊敬的{userName}，你的KTV订单号{orderId}已处理退款{price}元，请登录{sitename}会员中心查看【{sitename}】',1),(83,'sms_ktv_gotime_expired_user','KTV处理过期订单通知买家','尊敬的{userName}，你预约订单号{orderId}，KTV房间{ktvTitle}，已过期，请登录{sitename}申请退款【{sitename}】',1),(84,'sms_yuyue_notice_user','用户预约企业通知买家','您成功预约企业{shopName}，电话{shopTel}，企业地址{shopAddr}，消费码{code}【{sitename}】',1),(85,'register','会员注册发送短信给用户','您被企业{shopName}邀请成功注册{sitename}会员，注册ID{userId}，账户{userAccount}，密码{userPassword}【{sitename}】',1),(86,'sms_shop_news_push','企业新闻短信推送给粉丝','企业{newsSource}有新的文章{newsTitle}，请注意查看【{sitename}】',1),(87,'sms_order_change_price_user','企业改价通知买家','尊敬的{userName}，您的商城订单id【{orderId}】订单总价已经修改为{changePrice}，请及时付款【{sitename}】',1);

/*Table structure for table `tu_sms_bao` */

DROP TABLE IF EXISTS `tu_sms_bao`;

CREATE TABLE `tu_sms_bao` (
  `sms_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0' COMMENT '企业ID',
  `mobile` varchar(11) DEFAULT NULL,
  `status` int(6) unsigned DEFAULT NULL COMMENT '0成功，其他件错误码',
  `content` varchar(500) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`sms_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_sms_bao` */

insert  into `tu_sms_bao`(`sms_id`,`shop_id`,`mobile`,`status`,`content`,`create_time`,`create_ip`) values (1,0,'13338303555',41,'您在聚互CMS手机认证的验证码是4302千万别告诉别人',1528180338,'221.210.88.214'),(2,0,'17313354330',41,'您在聚互CMS手机认证的验证码是9548千万别告诉别人',1528346811,'125.68.94.176'),(3,0,'17313354338',41,'您在聚互CMS手机认证的验证码是4766千万别告诉别人',1528346836,'125.68.94.176'),(4,0,'17313354338',41,'您在聚互CMS手机认证的验证码是9721千万别告诉别人',1528346949,'125.68.94.176'),(5,0,'18864874770',30,'您在工作网手机认证的验证码是7084千万别告诉别人',1574904570,'127.0.0.1');

/*Table structure for table `tu_sms_shop` */

DROP TABLE IF EXISTS `tu_sms_shop`;

CREATE TABLE `tu_sms_shop` (
  `log_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `type` enum('shop','community','delivery') DEFAULT 'shop',
  `shop_id` smallint(8) DEFAULT NULL,
  `community_id` smallint(6) DEFAULT NULL,
  `delivery_id` smallint(6) DEFAULT NULL,
  `num` smallint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0正常，1锁定',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_sms_shop` */

insert  into `tu_sms_shop`(`log_id`,`user_id`,`type`,`shop_id`,`community_id`,`delivery_id`,`num`,`status`,`create_time`,`create_ip`) values (1,'1','shop',1,NULL,NULL,80,0,1526969503,'111.37.71.184'),(2,'5','shop',2,NULL,NULL,80,0,1575337395,'27.222.98.103');

/*Table structure for table `tu_stock` */

DROP TABLE IF EXISTS `tu_stock`;

CREATE TABLE `tu_stock` (
  `stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT '0' COMMENT '0表示后台发布',
  `city_id` int(10) DEFAULT '0',
  `area_id` int(10) DEFAULT '0',
  `business_id` int(10) DEFAULT '0',
  `title` varchar(64) DEFAULT '',
  `intro` varchar(128) DEFAULT NULL COMMENT '股权简介',
  `details` text,
  `price` int(10) DEFAULT '0' COMMENT '总价格',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `rank_ids` varchar(64) DEFAULT NULL COMMENT '会员等级',
  `is_local` tinyint(1) DEFAULT '0' COMMENT '会员可见',
  `prestige` int(11) DEFAULT '0' COMMENT '可用威望',
  `sold_num` int(11) NOT NULL DEFAULT '0' COMMENT '已售股权',
  `photo` varchar(128) DEFAULT '',
  `thumb` text,
  `orderby` int(11) DEFAULT '100' COMMENT '默认排序',
  `views` int(11) DEFAULT '0' COMMENT '浏览次数',
  `closed` tinyint(1) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`stock_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_stock` */

/*Table structure for table `tu_stock_group` */

DROP TABLE IF EXISTS `tu_stock_group`;

CREATE TABLE `tu_stock_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL COMMENT '队伍ID',
  `jury_id` smallint(5) DEFAULT '0',
  `group_name` varchar(32) DEFAULT NULL,
  `intro` varchar(128) NOT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_stock_group` */

/*Table structure for table `tu_stock_jury` */

DROP TABLE IF EXISTS `tu_stock_jury`;

CREATE TABLE `tu_stock_jury` (
  `jury_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` smallint(5) DEFAULT '0',
  `jury_name` varchar(32) DEFAULT NULL,
  `intro` varchar(128) NOT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`jury_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_stock_jury` */

/*Table structure for table `tu_stock_order` */

DROP TABLE IF EXISTS `tu_stock_order`;

CREATE TABLE `tu_stock_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) DEFAULT '0' COMMENT '股权ID',
  `stock_number` int(32) DEFAULT NULL COMMENT '随机编号13位',
  `user_id` int(10) DEFAULT '0',
  `shop_id` int(11) unsigned DEFAULT NULL,
  `num` int(10) DEFAULT '0' COMMENT '购买数量',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '单价',
  `prestige` int(11) DEFAULT '0' COMMENT '使用威望',
  `prestige_deduction_ratio` varchar(11) DEFAULT '0' COMMENT '威望抵扣比例',
  `prestige_deduction_price` int(11) DEFAULT '0' COMMENT '抵扣现金',
  `need_pay_price` int(32) DEFAULT NULL COMMENT '实际付款价格',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '未付款，1已付款，2已成功，3已失败',
  `name` varchar(32) DEFAULT NULL COMMENT '购买人姓名',
  `mobile` varchar(32) DEFAULT NULL COMMENT '购买人电话',
  `card_id` int(32) DEFAULT NULL COMMENT '购买人身份证号码',
  `query_views` int(11) NOT NULL DEFAULT '0' COMMENT '查询次数',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未关闭，1已关闭',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_stock_order` */

/*Table structure for table `tu_stock_team` */

DROP TABLE IF EXISTS `tu_stock_team`;

CREATE TABLE `tu_stock_team` (
  `team_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '队伍管理员',
  `team_name` varchar(64) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL COMMENT '队伍图片',
  `intro` varchar(64) DEFAULT NULL COMMENT '队伍简介',
  `orderby` tinyint(3) DEFAULT '100' COMMENT '队伍排序',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '关闭',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`team_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_stock_team` */

/*Table structure for table `tu_store` */

DROP TABLE IF EXISTS `tu_store`;

CREATE TABLE `tu_store` (
  `shop_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(64) DEFAULT NULL COMMENT '冗余方便查询',
  `city_id` int(11) unsigned DEFAULT NULL,
  `area_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT '0',
  `cate` varchar(64) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0' COMMENT '1 代表营业中',
  `is_coupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不支持，1支持',
  `busihour` varchar(100) NOT NULL,
  `is_radius` int(11) DEFAULT NULL,
  `given_distribution` int(11) DEFAULT NULL,
  `is_print_deliver` tinyint(1) NOT NULL DEFAULT '0',
  `is_voice` tinyint(1) NOT NULL DEFAULT '0',
  `is_refresh` tinyint(1) NOT NULL DEFAULT '0',
  `is_refresh_second` int(3) DEFAULT NULL,
  `tags` varchar(128) DEFAULT NULL,
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '1代表支持在线付款',
  `is_daofu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不支持，1支持',
  `is_fan` tinyint(1) DEFAULT '0' COMMENT '1 代表返现',
  `fan_money` int(10) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `full_money` int(10) DEFAULT '0' COMMENT '满多少MONEY 立刻减几元',
  `new_money` int(10) DEFAULT '0' COMMENT '减多少钱  比如说 满20减5元 那么  每增加10块钱 将额外减一元',
  `is_full` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启满减',
  `order_price_full_1` int(11) DEFAULT NULL COMMENT '满多少1',
  `order_price_reduce_1` int(11) DEFAULT NULL COMMENT '减多少1',
  `order_price_full_2` int(11) DEFAULT NULL COMMENT '满多少2',
  `order_price_reduce_2` int(11) DEFAULT NULL COMMENT '减多少2',
  `logistics` int(10) DEFAULT '0' COMMENT '0代表不收取配送费 填写其他的将代表收取',
  `logistics_full` int(11) DEFAULT NULL COMMENT '满多少金额免配送费',
  `since_money` int(10) DEFAULT NULL COMMENT '起送价',
  `sold_num` int(10) DEFAULT NULL,
  `month_num` int(10) DEFAULT NULL,
  `intro` varchar(1024) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100' COMMENT '数字越小排序越高',
  `distribution` tinyint(3) DEFAULT '30' COMMENT '分钟  配送时间',
  `audit` tinyint(3) unsigned DEFAULT '0' COMMENT '0审核中1成功入驻2未通过',
  `rate` int(11) DEFAULT '60' COMMENT '费率 每个商品的结算价格',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_store` */

/*Table structure for table `tu_store_cate` */

DROP TABLE IF EXISTS `tu_store_cate`;

CREATE TABLE `tu_store_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`cate_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_store_cate` */

insert  into `tu_store_cate`(`cate_id`,`shop_id`,`cate_name`,`num`,`closed`) values (66,1,'便民店',1,0),(67,2,'烟酒',1,0),(68,13,'饼干',4,0),(69,13,'泡面',6,0),(70,13,'饮料',3,0);

/*Table structure for table `tu_store_dianping` */

DROP TABLE IF EXISTS `tu_store_dianping`;

CREATE TABLE `tu_store_dianping` (
  `dianping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `speed` tinyint(3) unsigned DEFAULT '0',
  `cost` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `dianping_id` (`dianping_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_store_dianping` */

/*Table structure for table `tu_store_dianping_pics` */

DROP TABLE IF EXISTS `tu_store_dianping_pics`;

CREATE TABLE `tu_store_dianping_pics` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE,
  KEY `dianping_id` (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_store_dianping_pics` */

/*Table structure for table `tu_store_order` */

DROP TABLE IF EXISTS `tu_store_order`;

CREATE TABLE `tu_store_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `addr_id` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT '0',
  `logistics` int(11) DEFAULT '0',
  `need_pay` int(11) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `new_money` int(11) DEFAULT '0',
  `logistics_full_money` int(11) DEFAULT '0' COMMENT '满多少配送费立减费用',
  `download_coupon_id` int(11) DEFAULT NULL COMMENT '使用下载优惠劵ID',
  `reduce_coupun_money` int(11) DEFAULT NULL COMMENT '使用优惠劵减去费用',
  `full_reduce_price` int(11) NOT NULL DEFAULT '0' COMMENT '满减费用',
  `tableware_price` int(11) DEFAULT '0' COMMENT '餐具费用',
  `settlement_price` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0' COMMENT '1等待处理  2代表已经确认  8代表配送完成',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '0是货到付款，1是在线支付',
  `is_daofu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为在线支付，1为货到付款',
  `is_store` tinyint(1) NOT NULL DEFAULT '0',
  `is_profit` tinyint(1) DEFAULT '0' COMMENT '1代表已分销，0未分销',
  `is_print` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `pay_time` int(11) DEFAULT NULL COMMENT '外卖付款时间',
  `refund_time` int(11) DEFAULT NULL COMMENT '退款时间',
  `orders_time` int(11) DEFAULT NULL COMMENT '接单时间',
  `end_time` int(11) DEFAULT NULL COMMENT '订单完成时间',
  `create_ip` varchar(15) DEFAULT NULL,
  `audit_time` int(11) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `month` int(11) DEFAULT '201501',
  `message` varchar(100) DEFAULT NULL,
  `is_dianping` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_store_order` */

/*Table structure for table `tu_store_order_product` */

DROP TABLE IF EXISTS `tu_store_order_product`;

CREATE TABLE `tu_store_order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT NULL,
  `tableware_price` int(11) DEFAULT '0' COMMENT '订单菜单表新增餐具费',
  `month` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_store_order_product` */

/*Table structure for table `tu_store_product` */

DROP TABLE IF EXISTS `tu_store_product`;

CREATE TABLE `tu_store_product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(32) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `cost_price` int(11) DEFAULT NULL COMMENT '原价',
  `price` int(11) DEFAULT NULL,
  `tableware_price` int(11) DEFAULT '0' COMMENT '餐具费',
  `settlement_price` int(11) unsigned DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_tuijian` tinyint(1) DEFAULT '0',
  `sold_num` int(11) DEFAULT '0',
  `month_num` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_store_product` */

/*Table structure for table `tu_store_reminder` */

DROP TABLE IF EXISTS `tu_store_reminder`;

CREATE TABLE `tu_store_reminder` (
  `reminder_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL COMMENT '外卖催单企业ID',
  `create_time` int(11) DEFAULT NULL COMMENT '外卖催单时间',
  `create_ip` varchar(32) DEFAULT NULL COMMENT '外卖催单IP',
  PRIMARY KEY (`reminder_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_store_reminder` */

/*Table structure for table `tu_subsidy_money` */

DROP TABLE IF EXISTS `tu_subsidy_money`;

CREATE TABLE `tu_subsidy_money` (
  `money_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `money` int(11) DEFAULT '0' COMMENT '补贴金额',
  `type` enum('ele','running','goods') NOT NULL DEFAULT 'ele' COMMENT '暂时只有subsidy补贴一个值',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`money_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_subsidy_money` */

insert  into `tu_subsidy_money`(`money_id`,`user_id`,`money`,`type`,`create_time`,`create_ip`,`intro`) values (1,4,1000,'',1575193251,'39.90.2.114','测试补贴;修改前用户余额：10');

/*Table structure for table `tu_system_content` */

DROP TABLE IF EXISTS `tu_system_content`;

CREATE TABLE `tu_system_content` (
  `content_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `contents` text,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`content_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_system_content` */

/*Table structure for table `tu_template` */

DROP TABLE IF EXISTS `tu_template`;

CREATE TABLE `tu_template` (
  `template_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT '1' COMMENT '模板类型',
  `name` varchar(32) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL COMMENT '模板简介',
  `theme` varchar(32) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `price` int(11) DEFAULT '0' COMMENT '销售价格',
  `sold_num` int(11) DEFAULT '0' COMMENT '已售数量',
  `is_default` tinyint(1) DEFAULT '0',
  `is_mobile` tinyint(1) DEFAULT '0' COMMENT '1代表手机0代表PC',
  `closed` tinyint(1) DEFAULT '0' COMMENT '1关闭',
  PRIMARY KEY (`template_id`) USING BTREE,
  UNIQUE KEY `theme` (`theme`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_template` */

insert  into `tu_template`(`template_id`,`type`,`name`,`intro`,`theme`,`photo`,`price`,`sold_num`,`is_default`,`is_mobile`,`closed`) values (12,2,'酒店','最好的酒店模板','hotel','index.jpg',2335,2,0,1,0);

/*Table structure for table `tu_template_order` */

DROP TABLE IF EXISTS `tu_template_order`;

CREATE TABLE `tu_template_order` (
  `order_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '购买人的会员ID',
  `template_id` int(11) DEFAULT NULL COMMENT '模板ID',
  `price` int(11) DEFAULT NULL COMMENT '付款金额不做促销',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未付款，1已付款',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0代表正常，1代表删除',
  `shop_name` varchar(50) DEFAULT NULL COMMENT '购买企业名称',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_template_order` */

insert  into `tu_template_order`(`order_id`,`shop_id`,`user_id`,`template_id`,`price`,`status`,`closed`,`shop_name`,`create_time`,`create_ip`) values (1,1,1,12,2335,1,0,'zhaopin',1530407683,'get_client_ip');

/*Table structure for table `tu_template_setting` */

DROP TABLE IF EXISTS `tu_template_setting`;

CREATE TABLE `tu_template_setting` (
  `theme` varchar(32) DEFAULT NULL,
  `setting` text,
  UNIQUE KEY `theme` (`theme`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_template_setting` */

insert  into `tu_template_setting`(`theme`,`setting`) values ('default','a:1:{s:5:\"floor\";a:6:{s:5:\"first\";a:3:{s:4:\"name\";s:12:\"休闲零食\";s:5:\"value\";s:2:\"21\";s:2:\"ad\";s:2:\"24\";}s:6:\"second\";a:3:{s:4:\"name\";s:12:\"厨房用品\";s:5:\"value\";s:1:\"1\";s:2:\"ad\";s:2:\"25\";}s:5:\"third\";a:3:{s:4:\"name\";s:12:\"家具电器\";s:5:\"value\";s:2:\"14\";s:2:\"ad\";s:2:\"26\";}s:6:\"fourth\";a:3:{s:4:\"name\";s:12:\"婚庆用品\";s:5:\"value\";s:1:\"2\";s:2:\"ad\";s:2:\"27\";}s:5:\"fifth\";a:3:{s:4:\"name\";s:12:\"生活用品\";s:5:\"value\";s:1:\"6\";s:2:\"ad\";s:2:\"28\";}s:5:\"sixth\";a:3:{s:4:\"name\";s:12:\"建材专区\";s:5:\"value\";s:2:\"33\";s:2:\"ad\";s:2:\"29\";}}}');

/*Table structure for table `tu_test` */

DROP TABLE IF EXISTS `tu_test`;

CREATE TABLE `tu_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `no` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_test` */

/*Table structure for table `tu_thread` */

DROP TABLE IF EXISTS `tu_thread`;

CREATE TABLE `tu_thread` (
  `thread_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `thread_name` varchar(32) DEFAULT NULL,
  `intro` varchar(256) DEFAULT '',
  `photo` varchar(128) DEFAULT '',
  `banner` varchar(128) DEFAULT '',
  `posts` int(10) DEFAULT '0',
  `fans` int(10) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_essence` tinyint(1) NOT NULL DEFAULT '0',
  `orderby` int(11) NOT NULL DEFAULT '100',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`thread_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_thread` */

insert  into `tu_thread`(`thread_id`,`cate_id`,`user_id`,`thread_name`,`intro`,`photo`,`banner`,`posts`,`fans`,`is_hot`,`is_essence`,`orderby`,`closed`,`create_time`,`create_ip`) values (1,3,1,'zhaopin新闻','1','/attachs/2018/05/22/thumb_5b03b1b8556f0.png','/attachs/2018/05/22/thumb_5b03b1b9f1d57.png',0,0,1,1,1,0,1526968765,'111.37.71.184');

/*Table structure for table `tu_thread_cate` */

DROP TABLE IF EXISTS `tu_thread_cate`;

CREATE TABLE `tu_thread_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT '',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_thread_cate` */

insert  into `tu_thread_cate`(`cate_id`,`cate_name`,`orderby`) values (2,'电影动漫',2),(3,'电视剧',3),(4,'生活运动',4),(5,'健身',5),(6,'体育竞技',6),(7,'饮食健康',7),(8,'养生',8),(9,'网络红人',9),(10,'媒体数码',10),(11,'汽车婚礼',12);

/*Table structure for table `tu_thread_collect` */

DROP TABLE IF EXISTS `tu_thread_collect`;

CREATE TABLE `tu_thread_collect` (
  `thread_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`thread_id`,`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_thread_collect` */

/*Table structure for table `tu_thread_comments_photo` */

DROP TABLE IF EXISTS `tu_thread_comments_photo`;

CREATE TABLE `tu_thread_comments_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_thread_comments_photo` */

/*Table structure for table `tu_thread_donate` */

DROP TABLE IF EXISTS `tu_thread_donate`;

CREATE TABLE `tu_thread_donate` (
  `donate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `money` decimal(10,1) DEFAULT '0.0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`donate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_thread_donate` */

/*Table structure for table `tu_thread_post` */

DROP TABLE IF EXISTS `tu_thread_post`;

CREATE TABLE `tu_thread_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT '',
  `photo` varchar(64) DEFAULT NULL,
  `thread_id` int(10) DEFAULT '0',
  `city_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `cate_id` int(10) DEFAULT '0',
  `details` text,
  `user_id` int(10) DEFAULT '0',
  `donate_num` int(10) DEFAULT '0',
  `reply_num` int(10) DEFAULT '0',
  `zan_num` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  `is_fine` tinyint(1) NOT NULL DEFAULT '0',
  `last_id` int(10) DEFAULT '0',
  `last_time` int(10) DEFAULT '0',
  `orderby` int(11) NOT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_thread_post` */

/*Table structure for table `tu_thread_post_comments` */

DROP TABLE IF EXISTS `tu_thread_post_comments`;

CREATE TABLE `tu_thread_post_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `contents` text,
  `user_id` int(10) DEFAULT '0',
  `reply_comment_id` int(10) DEFAULT '0',
  `reply_user_id` int(10) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_thread_post_comments` */

/*Table structure for table `tu_thread_post_photo` */

DROP TABLE IF EXISTS `tu_thread_post_photo`;

CREATE TABLE `tu_thread_post_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_thread_post_photo` */

/*Table structure for table `tu_thread_post_zan` */

DROP TABLE IF EXISTS `tu_thread_post_zan`;

CREATE TABLE `tu_thread_post_zan` (
  `zan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`zan_id`) USING BTREE,
  UNIQUE KEY `post_id` (`post_id`,`create_ip`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_thread_post_zan` */

/*Table structure for table `tu_tp_goods_attr` */

DROP TABLE IF EXISTS `tu_tp_goods_attr`;

CREATE TABLE `tu_tp_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性id自增',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
  `attr_value` text NOT NULL COMMENT '属性值',
  `attr_price` varchar(255) NOT NULL DEFAULT '' COMMENT '属性价格',
  PRIMARY KEY (`goods_attr_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `attr_id` (`attr_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tp_goods_attr` */

insert  into `tu_tp_goods_attr`(`goods_attr_id`,`goods_id`,`attr_id`,`attr_value`,`attr_price`) values (1,1,352,'黄','0');

/*Table structure for table `tu_tp_goods_attribute` */

DROP TABLE IF EXISTS `tu_tp_goods_attribute`;

CREATE TABLE `tu_tp_goods_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '属性分类id',
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不需要检索 1关键字检索 2范围检索',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0唯一属性 1单选属性 2复选属性',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 0 手工录入 1从列表中选择 2多行文本框',
  `attr_values` text NOT NULL COMMENT '可选值列表',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '属性排序',
  PRIMARY KEY (`attr_id`) USING BTREE,
  KEY `cat_id` (`type_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=353 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tp_goods_attribute` */

insert  into `tu_tp_goods_attribute`(`attr_id`,`attr_name`,`type_id`,`attr_index`,`attr_type`,`attr_input_type`,`attr_values`,`order`) values (57,'支持频率/网络频率',4,0,0,0,'',0),(58,'尺寸体积',4,0,0,0,'   ',0),(59,'外观样式',4,0,0,1,'翻盖\r\n滑盖\r\n直板\r\n折叠\r\n手写',0),(60,'主屏参数/内屏参数',4,0,0,0,'',0),(61,'副屏参数/外屏参数',4,0,0,0,'',0),(62,'清晰度',4,0,0,0,'',0),(63,'色数/灰度',4,0,0,1,'   ',0),(64,'长度',4,0,0,0,'',0),(65,'宽度',4,0,0,0,'',0),(66,'厚度',4,0,0,0,'',0),(67,'屏幕材质',4,0,0,0,'',0),(68,'内存容量',4,0,0,1,'8G\r\n16G\r\n32G\r\n64G',0),(69,'操作系统',4,1,0,0,'android4.0\r\nandroid5.0\r\nandroid6.0',0),(70,'通话时间',4,0,0,0,'',0),(71,'待机时间',4,0,0,0,'',0),(72,'标准配置',4,0,0,0,'',0),(73,'WAP上网',4,0,0,0,'',0),(74,'数据业务',4,0,0,0,'',0),(75,'天线位置',4,0,0,1,'内置\r\n外置',0),(76,'随机配件',4,0,0,0,'',0),(77,'铃声',4,0,0,0,'',0),(78,'摄像头',4,0,0,0,'',0),(79,'彩信/彩e',4,0,0,1,'支持\r\n不支持',0),(80,'红外/蓝牙',4,1,0,0,'蓝牙2.0\r\n蓝牙3.0\r\n蓝牙4.0',0),(81,'价格等级',4,0,0,1,'高价机\r\n中价机\r\n低价机',0),(165,'产地',8,0,0,0,'',0),(166,'产品规格/容量',8,0,0,0,'',0),(167,'主要原料',8,0,0,0,'',0),(168,'所属类别',8,0,0,1,'彩妆\r\n化妆工具\r\n护肤品\r\n香水',0),(169,'使用部位',8,0,0,0,'',0),(170,'适合肤质',8,0,0,1,'油性\r\n中性\r\n干性',0),(171,'适用人群',8,0,0,1,'女性\r\n男性',0),(172,'上市日期',9,1,0,1,'2008年01月\r\n2008年02月\r\n2008年03月\r\n2008年04月\r\n2008年05月\r\n2008年06月',0),(223,'操作系统',15,0,0,1,'Android \r\nIOS\r\nWindows',50),(224,'CPU核数',15,0,0,1,'双核\r\n四核\r\n八核',50),(225,'品牌',16,1,0,0,'',50),(226,'型号',16,1,0,0,'',50),(173,'手机制式',9,1,0,1,'GSM,850,900,1800,1900\r\nGSM,900,1800,1900,2100\r\nCDMA\r\n双模（GSM,900,1800,CDMA 1X）\r\n3G(GSM,900,1800,1900,TD-SCDMA )',1),(174,'理论通话时间',9,0,0,0,'',2),(175,'理论待机时间',9,0,0,0,'',3),(176,'铃声',9,0,0,0,'',4),(177,'铃声格式',9,0,0,0,'',5),(178,'外观样式',9,1,0,1,'翻盖\r\n滑盖\r\n直板\r\n折叠',6),(179,'中文短消息',9,0,0,0,'',7),(180,'存储卡格式',9,0,1,2,'',0),(181,'内存容量',9,2,1,0,'',0),(182,'操作系统',9,0,0,0,'',0),(183,'K-JAVA',9,0,0,0,'',0),(184,'尺寸体积',9,0,0,0,'',0),(185,'颜色',9,1,1,1,'黑色\r\n白色\r\n蓝色\r\n金色\r\n粉色\r\n银色\r\n灰色\r\n深李色\r\n黑红色\r\n黑蓝色\r\n白紫色',0),(186,'屏幕颜色',9,1,0,1,'1600万\r\n262144万',0),(187,'屏幕材质',9,0,0,1,'TFT',0),(188,'屏幕分辨率',9,1,0,1,'320×240 像素\r\n240×400 像素\r\n240×320 像素\r\n176x220 像素',0),(189,'屏幕大小',9,0,0,0,'',0),(190,'中文输入法',9,0,0,0,'',0),(191,'情景模式',9,0,0,0,'',0),(192,'网络链接',9,0,0,0,'',0),(193,'蓝牙接口',9,0,0,0,'',0),(194,'数据线接口',9,0,0,0,'',0),(195,'电子邮件',9,0,0,0,'',0),(196,'闹钟',9,0,0,0,'',35),(197,'办公功能',9,0,0,0,'',0),(198,'数码相机',9,1,0,0,'',0),(199,'像素',9,0,0,0,'',0),(200,'传感器',9,0,0,0,'',0),(201,'变焦模式',9,0,0,0,'',0),(202,'视频拍摄',9,0,0,0,'',0),(203,'MP3播放器',9,0,0,0,'',0),(204,'视频播放',9,0,0,0,'',0),(205,'CPU频率',9,0,0,0,'',0),(206,'收音机',9,0,0,0,'',0),(207,'耳机接口',9,0,0,0,'',0),(208,'闪光灯',9,0,0,0,'',0),(209,'浏览器',9,0,0,0,'',0),(210,'配件',9,0,2,1,'线控耳机\r\n蓝牙耳机\r\n数据线',0),(227,'CPU',16,0,0,0,'',50),(228,'RAM',16,0,0,0,'',50),(222,'木瓜成分',8,0,0,1,'天然木瓜\r\n种植木瓜',50),(229,'天线',16,0,0,0,'',50),(230,'WPS功能',16,1,0,1,'支持\r\n不支持',50),(231,'无线速率',16,0,0,0,'',50),(232,'传输标准',16,0,0,0,'',50),(233,'无线频段',16,0,0,0,'',50),(234,'品牌',17,1,0,0,'',50),(235,'型号',17,0,0,0,'',50),(236,'处理器',17,0,0,0,'',50),(237,'内存',17,1,0,0,'',50),(238,'闪存',17,1,0,0,'',50),(239,'蓝牙',17,0,0,0,'',50),(240,'扩展存储介质',17,0,0,0,'',50),(241,'操作系统',17,1,0,0,'',50),(242,'视频播放',17,0,0,0,'',50),(243,'无线功能',17,0,0,0,'',50),(244,'网络接口',17,0,0,0,'',50),(245,'MicroSD卡槽',17,0,0,0,'',50),(246,'USB接口',17,0,0,0,'',50),(247,'遥控器',17,0,0,0,'',50),(248,'产品尺寸',17,0,0,0,'',50),(249,'品牌',18,1,0,0,'',50),(250,'型号',18,0,0,0,'',50),(251,'分辨率',18,0,0,0,'',50),(252,'屏幕尺寸',18,1,0,1,'30\r\n32\r\n40\r\n42\r\n50\r\n55\r\n58',50),(253,'屏幕比例',18,0,0,0,'',50),(254,'电视3D功能',18,1,0,1,'支持\r\n不支持',50),(255,'保修政策 ',18,0,0,1,'一年\r\n两年\r\n三年\r\n四年\r\n五年',50),(256,'品牌',19,1,0,0,'',50),(257,'床品套件类别',19,0,0,0,'',50),(258,'尺寸',19,1,0,0,'',50),(259,'适用床尺寸',19,1,0,0,'',50),(260,'面料',19,1,0,0,'',50),(261,'包裹清单',19,0,0,0,'',50),(262,'品牌',20,1,0,0,'',50),(263,'型号',20,0,0,0,'',50),(264,'家装风格',20,0,0,0,'',50),(265,'灯具材质',20,0,0,0,'',50),(266,'光源类型',20,0,0,0,'',50),(267,'适用空间',20,0,0,0,'',50),(268,'功率',20,0,0,0,'',50),(269,'光源个数',20,0,0,0,'',50),(270,'品牌',21,1,0,0,'',50),(271,'家具材质',21,0,0,0,'',50),(272,'是否带软靠',21,0,0,1,'是\r\n否',50),(273,'是否带储物空间',21,0,0,1,'是\r\n否',50),(274,'型号',21,0,0,0,'',50),(275,'最大承重量',21,0,0,0,'',50),(276,'重量',21,0,0,0,'',50),(277,'体积',21,0,0,2,'1.8\r\n2.0\r\n1.2',50),(278,'床尺寸',21,0,0,0,'',50),(279,'品牌',22,1,0,0,'',50),(280,'打开方式',22,0,0,0,'',50),(281,'面料',22,0,0,0,'',50),(282,'伞骨材质',22,0,0,0,'',50),(283,'功能',22,0,0,0,'',50),(284,'品牌',23,1,0,0,'',50),(285,'厨具材质',23,0,0,0,'',50),(286,'型号',23,0,0,0,'',50),(287,'产地',23,0,0,0,'',50),(288,'毛重',23,0,0,0,'',50),(289,'面料主材质',24,0,0,0,'',50),(290,'版型',24,0,0,0,'',50),(291,'适用人群',24,1,0,1,'女士\r\n男士',50),(292,'品牌',26,1,0,0,'',50),(293,'型号',26,1,0,0,'',50),(294,'模杯厚度',26,1,0,0,'',50),(295,'侧翼面料',26,1,0,0,'',50),(296,'插片',26,1,0,0,'',50),(297,'搭扣排数',26,1,0,0,'',50),(298,'肩带样式',26,1,0,0,'',50),(299,'罩杯面料',26,1,0,0,'',50),(300,'文胸款式',26,1,0,0,'',50),(301,'罩杯款式',26,1,0,0,'',50),(302,'钢圈',26,1,0,0,'',50),(303,'品牌',27,1,0,0,'',50),(304,'类别',27,1,0,0,'',50),(305,'保质期',27,1,0,0,'',50),(306,'产地',27,0,0,0,'',50),(307,'香调',27,0,0,0,'',50),(308,'适用人群',27,0,0,0,'',50),(309,'适用场所',27,0,0,0,'',50),(310,'规格',27,0,0,0,'',50),(311,'包装尺寸',29,1,0,0,'',50),(312,'毛重',29,1,0,0,'',50),(313,'品牌',29,1,0,0,'',50),(314,'制冷方式',29,1,0,0,'',50),(315,'能效等级22',29,1,0,1,'一级\r\n二级\r\n三级\r\n四级\r\n五级',50),(316,'包装尺寸',30,1,0,0,'',50),(317,'毛重',30,1,0,0,'',50),(318,'品牌',30,1,0,0,'',50),(320,'能效等级222',30,1,0,1,'1\r\n2\r\n3\r\n4',50),(321,'产品名称',31,1,0,0,'',50),(322,'品牌',31,1,0,0,'',50),(323,'电池容量',31,1,0,0,'',50),(324,'品牌',32,1,0,0,'',50),(325,'单反级别',32,1,0,0,'',50),(326,'屏幕尺寸',32,1,0,0,'',50),(327,'储存介质',32,1,0,0,'',50),(352,'颜色',33,0,0,1,'红\r\n黄\r\n蓝',50),(341,'鞋子',53,0,0,2,'36\r\n37\r\n38\r\n39\r\n40',50);

/*Table structure for table `tu_tp_goods_category` */

DROP TABLE IF EXISTS `tu_tp_goods_category`;

CREATE TABLE `tu_tp_goods_category` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `cate_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品分类名称',
  `mobile_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '手机端显示的商品分类名',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `parent_id_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '家族图谱',
  `level` tinyint(1) DEFAULT '0' COMMENT '等级',
  `orderby` tinyint(1) unsigned NOT NULL DEFAULT '50' COMMENT '顺序排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `image` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '分类图片',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐为热门分类',
  `cat_group` tinyint(1) DEFAULT '0' COMMENT '分类分组默认0',
  `rate` tinyint(3) DEFAULT '60',
  PRIMARY KEY (`cate_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=844 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tp_goods_category` */

insert  into `tu_tp_goods_category`(`cate_id`,`cate_name`,`mobile_name`,`parent_id`,`parent_id_path`,`level`,`orderby`,`is_show`,`image`,`is_hot`,`cat_group`,`rate`) values (1,'手机 、 数码 、 通信','数码产品',0,'0_1',1,33,1,'/Public/upload/category/2016/04-02/56ffa1252fb1b.jpg',1,0,66),(2,'家用电器','家用电器',0,'0_2',1,50,1,'/Public/upload/category/2016/04-22/5719c3c5bc052.jpg',1,0,60),(3,'电脑、办公','电脑',0,'0_3',1,50,1,'/Public/upload/category/2016/04-22/5719c40f21341.jpg',1,0,60),(4,'家居、家具、家装、厨具','家具',0,'0_4',1,50,1,'/Public/upload/category/2016/04-22/5719c41e70959.jpg',0,0,60),(5,'男装、女装、童装、内衣','服装',0,'0_5',1,50,1,'/Public/upload/category/2016/04-22/5719c432da41e.jpg',0,0,60),(6,'个人化妆','个人化妆',0,'0_6',1,52,1,'/Public/upload/category/2016/04-22/5719c4a1e3447.jpg',0,0,60),(7,'鞋、箱包、珠宝、手表','箱包',0,'0_7',1,50,1,'/Public/upload/category/2016/04-22/5719c445a02ba.jpg',0,0,60),(8,'运动户外','运动户外',0,'0_8',1,50,0,'/Public/upload/category/2016/04-22/5719c45078f06.jpg',0,0,60),(9,'汽车用品','汽车用品',0,'0_9',1,50,0,'/Public/upload/category/2016/04-22/5719c460687ec.jpg',0,0,60),(10,'母婴用品、儿童玩具','母婴用品、儿童玩具',0,'0_10',1,50,0,'/Public/upload/category/2016/04-22/5719c46c0c5ee.jpg',0,0,60),(11,'图书、音像、电子书','图书、音像、电子书',0,'0_11',1,51,0,'/Public/upload/category/2016/04-22/5719c49369854.jpg',0,0,60),(12,'手机配件','手机配件',1,'0_1_12',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(13,'摄影摄像','摄影摄像',1,'0_1_13',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(14,'运营商','运营商',1,'0_1_14',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(15,'数码配件','数码配件',1,'0_1_15',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(16,'娱乐影视','娱乐影视',1,'0_1_16',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(17,'电子教育','电子教育',1,'0_1_17',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(18,'手机通讯','手机通讯',1,'0_1_18',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(19,'生活电器','生活电器',2,'0_2_19',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(20,'大家电','大家电',2,'0_2_20',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(21,'厨房电器','厨房电器',2,'0_2_21',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(22,'个护健康','个护健康',2,'0_2_22',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(24,'网络产品','网络产品',3,'0_3_24',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(25,'办公设备','办公设备',3,'0_3_25',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(26,'文具耗材','文具耗材',3,'0_3_26',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(27,'电脑整机','电脑整机',3,'0_3_27',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(28,'电脑配件','电脑配件',3,'0_3_28',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(29,'外设产品','外设产品',3,'0_3_29',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(30,'游戏设备','游戏设备',3,'0_3_30',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(31,'生活日用','生活日用',4,'0_4_31',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(32,'家装软饰','家装软饰',4,'0_4_32',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(33,'宠物生活','宠物生活',4,'0_4_33',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(34,'厨具','厨具',4,'0_4_34',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(35,'家装建材','家装建材',4,'0_4_35',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(36,'家纺','家纺',4,'0_4_36',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(37,'家具','家具',4,'0_4_37',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(38,'灯具','灯具',4,'0_4_38',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(39,'女装','女装',5,'0_5_39',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(40,'男装','男装',5,'0_5_40',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(41,'内衣','内衣',5,'0_5_41',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(42,'身体护肤','身体护肤',6,'0_6_42',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(43,'口腔护理','口腔护理',6,'0_6_43',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(44,'女性护理','女性护理',6,'0_6_44',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(45,'香水彩妆','香水彩妆',6,'0_6_45',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(46,'清洁用品','清洁用品',6,'0_6_46',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(47,'面部护肤','面部护肤',6,'0_6_47',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(48,'洗发护发','洗发护发',6,'0_6_48',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(49,'精品男包','精品男包',7,'0_7_49',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(50,'功能箱包','功能箱包',7,'0_7_50',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(51,'珠宝','珠宝',7,'0_7_51',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(52,'钟表','钟表',7,'0_7_52',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(53,'时尚女鞋','时尚女鞋',7,'0_7_53',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(54,'流行男鞋','流行男鞋',7,'0_7_54',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(55,'潮流女包','潮流女包',7,'0_7_55',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(56,'体育用品','体育用品',8,'0_8_56',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(57,'户外鞋服','户外鞋服',8,'0_8_57',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(58,'户外装备','户外装备',8,'0_8_58',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(59,'垂钓用品','垂钓用品',8,'0_8_59',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(60,'运动鞋包','运动鞋包',8,'0_8_60',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(61,'游泳用品','游泳用品',8,'0_8_61',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(62,'运动服饰','运动服饰',8,'0_8_62',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(63,'健身训练','健身训练',8,'0_8_63',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(64,'骑行运动','骑行运动',8,'0_8_64',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(65,'车载电器','车载电器',9,'0_9_65',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(66,'美容清洗','美容清洗',9,'0_9_66',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(67,'汽车装饰','汽车装饰',9,'0_9_67',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(68,'安全自驾','安全自驾',9,'0_9_68',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(69,'线下服务','线下服务',9,'0_9_69',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(70,'汽车车型','汽车车型',9,'0_9_70',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(71,'汽车品牌','汽车品牌',9,'0_9_71',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(72,'维修保养','维修保养',9,'0_9_72',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(73,'洗护用品','洗护用品',10,'0_10_73',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(74,'喂养用品','喂养用品',10,'0_10_74',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(75,'童车童床','童车童床',10,'0_10_75',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(76,'安全座椅','安全座椅',10,'0_10_76',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(77,'寝居服饰','寝居服饰',10,'0_10_77',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(78,'奶粉','奶粉',10,'0_10_78',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(79,'妈妈专区','妈妈专区',10,'0_10_79',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(80,'营养辅食','营养辅食',10,'0_10_80',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(81,'童装童鞋','童装童鞋',10,'0_10_81',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(82,'尿裤湿巾','尿裤湿巾',10,'0_10_82',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(83,'玩具乐器','玩具乐器',10,'0_10_83',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(84,'音像','音像',11,'0_11_84',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(85,'刊/原版','刊/原版',11,'0_11_85',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(86,'少儿','少儿',11,'0_11_86',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(87,'电子书','电子书',11,'0_11_87',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(88,'教育','教育',11,'0_11_88',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(89,'数字音乐','数字音乐',11,'0_11_89',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(90,'文艺','文艺',11,'0_11_90',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(91,'经管励志','经管励志',11,'0_11_91',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(92,'人文社科','人文社科',11,'0_11_92',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(93,'生活','生活',11,'0_11_93',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(94,'科技','科技',11,'0_11_94',2,50,1,'/Public/upload/category/2016/04-02/56ffa28b12f4f.jpg',0,0,60),(95,'纸品湿巾','纸品湿巾',46,'0_6_46_95',3,50,1,'',0,0,60),(96,'衣物清洁','衣物清洁',46,'0_6_46_96',3,50,1,'',0,0,60),(97,'家庭清洁','家庭清洁',46,'0_6_46_97',3,50,1,'',0,0,60),(98,'一次性用品','一次性用品',46,'0_6_46_98',3,50,1,'',0,0,60),(99,'驱虫用品','驱虫用品',46,'0_6_46_99',3,50,1,'',0,0,60),(100,'电池 电源 充电器','电池 电源 充电器',12,'0_1_12_100',3,50,1,'',0,0,60),(101,'数据线,耳机','数据线,耳机',12,'0_1_12_101',3,50,0,'',0,0,60),(102,'贴膜,保护套','贴膜,保护套',12,'0_1_12_102',3,50,1,'',0,0,60),(103,'数码相机','数码相机',13,'0_1_13_103',3,50,1,'',0,0,60),(104,'单反相机','单反相机',13,'0_1_13_104',3,50,1,'',0,0,60),(105,'摄像机','摄像机',13,'0_1_13_105',3,50,1,'',0,0,60),(106,'镜头','镜头',13,'0_1_13_106',3,50,1,'',0,0,60),(107,'数码相框','数码相框',13,'0_1_13_107',3,50,1,'',0,0,60),(108,'选号码','选号码',14,'0_1_14_108',3,50,1,'',0,0,60),(109,'办套餐','办套餐',14,'0_1_14_109',3,50,1,'',0,0,60),(110,'合约机','合约机',14,'0_1_14_110',3,50,1,'',0,0,60),(111,'中国移动','中国移动',14,'0_1_14_111',3,50,1,'',0,0,60),(112,'充值卡','充值卡',15,'0_1_15_112',3,50,1,'',0,0,60),(113,'读卡器','读卡器',15,'0_1_15_113',3,50,1,'',0,0,60),(114,'支架','支架',15,'0_1_15_114',3,50,1,'',0,0,60),(115,'滤镜','滤镜',15,'0_1_15_115',3,50,1,'',0,0,60),(116,'音响麦克风','音响麦克风',16,'0_1_16_116',3,50,1,'',0,0,60),(117,'耳机/耳麦','耳机/耳麦',16,'0_1_16_117',3,50,1,'',0,0,60),(118,'学生平板','学生平板',17,'0_1_17_118',3,50,1,'',0,0,60),(119,'点读机','点读机',17,'0_1_17_119',3,50,1,'',0,0,60),(120,'电纸书','电纸书',17,'0_1_17_120',3,50,1,'',0,0,60),(121,'电子词典','电子词典',17,'0_1_17_121',3,50,1,'',0,0,60),(122,'复读机','复读机',17,'0_1_17_122',3,50,1,'',0,0,60),(123,'手机','手机',1,'0_1_123',2,50,1,'',0,0,60),(124,'对讲机','对讲机',18,'0_1_18_124',3,50,1,'',0,0,60),(125,'录音机','录音机',19,'0_2_19_125',3,50,1,'',0,0,60),(126,'饮水机','饮水机',19,'0_2_19_126',3,50,1,'',0,0,60),(127,'烫衣机','烫衣机',19,'0_2_19_127',3,50,1,'',0,0,60),(128,'电风扇','电风扇',19,'0_2_19_128',3,50,1,'',0,0,60),(129,'电话机','电话机',19,'0_2_19_129',3,50,1,'',0,0,60),(130,'电视','电视',20,'0_2_20_130',3,50,1,'',0,0,60),(131,'冰箱','冰箱',20,'0_2_20_131',3,50,1,'',0,0,60),(132,'空调','空调',20,'0_2_20_132',3,50,1,'',0,0,60),(133,'洗衣机','洗衣机',20,'0_2_20_133',3,50,1,'',0,0,60),(134,'热水器','热水器',20,'0_2_20_134',3,50,1,'',0,0,60),(135,'料理/榨汁机','料理/榨汁机',21,'0_2_21_135',3,50,1,'',0,0,60),(136,'电饭锅','电饭锅',21,'0_2_21_136',3,50,1,'',0,0,60),(137,'微波炉','微波炉',21,'0_2_21_137',3,50,1,'',0,0,60),(138,'豆浆机','豆浆机',21,'0_2_21_138',3,50,1,'',0,0,60),(139,'剃须刀','剃须刀',22,'0_2_22_139',3,50,1,'',0,0,60),(140,'吹风机','吹风机',22,'0_2_22_140',3,50,1,'',0,0,60),(141,'按摩器','按摩器',22,'0_2_22_141',3,50,1,'',0,0,60),(142,'足浴盆','足浴盆',22,'0_2_22_142',3,50,1,'',0,0,60),(143,'血压计','血压计',22,'0_2_22_143',3,50,1,'',0,0,60),(144,'厨卫五金','厨卫五金',23,'0_2_23_144',3,50,1,'',0,0,60),(145,'门铃门锁','门铃门锁',23,'0_2_23_145',3,50,1,'',0,0,60),(146,'开关插座','开关插座',23,'0_2_23_146',3,50,1,'',0,0,60),(147,'电动工具','电动工具',23,'0_2_23_147',3,50,1,'',0,0,60),(148,'监控安防','监控安防',23,'0_2_23_148',3,50,1,'',0,0,60),(149,'仪表仪器','仪表仪器',23,'0_2_23_149',3,50,1,'',0,0,60),(150,'电线线缆','电线线缆',23,'0_2_23_150',3,50,1,'',0,0,60),(151,'浴霸/排气扇','浴霸/排气扇',23,'0_2_23_151',3,50,1,'',0,0,60),(152,'灯具','灯具',23,'0_2_23_152',3,50,1,'',0,0,60),(153,'水龙头','水龙头',23,'0_2_23_153',3,50,1,'',0,0,60),(154,'网络配件','网络配件',24,'0_3_24_154',3,50,1,'',0,0,60),(155,'路由器','路由器',24,'0_3_24_155',3,50,1,'',0,0,60),(156,'网卡','网卡',24,'0_3_24_156',3,50,1,'',0,0,60),(157,'交换机','交换机',24,'0_3_24_157',3,50,1,'',0,0,60),(158,'网络存储','网络存储',24,'0_3_24_158',3,50,1,'',0,0,60),(159,'3G/4G/5G上网','3G/4G/5G上网',24,'0_3_24_159',3,50,1,'',0,0,60),(160,'网络盒子','网络盒子',24,'0_3_24_160',3,50,1,'',0,0,60),(161,'复合机','复合机',25,'0_3_25_161',3,50,1,'',0,0,60),(162,'办公家具','办公家具',25,'0_3_25_162',3,50,1,'',0,0,60),(163,'摄影机','摄影机',25,'0_3_25_163',3,50,1,'',0,0,60),(164,'碎纸机','碎纸机',25,'0_3_25_164',3,50,1,'',0,0,60),(165,'白板','白板',25,'0_3_25_165',3,50,1,'',0,0,60),(166,'投影配件','投影配件',25,'0_3_25_166',3,50,1,'',0,0,60),(167,'考勤机','考勤机',25,'0_3_25_167',3,50,1,'',0,0,60),(168,'多功能一体机','多功能一体机',25,'0_3_25_168',3,50,1,'',0,0,60),(169,'收款/POS机','收款/POS机',25,'0_3_25_169',3,50,1,'',0,0,60),(170,'打印机','打印机',25,'0_3_25_170',3,50,1,'',0,0,60),(171,'会员视频音频','会员视频音频',25,'0_3_25_171',3,50,1,'',0,0,60),(172,'传真设备','传真设备',25,'0_3_25_172',3,50,1,'',0,0,60),(173,'保险柜','保险柜',25,'0_3_25_173',3,50,1,'',0,0,60),(174,'验钞/点钞机','验钞/点钞机',25,'0_3_25_174',3,50,1,'',0,0,60),(175,'装订/封装机','装订/封装机',25,'0_3_25_175',3,50,1,'',0,0,60),(176,'扫描设备','扫描设备',25,'0_3_25_176',3,50,1,'',0,0,60),(177,'安防监控','安防监控',25,'0_3_25_177',3,50,1,'',0,0,60),(178,'文具管理','文具管理',26,'0_3_26_178',3,50,1,'',0,0,60),(179,'本册便签','本册便签',26,'0_3_26_179',3,50,1,'',0,0,60),(180,'硒鼓/墨粉','硒鼓/墨粉',26,'0_3_26_180',3,50,1,'',0,0,60),(181,'计算器','计算器',26,'0_3_26_181',3,50,1,'',0,0,60),(182,'墨盒','墨盒',26,'0_3_26_182',3,50,1,'',0,0,60),(183,'笔类','笔类',26,'0_3_26_183',3,50,1,'',0,0,60),(184,'色带','色带',26,'0_3_26_184',3,50,1,'',0,0,60),(185,'画具画材','画具画材',26,'0_3_26_185',3,50,1,'',0,0,60),(186,'纸类','纸类',26,'0_3_26_186',3,50,1,'',0,0,60),(187,'财会用品','财会用品',26,'0_3_26_187',3,50,1,'',0,0,60),(188,'办公文具','办公文具',26,'0_3_26_188',3,50,1,'',0,0,60),(189,'刻录碟片','刻录碟片',26,'0_3_26_189',3,50,1,'',0,0,60),(190,'学生文具','学生文具',26,'0_3_26_190',3,50,1,'',0,0,60),(191,'平板电脑','平板电脑',27,'0_3_27_191',3,50,1,'',0,0,60),(192,'台式机','台式机',27,'0_3_27_192',3,50,1,'',0,0,60),(193,'一体机','一体机',27,'0_3_27_193',3,50,1,'',0,0,60),(194,'笔记本','笔记本',27,'0_3_27_194',3,50,1,'',0,0,60),(195,'超极本','超极本',27,'0_3_27_195',3,50,1,'',0,0,60),(196,'内存','内存',28,'0_3_28_196',3,50,1,'',0,0,60),(197,'组装电脑','组装电脑',28,'0_3_28_197',3,50,1,'',0,0,60),(198,'机箱','机箱',28,'0_3_28_198',3,50,1,'',0,0,60),(199,'电源','电源',28,'0_3_28_199',3,50,1,'',0,0,60),(200,'CPU','CPU',28,'0_3_28_200',3,50,1,'',0,0,60),(201,'显示器','显示器',28,'0_3_28_201',3,50,1,'',0,0,60),(202,'主板','主板',28,'0_3_28_202',3,50,1,'',0,0,60),(203,'刻录机/光驱','刻录机/光驱',28,'0_3_28_203',3,50,1,'',0,0,60),(204,'显卡','显卡',28,'0_3_28_204',3,50,1,'',0,0,60),(205,'声卡/扩展卡','声卡/扩展卡',28,'0_3_28_205',3,50,1,'',0,0,60),(206,'硬盘','硬盘',28,'0_3_28_206',3,50,1,'',0,0,60),(207,'散热器','散热器',28,'0_3_28_207',3,50,1,'',0,0,60),(208,'固态硬盘','固态硬盘',28,'0_3_28_208',3,50,1,'',0,0,60),(209,'装机配件','装机配件',28,'0_3_28_209',3,50,1,'',0,0,60),(210,'线缆','线缆',29,'0_3_29_210',3,50,1,'',0,0,60),(211,'鼠标','鼠标',29,'0_3_29_211',3,50,1,'',0,0,60),(212,'手写板','手写板',29,'0_3_29_212',3,50,1,'',0,0,60),(213,'键盘','键盘',29,'0_3_29_213',3,50,1,'',0,0,60),(214,'电脑工具','电脑工具',29,'0_3_29_214',3,50,1,'',0,0,60),(215,'网络仪表仪器','网络仪表仪器',29,'0_3_29_215',3,50,1,'',0,0,60),(216,'UPS','UPS',29,'0_3_29_216',3,50,1,'',0,0,60),(217,'U盘','U盘',29,'0_3_29_217',3,50,1,'',0,0,60),(218,'插座','插座',29,'0_3_29_218',3,50,1,'',0,0,60),(219,'移动硬盘','移动硬盘',29,'0_3_29_219',3,50,1,'',0,0,60),(220,'鼠标垫','鼠标垫',29,'0_3_29_220',3,50,1,'',0,0,60),(221,'摄像头','摄像头',29,'0_3_29_221',3,50,1,'',0,0,60),(222,'游戏软件','游戏软件',30,'0_3_30_222',3,50,1,'',0,0,60),(223,'游戏周边','游戏周边',30,'0_3_30_223',3,50,1,'',0,0,60),(224,'游戏机','游戏机',30,'0_3_30_224',3,50,1,'',0,0,60),(225,'游戏耳机','游戏耳机',30,'0_3_30_225',3,50,1,'',0,0,60),(226,'手柄方向盘','手柄方向盘',30,'0_3_30_226',3,50,1,'',0,0,60),(227,'清洁工具','清洁工具',31,'0_4_31_227',3,50,1,'',0,0,60),(228,'收纳用品','收纳用品',31,'0_4_31_228',3,50,1,'',0,0,60),(229,'雨伞雨具','雨伞雨具',31,'0_4_31_229',3,50,1,'',0,0,60),(230,'浴室用品','浴室用品',31,'0_4_31_230',3,50,1,'',0,0,60),(231,'缝纫/针织用品','缝纫/针织用品',31,'0_4_31_231',3,50,1,'',0,0,60),(232,'洗晒/熨烫','洗晒/熨烫',31,'0_4_31_232',3,50,1,'',0,0,60),(233,'净化除味','净化除味',31,'0_4_31_233',3,50,1,'',0,0,60),(234,'节庆饰品','节庆饰品',32,'0_4_32_234',3,50,1,'',0,0,60),(235,'手工/十字绣','手工/十字绣',32,'0_4_32_235',3,50,1,'',0,0,60),(236,'桌布/罩件','桌布/罩件',32,'0_4_32_236',3,50,1,'',0,0,60),(237,'钟饰','钟饰',32,'0_4_32_237',3,50,1,'',0,0,60),(238,'地毯地垫','地毯地垫',32,'0_4_32_238',3,50,1,'',0,0,60),(239,'装饰摆件','装饰摆件',32,'0_4_32_239',3,50,1,'',0,0,60),(240,'沙发垫套/椅垫','沙发垫套/椅垫',32,'0_4_32_240',3,50,1,'',0,0,60),(241,'花瓶花艺','花瓶花艺',32,'0_4_32_241',3,50,1,'',0,0,60),(242,'帘艺隔断','帘艺隔断',32,'0_4_32_242',3,50,1,'',0,0,60),(243,'创意家居','创意家居',32,'0_4_32_243',3,50,1,'',0,0,60),(244,'相框/照片墙','相框/照片墙',32,'0_4_32_244',3,50,1,'',0,0,60),(245,'保暖防护','保暖防护',32,'0_4_32_245',3,50,1,'',0,0,60),(246,'装饰字画','装饰字画',32,'0_4_32_246',3,50,1,'',0,0,60),(247,'香薰蜡烛','香薰蜡烛',32,'0_4_32_247',3,50,1,'',0,0,60),(248,'墙贴/装饰贴','墙贴/装饰贴',32,'0_4_32_248',3,50,1,'',0,0,60),(249,'水族用品','水族用品',33,'0_4_33_249',3,50,1,'',0,0,60),(250,'宠物玩具','宠物玩具',33,'0_4_33_250',3,50,1,'',0,0,60),(251,'宠物主粮','宠物主粮',33,'0_4_33_251',3,50,1,'',0,0,60),(252,'宠物牵引','宠物牵引',33,'0_4_33_252',3,50,1,'',0,0,60),(253,'宠物零食','宠物零食',33,'0_4_33_253',3,50,1,'',0,0,60),(254,'宠物驱虫','宠物驱虫',33,'0_4_33_254',3,50,1,'',0,0,60),(255,'猫砂/尿布','猫砂/尿布',33,'0_4_33_255',3,50,1,'',0,0,60),(256,'洗护美容','洗护美容',33,'0_4_33_256',3,50,1,'',0,0,60),(257,'家居日用','家居日用',33,'0_4_33_257',3,50,1,'',0,0,60),(258,'医疗保健','医疗保健',33,'0_4_33_258',3,50,1,'',0,0,60),(259,'出行装备','出行装备',33,'0_4_33_259',3,50,1,'',0,0,60),(260,'剪刀菜饭','剪刀菜饭',34,'0_4_34_260',3,50,1,'',0,0,60),(261,'厨房配件','厨房配件',34,'0_4_34_261',3,50,1,'',0,0,60),(262,'水具酒具','水具酒具',34,'0_4_34_262',3,50,1,'',0,0,60),(263,'餐具','餐具',34,'0_4_34_263',3,50,1,'',0,0,60),(264,'茶具/咖啡具','茶具/咖啡具',34,'0_4_34_264',3,50,1,'',0,0,60),(265,'烹饪锅具','烹饪锅具',34,'0_4_34_265',3,50,1,'',0,0,60),(266,'电工电料','电工电料',35,'0_4_35_266',3,50,1,'',0,0,60),(267,'墙地材料','墙地材料',35,'0_4_35_267',3,50,1,'',0,0,60),(268,'装饰材料','装饰材料',35,'0_4_35_268',3,50,1,'',0,0,60),(269,'装修服务','装修服务',35,'0_4_35_269',3,50,1,'',0,0,60),(270,'沐浴花洒','沐浴花洒',35,'0_4_35_270',3,50,1,'',0,0,60),(271,'灯饰照明','灯饰照明',35,'0_4_35_271',3,50,1,'',0,0,60),(272,'开关插座','开关插座',35,'0_4_35_272',3,50,1,'',0,0,60),(273,'厨房卫浴','厨房卫浴',35,'0_4_35_273',3,50,1,'',0,0,60),(274,'油漆涂料','油漆涂料',35,'0_4_35_274',3,50,1,'',0,0,60),(275,'五金工具','五金工具',35,'0_4_35_275',3,50,1,'',0,0,60),(276,'龙头','龙头',35,'0_4_35_276',3,50,1,'',0,0,60),(277,'床品套件','床品套件',36,'0_4_36_277',3,50,1,'',0,0,60),(278,'抱枕靠垫','抱枕靠垫',36,'0_4_36_278',3,50,1,'',0,0,60),(279,'被子','被子',36,'0_4_36_279',3,50,1,'',0,0,60),(280,'布艺软饰','布艺软饰',36,'0_4_36_280',3,50,1,'',0,0,60),(281,'被芯','被芯',36,'0_4_36_281',3,50,1,'',0,0,60),(282,'窗帘窗纱','窗帘窗纱',36,'0_4_36_282',3,50,1,'',0,0,60),(283,'床单被罩','床单被罩',36,'0_4_36_283',3,50,1,'',0,0,60),(284,'蚊帐','蚊帐',36,'0_4_36_284',3,50,1,'',0,0,60),(285,'床垫床褥','床垫床褥',36,'0_4_36_285',3,50,1,'',0,0,60),(286,'凉席','凉席',36,'0_4_36_286',3,50,1,'',0,0,60),(287,'电地毯','电地毯',36,'0_4_36_287',3,50,1,'',0,0,60),(288,'毯子','毯子',36,'0_4_36_288',3,50,1,'',0,0,60),(289,'毛巾浴巾','毛巾浴巾',36,'0_4_36_289',3,50,1,'',0,0,60),(290,'餐厅家具','餐厅家具',37,'0_4_37_290',3,50,1,'',0,0,60),(291,'电脑椅','电脑椅',37,'0_4_37_291',3,50,1,'',0,0,60),(292,'书房家具','书房家具',37,'0_4_37_292',3,50,1,'',0,0,60),(293,'衣柜','衣柜',37,'0_4_37_293',3,50,1,'',0,0,60),(294,'储物家具','储物家具',37,'0_4_37_294',3,50,1,'',0,0,60),(295,'茶几','茶几',37,'0_4_37_295',3,50,1,'',0,0,60),(296,'阳台/户外','阳台/户外',37,'0_4_37_296',3,50,1,'',0,0,60),(297,'电视柜','电视柜',37,'0_4_37_297',3,50,1,'',0,0,60),(298,'商业办公','商业办公',37,'0_4_37_298',3,50,1,'',0,0,60),(299,'餐桌','餐桌',37,'0_4_37_299',3,50,1,'',0,0,60),(300,'卧室家具','卧室家具',37,'0_4_37_300',3,50,1,'',0,0,60),(301,'床','床',37,'0_4_37_301',3,50,1,'',0,0,60),(302,'电脑桌','电脑桌',37,'0_4_37_302',3,50,1,'',0,0,60),(303,'客厅家具','客厅家具',37,'0_4_37_303',3,50,1,'',0,0,60),(304,'床垫','床垫',37,'0_4_37_304',3,50,1,'',0,0,60),(305,'鞋架/衣帽架','鞋架/衣帽架',37,'0_4_37_305',3,50,1,'',0,0,60),(306,'客厅家具','客厅家具',37,'0_4_37_306',3,50,1,'',0,0,60),(307,'沙发','沙发',37,'0_4_37_307',3,50,1,'',0,0,60),(308,'吸顶灯','吸顶灯',38,'0_4_38_308',3,50,1,'',0,0,60),(309,'吊灯','吊灯',38,'0_4_38_309',3,50,1,'',0,0,60),(310,'筒灯射灯','筒灯射灯',38,'0_4_38_310',3,50,1,'',0,0,60),(311,'氛围照明','氛围照明',38,'0_4_38_311',3,50,1,'',0,0,60),(312,'LED灯','LED灯',38,'0_4_38_312',3,50,1,'',0,0,60),(313,'节能灯','节能灯',38,'0_4_38_313',3,50,1,'',0,0,60),(314,'落地灯','落地灯',38,'0_4_38_314',3,50,1,'',0,0,60),(315,'五金电器','五金电器',38,'0_4_38_315',3,50,1,'',0,0,60),(316,'应急灯/手电','应急灯/手电',38,'0_4_38_316',3,50,1,'',0,0,60),(317,'台灯','台灯',38,'0_4_38_317',3,50,1,'',0,0,60),(318,'装饰灯','装饰灯',38,'0_4_38_318',3,50,1,'',0,0,60),(319,'短外套','短外套',39,'0_5_39_319',3,50,1,'',0,0,60),(320,'羊毛衫','羊毛衫',39,'0_5_39_320',3,50,1,'',0,0,60),(321,'雪纺衫','雪纺衫',39,'0_5_39_321',3,50,1,'',0,0,60),(322,'礼服','礼服',39,'0_5_39_322',3,50,1,'',0,0,60),(323,'风衣','风衣',39,'0_5_39_323',3,50,1,'',0,0,60),(324,'羊绒衫','羊绒衫',39,'0_5_39_324',3,50,1,'',0,0,60),(325,'牛仔裤','牛仔裤',39,'0_5_39_325',3,50,1,'',0,0,60),(326,'马甲','马甲',39,'0_5_39_326',3,50,1,'',0,0,60),(327,'衬衫','衬衫',39,'0_5_39_327',3,50,1,'',0,0,60),(328,'半身裙','半身裙',39,'0_5_39_328',3,50,1,'',0,0,60),(329,'休闲裤','休闲裤',39,'0_5_39_329',3,50,1,'',0,0,60),(330,'吊带/背心','吊带/背心',39,'0_5_39_330',3,50,1,'',0,0,60),(331,'羽绒服','羽绒服',39,'0_5_39_331',3,50,1,'',0,0,60),(332,'T恤','T恤',39,'0_5_39_332',3,50,1,'',0,0,60),(333,'大码女装','大码女装',39,'0_5_39_333',3,50,1,'',0,0,60),(334,'正装裤','正装裤',39,'0_5_39_334',3,50,1,'',0,0,60),(335,'设计师/潮牌','设计师/潮牌',39,'0_5_39_335',3,50,1,'',0,0,60),(336,'毛呢大衣','毛呢大衣',39,'0_5_39_336',3,50,1,'',0,0,60),(337,'小西装','小西装',39,'0_5_39_337',3,50,1,'',0,0,60),(338,'中老年女装','中老年女装',39,'0_5_39_338',3,50,1,'',0,0,60),(339,'加绒裤','加绒裤',39,'0_5_39_339',3,50,1,'',0,0,60),(340,'棉服','棉服',39,'0_5_39_340',3,50,1,'',0,0,60),(341,'打底衫','打底衫',39,'0_5_39_341',3,50,1,'',0,0,60),(342,'皮草','皮草',39,'0_5_39_342',3,50,1,'',0,0,60),(343,'短裤','短裤',39,'0_5_39_343',3,50,1,'',0,0,60),(344,'连衣裙','连衣裙',39,'0_5_39_344',3,50,1,'',0,0,60),(345,'打底裤','打底裤',39,'0_5_39_345',3,50,1,'',0,0,60),(346,'真皮皮衣','真皮皮衣',39,'0_5_39_346',3,50,1,'',0,0,60),(347,'婚纱','婚纱',39,'0_5_39_347',3,50,1,'',0,0,60),(348,'卫衣','卫衣',39,'0_5_39_348',3,50,1,'',0,0,60),(349,'针织衫','针织衫',39,'0_5_39_349',3,50,1,'',0,0,60),(350,'仿皮皮衣','仿皮皮衣',39,'0_5_39_350',3,50,1,'',0,0,60),(351,'旗袍/唐装','旗袍/唐装',39,'0_5_39_351',3,50,1,'',0,0,60),(352,'羊毛衫','羊毛衫',40,'0_5_40_352',3,50,1,'',0,0,60),(353,'休闲裤','休闲裤',40,'0_5_40_353',3,50,1,'',0,0,60),(354,'POLO衫','POLO衫',40,'0_5_40_354',3,50,1,'',0,0,60),(355,'加绒裤','加绒裤',40,'0_5_40_355',3,50,1,'',0,0,60),(356,'衬衫','衬衫',40,'0_5_40_356',3,50,1,'',0,0,60),(357,'短裤','短裤',40,'0_5_40_357',3,50,1,'',0,0,60),(358,'真皮皮衣','真皮皮衣',40,'0_5_40_358',3,50,1,'',0,0,60),(359,'毛呢大衣','毛呢大衣',40,'0_5_40_359',3,50,1,'',0,0,60),(360,'中老年男装','中老年男装',40,'0_5_40_360',3,50,1,'',0,0,60),(361,'卫衣','卫衣',40,'0_5_40_361',3,50,1,'',0,0,60),(362,'风衣','风衣',40,'0_5_40_362',3,50,1,'',0,0,60),(363,'大码男装','大码男装',40,'0_5_40_363',3,50,1,'',0,0,60),(364,'羽绒服','羽绒服',40,'0_5_40_364',3,50,1,'',0,0,60),(365,'T恤','T恤',40,'0_5_40_365',3,50,1,'',0,0,60),(366,'仿皮皮衣','仿皮皮衣',40,'0_5_40_366',3,50,1,'',0,0,60),(367,'羊绒衫','羊绒衫',40,'0_5_40_367',3,50,1,'',0,0,60),(368,'棉服','棉服',40,'0_5_40_368',3,50,1,'',0,0,60),(369,'马甲/背心','马甲/背心',40,'0_5_40_369',3,50,1,'',0,0,60),(370,'西服','西服',40,'0_5_40_370',3,50,1,'',0,0,60),(371,'设计师/潮牌','设计师/潮牌',40,'0_5_40_371',3,50,1,'',0,0,60),(372,'针织衫','针织衫',40,'0_5_40_372',3,50,1,'',0,0,60),(373,'西服套装','西服套装',40,'0_5_40_373',3,50,1,'',0,0,60),(374,'西裤','西裤',40,'0_5_40_374',3,50,1,'',0,0,60),(375,'工装','工装',40,'0_5_40_375',3,50,1,'',0,0,60),(376,'夹克','夹克',40,'0_5_40_376',3,50,1,'',0,0,60),(377,'牛仔裤','牛仔裤',40,'0_5_40_377',3,50,1,'',0,0,60),(378,'卫裤/运动裤','卫裤/运动裤',40,'0_5_40_378',3,50,1,'',0,0,60),(379,'唐装/中山装','唐装/中山装',40,'0_5_40_379',3,50,1,'',0,0,60),(380,'保暖内衣','保暖内衣',41,'0_5_41_380',3,50,1,'',0,0,60),(381,'大码内衣','大码内衣',41,'0_5_41_381',3,50,1,'',0,0,60),(382,'吊带/背心','吊带/背心',41,'0_5_41_382',3,50,1,'',0,0,60),(383,'秋衣秋裤','秋衣秋裤',41,'0_5_41_383',3,50,1,'',0,0,60),(384,'文胸','文胸',41,'0_5_41_384',3,50,1,'',0,0,60),(385,'内衣配件','内衣配件',41,'0_5_41_385',3,50,1,'',0,0,60),(386,'睡衣/家居服','睡衣/家居服',41,'0_5_41_386',3,50,1,'',0,0,60),(387,'男式内裤','男式内裤',41,'0_5_41_387',3,50,1,'',0,0,60),(388,'泳衣','泳衣',41,'0_5_41_388',3,50,1,'',0,0,60),(389,'打底裤袜','打底裤袜',41,'0_5_41_389',3,50,1,'',0,0,60),(390,'女式内裤','女式内裤',41,'0_5_41_390',3,50,1,'',0,0,60),(391,'塑身美体','塑身美体',41,'0_5_41_391',3,50,1,'',0,0,60),(392,'休闲棉袜','休闲棉袜',41,'0_5_41_392',3,50,1,'',0,0,60),(393,'连裤袜/丝袜','连裤袜/丝袜',41,'0_5_41_393',3,50,1,'',0,0,60),(394,'美腿袜','美腿袜',41,'0_5_41_394',3,50,1,'',0,0,60),(395,'商务男袜','商务男袜',41,'0_5_41_395',3,50,1,'',0,0,60),(396,'打底衫','打底衫',41,'0_5_41_396',3,50,1,'',0,0,60),(397,'情趣内衣','情趣内衣',41,'0_5_41_397',3,50,1,'',0,0,60),(398,'情侣睡衣','情侣睡衣',41,'0_5_41_398',3,50,1,'',0,0,60),(399,'少女文胸','少女文胸',41,'0_5_41_399',3,50,1,'',0,0,60),(400,'文胸套装','文胸套装',41,'0_5_41_400',3,50,1,'',0,0,60),(401,'抹胸','抹胸',41,'0_5_41_401',3,50,1,'',0,0,60),(402,'沐浴','沐浴',42,'0_6_42_402',3,50,1,'',0,0,60),(403,'润肤','润肤',42,'0_6_42_403',3,50,1,'',0,0,60),(404,'颈部','颈部',42,'0_6_42_404',3,50,1,'',0,0,60),(405,'手足','手足',42,'0_6_42_405',3,50,1,'',0,0,60),(406,'纤体塑形','纤体塑形',42,'0_6_42_406',3,50,1,'',0,0,60),(407,'美胸','美胸',42,'0_6_42_407',3,50,1,'',0,0,60),(408,'套装','套装',42,'0_6_42_408',3,50,1,'',0,0,60),(409,'牙膏/牙粉','牙膏/牙粉',43,'0_6_43_409',3,50,1,'',0,0,60),(410,'牙刷/牙线','牙刷/牙线',43,'0_6_43_410',3,50,1,'',0,0,60),(411,'漱口水','漱口水',43,'0_6_43_411',3,50,1,'',0,0,60),(412,'套装','套装',43,'0_6_43_412',3,50,1,'',0,0,60),(413,'卫生巾','卫生巾',44,'0_6_44_413',3,50,1,'',0,0,60),(414,'卫生护垫','卫生护垫',44,'0_6_44_414',3,50,1,'',0,0,60),(415,'私密护理','私密护理',44,'0_6_44_415',3,50,1,'',0,0,60),(416,'脱毛膏','脱毛膏',44,'0_6_44_416',3,50,1,'',0,0,60),(417,'唇部','唇部',45,'0_6_45_417',3,50,1,'',0,0,60),(418,'美甲','美甲',45,'0_6_45_418',3,50,1,'',0,0,60),(419,'美容工具','美容工具',45,'0_6_45_419',3,50,1,'',0,0,60),(420,'套装','套装',45,'0_6_45_420',3,50,1,'',0,0,60),(421,'香水','香水',45,'0_6_45_421',3,50,1,'',0,0,60),(422,'底妆','底妆',45,'0_6_45_422',3,50,1,'',0,0,60),(423,'腮红','腮红',45,'0_6_45_423',3,50,1,'',0,0,60),(424,'眼部','眼部',45,'0_6_45_424',3,50,1,'',0,0,60),(425,'面膜','面膜',47,'0_6_47_425',3,50,1,'',0,0,60),(426,'剃须','剃须',47,'0_6_47_426',3,50,1,'',0,0,60),(427,'套装','套装',47,'0_6_47_427',3,50,1,'',0,0,60),(428,'清洁','清洁',47,'0_6_47_428',3,50,1,'',0,0,60),(429,'护肤','护肤',47,'0_6_47_429',3,50,1,'',0,0,60),(430,'套装','套装',48,'0_6_48_430',3,50,1,'',0,0,60),(431,'洗发','洗发',48,'0_6_48_431',3,50,1,'',0,0,60),(432,'护发','护发',48,'0_6_48_432',3,50,1,'',0,0,60),(433,'染发','染发',48,'0_6_48_433',3,50,1,'',0,0,60),(434,'造型','造型',48,'0_6_48_434',3,50,1,'',0,0,60),(435,'假发','假发',48,'0_6_48_435',3,50,1,'',0,0,60),(436,'商务公文包','商务公文包',49,'0_7_49_436',3,50,1,'',0,0,60),(437,'单肩/斜挎包','单肩/斜挎包',49,'0_7_49_437',3,50,1,'',0,0,60),(438,'男士手包','男士手包',49,'0_7_49_438',3,50,1,'',0,0,60),(439,'双肩包','双肩包',49,'0_7_49_439',3,50,1,'',0,0,60),(440,'钱包/卡包','钱包/卡包',49,'0_7_49_440',3,50,1,'',0,0,60),(441,'钥匙包','钥匙包',49,'0_7_49_441',3,50,1,'',0,0,60),(442,'旅行包','旅行包',50,'0_7_50_442',3,50,1,'',0,0,60),(443,'妈咪包','妈咪包',50,'0_7_50_443',3,50,1,'',0,0,60),(444,'电脑包','电脑包',50,'0_7_50_444',3,50,1,'',0,0,60),(445,'休闲运动包','休闲运动包',50,'0_7_50_445',3,50,1,'',0,0,60),(446,'相机包','相机包',50,'0_7_50_446',3,50,1,'',0,0,60),(447,'腰包/胸包','腰包/胸包',50,'0_7_50_447',3,50,1,'',0,0,60),(448,'登山包','登山包',50,'0_7_50_448',3,50,1,'',0,0,60),(449,'旅行配件','旅行配件',50,'0_7_50_449',3,50,1,'',0,0,60),(450,'拉杆箱/拉杆包','拉杆箱/拉杆包',50,'0_7_50_450',3,50,1,'',0,0,60),(451,'书包','书包',50,'0_7_50_451',3,50,1,'',0,0,60),(452,'彩宝','彩宝',51,'0_7_51_452',3,50,1,'',0,0,60),(453,'时尚饰品','时尚饰品',51,'0_7_51_453',3,50,1,'',0,0,60),(454,'铂金','铂金',51,'0_7_51_454',3,50,1,'',0,0,60),(455,'钻石','钻石',51,'0_7_51_455',3,50,1,'',0,0,60),(456,'天然木饰','天然木饰',51,'0_7_51_456',3,50,1,'',0,0,60),(457,'翡翠玉石','翡翠玉石',51,'0_7_51_457',3,50,1,'',0,0,60),(458,'珍珠','珍珠',51,'0_7_51_458',3,50,1,'',0,0,60),(459,'纯金K金饰品','纯金K金饰品',51,'0_7_51_459',3,50,1,'',0,0,60),(460,'金银投资','金银投资',51,'0_7_51_460',3,50,1,'',0,0,60),(461,'银饰','银饰',51,'0_7_51_461',3,50,1,'',0,0,60),(462,'水晶玛瑙','水晶玛瑙',51,'0_7_51_462',3,50,1,'',0,0,60),(463,'座钟挂钟','座钟挂钟',52,'0_7_52_463',3,50,1,'',0,0,60),(464,'男表','男表',52,'0_7_52_464',3,50,1,'',0,0,60),(465,'女表','女表',52,'0_7_52_465',3,50,1,'',0,0,60),(466,'儿童表','儿童表',52,'0_7_52_466',3,50,1,'',0,0,60),(467,'智能手表','智能手表',52,'0_7_52_467',3,50,1,'',0,0,60),(468,'女靴','女靴',53,'0_7_53_468',3,50,1,'',0,0,60),(469,'布鞋/绣花鞋','布鞋/绣花鞋',53,'0_7_53_469',3,50,1,'',0,0,60),(470,'鱼嘴鞋','鱼嘴鞋',53,'0_7_53_470',3,50,1,'',0,0,60),(471,'雪地靴','雪地靴',53,'0_7_53_471',3,50,1,'',0,0,60),(472,'凉鞋','凉鞋',53,'0_7_53_472',3,50,1,'',0,0,60),(473,'雨鞋/雨靴','雨鞋/雨靴',53,'0_7_53_473',3,50,1,'',0,0,60),(474,'单鞋','单鞋',53,'0_7_53_474',3,50,1,'',0,0,60),(475,'拖鞋/人字拖','拖鞋/人字拖',53,'0_7_53_475',3,50,1,'',0,0,60),(476,'鞋配件','鞋配件',53,'0_7_53_476',3,50,1,'',0,0,60),(477,'高跟鞋','高跟鞋',53,'0_7_53_477',3,50,1,'',0,0,60),(478,'马丁靴','马丁靴',53,'0_7_53_478',3,50,1,'',0,0,60),(479,'帆布鞋','帆布鞋',53,'0_7_53_479',3,50,1,'',0,0,60),(480,'休闲鞋','休闲鞋',53,'0_7_53_480',3,50,1,'',0,0,60),(481,'妈妈鞋','妈妈鞋',53,'0_7_53_481',3,50,1,'',0,0,60),(482,'踝靴','踝靴',53,'0_7_53_482',3,50,1,'',0,0,60),(483,'防水台','防水台',53,'0_7_53_483',3,50,1,'',0,0,60),(484,'内增高','内增高',53,'0_7_53_484',3,50,1,'',0,0,60),(485,'松糕鞋','松糕鞋',53,'0_7_53_485',3,50,1,'',0,0,60),(486,'坡跟鞋','坡跟鞋',53,'0_7_53_486',3,50,1,'',0,0,60),(487,'增高鞋','增高鞋',54,'0_7_54_487',3,50,1,'',0,0,60),(488,'鞋配件','鞋配件',54,'0_7_54_488',3,50,1,'',0,0,60),(489,'拖鞋/人字拖','拖鞋/人字拖',54,'0_7_54_489',3,50,1,'',0,0,60),(490,'凉鞋/沙滩鞋','凉鞋/沙滩鞋',54,'0_7_54_490',3,50,1,'',0,0,60),(491,'休闲鞋','休闲鞋',54,'0_7_54_491',3,50,1,'',0,0,60),(492,'雨鞋/雨靴','雨鞋/雨靴',54,'0_7_54_492',3,50,1,'',0,0,60),(493,'商务休闲鞋','商务休闲鞋',54,'0_7_54_493',3,50,1,'',0,0,60),(494,'定制鞋','定制鞋',54,'0_7_54_494',3,50,1,'',0,0,60),(495,'正装鞋','正装鞋',54,'0_7_54_495',3,50,1,'',0,0,60),(496,'男靴','男靴',54,'0_7_54_496',3,50,1,'',0,0,60),(497,'帆布鞋','帆布鞋',54,'0_7_54_497',3,50,1,'',0,0,60),(498,'传统布鞋','传统布鞋',54,'0_7_54_498',3,50,1,'',0,0,60),(499,'工装鞋','工装鞋',54,'0_7_54_499',3,50,1,'',0,0,60),(500,'功能鞋','功能鞋',54,'0_7_54_500',3,50,1,'',0,0,60),(501,'钥匙包','钥匙包',55,'0_7_55_501',3,50,1,'',0,0,60),(502,'单肩包','单肩包',55,'0_7_55_502',3,50,1,'',0,0,60),(503,'手提包','手提包',55,'0_7_55_503',3,50,1,'',0,0,60),(504,'斜挎包','斜挎包',55,'0_7_55_504',3,50,1,'',0,0,60),(505,'双肩包','双肩包',55,'0_7_55_505',3,50,1,'',0,0,60),(506,'钱包','钱包',55,'0_7_55_506',3,50,1,'',0,0,60),(507,'手拿包/晚宴包','手拿包/晚宴包',55,'0_7_55_507',3,50,1,'',0,0,60),(508,'卡包/零钱包','卡包/零钱包',55,'0_7_55_508',3,50,1,'',0,0,60),(509,'轮滑滑板','轮滑滑板',56,'0_8_56_509',3,50,1,'',0,0,60),(510,'网球','网球',56,'0_8_56_510',3,50,1,'',0,0,60),(511,'高尔夫','高尔夫',56,'0_8_56_511',3,50,1,'',0,0,60),(512,'台球','台球',56,'0_8_56_512',3,50,1,'',0,0,60),(513,'乒乓球','乒乓球',56,'0_8_56_513',3,50,1,'',0,0,60),(514,'排球','排球',56,'0_8_56_514',3,50,1,'',0,0,60),(515,'羽毛球','羽毛球',56,'0_8_56_515',3,50,1,'',0,0,60),(516,'棋牌麻将','棋牌麻将',56,'0_8_56_516',3,50,1,'',0,0,60),(517,'篮球','篮球',56,'0_8_56_517',3,50,1,'',0,0,60),(518,'其它','其它',56,'0_8_56_518',3,50,1,'',0,0,60),(519,'足球','足球',56,'0_8_56_519',3,50,1,'',0,0,60),(520,'速干衣裤','速干衣裤',57,'0_8_57_520',3,50,1,'',0,0,60),(521,'功能内衣','功能内衣',57,'0_8_57_521',3,50,1,'',0,0,60),(522,'溯溪鞋','溯溪鞋',57,'0_8_57_522',3,50,1,'',0,0,60),(523,'滑雪服','滑雪服',57,'0_8_57_523',3,50,1,'',0,0,60),(524,'军迷服饰','军迷服饰',57,'0_8_57_524',3,50,1,'',0,0,60),(525,'沙滩/凉拖','沙滩/凉拖',57,'0_8_57_525',3,50,1,'',0,0,60),(526,'羽绒服/棉服','羽绒服/棉服',57,'0_8_57_526',3,50,1,'',0,0,60),(527,'登山鞋','登山鞋',57,'0_8_57_527',3,50,1,'',0,0,60),(528,'户外袜','户外袜',57,'0_8_57_528',3,50,1,'',0,0,60),(529,'休闲衣裤','休闲衣裤',57,'0_8_57_529',3,50,1,'',0,0,60),(530,'徒步鞋','徒步鞋',57,'0_8_57_530',3,50,1,'',0,0,60),(531,'抓绒衣裤','抓绒衣裤',57,'0_8_57_531',3,50,1,'',0,0,60),(532,'越野跑鞋','越野跑鞋',57,'0_8_57_532',3,50,1,'',0,0,60),(533,'软壳衣裤','软壳衣裤',57,'0_8_57_533',3,50,1,'',0,0,60),(534,'休闲鞋','休闲鞋',57,'0_8_57_534',3,50,1,'',0,0,60),(535,'T恤','T恤',57,'0_8_57_535',3,50,1,'',0,0,60),(536,'雪地靴','雪地靴',57,'0_8_57_536',3,50,1,'',0,0,60),(537,'冲锋衣裤','冲锋衣裤',57,'0_8_57_537',3,50,1,'',0,0,60),(538,'户外风衣','户外风衣',57,'0_8_57_538',3,50,1,'',0,0,60),(539,'工装鞋','工装鞋',57,'0_8_57_539',3,50,1,'',0,0,60),(540,'野餐烧烤','野餐烧烤',58,'0_8_58_540',3,50,1,'',0,0,60),(541,'滑雪装备','滑雪装备',58,'0_8_58_541',3,50,1,'',0,0,60),(542,'便携桌椅床','便携桌椅床',58,'0_8_58_542',3,50,1,'',0,0,60),(543,'极限户外','极限户外',58,'0_8_58_543',3,50,1,'',0,0,60),(544,'户外工具','户外工具',58,'0_8_58_544',3,50,1,'',0,0,60),(545,'冲浪潜水','冲浪潜水',58,'0_8_58_545',3,50,1,'',0,0,60),(546,'背包','背包',58,'0_8_58_546',3,50,1,'',0,0,60),(547,'望远镜','望远镜',58,'0_8_58_547',3,50,1,'',0,0,60),(548,'户外配饰','户外配饰',58,'0_8_58_548',3,50,1,'',0,0,60),(549,'帐篷/垫子','帐篷/垫子',58,'0_8_58_549',3,50,1,'',0,0,60),(550,'户外仪表','户外仪表',58,'0_8_58_550',3,50,1,'',0,0,60),(551,'睡袋/吊床','睡袋/吊床',58,'0_8_58_551',3,50,1,'',0,0,60),(552,'旅游用品','旅游用品',58,'0_8_58_552',3,50,1,'',0,0,60),(553,'登山攀岩','登山攀岩',58,'0_8_58_553',3,50,1,'',0,0,60),(554,'军迷用品','军迷用品',58,'0_8_58_554',3,50,1,'',0,0,60),(555,'户外照明','户外照明',58,'0_8_58_555',3,50,1,'',0,0,60),(556,'救援装备','救援装备',58,'0_8_58_556',3,50,1,'',0,0,60),(557,'钓箱鱼包','钓箱鱼包',59,'0_8_59_557',3,50,1,'',0,0,60),(558,'其它','其它',59,'0_8_59_558',3,50,1,'',0,0,60),(559,'鱼竿鱼线','鱼竿鱼线',59,'0_8_59_559',3,50,1,'',0,0,60),(560,'浮漂鱼饵','浮漂鱼饵',59,'0_8_59_560',3,50,1,'',0,0,60),(561,'钓鱼桌椅','钓鱼桌椅',59,'0_8_59_561',3,50,1,'',0,0,60),(562,'钓鱼配件','钓鱼配件',59,'0_8_59_562',3,50,1,'',0,0,60),(563,'帆布鞋','帆布鞋',60,'0_8_60_563',3,50,1,'',0,0,60),(564,'乒羽网鞋','乒羽网鞋',60,'0_8_60_564',3,50,1,'',0,0,60),(565,'跑步鞋','跑步鞋',60,'0_8_60_565',3,50,1,'',0,0,60),(566,'训练鞋','训练鞋',60,'0_8_60_566',3,50,1,'',0,0,60),(567,'休闲鞋','休闲鞋',60,'0_8_60_567',3,50,1,'',0,0,60),(568,'专项运动鞋','专项运动鞋',60,'0_8_60_568',3,50,1,'',0,0,60),(569,'篮球鞋','篮球鞋',60,'0_8_60_569',3,50,1,'',0,0,60),(570,'拖鞋','拖鞋',60,'0_8_60_570',3,50,1,'',0,0,60),(571,'板鞋','板鞋',60,'0_8_60_571',3,50,1,'',0,0,60),(572,'运动包','运动包',60,'0_8_60_572',3,50,1,'',0,0,60),(573,'足球鞋','足球鞋',60,'0_8_60_573',3,50,1,'',0,0,60),(574,'其它','其它',61,'0_8_61_574',3,50,1,'',0,0,60),(575,'泳镜','泳镜',61,'0_8_61_575',3,50,1,'',0,0,60),(576,'泳帽','泳帽',61,'0_8_61_576',3,50,1,'',0,0,60),(577,'游泳包防水包','游泳包防水包',61,'0_8_61_577',3,50,1,'',0,0,60),(578,'男士泳衣','男士泳衣',61,'0_8_61_578',3,50,1,'',0,0,60),(579,'女士泳衣','女士泳衣',61,'0_8_61_579',3,50,1,'',0,0,60),(580,'比基尼','比基尼',61,'0_8_61_580',3,50,1,'',0,0,60),(581,'T恤','T恤',62,'0_8_62_581',3,50,1,'',0,0,60),(582,'棉服','棉服',62,'0_8_62_582',3,50,1,'',0,0,60),(583,'运动裤','运动裤',62,'0_8_62_583',3,50,1,'',0,0,60),(584,'夹克/风衣','夹克/风衣',62,'0_8_62_584',3,50,1,'',0,0,60),(585,'运动配饰','运动配饰',62,'0_8_62_585',3,50,1,'',0,0,60),(586,'运动背心','运动背心',62,'0_8_62_586',3,50,1,'',0,0,60),(587,'乒羽网服','乒羽网服',62,'0_8_62_587',3,50,1,'',0,0,60),(588,'运动套装','运动套装',62,'0_8_62_588',3,50,1,'',0,0,60),(589,'训练服','训练服',62,'0_8_62_589',3,50,1,'',0,0,60),(590,'羽绒服','羽绒服',62,'0_8_62_590',3,50,1,'',0,0,60),(591,'毛衫/线衫','毛衫/线衫',62,'0_8_62_591',3,50,1,'',0,0,60),(592,'卫衣/套头衫','卫衣/套头衫',62,'0_8_62_592',3,50,1,'',0,0,60),(593,'瑜伽舞蹈','瑜伽舞蹈',63,'0_8_63_593',3,50,1,'',0,0,60),(594,'跑步机','跑步机',63,'0_8_63_594',3,50,1,'',0,0,60),(595,'武术搏击','武术搏击',63,'0_8_63_595',3,50,1,'',0,0,60),(596,'健身车/动感单车','健身车/动感单车',63,'0_8_63_596',3,50,1,'',0,0,60),(597,'综合训练器','综合训练器',63,'0_8_63_597',3,50,1,'',0,0,60),(598,'哑铃','哑铃',63,'0_8_63_598',3,50,1,'',0,0,60),(599,'其他大型器械','其他大型器械',63,'0_8_63_599',3,50,1,'',0,0,60),(600,'仰卧板/收腹机','仰卧板/收腹机',63,'0_8_63_600',3,50,1,'',0,0,60),(601,'其他中小型器材','其他中小型器材',63,'0_8_63_601',3,50,1,'',0,0,60),(602,'甩脂机','甩脂机',63,'0_8_63_602',3,50,1,'',0,0,60),(603,'踏步机','踏步机',63,'0_8_63_603',3,50,1,'',0,0,60),(604,'运动护具','运动护具',63,'0_8_63_604',3,50,1,'',0,0,60),(605,'平衡车','平衡车',64,'0_8_64_605',3,50,1,'',0,0,60),(606,'其他整车','其他整车',64,'0_8_64_606',3,50,1,'',0,0,60),(607,'骑行装备','骑行装备',64,'0_8_64_607',3,50,1,'',0,0,60),(608,'骑行服','骑行服',64,'0_8_64_608',3,50,1,'',0,0,60),(609,'山地车/公路车','山地车/公路车',64,'0_8_64_609',3,50,1,'',0,0,60),(610,'折叠车','折叠车',64,'0_8_64_610',3,50,1,'',0,0,60),(611,'电动车','电动车',64,'0_8_64_611',3,50,1,'',0,0,60),(612,'电源','电源',65,'0_9_65_612',3,50,1,'',0,0,60),(613,'导航仪','导航仪',65,'0_9_65_613',3,50,1,'',0,0,60),(614,'智能驾驶','智能驾驶',65,'0_9_65_614',3,50,1,'',0,0,60),(615,'安全预警仪','安全预警仪',65,'0_9_65_615',3,50,1,'',0,0,60),(616,'车载电台','车载电台',65,'0_9_65_616',3,50,1,'',0,0,60),(617,'行车记录仪','行车记录仪',65,'0_9_65_617',3,50,1,'',0,0,60),(618,'吸尘器','吸尘器',65,'0_9_65_618',3,50,1,'',0,0,60),(619,'倒车雷达','倒车雷达',65,'0_9_65_619',3,50,1,'',0,0,60),(620,'冰箱','冰箱',65,'0_9_65_620',3,50,1,'',0,0,60),(621,'蓝牙设备','蓝牙设备',65,'0_9_65_621',3,50,1,'',0,0,60),(622,'时尚影音','时尚影音',65,'0_9_65_622',3,50,1,'',0,0,60),(623,'净化器','净化器',65,'0_9_65_623',3,50,1,'',0,0,60),(624,'清洁剂','清洁剂',66,'0_9_66_624',3,50,1,'',0,0,60),(625,'洗车工具','洗车工具',66,'0_9_66_625',3,50,1,'',0,0,60),(626,'洗车配件','洗车配件',66,'0_9_66_626',3,50,1,'',0,0,60),(627,'车蜡','车蜡',66,'0_9_66_627',3,50,1,'',0,0,60),(628,'补漆笔','补漆笔',66,'0_9_66_628',3,50,1,'',0,0,60),(629,'玻璃水','玻璃水',66,'0_9_66_629',3,50,1,'',0,0,60),(630,'香水','香水',67,'0_9_67_630',3,50,1,'',0,0,60),(631,'空气净化','空气净化',67,'0_9_67_631',3,50,1,'',0,0,60),(632,'车内饰品','车内饰品',67,'0_9_67_632',3,50,1,'',0,0,60),(633,'脚垫','脚垫',67,'0_9_67_633',3,50,1,'',0,0,60),(634,'功能小件','功能小件',67,'0_9_67_634',3,50,1,'',0,0,60),(635,'座垫','座垫',67,'0_9_67_635',3,50,1,'',0,0,60),(636,'车身装饰件','车身装饰件',67,'0_9_67_636',3,50,1,'',0,0,60),(637,'座套','座套',67,'0_9_67_637',3,50,1,'',0,0,60),(638,'车衣','车衣',67,'0_9_67_638',3,50,1,'',0,0,60),(639,'后备箱垫','后备箱垫',67,'0_9_67_639',3,50,1,'',0,0,60),(640,'头枕腰靠','头枕腰靠',67,'0_9_67_640',3,50,1,'',0,0,60),(641,'充气泵','充气泵',68,'0_9_68_641',3,50,1,'',0,0,60),(642,'防盗设备','防盗设备',68,'0_9_68_642',3,50,1,'',0,0,60),(643,'应急救援','应急救援',68,'0_9_68_643',3,50,1,'',0,0,60),(644,'保温箱','保温箱',68,'0_9_68_644',3,50,1,'',0,0,60),(645,'储物箱','储物箱',68,'0_9_68_645',3,50,1,'',0,0,60),(646,'自驾野营','自驾野营',68,'0_9_68_646',3,50,1,'',0,0,60),(647,'安全座椅','安全座椅',68,'0_9_68_647',3,50,1,'',0,0,60),(648,'摩托车装备','摩托车装备',68,'0_9_68_648',3,50,1,'',0,0,60),(649,'胎压监测','胎压监测',68,'0_9_68_649',3,50,1,'',0,0,60),(650,'功能升级服务','功能升级服务',69,'0_9_69_650',3,50,1,'',0,0,60),(651,'保养维修服务','保养维修服务',69,'0_9_69_651',3,50,1,'',0,0,60),(652,'清洗美容服务','清洗美容服务',69,'0_9_69_652',3,50,1,'',0,0,60),(653,'跑车','跑车',70,'0_9_70_653',3,50,1,'',0,0,60),(654,'微型车','微型车',70,'0_9_70_654',3,50,1,'',0,0,60),(655,'小型车','小型车',70,'0_9_70_655',3,50,1,'',0,0,60),(656,'紧凑型车','紧凑型车',70,'0_9_70_656',3,50,1,'',0,0,60),(657,'中型车','中型车',70,'0_9_70_657',3,50,1,'',0,0,60),(658,'中大型车','中大型车',70,'0_9_70_658',3,50,1,'',0,0,60),(659,'豪华车','豪华车',70,'0_9_70_659',3,50,1,'',0,0,60),(660,'MPV','MPV',70,'0_9_70_660',3,50,1,'',0,0,60),(661,'SUV','SUV',70,'0_9_70_661',3,50,1,'',0,0,60),(662,'上海大众','上海大众',71,'0_9_71_662',3,50,1,'',0,0,60),(663,'斯柯达','斯柯达',71,'0_9_71_663',3,50,1,'',0,0,60),(664,'东风雪铁龙','东风雪铁龙',71,'0_9_71_664',3,50,1,'',0,0,60),(665,'一汽奔腾','一汽奔腾',71,'0_9_71_665',3,50,1,'',0,0,60),(666,'北汽新能源','北汽新能源',71,'0_9_71_666',3,50,1,'',0,0,60),(667,'陆风','陆风',71,'0_9_71_667',3,50,1,'',0,0,60),(668,'海马','海马',71,'0_9_71_668',3,50,1,'',0,0,60),(669,'润滑油','润滑油',72,'0_9_72_669',3,50,1,'',0,0,60),(670,'轮胎','轮胎',72,'0_9_72_670',3,50,1,'',0,0,60),(671,'改装配件','改装配件',72,'0_9_72_671',3,50,1,'',0,0,60),(672,'添加剂','添加剂',72,'0_9_72_672',3,50,1,'',0,0,60),(673,'轮毂','轮毂',72,'0_9_72_673',3,50,1,'',0,0,60),(674,'防冻液','防冻液',72,'0_9_72_674',3,50,1,'',0,0,60),(675,'刹车片/盘','刹车片/盘',72,'0_9_72_675',3,50,1,'',0,0,60),(676,'滤清器','滤清器',72,'0_9_72_676',3,50,1,'',0,0,60),(677,'维修配件','维修配件',72,'0_9_72_677',3,50,1,'',0,0,60),(678,'火花塞','火花塞',72,'0_9_72_678',3,50,1,'',0,0,60),(679,'蓄电池','蓄电池',72,'0_9_72_679',3,50,1,'',0,0,60),(680,'雨刷','雨刷',72,'0_9_72_680',3,50,1,'',0,0,60),(681,'底盘装甲/护板','底盘装甲/护板',72,'0_9_72_681',3,50,1,'',0,0,60),(682,'车灯','车灯',72,'0_9_72_682',3,50,1,'',0,0,60),(683,'贴膜','贴膜',72,'0_9_72_683',3,50,1,'',0,0,60),(684,'后视镜','后视镜',72,'0_9_72_684',3,50,1,'',0,0,60),(685,'汽修工具','汽修工具',72,'0_9_72_685',3,50,1,'',0,0,60),(686,'宝宝护肤','宝宝护肤',73,'0_10_73_686',3,50,1,'',0,0,60),(687,'宝宝洗浴','宝宝洗浴',73,'0_10_73_687',3,50,1,'',0,0,60),(688,'理发器','理发器',73,'0_10_73_688',3,50,1,'',0,0,60),(689,'洗衣液/皂','洗衣液/皂',73,'0_10_73_689',3,50,1,'',0,0,60),(690,'奶瓶清洗','奶瓶清洗',73,'0_10_73_690',3,50,1,'',0,0,60),(691,'日常护理','日常护理',73,'0_10_73_691',3,50,1,'',0,0,60),(692,'座便器','座便器',73,'0_10_73_692',3,50,1,'',0,0,60),(693,'驱蚊防蚊','驱蚊防蚊',73,'0_10_73_693',3,50,1,'',0,0,60),(694,'奶瓶奶嘴','奶瓶奶嘴',74,'0_10_74_694',3,50,1,'',0,0,60),(695,'吸奶器','吸奶器',74,'0_10_74_695',3,50,1,'',0,0,60),(696,'牙胶安抚','牙胶安抚',74,'0_10_74_696',3,50,1,'',0,0,60),(697,'暖奶消毒','暖奶消毒',74,'0_10_74_697',3,50,1,'',0,0,60),(698,'辅食料理机','辅食料理机',74,'0_10_74_698',3,50,1,'',0,0,60),(699,'碗盘叉勺','碗盘叉勺',74,'0_10_74_699',3,50,1,'',0,0,60),(700,'水壶/水杯','水壶/水杯',74,'0_10_74_700',3,50,1,'',0,0,60),(701,'婴儿推车','婴儿推车',75,'0_10_75_701',3,50,1,'',0,0,60),(702,'餐椅摇椅','餐椅摇椅',75,'0_10_75_702',3,50,1,'',0,0,60),(703,'学步车','学步车',75,'0_10_75_703',3,50,1,'',0,0,60),(704,'三轮车','三轮车',75,'0_10_75_704',3,50,1,'',0,0,60),(705,'自行车','自行车',75,'0_10_75_705',3,50,1,'',0,0,60),(706,'扭扭车','扭扭车',75,'0_10_75_706',3,50,1,'',0,0,60),(707,'滑板车','滑板车',75,'0_10_75_707',3,50,1,'',0,0,60),(708,'婴儿床','婴儿床',75,'0_10_75_708',3,50,1,'',0,0,60),(709,'电动车','电动车',75,'0_10_75_709',3,50,1,'',0,0,60),(710,'提篮式','提篮式',76,'0_10_76_710',3,50,1,'',0,0,60),(711,'安全座椅','安全座椅',76,'0_10_76_711',3,50,1,'',0,0,60),(712,'增高垫','增高垫',76,'0_10_76_712',3,50,1,'',0,0,60),(713,'安全防护','安全防护',77,'0_10_77_713',3,50,1,'',0,0,60),(714,'婴儿外出服','婴儿外出服',77,'0_10_77_714',3,50,1,'',0,0,60),(715,'婴儿内衣','婴儿内衣',77,'0_10_77_715',3,50,1,'',0,0,60),(716,'婴儿礼盒','婴儿礼盒',77,'0_10_77_716',3,50,1,'',0,0,60),(717,'婴儿鞋帽袜','婴儿鞋帽袜',77,'0_10_77_717',3,50,1,'',0,0,60),(718,'家居床品','家居床品',77,'0_10_77_718',3,50,1,'',0,0,60),(719,'婴幼奶粉','婴幼奶粉',78,'0_10_78_719',3,50,1,'',0,0,60),(720,'成人奶粉','成人奶粉',78,'0_10_78_720',3,50,1,'',0,0,60),(721,'待产/新生','待产/新生',79,'0_10_79_721',3,50,1,'',0,0,60),(722,'孕妇装','孕妇装',79,'0_10_79_722',3,50,1,'',0,0,60),(723,'孕期营养','孕期营养',79,'0_10_79_723',3,50,1,'',0,0,60),(724,'防辐射服','防辐射服',79,'0_10_79_724',3,50,1,'',0,0,60),(725,'妈咪包/背婴带','妈咪包/背婴带',79,'0_10_79_725',3,50,1,'',0,0,60),(726,'产后塑身','产后塑身',79,'0_10_79_726',3,50,1,'',0,0,60),(727,'孕妈美容','孕妈美容',79,'0_10_79_727',3,50,1,'',0,0,60),(728,'文胸/内裤','文胸/内裤',79,'0_10_79_728',3,50,1,'',0,0,60),(729,'月子装','月子装',79,'0_10_79_729',3,50,1,'',0,0,60),(730,'米粉/菜粉','米粉/菜粉',80,'0_10_80_730',3,50,1,'',0,0,60),(731,'果泥/果汁','果泥/果汁',80,'0_10_80_731',3,50,1,'',0,0,60),(732,'面条/粥','面条/粥',80,'0_10_80_732',3,50,1,'',0,0,60),(733,'宝宝零食','宝宝零食',80,'0_10_80_733',3,50,1,'',0,0,60),(734,'DHA','DHA',80,'0_10_80_734',3,50,1,'',0,0,60),(735,'钙铁锌/维生素','钙铁锌/维生素',80,'0_10_80_735',3,50,1,'',0,0,60),(736,'益生菌/初乳','益生菌/初乳',80,'0_10_80_736',3,50,1,'',0,0,60),(737,'清火/开胃','清火/开胃',80,'0_10_80_737',3,50,1,'',0,0,60),(738,'配饰','配饰',81,'0_10_81_738',3,50,1,'',0,0,60),(739,'亲子装','亲子装',81,'0_10_81_739',3,50,1,'',0,0,60),(740,'羽绒服/棉服','羽绒服/棉服',81,'0_10_81_740',3,50,1,'',0,0,60),(741,'套装','套装',81,'0_10_81_741',3,50,1,'',0,0,60),(742,'运动服','运动服',81,'0_10_81_742',3,50,1,'',0,0,60),(743,'上衣','上衣',81,'0_10_81_743',3,50,1,'',0,0,60),(744,'靴子','靴子',81,'0_10_81_744',3,50,1,'',0,0,60),(745,'运动鞋','运动鞋',81,'0_10_81_745',3,50,1,'',0,0,60),(746,'演出服','演出服',81,'0_10_81_746',3,50,1,'',0,0,60),(747,'裙子','裙子',81,'0_10_81_747',3,50,1,'',0,0,60),(748,'裤子','裤子',81,'0_10_81_748',3,50,1,'',0,0,60),(749,'功能鞋','功能鞋',81,'0_10_81_749',3,50,1,'',0,0,60),(750,'内衣','内衣',81,'0_10_81_750',3,50,1,'',0,0,60),(751,'凉鞋','凉鞋',81,'0_10_81_751',3,50,1,'',0,0,60),(752,'皮鞋/帆布鞋','皮鞋/帆布鞋',81,'0_10_81_752',3,50,1,'',0,0,60),(753,'婴儿尿裤','婴儿尿裤',82,'0_10_82_753',3,50,1,'',0,0,60),(754,'拉拉裤','拉拉裤',82,'0_10_82_754',3,50,1,'',0,0,60),(755,'成人尿裤','成人尿裤',82,'0_10_82_755',3,50,1,'',0,0,60),(756,'湿巾','湿巾',82,'0_10_82_756',3,50,1,'',0,0,60),(757,'健身玩具','健身玩具',83,'0_10_83_757',3,50,1,'',0,0,60),(758,'适用年龄','适用年龄',83,'0_10_83_758',3,50,1,'',0,0,60),(759,'娃娃玩具','娃娃玩具',83,'0_10_83_759',3,50,1,'',0,0,60),(760,'遥控/电动','遥控/电动',83,'0_10_83_760',3,50,1,'',0,0,60),(761,'DIY玩具','DIY玩具',83,'0_10_83_761',3,50,1,'',0,0,60),(762,'益智玩具','益智玩具',83,'0_10_83_762',3,50,1,'',0,0,60),(763,'创意减压','创意减压',83,'0_10_83_763',3,50,1,'',0,0,60),(764,'积木拼插','积木拼插',83,'0_10_83_764',3,50,1,'',0,0,60),(765,'乐器相关','乐器相关',83,'0_10_83_765',3,50,1,'',0,0,60),(766,'动漫玩具','动漫玩具',83,'0_10_83_766',3,50,1,'',0,0,60),(767,'毛绒布艺','毛绒布艺',83,'0_10_83_767',3,50,1,'',0,0,60),(768,'模型玩具','模型玩具',83,'0_10_83_768',3,50,1,'',0,0,60),(769,'游戏','游戏',84,'0_11_84_769',3,50,1,'',0,0,60),(770,'影视/动漫周边','影视/动漫周边',84,'0_11_84_770',3,50,1,'',0,0,60),(771,'音乐','音乐',84,'0_11_84_771',3,50,1,'',0,0,60),(772,'影视','影视',84,'0_11_84_772',3,50,1,'',0,0,60),(773,'教育音像','教育音像',84,'0_11_84_773',3,50,1,'',0,0,60),(774,'港台图书','港台图书',85,'0_11_85_774',3,50,1,'',0,0,60),(775,'杂志/期刊','杂志/期刊',85,'0_11_85_775',3,50,1,'',0,0,60),(776,'英文原版书','英文原版书',85,'0_11_85_776',3,50,1,'',0,0,60),(777,'科普','科普',86,'0_11_86_777',3,50,1,'',0,0,60),(778,'幼儿启蒙','幼儿启蒙',86,'0_11_86_778',3,50,1,'',0,0,60),(779,'0-2岁','0-2岁',86,'0_11_86_779',3,50,1,'',0,0,60),(780,'手工游戏','手工游戏',86,'0_11_86_780',3,50,1,'',0,0,60),(781,'3-6岁','3-6岁',86,'0_11_86_781',3,50,1,'',0,0,60),(782,'智力开发','智力开发',86,'0_11_86_782',3,50,1,'',0,0,60),(783,'7-10岁','7-10岁',86,'0_11_86_783',3,50,1,'',0,0,60),(784,'11-14岁','11-14岁',86,'0_11_86_784',3,50,1,'',0,0,60),(785,'儿童文学','儿童文学',86,'0_11_86_785',3,50,1,'',0,0,60),(786,'绘本','绘本',86,'0_11_86_786',3,50,1,'',0,0,60),(787,'外文原版','外文原版',87,'0_11_87_787',3,50,1,'',0,0,60),(788,'畅读VIP','畅读VIP',87,'0_11_87_788',3,50,1,'',0,0,60),(789,'免费','免费',87,'0_11_87_789',3,50,1,'',0,0,60),(790,'小说','小说',87,'0_11_87_790',3,50,1,'',0,0,60),(791,'励志与成功','励志与成功',87,'0_11_87_791',3,50,1,'',0,0,60),(792,'经济金融','经济金融',87,'0_11_87_792',3,50,1,'',0,0,60),(793,'文学','文学',87,'0_11_87_793',3,50,1,'',0,0,60),(794,'社科','社科',87,'0_11_87_794',3,50,1,'',0,0,60),(795,'婚恋两性','婚恋两性',87,'0_11_87_795',3,50,1,'',0,0,60),(796,'字典词典','字典词典',88,'0_11_88_796',3,50,1,'',0,0,60),(797,'教材','教材',88,'0_11_88_797',3,50,1,'',0,0,60),(798,'中小学教辅','中小学教辅',88,'0_11_88_798',3,50,1,'',0,0,60),(799,'考试','考试',88,'0_11_88_799',3,50,1,'',0,0,60),(800,'外语学习','外语学习',88,'0_11_88_800',3,50,1,'',0,0,60),(801,'通俗流行','通俗流行',89,'0_11_89_801',3,50,1,'',0,0,60),(802,'古典音乐','古典音乐',89,'0_11_89_802',3,50,1,'',0,0,60),(803,'摇滚说唱','摇滚说唱',89,'0_11_89_803',3,50,1,'',0,0,60),(804,'爵士蓝调','爵士蓝调',89,'0_11_89_804',3,50,1,'',0,0,60),(805,'乡村民谣','乡村民谣',89,'0_11_89_805',3,50,1,'',0,0,60),(806,'有声读物','有声读物',89,'0_11_89_806',3,50,1,'',0,0,60),(807,'小说','小说',90,'0_11_90_807',3,50,1,'',0,0,60),(808,'文学','文学',90,'0_11_90_808',3,50,1,'',0,0,60),(809,'青春文学','青春文学',90,'0_11_90_809',3,50,1,'',0,0,60),(810,'传记','传记',90,'0_11_90_810',3,50,1,'',0,0,60),(811,'动漫','动漫',90,'0_11_90_811',3,50,1,'',0,0,60),(812,'艺术','艺术',90,'0_11_90_812',3,50,1,'',0,0,60),(813,'摄影','摄影',90,'0_11_90_813',3,50,1,'',0,0,60),(814,'管理','管理',91,'0_11_91_814',3,50,1,'',0,0,60),(815,'金融与投资','金融与投资',91,'0_11_91_815',3,50,1,'',0,0,60),(816,'经济','经济',91,'0_11_91_816',3,50,1,'',0,0,60),(817,'励志与成功','励志与成功',91,'0_11_91_817',3,50,1,'',0,0,60),(818,'哲学/宗教','哲学/宗教',92,'0_11_92_818',3,50,1,'',0,0,60),(819,'社会科学','社会科学',92,'0_11_92_819',3,50,1,'',0,0,60),(820,'法律','法律',92,'0_11_92_820',3,50,1,'',0,0,60),(821,'文化','文化',92,'0_11_92_821',3,50,1,'',0,0,60),(822,'历史','历史',92,'0_11_92_822',3,50,1,'',0,0,60),(823,'心理学','心理学',92,'0_11_92_823',3,50,1,'',0,0,60),(824,'政治/军事','政治/军事',92,'0_11_92_824',3,50,1,'',0,0,60),(825,'国学/古籍','国学/古籍',92,'0_11_92_825',3,50,1,'',0,0,60),(826,'美食','美食',93,'0_11_93_826',3,50,1,'',0,0,60),(827,'时尚美妆','时尚美妆',93,'0_11_93_827',3,50,1,'',0,0,60),(828,'家居','家居',93,'0_11_93_828',3,50,1,'',0,0,60),(829,'手工DIY','手工DIY',93,'0_11_93_829',3,50,1,'',0,0,60),(830,'家教与育儿','家教与育儿',93,'0_11_93_830',3,50,1,'',0,0,60),(831,'两性','两性',93,'0_11_93_831',3,50,1,'',0,0,60),(832,'孕产','孕产',93,'0_11_93_832',3,50,1,'',0,0,60),(833,'体育','体育',93,'0_11_93_833',3,50,1,'',0,0,60),(834,'健身保健','健身保健',93,'0_11_93_834',3,50,1,'',0,0,60),(835,'旅游/地图','旅游/地图',93,'0_11_93_835',3,50,1,'',0,0,60),(836,'建筑','建筑',94,'0_11_94_836',3,50,1,'',0,0,60),(837,'工业技术','工业技术',94,'0_11_94_837',3,50,1,'',0,0,60),(838,'电子/通信','电子/通信',94,'0_11_94_838',3,50,1,'',0,0,60),(839,'医学','医学',94,'0_11_94_839',3,50,1,'',0,0,60),(840,'科学与自然','科学与自然',94,'0_11_94_840',3,50,1,'',0,0,60),(841,'农林','农林',94,'0_11_94_841',3,50,1,'',0,0,60),(842,'计算机与互联网','计算机与互联网',94,'0_11_94_842',3,50,1,'',0,0,60),(843,'科普','科普',94,'0_11_94_843',3,50,1,'',0,0,60);

/*Table structure for table `tu_tp_goods_type` */

DROP TABLE IF EXISTS `tu_tp_goods_type`;

CREATE TABLE `tu_tp_goods_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tp_goods_type` */

insert  into `tu_tp_goods_type`(`id`,`name`) values (33,'服装'),(53,'鞋子2'),(4,'手机'),(31,'电池、电源、充电器'),(8,'化妆品'),(9,'精品手机'),(30,'洗衣机'),(29,'冰箱'),(16,'路由器'),(15,'平板电脑'),(13,'衣服'),(17,'网络盒子'),(18,'电视'),(19,'家纺'),(20,'吸顶灯'),(21,'床'),(22,'雨伞'),(23,'餐具'),(24,'毛呢大衣'),(25,'针织衫'),(26,'文胸'),(27,'香水'),(28,'珠宝'),(54,'测试'),(55,'背包'),(56,'裤头'),(57,'毛巾'),(58,'朋友圈转发2');

/*Table structure for table `tu_tp_spec` */

DROP TABLE IF EXISTS `tu_tp_spec`;

CREATE TABLE `tu_tp_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格表',
  `type_id` int(11) DEFAULT '0' COMMENT '规格类型',
  `shop_id` int(11) DEFAULT '0' COMMENT '企业ID',
  `name` varchar(55) DEFAULT NULL COMMENT '规格名称',
  `order` int(11) DEFAULT '50' COMMENT '排序',
  `search_index` tinyint(1) DEFAULT '0' COMMENT '是否需要检索',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tp_spec` */

/*Table structure for table `tu_tp_spec_goods_price` */

DROP TABLE IF EXISTS `tu_tp_spec_goods_price`;

CREATE TABLE `tu_tp_spec_goods_price` (
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名中文',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `store_count` int(11) unsigned DEFAULT '10' COMMENT '库存数量',
  `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品条形码'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tp_spec_goods_price` */

/*Table structure for table `tu_tp_spec_image` */

DROP TABLE IF EXISTS `tu_tp_spec_image`;

CREATE TABLE `tu_tp_spec_image` (
  `goods_id` int(11) DEFAULT '0' COMMENT '商品规格图片表id',
  `spec_image_id` int(11) DEFAULT '0' COMMENT '规格项id',
  `src` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品规格图片路径'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tp_spec_image` */

/*Table structure for table `tu_tp_spec_item` */

DROP TABLE IF EXISTS `tu_tp_spec_item`;

CREATE TABLE `tu_tp_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格项id',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格id',
  `item` varchar(54) DEFAULT NULL COMMENT '规格项',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tp_spec_item` */

/*Table structure for table `tu_tuan` */

DROP TABLE IF EXISTS `tu_tuan`;

CREATE TABLE `tu_tuan` (
  `tuan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT '0',
  `cate_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `thumb` text COMMENT '缩略图',
  `price` int(11) DEFAULT NULL,
  `tuan_price` int(11) DEFAULT NULL,
  `mobile_fan` int(11) DEFAULT NULL,
  `settlement_price` int(11) DEFAULT '0' COMMENT '结算金额',
  `use_integral` int(11) DEFAULT '0' COMMENT '代表允许使用的积分数，100积分是1RMB',
  `num` int(11) DEFAULT '0',
  `sold_num` int(11) DEFAULT '0',
  `tao_num` tinyint(2) DEFAULT '0' COMMENT '套餐人数',
  `wei_pic` varchar(256) DEFAULT NULL COMMENT '抢购二维码',
  `bg_date` date DEFAULT '0000-00-00',
  `end_date` date DEFAULT NULL,
  `fail_date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(2) DEFAULT '0',
  `is_new` tinyint(2) DEFAULT '0',
  `is_chose` tinyint(2) DEFAULT '0',
  `is_multi` tinyint(1) DEFAULT '0' COMMENT '多店可用',
  `freebook` tinyint(2) DEFAULT '0',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `is_return_cash` tinyint(2) DEFAULT '0',
  `xiangou` int(11) DEFAULT NULL,
  `xiadan` int(1) DEFAULT NULL,
  `is_seckill` tinyint(1) DEFAULT '0',
  `kill_bg` date DEFAULT NULL,
  `kill_end` date DEFAULT NULL,
  `kill_num` int(11) DEFAULT '0',
  `kill_price` int(11) DEFAULT '0',
  `top_date` date DEFAULT '0000-00-00',
  PRIMARY KEY (`tuan_id`) USING BTREE,
  KEY `cate_id` (`cate_id`,`area_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan` */

/*Table structure for table `tu_tuan_cate` */

DROP TABLE IF EXISTS `tu_tuan_cate`;

CREATE TABLE `tu_tuan_cate` (
  `cate_id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL COMMENT '图片',
  `is_hot` tinyint(2) DEFAULT NULL,
  `rate` int(11) DEFAULT '60' COMMENT '结算费率',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan_cate` */

insert  into `tu_tuan_cate`(`cate_id`,`cate_name`,`parent_id`,`orderby`,`photo`,`is_hot`,`rate`) values (1,'茅台111',0,1,'/attachs/2017/10/17/59e563e6d6ce2.png',0,20),(2,'电影/在线选座',0,99,NULL,0,60),(3,'十年茅台',1,12,NULL,1,60),(4,'飞天茅台1111',1,11,'/attachs/2017/10/17/59e563ff0b87b.png',1,50),(5,'二十年茅台',1,13,NULL,0,61),(6,'下午茶',1,14,NULL,0,120),(7,'日韩料理',1,15,NULL,0,60),(8,'江浙菜',1,16,NULL,0,60),(9,'西餐',1,17,NULL,0,60),(10,'蛋糕',1,18,NULL,0,60),(11,'甜品饮料',1,70,NULL,1,60),(12,'烤鱼',1,20,NULL,1,60),(13,'烧烤/烤肉',1,21,NULL,0,60),(14,'海鲜',1,22,NULL,0,60),(16,'小吃快餐',1,24,NULL,0,60),(17,'汤/粥/炖菜',1,25,NULL,0,60),(18,'聚餐宴请',1,26,NULL,1,60),(19,' 8-10人套餐',1,27,NULL,0,60),(20,'川湘菜',1,28,NULL,0,60),(21,'粤菜/茶餐厅',1,29,NULL,0,60),(22,'西北/新疆菜',1,30,NULL,1,60),(23,'东北菜',1,31,NULL,0,60),(24,'云贵菜',1,32,NULL,0,60),(26,'台湾菜',1,34,NULL,0,60),(27,'特色菜',1,35,NULL,0,60),(28,'咖啡茶馆',1,36,NULL,0,60),(29,'东南亚菜',1,37,NULL,1,60),(30,'京菜/鲁菜',1,38,NULL,1,60),(31,'蟹宴',1,39,NULL,1,60),(34,'五粮液',0,2,NULL,0,60),(35,'泸州老窖',0,3,NULL,0,60),(36,'丽人',0,7,NULL,1,60),(37,'古井贡酒',0,5,NULL,1,60),(38,'旅游',0,50,NULL,1,60),(39,'生活服务',0,6,NULL,0,60),(40,'亲子',0,8,NULL,0,60),(41,'结婚',0,10,NULL,0,60),(42,'热映电影',2,100,NULL,0,60),(43,'电影团购',2,100,NULL,0,60),(44,'找电影院',2,100,NULL,0,60),(45,'十年五粮液',34,1,NULL,0,60),(46,'温泉',34,12,NULL,0,60),(47,'滑雪',34,13,NULL,0,60),(48,'公园/游乐园',34,14,NULL,0,60),(49,'景点/郊游',34,15,NULL,1,60),(50,'密室逃脱',34,16,NULL,1,60),(51,'桌游/电玩/网吧',34,17,NULL,1,60),(52,'酒吧',34,18,NULL,0,60),(53,'足疗按摩',34,19,NULL,0,60),(54,'洗浴/汗蒸',34,20,NULL,0,60),(55,'电影',34,21,NULL,0,60),(56,'私人影院',34,22,NULL,0,60),(57,'4D/5D电影',34,23,NULL,0,60),(58,'演出/赛事/展览',34,24,NULL,0,60),(59,'DIY手工',34,25,NULL,0,60),(60,'真人CS/卡丁车',34,26,NULL,0,60),(61,'农家乐/采摘',34,27,NULL,1,60),(62,'运动健身',34,28,NULL,1,60),(63,'游泳',34,29,NULL,1,60),(64,'轰趴馆',34,30,NULL,1,60),(65,'水上乐园',34,31,NULL,0,60),(66,'亲子游玩',34,32,NULL,0,60),(67,'更多',34,33,NULL,0,60),(68,'经济/客栈',35,20,NULL,0,60),(69,'三星/舒适',35,21,NULL,0,60),(70,'四星/精品',35,22,NULL,0,60),(71,'五星/豪华',35,23,NULL,0,60),(72,'美发',36,20,NULL,0,60),(73,'美甲',36,21,NULL,1,60),(74,'美容/SPA',36,22,NULL,1,60),(75,'个性写真',36,23,NULL,1,60),(76,'瘦身纤体',36,24,NULL,0,60),(77,'瑜珈/舞蹈',36,25,NULL,0,60),(78,'其他',36,26,NULL,0,60),(79,'服饰鞋包',37,20,NULL,0,60),(80,'生活家居',37,21,NULL,0,60),(81,'食品饮料',37,22,NULL,0,60),(82,'母婴用品',37,23,NULL,0,60),(83,'数码家电',37,24,NULL,0,60),(84,'个护化妆',37,25,NULL,0,60),(85,'钟表眼镜',37,26,NULL,0,60),(86,'水果生鲜',37,27,NULL,0,60),(87,'影音书刊',37,28,NULL,0,60),(88,'珠宝饰品',37,29,NULL,0,60),(89,'其他',37,30,NULL,0,60),(90,'景点门票',38,20,NULL,0,60),(91,'当地/周边游',38,21,NULL,0,60),(92,'国内游',38,22,NULL,0,60),(93,'出境游',38,23,NULL,0,60),(94,'汽车服务',39,20,NULL,0,60),(95,'体检保健',39,21,NULL,0,60),(96,'培训课程',39,22,NULL,0,60),(97,'鲜花婚庆',39,23,NULL,0,60),(98,'照片冲印',39,24,NULL,0,60),(99,'家具建材',39,25,NULL,0,60),(100,'装修设计',39,26,NULL,0,60),(101,'婚纱摄影',39,27,NULL,0,60),(102,'个性写真',39,28,NULL,0,60),(103,'儿童摄影',39,29,NULL,0,60),(104,'母婴亲子',39,30,NULL,0,60),(105,'服装洗护',39,31,NULL,0,60),(106,'宠物服务',39,32,NULL,0,60),(107,'家政服务',39,33,NULL,0,60),(108,'配眼镜',39,34,NULL,0,60),(109,'商场购物券',39,35,NULL,0,60),(110,'孕产护理',40,20,NULL,0,60),(111,'亲子购物',40,21,NULL,0,60),(112,'亲子游乐',40,22,NULL,0,60),(113,'幼儿教育',40,23,NULL,0,60),(114,'亲子摄影',40,24,NULL,0,60),(115,'其他亲子',40,25,NULL,0,60),(116,'婚纱摄影',41,20,NULL,0,60),(117,'旅游婚纱照',41,21,NULL,0,60),(118,'婚纱礼服',41,22,NULL,0,60),(119,'成衣定制',41,23,NULL,0,60),(120,'婚庆公司',41,24,NULL,0,60),(121,'婚戒首饰',41,25,NULL,0,60),(122,'婚礼小商品',41,26,NULL,0,60),(123,'彩妆造型',41,27,NULL,0,60),(124,'司仪主持',41,28,NULL,0,60),(125,'婚礼跟拍',41,29,NULL,0,60),(126,'其他结婚',41,30,NULL,0,60);

/*Table structure for table `tu_tuan_code` */

DROP TABLE IF EXISTS `tu_tuan_code`;

CREATE TABLE `tu_tuan_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(8) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `worker_id` int(10) DEFAULT NULL,
  `shop_id` int(11) DEFAULT '0',
  `branch_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  `settlement_price` int(11) DEFAULT NULL,
  `real_money` int(11) DEFAULT '0' COMMENT '真实花费的MONEY',
  `real_integral` int(11) DEFAULT '0' COMMENT '真实积分',
  `fail_date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `used_time` int(11) DEFAULT NULL,
  `used_ip` varchar(15) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT '0' COMMENT '1代表已经使用',
  `is_sms` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '0代表正常，1代表申请退款中，2代表已经退款',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan_code` */

/*Table structure for table `tu_tuan_details` */

DROP TABLE IF EXISTS `tu_tuan_details`;

CREATE TABLE `tu_tuan_details` (
  `tuan_id` int(10) NOT NULL,
  `details` text,
  `instructions` text,
  PRIMARY KEY (`tuan_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan_details` */

/*Table structure for table `tu_tuan_dianping` */

DROP TABLE IF EXISTS `tu_tuan_dianping`;

CREATE TABLE `tu_tuan_dianping` (
  `dianping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `dianping_id` (`dianping_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan_dianping` */

/*Table structure for table `tu_tuan_dianping_pics` */

DROP TABLE IF EXISTS `tu_tuan_dianping_pics`;

CREATE TABLE `tu_tuan_dianping_pics` (
  `pic_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan_dianping_pics` */

/*Table structure for table `tu_tuan_favorites` */

DROP TABLE IF EXISTS `tu_tuan_favorites`;

CREATE TABLE `tu_tuan_favorites` (
  `favorites_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`favorites_id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`tuan_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan_favorites` */

/*Table structure for table `tu_tuan_meal` */

DROP TABLE IF EXISTS `tu_tuan_meal`;

CREATE TABLE `tu_tuan_meal` (
  `tuan_id` int(11) unsigned DEFAULT '0' COMMENT '主套餐',
  `id` int(11) unsigned DEFAULT '0' COMMENT '分套餐id',
  `name` varchar(64) DEFAULT NULL COMMENT '套餐名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan_meal` */

/*Table structure for table `tu_tuan_order` */

DROP TABLE IF EXISTS `tu_tuan_order`;

CREATE TABLE `tu_tuan_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT NULL,
  `mobile_fan` int(11) DEFAULT NULL,
  `use_integral` int(11) DEFAULT '0',
  `need_pay` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `update_time` int(11) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '1代表已经付款购买  -1表示到店付，3代表申请退款，4代表已退款,8是已完成',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `is_mobile` tinyint(1) DEFAULT '0' COMMENT '为了统计用',
  `is_dianping` tinyint(1) DEFAULT '0',
  `is_separate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_profit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan_order` */

/*Table structure for table `tu_tuan_view` */

DROP TABLE IF EXISTS `tu_tuan_view`;

CREATE TABLE `tu_tuan_view` (
  `view_id` int(10) NOT NULL AUTO_INCREMENT,
  `tuan_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`view_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuan_view` */

/*Table structure for table `tu_tuisongduanxin` */

DROP TABLE IF EXISTS `tu_tuisongduanxin`;

CREATE TABLE `tu_tuisongduanxin` (
  `tuisong_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `rank_id` int(10) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `is_tuisong` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`tuisong_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_tuisongduanxin` */

/*Table structure for table `tu_uploadset` */

DROP TABLE IF EXISTS `tu_uploadset`;

CREATE TABLE `tu_uploadset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `para` text NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='上传插件';

/*Data for the table `tu_uploadset` */

insert  into `tu_uploadset`(`id`,`type`,`para`,`status`) values (1,'Local','{\"secrectKey\":\"\",\"accessKey\":\"\",\"domain\":\"\",\"bucket\":\"\",\"timeout\":\"\"}',0),(2,'Qiniu','{\"accessKey\":\"qVyLW4y_4HDZHY9-8MolcMCGtesFTuBu11JHpEdk\",\"secrectKey\":\"Rx5nJoQmk-nitpIJPpLaMYG323kfAK8MKYqwoVIT\",\"domain\":\"images4.5maiche.cn\",\"bucket\":\"mantuo\",\"timeout\":\"3000\"}',0);

/*Table structure for table `tu_user_addr` */

DROP TABLE IF EXISTS `tu_user_addr`;

CREATE TABLE `tu_user_addr` (
  `addr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `area_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `addr` varchar(1024) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`addr_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_addr` */

/*Table structure for table `tu_user_agent_applys` */

DROP TABLE IF EXISTS `tu_user_agent_applys`;

CREATE TABLE `tu_user_agent_applys` (
  `apply_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(32) NOT NULL COMMENT '申请姓名',
  `mobile` varchar(32) DEFAULT NULL COMMENT '申请手机号',
  `intro` varchar(64) DEFAULT NULL COMMENT '申请说明',
  `agent_id` int(11) DEFAULT NULL COMMENT '申请代理商ID',
  `price` int(11) DEFAULT '0' COMMENT '购买价格',
  `type` tinyint(1) DEFAULT NULL COMMENT '1代表余额支付，2代表线下银行卡转账',
  `photo_positive` varchar(128) DEFAULT NULL COMMENT '身份证正面',
  `photo_back` varchar(128) DEFAULT NULL COMMENT '身份证背面',
  `audit` tinyint(1) DEFAULT '0' COMMENT '0未审核，1已审核，2已拒绝',
  `closed` tinyint(1) DEFAULT '0' COMMENT '1代表关闭',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_agent_applys` */

/*Table structure for table `tu_user_backers_discount_log` */

DROP TABLE IF EXISTS `tu_user_backers_discount_log`;

CREATE TABLE `tu_user_backers_discount_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `shop_id` int(11) NOT NULL COMMENT '企业ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_name` varchar(128) DEFAULT NULL COMMENT '商品名称缓存字段',
  `guide_id` int(11) NOT NULL COMMENT '推荐人的ID',
  `money` int(11) DEFAULT '0' COMMENT '分成金额',
  `intro` varchar(64) DEFAULT NULL COMMENT '分成理由',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_backers_discount_log` */

/*Table structure for table `tu_user_backers_reward_log` */

DROP TABLE IF EXISTS `tu_user_backers_reward_log`;

CREATE TABLE `tu_user_backers_reward_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `fuid` int(11) DEFAULT NULL COMMENT '分成到的账户',
  `shop_id` int(11) NOT NULL COMMENT '企业ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_name` varchar(128) DEFAULT NULL COMMENT '商品名称缓存字段',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `money` int(11) DEFAULT '0' COMMENT '分成金额',
  `intro` varchar(64) DEFAULT NULL COMMENT '分成理由',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_backers_reward_log` */

/*Table structure for table `tu_user_card` */

DROP TABLE IF EXISTS `tu_user_card`;

CREATE TABLE `tu_user_card` (
  `card_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_num` varchar(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL COMMENT '备用字段企业ID',
  `end_date` date DEFAULT NULL COMMENT '有效期',
  `create_time` int(11) DEFAULT NULL,
  `update_time` varchar(16) DEFAULT NULL COMMENT '更新时间',
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`card_id`) USING BTREE,
  UNIQUE KEY `card_num` (`card_num`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_card` */

/*Table structure for table `tu_user_gold_logs` */

DROP TABLE IF EXISTS `tu_user_gold_logs`;

CREATE TABLE `tu_user_gold_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `gold` int(11) DEFAULT '0',
  `intro` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_gold_logs` */

/*Table structure for table `tu_user_guide_logs` */

DROP TABLE IF EXISTS `tu_user_guide_logs`;

CREATE TABLE `tu_user_guide_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `shop_id` int(11) NOT NULL COMMENT '企业ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `guide_id` int(11) NOT NULL COMMENT '推荐人的ID',
  `type` enum('tuan','ele','booking','goods','breaks','hotel','crowd','farm','appoint','cloud','edu') NOT NULL DEFAULT 'tuan' COMMENT '分成类型',
  `money` int(11) DEFAULT '0' COMMENT '分成金额',
  `intro` varchar(64) DEFAULT NULL COMMENT '分成理由',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_guide_logs` */

/*Table structure for table `tu_user_integral_cancel` */

DROP TABLE IF EXISTS `tu_user_integral_cancel`;

CREATE TABLE `tu_user_integral_cancel` (
  `cancel_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT '0',
  `shop_id` int(11) DEFAULT '0',
  `worker_id` int(11) DEFAULT NULL COMMENT '店员ID',
  `type` int(11) DEFAULT NULL COMMENT '核销类型',
  `integral` int(11) DEFAULT '0' COMMENT '核销积分',
  `intro` varchar(64) DEFAULT NULL,
  `cancel_date` varchar(32) DEFAULT NULL COMMENT '核销日期',
  `create_time` int(16) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cancel_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_integral_cancel` */

/*Table structure for table `tu_user_integral_library` */

DROP TABLE IF EXISTS `tu_user_integral_library`;

CREATE TABLE `tu_user_integral_library` (
  `library_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `integral_library` int(11) DEFAULT NULL,
  `integral_library_surplus` int(11) DEFAULT NULL COMMENT '剩余积分库',
  `integral_library_day` int(11) DEFAULT NULL COMMENT '每天返还库积分',
  `integral_library_success` int(11) NOT NULL DEFAULT '0' COMMENT '已返还库积分',
  `integral_library_total` int(11) DEFAULT NULL COMMENT '返还总天数',
  `integral_library_total_success` int(11) NOT NULL DEFAULT '0' COMMENT '已返还天数',
  `intro` varchar(256) DEFAULT NULL COMMENT '添加说明',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '关闭',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`library_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_integral_library` */

insert  into `tu_user_integral_library`(`library_id`,`user_id`,`integral_library`,`integral_library_surplus`,`integral_library_day`,`integral_library_success`,`integral_library_total`,`integral_library_total_success`,`intro`,`closed`,`create_time`,`create_ip`) values (1,2,13,13,13,0,1,0,'1231',0,1530713382,'114.135.75.131');

/*Table structure for table `tu_user_integral_logs` */

DROP TABLE IF EXISTS `tu_user_integral_logs`;

CREATE TABLE `tu_user_integral_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_integral_logs` */

insert  into `tu_user_integral_logs`(`log_id`,`user_id`,`integral`,`intro`,`create_time`,`create_ip`) values (1,3,188,'用户首次注册',1574904597,'127.0.0.1'),(2,3,5,'用户实名认证成功',1575171658,'127.0.0.1'),(3,4,188,'用户首次注册',1575181862,'39.90.2.114'),(4,4,1,'给企业【网招工作网】点赞奖励积分',1575337684,'27.222.98.103'),(5,6,188,'用户首次注册',1575339343,'119.178.17.23'),(6,7,188,'用户首次注册',1575339419,'112.224.20.252');

/*Table structure for table `tu_user_integral_restore` */

DROP TABLE IF EXISTS `tu_user_integral_restore`;

CREATE TABLE `tu_user_integral_restore` (
  `restore_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `library_id` int(11) DEFAULT NULL COMMENT '积分库ID',
  `user_id` int(11) DEFAULT '0',
  `integral` int(11) DEFAULT '0' COMMENT '返还积分',
  `intro` varchar(64) DEFAULT NULL,
  `restore_date` varchar(16) DEFAULT NULL,
  `create_time` int(16) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`restore_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_integral_restore` */

/*Table structure for table `tu_user_message` */

DROP TABLE IF EXISTS `tu_user_message`;

CREATE TABLE `tu_user_message` (
  `from_id` int(15) NOT NULL AUTO_INCREMENT,
  `send_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `create_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`from_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_message` */

/*Table structure for table `tu_user_money_logs` */

DROP TABLE IF EXISTS `tu_user_money_logs`;

CREATE TABLE `tu_user_money_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `money` int(11) DEFAULT '0',
  `intro` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_money_logs` */

insert  into `tu_user_money_logs`(`log_id`,`user_id`,`money`,`intro`,`create_time`,`create_ip`) values (1,1,500000,'1',1530407680,'119.86.163.105'),(2,1,-2335,'购买模板【酒店】扣费成功',1530407683,'119.86.163.105'),(3,4,10,'添加一毛钱 测试微信支付相关',1575182667,'39.90.2.114'),(4,4,1000,'测试补贴;修改前用户余额：10',1575193251,'39.90.2.114');

/*Table structure for table `tu_user_prestige_logs` */

DROP TABLE IF EXISTS `tu_user_prestige_logs`;

CREATE TABLE `tu_user_prestige_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `prestige` int(11) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_prestige_logs` */

insert  into `tu_user_prestige_logs`(`log_id`,`user_id`,`prestige`,`intro`,`create_time`,`create_ip`) values (1,1,1,'每日登陆奖励',1525711754,'192.168.0.3'),(2,1,1,'每日登陆奖励',1527054930,'111.37.71.184'),(3,2,1,'每日登陆奖励',1527637947,'203.109.153.182'),(4,1,1,'每日登陆奖励',1527649708,'203.109.153.182'),(5,1,1,'每日登陆奖励',1528251306,'180.173.45.36'),(6,1,1,'每日登陆奖励',1528342473,'111.37.70.112'),(7,2,1,'每日登陆奖励',1528347152,'125.68.94.176'),(8,1,1,'每日登陆奖励',1528516561,'111.37.70.43'),(9,1,1,'每日登陆奖励',1528970265,'111.34.65.245'),(10,1,1,'每日登陆奖励',1530081314,'222.161.199.147'),(11,1,1,'每日登陆奖励',1530665310,'222.179.155.92'),(12,1,1,'每日登陆奖励',1530779311,'111.37.67.27'),(13,3,1,'每日登陆奖励',1575085352,'127.0.0.1'),(14,3,50,'用户实名认证成功奖励',1575171658,'127.0.0.1'),(15,4,1,'每日登陆奖励',1575186705,'39.90.2.114'),(16,4,1,'每日登陆奖励',1575336831,'27.222.98.103');

/*Table structure for table `tu_user_profit_logs` */

DROP TABLE IF EXISTS `tu_user_profit_logs`;

CREATE TABLE `tu_user_profit_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` enum('goods','ele','booking','tuan','breaks','hotel','farm','appoint','rank','grade') NOT NULL DEFAULT 'goods' COMMENT '分销新类别',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `info` varchar(256) DEFAULT NULL COMMENT '分销说明',
  `is_separate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_profit_logs` */

/*Table structure for table `tu_user_rank` */

DROP TABLE IF EXISTS `tu_user_rank`;

CREATE TABLE `tu_user_rank` (
  `rank_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(32) DEFAULT NULL,
  `number` int(11) DEFAULT '0' COMMENT '需要人数',
  `discount` int(11) DEFAULT NULL COMMENT '折扣',
  `reward` int(11) DEFAULT NULL COMMENT '奖励折扣',
  `icon` varchar(64) DEFAULT NULL,
  `icon1` varchar(64) DEFAULT NULL,
  `integral` int(11) DEFAULT '0' COMMENT '需要积分',
  `prestige` int(11) DEFAULT '0' COMMENT '需要的积分数',
  `rebate` int(10) DEFAULT '0',
  `photo` varchar(128) NOT NULL COMMENT '图标',
  `price` int(11) DEFAULT '0' COMMENT '用户购买等级金额',
  PRIMARY KEY (`rank_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_rank` */

insert  into `tu_user_rank`(`rank_id`,`rank_name`,`number`,`discount`,`reward`,`icon`,`icon1`,`integral`,`prestige`,`rebate`,`photo`,`price`) values (1,'VIP会员',2,100,0,'vip1','vip1',0,300,0,'http://images4.5maiche.cn/2017-04-16_58f360747df40.png',0);

/*Table structure for table `tu_user_sign` */

DROP TABLE IF EXISTS `tu_user_sign`;

CREATE TABLE `tu_user_sign` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `day` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `is_first` tinyint(4) DEFAULT '1',
  `last_time` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_user_sign` */

insert  into `tu_user_sign`(`user_id`,`day`,`status`,`is_first`,`last_time`) values (4,0,0,1,1575100388);

/*Table structure for table `tu_user_transfer_logs` */

DROP TABLE IF EXISTS `tu_user_transfer_logs`;

CREATE TABLE `tu_user_transfer_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` int(11) DEFAULT '0' COMMENT '转出账户',
  `uid` int(11) unsigned DEFAULT NULL COMMENT '转入账户',
  `money` int(11) DEFAULT '0' COMMENT '金额*100',
  `commission` int(11) DEFAULT NULL COMMENT '手续费',
  `intro` varchar(64) DEFAULT NULL COMMENT '说明',
  `create_time` int(11) DEFAULT NULL COMMENT '操作时间',
  `create_ip` varchar(15) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_transfer_logs` */

/*Table structure for table `tu_user_weixin` */

DROP TABLE IF EXISTS `tu_user_weixin`;

CREATE TABLE `tu_user_weixin` (
  `wx_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `openid` varchar(200) DEFAULT NULL,
  `nickname` varchar(200) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `unionid` varchar(50) DEFAULT NULL,
  `dateline` int(10) DEFAULT NULL,
  PRIMARY KEY (`wx_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3746 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_user_weixin` */


/*Table structure for table `tu_users` */

DROP TABLE IF EXISTS `tu_users`;

CREATE TABLE `tu_users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) DEFAULT NULL COMMENT '邮件或者手机',
  `password` char(32) DEFAULT NULL,
  `pay_password` char(32) DEFAULT NULL,
  `face` varchar(500) DEFAULT NULL,
  `poster` varchar(128) DEFAULT NULL COMMENT '海报',
  `ext0` varchar(15) DEFAULT NULL COMMENT '为了兼容DISCUZ 设立的用户名存储的字段',
  `nickname` varchar(32) DEFAULT NULL,
  `integral` int(11) DEFAULT '0',
  `prestige` int(11) DEFAULT '0' COMMENT '声望，影响等级的',
  `money` int(11) DEFAULT '0' COMMENT '账户余额',
  `rank_id` tinyint(4) DEFAULT '0' COMMENT '等级ID',
  `gold` int(11) DEFAULT '0',
  `subsidy_money` int(11) DEFAULT NULL COMMENT '会员补贴，包含在余额内，这里只是汇总',
  `frozen_money` int(11) DEFAULT NULL COMMENT '会员余额-冻结金',
  `frozen_gold` int(11) DEFAULT NULL COMMENT '冻结金-企业资金',
  `reg_time` int(11) DEFAULT '0',
  `reg_ip` varchar(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  `frozen_money_time` int(11) DEFAULT NULL COMMENT '会员余额-冻结金修改时间',
  `frozen_gold_time` int(11) DEFAULT NULL COMMENT '修改企业资金冻结时间',
  `prestige_frozen` int(11) NOT NULL DEFAULT '0' COMMENT '威望冻结金',
  `is_prestige_frozen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0代表威望已冻结，1已解冻',
  `closed` tinyint(1) DEFAULT '0' COMMENT '-1代表需要激活   0 代表正常  1 代表删除',
  `uc_id` int(11) DEFAULT '0',
  `email` varchar(64) DEFAULT NULL COMMENT '认证的邮件',
  `mobile` varchar(11) DEFAULT NULL COMMENT '认证的手机号码',
  `ping_num` int(11) DEFAULT '0',
  `post_num` int(11) DEFAULT '0',
  `lock_num` int(11) DEFAULT '0',
  `invite1` int(11) DEFAULT NULL,
  `invite2` int(11) DEFAULT NULL,
  `invite3` int(11) DEFAULT NULL,
  `invite4` int(11) DEFAULT NULL,
  `invite5` int(11) DEFAULT NULL,
  `invite6` int(11) DEFAULT '0',
  `token` char(32) DEFAULT '0',
  `fuid1` int(10) unsigned NOT NULL DEFAULT '0',
  `fuid2` int(10) unsigned NOT NULL DEFAULT '0',
  `fuid3` int(10) unsigned NOT NULL DEFAULT '0',
  `carBrand_id` int(11) DEFAULT NULL COMMENT '汽车品牌ID',
  `school_year` int(11) DEFAULT NULL COMMENT '入校年份',
  `addr` varchar(64) DEFAULT NULL COMMENT '地址',
  `identity` tinyint(1) DEFAULT '0' COMMENT '身份：1教师，2本科生，3研究生，4其他',
  `is_lock` tinyint(1) DEFAULT '0',
  `is_lock_time` int(11) DEFAULT NULL,
  `is_aux` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员是否实名认证',
  `is_backers` int(11) DEFAULT '0' COMMENT '1申请中，2已审核，3已拒绝',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_users` */

insert  into `tu_users`(`user_id`,`account`,`password`,`pay_password`,`face`,`poster`,`ext0`,`nickname`,`integral`,`prestige`,`money`,`rank_id`,`gold`,`subsidy_money`,`frozen_money`,`frozen_gold`,`reg_time`,`reg_ip`,`last_time`,`frozen_money_time`,`frozen_gold_time`,`prestige_frozen`,`is_prestige_frozen`,`closed`,`uc_id`,`email`,`mobile`,`ping_num`,`post_num`,`lock_num`,`invite1`,`invite2`,`invite3`,`invite4`,`invite5`,`invite6`,`token`,`fuid1`,`fuid2`,`fuid3`,`carBrand_id`,`school_year`,`addr`,`identity`,`is_lock`,`is_lock_time`,`is_aux`,`is_backers`) values (1,'zhaopin','24a0847f1746d07d56405f6cf57cb4d4','75e511daee3209eace81bbadb650dbb6','','/attachs/weixinuid/cb1/e8f/1e7/cb1e8f1e768290e3ba619297642cb2df.png','','zhaopin',0,10,497665,1,0,NULL,NULL,NULL,1525711712,'192.168.0.3',1530779311,NULL,NULL,0,0,1,0,'','15114445454',0,0,0,NULL,NULL,NULL,NULL,NULL,0,'986b58f6fd67adf8e93e5054734441da',0,0,0,NULL,NULL,NULL,0,0,0,0,0),(2,'kevin@123.com','e10adc3949ba59abbe56e057f20f883e','14e1b600b1fd579f47433b88e8d85291','',NULL,'','Kevin',0,2,0,1,0,NULL,NULL,NULL,1527637912,'203.109.153.182',1528347152,NULL,NULL,0,0,1,0,'','',0,0,0,NULL,NULL,NULL,NULL,NULL,0,'cabf433d92679baea06bcde457408ffd',0,0,0,NULL,NULL,NULL,0,0,0,0,0),(3,'18864874770','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'/attachs/weixinuid/fca/f47/aeb/fcaf47aeb1d536e433f7eec35f7c9d9d.png','18864874770','18864874770',193,51,0,0,0,NULL,NULL,NULL,1574904597,'127.0.0.1',1575085352,NULL,NULL,0,0,1,0,NULL,'18864874770',0,0,0,NULL,NULL,NULL,NULL,NULL,0,'e713f2f951ffffbef53a51e3d2117d8d',0,0,0,NULL,NULL,NULL,0,0,0,1,0),(4,'weixin_auto1','e10adc3949ba59abbe56e057f20f883e','14e1b600b1fd579f47433b88e8d85291','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJAVQB8Z7Axx6ETIV6nJ9Z9dtBhKrkKqDYejSpxNicButcAnvDTTqc9OxbS3xLB6LS0Fiaiat3a5RHBQ/132','/attachs/weixinuid/b38/651/43e/b3865143eb8cbe8cf5db5a65874668a3.png','gg','gg',189,2,1010,0,0,1000,NULL,NULL,1575181862,'39.90.2.114',1575336833,NULL,NULL,0,0,0,0,'','',0,0,0,NULL,NULL,NULL,NULL,NULL,0,'d344033053e668290d23516b2d02f268',0,0,0,NULL,NULL,NULL,0,0,0,0,0),(5,'admin','e10adc3949ba59abbe56e057f20f883e','14e1b600b1fd579f47433b88e8d85291','/attachs/2019/12/02/thumb_5de4a68cf3f83.jpg',NULL,'管理员','管理员',0,0,0,1,0,NULL,NULL,NULL,1575265934,'27.222.125.72',NULL,NULL,NULL,0,0,0,0,'','',0,0,0,NULL,NULL,NULL,NULL,NULL,0,'0',0,0,0,NULL,NULL,NULL,0,0,NULL,0,0),(6,'weixin_auto2','abd3c021203b51d9c8b90a0276249ad6',NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIj8jQKX5nCTPMTd6KemATj6H3nibYaafw4zTnZibU43yPl1jJMB0SrxmQpx8GRh8uIs8tc6gXiajcwA/132',NULL,'山东柒姐招工～已满','山东柒姐招工～已满',188,0,0,0,0,NULL,NULL,NULL,1575339343,'119.178.17.23',NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,0,'28_JdWJ_UYajRtfN5-XupR5zK16c2Efg',0,0,0,NULL,NULL,NULL,0,0,NULL,0,0),(7,'weixin_auto3','bd8181da42a3ccdd8fb4db901c570209',NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL3llotQibiaFvTjEhSA2X1BicQ5YqZETozW1rVObUW9NibvtIiamDzjZzEVaoCFO5BAYwgxwiarPdarT7g/132',NULL,'A..宁小子','A..宁小子',188,0,0,0,0,NULL,NULL,NULL,1575339419,'112.224.20.252',NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,0,'28_ljr-sDHIz7k07U08t-U1oP_Ce8T7r',0,0,0,NULL,NULL,NULL,0,0,NULL,0,0);

/*Table structure for table `tu_users_aux` */

DROP TABLE IF EXISTS `tu_users_aux`;

CREATE TABLE `tu_users_aux` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(32) DEFAULT NULL COMMENT '真实电话',
  `qq` int(11) DEFAULT NULL COMMENT '认证QQ',
  `weixin` varchar(32) DEFAULT NULL COMMENT '认证微信',
  `weibo` varchar(32) DEFAULT NULL COMMENT '认证微博',
  `weixin_qrcode` varchar(256) DEFAULT NULL COMMENT '认证微信二维码',
  `job` varchar(32) NOT NULL COMMENT '职业',
  `constellation` varchar(32) DEFAULT NULL COMMENT '星座',
  `card_photo` varchar(128) DEFAULT NULL COMMENT '认证身份证号码',
  `card_id` varchar(128) DEFAULT NULL COMMENT '身份证ID',
  `city_id` int(32) DEFAULT NULL COMMENT '地址市',
  `area_id` int(32) DEFAULT NULL COMMENT '地址区县',
  `business_id` int(32) DEFAULT NULL COMMENT '商圈',
  `team_id` int(11) DEFAULT NULL COMMENT '队伍ID',
  `jury_id` int(11) DEFAULT NULL COMMENT '团队ID',
  `group_id` int(11) DEFAULT NULL COMMENT '群ID',
  `addr_str` varchar(128) DEFAULT NULL COMMENT '区域详细字段',
  `addr_info` varchar(128) DEFAULT NULL COMMENT '地址街道信息',
  `guarantor_name` varchar(32) DEFAULT NULL COMMENT '担保人姓名',
  `guarantor_mobile` varchar(32) DEFAULT NULL COMMENT '担保人电话',
  `guarantor_addr` varchar(128) DEFAULT NULL COMMENT '担保人地址',
  `audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `audit_time` int(1) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `reason` varchar(256) NOT NULL COMMENT '拒绝理由',
  `closed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '关闭状态',
  `create_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `create_ip` varchar(32) NOT NULL COMMENT '添加IP',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_users_aux` */

insert  into `tu_users_aux`(`user_id`,`name`,`mobile`,`qq`,`weixin`,`weibo`,`weixin_qrcode`,`job`,`constellation`,`card_photo`,`card_id`,`city_id`,`area_id`,`business_id`,`team_id`,`jury_id`,`group_id`,`addr_str`,`addr_info`,`guarantor_name`,`guarantor_mobile`,`guarantor_addr`,`audit`,`audit_time`,`reason`,`closed`,`create_time`,`create_ip`) values (3,'果果','18864874770',NULL,NULL,NULL,NULL,'',NULL,'','38',NULL,NULL,NULL,NULL,NULL,NULL,'成都 新站 生态公园','创业大厦',NULL,NULL,NULL,1,0,'',0,1575171581,'127.0.0.1'),(4,'果果','18864874770',NULL,NULL,NULL,NULL,'',NULL,'','2147483647',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1,0,'拒绝',0,1575183721,'39.90.2.114');

/*Table structure for table `tu_users_cash` */

DROP TABLE IF EXISTS `tu_users_cash`;

CREATE TABLE `tu_users_cash` (
  `cash_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` enum('user','shop','community') DEFAULT 'user',
  `code` enum('weixin','bank') DEFAULT 'weixin',
  `shop_id` smallint(5) DEFAULT NULL,
  `city_id` smallint(5) DEFAULT NULL,
  `area_id` smallint(5) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `gold` int(11) NOT NULL DEFAULT '0' COMMENT '商户提现资金',
  `commission` int(11) DEFAULT NULL COMMENT '提现佣金',
  `re_user_name` varchar(64) DEFAULT NULL COMMENT '已认证姓名',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未审核1通过2拒绝',
  `reason` text,
  `account` varchar(64) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `bank_num` varchar(32) DEFAULT NULL,
  `bank_branch` varchar(128) DEFAULT NULL,
  `bank_realname` varchar(64) DEFAULT NULL,
  `mch_billno` varchar(32) DEFAULT NULL COMMENT '微信提现商户号',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0',
  `return_msg` varchar(128) DEFAULT NULL COMMENT '微信提现状态返回吗',
  `payment_no` varchar(128) DEFAULT NULL COMMENT '微信订单号',
  `partner_trade_no` varchar(128) DEFAULT NULL COMMENT '商户订单号',
  `payment_time` varchar(64) DEFAULT NULL COMMENT '付款时间',
  `addtime` int(11) DEFAULT NULL COMMENT '提现提交时间',
  PRIMARY KEY (`cash_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_users_cash` */

/*Table structure for table `tu_users_ex` */

DROP TABLE IF EXISTS `tu_users_ex`;

CREATE TABLE `tu_users_ex` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `last_uid` int(11) DEFAULT '0',
  `views` int(11) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `bank_num` varchar(32) DEFAULT NULL,
  `bank_branch` varchar(128) DEFAULT NULL,
  `bank_realname` varchar(64) DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL,
  `star_id` tinyint(10) NOT NULL DEFAULT '0',
  `born_year` varchar(20) DEFAULT NULL,
  `born_month` tinyint(20) DEFAULT NULL,
  `born_day` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_users_ex` */

insert  into `tu_users_ex`(`user_id`,`last_uid`,`views`,`bank_name`,`bank_num`,`bank_branch`,`bank_realname`,`job`,`sex`,`star_id`,`born_year`,`born_month`,`born_day`) values (1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL);

/*Table structure for table `tu_users_goods` */

DROP TABLE IF EXISTS `tu_users_goods`;

CREATE TABLE `tu_users_goods` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `goods_id` int(10) DEFAULT NULL,
  `record_time` int(11) DEFAULT NULL,
  `record_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_users_goods` */

/*Table structure for table `tu_users_look` */

DROP TABLE IF EXISTS `tu_users_look`;

CREATE TABLE `tu_users_look` (
  `look_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`look_id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_users_look` */

/*Table structure for table `tu_village` */

DROP TABLE IF EXISTS `tu_village`;

CREATE TABLE `tu_village` (
  `village_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '管理员',
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `cate` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `tel` varchar(20) NOT NULL,
  `pic` varchar(64) NOT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `profiles` varchar(128) DEFAULT NULL,
  `thread_id` int(11) DEFAULT '0' COMMENT '乡村部落ID',
  `orderby` tinyint(4) DEFAULT '100',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `info` text NOT NULL,
  `is_bbs` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`village_id`) USING BTREE,
  KEY `city_id` (`city_id`,`area_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='小区表';

/*Data for the table `tu_village` */

/*Table structure for table `tu_village_bbs` */

DROP TABLE IF EXISTS `tu_village_bbs`;

CREATE TABLE `tu_village_bbs` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(80) NOT NULL,
  `village_id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `view_num` int(10) NOT NULL DEFAULT '0',
  `zan_num` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(30) NOT NULL,
  `hot` int(1) NOT NULL,
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `audit` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_village_bbs` */

/*Table structure for table `tu_village_bbs_replys` */

DROP TABLE IF EXISTS `tu_village_bbs_replys`;

CREATE TABLE `tu_village_bbs_replys` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT,
  `village_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL DEFAULT '0',
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `audit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reply_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_village_bbs_replys` */

/*Table structure for table `tu_village_enter` */

DROP TABLE IF EXISTS `tu_village_enter`;

CREATE TABLE `tu_village_enter` (
  `enter_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL COMMENT '1商品，2团购',
  `id` int(11) DEFAULT NULL COMMENT '类型下面的ID',
  `village_id` int(11) NOT NULL COMMENT '乡村ID',
  `shop_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `intro` varchar(64) DEFAULT NULL COMMENT '申请理由',
  `bg_date` date DEFAULT NULL COMMENT '开始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '支付状态',
  `price` int(11) DEFAULT '0' COMMENT '购买价格',
  `audit` tinyint(1) DEFAULT '0' COMMENT '0未审核，2已审核',
  `closed` tinyint(1) DEFAULT '0' COMMENT '1开启，2关闭',
  `create_time` int(11) DEFAULT NULL COMMENT '时间',
  `create_ip` varchar(15) DEFAULT NULL COMMENT 'IP',
  PRIMARY KEY (`enter_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_village_enter` */

/*Table structure for table `tu_village_notice` */

DROP TABLE IF EXISTS `tu_village_notice`;

CREATE TABLE `tu_village_notice` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `village_id` smallint(5) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '通知新增管理员',
  `title` varchar(255) NOT NULL,
  `context` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `views` int(11) DEFAULT '0' COMMENT '通知浏览次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_village_notice` */

/*Table structure for table `tu_village_suggestion` */

DROP TABLE IF EXISTS `tu_village_suggestion`;

CREATE TABLE `tu_village_suggestion` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `village_id` smallint(5) NOT NULL,
  `user` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `context` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  `replytime` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `reply` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `person` varchar(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_village_suggestion` */

/*Table structure for table `tu_village_users` */

DROP TABLE IF EXISTS `tu_village_users`;

CREATE TABLE `tu_village_users` (
  `join_id` int(11) NOT NULL AUTO_INCREMENT,
  `village_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`join_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_village_users` */

/*Table structure for table `tu_village_worker` */

DROP TABLE IF EXISTS `tu_village_worker`;

CREATE TABLE `tu_village_worker` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `village_id` smallint(5) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `name` varchar(50) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `job` varchar(50) NOT NULL,
  `orderby` int(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_village_worker` */

/*Table structure for table `tu_weidian_cate` */

DROP TABLE IF EXISTS `tu_weidian_cate`;

CREATE TABLE `tu_weidian_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `photo` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_weidian_cate` */

insert  into `tu_weidian_cate`(`cate_id`,`cate_name`,`parent_id`,`photo`,`orderby`) values (1,'微店顶级分类',0,'',1),(2,'微店二级分类',1,'',1),(3,'微店二级分类2',1,'',2);

/*Table structure for table `tu_weidian_details` */

DROP TABLE IF EXISTS `tu_weidian_details`;

CREATE TABLE `tu_weidian_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weidian_name` varchar(64) NOT NULL,
  `addr` varchar(128) NOT NULL,
  `business_time` varchar(32) NOT NULL,
  `details` text NOT NULL,
  `pic` varchar(64) NOT NULL,
  `logo` varchar(64) NOT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `lng` varchar(15) NOT NULL,
  `lat` varchar(15) NOT NULL,
  `cate_id` int(10) unsigned NOT NULL,
  `audit` tinyint(1) unsigned NOT NULL,
  `reg_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `area_id` smallint(5) unsigned NOT NULL,
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_weidian_details` */

/*Table structure for table `tu_weixin_keyword` */

DROP TABLE IF EXISTS `tu_weixin_keyword`;

CREATE TABLE `tu_weixin_keyword` (
  `keyword_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) DEFAULT NULL,
  `type` enum('news','text') DEFAULT 'text' COMMENT '0普通消息 1图片消息',
  `title` varchar(128) DEFAULT NULL,
  `contents` text,
  `url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`keyword_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_weixin_keyword` */

/*Table structure for table `tu_weixin_msg` */

DROP TABLE IF EXISTS `tu_weixin_msg`;

CREATE TABLE `tu_weixin_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `open_id` varchar(64) DEFAULT NULL COMMENT 'open_id',
  `status` varchar(11) DEFAULT NULL COMMENT '返回码，默认空',
  `info` varchar(128) DEFAULT NULL COMMENT '返回码说明',
  `serial` varchar(64) DEFAULT NULL COMMENT '模板库编号',
  `template_id` varchar(128) DEFAULT NULL COMMENT '模板编号',
  `comment` text COMMENT '内容',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL COMMENT '发送IP',
  PRIMARY KEY (`msg_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_weixin_msg` */

insert  into `tu_weixin_msg`(`msg_id`,`user_id`,`open_id`,`status`,`info`,`serial`,`template_id`,`comment`,`create_time`,`create_ip`) values (1,4,'o8YIj1Z-J87XdphJUW0UtQ_8Nw7s','40037','invalid template_id hint: [Efv5DA06683952]','OPENTM200465417','111111111111111111','余额可提现收入资金变动<br>余额可提现收入<br>0.1元<br>2019-12-01 14:44:27 <br>添加一毛钱 测试微信支付相关详情请登录：http://zhaopin.weixinguanfang.com/user<br>',1575182667,'39.90.2.114'),(2,4,'o8YIj1Z-J87XdphJUW0UtQ_8Nw7s','40037','invalid template_id hint: [LQ07064124]','OPENTM200465417','111111111111111111','威望资金变动<br>威望<br>1威望<br>2019-12-01 15:51:45 <br>每日登陆奖励详情请登录：http://zhaopin.weixinguanfang.com/user<br>',1575186705,'39.90.2.114'),(3,4,'o8YIj1Z-J87XdphJUW0UtQ_8Nw7s','40037','invalid template_id hint: [fkQfKA02523942]','OPENTM200465417','111111111111111111','余额可提现收入资金变动<br>余额可提现收入<br>10元<br>2019-12-01 17:40:52 <br>测试补贴详情请登录：http://zhaopin.weixinguanfang.com/user<br>',1575193252,'39.90.2.114'),(4,4,'o8YIj1Z-J87XdphJUW0UtQ_8Nw7s','40037','invalid template_id hint: [JVh2gA08333116]','OPENTM200465417','111111111111111111','威望资金变动<br>威望<br>1威望<br>2019-12-03 09:33:52 <br>每日登陆奖励详情请登录：http://zhaopin.weixinguanfang.com/user<br>',1575336832,'27.222.98.103'),(5,4,'o8YIj1Z-J87XdphJUW0UtQ_8Nw7s','40037','invalid template_id hint: [zBhaUa0686shb1]','OPENTM200465417','111111111111111111','积分资金变动<br>积分<br>1分<br>2019-12-03 09:48:05 <br>给企业【网招工作网】点赞奖励积分详情请登录：http://zhaopin.weixinguanfang.com/user<br>',1575337685,'27.222.98.103');

/*Table structure for table `tu_weixin_qrcode` */

DROP TABLE IF EXISTS `tu_weixin_qrcode`;

CREATE TABLE `tu_weixin_qrcode` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0',
  `soure_id` smallint(5) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Data for the table `tu_weixin_qrcode` */

insert  into `tu_weixin_qrcode`(`id`,`type`,`soure_id`) values (1,1,1),(2,3,1),(3,3,2),(4,3,3),(5,3,4),(6,3,21),(7,1,2);

/*Table structure for table `tu_weixin_share` */

DROP TABLE IF EXISTS `tu_weixin_share`;

CREATE TABLE `tu_weixin_share` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fuid` int(11) DEFAULT NULL COMMENT '分享人ID',
  `user_id` int(11) DEFAULT NULL,
  `controller` varchar(64) DEFAULT NULL COMMENT '控制器',
  `action` varchar(11) DEFAULT NULL COMMENT '方法',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL COMMENT '分享IP',
  PRIMARY KEY (`share_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_weixin_share` */

/*Table structure for table `tu_weixin_tmpl` */

DROP TABLE IF EXISTS `tu_weixin_tmpl`;

CREATE TABLE `tu_weixin_tmpl` (
  `tmpl_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '模板标题',
  `serial` varchar(255) DEFAULT NULL COMMENT '模板系统编号',
  `template_id` varchar(255) DEFAULT NULL COMMENT '模板应用ID',
  `info` varchar(255) DEFAULT NULL COMMENT '模板介绍',
  `sort` tinyint(4) unsigned DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT NULL COMMENT '模板介绍',
  `create_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`tmpl_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_weixin_tmpl` */

insert  into `tu_weixin_tmpl`(`tmpl_id`,`title`,`serial`,`template_id`,`info`,`sort`,`status`,`create_time`,`update_time`) values (1,'下单成功通知','OPENTM202297555','111111111111111111','',0,1,0,1495871264),(27,'账户资金变动通知','OPENTM200465417','111111111111111111',NULL,0,1,1491832824,1495871264),(26,'订单消息提醒','OPENTM205109409','111111111111111111',NULL,0,1,1491826213,1495871264),(22,'新订单提醒','OPENTM400045127','111111111111111111',NULL,0,1,1470450627,1495871264),(23,'提现余额提醒通知','OPENTM206909003','111111111111111111',NULL,0,1,1473739867,1495871264),(28,'客户新需求推送通知','OPENTM207467627','111111111111111111',NULL,0,1,1492997882,1495871264),(25,'订单配送通知','OPENTM406590003','111111111111111111',NULL,0,1,1486896576,1495871264),(29,'邀请注册成功通知','OPENTM401095581','111111111111111111',NULL,0,1,1495033817,1495871264);

/*Table structure for table `tu_work` */

DROP TABLE IF EXISTS `tu_work`;

CREATE TABLE `tu_work` (
  `work_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT '0',
  `money1` int(11) DEFAULT '0' COMMENT '起步MONEY',
  `money2` int(11) DEFAULT '0' COMMENT '封顶MONEY',
  `num` tinyint(4) DEFAULT '0' COMMENT '0代表若干',
  `intro` varchar(1024) DEFAULT NULL,
  `work_time` varchar(32) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `expir_date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0' COMMENT '1 代表显示',
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`work_id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE,
  KEY `lng` (`lng`,`lat`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_work` */

/*Table structure for table `tu_zhe` */

DROP TABLE IF EXISTS `tu_zhe`;

CREATE TABLE `tu_zhe` (
  `zhe_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '五折卡 城市',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '五折卡区域',
  `zhe_name` varchar(64) NOT NULL COMMENT '标题',
  `cate_id` int(11) DEFAULT NULL COMMENT '五折卡该分类关企业分类',
  `photo` varchar(128) DEFAULT '',
  `bg_date` date NOT NULL COMMENT '开始时间',
  `end_date` date NOT NULL COMMENT '结束时间',
  `week_id` varchar(64) DEFAULT NULL COMMENT '星期',
  `date_id` varchar(64) DEFAULT NULL COMMENT '日期',
  `walkin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否免预约',
  `person` int(11) NOT NULL COMMENT '人数',
  `limit` int(11) NOT NULL COMMENT '限额',
  `description` varchar(128) NOT NULL COMMENT '简介',
  `credit` int(11) DEFAULT NULL COMMENT '积分',
  `orderby` int(11) DEFAULT NULL COMMENT '排序',
  `views` int(11) DEFAULT NULL COMMENT '浏览量',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '推荐购买指数',
  `index` int(11) NOT NULL DEFAULT '0' COMMENT '购买流量预约指数',
  `yuyue_num` int(11) DEFAULT '0' COMMENT '五折卡已预约消费人次',
  `content` text NOT NULL COMMENT '详情',
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`zhe_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_zhe` */

/*Table structure for table `tu_zhe_order` */

DROP TABLE IF EXISTS `tu_zhe_order`;

CREATE TABLE `tu_zhe_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` smallint(6) DEFAULT NULL COMMENT '购买城市',
  `zhe_id` int(10) DEFAULT NULL COMMENT '购买来源',
  `type` int(1) DEFAULT NULL COMMENT '1为周卡，2为年卡',
  `user_id` int(10) DEFAULT NULL COMMENT '购买ID',
  `status` tinyint(1) DEFAULT '0' COMMENT '0代表未付款，1代表已付款',
  `need_pay` int(11) DEFAULT NULL COMMENT '付款金额',
  `number` int(11) DEFAULT NULL COMMENT '五折卡编号',
  `start_time` int(11) DEFAULT NULL COMMENT '五折卡开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '五折卡结束时间',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_zhe_order` */

/*Table structure for table `tu_zhe_yuyue` */

DROP TABLE IF EXISTS `tu_zhe_yuyue`;

CREATE TABLE `tu_zhe_yuyue` (
  `yuyue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` smallint(6) DEFAULT NULL COMMENT '购买城市',
  `zhe_id` int(10) DEFAULT NULL COMMENT '购买来源',
  `shop_id` int(10) DEFAULT NULL COMMENT '企业ID，方面后期搜索',
  `user_id` int(10) DEFAULT NULL COMMENT '购买ID',
  `mobile` varchar(32) DEFAULT NULL COMMENT '用户手机号',
  `code` int(11) DEFAULT NULL COMMENT '预约验证码',
  `is_used` tinyint(1) DEFAULT '0' COMMENT '0下单成功，1已验证，2取消',
  `used_time` int(11) DEFAULT NULL COMMENT '预约验证时间',
  `is_dianping` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1代表已点评',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`yuyue_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tu_zhe_yuyue` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;