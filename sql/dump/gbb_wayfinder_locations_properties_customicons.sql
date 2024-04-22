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
-- Table structure for table `locations_properties_customicons`
--

DROP TABLE IF EXISTS `locations_properties_customicons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_properties_customicons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(2048) NOT NULL,
  `width` int NOT NULL DEFAULT '18',
  `height` int NOT NULL DEFAULT '28',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1624 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_properties_customicons`
--

LOCK TABLES `locations_properties_customicons` WRITE;
/*!40000 ALTER TABLE `locations_properties_customicons` DISABLE KEYS */;
INSERT INTO `locations_properties_customicons` VALUES (4,'Attractions','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-attraction.png',18,28),(1,'Accessible','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-accessible.png',18,28),(19,'Toilet','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-toilet.png',18,28),(18,'Ticket','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-ticket.png',18,28),(10,'Giftshop','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-giftshop.png',18,28),(14,'Parking','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-parking.png',18,28),(9,'First Aid','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-firstaid.png',18,28),(7,'Drop Off','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-dropoff.png',18,28),(13,'Nursing','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-nursing.png',18,28),(2,'Art','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/map-marker/marker-art.png',18,28),(8,'Event','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-event.png',18,28),(17,'Taxi','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-taxi.png',18,28),(5,'Bike','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-bike.png',18,28),(6,'Dining','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-dining.png',18,28),(11,'Information','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-info.png',18,28),(12,'Lift','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-lift.png',18,28),(16,'Stairs','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-stairs.png',18,28),(3,'ATM','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/map-marker/marker-atm.png',18,28),(15,'Planet','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-planet.png',50,50),(21,'Cash Machines','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-atm.png',18,28),(20,'Art Sculptures','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/map-marker/marker-art.png',18,28);
/*!40000 ALTER TABLE `locations_properties_customicons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 13:31:53
