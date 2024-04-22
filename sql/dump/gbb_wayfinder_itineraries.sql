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
-- Table structure for table `itineraries`
--

DROP TABLE IF EXISTS `itineraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itineraries` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `numberOfAttractions` int DEFAULT NULL,
  `attractions` varchar(255) DEFAULT NULL,
  `image` varchar(2048) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `durationCode` int DEFAULT NULL,
  `openingHours` text,
  `eventDescription` text,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itineraries`
--

LOCK TABLES `itineraries` WRITE;
/*!40000 ALTER TABLE `itineraries` DISABLE KEYS */;
INSERT INTO `itineraries` VALUES (1,'Stars of the Gardens',1,'[5]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/stars1-thumb.jpg','30 mins',1,'','',0),(2,'Kids\' Stuff',1,'[20]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/kids1-thumb.jpg','30 mins',1,'','',0),(3,'Picture Perfect',1,'[7]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/picture1-thumb.jpg','30 mins',1,'','',0),(4,'Outdoor Treasures',2,'[24,10]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/outdoor1-thumb.jpg','30 mins',1,'','',0),(5,'Stars of the Gardens',3,'[3,4,1]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/stars2-thumb.jpg','1 hour',2,'','',0),(6,'Kids\' Stuff',3,'[20,21,19]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/kids2-thumb.jpg','1 hour',2,'','',0),(7,'Picture Perfect',3,'[5,23,6]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/picture2-thumb.jpg','1 hour',2,'','',0),(8,'Outdoor Treasures',3,'[24,12,10]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/outdoor2-thumb.jpg','1 hour',2,'','',0),(9,'Stars of the Gardens',4,'[3,4,7,5]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/stars3-thumb.jpg','2-3 hours',3,'','',0),(10,'Kids\' Stuff',4,'[20,21,19,7]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/kids3-thumb.jpg','2-3 hours',3,'','',0),(11,'Picture Perfect',3,'[5,7,3]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/picture3-thumb.jpg','2-3 hours',3,'','',0),(12,'Outdoor Treasures',7,'[17,16,7,9,10,23,24]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/outdoor3-thumb.jpg','2-3 hours',3,'','',0),(13,'Stars of the Gardens',6,'[3,4,7,6,23,5]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/stars4-thumb.jpg','3-4 hours',4,'','',0),(14,'Kids\' Stuff',6,'[20,21,19,7,32,5]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/kids4-thumb.jpg','3-4 hours',4,'','',0),(15,'Picture Perfect',5,'[5,7,3,89,18]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/picture4-thumb.jpg','3-4 hours',4,'','',0),(16,'Outdoor Treasures',6,'[24,12,13,10,9,5]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/outdoor4-thumb.jpg','3-4 hours',4,'','',0),(17,'Must-See Attractions',4,'[5,4,3,6]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/stars5-thumb.jpg','More than 4 hours',5,'','',1),(18,'Stars of the Gardens',12,'[3,4,7,14,15,16,17,89,18,5,23,6]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/stars5-thumb.jpg','More than 4 hours',5,'','',0),(19,'Kids\' Stuff',8,'[20,21,19,3,4,7,32,5]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/kids5-thumb.jpg','More than 4 hours',5,'','',0),(20,'Picture Perfect',8,'[5,23,3,4,7,6,15,16]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/picture5-thumb.jpg','More than 4 hours',5,'','',0),(21,'Outdoor Treasures',9,'[24,12,13,10,9,8,18,5,23]','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/routes/outdoor5-thumb.jpg','More than 4 hours',5,'','',0);
/*!40000 ALTER TABLE `itineraries` ENABLE KEYS */;
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
