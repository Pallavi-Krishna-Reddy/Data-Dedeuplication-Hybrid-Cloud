/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.6.10 : Database - hybrid_cloud
*********************************************************************
Server version : 5.6.10
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `hybrid_cloud`;

USE `hybrid_cloud`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `_fingerprint` */

DROP TABLE IF EXISTS `_fingerprint`;

CREATE TABLE `_fingerprint` (
  `_fingerprint` varchar(99) DEFAULT NULL,
  `_email` varchar(99) NOT NULL,
  `file_name` varchar(99) DEFAULT NULL,
  `file_id` int(11) NOT NULL,
  `_key` varchar(99) DEFAULT NULL,
  `startPos` int(11) DEFAULT NULL,
  `endPos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `_fingerprint` */

insert  into `_fingerprint`(`_fingerprint`,`_email`,`file_name`,`file_id`,`_key`,`startPos`,`endPos`) values ('b9352f2565260219db72fc1fc896113a26c85866b69c50d3970c4d9f5cce830a','ravi@gmail.com','Tulips.jpg',202,'gN4fj7Ajrp/JFrtMkye/2Q==',178,621066),('b9352f2565260219db72fc1fc896113a26c85866b69c50d3970c4d9f5cce830a','sachinthe@gmail.com','Tulips.jpg',201,'eWY8DcoIYCJF7xWhmoorQA==',178,621066),('b9352f2565260219db72fc1fc896113a26c85866b69c50d3970c4d9f5cce830a','sridhar@gmail.com','Tulips.jpg',202,'gN4fj7Ajrp/JFrtMkye/2Q==',178,621066);

/*Table structure for table `_user` */

DROP TABLE IF EXISTS `_user`;

CREATE TABLE `_user` (
  `_name` varchar(99) DEFAULT NULL,
  `_email` varchar(99) NOT NULL,
  `_pwd` varchar(40) DEFAULT NULL,
  `_sex` varchar(6) DEFAULT NULL,
  `_phone` varchar(10) NOT NULL,
  PRIMARY KEY (`_email`,`_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `_user` */

insert  into `_user`(`_name`,`_email`,`_pwd`,`_sex`,`_phone`) values ('Ravi Kr','ravi@gmail.com','202CB962AC59075B964B07152D234B70','Male','8123952262'),('Sachin','sachinthe@gmail.com','15285722F9DEF45C091725AEE9C387CB','Male','8123952261'),('sridhar','sridhar@gmail.com','202CB962AC59075B964B07152D234B70','Male','542312542');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` varchar(90) NOT NULL,
  `admin_pwd` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`admin_pwd`) values ('admin','21232F297A57A5A743894A0E4A801FC3');

/*Table structure for table `csp` */

DROP TABLE IF EXISTS `csp`;

CREATE TABLE `csp` (
  `csp` varchar(90) NOT NULL,
  `csp_ip` varchar(20) NOT NULL,
  `csp_port` varchar(10) NOT NULL,
  PRIMARY KEY (`csp`,`csp_ip`,`csp_port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `csp` */

insert  into `csp`(`csp`,`csp_ip`,`csp_port`) values ('private_cloud','localhost','8080'),('public_cloud','localhost','8080');

/*Table structure for table `share_data` */

DROP TABLE IF EXISTS `share_data`;

CREATE TABLE `share_data` (
  `to_email` varchar(90) DEFAULT NULL,
  `from_email` varchar(90) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `_status` varchar(10) DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `share_data` */

insert  into `share_data`(`to_email`,`from_email`,`file_id`,`_status`) values ('ravi@gmail.com','sridhar@gmail.com',202,'Approved');

/*Table structure for table `users_files` */

DROP TABLE IF EXISTS `users_files`;

CREATE TABLE `users_files` (
  `email` varchar(90) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_files` */

insert  into `users_files`(`email`,`file_id`) values ('sachinthe@gmail.com',201),('ravi@gmail.com',202),('sridhar@gmail.com',202);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
