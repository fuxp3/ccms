/*
SQLyog v10.2 
MySQL - 5.5.62-log : Database - clothingstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`clothingstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clothingstore`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `name` varchar(200) NOT NULL COMMENT '收货人',
  `phone` varchar(200) NOT NULL COMMENT '电话',
  `isdefault` varchar(200) NOT NULL COMMENT '是否默认地址[是/否]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='地址';

/*Data for the table `address` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) DEFAULT 'fuzhuangxinxi' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` varchar(200) DEFAULT NULL COMMENT '图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` float DEFAULT NULL COMMENT '单价',
  `discountprice` float DEFAULT NULL COMMENT '会员价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

/*Data for the table `cart` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` varchar(32) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `category` */

insert  into `category`(`cid`,`cname`) values ('1','超级大牌女装'),('2','超级大牌男装'),('3','运动服装'),('5','母婴服装'),('56ADF6AFB0AC477488C9B8ECAFB9F014','折扣服装'),('6','护肤服装'),('B274B9BF800C40099C7430020755E893','休闲服装');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COMMENT '提问',
  `reply` longtext COMMENT '回复',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='在线客服';

/*Data for the table `chat` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `commentor` varchar(255) DEFAULT NULL COMMENT '评论者',
  `date` timestamp NULL DEFAULT NULL COMMENT '评论日期',
  `commentHeader` varchar(255) DEFAULT NULL COMMENT '评论者头像',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `pid` varchar(255) DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `comment` */

insert  into `comment`(`id`,`commentor`,`date`,`commentHeader`,`content`,`pid`) values (13,'admin','2018-12-13 10:40:06','userPhoto/208367.jpg','好实用的手机','1'),(14,'Mickey','2018-12-13 10:41:07','userPhoto/213123.jpg','放屁！垃圾的要死！没用到几个月就坏了','1'),(15,'Baby宝贝','2018-12-13 10:43:58','userPhoto/201193.jpg','看到你们这样评论，我都不敢买了','1'),(16,'aa','2023-02-09 15:18:46','userPhoto/','不错','FE0A140808CA4A6DBC50677054CEE5E7');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='最新公告';

/*Data for the table `news` */

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  KEY `order_item_fk_0001` (`pid`) USING BTREE,
  KEY `order_item_fk_0002` (`oid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `orderitem` */

insert  into `orderitem`(`itemid`,`quantity`,`total`,`pid`,`oid`) values ('0574D685867F4A27B0D1A4ACF1981D0F',1,38,'15036EEBA78740A4AF2FC17EB81E6ED2','3F9755AAC8024AFAA394614DAFB44BCE'),('0FE7811501FB45128279789664691826',1,0,'C46C2A5D688149478C12ADC5CDBBBFF8','C87046FEB96D4635A906DACA08901D9F'),('12D155EDC1444F3D930BB4DBE34CB54E',1,312,'2EFBAC6CE6E34BEE9DA35FD169442487','8503A54177FB434091AC5A8822E14FF5'),('1D3BE1A258FD44CDA1B87E21C861756C',1,2599,'10','E7D258B86B2F48F29B980F0C3B41F08C'),('2606A4E3AFC6479B9C6C169629DEEE4F',1,98,'07F419B724864AF8814BF359DD5802AF','296B4A4C76454907B5DEC60A1AFFF41E'),('32A3B45E3AAE45D5BEBCD53BE7D0161F',1,1299,'1','AE8550B3354540E0BA16342632072F11'),('33F6A317A2E34388A9F883AAEB471C8F',1,6,'98E7F117CBA4408294DC516946F67653','ED574FCE46794A09A727E0A3695AB84B'),('3BB88F6CEB6946F29BE93B5564D00097',2,5198,'10','ED574FCE46794A09A727E0A3695AB84B'),('5615D5DB0A7A42F08F0B42A901FE20E6',1,6688,'32','C5498CB2268F434D9ABF841147E6DF0A'),('5824D4BA26784D4D98CE88B49BC9BE50',1,2599,'10','83D3751CFE1D434FBE4AE84A521ED3F9'),('5D720AC6236D41CD8EE6EA07660B5EDF',1,38,'15036EEBA78740A4AF2FC17EB81E6ED2','DB1D12D5FBAF451DAF9503ECF864B99F'),('6AD2B61863344B078DA6B6278E9471F7',1,1299,'1','6EB69698B10248B1B90E2AF9D2CCAD2B'),('795F63B1F95848C5AA8A4715238CB6BD',4,18,'0CF61FDB8965411F87E028796D0DF064','DCF1EACCC40145BF956265ADB4A29C73'),('7D2E177B4251452391672406D2D8063E',1,312,'2EFBAC6CE6E34BEE9DA35FD169442487','DCF1EACCC40145BF956265ADB4A29C73'),('870CDC36FD0047A28B69054AA53297E0',1,2599,'10','C5498CB2268F434D9ABF841147E6DF0A'),('8C007D76CAB04FF49E4DE472A89C6F15',1,38,'15036EEBA78740A4AF2FC17EB81E6ED2','B07A82CE52074034868F4E214523BBEA'),('9649AE799CCD482E981728619CA242FF',1,4.5,'0CF61FDB8965411F87E028796D0DF064','B75EB9794343412692AB82684DAFF7B0'),('A1A3B705ADF349C2A4DDF0A623F87878',1,4199,'33','1959994A423E4075A2BF38B7D0B18D0D'),('A828879871574F2EA0209A4F31A104BE',1,98,'7B6DABE5E76D45DF88E0ADAE5E425935','4A72A049BF0B4012A99F7633A8AD09EA'),('AB196CCF8DC84BF9AE206A63D607CA11',1,98,'56682DF711204C1BB23177F075CECA4B','11196E090EA744F6BD3F3A99D45DD16B'),('B12185FE5A234F3C8E028BAEA2D8BC07',1,98,'07F419B724864AF8814BF359DD5802AF','39DAB849D90543489DAF56345D9D6A15'),('B43B36CB45E847AABEC69F8BD43FF967',2,76,'15036EEBA78740A4AF2FC17EB81E6ED2','51BB52E315564921BAABC2358F6B410B'),('BA80DC9C557C4405BF7C404E594B4084',1,4.5,'0CF61FDB8965411F87E028796D0DF064','C13F1C7102544D82BC630684FD091310'),('BE6375E82C2644E3948F0E1C23561595',1,1699,'23','C13F1C7102544D82BC630684FD091310'),('C706A85C199B4BC5A74006151E8C57A1',2,76,'15036EEBA78740A4AF2FC17EB81E6ED2','A679C517455D4B3CADAD1927190F00A9'),('CEA04BEC6EB74E699FB4330DB6998E66',1,2299,'31','AD2000300498407096A35A53CFFD5B5D'),('D220C55D9743474DB295CF3801530B06',1,2499,'13','C13F1C7102544D82BC630684FD091310'),('D98491D360BF48D4BE5F6D9F95F4766C',1,4199,'33','A75EB1FDEC914210A7D8F8997F4C456D'),('DB1BF74DFC624C0182725609CB0AC33B',1,1299,'1','E12AD7C2F2BF4B00B28EE2B4940B64A7'),('F4DA68C122D54FACA23ECE06FF421E74',1,38,'15036EEBA78740A4AF2FC17EB81E6ED2','14C33069A56345F3AAD410FA474FA578'),('F563E2694A0747DF9C2D8F50E1A9C4EB',1,2299,'31','ACE41D2A5F2048DC952B0817B2AED1BA'),('FF6A175CDDE944C1A66AE33981B90FB3',1,2299,'31','CA421A5F7E4A4521B8612CCEA6EB571B');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `order_fk_0001` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `orders` */

insert  into `orders`(`oid`,`ordertime`,`total`,`state`,`address`,`name`,`telephone`,`uid`) values ('11196E090EA744F6BD3F3A99D45DD16B','2023-04-16 23:52:11',98,1,NULL,NULL,NULL,'947479CFA8DE4929A8337698A6B40015'),('4A72A049BF0B4012A99F7633A8AD09EA','2023-04-05 14:50:52',98,2,'中国','aa','18888888888','7C679558B3A549858C4581DD58103CF2'),('C87046FEB96D4635A906DACA08901D9F','2023-04-08 12:20:50',0,2,'','','','7C679558B3A549858C4581DD58103CF2');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `marketPrice` double DEFAULT NULL,
  `shopPrice` double DEFAULT NULL,
  `pimage` varchar(200) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `isHot` int(11) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `pflag` int(11) DEFAULT '0',
  `cid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  KEY `product_fk_0001` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `product` */

insert  into `product`(`pid`,`pname`,`marketPrice`,`shopPrice`,`pimage`,`pdate`,`isHot`,`pdesc`,`pflag`,`cid`) values ('2EDE918D017D4E06947717869ABBF52C','服装',100,98,'http://124.223.118.34:8080/Clothingstore/image/products/1680926514333.jpeg','2023-04-08',1,'',0,'1'),('330AB116CAD34EA0905DEE8D5336E866','服装',100,98,'http://124.223.118.34:8080/Clothingstore/image/products/1680926471804.jpeg','2023-04-08',1,'',0,'1'),('439EE8E6CA4A42DC80023121682B9332','服装',100,98,'http://124.223.118.34:8080/Clothingstore/image/products/1680926390956.jpg','2023-04-08',1,'',0,'1'),('56682DF711204C1BB23177F075CECA4B','服装',100,98,'http://124.223.118.34:8080/Clothingstore/image/products/1680926500833.jpg','2023-04-08',1,'',0,'1'),('5D7EA6A0C2D241949FAF454255196A27','服装',100,98,'http://124.223.118.34:8080/Clothingstore/image/products/1680926439132.jpeg','2023-04-08',1,'',0,'1'),('9B3B59D7D0374ACBABACA14A8A21CCC5','服装',100,98,'http://124.223.118.34:8080/Clothingstore/image/products/1680926457023.jpg','2023-04-08',1,'',0,'1'),('B83F64913B504519970DE2D9918D9161','服装',100,98,'http://124.223.118.34:8080/Clothingstore/image/products/1680926401753.jpg','2023-04-08',1,'',0,'1'),('C46C2A5D688149478C12ADC5CDBBBFF8','服装',100,0,'http://124.223.118.34:8080/Clothingstore/image/products/1680926426101.jpg','2023-04-08',1,'',0,'1'),('DA35144795584B43AE2F3B4A35C3F1AE','服装',100,98,'http://124.223.118.34:8080/Clothingstore/image/products/1680926414767.jpeg','2023-04-08',1,'',0,'1');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `replyer` varchar(255) DEFAULT NULL COMMENT '回复人',
  `date` timestamp NULL DEFAULT NULL COMMENT '回复日期',
  `replyHeader` varchar(255) DEFAULT NULL COMMENT '回复者头像',
  `content` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `reply_for` varchar(255) DEFAULT NULL COMMENT '被回复的人',
  `comment_id` int(11) DEFAULT NULL COMMENT '回复评论的id',
  `reply_id` int(11) DEFAULT NULL COMMENT '回复回复的id',
  `pid` varchar(255) DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `reply` */

insert  into `reply`(`id`,`replyer`,`date`,`replyHeader`,`content`,`reply_for`,`comment_id`,`reply_id`,`pid`) values (9,'admin','2022-12-13 10:41:33','userPhoto/208367.jpg','没有吧，我都用一年了','wang',14,NULL,'1'),(10,'Mickey','2022-12-13 10:44:42','userPhoto/213123.jpg','真的很垃圾，千万别买','zeng',15,NULL,'1'),(11,'Baby宝贝','2022-12-13 10:47:50','userPhoto/201193.jpg','好吧，果断不买','zeng',15,10,'1');

/*Table structure for table `storeup` */

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  `type` varchar(200) DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `storeup` */

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源编号',
  `name` varchar(32) NOT NULL COMMENT '资源名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `url` varchar(128) DEFAULT NULL COMMENT 'URL',
  `perms` varchar(128) DEFAULT NULL COMMENT '权限标识',
  `type` varchar(16) NOT NULL COMMENT '类型：button、menu',
  `icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `priority` bigint(20) DEFAULT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0锁定 1有效',
  `description` varchar(128) DEFAULT NULL COMMENT '描述',
  `code` varchar(128) NOT NULL COMMENT '菜单编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8 COMMENT='资源表';

/*Data for the table `t_menu` */

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0锁定 1有效',
  `role_type` tinyint(1) DEFAULT '2' COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `t_role` */

/*Table structure for table `t_role_menu` */

DROP TABLE IF EXISTS `t_role_menu`;

CREATE TABLE `t_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单/按钮ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源关联表';

/*Data for the table `t_role_menu` */

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

/*Data for the table `t_user_role` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `state` int(11) DEFAULT '0',
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`name`,`email`,`telephone`,`birthday`,`sex`,`photo`,`state`,`code`) values ('947479CFA8DE4929A8337698A6B40015','fxp','123','游客','fsmtp@sina.com','18888888888','2023-04-16','男','http://localhost:8080/Clothingstore/image/userPhoto/1681660316418.jpeg',1,'97DA9C41A784412F808E910A97E719CF');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
