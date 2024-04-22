CREATE DATABASE  IF NOT EXISTS `gbb_wayfinder` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gbb_wayfinder`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: gbb_wayfinder
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `qrLocations`
--

DROP TABLE IF EXISTS `qrLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrLocations` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `eventsLocation` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `icon` varchar(2048) DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrLocations`
--

LOCK TABLES `qrLocations` WRITE;
/*!40000 ALTER TABLE `qrLocations` DISABLE KEYS */;
INSERT INTO `qrLocations` VALUES (1,'West Gate','',1.2855976,103.8628102,'',1),(2,'East Gate ','',1.282083,103.86947,'',1),(3,'South Gate','',1.277716,103.860215,'',1),(4,'South Gate','',1.276871,103.861926,'',1),(5,'Meadow','',1.278571,103.862035,'',1),(6,'Meadow','',1.2803756,103.8618838,'',1),(7,'Dragonfly Bridge','',1.2825272,103.8620109,'',1),(8,'Malay Garden','',1.2824072,103.8629641,'',1),(9,'Visitor Centre','',1.2819142,103.8656373,'',1),(10,'Visitor Centre','',1.2819142,103.8656373,'',1),(11,'The Canopy','',1.2832868,103.8653848,'',1),(12,'The Canopy','',1.2837467,103.8655186,'',1),(13,'Far East Organization Children\'s Garden','',1.2837262,103.8669948,'',1),(14,'Supertree Dining','',1.281589,103.864623,'',1),(15,'Bayfront Plaza','',1.2818555,103.8611845,'',1),(16,'Bayfront Plaza Car Park','',1.280234,103.860918,'',1),(17,'Bayfront Plaza','',1.2817261,103.8616559,'',1),(18,'Board Walk','',1.282081,103.862836,'',1),(19,'Cloud Forest','',1.2843638,103.8655176,'',1),(20,'Dragonfly Walk','',1.284578,103.862731,'',1),(21,'Satay By The Bay','',1.281945,103.868944,'',1),(22,'Silver Garden','',1.2838204,103.8644658,'',1),(23,'Supertree Grove','',1.2815458,103.8633074,'',1),(24,'Supertree Grove','',1.2817164,103.8646757,'',1),(25,'The Canopy','',1.2839709,103.8653144,'',1),(26,'The Meadow','',1.280022,103.864405,'',1),(27,'Floral Fantasy','',1.2799607,103.8607587,'',1);
/*!40000 ALTER TABLE `qrLocations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 13:31:50
