/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - mygenekey
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mygenekey` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mygenekey`;

/*Table structure for table `adminuser` */

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `adminuser` */

insert  into `adminuser`(`uid`,`username`,`password`) values (2,'admin','admin');

/*Table structure for table `barcode` */

DROP TABLE IF EXISTS `barcode`;

CREATE TABLE `barcode` (
  `bcid` int(11) NOT NULL AUTO_INCREMENT,
  `bar_code` varchar(50) DEFAULT NULL COMMENT '要确定好格式',
  `status` int(11) DEFAULT '0' COMMENT '0 未激活;1 已激活 ',
  `uid` int(11) DEFAULT NULL COMMENT '关联使用用户',
  PRIMARY KEY (`bcid`),
  KEY `FK_user-barcode` (`uid`),
  CONSTRAINT `FK_user-barcode` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `barcode` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cid`,`cname`) values (1,'美容系列');

/*Table structure for table `categorysecond` */

DROP TABLE IF EXISTS `categorysecond`;

CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF21DB1FD15` (`cid`),
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `categorysecond` */

insert  into `categorysecond`(`csid`,`csname`,`cid`) values (1,'美容系列',1);

/*Table structure for table `logisticscompany` */

DROP TABLE IF EXISTS `logisticscompany`;

CREATE TABLE `logisticscompany` (
  `lcid` int(11) NOT NULL AUTO_INCREMENT,
  `logistic_name` varchar(50) DEFAULT NULL COMMENT '物流公司名称',
  PRIMARY KEY (`lcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `logisticscompany` */

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `bcid` int(11) DEFAULT NULL COMMENT '生产订单时，生成一个条形码',
  PRIMARY KEY (`itemid`),
  KEY `FKE8B2AB6166C01961` (`oid`),
  KEY `FKE8B2AB6171DB7AE4` (`pid`),
  KEY `FKE8B2AB6140ACF87A` (`oid`),
  KEY `FK_barcode_orderitem` (`bcid`),
  CONSTRAINT `FK_barcode_orderitem` FOREIGN KEY (`bcid`) REFERENCES `barcode` (`bcid`),
  CONSTRAINT `FKE8B2AB6140ACF87A` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FKE8B2AB6171DB7AE4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL COMMENT '订单生产时间',
  `state` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `accept_time` datetime DEFAULT NULL COMMENT '订单接受时间',
  `refuse_time` datetime DEFAULT NULL COMMENT '订单拒绝时间',
  `end_time` datetime DEFAULT NULL COMMENT '订单结束时间',
  `supply_time` datetime DEFAULT NULL COMMENT '发货时订单间',
  `back_time` datetime DEFAULT NULL COMMENT '订单退货时间',
  `balance` int(11) DEFAULT NULL COMMENT '付款情况',
  `payment_type` int(11) DEFAULT NULL COMMENT '付款方式',
  `account_number` varchar(50) DEFAULT NULL COMMENT '转账流水号（唯一），防止退款用',
  `pay_time` datetime DEFAULT NULL COMMENT '订单付款时间',
  `lcid` int(11) DEFAULT NULL COMMENT '物流公司',
  `waybill_numer` varchar(50) DEFAULT NULL COMMENT '运单编号',
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E5AA3D9C7` (`uid`),
  KEY `FK_logisticscompany_orders` (`lcid`),
  CONSTRAINT `FK_logisticscompany_orders` FOREIGN KEY (`lcid`) REFERENCES `logisticscompany` (`lcid`),
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9004 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEFB9B74E02` (`csid`),
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

/*Table structure for table `salivabox` */

DROP TABLE IF EXISTS `salivabox`;

CREATE TABLE `salivabox` (
  `sbid` int(11) NOT NULL AUTO_INCREMENT,
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `bcid` int(11) DEFAULT NULL COMMENT '条形码',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `dna_accredit` int(11) DEFAULT '0' COMMENT '0 不允许 1允许',
  `uid` int(11) DEFAULT NULL COMMENT '使用的用户',
  PRIMARY KEY (`sbid`),
  KEY `FK_user_salivabox` (`uid`),
  KEY `FK_barcode_salivabox` (`bcid`),
  CONSTRAINT `FK_barcode_salivabox` FOREIGN KEY (`bcid`) REFERENCES `barcode` (`bcid`),
  CONSTRAINT `FK_user_salivabox` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `salivabox` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`name`,`email`,`phone`,`addr`,`state`,`code`) values (7,'aaa','aaa','姜涛','aaa@shop.com','15726607618','北京市西三旗中腾建华3楼',1,NULL),(8,'bbb','bbb','张三','bbb@shop.com','18726607618','北京市西三旗中腾建华3楼',1,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
