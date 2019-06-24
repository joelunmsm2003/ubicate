-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: choose
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity`
--

LOCK TABLES `amenity` WRITE;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` VALUES (1,'Gimnasio','Gimnasio',NULL,''),(2,'ooii','',NULL,''),(3,'Casita','',NULL,''),(4,'sdsd','',NULL,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$TDU727idzUaF$72tTOdDelPLak7x7iJ3p/BnDLboJ0CpukQLcw4MDhD4=','2019-05-20 05:17:53',1,'admin','Admin','','admin@choosebookit',1,1,'2016-11-21 17:06:43',2,980729169,NULL,3,949494,NULL,NULL,NULL,NULL,NULL,'en',NULL,NULL,NULL,NULL,NULL),(2,'pbkdf2_sha256$24000$ISzK27tOwgwR$lmKsu6MkxmPgdtm98BbUrgiX18bHXBO9GXP2r8QqCvk=','2019-06-03 16:56:13',1,'root','Andy','Jo','joelunmsm@gmail.com',1,1,'2018-04-05 12:57:56',3,980729169,NULL,NULL,NULL,'',NULL,NULL,'','','','','','','',''),(3,'pbkdf2_sha256$24000$6EBqBbjfICNy$wP8yT7xjuJmtntXTF5QqEWkbBE94Tn5l11nhEjB2wSY=',NULL,0,'joel','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 18:46:46',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'pbkdf2_sha256$24000$tcXTdP5t7Onf$XffnCEU56Dsh62eeTqgBe83PjD8nFpVdFsL01zNAUuA=',NULL,0,'JOEL123','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 18:52:07',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'pbkdf2_sha256$24000$KZsETnwKljes$eSTU2DjtmrpnrvxN60ubVD8r3nS9PqmavxC1F+Nxs5E=',NULL,0,'prueba','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:00:34',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'pbkdf2_sha256$24000$GfmuMcXg0T3O$BCl1bO0nRSXg6cFAqxct7mFSYQnClQqQNyDJGJU0sxY=',NULL,0,'joel234','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:01:50',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'pbkdf2_sha256$24000$XQvYMmZk84wp$4tHemZOirmctlU+W3dVz1f34JkdASijTKi22kTxMI3E=',NULL,0,'joel2344','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:06:48',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'pbkdf2_sha256$24000$hHSjBeUa2Ztf$Nijs55IJJnRw2WMA5sC7D5u9hTs+LpmuIT6UPuXr05w=',NULL,0,'joel23445','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:09:21',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'pbkdf2_sha256$24000$1pLIYybb8D46$25NHRNLoTo8mIaO0hB42AlJkRC0ALu7Q8XP+mqa7qb4=',NULL,0,'joel234459','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:10:19',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'pbkdf2_sha256$24000$LY82KH7Ma2Ef$i+9mRqhE6dXZWSYsy8QeRVlojQVZTPNFFzpx2BGtsaI=',NULL,0,'joel23qqq44593','Joel','','joelunmsm@gmail.com',0,1,'2018-04-06 19:11:31',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'pbkdf2_sha256$24000$2aqMK9BR6G5M$9sCSe9FXyijeXKcCOcMlH0IeYMhiV4hGks+g8kdPHCo=',NULL,0,'12121','121','','joelunmms@gmail.com',0,1,'2018-04-07 04:20:20',1,212212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'pbkdf2_sha256$24000$DgaYodBRBiXo$BlHTSkmXePpucBojllmJL3gItqqFL1inDQrjlHPLV+k=',NULL,0,'1212166','121','','joelunmms@gmail.com',0,1,'2018-04-07 04:34:31',1,212212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'pbkdf2_sha256$24000$cBmxWnKGZaPo$8nIDWMQf5/e5yybghwYjcgxOe5VgFLDvRa7vqernXrE=',NULL,0,'12121668','121','','joelunmsm@gmail.com',0,1,'2018-04-07 04:40:08',1,212212,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'pbkdf2_sha256$24000$GXDcVIUZPRuE$sKFfxlkBTfJB/tDRYY2BfBJZzV8prejUudY0BVvuBqI=',NULL,0,'joelunmsm2003','Joel','','joelunmsm@gmail.com',0,1,'2018-06-17 17:56:58',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'pbkdf2_sha256$24000$J1VfvIgcKNnb$vxHLuJ/M3dbzeAjeEHa3Maa2HxXb7KFJBib9H0fC0EI=',NULL,0,'joelunmsm20031','Joel','','joelunmsm@gmail.com',0,1,'2018-06-17 18:02:43',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'pbkdf2_sha256$24000$K9V3AWvX7Mrr$jrfVmTUCabIv360q1cWF+uyzH7lSDqVamf5WitQw3WI=',NULL,0,'joelunmsm200389','Joel','','joelunmsm@gmail.com',0,1,'2018-06-17 18:05:44',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'pbkdf2_sha256$24000$TItbhkOHdeGN$NCjPP1tlJxCT+doPsplUxog87kWuR00M15ab/aNW2ng=',NULL,0,'212','212','','221@gmail.com',0,1,'2018-06-17 18:08:41',3,212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'pbkdf2_sha256$24000$fJWOuH5JZ8u7$UV/jYW+YmbielBcOrfSCmaXrsG0Yu0zz6S0zWrAWq6I=',NULL,0,'joel2','joel','','joelunmsm@gmail.com',0,1,'2018-06-19 00:16:18',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'pbkdf2_sha256$24000$GKsycCLVw95z$KsnAO5whUYrXXuRDOkMx8oeT5y5inw9F3NYFyzTzWDk=',NULL,0,'21222','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-06-19 00:20:31',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'pbkdf2_sha256$24000$Dm8HWjCGmmGp$j4G9ANim5BmP05EdbROsSRPINadEJPO53SX+RSIpz3c=',NULL,0,'2121','212','','212@gmail.com',0,1,'2018-06-19 02:47:25',3,1221212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'pbkdf2_sha256$24000$xOaSQNJhl3QD$GX57vKXQRxcCBU12XrihmfI0zuKD9PdDR43yGlz/8pY=',NULL,0,'21212121','121','','212121@gmail.com',0,1,'2018-06-19 02:49:12',3,21212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'pbkdf2_sha256$24000$vnL7IHPUX3e0$dEdo3WUPLq0Xpn/JfxvSVBk42obxp+yQKamyw5s5/wk=',NULL,0,'2121212','212','','21212ss@gmail.com',0,1,'2018-06-19 02:52:08',3,21212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'pbkdf2_sha256$24000$RvPPgd8mqexI$CT1gahBWG0M2iCG7WJ9Iqc5ZJngUnU/6ssSEEYyBpVE=','2018-09-18 18:40:41',0,'owner','Andy','Jo','joelunmsm@gmail.com',0,1,'2018-06-19 02:57:28',3,980729169,NULL,18,1,'',NULL,1,'','','','','','','',''),(38,'pbkdf2_sha256$24000$JtpqZa5wDmGV$ngRvA2FQyQ6pwt0FKGXzWlxhGwhWtWLg6Tx2+mlor5Y=',NULL,0,'2121222','221','','joelunmsm@gmail.com',0,1,'2018-06-19 03:04:27',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'pbkdf2_sha256$24000$rfWVhsN3XmsH$XYJugrTwxEY0m1NJo2CByRn2RvVZGYgNswcua3t6BhY=',NULL,0,'212122','212','','21aa212@gmail.com',0,1,'2018-06-19 03:12:24',3,21212,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'pbkdf2_sha256$24000$LsNmbRYzVxZd$5YFuocezOYBc12et5grLUZ1G5HBjMTbWbCsm3r2N/uw=',NULL,0,'1221','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-06-19 03:15:17',3,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'es',NULL,NULL,NULL,NULL,NULL),(41,'pbkdf2_sha256$24000$WPqoyvPhcc7Q$kDy1kpAarv2pCDMzM0ue5AeLtIk67iDhv59HnQYnc8g=',NULL,0,'wwww','qwqw','','joelunmsm@gmail.com',0,1,'2018-06-19 05:23:26',3,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'pbkdf2_sha256$24000$ety1yNR40hig$qzDq4TxXQxLMQprVXw49kNApcu2w+UnEp2yno/TyMA8=',NULL,0,'teresa','Teresa','','joelunmsm@gmail.com',0,1,'2018-07-05 05:55:10',3,980729190,NULL,22,NULL,'Kenya',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'pbkdf2_sha256$24000$LGtcsSFc9S4V$hHPIZHzy+GlT3olbqB/yDcrK0P3v3t3KhpmbGq+Xnho=',NULL,0,'andyrosas','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-07-13 01:45:27',3,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'pbkdf2_sha256$24000$QkmndPbEcpcl$WjWyUafCLMOqzeVo6qpN/TZtPhVl+xjvNPKOd4Y9aUQ=',NULL,0,'andrescarlos','Andres Carlos','','joelunmsm@gmail.com',0,1,'2018-07-13 01:56:28',3,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'pbkdf2_sha256$24000$VuK8mRvPfaBJ$ufxM9qgrIgJm5MoJzuKdTUasBwAqQn+/CTQ6hILQuME=',NULL,0,'betorortiz','Beto Ortiz','','joelunmsm@gmail.com',0,1,'2018-07-13 02:09:23',3,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,'LIMA 33',NULL,'9999iiijjjoooi','Surco','E3','666778uu',NULL),(46,'pbkdf2_sha256$24000$Tp6512VzGecu$i/xfyeRocAw11INSVD5VYKbl4jzv992TiJ9V2QQxvB0=',NULL,0,'joelunmsm','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:27:14',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'pbkdf2_sha256$24000$JaWsSUSaJCa8$xmc+35x/Q0z0aB/XoHQ0meHs5ceQ9K8WqGhE8VHgbf4=',NULL,0,'joel2018','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:38:06',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'pbkdf2_sha256$24000$e1L76GjmEZgA$SGlJYhQDzdXKqloi/mJW2GS5qkZ066gejJKGFls0uOo=',NULL,0,'121213','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:47:34',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'pbkdf2_sha256$24000$p4ksFGFimZKD$LZTnp0oLULkLNfKuca+kycxI5O0prVmVFfbYj8DfhAA=',NULL,0,'decece','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:48:14',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'pbkdf2_sha256$24000$4GnmAs9caEc7$IuS0iYCE1MR+MRXN5Js8GEgzG+wioJ2v5KTkzoEGrCI=',NULL,0,'deded','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:49:32',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'pbkdf2_sha256$24000$U0HdmKYAVqVj$dL8Ql0TQhmy6iyk3jizTdK06zAXO4HqxiiXin9sMtnI=',NULL,0,'dedeccc','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:50:16',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'pbkdf2_sha256$24000$i79GH3xKGcdm$a0A9HFBYBNWZkwDryVjA8cC7oE1/yx3ULTbCcfn3Wpo=',NULL,0,'212121212','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:51:06',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'pbkdf2_sha256$24000$oehTn4CRSLJ3$HNs6unWI0a3JX9cr9DaUOA52UemLgNl/uFxn++CWK/Q=',NULL,0,'dsds','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:55:01',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'pbkdf2_sha256$24000$PbjGGtfPImQU$Vdzk0sT70eyQFz8xcQ0bcGUI2j0PyRE6we4VYDm+CE8=',NULL,0,'2121212121','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:56:10',1,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'pbkdf2_sha256$24000$FGU6JzNY3BpS$otrlr9AQiMafmeOdCrRXl5WCBGvrQxGQrYgkHsoJFB0=',NULL,0,'2121221','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 19:58:35',1,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,'212',NULL,'12121','212','212','212',NULL),(57,'pbkdf2_sha256$24000$O5JNIHMflUny$507pCrcftG2jtqktT2ehgaMXknV8FUUA6u36BJxTufw=',NULL,0,'21212212','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-02 20:59:58',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'pbkdf2_sha256$24000$J9UnZj0H70wS$9EcDLkM+JVU6oFswAhsyZ+TQGk9tcy/2WbYcXxcepr0=',NULL,0,'papo','Papo','','deboheme@hotmail.com',0,1,'2018-08-08 19:12:00',3,987654321,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'pbkdf2_sha256$24000$bf9Huq8u0545$SSVAT9wQnS6VAlUPQsm3U0GCZ/FycCm0CX9ZgFsz/Kw=',NULL,0,'Andy Jo','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-08-13 15:39:27',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'pbkdf2_sha256$24000$h6fTjg9xvoSp$qIZKNMB4Ebavhot9zNo6xpkjZUT+o2bWh2QkxksSDxY=',NULL,0,'elenaunmsm2003','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 16:49:41',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'pbkdf2_sha256$24000$HDU1mzCKeUQU$pekp/mIwvRKepTmuJj8C5gBV+HYAacsjYR4oSry2iy0=',NULL,0,'eden','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 17:14:47',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'pbkdf2_sha256$24000$qF0ykS0tmR01$pW0cxyTE/LOKn7R1EjQyT5NldgHi5v7qehUErwexjKg=',NULL,0,'ytoow','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 17:42:44',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'pbkdf2_sha256$24000$rwtD0JwD37M5$p/qQ9Dr+gv1VXT9NJ9u5tigHHBshwxtQuRx0Ae89CWI=',NULL,0,'454','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 17:55:05',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'pbkdf2_sha256$24000$y9qDjUJOl0ZN$R4j8l5Mp33IAsLvQdxdF8AOl+aDoSDJDQIa+60dZO/A=',NULL,0,'3232','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:08:24',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'pbkdf2_sha256$24000$9i0X1d3gvBZe$EjW/JmD5gdKNXIcUcKrwVr6ZMecyBBlt7N1k6q5wW4w=',NULL,0,'213','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:11:31',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'pbkdf2_sha256$24000$nBRlPvxXFmhD$J8vTnpB0a2YPCdgxHXI71aVBaJ9HFt6VaqngW8Bjd+4=',NULL,0,'323op','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:12:21',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'pbkdf2_sha256$24000$fuUR3xMP8eHk$+BG0Ad6oP0kv8m9HRcUWhdMdZ8/uF0LnrReRB8Hi218=',NULL,0,'323opooo','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:12:26',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'pbkdf2_sha256$24000$wMGPV2Zf4yYp$rT5i2nMXamaK+90VAXE7b4heyCGhZQoPLyp0p7W9X5o=',NULL,0,'pppp','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:14:45',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'pbkdf2_sha256$24000$d83KGs5N92IY$rMx/0SdjCVtUwgADiLjJEtgfxzHDrlWIqsCAYnObmjg=',NULL,0,'6656','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:23:00',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'pbkdf2_sha256$24000$j9IfKX3CnfjT$F3OjuPsO5EcgSdwJnYuM5BYyfFJApEeJ5Tn5YCcLoLQ=',NULL,0,'ooo','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:28:41',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'pbkdf2_sha256$24000$5UYz6BM6Y06o$gIngqYgkMTbyK/tyTXR9fEYY/VMB3swCSUOqy4nJ6Bc=',NULL,0,'65656','Andy Jo','','joelunmsm@gmail.com',0,1,'2018-09-18 18:29:32',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,'212',NULL,'212','21212','2121','212121',NULL),(75,'pbkdf2_sha256$24000$MXuzgPPWoEH9$K4zcAXkXZF4UHX3f8un8dR2meqQwz+bZYaMIXgYNfSw=',NULL,0,'dcav','Daniel','','',0,1,'2018-10-11 02:03:23',1,982591527,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,'pbkdf2_sha256$24000$BGfFdABcVg7O$OpCxQNXHZwUhRdmsf+8zViYeqN+tFUkvdLujf2asj9c=',NULL,0,'luiscav','Luis','','lcavagna@icloud.com',0,1,'2019-01-12 22:47:56',1,982591527,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,'pbkdf2_sha256$24000$18ve2hXjTkQK$azAm57mw7EgU+4MqLgtdkxCFI9gI4NSHAN1C5m6SoX8=','2019-04-15 02:10:32',0,'cavsal','Andy','Jo','joelunmsm@gmail.com',0,1,'2019-01-12 22:48:12',1,980729169,4,NULL,NULL,'',NULL,0,'','web','','eww','web','web','web',''),(80,'pbkdf2_sha256$24000$MF8d2OGMw4Qh$EQbCGg6sCHuud++sIZkPoShy3b1Hx+KBxLmBRJzBpqM=',NULL,0,'2323','3232','','323',0,1,'2019-04-15 03:46:25',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(111,'pbkdf2_sha256$24000$RQ461R1YgJhv$LRMJ1dibVdmg/NnXOGJ4l2wYoBybxmkiFEHADQ/7Q2A=',NULL,0,'212ññ','212','','21212',0,1,'2019-04-15 04:47:08',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(115,'pbkdf2_sha256$24000$4xv6OUCW6EMs$pdHXZWQs3Ke97OeyF8sZ0wxsrPGFOpCLziiGk+6tA5k=',NULL,0,'212o9','212','','21212',0,1,'2019-04-15 04:52:07',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,'pbkdf2_sha256$24000$c5fru532NB2V$zaDqJGh0KkyvBxYPjyiOdgULNP9Mt3Fwi+/HWjMa+wI=',NULL,0,'212o9o','212','','21212',0,1,'2019-04-15 04:53:05',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,'pbkdf2_sha256$24000$FCWS6weIjvgB$1a64xQiJr6mB8QnJy4AbXvmM3hQN0JIyX18gH2JkyW4=',NULL,0,'212o9o89','212','','21212',0,1,'2019-04-15 04:55:11',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,'pbkdf2_sha256$24000$ra9pWIxWhvWB$RyL7MwAEQkJ1lQlCRSqZEcE0oYh5ipFqi3cEDhCFL14=',NULL,0,'212o9o89o9','212','','21212',0,1,'2019-04-15 04:55:34',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,'pbkdf2_sha256$24000$tiz9rrv1BXCM$7/9GSrXbNvqxQhAWdp67+REOpFvbQRZi+tAoq7hifEs=',NULL,0,'212o9o89o9fffww','212','','21212',0,1,'2019-04-15 04:56:25',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,'pbkdf2_sha256$24000$I4gOiwZYTWeZ$z4AvaLNRAKOsWm87oXWvE3kNuX+M688AhcyZqP63Wmg=',NULL,0,'212o9o89o9fffwwdd','212','','21212',0,1,'2019-04-15 04:57:32',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(126,'pbkdf2_sha256$24000$2XSjNrqiW9se$GA6h7yI+xv0QzS8XRVyHoERmJuVgjQsYxuxRGX+WGPg=',NULL,0,'32wew','3232','','3232',0,1,'2019-04-15 05:00:09',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(127,'pbkdf2_sha256$24000$1XRTYVow3m3a$qpQwjyDkde69K0NvZiHTaym4i3fImP2W8dHQRJDHXJo=',NULL,0,'pepe','Pepe','','pepe@gmail.com',0,1,'2019-04-15 05:07:18',1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(128,'pbkdf2_sha256$24000$WgQjbTcqUcQQ$hvBGklq/q9bCoiFTggfotsjHRji14nsAMB9JSAxyTes=',NULL,0,'gcarlin','Guillermo Antonio Carlin','','guillermo@a51.technology',0,1,'2019-05-03 17:08:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,'pbkdf2_sha256$24000$duLrxO8gZv62$PcIDUZEQsc67qarIEOfXDKHJVlGVj63Ttc06HcyN2Rg=',NULL,0,'carlitos','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-05 18:43:22',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,'pbkdf2_sha256$24000$W2RPT3udPvxc$4Q04oKlE8Gas5e3CzIMyetRK6VM3rcPmAY0BPv5Q0+Y=',NULL,0,'nenita','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-05 18:43:46',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,'pbkdf2_sha256$24000$666TKDAktD3f$+02vDc1+LjEcQaitNXqOPHrzSDW7KbR3f08id459QNk=',NULL,0,'rrrerer','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-05 18:46:41',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,'pbkdf2_sha256$24000$F6p3UVyAPcPn$hyknASwwqO1xd2EsV5GlWdmlUQRYcvOOD3Fta+e9nik=',NULL,0,'rrrerer33','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-05 18:55:23',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,'pbkdf2_sha256$24000$I0wqULqwbSBb$2ZaH8LypCS8YfmJb0Vu6i5zXTSqBXAIiYEVSKX7U7n0=',NULL,0,'lolita','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-06 03:59:39',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,'pbkdf2_sha256$24000$KgjO08ZTuiA0$SdQo/hiIMN8bzTsiqawwiq4NJEXJSvdxxbElJIEUtj0=',NULL,0,'gerte','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-06 04:12:21',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,'pbkdf2_sha256$24000$bZ3DaX2KsAAb$ecfP3mmUFi0OxbC5RRAj2An/BA1n6UxmSQB6QUV/3Vc=',NULL,0,'oplopo','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-06 04:18:08',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,'pbkdf2_sha256$24000$3rQTWvvnH5Wl$VwbX9na2kJsixLMwboZDqBcanv0PQwNI7+jWJ9qEVHQ=',NULL,0,'AndycJo','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-06 04:30:34',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,'pbkdf2_sha256$24000$XSJtLCYLl4ZG$/oCmb2x+5nFs00OCZHQ+E7Vt3Lm0D+9DFKzpZfhb/gs=',NULL,0,'Andylll','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-06 04:38:18',1,980729169,NULL,NULL,NULL,NULL,NULL,0,NULL,'3232',NULL,'32','323','323','32',NULL),(142,'pbkdf2_sha256$24000$Vh0vFhWAVkOX$PxHw5E8AWRP1eGheZgTW/qh6eRUSwt3+VtxCjW3nAOQ=',NULL,0,'andicito','Andy Jo','','joelunmsm@gmail.com',0,1,'2019-05-14 04:23:38',1,980729169,NULL,NULL,NULL,NULL,NULL,1,NULL,'ewe',NULL,'ewewe','a','E3','43434',NULL),(143,'pbkdf2_sha256$24000$zGAzc6DTFbTm$e2U4tQu/OK6T7ZtYszr8t4jg1E96gHwQ6ndB+WDJaQw=',NULL,0,'gcarlin26','','','guillermo@a51.technology',0,1,'2019-06-01 02:01:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=907 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-05 13:13:53','75','City object',2,'Changed caption.',1,2),(2,'2018-04-05 13:13:53','74','City object',2,'Changed caption.',1,2),(3,'2018-04-05 13:13:53','73','City object',2,'Changed caption.',1,2),(4,'2018-04-05 13:13:53','72','City object',2,'Changed caption.',1,2),(5,'2018-04-05 13:13:53','71','City object',2,'Changed caption.',1,2),(6,'2018-04-05 13:13:53','70','City object',2,'Changed caption.',1,2),(7,'2018-04-05 13:13:53','69','City object',2,'Changed caption.',1,2),(8,'2018-04-05 13:13:53','68','City object',2,'Changed caption.',1,2),(9,'2018-04-05 13:13:53','67','City object',2,'Changed caption.',1,2),(10,'2018-04-05 13:13:53','66','City object',2,'Changed caption.',1,2),(11,'2018-04-05 13:13:53','65','City object',2,'Changed caption.',1,2),(12,'2018-04-05 13:13:53','64','City object',2,'Changed caption.',1,2),(13,'2018-04-05 13:13:53','63','City object',2,'Changed caption.',1,2),(14,'2018-04-05 13:13:53','62','City object',2,'Changed caption.',1,2),(15,'2018-04-05 13:13:53','61','City object',2,'Changed caption.',1,2),(16,'2018-04-05 13:13:53','60','City object',2,'Changed caption.',1,2),(17,'2018-04-05 13:13:53','59','City object',2,'Changed caption.',1,2),(18,'2018-04-05 13:13:53','58','City object',2,'Changed caption.',1,2),(19,'2018-04-05 13:13:53','57','City object',2,'Changed caption.',1,2),(20,'2018-04-05 13:13:53','56','City object',2,'Changed caption.',1,2),(21,'2018-04-05 13:13:53','55','City object',2,'Changed caption.',1,2),(22,'2018-04-05 13:13:53','54','City object',2,'Changed caption.',1,2),(23,'2018-04-05 13:13:53','53','City object',2,'Changed caption.',1,2),(24,'2018-04-05 13:13:53','52','City object',2,'Changed caption.',1,2),(25,'2018-04-05 13:16:06','51','City object',2,'Changed caption.',1,2),(26,'2018-04-05 13:16:06','50','City object',2,'Changed caption.',1,2),(27,'2018-04-05 13:16:06','49','City object',2,'Changed caption.',1,2),(28,'2018-04-05 13:16:06','48','City object',2,'Changed caption.',1,2),(29,'2018-04-05 13:16:06','47','City object',2,'Changed caption.',1,2),(30,'2018-04-05 13:16:06','46','City object',2,'Changed caption.',1,2),(31,'2018-04-05 13:16:06','45','City object',2,'Changed caption.',1,2),(32,'2018-04-05 13:16:06','44','City object',2,'Changed caption.',1,2),(33,'2018-04-05 13:16:06','43','City object',2,'Changed caption.',1,2),(34,'2018-04-05 13:16:06','42','City object',2,'Changed caption.',1,2),(35,'2018-04-05 13:16:06','41','City object',2,'Changed caption.',1,2),(36,'2018-04-05 13:16:06','40','City object',2,'Changed caption.',1,2),(37,'2018-04-05 13:16:06','39','City object',2,'Changed caption.',1,2),(38,'2018-04-05 13:16:06','38','City object',2,'Changed caption.',1,2),(39,'2018-04-05 13:16:06','37','City object',2,'Changed caption.',1,2),(40,'2018-04-05 13:16:06','36','City object',2,'Changed caption.',1,2),(41,'2018-04-05 13:16:06','35','City object',2,'Changed caption.',1,2),(42,'2018-04-05 13:16:06','34','City object',2,'Changed caption.',1,2),(43,'2018-04-05 13:16:06','33','City object',2,'Changed caption.',1,2),(44,'2018-04-05 13:16:06','32','City object',2,'Changed caption.',1,2),(45,'2018-04-05 13:16:06','31','City object',2,'Changed caption.',1,2),(46,'2018-04-05 13:16:06','30','City object',2,'Changed caption.',1,2),(47,'2018-04-05 13:16:06','28','City object',2,'Changed caption.',1,2),(48,'2018-04-05 13:16:06','27','City object',2,'Changed caption.',1,2),(49,'2018-04-05 13:16:06','26','City object',2,'Changed caption.',1,2),(50,'2018-04-05 13:16:06','25','City object',2,'Changed caption.',1,2),(51,'2018-04-05 13:16:06','24','City object',2,'Changed caption.',1,2),(52,'2018-04-05 13:16:06','22','City object',2,'Changed caption.',1,2),(53,'2018-04-05 13:16:06','21','City object',2,'Changed caption.',1,2),(54,'2018-04-05 13:16:06','20','City object',2,'Changed caption.',1,2),(55,'2018-04-05 13:16:06','19','City object',2,'Changed caption.',1,2),(56,'2018-04-05 13:16:06','18','City object',2,'Changed caption.',1,2),(57,'2018-04-05 13:16:06','17','City object',2,'Changed caption.',1,2),(58,'2018-04-05 13:16:06','16','City object',2,'Changed caption.',1,2),(59,'2018-04-05 13:16:06','15','City object',2,'Changed caption.',1,2),(60,'2018-04-05 13:16:06','14','City object',2,'Changed caption.',1,2),(61,'2018-04-05 13:16:06','13','City object',2,'Changed caption.',1,2),(62,'2018-04-05 13:16:06','12','City object',2,'Changed caption.',1,2),(63,'2018-04-05 13:16:06','11','City object',2,'Changed caption.',1,2),(64,'2018-04-05 13:16:06','10','City object',2,'Changed caption.',1,2),(65,'2018-04-05 13:16:06','9','City object',2,'Changed caption.',1,2),(66,'2018-04-05 13:16:06','8','City object',2,'Changed caption.',1,2),(67,'2018-04-05 13:16:06','7','City object',2,'Changed caption.',1,2),(68,'2018-04-05 13:16:06','6','City object',2,'Changed caption.',1,2),(69,'2018-04-05 13:16:06','5','City object',2,'Changed caption.',1,2),(70,'2018-04-05 13:16:06','4','City object',2,'Changed caption.',1,2),(71,'2018-04-05 13:16:06','1','City object',2,'Changed caption.',1,2),(72,'2018-04-06 17:47:23','183','Interest object',2,'Changed caption.',2,2),(73,'2018-04-06 17:47:23','182','Interest object',2,'Changed caption.',2,2),(74,'2018-04-06 17:47:23','181','Interest object',2,'Changed caption.',2,2),(75,'2018-04-06 17:47:23','180','Interest object',2,'Changed caption.',2,2),(76,'2018-04-06 17:47:23','179','Interest object',2,'Changed caption.',2,2),(77,'2018-04-06 17:47:23','178','Interest object',2,'Changed caption.',2,2),(78,'2018-04-06 17:47:23','177','Interest object',2,'Changed caption.',2,2),(79,'2018-04-06 17:47:23','176','Interest object',2,'Changed caption.',2,2),(80,'2018-04-06 17:47:23','175','Interest object',2,'Changed caption.',2,2),(81,'2018-04-06 17:47:23','174','Interest object',2,'Changed caption.',2,2),(82,'2018-04-06 17:47:23','173','Interest object',2,'Changed caption.',2,2),(83,'2018-04-06 17:47:23','172','Interest object',2,'Changed caption.',2,2),(84,'2018-04-06 17:47:23','171','Interest object',2,'Changed caption.',2,2),(85,'2018-04-06 17:47:23','170','Interest object',2,'Changed caption.',2,2),(86,'2018-04-06 17:47:23','169','Interest object',2,'Changed caption.',2,2),(87,'2018-04-06 17:47:23','168','Interest object',2,'Changed caption.',2,2),(88,'2018-04-06 17:47:23','167','Interest object',2,'Changed caption.',2,2),(89,'2018-04-06 17:47:23','166','Interest object',2,'Changed caption.',2,2),(90,'2018-04-06 17:47:23','165','Interest object',2,'Changed caption.',2,2),(91,'2018-04-06 17:47:23','164','Interest object',2,'Changed caption.',2,2),(92,'2018-04-06 17:47:23','163','Interest object',2,'Changed caption.',2,2),(93,'2018-04-06 17:47:23','162','Interest object',2,'Changed caption.',2,2),(94,'2018-04-06 17:47:23','161','Interest object',2,'Changed caption.',2,2),(95,'2018-04-06 17:47:23','160','Interest object',2,'Changed caption.',2,2),(96,'2018-04-06 17:47:23','159','Interest object',2,'Changed caption.',2,2),(97,'2018-04-06 17:47:23','158','Interest object',2,'Changed caption.',2,2),(98,'2018-04-06 17:47:23','157','Interest object',2,'Changed caption.',2,2),(99,'2018-04-06 17:47:23','156','Interest object',2,'Changed caption.',2,2),(100,'2018-04-06 17:47:23','155','Interest object',2,'Changed caption.',2,2),(101,'2018-04-06 17:56:08','154','Interest object',2,'Changed caption.',2,2),(102,'2018-04-06 17:56:08','153','Interest object',2,'Changed caption.',2,2),(103,'2018-04-06 17:56:08','152','Interest object',2,'Changed caption.',2,2),(104,'2018-04-06 17:56:08','151','Interest object',2,'Changed caption.',2,2),(105,'2018-04-06 17:56:08','150','Interest object',2,'Changed caption.',2,2),(106,'2018-04-06 17:56:08','149','Interest object',2,'Changed caption.',2,2),(107,'2018-04-06 17:56:08','148','Interest object',2,'Changed caption.',2,2),(108,'2018-04-06 17:56:08','147','Interest object',2,'Changed caption.',2,2),(109,'2018-04-06 17:56:08','146','Interest object',2,'Changed caption.',2,2),(110,'2018-04-06 17:56:08','145','Interest object',2,'Changed caption.',2,2),(111,'2018-04-06 17:56:08','144','Interest object',2,'Changed caption.',2,2),(112,'2018-04-06 17:56:08','143','Interest object',2,'Changed caption.',2,2),(113,'2018-04-06 17:56:08','142','Interest object',2,'Changed caption.',2,2),(114,'2018-04-06 17:56:08','141','Interest object',2,'Changed caption.',2,2),(115,'2018-04-06 17:56:08','140','Interest object',2,'Changed caption.',2,2),(116,'2018-04-06 17:56:08','139','Interest object',2,'Changed caption.',2,2),(117,'2018-04-06 17:56:08','138','Interest object',2,'Changed caption.',2,2),(118,'2018-04-06 17:56:08','137','Interest object',2,'Changed caption.',2,2),(119,'2018-04-06 17:56:08','136','Interest object',2,'Changed caption.',2,2),(120,'2018-04-06 17:56:08','135','Interest object',2,'Changed caption.',2,2),(121,'2018-04-06 17:56:08','134','Interest object',2,'Changed caption.',2,2),(122,'2018-04-06 17:56:08','133','Interest object',2,'Changed caption.',2,2),(123,'2018-04-06 17:56:08','132','Interest object',2,'Changed caption.',2,2),(124,'2018-04-06 17:56:08','131','Interest object',2,'Changed caption.',2,2),(125,'2018-04-06 17:56:08','130','Interest object',2,'Changed caption.',2,2),(126,'2018-04-06 17:56:08','129','Interest object',2,'Changed caption.',2,2),(127,'2018-04-06 17:56:08','128','Interest object',2,'Changed caption.',2,2),(128,'2018-04-06 17:56:08','127','Interest object',2,'Changed caption.',2,2),(129,'2018-04-06 17:56:08','126','Interest object',2,'Changed caption.',2,2),(130,'2018-04-06 17:56:08','125','Interest object',2,'Changed caption.',2,2),(131,'2018-04-06 17:56:08','124','Interest object',2,'Changed caption.',2,2),(132,'2018-04-06 17:56:08','123','Interest object',2,'Changed caption.',2,2),(133,'2018-04-06 17:56:08','122','Interest object',2,'Changed caption.',2,2),(134,'2018-04-06 17:56:08','121','Interest object',2,'Changed caption.',2,2),(135,'2018-04-06 17:56:08','120','Interest object',2,'Changed caption.',2,2),(136,'2018-04-06 17:56:08','119','Interest object',2,'Changed caption.',2,2),(137,'2018-04-06 17:56:08','118','Interest object',2,'Changed caption.',2,2),(138,'2018-04-06 17:56:08','117','Interest object',2,'Changed caption.',2,2),(139,'2018-04-06 17:56:08','115','Interest object',2,'Changed caption.',2,2),(140,'2018-04-06 17:56:08','114','Interest object',2,'Changed caption.',2,2),(141,'2018-04-06 17:56:08','113','Interest object',2,'Changed caption.',2,2),(142,'2018-04-06 17:56:08','112','Interest object',2,'Changed caption.',2,2),(143,'2018-04-06 17:56:08','111','Interest object',2,'Changed caption.',2,2),(144,'2018-04-06 17:56:08','110','Interest object',2,'Changed caption.',2,2),(145,'2018-04-06 17:56:08','109','Interest object',2,'Changed caption.',2,2),(146,'2018-04-06 17:56:08','108','Interest object',2,'Changed caption.',2,2),(147,'2018-04-06 17:56:08','106','Interest object',2,'Changed caption.',2,2),(148,'2018-04-06 17:56:08','105','Interest object',2,'Changed caption.',2,2),(149,'2018-04-06 17:56:08','104','Interest object',2,'Changed caption.',2,2),(150,'2018-04-06 17:56:08','103','Interest object',2,'Changed caption.',2,2),(151,'2018-04-06 17:56:08','102','Interest object',2,'Changed caption.',2,2),(152,'2018-04-06 17:56:08','101','Interest object',2,'Changed caption.',2,2),(153,'2018-04-06 17:56:08','100','Interest object',2,'Changed caption.',2,2),(154,'2018-04-06 17:56:08','99','Interest object',2,'Changed caption.',2,2),(155,'2018-04-06 17:56:08','98','Interest object',2,'Changed caption.',2,2),(156,'2018-04-06 17:56:08','97','Interest object',2,'Changed caption.',2,2),(157,'2018-04-06 17:56:08','96','Interest object',2,'Changed caption.',2,2),(158,'2018-04-06 17:56:08','94','Interest object',2,'Changed caption.',2,2),(159,'2018-04-06 17:56:08','92','Interest object',2,'Changed caption.',2,2),(160,'2018-04-06 17:56:08','91','Interest object',2,'Changed caption.',2,2),(161,'2018-04-06 17:56:08','90','Interest object',2,'Changed caption.',2,2),(162,'2018-04-06 17:56:08','88','Interest object',2,'Changed caption.',2,2),(163,'2018-04-06 17:56:08','87','Interest object',2,'Changed caption.',2,2),(164,'2018-04-06 17:56:08','86','Interest object',2,'Changed caption.',2,2),(165,'2018-04-06 17:56:08','85','Interest object',2,'Changed caption.',2,2),(166,'2018-04-06 17:56:08','84','Interest object',2,'Changed caption.',2,2),(167,'2018-04-06 17:56:08','83','Interest object',2,'Changed caption.',2,2),(168,'2018-04-06 17:56:08','82','Interest object',2,'Changed caption.',2,2),(169,'2018-04-06 17:56:08','80','Interest object',2,'Changed caption.',2,2),(170,'2018-04-06 17:56:08','79','Interest object',2,'Changed caption.',2,2),(171,'2018-04-06 17:56:08','78','Interest object',2,'Changed caption.',2,2),(172,'2018-04-06 17:57:11','77','Interest object',2,'Changed caption.',2,2),(173,'2018-04-06 17:57:11','76','Interest object',2,'Changed caption.',2,2),(174,'2018-04-06 17:57:11','71','Interest object',2,'Changed caption.',2,2),(175,'2018-04-06 17:57:11','68','Interest object',2,'Changed caption.',2,2),(176,'2018-04-06 17:57:11','65','Interest object',2,'Changed caption.',2,2),(177,'2018-04-06 17:57:11','62','Interest object',2,'Changed caption.',2,2),(178,'2018-04-06 17:57:11','61','Interest object',2,'Changed caption.',2,2),(179,'2018-04-06 17:57:11','58','Interest object',2,'Changed caption.',2,2),(180,'2018-04-06 17:57:11','53','Interest object',2,'Changed caption.',2,2),(181,'2018-04-06 17:57:11','51','Interest object',2,'Changed caption.',2,2),(182,'2018-04-06 17:57:11','16','Interest object',2,'Changed caption.',2,2),(183,'2018-04-06 17:57:11','15','Interest object',2,'Changed caption.',2,2),(184,'2018-04-06 17:57:11','14','Interest object',2,'Changed caption.',2,2),(185,'2018-04-06 17:57:11','13','Interest object',2,'Changed caption.',2,2),(186,'2018-04-06 17:57:11','12','Interest object',2,'Changed caption.',2,2),(187,'2018-04-06 17:57:11','11','Interest object',2,'Changed caption.',2,2),(188,'2018-04-06 17:57:11','10','Interest object',2,'Changed caption.',2,2),(189,'2018-04-06 17:57:11','9','Interest object',2,'Changed caption.',2,2),(190,'2018-04-06 17:57:11','8','Interest object',2,'Changed caption.',2,2),(191,'2018-04-06 17:57:11','7','Interest object',2,'Changed caption.',2,2),(192,'2018-04-06 17:57:11','6','Interest object',2,'Changed caption.',2,2),(193,'2018-04-06 17:57:11','5','Interest object',2,'Changed caption.',2,2),(194,'2018-04-06 17:57:11','4','Interest object',2,'Changed caption.',2,2),(195,'2018-04-06 17:57:11','3','Interest object',2,'Changed caption.',2,2),(196,'2018-04-06 17:57:11','2','Interest object',2,'Changed caption.',2,2),(197,'2018-04-06 17:57:11','1','Interest object',2,'Changed caption.',2,2),(198,'2018-04-06 18:37:44','1','Hotel object',1,'Added.',3,2),(199,'2018-04-06 19:00:27','1','System object',1,'Added.',4,2),(200,'2018-06-19 00:49:28','75','Cajamarca',2,'Changed caption.',1,2),(201,'2018-06-19 00:49:28','74','Pucallpa',2,'Changed caption.',1,2),(202,'2018-06-19 00:49:28','73','Casa Grande',2,'Changed caption.',1,2),(203,'2018-06-19 00:49:28','72','Guadalupe',2,'Changed caption.',1,2),(204,'2018-06-19 00:49:28','71','Pacasmayo',2,'Changed caption.',1,2),(205,'2018-06-19 00:49:28','70','Chepen',2,'Changed caption.',1,2),(206,'2018-06-19 00:49:28','69','Trujillo',2,'Changed caption.',1,2),(207,'2018-06-19 00:49:28','68','Zarumilla',2,'Changed caption.',1,2),(208,'2018-06-19 00:49:28','67','Tumbes',2,'Changed caption.',1,2),(209,'2018-06-19 00:49:28','66','La Oroya',2,'Changed caption.',1,2),(210,'2018-06-19 00:49:28','65','Jauja',2,'Changed caption.',1,2),(211,'2018-06-19 00:49:28','64','Tarma',2,'Changed caption.',1,2),(212,'2018-06-19 00:49:28','63','Huancayo',2,'Changed caption.',1,2),(213,'2018-06-19 00:49:28','62','Tacna',2,'Changed caption.',1,2),(214,'2018-06-19 00:49:28','61','Nazca',2,'Changed caption.',1,2),(215,'2018-06-19 01:03:11','75','Cajamarca',2,'Changed caption.',1,2),(216,'2018-06-19 01:03:11','74','Pucallpa',2,'Changed caption.',1,2),(217,'2018-06-19 01:03:11','73','Casa Grande',2,'Changed caption.',1,2),(218,'2018-06-19 01:03:11','72','Guadalupe',2,'Changed caption.',1,2),(219,'2018-06-19 01:03:11','71','Pacasmayo',2,'Changed caption.',1,2),(220,'2018-06-19 01:03:11','70','Chepen',2,'Changed caption.',1,2),(221,'2018-06-19 01:03:11','69','Trujillo',2,'Changed caption.',1,2),(222,'2018-06-19 01:03:11','68','Zarumilla',2,'Changed caption.',1,2),(223,'2018-06-19 01:03:11','67','Tumbes',2,'Changed caption.',1,2),(224,'2018-06-19 03:24:32','5','Hotel object',2,'Changed subscrito.',3,2),(225,'2018-06-19 03:30:01','5','Hotel object',2,'Changed subscrito.',3,2),(226,'2018-06-19 03:30:01','4','Hotel object',2,'Changed subscrito.',3,2),(227,'2018-06-19 03:30:01','3','Hotel object',2,'Changed subscrito.',3,2),(228,'2018-06-19 03:30:01','2','Hotel object',2,'Changed subscrito.',3,2),(229,'2018-06-19 03:30:28','5','Hotel object',2,'Changed subscrito.',3,2),(230,'2018-06-19 05:23:47','6','Hotel object',2,'Changed subscrito.',3,2),(231,'2018-06-28 02:40:04','1','admin',2,'Changed password.',5,2),(232,'2018-07-04 03:13:01','1','admin',2,'Changed password.',5,2),(233,'2018-07-04 03:29:59','1','Hotel object',2,'Changed fexpiracion.',3,2),(234,'2018-07-13 03:31:06','75','Cajamarca',2,'Changed thumbail.',1,2),(235,'2018-07-13 04:01:58','66','La Oroya',2,'Changed caption.',1,2),(236,'2018-07-13 04:01:58','65','Jauja',2,'Changed caption.',1,2),(237,'2018-07-13 04:01:58','64','Tarma',2,'Changed caption.',1,2),(238,'2018-07-13 04:01:58','63','Huancayo',2,'Changed caption.',1,2),(239,'2018-07-13 04:01:58','62','Tacna',2,'Changed caption.',1,2),(240,'2018-07-13 04:01:58','61','Nazca',2,'Changed caption.',1,2),(241,'2018-07-13 04:16:51','1','Amenity object',1,'Added.',7,2),(242,'2018-07-13 04:18:22','1','Amenity object',2,'Changed name and name_en.',7,2),(243,'2018-08-02 20:08:47','1','TipoNotifications object',1,'Added.',8,2),(244,'2018-08-02 20:09:00','2','TipoNotifications object',1,'Added.',8,2),(245,'2018-08-02 20:09:43','3','TipoNotifications object',1,'Added.',8,2),(246,'2018-08-02 20:09:56','4','TipoNotifications object',1,'Added.',8,2),(247,'2018-08-02 20:10:08','5','TipoNotifications object',1,'Added.',8,2),(248,'2018-08-02 20:44:39','2','ReservationStatus object',1,'Added.',9,2),(249,'2018-08-02 20:44:46','3','ReservationStatus object',1,'Added.',9,2),(250,'2018-08-02 20:45:22','4','ReservationStatus object',1,'Added.',9,2),(251,'2018-08-02 20:46:09','2','ReservationStatus object',2,'Changed name.',9,2),(252,'2018-08-02 20:46:22','4','ReservationStatus object',2,'Changed name.',9,2),(253,'2018-08-02 20:46:35','3','ReservationStatus object',2,'Changed name.',9,2),(254,'2018-08-02 20:58:19','3','ReservationStatus object',2,'Changed name.',9,2),(255,'2018-08-02 20:58:34','2','ReservationStatus object',2,'No fields changed.',9,2),(256,'2018-09-18 18:42:16','37','323',2,'Changed last_login, first_name, last_name, phone and seller.',6,2),(257,'2019-02-25 21:58:49','38','Reservation object',3,'',10,2),(258,'2019-02-25 21:58:49','37','Reservation object',3,'',10,2),(259,'2019-02-25 21:58:49','36','Reservation object',3,'',10,2),(260,'2019-02-25 21:58:49','35','Reservation object',3,'',10,2),(261,'2019-02-25 21:58:49','34','Reservation object',3,'',10,2),(262,'2019-02-25 21:58:49','33','Reservation object',3,'',10,2),(263,'2019-02-25 21:58:49','32','Reservation object',3,'',10,2),(264,'2019-02-25 21:58:49','31','Reservation object',3,'',10,2),(265,'2019-02-25 21:58:49','30','Reservation object',3,'',10,2),(266,'2019-02-25 21:58:49','29','Reservation object',3,'',10,2),(267,'2019-02-25 21:58:49','28','Reservation object',3,'',10,2),(268,'2019-02-25 21:58:49','27','Reservation object',3,'',10,2),(269,'2019-02-25 21:58:49','26','Reservation object',3,'',10,2),(270,'2019-02-25 21:58:49','25','Reservation object',3,'',10,2),(271,'2019-02-25 21:58:49','24','Reservation object',3,'',10,2),(272,'2019-02-25 21:58:49','23','Reservation object',3,'',10,2),(273,'2019-02-25 21:58:49','22','Reservation object',3,'',10,2),(274,'2019-02-25 21:58:49','21','Reservation object',3,'',10,2),(275,'2019-02-25 21:58:49','20','Reservation object',3,'',10,2),(276,'2019-02-25 21:58:49','19','Reservation object',3,'',10,2),(277,'2019-02-25 21:58:49','18','Reservation object',3,'',10,2),(278,'2019-02-25 21:58:49','17','Reservation object',3,'',10,2),(279,'2019-02-25 21:58:49','16','Reservation object',3,'',10,2),(280,'2019-02-25 21:58:49','15','Reservation object',3,'',10,2),(281,'2019-02-25 21:58:49','14','Reservation object',3,'',10,2),(282,'2019-02-25 21:58:49','13','Reservation object',3,'',10,2),(283,'2019-02-25 21:58:49','12','Reservation object',3,'',10,2),(284,'2019-02-25 21:58:49','11','Reservation object',3,'',10,2),(285,'2019-02-25 21:58:49','10','Reservation object',3,'',10,2),(286,'2019-02-25 21:58:49','9','Reservation object',3,'',10,2),(287,'2019-02-25 21:58:49','8','Reservation object',3,'',10,2),(288,'2019-02-25 21:58:49','7','Reservation object',3,'',10,2),(289,'2019-02-25 21:58:49','6','Reservation object',3,'',10,2),(290,'2019-02-25 21:58:49','5','Reservation object',3,'',10,2),(291,'2019-02-25 21:58:49','4','Reservation object',3,'',10,2),(292,'2019-02-25 21:58:49','3','Reservation object',3,'',10,2),(293,'2019-02-25 21:58:49','2','Reservation object',3,'',10,2),(294,'2019-02-26 22:12:50','38','Reservation object',3,'',10,2),(295,'2019-02-26 22:12:50','37','Reservation object',3,'',10,2),(296,'2019-02-26 22:12:50','36','Reservation object',3,'',10,2),(297,'2019-02-26 22:12:50','35','Reservation object',3,'',10,2),(298,'2019-02-26 22:12:50','34','Reservation object',3,'',10,2),(299,'2019-02-26 22:12:50','33','Reservation object',3,'',10,2),(300,'2019-02-26 22:12:50','32','Reservation object',3,'',10,2),(301,'2019-02-26 22:12:50','31','Reservation object',3,'',10,2),(302,'2019-02-26 22:12:50','30','Reservation object',3,'',10,2),(303,'2019-02-26 22:12:50','29','Reservation object',3,'',10,2),(304,'2019-02-26 22:12:50','28','Reservation object',3,'',10,2),(305,'2019-02-26 22:12:50','27','Reservation object',3,'',10,2),(306,'2019-02-26 22:12:50','26','Reservation object',3,'',10,2),(307,'2019-02-26 22:12:50','25','Reservation object',3,'',10,2),(308,'2019-02-26 22:12:50','24','Reservation object',3,'',10,2),(309,'2019-02-26 22:12:50','23','Reservation object',3,'',10,2),(310,'2019-02-26 22:12:50','22','Reservation object',3,'',10,2),(311,'2019-02-26 22:12:50','21','Reservation object',3,'',10,2),(312,'2019-02-26 22:12:50','20','Reservation object',3,'',10,2),(313,'2019-02-26 22:12:50','19','Reservation object',3,'',10,2),(314,'2019-02-26 22:12:50','18','Reservation object',3,'',10,2),(315,'2019-02-26 22:12:50','17','Reservation object',3,'',10,2),(316,'2019-02-26 22:12:50','16','Reservation object',3,'',10,2),(317,'2019-02-26 22:12:50','15','Reservation object',3,'',10,2),(318,'2019-02-26 22:12:50','14','Reservation object',3,'',10,2),(319,'2019-02-26 22:12:50','13','Reservation object',3,'',10,2),(320,'2019-02-26 22:12:50','12','Reservation object',3,'',10,2),(321,'2019-02-26 22:12:50','11','Reservation object',3,'',10,2),(322,'2019-02-26 22:12:50','10','Reservation object',3,'',10,2),(323,'2019-02-26 22:12:50','9','Reservation object',3,'',10,2),(324,'2019-02-26 22:12:50','8','Reservation object',3,'',10,2),(325,'2019-02-26 22:12:50','7','Reservation object',3,'',10,2),(326,'2019-02-26 22:12:50','6','Reservation object',3,'',10,2),(327,'2019-02-26 22:12:50','5','Reservation object',3,'',10,2),(328,'2019-02-26 22:12:50','4','Reservation object',3,'',10,2),(329,'2019-02-26 22:12:50','3','Reservation object',3,'',10,2),(330,'2019-02-26 22:12:50','2','Reservation object',3,'',10,2),(331,'2019-02-26 22:14:18','36','RoomReservation object',3,'',11,2),(332,'2019-02-26 22:14:18','35','RoomReservation object',3,'',11,2),(333,'2019-02-26 22:14:18','34','RoomReservation object',3,'',11,2),(334,'2019-02-26 22:14:18','33','RoomReservation object',3,'',11,2),(335,'2019-02-26 22:14:18','32','RoomReservation object',3,'',11,2),(336,'2019-02-26 22:14:18','31','RoomReservation object',3,'',11,2),(337,'2019-02-26 22:14:18','30','RoomReservation object',3,'',11,2),(338,'2019-02-26 22:14:18','29','RoomReservation object',3,'',11,2),(339,'2019-02-26 22:14:18','28','RoomReservation object',3,'',11,2),(340,'2019-02-26 22:14:18','27','RoomReservation object',3,'',11,2),(341,'2019-02-26 22:14:18','26','RoomReservation object',3,'',11,2),(342,'2019-02-26 22:14:18','25','RoomReservation object',3,'',11,2),(343,'2019-02-26 22:14:18','24','RoomReservation object',3,'',11,2),(344,'2019-02-26 22:14:18','23','RoomReservation object',3,'',11,2),(345,'2019-02-26 22:14:18','22','RoomReservation object',3,'',11,2),(346,'2019-02-26 22:14:18','21','RoomReservation object',3,'',11,2),(347,'2019-02-26 22:14:18','20','RoomReservation object',3,'',11,2),(348,'2019-02-26 22:14:18','19','RoomReservation object',3,'',11,2),(349,'2019-02-26 22:14:18','18','RoomReservation object',3,'',11,2),(350,'2019-02-26 22:14:18','17','RoomReservation object',3,'',11,2),(351,'2019-02-26 22:14:18','16','RoomReservation object',3,'',11,2),(352,'2019-02-26 22:14:18','15','RoomReservation object',3,'',11,2),(353,'2019-02-26 22:14:18','14','RoomReservation object',3,'',11,2),(354,'2019-02-26 22:14:18','13','RoomReservation object',3,'',11,2),(355,'2019-02-26 22:14:18','12','RoomReservation object',3,'',11,2),(356,'2019-02-26 22:14:18','11','RoomReservation object',3,'',11,2),(357,'2019-02-26 22:14:18','10','RoomReservation object',3,'',11,2),(358,'2019-02-26 22:14:18','9','RoomReservation object',3,'',11,2),(359,'2019-02-26 22:14:18','8','RoomReservation object',3,'',11,2),(360,'2019-02-26 22:14:18','7','RoomReservation object',3,'',11,2),(361,'2019-02-26 22:14:18','6','RoomReservation object',3,'',11,2),(362,'2019-02-26 22:14:18','5','RoomReservation object',3,'',11,2),(363,'2019-02-26 22:14:18','4','RoomReservation object',3,'',11,2),(364,'2019-02-26 22:14:18','3','RoomReservation object',3,'',11,2),(365,'2019-02-26 22:14:18','2','RoomReservation object',3,'',11,2),(366,'2019-02-26 22:14:18','1','RoomReservation object',3,'',11,2),(367,'2019-02-26 22:14:35','38','Reservation object',3,'',10,2),(368,'2019-02-26 22:14:35','37','Reservation object',3,'',10,2),(369,'2019-02-26 22:14:35','36','Reservation object',3,'',10,2),(370,'2019-02-26 22:14:35','35','Reservation object',3,'',10,2),(371,'2019-02-26 22:14:35','34','Reservation object',3,'',10,2),(372,'2019-02-26 22:14:35','33','Reservation object',3,'',10,2),(373,'2019-02-26 22:14:35','32','Reservation object',3,'',10,2),(374,'2019-02-26 22:14:35','31','Reservation object',3,'',10,2),(375,'2019-02-26 22:14:35','30','Reservation object',3,'',10,2),(376,'2019-02-26 22:14:35','29','Reservation object',3,'',10,2),(377,'2019-02-26 22:14:35','28','Reservation object',3,'',10,2),(378,'2019-02-26 22:14:35','27','Reservation object',3,'',10,2),(379,'2019-02-26 22:14:35','26','Reservation object',3,'',10,2),(380,'2019-02-26 22:14:35','25','Reservation object',3,'',10,2),(381,'2019-02-26 22:14:35','24','Reservation object',3,'',10,2),(382,'2019-02-26 22:14:35','23','Reservation object',3,'',10,2),(383,'2019-02-26 22:14:35','22','Reservation object',3,'',10,2),(384,'2019-02-26 22:14:35','21','Reservation object',3,'',10,2),(385,'2019-02-26 22:14:35','20','Reservation object',3,'',10,2),(386,'2019-02-26 22:14:35','19','Reservation object',3,'',10,2),(387,'2019-02-26 22:14:35','18','Reservation object',3,'',10,2),(388,'2019-02-26 22:14:35','17','Reservation object',3,'',10,2),(389,'2019-02-26 22:14:35','16','Reservation object',3,'',10,2),(390,'2019-02-26 22:14:35','15','Reservation object',3,'',10,2),(391,'2019-02-26 22:14:35','14','Reservation object',3,'',10,2),(392,'2019-02-26 22:14:35','13','Reservation object',3,'',10,2),(393,'2019-02-26 22:14:35','12','Reservation object',3,'',10,2),(394,'2019-02-26 22:14:35','11','Reservation object',3,'',10,2),(395,'2019-02-26 22:14:35','10','Reservation object',3,'',10,2),(396,'2019-02-26 22:14:35','9','Reservation object',3,'',10,2),(397,'2019-02-26 22:14:35','8','Reservation object',3,'',10,2),(398,'2019-02-26 22:14:35','7','Reservation object',3,'',10,2),(399,'2019-02-26 22:14:35','6','Reservation object',3,'',10,2),(400,'2019-02-26 22:14:35','5','Reservation object',3,'',10,2),(401,'2019-02-26 22:14:35','4','Reservation object',3,'',10,2),(402,'2019-02-26 22:14:35','3','Reservation object',3,'',10,2),(403,'2019-02-26 22:14:35','2','Reservation object',3,'',10,2),(404,'2019-02-27 01:39:14','21','Room object',1,'Added.',12,2),(405,'2019-02-27 03:10:27','14','Westin/Single',1,'Added.',13,2),(406,'2019-02-27 03:13:08','14','Westin/Single',2,'Changed activate.',13,2),(407,'2019-02-27 03:15:46','22','Room object',1,'Added.',12,2),(408,'2019-02-27 03:22:07','14','Westin/Single',2,'Changed precio, extrasingle, extradouble, max_occupancy, childrens and adults.',13,2),(409,'2019-02-27 04:29:28','2','Westin/Private Bed',2,'Changed max_occupancy.',13,2),(410,'2019-02-27 19:24:37','137','Interest object',3,'',2,2),(411,'2019-02-27 19:24:37','106','Interest object',3,'',2,2),(412,'2019-02-27 19:24:37','101','Interest object',3,'',2,2),(413,'2019-02-27 19:24:37','100','Interest object',3,'',2,2),(414,'2019-02-27 19:25:23','55','Interest object',3,'',2,2),(415,'2019-02-27 19:25:23','54','Interest object',3,'',2,2),(416,'2019-02-27 19:25:23','52','Interest object',3,'',2,2),(417,'2019-02-27 19:25:23','50','Interest object',3,'',2,2),(418,'2019-02-27 19:25:23','49','Interest object',3,'',2,2),(419,'2019-02-27 19:25:23','8','Interest object',3,'',2,2),(420,'2019-02-27 20:00:21','45','betorortiz',2,'Changed password.',5,2),(421,'2019-02-28 04:58:25','16','Template 4',2,'Changed total_occupancy_limit.',14,2),(422,'2019-02-28 04:58:25','15','Template 3',2,'Changed total_occupancy_limit.',14,2),(423,'2019-02-28 04:58:25','14','Template 2',2,'Changed total_occupancy_limit.',14,2),(424,'2019-02-28 04:58:25','13','Template 1',2,'Changed total_occupancy_limit.',14,2),(425,'2019-02-28 04:58:25','10','Suite Superior',2,'Changed total_occupancy_limit.',14,2),(426,'2019-02-28 04:58:25','9','Suite',2,'Changed total_occupancy_limit.',14,2),(427,'2019-02-28 04:58:25','8','Triple Superior',2,'Changed total_occupancy_limit.',14,2),(428,'2019-02-28 04:58:25','2','Private Bed',2,'Changed total_occupancy_limit.',14,2),(429,'2019-04-15 01:55:04','2','root',2,'Changed last_login, first_name, last_name, email, type_user and phone.',6,2),(430,'2019-04-15 02:10:42','78','cavsal',2,'Changed last_login, first_name, last_name, email, phone and city.',6,2),(431,'2019-04-15 02:11:28','78','cavsal',2,'Changed password.',5,2),(432,'2019-04-16 03:28:11','2','root',2,'Changed type_user.',6,2),(433,'2019-04-16 03:29:59','58','papo',2,'Changed password.',5,2),(434,'2019-04-16 05:15:53','11','Papochin',2,'Changed status.',3,2),(435,'2019-04-23 03:14:37','37','323',2,'Changed password.',5,2),(436,'2019-04-23 03:14:47','37','owner',2,'Changed username.',5,2),(437,'2019-04-23 03:44:41','58','papo',2,'Changed password.',5,2),(438,'2019-05-13 16:42:36','17','Pedrito/Single Superior',2,'Changed activate.',13,1),(439,'2019-05-13 16:43:00','17','Pedrito/Single Superior',2,'Changed activate.',13,1),(440,'2019-05-13 16:43:42','17','Pedrito/Single Superior',2,'Changed activate and precio.',13,1),(441,'2019-05-13 16:43:53','17','Pedrito/Single Superior',2,'Changed activate.',13,1),(442,'2019-05-13 18:02:25','4','Eliminado',1,'Added.',15,1),(443,'2019-05-13 18:03:10','5','Eliminado',1,'Added.',15,1),(444,'2019-05-13 18:03:17','6','Eliminado',1,'Added.',15,1),(445,'2019-05-13 18:03:24','5','.',2,'Changed name.',15,1),(446,'2019-05-13 18:03:30','4','.',2,'Changed name.',15,1),(447,'2019-05-13 18:13:43','9','104 | Available | Bed',3,'',12,1),(448,'2019-05-13 18:13:43','8','103 | Available | Bed',3,'',12,1),(449,'2019-05-13 18:13:43','7','102 | Eliminado | Bed',3,'',12,1),(450,'2019-05-13 18:13:43','6','101 | Available | Bed',3,'',12,1),(451,'2019-05-13 18:15:10','84','RoomReservation object',3,'',11,1),(452,'2019-05-13 18:15:10','77','RoomReservation object',3,'',11,1),(453,'2019-05-13 18:15:10','76','RoomReservation object',3,'',11,1),(454,'2019-05-13 18:15:10','75','RoomReservation object',3,'',11,1),(455,'2019-05-13 18:15:10','46','RoomReservation object',3,'',11,1),(456,'2019-05-13 18:15:10','45','RoomReservation object',3,'',11,1),(457,'2019-05-13 18:15:10','44','RoomReservation object',3,'',11,1),(458,'2019-05-13 18:15:10','43','RoomReservation object',3,'',11,1),(459,'2019-05-13 18:15:10','42','RoomReservation object',3,'',11,1),(460,'2019-05-13 18:15:42','26','Mochileros Dormitorio | Available | Single',2,'Changed name.',12,1),(461,'2019-05-13 18:15:52','26','Mochileros Dormitorio | Available | Bed',2,'Changed hotelroomtemplate.',12,1),(462,'2019-05-13 18:16:13','10','105 | Available | Bed',3,'',12,1),(463,'2019-05-13 18:16:13','9','104 | Available | Bed',3,'',12,1),(464,'2019-05-13 18:16:13','8','103 | Available | Bed',3,'',12,1),(465,'2019-05-13 18:16:13','7','102 | Eliminado | Bed',3,'',12,1),(466,'2019-05-13 18:16:13','6','101 | Available | Bed',3,'',12,1),(467,'2019-05-13 18:20:03','6','Francia/Bed',3,'',13,1),(468,'2019-05-13 18:20:21','6','Francia/Bed',2,'Changed activate.',13,1),(469,'2019-05-13 18:20:53','7','Francia/Private Bed',2,'Changed activate.',13,1),(470,'2019-05-13 18:24:23','59','RoomReservation object',3,'',11,1),(471,'2019-05-13 18:24:23','58','RoomReservation object',3,'',11,1),(472,'2019-05-13 18:24:23','57','RoomReservation object',3,'',11,1),(473,'2019-05-13 18:24:23','56','RoomReservation object',3,'',11,1),(474,'2019-05-13 18:24:23','55','RoomReservation object',3,'',11,1),(475,'2019-05-13 18:24:23','54','RoomReservation object',3,'',11,1),(476,'2019-05-13 18:24:23','48','RoomReservation object',3,'',11,1),(477,'2019-05-13 18:24:23','47','RoomReservation object',3,'',11,1),(478,'2019-05-13 18:25:04','25','123 | Available | Bed',3,'',12,1),(479,'2019-05-13 18:25:04','17','107 | Available | Single',3,'',12,1),(480,'2019-05-13 18:25:04','16','106 | Available | Private Bed',3,'',12,1),(481,'2019-05-13 18:25:04','15','105 | Available | Bed',3,'',12,1),(482,'2019-05-13 18:25:04','14','104 | Available | Private Bed',3,'',12,1),(483,'2019-05-13 18:25:04','13','103 | Available | Bed',3,'',12,1),(484,'2019-05-13 18:25:04','12','102 | Available | Bed',3,'',12,1),(485,'2019-05-13 18:25:04','11','101 | Available | Bed',3,'',12,1),(486,'2019-05-27 16:49:35','209','RoomReservation object',3,'',11,2),(487,'2019-05-27 16:49:35','208','RoomReservation object',3,'',11,2),(488,'2019-05-27 16:49:35','207','RoomReservation object',3,'',11,2),(489,'2019-05-27 16:49:35','206','RoomReservation object',3,'',11,2),(490,'2019-05-27 16:49:35','205','RoomReservation object',3,'',11,2),(491,'2019-05-27 16:49:35','204','RoomReservation object',3,'',11,2),(492,'2019-05-27 16:49:35','203','RoomReservation object',3,'',11,2),(493,'2019-05-27 16:49:35','202','RoomReservation object',3,'',11,2),(494,'2019-05-27 16:49:35','201','RoomReservation object',3,'',11,2),(495,'2019-05-27 16:49:35','200','RoomReservation object',3,'',11,2),(496,'2019-05-27 16:49:35','199','RoomReservation object',3,'',11,2),(497,'2019-05-27 16:49:35','198','RoomReservation object',3,'',11,2),(498,'2019-05-27 16:49:35','197','RoomReservation object',3,'',11,2),(499,'2019-05-27 16:49:35','196','RoomReservation object',3,'',11,2),(500,'2019-05-27 16:49:35','195','RoomReservation object',3,'',11,2),(501,'2019-05-27 16:49:35','194','RoomReservation object',3,'',11,2),(502,'2019-05-27 16:49:35','193','RoomReservation object',3,'',11,2),(503,'2019-05-27 16:49:35','192','RoomReservation object',3,'',11,2),(504,'2019-05-27 16:49:35','191','RoomReservation object',3,'',11,2),(505,'2019-05-27 16:49:35','190','RoomReservation object',3,'',11,2),(506,'2019-05-27 16:49:35','189','RoomReservation object',3,'',11,2),(507,'2019-05-27 16:49:35','188','RoomReservation object',3,'',11,2),(508,'2019-05-27 16:49:35','187','RoomReservation object',3,'',11,2),(509,'2019-05-27 16:49:35','186','RoomReservation object',3,'',11,2),(510,'2019-05-27 16:49:35','185','RoomReservation object',3,'',11,2),(511,'2019-05-27 16:49:35','184','RoomReservation object',3,'',11,2),(512,'2019-05-27 16:49:35','183','RoomReservation object',3,'',11,2),(513,'2019-05-27 16:49:35','182','RoomReservation object',3,'',11,2),(514,'2019-05-27 16:49:35','181','RoomReservation object',3,'',11,2),(515,'2019-05-27 16:49:35','180','RoomReservation object',3,'',11,2),(516,'2019-05-27 16:49:35','179','RoomReservation object',3,'',11,2),(517,'2019-05-27 16:49:35','178','RoomReservation object',3,'',11,2),(518,'2019-05-27 16:49:35','177','RoomReservation object',3,'',11,2),(519,'2019-05-27 16:49:35','176','RoomReservation object',3,'',11,2),(520,'2019-05-27 16:49:35','175','RoomReservation object',3,'',11,2),(521,'2019-05-27 16:49:35','174','RoomReservation object',3,'',11,2),(522,'2019-05-27 16:49:35','173','RoomReservation object',3,'',11,2),(523,'2019-05-27 16:49:35','172','RoomReservation object',3,'',11,2),(524,'2019-05-27 16:49:35','171','RoomReservation object',3,'',11,2),(525,'2019-05-27 16:49:35','170','RoomReservation object',3,'',11,2),(526,'2019-05-27 16:49:35','169','RoomReservation object',3,'',11,2),(527,'2019-05-27 16:49:35','168','RoomReservation object',3,'',11,2),(528,'2019-05-27 16:49:35','167','RoomReservation object',3,'',11,2),(529,'2019-05-27 16:49:35','166','RoomReservation object',3,'',11,2),(530,'2019-05-27 16:49:35','165','RoomReservation object',3,'',11,2),(531,'2019-05-27 16:49:35','164','RoomReservation object',3,'',11,2),(532,'2019-05-27 16:49:35','163','RoomReservation object',3,'',11,2),(533,'2019-05-27 16:49:35','162','RoomReservation object',3,'',11,2),(534,'2019-05-27 16:49:35','161','RoomReservation object',3,'',11,2),(535,'2019-05-27 16:49:35','160','RoomReservation object',3,'',11,2),(536,'2019-05-27 16:49:35','159','RoomReservation object',3,'',11,2),(537,'2019-05-27 16:49:35','158','RoomReservation object',3,'',11,2),(538,'2019-05-27 16:49:35','157','RoomReservation object',3,'',11,2),(539,'2019-05-27 16:49:35','156','RoomReservation object',3,'',11,2),(540,'2019-05-27 16:49:35','155','RoomReservation object',3,'',11,2),(541,'2019-05-27 16:49:35','154','RoomReservation object',3,'',11,2),(542,'2019-05-27 16:49:35','153','RoomReservation object',3,'',11,2),(543,'2019-05-27 16:49:35','152','RoomReservation object',3,'',11,2),(544,'2019-05-27 16:49:35','151','RoomReservation object',3,'',11,2),(545,'2019-05-27 16:49:35','150','RoomReservation object',3,'',11,2),(546,'2019-05-27 16:49:35','149','RoomReservation object',3,'',11,2),(547,'2019-05-27 16:49:35','148','RoomReservation object',3,'',11,2),(548,'2019-05-27 16:49:35','147','RoomReservation object',3,'',11,2),(549,'2019-05-27 16:49:35','146','RoomReservation object',3,'',11,2),(550,'2019-05-27 16:49:36','145','RoomReservation object',3,'',11,2),(551,'2019-05-27 16:49:36','144','RoomReservation object',3,'',11,2),(552,'2019-05-27 16:49:36','143','RoomReservation object',3,'',11,2),(553,'2019-05-27 16:49:36','142','RoomReservation object',3,'',11,2),(554,'2019-05-27 16:49:36','141','RoomReservation object',3,'',11,2),(555,'2019-05-27 16:49:36','140','RoomReservation object',3,'',11,2),(556,'2019-05-27 16:49:36','139','RoomReservation object',3,'',11,2),(557,'2019-05-27 16:49:36','138','RoomReservation object',3,'',11,2),(558,'2019-05-27 16:49:36','137','RoomReservation object',3,'',11,2),(559,'2019-05-27 16:49:36','136','RoomReservation object',3,'',11,2),(560,'2019-05-27 16:49:36','135','RoomReservation object',3,'',11,2),(561,'2019-05-27 16:49:36','134','RoomReservation object',3,'',11,2),(562,'2019-05-27 16:49:36','133','RoomReservation object',3,'',11,2),(563,'2019-05-27 16:49:36','132','RoomReservation object',3,'',11,2),(564,'2019-05-27 16:49:36','131','RoomReservation object',3,'',11,2),(565,'2019-05-27 16:49:36','130','RoomReservation object',3,'',11,2),(566,'2019-05-27 16:49:36','129','RoomReservation object',3,'',11,2),(567,'2019-05-27 16:49:36','128','RoomReservation object',3,'',11,2),(568,'2019-05-27 16:49:36','127','RoomReservation object',3,'',11,2),(569,'2019-05-27 16:49:36','126','RoomReservation object',3,'',11,2),(570,'2019-05-27 16:49:36','125','RoomReservation object',3,'',11,2),(571,'2019-05-27 16:49:36','124','RoomReservation object',3,'',11,2),(572,'2019-05-27 16:49:36','123','RoomReservation object',3,'',11,2),(573,'2019-05-27 16:49:36','122','RoomReservation object',3,'',11,2),(574,'2019-05-27 16:49:36','121','RoomReservation object',3,'',11,2),(575,'2019-05-27 16:49:36','120','RoomReservation object',3,'',11,2),(576,'2019-05-27 16:49:36','119','RoomReservation object',3,'',11,2),(577,'2019-05-27 16:49:36','118','RoomReservation object',3,'',11,2),(578,'2019-05-27 16:49:36','117','RoomReservation object',3,'',11,2),(579,'2019-05-27 16:49:36','116','RoomReservation object',3,'',11,2),(580,'2019-05-27 16:49:36','115','RoomReservation object',3,'',11,2),(581,'2019-05-27 16:49:36','114','RoomReservation object',3,'',11,2),(582,'2019-05-27 16:49:36','113','RoomReservation object',3,'',11,2),(583,'2019-05-27 16:49:36','112','RoomReservation object',3,'',11,2),(584,'2019-05-27 16:49:36','111','RoomReservation object',3,'',11,2),(585,'2019-05-27 16:49:36','110','RoomReservation object',3,'',11,2),(586,'2019-05-27 16:49:44','109','RoomReservation object',3,'',11,2),(587,'2019-05-27 16:49:44','108','RoomReservation object',3,'',11,2),(588,'2019-05-27 16:49:44','107','RoomReservation object',3,'',11,2),(589,'2019-05-27 16:49:44','106','RoomReservation object',3,'',11,2),(590,'2019-05-27 16:49:44','105','RoomReservation object',3,'',11,2),(591,'2019-05-27 16:49:44','104','RoomReservation object',3,'',11,2),(592,'2019-05-27 16:49:44','103','RoomReservation object',3,'',11,2),(593,'2019-05-27 16:49:44','102','RoomReservation object',3,'',11,2),(594,'2019-05-27 16:49:44','101','RoomReservation object',3,'',11,2),(595,'2019-05-27 16:49:44','100','RoomReservation object',3,'',11,2),(596,'2019-05-27 16:49:44','99','RoomReservation object',3,'',11,2),(597,'2019-05-27 16:49:44','98','RoomReservation object',3,'',11,2),(598,'2019-05-27 16:49:44','97','RoomReservation object',3,'',11,2),(599,'2019-05-27 16:49:44','96','RoomReservation object',3,'',11,2),(600,'2019-05-27 16:49:44','95','RoomReservation object',3,'',11,2),(601,'2019-05-27 16:49:44','94','RoomReservation object',3,'',11,2),(602,'2019-05-27 16:49:44','93','RoomReservation object',3,'',11,2),(603,'2019-05-27 16:49:44','92','RoomReservation object',3,'',11,2),(604,'2019-05-27 16:49:44','91','RoomReservation object',3,'',11,2),(605,'2019-05-27 16:49:44','90','RoomReservation object',3,'',11,2),(606,'2019-05-27 16:49:44','89','RoomReservation object',3,'',11,2),(607,'2019-05-27 16:49:44','88','RoomReservation object',3,'',11,2),(608,'2019-05-27 16:49:44','87','RoomReservation object',3,'',11,2),(609,'2019-05-27 16:49:44','86','RoomReservation object',3,'',11,2),(610,'2019-05-27 16:49:44','85','RoomReservation object',3,'',11,2),(611,'2019-05-27 16:49:44','83','RoomReservation object',3,'',11,2),(612,'2019-05-27 16:49:44','82','RoomReservation object',3,'',11,2),(613,'2019-05-27 16:49:44','81','RoomReservation object',3,'',11,2),(614,'2019-05-27 16:49:44','80','RoomReservation object',3,'',11,2),(615,'2019-05-27 16:49:44','79','RoomReservation object',3,'',11,2),(616,'2019-05-27 16:49:44','78','RoomReservation object',3,'',11,2),(617,'2019-05-27 16:49:44','74','RoomReservation object',3,'',11,2),(618,'2019-05-27 16:49:44','73','RoomReservation object',3,'',11,2),(619,'2019-05-27 16:49:44','72','RoomReservation object',3,'',11,2),(620,'2019-05-27 16:49:44','71','RoomReservation object',3,'',11,2),(621,'2019-05-27 16:49:44','70','RoomReservation object',3,'',11,2),(622,'2019-05-27 16:49:44','69','RoomReservation object',3,'',11,2),(623,'2019-05-27 16:49:44','68','RoomReservation object',3,'',11,2),(624,'2019-05-27 16:49:44','67','RoomReservation object',3,'',11,2),(625,'2019-05-27 16:49:44','66','RoomReservation object',3,'',11,2),(626,'2019-05-27 16:49:44','65','RoomReservation object',3,'',11,2),(627,'2019-05-27 16:49:44','64','RoomReservation object',3,'',11,2),(628,'2019-05-27 16:49:44','63','RoomReservation object',3,'',11,2),(629,'2019-05-27 16:49:44','62','RoomReservation object',3,'',11,2),(630,'2019-05-27 16:49:44','61','RoomReservation object',3,'',11,2),(631,'2019-05-27 16:49:44','60','RoomReservation object',3,'',11,2),(632,'2019-05-27 16:49:44','53','RoomReservation object',3,'',11,2),(633,'2019-05-27 16:49:44','52','RoomReservation object',3,'',11,2),(634,'2019-05-27 16:49:44','51','RoomReservation object',3,'',11,2),(635,'2019-05-27 16:49:44','50','RoomReservation object',3,'',11,2),(636,'2019-05-27 16:49:44','49','RoomReservation object',3,'',11,2),(637,'2019-05-27 16:49:44','41','RoomReservation object',3,'',11,2),(638,'2019-05-27 16:49:44','40','RoomReservation object',3,'',11,2),(639,'2019-05-27 16:49:44','39','RoomReservation object',3,'',11,2),(640,'2019-05-27 16:49:44','38','RoomReservation object',3,'',11,2),(641,'2019-05-27 16:49:44','37','RoomReservation object',3,'',11,2),(642,'2019-05-27 16:49:56','170','IN: 2019-05-27  OUT: 2019-05-29 | Pedrito | Requested',3,'',10,2),(643,'2019-05-27 16:49:56','169','IN: 2019-05-27  OUT: 2019-05-29 | Pedrito | Requested',3,'',10,2),(644,'2019-05-27 16:49:56','168','IN: 2019-05-27  OUT: 2019-05-29 | Pedrito | Requested',3,'',10,2),(645,'2019-05-27 16:49:56','167','IN: 2019-05-27  OUT: 2019-05-29 | Pedrito | Requested',3,'',10,2),(646,'2019-05-27 16:49:56','166','IN: 2019-05-24  OUT: 2019-05-25 | Pedrito | Requested',3,'',10,2),(647,'2019-05-27 16:49:56','165','IN: 2019-05-24  OUT: 2019-05-25 | Reinas | Requested',3,'',10,2),(648,'2019-05-27 16:49:56','164','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(649,'2019-05-27 16:49:56','163','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(650,'2019-05-27 16:49:56','162','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(651,'2019-05-27 16:49:56','161','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(652,'2019-05-27 16:49:56','160','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(653,'2019-05-27 16:49:56','159','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(654,'2019-05-27 16:49:56','158','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(655,'2019-05-27 16:49:56','157','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(656,'2019-05-27 16:49:56','156','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(657,'2019-05-27 16:49:56','155','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(658,'2019-05-27 16:49:56','154','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(659,'2019-05-27 16:49:56','153','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(660,'2019-05-27 16:49:56','152','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(661,'2019-05-27 16:49:56','151','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(662,'2019-05-27 16:49:56','150','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(663,'2019-05-27 16:49:56','149','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(664,'2019-05-27 16:49:56','148','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(665,'2019-05-27 16:49:56','147','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(666,'2019-05-27 16:49:56','146','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(667,'2019-05-27 16:49:56','145','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(668,'2019-05-27 16:49:56','144','IN: 2019-05-22  OUT: 2019-05-23 | Pedrito | Held',3,'',10,2),(669,'2019-05-27 16:49:56','143','IN: 2019-05-22  OUT: 2019-05-23 | Cristal | Requested',3,'',10,2),(670,'2019-05-27 16:49:56','142','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(671,'2019-05-27 16:49:56','141','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(672,'2019-05-27 16:49:56','140','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(673,'2019-05-27 16:49:56','139','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(674,'2019-05-27 16:49:56','138','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(675,'2019-05-27 16:49:56','137','IN: 2019-05-20  OUT: 2019-05-21 | Reinas | Requested',3,'',10,2),(676,'2019-05-27 16:49:56','136','IN: 2019-05-20  OUT: 2019-05-21 | Reinas | Requested',3,'',10,2),(677,'2019-05-27 16:49:56','135','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(678,'2019-05-27 16:49:56','134','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(679,'2019-05-27 16:49:56','133','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(680,'2019-05-27 16:49:56','132','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(681,'2019-05-27 16:49:56','131','IN: 2019-05-20  OUT: 2019-05-21 | Reinas | Paid',3,'',10,2),(682,'2019-05-27 16:49:56','130','IN: 2019-05-20  OUT: 2019-05-21 | La  Azul | Paid',3,'',10,2),(683,'2019-05-27 16:49:56','129','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(684,'2019-05-27 16:49:56','128','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(685,'2019-05-27 16:49:56','127','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(686,'2019-05-27 16:49:56','126','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(687,'2019-05-27 16:49:56','125','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(688,'2019-05-27 16:49:56','124','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(689,'2019-05-27 16:49:56','123','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(690,'2019-05-27 16:49:56','122','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(691,'2019-05-27 16:49:56','121','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(692,'2019-05-27 16:49:56','120','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(693,'2019-05-27 16:49:56','119','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(694,'2019-05-27 16:49:56','118','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(695,'2019-05-27 16:49:56','117','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(696,'2019-05-27 16:49:56','116','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(697,'2019-05-27 16:49:56','115','IN: 2019-05-20  OUT: 2019-05-22 | Cristal | Requested',3,'',10,2),(698,'2019-05-27 16:49:56','114','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(699,'2019-05-27 16:49:56','113','IN: 2019-05-20  OUT: 2019-05-21 | La  Azul | Paid',3,'',10,2),(700,'2019-05-27 16:49:56','112','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(701,'2019-05-27 16:49:56','111','IN: 2019-05-19  OUT: 2019-05-20 | La  Azul | Paid',3,'',10,2),(702,'2019-05-27 16:49:56','110','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(703,'2019-05-27 16:49:56','109','IN: 2019-05-19  OUT: 2019-05-20 | La  Azul | Paid',3,'',10,2),(704,'2019-05-27 16:49:56','108','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(705,'2019-05-27 16:49:56','107','IN: 2019-05-19  OUT: 2019-05-20 | Don Lucho | Paid',3,'',10,2),(706,'2019-05-27 16:49:56','106','IN: 2019-05-19  OUT: 2019-05-20 | Paraiso | Paid',3,'',10,2),(707,'2019-05-27 16:49:56','105','IN: 2019-05-19  OUT: 2019-05-20 | Paraiso | Paid',3,'',10,2),(708,'2019-05-27 16:49:56','104','IN: 2019-05-19  OUT: 2019-05-20 | La  Azul | Requested',3,'',10,2),(709,'2019-05-27 16:49:56','103','IN: 2019-05-19  OUT: 2019-05-20 | The Roses | Requested',3,'',10,2),(710,'2019-05-27 16:49:56','102','IN: 2019-05-19  OUT: 2019-05-20 | La  Azul | Paid',3,'',10,2),(711,'2019-05-27 16:49:56','101','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(712,'2019-05-27 16:49:56','100','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(713,'2019-05-27 16:49:56','99','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Requested',3,'',10,2),(714,'2019-05-27 16:49:56','98','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Requested',3,'',10,2),(715,'2019-05-27 16:49:56','97','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Requested',3,'',10,2),(716,'2019-05-27 16:49:56','96','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Requested',3,'',10,2),(717,'2019-05-27 16:49:56','95','IN: 2019-05-19  OUT: 2019-05-27 | The Roses | Requested',3,'',10,2),(718,'2019-05-27 16:49:56','94','IN: 2019-05-17  OUT: 2019-05-18 | La  Azul | Requested',3,'',10,2),(719,'2019-05-27 16:49:56','93','IN: 2019-05-17  OUT: 2019-05-18 | La  Azul | Requested',3,'',10,2),(720,'2019-05-27 16:49:56','92','IN: 2019-05-17  OUT: 2019-05-18 | La  Azul | Requested',3,'',10,2),(721,'2019-05-27 16:49:56','91','IN: 2019-05-17  OUT: 2019-05-18 | La  Azul | Requested',3,'',10,2),(722,'2019-05-27 16:49:56','90','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(723,'2019-05-27 16:49:56','89','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(724,'2019-05-27 16:49:56','88','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(725,'2019-05-27 16:49:56','87','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(726,'2019-05-27 16:49:56','86','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(727,'2019-05-27 16:49:56','85','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(728,'2019-05-27 16:49:56','84','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(729,'2019-05-27 16:49:56','83','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(730,'2019-05-27 16:49:56','82','IN: 2019-05-15  OUT: 2019-05-17 | Cristal | Requested',3,'',10,2),(731,'2019-05-27 16:49:56','81','IN: 2019-05-15  OUT: 2019-05-16 | Cristal | Requested',3,'',10,2),(732,'2019-05-27 16:49:56','80','IN: 2019-05-15  OUT: 2019-05-16 | La  Azul | Requested',3,'',10,2),(733,'2019-05-27 16:49:56','79','IN: 2019-05-13  OUT: 2019-05-16 | The Roses | Requested',3,'',10,2),(734,'2019-05-27 16:49:56','78','IN: 2019-05-13  OUT: 2019-05-16 | La  Azul | Paid',3,'',10,2),(735,'2019-05-27 16:49:56','77','IN: 2019-05-13  OUT: 2019-05-15 | La  Azul | Requested',3,'',10,2),(736,'2019-05-27 16:49:56','76','IN: 2019-05-13  OUT: 2019-05-15 | Don Lucho | Requested',3,'',10,2),(737,'2019-05-27 16:49:56','75','IN: 2019-05-13  OUT: 2019-05-15 | La  Azul | Requested',3,'',10,2),(738,'2019-05-27 16:49:56','74','IN: 2019-05-13  OUT: 2019-05-15 | The Roses | Requested',3,'',10,2),(739,'2019-05-27 16:49:56','73','IN: 2019-05-15  OUT: 2019-05-17 | La  Azul | Requested',3,'',10,2),(740,'2019-05-27 16:49:56','72','IN: 2019-05-10  OUT: 2019-05-11 | Paraiso | Requested',3,'',10,2),(741,'2019-05-27 16:49:56','71','IN: 2019-05-08  OUT: 2019-05-10 | The Roses | Held',3,'',10,2),(742,'2019-05-27 16:50:19','30','Payment object',3,'',16,2),(743,'2019-05-27 16:50:19','29','Payment object',3,'',16,2),(744,'2019-05-27 16:50:19','28','Payment object',3,'',16,2),(745,'2019-05-27 16:50:19','27','Payment object',3,'',16,2),(746,'2019-05-27 16:50:19','26','Payment object',3,'',16,2),(747,'2019-05-27 16:50:19','25','Payment object',3,'',16,2),(748,'2019-05-27 16:50:19','24','Payment object',3,'',16,2),(749,'2019-05-27 16:50:19','23','Payment object',3,'',16,2),(750,'2019-05-27 16:50:19','22','Payment object',3,'',16,2),(751,'2019-05-27 16:50:19','21','Payment object',3,'',16,2),(752,'2019-05-27 16:50:19','20','Payment object',3,'',16,2),(753,'2019-05-27 16:50:19','19','Payment object',3,'',16,2),(754,'2019-05-27 16:50:19','18','Payment object',3,'',16,2),(755,'2019-05-27 16:50:19','17','Payment object',3,'',16,2),(756,'2019-05-27 16:50:19','16','Payment object',3,'',16,2),(757,'2019-05-27 16:50:19','15','Payment object',3,'',16,2),(758,'2019-05-27 16:50:19','14','Payment object',3,'',16,2),(759,'2019-05-27 16:50:19','13','Payment object',3,'',16,2),(760,'2019-05-27 16:50:19','12','Payment object',3,'',16,2),(761,'2019-05-27 16:50:19','11','Payment object',3,'',16,2),(762,'2019-05-27 16:50:19','10','Payment object',3,'',16,2),(763,'2019-05-27 16:50:19','9','Payment object',3,'',16,2),(764,'2019-05-27 16:50:19','8','Payment object',3,'',16,2),(765,'2019-05-27 16:50:19','7','Payment object',3,'',16,2),(766,'2019-05-27 16:50:19','6','Payment object',3,'',16,2),(767,'2019-05-27 16:50:19','5','Payment object',3,'',16,2),(768,'2019-05-27 16:50:19','4','Payment object',3,'',16,2),(769,'2019-05-27 16:50:19','3','Payment object',3,'',16,2),(770,'2019-05-27 16:50:19','2','Payment object',3,'',16,2),(771,'2019-05-27 16:50:19','1','Payment object',3,'',16,2),(772,'2019-05-27 16:52:43','31','Payment object',3,'',16,2),(773,'2019-05-27 16:52:55','210','RoomReservation object',3,'',11,2),(774,'2019-05-27 16:53:08','171','IN: 2019-05-27  OUT: 2019-05-29 | Pedrito | Paid',3,'',10,2),(775,'2019-05-27 16:53:08','170','IN: 2019-05-27  OUT: 2019-05-29 | Pedrito | Requested',3,'',10,2),(776,'2019-05-27 16:53:08','169','IN: 2019-05-27  OUT: 2019-05-29 | Pedrito | Requested',3,'',10,2),(777,'2019-05-27 16:53:08','168','IN: 2019-05-27  OUT: 2019-05-29 | Pedrito | Requested',3,'',10,2),(778,'2019-05-27 16:53:08','167','IN: 2019-05-27  OUT: 2019-05-29 | Pedrito | Requested',3,'',10,2),(779,'2019-05-27 16:53:08','166','IN: 2019-05-24  OUT: 2019-05-25 | Pedrito | Requested',3,'',10,2),(780,'2019-05-27 16:53:08','165','IN: 2019-05-24  OUT: 2019-05-25 | Reinas | Requested',3,'',10,2),(781,'2019-05-27 16:53:08','164','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(782,'2019-05-27 16:53:08','163','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(783,'2019-05-27 16:53:08','162','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(784,'2019-05-27 16:53:08','161','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(785,'2019-05-27 16:53:08','160','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(786,'2019-05-27 16:53:08','159','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(787,'2019-05-27 16:53:08','158','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(788,'2019-05-27 16:53:08','157','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(789,'2019-05-27 16:53:08','156','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(790,'2019-05-27 16:53:08','155','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(791,'2019-05-27 16:53:08','154','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(792,'2019-05-27 16:53:08','153','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(793,'2019-05-27 16:53:08','152','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(794,'2019-05-27 16:53:08','151','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(795,'2019-05-27 16:53:08','150','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(796,'2019-05-27 16:53:08','149','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(797,'2019-05-27 16:53:08','148','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(798,'2019-05-27 16:53:08','147','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(799,'2019-05-27 16:53:08','146','IN: 2019-05-23  OUT: 2019-05-25 | Cristal | Requested',3,'',10,2),(800,'2019-05-27 16:53:08','145','IN: 2019-05-23  OUT: 2019-05-24 | Cristal | Requested',3,'',10,2),(801,'2019-05-27 16:53:08','144','IN: 2019-05-22  OUT: 2019-05-23 | Pedrito | Held',3,'',10,2),(802,'2019-05-27 16:53:08','143','IN: 2019-05-22  OUT: 2019-05-23 | Cristal | Requested',3,'',10,2),(803,'2019-05-27 16:53:08','142','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(804,'2019-05-27 16:53:08','141','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(805,'2019-05-27 16:53:08','140','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(806,'2019-05-27 16:53:08','139','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(807,'2019-05-27 16:53:08','138','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(808,'2019-05-27 16:53:08','137','IN: 2019-05-20  OUT: 2019-05-21 | Reinas | Requested',3,'',10,2),(809,'2019-05-27 16:53:08','136','IN: 2019-05-20  OUT: 2019-05-21 | Reinas | Requested',3,'',10,2),(810,'2019-05-27 16:53:08','135','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Held',3,'',10,2),(811,'2019-05-27 16:53:08','134','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(812,'2019-05-27 16:53:08','133','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(813,'2019-05-27 16:53:08','132','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(814,'2019-05-27 16:53:08','131','IN: 2019-05-20  OUT: 2019-05-21 | Reinas | Paid',3,'',10,2),(815,'2019-05-27 16:53:08','130','IN: 2019-05-20  OUT: 2019-05-21 | La  Azul | Paid',3,'',10,2),(816,'2019-05-27 16:53:08','129','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(817,'2019-05-27 16:53:08','128','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(818,'2019-05-27 16:53:08','127','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(819,'2019-05-27 16:53:08','126','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(820,'2019-05-27 16:53:08','125','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(821,'2019-05-27 16:53:08','124','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(822,'2019-05-27 16:53:09','123','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(823,'2019-05-27 16:53:09','122','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(824,'2019-05-27 16:53:09','121','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(825,'2019-05-27 16:53:09','120','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(826,'2019-05-27 16:53:09','119','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(827,'2019-05-27 16:53:09','118','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(828,'2019-05-27 16:53:09','117','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(829,'2019-05-27 16:53:09','116','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Requested',3,'',10,2),(830,'2019-05-27 16:53:09','115','IN: 2019-05-20  OUT: 2019-05-22 | Cristal | Requested',3,'',10,2),(831,'2019-05-27 16:53:09','114','IN: 2019-05-20  OUT: 2019-05-21 | Cristal | Paid',3,'',10,2),(832,'2019-05-27 16:53:09','113','IN: 2019-05-20  OUT: 2019-05-21 | La  Azul | Paid',3,'',10,2),(833,'2019-05-27 16:53:09','112','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(834,'2019-05-27 16:53:09','111','IN: 2019-05-19  OUT: 2019-05-20 | La  Azul | Paid',3,'',10,2),(835,'2019-05-27 16:53:09','110','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(836,'2019-05-27 16:53:09','109','IN: 2019-05-19  OUT: 2019-05-20 | La  Azul | Paid',3,'',10,2),(837,'2019-05-27 16:53:09','108','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(838,'2019-05-27 16:53:09','107','IN: 2019-05-19  OUT: 2019-05-20 | Don Lucho | Paid',3,'',10,2),(839,'2019-05-27 16:53:09','106','IN: 2019-05-19  OUT: 2019-05-20 | Paraiso | Paid',3,'',10,2),(840,'2019-05-27 16:53:09','105','IN: 2019-05-19  OUT: 2019-05-20 | Paraiso | Paid',3,'',10,2),(841,'2019-05-27 16:53:09','104','IN: 2019-05-19  OUT: 2019-05-20 | La  Azul | Requested',3,'',10,2),(842,'2019-05-27 16:53:09','103','IN: 2019-05-19  OUT: 2019-05-20 | The Roses | Requested',3,'',10,2),(843,'2019-05-27 16:53:09','102','IN: 2019-05-19  OUT: 2019-05-20 | La  Azul | Paid',3,'',10,2),(844,'2019-05-27 16:53:09','101','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(845,'2019-05-27 16:53:09','100','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Paid',3,'',10,2),(846,'2019-05-27 16:53:09','99','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Requested',3,'',10,2),(847,'2019-05-27 16:53:09','98','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Requested',3,'',10,2),(848,'2019-05-27 16:53:09','97','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Requested',3,'',10,2),(849,'2019-05-27 16:53:09','96','IN: 2019-05-19  OUT: 2019-05-20 | Cristal | Requested',3,'',10,2),(850,'2019-05-27 16:53:09','95','IN: 2019-05-19  OUT: 2019-05-27 | The Roses | Requested',3,'',10,2),(851,'2019-05-27 16:53:09','94','IN: 2019-05-17  OUT: 2019-05-18 | La  Azul | Requested',3,'',10,2),(852,'2019-05-27 16:53:09','93','IN: 2019-05-17  OUT: 2019-05-18 | La  Azul | Requested',3,'',10,2),(853,'2019-05-27 16:53:09','92','IN: 2019-05-17  OUT: 2019-05-18 | La  Azul | Requested',3,'',10,2),(854,'2019-05-27 16:53:09','91','IN: 2019-05-17  OUT: 2019-05-18 | La  Azul | Requested',3,'',10,2),(855,'2019-05-27 16:53:09','90','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(856,'2019-05-27 16:53:09','89','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(857,'2019-05-27 16:53:09','88','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(858,'2019-05-27 16:53:09','87','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(859,'2019-05-27 16:53:09','86','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(860,'2019-05-27 16:53:09','85','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(861,'2019-05-27 16:53:09','84','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(862,'2019-05-27 16:53:09','83','IN: 2019-05-17  OUT: 2019-05-18 | Cristal | Requested',3,'',10,2),(863,'2019-05-27 16:53:09','82','IN: 2019-05-15  OUT: 2019-05-17 | Cristal | Requested',3,'',10,2),(864,'2019-05-27 16:53:09','81','IN: 2019-05-15  OUT: 2019-05-16 | Cristal | Requested',3,'',10,2),(865,'2019-05-27 16:53:09','80','IN: 2019-05-15  OUT: 2019-05-16 | La  Azul | Requested',3,'',10,2),(866,'2019-05-27 16:53:09','79','IN: 2019-05-13  OUT: 2019-05-16 | The Roses | Requested',3,'',10,2),(867,'2019-05-27 16:53:09','78','IN: 2019-05-13  OUT: 2019-05-16 | La  Azul | Paid',3,'',10,2),(868,'2019-05-27 16:53:09','77','IN: 2019-05-13  OUT: 2019-05-15 | La  Azul | Requested',3,'',10,2),(869,'2019-05-27 16:53:09','76','IN: 2019-05-13  OUT: 2019-05-15 | Don Lucho | Requested',3,'',10,2),(870,'2019-05-27 16:53:09','75','IN: 2019-05-13  OUT: 2019-05-15 | La  Azul | Requested',3,'',10,2),(871,'2019-05-27 16:53:09','74','IN: 2019-05-13  OUT: 2019-05-15 | The Roses | Requested',3,'',10,2),(872,'2019-05-27 16:53:09','73','IN: 2019-05-15  OUT: 2019-05-17 | La  Azul | Requested',3,'',10,2),(873,'2019-05-27 16:53:09','72','IN: 2019-05-10  OUT: 2019-05-11 | Paraiso | Requested',3,'',10,2),(874,'2019-05-27 16:53:16','71','IN: 2019-05-08  OUT: 2019-05-10 | The Roses | Held',3,'',10,2),(875,'2019-05-27 16:53:16','70','IN: 2019-05-16  OUT: 2019-05-19 | Cristal | Requested',3,'',10,2),(876,'2019-05-27 16:53:16','69','IN: 2019-05-15  OUT: 2019-05-17 | Cristal | Requested',3,'',10,2),(877,'2019-05-27 16:53:16','68','IN: 2019-05-10  OUT: 2019-05-12 | La  Azul | Requested',3,'',10,2),(878,'2019-05-27 16:53:16','67','IN: 2019-05-16  OUT: 2019-05-18 | La  Azul | Requested',3,'',10,2),(879,'2019-05-27 16:53:16','66','IN: 2019-05-08  OUT: 2019-05-10 | Paraiso | Requested',3,'',10,2),(880,'2019-05-27 16:53:16','65','IN: 2019-05-10  OUT: 2019-05-19 | Paraiso | Requested',3,'',10,2),(881,'2019-05-27 16:53:16','64','IN: 2019-05-10  OUT: 2019-05-12 | Cristal | Requested',3,'',10,2),(882,'2019-05-27 16:53:16','63','IN: 2019-05-10  OUT: 2019-05-11 | Cristal | Requested',3,'',10,2),(883,'2019-05-27 16:53:16','62','IN: 2019-05-10  OUT: 2019-05-11 | Cristal | Requested',3,'',10,2),(884,'2019-05-27 16:53:16','61','IN: 2019-05-02  OUT: 2019-05-04 | Cristal | Held',3,'',10,2),(885,'2019-05-27 16:53:16','60','IN: 2019-05-16  OUT: 2019-05-19 | Cristal | Held',3,'',10,2),(886,'2019-05-27 16:53:16','59','IN: 2019-05-03  OUT: 2019-05-18 | Cristal | Held',3,'',10,2),(887,'2019-05-27 16:53:16','58','IN: 2019-05-01  OUT: 2019-05-05 | Cristal | Held',3,'',10,2),(888,'2019-05-27 16:53:16','57','IN: 2019-04-29  OUT: 2019-05-02 | Cristal | Requested',3,'',10,2),(889,'2019-05-27 16:53:16','56','IN: 2019-04-29  OUT: 2019-05-01 | Don Lucho | Held',3,'',10,2),(890,'2019-05-27 16:53:16','55','IN: 2019-04-28  OUT: 2019-05-01 | Don Lucho | Held',3,'',10,2),(891,'2019-05-27 16:53:16','54','IN: 2019-04-26  OUT: 2019-04-28 | Don Lucho | Held',3,'',10,2),(892,'2019-05-27 16:53:16','53','IN: 2019-04-26  OUT: 2019-04-28 | Don Lucho | Held',3,'',10,2),(893,'2019-05-27 16:53:16','52','IN: 2019-04-22  OUT: 2019-04-24 | Cristal | Held',3,'',10,2),(894,'2019-05-27 16:53:16','51','IN: 2019-04-22  OUT: 2019-04-24 | Cristal | Held',3,'',10,2),(895,'2019-05-27 16:53:16','50','IN: 2019-04-22  OUT: 2019-04-24 | Cristal | Held',3,'',10,2),(896,'2019-05-27 16:53:16','49','IN: 2019-05-16  OUT: 2019-05-17 | Cristal | Held',3,'',10,2),(897,'2019-05-27 16:53:16','48','IN: 2018-08-14  OUT: 2019-05-12 | Cristal | Held',3,'',10,2),(898,'2019-05-27 16:53:16','47','IN: 2019-03-05  OUT: 2019-03-07 | Don Lucho | Requested',3,'',10,2),(899,'2019-05-27 16:53:16','46','IN: 2019-03-04  OUT: 2019-03-08 | Paraiso | Held',3,'',10,2),(900,'2019-05-27 16:53:16','45','IN: 2019-03-15  OUT: 2019-03-16 | Paraiso | Held',3,'',10,2),(901,'2019-05-27 16:53:16','44','IN: 2019-03-04  OUT: 2019-03-08 | Paraiso | Held',3,'',10,2),(902,'2019-05-27 16:53:16','43','IN: 2019-03-04  OUT: 2019-03-08 | Paraiso | Held',3,'',10,2),(903,'2019-05-27 16:53:16','42','IN: 2019-03-04  OUT: 2019-03-06 | Paraiso | Requested',3,'',10,2),(904,'2019-05-27 16:53:16','41','IN: 2019-03-04  OUT: 2019-03-07 | Cristal | Requested',3,'',10,2),(905,'2019-05-27 16:53:16','40','IN: 2019-02-28  OUT: 2019-03-03 | Cristal | Requested',3,'',10,2),(906,'2019-05-27 16:53:16','39','IN: 2019-02-26  OUT: 2019-03-02 | Cristal | Requested',3,'',10,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'auth','user'),(7,'choose','amenity'),(6,'choose','authuser'),(1,'choose','city'),(3,'choose','hotel'),(13,'choose','hotelroomtemplate'),(2,'choose','interest'),(16,'choose','payment'),(10,'choose','reservation'),(9,'choose','reservationstatus'),(12,'choose','room'),(11,'choose','roomreservation'),(15,'choose','roomstatus'),(14,'choose','roomtemplate'),(4,'choose','system'),(8,'choose','tiponotifications');
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
INSERT INTO `django_session` VALUES ('0rjfxws4letu7v8rf09ka9tkpc2f8gui','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-29 01:14:33'),('15og1os6egkijvwwveywke9vdv0ndihn','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-27 02:50:38'),('251w3fvz5sxm6a4qb8out7muuoyva62x','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-27 05:54:47'),('2lbw9tovjntetwx18t2jgocvi6bznmy2','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-05-13 16:53:50'),('5851v9rnune4qnzk3s7ghhpiqf9i9pjp','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-18 03:11:52'),('70yan44x3o864ytxduac8z9pph9hul9j','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-12 02:10:06'),('8i93bp68o7yxe4w1leh9yk3lfhmjjuxl','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-06-06 13:12:17'),('9ieck1oq780xwu0af2nwinzsrqk1hrbb','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-06-14 03:38:07'),('9khk8glp42eurix9fy3zd5usleystzym','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-04-29 01:18:34'),('9ygkv5z625ppzvjyhu22q0ch2k51005l','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-13 03:05:32'),('dlav4marcgss9vqi7nsa5apx2mb88tjh','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-27 04:14:36'),('du8f9eelzretaz2cswf4j6azt871fukr','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-10-02 18:37:04'),('e8ymlfn0bw5k1xjnknrupn078freumdh','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-13 17:27:58'),('f639obvv9vztol92uo2o1ia6nalrpcad','Nzk5MGE4MTVjZjQ2NzQ5ZGQ1Zjg3MmVhMjBiNDc4YWE2NTFmYTA3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI3OGZkN2E1NTRmNmE1OWM0OTkwNWIyMTljMGYxOGU5OGU1YmIzZTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-06-03 05:17:53'),('fc1611hdyiq2fbxnxdn4pnf5lck2b96z','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-03 05:22:08'),('g2rnjfuqbqn6pv7fy7yjzu963u9k3oga','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-18 05:00:35'),('glp819kip5pafak8xu4u2l6y98mwek8t','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-04-29 04:49:04'),('hjhjkxfhfyctzks27jo3m7f3fqew27fx','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-08-13 21:01:49'),('i0pxbq0etv3tzsgsw5refcpij54ll776','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-05-01 16:57:50'),('iexgg1gvw5j3ajnc3xn0lg35ikqeu1if','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-19 19:08:07'),('in9vzgujcy0cm1i9bza3hndukrgb8o3k','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-04-30 03:22:55'),('j3mymbj84pof518m840mxp9lllpdbodc','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-06-05 03:04:22'),('jmpeffjid5bzqdw6lo9pbo1eq7jwlegj','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-14 04:49:56'),('k61l9o4p9zkrhmto1qls44lfqu8utkm0','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-13 19:00:33'),('mm4qkbdsr30ep4vok81lme56eb7jvj2n','Nzk5MGE4MTVjZjQ2NzQ5ZGQ1Zjg3MmVhMjBiNDc4YWE2NTFmYTA3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI3OGZkN2E1NTRmNmE1OWM0OTkwNWIyMTljMGYxOGU5OGU1YmIzZTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-27 17:59:25'),('mr5g9qu9pwos1yivgqyizddb9n65cftk','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-06-12 05:37:54'),('np3pobl5c69bsbdmjqr409ofwomjvn2g','Nzk5MGE4MTVjZjQ2NzQ5ZGQ1Zjg3MmVhMjBiNDc4YWE2NTFmYTA3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI3OGZkN2E1NTRmNmE1OWM0OTkwNWIyMTljMGYxOGU5OGU1YmIzZTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-27 16:20:33'),('o04ovzhq2c3tw077m6645ryq039ljzwe','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-05-07 03:12:11'),('o5wf2vem331ydxaukoqwaismkochxiph','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-01 17:10:32'),('o9gkgbojqwgfy7zuif7j9cu42g234ij0','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-13 01:33:46'),('oo325aho7ij67a8s3j1bqmu50uup3qq8','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-12 22:12:38'),('pamg984j37yzye9z4gpdm77exisfo16j','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-03 03:24:16'),('q11hss9litgdt8hrzc6wp0kahhzu7utw','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-03 03:03:24'),('qig58cjrl0rhlcxgcrd6gj1ww3j94iwo','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-04-20 17:43:50'),('rvpy3qukh3wi7dtfmmvacsd98msojtsa','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-06-10 16:46:26'),('sbfd4xzlw6oxo2lq68sxwkfxtyl1b6xq','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-07-03 00:47:00'),('skoqxdhjhu6if9rwxv1jndgpcvq3t99s','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-04-19 12:58:01'),('u9n4l8nyi9joon28bfqcavek3qqe0xl3','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-13 04:29:02'),('vbapbhjlrs2y7u5icz5pm6tdzl0nm4rj','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-14 04:57:39'),('w98m21iao7s6twpczxjaiywrp2ssk8lu','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-11 21:58:33'),('wrbcqa7efbe92eynp7gwkfane9312opz','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-06-05 16:53:35'),('xpn1szymnpolhn4msydczegcjtqfwxqy','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-03-14 05:45:31'),('xqkuwzfm77s1tr3rpck8hilc87zoi0g1','Nzk5MGE4MTVjZjQ2NzQ5ZGQ1Zjg3MmVhMjBiNDc4YWE2NTFmYTA3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI3OGZkN2E1NTRmNmE1OWM0OTkwNWIyMTljMGYxOGU5OGU1YmIzZTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-06-03 02:24:11'),('y8dxwrjas7q2llw71zxw83rwhp0kj6po','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-06-17 16:56:13'),('yqjvx7ockc7p54vy83edtblltoegcylw','MDg1MDkxYjcwMThhNmQzM2VlMzRlMzI1NWY1ODgyMTg5ODk2MTRiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NTQzMjBkNTI3NDEwODhkZTQ3NjRkYTI2ZjE5NGRmNDk5MGUwNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-08-16 20:06:23');
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
INSERT INTO `hotel` VALUES (2,'Cristal',1,'Buen Hotel','',NULL,1,13,NULL,'Av Javier Prado 345 323 Miraflores',NULL,37,12,158,2,0,3,'','','Av Javier Prado 345','323','Miraflores','2025-12-12 05:00:00',1,NULL),(3,'212',1,NULL,NULL,NULL,1,19,NULL,'2121 212 212',NULL,38,NULL,NULL,NULL,NULL,1,NULL,NULL,'2121','212','212','2025-12-12 05:00:00',1,NULL),(4,'2121',1,NULL,NULL,NULL,1,21,NULL,'2121 2121 212121www',NULL,39,NULL,NULL,NULL,NULL,1,NULL,NULL,'2121','2121','212121www','2025-12-12 05:00:00',1,NULL),(5,'212',1,'','',NULL,1,18,NULL,'121212 212 12121',NULL,40,NULL,0,NULL,NULL,1,'','','121212','212','12121','2025-12-12 05:00:00',1,NULL),(6,'Reinas',1,'','',NULL,1,21,NULL,'122 1212 21',NULL,41,12,25,NULL,NULL,3,'','','122','1212','21','2025-12-12 05:00:00',1,NULL),(7,'La  Azul',2,'','',NULL,1,13,NULL,'Av Evitamiento 234 San Juan Lurigancho',NULL,42,215,20,NULL,1,3,'','','Av Evitamiento','234','San Juan Lurigancho','2025-12-12 05:00:00',0,NULL),(8,'The Roses',3,'kkjkijjjkjl','',NULL,1,13,NULL,'Miraflores Lima 9899999 234 Lima',NULL,43,33,15,NULL,1,3,'','','Miraflores Lima 9899999','234','Lima','2025-12-12 05:00:00',0,NULL),(9,'Don Lucho',1,'Un Hotel Tradicional en Lima a precio comodo','',NULL,1,13,NULL,'Surco E3 Lima',NULL,44,212,29,NULL,1,3,'','','Surco','E3','Lima','2025-12-12 05:00:00',0,NULL),(10,'Paraiso',1,'','',11,1,13,NULL,'212 212 212',NULL,45,10,24,NULL,1,3,'','','212','212','212','2025-12-12 05:00:00',0,NULL),(11,'Pedrito',1,'Este es un hotel para mochileros que vijan por turismo. Se tiene dormitorios con camas disponibles&nbsp;','',NULL,110,13,NULL,'Jr Ayacucho 231 231 San Miguel',NULL,58,30,16,NULL,NULL,3,'','','Jr Ayacucho 231','231','San Miguel','2025-12-12 05:00:00',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_roomtemplate`
--

LOCK TABLES `hotel_roomtemplate` WRITE;
/*!40000 ALTER TABLE `hotel_roomtemplate` DISABLE KEYS */;
INSERT INTO `hotel_roomtemplate` VALUES (1,2,1,255,0,0,20,0,20,0,192,1,'Hi',NULL),(2,2,2,200,0,0,3,1,2,0,193,1,'joki',NULL),(3,10,1,10,0,0,20,0,20,0,174,1,'Bed',NULL),(4,10,2,22,0,0,3,1,2,0,176,1,'Private Bed',NULL),(5,10,3,40,0,0,2,1,1,0,175,1,'Single',NULL),(6,9,1,25,0,0,20,0,20,0,62,2,'25',NULL),(7,9,2,33,0,0,3,1,2,0,63,2,'Private Bed',NULL),(8,9,3,20,0,0,2,1,1,0,177,1,'sINGLE',NULL),(9,8,1,10,0,0,20,0,20,0,65,1,'Bed',NULL),(10,8,2,20,0,0,2,1,2,0,66,1,'PB',NULL),(11,7,1,20,0,0,20,0,20,0,195,1,'Bed',NULL),(12,7,2,20,0,0,3,1,2,0,198,1,'Private Bed',NULL),(13,7,3,20,0,0,2,1,1,0,197,1,'6565',NULL),(14,2,3,20,0,0,2,2,1,NULL,194,1,'3232',''),(15,11,2,22,0,0,3,1,2,0,172,1,'Private Bed',NULL),(16,11,3,30,0,0,2,1,1,0,173,1,'Single',NULL),(17,11,4,NULL,0,0,2,1,1,0,125,2,'333',NULL),(18,11,1,15,0,0,10,0,20,0,166,1,'Habitacion para mochileros',NULL),(19,9,5,40,0,0,4,2,2,0,178,1,'.',NULL),(20,6,2,25,0,0,3,1,2,0,212,1,'55',NULL),(21,6,3,25,0,0,2,1,1,0,213,1,'55',NULL);
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
INSERT INTO `interest` VALUES (1,'Gastronomia','Gastronomy','',NULL,NULL,'img/SVG/dish.svg'),(2,'Equitacion','Horse','',NULL,NULL,'img/SVG/black-head-horse-side-view-with-horsehair.svg'),(3,'Ciclismo','Biking','',NULL,NULL,'img/SVG/bycicle.svg'),(4,'Playa','Beach','',NULL,NULL,'img/SVG/beach-umbrella.svg'),(5,'Canoe','Canoes','',NULL,NULL,'img/SVG/kayak.svg'),(6,'Caminata','Hiking','',NULL,NULL,'img/SVG/one-man-walking.svg'),(7,'Sandboard','Sandboard','',NULL,NULL,'img/SVG/skier.svg'),(9,'Naturaleza','Naturality','',NULL,NULL,'img/SVG/leaf.svg'),(10,'Relajacion','Relaxation','',NULL,NULL,'img/SVG/leaf.svg'),(11,'Paisajes','Landscapes','',NULL,NULL,'img/SVG/mountain.svg'),(12,'Gente Amable','Friendly People','',NULL,NULL,'img/SVG/usuarios-multiples-en-silueta.svg'),(13,'Pasear','Walking','',NULL,NULL,'img/SVG/icon.svg'),(14,'Paseo por la naturaleza','Nature Walks','',NULL,NULL,'img/SVG/tree-silhouette.svg'),(15,'Senderismo','Trekking','',NULL,NULL,'img/SVG/hiking.svg'),(16,'Rutas Turisticas','Routes Touristic','',NULL,NULL,'img/SVG/pointer-on-map.svg'),(51,'Pesca','Fish','',NULL,NULL,'img/SVG/fishes-silhouette.svg'),(53,'Music','Music','',NULL,NULL,'img/SVG/music-player.svg'),(58,'Compras','Shopping','','',NULL,'img/SVG/shopping-cart.svg'),(61,'Viajes en coche','Road Trips','','',NULL,'img/SVG/car-garage.svg'),(62,'Romántico','Romantic','','',NULL,'img/SVG/corazon-forma-negra-para-san-valentin.svg'),(65,'Historia','Downhill Skiing','','',NULL,'img/SVG/pyramids.svg'),(68,'Tranquilidad','Tranquility','','',NULL,'img/SVG/leaf.svg'),(71,'Comida','Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(76,'Rural','Countryside','','',NULL,'img/SVG/leaf.svg'),(77,'Restaurantes','Restaurants','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(78,'Ambiente familiar','Family Friendly','','',NULL,'img/SVG/familia-en-silueta.svg'),(79,'Buen ambiente','Ambiance','','',NULL,'img/SVG/familia-en-silueta.svg'),(80,'Cocina gourmet','Gourmet Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(82,'Actividades al aire libre','Outdoor Activities','','',NULL,'img/SVG/leaf.svg'),(83,'Museos','Museums','','',NULL,'img/SVG/banco.svg'),(84,'Comida local','Local Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(85,'Buen ambiente','Atmosphere','','',NULL,'img/SVG/familia-en-silueta.svg'),(86,'Aire puro','Clean Air','','',NULL,'img/SVG/leaf.svg'),(87,'Montaña','Mountains','','',NULL,'img/SVG/snowed-mountains.svg'),(88,'Observar estrellas','Stargazing','','',NULL,'img/SVG/night.svg'),(90,'Limpieza','Cleanliness','','',NULL,'img/SVG/lavadora.svg'),(91,'Cenas de lujo','Fine Dining','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(92,'Centro histórico','Old Town','','',NULL,'img/SVG/pyramids.svg'),(94,'Paseos por la montaña','Mountain Walks','','',NULL,'img/SVG/snowed-mountains.svg'),(96,'Económico','Budget Friendly','','',NULL,'img/SVG/economic-investment.svg'),(97,'Arquitectura','Architecture','','',NULL,'img/SVG/pyramids.svg'),(98,'Paseos por la playa','Beach Walks','','',NULL,'img/SVG/beach-umbrella.svg'),(99,'Monumentos','Monuments','','',NULL,'img/SVG/pyramids.svg'),(102,'Cocina tradicional','Traditional Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(103,'Paseos por la ciudad','City Walks','','',NULL,'img/SVG/apartamentos.svg'),(104,'Escapada urbana','City Trip','','',NULL,'img/SVG/coche-con-equipaje.svg'),(105,'Costa','Seaside','','',NULL,'img/SVG/beach-umbrella.svg'),(108,'Playas de arena','Sand Beaches','','',NULL,'img/SVG/beach-umbrella.svg'),(109,'Castillos','Castles','','',NULL,'img/SVG/tower.svg'),(110,'Comer pescado y marisco','Seafood','','',NULL,'img/SVG/fish-with-four-bubbles.svg'),(111,'Hacer turismo','Tourism','','',NULL,'img/SVG/coche-con-equipaje.svg'),(112,'Bosques bonitos','Beautiful Forests','','',NULL,'img/SVG/forest.svg'),(113,'Flora y fauna','Wildlife','','',NULL,'img/SVG/huella-de-un-perro.svg'),(114,'Pesca','Fishing','','',NULL,'img/SVG/senal-de-pesca.svg'),(115,'Lugares antiguos','Ancient Landmarks','','',NULL,'img/SVG/piramides.svg'),(117,'Lagos','Lakes','','',NULL,'img/SVG/paisaje.svg'),(118,'Parques','Parks','','',NULL,'img/SVG/bosque.svg'),(119,'Aventura','Adventure','','',NULL,'img/SVG/cuerda.svg'),(120,'Paseos por la costa','Coastal Walks','','',NULL,'img/SVG/beach-umbrella.svg'),(121,'Días soleados','Sunny','','',NULL,'img/SVG/sol.svg'),(122,'Ocio nocturno','Nightlife','','',NULL,'img/SVG/night.svg'),(123,'Atardeceres','Sunsets','','',NULL,'img/SVG/sunset-fuji-mountain.svg'),(124,'Comida internacional','Culturally Diverse Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(125,'Hacer negocios','Business','','',NULL,'img/SVG/money-bag-with-dollar-symbol.svg'),(126,'Golf','Golf','','',NULL,'img/SVG/golf-flag-and-field.svg'),(127,'Cafeterías','Cafés','','',NULL,'img/SVG/hot-coffee-rounded-cup-on-a-plate-from-side-view.svg'),(128,'Salir de bares','Bars','','',NULL,'img/SVG/beer.svg'),(129,'Vistas de la ciudad','Skyline','','',NULL,'img/SVG/city-buildings-silhouette.svg'),(130,'Tours','Tours','','',NULL,'img/SVG/coche-con-equipaje.svg'),(131,'Mercados','Markets','','',NULL,'img/SVG/megaphone.svg'),(132,'Ciclismo de montaña','Mountain Biking','','',NULL,'img/SVG/snowed-mountains.svg'),(133,'Buen acceso en transporte público','Convenient Public Transportation','','',NULL,'img/SVG/coche-con-equipaje.svg'),(134,'Playas familiares','Beaches for Kids','','',NULL,'img/SVG/beach-umbrella.svg'),(135,'Navegar en barco','Boating','','',NULL,'img/SVG/sea-ship.svg'),(136,'Comprar ropa','Clothes Shopping','','',NULL,'img/SVG/shopping-cart.svg'),(138,'Música en directo','Live Music','','',NULL,'img/SVG/music-player.svg'),(139,'Bosque','Forest','','',NULL,'img/SVG/forest.svg'),(140,'Bienestar','Wellness','','',NULL,'img/SVG/plant-on-a-hand.svg'),(141,'Pasear con niños','Walking with Kids','','',NULL,'img/SVG/icon.svg'),(142,'Cocina vegetariana','Vegetarian cuisine','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(143,'Ocio','Entertainment','','',NULL,'img/SVG/resting.svg'),(144,'Tomar el sol','Sunbathing','','',NULL,'img/SVG/tomar-el-sol.svg'),(145,'Comprar accesorios','Accessories Shopping','','',NULL,'img/SVG/shopping-cart.svg'),(146,'Salir de pubs','Pubs','','',NULL,'img/SVG/beer.svg'),(147,'Deporte','Sports','','',NULL,'img/SVG/futbol.svg'),(148,'Iglesias','Churches','','',NULL,'img/SVG/iglesia.svg'),(149,'Puerto','Harbor','','',NULL,'img/SVG/muelle-de-la-ciudad.svg'),(150,'Fotografía','Photography','','',NULL,'img/SVG/camara-de-fotos.svg'),(151,'Arte','Art','','',NULL,'img/SVG/paleta-de-pintor.svg'),(152,'Comprar comida','Food Shopping','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),(153,'Buceo','Diving','','',NULL,'img/SVG/diving-goggles.svg'),(154,'Cerveza','Beer','','',NULL,'img/SVG/beer.svg'),(155,'Viñedos','Vineyards','','',NULL,'img/SVG/racimo-de-uvas.svg'),(156,'Clima caluroso','Hot Weather','','',NULL,'img/SVG/sol.svg'),(157,'Observar aves','Bird Watching','','',NULL,'img/SVG/paloma.svg'),(158,'Snorkel','Snorkeling','','',NULL,'img/SVG/bucear.svg'),(159,'Destinos para casarse','Destination Weddings','','',NULL,'img/SVG/regalo.svg'),(160,'Montañismo','Mountaineering','','',NULL,'img/SVG/snowed-mountains.svg'),(161,'Aguas termales','Hot Springs','','',NULL,'img/SVG/arbol.svg'),(162,'Cultura alternativa','Alternative Culture','','',NULL,'img/SVG/pyramids.svg'),(163,'Museos de Arte','Fine Art Museums','','',NULL,'img/SVG/banco.svg'),(164,'Cascadas','Waterfalls','','',NULL,'img/SVG/cascada.svg'),(165,'Pasear con mascotas','Walking with Pets','','',NULL,'img/SVG/perro.svg'),(166,'Excursiones en kayak','Kayaking','','',NULL,'img/SVG/canoeing.svg'),(167,'Montar a caballo','Horseback Riding','','',NULL,'img/SVG/black-head-horse-side-view-with-horsehair.svg'),(168,'Jardin botanico','Botanical Garden','','',NULL,'img/SVG/planta.svg'),(169,'Comprar vino','Wine Shopping','','',NULL,'img/SVG/copa.svg'),(170,'Motociclismo','Motorcycling','','',NULL,'img/SVG/casco-de-motociclista-en-vista-lateral.svg'),(171,'Navegar','Sailing','','',NULL,'img/SVG/transportacion-maritima.svg'),(172,'Surf','Surfing','','',NULL,'img/SVG/navegar.svg'),(173,'Zoo','Zoo','','',NULL,'img/SVG/oso-mirando-a-la-derecha.svg'),(174,'Comprar antiguedades','Antiquing','','',NULL,'img/SVG/carro.svg'),(175,'Playas de guijarros','Riverside Walks','','',NULL,'img/SVG/beach-umbrella.svg'),(176,'Conocer gente','Meeting New People','','',NULL,'img/SVG/usuarios-multiples-en-silueta.svg'),(177,'Escalada','Climbing','','',NULL,'img/SVG/escalando-con-una-cuerda.svg'),(178,'Arqueologia','Archaeology','','',NULL,'img/SVG/piramide-del-sol.svg'),(179,'Catedral','Cathedral','','',NULL,'img/SVG/catedral-de-milan.svg'),(180,'Teatro','Theater','','',NULL,'img/SVG/mascaras-de-teatro.svg'),(181,'Deporte Invierno','Winter Sports','','',NULL,'img/SVG/zapatilla-de-correr.svg'),(182,'Cafe','Coffee','','',NULL,'img/SVG/cafe-caliente-en-taza-redondeada-en-un-plato-de-la-vista-lateral.svg'),(183,'Comida Saludable','Healthy Food','','',NULL,'img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg');
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,15,'2018-04-07 04:40:08','New User',NULL,NULL,NULL,NULL),(2,39,'2018-06-19 03:12:26','Pay new owner',NULL,4,NULL,NULL),(3,40,'2018-06-19 03:15:20','Pay new owner',NULL,5,NULL,NULL),(4,41,'2018-06-19 05:23:28','Pay new owner',NULL,6,NULL,NULL),(5,42,'2018-07-05 05:55:12','Pay new owner',NULL,7,NULL,NULL),(6,43,'2018-07-13 01:45:29','Pay new owner',NULL,8,NULL,NULL),(7,44,'2018-07-13 01:56:31','Pay new owner',NULL,9,NULL,NULL),(8,45,'2018-07-13 02:09:25','Pay new owner',NULL,10,NULL,NULL),(9,46,'2018-08-02 19:27:15','New User',NULL,NULL,NULL,NULL),(10,47,'2018-08-02 19:38:06','New User',NULL,NULL,NULL,NULL),(11,49,'2018-08-02 19:47:34','New User',NULL,NULL,NULL,NULL),(12,50,'2018-08-02 19:48:14','New User',NULL,NULL,NULL,NULL),(13,51,'2018-08-02 19:49:32','New User',NULL,NULL,NULL,NULL),(14,52,'2018-08-02 19:50:17','New User',NULL,NULL,NULL,NULL),(15,53,'2018-08-02 19:51:07','New User',NULL,NULL,NULL,NULL),(16,54,'2018-08-02 19:55:03','New User',NULL,NULL,NULL,NULL),(17,55,'2018-08-02 19:56:13','New User',NULL,NULL,NULL,NULL),(18,56,'2018-08-02 19:58:38','New User',NULL,NULL,NULL,NULL),(19,NULL,'2018-08-02 20:10:17','2122',NULL,10,NULL,5),(20,NULL,'2018-08-02 20:13:16','2122',NULL,10,NULL,5),(21,NULL,'2018-08-02 20:14:27','2122',NULL,10,NULL,5),(22,NULL,'2018-08-02 20:14:59','2122',NULL,10,NULL,5),(23,NULL,'2018-08-02 20:19:01','2122',NULL,10,NULL,5),(24,NULL,'2018-08-02 20:28:34','2122',NULL,10,NULL,5),(25,NULL,'2018-08-02 20:30:51','2122',NULL,9,NULL,5),(26,NULL,'2018-08-02 20:40:09','2122',NULL,9,NULL,5),(27,NULL,'2018-08-02 20:47:53','2122',NULL,10,NULL,5),(28,NULL,'2018-08-02 20:50:30','2122',NULL,10,NULL,5),(29,57,'2018-08-02 21:00:00','New User',NULL,NULL,NULL,NULL),(30,NULL,'2018-08-02 21:00:17','2122',NULL,10,NULL,5),(31,58,'2018-08-08 19:12:03','Pay new owner',NULL,11,NULL,NULL),(32,59,'2018-08-13 15:39:30','New User',NULL,NULL,NULL,NULL),(33,NULL,'2018-08-13 15:39:52','2122',NULL,10,NULL,5),(34,60,'2018-09-18 16:49:44','New User',NULL,NULL,NULL,NULL),(35,61,'2018-09-18 17:14:51','New User',NULL,NULL,NULL,NULL),(36,62,'2018-09-18 17:42:48','New User',NULL,NULL,NULL,NULL),(37,63,'2018-09-18 17:55:08','New User',NULL,NULL,NULL,NULL),(38,71,'2018-09-18 18:14:49','New User',NULL,NULL,NULL,NULL),(39,72,'2018-09-18 18:23:04','New User',NULL,NULL,NULL,NULL),(40,73,'2018-09-18 18:28:45','New User',NULL,NULL,NULL,NULL),(41,74,'2018-09-18 18:29:34','New User',NULL,NULL,NULL,NULL),(42,75,'2018-10-11 02:03:47','New User',NULL,NULL,NULL,NULL),(43,76,'2019-01-12 22:48:20','New User',NULL,NULL,NULL,NULL),(44,78,'2019-01-12 22:48:34','New User',NULL,NULL,NULL,NULL),(45,NULL,'2019-01-12 22:52:57','2122',NULL,9,NULL,5),(46,123,'2019-04-15 04:56:25','New User',NULL,NULL,NULL,NULL),(47,125,'2019-04-15 04:57:32','New User',NULL,NULL,NULL,NULL),(48,126,'2019-04-15 05:00:09','New User',NULL,NULL,NULL,NULL),(49,127,'2019-04-15 05:07:18','New User',NULL,NULL,NULL,NULL),(50,130,'2019-05-05 18:43:22','New User',NULL,NULL,NULL,NULL),(51,131,'2019-05-05 18:43:47','New User',NULL,NULL,NULL,NULL),(52,135,'2019-05-05 18:46:41','New User',NULL,NULL,NULL,NULL),(53,136,'2019-05-05 18:55:23','New User',NULL,NULL,NULL,NULL),(54,137,'2019-05-06 03:59:39','New User',NULL,NULL,NULL,NULL),(55,138,'2019-05-06 04:12:21','New User',NULL,NULL,NULL,NULL),(56,139,'2019-05-06 04:18:08','New User',NULL,NULL,NULL,NULL),(57,140,'2019-05-06 04:30:34','New User',NULL,NULL,NULL,NULL),(58,141,'2019-05-06 04:38:18','New User',NULL,NULL,NULL,NULL),(59,NULL,'2019-05-06 04:56:44','2122',NULL,8,NULL,5),(60,142,'2019-05-14 04:23:38','New User',NULL,NULL,NULL,NULL),(61,NULL,'2019-05-14 04:29:25','2122',NULL,7,NULL,5),(62,NULL,'2019-05-17 14:12:05','2122',NULL,7,NULL,5),(63,NULL,'2019-05-20 17:22:43','2122',NULL,2,NULL,5),(64,NULL,'2019-05-20 17:30:54','2122',NULL,2,NULL,5),(65,NULL,'2019-05-20 17:43:31','2122',NULL,2,NULL,5),(66,NULL,'2019-05-20 17:45:23','2122',NULL,2,NULL,5),(67,NULL,'2019-05-20 17:46:42','2122',NULL,2,NULL,5),(68,NULL,'2019-05-20 17:46:51','2122',NULL,2,NULL,5),(69,NULL,'2019-05-20 17:47:51','2122',NULL,2,NULL,5),(70,NULL,'2019-05-20 17:48:05','2122',NULL,2,NULL,5),(71,NULL,'2019-05-20 17:49:04','2122',NULL,2,NULL,5),(72,NULL,'2019-05-20 17:49:40','2122',NULL,2,NULL,5),(73,NULL,'2019-05-20 17:50:09','2122',NULL,2,NULL,5),(74,NULL,'2019-05-20 17:52:59','2122',NULL,2,NULL,5),(75,NULL,'2019-05-20 17:53:13','2122',NULL,2,NULL,5),(76,NULL,'2019-05-20 17:55:23','2122',NULL,2,NULL,5),(77,NULL,'2019-05-20 17:59:20','2122',NULL,2,NULL,5),(78,NULL,'2019-05-20 18:00:11','2122',NULL,2,NULL,5),(79,NULL,'2019-05-20 18:03:56','2122',NULL,2,NULL,5),(80,NULL,'2019-05-20 18:07:11','2122',NULL,2,NULL,5);
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
  `currency` varchar(15) DEFAULT NULL,
  `fee` varchar(15) DEFAULT NULL,
  `price` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation` (`reservation`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`reservation`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (32,NULL,NULL,'2019-05-27 16:40:02','59.99','9093749719824',172,'\"APPROVED\"','APPROVED','2019-05-27 16:55:47','USD','9.99','50'),(33,NULL,NULL,'2019-05-27 17:11:39','519.99','9093749719926',174,'\"APPROVED\"','APPROVED','2019-05-27 17:11:57','USD','9.99','510'),(34,NULL,NULL,'2019-05-27 17:11:39','89.99','9093749719977',175,'\"APPROVED\"','APPROVED','2019-05-27 17:12:33','USD','9.99','80'),(35,NULL,NULL,'2019-06-02 17:03:02','510.00','9093749793201',198,'Y',NULL,'2019-06-02 17:03:31','USD',NULL,'510'),(36,NULL,NULL,'2019-06-02 17:03:02','75.00','9093749793246',200,'Y',NULL,'2019-06-02 17:06:55','USD',NULL,'75'),(37,NULL,NULL,'2019-06-03 16:40:03','44.00','9093749804523',202,'Y',NULL,'2019-06-03 16:53:55','USD',NULL,'44');
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
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,NULL,NULL,NULL,'static/descarga_3zAgUGI.jpg',NULL,NULL,NULL),(2,NULL,NULL,NULL,'static/02_chb_search_hotels.jpg',NULL,NULL,NULL),(3,NULL,NULL,NULL,'static/04_chb_choose_hotel_room.jpg',NULL,NULL,NULL),(4,NULL,NULL,NULL,'static/the-westin-o-hare.jpg',NULL,NULL,NULL),(5,NULL,NULL,NULL,'static/wes3495ex.110171_tt.jpg',NULL,NULL,NULL),(6,NULL,NULL,NULL,'static/wes3495ex.110171_tt_3XyK3As.jpg',NULL,NULL,NULL),(7,NULL,NULL,NULL,'static/wes3495ex.110171_tt_6P2HE7I.jpg',NULL,NULL,NULL),(8,NULL,NULL,NULL,'static/wes3495ex.110171_tt_2IEdi3f.jpg',NULL,NULL,NULL),(9,'',NULL,NULL,'static/The-Westin-Cleveland-exterior.jpg',2,NULL,0),(10,'',NULL,NULL,'static/Exterior_View-V2.jpg',2,0,0),(11,'',NULL,NULL,'static/wes1993ex-188026-Hotel-Exterior--1-.jpg',2,0,0),(12,NULL,NULL,NULL,'static/Westin_Lima.jpg',NULL,NULL,NULL),(13,'',NULL,NULL,'static/wes1023ex.145335_tb-2.jpg',2,0,0),(14,NULL,NULL,NULL,'static/Westin_Lima_gp8wW6T.jpg',NULL,NULL,NULL),(15,NULL,NULL,NULL,'static/leia-gas-lift-king-size-bed-frame-1-product-front.png',NULL,NULL,NULL),(16,NULL,NULL,NULL,'static/wes3495ex.110171_tt_XSgUqzJ.jpg',NULL,NULL,NULL),(17,NULL,NULL,NULL,'static/The-Westin-Cleveland-exterior_wFdXJM1.jpg',NULL,NULL,NULL),(18,NULL,NULL,NULL,'static/Noticia-195167-paolo-guerrero.jpg',NULL,NULL,NULL),(19,NULL,NULL,NULL,'static/195905_16052707520042778105.jpg',NULL,NULL,NULL),(20,NULL,NULL,NULL,'static/The-Westin-Cleveland-exterior_7JZiIbJ.jpg',NULL,NULL,NULL),(21,NULL,NULL,NULL,'static/tere-5.jpg',NULL,NULL,NULL),(22,NULL,NULL,NULL,'static/6-9.jpg',NULL,NULL,NULL),(23,NULL,NULL,NULL,'static/292206_15011108360024412299.jpg',NULL,NULL,NULL),(24,NULL,NULL,NULL,'static/very-nice-hotel-and-salted.jpg',NULL,NULL,NULL),(25,NULL,NULL,NULL,'static/hotel-las-flores-ica.jpg',NULL,NULL,NULL),(26,NULL,NULL,NULL,'static/hotel-las-flores-ica_JBjr43x.jpg',NULL,NULL,NULL),(27,NULL,NULL,NULL,'static/hotel-las-flores-ica_0MNX0cd.jpg',NULL,NULL,NULL),(28,NULL,NULL,NULL,'static/292206_15011108360024412299_ByUBco9.jpg',NULL,NULL,NULL),(29,NULL,NULL,NULL,'static/292206_15011108360024412299_37NMlRK.jpg',NULL,NULL,NULL),(30,NULL,NULL,NULL,'static/hotel-las-flores-ica_cvo5DFg.jpg',NULL,NULL,NULL),(31,NULL,NULL,NULL,'static/hotel.jpg',NULL,NULL,NULL),(32,NULL,NULL,NULL,'static/hotel-las-flores-ica_1AXn31t.jpg',NULL,NULL,NULL),(33,NULL,NULL,NULL,'static/hotel-las-flores-ica_IVa4UZl.jpg',NULL,NULL,NULL),(34,NULL,NULL,NULL,'static/hotel-las-flores-ica_bPCeaXX.jpg',NULL,NULL,NULL),(35,NULL,NULL,NULL,'static/hotel-las-flores-ica_z4eqPaf.jpg',NULL,NULL,NULL),(36,NULL,NULL,NULL,'static/292206_15011108360024412299_49HfTIH.jpg',NULL,NULL,NULL),(37,'',NULL,NULL,'static/slider-piscina-ok.jpg',7,NULL,0),(38,'',NULL,NULL,'static/slider-piscina-ok_G3EKMIR.jpg',7,NULL,0),(39,'',NULL,NULL,'static/holiday-inn-hotel-and-suites-mckinney-4020033695-4x3.jpeg',8,NULL,0),(40,'',NULL,NULL,'static/holiday-inn-hotel-and-suites-west-des-moines-2531973843-4x3.jpeg',8,1,0),(41,'',NULL,NULL,'static/holiday-inn-the-colony-4629618286-4x3.jpeg',8,1,0),(42,'',NULL,NULL,'static/holiday-inn-hotel-and-suites-west-des-moines-2531973843-4x3_K7GTc77.jpeg',8,1,0),(43,'',NULL,NULL,'static/holiday-inn-express-and-suites-desoto-4186278663-4x3.jpeg',8,1,0),(44,NULL,NULL,NULL,'static/4e39f7e479f29f454b0cff73c242ae4a.jpg',NULL,NULL,NULL),(45,'',NULL,NULL,'static/4e39f7e479f29f454b0cff73c242ae4a_8hxz8T5.jpg',9,NULL,0),(46,'',NULL,NULL,'static/4b1bda81b00f999ccb34a72e9d5b9301.jpg',9,0,0),(47,'',NULL,NULL,'static/4b1bda81b00f999ccb34a72e9d5b9301_rcnBY3z.jpg',9,0,0),(48,'',NULL,NULL,'static/Vista_lateral_del_Hotel_Francia_Aguascalientes.jpg',9,0,0),(49,'',NULL,NULL,'static/holiday-inn-paris-3861976252-4x3.jpeg',9,1,0),(50,'',NULL,NULL,'static/7142305554ca8aab760a381d9a960760.jpg',7,1,0),(51,'',NULL,NULL,'static/151687952620d55345cca018bf459a6ffa8da361cd.jpg',7,1,0),(52,NULL,NULL,NULL,'static/casa-de-praia-2_21032704.jpg',NULL,NULL,NULL),(53,'',NULL,NULL,'static/casa-en-la-playa-878.jpg',7,1,0),(54,'',NULL,NULL,'static/Casa_de_montana-Cubierta_Madera.jpg',10,0,0),(55,'',NULL,NULL,'static/20170625_182126-1.jpg',10,NULL,0),(56,'',NULL,NULL,'static/fotosustitucion160075.jpg',10,0,0),(57,'',NULL,NULL,'static/20170625_182126-1_o6PLMF2.jpg',10,0,0),(58,NULL,NULL,NULL,'static/542574.jpg',NULL,NULL,NULL),(59,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1.jpg',NULL,NULL,NULL),(60,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_Mxau3li.jpg',NULL,NULL,NULL),(61,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_jxm3B2V.jpg',NULL,NULL,NULL),(62,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_p4FzB1h.jpg',NULL,NULL,NULL),(63,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_k88qO6R.jpg',NULL,NULL,NULL),(64,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_OqOhzwi.jpg',NULL,NULL,NULL),(65,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_5tqmlRn.jpg',NULL,NULL,NULL),(66,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_Ljn7T0d.jpg',NULL,NULL,NULL),(67,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_gBTdf2r.jpg',NULL,NULL,NULL),(68,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_99EIukV.jpg',NULL,NULL,NULL),(69,NULL,NULL,NULL,'static/Cooper-Bed-Frame-Landscape-2015-1_PTB4YbK.jpg',NULL,NULL,NULL),(70,NULL,NULL,NULL,'static/teta.jpg',NULL,NULL,NULL),(71,NULL,NULL,NULL,'static/teta_IeeVgla.jpg',NULL,NULL,NULL),(72,NULL,NULL,NULL,'static/hotel_jwESO92.jpg',NULL,NULL,NULL),(73,NULL,NULL,NULL,'static/hotel2.jpg',NULL,NULL,NULL),(74,NULL,NULL,NULL,'static/hotel2_ljDpCr0.jpg',NULL,NULL,NULL),(75,NULL,NULL,NULL,'static/hotel1.JPG',NULL,NULL,NULL),(76,NULL,NULL,NULL,'static/hotel_0C2Tqt5.jpg',NULL,NULL,NULL),(77,NULL,NULL,NULL,'static/hotel2_c1oKjL7.jpg',NULL,NULL,NULL),(78,NULL,NULL,NULL,'static/hotel1_9vR8g7F.JPG',NULL,NULL,NULL),(79,NULL,NULL,NULL,'static/hotel_BzRBaTw.jpg',NULL,NULL,NULL),(80,NULL,NULL,NULL,'static/hotel1_egnngS5.JPG',NULL,NULL,NULL),(81,NULL,NULL,NULL,'static/hotel_BVDLshE.jpg',NULL,NULL,NULL),(82,NULL,NULL,NULL,'static/hotel1_KDSwiGy.JPG',NULL,NULL,NULL),(83,NULL,NULL,NULL,'static/hotel_l1eJvQD.jpg',NULL,NULL,NULL),(84,NULL,NULL,NULL,'static/hotel1_5s9zBqC.JPG',NULL,NULL,NULL),(85,NULL,NULL,NULL,'static/hotel2_aosRxAJ.jpg',NULL,NULL,NULL),(86,NULL,NULL,NULL,'static/hotel1_XZPe7Ej.JPG',NULL,NULL,NULL),(87,NULL,NULL,NULL,'static/teta_omoPrMx.jpg',NULL,NULL,NULL),(88,NULL,NULL,NULL,'static/hotel1_mlF1jYi.JPG',NULL,NULL,NULL),(89,NULL,NULL,NULL,'static/foto.jpeg',NULL,NULL,NULL),(90,NULL,NULL,NULL,'static/maxresdefault.jpg',NULL,NULL,NULL),(91,NULL,NULL,NULL,'static/andronis-boutique-hotel.jpg',NULL,NULL,NULL),(92,NULL,NULL,NULL,'static/andronis-boutique-hotel_4KxQ0KW.jpg',NULL,NULL,NULL),(93,NULL,NULL,NULL,'static/hotel-con-encanto-en-granada-1.jpg',NULL,NULL,NULL),(94,NULL,NULL,NULL,'static/hotel-con-encanto-en-granada-1_fOEq0DT.jpg',NULL,NULL,NULL),(95,NULL,NULL,NULL,'static/andronis-boutique-hotel_DB9rra3.jpg',NULL,NULL,NULL),(96,NULL,NULL,NULL,'static/mainbg_f.jpg',NULL,NULL,NULL),(97,'',NULL,NULL,'static/Bogotá_carrera_10_Hotel_Tequendama.JPG',11,NULL,0),(98,NULL,NULL,NULL,'static/mainbg_f_EtzXmhb.jpg',NULL,NULL,NULL),(99,NULL,NULL,NULL,'static/11753593.jpg',NULL,NULL,NULL),(100,NULL,NULL,NULL,'static/hotel-con-encanto-en-granada-1_RtrkiQL.jpg',NULL,NULL,NULL),(101,NULL,NULL,NULL,'static/andronis-boutique-hotel_GnTFNr3.jpg',NULL,NULL,NULL),(102,NULL,NULL,NULL,'static/slider-back-hotel.jpg',NULL,NULL,NULL),(103,NULL,NULL,NULL,'static/slider-back-hotel_d2bAcI3.jpg',NULL,NULL,NULL),(104,NULL,NULL,NULL,'static/slider-back-hotel_DzT7uIB.jpg',NULL,NULL,NULL),(105,'',NULL,NULL,'static/slider-back-hotel_IEoP4bw.jpg',11,NULL,0),(106,NULL,NULL,NULL,'static/andronis-boutique-hotel_dScfABI.jpg',NULL,NULL,NULL),(107,NULL,NULL,NULL,'static/andronis-boutique-hotel_sVIpnXS.jpg',NULL,NULL,NULL),(108,NULL,NULL,NULL,'static/andronis-boutique-hotel_zGtarZU.jpg',NULL,NULL,NULL),(109,'',NULL,NULL,'static/slider-back-hotel_SYBHwj5.jpg',11,NULL,0),(110,'',NULL,NULL,'static/slider-back-hotel_ym4fxnf.jpg',11,NULL,0),(111,NULL,NULL,NULL,'static/slider-back-hotel_SWWhD6V.jpg',NULL,NULL,NULL),(112,'',NULL,NULL,'static/Bogotá_carrera_10_Hotel_Tequendama_nGTp7em.JPG',11,NULL,0),(113,NULL,NULL,NULL,'static/cama-tapizada-nina.jpg',NULL,NULL,NULL),(114,NULL,NULL,NULL,'static/hotel-panamericano-lima.jpg',NULL,NULL,NULL),(115,NULL,NULL,NULL,'static/97702016.jpg',NULL,NULL,NULL),(116,NULL,NULL,NULL,'static/cafe-plaza-yucay-2.jpg',NULL,NULL,NULL),(117,'',NULL,NULL,'static/cafe-plaza-yucay-2_9LMkeT5.jpg',11,NULL,0),(118,NULL,NULL,NULL,'static/hotel-terraza-san-pedrito.jpg',NULL,NULL,NULL),(119,NULL,NULL,NULL,'static/hotel-panamericano-lima_4SzuWD9.jpg',NULL,NULL,NULL),(120,NULL,NULL,NULL,'static/97702016_Sv0fV4J.jpg',NULL,NULL,NULL),(121,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L.jpg',NULL,NULL,NULL),(122,NULL,NULL,NULL,'static/54893134.jpg',NULL,NULL,NULL),(123,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L_iOkjzxj.jpg',NULL,NULL,NULL),(124,NULL,NULL,NULL,'static/cafe-plaza-yucay-2_KQnzL9Z.jpg',NULL,NULL,NULL),(125,NULL,NULL,NULL,'static/cafe-plaza-yucay-2_mUDMuL0.jpg',NULL,NULL,NULL),(126,NULL,NULL,NULL,'static/hotel-panamericano-lima_fr5dvfm.jpg',NULL,NULL,NULL),(127,NULL,NULL,NULL,'static/hotel-terraza-san-pedrito_pamrDha.jpg',NULL,NULL,NULL),(128,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L_hm3d54d.jpg',NULL,NULL,NULL),(129,NULL,NULL,NULL,'static/hotel-terraza-san-pedrito_Xkj5IPC.jpg',NULL,NULL,NULL),(130,NULL,NULL,NULL,'static/hotel-terraza-san-pedrito_DgaQfhl.jpg',NULL,NULL,NULL),(131,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L_rX9kdGW.jpg',NULL,NULL,NULL),(132,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L_nh03viD.jpg',NULL,NULL,NULL),(133,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L_RK2VLnV.jpg',NULL,NULL,NULL),(134,NULL,NULL,NULL,'static/limdt-guestroom-0082-hor-clsc.jpg',NULL,NULL,NULL),(135,NULL,NULL,NULL,'static/hotel-panamericano-lima_s7bTahD.jpg',NULL,NULL,NULL),(136,NULL,NULL,NULL,'static/cafe-plaza-yucay-2_ZZcusuJ.jpg',NULL,NULL,NULL),(137,NULL,NULL,NULL,'static/cafe-plaza-yucay-2_evn3ThQ.jpg',NULL,NULL,NULL),(138,NULL,NULL,NULL,'static/f8gtupg30alr3qjqrkw1_a610fd4c-5a3d-4339-84eb-2401edd1ee9c_1400x.jpg',NULL,NULL,NULL),(139,NULL,NULL,NULL,'static/f8gtupg30alr3qjqrkw1_a610fd4c-5a3d-4339-84eb-2401edd1ee9c_1400x_oXL6ySB.jpg',NULL,NULL,NULL),(140,NULL,NULL,NULL,'static/hotel-panamericano-lima_7NxepL7.jpg',NULL,NULL,NULL),(141,NULL,NULL,NULL,'static/hotel-panamericano-lima_ROa9rVm.jpg',NULL,NULL,NULL),(142,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L_g4Amd6P.jpg',NULL,NULL,NULL),(143,NULL,NULL,NULL,'static/cafe-plaza-yucay-2_szBLp0i.jpg',NULL,NULL,NULL),(144,NULL,NULL,NULL,'static/hotel-terraza-san-pedrito_MGZDsqr.jpg',NULL,NULL,NULL),(145,NULL,NULL,NULL,'static/hotel-terraza-san-pedrito_AU41RG5.jpg',NULL,NULL,NULL),(146,NULL,NULL,NULL,'static/limdt-guestroom-0082-hor-clsc_WNKQRus.jpg',NULL,NULL,NULL),(147,NULL,NULL,NULL,'static/cafe-plaza-yucay-2_UVGS2YQ.jpg',NULL,NULL,NULL),(148,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L_fios314.jpg',NULL,NULL,NULL),(149,NULL,NULL,NULL,'static/limdt-guestroom-0082-hor-clsc_fkKmmhL.jpg',NULL,NULL,NULL),(150,NULL,NULL,NULL,'static/limdt-guestroom-0082-hor-clsc_UNZdKqc.jpg',NULL,NULL,NULL),(151,NULL,NULL,NULL,'static/cafe-plaza-yucay-2_uQcB9vD.jpg',NULL,NULL,NULL),(152,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L_QXDJc2B.jpg',NULL,NULL,NULL),(153,NULL,NULL,NULL,'static/97702016_Ye045vK.jpg',NULL,NULL,NULL),(154,NULL,NULL,NULL,'static/2e2843e2ade511d88df42c8a44a73c77_L_ZBx73Zl.jpg',NULL,NULL,NULL),(155,NULL,NULL,NULL,'static/f8gtupg30alr3qjqrkw1_a610fd4c-5a3d-4339-84eb-2401edd1ee9c_1400x_lqdwCnS.jpg',NULL,NULL,NULL),(156,NULL,NULL,NULL,'static/limdt-guestroom-0082-hor-clsc_jtfKuwc.jpg',NULL,NULL,NULL),(157,NULL,NULL,NULL,'static/limdt-guestroom-0082-hor-clsc_jXHEfsf.jpg',NULL,NULL,NULL),(158,NULL,NULL,NULL,'static/destacada1.jpg',NULL,NULL,NULL),(159,NULL,NULL,NULL,'static/f8gtupg30alr3qjqrkw1_a610fd4c-5a3d-4339-84eb-2401edd1ee9c_1400x_fGIhH7r.jpg',NULL,NULL,NULL),(160,NULL,NULL,NULL,'static/97702016_w9WlK9t.jpg',NULL,NULL,NULL),(161,NULL,NULL,NULL,'static/f8gtupg30alr3qjqrkw1_a610fd4c-5a3d-4339-84eb-2401edd1ee9c_1400x_y1JbN8r.jpg',NULL,NULL,NULL),(162,NULL,NULL,NULL,'static/97702016_RjWIlFz.jpg',NULL,NULL,NULL),(163,'',NULL,NULL,'static/cafe-plaza-yucay-2_avPHJJa.jpg',7,NULL,1),(164,NULL,NULL,NULL,'static/63123837.jpg',NULL,NULL,NULL),(165,NULL,NULL,NULL,'static/63123837_b7nQvP7.jpg',NULL,NULL,NULL),(166,NULL,NULL,NULL,'static/190092868.jpg',NULL,NULL,NULL),(167,NULL,NULL,NULL,'static/172948766.jpg',NULL,NULL,NULL),(168,NULL,NULL,NULL,'static/172948766_QN6VUI9.jpg',NULL,NULL,NULL),(169,NULL,NULL,NULL,'static/172948766_h0Rtic7.jpg',NULL,NULL,NULL),(170,NULL,NULL,NULL,'static/172948766_gMMFZxL.jpg',NULL,NULL,NULL),(171,NULL,NULL,NULL,'static/172948766_jXjxrXU.jpg',NULL,NULL,NULL),(172,NULL,NULL,NULL,'static/172948766_DWgXBLj.jpg',NULL,NULL,NULL),(173,NULL,NULL,NULL,'static/118478692.jpg',NULL,NULL,NULL),(174,NULL,NULL,NULL,'static/190092868_ndsKJFX.jpg',NULL,NULL,NULL),(175,NULL,NULL,NULL,'static/583712_15061112050029253161.jpg',NULL,NULL,NULL),(176,NULL,NULL,NULL,'static/172948766_NgLvgIC.jpg',NULL,NULL,NULL),(177,NULL,NULL,NULL,'static/LIMSSGI_rooms_full_standking01.jpg',NULL,NULL,NULL),(178,NULL,NULL,NULL,'static/LIMPUDT_rooms_full_deluxequeenroom01.jpg',NULL,NULL,NULL),(179,NULL,NULL,NULL,'static/20317188.jpg',NULL,NULL,NULL),(180,NULL,NULL,NULL,'static/20317188_lAIZt4z.jpg',NULL,NULL,NULL),(181,NULL,NULL,NULL,'static/20317188_r2HdFJh.jpg',NULL,NULL,NULL),(182,'',NULL,NULL,'static/20317188_mda1Xl2.jpg',9,NULL,1),(183,'',NULL,NULL,'static/00.jpg',9,1,NULL),(184,'',NULL,NULL,'static/00_mSN7s42.jpg',9,1,NULL),(185,NULL,NULL,NULL,'static/cambiante-2.jpg',NULL,NULL,NULL),(186,NULL,NULL,NULL,'static/cambiante-2_AJd55Vw.jpg',NULL,NULL,NULL),(187,'',NULL,NULL,'static/14907564.jpg',8,NULL,1),(188,'',NULL,NULL,'static/76572534.jpg',2,NULL,1),(189,'',NULL,NULL,'static/76654704.jpg',2,1,NULL),(190,'',NULL,NULL,'static/LIMPUDT_rooms_full_deluxequeenroom01_Qw48Fqr.jpg',2,1,NULL),(191,'',NULL,NULL,'static/76654925.jpg',2,1,NULL),(192,NULL,NULL,NULL,'static/190092868_AZG8nX8.jpg',NULL,NULL,NULL),(193,NULL,NULL,NULL,'static/172948766_dgvyObk.jpg',NULL,NULL,NULL),(194,NULL,NULL,NULL,'static/76654925_P0UxaX9.jpg',NULL,NULL,NULL),(195,NULL,NULL,NULL,'static/Costa-Rica-La-Fortuna-cheap-travel-budget-rooms-hostel-hotel-viaje-barato-backpac_3n9TOfX.jpg',NULL,NULL,NULL),(196,NULL,NULL,NULL,'static/76655488.jpg',NULL,NULL,NULL),(197,NULL,NULL,NULL,'static/76655389.jpg',NULL,NULL,NULL),(198,NULL,NULL,NULL,'static/hostal-mochileros.jpg',NULL,NULL,NULL),(199,'',NULL,NULL,'static/Hotel_TAC_Lima_Peru_cropped.jpg',6,NULL,1),(200,'',NULL,NULL,'static/76654925_mtjxgJ9.jpg',6,1,NULL),(201,'',NULL,NULL,'static/hotel-salvatore_150706523727.jpg',6,1,NULL),(202,'',NULL,NULL,'static/76655389_grBMilo.jpg',6,1,NULL),(203,'',NULL,NULL,'static/141667679_1.jpg',10,NULL,1),(204,NULL,NULL,NULL,'static/cambiante-2_TOLdoZT.jpg',NULL,NULL,NULL),(205,'',NULL,NULL,'static/76655389_1njIzuJ.jpg',10,1,NULL),(206,'',NULL,NULL,'static/65928985.jpg',10,1,NULL),(207,'',NULL,NULL,'static/583712_15061112050029253161_0p9iMpx.jpg',10,1,NULL),(208,'',NULL,NULL,'static/LIMSSGI_quicklook_full_hotelentry.jpg',11,NULL,1),(209,'',NULL,NULL,'static/hostal-mochileros_MV0U0Wq.jpg',11,1,NULL),(210,'',NULL,NULL,'static/76655488_BQFQFkI.jpg',11,1,NULL),(211,'',NULL,NULL,'static/exterior.jpg',11,1,NULL),(212,NULL,NULL,NULL,'static/HABITACIÓN-MATRIMONIAL-CON-VISTA-AL-JARDÍN-lima-wari-hotel-boutique2.jpg',NULL,NULL,NULL),(213,NULL,NULL,NULL,'static/LIMPUDT_rooms_full_deluxequeenroom01_Z1MhfDL.jpg',NULL,NULL,NULL);
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
  `dni` varchar(15) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (172,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-05-27 05:00:00','2019-05-29 05:00:00',4,6,'PE-6-172',NULL),(173,NULL,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-05-27 05:00:00','2019-05-29 05:00:00',1,2,NULL,NULL),(174,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-05-27 05:00:00','2019-05-29 05:00:00',4,2,'PE-2-174',NULL),(175,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-05-27 05:00:00','2019-05-29 05:00:00',4,2,'PE-2-175',NULL),(176,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-05-28 05:00:00','2019-05-29 05:00:00',1,7,'PE-7-176',NULL),(177,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-05-28 05:00:00','2019-05-30 05:00:00',1,11,'PE-11-177',NULL),(178,NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-29 05:00:00','2019-05-30 05:00:00',1,11,'PE-11-178',NULL),(179,NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-29 05:00:00','2019-05-30 05:00:00',1,11,'PE-11-179',NULL),(180,NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-29 05:00:00','2019-05-30 05:00:00',1,11,'PE-11-180',NULL),(181,NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-29 05:00:00','2019-05-30 05:00:00',1,11,'PE-11-181',NULL),(182,NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-30 05:00:00','2019-06-01 05:00:00',1,7,'PE-7-182',NULL),(183,NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-30 05:00:00','2019-06-01 05:00:00',1,7,'PE-7-183',NULL),(184,NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-30 05:00:00','2019-06-01 05:00:00',1,11,'PE-11-184',NULL),(185,NULL,NULL,NULL,NULL,NULL,NULL,'2019-06-01 05:00:00','2019-06-02 05:00:00',1,11,'PE-11-185',NULL),(186,NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-31 05:00:00','2019-06-01 05:00:00',1,6,'PE-6-186',NULL),(187,NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-31 05:00:00','2019-06-01 05:00:00',1,11,'PE-11-187',NULL),(188,NULL,NULL,NULL,NULL,NULL,NULL,'2019-06-04 05:00:00','2019-06-07 05:00:00',1,11,'PE-11-188',NULL),(189,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-01 05:00:00','2019-06-04 05:00:00',1,11,'PE-11-189',NULL),(190,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-01 05:00:00','2019-06-02 05:00:00',1,11,'PE-11-190',NULL),(191,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-02 05:00:00','2019-06-04 05:00:00',1,11,'PE-11-191',NULL),(192,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-03 05:00:00','2019-06-04 05:00:00',1,6,'PE-6-192',NULL),(193,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-04 05:00:00','2019-06-05 05:00:00',1,7,'PE-7-193',NULL),(194,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-13 05:00:00','2019-06-15 05:00:00',1,6,'PE-6-194',NULL),(195,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-04 05:00:00','2019-06-06 05:00:00',1,7,'PE-7-195',NULL),(196,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-02 05:00:00','2019-06-04 05:00:00',1,6,'PE-6-196',NULL),(197,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-03 05:00:00','2019-06-05 05:00:00',1,6,'PE-6-197',NULL),(198,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-04 05:00:00','2019-06-06 05:00:00',4,2,'PE-2-198',NULL),(199,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-04 05:00:00','2019-06-07 05:00:00',1,11,'PE-11-199',NULL),(200,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-04 05:00:00','2019-06-07 05:00:00',4,6,'PE-6-200',NULL),(201,NULL,NULL,NULL,NULL,NULL,NULL,'2019-06-03 05:00:00','2019-06-04 05:00:00',1,11,'PE-11-201',NULL),(202,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-03 05:00:00','2019-06-05 05:00:00',4,11,'PE-11-202',NULL),(203,142,'Andy Jo','joelunmsm@gmail.com',980729169,NULL,NULL,'2019-06-03 05:00:00','2019-06-05 05:00:00',1,6,'PE-6-203',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (4,'Bed','Esto es un bed',NULL,NULL,1,1,2),(5,'elena','454',NULL,NULL,1,2,2),(18,'101','101',NULL,NULL,1,9,8),(19,'102','102',NULL,NULL,1,9,8),(20,'103','103',NULL,NULL,1,10,8),(21,'88','555',NULL,56,1,2,2),(22,'520','',NULL,NULL,1,14,2),(23,'101','ii',NULL,NULL,1,11,7),(24,'88','mkm',NULL,NULL,1,13,7),(26,'Mochileros Dormitorio','ww',NULL,NULL,1,3,10),(27,'Dormitorio para Mochileros','Disponible',NULL,NULL,1,18,11),(28,'101','En buen estado',NULL,NULL,1,15,11),(29,'102','Bien',NULL,NULL,1,15,11),(30,'103','En buen estado',NULL,NULL,1,15,11),(31,'104','.',NULL,NULL,1,15,11),(32,'106','.',NULL,NULL,1,16,11),(33,'107','.',NULL,NULL,1,16,11),(34,'108','.',NULL,NULL,1,16,11),(35,'109','.',NULL,NULL,1,16,11),(36,'115','',NULL,NULL,1,16,11),(37,'101','',NULL,NULL,1,4,10),(38,'102','',NULL,NULL,1,4,10),(39,'103','',NULL,NULL,1,4,10),(40,'104','',NULL,NULL,1,4,10),(41,'201','',NULL,NULL,1,4,10),(42,'202','',NULL,NULL,1,5,10),(43,'203','',NULL,NULL,1,5,10),(44,'204','',NULL,NULL,1,5,10),(45,'205','',NULL,NULL,1,5,10),(46,'206','',NULL,NULL,1,5,10),(47,'207','',NULL,NULL,1,5,10),(48,'208','',NULL,NULL,1,5,10),(49,'101','',NULL,NULL,1,8,9),(50,'102','',NULL,NULL,1,8,9),(51,'103','',NULL,NULL,1,8,9),(52,'104','',NULL,NULL,1,8,9),(53,'105','',NULL,NULL,1,8,9),(54,'106','',NULL,NULL,1,8,9),(55,'201','',NULL,NULL,1,19,9),(56,'204','',NULL,NULL,1,19,9),(57,'203','',NULL,NULL,1,19,9),(58,'202','',NULL,NULL,1,19,9),(59,'205','',NULL,NULL,1,2,2),(60,'206','',NULL,NULL,1,2,2),(61,'209','',NULL,NULL,1,14,2),(62,'210','',NULL,NULL,1,2,2),(63,'211','',NULL,NULL,1,2,2),(64,'213','',NULL,NULL,1,2,2),(65,'212','',NULL,NULL,1,2,2),(66,'102','',NULL,NULL,1,12,7),(67,'103','',NULL,NULL,1,12,7),(68,'104','',NULL,NULL,1,13,7),(69,'105','',NULL,NULL,1,13,7),(70,'106','',NULL,NULL,1,13,7),(71,'107','',NULL,NULL,1,13,7),(72,'108','',NULL,NULL,1,13,7),(73,'22','',NULL,NULL,1,20,6),(74,'32','',NULL,NULL,1,21,6),(75,'34','',NULL,NULL,1,21,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_reservation`
--

LOCK TABLES `room_reservation` WRITE;
/*!40000 ALTER TABLE `room_reservation` DISABLE KEYS */;
INSERT INTO `room_reservation` VALUES (211,172,73,0,1,'0','0',25),(212,174,4,0,1,'0','0',255),(213,175,61,0,0,'0','0',20),(214,175,22,0,1,'0','0',20),(215,176,23,0,1,'0','0',20),(216,177,27,0,1,'0','0',15),(217,178,27,0,1,'0','0',15),(218,179,27,0,1,'0','0',15),(219,180,27,0,1,'0','0',15),(220,181,27,0,1,'0','0',15),(221,182,24,0,1,'0','0',20),(222,183,24,0,1,'0','0',20),(223,184,27,0,1,'0','0',15),(224,185,27,0,2,'0','0',30),(225,186,75,0,0,'0','0',25),(226,186,74,0,1,'0','0',25),(227,187,33,0,0,'0','0',30),(228,187,32,0,1,'0','0',30),(229,188,27,0,1,'0','0',15),(230,189,27,0,1,'0','0',15),(231,190,27,0,1,'0','0',15),(232,191,27,0,1,'0','0',15),(233,192,75,0,0,'0','0',25),(234,192,74,0,1,'0','0',25),(235,193,23,0,1,'0','0',20),(236,194,73,0,1,'0','0',25),(237,195,23,0,1,'0','0',20),(238,196,73,1,1,'0','0',25),(239,197,73,0,1,'0','0',25),(240,198,4,0,1,'0','0',255),(241,200,73,1,1,'0','0',25),(242,201,27,0,1,'0','0',15),(243,202,28,0,1,'0','0',22),(244,203,73,0,1,'0','0',25);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_status`
--

LOCK TABLES `room_status` WRITE;
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;
INSERT INTO `room_status` VALUES (1,'Available'),(2,'No Available'),(3,'Cancelated'),(4,'.'),(5,'.'),(6,'Eliminado');
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
INSERT INTO `roomtemplate` VALUES (1,'Bed','Cama',1,20,20,0,0,1),(2,'Private Bed','Cama Privada',1,3,2,1,0,1),(3,'Single','Individual',1,2,1,1,1,1),(4,'Single Superior','Individual Superior',1,2,1,1,1,1),(5,'Double','Doble',2,4,2,2,1,1),(6,'Double Superior','Doble Superior',2,4,2,2,1,1),(7,'Triple','Triple',3,4,3,1,1,1),(8,'Triple Superior','Triple Superior',3,5,3,2,1,0),(9,'Suite','Suite',2,4,2,2,1,0),(10,'Suite Superior','Suite Superior',2,4,2,2,1,0),(13,'Template 1',NULL,2,4,2,2,2,0),(14,'Template 2',NULL,2,4,2,2,2,0),(15,'Template 3',NULL,2,3,2,1,1,0),(16,'Template 4',NULL,2,4,2,2,1,0);
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

-- Dump completed on 2019-06-03 17:17:16
