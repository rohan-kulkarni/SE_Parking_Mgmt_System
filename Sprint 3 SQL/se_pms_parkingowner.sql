-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: se_pms
-- ------------------------------------------------------
-- Server version	5.5.56

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
-- Table structure for table `parkingowner`
--

DROP TABLE IF EXISTS `parkingowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkingowner` (
  `PO_id` int(11) NOT NULL AUTO_INCREMENT,
  `PO_fullName` varchar(45) DEFAULT NULL,
  `PO_contactNo` varchar(45) DEFAULT NULL,
  `Users_user_id` int(11) NOT NULL,
  `PO_address` varchar(45) DEFAULT NULL,
  `PO_city` varchar(45) DEFAULT NULL,
  `PO_state` varchar(45) DEFAULT NULL,
  `PO_zip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PO_id`,`Users_user_id`),
  KEY `fk_ParkingOwner_Users_idx` (`Users_user_id`),
  CONSTRAINT `fk_ParkingOwner_Users` FOREIGN KEY (`Users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkingowner`
--

LOCK TABLES `parkingowner` WRITE;
/*!40000 ALTER TABLE `parkingowner` DISABLE KEYS */;
INSERT INTO `parkingowner` VALUES (1,'Harnish Shah','123454574',3,'468 Washington Ave','Albany','NY','12203'),(2,'Preet Patel','9876543210',8,'800 Washungton Ave','new york','NY','12200');
/*!40000 ALTER TABLE `parkingowner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-05 20:23:59
