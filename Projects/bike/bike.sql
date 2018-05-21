/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.22-community-nt : Database - db_bike
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_bike` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `db_bike`;

/*Table structure for table `tsys_menu` */

DROP TABLE IF EXISTS `tsys_menu`;

CREATE TABLE `tsys_menu` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) collate utf8_bin NOT NULL,
  `url` varchar(512) collate utf8_bin default NULL,
  `icon` varchar(512) collate utf8_bin default NULL,
  `parentid` int(11) default NULL,
  `order` int(11) NOT NULL,
  `remark` varchar(128) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tsys_menu` */

/*Table structure for table `tsys_menurole` */

DROP TABLE IF EXISTS `tsys_menurole`;

CREATE TABLE `tsys_menurole` (
  `id` int(11) NOT NULL auto_increment,
  `menuid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `remark` varchar(128) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tsys_menurole` */

/*Table structure for table `tsys_role` */

DROP TABLE IF EXISTS `tsys_role`;

CREATE TABLE `tsys_role` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(32) collate utf8_bin NOT NULL,
  `name` varchar(64) collate utf8_bin NOT NULL,
  `userid` int(11) default NULL,
  `remark` varchar(128) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tsys_role` */

/*Table structure for table `tsys_user` */

DROP TABLE IF EXISTS `tsys_user`;

CREATE TABLE `tsys_user` (
  `id` int(11) NOT NULL auto_increment,
  `usercode` varchar(32) collate utf8_bin NOT NULL,
  `nickname` varchar(32) collate utf8_bin NOT NULL default '',
  `password` varchar(64) collate utf8_bin NOT NULL,
  `email` varchar(64) collate utf8_bin default NULL,
  `phone` varchar(11) collate utf8_bin default NULL,
  `qqacc` varchar(32) collate utf8_bin default NULL,
  `sinaac` varchar(32) collate utf8_bin default NULL,
  `wechatacc` varchar(32) collate utf8_bin default NULL,
  `remark` varchar(128) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tsys_user` */

/*Table structure for table `tsys_userrole` */

DROP TABLE IF EXISTS `tsys_userrole`;

CREATE TABLE `tsys_userrole` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `remark` varchar(128) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tsys_userrole` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
