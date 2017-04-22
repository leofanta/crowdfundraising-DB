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
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `uid` varchar(40) NOT NULL,
  `pid` varchar(40) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `commenttime` datetime NOT NULL,
  PRIMARY KEY (`uid`,`pid`,`commenttime`),
  KEY `pid_comment_idx` (`pid`),
  CONSTRAINT `pid_comment` FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid_comment` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES ('000','007','marvelous','2016-08-04 00:00:00'),('000','008','wondeful','2017-03-04 00:00:00'),('000','009','It\'s great!','2016-03-04 00:00:00'),('001','005','beautiful','2016-03-04 00:00:00'),('001','006','excellent','2016-10-04 00:00:00'),('002','002','lovely','2017-03-04 00:00:00'),('002','009','awesome','2016-10-21 00:00:00'),('005','003','attractive','2016-05-21 00:00:00'),('005','007','naive','2016-11-21 00:00:00'),('005','008','excited','2016-12-21 00:00:00'),('006','000','sweet','2017-04-21 00:00:00'),('006','001','too young','2017-01-21 00:00:00'),('006','002','plus one','2017-03-21 00:00:00'),('007','000','spectacular','2017-01-06 00:00:00'),('007','000','unstoppable','2017-02-21 00:00:00'),('007','008','unprecedented','2016-12-21 00:00:00'),('008','003','pretty','2016-10-21 00:00:00'),('008','005','a good option','2016-10-21 00:00:00'),('009','000','incredible','2017-01-21 00:00:00'),('010','001','eternal','2016-10-21 00:00:00'),('010','003','super','2016-03-21 00:00:00'),('010','004','sorrowful','2017-01-21 00:00:00');
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-21 21:46:39
