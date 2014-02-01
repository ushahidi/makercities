-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: makercities
-- ------------------------------------------------------
-- Server version	5.5.31-0+wheezy1

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(75) NOT NULL,
  `qualifiers` text NOT NULL,
  `response` varchar(75) NOT NULL,
  `response_vars` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores user defined actions triggered by certain events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'report_add','a:6:{s:4:\"user\";s:1:\"0\";s:8:\"location\";s:8:\"anywhere\";s:7:\"keyword\";s:0:\"\";s:17:\"on_specific_count\";s:0:\"\";s:28:\"on_specific_count_collective\";s:1:\"0\";s:13:\"between_times\";i:0;}','approve_report','a:1:{s:6:\"verify\";s:1:\"1\";}',1);
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions_log`
--

DROP TABLE IF EXISTS `actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='Stores a log of triggered actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_log`
--

LOCK TABLES `actions_log` WRITE;
/*!40000 ALTER TABLE `actions_log` DISABLE KEYS */;
INSERT INTO `actions_log` VALUES (1,1,0,1371230621),(2,1,0,1371231791),(3,1,4,1371232724),(4,1,3,1371233736),(5,1,4,1371234044),(6,1,4,1371234117),(7,1,3,1371234758),(8,1,4,1371239299),(9,1,4,1371239598),(10,1,2,1371240259),(11,1,0,1371241865),(12,1,2,1372314588),(13,1,0,1372452185),(14,1,2,1372650945),(15,1,2,1372651525),(16,1,2,1372657514),(17,1,5,1373304392),(18,1,5,1373304504),(19,1,5,1373304590),(20,1,5,1373305052),(21,1,5,1373310382),(22,1,12,1373584871),(23,1,7,1374173520),(24,1,7,1374175263),(25,1,7,1374175455),(26,1,21,1374176488),(27,1,7,1374263703),(28,1,23,1374470715),(29,1,25,1374553179),(30,1,2,1374724354),(31,1,38,1375105037),(32,1,42,1375390052),(33,1,44,1376333048),(34,1,46,1376576826),(35,1,46,1376579582),(36,1,46,1376579891),(37,1,46,1376580017),(38,1,46,1376580149),(39,1,46,1376580255),(40,1,46,1376591521),(41,1,52,1377203813),(42,1,53,1377212046),(43,1,53,1378913187),(44,1,4,1379028886),(45,1,64,1379082351),(46,1,64,1379082901),(47,1,67,1379383614),(48,1,67,1379385020),(49,1,67,1379385436),(50,1,67,1379386368),(51,1,67,1379386495),(52,1,67,1379386669),(53,1,67,1379386873),(54,1,67,1379386968),(55,1,67,1379387061),(56,1,67,1379387209),(57,1,67,1379387336),(58,1,67,1379387424),(59,1,67,1379387507),(60,1,67,1379387578),(61,1,67,1379387683),(62,1,67,1379387858),(63,1,75,1379956498),(64,1,78,1380599200),(65,1,85,1381683235),(66,1,92,1381779397),(67,1,91,1381779520),(68,1,90,1381779717),(69,1,86,1381779753),(70,1,89,1381779768),(71,1,93,1381779810),(72,1,97,1381779875),(73,1,99,1381779878),(74,1,95,1381779882),(75,1,100,1381780006),(76,1,88,1381780008),(77,1,87,1381780050),(78,1,73,1381780130),(79,1,90,1381780168),(80,1,79,1381780201),(81,1,94,1381780308),(82,1,101,1381780362),(83,1,98,1381780631),(84,1,53,1382401938),(85,1,110,1382481751),(86,1,111,1382482057),(87,1,114,1382482082),(88,1,109,1382482386),(89,1,113,1382482415),(90,1,108,1382482450),(91,1,115,1382482545),(92,1,112,1382482572),(93,1,111,1382482637),(94,1,114,1382482754),(95,1,7,1382482923),(96,1,114,1382483676);
/*!40000 ALTER TABLE `actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `alert_type` tinyint(4) NOT NULL COMMENT '1 - MOBILE, 2 - EMAIL',
  `alert_recipient` varchar(200) DEFAULT NULL,
  `alert_code` varchar(30) DEFAULT NULL,
  `alert_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `alert_lat` varchar(150) DEFAULT NULL,
  `alert_lon` varchar(150) DEFAULT NULL,
  `alert_radius` tinyint(4) NOT NULL DEFAULT '20',
  `alert_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_alert_code` (`alert_code`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores alerts subscribers information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_category`
--

DROP TABLE IF EXISTS `alert_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alert_id` (`alert_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores subscriber alert categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_category`
--

LOCK TABLES `alert_category` WRITE;
/*!40000 ALTER TABLE `alert_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_sent`
--

DROP TABLE IF EXISTS `alert_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_sent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `alert_id` bigint(20) unsigned NOT NULL,
  `alert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `alert_id` (`alert_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores a log of alerts sent out to subscribers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_sent`
--

LOCK TABLES `alert_sent` WRITE;
/*!40000 ALTER TABLE `alert_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_banned`
--

DROP TABLE IF EXISTS `api_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `banned_ipaddress` varchar(50) NOT NULL,
  `banned_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='For logging banned API IP addresses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_banned`
--

LOCK TABLES `api_banned` WRITE;
/*!40000 ALTER TABLE `api_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_log`
--

DROP TABLE IF EXISTS `api_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_task` varchar(10) NOT NULL,
  `api_parameters` varchar(100) NOT NULL,
  `api_records` tinyint(11) NOT NULL,
  `api_ipaddress` varchar(50) NOT NULL,
  `api_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='For logging API activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_log`
--

LOCK TABLES `api_log` WRITE;
/*!40000 ALTER TABLE `api_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_settings`
--

DROP TABLE IF EXISTS `api_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_record_limit` int(11) NOT NULL DEFAULT '20',
  `max_record_limit` int(11) DEFAULT NULL,
  `max_requests_per_ip_address` int(11) DEFAULT NULL,
  `max_requests_quota_basis` int(11) DEFAULT NULL,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For storing API logging settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_settings`
--

LOCK TABLES `api_settings` WRITE;
/*!40000 ALTER TABLE `api_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge`
--

DROP TABLE IF EXISTS `badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores description of badges to be assigned';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge`
--

LOCK TABLES `badge` WRITE;
/*!40000 ALTER TABLE `badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge_users`
--

DROP TABLE IF EXISTS `badge_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge_users` (
  `user_id` int(11) unsigned NOT NULL,
  `badge_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`badge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores assigned badge information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge_users`
--

LOCK TABLES `badge_users` WRITE;
/*!40000 ALTER TABLE `badge_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `badge_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `category_position` tinyint(4) NOT NULL DEFAULT '0',
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  `category_color` varchar(20) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_image_thumb` varchar(255) DEFAULT NULL,
  `category_visible` tinyint(4) NOT NULL DEFAULT '1',
  `category_trusted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_visible` (`category_visible`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Holds information about categories defined for a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (13,3,'en_US',2,'Maker Governance Level 3','Make Futures','3535bd','category_13_1368409676.png','category_13_1368409676_16x16.png',1,0),(12,3,'en_US',1,'Maker Governance Level 2','Refine Futures','3535bd','category_12_1368409666.png','category_12_1368409666_16x16.png',1,0),(11,3,'en_US',0,'Maker Governance Level 1','Support Futures','1717a3','category_11_1368409656.png','category_11_1368409656_16x16.png',1,0),(3,0,'en_US',0,'Maker Governance','Maker Governance','14287a','category_3_1368409645.png','category_3_1368409645_16x16.png',1,0),(10,2,'en_US',2,'Maker Works Level 3','Make Futures','ff0000','category_10_1368409563.png','category_10_1368409563_16x16.png',1,0),(9,2,'en_US',1,'Maker Works Level 2','Refine Futures','bd33bd','category_9_1368409557.png','category_9_1368409557_16x16.png',1,0),(17,5,'en_US',0,'Maker Production Level 1','Support Futures','2fb163','category_17_1368409589.png','category_17_1368409589_16x16.png',1,0),(5,0,'en_US',0,'Maker Production','Maker Production','2fb163','category_5_1368409576.png','category_5_1368409576_16x16.png',1,0),(18,5,'en_US',1,'Maker Production Level 2','Refine Futures','2fb163','category_18_1368409599.png','category_18_1368409599_16x16.png',1,0),(1,0,'en_US',3,'Trusted Reports','Reports from trusted reporters','339900',NULL,NULL,0,1),(8,2,'en_US',0,'Maker Works Level 1','Support Futures','ffffff','category_8_1368409549.png','category_8_1368409549_16x16.png',1,0),(2,0,'en_US',0,'Maker Works','Maker Works','189e78','category_2_1368409539.png','category_2_1368409539_16x16.png',1,0),(19,5,'en_US',2,'Maker Production Level 3','Make Futures','2fb163','category_19_1368409610.png','category_19_1368409610_16x16.png',1,0),(4,0,'en_US',0,'Maker Neighborhoods','Maker Neighborhoods','000000','category_4_1368409689.png','category_4_1368409689_16x16.png',1,0),(14,4,'en_US',0,'Maker Neighborhoods Level 1','Support Futures','000000','category_14_1368409700.png','category_14_1368409700_16x16.png',1,0),(15,4,'en_US',1,'Maker Neighborhoods Level 2','Refine Futures','000000','category_15_1368409710.png','category_15_1368409710_16x16.png',1,0),(16,4,'en_US',2,'Maker Neighborhoods Level 3','Make Futures','000000','category_16_1368409509.png','category_16_1368409509_16x16.png',1,0),(6,0,'en_US',0,'Maker Bodies','Maker Bodies','000000','category_6_1368409734.png','category_6_1368409734_16x16.png',1,0),(20,6,'en_US',0,'Maker Bodies Level 1','Support Futures','000000','category_20_1368409748.png','category_20_1368409748_16x16.png',1,0),(21,6,'en_US',1,'Maker Bodies Level 2','Refine Futures','000000','category_21_1368409758.png','category_21_1368409758_16x16.png',1,0),(22,6,'en_US',2,'Maker Bodies Level 3','Make Futures','000000','category_22_1368409770.png','category_22_1368409770_16x16.png',1,0),(7,0,'en_US',0,'Maker Learning','Maker Learning','000000','category_7_1368409784.png','category_7_1368409784_16x16.png',1,0),(23,7,'en_US',0,'Maker Learning Level 1','Support Futures','000000','category_23_1368409795.png','category_23_1368409795_16x16.png',1,0),(24,7,'en_US',1,'Maker Learning Level 2','Refine Futures','000000','category_24_1368409807.png','category_24_1368409807_16x16.png',1,0),(25,7,'en_US',2,'Maker Learning Level 3','Make Futures','000000','category_25_1368409816.png','category_25_1368409816_16x16.png',1,0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_lang`
--

DROP TABLE IF EXISTS `category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds translations for category titles and descriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_lang`
--

LOCK TABLES `category_lang` WRITE;
/*!40000 ALTER TABLE `category_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL,
  `incident_id` bigint(20) unsigned DEFAULT '0',
  `checkin_description` varchar(255) DEFAULT NULL,
  `checkin_date` datetime NOT NULL,
  `checkin_auto` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores checkin information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `city_lat` varchar(150) DEFAULT NULL,
  `city_lon` varchar(200) DEFAULT NULL,
  `points` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COMMENT='Stores cities of countries retrieved by user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,231,'New York City','40.71427','-74.00597',0),(2,NULL,'Los Angeles','34.05223','-118.24368',0),(3,NULL,'Chicago','41.85003','-87.65005',0),(4,NULL,'Brooklyn','40.6501','-73.94958',0),(5,NULL,'Houston','29.76328','-95.36327',0),(6,NULL,'Philadelphia','39.95234','-75.16379',0),(7,NULL,'Manhattan','40.78343','-73.96625',0),(8,NULL,'Phoenix','33.44838','-112.07404',0),(9,NULL,'Borough of Bronx','40.84985','-73.86641',0),(10,NULL,'San Antonio','29.42412','-98.49363',0),(11,NULL,'San Diego','32.71533','-117.15726',0),(12,NULL,'Dallas','32.78306','-96.80667',0),(13,NULL,'San Jose','37.33939','-121.89496',252),(14,NULL,'Indianapolis','39.76838','-86.15804',0),(15,NULL,'Jacksonville','30.33218','-81.65565',0),(16,NULL,'San Francisco','37.77493','-122.41942',171),(17,NULL,'Austin','30.26715','-97.74306',0),(18,NULL,'Columbus','39.96118','-82.99879',68),(19,NULL,'Fort Worth','32.72541','-97.32085',27),(20,NULL,'Charlotte','35.22709','-80.84313',0),(21,NULL,'Detroit','42.33143','-83.04575',36),(22,NULL,'El Paso','31.75872','-106.48693',0),(23,NULL,'Memphis','35.14953','-90.04898',0),(24,NULL,'New South Memphis','35.08676','-90.05676',0),(25,NULL,'Baltimore','39.29038','-76.61219',0),(26,NULL,'Boston','42.35843','-71.05977',27),(27,NULL,'Seattle','47.60621','-122.33207',0),(28,NULL,'Washington D. C.','38.89511','-77.03637',0),(29,NULL,'Metropolitan Government of Nashville-Davidson (balance)','36.17137','-86.78429',0),(30,NULL,'Denver','39.73915','-104.9847',0),(31,NULL,'Milwaukee','43.0389','-87.90647',0),(32,NULL,'Portland','45.52345','-122.67621',72),(33,NULL,'Las Vegas','36.17497','-115.13722',0),(34,NULL,'Oklahoma City','35.46756','-97.51643',54),(35,NULL,'South Boston','42.33343','-71.04949',0),(36,NULL,'Albuquerque','35.08449','-106.65114',0),(37,NULL,'Nashville','36.16589','-86.78444',0),(38,NULL,'Tucson','32.22174','-110.92648',0),(39,NULL,'Fresno','36.74773','-119.77237',0),(40,NULL,'Staten Island','40.56233','-74.13986',0),(41,NULL,'Sacramento','38.58157','-121.4944',0),(42,NULL,'Long Beach','33.76696','-118.18923',0),(43,NULL,'Kansas City','39.09973','-94.57857',72),(44,NULL,'Mesa','33.42227','-111.82264',0),(45,NULL,'Virginia Beach','36.85293','-75.97798',0),(46,NULL,'Atlanta','33.749','-84.38798',0),(47,NULL,'Colorado Springs','38.83388','-104.82136',0),(48,NULL,'Omaha','41.25861','-95.93779',0),(49,NULL,'Raleigh','35.7721','-78.63861',0),(50,NULL,'Miami','25.77427','-80.19366',0),(51,NULL,'Cleveland','41.4995','-81.69541',0),(52,NULL,'Tulsa','36.15398','-95.99278',27),(53,NULL,'Oakland','37.80437','-122.2708',198),(54,NULL,'Minneapolis','44.97997','-93.26384',0),(55,NULL,'Wichita','37.69224','-97.33754',0),(56,NULL,'Honolulu','21.30694','-157.85833',0),(57,NULL,'Arlington','32.73569','-97.10807',0),(58,NULL,'Bakersfield','35.37329','-119.01871',0),(59,NULL,'New Orleans','29.95465','-90.07507',0),(60,NULL,'West Raleigh','35.78682','-78.66389',0),(61,NULL,'Anaheim','33.83529','-117.9145',0),(62,NULL,'Tampa','27.94752','-82.45843',0),(63,NULL,'Aurora','39.72943','-104.83192',0),(64,NULL,'Santa Ana','33.74557','-117.86783',0),(65,NULL,'St. Louis','38.62727','-90.19789',0),(66,NULL,'Pittsburgh','40.44062','-79.99589',0),(67,NULL,'Shanghai','31.22222','121.45806',0),(68,NULL,'Buenos Aires','-34.61315','-58.37723',0),(69,NULL,'Mumbai','19.07283','72.88261',18),(70,NULL,'Mexico City','19.42847','-99.12766',0),(71,NULL,'Karachi','24.9056','67.0822',0),(72,NULL,'Istanbul','41.01384','28.94966',0),(73,NULL,'Delhi','28.65381','77.22897',0),(74,NULL,'Manila','14.6042','120.9822',0),(75,NULL,'Moscow','55.75222','37.61556',0),(76,NULL,'Dhaka','23.7104','90.40744',0),(77,NULL,'Seoul','37.56826','126.97783',0),(78,NULL,'Sao Paulo','-23.5475','-46.63611',0),(79,NULL,'Lagos','6.45306','3.39583',0),(80,NULL,'Jakarta','-6.21462','106.84513',0),(81,NULL,'Tokyo','35.6895','139.69171',0),(82,NULL,'Zhumadian','32.97944','114.02944',0),(83,NULL,'Taipei','25.04776','121.53185',0),(84,NULL,'Kinshasa','-4.32142','15.30807',0),(85,NULL,'Lima','-12.04318','-77.02824',0),(86,NULL,'Cairo','30.06263','31.24967',0),(87,NULL,'City of London','51.51279','-0.09184',0),(88,NULL,'London','51.50853','-0.12574',0),(89,NULL,'Beijing','39.9075','116.39723',0),(90,NULL,'Tehran','35.69439','51.42151',0),(91,NULL,'Nanchong','30.79508','106.08474',0),(92,NULL,'Bogota','4.60971','-74.08175',0),(93,NULL,'Hong Kong','22.28552','114.15769',0),(94,NULL,'Lahore','31.54972','74.34361',0),(95,NULL,'Rio de Janeiro','-22.90278','-43.2075',0),(96,NULL,'Baghdad','33.34058','44.40088',0),(97,NULL,'Tai\'an','36.18528','117.12',0),(98,NULL,'Bangkok','13.75398','100.50144',0),(99,NULL,'Bangalore','12.97194','77.59369',0),(100,NULL,'Yueyang','29.33333','113.09194',0),(101,NULL,'Santiago','-33.45694','-70.64827',0),(102,NULL,'Kaifeng','34.7986','114.30742',0),(103,NULL,'Kolkata','22.56263','88.36304',0),(104,NULL,'Toronto','43.70011','-79.4163',0),(105,NULL,'Rangoon','16.80528','96.15611',0),(106,NULL,'Sydney','-33.86785','151.20732',0),(107,NULL,'Chennai','13.08784','80.27847',0),(108,NULL,'Riyadh','24.68773','46.72185',0),(109,NULL,'Wuhan','30.58333','114.26667',0),(110,NULL,'Saint Petersburg','59.89444','30.26417',0),(111,NULL,'Chongqing','29.56278','106.55278',0),(112,NULL,'Chengdu','30.66667','104.06667',0),(113,NULL,'Chittagong','22.3384','91.83168',0),(114,NULL,'Alexandria','31.21564','29.95527',0),(115,NULL,'Tianjin','39.14222','117.17667',0),(116,NULL,'Melbourne','-37.814','144.96332',0),(117,NULL,'Ahmadabad','23.02579','72.58726',0),(118,NULL,'Busan','35.10278','129.04028',0),(119,NULL,'Abidjan','5.30966','-4.01266',0),(120,NULL,'Kano','12.00012','8.51672',0),(121,NULL,'Hyderabad','17.38405','78.45636',0),(122,NULL,'Puyang','29.45679','119.88872',0),(123,NULL,'Yokohama-shi','35.44778','139.6425',0),(124,NULL,'Ibadan','7.38778','3.89639',0),(125,NULL,'Singapore','1.28967','103.85007',0),(126,NULL,'Ankara','39.91987','32.85427',0),(127,NULL,'Shenyang','41.79222','123.43278',0),(128,NULL,'Thanh pho Ho Chi Minh','10.75','106.66667',0),(129,NULL,'Shiyan','32.6475','110.77806',0),(130,NULL,'Cape Town','-33.92584','18.42322',0),(131,NULL,'Berlin','52.52437','13.41053',0),(132,NULL,'Montreal','45.50884','-73.58781',0),(133,NULL,'Madrid','40.4165','-3.70256',0),(134,NULL,'Harbin','45.75','126.65',0),(135,NULL,'Xi\'an','34.25833','108.92861',0),(136,NULL,'Pyongyang','39.03385','125.75432',0),(137,NULL,'Lanzhou','36.05639','103.79222',0),(138,NULL,'Guangzhou','23.11667','113.25',0),(139,NULL,'Casablanca','33.58831','-7.61138',0),(140,NULL,'Durban','-29.8579','31.0292',0),(141,NULL,'Nanjing','32.06167','118.77778',0),(142,NULL,'Kabul','34.52813','69.17233',0),(143,NULL,'Caracas','10.48801','-66.87919',0),(144,NULL,'Shenzhen','22.54554','114.0683',0),(145,NULL,'Pune','18.51957','73.85535',0),(146,NULL,'Surat','21.19594','72.83023',0),(147,NULL,'Jeddah','21.51694','39.21917',0),(148,NULL,'Kanpur','26.4478','80.34627',0),(149,NULL,'Luanda','-8.83682','13.23432',0),(150,NULL,'Quezon City','14.6488','121.0509',0),(151,NULL,'Addis Ababa','9.02497','38.74689',0),(152,NULL,'Nairobi','-1.28333','36.81667',0),(153,NULL,'Taiyuan','37.86944','112.56028',0),(154,NULL,'Salvador','-12.97111','-38.51083',0),(155,NULL,'Jaipur','26.91962','75.78781',0),(156,NULL,'Dar es Salaam','-6.82349','39.26951',0),(157,NULL,'Incheon','37.45361','126.73167',0),(158,NULL,'Yunfu','22.93056','112.0373',0),(159,NULL,'Al Basrah','30.53302','47.79747',0),(160,NULL,'Navi Mumbai','19.03681','73.01582',0),(161,NULL,'Osaka-shi','34.69374','135.50218',0),(162,NULL,'Mogadishu','2.03711','45.34375',0),(163,NULL,'Daegu','35.87028','128.59111',0),(164,NULL,'Rome','41.89474','12.4839',0),(165,NULL,'Changchun','43.88','125.32278',0),(166,NULL,'Kiev','50.45466','30.5238',0),(0,NULL,'Maker World','0','0',513);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cluster`
--

DROP TABLE IF EXISTS `cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cluster` (
  `id` int(11) NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude_min` double NOT NULL,
  `longitude_min` double NOT NULL,
  `latitude_max` double NOT NULL,
  `longitude_max` double NOT NULL,
  `child_count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `left_side` int(11) NOT NULL,
  `right_side` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_id` (`incident_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information used for clustering of reports on the map.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cluster`
--

LOCK TABLES `cluster` WRITE;
/*!40000 ALTER TABLE `cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `cluster` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='Stores website links (video or photo) for a report';

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `checkin_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `comment_author` varchar(100) DEFAULT NULL,
  `comment_email` varchar(120) DEFAULT NULL,
  `comment_description` text,
  `comment_ip` varchar(100) DEFAULT NULL,
  `comment_spam` tinyint(4) NOT NULL DEFAULT '0',
  `comment_active` tinyint(4) NOT NULL DEFAULT '0',
  `comment_phase` tinyint(4) NOT NULL DEFAULT '0',
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `checkin_id` (`checkin_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='Stores comments made on reports/checkins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (44,27,NULL,3,'Guerrilla Futures','jasontester@gmail.com','Lots of raw material to re-process to create the land','50.78.109.177',0,1,2,'2013-08-22 20:42:45',NULL),(43,35,NULL,44,'A_G','agoldman@iftf.org','This is an amazing idea... thinking about spatial scarcity in this way.  How will makers contribute here?','50.78.109.177',0,1,0,'2013-08-12 21:34:32',NULL),(42,28,NULL,44,'A_G','agoldman@iftf.org','I think the resulting migration of fluctuating housing prices is really interesting.  I\'d love to learn more about how people decide, as a group, about the next place to go.  What makes this \'home\' for all these people?','50.78.109.177',0,1,0,'2013-08-12 21:30:22',NULL),(41,29,NULL,44,'A_G','agoldman@iftf.org','traditional businesses and older ways of thinking','50.78.109.177',0,1,3,'2013-08-12 21:27:11',NULL),(40,29,NULL,44,'A_G','agoldman@iftf.org','public support','207.47.0.147',0,1,2,'2013-08-12 21:26:59',NULL),(39,29,NULL,44,'A_G','agoldman@iftf.org','All the people to run the different aspects of the space','50.78.109.177',0,1,1,'2013-08-12 21:26:29',NULL),(38,29,NULL,44,'A_G','agoldman@iftf.org','What is new about this idea?  What do you gain from having all these activities take place under the same roof?','207.47.0.147',0,1,0,'2013-08-12 21:26:00',NULL),(37,23,NULL,44,'A_G','agoldman@iftf.org','Traditional schools, the need for rigid strutures that can be universally understood, the downfall of the maker movement when people begin to think that it\'s not going to keep growing','207.47.0.147',0,1,3,'2013-08-12 21:24:18',NULL),(36,23,NULL,44,'A_G','agoldman@iftf.org','probably public support from the school system','207.47.0.147',0,1,2,'2013-08-12 21:23:38',NULL),(35,23,NULL,44,'A_G','agoldman@iftf.org','Hacker spaces and traditional educators','207.47.0.147',0,1,1,'2013-08-12 21:23:24',NULL),(34,23,NULL,44,'A_G','agoldman@iftf.org','By blending badges with \'problem challenges\', which pair of individuals or teams with problems that need to be solved, you can replace badges with real-world accomplishments.  In this sense, your badge becomes \'I engineered a bridge\', instead of a \'bridge-building badge\', which in itself means nothing','207.47.0.147',0,1,0,'2013-08-12 21:20:31',NULL),(33,27,NULL,44,'A_G','agoldman@iftf.org','I would research and explore the logic behind houseboats- are there any places in the world where houseboats have been built to fill a need for space?  Are there any places where these houseboats have become \'land\'?','207.47.0.147',0,1,0,'2013-08-12 21:18:31',NULL),(32,27,NULL,44,'A_G','agoldman@iftf.org','What about how choppy the water is by the bridge?  Would it not be more practical to slowly expand a series of houseboat kind of things?','50.78.109.177',0,1,3,'2013-08-12 21:16:14',NULL),(31,27,NULL,44,'A_G','agoldman@iftf.org','My guess is that there are some weird legal issues surrounding buying or building new \'land\'.  I can imagine SF literally cutting Sans Land off and letting it float across the bay!','50.78.109.177',0,1,2,'2013-08-12 21:16:08',NULL),(30,27,NULL,44,'A_G','agoldman@iftf.org','I guess you need to wait for the populations of SF and Oakland to grow.','50.78.109.177',0,1,1,'2013-08-12 21:16:01',NULL),(29,34,NULL,44,'A_G','agoldman@iftf.org','Is this in Hamburg Germany, or in Kansas??','50.78.109.177',0,1,0,'2013-08-12 18:47:33',NULL),(45,27,NULL,52,'Applesauce','dr.weidinger+2@gmail.com','Its almost impossible to afford rent in SF right now, I wonder if this could be a lower income housing opportunity','50.78.109.177',0,1,1,'2013-08-22 20:43:02',NULL),(46,27,NULL,52,'Applesauce','dr.weidinger+2@gmail.com','There are tons of shipping containers that go through too, They might get upset if it takes up too much room','207.47.0.147',0,1,3,'2013-08-22 20:43:25',NULL),(47,27,NULL,3,'Guerrilla Futures','jasontester@gmail.com','Let\'s mobilize people in Oakland and San Francisco to make this happen','50.78.109.177',0,1,1,'2013-08-22 20:43:33',NULL),(48,35,NULL,53,'CrazyI','asaulgoldman@gmail.com','growers, locals businesses, retired people with free time, kids home from the summer.','207.47.0.147',0,1,1,'2013-08-22 22:28:35',NULL),(49,35,NULL,53,'CrazyI','asaulgoldman@gmail.com','Figure out how to get people willing to rent out each-other\'s lawns','50.78.109.177',0,1,2,'2013-08-22 22:28:57',NULL),(50,35,NULL,53,'CrazyI','asaulgoldman@gmail.com','Local ordinances, cultural values against sharing, pesticide use','207.47.0.147',0,1,3,'2013-08-22 22:29:19',NULL),(51,28,NULL,53,'CrazyI','asaulgoldman@gmail.com','Yeah, how did people end up here?  What draws them to this location?','207.47.0.147',0,1,0,'2013-08-22 23:25:22',NULL),(52,44,NULL,53,'CrazyI','asaulgoldman@gmail.com','Fun fun','50.78.109.177',0,1,0,'2013-08-22 23:29:08',NULL),(53,44,NULL,56,'ArttVision','ggvosas2@gmail.com','LOL¿','85.136.234.64',0,1,0,'2013-08-25 22:47:25',NULL),(54,41,NULL,53,'CrazyI','asaulgoldman@gmail.com','What are some of the legal challenges here?  The concept of an invisible form of self-expression is fascinating, given that tattoos are so visible','71.6.85.211',0,1,3,'2013-08-27 18:03:09',NULL),(55,46,NULL,66,'renepare','pare@dse.nl','multidisciplinary international tinkerers','83.163.91.136',0,1,1,'2013-09-16 23:26:55',NULL),(56,46,NULL,66,'renepare','pare@dse.nl','making / building spaces and challenges','83.163.91.136',0,1,2,'2013-09-16 23:28:22',NULL),(57,46,NULL,66,'renepare','pare@dse.nl','fear to change, holding on to positions.','83.163.91.136',0,1,3,'2013-09-16 23:29:15',NULL),(58,65,NULL,7,'Furniture','nicolas@wikiseat.org','This is a great idea. It sounds similar to the Hyperloop, but transporting goods. I wonder if we could build a multi purpose tube that can transport both the humans and their stuff?','71.6.85.211',0,1,0,'2013-09-24 18:59:56',NULL),(59,27,NULL,78,'Daniel_Katz','danieljkatz@gmail.com','Advances in technology allow Sans Land to provide its own utilities: desalination and water filtration provide potable water; underwater turbines, water-based wind farms and geothermal heat harvesting provide electricity.','72.129.87.55',0,1,2,'2013-10-01 03:26:40',NULL),(60,27,NULL,78,'Daniel_Katz','danieljkatz@gmail.com','If created land (landfill), at significant risk of earthquake. If completely floating, infrastructure is difficult.','72.129.87.55',0,1,3,'2013-10-01 03:29:59',NULL),(61,65,NULL,78,'Daniel_Katz','danieljkatz@gmail.com','Interstate commerce implications will make this require heavy legal work. How can the crowd and makers facilitate this legal work?','72.129.87.55',0,1,3,'2013-10-01 03:56:29',NULL),(62,67,NULL,85,'cujomatty','m.carrabs@hotmail.ca','Roads','24.36.122.39',0,1,0,'2013-10-13 16:54:17',NULL),(63,67,NULL,85,'cujomatty','m.carrabs@hotmail.ca','Roads','24.36.122.39',0,1,0,'2013-10-13 16:54:17',NULL),(64,66,NULL,92,'makerme','tfinlev@iftf.org','I love this idea! Let\'s add money to retrofit and earthquake proof the bridge!','50.78.109.177',0,1,0,'2013-10-14 19:39:58',NULL),(65,66,NULL,7,'Furniture','nicolas@wikiseat.org','This is a great idea. Gallery night on the bridge would be a hit for people from SF and from Oakland.','71.6.85.211',0,1,0,'2013-10-14 19:41:26',NULL),(66,69,NULL,53,'CrazyI','asaulgoldman@gmail.com','That\'s really cool!  What might this look like?  Maybe there are stop lights that turn green faster if you\'ve been acting more ethically and this is measured through review systems or something?','71.6.85.211',0,1,0,'2013-10-14 19:41:54',NULL),(67,70,NULL,53,'CrazyI','asaulgoldman@gmail.com','I think it\'s really interesting to think about localized branding for making to think about coming together as a community.  That\'s pretty cool!','50.78.109.177',0,1,0,'2013-10-14 19:43:56',NULL),(68,73,NULL,53,'CrazyI','asaulgoldman@gmail.com','Cool!  I\'d be faskinated by imagining how makers can re-make sports to be more creative and participatory.','50.78.109.177',0,1,0,'2013-10-14 19:45:57',NULL),(69,75,NULL,93,'dunagan23','jdunagan@iftf.org','No more dishes! you rinse off your plastic plates and watch them melt back into your plastic reservoir.','50.78.109.177',0,1,0,'2013-10-14 19:47:46',NULL),(70,76,NULL,99,'kayvee','kvian@iftf.org','Odessa citizens connect with citizen in other cities to help reframe global issues in local terms, so a kind of de factor global governance emerges from the bottom up.','24.22.106.163',0,1,0,'2013-10-14 19:47:55',NULL),(71,75,NULL,91,'Transcendentalist','bwarburg@iftf.org','This could expand to composting too! Especially for products that people dislike reusing, such as mattresses :)','71.6.85.211',0,1,0,'2013-10-14 19:47:59',NULL),(72,76,NULL,7,'Furniture','nicolas@wikiseat.org','This real-time voting system could include an educational component, allowing people to research policy decisions and make INFORMED decisions.','71.6.85.211',0,1,0,'2013-10-14 19:48:04',NULL),(73,79,NULL,86,'bradganistan','bkreit@iftf.org','augmented reality tools get put to use to enable people to communicate with each other and share hyperlocal information about the history, experience and future of oakland.','71.6.85.211',0,1,0,'2013-10-14 19:49:19',NULL),(74,71,NULL,89,'Rebecca Chesney','rebeccachesney@gmail.com','These art spaces become outdoor classrooms for local schools, bringing hands-on education and community across grade levels and schools.','71.6.85.211',0,1,0,'2013-10-14 19:49:30',NULL),(75,81,NULL,53,'CrazyI','asaulgoldman@gmail.com','I\'d love to imagine how Makers can engage in a more receptive nature with nature.  Maybe they\'d make houses on stilts?  Find out how to 3D print more flood=accepting structures?','71.6.85.211',0,1,0,'2013-10-14 19:50:40',NULL),(76,74,NULL,7,'Furniture','nicolas@wikiseat.org','Could we formalize a recycling collection program? That way it could provide health insurance and a retirement plan and stuff.','71.6.85.211',0,1,0,'2013-10-14 19:51:24',NULL),(77,80,NULL,53,'CrazyI','asaulgoldman@gmail.com','Sweet.  I think local, rural communities could benefit from coding, as most startups are focused on the urban market and stuff','71.6.85.211',0,1,0,'2013-10-14 19:51:50',NULL),(78,23,NULL,100,'MoK','maureenkirchner@gmail.com','And degrees that are recognized by the population at large!','50.78.109.177',0,1,0,'2013-10-14 19:52:41',NULL),(79,73,NULL,7,'Furniture','nicolas@wikiseat.org','The new helmet technology is attached to highly advanced robots that do all of the sportsball playing for us.','71.6.85.211',0,1,0,'2013-10-14 19:53:13',NULL),(80,80,NULL,101,'futrmyr','mavery@iftf.org','There could be really interesting lessons from rural coders that could benefit suburban communities as well.','50.78.109.177',0,1,0,'2013-10-14 19:54:51',NULL),(81,78,NULL,79,'Future-Facing','sskvirsky@iftf.org','Start the program as a pilot program in 2014 school year with 1 elementary, 1 middle, and 1 high school! Proof of concept.','71.6.85.211',0,1,0,'2013-10-14 19:55:13',NULL),(82,78,NULL,79,'Future-Facing','sskvirsky@iftf.org','Also, maybe the artists, makers, etc, get civic participation points that can be used as a tax credit of something else?','71.6.85.211',0,1,0,'2013-10-14 19:55:18',NULL),(83,78,NULL,73,'Rachelkeas','rhatch@iftf.org','Work with local businesses to pioneer the first codified measures of ROI on Maker Education. #NewMeasures','68.189.52.55',0,1,0,'2013-10-14 19:57:20',NULL),(84,84,NULL,98,'happytime','nlazkani@iftf.org','guidelines are provided to HOA list and or home ins policy so all adapt to the protocols','50.78.109.177',0,1,0,'2013-10-14 20:01:44',NULL),(85,75,NULL,87,'BH1981','bhamamoto@iftf.org','And for food! Easy tools to salvage leftovers and make preserves, broths, render fats, etc.','71.6.85.211',0,1,0,'2013-10-14 20:02:05',NULL),(86,72,NULL,103,'GinChes','gchesney@wc.edu','Local cattle companies - especially small family farms - can become involved with the American Grassfed Association for standardization and certification.','67.67.183.132',0,1,1,'2013-10-15 16:55:26',NULL),(87,72,NULL,103,'GinChes','gchesney@wc.edu','Lack of water is a problem in this area.','67.67.183.132',0,1,3,'2013-10-15 16:55:30',NULL),(88,85,NULL,53,'CrazyI','asaulgoldman@gmail.com','How can makers make this happen?  Maybe each maker can have a designed \'space\' set aside in order to help make this happen.','71.6.85.211',0,1,0,'2013-10-16 18:33:17',NULL),(89,79,NULL,53,'CrazyI','asaulgoldman@gmail.com','This is a great idea!  It\'s like \'the people ARE the city\', instead of \'the people are represented by the city\'','50.78.109.177',0,1,0,'2013-10-16 18:34:07',NULL),(90,84,NULL,53,'CrazyI','asaulgoldman@gmail.com','Maker healers?  Makers as healing the land?','71.6.85.211',0,1,0,'2013-10-16 18:34:57',NULL),(91,75,NULL,53,'CrazyI','asaulgoldman@gmail.com','Recycling and garbage companies, cities who must pay these companies','71.6.85.211',0,1,1,'2013-10-16 18:35:45',NULL),(92,75,NULL,53,'CrazyI','asaulgoldman@gmail.com','Stage a sample event!','50.78.109.177',0,1,2,'2013-10-16 18:35:58',NULL),(93,75,NULL,53,'CrazyI','asaulgoldman@gmail.com','People not wanting to turn recycling into reusable stuff','207.47.0.147',0,1,3,'2013-10-16 18:36:31',NULL),(94,87,NULL,110,'Spock Picard','nickpinkston@gmail.com','Yay!','71.6.85.211',0,1,0,'2013-10-22 22:44:09',NULL),(95,86,NULL,110,'Spock Picard','nickpinkston@gmail.com','What does \"farming\" mean? Is it a necessarily social activity? Is it purely based on producing food or go further to produce community?','71.6.85.211',0,1,0,'2013-10-22 22:46:05',NULL),(96,89,NULL,53,'CrazyI','asaulgoldman@gmail.com','Maybe think about how you would prototype this process?','50.78.109.177',0,1,0,'2013-10-22 22:51:00',NULL),(97,89,NULL,110,'Spock Picard','nickpinkston@gmail.com','Using neighborhood as the separation may miss a lot o minority interests who are dispersed geographically throughout the city. What\'s a mechanism to get around this?','50.78.109.177',0,1,0,'2013-10-22 22:53:33',NULL),(98,91,NULL,113,'Mike Zuckerman','michaelpzuckerman@yahoo.com','http://www.thecity2.org/stories/recycled-amusement','50.78.109.177',0,1,0,'2013-10-22 22:58:37',NULL),(99,89,NULL,109,'Innovate_EconDev','matt.chwierut@sanjoseca.gov','Could we build a parallel city budget *now*, based on existing data and revenue projections, that we could evaluate in 1 - 2 years?  This might also be useful for guiding nonprofit funding (i.e. gaps where citizens want to spend but cities don\'t)','71.6.85.211',0,1,2,'2013-10-22 23:02:42',NULL),(100,92,NULL,111,'Fenry Hord','jerryp@gmail.com','Check out http://talktothestation.com for more crowd-generated ideas for Michigan Central Station. Love that old girl. She turned 100 this year (2013).','50.78.109.177',0,1,0,'2013-10-22 23:06:51',NULL),(101,91,NULL,53,'CrazyI','asaulgoldman@gmail.com','Cool!  What needs to happen in order for this to happen?  Maybe it would be awesome to think through some clear benefits of this idea.','71.6.85.211',0,1,1,'2013-10-24 22:16:05',NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `cities` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COMMENT='Stores a list of all countries and their capital cities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AD','Andorra','Andorra la Vella',0),(2,'AE','United Arab Emirates','Abu Dhabi',0),(3,'AF','Afghanistan','Kabul',0),(4,'AG','Antigua and Barbuda','St. John\'s',0),(5,'AI','Anguilla','The Valley',0),(6,'AL','Albania','Tirana',0),(7,'AM','Armenia','Yerevan',0),(8,'AN','Netherlands Antilles','Willemstad',0),(9,'AO','Angola','Luanda',0),(10,'AQ','Antarctica','',0),(11,'AR','Argentina','Buenos Aires',0),(12,'AS','American Samoa','Pago Pago',0),(13,'AT','Austria','Vienna',0),(14,'AU','Australia','Canberra',0),(15,'AW','Aruba','Oranjestad',0),(16,'AX','Aland Islands','Mariehamn',0),(17,'AZ','Azerbaijan','Baku',0),(18,'BA','Bosnia and Herzegovina','Sarajevo',0),(19,'BB','Barbados','Bridgetown',0),(20,'BD','Bangladesh','Dhaka',0),(21,'BE','Belgium','Brussels',0),(22,'BF','Burkina Faso','Ouagadougou',0),(23,'BG','Bulgaria','Sofia',0),(24,'BH','Bahrain','Manama',0),(25,'BI','Burundi','Bujumbura',0),(26,'BJ','Benin','Porto-Novo',0),(27,'BL','Saint BarthÃ©lemy','Gustavia',0),(28,'BM','Bermuda','Hamilton',0),(29,'BN','Brunei','Bandar Seri Begawan',0),(30,'BO','Bolivia','La Paz',0),(31,'BR','Brazil','BrasÃ­lia',0),(32,'BS','Bahamas','Nassau',0),(33,'BT','Bhutan','Thimphu',0),(34,'BV','Bouvet Island','',0),(35,'BW','Botswana','Gaborone',0),(36,'BY','Belarus','Minsk',0),(37,'BZ','Belize','Belmopan',0),(38,'CA','Canada','Ottawa',0),(39,'CC','Cocos Islands','West Island',0),(40,'CD','Democratic Republic of the Congo','Kinshasa',0),(41,'CF','Central African Republic','Bangui',0),(42,'CG','Congo Brazzavile','Brazzaville',0),(43,'CH','Switzerland','Berne',0),(44,'CI','Ivory Coast','Yamoussoukro',0),(45,'CK','Cook Islands','Avarua',0),(46,'CL','Chile','Santiago',0),(47,'CM','Cameroon','YaoundÃ©',0),(48,'CN','China','Beijing',0),(49,'CO','Colombia','BogotÃ¡',0),(50,'CR','Costa Rica','San JosÃ©',0),(51,'CS','Serbia and Montenegro','Belgrade',0),(52,'CU','Cuba','Havana',0),(53,'CV','Cape Verde','Praia',0),(54,'CX','Christmas Island','Flying Fish Cove',0),(55,'CY','Cyprus','Nicosia',0),(56,'CZ','Czech Republic','Prague',0),(57,'DE','Germany','Berlin',0),(58,'DJ','Djibouti','Djibouti',0),(59,'DK','Denmark','Copenhagen',0),(60,'DM','Dominica','Roseau',0),(61,'DO','Dominican Republic','Santo Domingo',0),(62,'DZ','Algeria','Algiers',0),(63,'EC','Ecuador','Quito',0),(64,'EE','Estonia','Tallinn',0),(65,'EG','Egypt','Cairo',0),(66,'EH','Western Sahara','El-Aaiun',0),(67,'ER','Eritrea','Asmara',0),(68,'ES','Spain','Madrid',0),(69,'ET','Ethiopia','Addis Ababa',0),(70,'FI','Finland','Helsinki',0),(71,'FJ','Fiji','Suva',0),(72,'FK','Falkland Islands','Stanley',0),(73,'FM','Micronesia','Palikir',0),(74,'FO','Faroe Islands','TÃ³rshavn',0),(75,'FR','France','Paris',0),(76,'GA','Gabon','Libreville',0),(77,'GB','United Kingdom','London',0),(78,'GD','Grenada','St. George\'s',0),(79,'GE','Georgia','Tbilisi',0),(80,'GF','French Guiana','Cayenne',0),(81,'GG','Guernsey','St Peter Port',0),(82,'GH','Ghana','Accra',0),(83,'GI','Gibraltar','Gibraltar',0),(84,'GL','Greenland','Nuuk',0),(85,'GM','Gambia','Banjul',0),(86,'GN','Guinea','Conakry',0),(87,'GP','Guadeloupe','Basse-Terre',0),(88,'GQ','Equatorial Guinea','Malabo',0),(89,'GR','Greece','Athens',0),(90,'GS','South Georgia and the South Sandwich Islands','Grytviken',0),(91,'GT','Guatemala','Guatemala City',0),(92,'GU','Guam','HagÃ¥tÃ±a',0),(93,'GW','Guinea-Bissau','Bissau',0),(94,'GY','Guyana','Georgetown',0),(95,'HK','Hong Kong','Hong Kong',0),(96,'HM','Heard Island and McDonald Islands','',0),(97,'HN','Honduras','Tegucigalpa',0),(98,'HR','Croatia','Zagreb',0),(99,'HT','Haiti','Port-au-Prince',0),(100,'HU','Hungary','Budapest',0),(101,'ID','Indonesia','Jakarta',0),(102,'IE','Ireland','Dublin',0),(103,'IL','Israel','Jerusalem',0),(104,'IM','Isle of Man','Douglas, Isle of Man',0),(105,'IN','India','New Delhi',0),(106,'IO','British Indian Ocean Territory','Diego Garcia',0),(107,'IQ','Iraq','Baghdad',0),(108,'IR','Iran','Tehran',0),(109,'IS','Iceland','ReykjavÃ­k',0),(110,'IT','Italy','Rome',0),(111,'JE','Jersey','Saint Helier',0),(112,'JM','Jamaica','Kingston',0),(113,'JO','Jordan','Amman',0),(114,'JP','Japan','Tokyo',0),(115,'KE','Kenya','Nairobi',0),(116,'KG','Kyrgyzstan','Bishkek',0),(117,'KH','Cambodia','Phnom Penh',0),(118,'KI','Kiribati','South Tarawa',0),(119,'KM','Comoros','Moroni',0),(120,'KN','Saint Kitts and Nevis','Basseterre',0),(121,'KP','North Korea','Pyongyang',0),(122,'KR','South Korea','Seoul',0),(123,'KW','Kuwait','Kuwait City',0),(124,'KY','Cayman Islands','George Town',0),(125,'KZ','Kazakhstan','Astana',0),(126,'LA','Laos','Vientiane',0),(127,'LB','Lebanon','Beirut',0),(128,'LC','Saint Lucia','Castries',0),(129,'LI','Liechtenstein','Vaduz',0),(130,'LK','Sri Lanka','Colombo',0),(131,'LR','Liberia','Monrovia',0),(132,'LS','Lesotho','Maseru',0),(133,'LT','Lithuania','Vilnius',0),(134,'LU','Luxembourg','Luxembourg',0),(135,'LV','Latvia','Riga',0),(136,'LY','Libya','Tripolis',0),(137,'MA','Morocco','Rabat',0),(138,'MC','Monaco','Monaco',0),(139,'MD','Moldova','Chi_in_u',0),(140,'ME','Montenegro','Podgorica',0),(141,'MF','Saint Martin','Marigot',0),(142,'MG','Madagascar','Antananarivo',0),(143,'MH','Marshall Islands','Uliga',0),(144,'MK','Macedonia','Skopje',0),(145,'ML','Mali','Bamako',0),(146,'MM','Myanmar','Yangon',0),(147,'MN','Mongolia','Ulan Bator',0),(148,'MO','Macao','Macao',0),(149,'MP','Northern Mariana Islands','Saipan',0),(150,'MQ','Martinique','Fort-de-France',0),(151,'MR','Mauritania','Nouakchott',0),(152,'MS','Montserrat','Plymouth',0),(153,'MT','Malta','Valletta',0),(154,'MU','Mauritius','Port Louis',0),(155,'MV','Maldives','MalÃ©',0),(156,'MW','Malawi','Lilongwe',0),(157,'MX','Mexico','Mexico City',0),(158,'MY','Malaysia','Kuala Lumpur',0),(159,'MZ','Mozambique','Maputo',0),(160,'NA','Namibia','Windhoek',0),(161,'NC','New Caledonia','NoumÃ©a',0),(162,'NE','Niger','Niamey',0),(163,'NF','Norfolk Island','Kingston',0),(164,'NG','Nigeria','Abuja',0),(165,'NI','Nicaragua','Managua',0),(166,'NL','Netherlands','Amsterdam',0),(167,'NO','Norway','Oslo',0),(168,'NP','Nepal','Kathmandu',0),(169,'NR','Nauru','Yaren',0),(170,'NU','Niue','Alofi',0),(171,'NZ','New Zealand','Wellington',0),(172,'OM','Oman','Muscat',0),(173,'PA','Panama','Panama City',0),(174,'PE','Peru','Lima',0),(175,'PF','French Polynesia','Papeete',0),(176,'PG','Papua New Guinea','Port Moresby',0),(177,'PH','Philippines','Manila',0),(178,'PK','Pakistan','Islamabad',0),(179,'PL','Poland','Warsaw',0),(180,'PM','Saint Pierre and Miquelon','Saint-Pierre',0),(181,'PN','Pitcairn','Adamstown',0),(182,'PR','Puerto Rico','San Juan',0),(183,'PS','Palestinian Territory','East Jerusalem',0),(184,'PT','Portugal','Lisbon',0),(185,'PW','Palau','Koror',0),(186,'PY','Paraguay','AsunciÃ³n',0),(187,'QA','Qatar','Doha',0),(188,'RE','Reunion','Saint-Denis',0),(189,'RO','Romania','Bucharest',0),(190,'RS','Serbia','Belgrade',0),(191,'RU','Russia','Moscow',0),(192,'RW','Rwanda','Kigali',0),(193,'SA','Saudi Arabia','Riyadh',0),(194,'SB','Solomon Islands','Honiara',0),(195,'SC','Seychelles','Victoria',0),(196,'SD','Sudan','Khartoum',0),(197,'SE','Sweden','Stockholm',0),(198,'SG','Singapore','Singapur',0),(199,'SH','Saint Helena','Jamestown',0),(200,'SI','Slovenia','Ljubljana',0),(201,'SJ','Svalbard and Jan Mayen','Longyearbyen',0),(202,'SK','Slovakia','Bratislava',0),(203,'SL','Sierra Leone','Freetown',0),(204,'SM','San Marino','San Marino',0),(205,'SN','Senegal','Dakar',0),(206,'SO','Somalia','Mogadishu',0),(207,'SR','Suriname','Paramaribo',0),(208,'ST','Sao Tome and Principe','SÃ£o TomÃ©',0),(209,'SV','El Salvador','San Salvador',0),(210,'SY','Syria','Damascus',0),(211,'SZ','Swaziland','Mbabane',0),(212,'TC','Turks and Caicos Islands','Cockburn Town',0),(213,'TD','Chad','N\'Djamena',0),(214,'TF','French Southern Territories','Martin-de-ViviÃ¨s',0),(215,'TG','Togo','LomÃ©',0),(216,'TH','Thailand','Bangkok',0),(217,'TJ','Tajikistan','Dushanbe',0),(218,'TK','Tokelau','',0),(219,'TL','East Timor','Dili',0),(220,'TM','Turkmenistan','Ashgabat',0),(221,'TN','Tunisia','Tunis',0),(222,'TO','Tonga','Nuku\'alofa',0),(223,'TR','Turkey','Ankara',0),(224,'TT','Trinidad and Tobago','Port of Spain',0),(225,'TV','Tuvalu','Vaiaku',0),(226,'TW','Taiwan','Taipei',0),(227,'TZ','Tanzania','Dar es Salaam',0),(228,'UA','Ukraine','Kiev',0),(229,'UG','Uganda','Kampala',0),(230,'UM','United States Minor Outlying Islands','',0),(231,'US','United States','Washington',0),(232,'UY','Uruguay','Montevideo',0),(233,'UZ','Uzbekistan','Tashkent',0),(234,'VA','Vatican','Vatican City',0),(235,'VC','Saint Vincent and the Grenadines','Kingstown',0),(236,'VE','Venezuela','Caracas',0),(237,'VG','British Virgin Islands','Road Town',0),(238,'VI','U.S. Virgin Islands','Charlotte Amalie',0),(239,'VN','Vietnam','Hanoi',0),(240,'VU','Vanuatu','Port Vila',0),(241,'WF','Wallis and Futuna','MatÃ¢\'Utu',0),(242,'WS','Samoa','Apia',0),(243,'YE','Yemen','Sanâ€˜aâ€™',0),(244,'YT','Mayotte','Mamoudzou',0),(245,'ZA','South Africa','Pretoria',0),(246,'ZM','Zambia','Lusaka',0),(247,'ZW','Zimbabwe','Harare',0);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externalapp`
--

DROP TABLE IF EXISTS `externalapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externalapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Info on external apps(mobile) that work with your deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externalapp`
--

LOCK TABLES `externalapp` WRITE;
/*!40000 ALTER TABLE `externalapp` DISABLE KEYS */;
INSERT INTO `externalapp` VALUES (1,'iPhone','http://download.ushahidi.com/track_download.php?download=ios'),(2,'Android','http://download.ushahidi.com/track_download.php?download=android');
/*!40000 ALTER TABLE `externalapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feed_name` varchar(255) DEFAULT NULL,
  `feed_url` varchar(255) DEFAULT NULL,
  `feed_cache` text,
  `feed_active` tinyint(4) DEFAULT '1',
  `feed_update` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about RSS Feeds a deployment subscribes to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed`
--

LOCK TABLES `feed` WRITE;
/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_item`
--

DROP TABLE IF EXISTS `feed_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) unsigned NOT NULL,
  `location_id` bigint(20) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_title` varchar(255) DEFAULT NULL,
  `item_description` text,
  `item_link` varchar(255) DEFAULT NULL,
  `item_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores feed items pulled from each RSS Feed';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_item`
--

LOCK TABLES `feed_item` WRITE;
/*!40000 ALTER TABLE `feed_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_title` varchar(200) NOT NULL,
  `form_description` text,
  `form_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores all report submission forms created(default+custom)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (1,'Default Form','Default form, for report entry',1);
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field`
--

DROP TABLE IF EXISTS `form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `field_name` varchar(200) DEFAULT NULL,
  `field_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - TEXTFIELD, 2 - TEXTAREA (FREETEXT), 3 - DATE, 4 - PASSWORD, 5 - RADIO, 6 - CHECKBOX',
  `field_required` tinyint(4) DEFAULT '0',
  `field_position` tinyint(4) NOT NULL DEFAULT '0',
  `field_default` varchar(200) DEFAULT NULL,
  `field_maxlength` int(11) NOT NULL DEFAULT '0',
  `field_width` smallint(6) NOT NULL DEFAULT '0',
  `field_height` tinyint(4) DEFAULT '5',
  `field_isdate` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_visible` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_submit` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_name` (`field_name`),
  KEY `fk_form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all custom form fields created by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field`
--

LOCK TABLES `form_field` WRITE;
/*!40000 ALTER TABLE `form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_option`
--

DROP TABLE IF EXISTS `form_field_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(200) DEFAULT NULL,
  `option_value` text,
  PRIMARY KEY (`id`),
  KEY `form_field_id` (`form_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options related to custom form fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field_option`
--

LOCK TABLES `form_field_option` WRITE;
/*!40000 ALTER TABLE `form_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_response`
--

DROP TABLE IF EXISTS `form_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL,
  `form_response` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_form_field_id` (`form_field_id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores responses to custom form fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_response`
--

LOCK TABLES `form_response` WRITE;
/*!40000 ALTER TABLE `form_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geometry`
--

DROP TABLE IF EXISTS `geometry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geometry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `geometry` geometry NOT NULL,
  `geometry_label` varchar(150) DEFAULT NULL,
  `geometry_comment` varchar(255) DEFAULT NULL,
  `geometry_color` varchar(20) DEFAULT NULL,
  `geometry_strokewidth` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `geometry` (`geometry`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores map geometries i.e polygons, lines etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geometry`
--

LOCK TABLES `geometry` WRITE;
/*!40000 ALTER TABLE `geometry` DISABLE KEYS */;
/*!40000 ALTER TABLE `geometry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned NOT NULL,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `user_id` int(11) unsigned DEFAULT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  `incident_date` datetime DEFAULT NULL,
  `incident_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - WEB, 2 - SMS, 3 - EMAIL, 4 - TWITTER',
  `incident_active` tinyint(4) NOT NULL DEFAULT '0',
  `incident_verified` tinyint(4) NOT NULL DEFAULT '0',
  `incident_phase` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Proposal, 1 - Active, 2 - Certified',
  `incident_dateadd` datetime DEFAULT NULL,
  `incident_dateadd_gmt` datetime DEFAULT NULL,
  `incident_datemodify` datetime DEFAULT NULL,
  `incident_alert_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Not Tagged for Sending, 1 - Tagged for Sending, 2 - Alerts Have Been Sent',
  `incident_zoom` tinyint(4) DEFAULT NULL,
  `incident_stats` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_active` (`incident_active`),
  KEY `incident_date` (`incident_date`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='Stores reports submitted';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident`
--

LOCK TABLES `incident` WRITE;
/*!40000 ALTER TABLE `incident` DISABLE KEYS */;
INSERT INTO `incident` VALUES (31,31,0,'en_US',25,18,'Columbus - With Trains!','Columbus is one of the largest cities in the United States with absolutely no light rail.\n\nThis envisions a new design, centered on the Arena District (the previous location of the now-defunct Union Station, and where other light rail stations have been proposed), with a hub-and-spoke model.  The proposed center is also relatively close to the city center bus terminal, which has been included for reference.\n\nThis also adds an express line east to and from Port Columbus International Airport.  The stations have been positioned to track along already-existing rail lines.','2013-07-23 01:11:00',1,1,1,1,'2013-07-23 04:19:38',NULL,NULL,0,14,''),(30,30,0,'en_US',23,0,'Closing the Loops','In 2013, all railways lead to the CBD, while all roads lead around it. (I will think of something more snappy to say later)','2013-07-20 23:32:00',1,1,1,0,'2013-07-22 05:25:15',NULL,NULL,0,15,''),(29,29,0,'en_US',7,18,'Wonderland','Columbus open a center for art and innovation. It is part event space, part workshop, part retail, part kitchen, and part school. This adds up to a whole lot of awesome, and it really helps bring the neighborhood together.','2013-07-19 13:51:00',1,1,1,1,'2013-07-19 19:55:03',NULL,NULL,0,14,''),(11,11,0,'en_US',4,69,'Mumbai Learning!','Indian Maker Learning','2013-06-14 13:38:00',1,1,1,0,'2013-06-14 19:53:18',NULL,NULL,0,14,''),(27,27,0,'en_US',7,53,'Sans Land','In the future Oakland and San Francisco are totally overpopulated. Sans Land is a floating city water bridge thing that is built between San Francisco and Oakland. It is made by the people who live there.','2013-07-18 13:22:00',1,1,1,2,'2013-07-18 19:24:14',NULL,NULL,0,14,'{\"phase\":2,\"rating\":4,\"comments\":10}'),(28,28,0,'en_US',21,34,'Futurum Impotens','It\'s 2025 and Norman Oklahoma is now what SF was in the 70\'s. A mecca of culture and creativity, all of the artists started to move to the region in the housing bust of the late 2010\'s, due to cheapened property prices in the midwest, and heightened living costs on the coasts. \n\nDue to this upsurge of create types, and the fact that many people here having already lived by the DIY ethos due to generations of poverty and \"making ends meet\", people have taken to building things themselves without asking for government\'s permission. \n\nThese artists use their tools oftentimes to rebuild homes wiped away by the yearly surge of tornadic activity. Powerlines have just recently all gone underground to avoid the dangers up-ground lines present. \n\nGroups of people will oftentimes gather up and collect their tools and skills to help out neighbors in need. This is the heart of America, and they show it in their labor.','2013-07-18 13:23:00',1,1,1,1,'2013-07-18 19:41:28',NULL,NULL,0,16,''),(22,22,0,'en_US',5,16,'Sans Land 2','Sans land links up with Treasure Island and forms its own governance. People are talking about making a nation called Treasure Land.','2013-07-08 13:23:00',1,1,1,0,'2013-07-08 17:37:32',NULL,NULL,0,14,''),(23,23,0,'en_US',5,16,'hackerschool','Hackerspace offers open badges accredited classes.','2013-07-08 13:23:00',1,1,1,1,'2013-07-08 19:06:22',NULL,NULL,0,16,''),(33,33,0,'en_US',38,0,'Chattanooga will be a city with no digital divide.','All sectors work together to create a city where all have ready and convenient access to the internet and all opportunities that access provides to make a better quality of life.','2013-07-29 13:28:00',1,1,1,0,'2013-07-29 13:37:17',NULL,NULL,0,14,''),(34,34,0,'en_US',42,0,'Urban Agriculture Spaces','The City of Hamburg will provide a unique space for urban public gardening at the area of the Oberhafen. The production of food is sold at their local marketplace, organized on one of the Halls.','2013-08-01 13:37:00',1,1,1,1,'2013-08-01 20:47:31',NULL,NULL,0,16,''),(35,35,0,'en_US',44,0,'Maker Agriculture','As the global cost of food rises steadily, citizens in suburbia will finally realize that lawns are a resource, as much a resource as mail delivery.  In order to maximize productivity of lawns, suburban citizens will turk to maker science and hardware to engineer solutions that are scalable and personal- just like the maker movement itself.  This will include building softwares and services to enable people to loan and rent lawn space.','2013-08-12 13:38:00',1,1,1,1,'2013-08-12 18:44:08',NULL,NULL,0,14,''),(36,36,0,'en_US',46,0,'A Vision for Rome as a Maker City','Much of Rome\'s civic and digital infrastructure will be crowdsourced. Fiber optic and wireless networks will be financed and built based on the actual, aggregated demand of citizens and businesses. Scarcity-based, monopolistic pricing will dissapear and make way for abundant services that encourage innovation.\n\nMaker culture will have moved from a single makerspace to entire maker villages and neighborhoods. Every neighborhood and business park/district will have the equivalent of what we call a makerspace today.\n\nHackschools will be available for parents to provide a new experiential, hands-on learning environment for their children (e.g. Logan LaPlante). Children will hack their own education in a more meshed environment, where they operate as both teachers and students. Children will learn programming and design (e.g. Scratch) at the age of 3, as fundamental skills, not specialized ones.\n\nArtists, musicians, filmmakers and crafters will have access to a global marketplace to distribute their products. They will increasingly adopt open-sourced business models (e.g. Sprakfun) where the very design of their products are shared freely.\n\nUniversal taxing systems like SPLOST will give way to self-organizing, voluntary crowdfunded initiatives for new parks, bike paths, arts and other uses. Citizens will be able to target their financial contributions towards personalized goals and aspirations.\n\nHealth clinics and hospitals will teach classes on \"responsible body hacking.\" Tattoo parlors will evolve into places where people can learn how to modify their bodies with integrated wearable technologies to create new, interactive, \"invisible\"\n forms of personal expression.\n\nSocial networks and peer financing systems will become the new community banks. Entrepreneurs seeking capital will engage citizens and businesses to become sponsors, contributors and even investors in a long-tail of economic development.\n\nConsumers of electricity will become producers through new solar technologies, smart grid and solar financing approaches (e.g. Solar Mosaic). New battery technologies will allow for the storage of enough electricity to almost eliminate the need for transmission and distribution grids.\n\nA factory will exist on every desktop and in every retail store. CAD software and design skills will become the new spreadsheet and word processors. Citizens and business will constantly conceive of, modify and build on software representations of needed objects and new ideas. Shipping goods from distance places will give way to producing good at home.\n\nPrivate sector organizational models will shift away from LLCs and S-Corps, and towards member-owned cooperatives and more nonprofits. Doing good while doing well will become sustainable as a career choice, not a retirement option.\n\nPower and influence will shift from the cathedral to the bazaar. Hierarchical command and control will be less important than intricate, peer-connected networks. Tyranny and corruption will become as difficult to pull off as fraud on eBay.','2013-08-15 13:54:00',1,1,1,1,'2013-08-15 14:27:06',NULL,NULL,0,14,''),(37,37,0,'en_US',46,0,'Abundant, Crowdsourced Infrastructure','Much of Rome\'s civic and digital infrastructure will be crowdsourced. Fiber optic and wireless networks will be financed and built based on the actual, aggregated demand of citizens and businesses. Scarcity-based, monopolistic pricing will dissapear and make way for abundant services that encourage innovation.\n\nConsumers of electricity will become producers through new solar technologies, smart grid and solar financing approaches (e.g. Solar Mosaic). New battery technologies will allow for the storage of enough electricity to almost eliminate the need for transmission and distribution grids.','2013-08-15 13:10:00',1,1,1,0,'2013-08-15 15:13:02',NULL,NULL,0,14,''),(38,38,0,'en_US',46,0,'Peerocrat Governance','Universal taxing systems like SPLOST will give way to self-organizing, voluntary crowdfunded initiatives for new parks, bike paths, arts and other uses. Citizens will be able to target their financial contributions towards personalized goals and aspirations.\n\nSocial networks and peer financing systems will become the new community banks. Entrepreneurs seeking capital will engage citizens and businesses to become sponsors, contributors and even investors in a long-tail of economic development.\n\nPrivate sector organizational models will shift away from LLCs and S-Corps, and towards member-owned cooperatives and more nonprofits. Doing good while doing well will become sustainable as a career choice, not a retirement option.\n\nPower and influence will shift from the cathedral to the bazaar. Hierarchical command and control will be less important than intricate, peer-connected networks. Tyranny and corruption will become as difficult to pull off as fraud on eBay.','2013-08-15 13:10:00',1,1,1,0,'2013-08-15 15:18:11',NULL,NULL,0,14,''),(39,39,0,'en_US',46,0,'From Spaces to Villages to Cities','Maker culture will have moved from a single makerspace to entire maker villages and neighborhoods. Every neighborhood and business park/district will have the equivalent of what we call a makerspace today.\n\nSocial networks and peer financing systems will become the new community banks. Entrepreneurs seeking capital will engage citizens and businesses to become sponsors, contributors and even investors in a long-tail of economic development.','2013-08-15 13:10:00',1,1,1,1,'2013-08-15 15:20:17',NULL,NULL,0,14,''),(40,40,0,'en_US',46,0,'Maker Industries','Maker culture will have moved from a single makerspace to entire maker villages and neighborhoods. Every neighborhood and business park/district will have the equivalent of what we call a makerspace today.\n\nWe will have moved from ten employers of a thousand to a thousand employers of ten.\n\nArtists, musicians, filmmakers and crafters will have access to a global marketplace to distribute their products. They will increasingly adopt open-sourced business models (e.g. Sprakfun) where the very design of their products are shared freely.\n\nSocial networks and peer financing systems will become the new community banks. Entrepreneurs seeking capital will engage citizens and businesses to become sponsors, contributors and even investors in a long-tail of economic development.\n\nA factory will exist on every desktop and in every retail store. CAD software and design skills will become the new spreadsheet and word processors. Citizens and business will constantly conceive of, modify and build on software representations of needed objects and new ideas. Shipping goods from distance places will give way to producing good at home.\n\nPrivate sector organizational models will shift away from LLCs and S-Corps, and towards member-owned cooperatives and more nonprofits. Doing good while doing well will become sustainable as a career choice, not a retirement option.','2013-08-15 13:10:00',1,1,1,0,'2013-08-15 15:22:29',NULL,NULL,0,14,''),(41,41,0,'en_US',46,0,'From Wearables to Integrated','Health clinics and hospitals will teach classes on \"responsible body hacking.\" Tattoo parlors will evolve into places where people can learn how to modify their bodies with integrated wearable technologies to create new, interactive, \"invisible\"\nforms of personal expression.','2013-08-15 13:10:00',1,1,1,1,'2013-08-15 15:24:15',NULL,NULL,0,14,''),(42,42,0,'en_US',46,0,'Hackschools','Hackschools will be available for parents to provide a new experiential, hands-on learning environment for their children (e.g. Logan LaPlante). Children will hack their own education in a more meshed environment, where they operate as both teachers and students. Children will learn programming and design (e.g. Scratch) at the age of 3, as fundamental skills, not specialized ones.','2013-08-15 13:29:00',1,1,1,0,'2013-08-15 18:32:01',NULL,NULL,0,14,''),(43,43,0,'en_US',52,43,'MeshNet','gigabit speed meshnets are set up all over Kansas City','2013-08-22 13:34:00',1,1,1,1,'2013-08-22 20:36:53',NULL,NULL,0,14,''),(44,44,0,'en_US',53,0,'Maker Class','In the future, people learn by doing.  Maker class is quite similar to shop class, except that maker class also provides students a lens for reevaluating other subjects.  Projects begin by being object-oriented, like \'make a lamp\', to shifting focus toward redefining and collaboratively improving broader aspects of society.  An intermediary task might be, \"walk around your neighborhood and find a problem.  Come back and document the problem you encounter, and then, as a class, brainstorm a solution to that problem.  Make a prototype of your solution.\"','2013-08-22 22:38:00',1,1,1,0,'2013-08-22 22:54:06',NULL,NULL,0,3,''),(45,45,0,'en_US',53,0,'Maker AGriculture','In Madeira in the future, people will use cutting edge science conducted by citizens from other mountainous islands to measure their exact property conditions to select and grow to match those conditions.  People will build cheap robots to capture weather data.','2013-09-11 13:22:00',1,1,1,0,'2013-09-11 15:26:27',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(46,46,0,'en_US',4,13,'Make Tank','The Institute for the Future evolves from a think tank to become a make-tank.','2013-09-12 23:14:00',1,1,1,1,'2013-09-12 23:34:46',NULL,NULL,0,14,''),(47,47,0,'en_US',64,0,'East-West Art Capitol','Enjoying a cultural renaissance, Honolulu becomes the Maker City that joins together Eastern and Western aesthetics, philosophies and lifestyle. Chinatown and Kaka\'ako provide walkable and bike-friendly streets lined with art galleries, boutiques, artisan delis, cafes and restaurants. Built from the bottom up by an active community, the city of Honolulu engaged citizens through a participatory urban planning platform called UrbanAloha developed during a series of Hackathons at Interisland Terminal, a space dedicated to advancing the role of arts in innovation, and partnered with the State\'s Office of Information Management and Technology.\n\nIn the changing economic topography of Honolulu, the majority of tourism moves away from the congested and dirty streets of Waikiki to organic farms where the eco-tourism industry blooms along with Hawaii\'s food independence. Providing new ways to make a living, more and more young people are able to find jobs doing what they love in one of the most beautiful places on the planet. Whether it\'s working in a bustling hi-tech scene filled with venture capitalists from Asia, designing urban farms and rooftop gardens, writing about art and culture, rebuilding the UH campus into clusters of innovation labs, or conducting space research, Honolulu is consciously making efforts to reverse the brain drain, and doing it in style.','2013-09-13 13:56:00',1,1,1,0,'2013-09-13 14:25:51',NULL,NULL,0,2,''),(48,48,0,'en_US',64,32,'East West Maker City','Enjoying a cultural renaissance, Honolulu becomes the Maker City that joins together Eastern and Western aesthetics, philosophies and lifestyles. Chinatown and Kaka\'ako provide walkable and bike-friendly streets lined with art galleries, boutiques, artisan delis, cafes and restaurants. Built from the bottom up by an active community, the city of Honolulu engaged citizens through a participatory urban planning platform called UrbanAloha developed during a series of Hackathons at Interisland Terminal, a space dedicated to advancing the role of arts in innovation, and partnered with the State\'s Office of Information Management and Technology.\n\nIn the changing economic topography of Honolulu, the majority of tourism moves away from the congested and dirty streets of Waikiki to organic farms where the eco-tourism industry blooms along with Hawaii\'s food independence. Providing new ways to make a living, more and more young people are able to find jobs doing what they love in one of the most beautiful places on the planet. Whether it\'s working in a bustling hi-tech scene filled with venture capitalists from Asia, designing urban farms and rooftop gardens, writing about art and culture, rebuilding the UH campus into clusters of innovation labs, or conducting space research, Honolulu is consciously making efforts to reverse the brain drain, and doing it in style.','2013-09-13 13:29:00',1,1,1,0,'2013-09-13 14:35:01',NULL,NULL,0,14,''),(49,49,0,'en_US',67,0,'PIESCHENPARK','Die Neustadtpiraten bekennen sich grundsätzlich zu den Zielen des Masterplans Hafencity mit Wohnbebauung, Büros, Erhalt des Alten Schlachthofs, Schulen, Kitas und Grünzüge mit Verbindungsfunktion (Rad/Fuß: Neustädter Bahnhof bis Elbe, West bis Ost). Wir fordern aber eine Erweiterung des Konzepts auf die Entwicklung hin zu einem voll funktionsfähigen neuen Stadtteil mit Sport- und Freizeitangeboten, Studentenwohnheim, Seniorenresidenz, dezentrale Einkaufsmöglichkeiten, Gewerbe und Gastro. Hierbei ist zwingend ein soziales, ökonomisches und kulturelles Gleichgewicht innerhalb der Wohn- und Gewerbestruktur zu schaffen, sowie die Synergien mit den angrenzenden Stadtteilen Pieschen und Neustadt zu nutzen.\n\nNeben dem Ziel, das gesamte Areal nördlich der Leipziger Straße zügig im Sinne dieses erweiterten Masterplans zu entwickeln, steht die Forderung das gesamte Areal südlich der Leipziger Straße zu einem Natur- und Freizeitpark umzunutzen (Arbeitstitel “Pieschenpark”). Hierzu ist der Flächennutzungsplan entsprechend anzupassen (z.B. Parkanlage/Sondergebiet Freizeit). Die Fläche ist so weit wie möglich zu entsiegeln (Investitionsruine Leipziger 29, Maltesergelände, Gebäude um Bücherbörse), von Straßenbahnführung (Umweltbrücke), Radwegen und Sport- und Freizeitanlagen abgesehen.\n\nDer elbnahe Verlauf des auch überregional bedeutsamen Elberadweges bleibt erhalten. Denkmalgeschützte und historisch wertvolle Bestandsgebäude sind zu erhalten (z.B. Leipziger 27, Hafengebäude). Der Hafen bleibt ein Motorsport- und Anlegehafen. Bestehende gewerbliche Nutzer (Beache, Segway-FunPark) sind erwünscht. Der Freiraum Elbtal ist als Kultur- und Freizeitgelände Teil des Pieschenparks.\n\nZu den bestehenden Angeboten werden Grillflächen, Bouleplätze, Halfpipe, Freibühne und Sportflächen angelegt. Der Umbau erfolgt schrittweise und nachhaltig über mehrere Jahre mit konsequenter Bürgerbeteiligung.','2013-09-17 01:51:00',1,1,1,1,'2013-09-17 02:06:54',NULL,NULL,0,15,''),(50,50,0,'en_US',67,0,'Hafencity und Pieschenpark','Die Neustadtpiraten bekennen sich grundsätzlich zu den Zielen des Masterplans Hafencity mit Wohnbebauung, Büros, Erhalt des Alten Schlachthofs, Schulen, Kitas und Grünzüge mit Verbindungsfunktion (Rad/Fuß: Neustädter Bahnhof bis Elbe, West bis Ost). Wir fordern aber eine Erweiterung des Konzepts auf die Entwicklung hin zu einem voll funktionsfähigen neuen Stadtteil mit Sport- und Freizeitangeboten, Studentenwohnheim, Seniorenresidenz, dezentrale Einkaufsmöglichkeiten, Gewerbe und Gastro. Hierbei ist zwingend ein soziales, ökonomisches und kulturelles Gleichgewicht innerhalb der Wohn- und Gewerbestruktur zu schaffen, sowie die Synergien mit den angrenzenden Stadtteilen Pieschen und Neustadt zu nutzen.\n\nNeben dem Ziel, das gesamte Areal nördlich der Leipziger Straße zügig im Sinne dieses erweiterten Masterplans zu entwickeln, steht die Forderung das gesamte Areal südlich der Leipziger Straße zu einem Natur- und Freizeitpark umzunutzen (Arbeitstitel “Pieschenpark”). Hierzu ist der Flächennutzungsplan entsprechend anzupassen (z.B. Parkanlage/Sondergebiet Freizeit). Die Fläche ist so weit wie möglich zu entsiegeln (Investitionsruine Leipziger 29, Maltesergelände, Gebäude um Bücherbörse), von Straßenbahnführung (Umweltbrücke), Radwegen und Sport- und Freizeitanlagen abgesehen.\n\nDer elbnahe Verlauf des auch überregional bedeutsamen Elberadweges bleibt erhalten. Denkmalgeschützte und historisch wertvolle Bestandsgebäude sind zu erhalten (z.B. Leipziger 27, Hafengebäude). Der Hafen bleibt ein Motorsport- und Anlegehafen. Bestehende gewerbliche Nutzer (Beache, Segway-FunPark) sind erwünscht. Der Freiraum Elbtal ist als Kultur- und Freizeitgelände Teil des Pieschenparks.\n\nZu den bestehenden Angeboten werden Grillflächen, Bouleplätze, Halfpipe, Freibühne und Sportflächen angelegt. Der Umbau erfolgt schrittweise und nachhaltig über mehrere Jahre mit konsequenter Bürgerbeteiligung.','2013-09-17 01:51:00',1,1,1,0,'2013-09-17 02:30:20',NULL,NULL,0,15,''),(51,51,0,'en_US',67,0,'Wächterhäuser','Die Stadt soll aktiv private Wächterhäuserprojekte logistisch und finanziell unterstützen. Insbesondere soll aber auch städtischer Leerstand für Wächterhausprojekte verwendet werden. Beides kann substantiell zur Stärkung der Dresdener Kultur- und Kreativwirtschaft beitragen und historische Bausubstanz für die Zukunft bewahren.','2013-09-17 01:51:00',1,1,1,0,'2013-09-17 02:37:16',NULL,NULL,0,14,''),(52,52,0,'en_US',67,0,'Bunte Republik Neustadt (BRN)','Die Neustadtpiraten bekennen sich zur BRN und wissen um die besondere Bedeutung dieses Stadtteilfestes für die Äußere Neustadt. Wir legen Wert auf Zusammenarbeit mit den örtlichen Bürgerbewegungen (z.B. der Schwafelrunde) und verfolgen das gemeinsame Bemühen um eine positive Entwicklung unseres Stadtteilfests. Wir sind gegen eine fortschreitende Kommerzialisierung und für mehr Beteiligung der Einwohner der Dresdner Neustadt. Das Fest gehört den Neustädtern in ihrer Tradition der unabhängigen Bunten Republik Neustadt.\n\nStrategien hierzu sind kontinuierlich weiterzuentwickeln.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 02:52:48',NULL,NULL,0,14,''),(53,53,0,'en_US',67,0,'Spielplätze','Spielplätze sind wichtig und müssen in gepflegtem Zustand gehalten werden. Dabei setzen wir auf Anwohnerinitiative und Alternativangebote für alle Interessengruppen, zum Beispiel Jugendliche und Hundehalter, statt auf Verbote und Öffnungszeiten.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 02:54:55',NULL,NULL,0,14,''),(54,54,0,'en_US',67,0,'Westerweiterung Alaunplatz','Wir fordern eine zügige Westerweiterung des Alaunplatzes in Richtung “Russensportplatz”. Hierbei ist die Schaffung von Sport- und Freizeitangeboten in Form von öffentlichen und frei zu benutzenden Sportstätten vorzusehen (z.B. Bolzplatz, Basketballplatz, Half-Pipe, Tischtennisplatten, Schach-/Backgammontischen, BMX Hügel, Feuerstelle). Der Park ist zum Benutzen da.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 02:57:49',NULL,NULL,0,15,''),(55,55,0,'en_US',67,0,'Umrüstung der Mülleimer','Wir setzen uns für eine Umrüstung der Mülleimer in der Dresdner Neustadt und im Hechtviertel zu “pfandfreundlichen Mülleimern” ein.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:01:13',NULL,NULL,0,14,''),(56,56,0,'en_US',67,0,'Müääproblematik Alaunpark','Wir fordern dem Problem “Müll auf dem Alaunplatz” nicht mit Strafen und Kontrollen, sondern mit mehr und geeigneten Papierkörben, öfterer Leerung, vermehrter Reinigung des Platzes sowie dem Aufstellen von Müllcontainern zu begegnen. Hierbei begrüßen wir kreative Ideen, welche an die Bereitschaft der Menschen apellieren, ihre Hinterlassenschaften auch zu den Sammelstellen zu bringen.\n\nGrundlage der Diskussion muss die Erkenntnis sein: Viele Menschen erzeugen auch viel Müll, dies ist eine Tatsache und nicht das Problem.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:02:48',NULL,NULL,0,14,''),(57,57,0,'en_US',67,0,'Parkplatzkonzept','Um den Parkdruck im Ortsamtsbereich Dresden Neustadt zu verringern sollen Parkhäuser an der Peripherie geschaffen werden. Innerhalb der Wohnquartiere lehnen wir Parkhäuser ab.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:04:21',NULL,NULL,0,14,''),(58,58,0,'en_US',67,0,'Verkehrsberuhigung durch Fahrradstraßen','Wir fordern die Umwandlung der Alaunstraße, Louisenstraße, Prießnitzstraße, Martin-Luther-Straße, Hechtstraße von Bischofsplatz bis Ecke Buchenstraße, zu Fahrradstraßen mit zugelassenem KfZ-Verkehr.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:06:49',NULL,NULL,0,14,''),(59,59,0,'en_US',67,0,'Verkehrsberuhigung durch verkehrsberuhigte Bereiche','Wir fordern die Umwandlung der Timäus- und Talstraße sowie der Alaunstraße (zwischen Katharinen- und Louisenstraße) zu verkehrsberuhigten Bereichen.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:08:56',NULL,NULL,0,14,''),(60,60,0,'en_US',67,0,'S-Bahn-Haltepunkt Bischofsplatz.','Wir unterstützen die Umgestaltung des Bischofplatzes und den geplanten Neubau eines S-Bahn-Haltepunktes Bischofsplatz. Wir sind gegen einen sterilen Platz zum Aus- und Umsteigen, daher plädieren wir für ein Konzept welches den Bischofsplatz/Ost mit in die Planung einbezieht. Hierbei ist auf eine Steigerung der Aufenthaltsqualität innerhalb einer Gesamtkonzeption (Geschäfte, Cafés, Dienstleistung, Carsharing, Fahrradstationen) explizit Wert zu legen.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:10:24',NULL,NULL,0,14,''),(61,61,0,'en_US',67,0,'DVB-Hochhaus am Albertplatz.','Wir sind für den Erhalt des DVB-Hochhauses am Albertplatz.\n\nUm die Sanierung des DVB-Hochhauses zu sichern, akzeptieren wir die Ansiedlung eines kommerziellen Investors. Die Kaufkraftverschiebungen bezüglich der lokalen Anbieter müssen hierbei jedoch unter 10% liegen. Für das Hochhausgebäude fordern wir jedoch die Nutzung als echtes Bürgerhaus (z.B. Verwaltung, Kita, Bibliothek, Gastro, etc.). Alternativ kann auch die Stadt als Investor fungieren.\n\nSollte nicht zeitnah ein Investor oder ein kommunal finanzierter Verwendungszweck für das DVB-Hochhaus gefunden werden, setzen sich die Neustadtpiraten für eine Sicherung des Objekts durch die Grundstückseigentümer und die Stadt Dresden, sowie eine anschließende Nutzung als Wächterhaus (siehe Positionspapier Wächterhäuser) ein.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:11:47',NULL,NULL,0,14,''),(62,62,0,'en_US',67,0,'Quartier Jägerpark','Wir fordern eine Integration des Gebiets Jägerpark in die städtischen Entwicklungskonzepte.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:12:58',NULL,NULL,0,14,''),(63,63,0,'en_US',67,0,'Quartierbuslinien','Wir forden die Einrichtung von Quartierbussen, die die Stadtteile Äußere Neustadt, Hechtviertel, Preußisches Viertel und das Gebiet um den Jägerpark abdecken. Dies würde die Bereitschaft eine DVB-Dauerkarte zu erstehen erhöhen, den lokalen Einzelhandel stärken, die betreffenden Gebiete vom Verkehr entlasten, und zu einer besseren Anbindung an den (überregionalen) ÖPNV führen.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:14:43',NULL,NULL,0,14,''),(64,64,0,'en_US',67,0,'Ortsbeiräte zu Ortsräten!','Die Neustadtpiraten arbeiten darauf hin, Ortsbeiräten ein besseres Antrags- und Vetorecht bei Stadtratsentscheidungen zu geben.\n\nNotwendig sind bespielsweise ein Vetorecht bei städtebaulichen und Flächennutzungsentscheidungen. Außerdem soll dem Ortsbeirat ein Selbstbefassungsrecht mit eigener Tagesordnung eingeräumt werden; Entscheidungen, die dann mit hoher Mehrheit gefällt werden, sollen zu einer zwingenden Befassung im Stadtrat führen.\n\nDa die Rechte kommunaler Untergliederungen auf Landesebene festgelegt werden, ist eine direkte Umsetzung auf Ortsverbandsebene nicht möglich. Es werden daher Konzepte erarbeitet, diskutiert und öffentlich gemacht, die beispielsweise eine Übernahme von Ortsbeiratsanträgen durch Stadtratsfraktionen ermöglichen oder Ortsbeiratsbeschlüsse bei Verwaltungsentscheidungen mit einbeziehen.','2013-09-17 01:50:00',1,1,1,0,'2013-09-17 03:17:38',NULL,NULL,0,15,''),(65,65,0,'en_US',75,0,'Magneticor Pressure Freight Shipping Tubes','We often hear about a proposed transcontinental/interstate oil pipeline but what about shipping pipes? Starting out of Los Angles, these tubes could rapidly carry goods across vast distances and greatly reduce traffic congestion and oil consumption. Such a system could theoretically run on green power and be propelled by either electro-magnetic tracks or air pressure (like you used to see in banks and large industries).','2013-09-23 13:50:00',1,1,1,1,'2013-09-23 17:14:58',NULL,NULL,0,16,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(66,66,0,'en_US',78,53,'Re-making the old Bay Bridge','Alameda County residents banded crowd-sourced funds to purchase the East   Span of the old Bay Bridge.  The top level is converted into a public park and community agricultural space, and the lower level is converted into community maker spaces, including space to process agricultural products grown on the top level (e.g., grinding grains).','2013-10-01 01:00:00',1,1,1,0,'2013-10-01 03:46:40',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(67,67,0,'en_US',85,0,'25 Future','Best City','2013-10-13 13:52:00',1,1,1,0,'2013-10-13 16:53:55',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(68,68,0,'en_US',92,16,'neighbor-to-neighbor','Burlingame, like most American cities (with a global perspective) is built on a bunch of isolated private houses. Burlingame 2025 would have to be increasingly community focused with neighbor knowing neighbor before any of these maker movements can take off.','2013-10-14 13:33:00',1,1,1,0,'2013-10-14 19:36:37',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(69,69,0,'en_US',91,26,'Maker Philosophers! #hometown','In 2025, Concord citizens will be blending transcendental philosophy with their physical surroundings on a new scale. Makers will be  finding ways to imbue biomaterial with philosophical and ethical tenets. Imagine transcendentalist DRM-like management for Walden Pond!','2013-10-14 13:33:00',1,1,1,1,'2013-10-14 19:38:40',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":1}'),(70,70,0,'en_US',90,0,'Small Town Economies #Hometown','This town is part tourist/part wine country/part local small town/part bohemian.\n\nMany try to make the town vibrant by opening wine bars or gift shops.\n\nI see the future by going up the value chain, and producing products/services that can become cohesive and represent a local feel, and then distributing widely in the area and further afield.\n\nPeople find the area healing and want to contribute, just haven\'t figured out a way community wide to do so.  Many disparate ways people come to be in this area.','2013-10-14 13:33:00',1,1,1,0,'2013-10-14 19:41:57',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(71,71,0,'en_US',86,16,'participatory art installations in Golden Gate park #hometown','Pop up and participatory art installations move from being ad hoc to common and encouraged throughout Golden Gate park and other park areas in San Francisco adding  a sense of both artistry and awe to the city.','2013-10-14 13:25:00',1,1,1,0,'2013-10-14 19:42:33',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":1}'),(72,72,0,'en_US',89,19,'Cowboys Herd in Healthy, Sustainable Food','In the future, America\'s cattle capital will sustainably be able to feed its residents healthy, organic, grass-fed beef. Cowboys use their herding, lassoing, and cattle-ing skills to gather local transport, distribution, and community channels to remake the food system. This new system helps route water to farmers during long summer droughts, increasing the availability of produce as well. Parker County\'s storied history as the center of America\'s cattle industry takes on a new life.','2013-10-14 13:32:00',1,1,1,1,'2013-10-14 19:42:46',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(73,73,0,'en_US',93,0,'Birmingham saves Football #hometown','Chronic traumatic encephalopathy (CTE) rocked the NFL and football at all levels--leading to massive lawsuit payouts and a 50% reduction in kids under 12 playing football. Combining its growing reputation as a medical center with its long history of being \"the football capital of the south,\" people in Birmingham mobilized to \"save football.\" The early results are encouraging, and in fact,an aspiring young scientist from Pelham may have invented a new helmet technology that dramatically reduces brain injury from collision.','2013-10-14 13:33:00',1,1,1,0,'2013-10-14 19:43:30',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":1}'),(74,74,0,'en_US',97,13,'More Alternative Housing #hometown','Makers address the increasing homeless population and find new ways to fund and build sustainable housing','2013-10-14 13:34:00',1,1,1,0,'2013-10-14 19:44:35',NULL,NULL,0,14,'{\"phase\":0,\"rating\":1,\"comments\":1}'),(75,75,0,'en_US',99,32,'Plastic 2025 #hometown','Every home in Portland area has a simple plastic recycling appliance--design competitions to make household furnishings that can be recycled when you\'re tired of them --new family entertainment','2013-10-14 13:35:00',1,1,1,1,'2013-10-14 19:44:38',NULL,NULL,0,14,'{\"phase\":1,\"rating\":2,\"comments\":2}'),(76,76,0,'en_US',95,0,'Transparent Participatory Governance','in 2025, Odessa becomes a pioneer in introducing a new governance system where people use participatory platforms to review, discuss, and vote on all major policy decisions.  The citizens  will be using the App4Gov app (https://www.facebook.com/App4Gov) for making decisions as well as to track elected officials\' voting records, financial backgrounds, contributions, as well as other data.','2013-10-14 13:34:00',1,1,1,0,'2013-10-14 19:44:42',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(77,77,0,'en_US',100,32,'Learning Everywhere #hometown','Outdoor \"classrooms\" abound in 2025 (some with roofs; this is Portland, after all!), along the park blocks and the river you can drop in and interact with interested citizens of all ages, each focused on a different topic.','2013-10-14 13:36:00',1,1,1,0,'2013-10-14 19:46:45',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(78,78,0,'en_US',88,43,'Accredited Maker Schools','Kansas City public schools lost accreditation January 2012. By 2025, we wont be fighting over test scores. Instead, KC will lead the way in maker education - tapping into the awesome arts community, leveraging the speed of google fiber, and empowering kids to shape their own educational journey.','2013-10-14 13:32:00',1,1,1,1,'2013-10-14 19:46:48',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(79,79,0,'en_US',87,53,'Oakland Co-Creates its Identity','In 2025, Oakland opens up all its iconography—city logo, stationary, all official uniforms (police, fire, etc), etc—and allows any Oakland resident to create, collaborate and vote on designs.','2013-10-14 13:40:00',1,1,1,1,'2013-10-14 19:47:30',NULL,NULL,0,14,'{\"phase\":1,\"rating\":2,\"comments\":2}'),(80,80,0,'en_US',73,0,'Rural Coders #hometown','Rural Coders!:  By 2025, the Redding community will be 12 years into a cohort of kids & adults who have learned coding skills (2013-2025). \n\nThis kind of maker learning will take place in traditional educational institutions via Shasta County Office of Education (http://www.shastacoe.org/) and at community-based workshop spaces like BuildItRedding (http://www.builditredding.com/) and CodeItRedding (http://codeitredding.com/).\n\nAs a result, companies based in Redding will be able to seek coding abilities locally.  This will unleash a lot of possibilities for turning ideas of all kinds into action quickly.','2013-10-14 13:34:00',1,1,1,0,'2013-10-14 19:48:50',NULL,NULL,0,14,'{\"phase\":0,\"rating\":1,\"comments\":2}'),(81,81,0,'en_US',90,0,'Flood Plain #Hometown','This town is the last on the Russian River that regularly floods.  The Army Corp of Engineers have chased the problem river long to this 4 mile area.\n\nI envision not fighting nature, and the area being a center for river innovation where living, recreation, and research can take place.\nRivers are affected up stream and cause down stream effects.  It is a linear ecosystem that has commonalities with all other rivers in the world.','2013-10-14 13:33:00',1,1,1,0,'2013-10-14 19:49:28',NULL,NULL,0,14,'{\"phase\":0,\"rating\":1,\"comments\":1}'),(82,82,0,'en_US',79,26,'High School Learning Modules #hometown','Brookline will capitalize on its rich historical past as well as its proximity to world class medical facilities and research centers to enrich elementary through high school education. \nHigh schoolers will spend two years going through 4-month modules in a professional field of their choice--learning real-world skills that are needed to function in an area they are passionate about (i.e. theater is not just acting but stage management, accounting for the theater, sound production, etc) The high school will serve as an open space for classroom learning where students can go to gain skills that will support their out of classroom learning','2013-10-14 13:33:00',1,1,1,0,'2013-10-14 19:50:01',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(83,83,0,'en_US',94,0,'VA Mobile Ready App Adds Citizen Response Rescue Mapping','Local code hackers propose to Governor Bob McDonnell to build-in a feature for a crowdsourced map of citizen volunteers into the current Mobile Ready Map modeled on San Rafael California\'s Fires department map.','2013-10-14 13:34:00',1,1,1,0,'2013-10-14 19:51:48',NULL,NULL,0,14,'{\"phase\":0,\"rating\":1,\"comments\":0}'),(84,84,0,'en_US',101,0,'Toxic Free Future','Makers clean up their neighborhoods, using shells, mushrooms, safe biohacked microbes to clean up superfund sites that riddle Silicon Valley.  The abandoned patches of toxic waste are political hot potatoes, and a barrier to community gardens. But with citizen science to make EPA and city data actionable, and maker labs refining safe ways of purifying the land and water, Silicon Valley could once again become a rich producer of its own food, not just technology!','2013-10-14 13:40:00',1,1,1,0,'2013-10-14 19:52:42',NULL,NULL,0,15,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(85,85,0,'en_US',98,13,'Downtown Remake #hometown','Downtown San Jose will be the new hotspot \"it town\" that will provide more jobs, productive things to do, and new restaurants that use local ingredients, etc. Will be the \"healthy community\" that all towns thrive to be with keeping it\'s historical feel.','2013-10-14 13:51:00',1,1,1,0,'2013-10-14 19:57:10',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(86,86,0,'en_US',53,0,'Urban Farming','In the future, we\'ll have figured out large-scale cost-effective urban hydroponics.  Makers will be responsible for setting up and maintaining networks of systems.','2013-10-22 00:26:00',1,1,1,0,'2013-10-22 00:32:18',NULL,NULL,0,3,'{\"phase\":0,\"rating\":0,\"comments\":1}'),(87,87,0,'en_US',110,0,'City as a Laboratory for the Future','It was said that states would be the \"laboratory of democracy\", but yesterdays state-centric worldview has given way to a city-centric one.\n\nOn the outskirts of a small town, near a large metro area like the Greater Bay Area, a new town is developed where adopting new ways of living and making are the core focus.','2013-10-22 22:35:00',1,1,1,0,'2013-10-22 22:42:31',NULL,NULL,0,9,'{\"phase\":0,\"rating\":1,\"comments\":1}'),(88,88,0,'en_US',111,0,'No Property Left Behind','Detroit is in the last stages of dealing with its currently overwhelming vacancy and blight problem. A decade ago systems were put in place to identify cancerous properties, match them to funding, clean and remediate them, and return them to productive use. Detroit is now the world\'s greatest example of how cities can reinvent themselves through smart technologies, innovative policies, and a maker attitude.','2013-10-22 22:35:00',1,1,1,0,'2013-10-22 22:47:35',NULL,NULL,0,3,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(89,89,0,'en_US',114,13,'Participatory Budgeting','The entire city budget is developed through direct democracy.\n\nThis is an extension of participatory budgeting in use circa 2013 where citizens only decided how a fraction of the city budget was allocated as it pertained to their neighborhood.','2013-10-22 22:40:00',1,1,1,1,'2013-10-22 22:48:02',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(90,90,0,'en_US',109,13,'Near-sourced (mini) City Hall','An opt-in community of city government workers do all their work from a small pilot building near main City Hall.  Everything in this space is made in the Bay Area - it is a living demonstration zone for physical, electronic, and software services.  A small-scale designer in San Francisco designed the tables; a hardware hacker made the computers; a meet-up group is constantly working on open-source permitting software.\n\nThis work can be frustrating.  Not everything works perfectly.  However, the employees who work here volunteered - they wanted new ideas, a different workspace, and/or success for San Jose.\n\nThe services they work on initially are non-auxiliary, and sometimes they overlap.  However, what is incubated here gets transitioned into main City Hall workings.','2013-10-22 22:34:00',1,1,1,0,'2013-10-22 22:53:06',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(91,91,0,'en_US',113,0,'[ freespace ] Eco Art Complex','Cultural Infrastructure to watch the world cup and learn about scrap hacking.','2013-10-22 22:51:00',1,1,1,1,'2013-10-22 22:53:35',NULL,NULL,0,3,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(92,92,0,'en_US',108,21,'Metro system','I want to see Michigan Central Station: \nhttp://en.wikipedia.org/wiki/Michigan_Central_Station\nturn into a center point and hub for a subway/metro system that extends all throughout metro Detroit. \n\nLet\'s help move people around and encourage more biking to and from metro stops. Get fit while supporting the local economy. \n\n+BG','2013-10-22 22:32:00',1,1,1,0,'2013-10-22 22:54:10',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(93,93,0,'en_US',115,0,'Mobile Maker Lab','The mobile maker lab travels through underserved communities in the Central Valley that do not have access to maker labs or techshops.  They expose both children and adults to maker technologies and projects, and in the evenings conduct vocational training for adults in new manufacturing and other in-demand areas.','2013-10-22 22:51:00',1,1,1,0,'2013-10-22 22:55:45',NULL,NULL,0,8,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(94,94,0,'en_US',112,16,'Civic Hacker Plaza','A permanent outdoor maker park and underground indoor facility providing resources and platforms for civic engagement with city soil, data, and everything in between.  Mashing up service models of Recreation and Parks, Libraries, provide labs for participation: gardens, workshops, built environments, analog and digital art installation.','2013-10-22 22:36:00',1,1,1,0,'2013-10-22 22:56:12',NULL,NULL,0,16,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(95,95,0,'en_US',111,0,'Heat, Housing, & Networks For Alaskan Makers','In the past Alaska was known for its rugged, pristine, freezing beauty, but not so much for its makerdom. Over the last 10 years that\'s changed as innovations in heating technology and fabricated structures have allowed more people to innovate in the great north while taking advantage of the cold temperatures for certain kinds of projects. In a surprising turn, a small town called Chicken became the heart of this transformation as its once humble  visitor\'s website, http://www.chickenalaska.com , hatched into a maker social network that overtook Facebook.','2013-10-22 22:36:00',1,1,1,0,'2013-10-22 22:57:16',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(96,96,0,'en_US',114,13,'Share Exchange','Every neighborhood has a place to share, repair, and make what they need for everyday life.','2013-10-22 22:40:00',1,1,1,0,'2013-10-22 22:59:14',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(97,97,0,'en_US',7,18,'Open Maker Science Workshop','COSI opens up a maker workshop to the public. Anyone can prototype their ideas and experiment with science. The museum has an entire exhibition hall of community-created science exhibits.','2013-10-22 22:32:00',1,1,1,0,'2013-10-22 23:02:03',NULL,NULL,0,15,'{\"phase\":0,\"rating\":0,\"comments\":0}'),(98,98,0,'en_US',114,16,'Public Bank','San Francisco banks tax revenues with a city owned bank.  The bank loans to support local businesses and nonprofits.  Interest earnings helps city fund social programs and remain solvent.  Serves as feeder bank to private banks complementing rather than competing with private banks.','2013-10-22 23:09:00',1,1,1,0,'2013-10-22 23:14:36',NULL,NULL,0,14,'{\"phase\":0,\"rating\":0,\"comments\":0}');
/*!40000 ALTER TABLE `incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_category`
--

DROP TABLE IF EXISTS `incident_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `incident_category_ids` (`incident_id`,`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='Stores submitted reports categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_category`
--

LOCK TABLES `incident_category` WRITE;
/*!40000 ALTER TABLE `incident_category` DISABLE KEYS */;
INSERT INTO `incident_category` VALUES (37,37,8),(36,36,21),(39,39,15),(40,40,17),(33,33,8),(41,41,21),(29,29,15),(30,30,8),(38,38,11),(11,11,14),(34,34,18),(35,35,18),(42,42,23),(43,43,9),(46,46,9),(45,45,17),(44,44,23),(31,31,9),(27,27,10),(28,28,9),(22,22,11),(23,23,24),(47,47,8),(48,48,14),(49,49,15),(50,50,23),(51,51,14),(52,52,14),(53,53,11),(54,54,14),(55,55,14),(56,56,14),(57,57,14),(58,58,14),(59,59,14),(60,60,14),(61,61,14),(62,62,14),(63,63,8),(64,64,11),(65,65,9),(66,66,14),(67,67,8),(68,68,14),(69,69,9),(70,70,8),(71,71,14),(72,72,18),(73,73,20),(74,74,8),(75,75,18),(76,76,8),(77,77,23),(78,78,24),(79,79,12),(80,80,23),(81,81,8),(82,82,23),(83,83,8),(84,84,14),(85,85,23),(86,86,17),(87,87,8),(88,88,14),(89,89,12),(90,90,17),(91,91,9),(92,92,8),(93,93,23),(94,94,23),(95,95,14),(96,96,14),(97,97,14),(98,98,8);
/*!40000 ALTER TABLE `incident_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_lang`
--

DROP TABLE IF EXISTS `incident_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_lang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds translations for report titles and descriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_lang`
--

LOCK TABLES `incident_lang` WRITE;
/*!40000 ALTER TABLE `incident_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `incident_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_person`
--

DROP TABLE IF EXISTS `incident_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_person` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `person_first` varchar(200) DEFAULT NULL,
  `person_last` varchar(200) DEFAULT NULL,
  `person_email` varchar(120) DEFAULT NULL,
  `person_phone` varchar(60) DEFAULT NULL,
  `person_ip` varchar(50) DEFAULT NULL,
  `person_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='Holds information provided by people who submit reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_person`
--

LOCK TABLES `incident_person` WRITE;
/*!40000 ALTER TABLE `incident_person` DISABLE KEYS */;
INSERT INTO `incident_person` VALUES (37,38,'','','',NULL,NULL,'2013-08-15 15:18:11'),(38,39,'','','',NULL,NULL,'2013-08-15 15:20:17'),(39,40,'','','',NULL,NULL,'2013-08-15 15:22:29'),(30,31,'','','',NULL,NULL,'2013-07-23 04:19:39'),(27,28,'','','',NULL,NULL,'2013-07-18 19:41:28'),(28,29,'','','',NULL,NULL,'2013-07-19 19:55:03'),(10,11,'','','',NULL,NULL,'2013-06-14 19:53:18'),(32,33,'','','',NULL,NULL,'2013-07-29 13:37:17'),(33,34,'','','',NULL,NULL,'2013-08-01 20:47:32'),(34,35,'','','',NULL,NULL,'2013-08-12 18:44:08'),(35,36,'','','',NULL,NULL,'2013-08-15 14:27:06'),(36,37,'','','',NULL,NULL,'2013-08-15 15:13:02'),(29,30,'','','',NULL,NULL,'2013-07-22 05:25:15'),(26,27,'','','',NULL,NULL,'2013-07-18 19:24:15'),(21,22,'','','',NULL,NULL,'2013-07-08 17:37:32'),(22,23,'','','',NULL,NULL,'2013-07-08 19:06:22'),(40,41,'','','',NULL,NULL,'2013-08-15 15:24:15'),(41,42,'','','',NULL,NULL,'2013-08-15 18:32:01'),(42,43,'','','',NULL,NULL,'2013-08-22 20:36:53'),(43,44,'','','',NULL,NULL,'2013-08-22 22:54:06'),(44,45,'','','',NULL,NULL,'2013-09-11 15:26:27'),(45,46,'','','',NULL,NULL,'2013-09-12 23:34:46'),(46,47,'','','',NULL,NULL,'2013-09-13 14:25:51'),(47,48,'','','',NULL,NULL,'2013-09-13 14:35:01'),(48,49,'','','',NULL,NULL,'2013-09-17 02:06:54'),(49,50,'','','',NULL,NULL,'2013-09-17 02:30:20'),(50,51,'','','',NULL,NULL,'2013-09-17 02:37:16'),(51,52,'','','',NULL,NULL,'2013-09-17 02:52:48'),(52,53,'','','',NULL,NULL,'2013-09-17 02:54:55'),(53,54,'','','',NULL,NULL,'2013-09-17 02:57:49'),(54,55,'','','',NULL,NULL,'2013-09-17 03:01:13'),(55,56,'','','',NULL,NULL,'2013-09-17 03:02:48'),(56,57,'','','',NULL,NULL,'2013-09-17 03:04:21'),(57,58,'','','',NULL,NULL,'2013-09-17 03:06:49'),(58,59,'','','',NULL,NULL,'2013-09-17 03:08:56'),(59,60,'','','',NULL,NULL,'2013-09-17 03:10:24'),(60,61,'','','',NULL,NULL,'2013-09-17 03:11:47'),(61,62,'','','',NULL,NULL,'2013-09-17 03:12:58'),(62,63,'','','',NULL,NULL,'2013-09-17 03:14:43'),(63,64,'','','',NULL,NULL,'2013-09-17 03:17:38'),(64,65,'','','',NULL,NULL,'2013-09-23 17:14:58'),(65,66,'','','',NULL,NULL,'2013-10-01 03:46:40'),(66,67,'','','',NULL,NULL,'2013-10-13 16:53:55'),(67,68,'','','',NULL,NULL,'2013-10-14 19:36:37'),(68,69,'','','',NULL,NULL,'2013-10-14 19:38:40'),(69,70,'','','',NULL,NULL,'2013-10-14 19:41:57'),(70,71,'','','',NULL,NULL,'2013-10-14 19:42:33'),(71,72,'','','',NULL,NULL,'2013-10-14 19:42:48'),(72,73,'','','',NULL,NULL,'2013-10-14 19:43:30'),(73,74,'','','',NULL,NULL,'2013-10-14 19:44:35'),(74,75,'','','',NULL,NULL,'2013-10-14 19:44:38'),(75,76,'','','',NULL,NULL,'2013-10-14 19:44:42'),(76,77,'','','',NULL,NULL,'2013-10-14 19:46:46'),(77,78,'','','',NULL,NULL,'2013-10-14 19:46:48'),(78,79,'','','',NULL,NULL,'2013-10-14 19:47:30'),(79,80,'','','',NULL,NULL,'2013-10-14 19:48:50'),(80,81,'','','',NULL,NULL,'2013-10-14 19:49:28'),(81,82,'','','',NULL,NULL,'2013-10-14 19:50:01'),(82,83,'','','',NULL,NULL,'2013-10-14 19:51:48'),(83,84,'','','',NULL,NULL,'2013-10-14 19:52:42'),(84,85,'','','',NULL,NULL,'2013-10-14 19:57:11'),(85,86,'','','',NULL,NULL,'2013-10-22 00:32:18'),(86,87,'','','',NULL,NULL,'2013-10-22 22:42:31'),(87,88,'','','',NULL,NULL,'2013-10-22 22:47:37'),(88,89,'','','',NULL,NULL,'2013-10-22 22:48:02'),(89,90,'','','',NULL,NULL,'2013-10-22 22:53:06'),(90,91,'','','',NULL,NULL,'2013-10-22 22:53:35'),(91,92,'','','',NULL,NULL,'2013-10-22 22:54:10'),(92,93,'','','',NULL,NULL,'2013-10-22 22:55:45'),(93,94,'','','',NULL,NULL,'2013-10-22 22:56:12'),(94,95,'','','',NULL,NULL,'2013-10-22 22:57:17'),(95,96,'','','',NULL,NULL,'2013-10-22 22:59:14'),(96,97,'','','',NULL,NULL,'2013-10-22 23:02:03'),(97,98,'','','',NULL,NULL,'2013-10-22 23:14:36');
/*!40000 ALTER TABLE `incident_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layer`
--

DROP TABLE IF EXISTS `layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layer_name` varchar(255) DEFAULT NULL,
  `layer_url` varchar(255) DEFAULT NULL,
  `layer_file` varchar(100) DEFAULT NULL,
  `layer_color` varchar(20) DEFAULT NULL,
  `layer_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds static layer information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layer`
--

LOCK TABLES `layer` WRITE;
/*!40000 ALTER TABLE `layer` DISABLE KEYS */;
/*!40000 ALTER TABLE `layer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_title` varchar(200) DEFAULT NULL,
  `level_description` varchar(200) DEFAULT NULL,
  `level_weight` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Stores level of trust assigned to reporters of the platform';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'SPAM + Delete','SPAM + Delete',-2),(2,'SPAM','SPAM',-1),(3,'Untrusted','Untrusted',0),(4,'Trusted','Trusted',1),(5,'Trusted + Verify','Trusted + Verify',2);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `location_visible` tinyint(4) NOT NULL DEFAULT '1',
  `location_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='Stores location information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (45,'Madeira, Portugal',184,32.760707,-16.959472,1,'2013-09-11 15:26:27'),(41,'Rome, GA, USA',231,34.257038,-85.164673,1,'2013-08-15 15:24:15'),(42,'Rome, GA, USA',231,34.257038,-85.164673,1,'2013-08-15 18:32:01'),(43,'Kansas City, MO, USA',231,39.099727,-94.578567,1,'2013-08-22 20:36:53'),(44,'No Address',231,38.479395,-100.634766,1,'2013-08-22 22:54:06'),(33,'Chattanooga, TN, USA',231,35.04563,-85.30968,1,'2013-07-29 13:37:17'),(34,'No Address',0,38.475179,-100.632341,1,'2013-08-01 20:47:31'),(29,'851 North Pearl Street, Columbus, OH 43215, USA',231,39.979726,-83.003301,1,'2013-07-19 19:55:03'),(30,'No Address',231,37.09024,-95.712891,1,'2013-07-22 05:25:15'),(11,'Mumbai, Maharashtra, India',105,19.075984,72.877656,1,'2013-06-14 19:53:18'),(35,'West Hartford, CT, USA',231,41.762084,-72.742015,1,'2013-08-12 18:44:08'),(36,'Rome, GA, USA',231,34.257038,-85.164673,1,'2013-08-15 14:27:06'),(37,'Rome, GA, USA',231,34.257038,-85.164673,1,'2013-08-15 15:13:02'),(38,'Rome, GA, USA',231,34.257038,-85.164673,1,'2013-08-15 15:18:11'),(39,'Rome, GA, USA',231,34.257038,-85.164673,1,'2013-08-15 15:20:17'),(40,'Rome, GA, USA',231,34.257038,-85.164673,1,'2013-08-15 15:22:29'),(31,'Columbus, OH, USA',231,39.961176,-82.998794,1,'2013-07-23 04:19:38'),(27,'San Francisco – Oakland Bay Bridge, Oakland, CA 94607, USA',231,37.820044,-122.341198,1,'2013-07-18 19:24:14'),(28,'Norman, OK, USA',231,35.222567,-97.439478,1,'2013-07-18 19:41:28'),(22,'Treasure Island, San Francisco, CA, USA',231,37.822936,-122.370261,1,'2013-07-08 17:37:32'),(23,'Treasure Island, San Francisco, CA, USA',231,37.822936,-122.370261,1,'2013-07-08 19:06:22'),(46,'124 University Avenue, Palo Alto, CA 94301, USA',231,37.443715,-122.163195,1,'2013-09-12 23:34:46'),(47,'No Address',231,38.479395,-100.634766,1,'2013-09-13 14:25:51'),(48,'South Country Village Drive, Oregon City, OR 97045, USA',231,45.342529,-122.563443,1,'2013-09-13 14:35:01'),(49,'Dresden, Germany',57,51.050409,13.737262,1,'2013-09-17 02:06:54'),(50,'Dresden, Germany',0,51.067078,13.730911,1,'2013-09-17 02:30:20'),(51,'Dresden, Germany',0,51.047495,13.740781,1,'2013-09-17 02:37:16'),(52,'Dresden, Germany',0,51.066485,13.757175,1,'2013-09-17 02:52:48'),(53,'Dresden, Germany',0,51.047333,13.740953,1,'2013-09-17 02:54:55'),(54,'Dresden, Germany',0,51.072148,13.754042,1,'2013-09-17 02:57:49'),(55,'Dresden, Germany',0,51.047171,13.740609,1,'2013-09-17 03:01:13'),(56,'Dresden, Germany',0,51.070368,13.75769,1,'2013-09-17 03:02:48'),(57,'Dresden, Germany',0,51.047279,13.740781,1,'2013-09-17 03:04:21'),(58,'Dresden, Germany',0,51.065892,13.752025,1,'2013-09-17 03:06:49'),(59,'Dresden, Germany',0,51.065892,13.752025,1,'2013-09-17 03:08:56'),(60,'Dresden, Germany',0,51.071393,13.748592,1,'2013-09-17 03:10:24'),(61,'Dresden, Germany',0,51.06368,13.746703,1,'2013-09-17 03:11:47'),(62,'Dresden, Germany',0,51.07258,13.788417,1,'2013-09-17 03:12:58'),(63,'Dresden, Germany',0,51.06217,13.746618,1,'2013-09-17 03:14:43'),(64,'Dresden, Germany',0,51.047657,13.740524,1,'2013-09-17 03:17:38'),(65,'No Address',231,38.487457,-100.655537,1,'2013-09-23 17:14:58'),(66,'Oakland, CA, USA',231,37.804364,-122.271114,1,'2013-10-01 03:46:40'),(67,'Hamilton, ON, Canada',38,43.250021,-79.866091,1,'2013-10-13 16:53:55'),(68,'Burlingame, CA, USA',231,37.584103,-122.366083,1,'2013-10-14 19:36:37'),(69,'Concord, MA, USA',231,42.460372,-71.348948,1,'2013-10-14 19:38:40'),(70,'Monte Rio, CA, USA',231,38.465469,-123.008889,1,'2013-10-14 19:41:57'),(71,'San Francisco, CA, USA',231,37.774929,-122.419415,1,'2013-10-14 19:42:33'),(72,'Weatherford, TX, USA',231,32.759296,-97.797254,1,'2013-10-14 19:42:46'),(73,'No Address',231,38.479395,-100.634766,1,'2013-10-14 19:43:30'),(74,'Palo Alto, CA, USA',231,37.441883,-122.143019,1,'2013-10-14 19:44:35'),(75,'Lake Oswego, OR 97035, USA',231,45.413914,-122.720123,1,'2013-10-14 19:44:38'),(76,'Odesa, Odessa Oblast, Ukraine',228,46.484583,30.7326,1,'2013-10-14 19:44:42'),(77,'Portland, OR, USA',231,45.523452,-122.676207,1,'2013-10-14 19:46:45'),(78,'Kansas City, MO, USA',231,39.099727,-94.578567,1,'2013-10-14 19:46:48'),(79,'Oakland, CA, USA',231,37.804364,-122.271114,1,'2013-10-14 19:47:30'),(80,'Redding, CA, USA',231,40.58654,-122.391675,1,'2013-10-14 19:48:50'),(81,'Monte Rio, CA, USA',231,38.465469,-123.008889,1,'2013-10-14 19:49:28'),(82,'Brookline, MA 02446, USA',231,42.34216,-71.124056,1,'2013-10-14 19:50:01'),(83,'Richmond, VA, USA',231,37.540725,-77.436048,1,'2013-10-14 19:51:48'),(84,'No Address',231,38.479395,-100.634766,1,'2013-10-14 19:52:42'),(85,'San Jose, CA, USA',231,37.339386,-121.894955,1,'2013-10-14 19:57:10'),(86,'No Address',231,38.479395,-100.634766,1,'2013-10-22 00:32:18'),(87,'Hollister, CA, USA',231,36.852455,-121.401602,1,'2013-10-22 22:42:31'),(88,'No Address',231,38.479395,-100.634766,1,'2013-10-22 22:47:35'),(89,'Mountain View, CA, USA',231,37.386052,-122.083851,1,'2013-10-22 22:48:02'),(90,'San Jose, CA, USA',231,37.339386,-121.894955,1,'2013-10-22 22:53:06'),(91,'No Address',231,38.479395,-100.634766,1,'2013-10-22 22:53:35'),(92,'2405 West Vernor Highway, Detroit, MI 48216, USA',231,42.329631,-83.078096,1,'2013-10-22 22:54:10'),(93,'No Address',231,38.432077,-100.838013,1,'2013-10-22 22:55:45'),(94,'Civic Center Plaza, San Francisco, CA 94102, USA',231,37.779498,-122.417615,1,'2013-10-22 22:56:12'),(95,'No Address',231,38.479395,-100.634766,1,'2013-10-22 22:57:16'),(96,'Mountain View, CA, USA',231,37.386052,-122.083851,1,'2013-10-22 22:59:14'),(97,'333 West Broad Street, Columbus, OH 43215, USA',231,39.960391,-83.005866,1,'2013-10-22 23:02:03'),(98,'San Francisco, CA, USA',231,37.774929,-122.419415,1,'2013-10-22 23:14:36');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance` (
  `allowed_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`allowed_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Puts a site in maintenance mode if data exists in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `checkin_id` bigint(20) unsigned DEFAULT NULL,
  `message_id` bigint(20) unsigned DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `media_type` tinyint(4) DEFAULT NULL COMMENT '1 - IMAGES, 2 - VIDEO, 3 - AUDIO, 4 - NEWS, 5 - PODCAST',
  `media_title` varchar(255) DEFAULT NULL,
  `media_description` longtext,
  `media_link` varchar(255) DEFAULT NULL,
  `media_medium` varchar(255) DEFAULT NULL,
  `media_thumb` varchar(255) DEFAULT NULL,
  `media_date` datetime DEFAULT NULL,
  `media_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`),
  KEY `checkin_id` (`checkin_id`),
  KEY `badge_id` (`badge_id`),
  KEY `message_id` (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='Stores any media submitted along with a report/checkin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'default_map_all_1370915446.png','default_map_all_1370915446_m.png','default_map_all_1370915446_t.png','2013-06-11 01:50:46',1),(16,35,35,NULL,NULL,NULL,4,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Suburbia_by_David_Shankbone.jpg/275px-Suburbia_by_David_Shankbone.jpg',NULL,NULL,'2013-08-12 18:44:08',1),(15,34,34,NULL,NULL,NULL,1,NULL,NULL,'34_1_1375390051.jpg','34_1_1375390051_m.jpg','34_1_1375390051_t.jpg','2013-08-01 20:47:32',1),(13,31,31,NULL,NULL,NULL,1,NULL,NULL,'31_1_1374553178.png','31_1_1374553178_m.png','31_1_1374553178_t.png','2013-07-23 04:19:39',1),(14,34,34,NULL,NULL,NULL,2,NULL,NULL,'http://www.youtube.com/watch?v=Kv3KpuQn-Wc',NULL,NULL,'2013-08-01 20:47:31',1),(12,27,27,NULL,NULL,NULL,1,NULL,NULL,'27_1_1374175454.png','27_1_1374175454_m.png','27_1_1374175454_t.png','2013-07-18 19:24:15',1),(8,22,22,NULL,NULL,NULL,1,NULL,NULL,'22_1_1373305052.JPG','22_1_1373305052_m.JPG','22_1_1373305052_t.JPG','2013-07-08 17:37:32',1),(9,23,23,NULL,NULL,NULL,2,NULL,NULL,'http://www.youtube.com/watch?v=2wGMjRJpLCA',NULL,NULL,'2013-07-08 19:06:22',1),(17,36,36,NULL,NULL,NULL,4,NULL,NULL,'http://crowdfiber.com/campaigns/gignet-historic-downtown',NULL,NULL,'2013-08-15 14:27:06',1),(18,36,36,NULL,NULL,NULL,2,NULL,NULL,'https://vimeo.com/58751424',NULL,NULL,'2013-08-15 14:27:06',1),(19,36,36,NULL,NULL,NULL,1,NULL,NULL,'36_1_1376576826.JPG','36_1_1376576826_m.JPG','36_1_1376576826_t.JPG','2013-08-15 14:27:06',1),(20,37,37,NULL,NULL,NULL,4,NULL,NULL,'http://blog.crowdfiber.com/blog/bid/303240/Broadband-Bazaar-The-Inspiration-for-CrowdFiber',NULL,NULL,'2013-08-15 15:13:02',1),(21,37,37,NULL,NULL,NULL,1,NULL,NULL,'37_1_1376579582.JPG','37_1_1376579582_m.JPG','37_1_1376579582_t.JPG','2013-08-15 15:13:02',1),(22,38,38,NULL,NULL,NULL,4,NULL,NULL,'http://www.brainpickings.org/index.php/2012/09/18/steven-johnson-future-perfect/',NULL,NULL,'2013-08-15 15:18:11',1),(23,40,40,NULL,NULL,NULL,4,NULL,NULL,'http://www.makervillage.org',NULL,NULL,'2013-08-15 15:22:29',1),(24,41,41,NULL,NULL,NULL,4,NULL,NULL,'http://www.techradar.com/us/news/portable-devices/rise-of-the-body-hackers-google-the-wearable-web-and-transhumanism-1150803',NULL,NULL,'2013-08-15 15:24:15',1),(25,42,42,NULL,NULL,NULL,2,NULL,NULL,'http://www.youtube.com/watch?v=h11u3vtcpaY',NULL,NULL,'2013-08-15 18:32:01',1),(26,47,47,NULL,NULL,NULL,4,NULL,NULL,'http://www.completestreetskakaako.com/',NULL,NULL,'2013-09-13 14:25:51',1),(27,47,47,NULL,NULL,NULL,4,NULL,NULL,'http://www.interislandterminal.org/rd/',NULL,NULL,'2013-09-13 14:25:51',1),(28,48,48,NULL,NULL,NULL,4,NULL,NULL,'http://www.interislandterminal.org/',NULL,NULL,'2013-09-13 14:35:01',1),(29,48,48,NULL,NULL,NULL,4,NULL,NULL,'http://www.completestreetskakaako.com/',NULL,NULL,'2013-09-13 14:35:01',1),(30,49,49,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/programm/#stadtentwicklung',NULL,NULL,'2013-09-17 02:06:54',1),(31,50,50,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/programm/#stadtentwicklung',NULL,NULL,'2013-09-17 02:30:20',1),(32,50,50,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/pieschenpark-statt-hafencity-graffiti-und-streetart-als-kunstform/',NULL,NULL,'2013-09-17 02:30:20',1),(33,51,51,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#kultur',NULL,NULL,'2013-09-17 02:37:16',1),(34,51,51,NULL,NULL,NULL,4,NULL,NULL,'http://www.haushalten-dresden.de',NULL,NULL,'2013-09-17 02:37:16',1),(35,52,52,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#kultur',NULL,NULL,'2013-09-17 02:52:48',1),(36,53,53,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#kinder',NULL,NULL,'2013-09-17 02:54:55',1),(37,54,54,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#kinder',NULL,NULL,'2013-09-17 02:57:49',1),(38,55,55,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#umwelt',NULL,NULL,'2013-09-17 03:01:13',1),(39,56,56,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#umwelt',NULL,NULL,'2013-09-17 03:02:48',1),(40,57,57,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#bauen',NULL,NULL,'2013-09-17 03:04:21',1),(41,58,58,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#bauen',NULL,NULL,'2013-09-17 03:06:49',1),(42,59,59,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#bauen',NULL,NULL,'2013-09-17 03:08:56',1),(43,60,60,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#bauen',NULL,NULL,'2013-09-17 03:10:24',1),(44,61,61,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#bauen',NULL,NULL,'2013-09-17 03:11:47',1),(45,62,62,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#bauen',NULL,NULL,'2013-09-17 03:12:58',1),(46,63,63,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#bauen',NULL,NULL,'2013-09-17 03:14:43',1),(47,64,64,NULL,NULL,NULL,4,NULL,NULL,'http://www.neustadtpiraten.de/positionspapiere/#politik',NULL,NULL,'2013-09-17 03:17:38',1),(48,66,66,NULL,NULL,NULL,4,NULL,NULL,'http://www.thehighline.org/',NULL,NULL,'2013-10-01 03:46:40',1),(49,72,72,NULL,NULL,NULL,1,NULL,NULL,'72_1_1381779766.png','72_1_1381779766_m.png','72_1_1381779766_t.png','2013-10-14 19:42:48',1),(50,77,77,NULL,NULL,NULL,4,NULL,NULL,'http://lerablog.org/home-and-family/school-education/extend-your-classroom-into-a-natural-world/',NULL,NULL,'2013-10-14 19:46:45',1),(51,77,77,NULL,NULL,NULL,1,NULL,NULL,'77_1_1381780005.jpg','77_1_1381780005_m.jpg','77_1_1381780005_t.jpg','2013-10-14 19:46:46',1),(52,80,80,NULL,NULL,NULL,4,NULL,NULL,'http://www.shastacoe.org/',NULL,NULL,'2013-10-14 19:48:50',1),(53,80,80,NULL,NULL,NULL,4,NULL,NULL,'http://www.builditredding.com/',NULL,NULL,'2013-10-14 19:48:50',1),(54,80,80,NULL,NULL,NULL,4,NULL,NULL,'http://codeitredding.com/',NULL,NULL,'2013-10-14 19:48:50',1),(55,83,83,NULL,NULL,NULL,4,NULL,NULL,'http://www.vaemergency.gov/news/news-releases/2013/mobile-app-ready',NULL,NULL,'2013-10-14 19:51:48',1),(56,83,83,NULL,NULL,NULL,2,NULL,NULL,'http://vimeo.com/19139695',NULL,NULL,'2013-10-14 19:51:48',1),(57,84,84,NULL,NULL,NULL,4,NULL,NULL,'http://www.realitysandwich.com/intelligence_mushrooms_environmental_restoration',NULL,NULL,'2013-10-14 19:52:42',1),(58,85,85,NULL,NULL,NULL,1,NULL,NULL,'85_1_1381780630.jpg','85_1_1381780630_m.jpg','85_1_1381780630_t.jpg','2013-10-14 19:57:11',1),(59,86,86,NULL,NULL,NULL,4,NULL,NULL,'http://www.gardening-tips-idea.com/images/hydropnicvegetable.jpg',NULL,NULL,'2013-10-22 00:32:18',1),(60,88,88,NULL,NULL,NULL,1,NULL,NULL,'88_1_1382482055.png','88_1_1382482055_m.png','88_1_1382482055_t.png','2013-10-22 22:47:37',1),(61,89,89,NULL,NULL,NULL,1,NULL,NULL,'89_1_1382482082.jpg','89_1_1382482082_m.jpg','89_1_1382482082_t.jpg','2013-10-22 22:48:02',1),(62,91,91,NULL,NULL,NULL,4,NULL,NULL,'http://i2.cdn.turner.com/cnn/dam/assets/130517103133-eco-art-ruganzu-bruno-park-horizontal-gallery.jpg',NULL,NULL,'2013-10-22 22:53:35',1),(63,92,92,NULL,NULL,NULL,4,NULL,NULL,'http://en.wikipedia.org/wiki/Michigan_Central_Station',NULL,NULL,'2013-10-22 22:54:10',1),(64,92,92,NULL,NULL,NULL,1,NULL,NULL,'92_1_1382482450jpeg','92_1_1382482450_mjpeg','92_1_1382482450_tjpeg','2013-10-22 22:54:10',1),(65,95,95,NULL,NULL,NULL,1,NULL,NULL,'95_1_1382482636.gif','95_1_1382482636_m.gif','95_1_1382482636_t.gif','2013-10-22 22:57:17',1),(66,96,96,NULL,NULL,NULL,1,NULL,NULL,'96_1_1382482754.jpg','96_1_1382482754_m.jpg','96_1_1382482754_t.jpg','2013-10-22 22:59:14',1),(67,97,97,NULL,NULL,NULL,4,NULL,NULL,'http://static.panoramio.com/photos/large/24377107.jpg',NULL,NULL,'2013-10-22 23:02:03',1),(68,98,98,NULL,NULL,NULL,1,NULL,NULL,'98_1_1382483676.jpg','98_1_1382483676_m.jpg','98_1_1382483676_t.jpg','2013-10-22 23:14:36',1);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT '0',
  `user_id` int(11) unsigned DEFAULT '0',
  `reporter_id` bigint(20) unsigned DEFAULT NULL,
  `service_messageid` varchar(100) DEFAULT NULL,
  `message_from` varchar(100) DEFAULT NULL,
  `message_to` varchar(100) DEFAULT NULL,
  `message` text,
  `message_detail` text,
  `message_type` tinyint(4) DEFAULT '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin), 3 - DELETED',
  `message_date` datetime DEFAULT NULL,
  `message_level` tinyint(4) DEFAULT '0' COMMENT '0 - UNREAD, 1 - READ, 99 - SPAM',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `reporter_id` (`reporter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores tweets, emails and SMS messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openid`
--

DROP TABLE IF EXISTS `openid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL,
  `openid_email` varchar(127) NOT NULL,
  `openid_server` varchar(255) NOT NULL,
  `openid_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Stores usersâ€™ openid information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openid`
--

LOCK TABLES `openid` WRITE;
/*!40000 ALTER TABLE `openid` DISABLE KEYS */;
INSERT INTO `openid` VALUES (1,5,'https://www.google.com/accounts/o8/id?id=AItOawk0L_Z-6wXWW2STtP9uevUGIc0cwW6DjrQ','NWeidinger@iftf.org','https://www.google.com/accounts/o8/ud','2013-07-08 17:17:48'),(2,6,'https://www.google.com/accounts/o8/id?id=AItOawl_Efh69wb-ejJA6w6NzNtCaG4-uIivU90','dr.weidinger@gmail.com','https://www.google.com/accounts/o8/ud','2013-07-08 17:47:40'),(3,24,'facebook_1012902509','rachel.weidinger@gmail.com','http://www.facebook.com','2013-07-21 19:34:06'),(4,26,'facebook_53200209','black_nekura_angel@yahoo.com','http://www.facebook.com','2013-07-23 04:31:06'),(5,27,'facebook_100000190320374','necrophilia@gmail.com','http://www.facebook.com','2013-07-24 07:04:55'),(6,40,'facebook_659059947','mhjensen@hotmail.com','http://www.facebook.com','2013-08-01 00:32:33'),(7,47,'http://TevoD.myopenid.com/','steve@enived.com','http://www.myopenid.com/server','2013-08-15 14:43:34'),(8,50,'https://www.google.com/accounts/o8/id?id=AItOawlqmZvc4UJ_h8bqzIfpFwKq_qI5nOEGYH0','khushboo.balwani9@gmail.com','https://www.google.com/accounts/o8/ud','2013-08-17 21:15:07'),(9,51,'https://www.google.com/accounts/o8/id?id=AItOawk5eNNltW29AbLyLkNykwQoLqV-ne_4T6U','beemedha@gmail.com','https://www.google.com/accounts/o8/ud','2013-08-20 18:15:21'),(10,55,'facebook_808304605','jaramarie@gmx.de','http://www.facebook.com','2013-08-23 19:06:57'),(11,60,'facebook_1851806900','catia.jardim@gmail.com','http://www.facebook.com','2013-08-29 09:14:08'),(12,62,'facebook_732886596','parada82@gmail.com','http://www.facebook.com','2013-09-01 18:47:57'),(13,67,'https://www.google.com/accounts/o8/id?id=AItOawnXrHNfmTdhRgFqfW3ke2IHYqNILpRFUxc','piratenspacko@gmail.com','https://www.google.com/accounts/o8/ud','2013-09-17 01:51:30'),(14,69,'facebook_502339535','digitalbuddha@gmail.com','http://www.facebook.com','2013-09-17 03:54:43'),(15,71,'https://www.google.com/accounts/o8/id?id=AItOawkUeim-TPf1wV0Y-bQK2bCv7KSwQ2I-TMo','eazel7@gmail.com','https://www.google.com/accounts/o8/ud','2013-09-17 13:10:15'),(16,72,'facebook_734312195','jcamachor@yahoo.com','http://www.facebook.com','2013-09-17 15:49:07'),(17,80,'facebook_100001473988035','beachinswim@aol.com','http://www.facebook.com','2013-10-03 21:40:15'),(18,81,'facebook_1089103508','czajnikowski@gmail.com','http://www.facebook.com','2013-10-07 21:49:36'),(19,89,'facebook_8300728','rebeccachesney@gmail.com','http://www.facebook.com','2013-10-14 19:32:40'),(20,107,'facebook_100000482090415','wribeiro.gpp@gmail.com','http://www.facebook.com','2013-10-22 20:34:55'),(21,113,'facebook_502953015','michaelpzuckerman@yahoo.com','http://www.facebook.com','2013-10-22 22:36:44'),(22,114,'facebook_660946192','gorenflo@gmail.com','http://www.facebook.com','2013-10-22 22:40:01'),(23,117,'https://www.google.com/accounts/o8/id?id=AItOawlTz1_rOFk_BVW_3jJQ-TK0-YFDN1mjLj0','sabrina.dominguez@gmail.com','https://www.google.com/accounts/o8/ud','2013-10-22 23:41:26');
/*!40000 ALTER TABLE `openid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `page_description` longtext,
  `page_tab` varchar(100) NOT NULL,
  `page_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores user created pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'Help','<div class=\"work section\">\n<h1><!--?php echo Kohana::lang(\'makercities.modal.make_the_future\'); ?--></h1>\n<div class=\"icon work-imagine\"><b>Imagine</b> an idea for your city in 2023 and plot it on the Maker Cities map.</div>\n<div class=\"icon work-support\">Other players will give you <b>constructive feedback</b> about how to make your idea happen!</div>\n<div class=\"icon work-make\">Once you get enough feedback, <b>MAKE</b> and share something to demonstrate your indea to get people excited about talking!</div>\n<div class=\"icon work-points\">Engage in <b>weekly challenges</b> about the future of transportation, health, and other exciting topics!</div>\n<div class=\"no-icon work-start\"><b>START</b> by exploring the map, Get inspired by ideas that other players have added!</div>\n</div>','help',0);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='Stores permissions used for access control';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'reports_view'),(2,'reports_edit'),(4,'reports_comments'),(5,'reports_download'),(6,'reports_upload'),(7,'messages'),(8,'messages_reporters'),(9,'stats'),(10,'settings'),(11,'manage'),(12,'users'),(13,'manage_roles'),(14,'checkin'),(15,'checkin_admin'),(16,'reports_verify'),(17,'reports_approve'),(18,'admin_ui'),(19,'member_ui');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_roles` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores permissions assigned to roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_roles`
--

LOCK TABLES `permissions_roles` WRITE;
/*!40000 ALTER TABLE `permissions_roles` DISABLE KEYS */;
INSERT INTO `permissions_roles` VALUES (1,14),(2,1),(2,2),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,14),(2,15),(2,16),(2,17),(2,18),(3,1),(3,2),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(4,19);
/*!40000 ALTER TABLE `permissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(100) NOT NULL,
  `plugin_url` varchar(250) DEFAULT NULL,
  `plugin_description` text,
  `plugin_priority` tinyint(4) DEFAULT '0',
  `plugin_active` tinyint(4) DEFAULT '0',
  `plugin_installed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_name` (`plugin_name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Holds a list of all plugins installed on a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
INSERT INTO `plugin` VALUES (1,'frontlinesms',NULL,NULL,0,0,0),(2,'smssync',NULL,NULL,0,0,0),(3,'viddler',NULL,NULL,0,0,0),(4,'clickatell',NULL,NULL,0,0,0),(5,'sharing',NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_message`
--

DROP TABLE IF EXISTS `private_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `from_user_id` int(11) DEFAULT '0',
  `private_subject` varchar(255) NOT NULL,
  `private_message` text NOT NULL,
  `private_message_date` datetime NOT NULL,
  `private_message_new` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores private messages sent between Members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_message`
--

LOCK TABLES `private_message` WRITE;
/*!40000 ALTER TABLE `private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `private_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `rating` tinyint(4) DEFAULT '0',
  `rating_ip` varchar(100) DEFAULT NULL,
  `rating_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='Stores credibility ratings for reports and comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (19,44,29,NULL,1,'207.47.0.147','2013-08-12 21:26:04'),(18,44,23,NULL,1,'50.78.109.177','2013-08-12 21:20:39'),(14,32,27,NULL,1,'69.15.225.233','2013-07-25 19:54:39'),(15,33,27,NULL,1,'50.78.109.177','2013-07-25 20:21:29'),(17,44,23,NULL,1,'50.78.109.177','2013-08-12 21:20:39'),(16,44,27,NULL,1,'50.78.109.177','2013-08-12 21:17:07'),(9,6,22,NULL,1,'69.181.40.233','2013-07-08 18:21:38'),(12,25,29,NULL,1,'108.213.214.36','2013-07-23 04:20:35'),(13,2,31,NULL,1,'76.122.68.215','2013-07-25 04:15:35'),(20,44,28,NULL,1,'50.78.109.177','2013-08-12 21:30:27'),(21,47,36,NULL,1,'70.89.254.61','2013-08-15 14:44:03'),(22,48,36,NULL,1,'71.226.108.29','2013-08-15 14:55:11'),(23,49,40,NULL,1,'208.93.35.114','2013-08-15 17:08:10'),(24,49,37,NULL,1,'208.93.35.114','2013-08-15 17:08:37'),(25,49,38,NULL,1,'208.93.35.114','2013-08-15 17:08:47'),(26,49,36,NULL,1,'208.93.35.114','2013-08-15 17:08:55'),(27,49,39,NULL,1,'208.93.35.114','2013-08-15 17:09:08'),(28,49,41,NULL,1,'208.93.35.114','2013-08-15 17:09:34'),(29,49,35,NULL,1,'208.93.35.114','2013-08-15 17:10:10'),(30,44,31,NULL,1,'50.78.109.177','2013-08-21 21:47:40'),(31,7,35,NULL,1,'207.47.0.147','2013-08-21 21:52:19'),(32,3,43,NULL,1,'50.78.109.177','2013-08-22 20:41:09'),(33,3,27,NULL,1,'50.78.109.177','2013-08-22 20:42:49'),(34,3,34,NULL,1,'50.78.109.177','2013-08-22 21:01:47'),(35,53,35,NULL,1,'207.47.0.147','2013-08-22 22:28:37'),(36,53,43,NULL,1,'207.47.0.147','2013-08-22 22:30:00'),(37,53,28,NULL,1,'50.78.109.177','2013-08-22 23:25:26'),(38,53,41,NULL,1,'71.6.85.211','2013-08-27 18:02:12'),(39,4,42,NULL,1,'50.78.109.177','2013-09-12 23:15:40'),(40,2,46,NULL,1,'76.122.68.215','2013-09-16 22:54:53'),(41,66,46,NULL,1,'83.163.91.136','2013-09-16 23:25:30'),(42,68,50,NULL,1,'78.53.83.190','2013-09-17 03:38:32'),(43,68,49,NULL,1,'78.53.83.190','2013-09-17 03:40:03'),(44,68,51,NULL,1,'78.53.83.190','2013-09-17 03:40:26'),(45,68,52,NULL,1,'78.53.83.190','2013-09-17 03:40:39'),(46,68,53,NULL,1,'78.53.83.190','2013-09-17 03:40:55'),(47,70,49,NULL,1,'77.182.29.188','2013-09-17 12:50:43'),(48,75,34,NULL,1,'64.183.97.70','2013-09-23 17:19:11'),(49,2,65,NULL,1,'76.122.68.215','2013-09-23 20:54:27'),(50,78,46,NULL,1,'72.129.87.55','2013-10-01 03:35:46'),(51,78,65,NULL,1,'72.129.87.55','2013-10-01 03:55:08'),(52,7,39,NULL,1,'67.188.43.90','2013-10-11 22:42:25'),(53,7,68,NULL,1,'50.78.109.177','2013-10-14 19:37:10'),(54,7,66,NULL,1,'71.6.85.211','2013-10-14 19:38:41'),(55,53,69,NULL,1,'50.78.109.177','2013-10-14 19:44:06'),(56,53,70,NULL,1,'50.78.109.177','2013-10-14 19:44:21'),(57,95,69,NULL,1,'50.78.109.177','2013-10-14 19:46:15'),(58,7,11,NULL,1,'71.6.85.211','2013-10-14 19:46:41'),(59,7,76,NULL,1,'71.6.85.211','2013-10-14 19:46:55'),(60,93,75,NULL,1,'71.6.85.211','2013-10-14 19:47:49'),(61,93,75,NULL,1,'50.78.109.177','2013-10-14 19:47:49'),(62,7,74,NULL,1,'71.6.85.211','2013-10-14 19:49:12'),(63,53,81,NULL,1,'50.78.109.177','2013-10-14 19:49:44'),(64,53,80,NULL,1,'71.6.85.211','2013-10-14 19:51:54'),(65,79,78,NULL,1,'71.6.85.211','2013-10-14 19:52:15'),(66,100,23,NULL,1,'71.6.85.211','2013-10-14 19:52:46'),(67,73,78,NULL,1,'68.189.52.55','2013-10-14 19:57:28'),(68,73,78,NULL,1,'68.189.52.55','2013-10-14 19:57:28'),(69,87,75,NULL,1,'207.47.0.147','2013-10-14 20:02:09'),(70,7,83,NULL,1,'50.78.109.177','2013-10-14 20:02:54'),(71,102,72,NULL,1,'74.192.11.87','2013-10-15 03:27:26'),(72,103,72,NULL,1,'67.67.183.132','2013-10-15 16:46:40'),(73,53,85,NULL,1,'50.78.109.177','2013-10-16 18:32:28'),(74,53,79,NULL,1,'71.6.85.211','2013-10-16 18:33:40'),(75,53,84,NULL,1,'71.6.85.211','2013-10-16 18:34:42'),(76,53,77,NULL,1,'50.78.109.177','2013-10-16 18:35:11'),(77,86,79,NULL,1,'71.6.85.211','2013-10-16 22:10:19'),(78,53,87,NULL,1,'71.6.85.211','2013-10-22 22:46:52'),(79,53,89,NULL,1,'50.78.109.177','2013-10-22 22:49:09'),(80,53,88,NULL,1,'50.78.109.177','2013-10-22 22:49:16'),(81,53,91,NULL,1,'71.6.85.211','2013-10-22 22:54:22'),(82,113,89,NULL,1,'71.6.85.211','2013-10-22 22:59:11'),(83,114,91,NULL,1,'71.6.85.211','2013-10-22 23:06:01'),(84,111,92,NULL,1,'71.6.85.211','2013-10-22 23:06:57'),(85,53,98,NULL,1,'50.78.109.177','2013-10-23 18:40:27');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporter`
--

DROP TABLE IF EXISTS `reporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `level_id` int(11) unsigned DEFAULT NULL,
  `service_account` varchar(255) DEFAULT NULL,
  `reporter_first` varchar(200) DEFAULT NULL,
  `reporter_last` varchar(200) DEFAULT NULL,
  `reporter_email` varchar(120) DEFAULT NULL,
  `reporter_phone` varchar(60) DEFAULT NULL,
  `reporter_ip` varchar(50) DEFAULT NULL,
  `reporter_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  KEY `service_id` (`service_id`),
  KEY `level_id` (`level_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information on report submitters via email, twitter and sms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporter`
--

LOCK TABLES `reporter` WRITE;
/*!40000 ALTER TABLE `reporter` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `access_level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Defines user access levels and privileges on a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'login','Login privileges, granted after account confirmation',0),(2,'admin','Administrative user, has access to almost everything.',90),(3,'superadmin','Super administrative user, has access to everything.',100),(4,'member','Regular user with access only to the member area',10);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores roles assigned to users registered on a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(1,2),(1,3),(2,1),(2,3),(3,1),(3,4),(4,1),(4,3),(5,1),(5,4),(6,1),(6,4),(7,1),(7,3),(8,1),(8,4),(9,1),(9,4),(10,1),(10,4),(11,1),(11,4),(12,1),(12,4),(13,1),(13,4),(14,1),(14,4),(15,1),(15,4),(16,1),(16,4),(17,1),(17,4),(18,1),(18,4),(19,1),(19,4),(20,1),(20,3),(21,1),(21,4),(22,1),(22,4),(23,1),(23,4),(24,1),(24,4),(25,1),(25,4),(26,1),(26,4),(27,1),(27,4),(28,1),(28,4),(29,1),(29,4),(30,1),(30,4),(31,1),(31,4),(32,1),(32,4),(33,1),(33,3),(34,1),(34,4),(35,1),(35,4),(36,1),(36,4),(37,1),(37,4),(38,1),(38,4),(39,1),(39,4),(40,1),(40,4),(41,1),(41,4),(42,1),(42,4),(43,1),(43,4),(44,1),(44,4),(45,1),(45,4),(46,1),(46,4),(47,1),(47,4),(48,1),(48,4),(49,1),(49,4),(50,1),(50,4),(51,1),(51,4),(52,1),(52,4),(53,1),(53,4),(54,1),(54,4),(55,1),(55,4),(56,1),(56,4),(57,1),(57,4),(58,1),(58,4),(59,1),(59,4),(60,1),(60,4),(61,1),(61,4),(62,1),(62,4),(63,1),(63,4),(64,1),(64,4),(65,1),(65,4),(66,1),(66,4),(67,1),(67,4),(68,1),(68,4),(69,1),(69,4),(70,1),(70,4),(71,1),(71,4),(72,1),(72,4),(73,1),(73,4),(74,1),(74,4),(75,1),(75,4),(76,1),(76,4),(77,1),(77,4),(78,1),(78,4),(79,1),(79,4),(80,1),(80,4),(81,1),(81,4),(82,1),(82,4),(83,1),(83,4),(84,1),(84,4),(85,1),(85,4),(86,1),(86,4),(87,1),(87,4),(88,1),(88,4),(89,1),(89,4),(90,1),(90,4),(91,1),(91,4),(92,1),(92,4),(93,1),(93,4),(94,1),(94,4),(95,1),(95,4),(96,1),(96,4),(97,1),(97,4),(98,1),(98,4),(99,1),(99,4),(100,1),(100,4),(101,1),(101,4),(102,1),(102,4),(103,1),(103,4),(104,1),(104,4),(105,1),(105,4),(106,1),(106,4),(107,1),(107,4),(108,1),(108,4),(109,1),(109,4),(110,1),(110,4),(111,1),(111,4),(112,1),(112,4),(113,1),(113,4),(114,1),(114,4),(115,1),(115,4),(116,1),(116,4),(117,1),(117,4),(118,1),(118,4),(119,1),(119,4);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_name` varchar(100) NOT NULL,
  `scheduler_last` int(10) unsigned NOT NULL DEFAULT '0',
  `scheduler_weekday` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_day` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_hour` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_minute` smallint(6) NOT NULL,
  `scheduler_controller` varchar(100) NOT NULL,
  `scheduler_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Stores schedules for cron jobs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler`
--

LOCK TABLES `scheduler` WRITE;
/*!40000 ALTER TABLE `scheduler` DISABLE KEYS */;
INSERT INTO `scheduler` VALUES (1,'Feeds',1382482933,-1,-1,-1,0,'s_feeds',1),(2,'Alerts',1382482933,-1,-1,-1,-1,'s_alerts',1),(3,'Email',1382482933,-1,-1,-1,0,'s_email',1),(4,'Twitter',1382482933,-1,-1,-1,0,'s_twitter',1),(5,'Cleanup',1382482933,-1,-1,-1,0,'s_cleanup',1);
/*!40000 ALTER TABLE `scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_log`
--

DROP TABLE IF EXISTS `scheduler_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(10) unsigned NOT NULL,
  `scheduler_status` varchar(20) DEFAULT NULL,
  `scheduler_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduler_id` (`scheduler_id`)
) ENGINE=MyISAM AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COMMENT='Stores a log of scheduler actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_log`
--

LOCK TABLES `scheduler_log` WRITE;
/*!40000 ALTER TABLE `scheduler_log` DISABLE KEYS */;
INSERT INTO `scheduler_log` VALUES (1,1,'200',1370913368),(2,2,'200',1370913368),(3,3,'200',1370913368),(4,4,'200',1370913368),(5,5,'200',1370913368),(6,2,'200',1370913421),(7,2,'200',1370913535),(8,2,'200',1370913857),(9,2,'200',1370914051),(10,2,'200',1370914098),(11,2,'200',1370914163),(12,2,'200',1370915334),(13,2,'200',1370915344),(14,2,'200',1370915447),(15,1,'200',1371229759),(16,2,'200',1371229759),(17,3,'200',1371229759),(18,4,'200',1371229759),(19,5,'200',1371229759),(20,2,'200',1371230400),(21,2,'200',1371230401),(22,2,'200',1371230486),(23,2,'200',1371230538),(24,2,'200',1371230683),(25,1,'200',1371240832),(26,2,'200',1371240832),(27,3,'200',1371240832),(28,4,'200',1371240832),(29,5,'200',1371240832),(30,2,'200',1371241819),(31,1,'200',1371243933),(32,2,'200',1371243933),(33,3,'200',1371243933),(34,4,'200',1371243933),(35,5,'200',1371243933),(36,2,'200',1371244085),(37,2,'200',1371244208),(38,1,'200',1371586097),(39,2,'200',1371586097),(40,3,'200',1371586097),(41,4,'200',1371586097),(42,5,'200',1371586097),(43,2,'200',1371586162),(44,1,'200',1372302702),(45,2,'200',1372302702),(46,3,'200',1372302702),(47,4,'200',1372302702),(48,5,'200',1372302702),(49,2,'200',1372302885),(50,2,'200',1372303032),(51,2,'200',1372303120),(52,2,'200',1372303897),(53,2,'200',1372303949),(54,2,'200',1372304422),(55,2,'200',1372304492),(56,2,'200',1372304522),(57,1,'200',1372314485),(58,2,'200',1372314485),(59,3,'200',1372314485),(60,4,'200',1372314485),(61,5,'200',1372314485),(62,2,'200',1372316197),(63,1,'200',1372401307),(64,2,'200',1372401307),(65,3,'200',1372401307),(66,4,'200',1372401307),(67,5,'200',1372401307),(68,1,'200',1372453955),(69,2,'200',1372453955),(70,3,'200',1372453955),(71,4,'200',1372453955),(72,5,'200',1372453955),(73,2,'200',1372453981),(74,2,'200',1372454041),(75,1,'200',1372643294),(76,2,'200',1372643294),(77,3,'200',1372643294),(78,4,'200',1372643294),(79,5,'200',1372643294),(80,2,'200',1372643351),(81,2,'200',1372643447),(82,1,'200',1372653906),(83,2,'200',1372653906),(84,3,'200',1372653906),(85,4,'200',1372653906),(86,5,'200',1372653907),(87,2,'200',1372654297),(88,2,'200',1372654502),(89,1,'200',1373056986),(90,2,'200',1373056986),(91,3,'200',1373056986),(92,4,'200',1373056986),(93,5,'200',1373056986),(94,1,'200',1373963708),(95,2,'200',1373963708),(96,3,'200',1373963708),(97,4,'200',1373963708),(98,5,'200',1373963708),(99,2,'200',1373963770),(100,2,'200',1373963837),(101,1,'200',1374172427),(102,2,'200',1374172427),(103,3,'200',1374172427),(104,4,'200',1374172427),(105,5,'200',1374172427),(106,2,'200',1374172520),(107,2,'200',1374172799),(108,2,'200',1374172802),(109,2,'200',1374173061),(110,2,'200',1374173139),(111,2,'200',1374173254),(112,2,'200',1374173320),(113,2,'200',1374173383),(114,1,'200',1374175191),(115,2,'200',1374175191),(116,3,'200',1374175191),(117,4,'200',1374175191),(118,5,'200',1374175191),(119,2,'200',1374175275),(120,2,'200',1374175330),(121,1,'200',1374263482),(122,2,'200',1374263482),(123,3,'200',1374263482),(124,4,'200',1374263482),(125,5,'200',1374263482),(126,1,'200',1374285342),(127,2,'200',1374285342),(128,3,'200',1374285342),(129,4,'200',1374285342),(130,5,'200',1374285342),(131,1,'200',1374624387),(132,2,'200',1374624387),(133,3,'200',1374624387),(134,4,'200',1374624387),(135,5,'200',1374624387),(136,1,'200',1374649207),(137,2,'200',1374649207),(138,3,'200',1374649207),(139,4,'200',1374649207),(140,5,'200',1374649207),(141,2,'200',1374649284),(142,2,'200',1374649339),(143,2,'200',1374649380),(144,2,'200',1374649385),(145,1,'200',1374712597),(146,2,'200',1374712597),(147,3,'200',1374712597),(148,4,'200',1374712597),(149,5,'200',1374712597),(150,2,'200',1374712620),(151,2,'200',1374712620),(152,2,'200',1374712622),(153,1,'200',1374714132),(154,2,'200',1374714132),(155,3,'200',1374714132),(156,4,'200',1374714132),(157,5,'200',1374714132),(158,2,'200',1374715571),(159,2,'200',1374715629),(160,1,'200',1374724378),(161,2,'200',1374724378),(162,3,'200',1374724378),(163,4,'200',1374724378),(164,5,'200',1374724378),(165,2,'200',1374724386),(166,1,'200',1374726252),(167,2,'200',1374726252),(168,3,'200',1374726252),(169,4,'200',1374726252),(170,5,'200',1374726252),(171,2,'200',1374726312),(172,2,'200',1374726362),(173,2,'200',1374727265),(174,2,'200',1374727774),(175,2,'200',1374727865),(176,2,'200',1374727924),(177,1,'200',1374729106),(178,2,'200',1374729106),(179,3,'200',1374729106),(180,4,'200',1374729106),(181,5,'200',1374729106),(182,2,'200',1374729127),(183,2,'200',1374729192),(184,1,'200',1374786634),(185,2,'200',1374786634),(186,3,'200',1374786634),(187,4,'200',1374786634),(188,5,'200',1374786634),(189,2,'200',1374786667),(190,1,'200',1374883175),(191,2,'200',1374883175),(192,3,'200',1374883175),(193,4,'200',1374883175),(194,5,'200',1374883175),(195,1,'200',1377120818),(196,2,'200',1377120818),(197,3,'200',1377120818),(198,4,'200',1377120818),(199,5,'200',1377120818),(200,2,'200',1377120857),(201,2,'200',1377120945),(202,2,'200',1377120969),(203,1,'200',1377202986),(204,2,'200',1377202986),(205,3,'200',1377202986),(206,4,'200',1377202986),(207,5,'200',1377202986),(208,1,'200',1377205858),(209,2,'200',1377205858),(210,3,'200',1377205858),(211,4,'200',1377205858),(212,5,'200',1377205858),(213,2,'200',1377205861),(214,1,'200',1378413308),(215,2,'200',1378413308),(216,3,'200',1378413308),(217,4,'200',1378413308),(218,5,'200',1378413308),(219,1,'200',1379110598),(220,2,'200',1379110598),(221,3,'200',1379110598),(222,4,'200',1379110598),(223,5,'200',1379110598),(224,2,'200',1379110912),(225,1,'200',1379113908),(226,2,'200',1379113908),(227,3,'200',1379113908),(228,4,'200',1379113908),(229,5,'200',1379113908),(230,1,'200',1379352784),(231,2,'200',1379352784),(232,3,'200',1379352784),(233,4,'200',1379352784),(234,5,'200',1379352784),(235,2,'200',1379352920),(236,2,'200',1379352961),(237,2,'200',1379353020),(238,2,'200',1379353032),(239,1,'200',1379434252),(240,2,'200',1379434252),(241,3,'200',1379434252),(242,4,'200',1379434252),(243,5,'200',1379434252),(244,2,'200',1379434282),(245,1,'200',1379450527),(246,2,'200',1379450527),(247,3,'200',1379450527),(248,4,'200',1379450527),(249,5,'200',1379450527),(250,1,'200',1379581229),(251,2,'200',1379581229),(252,3,'200',1379581229),(253,4,'200',1379581229),(254,5,'200',1379581229),(255,1,'200',1379628107),(256,2,'200',1379628107),(257,3,'200',1379628107),(258,4,'200',1379628107),(259,5,'200',1379628107),(260,2,'200',1379628571),(261,2,'200',1379628784),(262,2,'200',1379628841),(263,2,'200',1379628900),(264,2,'200',1379628902),(265,2,'200',1379628960),(266,2,'200',1379628960),(267,2,'200',1379628965),(268,2,'200',1379629031),(269,2,'200',1379629084),(270,2,'200',1379629140),(271,2,'200',1379629148),(272,2,'200',1379629200),(273,2,'200',1379629210),(274,2,'200',1379629275),(275,2,'200',1379629332),(276,2,'200',1379629388),(277,1,'200',1379953729),(278,2,'200',1379953729),(279,3,'200',1379953729),(280,4,'200',1379953729),(281,5,'200',1379953729),(282,1,'200',1379969604),(283,2,'200',1379969604),(284,3,'200',1379969604),(285,4,'200',1379969604),(286,5,'200',1379969604),(287,1,'200',1380048197),(288,2,'200',1380048197),(289,3,'200',1380048197),(290,4,'200',1380048197),(291,5,'200',1380048197),(292,1,'200',1380574228),(293,2,'200',1380574228),(294,3,'200',1380574228),(295,4,'200',1380574228),(296,5,'200',1380574228),(297,1,'200',1380577261),(298,2,'200',1380577261),(299,3,'200',1380577261),(300,4,'200',1380577261),(301,5,'200',1380577261),(302,1,'200',1381531325),(303,2,'200',1381531325),(304,3,'200',1381531325),(305,4,'200',1381531325),(306,5,'200',1381531325),(307,1,'200',1381779275),(308,2,'200',1381779275),(309,3,'200',1381779275),(310,4,'200',1381779275),(311,5,'200',1381779275),(312,1,'200',1381879159),(313,2,'200',1381879159),(314,3,'200',1381879159),(315,4,'200',1381879159),(316,5,'200',1381879159),(317,2,'200',1381879279),(318,2,'200',1381879419),(319,1,'200',1382481143),(320,2,'200',1382481143),(321,3,'200',1382481143),(322,4,'200',1382481143),(323,5,'200',1382481143),(324,1,'200',1382482933),(325,2,'200',1382482933),(326,3,'200',1382482933),(327,4,'200',1382482933),(328,5,'200',1382482933);
/*!40000 ALTER TABLE `scheduler_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `service_url` varchar(255) DEFAULT NULL,
  `service_api` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Info on input sources i.e SMS, Email, Twitter';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'SMS','Text messages from phones',NULL,NULL),(2,'Email','Email messages sent to your deployment',NULL,NULL),(3,'Twitter','Tweets tweets tweets','http://twitter.com',NULL);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(127) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores session information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('urgkv2nm1p2ou5f432gds9cc06',1383062170,'82tkK8EojmndCV3QlAXCr7i1orW6I+x5BK4omQUqDAyeY4Ic3ll+qt2+mDd1wOaRdT7qCytsCwEKEsk/HWKpKDR8YxZdaOPtubtY2/wSuH3wnmKYCBFGHHUeE6NtzUtOzPo69GM7zcWYU8EhfH5jaWeMmfjUPE5UMEkLDYOUh3YrqJASbSt8JBLQh15qPZwK+h6BqXYV5kdZBkGgjJubRaJrByoKdzRqA0f3Ff3HlhNG9M0TMYJSuivuAmbx2eNrCgmwUOK/HxVK97vlhgDLzqnD04xYkXRDh96yI3lJj1PPol/XZ+4xqJPVSYw4722+8Jl3Kclgl0CirPuhsIwcRwcoutgVUxHq5wr2OikFNzAGNF6NvSfkoUVb/dyxZYnkQ7wQZu+QwATde8ymdeIK5XjXiedHLbLlIQ=='),('9kc9cm6ej54e14k1nh39m0lsr2',1383062610,'uzIe9pLu9A8B6dHLfnh4ouhcS8lqP4+crAVmVg3JCXoTwkgK7rmubM8rHWn6KOKYf5+VQVHW7KiqjpVKEd6We5xEHOIiG7fMrOw9kg1U1BEdqx1p+Zi7nq8uNU1arX7zzNeMeSJg9HfgxcC+finC6Gm0IT3axgwWpDJ3DG3+Csk5k/8LSwuD8pYLabX79zdajaulxphW9uOTGmCbEDHAiCKwN/bTS7QZ0bY1NzZm9uTixc7N/W3V/4HRQj0w2J7PxXT3C4Yb3qGyR6LMA6K9O0LkK8t2jh/fuJY/SKrxZApvp5ouLKTJ3C0PJx6/xd3Ss8/hKI3xvtCsj5ztGPjiIhUi4ZUQqA=='),('juoqsia3kplkrq4qdekdnth587',1383066484,'gWguYlvEQ/BBfQWw1bWL2osG5wMBn4NkV0EdyDLvqjsYuL1vKcnHSfBVx/HMrNyemrN9K66jbojDRdsvfijTLYyO0YsuUAPykdKC4tPvb2+zqgFEXOh0pEmVmvQwBSAyV5+bXi+BRZ82tJ1K9TZaMuLj3zz732x/AwKmAnT95quYwV0lHeElqH+G5Wz0qN6lmqjmQ4D/DWLZPCaol1aF2KFOQD+vPPiqDvrFep+vVu7VEFvW0yTKYxxLF80HFST3WVb6hOjAtUtOft/dq7VwH0i0MTxBOAJRrTInH7unPiEW5V/nnTX0505Wm7+hI4N/qC6satmwXV9nEhnFwDvE7tSjmFQkeEZOxxHejrw9t3ErDZFtJysNowzgT6SHFJ9X44AfzUJNDk7MbV3h07uU0khRreNQwzcfe8+S6Ht5m339LzrxsiqSCNlwSnGGymn351yhaH3b9RPoFs4Uqq5KM/VdJFyP8zTxiOKO8N0CV/u3kjguBg=='),('hghfp4q573g1r8t7ojkjd66s15',1383063825,'a7k1i3cXKBU14MQv6svbXP0a/nYuwtM/v5nF1qaRmyUQKVygrIWCRUxkSwki+E+dE/HLSEsUNFj9hDVGVjTVS1FCxUBXukfJYPAI5JeK8FMQBVPshI5piYiGPQ+zLj82H3OL0zx9eU1yyG0kINPU0e6o5S3N40LZMxtt3rcvB28kKX0YpmKRiuAuEMZfV3D/Xn70XsGOt+R0ixoxxHgLpXIHSSWkbZZaVs5O5oT2u8qeqUNQvON0e8zV1OoHpZbHcGKXDm7GEeNP4BW9/BXIxLyUrIfiFts1UMtwXw9fOtJKCTQ+BeZjQ+QuFoK6JRYry6DK'),('nsv8fjvdb20b5em3iosi5e4aa5',1383063981,'cPt70M7DWZMOu11WCekjPIySwP5IuYZzs3Bfc4U2VjPOSMkOcn6mBAwL7glrjafIiM1yIxUl2T9jGAZm/0Kuvmkb9AkCIBKErMPdA1t/XVAVNizlZtZIks9mSFjlrMilPtGogaIQ3Ibf5FohaIX8Tzy+eoozpaBoQwjUQhKGRAb17vKsecVYM62CJIxx0XmVzqKyXD/vOVbph4Odlx0ncniGW8o1MF7jEjUhx8MCrpGqsEuQctpA/zCGwPYwtN1m1IO/nULaIwmceF2wB7ejS89wMs3TKmZSPtT+j1q7lj3qniNWBpPySw8/C1PSAeBDr7yRogUNyOd65JwqbIWeR+A5XlzUxg=='),('2eu2p8f1ort6ois60om5r0ng73',1383065098,'tSbSHSI+zoSaJ7IdHRSjo4b2ZqYjKs6zkQMqeM6fykXWmeoLgzh/518/WwkfICQtKEZw+dDTyGIUCDttym8CCgTYOZ+Gc4qI/HC4ZM6sZh8A4ukyiXYRfk/Ez5z6GNJ65CHnaU1RT1JZCqCqeHpKMfhRQQv3TA/sPX3q/A1Hu6K+3kxZ+BlBVuxEhV43qsf04EYln4qMOk6oyGEGPRdULya0v67r5pMvN51QpabxVFOIBkqXMIzNpbmgAZzk7esBjYaN/N1skmWaIg91rJ+T1BF/dnM9kjEOCnJUiLupbbhdKk/vDYmjGSJrFpVi8OcC3Nf4n+ZfKj7jiGCUuxCFcyv75BDLQk4L/g/wF8JXFYsxSjY5o3TAkwOdyWY62/fTQnonhm1gApv4RB0rL6cPtvfAwOOkUovR/IO+mu+R2flfA3KBvFvuctrQ61XNwJkIQ2ULqJ9hLPi9/fQEK4DFw2EKrp17nWkyZqkbiQNV8jklbdRr84A='),('nl6e59m3qlphphqmjlb1q8vtl3',1383065127,'REi49vHy8V7K4rqzIWz0YVZA+VjQ87XEDPaU19zi47kWiX0vNROGsGmMT8I69U+wW33kR4YWgxUuDya/c7bnfCJFfyM8QgTUSpyuaalA67fsly4+k+q6AXGutiau4BW5MoYgbZUiFM5Qi6ErdqV8LFuLHhB5BWvm/f8KrTvXJADXKntdrgTW7EXkkEC3VreQ4oQjBdEMAf9htDQ6lKIsGzlKNnePbn2gAihxhIahFJQgNo9Be5BtIomZL2L5e3S8PhhkjOb/25KDUa6ZlRSFSWOD3mLIjwQCBitukAvCmt4UzNb+CUjtZGzc6Q0a2BNJfB1+WZwAOHDbqWoO31K+tDPxMl6FbSaKC7iKFq9J+Zuci2Y2SF+SGaMHP6yrrvuRQRDEMiYCXEHUPj3KTCVCvZTWrXSPT1EoGQJg9ovE+xgtiattOmlplyCu362SzF/L91/DOE/S9G57xrcu5qLdLgBTbJagaYEKeVAF3ZAjtP3rUD9W9Bxe5EhBzkoFW8TO9EWahxghWbyMxIlsESWPdnKXgi7zEoTFSVnb23oXLk5+H0wsTHyR7oaOgnAC65+zyEOSw65T6q0P7WbWBLvQ9ITQK2rXo3xEKA=='),('atr61och1m0ijt6e6c4l0tfhs4',1383065139,'ws4R0RNbCAOfT/TUAS137tdWSBf6m+/NqPUDTk3s56F2UeaQv6IeVOq8MWghL43HPuHoT9Wo+XsWucQlHiuUHlrRG18q4uYX79vLi1hJ6njbKqQ1Z6nV9Ead80wJNei63TDckliyn5Z7YaqzuPDlgnCWH/yR6i+JMwbfJyqo+DLYPQjiHNz5ORP5yoCXrijxhmhJS6h7Unoj3WeT/lRVJDooe/SFd46N99G4f2AzLCnjEYGori/BOW/9c/u50GYXJehGtBalEPKH7qiMh6PrPCSytvOmbZ1ZsjdKTYlVIlbiyiSRUIKyEMVTjqMG3CYz957ddtEuYfBWC62Lywz3CIDDg8ZNAA81lLQXb4x1KSekT9pnj9CEsXasRz6HnvDPQkLbtDRec48RAwIrxnIribuO+4DIDxPXaZG0gEbdfebRjPsYVxS0fNQkkrMJ6XkDoOAwd9hBwHV8OOzChV0cQI7b48O01IIngoKlw3BmNbaB0g+bIU8='),('7pvf82v53nsoh5efsj6sgn8n71',1383065191,'mWkgD2v6TWAX0cSTZzZYidSrrN2vCbkfqxvJ7sja9coh1gIJ5Z4qOmlYT+xsaHvBrUSWpBm1U90tItJOVS8xqThaXMc4N9qA4KL3LDm9P0MNzIGHVNwnWW8T2LGGfLpGW3z7ve5r2zrMfBw95uZP84zKEAzNnu6DqqIzj29C299sJtymfDTKsgVgTXc00h+75k+SCaKYL3btKREduZYelyyREQwIu1JOhnpmHWxxXMBq1qUeI6angKgRiunjf0RXzlZWDwOvyLOpfcX/QTcVWmMlhX+AXJnDm6/MWBB4lCOqKy/XYponQaSUy41FfHXDbalaPq0mDObALQ8ys4O66lxaiKb6nKKt2YemEPJx9cAHoQAIXDiZ3UPcLdneM9I1LwmL2cUE4SchRmgq4EYqD9f4JRALwcywhwl7LdsGFjieBnVHIG1AEuOdFPqBaQfvGA=='),('amaju274sujlfgipif4hrtur96',1383065215,'qtdLWo+kCsIToMT1XLB3xvG/p0KqesVwR4CGOQ4ozEXPEpsGXuw86tIVC7bhh8eJQ2iU5YPyZPS4rzAix5jBLYoj1+Z4klon2IEM1C9KlNBrijTCveyn41ILLSZV0ivF02x9GvEZKmF9lEzQj4+Iqqf2jKPfwzc5tbHQj0tGtss1G81e5Xg7b+/kyRsrKcfEO0yEIG72OaCsBVH44NIR5xYLZ7VHsadjc77OTIcxcISvluNn5+m7XZHx9OjYZfD2BsnR2V5xz+FgvUtqgvpgY9rW8YvfDlsjKznBBShiZCSHizLQ0otUY60kS0jZq81G8Xr9GnZdpjwb6c9OkEfHTcfvPJ3jtX2Cg3iBvOu+7DkwjVy1Rx/SuYck99imuWMW0DGxp2HT8zP7qgktR1i16he0QVglEuoMRXYtro88jR7zgSTJaMPgYSHQyPgFcKS0aUM='),('gp3idslcf8rakkkhce6qbc04q6',1383066036,'89gZYrHvRCq7T9asiuRHQpT4pTuvbtd9e1JxsEv59gxDwUazlaiklORjiY3D/RfSpWgkO7jF1VbjaGVooLXuB3OMgdWEN5QovD4f/lU6xfRaFu5uyJfV/26jhvshtLGCvBMp9mZe9O7Qiu11M7hGoScSaavcxprWeqw9n3tr2Ab+3ZRAZhKHI/O8KklrTMfcidMIS+9vFprGlOZ7KPhGcEQCdK8sTiPO44GFWfOWaRD8J3Qz3ftqdlmUOlldd0HUFf3qXNtDePFd7sv6ZK4l9gASKgOiX4szG7y7KXoyUGz7bJaG3D8GcQJxipMn0X0rJUCK0Lfu5smzaEdQZLuEukk+IO7fFJnnodeKMLfDM4dho2gT1Q1AMfS8qcCAH6Z0/uEovTbyOrJxoKrdCAGUEgLOi63UwWRib2gv4UaAJaHkfUDt8Qo='),('16dln5f2i3hdjcrg63arn5qoc1',1383067130,'C018CeungWbORcM5ztWOXpZp5AE9bk0dI9s6bZEfJfC0eZ3NOQDnTNmycu0PmVPwbXi8l5KrcI5/unF5CfOAG+Vm8//REv6w5hVO5CZtUEqEKgHRLl/6ueyqA8MpuU1jAJ5HEr8bLwrDco+JsBROrsZfFAVEAfudeYRhWTltRqcMoXA8aeP+1z9oM1+f7xQY0hgv6cFxcji1HR/ESm7ekrA3UbYJzQiuRmxP52qpW1VUZOqCV+w2U/3iQh4zyFhMAPAg4Mtmf00aKZT0oBUQme7hmivL8VgDTX5FetTB6X4+jW3sEsHlQmt8eHbFO5U5Is5EkSQJ6NEwRTxzuSi2x8qfqC0YKsGSqa5MjLEmjVzuX+kxgUx4xp02fsWYgdFIJWPq'),('9hqh21bb4irpmv4r3qifjhdo94',1383063723,'G8Xsbkjcng4MFMIBzLxU08XWCMuf9zaYSZALSzq2EeTLZR5OVuS1iTqAKlc8q+tEmyW4fgLG6v4cP/l2vzWj2zomRuWmrwXwyCFQ7olIv9IsEZaLkKMxjbGFLkW0iCmGtkSCBmRncmoOoyxttNQxVvLVhUKrkpnqIQYlNr2RTHmUXcf1Mvth3RG40g35PYeKua3oEi6FJOerji3qA8TisiZg+pTnhkHEFyrHSW8NDIgoRn8KnQYaZkhLrtWFq2CasOCTuSGtW+dUTeHn03u1A7WlP+COi7CaurmLkYBMiW5Nb9ISNsYJ3WIo+MswY06TIYpjviDdiFU7B35G3B8VHY2y/NCjdRP28Gcb8bpGGYFIxaotbVE/LFD+0aWbqZ13CmSNDT529GfRLZaj5gvSn21QO/3UrvXqWQgmChnWM7lU+a9I0XmOw3CKbMPzrOdxdjWSjJS/Xgo95XNADPJ04gzvbCAa/+PxK44Ks2AaMVBCUg4TcGXsvQHJr4oIFOC2YB7lHeIamO56eZQ4pFIE4eJgf2FUX1u7X35VcM+Qfp86XZKo109l7r9uL+yFEjvLeZuZQPgm4KqzGG8WN4jzs6ErZ701WkCiMobFON1qe418Ipec6fuVmQRufjyUaga7JXPxID+0fKh25adO0XmXoXyIu+ksI6vRgh9gkXv5u4D43+LXpGsOgkltaQpp6ju4lgmLdZr6MguNPoIyMTd1asab2j7WTAm4B3hkhNZ++1kTvR7HkHTp95qN74i/ghMxTgDLQT7z42tl7QO4s47l29abvBmwQgEIScQs29w4I3/fMXwos6J74pzrNelQqUTDoNqAXsQ1B9QmhLlMzV1tuws41Lf327BykZIW8hATXbSLDO8LvSqPKhhRfnLm6h9WfqRfu2YcTeU9bCZj/CynpE0nW0UqK1Kx5I1yPqT6hVFaAYiCdMMItveE12bDWX0MHxvbO8dS8YQPzmBrCR559YIBjQ7MexcXJgkGY269OtRbnIAAKprNehKsi/htezujgqKLMiCOjdo2K/Mq03pNtlch2Wh7UoInodj0Vi/bdfp6eR+D23ilLTBdBGXJkMUarhZ3xbS1gXS43bLzfDAWlvkm4lJz4w9jsM7qV6bgBpub5I/wByl8U9j0zQCIs1crtaSe4qCRQ7U7kV8DPY/8W4cWEZpE/FWicajPsFQADgZszymsuL0QfLbZUyyv6YCVDdwnLfW+WV8gI/dmBziJ9st8Ha4g4tWSzWcotfRbxuW9FiO9nErLYd3ZmO7FDZJFgYZoz5zjDaixeqbs4niCvcKxbZcYYsV0GrkF8YeoH4xi9C6wme3rofppDEI='),('kov1kcn8ubb4ffnnh91knngc40',1383067127,'B9Mc4mqP0r7JTHo+jhevogdYUDfx/benj3pzLXFIxC+au3ggO+EHPf2eMiZaTFcmDG41mzGtmy8vluVBysG5ExdXtfqSm99befZc8n39bH5ky5PaK5/vQDCTuFtk/NCaZrYfw4Fykl0wZITTZZIneI+07/y7M93MneSAVQ61ko8XGFbndrZmTonaZq6HfV1zuSDbVyIQ3s4CZMZW6so17nDeXxwX9MUfiT693oEObRy1N04JwBX7EP4o03GMtvXTjeewE38AmjpLNK9MBRPXg1BthgXVAmMpnJ7/4lu0Ga3Ah0WCgHfbR+hkdeUDg9ayqQ3k03xQLGIPmnnGg4W7vHU93by/HoiKxpcqNpneZ37evvmdAgKhwX7njc+qaSskjz132nN4yN2JHdt4nktDrwh9PWf6sqsfsZ7ihD6ARNUlfaFGBNEIHjE03dCME9latmd2iRnXmzZEKn0xfS7mKiq4S042pphjkrrfpP7rEfYnd04xYi0='),('8b6hqvng6fthuqa6e4e2s9jpg2',1383064812,'XDanylXebGsi+wZD4OhOoxmMXSUTUpMSEBkPe0VPs9JA9ruIDrydAxQOBYvBV9ue9yoVOVG1rUAyJYzm5qtd+Bm9wkeNC5XWM3SVi8k4c3Lq7sy9IeKPU2WasRsrGCPr6JHzESqcShLewl/sWkYJwcQpbUuEmkj6iDV6fPZrnX03wAcxYge9ic6I70TpLtvrp7KKCbxCx2kg0cc912g0EprZJveA766DI7s5vVJ/0GYDgG8fNAyneuZMELyW+Pgr81G42tBOyUzgjCtA+2BPywPXGJLMLfWfpOJxbf+LElqHURCYTCC/CuYtDpHbHVPPDo/Mn2duZ8iS27yqS89uWdQ/kbuPVoVsWRntsxEcJW28retvbUmAYjGSBs9wSIi2U1gyXxLmvcRpy+0qgSxHso6p8ebe/LkDHhPNKZwUumnblEAS2yiMgDUWETpcs+LH'),('q59nvfn5jhf9rko3h3ng5l6g67',1383058488,'zERRVtEPCy4MStktc4e4sVIz4ddHHZdNn+kQzY5AhZnndUqnYSGIzRQfGhZ0pxuck3CJvcG2U8U5C/tv0mxwm9Rgr8HxawgK/AjfLj7SNVoc/IiTER3OEJD6snV3XBfSoWC1XV8jass7w7pyB4Ry2iK6Rx2Bvk06QCuchrthd3uU8hCaN6M9978+fvMSZ2SxS0jgBC7FMl+11AjXYkplutIHOqF3g7Fa+5Mx9qv1Ef6ypi5sJh1Bz/rDOunS40+58mf6XavKjodREUqpgyr2MVvBYAVc2vSR98jnT5oa8t8sMTaLKByLKDyIhPCZ7oSQWuraY9u+L89z1iKv9w=='),('dq12r49an0kruf5cf5b370m211',1383058496,'rAw3SZ9kBTDEt5rRfIqk9bhDjDg5TIyQ0F/2u1ARV8T7dLq9iCkJcSjOYYp4hGMZW7+Eu8f8CDhIk5VhKUWPrnRmqYqlQKef2hFRpdojWcuZmv+HeZrDnpVBeAYBLsy1JYEtaLpxqi++S2lu9dhjypz2bbMYLe9kmvw3KBxfMcKcB9JS0x1QaCeOUyFHLrpll/3Ikiw9d6y/5E0FzrF/5vJOg7MaA3J3zm8WgWNorq6QqFPRtvoSvg4FvOuNA/md1BWPjYFAs3T+pvEHzZS4Cm5/YOR8+chto5HGPBBTqLf2i29KvE8xw03OQt2m1U/yANhcn+g0nKf4shEnD+jGKyMHeIQ5sA=='),('72s42s61g0daujnfjs3t988123',1383059014,'KEth5OxcJs0WuDSnvnNawGZ0O6o7ZnyRXyknyd2B3bEBsEE0Lt6oYqO+agUyOIM2ru0yEtqudTRoffVh88YiZugmzG14NY3Ye7D2by+9lqpliuaK7sjORYuldnC6E9EyP2jcG1UH93d+/OsoYHVZgccJ6kshRY2Pm6HyuHRMzyk6Qee/n/xO4JA0JrN3E9ZHDpkNLPW47csHu6UgxkHXDZ3eTyWupXOr1HcYKs/E6Tf50DwBsopx+LroVUZNHArQQ2WvmipxlUB/U9rCQv9k983Mh9O05JUH3n1DzfPVT9dbagsUn5+dQWMGVqxKNi9N0Vt/9+s6WpY3gLHdDI+tqBfFeEjzXc10io6C0UZxe5gb8SzxWyz02opVkSooYnk+mB8FFevxqu90RVBaFXK+Uj0XNVD3Ni0v1XWDJEXmam5zUbZdNUpdCiIf02CrJJfMTXbuHv1kVoY='),('dm5a08b3llvu1qrlcqvabf8om5',1383059081,'JrhCzSrIq6J6drsXqSgiyWm9fwL+HFIRMpN9vj0TkOaWwGFD5hx4LfJt9SIrLntkM/hQ0hpMn9fvQT37MiorEpf1Fq90vDXnLu7qkgZbrm4VYf8mB//Y1a1CzSxx4/OAzrnUA3P8ubOHsseF9SJ8gISc8xuVCe42eb26qFX9IWZKbN+aEFsqv5KaZDKHrPgut2w5l88Y9yioxxsMuumZvR5nzPNhxHaGkUMRPiuhoU1xnA8QGwLz9F6QJ+9gHJGA+HMLL3HODSsVeXNvzIKQZBdqNwR2nfEIkQO4Pvn0uISlO1TlvbPYPQP3v9HbgLsVLlL9jkPnl/N+dPQppQ3I9NRNh18cke0O7VtEsabDMuNMvVIJ9RMdlCOJEy9ZH5o4CcrwL6XS+lKR4Bzj1Aq6cOIUeFw5IEoL4tmesh+oJNNKwJP1tfH4H0py1Wl1MBXtY4T0iu5WrCmvCIIOFAc7YazCGhaQRkNHdHjgKMKFLNsIFyz5R75ZRVY/P9L5V69Wwb5KVoY4/s20+rktQbMRtWpeIHM='),('diku38idfrl6hbphlqbk49aga5',1383059333,'VAXCu1VcdH1I+IGGDccwpVlw3/CIFEiK2EVlCa+Kqy6v5ts1yypYYon7bzJHXsm4i8z5vv22OrnweON7qVHiV9gUfRdWSx4CL8X+TntzQBhPMjjyuWQzNmeuNhcZqE44E+RFSjDxIx3RwRjsZMnAHKE9eRCGa18qHzOvOAuPywiJFXMr9b5+9VKXTEdWl/+f0Cnj5/gV4cnJytKqpimMgoB8mfFnIskO+qNS4DWl1akWAnNAv/EwrVFrbMht6rt4NwY1fGKibZyjJNYXkR00evw5SklhBmXYuVm14YhnJSKfCnImngEzF+ORf3hHwoWBHkAwIIUT/2hE2M/gwUMF+BLvCuHQqOpdF3KTH4T4viRYO43KRjYMLcppEdw2ebhZthOygrqaSu7Xt74/yVeZAcn78p+B7BA28vTjzvw='),('hsrf8394gcso434ro7hint9ea5',1383059336,'LzWGeAAzIpwVXa0SOy1gDNI9k8UN2TBpcI3JMdE0xlez2Vvf+DS7IuTG+kP8uPych3M46vpWO7+eJqchqzv4H6kmBmeOvV/jcEsjOeF5qzHxIblfyfMlvRzvX0MtuQhIX39YdM32w4kZ+9bvPmRwllIZY65z64QWERYqoGcm3nUGWjkEw/WiQIirFvcKig9AgBbIBEbRr6FigWr7UpKhfeRQPP+w8eHOg+75KtdGyuFILhdSRjCUuMYI7DG+yaX0Ar8Wmq0JBlWixmRj2ulsSKOjEaa0EtVEYvTbIi/Icm92Z209GtI3saha1XtjenQFph10fOZCKw3nw5goSYIS7+Ignq9RFWVJKvRrov0vYuD+jolnnZDyJqvHI/sWt8HHEWDU4T7R9HiVM3ZwS6nvj7Gtv45FY+SuhO1ig8U='),('0ejjbordtl6uu92gurqui82a23',1383059867,'qj/Sdt1gkKQtD91egakeKI8+/ZBRSyMEFcfdKswLgnA3NHoGCQic8IXlc80t9LX5N+lZ4V1mZUYdBSt77YNK82bdMOf1m7+UhqYqSBmauNv5FhvKMnNhBf5qymhcZ/F21ny7nOuEtEdPBU078eoWl134sDQLV/vrj3ewU2etMGP7bT0h6MnNBaKhihqyKgtHxvF6KOfsaH0/M5sj+xYTmakIR+6SoHS8nCk92KnGBcvqqfPMGMuy7TDZ/0cZQ2zxZMKDUPLGKeWvjajK+aUCuMPlgm6leWb1bV2EKoW9y5lrYjyzhcotFqcd36itAFH4FDANWuPM79dKn+hzMIuuTof04w=='),('g6fc7cc94614cj4aom0drr3360',1383060514,'RCLpVjBLKTNaBuhsr7oVp6NUTVPVPOBMBrHbmCukzBcKrPgRw0Bn12eFcBYekQ1KdvVSCcxHrqRN/WZN1+wGY/1WCEskhxVyx+j3cVsXD9YPGH5v5QoDzQCCBkIlRdQ4GyqkWoiGvydDu9lE89pzZ7/HNtkY5vEs+ajzBDYMQfk+Bkm3uL31Ws3VsaLBudgQv1u1Fugl8dATH6NSeL8hBAtJJ69fEWAQnlxcM4N8M+CNNHfSD1JQMyGJspI47bhRvt8q1AsZynqkMkO/h1mkkgjZlDyCPyFSBZBeQfBMI9zWGwUsw80iVLGd6L4BNRkGsN3UOOrnrVM/MRrfqwqpMonQdPWJNL48em7l0lhY2jmXlw7zxLBuS4IeeHRfULxuemb8NB3T6E8oAqtYknJoP9E='),('3kqq5l5i1ojqm2sk4tntup9kg5',1383060633,'kQeHy7hgwhrH6s/kNNQ4rOr191Y2m1LmUovJHYQisRzCUsaUWT7UAMxEDgP/iq0QzKeaXryU1xQF9tdP4a26BxKJGYENNQEnFceqzIXMG397fDt9UMTxcuUY2movq+zq+kXf6Zh+ICNVLI1BHRZvWHae1mF0j0LXBXGRIl8dgVUQsXVOFpRGwll/T6PWRPkoT0/R+DVkZ8NDRwBMW+dP7ifGHvYnuPwRt+I4ul9Md7rLie6HT2o81bz86e+D3xelTEhLe8jcoPmLUjfmKx5UACQ0XONzUjR2bHFiVcQMZ4BNrMU5UgCHNOpjaMf26RvLQ86OSHBXERxNrGvhDWgYaBLVkNy1GZgStDmu3q254h79yKRUgx6IFPvciPJp7K8qNcn3zEvxj6gSJQ9TQUt0xbiTuKhecTI1+Ui7K7TyZZkKx58lMg=='),('gbqb9fcngd92kfr28grahgsm46',1383060779,'67ChxJh4WVZLfRyCPS40QpUBC9KvvMx5Ln5L4V8FlGJADoXrbNlXEqKG7PW70zHMABHz+/8tMJYTceGTMPkP7kXh1LY6QwdhFtK9F7ZFyE4KGNOD19t9xiHqUlCL6R/Jvgc7dqahEBrsAIOd8sWGdHmTNabs8KGihCVphNxDWo5K5MgZ6e2a+XLSrVYph1hXoKIdV4nEW+xCIq5KTgMaHfJJ7JS3/x41IDlBtX+eBpzSHJYKaTItjfoSC2CTXvlJR14djsjsmZNwO4pGQudGiMD/1Wnc6DGy3KwYNO5X8+cWsddVyfYHKxk9hULpL5QglEbznTIdVgn1cVGZlspE5b8a/gSnvlz+xy8iR4oVTzUF/f74ppjmVeXPEqhI8aC8u0UQXO1a19YHn7cywSB7Ek7yUNa70oAYFbypRGN466OQ/ipCVIpi/fYZqwi4SKSWfg=='),('sc0eacqvt1tci370k9fa6sqbl6',1383060846,'QBflb57Y+gHwfke0uX84C95fQUWqQARY9jYdFwJpp1XbGEMNAd9UJf3ibhqhyDVvn5W7/vBjnGRiEDHkNTlFErOSfXAqcLylBJXCHED1JQ6Do/kq4EsUH8QFvt66IR6qFRhAwlAkWX9KNLBRr6d/MUa2sS0Fe0ZRTQUuuTPKEzRms02CHHx8RCZqT64+oNd5QYzzIc8NE7gDV9CjJT/s/mQrwZc8TMTPCWMwa/7j2wdNDCzEgXGMe6Mgz1ZPTdUVZ7VS81+dk1r8LXBE3+E9Frqziry71AKtVLAB6cDwtsZlyGaQ2AeeSXnbLuzZeY7Z7ddxH2cbUlwra5we/B7shj4LwuJYskkwEsw8sQc9SIC1YDPiqmqmYal6jhBbNGHgoq1uK2z/7AUaN7CER9pI8L93GbVhpFjWGVAcjW2sEDLse69wt4tQ4UriB2V2h63mNrI='),('8q88ea1qg0akq7rore85i4jra0',1383061259,'w+URcDv0LKhiTIbEcCnxBYWsqP0KvVfJqp0SLVfyP9tj2ZcWZX8JOaz3kBBnGD7bzHvQ+D7+xLW0qd0gIfdRBw2nFWI1w2n3iS3G2eZj8vq+Ey4KZ5QaBT3DdXnZA6S/xWAgr4f6CrxGutYM/RpNKJjcvqvEedfwg8v5TLy2QIuXm3fyLj3/n5godsoHZ1IPPr1JQVtklqhTthqd8ixp7OEf31CsvdysBOx/ynshRSjmyhoVRcwE29QkBfaNk/TBY7gK9FW81ZioFPVlFJgSFGu0FaO91Y/ogen3+EWl/w+AP2VvbLreKz1pGtatjkPevcP9jNAl+SPTbbHFjm1xtgMxsz9gMQ=='),('ecmob11e6kc2jhb0f0opmmb5f6',1383067120,'1RcomE1q04mgM18+jPRRT6wGZ3p5SOSMGNQhM5RmJwtTeHprPmARIk4TkCT7fL+PH6md6OS0CtXQhCPwrz1w7PQ5WRlzCfsbbvgMky+Akw8q80y3Lylg2qDaDzaStoFhLmEo/IvwqdMuJaRqYn6oWoKLEwh3Hb+mAodg4bvHrN3bD/yprX2m4XO50Lq0LrZzuMJRpO1AOvuwp+EFpP0oIB//Wlqyc0UGwpNiKelAl24+B+2kPtdZXaeCjuga9WdBQZ7zeQ+6kb5Flt4mrU8k2EyrzZFX6c9pK1R+6uoh6MoU/nMkv//MRfg+dNKpVi9GWG+lVsJjfdzpuJX58+UzdOp7/LtCQFRK8mrMoHbzPeFqwYPpaIzduM0DWUuUfyvdjfwYnhwIrC+rTGLy96yruITHIl7H+MH1iMs7lFgisKS5rUr9gcPGyQ/boJIDCnkSo6Nno+aXSfQvl9Rq/zIenjAQiDfSDFYwjB9JkC+b');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL DEFAULT '' COMMENT 'Unique identifier for the configuration parameter',
  `value` text COMMENT 'Value for the settings parameter',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_settings_key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site_name','Maker Cities'),(2,'site_tagline','How will your city be a MAKER CITY in 2025?'),(3,'site_banner_id',NULL),(4,'site_email','putney.dean@gmail.com'),(5,'site_key',NULL),(6,'site_language','en_US'),(7,'site_style','panopticon'),(8,'site_timezone','0'),(9,'site_contact_page','1'),(10,'site_help_page','1'),(11,'site_message',''),(12,'site_copyright_statement',''),(13,'site_submit_report_message',''),(14,'allow_reports','1'),(15,'allow_comments','1'),(16,'allow_feed','1'),(17,'allow_stat_sharing','1'),(18,'allow_clustering','1'),(19,'cache_pages','0'),(20,'cache_pages_lifetime','1800'),(21,'private_deployment','0'),(22,'default_map','google_normal'),(23,'default_map_all','CC0000'),(24,'default_map_all_icon_id','1'),(25,'api_google',''),(26,'api_live','Apumcka0uPOF2lKLorq8aeo4nuqfVVeNRqJjqOcLMJ9iMCTsnMsNd9_OvpA8gR0i'),(27,'api_akismet',''),(28,'default_country','231'),(29,'multi_country','1'),(30,'default_city','nairobi'),(31,'default_lat','38.47939486653601'),(32,'default_lon','-100.63476600000158'),(33,'default_zoom','3'),(34,'items_per_page','5'),(35,'items_per_page_admin','20'),(36,'sms_provider',''),(37,'sms_no1',NULL),(38,'sms_no2',NULL),(39,'sms_no3',NULL),(40,'google_analytics',''),(41,'twitter_hashtags',''),(42,'blocks','news_block|reports_block'),(43,'blocks_per_row','2'),(44,'date_modify','2013-07-25 05:13:11'),(45,'stat_id','54960'),(46,'stat_key','6d819a5b09210f9128ed642141c1f6'),(47,'email_username',NULL),(48,'email_password',NULL),(49,'email_port',NULL),(50,'email_host',NULL),(51,'email_servertype',NULL),(52,'email_ssl',NULL),(53,'ftp_server',NULL),(54,'ftp_user_name',NULL),(55,'alerts_email','putney.dean@gmail.com'),(56,'checkins','0'),(57,'facebook_appid','375646429210938'),(58,'facebook_appsecret','25bddd7a341927e33a87c19531cca584'),(59,'db_version','102'),(60,'ushahidi_version','2.6.1'),(61,'allow_alerts','1'),(62,'require_email_confirmation','0'),(63,'manually_approve_users','0'),(64,'enable_timeline','0'),(65,'proposal_length','5'),(66,'active_threshold','2'),(67,'certified_threshold','6'),(68,'supporter_value','9'),(69,'proposal_comment_value','9'),(70,'active_future_comment_value','9'),(71,'certified_future_value','9'),(72,'forgot_password_secret','zFI75772C&#I[^Q7G{ZTshTAjHdl{X[?c(1YIteyf_tpkreQV]k7Ij[e{5jwAQKa'),(73,'allow_openid','1');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_devices` (
  `id` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Works with checkins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_devices`
--

LOCK TABLES `user_devices` WRITE;
/*!40000 ALTER TABLE `user_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(64) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='Stores browser tokens assigned to users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
INSERT INTO `user_tokens` VALUES (139,119,'930f9f176b93171fb270653549a3cfe9495b799b','AlZ7YRWxvOPjOP6icxJwcHw7NlqDdW8z',1382924616,1384134216),(138,118,'909c8dbd5c16b743c507b18c34e01c8a06a37499','1l5GakiaSnO8UPUU5aPXAZnr8GuONMlt',1382504053,1383713653),(137,117,'c5e38cdddd104fa0017a689a317f000c765b0f5f','Rcdl82mNhUYn0Vh7gHBRmZBTl8sZwbSi',1382485286,1383694886),(135,115,'410ae57fe612a7c0494384bb303070349b21a92a','xCoZuU9g1f41E6u9liUxwS2MNdvsESiM',1382482295,1383691895),(134,114,'909c8dbd5c16b743c507b18c34e01c8a06a37499','u0gwyeHascItKEPRUwaVSrcmyLmjKP3M',1382481601,1383691201),(133,113,'b4cad5130e3e5343b058c09b026cf26c7843200e','VnFpBatecOGiSO4Uyj7enUqLvNyDPnMS',1382481404,1383691004),(132,112,'dabeb80d503c08fbcc6707577f152a09f799ab7d','i7abxrTmT3omMICJIFbSckGfCWPUCrFi',1382481388,1383690988),(128,108,'1f453eb9b9693c07450ef12ef57581b901d37a04','ktKq7a6hrelUDHbutJzQy39lnvoSTCNm',1382481141,1383690741),(127,7,'173462f0419058270a68343d6a32373f46e9dbb5','7aYIioOGeIfG3M5cZPRDTPDuv7onyndo',1382481140,1383690740),(126,107,'68f6e6017b875fb1a4dda084fb6224129c864c7a','xHoihSQ0IbZsitTqUY97sATPxaFiXUzq',1382474095,1383683695),(124,105,'a302c1a0e7f501226fe7539ffde2b7b298606026','nNQSEk2hBbckXJZUwyZ3NcuUS8QBk4ny',1382199566,1383409166),(123,104,'397edfccd506c97f17fb9e8f66452f2edb260ae9','YA7U2WKvkxPlKfsF16KTzU3VTJWJHAUi',1382048612,1383258212),(121,7,'e6260ba54d101a3279fc30de1fb11abafa873288','QKniUDq5WcoBQQobVAJ4q2MbNlCr8exG',1381879157,1383088757),(120,103,'d6f9e19aec3d5f50ac9f3811a4285cd840547869','TSJSmj9RTi3kIJHLYmZcUFLUncu0jGtd',1381855532,1383065132),(119,102,'96499a88c0416f4686938d9e07b9971827c073c1','ehpP77V6kMQhsTUuRw8Sz61DSil2xXyS',1381806525,1383016125),(118,101,'f65bdc15b4c4be27770bd7d377851f54f58b6ec3','YsENnzbJu5nOSB2EPGAVggksw70KC54D',1381779634,1382989234),(117,100,'d6f9e19aec3d5f50ac9f3811a4285cd840547869','xuueCSOSbrhOfsgqAFvTZz0pRTwz8WfZ',1381779378,1382988978),(116,99,'d6d08a922d4fb03ebc0e1882e7f41ff0b9742d63','Hy5Q8kSb6qq1sgMjU2uQ8bNEVvavw3KV',1381779353,1382988953),(115,98,'d6f9e19aec3d5f50ac9f3811a4285cd840547869','ojeUYyYKqUybYPnTE8nY2bWSmUa8wqub',1381779278,1382988878),(114,97,'e6260ba54d101a3279fc30de1fb11abafa873288','wdOVGumbNdzhmfhs5hfh50TCAWlp9y5U',1381779261,1382988861),(113,96,'d6f9e19aec3d5f50ac9f3811a4285cd840547869','ip2ZAWKUmFFpre47M6BFNYNkDMtXex09',1381779256,1382988856),(101,85,'6e1c38356769095ad76267f9edb43ddae2af1491','YLWXQ2H6rvN7bTnka77TWolkwfw86VDo',1381683140,1382892740),(107,91,'a23c895b5b4f99807a7fb17923af2b824de37576','oQMb6musuE6Elet9bLL61ElMieY9D2FV',1381779209,1382988809),(122,53,'562878de2e032bef97986b35c589c8f4c0d9accc','j7SHMoyIAsfSt9ZnRhMcq1gI36g2YLNF',1381948343,1383157943),(102,86,'d6f9e19aec3d5f50ac9f3811a4285cd840547869','GRzWcQnffBZXyOzugc8DE5FESIdziudB',1381778709,1382988309),(103,87,'df3d724514c2c9c5afc73e6cc38de8ddd82ed3c8','9yKpljyQnRB6ugejHjeEzIhpLAv1cC8I',1381778755,1382988355),(104,88,'9966eb45bf6cfd9cedac733592c1455ad7371a66','aZvMITguKCb3h60o95sw9d5nXlC9QDQi',1381779137,1382988737),(125,106,'277125fe239f7206bb97f7a6f028b2a252635a28','JzEwQnc7gkqVJNgjtbmdbWOYYpJwFJ8u',1382460834,1383670434),(106,90,'bac5473655d61b7d8c5560f5fbd01c0e111d56d1','ShYGufydxi43GhOXxPbHyGsNTEsqrZzJ',1381779205,1382988805),(112,95,'d6f9e19aec3d5f50ac9f3811a4285cd840547869','KhI3Rv18WDLrLeBvSFXehQLZkJ6nCggU',1381779244,1382988844),(111,94,'f65bdc15b4c4be27770bd7d377851f54f58b6ec3','jYHVrH9ciEv8zACBbhA2TB0ITVgsNo3T',1381779242,1382988842),(110,79,'f87f6b213e6fee8db562cec5f37bddfc6da5993f','501Tjipxb4hs8AIwHwuQL97YFnWaWvje',1381779236,1382988836),(108,92,'d6d08a922d4fb03ebc0e1882e7f41ff0b9742d63','RjV3wWBcEQ0Xn8PuzXWDOz4wMWF8gup6',1381779210,1382988810),(109,93,'f65bdc15b4c4be27770bd7d377851f54f58b6ec3','gLC9fwxAq5C8srG1PQ3hM1CYQ2RaeIHu',1381779211,1382988811),(100,84,'ba157978a5b29d7394a35ce80afe6e64fd163e94','CJ7blNKMlPZVYlvDAKhUrjV2DDsTpZme',1381343275,1382552875),(99,83,'98baa0ff56188180d72003c664d3928a2c4c3118','5caDxkBu4rTWI81trlbQZe8VL1hMLlFF',1381336718,1382546318),(131,111,'5e62cc45aa735bb65c1202f809ba54a128a2fbe3','o3ykwMIuk2DX87GZ3QpXoDAShPM8TUJL',1382481320,1383690920),(130,110,'361c07c6a09aed619ff4bf93084fc5c4a43e3a1c','0zrveoornOgEsXfbGve7s0XYGp0b97F8',1382481316,1383690916),(129,109,'9005cfd81847ba7b42e03873d24b13b9dfc2d8e2','jC3XWPtiaVqD0XWpKhyU148UlSOL6uqc',1382481289,1383690889);
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `riverid` varchar(128) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag incase admin opts in for email notifications',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `color` varchar(6) NOT NULL DEFAULT 'FF0000',
  `code` varchar(30) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `public_profile` tinyint(1) NOT NULL DEFAULT '1',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `needinfo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='Stores registered usersâ€™ information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','Administrator','putney.dean@gmail.com','admin','0c777988e5f3fca28b4e025a221753fe70a245ee4d0e147ab3',21,1379953728,0,'2013-09-23 16:28:48','FF0000',NULL,1,0,1,0),(2,'','SQ~','de@detrimental.net','1090509251','1cbdd66eb7df6ea8c8763abba2476dc0a61b527e645789f65e',25,1379969472,0,'2013-09-23 20:51:12','FF0000',NULL,0,1,1,0),(3,'','Guerrilla Futures','jasontester@gmail.com','201400060','dbd57e9e17aa83d8d912301f10c0bbf7391e1fa404579b7ea0',5,1377203805,0,'2013-08-22 20:36:45','FF0000',NULL,0,1,1,0),(4,'','JasonT','jtester@iftf.org','160389172','a01f6849c802542898986d4c12cad7991f395edba5ce159f06',6,1379629333,0,'2013-09-19 22:22:13','FF0000',NULL,0,1,1,0),(5,'','user1373303868','NWeidinger@iftf.org','user1373303868','e8e751025f443d16c2851c7b11bd2383a4416af01fbf7bba2e',14,1374083293,0,'2013-07-17 17:48:13','FF0000',NULL,0,1,1,0),(6,'','user1373305660','dr.weidinger@gmail.com','user1373305660','ac8800105790349456efb4353cd1aa81f631f557efc3e3439a',2,1374172805,0,'2013-07-18 18:40:05','FF0000',NULL,0,1,1,0),(7,'','Furniture','nicolas@wikiseat.org','1294548165','51d49c6e22b43ab47dc9fd9fd5045c33ad10bf48a6d28c682a',36,1383063720,0,'2013-10-29 16:22:00','FF0000',NULL,0,1,1,0),(8,'','NewGAmegame','Jasontester+test1@gmail.com','1564717649','3d6722fc2ed095954d5daf69b353699f31b71dc692f54e2aab',0,NULL,0,'2013-07-11 17:03:00','FF0000',NULL,0,1,1,0),(9,'','wonderosity','ntindall@iftf.org','1191496273','09d238c5e8f7c2ae84de7d9ef0c31dd7bc941338dcac3c04c2',1,1373562314,0,'2013-07-11 17:05:14','FF0000',NULL,0,1,1,0),(10,'','Test Account 2','jasontester+test2@gmail.com','1645896501','1c9f4ef5c0198da037cee6a3160a5d8101739aa6f37a7cf44f',1,1373584012,0,'2013-07-11 23:06:52','FF0000',NULL,0,1,1,0),(11,'','scientist','nicolas.weidinger@gmail.com','900359612','2712bce3003ea02e89ab91bd3af85b51098fd70c849f68d0a6',4,1374172920,0,'2013-07-18 18:42:00','FF0000',NULL,0,1,1,0),(12,'','Test 3','jasontester+test3@gmail.com','199940721','3c5deaf5036a04b1d095d913bb72b3dfcf60e48dee3aa30240',1,1373584624,0,'2013-07-11 23:17:04','FF0000',NULL,0,1,1,0),(13,'','Test Number 6','jasontester+test6@gmail.com','928703033','4075d38066cf2a4f31617f65016e0f365acb71c5a6290c27f0',1,1373925321,0,'2013-07-15 21:55:21','FF0000',NULL,0,1,1,0),(14,'','Test Number 7','jasontester+test7@gmail.com','968100088','aa612cf26c0f3545307863a4c46e4de47b7959ba7bc384f3d1',2,1374079383,0,'2013-07-17 16:43:03','FF0000',NULL,0,1,1,0),(15,'','test','de+mctest1@detrimental.net','test','1917bd5030d0f892a175bcf6abd6ac0b4aae8e263b7ca79513',2,1374617441,1,'2013-07-23 22:10:41','FF0000',NULL,0,1,1,0),(16,'','Deanerino','putney.dean+mctest@gmail.com','2145416034','7a71f7449617f3f43d848065255b1be5d80c1f050c134b16f7',0,NULL,0,'2013-07-16 09:03:22','FF0000',NULL,0,1,1,0),(17,'','Maker Dean','putney.dean+mctest2@gmail.com','1202460517','7f9dfd72454d825f27d67a0646dd61f1b0eb6a21ed1ba1945e',1,1373965616,0,'2013-07-16 09:06:56','FF0000',NULL,0,1,1,0),(18,'','deano','putney.dean+mctest3@gmail.com','1815935794','a60428761e28d4497900053391831709920f35658e738bbde4',1,1374005957,0,'2013-07-16 20:19:17','FF0000',NULL,0,1,1,0),(19,'','Test Account #8','jasontester+test8@gmail.com','242746862','0819528ee48aa88310ba8ea096494e0fc8541fd4155597f54b',1,1374079425,0,'2013-07-17 16:43:45','FF0000',NULL,0,1,1,0),(20,'','Nic','dr.weidinger+1@gmail.com','1669096118','25c8ccb9805accafff54b7676fa9c30e7d26f861eeb6f67e45',1,1374172864,0,'2013-07-18 18:41:04','FF0000',NULL,0,1,1,0),(21,'','apisgirl','alaricmeister@gmail.com','1860937417','401590f9329d60394328b1e71a9b9f509ad3c4e20e69d6f112',1,1374175415,0,'2013-07-18 19:23:35','FF0000',NULL,0,1,1,0),(22,'','shadow','ghlusko@gmail.com','1870095852','41efbcc6c11165f666cbc78da04badf90df3c273eba0ef86a3',1,1374275027,0,'2013-07-19 23:03:47','FF0000',NULL,0,1,1,0),(23,'','arf','ar.fisk@gmail.com','1904718953','7b06f0547e5e01e73fc6e66dabae58ed385fe5b13f1454771e',8,1374502231,0,'2013-07-22 14:10:31','FF0000',NULL,0,1,1,0),(24,'','Rachel Weidinger','rachel.weidinger@gmail.com','user1374435246','27d3866ed2947f3e6d64cfb7beca8772486f705382576228ca',5,1374455164,0,'2013-07-22 01:06:04','FF0000',NULL,0,1,1,0),(25,'','totally','totally@funoninter.net','totally','eefe994b877bedcf77ef447d66be4c5745e35b5019c5224d63',3,1374637331,0,'2013-07-24 03:42:11','FF0000',NULL,0,1,1,0),(26,'','Ashley \'Marz\' Cochran','black_nekura_angel@yahoo.com','user1374553866','6b3839971e38e02c7fb5efc3626cdee0ec86e04a0f557b365c',1,1374553866,0,'2013-07-23 04:31:06','FF0000',NULL,0,1,1,0),(27,'','Roy Skewdles','necrophilia@gmail.com','user1374649495','d4c6761d6af117e05db863a0a088b02d621e4748bf2baba5c7',1,1374649495,0,'2013-07-24 07:04:55','FF0000',NULL,0,1,1,0),(28,'','Testo McGee','de+mctest666@detrimental.net','704044059','d643b49c939aa46fd255335f1514e262b7e7dbc344fae9347b',1,1374649789,0,'2013-07-24 07:09:49','FF0000',NULL,0,1,1,0),(29,'','Cool Dude','cool@dude.com','2079045067','6f820e31fd1d6cf5d9e37bdfc050d0b5499aeee9e0a460ef0b',1,1374650356,0,'2013-07-24 07:19:16','FF0000',NULL,0,1,1,0),(30,'','Final Test','de+finaltest@detrimental.net','1872109562','18b2c20e5e8f4bbbe8ea0c4465f1e5ddb3fdcc4db4b55a2d16',2,1374711710,0,'2013-07-25 00:21:50','FF0000',NULL,0,1,1,0),(31,'','Deanerino','putney.dean+mc3@gmail.com','254239168','e7205aaa7b35cf68960eb93e4c6fa481100e516920816528f2',1,1374773204,0,'2013-07-25 17:26:44','FF0000',NULL,0,1,1,0),(32,'','matthew m','matthew@matthewmichelson.com','1362654187','5d888be14ca443c896914b94faa082e3101b6f9107dd7be782',1,1374780870,0,'2013-07-25 19:34:30','FF0000',NULL,0,1,1,0),(33,'','Maureen','mkirchner@iftf.org','357912871','86d469aafd147c31d4eb8336c4e66c584ce28c61a5944a5fea',2,1381779274,0,'2013-10-14 19:34:34','FF0000',NULL,0,1,1,0),(34,'','cookiedough','jaimeohm@gmail.com','1530006754','219745f19a71f2159c521df5513bddb2b0ab7758d3b1f49031',1,1374786496,0,'2013-07-25 21:08:16','FF0000',NULL,0,1,1,0),(35,'','giannii','g@rawrsoft.com','1594598843','58e9bbbe5c1b40c2b24f5254cc5712a017abbb64205e15bbeb',1,1374792848,0,'2013-07-25 22:54:08','FF0000',NULL,0,1,1,0),(36,'','FooSchnickens','chubsaaaaaay@gmail.com','2024151685','d5b04b63bec85ca42b85457fe1f837269bb18ac0883f36fd3d',1,1374812059,0,'2013-07-26 04:14:19','FF0000',NULL,0,1,1,0),(37,'','Tangaroa','stephanie@stratedgy.co.nz','1386627482','fb7a23d42ec890ccfb29644f3fe62f5e3776223fd4a286e467',1,1375101611,0,'2013-07-29 12:40:11','FF0000',NULL,0,1,1,0),(38,'','A Coulter','ann@acoulterconsulting.com','197269602','1239088c9fdadf61ed7bcff072834a33c13fc56686199ca300',4,1375289568,0,'2013-07-31 16:52:48','FF0000',NULL,0,1,1,0),(39,'','chandni.p','chandani0710@gmail.com','1469170916','e0bf0c1f0573428efa91e3fe69d21328e583c1a663103fb43e',2,1375278255,0,'2013-07-31 13:44:15','FF0000',NULL,0,1,1,0),(40,'','Mikkel Holm Jensen','mhjensen@hotmail.com','user1375317153','b40e6d71479a86b2f4ebf0fb7de2c5b9b680e37d73a5f9d708',1,1375317153,0,'2013-08-01 00:32:33','FF0000',NULL,0,1,1,0),(41,'','mpiper','matthew.j.piper@gmail.com','162167328','bd7d3e82a627ee7f19b48172563a88119aea8b5b5a837bbf66',1,1375361024,0,'2013-08-01 12:43:44','FF0000',NULL,0,1,1,0),(42,'','Micha Becker','micha.becker@gmx.de','1114138077','78ababd13db71e890b038bef98bcf83a9fb2e3f925d5d59e76',1,1375389441,0,'2013-08-01 20:37:21','FF0000',NULL,0,1,1,0),(43,'','Marek','markowymarek@gmail.com','1233796641','4a821238baf5540e6e7d261844bd06e06e260bc3de210c0839',1,1375875396,0,'2013-08-07 11:36:36','FF0000',NULL,0,1,1,0),(44,'','A_G','agoldman@iftf.org','1752577619','7c17c11aaf25b9f07526b85da5e248bbf6347d97e0c9b00d9b',8,1377202786,0,'2013-08-22 20:19:46','FF0000',NULL,0,1,1,0),(45,'','D-Kly','cnowacki@stanford.edu','630620487','3a72c2556bd0e9570307c1172ea0cfbf00d2fb2af9813a8e4b',3,1376408248,0,'2013-08-13 15:37:28','FF0000',NULL,0,1,1,0),(46,'','Greg Richardson','greg@crowdfiber.com','301426583','edfd7b12375a8171eb8ae4c1b12ee011b87224909d0a7adcbc',3,1376659892,0,'2013-08-16 13:31:32','FF0000',NULL,0,1,1,0),(47,'','user1376577814','steve@enived.com','user1376577814','d5cb94b7ade55da6890b6a70b9e6619ad66425a288afab65fb',1,1376577814,0,'2013-08-15 14:43:34','FF0000',NULL,0,1,1,0),(48,'','Denny Nolan','oliver3twist@gmail.com','1898230896','bca7011a63a0f0bc38b645d880633d0edb7d9ab963c78711e4',1,1376578464,0,'2013-08-15 14:54:24','FF0000',NULL,0,1,1,0),(49,'','lilyputty','lillianshaw@me.com','1984188640','0806a12bc0492b6a394c89650040ab08f99434674c5bd62da5',1,1376585816,0,'2013-08-15 16:56:56','FF0000',NULL,0,1,1,0),(50,'','user1376774107','khushboo.balwani9@gmail.com','user1376774107','9b3a32038f38a968723c7c96a7c173c514779a09058df6c35a',1,1376774107,0,'2013-08-17 21:15:07','FF0000',NULL,0,1,1,0),(51,'','user1377022521','beemedha@gmail.com','user1377022521','75ce3141f5110cb1d3ddde54d2a54a1e3b6ccee5d1389158e8',4,1377188797,0,'2013-08-22 16:26:37','FF0000',NULL,0,1,1,0),(52,'','Applesauce','dr.weidinger+2@gmail.com','379410915','3dd3481c51c9a4883318dce438380e04b1ed6a42b168c7d744',6,1377456679,0,'2013-08-25 18:51:19','FF0000',NULL,0,1,1,0),(53,'','CrazyI','asaulgoldman@gmail.com','371123100','9ef12c418ab2e2060884e62cc986193b2c248874b7af5d7ac4',42,1382980420,0,'2013-10-28 17:13:40','FF0000',NULL,0,1,1,0),(54,'','Erika Fiola','efiola@cincinnatichamber.com','1640910136','24a8d1b7858db5b442d6c355c6cf890fe9ba534a479d0d5d0c',1,1377275538,0,'2013-08-23 16:32:18','FF0000',NULL,0,1,1,0),(55,'','Jara von Luepke','jaramarie@gmx.de','user1377284817','07ffb1c45f9a9e2ef953801d93a7eeafa61caa6f6d9f97f944',6,1378296887,0,'2013-09-04 12:14:47','FF0000',NULL,0,1,1,0),(56,'','ArttVision','ggvosas2@gmail.com','758240710','c6f53dd085e9acd87483010d9a492e3b5f1ae6f3454bdb2b78',1,1377470795,0,'2013-08-25 22:46:35','FF0000',NULL,0,1,1,0),(57,'','Josep Roig','jroig@uclg.org','1337958226','359a9d7c9398caa370731e8a694915f691653cccc596bf8cab',2,1378119764,0,'2013-09-02 11:02:44','FF0000',NULL,0,1,1,0),(58,'','Bogucki','katelyn@littlebits.cc','185522564','ebe0c3b6c914a653137341446bd1e099c5848c7091114edaa8',1,1377702517,0,'2013-08-28 15:08:37','FF0000',NULL,0,1,1,0),(59,'','gculver','gculver22@gmail.com','1324250699','c00ac8f726072a11f660d1530fbd560c63f61f706b0ff4b0a5',1,1377717801,0,'2013-08-28 19:23:21','FF0000',NULL,0,1,1,0),(60,'','Catia Jardim','catia.jardim@gmail.com','user1377767648','4e72c99787733c7c39340847e975ef5537b281ad20cdaaac70',1,1377767648,0,'2013-08-29 09:14:08','FF0000',NULL,0,1,1,0),(61,'','Sebastián PERNET','sebastian.pernet@y4pt.org','1281726034','d630a274d8b9205aa6dafb4fd95987fc2b1271610a50702c2d',1,1377967414,0,'2013-08-31 16:43:34','FF0000',NULL,0,1,1,0),(62,'','Ivan Paradinović','parada82@gmail.com','user1378061277','7458bfbedc5f7928464a76956c2a707fd0ec3e77d1fa4822c1',1,1378061277,0,'2013-09-01 18:47:57','FF0000',NULL,0,1,1,0),(63,'','Lene','marlene.modick@heidelberg.de','14840027','2de9d60df0f39b222c3e2d706bba2a01a7996bf0e199c7e818',3,1378386464,0,'2013-09-05 13:07:44','FF0000',NULL,0,1,1,0),(64,'','Lindsea','lindseak@gmail.com','1154065575','c2cc736691a2c211d1303c35e5bffbe5326d340ec247776e58',3,1379355241,0,'2013-09-16 18:14:01','FF0000',NULL,0,1,1,0),(65,'','Heather','cassiopeaurora@gmail.com','1363091576','fc0799585af0ce727d8b38deae0e684233e67f9622cebbac50',2,1379470950,0,'2013-09-18 02:22:30','FF0000',NULL,0,1,1,0),(66,'','renepare','pare@dse.nl','886118334','aafb3eb56231d434235e3e64b220af960ce9d4cf2823e4e893',1,1379373606,0,'2013-09-16 23:20:06','FF0000',NULL,0,1,1,0),(67,'','user1379382690','piratenspacko@gmail.com','user1379382690','a61ae1b65c1cf9854777f1d0bb4d2c9760181f3840aa91e946',2,1379388162,0,'2013-09-17 03:22:42','FF0000',NULL,0,1,1,0),(68,'','neustadtpiraten','inkorrupt@gmx.de','1810673439','811bc9eed0e8632bbffc4ebb7481b5e3448ffaa599ad43fb34',3,1379534395,0,'2013-09-18 19:59:55','FF0000',NULL,0,1,1,0),(69,'','Ted Tagami','digitalbuddha@gmail.com','user1379390083','dc75a6410de7c99a56c2c83b9ff0ea3cec9bcd1e37dd655f88',1,1379390083,0,'2013-09-17 03:54:43','FF0000',NULL,0,1,1,0),(70,'','lloyd','smoke904@trash-mail.com','1718886971','e8f744a696a80cf675f13566659fd7ee0d44f4ee69416a3f07',1,1379422208,0,'2013-09-17 12:50:08','FF0000',NULL,0,1,1,0),(71,'','user1379423415','eazel7@gmail.com','user1379423415','0164d087ba2c01466acebf5dfe1769f8ddcc720357a0fe9bfd',2,1379425289,0,'2013-09-17 13:41:29','FF0000',NULL,0,1,1,0),(72,'','Jorge Camacho','jcamachor@yahoo.com','user1379432947','a5871d2050e6ca0dcc12c3b750d788795ed0ceedbb7ea4b2e9',1,1379432947,0,'2013-09-17 15:49:07','FF0000',NULL,0,1,1,0),(73,'','Rachelkeas','rhatch@iftf.org','672510141','50774d88cc1be12e7a00b093f94c3785cd467c4798c77931e0',17,1381779296,0,'2013-10-14 19:34:56','FF0000',NULL,0,1,1,0),(74,'','Carol','Cardress@aol.com','1220054418','bb46bb3c73bb28123f625148100d98532a2990305ba0bf1427',1,1379518394,0,'2013-09-18 15:33:14','FF0000',NULL,0,1,1,0),(75,'','Steve-O','ssimpson12@sbcglobal.net','1750607559','fb33f4ccfde86b719286e825124be86095949c2669f0cd78a2',1,1379955022,0,'2013-09-23 16:50:22','FF0000',NULL,0,1,1,0),(76,'','biobits','egentry@iftf.org','1292987041','71d73bb54d8e70629ccfa5b59809482100ac900298faca78d0',3,1380302169,0,'2013-09-27 17:16:09','FF0000',NULL,0,1,1,0),(77,'','Sophie','sophie@swissnexsf.org','92619443','3a1992f6cc43759f71d6416183952fc825ac2a43781d665add',1,1380218272,0,'2013-09-26 17:57:52','FF0000',NULL,0,1,1,0),(78,'','Daniel_Katz','danieljkatz@gmail.com','DanielKatz','cd27c95a0edf11ac9b548b86cc61f5633d62e3fdcc3db71661',4,1381424350,0,'2013-10-10 16:59:10','FF0000',NULL,0,1,1,0),(79,'','Future-Facing','sskvirsky@iftf.org','643463823','df4002ba51800b19557a6feb9b63ddde4407bf0514f461e24e',2,1381779236,0,'2013-10-14 19:33:56','FF0000',NULL,0,1,1,0),(80,'','Ashley Curtis','beachinswim@aol.com','user1380836415','6a31dfeac02a63b43ccbe6c8bdf438042d36775c38cab63ca0',1,1380836415,0,'2013-10-03 21:40:15','FF0000',NULL,0,1,1,0),(81,'','Maciek Czarnik','czajnikowski@gmail.com','user1381182576','e87150ee85157e54c588e1aff7303bac069b12b97a0ef5406c',1,1381182576,0,'2013-10-07 21:49:36','FF0000',NULL,0,1,1,0),(82,'','Rebeca Dreicon','rebeca.dreicon@hotmail.com','1030662072','6815e2e7c503f2cd98125293115237481538bc7d2ca45e9bb4',1,1381263285,0,'2013-10-08 20:14:45','FF0000',NULL,0,1,1,0),(83,'','Emajec','et453@comcast.net','366822571','17717523bff95d4d8faafa79888bc5fcaccac7204b84fa1f8f',1,1381336718,0,'2013-10-09 16:38:38','FF0000',NULL,0,1,1,0),(84,'','Random','david.hegwood@gmail.com','1259878622','5d95f0fd9ef6eb223b4305e4c690be7150cd9d9cbb1990adc6',1,1381343275,0,'2013-10-09 18:27:55','FF0000',NULL,0,1,1,0),(85,'','cujomatty','m.carrabs@hotmail.ca','553002711','de3c156e26e7dc0cc3a6fbc5fff33880b3b3a7175ec975eb33',1,1381683140,0,'2013-10-13 16:52:20','FF0000',NULL,0,1,1,0),(86,'','bradganistan','bkreit@iftf.org','1326550132','5ad823acb920e97b4278bd78f57cad32cf07539393344e8634',13,1382629561,0,'2013-10-24 15:46:01','FF0000',NULL,0,1,1,0),(87,'','BH1981','bhamamoto@iftf.org','1556149261','92afa7852e709ba0a8248ec6f8961b86efbd1a797ab9ff3dab',2,1382122170,0,'2013-10-18 18:49:30','FF0000',NULL,0,1,1,0),(88,'','sarah','ssmith@iftf.org','351593829','919e3cab5db628c3d6d87a7f855d786703397330cf3b181c97',1,1381779137,0,'2013-10-14 19:32:17','FF0000',NULL,0,1,1,0),(89,'','Rebecca Chesney','rebeccachesney@gmail.com','user1381779160','1208cfeb213ba5b907f909496cecf4e58538ff0435b131a8b1',1,1381779160,0,'2013-10-14 19:32:40','FF0000',NULL,0,1,1,0),(90,'','M 88','mlowsf@aol.com','431300454','63ea1b5463589593756e1d9d492f00b69afe94d05eaafa1e98',1,1381779205,0,'2013-10-14 19:33:25','FF0000',NULL,0,1,1,0),(91,'','Transcendentalist','bwarburg@iftf.org','921247257','a76ac9e3958f206f61368471d25f5fb1856229887a13abec6a',1,1381779209,0,'2013-10-14 19:33:29','FF0000',NULL,0,1,1,0),(92,'','makerme','tfinlev@iftf.org','1568198880','9f381b091032de555020cd2e96c16f92fe5d38fd5a86173a7c',1,1381779210,0,'2013-10-14 19:33:30','FF0000',NULL,0,1,1,0),(93,'','dunagan23','jdunagan@iftf.org','257215349','72836f5a359e45f4c6bfc273bdd6fa4e680044583f7e5d3d3b',1,1381779211,0,'2013-10-14 19:33:31','FF0000',NULL,0,1,1,0),(94,'','j2hagan','jean.hagan@gmail.com','348618728','b0ce3841bd488ddd1c5497fe8808a2abbcea175c84aea2b75f',7,1382538854,0,'2013-10-23 14:34:14','FF0000',NULL,0,1,1,0),(95,'','mgorbis','mgorbis@iftf.org','1772412427','66d53b41c578fd082874687b6ceeec69489fad4e9940fcb221',1,1381779244,0,'2013-10-14 19:34:04','FF0000',NULL,0,1,1,0),(96,'','Laurel Funkhouser','lfunkhouser@iftf.org','256579010','b4befa359a6c974e263ef1950637ec67f857e515be6e33e834',2,1382651484,0,'2013-10-24 21:51:24','FF0000',NULL,0,1,1,0),(97,'','MJohnson','MJohnson@iftf.org','917971901','3090f0a9e824a2cd572cd148f3db83ebc9ea75b071ac391e4d',1,1381779261,0,'2013-10-14 19:34:21','FF0000',NULL,0,1,1,0),(98,'','happytime','nlazkani@iftf.org','225234299','baa74dce6bb1bd5201942fff59a4e196171ca90c9f5f5c9267',2,1381790683,0,'2013-10-14 22:44:43','FF0000',NULL,0,1,1,0),(99,'','kayvee','kvian@iftf.org','887749094','a779af06856380fa85e23924b777e6405145bbe31cb704408a',1,1381779354,0,'2013-10-14 19:35:54','FF0000',NULL,0,1,1,0),(100,'','MoK','maureenkirchner@gmail.com','690945088','c58fd9e2f98798162ff461c96d472adfbfb9ed6d0c321c7ed9',1,1381779378,0,'2013-10-14 19:36:18','FF0000',NULL,0,1,1,0),(101,'','futrmyr','mavery@iftf.org','1407158693','7f2e8123aff5c739669afeddb62e6e7153d9d29762a9a289b7',2,1381956074,0,'2013-10-16 20:41:14','FF0000',NULL,0,1,1,0),(102,'','Hannah Chesney','hannahchesney@gmail.com','1356530036','178190b3964c27b0e6db2afa171e04b8b5c719f93fec2732d9',2,1381869979,0,'2013-10-15 20:46:19','FF0000',NULL,0,1,1,0),(103,'','GinChes','gchesney@wc.edu','1356534681','ba7637780f617550e5bcccea0ff2151ef3b58843082a096787',1,1381855532,0,'2013-10-15 16:45:32','FF0000',NULL,0,1,1,0),(104,'','falcon','rfalcon@iftf.org','501149474','a3d83129461425784503a4e378e8f72a982ccea49abfd4ae10',1,1382048612,0,'2013-10-17 22:23:32','FF0000',NULL,0,1,1,0),(105,'','Cynthia Scott','cscott@cynthiascott.net','1593911382','f1dbbb223a0ff11990bba7dddbf275aa203d558a8ec282f5e0',1,1382199566,0,'2013-10-19 16:19:26','FF0000',NULL,0,1,1,0),(106,'','jasmine','1jasminezimmerman@gmail.com','1725039521','0e97b7910ddaf7dcd19c7623d0bb45123ff7325a921c9c26f6',2,1382642528,0,'2013-10-24 19:22:08','FF0000',NULL,0,1,1,0),(107,'','Wilson Ribeiro Jr.','wribeiro.gpp@gmail.com','user1382474095','7b4c5b0b067a957f0ce05c60b3f5605714523b2829b2fb6143',1,1382474095,0,'2013-10-22 20:34:55','FF0000',NULL,0,1,1,0),(108,'','bilal','bg@bilalghalib.com','809736522','de06fc26d7f035067e2d292ebef9b7ab7b3b6081766c222d6f',5,1382557905,0,'2013-10-23 19:51:45','FF0000',NULL,0,1,1,0),(109,'','Innovate_EconDev','matt.chwierut@sanjoseca.gov','1039491554','b95e5a2a37eef841edb64efd3964ace0806b1f17ea4a555615',3,1382499437,0,'2013-10-23 03:37:17','FF0000',NULL,0,1,1,0),(110,'','Spock Picard','nickpinkston@gmail.com','1154533827','87e70de5366b307dbba44fe9fb7a80f5f45bcbe567e4164358',2,1382543540,0,'2013-10-23 15:52:20','FF0000',NULL,0,1,1,0),(111,'','Fenry Hord','jerryp@gmail.com','1692684823','4a37433c7e26d6b7378a874a8b99aae6bceed7c9a6bfa142bd',13,1382972786,0,'2013-10-28 15:06:26','FF0000',NULL,0,1,1,0),(112,'','Jon Worona','jonworona@yahoo.com','1696063169','437565e7da994e05b462b169361b418f59cc34c48f4cf55ff5',2,1382482809,0,'2013-10-22 23:00:09','FF0000',NULL,0,1,1,0),(113,'','Mike Zuckerman','michaelpzuckerman@yahoo.com','user1382481404','b04bb44edcae50d970265cf7f14b6f7d1e8db8817ad68683e7',2,1382482258,0,'2013-10-22 22:50:58','FF0000',NULL,0,1,1,0),(114,'','Neal Gorenflo','gorenflo@gmail.com','user1382481601','92425890bd4636b47d284c4deffc21728b7f536168701d9386',1,1382481601,0,'2013-10-22 22:40:01','FF0000',NULL,0,1,1,0),(115,'','makerman','etan.ayalon@gmail.com','2002509547','cc9919c1762cc6c42fb14449c7e80955819e6016ba609ee1d9',1,1382482295,0,'2013-10-22 22:51:35','FF0000',NULL,0,1,1,0),(116,'','Star','hi@starsimpson.com','2144384076','f57d666b0a364ebecf6b7961a08099cb718bc9e9b7669f1262',1,1382482514,0,'2013-10-22 22:55:14','FF0000',NULL,0,1,1,0),(117,'','user1382485286','sabrina.dominguez@gmail.com','user1382485286','165d21bbeeea8678548eaf3dcb2c4e333c69202d50e2889b28',1,1382485286,0,'2013-10-22 23:41:26','FF0000',NULL,0,1,1,0),(118,'','Aaron Selverston','aaron@owlized.com','1135808248','7b34b7fc9b83e64dff355bc67dfa246701567d10ebdf00bea8',1,1382504053,0,'2013-10-23 04:54:13','FF0000',NULL,0,1,1,0),(119,'','anthroacoustic','timmons.n@gmail.com','16527711','2553f4d02e165e1f1ea5a8298ab1184a2f5235997058e6409b',1,1382924616,0,'2013-10-28 01:43:36','FF0000',NULL,0,1,1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verified`
--

DROP TABLE IF EXISTS `verified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verified` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `verified_date` datetime DEFAULT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores all verified reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verified`
--

LOCK TABLES `verified` WRITE;
/*!40000 ALTER TABLE `verified` DISABLE KEYS */;
INSERT INTO `verified` VALUES (1,2,1,'2013-06-14 17:22:33',1);
/*!40000 ALTER TABLE `verified` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-29 17:18:51
