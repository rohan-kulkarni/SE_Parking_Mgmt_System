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
  `B_bookingtype` varchar(45) DEFAULT 'OFFLINE',
  `B_flag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`B_id`,`VehicleOwner_VO_id`,`Parking_P_id`),
  KEY `fk_Booking_VehicleOwner1_idx` (`VehicleOwner_VO_id`),
  KEY `fk_Booking_Parking1_idx` (`Parking_P_id`),
  CONSTRAINT `fk_Booking_Parking1` FOREIGN KEY (`Parking_P_id`) REFERENCES `parking` (`P_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_VehicleOwner1` FOREIGN KEY (`VehicleOwner_VO_id`) REFERENCES `vehicleowner` (`VO_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (166,'00:00','00:00','17:54','00:00','2017-12-04','2-Wheeler',1,1,'1234567890','123TH','Rohan','2017-12-04','OFFLINE',0),(167,'12:00','12:00',NULL,NULL,'2017-12-12','4-Wheeler',1,1,'123456789','NYCH012','Rahul Sarkar','2017-12-04','ONLINE',1),(168,'12:00','12:00',NULL,NULL,'2017-12-13','4-Wheeler',1,1,'123456789','NYCH012','Rahul Sarkar','2017-12-04','ONLINE',0),(169,'12:00','12:00',NULL,NULL,'2017-12-12','4-Wheeler',1,1,'123456789','NYCH012','Rahul Sarkar','2017-12-04','ONLINE',1),(170,'12:00','12:00',NULL,NULL,'2017-12-13','4-Wheeler',1,1,'123456789','NYCH012','Rahul Sarkar','2017-12-04','ONLINE',0),(171,'12:00','12:00',NULL,NULL,'2017-12-12','4-Wheeler',1,1,'123456789','XYX','Rahul Sarkar','2017-12-04','ONLINE',1),(172,'12:00','12:00',NULL,NULL,'2017-12-13','4-Wheeler',1,1,'123456789','XYX','Rahul Sarkar','2017-12-04','ONLINE',0),(173,'12:00','12:00',NULL,NULL,'2017-12-12','4-Wheeler',1,1,'123456789','NYCH012','Rahul Sarkar','2017-12-04','ONLINE',1),(174,'12:00','12:00',NULL,NULL,'2017-12-13','4-Wheeler',1,1,'123456789','NYCH012','Rahul Sarkar','2017-12-04','ONLINE',0),(175,'00:00','00:00','18:35','00:00','2017-12-04','2-Wheeler',1,1,'5183139192','RK8790','Rohan','2017-12-04','OFFLINE',0),(176,'00:00','00:00','20:05','00:00','2017-12-04','2-Wheeler',1,1,'5183232454','hsdk','rohan','2017-12-04','OFFLINE',0),(177,'00:00','00:00','18:06','00:00','2017-12-05','4-wheeler',1,1,'123456789','11111','Harnish','2017-12-05','OFFLINE',0),(178,'00:00','00:00','18:06','00:00','2017-12-05','4-wheeler',1,1,'1234567890','11111','Harnish','2017-12-05','OFFLINE',0),(179,'00:00','00:00','18:07','00:00','2017-12-05','Truck',1,1,'1111111111','858','AAA','2017-12-05','OFFLINE',0);
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

-- Dump completed on 2017-12-05 20:24:09
