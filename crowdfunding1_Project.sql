-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: crowdfunding1
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `pid` varchar(40) NOT NULL,
  `pname` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `sample` longblob,
  `category` varchar(45) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `deadline` datetime NOT NULL,
  `minfund` decimal(10,2) NOT NULL,
  `maxfund` decimal(10,2) NOT NULL,
  `currentfund` decimal(10,2) NOT NULL DEFAULT '0.00',
  `issuccess` tinyint(4) NOT NULL DEFAULT '0',
  `iscomplete` tinyint(4) NOT NULL DEFAULT '0',
  `updatetime` datetime NOT NULL,
  `isreleased` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES ('000','mona linda','This is a description.',NULL,'art','2017-01-01 00:00:00','2017-02-01 00:00:00','2017-03-01 00:00:00',50.00,500.00,15.99,0,1,'2017-01-15 00:00:00',0),('001','the luna night','This is a description.',NULL,'jazz','2016-10-01 00:00:00','2017-05-01 00:00:00','2017-03-30 00:00:00',30.00,100.00,37.46,1,1,'2017-03-17 00:00:00',0),('002','the last lunch','This is a description.',NULL,'art','2017-02-04 00:00:00','2017-04-01 00:00:00','2017-05-30 00:00:00',40.00,240.00,45.00,1,0,'2017-04-17 00:00:00',0),('003','Jen Eyre','This is a description.',NULL,'literature','2015-12-30 00:00:00','2016-05-30 00:00:00','2017-03-20 00:00:00',100.00,300.00,33.00,0,1,'2016-03-01 00:00:00',0),('004','jazz movie-I love NY','This is a description',NULL,'jazz','2016-01-01 00:00:00','2017-05-01 00:00:00','2018-01-01 00:00:00',12345.67,123456.78,8086.33,0,0,'2017-01-15 00:00:00',0),('005','poem I','This is a description',NULL,'literature','2016-01-01 00:00:00','2016-03-01 00:00:00','2016-04-01 00:00:00',50.00,200.00,138.00,1,1,'2016-04-15 00:00:00',0),('006','poem II','This is a description',NULL,'literature','2016-04-02 00:00:00','2016-05-01 00:00:00','2016-06-01 00:00:00',100.00,200.00,200.00,1,1,'2016-07-01 00:00:00',0),('007','poem III','This is a description',NULL,'jazz','2016-07-01 00:00:00','2016-08-01 00:00:00','2016-09-01 00:00:00',200.00,700.00,700.00,1,1,'2016-09-25 00:00:00',0),('008','jazz poetry collection','This is a description',NULL,'literature','2016-11-01 00:00:00','2017-06-01 00:00:00','2017-05-01 00:00:00',1000.00,5000.00,5000.00,1,0,'2016-04-17 00:00:00',0),('009','sketches of Spain','This is a description',NULL,'music','2016-02-11 00:00:00','2016-05-12 00:00:00','2017-01-03 00:00:00',100.00,1000.00,857.00,1,1,'2017-02-11 00:00:00',0);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-21 21:46:40
