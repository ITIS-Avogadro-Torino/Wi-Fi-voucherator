-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: mysql.itisavogadro.org    Database: avowifi18
-- ------------------------------------------------------
-- Server version	5.6.34-log

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
-- Table structure for table `registrazioni_activationcode`
--

DROP TABLE IF EXISTS `registrazioni_activationcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrazioni_activationcode` (
  `activationcode_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activationcode_code` varchar(8) NOT NULL,
  `activationcode_type` enum('god','ata','menthor','student','alien') NOT NULL,
  PRIMARY KEY (`activationcode_ID`),
  UNIQUE KEY `activationcode_code` (`activationcode_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registrazioni_rel_user_activationcode`
--

DROP TABLE IF EXISTS `registrazioni_rel_user_activationcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrazioni_rel_user_activationcode` (
  `user_ID` int(10) unsigned NOT NULL,
  `activationcode_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_ID`,`activationcode_ID`),
  KEY `activationcode_ID` (`activationcode_ID`),
  CONSTRAINT `registrazioni_rel_user_activationcode_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `registrazioni_user` (`user_ID`) ON DELETE CASCADE,
  CONSTRAINT `registrazioni_rel_user_activationcode_ibfk_2` FOREIGN KEY (`activationcode_ID`) REFERENCES `registrazioni_activationcode` (`activationcode_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registrazioni_rel_user_voucher`
--

DROP TABLE IF EXISTS `registrazioni_rel_user_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrazioni_rel_user_voucher` (
  `user_ID` int(10) unsigned NOT NULL,
  `voucher_ID` int(10) unsigned NOT NULL,
  `rel_user_voucher_device` varchar(16) DEFAULT NULL,
  `rel_user_voucher_creation_date` datetime NOT NULL,
  `rel_user_voucher_creation_user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_ID`,`voucher_ID`),
  KEY `voucher_ID` (`voucher_ID`),
  KEY `rel_user_voucher_creation_user` (`rel_user_voucher_creation_user`),
  CONSTRAINT `registrazioni_rel_user_voucher_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `registrazioni_user` (`user_ID`) ON DELETE CASCADE,
  CONSTRAINT `registrazioni_rel_user_voucher_ibfk_2` FOREIGN KEY (`voucher_ID`) REFERENCES `registrazioni_voucher` (`voucher_ID`),
  CONSTRAINT `registrazioni_rel_user_voucher_ibfk_3` FOREIGN KEY (`rel_user_voucher_creation_user`) REFERENCES `registrazioni_user` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registrazioni_user`
--

DROP TABLE IF EXISTS `registrazioni_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrazioni_user` (
  `user_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_uid` varchar(64) NOT NULL,
  `user_type` enum('god','ata','menthor','student','alien') NOT NULL DEFAULT 'alien',
  `user_name` varchar(32) NOT NULL,
  `user_surname` varchar(32) NOT NULL,
  `user_role` enum('guest','admin','superadmin') NOT NULL DEFAULT 'guest',
  `user_class` varchar(1) DEFAULT NULL,
  `user_section` varchar(1) DEFAULT NULL,
  `user_specialization` enum('biennio','liceo','elettrotecnica','informatica','meccanica') DEFAULT NULL,
  `user_daytype` enum('diurno','serale') DEFAULT NULL,
  `user_note` text NOT NULL,
  `user_password` varchar(40) DEFAULT NULL,
  `user_active` tinyint(1) NOT NULL DEFAULT '0',
  `user_public` tinyint(1) DEFAULT '0',
  `user_recovery_token` varchar(40) DEFAULT NULL,
  `user_recovery_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `user_uid` (`user_uid`),
  KEY `user_public` (`user_public`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registrazioni_voucher`
--

DROP TABLE IF EXISTS `registrazioni_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrazioni_voucher` (
  `voucher_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_code` varchar(51) NOT NULL,
  `voucher_type` enum('god','ata','menthor','student','alien') DEFAULT NULL,
  `voucher_duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`voucher_ID`),
  UNIQUE KEY `voucher_code` (`voucher_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-08  3:37:06
