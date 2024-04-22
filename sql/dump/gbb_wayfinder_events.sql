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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Hydrangea Holidays',3,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/hydrangeas-2022-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/hydrangeas-2022-wayfinder-1670x940.jpg','2022-06-13 | 2022-08-14','Daily, 9.00am - 9.00pm<br><br>Fri, 24 Jun 2022 - Sun, 14 Aug 2022<br><br>Admission charge to Flower Dome applies','Go on an adventure to the Netherlands and rediscover summertime when whimsical hydrangeas bloom in this first-ever hydrangea floral display in partnership with the Netherlands Embassy and JOURNEY by TOUCH Community Services.',1),(2,'Children\'s Festival - Around the World with Kiztopia',168,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/childfest-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/childfest-wayfinder-1670x940.jpg','2022-05-20 | 2022-06-19','<b>Sat, 28 May - Sun, 19 Jun 2022</b><br><br>10.00am - 7.00pm','<b>School holidays are here and hot air balloons are landing at Gardens by the Bay!</b><br><br>Join Bell the Bear in welcoming our Kiztopia Friends who have returned from their travels around the world and discover the wonderful memories they have to share. Embark on a fun learning journey with your complimentary activity booklet and get to bring home an exclusive sticker sheet!',1),(3,'Wonderful Wetlands Series',196,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/wetlands-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/wetlands-wayfinder-1670x940.jpg','2022-07-23 | 2022-12-24','<b>Thu, 23 July - Sat, 24 Dec 2022</b>','Mangroves and coastal ecosystems support biodiversity and play an essential role in addressing climate change. Through the Wonderful Wetlands series, learn about mangroves and find out how mangroves planted at Kingfisher Wetlands, our very own urban wetlands in downtown Singapore, contribute to the Gardens’ sustainability efforts!  Join our activities to gain a deeper understanding on nature-based solutions to combat climate change. Wonderful Wetlands Series is sponsored by Temasek and SG Eco Fund.',1),(4,'Weird But True! Exhibition',18,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/natgeo-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/natgeo-wayfinder-1670x940.jpg','2022-02-22 | 2022-07-31','<b>Tues, 22 Feb 2022 - Sun, 31 Jul 2022</b><br><br>9.00am - 9.00pm','Plunge into the fascinating worlds of the plant and animal kingdom in National Geographic latest “Weird But True” exhibition!<br/><br/>Wander through the exhibition set within the lush tropics of Cloud Forest at Gardens by the Bay in Singapore, while discovering incredible fun facts. Packed with visually stunning photos and colourful graphics, it’s going to be a wild ride like no other.',1),(5,'Makers\' Market',58,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/mm2-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/mm2-wayfinder-1670x940.jpg','2022-01-06 | 2022-07-12','6 May - 3 July 2022<br><br>Fri - Sun only: 12.00pm-9.00pm<br>Free Admission','Head over to the Makers’ Market and support local growing creative makers with their own product creations! From sustainable beauty and wellness products to handmade fashion accessories, there is something for everyone!',1),(6,'Jumptopia: Wonder Garden',75,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/jump-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/jump-wayfinder-1670x940.jpg','2021-12-20 | 2022-07-03','Mon, 20 Dec 2021 - Sun, 3 Jul 2022<br>Daily: 10.00am - 7.45pm','<b>Jumptopia: Wonder Garden</b> <br><br>Follow Kiztopia Friends into the gardens and watch them transform the Pavilion into an amazing Wonder Garden that is set to dazzle and capture the hearts of all! ',1),(7,'Quick HIIT',184,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/quickhiit-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/quickhiit.jpg','','<b>Every Thurs</b><br>17, 24, 31 Mar<br>7.00pm - 8.00pm<br><br><b>Every Sat</b><br>5, 19, 26 Mar<br>6.00pm - 7.00pm<br>Free admission<br>Register via the Healthy 365 mobile app','Led by professional trainers, Quick HIIT features short bursts of high intensity exercises that build muscles and burn calories in minimum time.',1),(8,'Active Family Programme',184,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/active-family-prog-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/active-family-prog.jpg','null','<b>Every Sat </b><br>9.00am - 10.00am<br><br>Free admission<br>Register via the Healthy 365 mobile app','Active Family is an integrated programme that focus on fundamental movement skills development to promote bonding between both parent and child (4-6 years old) through the physical activity together as a family unit, with added on health education focusing on a healthy lifestyle.',1),(9,'Low Impact Aerobics',193,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/low-wayfinder-500x500px.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/low-wayfinder-1670x940.jpg','null','<b>Every Sun (except 30 Jan, 6 & 13 Feb)</b><br>2, 9, 16, 23 Jan20, 27 Feb6, 13, 20, 27 Mar<br>9.00am - 10.00am<br>Free admission for seniors<br>Register via the Healthy 365 mobile app','<b>Have fun keeping fit with your kakis!</b> <br><br>Organised by the Health Promotion Board<br>Get moving with Low Impact Aerobics, an energizing workout that is less hard on the body especially the joints. Join now to improve your heart health and circulation.',1),(10,'Otah and Friends Vol 2: Blast Off',76,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/otah2-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/otah2.jpg','2021-06-14 | 2022-06-26','Mon, 14 Jun 2021 - Thu, 26 Jun 2022 (Extended!)<br><br>Various timings<br>Admission charges apply<br>Pre-booking of time slots required','Otah & Friends is back with a brand new adventure following a super successful Volume 1: Hide & Seek!<br><br>It’s build-a-rocket day at school! Help Otah the otter and Billy the hornbill find and assemble a rocket. Unlock the launch control centre and blast off into space!',1),(11,'Flight of the Moth Orchid',4,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/fomo-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/fomo.jpg','null','From Fri, 30 Jul 2021<br><br>9.00am - 9.00pm<br>Admission charge to Cloud Forest applies','Flight of the Moth Orchid is a tribute to the Phalaenopsis orchid, a diverse genus whose floral form resembles that of a moth in flight.<br><br>The Phalaenopsis orchids on show have been carefully selected to show the distinct and occasionally dramatic characteristics that make it such a popular orchid among both breeders and orchid lovers alike, such as bright colours, peculiar patterns and markings, as well as floral mutations that result in even more stunning varieties.',1),(12,'Garden Rhapsody',7,'https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/thumb/garden-rhapsody-thumb.jpg','https://www.gardensbythebay.com.sg/content/dam/gbb-2021/wayfinder/events/full/garden-rhapsody.jpg','null','Daily, 7.45pm and 8.45pm<br><br>30 Jan 2022: No shows available<br>31 Jan - 6 Feb 2022: Daily shows are available at 8.15pm only','Come and be dazzled by the magnificent sight of our Supertrees and let the music and lights entertain you at night!',1);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 13:31:52
