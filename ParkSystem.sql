-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ParkSystem
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `lv` int(11) DEFAULT NULL,
  `passwd` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'zhang',1,'Mdzz1234'),(2,'zhong',1,'Mdzz1234'),(3,'chen',1,'Mdzz1234');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerId` varchar(19) DEFAULT NULL,
  `carNo` varchar(10) DEFAULT NULL,
  `placeNo` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'485163579456825136','沪A66888',1),(5,'123454367980734512','粤A01010',8);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free`
--

DROP TABLE IF EXISTS `free`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `free` (
  `total` int(11) NOT NULL,
  `remain` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free`
--

LOCK TABLES `free` WRITE;
/*!40000 ALTER TABLE `free` DISABLE KEYS */;
INSERT INTO `free` VALUES (7,4);
/*!40000 ALTER TABLE `free` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `id` varchar(19) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES ('485163579456825136','sun','19867924627'),('123454367980734512','hong','34598788562');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `no` int(10) unsigned NOT NULL,
  `class` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `cardNo` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,1,0,1),(2,0,NULL,NULL),(3,0,NULL,NULL),(4,0,NULL,NULL),(5,0,NULL,NULL),(6,1,NULL,NULL),(7,0,NULL,NULL),(8,1,0,5),(9,1,NULL,NULL),(10,0,NULL,NULL),(11,0,NULL,NULL);
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carNo` varchar(10) DEFAULT NULL,
  `carClass` int(11) DEFAULT NULL,
  `inTime` datetime DEFAULT NULL,
  `outTime` datetime DEFAULT NULL,
  `sum` float DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,'浙AZW182',1,'2019-01-01 15:12:34','2019-04-03 00:14:40',13158.2),(2,'沪A66666',1,'2019-04-02 22:26:56','2019-04-03 00:18:26',11.1),(3,'沪A67890',1,'2019-04-02 22:32:24','2019-04-03 00:13:38',10.1),(4,'沪A67892',1,'2019-04-02 22:34:50','2019-04-03 00:18:37',10.3),(5,'沪A12345',0,'2019-04-03 00:28:25','2019-04-03 00:30:02',0.2),(6,'沪A66600',0,'2019-04-03 00:38:26','2019-04-03 00:38:32',0),(7,'沪A67898',1,'2019-04-03 00:41:46','2019-04-03 00:41:54',0),(8,'沪A67899',1,'2019-04-03 00:46:23','2019-04-03 00:46:28',0),(9,'沪A67888',1,'2019-04-03 00:50:33','2019-04-03 00:50:39',0),(10,'沪A66888',1,'2019-04-03 01:50:11','2019-04-03 01:53:44',0),(11,'沪A12349',0,'2019-04-03 02:13:12','2019-04-03 02:31:20',2.7),(12,'沪A67891',1,'2019-04-03 02:13:27','2019-04-03 02:31:42',1.8),(13,'沪A66600',1,'2019-04-03 02:21:51','2019-04-03 02:31:54',1),(14,'沪A66888',1,'2019-04-03 02:22:02','2019-04-03 02:32:18',0),(15,'沪A66666',1,'2019-04-03 02:22:11','2019-04-03 02:32:06',0.9),(17,'沪A66887',0,'2019-04-03 02:33:32','2019-04-03 02:35:54',0.3),(18,'浙A1Q2W3',0,'2019-04-03 02:36:23','2019-04-03 02:57:10',3),(19,'沪A66888',1,'2019-04-03 02:55:25','2019-04-03 02:56:38',0),(20,'鲁Q13579',0,'2019-04-03 16:30:25','2019-04-08 16:24:11',1079),(21,'沪AZCLSB',1,'2019-04-08 16:22:20','2019-04-08 16:22:34',0),(22,'苏B24680',0,'2019-04-08 16:41:05','2019-04-12 12:06:04',822.6),(23,'沪A67890',1,'2019-04-12 12:04:31',NULL,NULL),(24,'沪AZCLSB',1,'2019-04-12 12:04:40','2019-04-14 16:36:57',315.2),(25,'浙AZW182',1,'2019-04-12 12:04:53',NULL,NULL),(26,'京A00001',0,'2019-04-12 12:05:09',NULL,NULL);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 17:14:44
