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
-- Table structure for table `vehicleowner`
--

DROP TABLE IF EXISTS `vehicleowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicleowner` (
  `VO_id` int(11) NOT NULL AUTO_INCREMENT,
  `VO_fullName` varchar(255) NOT NULL,
  `VO_contactNo` varchar(25) DEFAULT NULL,
  `Users_user_id` int(11) NOT NULL,
  `VO_address` varchar(45) DEFAULT NULL,
  `VO_state` varchar(45) DEFAULT NULL,
  `VO_city` varchar(45) DEFAULT NULL,
  `VO_zip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`VO_id`,`Users_user_id`),
  KEY `fk_VehicleOwner_Users1_idx` (`Users_user_id`),
  CONSTRAINT `fk_VehicleOwner_Users1` FOREIGN KEY (`Users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicleowner`
--

LOCK TABLES `vehicleowner` WRITE;
/*!40000 ALTER TABLE `vehicleowner` DISABLE KEYS */;
INSERT INTO `vehicleowner` VALUES (1,'Rahul Sarkar','123456789',2,'470 Western Ave','NY','Albany','11111'),(2,'Kush Patel','5555555555',17,'1400 Washington Ave','NJ','NJ','11111');
/*!40000 ALTER TABLE `vehicleowner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-05 20:24:03
