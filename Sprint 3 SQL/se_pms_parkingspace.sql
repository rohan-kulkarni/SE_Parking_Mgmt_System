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
-- Table structure for table `parkingspace`
--

DROP TABLE IF EXISTS `parkingspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkingspace` (
  `PS_vehicleType` varchar(45) DEFAULT NULL,
  `PS_AvailableOnlineSlots` int(11) DEFAULT NULL,
  `PS_OnlineCharges` int(11) DEFAULT NULL,
  `PS_AvailableOfflineSlots` int(11) DEFAULT NULL,
  `PS_OfflineCharges` int(11) DEFAULT NULL,
  `PS_Tax` int(11) DEFAULT NULL,
  `Parking_P_id` int(11) NOT NULL,
  `PS_id` int(11) NOT NULL AUTO_INCREMENT,
  `PS_dayCharge` int(11) DEFAULT '8',
  `vehicle_vt_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PS_id`),
  KEY `Parking_P_id` (`Parking_P_id`),
  KEY `vehicle_vt_id_idx` (`vehicle_vt_id`),
  CONSTRAINT `Parking_P_id` FOREIGN KEY (`Parking_P_id`) REFERENCES `parking` (`P_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkingspace`
--

LOCK TABLES `parkingspace` WRITE;
/*!40000 ALTER TABLE `parkingspace` DISABLE KEYS */;
INSERT INTO `parkingspace` VALUES ('2-Wheeler',4,12,4,15,5,1,1,10,6),('4-Wheeler',250,13,75,16,5,1,2,12,2),('4-Wheeler',500,10,100,10,5,4,3,5,2),('2-Wheeler',100,15,10,5,5,4,4,14,6),('Truck',20,15,5,10,10,6,6,10,3),('2-Wheeler',200,10,50,15,5,16,26,20,6);
/*!40000 ALTER TABLE `parkingspace` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-05 20:24:07
