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
-- Table structure for table `advisory`
--

DROP TABLE IF EXISTS `advisory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisory` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `locations` varchar(1000) DEFAULT NULL,
  `icon` varchar(2048) DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `advisoryDescription` text,
  `startDate` varchar(255) DEFAULT NULL,
  `endDate` varchar(255) DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisory`
--

LOCK TABLES `advisory` WRITE;
/*!40000 ALTER TABLE `advisory` DISABLE KEYS */;
INSERT INTO `advisory` VALUES (1,'','[6,7,139,169]','',14,14,'<img src=\"https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/advisory/icon-marker.png\" width=\"14\" height=\"14\"/> <b>Please Turn On Browser Location Service</b> <br><br>Enable Location Services in your device settings to navigate our Gardens via our Wayfinder app.<br><br>If you have already done so, please ignore this message.','2022-01-06','2023-01-06',1);
/*!40000 ALTER TABLE `advisory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `featuredImage` varchar(2048) DEFAULT NULL,
  `detailImage` varchar(2048) DEFAULT NULL,
  `listingDuration` varchar(255) DEFAULT NULL,
  `openingHours` text,
  `eventDescription` text,
  `active` tinyint DEFAULT NULL,
  `extract` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Hydrangea Holidays',3,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/hydrangeas-2022-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/hydrangeas-2022-wayfinder-1670x940.jpg','2022-06-13 | 2022-08-14','Daily, 9.00am - 9.00pm<br><br>Fri, 24 Jun 2022 - Sun, 14 Aug 2022<br><br>Admission charge to Flower Dome applies','Go on an adventure to the Netherlands and rediscover summertime when whimsical hydrangeas bloom in this first-ever hydrangea floral display in partnership with the Netherlands Embassy and JOURNEY by TOUCH Community Services.',1,1),(2,'Orchids of Costa Rica - Resilient Beauty',4,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/costarica-2022-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/costarica-2022-wayfinder-1670x940.jpg','2022-06-28 | 2022-07-11','<b>Tues, 28 Jun - Mon, 11 Jul 2022</b><br><br>','<b>If you are an orchid-lover, you are in for a rare treat!</b><br><br>Cloud Forest now brings you over 30 interesting Costa Rican orchid species in its first orchid display themed around the country’s orchids, which will run from now till 11 July. <br><br><b>Orchids of Costa Rica – Resilient Beauty</b> is presented in collaboration with the Embassy of Costa Rica in Singapore and the country’s prestigious Lankester Botanical Garden, whose mission includes studying orchids and other epiphytes for their conservation.<br><br>The orchid display also commemorates 35 years of diplomatic relations between Costa Rica and Singapore.',1,1),(3,'Wonderful Wetlands Series',196,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/wetlands-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/wetlands-wayfinder-1670x940.jpg','2022-07-23 | 2022-12-24','<b>Thu, 23 July - Sat, 24 Dec 2022</b>','Mangroves and coastal ecosystems support biodiversity and play an essential role in addressing climate change. Through the Wonderful Wetlands series, learn about mangroves and find out how mangroves planted at Kingfisher Wetlands, our very own urban wetlands in downtown Singapore, contribute to the Gardens’ sustainability efforts!  Join our activities to gain a deeper understanding on nature-based solutions to combat climate change. Wonderful Wetlands Series is sponsored by Temasek and SG Eco Fund.',1,1),(4,'Weird But True! Exhibition',18,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/natgeo-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/natgeo-wayfinder-1670x940.jpg','2022-02-22 | 2022-07-31','<b>Tues, 22 Feb 2022 - Sun, 31 Jul 2022</b><br><br>9.00am - 9.00pm','Plunge into the fascinating worlds of the plant and animal kingdom in National Geographic latest “Weird But True” exhibition!<br/><br/>Wander through the exhibition set within the lush tropics of Cloud Forest at Gardens by the Bay in Singapore, while discovering incredible fun facts. Packed with visually stunning photos and colourful graphics, it’s going to be a wild ride like no other.',1,1),(5,'Makers\' Market',58,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/mm2-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/mm2-wayfinder-1670x940.jpg','2022-01-06 | 2022-07-12','6 May - 18 Sep 2022<br><br>Fri - Sun only: 12.00pm-9.00pm<br>Free Admission','Head over to the Makers’ Market and support local growing creative makers with their own product creations! From sustainable beauty and wellness products to handmade fashion accessories, there is something for everyone!',1,1),(6,'Jumptopia: Wonder Garden',75,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/jump-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/jump-wayfinder-1670x940.jpg','2021-12-20 | 2022-07-03','Mon, 20 Dec 2021 - Sun, 3 Jul 2022<br>Daily: 10.00am - 7.45pm','<b>Jumptopia: Wonder Garden</b> <br><br>Follow Kiztopia Friends into the gardens and watch them transform the Pavilion into an amazing Wonder Garden that is set to dazzle and capture the hearts of all! ',1,0),(7,'Quick HIIT',184,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/quickhiit-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/quickhiit.jpg','','<b>Every Thurs</b><br>7.00pm - 8.00pm<br><br><b>Every Sat</b><br>6.00pm - 7.00pm<br>Free admission<br>Register via the Healthy 365 mobile app','Led by professional trainers, Quick HIIT features short bursts of high intensity exercises that build muscles and burn calories in minimum time.',1,1),(8,'Active Family Programme',184,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/active-family-prog-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/active-family-prog.jpg','','<b>Every Sat </b><br>9.00am - 10.00am<br><br>Free admission<br>Register via the Healthy 365 mobile app','Active Family is an integrated programme that focus on fundamental movement skills development to promote bonding between both parent and child (4-6 years old) through the physical activity together as a family unit, with added on health education focusing on a healthy lifestyle.',1,1),(9,'Low Impact Aerobics',193,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/low-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/low-wayfinder-1670x940.jpg','','<b>Every Sun</b><br>9.00am - 10.00am<br>Free admission for seniors<br>Register via the Healthy 365 mobile app','<b>Have fun keeping fit with your kakis!</b> <br><br>Organised by the Health Promotion Board<br>Get moving with Low Impact Aerobics, an energizing workout that is less hard on the body especially the joints. Join now to improve your heart health and circulation.',1,1),(10,'Otah and Friends Vol 2: Blast Off',76,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/otah2-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/otah2.jpg','2021-06-14 | 2022-06-26','Mon, 14 Jun 2021 - Thu, 26 Jun 2022 (Extended!)<br><br>Various timings<br>Admission charges apply<br>Pre-booking of time slots required','Otah & Friends is back with a brand new adventure following a super successful Volume 1: Hide & Seek!<br><br>It’s build-a-rocket day at school! Help Otah the otter and Billy the hornbill find and assemble a rocket. Unlock the launch control centre and blast off into space!',0,1),(11,'Flight of the Moth Orchid',4,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/fomo-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/fomo.jpg','','From Fri, 30 Jul 2021<br><br>9.00am - 9.00pm<br>Admission charge to Cloud Forest applies','Flight of the Moth Orchid is a tribute to the Phalaenopsis orchid, a diverse genus whose floral form resembles that of a moth in flight.<br><br>The Phalaenopsis orchids on show have been carefully selected to show the distinct and occasionally dramatic characteristics that make it such a popular orchid among both breeders and orchid lovers alike, such as bright colours, peculiar patterns and markings, as well as floral mutations that result in even more stunning varieties.',1,1),(12,'Garden Rhapsody',7,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/garden-rhapsody-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/garden-rhapsody.jpg','','Daily, 7.45pm and 8.45pm<br><br>30 Jan 2022: No shows available<br>31 Jan - 6 Feb 2022: Daily shows are available at 8.15pm only','Come and be dazzled by the magnificent sight of our Supertrees and let the music and lights entertain you at night!',1,1);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `features_list`
--

DROP TABLE IF EXISTS `features_list`;
/*!50001 DROP VIEW IF EXISTS `features_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `features_list` AS SELECT 
 1 AS `type`,
 1 AS `geo_type`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `id`,
 1 AS `name`,
 1 AS `category`,
 1 AS `subCategory`,
 1 AS `icon`,
 1 AS `width`,
 1 AS `height`,
 1 AS `website`,
 1 AS `popupContent`,
 1 AS `openingHours`,
 1 AS `featuredImage`,
 1 AS `detailImage`,
 1 AS `exclusivePromotion`,
 1 AS `visible`,
 1 AS `zoomLevel`,
 1 AS `exclude`,
 1 AS `entryDate`*/;
SET character_set_client = @saved_cs_client;

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

--
-- Table structure for table `location_categories`
--

DROP TABLE IF EXISTS `location_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_categories` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `showLabel` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_categories`
--

LOCK TABLES `location_categories` WRITE;
/*!40000 ALTER TABLE `location_categories` DISABLE KEYS */;
INSERT INTO `location_categories` VALUES (1,'Attractions',1),(2,'Dining',1),(3,'Information Counters & Visitor Services Centre',0),(4,'Ticketing Counters',0),(5,'Gift Shops',0),(6,'Toilets',0),(7,'Nursing Rooms',0),(8,'First Aid',0),(9,'Cash Machines',0),(10,'Drop off Points',0),(11,'Carparks',0),(12,'Bicycle Parking',0),(13,'Friends of the Gardens Centre',0),(14,'Event Venues',0),(15,'Art Sculptures',0),(16,'Taxi Stand',0),(17,'Lifts',0),(18,'Stairs',0),(19,'Escalators',0),(20,'Shuttle Stops',0);
/*!40000 ALTER TABLE `location_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL,
  `type` int NOT NULL DEFAULT '1',
  `geometry` int NOT NULL,
  `properties` int NOT NULL,
  `zoomLevel` int NOT NULL DEFAULT '17',
  `exclude` tinyint(1) NOT NULL DEFAULT '0',
  `entryDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,1,1,1,17,0,'2022-07-05 04:24:58'),(2,1,2,2,17,0,'2022-07-05 04:24:58'),(3,1,3,3,17,0,'2022-07-05 04:24:58'),(4,1,4,4,17,0,'2022-07-05 04:24:58'),(5,1,5,5,17,0,'2022-07-05 04:24:59'),(6,1,6,6,17,0,'2022-07-05 04:24:59'),(7,1,7,7,17,0,'2022-07-05 04:24:59'),(8,1,8,8,17,0,'2022-07-05 04:24:59'),(9,1,9,9,17,0,'2022-07-05 04:24:59'),(10,1,10,10,17,0,'2022-07-05 04:24:59'),(11,1,11,11,17,0,'2022-07-05 04:24:59'),(12,1,12,12,17,0,'2022-07-05 04:24:59'),(13,1,13,13,17,0,'2022-07-05 04:24:59'),(14,1,14,14,17,0,'2022-07-05 04:24:59'),(15,1,15,15,17,0,'2022-07-05 04:24:59'),(16,1,16,16,17,0,'2022-07-05 04:24:59'),(17,1,17,17,17,0,'2022-07-05 04:24:59'),(18,1,18,18,17,0,'2022-07-05 04:24:59'),(19,1,19,19,17,0,'2022-07-05 04:24:59'),(20,1,20,20,17,0,'2022-07-05 04:24:59'),(21,1,21,21,17,0,'2022-07-05 04:24:59'),(22,1,22,22,17,0,'2022-07-05 04:24:59'),(23,1,23,23,17,0,'2022-07-05 04:24:59'),(24,1,24,24,17,0,'2022-07-05 04:24:59'),(25,1,25,25,17,0,'2022-07-05 04:24:59'),(26,1,26,26,17,0,'2022-07-05 04:25:00'),(27,1,27,27,17,0,'2022-07-05 04:25:00'),(28,1,28,28,17,0,'2022-07-05 04:25:00'),(29,1,29,29,17,0,'2022-07-05 04:25:00'),(30,1,30,30,17,0,'2022-07-05 04:25:00'),(31,1,31,31,17,0,'2022-07-05 04:25:00'),(32,1,32,32,17,0,'2022-07-05 04:25:00'),(33,1,33,33,17,0,'2022-07-05 04:25:00'),(34,1,34,34,17,0,'2022-07-05 04:25:00'),(35,1,35,35,17,0,'2022-07-05 04:25:00'),(36,1,36,36,17,0,'2022-07-05 04:25:00'),(37,1,37,37,17,0,'2022-07-05 04:25:00'),(38,1,38,38,17,0,'2022-07-05 04:25:00'),(39,1,39,39,17,0,'2022-07-05 04:25:00'),(40,1,40,40,17,0,'2022-07-05 04:25:00'),(41,1,41,41,17,0,'2022-07-05 04:25:00'),(42,1,42,42,17,0,'2022-07-05 04:25:00'),(43,1,43,43,17,0,'2022-07-05 04:25:00'),(44,1,44,44,17,0,'2022-07-05 04:25:00'),(45,1,45,45,17,0,'2022-07-05 04:25:00'),(46,1,46,46,17,0,'2022-07-05 04:25:01'),(47,1,47,47,17,0,'2022-07-05 04:25:01'),(48,1,48,48,17,0,'2022-07-05 04:25:01'),(49,1,49,49,17,0,'2022-07-05 04:25:01'),(50,1,50,50,17,0,'2022-07-05 04:25:01'),(51,1,51,51,17,0,'2022-07-05 04:25:01'),(52,1,52,52,17,0,'2022-07-05 04:25:01'),(53,1,53,53,17,0,'2022-07-05 04:25:01'),(54,1,54,54,17,0,'2022-07-05 04:25:01'),(55,1,55,55,17,0,'2022-07-05 04:25:01'),(56,1,56,56,17,0,'2022-07-05 04:25:01'),(57,1,57,57,17,0,'2022-07-05 04:25:01'),(58,1,58,58,17,0,'2022-07-05 04:25:01'),(59,1,59,59,17,0,'2022-07-05 04:25:01'),(60,1,60,60,17,0,'2022-07-05 04:25:01'),(61,1,61,61,17,0,'2022-07-05 04:25:01'),(62,1,62,62,17,0,'2022-07-05 04:25:01'),(63,1,63,63,17,0,'2022-07-05 04:25:01'),(64,1,64,64,17,0,'2022-07-05 04:25:02'),(65,1,65,65,17,0,'2022-07-05 04:25:02'),(66,1,66,66,17,0,'2022-07-05 04:25:02'),(67,1,67,67,17,0,'2022-07-05 04:25:02'),(68,1,68,68,17,0,'2022-07-05 04:25:02'),(69,1,69,69,17,0,'2022-07-05 04:25:02'),(70,1,70,70,17,0,'2022-07-05 04:25:02'),(71,1,71,71,17,0,'2022-07-05 04:25:02'),(72,1,72,72,17,0,'2022-07-05 04:25:02'),(73,1,73,73,17,0,'2022-07-05 04:25:02'),(74,1,74,74,17,0,'2022-07-05 04:25:02'),(75,1,75,75,17,0,'2022-07-05 04:25:02'),(76,1,76,76,17,0,'2022-07-05 04:25:02'),(77,1,77,77,17,0,'2022-07-05 04:25:02'),(78,1,78,78,17,0,'2022-07-05 04:25:02'),(79,1,79,79,17,0,'2022-07-05 04:25:02'),(80,1,80,80,17,0,'2022-07-05 04:25:02'),(81,1,81,81,17,0,'2022-07-05 04:25:02'),(82,1,82,82,17,0,'2022-07-05 04:25:02'),(83,1,83,83,17,0,'2022-07-05 04:25:02'),(84,1,84,84,17,0,'2022-07-05 04:25:02'),(85,1,85,85,17,0,'2022-07-05 04:25:02'),(86,1,86,86,17,0,'2022-07-05 04:25:02'),(87,1,87,87,17,0,'2022-07-05 04:25:02'),(88,1,88,88,17,0,'2022-07-05 04:25:02'),(89,1,89,89,17,0,'2022-07-05 04:25:02'),(90,1,90,90,17,0,'2022-07-05 04:25:02'),(91,1,91,91,17,0,'2022-07-05 04:25:02'),(92,1,92,92,17,0,'2022-07-05 04:25:02'),(93,1,93,93,17,0,'2022-07-05 04:25:02'),(94,1,94,94,17,0,'2022-07-05 04:25:03'),(95,1,95,95,17,0,'2022-07-05 04:25:03'),(96,1,96,96,17,0,'2022-07-05 04:25:03'),(97,1,97,97,17,0,'2022-07-05 04:25:03'),(98,1,98,98,17,0,'2022-07-05 04:25:03'),(99,1,99,99,17,0,'2022-07-05 04:25:03'),(100,1,100,100,17,0,'2022-07-05 04:25:03'),(101,1,101,101,17,0,'2022-07-05 04:25:03'),(102,1,102,102,17,0,'2022-07-05 04:25:03'),(103,1,103,103,17,0,'2022-07-05 04:25:03'),(104,1,104,104,17,0,'2022-07-05 04:25:03'),(105,1,105,105,17,0,'2022-07-05 04:25:03'),(106,1,106,106,17,0,'2022-07-05 04:25:03'),(107,1,107,107,17,0,'2022-07-05 04:25:03'),(108,1,108,108,17,0,'2022-07-05 04:25:03'),(109,1,109,109,17,0,'2022-07-05 04:25:03'),(110,1,110,110,17,0,'2022-07-05 04:25:03'),(111,1,111,111,17,0,'2022-07-05 04:25:03'),(112,1,112,112,17,0,'2022-07-05 04:25:03'),(113,1,113,113,17,0,'2022-07-05 04:25:03'),(114,1,114,114,17,0,'2022-07-05 04:25:03'),(115,1,115,115,17,0,'2022-07-05 04:25:03'),(116,1,116,116,17,0,'2022-07-05 04:25:03'),(117,1,117,117,17,0,'2022-07-05 04:25:03'),(118,1,118,118,17,0,'2022-07-05 04:25:03'),(119,1,119,119,17,0,'2022-07-05 04:25:03'),(120,1,120,120,17,0,'2022-07-05 04:25:03'),(121,1,121,121,17,0,'2022-07-05 04:25:03'),(122,1,122,122,17,0,'2022-07-05 04:25:03'),(123,1,123,123,17,0,'2022-07-05 04:25:04'),(124,1,124,124,17,0,'2022-07-05 04:25:04'),(125,1,125,125,17,0,'2022-07-05 04:25:04'),(126,1,126,126,17,0,'2022-07-05 04:25:04'),(127,1,127,127,17,0,'2022-07-05 04:25:04'),(128,1,128,128,17,0,'2022-07-05 04:25:04'),(129,1,129,129,17,0,'2022-07-05 04:25:04'),(130,1,130,130,17,0,'2022-07-05 04:25:04'),(131,1,131,131,17,0,'2022-07-05 04:25:04'),(132,1,132,132,17,0,'2022-07-05 04:25:04'),(133,1,133,133,17,0,'2022-07-05 04:25:04'),(134,1,134,134,17,0,'2022-07-05 04:25:04'),(135,1,135,135,17,0,'2022-07-05 04:25:04'),(136,1,136,136,17,0,'2022-07-05 04:25:04'),(137,1,137,137,17,0,'2022-07-05 04:25:04'),(138,1,138,138,17,0,'2022-07-05 04:25:04'),(139,1,139,139,17,0,'2022-07-05 04:25:04'),(140,1,140,140,17,0,'2022-07-05 04:25:04'),(141,1,141,141,17,0,'2022-07-05 04:25:04'),(142,1,142,142,17,0,'2022-07-05 04:25:04'),(143,1,143,143,17,0,'2022-07-05 04:25:04'),(144,1,144,144,17,0,'2022-07-05 04:25:04'),(145,1,145,145,17,0,'2022-07-05 04:25:04'),(146,1,146,146,17,0,'2022-07-05 04:25:04'),(147,1,147,147,17,0,'2022-07-05 04:25:04'),(148,1,148,148,17,0,'2022-07-05 04:25:04'),(149,1,149,149,17,0,'2022-07-05 04:25:04'),(150,1,150,150,17,0,'2022-07-05 04:25:04'),(151,1,151,151,17,0,'2022-07-05 04:25:04'),(152,1,152,152,17,0,'2022-07-05 04:25:05'),(153,1,153,153,17,0,'2022-07-05 04:25:05'),(154,1,154,154,17,0,'2022-07-05 04:25:05'),(155,1,155,155,17,0,'2022-07-05 04:25:05'),(156,1,156,156,17,0,'2022-07-05 04:25:05'),(157,1,157,157,17,0,'2022-07-05 04:25:05'),(158,1,158,158,17,0,'2022-07-05 04:25:05'),(159,1,159,159,17,0,'2022-07-05 04:25:05'),(160,1,160,160,17,0,'2022-07-05 04:25:05'),(161,1,161,161,17,0,'2022-07-05 04:25:05'),(162,1,162,162,17,0,'2022-07-05 04:25:05'),(163,1,163,163,17,0,'2022-07-05 04:25:05'),(164,1,164,164,17,0,'2022-07-05 04:25:05'),(165,1,165,165,17,0,'2022-07-05 04:25:05'),(166,1,166,166,17,0,'2022-07-05 04:25:05'),(167,1,167,167,17,0,'2022-07-05 04:25:05'),(168,1,168,168,17,0,'2022-07-05 04:25:05'),(169,1,169,169,17,0,'2022-07-05 04:25:05'),(170,1,170,170,17,0,'2022-07-05 04:25:05'),(171,1,171,171,17,0,'2022-07-05 04:25:05'),(172,1,172,172,17,0,'2022-07-05 04:25:05'),(173,1,173,173,17,0,'2022-07-05 04:25:05'),(174,1,174,174,17,0,'2022-07-05 04:25:05'),(175,1,175,175,17,0,'2022-07-05 04:25:06'),(176,1,176,176,17,0,'2022-07-05 04:25:06'),(177,1,177,177,17,0,'2022-07-05 04:25:06'),(178,1,178,178,17,0,'2022-07-05 04:25:06'),(179,1,179,179,17,0,'2022-07-05 04:25:06'),(180,1,180,180,17,0,'2022-07-05 04:25:06'),(181,1,181,181,17,0,'2022-07-05 04:25:06'),(182,1,182,182,17,0,'2022-07-05 04:25:06'),(183,1,183,183,17,0,'2022-07-05 04:25:06'),(184,1,184,184,17,0,'2022-07-05 04:25:06'),(185,1,185,185,17,0,'2022-07-05 04:25:06'),(186,1,186,186,17,0,'2022-07-05 04:25:06'),(187,1,187,187,17,0,'2022-07-05 04:25:06'),(188,1,188,188,17,0,'2022-07-05 04:25:06'),(189,1,189,189,17,0,'2022-07-05 04:25:06'),(190,1,190,190,17,0,'2022-07-05 04:25:06'),(191,1,191,191,17,0,'2022-07-05 04:25:06'),(192,1,192,192,17,0,'2022-07-05 04:25:06'),(193,1,193,193,17,0,'2022-07-05 04:25:07'),(194,1,194,194,17,0,'2022-07-05 04:25:07'),(195,1,195,195,17,0,'2022-07-05 04:25:07'),(196,1,196,196,17,0,'2022-07-05 04:25:07'),(197,1,197,197,17,0,'2022-07-05 04:25:07'),(198,1,198,198,17,0,'2022-07-05 04:25:07');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_geometry`
--

DROP TABLE IF EXISTS `locations_geometry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_geometry` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_geometry`
--

LOCK TABLES `locations_geometry` WRITE;
/*!40000 ALTER TABLE `locations_geometry` DISABLE KEYS */;
INSERT INTO `locations_geometry` VALUES (1,'Point',1.2823573,103.8658),(2,'Point',1.2840611,103.86536),(3,'Point',1.284053,103.86512),(4,'Point',1.284117,103.865394),(5,'Point',1.2817111,103.8612532),(6,'Point',1.2822078,103.8642653),(7,'Point',1.2817925,103.8637212),(8,'Point',1.2805318,103.8632524),(9,'Point',1.2804688,103.863747),(10,'Point',1.280682,103.8643112),(11,'Point',1.2810993,103.8647531),(12,'Point',1.281811,103.865),(13,'Point',1.2828125,103.8649919),(14,'Point',1.2833066,103.8642978),(15,'Point',1.2830475,103.8635344),(16,'Point',1.2824307,103.8630426),(17,'Point',1.2814471,103.8629281),(18,'Point',1.2793654,103.8615452),(19,'Point',1.2831725,103.8662837),(20,'Point',1.2832615,103.8666915),(21,'Point',1.2834209,103.8657315),(22,'Point',1.2842518,103.8637403),(23,'Point',1.2820637,103.8622235),(24,'Point',1.281882,103.866978),(25,'Point',1.293966,103.86828),(26,'Point',1.282605,103.865453),(27,'Point',1.282785,103.865497),(28,'Point',1.283719,103.865124),(29,'Point',1.284326,103.865489),(30,'Point',1.284356,103.865505),(31,'Point',1.285064,103.864056),(32,'Point',1.2813457,103.8643508),(33,'Point',1.283298,103.866766),(34,'Point',1.2821059,103.8682561),(35,'Point',1.2815073,103.8617025),(36,'Point',1.278438,103.862108),(37,'Point',1.282199,103.863239),(38,'Point',1.2817509,103.8647045),(39,'Point',1.282511,103.865457),(40,'Point',1.284138,103.864939),(41,'Point',1.284128018,103.8653928),(42,'Point',1.284048,103.865098),(43,'Point',1.283321,103.866714),(44,'Point',1.278489,103.862112),(45,'Point',1.28169,103.8634),(46,'Point',1.28169,103.8646),(47,'Point',1.2824756,103.8654602),(48,'Point',1.28417,103.8652),(49,'Point',1.283317,103.866733),(50,'Point',1.2818381,103.8611975),(51,'Point',1.2819581,103.8656208),(52,'Point',1.278356,103.862094),(53,'Point',1.284653772,103.8653615),(54,'Point',1.2836009,103.867081),(55,'Point',1.2818143,103.8612891),(56,'Point',1.283727,103.86544),(57,'Point',1.2821528,103.8643454),(58,'Point',1.2815602,103.8615124),(59,'Point',1.2840386,103.8653308),(60,'Point',1.284144,103.865396),(61,'Point',1.281891,103.865577),(62,'Point',1.2795799,103.8602631),(63,'Point',1.281125,103.865837),(64,'Point',1.281883,103.868212),(65,'Point',1.277918,103.862203),(66,'Point',1.293262,103.868613),(67,'Point',1.283948,103.865412),(68,'Point',1.283323,103.866698),(69,'Point',1.2805094,103.8602785),(70,'Point',1.281848,103.865677),(71,'Point',1.2817563,103.8646988),(72,'Point',1.2840302,103.8650653),(73,'Point',1.2833106,103.8667433),(74,'Point',1.284001,103.865386),(75,'Point',1.2806267,103.860358),(76,'Point',1.2816651,103.8645989),(77,'Point',1.282465,103.864597),(78,'Point',1.282989,103.865466),(79,'Point',1.283846,103.865466),(80,'Point',1.283902,103.865438),(81,'Point',1.284866,103.864875),(82,'Point',1.2823804,103.8655099),(83,'Point',1.283722,103.865954),(84,'Point',1.2839139,103.8654324),(85,'Point',1.281864,103.862455),(86,'Point',1.2817204,103.8623978),(87,'Point',1.2826506,103.8633691),(88,'Point',1.2833401,103.8644876),(89,'Point',1.2806193,103.8623448),(90,'Point',1.284532,103.86412),(91,'Point',1.283307,103.864881),(92,'Point',1.284048,103.865412),(93,'Point',1.284048,103.865412),(94,'Point',1.2841409,103.8653969),(95,'Point',1.284596,103.86514),(96,'Point',1.284596,103.86514),(97,'Point',1.284138,103.866),(98,'Point',1.284138,103.866),(99,'Point',1.284138,103.866),(100,'Point',1.284138,103.866),(101,'Point',1.284138,103.866),(102,'Point',1.284138,103.866),(103,'Point',1.28324,103.866163),(104,'Point',1.284401,103.864718),(105,'Point',1.284401,103.864718),(106,'Point',1.284401,103.864718),(107,'Point',1.284401,103.864718),(108,'Point',1.284401,103.864718),(109,'Point',1.284644,103.865046),(110,'Point',1.28343,103.865572),(111,'Point',1.2834748,103.8654743),(112,'Point',1.283792,103.866204),(113,'Point',1.284855,103.863988),(114,'Point',1.2839056,103.8654331),(115,'Point',1.2840594,103.8634402),(116,'Point',1.279774,103.8614668),(117,'Point',1.281854,103.867004),(118,'Point',1.281666,103.863349),(119,'Point',1.2831973,103.8641416),(120,'Point',1.283211,103.863742),(121,'Point',1.2835187,103.8636253),(122,'Point',1.280033,103.863585),(123,'Point',1.282196,103.864745),(124,'Point',1.2814885,103.8619117),(125,'Point',1.282645,103.864252),(126,'Point',1.2826352,103.8657318),(127,'Point',1.282197,103.866331),(128,'Point',1.283527,103.865064),(129,'Point',1.2840872,103.8653721),(130,'Point',1.283337,103.866585),(131,'Point',1.2844362,103.8655444),(132,'Point',1.285682,103.862252),(133,'Point',1.2805583,103.8620186),(134,'Point',1.2853596,103.863405),(135,'Point',1.2791726,103.8620055),(136,'Point',1.2840178,103.8650328),(137,'Point',1.284287,103.865031),(138,'Point',1.284295,103.863514),(139,'Point',1.2799386,103.8622174),(140,'Point',1.282697,103.864905),(141,'Point',1.28219,103.864233),(142,'Point',1.293519,103.867579),(143,'Point',1.2942,103.866938),(144,'Point',1.2855349,103.8628109),(145,'Point',1.283023,103.86621),(146,'Point',1.283028,103.86381),(147,'Point',1.283381,103.865774),(148,'Point',1.283665,103.86678),(149,'Point',1.2817486,103.8614181),(150,'Point',1.2805543,103.860301),(151,'Point',1.2816363,103.8614319),(152,'Point',1.2817372,103.8616163),(153,'Point',1.2824884,103.8623277),(154,'Point',1.282671,103.8633829),(155,'Point',1.2815428,103.8657422),(156,'Point',1.2818455,103.8656161),(157,'Point',1.28188,103.8647085),(158,'Point',1.2819041,103.8647025),(159,'Point',1.2817271,103.8646864),(160,'Point',1.2816839,103.8646324),(161,'Point',1.2823989,103.8635019),(162,'Point',1.282426,103.8635247),(163,'Point',1.2809421,103.8641537),(164,'Point',1.2816125,103.8633021),(165,'Point',1.2842934,103.8654807),(166,'Point',1.2840996,103.8653771),(167,'Point',1.2840728,103.865367),(168,'Point',1.281383,103.863777),(169,'Point',1.281808,103.864106),(170,'Point',1.282082,103.864116),(171,'Point',1.281965,103.864146),(172,'Point',1.282849286,103.8665),(173,'Point',1.280969,103.8637),(174,'Point',1.281679,103.861281),(175,'Point',1.281795,103.864087),(176,'Point',1.284133788,103.8654),(177,'Point',1.2815602,103.8615426),(178,'Point',1.282460213,103.8654667),(179,'Point',1.278468639,103.8621095),(180,'Point',1.282001234,103.8618883),(181,'Point',1.283981521,103.8649815),(182,'Point',1.282749,103.861713),(183,'Point',1.285464,103.862089),(184,'Point',1.284719,103.86224),(185,'Point',1.284525193,103.8644518),(186,'Point',1.28068845809302,103.861444685923),(187,'Point',1.28386232,103.8653734),(188,'Point',1.282733936,103.865475),(189,'Point',1.281808,103.864106),(190,'Point',1.285249,103.862056),(191,'Point',1.285612,103.862238),(192,'Point',1.285297,103.86206),(193,'Point',1.285513,103.86201),(194,'Point',1.285064,103.864056),(195,'Point',1.2799386,103.8622174),(196,'Point',1.282589,103.867881),(197,'Point',1.281080585,103.8658334),(198,'Point',1.2856365,103.8626694);
/*!40000 ALTER TABLE `locations_geometry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_properties`
--

DROP TABLE IF EXISTS `locations_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_properties` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(500) NOT NULL,
  `subCategory` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `customIconId` int NOT NULL,
  `website` varchar(2048) NOT NULL,
  `popupContent` text NOT NULL,
  `openingHours` text NOT NULL,
  `featuredImage` varchar(2048) NOT NULL,
  `detailImage` varchar(2048) NOT NULL,
  `exclusivePromotion` varchar(255) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_properties`
--

LOCK TABLES `locations_properties` WRITE;
/*!40000 ALTER TABLE `locations_properties` DISABLE KEYS */;
INSERT INTO `locations_properties` VALUES (1,'Golden Garden','Attractions','',4,'','Be awed by the full splendour of three Supertrees clad in a bright visual spectacle of gold and yellow coloured bromeliads.','Open daily: 5.00am - 2.00am','','','',1),(2,'The Canopy','Attractions','',4,'','','Open daily: 5.00am - 2.00am','','','',1),(3,'Flower Dome','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/flower-dome.html','Step into the Flower Dome and be amazed by changing display of flowers and plants from the Mediterranean and semi-arid regions.<br><br>Closure dates for 2022:<br>11 Jan, 22 Feb<br>08 Mar, 05 Apr<br>10 May, 14 Jun<br>26 Jul, 23 Aug<br>20 Sep, 11 Oct<br>15 Nov, 13 Dec<br><br>Admission charge applies. <a href=\"https://ticket.gardensbythebay.com.sg/\" target=\"_blank\">Buy tickets here</a>','Open daily: 9.00am - 9.00pm<br>\nLast admission: 8.30pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/flower-dome-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/flower-dome.jpg','',1),(4,'Cloud Forest','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/cloud-forest.html','Enter the Cloud Forest and take in breath-taking mountain views surrounded by diverse vegetation and hidden floral gems.<br><br>Closure dates for 2022:<br>10 Jan, 21 Feb<br>07 Mar, 04 Apr<br>09 May, 13 Jun<br>25 Jul, 22 Aug<br>19 Sep, 10 Oct<br>14 Nov, 12 Dec<br><br>Admission charge applies. <a href=\"https://ticket.gardensbythebay.com.sg/\" target=\"_blank\">Buy tickets here</a>','Open daily: 9.00am - 9.00pm<br>\nLast admission: 8.30pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/cloud-forest-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/cloud-forest.jpg','',1),(5,'Floral Fantasy','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/floral-fantasy.html','Flowers, artistry and technology come together at Floral Fantasy to create a dream-like, fantastical experience for visitors. It comprises four diverse garden landscapes, each showcasing a different concept, as well as a 4D ride.<br><br>Closure dates for 2022:<br>19 Jan, 16 Feb<br>09 Mar, 13 Apr<br>18 May, 22 Jun<br>13 Jul, 24 Aug<br>28 Sep, 19 Oct<br>23 Nov, 07 Dec<br><br>Admission charge applies. <a href=\"https://ticket.gardensbythebay.com.sg/\" target=\"_blank\">Buy tickets here</a>','Weekdays: 10.00am - 7.00pm<br>\nLast admission: 6.30pm<br><br>\nWeekends (Sat - Sun, PH): 10.00am - 8.00pm<br>\nLast admission: 7.30pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/floral-fantasy-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/floral-fantasy.jpg','',1),(6,'OCBC Skyway','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/ocbc-skyway.html','Stroll along the 22-metre-high OCBC Skyway and enjoy panoramic vistas of the Gardens and the Marina Bay skyline.<br><br>Admission charge applies. <a href=\"https://ticket.gardensbythebay.com.sg/\" target=\"_blank\">Buy tickets here</a>','Open daily: 9.00am - 9.00pm<br>\nLast admission: 8.30pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/ocbc-skyway-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/ocbc-skyway.jpg','',1),(7,'Supertree Grove','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/supertree-grove.html','Measuring between 25 and 50 metres tall, Gardens by the Bay\'s Supertrees are designed with large canopies that provide shade in the day and come alive with an exhilarating display of lights and sounds at night.','<b>CLOSURE OF SUPERTREE GROVE<br>Supertree Grove will be closed from 5.30pm to 10.30pm from now till 2 Jan 2022 due to Christmas Wonderland.</b><br>Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/supertree-grove-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/supertree-grove.jpg','',1),(8,'Discovery','Attractions','',4,'','Venture into this realm of lush greenery and learn all about the spectacular myriad of tropical plants and the systems these plants support.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/discovery2-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/discovery2.jpg','',1),(9,'Web of Life','Attractions','',4,'','Take in the impressive sight of life-sized topiary animals such as the orang-utan, pangolin and hornbill that have been woven from fig.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/web-of-life-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/web-of-life.jpg','',1),(10,'Fruits and Flowers','Attractions','',4,'','Take a walk amongst an amazing variety of colourful flowers and fruits, enjoy the sweet scent of blossoms in season and check out the tantalising array of fruits growing in abundance in this charming garden.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/fruits-and-flowers-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/fruits-and-flowers.jpg','',1),(11,'Understorey','Attractions','',4,'','At the Understorey, find out all about how decomposers break down fallen leaves, twigs and flowers to produce much-needed nutrients for the ecosystem.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/understorey-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/understorey.jpg','',1),(12,'World of Palms','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/world-of-plants.html','Meet a colourful array of tropical lowland palms, each with its unique form, shape and stature at the World of Palms.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/world-of-palms-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/world-of-palms.jpg','',1),(13,'Secret Life of Trees','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/world-of-plants.html','At the Secret Life of Trees, discover all about the variety of swaying green giants that thrive in Singapore, and learn about the challenges they face to survive in tropical countries.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/secret-life-of-trees-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/secret-life-of-trees.jpg','',1),(14,'Indian Garden','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/heritage-gardens.html','Visit the Indian Garden, laid out in the shape of a traditional folk art floral motif design known as Kolam. Discover the garden\'s inspired, vibrant motifs and lush fauna, representing life and aspects of daily Indian culture.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/indian-garden-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/indian-garden.jpg','',1),(15,'Chinese Garden','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/heritage-gardens.html','Take a stroll through the Chinese Garden and discover a balanced landscape where art imitates nature, with the use of rocks to resemble mountains, water features to resemble rivers and waterfalls, or pruning and training trees to appear windswept.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/chinese-garden-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/chinese-garden.jpg','',1),(16,'Malay Garden','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/heritage-gardens.html','Know more about the Malays and how cultivation plays a vital part in their daily lives. The Malay Garden features an array of plants and alternative vegetables, providing raw material and medicine for the community.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/malay-garden-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/malay-garden.jpg','',1),(17,'Colonial Garden','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/heritage-gardens.html','Singapore\'s geographical position on the Spice Route made it her centre of the spice and cash crop trade. Explore the Colonial Garden and discover some of the aromatic plants from her colonial past, including Cloves, Nutmeg, Rubber, Oil Palm, Coffee and Cocoa Trees.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/colonial-garden-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/colonial-garden.jpg','',1),(18,'Serene Garden','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/serene-garden.html','A tranquil 2-hectare space located just a stone’s throw from The Meadow, visitors can get a brief respite from the hustle and bustle of the city life as they enjoy an intimate encounter with nature at Serene Garden.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/serene-garden-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/serene-garden.jpg','',1),(19,'Sun Pavilion','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/sun-pavilion.html','Take a walk through the Sun Pavilion and marvel at the amazing desert-like landscapes. With over 1,000 desert plants comprising some 100 different species and varieties, the Sun Pavilion is nothing short of extraordinary.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/sun-pavilion-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/sun-pavilion.jpg','',1),(20,'Far East Organization Children\'s Garden','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/far-east-organization-childrens-garden.html','Have a fun-filled family day with interactive play delights, water play features and educational programmes in a lush natural setting at Far East Organization Children’s Garden.','Weekdays (Tues - Fri): 9.00am - 7.00pm<br>Last admission: 6.30pm<br>Closed every Monday<br>Closed on Tuesday if the preceding Monday is a public holiday.<br><br>Weekends (Sat - Sun, PH): 9.00am - 9.00pm<br>Last admission: 8.30pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/childrens-garden-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/childrens-garden.jpg','',1),(21,'The Canyon','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/the-canyon.html','Be in awe of the rocks’ naturally intriguing shapes and imposing sizes which stand out against the surrounding backdrop of the Cooled Conservatories. Adding to the exotic appeal are 200 plant species unique to arid regions, as well as four mystical sculptures in the form of a giant dragonfly, a metal dragon and two Chinese totems.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/canyon-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/canyon.jpg','',1),(22,'Silver Garden','Attractions','',4,'https://www.gardensbythebay.com.sg/en/book-a-venue/venues/silver-leaf.html','Under the canopy of silver-hued Supertrees, Silver Garden overlooks the Dragonfly Lake.','Open daily: 5.00am - 2.00am','','','',1),(23,'Dragonfly Lake','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/dragonfly-and-kingfisher-lake.html','Find out how Dragonfly Lake plays a vital role in supporting the aquatic ecosystem and the Gardens\' sustainability as you stroll along the 400-metre boardwalk.','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/dragonfly-lake-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/dragonfly-lake.jpg','',1),(24,'Kingfisher Lake','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/dragonfly-and-kingfisher-lake.html','The Kingfisher Lake is one of the two lakes integral to the lake system and environmental sustainability at the Gardens. The Kingfisher Lake rich source of aquatic life plays a vital role in ensuring better water quality by acting as a natural eco-filter and strategically located aquatic reeds also act as filter beds. ','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/kingfisher-lake-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/kingfisher-lake.jpg','',1),(25,'Bay East Garden','Attractions','',4,'https://www.gardensbythebay.com.sg/en/book-a-venue/venues/bay-east-bridge.html','With glorious views of the Marina Bay skyline, Bay East Garden offers scenic tranquility in the city.','Open daily: 24 hrs','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/bay-east-gardens-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/bay-east-garden.jpg','',1),(26,'Cafe Crema','Dining','',6,'','Savour a cup of artisanal coffee and gourmet sandwiches or delight in our Japanese creations, while enjoying the splendour of the Supertrees from Cafe Crema.','Open daily: 8.30am - 6.30pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/cafe-crema-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/cafe-crema.jpg','',0),(27,'McDonald\'s','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/mcdonalds.html','Enjoy the familiar tastes of your McDonald’s Favourites right here at the Gardens!','Daily: 8.30am - 10.30pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/mcdonalds-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/mcdonalds.jpg','',1),(28,'Bakerzin','Dining','',6,'','A casual dining cafe specialising in desserts, you\'ll be spoilt for choice with Bakerzin\'s wide array of cakes, pastries, and savoury offerings.','Open daily: 11.00am - 7.00pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/bakerzin-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/bakerzin.jpg','',0),(29,'Conservatory Cafe','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/conservatory-cafe.html','The Conservatory Cafe offers 17 flavours of delectable premium ice-creams, delicious treats and thirst-quenching drinks that will make your visit to the Gardens truly unforgettable.','Open daily: 9.00am - 9.00pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/conservatory-cafe-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/conservatory-cafe.jpg','',1),(30,'Majestic Bay Seafood Restaurant','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/majestic-bay-seafood-restaurant.html','A Chinese seafood restaurant, Majestic Bay offers the freshest underwater catch and magnificent views of the Marina Bay waterfront.','Open daily<br>\nLunch: 11.30am - 3.00pm (last order at 2.45pm)<br>\nDinner: 5.30pm - 9.00pm (last order at 8.45pm)','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/majestic-bay-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/majestic-bay.jpg','',1),(31,'Marguerite (New!)','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/marguerite.html','Taking root amidst the lush garden surrounds of the Flower Dome, Marguerite by Chef/Owner Michael Wilson embraces the best of the seasons with tasting menus that celebrate craft, provenance and produce through contemporary cuisine. Fine wines, innovative temperance beverages and a personalised level of service that exudes warmth, ease and charm complement a fine dining experience of true exception.','Wed – Thu\n<br><br>\nDinner<br>\n6.00pm – 10.00pm (last seating at 8.00pm)\n<br><br>\nFri - Sun\n<br>\nLunch<br>\n12.00pm – 3.00pm (last seating at 1.30pm)\nDinner<br>\n6.00pm – 10.00pm (last seating at 8.00pm)\n<b>Closed every Monday and Tuesday</b>','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/marguerite-thumb-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/marguerite-thumb-1670x940.jpg','',1),(32,'Supertree Food Hall','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/supertree-food-hall.html','Supertree Food Hall presents an assembly of seven mini restaurants serving a myriad of international cuisines ranging from authentic Vietnamese, Hong Kong, Japanese, Indian, Western and mouthwatering local favourites!','Weekdays: 11.00am - 9.00pm<br>Weekends: 11.00am - 10.00pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/supertree-food-hall-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/supertree-food-hall.jpg','',0),(33,'Petit Coco @ Children\'s Garden Cafe','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/petit-coco.html','Located in Far East Organization Children\'s Garden, this casual cafe serves delicious bento meals and light snacks for adults and children alike. Perfect when you need an energy boost while watching your kids play!','Daily: 10.00am - 6.00pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/childrens-garden-cafe-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/childrens-garden-cafe.jpg','',1),(34,'Satay by the Bay','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/satay-by-the-bay.html','Bond with friends and family over local delights, while enjoying the views of the waterfront at Satay by the Bay.<br><br>Open with selected stalls:<br>Marina Live Seafood, Makan by the Bay (Halal, closed on Mondays), Thai Cuisine, Huat Huat chicken wings, GeyLang Lor 29 Hokkien Mee, 26 @ Marina Live Seafood (Steam boat), Satay stalls, Drink stall','Open daily: 11.00am - 10.30pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/satay-by-the-bay-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/satay-by-the-bay.jpg','',1),(35,'Cafe Aster','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/cafe-aster.html','Cafe Aster celebrates the concept of food, flowers and experience.','Daily: 11.30am – 8.00pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/cafe-aster-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/cafe-aster.jpg','',1),(36,'Toilet (Near The Meadow)','Toilets','',19,'','','','','','',1),(37,'Toilet (Near Supertree Grove)','Toilets','',19,'','','','','','',1),(38,'Toilet','Toilets','',19,'','','','','','',1),(39,'Toilet (Near Golden Garden)','Toilets','',19,'','','','','','',1),(40,'Toilet (Inside Flower Dome)','Toilets','',19,'','Admission ticket to Flower Dome is required to use this toilet.','','','','',1),(41,'Toilet (Inside Cloud Forest)','Toilets','',19,'','Admission ticket to Cloud Forest is required to use this toilet.','','','','',1),(42,'Toilet (Near Flower Dome)','Toilets','',19,'','','','','','',1),(43,'Toilet (Near Childrens\' Garden)','Toilets','',19,'','','','','','',1),(44,'Accessible Toilet (Near The Meadow)','Toilets','',1,'','','','','','',1),(45,'Accessible Toilet (Near Colonial Garden)','Toilets','',1,'','','','','','',1),(46,'Accessible Toilet (Near Silver Garden)','Toilets','',1,'','','','','','',1),(47,'Accessible Toilet (Near Golden Garden)','Toilets','',1,'','','','','','',1),(48,'Accessible Toilet (Near Flower Dome)','Toilets','',1,'','','','','','',1),(49,'Accessible Toilet (Near Childrens\' Garden)','Toilets','',1,'','','','','','',1),(50,'Floral Fantasy Information Counter','Information Counters & Visitor Services Centre','',11,'','<p><br><b>Click here for more details <a href=\"https://www.gardensbythebay.com.sg/en/plan-your-visit/opening-hours.html\" target=\"_blank\"><u>here.</u></a></p><br><br></b></p>','<b>Closed until further notice</b>','','','',1),(51,'Golden Garden Information Counter','Information Counters & Visitor Services Centre','',11,'','<p><br><b>Click here for more details <a href=\"https://www.gardensbythebay.com.sg/en/plan-your-visit/opening-hours.html\" target=\"_blank\"><u>here.</u></a></p><br><br></b></p>','<b>Closed until further notice</b>','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/golden-info-counter-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/golden-info-counter.jpg','',1),(52,'Bicycle Parking (The Meadow)','Bicycle Parking','',5,'','','','','','',1),(53,'Bicycle Parking (Waterfront Promenade near Cloud Forest)','Bicycle Parking','',5,'','','','','','',1),(54,'Bicycle Parking (Children\'s Garden)','Bicycle Parking','',5,'','','','','','',1),(55,'Floral Fantasy Ticketing Counter / Automated Ticketing Kiosk','Ticketing Counters','',18,'','<p><br><b>Click here for more details <a href=\"https://www.gardensbythebay.com.sg/en/plan-your-visit/opening-hours.html\" target=\"_blank\"><u>here.</u></a></p><br><br></b><p>Buy tickets <a href=\"https://ticket.gardensbythebay.com.sg/\" target=\"_blank\"><u>here.</u></a></p></b>','<b>Closed until further notice. Please buy your admission tickets online.</b>','','','',1),(56,'The Canopy Ticketing Counter','Ticketing Counters','',18,'','<p><br><b>Click here for more details <a href=\"https://www.gardensbythebay.com.sg/en/plan-your-visit/opening-hours.html\" target=\"_blank\"><u>here.</u></a></p><br><br></b><p>Buy tickets <a href=\"https://ticket.gardensbythebay.com.sg/\" target=\"_blank\"><u>here.</u></a></p></b>','<b><p>Open daily: 9.00am - 9.00pm</p>\n','','','',1),(57,'OCBC Skyway Ticketing Counter','Ticketing Counters','',18,'','<p><br><b>Click here for more details <a href=\"https://www.gardensbythebay.com.sg/en/plan-your-visit/opening-hours.html\" target=\"_blank\"><u>here.</u></a></p><br><br></b></p>','<b>Closed until further notice. Please buy your admission tickets online.</b>','','','',1),(58,'Floral Fantasy Gift Shop','Gift Shops','',10,'https://www.gardensbythebay.com.sg/en/shop/floral-fantasy-gift-shop.html','<p><br><b>Click here for more details <a href=\"https://www.gardensbythebay.com.sg/en/plan-your-visit/opening-hours.html\" target=\"_blank\"><u>here.</u></a></p><br><br></b></p>','<b>Closed until further notice</b>','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/floral-fantasy-gift-shop-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/floral-fantasy-gift-shop.jpg','',1),(59,'Canopy Gift Shop','Gift Shops','',10,'https://www.gardensbythebay.com.sg/en/shop/canopy-gift-shop.html','','<b>Closed until further notice</b>','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/canopy-gift-shop-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/canopy-gift-shop.jpg','',0),(60,'Conservatory Gift Shop','Gift Shops','',10,'https://www.gardensbythebay.com.sg/en/shop/conservatory-gift-shop.html','<p>Pick up souvenirs and last-minute gifts from a wide range of merchandise suitable for loved ones of all ages.<br><b>Find out more <a href=\"https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/conservatory-gift-shop.html\" target=\"_blank\"><u>here.</u></a></p></b>','Open daily: 9.00am - 9.00pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/conservatory-gift-shop-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/conservatory-gift-shop.jpg','',1),(61,'Arrival Gift Shop','Gift Shops','',10,'https://www.gardensbythebay.com.sg/en/shop/arrival-gift-shop.html','<p>Bring home your very own Gardens by the Bay merchandise with a range of plant collections from the Arrival Gift Shop.<br><b>Find out more <a href=\"https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/arrival-gift-shop.html\" target=\"_blank\"><u>here.</u></a></p></b>','Open daily: 9.00am - 9.00pm','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/arrival-gift-shop-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/arrival-gift-shop.jpg','',1),(62,'Bayfront Plaza Carpark','Carparks','',14,'','Basement carpark','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/bayfront-carpark-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/bayfront-carpark.jpg','',1),(63,'Main Entrance Basement Carpark','Carparks','',14,'','Open-air carpark','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/main-carpark-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/main-carpark.jpg','',1),(64,'Satay by The Bay Carpark','Carparks','',14,'','Open-air carpark','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/satay-carpark-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/satay-carpark.jpg','',1),(65,'The Meadow Carpark','Carparks','',14,'','Open-air carpark','Open daily: 5.00am - 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/meadow-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/meadow.jpg','',1),(66,'Bay East Garden Carpark','Carparks','',14,'','Open-air carpark','Open daily: 5.00am - 12.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/bay-east-carpark-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/bay-east-carpark.jpg','',1),(67,'First Aid (The Canopy)','First Aid','',9,'','','','','','',1),(68,'First Aid (Children\'s Garden)','First Aid','',9,'','','','','','',1),(69,'Drop Off (Bayfront Pavilion)','Drop off Points','',7,'','','','','','',0),(70,'Drop Off (Main Entrance)','Drop off Points','',7,'','','','','','',1),(71,'Nursing Room','Nursing Rooms','',13,'','','','','','',1),(72,'Nursing Room (The Canopy)','Nursing Rooms','',13,'','','','','','',1),(73,'Nursing Room (Children\'s Garden)','Nursing Rooms','',13,'','','','','','',1),(74,'Cash Machines (The Canopy)','Cash Machines','',21,'','','','','','',1),(75,'Bayfront Pavilion (Event Venue)','Event Venues','',8,'','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/bayfront-pavilion-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/bayfront-pavilion.jpg','',0),(76,'Cannonball Room (Event Venue)','Event Venues','',8,'','','','','','',1),(77,'Colonnade','Attractions','',8,'','','','','','',1),(78,'Colonnade (Towards Canopy)','Attractions','',8,'','','','','','',1),(79,'Friends of The Gardens Centre','Friends of the Gardens Centre','',11,'','<p><br><b>Click here for more details <a href=\"https://www.gardensbythebay.com.sg/en/plan-your-visit/opening-hours.html\" target=\"_blank\"><u>here.</u></a></p></b></p><br/><br/>','Closed till further notice, please proceed to Ticketing Counter 4 at The Canopy for assistance.','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/fog-centre-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/fog-centre.jpg','',1),(80,'The Canopy Visitor Service Centre','Information Counters & Visitor Services Centre','',11,'','<p><br><b>Click here for more details <a href=\"https://www.gardensbythebay.com.sg/en/plan-your-visit/opening-hours.html\" target=\"_blank\"><u>here.</u></a></p></b></p><br><br>','<b>Closed until further notice</b>','','','',1),(81,'The Wyvern','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(82,'Magnificent Bull','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','Sited at the Arrival Square of the Gardens, this strong bronze cast bull sculpture by renowned American sculptor Walter Matia (b. 1953) displays a vigour that aptly depicts Singapore’s bullish economy.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/bull-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/bull.jpg','',1),(83,'The Giant Snail','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b><br><br>Wonderfully captured by contemporary Australian artist Will Wilson, a bronze cast of an oversized snail stands among the beds of multi-coloured of begonias growing in the shady and humid Secret Garden.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/giant-snail-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/giant-snail.jpg','',1),(84,'Ants on Trees','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','Climbing all over our “peek-a-boo” trees made from the hollow trunks of Bishop Wood (Bischofia javanica), these curious ants seem to be hard at work and are a favourite with our young visitors.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/ants-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/ants-on-trail.jpg','',1),(85,'Dragonfly Riders','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','A landmark feature within the tranquil Dragonfly Lake, these magnificent giant dragonflies sculptures with casts of children riding on their backs, measure 5m by 6m. The laser-cut meshed pattern used on the wings of the dragonflies encases colourful art glass, which gives an overall fascinating abstract effect.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/dragonfly-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/dragonfly.jpg','',1),(86,'Fountain Fish','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(87,'Diaspora','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','Named Diaspora, or li xiang (离乡), which means “to leave one’s native place”, this two-piece sculpture pays homage to early Chinese immigrants who had journeyed to Singapore in search of a better life.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/diaspora-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/diaspora.jpg','',1),(88,'Guardian Lions ','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','The two pairs of guardian lions placed to welcome visitors at both ends of the Supertree Grove are a prime example of traditional Chinese sculpture. ','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/guardian-lions-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/guardian-lions.jpg','',1),(89,'Planet','Art Sculptures','',15,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','A hefty seven tons, this impressive bronze sculpture is 9m long and 3m tall. It portrays an oversized reproduction of the artist\'s own son, Lucas, as a baby.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/planet-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/planet.jpg','',1),(90,'La Famille de Voyageurs','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b><br><br>Inspired by the universal theme of travel, French sculptor Bruno Catalano’s eye-catching works, with their dashed bodies and the deliberate lack of volume, invite the viewer to mentally reconstruct the possibility of the human potential.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/la-famille-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/la-famille.jpg','',1),(91,'Floral Clock','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','This seven-metre-wide Floral Clock draws inspiration from the signature characteristics of Audemars Piguet\'s Royal Oak collection and fuses traditional and contemporary landscaping elements in its design.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/floral-clock-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/floral-clock.jpg','',1),(92,'Buaya Crocodile','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(93,'Masks and Shields','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(94,'Mama Gaya Crocodile','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(95,'Eastern Cowboys','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(96,'Totems and Horse','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(97,'The Rush of Nature','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(98,'Upright Totems','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(99,'Bifurcate Totems','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(100,'Boots and Sailors','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(101,'Mosaic Crocodile','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(102,'Pale Crocodile','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(103,'Dragonfly ','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(104,'Simba','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(105,'Multiple Maternity','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(106,'Ladies Heads','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(107,'Parting...','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(108,'Warriors','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(109,'Bird Figures','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(110,'Big Green Eagle','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(111,'Mother and Son Big Hug','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(112,'Lion Doors','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b>','','','','',1),(113,'The Eagle Has Landed','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','<b>Admission to the attraction is required</b><br><br>Cleverly crafted from the polished and varnished Lychee roots, this commanding eagle is supported by a plain Lychee tree stump. The eagle has a reputation as a fierce hunter in the sky and its name also resembles the Chinese word for “hero”.','','','','',1),(114,'Lion, Tiger and Leopard','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(115,'Resting Dragonfly','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(116,'Colourful Dragonflies','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(117,'Trio of Kingfishers','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','Comprising two kingfisher sculptures in a perching stance and one in a flight position, the Trio of Kingfishers is given pride of place at the Kingfisher Lake, one of the more tranquil and relaxing spots in the Gardens.','','','','',1),(118,'Tiger','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(119,'Resting Budai','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(120,'Plum Blossom Series','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(121,'Water Buffaloes','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(122,'Fish Series','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(123,'Dralion Series','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(124,'Lotus Series','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(125,'Faces of Stone Series','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(126,'Charging Bull','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(127,'Red Charging Bull','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(128,'The Great Strategist','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(129,'Bottle Baby','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(130,'Marco Drago','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(131,'Lion King','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(132,'Moongate','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','Standing at 3.8m, Moongate features an upright bronze ring with a uniquely textured inner surface modelled after abstract shapes that draw inspiration from the phenomena of our constantly changing natural world, such as shifting sands, tongues of flames, and the changing form of clouds.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/moongate-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/moongate.jpg','',1),(133,'Fiore','Art Sculptures','',20,'','Fiore is particularly captivating with an extensive headdress composed with flora and fauna that are reminiscent of Henri Matisse’s still-lifes. Valdés’s works are highly inspired by nature.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/fiore-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/fiore.jpg','',1),(134,'The Sea Shell','Art Sculptures','',20,'','Influenced by historical masterpieces, Valdés creates large works in which the lighting and colours express a sensation of tactility.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/seashell-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/seashell.jpg','',1),(135,'Ferns','Art Sculptures','',20,'','Influenced by historical masterpieces, Valdés creates large works in which the lighting and colours express a sensation of tactility.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/ferns-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/ferns.jpg','',1),(136,'Flower Field Hall (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/flower-field-hall.html','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/flower-field-hall-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/flower-field-hall.jpg','',1),(137,'Waterview Room (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/waterview-room.html','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/waterview-room-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/waterview-room.jpg','',1),(138,'Silver Leaf (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/silver-leaf.html','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/silver-leaf-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/silver-leaf.jpg','',1),(139,'The Meadow (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/the-meadow.html','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/the-meadow-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/the-meadow.jpg','',1),(140,'Secret Life of Trees (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/secret-life-of-trees.html','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/secret-life-of-trees-venue-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/secret-life-of-trees-venue.jpg','',1),(141,'Champagne @ OCBC Skyway (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/champagne-ocbc-skyway.html','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/champagne-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/champage-ocbc.jpg','',1),(142,'Promenade Lawn (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/promenade-lawn.html','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/promenade-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/promenade.jpg','',1),(143,'Bay East Bridge (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/bay-east-bridge.html','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/bay-east-bridge-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/bay-east-bridge.jpg','',1),(144,'Watching Clouds','Art Sculptures','',20,'','','','','','',1),(145,'Victoria Lily Pond','Attractions','',4,'','','','','','',1),(146,'Faces of Stone Series','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','','','',1),(147,'Pixiu','Art Sculptures','',20,'','','','','','',1),(148,'Huabiao','Art Sculptures','',20,'','','','','','',1),(149,'Bayfront Plaza (Near Bayfront MRT)','Attractions','',4,'','','','','','',1),(150,'Accessible Toilet (Near Bayfront Pavilion)','Toilets','',1,'','','','','','',0),(151,'Toilet (Near Bayfront Plaza)','Toilets','',19,'','','','','','',1),(152,'Bayfront Plaza Ticketing Counter','Ticketing Counters','',18,'','<p><br><b>Click here for more details <a href=\"https://www.gardensbythebay.com.sg/en/plan-your-visit/opening-hours.html\" target=\"_blank\"><u>here.</u></a></p><br><br></b><p>Buy tickets <a href=\"https://ticket.gardensbythebay.com.sg/\" target=\"_blank\"><u>here.</u></a></p></b>','<b>Closed until further notice. Please buy your admission tickets online.</b>','','','',1),(153,'Dragonfly Bridge','Attractions','',4,'','','','','','',1),(154,'Toilet (Near Malay Garden)','Toilets','',19,'','','','','','',1),(155,'Taxi Stand (Arrival Drop-off)','Taxi Stand','',17,'','','','','','',1),(156,'Stairs (Arrival Drop-off)','Stairs','',16,'','','','','','',1),(157,'Stairs (Supertree Grove)','Stairs','',16,'','','','','','',1),(158,'Lift B (Supertree Grove)','Lifts','',12,'','','','','','',1),(159,'Accessible Toilet','Toilets','',19,'','','','','','',1),(160,'Calabash Room (Event Venue)','Event Venues','',8,'','','','','','',1),(161,'Stairs (Supertree Grove)','Stairs','',16,'','','','','','',1),(162,'Lift C (Supertree Grove)','Lifts','',12,'','','','','','',1),(163,'Stairs (Supertree Grove, near World of Plants)','Stairs','',16,'','','','','','',1),(164,'Stairs (Supertree Grove, near Colonial Garden)','Stairs','',16,'','','','','','',1),(165,'Lift A (The Canopy)','Lifts','',12,'','','','','','',1),(166,'Escalator (The Canopy)','Escalators','',16,'','','','','','',1),(167,'Savi Masks','Art Sculptures','',20,'','','','','','',1),(168,'Supertree Grove Lawn','Attractions','',4,'','','','','','',1),(169,'Supertree Observatory','Attractions','',4,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/supertree-observatory.html','Located at the canopy of the tallest Supertree at Supertree Grove, visitors can soak in unblocked cityscape views at our open-air rooftop deck, enjoy light refreshments and try out immersive digital learning experiences inside our observatory space.<br><br>Admission charge applies. Limited tickets can be purchased from a self-service Ticketing kiosk at the attraction entrance.</a>','<br><br>Mon - Fri: 4.00pm – 9.00pm<br>\n(Last admission at 8.30pm)\n<br><br>\nSat, Sun & PH: 12.00pm – 9.00pm<br>\n(Last admission at 8.30pm)','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/supertree-obs-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/supertree-observatory.jpg','',1),(170,'Supertree Observatory Cafe (Inside Supertree Observatory)','Dining','',6,'','Cap your day off with some light refreshments at Supertree Observatory Cafe, while you relax and enjoy magnificent views of the city skyline! A variety of refreshments such as cocktails, mocktails, soft drinks and light snacks, are available on the menu.','<b>Closed until further notice</b>','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/supertree-obs-cafe-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/supertree-obs-cafe.jpg','',0),(171,'Toilet (Inside Supertree Observatory)','Toilets','',19,'','Admission ticket to Supertree Observatory is required to use this toilet.','','','','',1),(172,'Big Fish Aquarium','Attractions','',4,'','','','','','',1),(173,'Arowana Aquarium','Attractions','',4,'','','','','','',1),(174,'Floral Fantasy & SG Lattice (Event Venue)','Event Venues','',8,'','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/floral-fantasy-venue-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/floral-fantasy-venue.jpg','',1),(175,'Supertree Observatory (Event Venue)','Event Venues','',8,'','','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/supertree-obs-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/supertree-observatory.jpg','',1),(176,'Nursing Room (Inside Cloud Forest after going down the escalator from Crystal Mountain)','Nursing Rooms','',13,'','Admission ticket to Cloud Forest is required.','','','','',1),(177,'Nursing Room (Floral Fantasy inside Gift Shop)','Nursing Rooms','',13,'','Admission ticket to Floral Fantasy is required.','','','','',1),(178,'Nursing Room (Golden Garden)','Nursing Rooms','',13,'','','','','','',1),(179,'Nursing Room (The Meadow)','Nursing Rooms','',13,'','','','','','',1),(180,'Shuttle Stop (Bayfront Plaza)','Shuttle Stops','',4,'','','','','','',1),(181,'Shuttle Stop (Near Flower Dome entrance) ','Shuttle Stops','',4,'','','','','','',1),(182,'West Lawn (Next to Bayfront Plaza)','Attractions','',4,'','','','','','',1),(183,'Ficus Room','Event Venues','',8,'','Ficus Room is a multipurpose space suitable for all types of corporate events ranging from seminars, workshops to even product launches. It is also situated at Active Garden, which provides additional venue spaces at Waterfront Plaza, Active Garden Lawn and Moongate Lawn — giving you more options for your events. ','','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/thumb/ficus-room-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/full/ficus-room-wayfinder-1670x940.jpg','',1),(184,'Active Garden','Attractions','',4,'','The all-new Active Garden embodies Gardens by the Bay’s vision of being a \'People’s Garden’.  Designed to bring together people of all ages and all walks of life, Active Garden is our latest outdoor social hub where there is something for everyone. The perfect playground for the young or young at heart, this is an ideal communal space for people across generations to relax and bond in a lush, waterfront setting. Pets are welcome, too!','Daily: 5.00am – 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/thumb/activegarden-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/full/activegarden-wayfinder-1670x940.jpg','',1),(185,'South American Garden','Event Venues','Active Garden Lawn',8,'','','','','','',1),(186,'AirMesh','Art Sculptures','',20,'https://www.gardensbythebay.com.sg/en/attractions/art-sculptures.html','','','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/thumb/airmesh-thumb.jpg ','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/full/airmesh.jpg','',0),(187,'Shake Shack ','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/shake-shack.html','Shake Shack is a modern day \"roadside\" burger stand known for its delicious burgers, chicken, hotdogs, frozen custard,beer, wine and more.','Mon - Thu: 10.30am - 9.00pm<br>\nFri, PH eve: 10.00am - 10.00pm<br>\nSat, Sun, PH: 9.30am- 10.00pm','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/thumb/shake-shack-thumb-500x500px.jpg ','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/full/shake-shack-1670x940.jpg','',1),(188,'Starbucks','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/starbucks.html','A neighbourhood friendly gathering place to meet friends and family over cups of coffe and delicious food.','Mon - Thu: 8.30am - 10.30pm<br>\nFri & Eve of PH: 8.30am - 11.00pm<br>\nSat: 8.00am - 11.00pm<br>\nSun: 8.00am - 10.30pm<br>','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/thumb/starbucks-thumb-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/full/starbucks-1670x940.jpg','',1),(189,'Social Kitchen','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/the-social-kitchen.html','The Social Kitchen is a new dining concept with a mission to benefit the vulnerable community by creating jobs through food. Admission tickets to Supertree Observatory are required.','Daily: 4.00pm - 9.00pm<br><br><b>Takeaway services only</b>','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/thumb/tsk-thumb-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/locations/full/tsk-1670x940.jpg','',1),(190,'Mylo\'s','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/mylos.html','The namesake of Churner-in-Chief Michael Wilson’s golden retriever, Mylo’s celebrates gathering with family, friends and your beloved pets. Fresh bakes and coffee, classic sarnies, cheeky tipples and over 20 seasonal gelatos made onsite are the order of the day at the newest pet-friendly cafe in town!','Wed - Thu: 8.00am - 8.00pm<br>\nFri - Sun: 8.00am - 10.00pm<br>\n<br>\nWalk-ins only<br>\n<br>\nClosed every Monday & Tuesday','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/mylos1-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/mylos1-wayfinder-1670x940.jpg','',1),(191,'Moongate Lawn (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/venues/moongate-lawn.html','The Moongate Lawn is located at Active Garden along the waterfront promenade. It offers a beautiful landscape space with breathtaking views of the Marina Channel and the city skyline. Surrounded by the waterfront and lush open lawns, the Moongate Lawn is perfect for whatever event you can think of.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/moongate-lawn-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/moongate-lawn-wayfinder-1670x940.jpg','',1),(192,'Active Garden Lawn (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/venues/active-garden.html','Whatever event you may be planning, Active Garden Lawn is the ideal place to hold it. With Marina Bay Sands and the Singapore Flyer as your backdrop, this lush open space makes it the postcard-perfect venue. There’s really no other place to be.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/active-garden-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/active-garden-wayfinder-1670x940.jpg','',1),(193,'Waterfront Plaza (Event Venue)','Event Venues','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/venues/waterfront-plaza.html','Located in Active Garden, Waterfront Plaza offers a sheltered open space with breathtaking views of Marina Bay and the city skyline. It’s the perfect venue for special-themed events, fancy cocktail receptions, or even team building events.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/waterfront-plaza-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/waterfront-plaza-wayfinder-1670x940.jpg','',1),(194,'Hortus (New!)','Dining','',6,'https://www.gardensbythebay.com.sg/en/things-to-do/dine-and-shop/hortus.html','Casual Mediterranean cuisine by Michelin star chef Michael Wilson.','Open from Wednesdays to Sundays only<br>\n10.00am - 9.00pm (Last order 8.00pm)<br><br>Closed every Monday and Tuesday','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/hortus1-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/hortus1-wayfinder-1670x940.jpg','',1),(195,'The Meadow','Attractions','',8,'https://www.gardensbythebay.com.sg/en/book-a-venue/the-meadow.html','Singapore’s largest outdoor garden event space, The Meadow offers a standing capacity of up to 30,000^ people.','','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/the-meadow-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/the-meadow.jpg','',1),(196,'Kingfisher Wetlands','Attractions','',8,'https://www.gardensbythebay.com.sg/en/things-to-do/attractions/kingfisher-wetlands.html','For bird watchers and nature photographers, the Kingfisher Wetlands never disappoints. The Gardens’ latest attraction, this new freshwater sanctuary opens the eye to a flourishing diversity of exotic flora and fauna.','Daily: 5.00am – 2.00am','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/thumb/kw-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb/wayfinder/locations/full/kw-wayfinder-1670x940.jpg','',1),(197,'Bicycle Parking (Main Entrance)','Bicycle Parking','',5,'','','','','','',1),(198,'Bicycle Parking (Waterfront Promenade near Active Garden)','Bicycle Parking','',5,'','','','','','',1);
/*!40000 ALTER TABLE `locations_properties` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `locations_type`
--

DROP TABLE IF EXISTS `locations_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_type`
--

LOCK TABLES `locations_type` WRITE;
/*!40000 ALTER TABLE `locations_type` DISABLE KEYS */;
INSERT INTO `locations_type` VALUES (1,'Feature'),(2,'AAA'),(3,'BBB');
/*!40000 ALTER TABLE `locations_type` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping events for database 'gbb_wayfinder'
--

--
-- Dumping routines for database 'gbb_wayfinder'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_insert_location`(
	IN vid INT,     
    IN vname VARCHAR(255),
    IN vlocationtype VARCHAR(255),
    IN viconpath VARCHAR(2048),
    IN vcategory VARCHAR(255), 
    IN vsubcategory VARCHAR(255),
    IN vgeotype VARCHAR(255),
    IN vgeolat DOUBLE,
    IN vgeolon DOUBLE,
    IN vwebsite TEXT,
    IN vpopupcontent TEXT,
    IN vopeninghours TEXT,
    IN vfeaturedimage VARCHAR(2048),
    IN vdetailimage VARCHAR(2048),
    IN vexclusivepromotion VARCHAR(255),
    IN vvisible BOOLEAN)
BEGIN
	
    DECLARE icon_id INT;
    DECLARE type_id INT;

SELECT 
    id
INTO icon_id FROM
    gbb_wayfinder.locations_properties_customicons
WHERE
    icon = viconpath;
    
SELECT 
    id
INTO type_id FROM
    gbb_wayfinder.locations_type
WHERE
    type = vlocationtype;
    
INSERT INTO gbb_wayfinder.locations (id, type, geometry, properties) VALUES (vid, type_id, vid, vid);
INSERT INTO gbb_wayfinder.locations_geometry (id, type, latitude, longitude) VALUES (vid, vgeotype, vgeolat, vgeolon);
INSERT INTO gbb_wayfinder.locations_properties (id, name, category, subCategory, customIconId, website, popupContent, openingHours, featuredImage, detailImage, exclusivePromotion, visible) VALUES (vid, vname, vcategory, vsubcategory, icon_id, vwebsite, vpopupcontent, vopeninghours, vfeaturedimage, vdetailimage, vexclusivepromotion, vvisible);
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_trunc_locations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_trunc_locations`()
BEGIN
	TRUNCATE TABLE locations_geometry;
    TRUNCATE TABLE locations_properties;
    TRUNCATE TABLE locations;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_trunc_location_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_trunc_location_categories`()
BEGIN
	TRUNCATE TABLE gbb_wayfinder.location_categories;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_events` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_events`(
	IN vid INT,     
    IN vname VARCHAR(255),
    IN vlocationid INT,
    IN vfeaturedimage VARCHAR(2048),
    IN vdetailimage VARCHAR(2048),
    IN vlistingduration VARCHAR(255),
    IN vopeninghours TEXT,
    IN veventdescription TEXT,
    IN vactive BOOLEAN,
    IN vextract BOOLEAN)
BEGIN
	UPDATE 
		gbb_wayfinder.events
	SET 
		name = vname,
        location_id = vlocationid,
        featuredImage = vfeaturedimage,
        detailImage = vdetailimage,
        listingDuration = vlistingduration,
        openingHours = vopeninghours,
        eventDescription = veventdescription,
        active = vactive,
        extract = vextract
	WHERE
		id = vid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_features` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_features`(
	IN vid INT,     
    IN vname VARCHAR(255),
    IN vlocationtype VARCHAR(255),
    IN viconpath VARCHAR(2048),
    IN vcategory VARCHAR(255), 
    IN vsubcategory VARCHAR(255),
    IN vgeotype VARCHAR(255),
    IN vgeolat DOUBLE,
    IN vgeolon DOUBLE,
    IN vwebsite TEXT,
    IN vpopupContent TEXT,
    IN vopeninghours TEXT,
    IN vfeaturedimage VARCHAR(2048),
    IN vdetailimage VARCHAR(2048),
    IN vexclusivepromotion VARCHAR(255),
    IN vzoomLevel INT,
    IN vexclude BOOLEAN,
    IN vvisible BOOLEAN)
BEGIN
	
    DECLARE icon_id INT;
    DECLARE type_id INT;

    SELECT 
        id
    INTO icon_id FROM
        gbb_wayfinder.locations_properties_customicons
    WHERE
        icon = viconpath;
    
    SELECT 
        id
    INTO type_id FROM
        gbb_wayfinder.locations_type
    WHERE
        type = vlocationtype;
        
    UPDATE gbb_wayfinder.locations 
    SET 
        type = type_id,
        zoomLevel = vzoomLevel,
        exclude = vexclude
    WHERE
        id = vid;
    
    UPDATE gbb_wayfinder.locations_geometry 
    SET 
        type = vgeotype,
        latitude = vgeolat,
        longitude = vgeolon
    WHERE
        id = vid;
        
    UPDATE gbb_wayfinder.locations_properties 
    SET 
        name = vname,
        category = vcategory,
        subcategory = vsubcategory,
        customIconId = icon_id,
        website = vwebsite,
        popupContent = vpopupContent,
        featuredImage = vfeaturedimage,
        detailImage = vdetailimage,
        exclusivePromotion = vexclusivepromotion,
        visible = vvisible
    WHERE
        id = vid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_itineraries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_update_itineraries`(
	IN vid INT,     
    IN vname VARCHAR(255),
    IN vnumberofattractions INT,
    IN vattractions VARCHAR(255),
    IN vimage VARCHAR(2048),
    IN vduration VARCHAR(255),
    IN vdurationcode INT,
    IN vopeninghours TEXT,
    IN veventdescription TEXT,
    IN vactive BOOLEAN)
BEGIN
	UPDATE 
		gbb_wayfinder.itineraries
	SET
		name = vname,
        numberOfAttractions = vnumberofattractions,
        attractions = vattractions,
        image = vimage,
        duration = vduration,
        durationCode = vdurationcode,
        openingHours = vopeninghours,
        eventDescription = veventdescription,
        active = vactive
	WHERE
		id = vid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `features_list`
--

/*!50001 DROP VIEW IF EXISTS `features_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `features_list` AS select `ltype`.`type` AS `type`,`geo`.`type` AS `geo_type`,`geo`.`latitude` AS `latitude`,`geo`.`longitude` AS `longitude`,`props`.`id` AS `id`,`props`.`name` AS `name`,`props`.`category` AS `category`,`props`.`subCategory` AS `subCategory`,`icons`.`icon` AS `icon`,`icons`.`width` AS `width`,`icons`.`height` AS `height`,`props`.`website` AS `website`,`props`.`popupContent` AS `popupContent`,`props`.`openingHours` AS `openingHours`,`props`.`featuredImage` AS `featuredImage`,`props`.`detailImage` AS `detailImage`,`props`.`exclusivePromotion` AS `exclusivePromotion`,if((`props`.`visible` = 1),'true','false') AS `visible`,`locs`.`zoomLevel` AS `zoomLevel`,if((`locs`.`exclude` = 1),'true','false') AS `exclude`,`locs`.`entryDate` AS `entryDate` from ((((`locations` `locs` join `locations_type` `ltype` on((`ltype`.`id` = `locs`.`type`))) join `locations_geometry` `geo` on((`locs`.`id` = `geo`.`id`))) join `locations_properties` `props` on((`props`.`id` = `locs`.`id`))) join `locations_properties_customicons` `icons` on((`icons`.`id` = `props`.`customIconId`))) order by `locs`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-05 12:48:51
