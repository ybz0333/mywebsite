/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16 : Database - mywebsite
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`mywebsite` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mywebsite`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(30) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(20000) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `click_count` int(11) DEFAULT '0',
  `praise_count` int(11) DEFAULT '0',
  `tags` varchar(80) DEFAULT NULL,
  `introduction` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`author_name`,`title`,`content`,`createtime`,`note`,`state`,`click_count`,`praise_count`,`tags`,`introduction`) values (11,'test','test','test',NULL,'test',1,0,0,NULL,NULL),(12,'test','test','test','2016-02-02 17:20:36','test',2,1,0,NULL,NULL),(15,'test','test','test',NULL,'test',1,0,0,NULL,NULL),(18,'test','testFromEditor','<p><strong>test from editor</strong></p><p><strong><img src=\"/try_springmvc_mybatis_20160110/ueditor/jsp/upload/image/20160124/1453642947577078521.png\" title=\"1453642947577078521.png\" alt=\"æ?¹è¯»è·¯å¾?è¦?å? ä¸?å?¥.png\"/></strong></p>',NULL,'test from editor',2,4,1,NULL,NULL),(21,'','testAddNewArticle','<p><span style=\"color: rgb(31, 73, 125);\"><strong>testAddNewArticle</strong></span></p>',NULL,'testAddNewArticle',2,1,0,NULL,NULL),(26,'test','testDelete','<p>testtest<br/></p>',NULL,'test',2,0,0,'testTag1,testTag2,testTag3',NULL),(27,'test','testDelete',NULL,'2016-01-01 12:12:12','test',2,12,6,'Tag1,testTag2,testTag3',''),(28,'test','testDelete','????','2016-02-02 17:16:50','test',2,4,2,'','testIntroduction'),(29,'test','testDelete',NULL,NULL,'test',1,9,5,NULL,NULL),(30,'test','testDelete','<p>????<br/></p>','2016-02-02 17:20:36','test',1,3,1,'','');

/*Table structure for table `article_type` */

DROP TABLE IF EXISTS `article_type`;

CREATE TABLE `article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `article_type` */

insert  into `article_type`(`id`,`type_name`,`description`) values (1,'testType','test3'),(2,'testUpdateType','none'),(8,'AddNewArticle1','none'),(9,'AddNewArticle2','none'),(10,'test1Add1','none'),(11,'testAdd2','none'),(12,'test','none'),(15,'??2','??2'),(16,'??3','??'),(17,'??4','??'),(19,'中文','中文'),(20,'中文测试2','none');

/*Table structure for table `rel_article_article_type` */

DROP TABLE IF EXISTS `rel_article_article_type`;

CREATE TABLE `rel_article_article_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `article_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

/*Data for the table `rel_article_article_type` */

insert  into `rel_article_article_type`(`id`,`article_id`,`article_type_id`) values (11,11,2),(12,12,2),(16,18,1),(24,21,1),(100,29,1),(101,26,1),(111,27,1),(112,28,1),(113,30,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`) values (1,'test','test');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
