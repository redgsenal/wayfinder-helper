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
 1 AS `zoomLevel`*/;
SET character_set_client = @saved_cs_client;

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
/*!50001 VIEW `features_list` AS select `ltype`.`type` AS `type`,`geo`.`type` AS `geo_type`,`geo`.`latitude` AS `latitude`,`geo`.`longitude` AS `longitude`,`props`.`id` AS `id`,`props`.`name` AS `name`,`props`.`category` AS `category`,`props`.`subCategory` AS `subCategory`,`icons`.`icon` AS `icon`,`icons`.`width` AS `width`,`icons`.`height` AS `height`,`props`.`website` AS `website`,`props`.`popupContent` AS `popupContent`,`props`.`openingHours` AS `openingHours`,`props`.`featuredImage` AS `featuredImage`,`props`.`detailImage` AS `detailImage`,`props`.`exclusivePromotion` AS `exclusivePromotion`,if((`props`.`visible` = 1),'true','false') AS `visible`,`locs`.`zoomLevel` AS `zoomLevel` from ((((`locations` `locs` join `locations_type` `ltype` on((`ltype`.`id` = `locs`.`type`))) join `locations_geometry` `geo` on((`locs`.`id` = `geo`.`id`))) join `locations_properties` `props` on((`props`.`id` = `locs`.`id`))) join `locations_properties_customicons` `icons` on((`icons`.`id` = `props`.`customIconId`))) order by `locs`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 13:31:53
