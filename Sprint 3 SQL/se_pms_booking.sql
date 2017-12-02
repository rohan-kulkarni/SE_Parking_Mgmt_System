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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `B_id` int(11) NOT NULL AUTO_INCREMENT,
  `B_estEntry` varchar(45) DEFAULT NULL,
  `B_estExit` varchar(45) DEFAULT NULL,
  `B_actEntry` varchar(45) DEFAULT NULL,
  `B_actExit` varchar(45) DEFAULT NULL,
  `B_date` date DEFAULT NULL,
  `B_vehicleType` varchar(45) DEFAULT NULL,
  `VehicleOwner_VO_id` int(11) NOT NULL DEFAULT '1',
  `Parking_P_id` int(11) NOT NULL DEFAULT '1',
  `B_contact_no` varchar(45) DEFAULT NULL,
  `B_regNo` varchar(45) DEFAULT NULL,
  `B_name` varchar(45) DEFAULT NULL,
  `B_bookingDate` varchar(45) DEFAULT NULL,
  `B_bookingtype` varchar(45) DEFAULT NULL,
  `B_flag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`B_id`,`VehicleOwner_VO_id`,`Parking_P_id`),
  KEY `fk_Booking_VehicleOwner1_idx` (`VehicleOwner_VO_id`),
  KEY `fk_Booking_Parking1_idx` (`Parking_P_id`),
  CONSTRAINT `fk_Booking_Parking1` FOREIGN KEY (`Parking_P_id`) REFERENCES `parking` (`P_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_VehicleOwner1` FOREIGN KEY (`VehicleOwner_VO_id`) REFERENCES `vehicleowner` (`VO_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (146,'12:00','12:00',NULL,NULL,'2017-12-20','4-Wheeler',1,4,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',1),(147,'12:00','12:00',NULL,NULL,'2017-12-21','4-Wheeler',1,4,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(148,'12:00','12:00',NULL,NULL,'2017-12-22','4-Wheeler',1,4,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(149,'12:00','12:00',NULL,NULL,'2017-12-23','4-Wheeler',1,4,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(150,'12:00','12:00',NULL,NULL,'2017-12-24','4-Wheeler',1,4,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(151,'12:00','12:00',NULL,NULL,'2017-12-25','4-Wheeler',1,4,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(152,'11:00','12:00',NULL,NULL,'2017-12-20','4-Wheeler',1,1,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',1),(153,'11:00','12:00',NULL,NULL,'2017-12-21','4-Wheeler',1,1,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(154,'11:00','12:00',NULL,NULL,'2017-12-22','4-Wheeler',1,1,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(155,'11:00','12:00',NULL,NULL,'2017-12-23','4-Wheeler',1,1,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(156,'11:00','12:00',NULL,NULL,'2017-12-20','4-Wheeler',1,1,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-20','ONLINE',1),(157,'11:00','12:00','13:36','00:00','2017-12-20','4-Wheeler',1,1,'123456789','NYCH0123','Apoorva Kshirsagar','2017-11-18','ONLINE',1),(158,'00:00','00:00','13:34','00:00','2017-11-21','2-Wheeler',1,1,'8087392227','12345','Rohan',NULL,NULL,0),(159,'00:00','00:00','13:34','00:00','2017-11-21','4-Wheeler',1,1,'8087392227','123456','Harnish',NULL,NULL,0),(160,'12:00','12:00',NULL,NULL,'2017-11-22','4-Wheeler',1,1,'123456789','NYCH012','Apoorva Kshirsagar','2017-11-21','ONLINE',1),(161,'12:00','12:00',NULL,NULL,'2017-11-23','4-Wheeler',1,1,'123456789','NYCH012','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(162,'12:00','12:00','15:37','00:00','2017-12-25','4-Wheeler',1,1,'123456789','NYCH012','Apoorva Kshirsagar','2017-11-21','ONLINE',1),(163,'12:00','12:00',NULL,NULL,'2017-12-26','4-Wheeler',1,1,'123456789','NYCH012','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(164,'12:00','12:00',NULL,NULL,'2017-12-27','4-Wheeler',1,1,'123456789','NYCH012','Apoorva Kshirsagar','2017-11-21','ONLINE',0),(165,'12:00','12:00',NULL,NULL,'2017-12-28','4-Wheeler',1,1,'123456789','NYCH012','Apoorva Kshirsagar','2017-11-21','ONLINE',0);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-21 17:21:55
