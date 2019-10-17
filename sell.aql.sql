/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17 : Database - sell
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sell` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `sell`;

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `detail_id` varchar(32) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `product_id` varchar(32) NOT NULL,
  `product_name` varchar(64) NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '当前价格,单位分',
  `product_quantity` int(11) NOT NULL COMMENT '数量',
  `product_icon` varchar(512) DEFAULT NULL COMMENT '小图',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`detail_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `order_detail` */

LOCK TABLES `order_detail` WRITE;

insert  into `order_detail`(`detail_id`,`order_id`,`product_id`,`product_name`,`product_price`,`product_quantity`,`product_icon`,`create_time`,`update_time`) values ('12312313','88888','123456','皮蛋粥','2.20',2,'333','2019-07-31 01:59:15','2019-07-31 01:59:15'),('1234567810','1234567','123456','皮蛋粥','2.20',3,'http://xxxx.jpg','2019-07-29 01:51:21','2019-07-31 01:52:43'),('123456888','1234567','123457','皮皮虾','2.20',3,'http://xxxx.jpg','2019-07-29 01:52:05','2019-07-31 01:53:14'),('1564369661171472489','1564369661091855559','123456','皮蛋粥','3.20',1,'https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=2f1e01fbb74543a9f51bfdca262cedbf/b8389b504fc2d56219320fe2e71190ef76c66c83.jpg','2019-07-29 03:07:39','2019-07-29 03:07:39'),('1564369661195314734','1564369661091855559','123457','皮皮虾','3.20',2,'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564333515298&di=c3119b109c798d158ec5b601ebcec7ca&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fxian%2Fpics%2Fhv1%2F238%2F54%2F2221%2F144434533.jpg','2019-07-29 03:07:39','2019-07-29 03:07:39'),('1564370304216292565','1564370304137572846','123459','芬达','2.50',3,'https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=738133a34090f60304b09b410129d426/91ef76c6a7efce1b64157758a551f3deb48f6562.jpg','2019-07-29 03:18:22','2019-07-29 03:18:22'),('1564370304238894893','1564370304137572846','123459','芬达','2.50',2,'https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=738133a34090f60304b09b410129d426/91ef76c6a7efce1b64157758a551f3deb48f6562.jpg','2019-07-29 03:18:22','2019-07-29 03:18:22'),('1564453128696902031','1564453128680719702','11111','香蕉','1.00',2,'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564333482391&di=eb1ed9dcf422861128b2a172d7c36ea2&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FNpLUqibYVWmXWqf3Ek7x9ojkacOBkRdrckp16YGIZA2licDIiaVt0tp7icDpHHiaibcjJAFVlJ2Lqm5dptibqnpyRQ28g%2F640%3Fwx_fmt%3Djpeg','2019-07-30 02:18:46','2019-07-30 02:18:46');

UNLOCK TABLES;

/*Table structure for table `order_master` */

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `order_id` varchar(32) NOT NULL,
  `buyer_name` varchar(32) NOT NULL COMMENT '买家名字',
  `buyer_phone` varchar(32) NOT NULL COMMENT '买家电话',
  `buyer_address` varchar(128) NOT NULL COMMENT '买家地址',
  `buyer_openid` varchar(64) NOT NULL COMMENT '买家微信openid',
  `order_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态, 默认为新下单',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态, 默认未支付',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `idx_buyer_openid` (`buyer_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `order_master` */

LOCK TABLES `order_master` WRITE;

insert  into `order_master`(`order_id`,`buyer_name`,`buyer_phone`,`buyer_address`,`buyer_openid`,`order_amount`,`order_status`,`pay_status`,`create_time`,`update_time`) values ('1234567','师兄','123456789123','幕课网','110110','13.20',2,0,'2019-07-29 01:35:11','2019-07-31 02:39:05'),('1564369661091855559','廖师兄','123456789012','幕课网','1101110','9.60',1,0,'2019-07-29 03:07:39','2019-07-31 02:19:54'),('1564370304137572846','小李','123456789012','三峡大学','1101110','12.50',1,0,'2019-07-29 03:18:22','2019-07-31 06:48:59'),('1564453128680719702','张三','18868822111','慕课网总部','ew3euwhd7sjw9diwkq','2.00',2,0,'2019-07-30 02:18:47','2019-07-31 01:57:34'),('88888','小珂','123456789123','欣苑3栋414','110110','20.00',2,0,'2019-07-29 01:36:56','2019-07-31 01:59:23');

UNLOCK TABLES;

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL COMMENT '类目名字',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_category` */

LOCK TABLES `product_category` WRITE;

insert  into `product_category`(`category_id`,`category_name`,`category_type`,`create_time`,`update_time`) values (1,'女神最爱',1,'2019-07-26 02:56:23','2019-07-26 02:56:23'),(2,'男神最爱',3,'2019-07-26 03:26:22','2019-07-26 03:26:22'),(3,'清凉饮品',2,'2019-07-28 14:24:59','2019-07-28 14:24:59'),(4,'鱼',4,'2019-07-29 09:18:40','2019-07-29 09:27:19'),(5,'奶茶',5,'2019-07-29 09:20:06','2019-07-29 14:12:05');

UNLOCK TABLES;

/*Table structure for table `product_info` */

DROP TABLE IF EXISTS `product_info`;

CREATE TABLE `product_info` (
  `product_id` varchar(32) NOT NULL,
  `product_name` varchar(64) NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '单价',
  `product_stock` int(11) NOT NULL COMMENT '库存',
  `product_description` varchar(64) DEFAULT NULL COMMENT '描述',
  `product_icon` varchar(512) DEFAULT NULL COMMENT '小图',
  `product_status` tinyint(3) DEFAULT '0' COMMENT '商品状态,0正常1下架',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `product_numb1` int(32) DEFAULT NULL COMMENT '商品数量',
  `product_thumb` varchar(32) DEFAULT NULL COMMENT 'thumb',
  `product_sales` int(11) DEFAULT NULL COMMENT '销售量',
  `product_unit` varchar(32) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_info` */

LOCK TABLES `product_info` WRITE;

insert  into `product_info`(`product_id`,`product_name`,`product_price`,`product_stock`,`product_description`,`product_icon`,`product_status`,`category_type`,`create_time`,`update_time`,`product_numb1`,`product_thumb`,`product_sales`,`product_unit`) values ('11111','香蕉','3.00',122,'饭后消食','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564553713874&di=79379ec06944958d05894a3a73f7ae7a&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20181125%2F891719_20181125231320360144_1.jpg',1,3,'2019-07-28 08:00:53','2019-07-31 06:58:46',0,NULL,0,NULL),('123455','可乐','3.00',100,'肥仔快乐水','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564336686339&di=a747d5653f8a56616521e26ef23b9a61&imgtype=0&src=http%3A%2F%2Fp0.meituan.net%2Fdeal%2F__32264180__5216929.jpg',0,1,'2019-07-26 08:48:35','2019-07-29 14:11:43',0,NULL,0,NULL),('123456','皮蛋粥','3.20',115,'很好喝的粥','https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=2f1e01fbb74543a9f51bfdca262cedbf/b8389b504fc2d56219320fe2e71190ef76c66c83.jpg',0,1,'2019-07-28 10:16:10','2019-07-31 06:15:08',0,NULL,0,NULL),('123457','皮皮虾','3.20',114,'很好吃的虾','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564333515298&di=c3119b109c798d158ec5b601ebcec7ca&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fxian%2Fpics%2Fhv1%2F238%2F54%2F2221%2F144434533.jpg',0,3,'2019-07-28 10:16:11','2019-07-31 02:39:05',0,NULL,0,NULL),('123459','芬达','2.50',115,'达达','https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=738133a34090f60304b09b410129d426/91ef76c6a7efce1b64157758a551f3deb48f6562.jpg',0,1,'2019-07-26 08:49:51','2019-07-30 14:17:45',0,NULL,0,NULL),('1564555010994852841','测试','8.00',8,'','',0,4,'2019-07-31 06:36:48','2019-07-31 06:43:43',0,NULL,0,NULL),('1564555296139976375','测试11','22.00',33,'44','',0,4,'2019-07-31 06:41:34','2019-07-31 06:42:25',0,NULL,0,NULL),('1564555393841578899','测试22','33.00',44,'55','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564566053895&di=37822ed6ee12d06f1f827df2a3204bf7&imgtype=0&src=http%3A%2F%2Fcp1.douguo.net%2Fupload%2Fcaiku%2F2%2Fd%2Fe%2Fyuan_2dab88cccfbbd80eed43ae998186afbe.jpg',0,1,'2019-07-31 06:43:11','2019-07-31 06:52:58',0,NULL,0,NULL),('1564555494722947187','测试33','44.00',55,'66','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564565564301&di=85dec6cf56fce5dc118b2bd412cadb59&imgtype=0&src=http%3A%2F%2Fimages.maishoudang.com%2Fproduction%2Fuploads%2Fueditor_image%2Fimage%2F217056%2F1526894768.png%2521large',0,2,'2019-07-31 06:44:52','2019-07-31 06:44:52',0,NULL,0,NULL),('22222','冰红茶','3.00',555,'清凉你的夏天','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564928743&di=3b3b971ec8da4c1f3e64e994802ab602&imgtype=jpg&er=1&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F17e73b31ed863b1747ccd600b8d0383d031a932623696-ogEoYM_fw658',0,2,'2019-07-28 14:25:56','2019-07-29 14:11:40',0,NULL,0,NULL),('44444','苹果','8.00',555,'苹果','https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=864871a238d3d539d53007915bee8235/c83d70cf3bc79f3db77eb56cb4a1cd11738b29ca.jpg',0,1,'2019-07-28 14:04:21','2019-07-29 14:11:39',0,NULL,0,NULL),('56535636','雪碧','3.00',44,'凉爽','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564419889289&di=ce8946e2020a71ed147ce38371972f17&imgtype=0&src=http%3A%2F%2Fimg.11665.com%2Fimg4_p3%2Fi1%2FTB1m2b1FVXXXXXcXXXXXXXXXXXX_.jpg',0,1,'2019-07-29 14:17:30','2019-07-29 14:17:30',0,NULL,6,NULL),('6666645','鱼香肉丝','11.00',33,'超级下饭','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565097287&di=b9a5f46190505f226be8d385806e2670&imgtype=jpg&er=1&src=http%3A%2F%2Fi2.chuimg.com%2Fcf3921a14e6644a3a1181a1d26845ab9_1024w_767h.jpg%3FimageView2%2F2%2Fw%2F660%2Finterlace%2F1%2Fq%2F90',0,4,'2019-07-30 13:15:12','2019-07-30 13:15:12',0,NULL,0,NULL),('6666666','珍珠奶茶','6.00',50,'超级好喝','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564419548522&di=59a574efecaf47093a41e4fc175bf8b0&imgtype=0&src=http%3A%2F%2Fp0.meituan.net%2Fshaitu%2F793b214300f7523598dbff1d9bac042415868.jpg',0,5,'2019-07-29 14:11:38','2019-07-29 14:11:38',0,NULL,0,NULL),('7777777','梨子','5.00',444,'润肺','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564553286804&di=dc3456e9d29100180e264124526a377d&imgtype=0&src=http%3A%2F%2Ftc.sinaimg.cn%2Fmaxwidth.2048%2Ftc.service.weibo.com%2Fp%2Fm_qpic_cn%2F974709ad48808e9cb0c697047234d12f.jpg',0,4,'2019-07-31 03:20:36','2019-07-31 03:20:36',0,NULL,0,NULL),('8888888','鲫鱼','28.00',20,'煲汤好喝','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564419773565&di=998e76b236f4a0305aed07f82ac8d96c&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20180622%2F2ff36bc3c8ec48c98479069f5d3c205b.jpeg',0,4,'2019-07-29 09:26:55','2019-07-29 14:15:10',0,NULL,0,NULL);

UNLOCK TABLES;

/*Table structure for table `seller_info` */

DROP TABLE IF EXISTS `seller_info`;

CREATE TABLE `seller_info` (
  `seller_id` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `openid` varchar(64) NOT NULL COMMENT '微信openid',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='卖家信息表';

/*Data for the table `seller_info` */

LOCK TABLES `seller_info` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
