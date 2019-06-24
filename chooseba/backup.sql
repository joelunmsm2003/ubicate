-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: choose
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity`
--

DROP TABLE IF EXISTS `amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `name_en` varchar(1000) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `caption` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `photo` (`photo`),
  CONSTRAINT `amenity_ibfk_1` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity`
--

LOCK TABLES `amenity` WRITE;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` VALUES (1,'Gimnasio','Gimnasio',NULL,'');
/*!40000 ALTER TABLE `amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity_hotel`
--

DROP TABLE IF EXISTS `amenity_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenity_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amenity` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `amenity` (`amenity`),
  KEY `hotel` (`hotel`),
  CONSTRAINT `amenity_hotel_ibfk_1` FOREIGN KEY (`amenity`) REFERENCES `amenity` (`id`),
  CONSTRAINT `amenity_hotel_ibfk_2` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity_hotel`
--

LOCK TABLES `amenity_hotel` WRITE;
/*!40000 ALTER TABLE `amenity_hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenity_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `type_user` int(100) DEFAULT NULL,
  `phone` int(100) DEFAULT NULL,
  `city` int(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `seller` int(100) DEFAULT NULL,
  `pais` varchar(1000) DEFAULT NULL,
  `permit_noti` int(11) DEFAULT NULL,
  `cuenta` int(11) DEFAULT NULL,
  `email_noti` varchar(1000) DEFAULT NULL,
  `number_zip` varchar(1000) DEFAULT NULL,
  `lan` varchar(1000) DEFAULT NULL,
  `card_holder_name` varchar(1000) DEFAULT NULL,
  `address_1` varchar(1000) DEFAULT NULL,
  `address_2` varchar(1000) DEFAULT NULL,
  `phone_extension` varchar(1000) DEFAULT NULL,
  `purchase_step` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `tipo` (`type_user`) USING BTREE,
  KEY `country` (`city`),
  KEY `photo` (`photo`),
  CONSTRAINT `auth_user_ibfk_1` FOREIGN KEY (`type_user`) REFERENCES `tipo` (`id`),
  CONSTRAINT `auth_user_ibfk_2` FOREIGN KEY (`city`) REFERENCES `city` (`id`),
  CONSTRAINT `auth_user_ibfk_3` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$TDU727idzUaF$72tTOdDelPLak7x7iJ3p/BnDLboJ0CpukQLcw4MDhD4=','2018-10-16 16:53:16',1,'admin','Admin','','admin@choosebookit',1,1,'2016-11-21 17:06:43',2,980729169,NULL,3,949494,NULL,NULL,NULL,NULL,NULL,'es',NULL,NULL,NULL,NULL,NULL),(2,'pbkdf2_sha256$24000$ISzK27tOwgwR$lmKsu6MkxmPgdtm98BbUrgiX18bHXBO9GXP2r8QqCvk=','2018-10-16 16:50:21',1,'root','','','',1,1,'2018-04-05 12:57:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'pbkdf2_sha256$24000$6EBqBbjfICNy$wP8yT7xjuJmtntXTF5QqEWkbBE94Tn5l11nhEjB2wSY=',NULL,0,'joel','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 18:46:46',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'pbkdf2_sha256$24000$tcXTdP5t7Onf$XffnCEU56Dsh62eeTqgBe83PjD8nFpVdFsL01zNAUuA=',NULL,0,'JOEL123','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 18:52:07',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'pbkdf2_sha256$24000$KZsETnwKljes$eSTU2DjtmrpnrvxN60ubVD8r3nS9PqmavxC1F+Nxs5E=',NULL,0,'prueba','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:00:34',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'pbkdf2_sha256$24000$GfmuMcXg0T3O$BCl1bO0nRSXg6cFAqxct7mFSYQnClQqQNyDJGJU0sxY=',NULL,0,'joel234','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:01:50',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'pbkdf2_sha256$24000$XQvYMmZk84wp$4tHemZOirmctlU+W3dVz1f34JkdASijTKi22kTxMI3E=',NULL,0,'joel2344','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:06:48',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'pbkdf2_sha256$24000$hHSjBeUa2Ztf$Nijs55IJJnRw2WMA5sC7D5u9hTs+LpmuIT6UPuXr05w=',NULL,0,'joel23445','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:09:21',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'pbkdf2_sha256$24000$1pLIYybb8D46$25NHRNLoTo8mIaO0hB42AlJkRC0ALu7Q8XP+mqa7qb4=',NULL,0,'joel234459','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:10:19',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'pbkdf2_sha256$24000$LY82KH7Ma2Ef$i+9mRqhE6dXZWSYsy8QeRVlojQVZTPNFFzpx2BGtsaI=',NULL,0,'joel23qqq44593','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:11:31',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'pbkdf2_sha256$24000$2aqMK9BR6G5M$9sCSe9FXyijeXKcCOcMlH0IeYMhiV4hGks+g8kdPHCo=',NULL,0,'12121','121','','joelunmms@gmail.com',0,1,'2018-04-07 04:20:20',1,212212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'pbkdf2_sha256$24000$DgaYodBRBiXo$BlHTSkmXePpucBojllmJL3gItqqFL1inDQrjlHPLV+k=',NULL,0,'1212166','121','','joelunmms@gmail.com',0,1,'2018-04-07 04:34:31',1,212212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'pbkdf2_sha256$24000$cBmxWnKGZaPo$8nIDWMQf5/e5yybghwYjcgxOe5VgFLDvRa7vqernXrE=',NULL,0,'12121668','121','','joelunmsm@gmail.com',0,1,'2018-04-07 04:40:08',1,212212,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'pbkdf2_sha256$24000$GXDcVIUZPRuE$sKFfxlkBTfJB/tDRYY2BfBJZzV8prejUudY0BVvuBqI=',NULL,0,'joelunmsm2003','Joel','','joelunmsm@gmail.com',0,1,'2018-06-17 17:56:58',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'pbkdf2_sha256$24000$J1VfvIgcKNnb$vxHLuJ/M3dbzeAjeEHa3Maa2HxXb7KFJBib9H0fC0EI=',NULL,0,'joelunmsm20031','Joel','','joelunmsm@gmail.com',0,1,'2018-06-17 18:02:43',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'pbkdf2_sha256$24000$K9V3AWvX7Mrr$jrfVmTUCabIv360q1cWF+uyzH7lSDqVamf5WitQw3WI=',NULL,0,'joelunmsm200389','Joel','','joelunmsm@gmail.com',0,1,'2018-06-17 18:05:44',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'pbkdf2_sha256$24000$TItbhkOHdeGN$NCjPP1tlJxCT+doPsplUxog87kWuR00M15ab/aNW2ng=',NULL,0,'212','212','','221@gmail.com',0,1,'2018-06-17 18:08:41',3,212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'pbkdf2_sha256$24000$fJWOuH5JZ8u7$UV/jYW+YmbielBcOrfSCmaXrsG0Yu0zz6S0zWrAWq6I=',NULL,0,'joel2','joel','','joelunmsm@gmail.com',0,1,'2018-06-19 00:16:18',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'pbkdf2_sha256$24000$GKsycCLVw95z$KsnAO5whUYrXXuRDOkMx8oeT5y5inw9F3NYFyzTzWDk=',NULL,0,'21222','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-06-19 00:20:31',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'pbkdf2_sha256$24000$Dm8HWjCGmmGp$j4G9ANim5BmP05EdbROsSRPINadEJPO53SX+RSIpz3c=',NULL,0,'2121','212','','212@gmail.com',0,1,'2018-06-19 02:47:25',3,1221212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'pbkdf2_sha256$24000$xOaSQNJhl3QD$GX57vKXQRxcCBU12XrihmfI0zuKD9PdDR43yGlz/8pY=',NULL,0,'21212121','121','','212121@gmail.com',0,1,'2018-06-19 02:49:12',3,21212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'pbkdf2_sha256$24000$vnL7IHPUX3e0$dEdo3WUPLq0Xpn/JfxvSVBk42obxp+yQKamyw5s5/wk=',NULL,0,'2121212','212','','21212ss@gmail.com',0,1,'2018-06-19 02:52:08',3,21212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'pbkdf2_sha256$24000$MNqcRH8w5o0Q$W/a6u8l2qXhz3GYdqVCS1DdEfKMCtX3JOgbc0lR0o3w=','2018-09-18 18:40:41',0,'323','Andy','Jo','joelunmsm@gmail.com',0,1,'2018-06-19 02:57:28',3,980729169,NULL,18,1,'',NULL,1,'','','','','','','',''),(38,'pbkdf2_sha256$24000$JtpqZa5wDmGV$ngRvA2FQyQ6pwt0FKGXzWlxhGwhWtWLg6Tx2+mlor5Y=',NULL,0,'2121222','221','','joelunmsm@gmail.com',0,1,'2018-06-19 03:04:27',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'pbkdf2_sha256$24000$rfWVhsN3XmsH$XYJugrTwxEY0m1NJo2CByRn2RvVZGYgNswcua3t6BhY=',NULL,0,'212122','212','','21aa212@gmail.com',0,1,'2018-06-19 03:12:24',3,21212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'pbkdf2_sha256$24000$LsNmbRYzVxZd$5YFuocezOYBc12et5grLUZ1G5HBjMTbWbCsm3r2N/uw=',NULL,0,'1221','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-06-19 03:15:17',3,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'es',NULL,NULL,NULL,NULL,NULL),(41,'pbkdf2_sha256$24000$WPqoyvPhcc7Q$kDy1kpAarv2pCDMzM0ue5AeLtIk67iDhv59HnQYnc8g=',NULL,0,'wwww','qwqw','','joelunmsm@gmail.com',0,1,'2018-06-19 05:23:26',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'pbkdf2_sha256$24000$ety1yNR40hig$qzDq4TxXQxLMQprVXw49kNApcu2w+UnEp2yno/TyMA8=',NULL,0,'teresa','Teresa','','joelunmsm@gmail.com',0,1,'2018-07-05 05:55:10',3,980729190,NULL,22,NULL,'Kenya',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'pbkdf2_sha256$24000$NEtnsUbzo0z5$W+wuYa4ssdGjZMVuJkfAT5sYLQuhp9hAhZNUST7EMmc=',NULL,0,'andyrosas','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-07-13 01:45:27',3,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'pbkdf2_sha256$24000$Qey08Yo2aiKL$WnV8iA9SPeVKNHQJqfKN4S+NIFaf+lOZGVrhjzFToHQ=',NULL,0,'andrescarlos','Andres Carlos','','joelunmsm@gmail.com',0,1,'2018-07-13 01:56:28',3,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'pbkdf2_sha256$24000$UGcj64U2H7D1$GaLBhcvjTQCc2tP0IJhw7IPoZm2HVQE1tZ2YaFrl46k=',NULL,0,'betorortiz','Beto Ortiz','','joelunmsm@gmail.com',0,1,'2018-07-13 02:09:23',3,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'pbkdf2_sha256$24000$Tp6512VzGecu$i/xfyeRocAw11INSVD5VYKbl4jzv992TiJ9V2QQxvB0=',NULL,0,'joelunmsm','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:27:14',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'pbkdf2_sha256$24000$JaWsSUSaJCa8$xmc+35x/Q0z0aB/XoHQ0meHs5ceQ9K8WqGhE8VHgbf4=',NULL,0,'joel2018','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:38:06',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'pbkdf2_sha256$24000$e1L76GjmEZgA$SGlJYhQDzdXKqloi/mJW2GS5qkZ066gejJKGFls0uOo=',NULL,0,'121213','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:47:34',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'pbkdf2_sha256$24000$p4ksFGFimZKD$LZTnp0oLULkLNfKuca+kycxI5O0prVmVFfbYj8DfhAA=',NULL,0,'decece','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:48:14',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'pbkdf2_sha256$24000$4GnmAs9caEc7$IuS0iYCE1MR+MRXN5Js8GEgzG+wioJ2v5KTkzoEGrCI=',NULL,0,'deded','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:49:32',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'pbkdf2_sha256$24000$U0HdmKYAVqVj$dL8Ql0TQhmy6iyk3jizTdK06zAXO4HqxiiXin9sMtnI=',NULL,0,'dedeccc','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:50:16',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'pbkdf2_sha256$24000$i79GH3xKGcdm$a0A9HFBYBNWZkwDryVjA8cC7oE1/yx3ULTbCcfn3Wpo=',NULL,0,'212121212','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:51:06',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'pbkdf2_sha256$24000$oehTn4CRSLJ3$HNs6unWI0a3JX9cr9DaUOA52UemLgNl/uFxn++CWK/Q=',NULL,0,'dsds','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:55:01',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'pbkdf2_sha256$24000$PbjGGtfPImQU$Vdzk0sT70eyQFz8xcQ0bcGUI2j0PyRE6we4VYDm+CE8=',NULL,0,'2121212121','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:56:10',1,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'pbkdf2_sha256$24000$FGU6JzNY3BpS$otrlr9AQiMafmeOdCrRXl5WCBGvrQxGQrYgkHsoJFB0=',NULL,0,'2121221','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:58:35',1,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,'212',NULL,'12121','212','212','212',NULL),(57,'pbkdf2_sha256$24000$O5JNIHMflUny$507pCrcftG2jtqktT2ehgaMXknV8FUUA6u36BJxTufw=',NULL,0,'21212212','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 20:59:58',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'pbkdf2_sha256$24000$4FHGxFc6bpgf$j2LWhNLb4RICpTNeVGFES3Il9U0NXK6vO7FSOQKBybA=',NULL,0,'papo','Papo','','deboheme@hotmail.com',0,1,'2018-08-08 19:12:00',3,987654321,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'pbkdf2_sha256$24000$bf9Huq8u0545$SSVAT9wQnS6VAlUPQsm3U0GCZ/FycCm0CX9ZgFsz/Kw=',NULL,0,'Andy Jo','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-13 15:39:27',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'pbkdf2_sha256$24000$h6fTjg9xvoSp$qIZKNMB4Ebavhot9zNo6xpkjZUT+o2bWh2QkxksSDxY=',NULL,0,'elenaunmsm2003','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 16:49:41',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'pbkdf2_sha256$24000$HDU1mzCKeUQU$pekp/mIwvRKepTmuJj8C5gBV+HYAacsjYR4oSry2iy0=',NULL,0,'eden','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 17:14:47',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'pbkdf2_sha256$24000$qF0ykS0tmR01$pW0cxyTE/LOKn7R1EjQyT5NldgHi5v7qehUErwexjKg=',NULL,0,'ytoow','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 17:42:44',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'pbkdf2_sha256$24000$rwtD0JwD37M5$p/qQ9Dr+gv1VXT9NJ9u5tigHHBshwxtQuRx0Ae89CWI=',NULL,0,'454','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 17:55:05',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'pbkdf2_sha256$24000$y9qDjUJOl0ZN$R4j8l5Mp33IAsLvQdxdF8AOl+aDoSDJDQIa+60dZO/A=',NULL,0,'3232','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:08:24',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'pbkdf2_sha256$24000$9i0X1d3gvBZe$EjW/JmD5gdKNXIcUcKrwVr6ZMecyBBlt7N1k6q5wW4w=',NULL,0,'213','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:11:31',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'pbkdf2_sha256$24000$nBRlPvxXFmhD$J8vTnpB0a2YPCdgxHXI71aVBaJ9HFt6VaqngW8Bjd+4=',NULL,0,'323op','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:12:21',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'pbkdf2_sha256$24000$fuUR3xMP8eHk$+BG0Ad6oP0kv8m9HRcUWhdMdZ8/uF0LnrReRB8Hi218=',NULL,0,'323opooo','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:12:26',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'pbkdf2_sha256$24000$wMGPV2Zf4yYp$rT5i2nMXamaK+90VAXE7b4heyCGhZQoPLyp0p7W9X5o=',NULL,0,'pppp','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:14:45',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'pbkdf2_sha256$24000$d83KGs5N92IY$rMx/0SdjCVtUwgADiLjJEtgfxzHDrlWIqsCAYnObmjg=',NULL,0,'6656','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:23:00',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'pbkdf2_sha256$24000$j9IfKX3CnfjT$F3OjuPsO5EcgSdwJnYuM5BYyfFJApEeJ5Tn5YCcLoLQ=',NULL,0,'ooo','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:28:41',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'pbkdf2_sha256$24000$5UYz6BM6Y06o$gIngqYgkMTbyK/tyTXR9fEYY/VMB3swCSUOqy4nJ6Bc=',NULL,0,'65656','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:29:32',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,'212',NULL,'212','21212','2121','212121',NULL),(75,'pbkdf2_sha256$24000$MXuzgPPWoEH9$K4zcAXkXZF4UHX3f8un8dR2meqQwz+bZYaMIXgYNfSw=',NULL,0,'dcav','Daniel','','',0,1,'2018-10-11 02:03:23',1,982591527,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choose_template`
--

DROP TABLE IF EXISTS `choose_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choose_template` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `hotel` int(100) DEFAULT NULL,
  `template` int(100) DEFAULT NULL,
  `precio` int(100) DEFAULT NULL,
  `extrasingle` tinyint(1) DEFAULT NULL,
  `doublesingle` tinyint(1) DEFAULT NULL,
  `max_occupancy` int(100) DEFAULT NULL,
  `adults` int(100) DEFAULT NULL,
  `childrens` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choose_template`
--

LOCK TABLES `choose_template` WRITE;
/*!40000 ALTER TABLE `choose_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `choose_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `region` int(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `thumbail` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region` (`region`),
  KEY `photo` (`photo`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`id`),
  CONSTRAINT `city_ibfk_2` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Huarmey',NULL,NULL,'img/cities/huarmey.jpg','Huarmey','img/cities/huarmey_thumbail.jpg'),(4,'Iquitos',NULL,NULL,'img/cities/iquitos.jpg','Iquitos','img/cities/iquitos_thumbail.jpg'),(5,'Bagua Grande',NULL,NULL,'img/cities/bagua.jpg','Bagua Grande','img/cities/bagua_thumbail.jpg'),(6,'Chachapoyas',NULL,NULL,'img/cities/chachapoyas.jpg','Chachapoyas','img/cities/chachapoyas_thumbail.jpg'),(7,'Bagua',NULL,NULL,'img/cities/bagua.jpg','Bagua','img/cities/bagua_thumbail.jpg'),(8,'Chimbote',NULL,NULL,'img/cities/chimbote.jpg','Chimbote','img/cities/chimbote_thumbail.jpg'),(9,'Huaraz',NULL,NULL,'img/cities/huaraz.jpg','Huaraz','img/cities/huaraz_thumbail.jpg'),(10,'Casma',NULL,NULL,'img/cities/casma.jpg','Casma','img/cities/casma_thumbail.jpg'),(11,'Abancay',NULL,NULL,'img/cities/abancay.jpg','Abancay','img/cities/abancay_thumbail.jpg'),(12,'Andahuaylas',NULL,NULL,'img/cities/andahuaylas.jpg','Andahuaylas','img/cities/andahuaylas_thumbail.jpg'),(13,'Lima',NULL,NULL,'img/cities/lima.jpg','Lima','img/cities/lima_thumbail.jpg'),(14,'Huacho',NULL,NULL,'img/cities/huacho.jpg','Huacho','img/cities/huacho_thumbail.jpg'),(15,'Huaral',NULL,NULL,'img/cities/huaral.jpg','Huaral','img/cities/huaral_thumbail.jpg'),(16,'Cañete',NULL,NULL,'img/cities/canete.jpg','Cañete','img/cities/canete_thumbail.jpg'),(17,'Barranca',NULL,NULL,'img/cities/barranca.jpg','Barranca','img/cities/barranca_thumbail.jpg'),(18,'Chancay',NULL,NULL,'img/cities/chancay.jpg','Chancay','img/cities/chancay_thumbail.jpg'),(19,'Paramonga',NULL,NULL,'img/cities/paramonga.jpg','Paramonga','img/cities/paramonga_thumbail.jpg'),(20,'Arequipa',NULL,NULL,'img/cities/arequipa.jpg','Arequipa','img/cities/arequipa_thumbail.jpg'),(21,'Mollendo',NULL,NULL,'img/cities/mollendo.jpg','Mollendo','img/cities/mollendo_thumbail.jpg'),(22,'Camana',NULL,NULL,'img/cities/camana.jpg','Camana','img/cities/camana_thumbail.jpg'),(24,'Yurimaguas',NULL,NULL,'img/cities/yurimaguas.jpg','Yurimaguas','img/cities/yurimaguas_thumbail.jpg'),(25,'Requena',NULL,NULL,'img/cities/requena.jpg','Requena','img/cities/requena_thumbail.jpg'),(26,'Ayacucho',NULL,NULL,'img/cities/ayacucho.jpg','Ayacucho','img/cities/ayacucho_thumbail.jpg'),(27,'Huanta',NULL,NULL,'img/cities/huanta.jpg','Huanta','img/cities/huanta_thumbail.jpg'),(28,'Puerto Maldonado',NULL,NULL,'img/cities/maldonado.jpg','Puerto Maldonado','img/cities/maldonado_thumbail.jpg'),(30,'Jaen',NULL,NULL,'img/cities/jaen.jpg','Jaen','img/cities/jaen_thumbail.jpg'),(31,'Chota',NULL,NULL,'img/cities/chota.jpg','Chota','img/cities/chota_thumbail.jpg'),(32,'Celendin',NULL,NULL,'img/cities/celendin.jpg','Celendin','img/cities/celendin_thumbail.jpg'),(33,'Moquegua',NULL,NULL,'img/cities/moquegua.jpg','Moquegua','img/cities/moquegua_thumbail.jpg'),(34,'Ilo',NULL,NULL,'img/cities/ilo.jpg','Ilo','img/cities/ilo_thumbail.jpg'),(35,'Callao',NULL,NULL,'img/cities/callao.jpg','Callao','img/cities/callao_thumbail.jpg'),(36,'Cerro de Pasco',NULL,NULL,'img/cities/cerrodepasco.jpg','Cerro de Pasco','img/cities/cerrodepasco_thumbail.jpg'),(37,'Cuzco',NULL,NULL,'img/cities/cuzco.jpg','Cuzco','img/cities/cuzco_thumbail.jpg'),(38,'Sicuani',NULL,NULL,'img/cities/sicuani.jpg','Sicuani','img/cities/sicuani_thumbail.jpg'),(39,'Quillabamba',NULL,NULL,'img/cities/quillabamba.jpg','Quillabamba','img/cities/quillabamba_thumbail.jpg'),(40,'Espinar',NULL,NULL,'img/cities/espinar.jpg','Espinar','img/cities/espinar_thumbail.jpg'),(41,'Piura',NULL,NULL,'img/cities/piura.jpg','Piura','img/cities/piura_thumbail.jpg'),(42,'Sullana',NULL,NULL,'img/cities/sullana.jpg','Sullana','img/cities/sullana_thumbail.jpg'),(43,'Paita',NULL,NULL,'img/cities/paita.jpg','Paita','img/cities/paita_thumbail.jpg'),(44,'Talara',NULL,NULL,'img/cities/talara.jpg','Talara','img/cities/talara_thumbail.jpg'),(45,'Catacaos',NULL,NULL,'img/cities/catacaos.jpg','Catacaos','img/cities/catacaos_thumbail.jpg'),(46,'Chulucanas',NULL,NULL,'img/cities/chulucanas.jpg','Chulucanas','img/cities/chulucanas_thumbail.jpg'),(47,'Sechura',NULL,NULL,'img/cities/sechura.jpg','Sechura','img/cities/sechura_thumbail.jpg'),(48,'Huancavelica',NULL,NULL,'img/cities/huancavelica.jpg','Huancavelica','img/cities/huancavelica_thumbail.jpg'),(49,'Juliaca',NULL,NULL,'img/cities/juliaca.jpg','Juliaca','img/cities/juliaca_thumbail.jpg'),(50,'Puno',NULL,NULL,'img/cities/puno.jpg','Puno','img/cities/puno_thumbail.jpg'),(51,'Azangaro',NULL,NULL,'img/cities/azangaro.jpg','Azangaro','img/cities/azangaro_thumbail.jpg'),(52,'Huanuco',NULL,NULL,'img/cities/huanuco.jpg','Huanuco','img/cities/huanuco_thumbail.jpg'),(53,'Tingo Maria',NULL,NULL,'img/cities/tingomaria.jpg','Tingo Maria','img/cities/tingomaria_thumbail.jpg'),(54,'Tarapoto',NULL,NULL,'img/cities/tarapoto.jpg','Tarapoto','img/cities/tarapoto_thumbail.jpg'),(55,'Moyobamba',NULL,NULL,'img/cities/moyobamba.jpg','Moyobamba','img/cities/moyobamba_thumbail.jpg'),(56,'Juanjui',NULL,NULL,'img/cities/juanjui.jpg','Juanjui','img/cities/juanjui_thumbail.jpg'),(57,'Rioja',NULL,NULL,'img/cities/rioja.jpg','Rioja','img/cities/rioja_thumbail.jpg'),(58,'Ica',NULL,NULL,'img/cities/ica.jpg','Ica','img/cities/ica_thumbail.jpg'),(59,'Chincha Alta',NULL,NULL,'img/cities/chincha.jpg','Chincha Alta','img/cities/chincha_thumbail.jpg'),(60,'Pisco',NULL,NULL,'img/cities/pisco.jpg','Pisco','img/cities/pisco_thumbail.jpg'),(61,'Nazca',NULL,NULL,'img/cities/nazca.jpg','Nazca','img/cities/nazca_thumbail.jpg'),(62,'Tacna',NULL,NULL,'img/cities/tacna.jpg','Tacna','img/cities/tacna_thumbail.jpg'),(63,'Huancayo',NULL,NULL,'img/cities/huancayo.jpg','Huancayo','img/cities/huancayo_thumbail.jpg'),(64,'Tarma',NULL,NULL,'img/cities/tarma.jpg','Tarma','img/cities/tarma_thumbail.jpg'),(65,'Jauja',NULL,NULL,'img/cities/jauja.jpg','Jauja','img/cities/jauja_thumbail.jpg'),(66,'La Oroya',NULL,NULL,'img/cities/oroya.jpg','La Oroya','img/cities/oroya_thumbail.jpg'),(67,'Tumbes',NULL,NULL,'img/cities/tumbes.jpg','Tumbes','img/cities/tumbes_thumbail.jpg'),(68,'Zarumilla',NULL,NULL,'img/cities/zarumilla.jpg','Zarumilla','img/cities/zarumilla_thumbail.jpg'),(69,'Trujillo',NULL,NULL,'img/cities/trujillo.jpg','Trujillo','img/cities/trujillo_thumbail.jpg'),(70,'Chepen',NULL,NULL,'img/cities/chepen.jpg','Chepen','img/cities/chepen_thumbail.jpg'),(71,'Pacasmayo',NULL,NULL,'img/cities/pacasmayo.jpg','Pacasmayo','img/cities/pacasmayo_thumbail.jpg'),(72,'Guadalupe',NULL,NULL,'img/cities/guadalupe.jpg','Guadalupe','img/cities/guadalupe_thumbail.jpg'),(73,'Casa Grande',NULL,NULL,'img/cities/casagrande.jpg','Casa Grande','img/cities/casagrande_thumbail.jpg'),(74,'Pucallpa',NULL,NULL,'img/cities/iquitos.jpg','Pucallpa','img/cities/iquitos_thumbail.jpg'),(75,'Cajamarca',NULL,NULL,'img/cities/cajamarca.jpg','Cajamarca','img/cities/cajamarca_thumbail.jpg');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-05 13:13:53','75','City object',2,'Changed caption.',1,2),(2,'2018-04-05 13:13:53','74','City object',2,'Changed caption.',1,2),(3,'2018-04-05 13:13:53','73','City object',2,'Changed caption.',1,2),(4,'2018-04-05 13:13:53','72','City object',2,'Changed caption.',1,2),(5,'2018-04-05 13:13:53','71','City object',2,'Changed caption.',1,2),(6,'2018-04-05 13:13:53','70','City object',2,'Changed caption.',1,2),(7,'2018-04-05 13:13:53','69','City object',2,'Changed caption.',1,2),(8,'2018-04-05 13:13:53','68','City object',2,'Changed caption.',1,2),(9,'2018-04-05 13:13:53','67','City object',2,'Changed caption.',1,2),(10,'2018-04-05 13:13:53','66','City object',2,'Changed caption.',1,2),(11,'2018-04-05 13:13:53','65','City object',2,'Changed caption.',1,2),(12,'2018-04-05 13:13:53','64','City object',2,'Changed caption.',1,2),(13,'2018-04-05 13:13:53','63','City object',2,'Changed caption.',1,2),(14,'2018-04-05 13:13:53','62','City object',2,'Changed caption.',1,2),(15,'2018-04-05 13:13:53','61','City object',2,'Changed caption.',1,2),(16,'2018-04-05 13:13:53','60','City object',2,'Changed caption.',1,2),(17,'2018-04-05 13:13:53','59','City object',2,'Changed caption.',1,2),(18,'2018-04-05 13:13:53','58','City object',2,'Changed caption.',1,2),(19,'2018-04-05 13:13:53','57','City object',2,'Changed caption.',1,2),(20,'2018-04-05 13:13:53','56','City object',2,'Changed caption.',1,2),(21,'2018-04-05 13:13:53','55','City object',2,'Changed caption.',1,2),(22,'2018-04-05 13:13:53','54','City object',2,'Changed caption.',1,2),(23,'2018-04-05 13:13:53','53','City object',2,'Changed caption.',1,2),(24,'2018-04-05 13:13:53','52','City object',2,'Changed caption.',1,2),(25,'2018-04-05 13:16:06','51','City object',2,'Changed caption.',1,2),(26,'2018-04-05 13:16:06','50','City object',2,'Changed caption.',1,2),(27,'2018-04-05 13:16:06','49','City object',2,'Changed caption.',1,2),(28,'2018-04-05 13:16:06','48','City object',2,'Changed caption.',1,2),(29,'2018-04-05 13:16:06','47','City object',2,'Changed caption.',1,2),(30,'2018-04-05 13:16:06','46','City object',2,'Changed caption.',1,2),(31,'2018-04-05 13:16:06','45','City object',2,'Changed caption.',1,2),(32,'2018-04-05 13:16:06','44','City object',2,'Changed caption.',1,2),(33,'2018-04-05 13:16:06','43','City object',2,'Changed caption.',1,2),(34,'2018-04-05 13:16:06','42','City object',2,'Changed caption.',1,2),(35,'2018-04-05 13:16:06','41','City object',2,'Changed caption.',1,2),(36,'2018-04-05 13:16:06','40','City object',2,'Changed caption.',1,2),(37,'2018-04-05 13:16:06','39','City object',2,'Changed caption.',1,2),(38,'2018-04-05 13:16:06','38','City object',2,'Changed caption.',1,2),(39,'2018-04-05 13:16:06','37','City object',2,'Changed caption.',1,2),(40,'2018-04-05 13:16:06','36','City object',2,'Changed caption.',1,2),(41,'2018-04-05 13:16:06','35','City object',2,'Changed caption.',1,2),(42,'2018-04-05 13:16:06','34','City object',2,'Changed caption.',1,2),(43,'2018-04-05 13:16:06','33','City object',2,'Changed caption.',1,2),(44,'2018-04-05 13:16:06','32','City object',2,'Changed caption.',1,2),(45,'2018-04-05 13:16:06','31','City object',2,'Changed caption.',1,2),(46,'2018-04-05 13:16:06','30','City object',2,'Changed caption.',1,2),(47,'2018-04-05 13:16:06','28','City object',2,'Changed caption.',1,2),(48,'2018-04-05 13:16:06','27','City object',2,'Changed caption.',1,2),(49,'2018-04-05 13:16:06','26','City object',2,'Changed caption.',1,2),(50,'2018-04-05 13:16:06','25','City object',2,'Changed caption.',1,2),(51,'2018-04-05 13:16:06','24','City object',2,'Changed caption.',1,2),(52,'2018-04-05 13:16:06','22','City object',2,'Changed caption.',1,2),(53,'2018-04-05 13:16:06','21','City object',2,'Changed caption.',1,2),(54,'2018-04-05 13:16:06','20','City object',2,'Changed caption.',1,2),(55,'2018-04-05 13:16:06','19','City object',2,'Changed caption.',1,2),(56,'2018-04-05 13:16:06','18','City object',2,'Changed caption.',1,2),(57,'2018-04-05 13:16:06','17','City object',2,'Changed caption.',1,2),(58,'2018-04-05 13:16:06','16','City object',2,'Changed caption.',1,2),(59,'2018-04-05 13:16:06','15','City object',2,'Changed caption.',1,2),(60,'2018-04-05 13:16:06','14','City object',2,'Changed caption.',1,2),(61,'2018-04-05 13:16:06','13','City object',2,'Changed caption.',1,2),(62,'2018-04-05 13:16:06','12','City object',2,'Changed caption.',1,2),(63,'2018-04-05 13:16:06','11','City object',2,'Changed caption.',1,2),(64,'2018-04-05 13:16:06','10','City object',2,'Changed caption.',1,2),(65,'2018-04-05 13:16:06','9','City object',2,'Changed caption.',1,2),(66,'2018-04-05 13:16:06','8','City object',2,'Changed caption.',1,2),(67,'2018-04-05 13:16:06','7','City object',2,'Changed caption.',1,2),(68,'2018-04-05 13:16:06','6','City object',2,'Changed caption.',1,2),(69,'2018-04-05 13:16:06','5','City object',2,'Changed caption.',1,2),(70,'2018-04-05 13:16:06','4','City object',2,'Changed caption.',1,2),(71,'2018-04-05 13:16:06','1','City object',2,'Changed caption.',1,2),(72,'2018-04-06 17:47:23','183','Interest object',2,'Changed caption.',2,2),(73,'2018-04-06 17:47:23','182','Interest object',2,'Changed caption.',2,2),(74,'2018-04-06 17:47:23','181','Interest object',2,'Changed caption.',2,2),(75,'2018-04-06 17:47:23','180','Interest object',2,'Changed caption.',2,2),(76,'2018-04-06 17:47:23','179','Interest object',2,'Changed caption.',2,2),(77,'2018-04-06 17:47:23','178','Interest object',2,'Changed caption.',2,2),(78,'2018-04-06 17:47:23','177','Interest object',2,'Changed caption.',2,2),(79,'2018-04-06 17:47:23','176','Interest object',2,'Changed caption.',2,2),(80,'2018-04-06 17:47:23','175','Interest object',2,'Changed caption.',2,2),(81,'2018-04-06 17:47:23','174','Interest object',2,'Changed caption.',2,2),(82,'2018-04-06 17:47:23','173','Interest object',2,'Changed caption.',2,2),(83,'2018-04-06 17:47:23','172','Interest object',2,'Changed caption.',2,2),(84,'2018-04-06 17:47:23','171','Interest object',2,'Changed caption.',2,2),(85,'2018-04-06 17:47:23','170','Interest object',2,'Changed caption.',2,2),(86,'2018-04-06 17:47:23','169','Interest object',2,'Changed caption.',2,2),(87,'2018-04-06 17:47:23','168','Interest object',2,'Changed caption.',2,2),(88,'2018-04-06 17:47:23','167','Interest object',2,'Changed caption.',2,2),(89,'2018-04-06 17:47:23','166','Interest object',2,'Changed caption.',2,2),(90,'2018-04-06 17:47:23','165','Interest object',2,'Changed caption.',2,2),(91,'2018-04-06 17:47:23','164','Interest object',2,'Changed caption.',2,2),(92,'2018-04-06 17:47:23','163','Interest object',2,'Changed caption.',2,2),(93,'2018-04-06 17:47:23','162','Interest object',2,'Changed caption.',2,2),(94,'2018-04-06 17:47:23','161','Interest object',2,'Changed caption.',2,2),(95,'2018-04-06 17:47:23','160','Interest object',2,'Changed caption.',2,2),(96,'2018-04-06 17:47:23','159','Interest object',2,'Changed caption.',2,2),(97,'2018-04-06 17:47:23','158','Interest object',2,'Changed caption.',2,2),(98,'2018-04-06 17:47:23','157','Interest object',2,'Changed caption.',2,2),(99,'2018-04-06 17:47:23','156','Interest object',2,'Changed caption.',2,2),(100,'2018-04-06 17:47:23','155','Interest object',2,'Changed caption.',2,2),(101,'2018-04-06 17:56:08','154','Interest object',2,'Changed caption.',2,2),(102,'2018-04-06 17:56:08','153','Interest object',2,'Changed caption.',2,2),(103,'2018-04-06 17:56:08','152','Interest object',2,'Changed caption.',2,2),(104,'2018-04-06 17:56:08','151','Interest object',2,'Changed caption.',2,2),(105,'2018-04-06 17:56:08','150','Interest object',2,'Changed caption.',2,2),(106,'2018-04-06 17:56:08','149','Interest object',2,'Changed caption.',2,2),(107,'2018-04-06 17:56:08','148','Interest object',2,'Changed caption.',2,2),(108,'2018-04-06 17:56:08','147','Interest object',2,'Changed caption.',2,2),(109,'2018-04-06 17:56:08','146','Interest object',2,'Changed caption.',2,2),(110,'2018-04-06 17:56:08','145','Interest object',2,'Changed caption.',2,2),(111,'2018-04-06 17:56:08','144','Interest object',2,'Changed caption.',2,2),(112,'2018-04-06 17:56:08','143','Interest object',2,'Changed caption.',2,2),(113,'2018-04-06 17:56:08','142','Interest object',2,'Changed caption.',2,2),(114,'2018-04-06 17:56:08','141','Interest object',2,'Changed caption.',2,2),(115,'2018-04-06 17:56:08','140','Interest object',2,'Changed caption.',2,2),(116,'2018-04-06 17:56:08','139','Interest object',2,'Changed caption.',2,2),(117,'2018-04-06 17:56:08','138','Interest object',2,'Changed caption.',2,2),(118,'2018-04-06 17:56:08','137','Interest object',2,'Changed caption.',2,2),(119,'2018-04-06 17:56:08','136','Interest object',2,'Changed caption.',2,2),(120,'2018-04-06 17:56:08','135','Interest object',2,'Changed caption.',2,2),(121,'2018-04-06 17:56:08','134','Interest object',2,'Changed caption.',2,2),(122,'2018-04-06 17:56:08','133','Interest object',2,'Changed caption.',2,2),(123,'2018-04-06 17:56:08','132','Interest object',2,'Changed caption.',2,2),(124,'2018-04-06 17:56:08','131','Interest object',2,'Changed caption.',2,2),(125,'2018-04-06 17:56:08','130','Interest object',2,'Changed caption.',2,2),(126,'2018-04-06 17:56:08','129','Interest object',2,'Changed caption.',2,2),(127,'2018-04-06 17:56:08','128','Interest object',2,'Changed caption.',2,2),(128,'2018-04-06 17:56:08','127','Interest object',2,'Changed caption.',2,2),(129,'2018-04-06 17:56:08','126','Interest object',2,'Changed caption.',2,2),(130,'2018-04-06 17:56:08','125','Interest object',2,'Changed caption.',2,2),(131,'2018-04-06 17:56:08','124','Interest object',2,'Changed caption.',2,2),(132,'2018-04-06 17:56:08','123','Interest object',2,'Changed caption.',2,2),(133,'2018-04-06 17:56:08','122','Interest object',2,'Changed caption.',2,2),(134,'2018-04-06 17:56:08','121','Interest object',2,'Changed caption.',2,2),(135,'2018-04-06 17:56:08','120','Interest object',2,'Changed caption.',2,2),(136,'2018-04-06 17:56:08','119','Interest object',2,'Changed caption.',2,2),(137,'2018-04-06 17:56:08','118','Interest object',2,'Changed caption.',2,2),(138,'2018-04-06 17:56:08','117','Interest object',2,'Changed caption.',2,2),(139,'2018-04-06 17:56:08','115','Interest object',2,'Changed caption.',2,2),(140,'2018-04-06 17:56:08','114','Interest object',2,'Changed caption.',2,2),(141,'2018-04-06 17:56:08','113','Interest object',2,'Changed caption.',2,2),(142,'2018-04-06 17:56:08','112','Interest object',2,'Changed caption.',2,2),(143,'2018-04-06 17:56:08','111','Interest object',2,'Changed caption.',2,2),(144,'2018-04-06 17:56:08','110','Interest object',2,'Changed caption.',2,2),(145,'2018-04-06 17:56:08','109','Interest object',2,'Changed caption.',2,2),(146,'2018-04-06 17:56:08','108','Interest object',2,'Changed caption.',2,2),(147,'2018-04-06 17:56:08','106','Interest object',2,'Changed caption.',2,2),(148,'2018-04-06 17:56:08','105','Interest object',2,'Changed caption.',2,2),(149,'2018-04-06 17:56:08','104','Interest object',2,'Changed caption.',2,2),(150,'2018-04-06 17:56:08','103','Interest object',2,'Changed caption.',2,2),(151,'2018-04-06 17:56:08','102','Interest object',2,'Changed caption.',2,2),(152,'2018-04-06 17:56:08','101','Interest object',2,'Changed caption.',2,2),(153,'2018-04-06 17:56:08','100','Interest object',2,'Changed caption.',2,2),(154,'2018-04-06 17:56:08','99','Interest object',2,'Changed caption.',2,2),(155,'2018-04-06 17:56:08','98','Interest object',2,'Changed caption.',2,2),(156,'2018-04-06 17:56:08','97','Interest object',2,'Changed caption.',2,2),(157,'2018-04-06 17:56:08','96','Interest object',2,'Changed caption.',2,2),(158,'2018-04-06 17:56:08','94','Interest object',2,'Changed caption.',2,2),(159,'2018-04-06 17:56:08','92','Interest object',2,'Changed caption.',2,2),(160,'2018-04-06 17:56:08','91','Interest object',2,'Changed caption.',2,2),(161,'2018-04-06 17:56:08','90','Interest object',2,'Changed caption.',2,2),(162,'2018-04-06 17:56:08','88','Interest object',2,'Changed caption.',2,2),(163,'2018-04-06 17:56:08','87','Interest object',2,'Changed caption.',2,2),(164,'2018-04-06 17:56:08','86','Interest object',2,'Changed caption.',2,2),(165,'2018-04-06 17:56:08','85','Interest object',2,'Changed caption.',2,2),(166,'2018-04-06 17:56:08','84','Interest object',2,'Changed caption.',2,2),(167,'2018-04-06 17:56:08','83','Interest object',2,'Changed caption.',2,2),(168,'2018-04-06 17:56:08','82','Interest object',2,'Changed caption.',2,2),(169,'2018-04-06 17:56:08','80','Interest object',2,'Changed caption.',2,2),(170,'2018-04-06 17:56:08','79','Interest object',2,'Changed caption.',2,2),(171,'2018-04-06 17:56:08','78','Interest object',2,'Changed caption.',2,2),(172,'2018-04-06 17:57:11','77','Interest object',2,'Changed caption.',2,2),(173,'2018-04-06 17:57:11','76','Interest object',2,'Changed caption.',2,2),(174,'2018-04-06 17:57:11','71','Interest object',2,'Changed caption.',2,2),(175,'2018-04-06 17:57:11','68','Interest object',2,'Changed caption.',2,2),(176,'2018-04-06 17:57:11','65','Interest object',2,'Changed caption.',2,2),(177,'2018-04-06 17:57:11','62','Interest object',2,'Changed caption.',2,2),(178,'2018-04-06 17:57:11','61','Interest object',2,'Changed caption.',2,2),(179,'2018-04-06 17:57:11','58','Interest object',2,'Changed caption.',2,2),(180,'2018-04-06 17:57:11','53','Interest object',2,'Changed caption.',2,2),(181,'2018-04-06 17:57:11','51','Interest object',2,'Changed caption.',2,2),(182,'2018-04-06 17:57:11','16','Interest object',2,'Changed caption.',2,2),(183,'2018-04-06 17:57:11','15','Interest object',2,'Changed caption.',2,2),(184,'2018-04-06 17:57:11','14','Interest object',2,'Changed caption.',2,2),(185,'2018-04-06 17:57:11','13','Interest object',2,'Changed caption.',2,2),(186,'2018-04-06 17:57:11','12','Interest object',2,'Changed caption.',2,2),(187,'2018-04-06 17:57:11','11','Interest object',2,'Changed caption.',2,2),(188,'2018-04-06 17:57:11','10','Interest object',2,'Changed caption.',2,2),(189,'2018-04-06 17:57:11','9','Interest object',2,'Changed caption.',2,2),(190,'2018-04-06 17:57:11','8','Interest object',2,'Changed caption.',2,2),(191,'2018-04-06 17:57:11','7','Interest object',2,'Changed caption.',2,2),(192,'2018-04-06 17:57:11','6','Interest object',2,'Changed caption.',2,2),(193,'2018-04-06 17:57:11','5','Interest object',2,'Changed caption.',2,2),(194,'2018-04-06 17:57:11','4','Interest object',2,'Changed caption.',2,2),(195,'2018-04-06 17:57:11','3','Interest object',2,'Changed caption.',2,2),(196,'2018-04-06 17:57:11','2','Interest object',2,'Changed caption.',2,2),(197,'2018-04-06 17:57:11','1','Interest object',2,'Changed caption.',2,2),(198,'2018-04-06 18:37:44','1','Hotel object',1,'Added.',3,2),(199,'2018-04-06 19:00:27','1','System object',1,'Added.',4,2),(200,'2018-06-19 00:49:28','75','Cajamarca',2,'Changed caption.',1,2),(201,'2018-06-19 00:49:28','74','Pucallpa',2,'Changed caption.',1,2),(202,'2018-06-19 00:49:28','73','Casa Grande',2,'Changed caption.',1,2),(203,'2018-06-19 00:49:28','72','Guadalupe',2,'Changed caption.',1,2),(204,'2018-06-19 00:49:28','71','Pacasmayo',2,'Changed caption.',1,2),(205,'2018-06-19 00:49:28','70','Chepen',2,'Changed caption.',1,2),(206,'2018-06-19 00:49:28','69','Trujillo',2,'Changed caption.',1,2),(207,'2018-06-19 00:49:28','68','Zarumilla',2,'Changed caption.',1,2),(208,'2018-06-19 00:49:28','67','Tumbes',2,'Changed caption.',1,2),(209,'2018-06-19 00:49:28','66','La Oroya',2,'Changed caption.',1,2),(210,'2018-06-19 00:49:28','65','Jauja',2,'Changed caption.',1,2),(211,'2018-06-19 00:49:28','64','Tarma',2,'Changed caption.',1,2),(212,'2018-06-19 00:49:28','63','Huancayo',2,'Changed caption.',1,2),(213,'2018-06-19 00:49:28','62','Tacna',2,'Changed caption.',1,2),(214,'2018-06-19 00:49:28','61','Nazca',2,'Changed caption.',1,2),(215,'2018-06-19 01:03:11','75','Cajamarca',2,'Changed caption.',1,2),(216,'2018-06-19 01:03:11','74','Pucallpa',2,'Changed caption.',1,2),(217,'2018-06-19 01:03:11','73','Casa Grande',2,'Changed caption.',1,2),(218,'2018-06-19 01:03:11','72','Guadalupe',2,'Changed caption.',1,2),(219,'2018-06-19 01:03:11','71','Pacasmayo',2,'Changed caption.',1,2),(220,'2018-06-19 01:03:11','70','Chepen',2,'Changed caption.',1,2),(221,'2018-06-19 01:03:11','69','Trujillo',2,'Changed caption.',1,2),(222,'2018-06-19 01:03:11','68','Zarumilla',2,'Changed caption.',1,2),(223,'2018-06-19 01:03:11','67','Tumbes',2,'Changed caption.',1,2),(224,'2018-06-19 03:24:32','5','Hotel object',2,'Changed subscrito.',3,2),(225,'2018-06-19 03:30:01','5','Hotel object',2,'Changed subscrito.',3,2),(226,'2018-06-19 03:30:01','4','Hotel object',2,'Changed subscrito.',3,2),(227,'2018-06-19 03:30:01','3','Hotel object',2,'Changed subscrito.',3,2),(228,'2018-06-19 03:30:01','2','Hotel object',2,'Changed subscrito.',3,2),(229,'2018-06-19 03:30:28','5','Hotel object',2,'Changed subscrito.',3,2),(230,'2018-06-19 05:23:47','6','Hotel object',2,'Changed subscrito.',3,2),(231,'2018-06-28 02:40:04','1','admin',2,'Changed password.',5,2),(232,'2018-07-04 03:13:01','1','admin',2,'Changed password.',5,2),(233,'2018-07-04 03:29:59','1','Hotel object',2,'Changed fexpiracion.',3,2),(234,'2018-07-13 03:31:06','75','Cajamarca',2,'Changed thumbail.',1,2),(235,'2018-07-13 04:01:58','66','La Oroya',2,'Changed caption.',1,2),(236,'2018-07-13 04:01:58','65','Jauja',2,'Changed caption.',1,2),(237,'2018-07-13 04:01:58','64','Tarma',2,'Changed caption.',1,2),(238,'2018-07-13 04:01:58','63','Huancayo',2,'Changed caption.',1,2),(239,'2018-07-13 04:01:58','62','Tacna',2,'Changed caption.',1,2),(240,'2018-07-13 04:01:58','61','Nazca',2,'Changed caption.',1,2),(241,'2018-07-13 04:16:51','1','Amenity object',1,'Added.',7,2),(242,'2018-07-13 04:18:22','1','Amenity object',2,'Changed name and name_en.',7,2),(243,'2018-08-02 20:08:47','1','TipoNotifications object',1,'Added.',8,2),(244,'2018-08-02 20:09:00','2','TipoNotifications object',1,'Added.',8,2),(245,'2018-08-02 20:09:43','3','TipoNotifications object',1,'Added.',8,2),(246,'2018-08-02 20:09:56','4','TipoNotifications object',1,'Added.',8,2),(247,'2018-08-02 20:10:08','5','TipoNotifications object',1,'Added.',8,2),(248,'2018-08-02 20:44:39','2','ReservationStatus object',1,'Added.',9,2),(249,'2018-08-02 20:44:46','3','ReservationStatus object',1,'Added.',9,2),(250,'2018-08-02 20:45:22','4','ReservationStatus object',1,'Added.',9,2),(251,'2018-08-02 20:46:09','2','ReservationStatus object',2,'Changed name.',9,2),(252,'2018-08-02 20:46:22','4','ReservationStatus object',2,'Changed name.',9,2),(253,'2018-08-02 20:46:35','3','ReservationStatus object',2,'Changed name.',9,2),(254,'2018-08-02 20:58:19','3','ReservationStatus object',2,'Changed name.',9,2),(255,'2018-08-02 20:58:34','2','ReservationStatus object',2,'No fields changed.',9,2),(256,'2018-09-18 18:42:16','37','323',2,'Changed last_login, first_name, last_name, phone and seller.',6,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'auth','user'),(7,'choose','amenity'),(6,'choose','authuser'),(1,'choose','city'),(3,'choose','hotel'),(2,'choose','interest'),(10,'choose','reservation'),(9,'choose','reservationstatus'),(4,'choose','system'),(8,'choose','tiponotifications');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0rjfxws4letu7v8rf09ka9tkpc2f8gui','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-29 01:14:33'),('15og1os6egkijvwwveywke9vdv0ndihn','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-27 02:50:38'),('251w3fvz5sxm6a4qb8out7muuoyva62x','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-27 05:54:47'),('5851v9rnune4qnzk3s7ghhpiqf9i9pjp','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-18 03:11:52'),('70yan44x3o864ytxduac8z9pph9hul9j','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-12 02:10:06'),('dlav4marcgss9vqi7nsa5apx2mb88tjh','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-27 04:14:36'),('du8f9eelzretaz2cswf4j6azt871fukr','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-10-02 18:37:04'),('fc1611hdyiq2fbxnxdn4pnf5lck2b96z','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-03 05:22:08'),('g2rnjfuqbqn6pv7fy7yjzu963u9k3oga','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-18 05:00:35'),('hjhjkxfhfyctzks27jo3m7f3fqew27fx','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-08-13 21:01:49'),('o5wf2vem331ydxaukoqwaismkochxiph','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-01 17:10:32'),('pamg984j37yzye9z4gpdm77exisfo16j','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-03 03:24:16'),('q11hss9litgdt8hrzc6wp0kahhzu7utw','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-03 03:03:24'),('qig58cjrl0rhlcxgcrd6gj1ww3j94iwo','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-04-20 17:43:50'),('sbfd4xzlw6oxo2lq68sxwkfxtyl1b6xq','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-03 00:47:00'),('skoqxdhjhu6if9rwxv1jndgpcvq3t99s','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-04-19 12:58:01'),('yqjvx7ockc7p54vy83edtblltoegcylw','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-08-16 20:06:23');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_bed`
--

DROP TABLE IF EXISTS `extra_bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_bed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `child_occupancy` varchar(100) DEFAULT NULL,
  `adult_occupancy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_bed`
--

LOCK TABLES `extra_bed` WRITE;
/*!40000 ALTER TABLE `extra_bed` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extrabed_roomtemplate`
--

DROP TABLE IF EXISTS `extrabed_roomtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extrabed_roomtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room` int(100) DEFAULT NULL,
  `extra_bed` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room` (`room`),
  KEY `extra_bed` (`extra_bed`),
  CONSTRAINT `extrabed_roomtemplate_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`id`),
  CONSTRAINT `extrabed_roomtemplate_ibfk_2` FOREIGN KEY (`extra_bed`) REFERENCES `extra_bed` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extrabed_roomtemplate`
--

LOCK TABLES `extrabed_roomtemplate` WRITE;
/*!40000 ALTER TABLE `extrabed_roomtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `extrabed_roomtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `star` int(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description_es` varchar(1000) DEFAULT NULL,
  `tripadvisor` int(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `city` int(100) DEFAULT NULL,
  `account_type` int(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `account_number` int(100) DEFAULT NULL,
  `user` int(100) DEFAULT NULL,
  `hold_limit` int(100) DEFAULT NULL,
  `price` int(100) DEFAULT NULL,
  `featured` int(100) DEFAULT NULL,
  `later` int(100) DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  `politics` varchar(2000) DEFAULT NULL,
  `politics_es` varchar(2000) DEFAULT NULL,
  `calle` varchar(1000) DEFAULT NULL,
  `nlote` varchar(1000) DEFAULT NULL,
  `district` varchar(1000) DEFAULT NULL,
  `fexpiracion` datetime DEFAULT NULL,
  `subscrito` tinyint(1) DEFAULT NULL,
  `iniciofsuscripcion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_type` (`account_type`),
  KEY `city` (`city`),
  KEY `user` (`user`),
  KEY `photo` (`photo`),
  CONSTRAINT `hotel_ibfk_4` FOREIGN KEY (`city`) REFERENCES `city` (`id`),
  CONSTRAINT `hotel_ibfk_5` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`),
  CONSTRAINT `hotel_ibfk_6` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (2,'Westin',1,'Buen Hotel','',NULL,1,13,NULL,'Av Javier Prado 345 323 Miraflores',NULL,37,12,227,2,0,3,'','','Av Javier Prado 345','323','Miraflores','2025-12-12 05:00:00',1,NULL),(3,'212',1,NULL,NULL,NULL,1,19,NULL,'2121 212 212',NULL,38,NULL,NULL,NULL,NULL,1,NULL,NULL,'2121','212','212','2025-12-12 05:00:00',1,NULL),(4,'2121',1,NULL,NULL,NULL,1,21,NULL,'2121 2121 212121www',NULL,39,NULL,NULL,NULL,NULL,1,NULL,NULL,'2121','2121','212121www','2025-12-12 05:00:00',1,NULL),(5,'212',1,'','',NULL,1,18,NULL,'121212 212 12121',NULL,40,NULL,0,NULL,NULL,1,'','','121212','212','12121','2025-12-12 05:00:00',1,NULL),(6,'11qwqw',1,NULL,NULL,NULL,1,21,NULL,'122 1212 21',NULL,41,NULL,0,NULL,NULL,1,NULL,NULL,'122','1212','21','2025-12-12 05:00:00',1,NULL),(7,'La Playita Azul',2,'','',NULL,1,13,NULL,'Av Evitamiento 234 San Juan Lurigancho',NULL,42,215,13,NULL,NULL,3,'','','Av Evitamiento','234','San Juan Lurigancho','2025-12-12 05:00:00',0,NULL),(8,'The Roses',3,'','',NULL,1,13,NULL,'Miraflores 234 Lima',NULL,43,NULL,15,NULL,NULL,3,'','','Miraflores','234','Lima','2025-12-12 05:00:00',0,NULL),(9,'Francia',1,'','',NULL,1,13,NULL,'Surco E3 Lima',NULL,44,212,16,NULL,1,3,'','','Surco','E3','Lima','2025-12-12 05:00:00',0,NULL),(10,'Montaña Marron',1,'','',11,1,13,NULL,'212 212 212',NULL,45,10,85,NULL,1,3,'','','212','212','212','2025-12-12 05:00:00',0,NULL),(11,'Papochin',2,NULL,NULL,NULL,1,13,NULL,'Calle uno 123 San Miguel',NULL,58,NULL,NULL,NULL,NULL,1,NULL,NULL,'Calle uno','123','San Miguel','2025-12-12 05:00:00',0,NULL);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_roomtemplate`
--

DROP TABLE IF EXISTS `hotel_roomtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_roomtemplate` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `hotel` int(100) DEFAULT NULL,
  `roomtemplate` int(100) DEFAULT NULL,
  `precio` int(100) DEFAULT NULL,
  `extrasingle` int(1) DEFAULT '0',
  `extradouble` tinyint(1) DEFAULT NULL,
  `max_occupancy` int(100) DEFAULT NULL,
  `childrens` int(100) DEFAULT NULL,
  `adults` int(100) DEFAULT NULL,
  `privatebathrom` int(100) DEFAULT NULL,
  `photo` int(100) DEFAULT '17',
  `activate` int(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description_es` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel` (`hotel`),
  KEY `roomtemplate` (`roomtemplate`),
  KEY `photo` (`photo`),
  CONSTRAINT `hotel_roomtemplate_ibfk_1` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`),
  CONSTRAINT `hotel_roomtemplate_ibfk_2` FOREIGN KEY (`roomtemplate`) REFERENCES `roomtemplate` (`id`),
  CONSTRAINT `hotel_roomtemplate_ibfk_3` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_roomtemplate`
--

LOCK TABLES `hotel_roomtemplate` WRITE;
/*!40000 ALTER TABLE `hotel_roomtemplate` DISABLE KEYS */;
INSERT INTO `hotel_roomtemplate` VALUES (1,2,1,255,0,0,20,0,20,0,17,1,'Hi',NULL),(2,2,2,200,0,0,2,1,2,0,20,1,'joki',NULL),(3,10,1,21,0,0,20,0,20,0,59,1,'Bed',NULL),(4,10,2,22,0,0,2,1,2,0,60,1,'Private Bed',NULL),(5,10,3,212,0,0,2,1,1,0,61,1,'Single',NULL),(6,9,1,25,0,0,20,0,20,0,62,1,'25',NULL),(7,9,2,25,0,0,2,1,2,0,63,1,'Private Bed',NULL),(8,9,3,NULL,0,0,2,1,1,0,64,1,NULL,NULL),(9,8,1,10,0,0,20,0,20,0,65,1,'Bed',NULL),(10,8,2,20,0,0,2,1,2,0,66,1,'PB',NULL),(11,7,1,20,0,0,20,0,20,0,67,1,'Bed',NULL),(12,7,2,20,0,0,2,1,2,0,68,1,'Private Bed',NULL),(13,7,3,NULL,0,0,2,1,1,0,69,1,NULL,NULL);
/*!40000 ALTER TABLE `hotel_roomtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_fr` varchar(100) NOT NULL,
  `searchable` varchar(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `photo` (`photo`),
  CONSTRAINT `interest_ibfk_1` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` VALUES (1,'Gastronomia','Gastronomy','',NULL,NULL,'img/SVG/dish.svg'),(2,'Equitacion','Horse','',NULL,NULL,'img/SVG/black-head-horse-side-view-with-horsehair.svg'),(3,'Ciclismo','Biking','',NULL,NULL,'img/SVG/bycicle.svg'),(4,'Playa','Beach','',NULL,NULL,'img/SVG/beach-umbrella.svg'),(5,'Canoe','Canoes','',NULL,NULL,'img/SVG/kayak.svg'),(6,'Caminata','Hiking','',NULL,NULL,'img/SVG/one-man-walking.svg'),(7,'Sandboard','Sandboard','',NULL,NULL,'img/SVG/skier.svg'),(8,'Natacion','Swimming','',NULL,NULL,'img/SVG/swimming-figure.svg'),(9,'Naturaleza','Naturality','',NULL,NULL,'img/SVG/leaf.svg'),(10,'Relajacion','Relaxation','',NULL,NULL,'img/SVG/leaf.svg'),(11,'Paisajes','Landscapes','',NULL,NULL,'img/SVG/mountain.svg'),(12,'Gente Amable','Friendly People','',NULL,NULL,'img/SVG/usuarios-multiples-en-silueta.svg'),(13,'Pasear','Walking','',NULL,NULL,'img/SVG/icon.svg'),(14,'Paseo por la naturaleza','Nature Walks','',NULL,NULL,'img/SVG/tree-silhouette.svg'),(15,'Senderismo','Trekking','',NULL,NULL,'img/SVG/hiking.svg'),(16,'Rutas Turisticas','Routes Touristic','',NULL,NULL,'img/SVG/pointer-on-map.svg'),(49,'Distraccion','Distraction','',NULL,NULL,NULL),(50,'Bolos','Bolos','',NULL,NULL,NULL),(51,'Pesca','Fish','',NULL,NULL,'img/SVG/fishes-silhouette.svg'),(52,'232','3232','',NULL,NULL,NULL),(53,'Music','Music','',NULL,NULL,'img/SVG/music-player.svg'),(54,'Circo','Circo','',NULL,NULL,NULL),(55,'Cata de vinos','Cata de vinos','',NULL,NULL,NULL),(58,'Compras','Shopping','','',NULL,'img/SVG/shopping-cart.svg'),(61,'Viajes en coche','Road Trips','','',NULL,'img/SVG/car-garage.svg'),(62,'Romántico','Romantic','','',NULL,'img/SVG/corazon-forma-negra-para-san-valentin.svg'),(65,'Historia','Downhill Skiing','','',NULL,'img/SVG/pyramids.svg'),(68,'Tranquilidad','Tranquility','','',NULL,'img/SVG/leaf.svg'),(71,'Comida','Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(76,'Rural','Countryside','','',NULL,'img/SVG/leaf.svg'),(77,'Restaurantes','Restaurants','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(78,'Ambiente familiar','Family Friendly','','',NULL,'img/SVG/familia-en-silueta.svg'),(79,'Buen ambiente','Ambiance','','',NULL,'img/SVG/familia-en-silueta.svg'),(80,'Cocina gourmet','Gourmet Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(82,'Actividades al aire libre','Outdoor Activities','','',NULL,'img/SVG/leaf.svg'),(83,'Museos','Museums','','',NULL,'img/SVG/banco.svg'),(84,'Comida local','Local Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(85,'Buen ambiente','Atmosphere','','',NULL,'img/SVG/familia-en-silueta.svg'),(86,'Aire puro','Clean Air','','',NULL,'img/SVG/leaf.svg'),(87,'Montaña','Mountains','','',NULL,'img/SVG/snowed-mountains.svg'),(88,'Observar estrellas','Stargazing','','',NULL,'img/SVG/night.svg'),(90,'Limpieza','Cleanliness','','',NULL,'img/SVG/lavadora.svg'),(91,'Cenas de lujo','Fine Dining','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(92,'Centro histórico','Old Town','','',NULL,'img/SVG/pyramids.svg'),(94,'Paseos por la montaña','Mountain Walks','','',NULL,'img/SVG/snowed-mountains.svg'),(96,'Económico','Budget Friendly','','',NULL,'img/SVG/economic-investment.svg'),(97,'Arquitectura','Architecture','','',NULL,'img/SVG/pyramids.svg'),(98,'Paseos por la playa','Beach Walks','','',NULL,'img/SVG/beach-umbrella.svg'),(99,'Monumentos','Monuments','','',NULL,'img/SVG/pyramids.svg'),(100,'Piscinas','Swimming Pools','','',NULL,'img/SVG/swimming-figure.svg'),(101,'Excursiones','Excursions','','',NULL,'img/SVG/BEACH/All-terrain-vehicle.svg'),(102,'Cocina tradicional','Traditional Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(103,'Paseos por la ciudad','City Walks','','',NULL,'img/SVG/apartamentos.svg'),(104,'Escapada urbana','City Trip','','',NULL,'img/SVG/coche-con-equipaje.svg'),(105,'Costa','Seaside','','',NULL,'img/SVG/beach-umbrella.svg'),(106,'Bañarse en ríos y lagos','Wild Swimming','','',NULL,'img/SVG/swimming-figure.svg'),(108,'Playas de arena','Sand Beaches','','',NULL,'img/SVG/beach-umbrella.svg'),(109,'Castillos','Castles','','',NULL,'img/SVG/tower.svg'),(110,'Comer pescado y marisco','Seafood','','',NULL,'img/SVG/fish-with-four-bubbles.svg'),(111,'Hacer turismo','Tourism','','',NULL,'img/SVG/coche-con-equipaje.svg'),(112,'Bosques bonitos','Beautiful Forests','','',NULL,'img/SVG/forest.svg'),(113,'Flora y fauna','Wildlife','','',NULL,'img/SVG/huella-de-un-perro.svg'),(114,'Pesca','Fishing','','',NULL,'img/SVG/senal-de-pesca.svg'),(115,'Lugares antiguos','Ancient Landmarks','','',NULL,'img/SVG/piramides.svg'),(117,'Lagos','Lakes','','',NULL,'img/SVG/paisaje.svg'),(118,'Parques','Parks','','',NULL,'img/SVG/bosque.svg'),(119,'Aventura','Adventure','','',NULL,'img/SVG/cuerda.svg'),(120,'Paseos por la costa','Coastal Walks','','',NULL,'img/SVG/beach-umbrella.svg'),(121,'Días soleados','Sunny','','',NULL,'img/SVG/sol.svg'),(122,'Ocio nocturno','Nightlife','','',NULL,'img/SVG/night.svg'),(123,'Atardeceres','Sunsets','','',NULL,'img/SVG/sunset-fuji-mountain.svg'),(124,'Comida internacional','Culturally Diverse Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(125,'Hacer negocios','Business','','',NULL,'img/SVG/money-bag-with-dollar-symbol.svg'),(126,'Golf','Golf','','',NULL,'img/SVG/golf-flag-and-field.svg'),(127,'Cafeterías','Cafés','','',NULL,'img/SVG/hot-coffee-rounded-cup-on-a-plate-from-side-view.svg'),(128,'Salir de bares','Bars','','',NULL,'img/SVG/beer.svg'),(129,'Vistas de la ciudad','Skyline','','',NULL,'img/SVG/city-buildings-silhouette.svg'),(130,'Tours','Tours','','',NULL,'img/SVG/coche-con-equipaje.svg'),(131,'Mercados','Markets','','',NULL,'img/SVG/megaphone.svg'),(132,'Ciclismo de montaña','Mountain Biking','','',NULL,'img/SVG/snowed-mountains.svg'),(133,'Buen acceso en transporte público','Convenient Public Transportation','','',NULL,'img/SVG/coche-con-equipaje.svg'),(134,'Playas familiares','Beaches for Kids','','',NULL,'img/SVG/beach-umbrella.svg'),(135,'Navegar en barco','Boating','','',NULL,'img/SVG/sea-ship.svg'),(136,'Comprar ropa','Clothes Shopping','','',NULL,'img/SVG/shopping-cart.svg'),(137,'Deportes acuáticos','Water Sports','','',NULL,'img/SVG/swimming-figure.svg'),(138,'Música en directo','Live Music','','',NULL,'img/SVG/music-player.svg'),(139,'Bosque','Forest','','',NULL,'img/SVG/forest.svg'),(140,'Bienestar','Wellness','','',NULL,'img/SVG/plant-on-a-hand.svg'),(141,'Pasear con niños','Walking with Kids','','',NULL,'img/SVG/icon.svg'),(142,'Cocina vegetariana','Vegetarian cuisine','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(143,'Ocio','Entertainment','','',NULL,'img/SVG/resting.svg'),(144,'Tomar el sol','Sunbathing','','',NULL,'img/SVG/tomar-el-sol.svg'),(145,'Comprar accesorios','Accessories Shopping','','',NULL,'img/SVG/shopping-cart.svg'),(146,'Salir de pubs','Pubs','','',NULL,'img/SVG/beer.svg'),(147,'Deporte','Sports','','',NULL,'img/SVG/futbol.svg'),(148,'Iglesias','Churches','','',NULL,'img/SVG/iglesia.svg'),(149,'Puerto','Harbor','','',NULL,'img/SVG/muelle-de-la-ciudad.svg'),(150,'Fotografía','Photography','','',NULL,'img/SVG/camara-de-fotos.svg'),(151,'Arte','Art','','',NULL,'img/SVG/paleta-de-pintor.svg'),(152,'Comprar comida','Food Shopping','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(153,'Buceo','Diving','','',NULL,'img/SVG/diving-goggles.svg'),(154,'Cerveza','Beer','','',NULL,'img/SVG/beer.svg'),(155,'Viñedos','Vineyards','','',NULL,'img/SVG/racimo-de-uvas.svg'),(156,'Clima caluroso','Hot Weather','','',NULL,'img/SVG/sol.svg'),(157,'Observar aves','Bird Watching','','',NULL,'img/SVG/paloma.svg'),(158,'Snorkel','Snorkeling','','',NULL,'img/SVG/bucear.svg'),(159,'Destinos para casarse','Destination Weddings','','',NULL,'img/SVG/regalo.svg'),(160,'Montañismo','Mountaineering','','',NULL,'img/SVG/snowed-mountains.svg'),(161,'Aguas termales','Hot Springs','','',NULL,'img/SVG/arbol.svg'),(162,'Cultura alternativa','Alternative Culture','','',NULL,'img/SVG/pyramids.svg'),(163,'Museos de Arte','Fine Art Museums','','',NULL,'img/SVG/banco.svg'),(164,'Cascadas','Waterfalls','','',NULL,'img/SVG/cascada.svg'),(165,'Pasear con mascotas','Walking with Pets','','',NULL,'img/SVG/perro.svg'),(166,'Excursiones en kayak','Kayaking','','',NULL,'img/SVG/canoeing.svg'),(167,'Montar a caballo','Horseback Riding','','',NULL,'img/SVG/black-head-horse-side-view-with-horsehair.svg'),(168,'Jardin botanico','Botanical Garden','','',NULL,'img/SVG/planta.svg'),(169,'Comprar vino','Wine Shopping','','',NULL,'img/SVG/copa.svg'),(170,'Motociclismo','Motorcycling','','',NULL,'img/SVG/casco-de-motociclista-en-vista-lateral.svg'),(171,'Navegar','Sailing','','',NULL,'img/SVG/transportacion-maritima.svg'),(172,'Surf','Surfing','','',NULL,'img/SVG/navegar.svg'),(173,'Zoo','Zoo','','',NULL,'img/SVG/oso-mirando-a-la-derecha.svg'),(174,'Comprar antiguedades','Antiquing','','',NULL,'img/SVG/carro.svg'),(175,'Playas de guijarros','Riverside Walks','','',NULL,'img/SVG/beach-umbrella.svg'),(176,'Conocer gente','Meeting New People','','',NULL,'img/SVG/usuarios-multiples-en-silueta.svg'),(177,'Escalada','Climbing','','',NULL,'img/SVG/escalando-con-una-cuerda.svg'),(178,'Arqueologia','Archaeology','','',NULL,'img/SVG/piramide-del-sol.svg'),(179,'Catedral','Cathedral','','',NULL,'img/SVG/catedral-de-milan.svg'),(180,'Teatro','Theater','','',NULL,'img/SVG/mascaras-de-teatro.svg'),(181,'Deporte Invierno','Winter Sports','','',NULL,'img/SVG/zapatilla-de-correr.svg'),(182,'Cafe','Coffee','','',NULL,'img/SVG/cafe-caliente-en-taza-redondeada-en-un-plato-de-la-vista-lateral.svg'),(183,'Comida Saludable','Healthy Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg');
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_hotel`
--

DROP TABLE IF EXISTS `interest_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel` int(100) DEFAULT NULL,
  `interest` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel` (`hotel`),
  KEY `interests` (`interest`),
  CONSTRAINT `interest_hotel_ibfk_1` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`),
  CONSTRAINT `interest_hotel_ibfk_2` FOREIGN KEY (`interest`) REFERENCES `interest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_hotel`
--

LOCK TABLES `interest_hotel` WRITE;
/*!40000 ALTER TABLE `interest_hotel` DISABLE KEYS */;
INSERT INTO `interest_hotel` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,8,1),(8,8,2),(9,8,3),(10,8,4),(11,8,5),(12,8,6),(13,7,1),(14,7,2),(15,7,4),(16,9,1),(17,9,3),(18,9,5),(19,10,1),(20,10,2),(21,10,3),(22,10,4);
/*!40000 ALTER TABLE `interest_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user` int(100) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(10000) DEFAULT NULL,
  `reservation` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,15,'2018-04-07 04:40:08','New User',NULL,NULL,NULL,NULL),(2,39,'2018-06-19 03:12:26','Pay new owner',NULL,4,NULL,NULL),(3,40,'2018-06-19 03:15:20','Pay new owner',NULL,5,NULL,NULL),(4,41,'2018-06-19 05:23:28','Pay new owner',NULL,6,NULL,NULL),(5,42,'2018-07-05 05:55:12','Pay new owner',NULL,7,NULL,NULL),(6,43,'2018-07-13 01:45:29','Pay new owner',NULL,8,NULL,NULL),(7,44,'2018-07-13 01:56:31','Pay new owner',NULL,9,NULL,NULL),(8,45,'2018-07-13 02:09:25','Pay new owner',NULL,10,NULL,NULL),(9,46,'2018-08-02 19:27:15','New User',NULL,NULL,NULL,NULL),(10,47,'2018-08-02 19:38:06','New User',NULL,NULL,NULL,NULL),(11,49,'2018-08-02 19:47:34','New User',NULL,NULL,NULL,NULL),(12,50,'2018-08-02 19:48:14','New User',NULL,NULL,NULL,NULL),(13,51,'2018-08-02 19:49:32','New User',NULL,NULL,NULL,NULL),(14,52,'2018-08-02 19:50:17','New User',NULL,NULL,NULL,NULL),(15,53,'2018-08-02 19:51:07','New User',NULL,NULL,NULL,NULL),(16,54,'2018-08-02 19:55:03','New User',NULL,NULL,NULL,NULL),(17,55,'2018-08-02 19:56:13','New User',NULL,NULL,NULL,NULL),(18,56,'2018-08-02 19:58:38','New User',NULL,NULL,NULL,NULL),(19,NULL,'2018-08-02 20:10:17','2122',NULL,10,NULL,5),(20,NULL,'2018-08-02 20:13:16','2122',NULL,10,NULL,5),(21,NULL,'2018-08-02 20:14:27','2122',NULL,10,NULL,5),(22,NULL,'2018-08-02 20:14:59','2122',NULL,10,NULL,5),(23,NULL,'2018-08-02 20:19:01','2122',NULL,10,NULL,5),(24,NULL,'2018-08-02 20:28:34','2122',NULL,10,NULL,5),(25,NULL,'2018-08-02 20:30:51','2122',NULL,9,NULL,5),(26,NULL,'2018-08-02 20:40:09','2122',NULL,9,NULL,5),(27,NULL,'2018-08-02 20:47:53','2122',NULL,10,NULL,5),(28,NULL,'2018-08-02 20:50:30','2122',NULL,10,NULL,5),(29,57,'2018-08-02 21:00:00','New User',NULL,NULL,NULL,NULL),(30,NULL,'2018-08-02 21:00:17','2122',NULL,10,NULL,5),(31,58,'2018-08-08 19:12:03','Pay new owner',NULL,11,NULL,NULL),(32,59,'2018-08-13 15:39:30','New User',NULL,NULL,NULL,NULL),(33,NULL,'2018-08-13 15:39:52','2122',NULL,10,NULL,5),(34,60,'2018-09-18 16:49:44','New User',NULL,NULL,NULL,NULL),(35,61,'2018-09-18 17:14:51','New User',NULL,NULL,NULL,NULL),(36,62,'2018-09-18 17:42:48','New User',NULL,NULL,NULL,NULL),(37,63,'2018-09-18 17:55:08','New User',NULL,NULL,NULL,NULL),(38,71,'2018-09-18 18:14:49','New User',NULL,NULL,NULL,NULL),(39,72,'2018-09-18 18:23:04','New User',NULL,NULL,NULL,NULL),(40,73,'2018-09-18 18:28:45','New User',NULL,NULL,NULL,NULL),(41,74,'2018-09-18 18:29:34','New User',NULL,NULL,NULL,NULL),(42,75,'2018-10-11 02:03:47','New User',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(100) DEFAULT NULL,
  `type` int(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `transaction` varchar(10000) DEFAULT NULL,
  `reservation` int(100) DEFAULT NULL,
  `response` varchar(10000) DEFAULT NULL,
  `responseCode` varchar(100) DEFAULT NULL,
  `datepayment` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `reservation` (`reservation`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`reservation`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `hotels` int(100) DEFAULT NULL,
  `visible` int(10) DEFAULT NULL,
  `principal` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel` (`hotels`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`hotels`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,NULL,NULL,NULL,'static/descarga_3zAgUGI.jpg',NULL,NULL,NULL),(2,NULL,NULL,NULL,'static/02_chb_search_hotels.jpg',NULL,NULL,NULL),(3,NULL,NULL,NULL,'static/04_chb_choose_hotel_room.jpg',NULL,NULL,NULL),(4,NULL,NULL,NULL,'static/the-westin-o-hare.jpg',NULL,NULL,NULL),(5,NULL,NULL,NULL,'static/wes3495ex.110171_tt.jpg',NULL,NULL,NULL),(6,NULL,NULL,NULL,'static/wes3495ex.110171_tt_3XyK3As.jpg',NULL,NULL,NULL),(7,NULL,NULL,NULL,'static/wes3495ex.110171_tt_6P2HE7I.jpg',NULL,NULL,NULL),(8,NULL,NULL,NULL,'static/wes3495ex.110171_tt_2IEdi3f.jpg',NULL,NULL,NULL),(9,'',NULL,NULL,'static/The-Westin-Cleveland-exterior.jpg',2,NULL,1),(10,'',NULL,NULL,'static/Exterior_View-V2.jpg',2,1,NULL),(11,'',NULL,NULL,'static/wes1993ex-188026-Hotel-Exterior--1-.jpg',2,1,NULL),(12,NULL,NULL,NULL,'static/Westin_Lima.jpg',NULL,NULL,NULL),(13,'',NULL,NULL,'static/wes1023ex.145335_tb-2.jpg',2,1,NULL),(14,NULL,NULL,NULL,'static/Westin_Lima_gp8wW6T.jpg',NULL,NULL,NULL),(15,NULL,NULL,NULL,'static/leia-gas-lift-king-size-bed-frame-1-product-front.png',NULL,NULL,NULL),(16,NULL,NULL,NULL,'static/wes3495ex.110171_tt_XSgUqzJ.jpg',NULL,NULL,NULL),(17,NULL,NULL,NULL,'static/The-Westin-Cleveland-exterior_wFdXJM1.jpg',NULL,NULL,NULL),(18,NULL,NULL,NULL,'static/Noticia-195167-paolo-guerrero.jpg',NULL,NULL,NULL),(19,NULL,NULL,NULL,'static/195905_16052707520042778105.jpg',NULL,NULL,NULL),(20,NULL,NULL,NULL,'static/The-Westin-Cleveland-exterior_7JZiIbJ.jpg',NULL,NULL,NULL),(21,NULL,NULL,NULL,'static/tere-5.jpg',NULL,NULL,NULL),(22,NULL,NULL,NULL,'static/6-9.jpg',NULL,NULL,NULL),(23,NULL,NULL,NULL,'static/292206_15011108360024412299.jpg',NULL,NULL,NULL),(24,NULL,NULL,NULL,'static/very-nice-hotel-and-salted.jpg',NULL,NULL,NULL),(25,NULL,NULL,NULL,'static/hotel-las-flores-ica.jpg',NULL,NULL,NULL),(26,NULL,NULL,NULL,'static/hotel-las-flores-ica_JBjr43x.jpg',NULL,NULL,NULL),(27,NULL,NULL,NULL,'static/hotel-las-flores-ica_0MNX0cd.jpg',NULL,NULL,NULL),(28,NULL,NULL,NULL,'static/292206_15011108360024412299_ByUBco9.jpg',NULL,NULL,NULL),(29,NULL,NULL,NULL,'static/292206_15011108360024412299_37NMlRK.jpg',NULL,NULL,NULL),(30,NULL,NULL,NULL,'static/hotel-las-flores-ica_cvo5DFg.jpg',NULL,NULL,NULL),(31,NULL,NULL,NULL,'static/hotel.jpg',NULL,NULL,NULL),(32,NULL,NULL,NULL,'static/hotel-las-flores-ica_1AXn31t.jpg',NULL,NULL,NULL),(33,NULL,NULL,NULL,'static/hotel-las-flores-ica_IVa4UZl.jpg',NULL,NULL,NULL),(34,NULL,NULL,NULL,'static/hotel-las-flores-ica_bPCeaXX.jpg',NULL,NULL,NULL),(35,NULL,NULL,NULL,'static/hotel-las-flores-ica_z4eqPaf.jpg',NULL,NULL,NULL),(36,NULL,NULL,NULL,'static/292206_15011108360024412299_49HfTIH.jpg',NULL,NULL,NULL),(37,'',NULL,NULL,'static/slider-piscina-ok.jpg',7,NULL,0),(38,'',NULL,NULL,'static/slider-piscina-ok_G3EKMIR.jpg',7,NULL,1),(39,'',NULL,NULL,'static/holiday-inn-hotel-and-suites-mckinney-4020033695-4x3.jpeg',8,NULL,1),(40,'',NULL,NULL,'static/holiday-inn-hotel-and-suites-west-des-moines-2531973843-4x3.jpeg',8,1,NULL),(41,'',NULL,NULL,'static/holiday-inn-the-colony-4629618286-4x3.jpeg',8,1,NULL),(42,'',NULL,NULL,'static/holiday-inn-hotel-and-suites-west-des-moines-2531973843-4x3_K7GTc77.jpeg',8,1,NULL),(43,'',NULL,NULL,'static/holiday-inn-express-and-suites-desoto-4186278663-4x3.jpeg',8,1,NULL),(44,NULL,NULL,NULL,'static/4e39f7e479f29f454b0cff73c242ae4a.jpg',NULL,NULL,NULL),(45,'',NULL,NULL,'static/4e39f7e479f29f454b0cff73c242ae4a_8hxz8T5.jpg',9,NULL,1),(46,'',NULL,NULL,'static/4b1bda81b00f999ccb34a72e9d5b9301.jpg',9,1,NULL),(47,'',NULL,NULL,'static/4b1bda81b00f999ccb34a72e9d5b9301_rcnBY3z.jpg',9,0,NULL),(48,'',NULL,NULL,'static/Vista_lateral_del_Hotel_Francia_Aguascalientes.jpg',9,1,NULL),(49,'',NULL,NULL,'static/holiday-inn-paris-3861976252-4x3.jpeg',9,1,NULL),(50,'',NULL,NULL,'static/7142305554ca8aab760a381d9a960760.jpg',7,1,NULL),(51,'',NULL,NULL,'static/151687952620d55345cca018bf459a6ffa8da361cd.jpg',7,1,NULL),(52,NULL,NULL,NULL,'static/casa-de-praia-2_21032704.jpg',NULL,NULL,NULL),(53,'',NULL,NULL,'static/casa-en-la-playa-878.jpg',7,1,NULL),(54,'',NULL,NULL,'static/Casa_de_montana-Cubierta_Madera.jpg',10,1,0),(55,'',NULL,NULL,'static/20170625_182126-1.jpg',10,NULL,1),(56,'',NULL,NULL,'static/fotosustitucion160075.jpg',10,1,NULL),(57,'',NULL,NULL,'static/20170625_182126-1_o6PLMF2.jpg',10,1,NULL),(58,NULL,NULL,NULL,'static/542574.jpg',NULL,NULL,NULL),(59,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1.jpg',NULL,NULL,NULL),(60,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_Mxau3li.jpg',NULL,NULL,NULL),(61,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_jxm3B2V.jpg',NULL,NULL,NULL),(62,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_p4FzB1h.jpg',NULL,NULL,NULL),(63,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_k88qO6R.jpg',NULL,NULL,NULL),(64,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_OqOhzwi.jpg',NULL,NULL,NULL),(65,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_5tqmlRn.jpg',NULL,NULL,NULL),(66,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_Ljn7T0d.jpg',NULL,NULL,NULL),(67,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_gBTdf2r.jpg',NULL,NULL,NULL),(68,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_99EIukV.jpg',NULL,NULL,NULL),(69,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_PTB4YbK.jpg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `city` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference`
--

LOCK TABLES `reference` WRITE;
/*!40000 ALTER TABLE `reference` DISABLE KEYS */;
INSERT INTO `reference` VALUES (1,'Mc Donals a 2 Km',13);
/*!40000 ALTER TABLE `reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_hotel`
--

DROP TABLE IF EXISTS `reference_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reference` (`reference`),
  KEY `hotel` (`hotel`),
  CONSTRAINT `reference_hotel_ibfk_2` FOREIGN KEY (`reference`) REFERENCES `reference` (`id`),
  CONSTRAINT `reference_hotel_ibfk_3` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_hotel`
--

LOCK TABLES `reference_hotel` WRITE;
/*!40000 ALTER TABLE `reference_hotel` DISABLE KEYS */;
INSERT INTO `reference_hotel` VALUES (1,1,2);
/*!40000 ALTER TABLE `reference_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(100) DEFAULT NULL,
  `traveler_name` varchar(255) DEFAULT NULL,
  `traveler_email` varchar(255) DEFAULT NULL,
  `traveler_mobile` int(11) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `checkindate` datetime DEFAULT NULL,
  `checkoutdate` datetime DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `attendant` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `payment` (`payment`),
  KEY `status` (`status`),
  KEY `hotel` (`hotel`) USING BTREE,
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`payment`) REFERENCES `payment` (`id`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`status`) REFERENCES `reservation_status` (`id`),
  CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (2,NULL,'Admin','admin@choosebookit',980729169,NULL,'2018-07-04 05:00:00','2018-07-07 05:00:00',1,2,'PE-2-2',NULL),(3,NULL,'Admin','admin@choosebookit',980729169,NULL,'2018-07-04 05:00:00','2018-07-07 05:00:00',1,2,'PE-2-3',NULL),(4,NULL,'Admin','admin@choosebookit',980729169,NULL,'2018-07-04 05:00:00','2018-07-07 05:00:00',1,2,'PE-2-4',NULL),(5,NULL,'Admin','admin@choosebookit',980729169,NULL,'2018-07-04 05:00:00','2018-07-07 05:00:00',1,2,'PE-2-5',NULL),(6,NULL,NULL,NULL,NULL,NULL,'2018-08-04 05:00:00','2018-08-05 05:00:00',1,2,'PE-2-6',NULL),(7,NULL,NULL,NULL,NULL,NULL,'2018-07-27 05:00:00','2018-08-03 05:00:00',1,2,'PE-2-7',NULL),(8,NULL,NULL,NULL,NULL,NULL,'2018-08-16 05:00:00','2018-08-23 05:00:00',1,2,'PE-2-8',NULL),(9,NULL,NULL,NULL,NULL,NULL,'2018-08-05 05:00:00','2018-08-31 05:00:00',1,9,'PE-9-9',NULL),(10,NULL,NULL,NULL,NULL,NULL,'2018-07-24 05:00:00','2018-07-27 05:00:00',1,2,'PE-2-10',NULL),(11,NULL,NULL,NULL,NULL,NULL,'2018-07-24 05:00:00','2018-07-27 05:00:00',1,2,'PE-2-11',NULL),(12,NULL,'Andy Jo','joelunmsm@gmail.com',NULL,NULL,'2018-08-02 05:00:00','2018-08-05 05:00:00',1,8,'PE-8-12',NULL),(13,NULL,'','',NULL,NULL,'2018-08-02 05:00:00','2018-08-05 05:00:00',1,8,'PE-8-13',NULL),(14,NULL,'12212','joelunmsm@gmail.com',980729169,NULL,'2018-08-02 05:00:00','2018-08-05 05:00:00',1,10,'PE-10-14',NULL),(15,NULL,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,'2018-08-02 05:00:00','2018-08-05 05:00:00',1,10,'PE-10-15',NULL),(16,NULL,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,'2018-08-02 05:00:00','2018-08-05 05:00:00',1,10,'PE-10-16',NULL),(17,NULL,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,'2018-08-02 05:00:00','2018-08-05 05:00:00',1,9,'PE-9-17',NULL),(18,56,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,'2018-08-02 05:00:00','2018-08-05 05:00:00',3,10,'PE-10-18',NULL),(19,56,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,'2018-08-02 05:00:00','2018-08-05 05:00:00',3,10,'PE-10-19',NULL),(20,57,'1212','joelunmsm@gmail.com',980729169,NULL,'2018-08-02 05:00:00','2018-08-04 05:00:00',3,10,'PE-10-20',NULL),(21,NULL,NULL,NULL,NULL,NULL,'2018-08-23 05:00:00','2018-09-20 05:00:00',1,2,'PE-2-21',NULL),(22,59,NULL,NULL,NULL,NULL,'2018-08-13 05:00:00','2018-08-15 05:00:00',3,10,'PE-10-22',NULL),(23,NULL,NULL,NULL,NULL,NULL,'2018-08-14 05:00:00','2018-08-17 05:00:00',1,10,'PE-10-23',NULL),(24,NULL,NULL,NULL,NULL,NULL,'2018-09-22 05:00:00','2018-09-23 05:00:00',1,8,'PE-8-24',NULL),(25,NULL,NULL,NULL,NULL,NULL,'2018-09-22 05:00:00','2018-09-23 05:00:00',1,10,'PE-10-25',NULL),(26,NULL,NULL,NULL,NULL,NULL,'2018-09-18 05:00:00','2018-09-19 05:00:00',1,9,'PE-9-26',NULL),(27,NULL,NULL,NULL,NULL,NULL,'2018-09-20 05:00:00','2018-09-21 05:00:00',1,9,'PE-9-27',NULL),(28,NULL,NULL,NULL,NULL,NULL,'2018-09-27 05:00:00','2018-09-28 05:00:00',1,2,'PE-2-28',NULL),(29,NULL,NULL,NULL,NULL,NULL,'2018-09-18 05:00:00','2018-09-19 05:00:00',1,2,'PE-2-29',NULL),(30,NULL,'212','212@gmail.com',1221212,NULL,'2018-09-20 05:00:00','2018-09-21 05:00:00',1,2,'PE-2-30',NULL),(31,NULL,NULL,NULL,NULL,NULL,'2018-09-20 05:00:00','2018-09-21 05:00:00',1,2,'PE-2-31',NULL),(32,NULL,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,'2018-09-20 05:00:00','2018-09-21 05:00:00',1,2,'PE-2-32',NULL),(33,NULL,'212','212@gmail.com',1221212,NULL,'2018-09-20 05:00:00','2018-09-22 05:00:00',1,2,'PE-2-33',NULL),(34,NULL,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,'2018-09-21 05:00:00','2018-09-22 05:00:00',1,2,'PE-2-34',NULL),(35,NULL,'Daniel','',982591527,NULL,'2018-10-26 05:00:00','2018-11-02 05:00:00',1,8,'PE-8-35',NULL),(36,NULL,'Daniel','',982591527,NULL,'2018-11-02 05:00:00','2018-11-07 05:00:00',1,8,'PE-8-36',NULL);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_status`
--

DROP TABLE IF EXISTS `reservation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_status`
--

LOCK TABLES `reservation_status` WRITE;
/*!40000 ALTER TABLE `reservation_status` DISABLE KEYS */;
INSERT INTO `reservation_status` VALUES (1,'Requested'),(2,'Cancelated'),(3,'Held'),(4,'Paid');
/*!40000 ALTER TABLE `reservation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `roomstatus` int(100) DEFAULT NULL,
  `hotelroomtemplate` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`roomstatus`),
  KEY `hotel` (`hotel`),
  KEY `photo` (`photo`),
  KEY `hotelroomtemplate` (`hotelroomtemplate`),
  KEY `roomstatus` (`roomstatus`) USING BTREE,
  CONSTRAINT `room_ibfk_3` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`),
  CONSTRAINT `room_ibfk_4` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`),
  CONSTRAINT `room_ibfk_5` FOREIGN KEY (`hotelroomtemplate`) REFERENCES `hotel_roomtemplate` (`id`),
  CONSTRAINT `room_ibfk_6` FOREIGN KEY (`roomstatus`) REFERENCES `room_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (4,'Bed','Esto es un bed',NULL,NULL,1,1,2),(5,'elena','454',NULL,NULL,1,2,2),(6,'101','101',NULL,NULL,1,3,10),(7,'102','101',NULL,NULL,1,3,10),(8,'103','103',NULL,NULL,1,3,10),(9,'104','104',NULL,NULL,1,3,10),(10,'105','105',NULL,NULL,1,3,10),(11,'101','101',NULL,NULL,1,6,9),(12,'102','102',NULL,NULL,1,6,9),(13,'103','103',NULL,NULL,1,6,9),(14,'104','104',NULL,NULL,1,7,9),(15,'105','105',NULL,NULL,1,6,9),(16,'106','106',NULL,NULL,1,7,9),(17,'107','107',NULL,NULL,1,8,9),(18,'101','101',NULL,NULL,1,9,8),(19,'102','102',NULL,NULL,1,9,8),(20,'103','103',NULL,NULL,1,10,8);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_reservation`
--

DROP TABLE IF EXISTS `room_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation` int(100) DEFAULT NULL,
  `room` int(100) DEFAULT NULL,
  `child_occupants` int(100) DEFAULT NULL,
  `adult_occupants` int(100) DEFAULT NULL,
  `extrasingle` varchar(1000) DEFAULT NULL,
  `extradoble` varchar(1000) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room` (`room`),
  KEY `reservation` (`reservation`),
  CONSTRAINT `room_reservation_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`id`),
  CONSTRAINT `room_reservation_ibfk_2` FOREIGN KEY (`reservation`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_reservation`
--

LOCK TABLES `room_reservation` WRITE;
/*!40000 ALTER TABLE `room_reservation` DISABLE KEYS */;
INSERT INTO `room_reservation` VALUES (1,5,5,1,0,'0','0',200),(2,5,4,0,1,'0','0',255),(3,6,4,0,20,'0','0',5100),(4,7,4,0,20,'0','0',5100),(5,8,4,0,2,'0','0',510),(6,9,11,0,5,'0','0',125),(7,10,5,1,1,'0','0',200),(8,11,5,0,1,'0','0',200),(9,12,18,0,2,'0','0',20),(10,13,18,0,2,'0','0',20),(11,14,6,0,1,'0','0',21),(12,15,6,0,1,'0','0',21),(13,16,6,0,1,'0','0',21),(14,17,11,0,1,'0','0',25),(15,18,6,0,1,'0','0',21),(16,19,6,0,1,'0','0',21),(17,20,6,0,1,'0','0',21),(18,21,4,0,1,'0','0',255),(19,23,6,0,1,'0','0',21),(20,24,20,0,1,'0','0',20),(21,25,6,0,2,'0','0',42),(22,26,11,0,2,'0','0',50),(23,27,11,0,2,'0','0',50),(24,28,4,0,1,'0','0',255),(25,29,4,0,1,'0','0',255),(26,30,4,0,1,'0','0',255),(27,31,4,0,1,'0','0',255),(28,32,4,0,1,'0','0',255),(29,33,4,0,1,'0','0',255),(30,34,4,0,1,'0','0',255),(31,35,18,0,1,'0','0',10),(32,35,20,1,1,'0','0',20),(33,36,20,1,1,'0','0',20);
/*!40000 ALTER TABLE `room_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_status`
--

DROP TABLE IF EXISTS `room_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_status` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_status`
--

LOCK TABLES `room_status` WRITE;
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;
INSERT INTO `room_status` VALUES (1,'Available'),(2,'No Available'),(3,'Cancelated');
/*!40000 ALTER TABLE `room_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtemplate`
--

DROP TABLE IF EXISTS `roomtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_es` varchar(100) DEFAULT NULL,
  `default_bed` int(100) DEFAULT NULL,
  `total_occupancy_limit` int(100) DEFAULT NULL,
  `adult_occupancy_limit` int(100) DEFAULT NULL,
  `child_occupancy_limit` int(100) DEFAULT NULL,
  `bath` int(100) DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtemplate`
--

LOCK TABLES `roomtemplate` WRITE;
/*!40000 ALTER TABLE `roomtemplate` DISABLE KEYS */;
INSERT INTO `roomtemplate` VALUES (1,'Bed','Cama',1,20,20,0,0,1),(2,'Private Bed','Cama Privada',1,2,2,1,0,1),(3,'Single','Individual',1,2,1,1,1,1),(4,'Single Superior','Individual Superior',1,2,1,1,1,1),(5,'Double','Doble',2,4,2,2,1,1),(6,'Double Superior','Doble Superior',2,4,2,2,1,1),(7,'Triple','Triple',3,4,3,1,1,1),(8,'Triple Superior','Triple Superior',3,4,3,2,1,0),(9,'Suite','Suite',2,3,2,2,1,0),(10,'Suite Superior','Suite Superior',2,3,2,2,1,0),(13,'Template 1',NULL,2,2,2,2,2,0),(14,'Template 2',NULL,2,2,2,2,2,0),(15,'Template 3',NULL,2,1,2,1,1,0),(16,'Template 4',NULL,2,2,2,2,1,0);
/*!40000 ALTER TABLE `roomtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_smtp` varchar(1000) DEFAULT NULL,
  `user` varchar(1000) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `port` varchar(1000) DEFAULT NULL,
  `api` varchar(1000) DEFAULT NULL,
  `utc` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (1,'mail.hermes.pe','cotiza@hermes.pe','cotizahermes','25','','');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'User'),(2,'Admin'),(3,'Owner');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_notification`
--

DROP TABLE IF EXISTS `tipo_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_en` varchar(1000) DEFAULT NULL,
  `body_es` varchar(1000) DEFAULT NULL,
  `perfil` int(11) DEFAULT NULL,
  `subject_en` varchar(1000) DEFAULT NULL,
  `subject_es` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_notification`
--

LOCK TABLES `tipo_notification` WRITE;
/*!40000 ALTER TABLE `tipo_notification` DISABLE KEYS */;
INSERT INTO `tipo_notification` VALUES (1,'21','12',2,'1212','2121',NULL),(2,'212','2121',2,'21','21212',121),(3,'2121','2121',2,'212','2121',212),(4,'2121','212',3,'212','2121',212),(5,'212','2122',1,'212','2121',212);
/*!40000 ALTER TABLE `tipo_notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-20  2:58:11
