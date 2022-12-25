-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: javan
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `all_people`
--

DROP TABLE IF EXISTS `all_people`;
/*!50001 DROP VIEW IF EXISTS `all_people`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_people` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `gender`,
 1 AS `parent`,
 1 AS `parentName`,
 1 AS `titleGender`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `idAssets` int NOT NULL AUTO_INCREMENT,
  `titleAssets` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`idAssets`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,'Samsung Universe 9',1249),(2,'Samsung Galaxy Book',1499),(3,'Iphone 9',549),(4,'Iphone X',899),(5,'Huawei P30',499),(8,'asdasdasdasd',0);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `idGender` int NOT NULL AUTO_INCREMENT,
  `titleGender` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idGender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!50001 DROP VIEW IF EXISTS `owner`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `owner` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `idPeopleAssets`,
 1 AS `idAssets`,
 1 AS `titleAssets`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `owner_detail`
--

DROP TABLE IF EXISTS `owner_detail`;
/*!50001 DROP VIEW IF EXISTS `owner_detail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `owner_detail` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `data_assets`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `gender` int NOT NULL,
  `parent` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Bani',1,0),(2,'Budi',1,1),(3,'Nisa',2,1),(4,'Andi',1,1),(5,'Sigit',1,1),(6,'Hari',1,2),(7,'Siti',2,2),(8,'Bila',2,3),(9,'Lesti',2,3),(10,'Diki',1,4),(11,'Doni',1,5),(12,'Toni',1,5),(26,'For Testing',2,10);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_assets`
--

DROP TABLE IF EXISTS `people_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people_assets` (
  `idPeopleAssets` int NOT NULL AUTO_INCREMENT,
  `idPeople` int DEFAULT NULL,
  `idAsset` int DEFAULT NULL,
  PRIMARY KEY (`idPeopleAssets`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_assets`
--

LOCK TABLES `people_assets` WRITE;
/*!40000 ALTER TABLE `people_assets` DISABLE KEYS */;
INSERT INTO `people_assets` VALUES (1,2,1),(2,2,2),(3,6,3),(4,7,4),(5,3,5),(6,8,1),(7,9,5),(8,9,4),(9,4,1),(10,10,2),(11,5,5),(12,11,4),(24,26,1),(25,26,4),(26,26,3),(27,26,2),(28,26,10);
/*!40000 ALTER TABLE `people_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all_people`
--

/*!50001 DROP VIEW IF EXISTS `all_people`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_people` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`gender` AS `gender`,`p`.`parent` AS `parent`,ifnull(`p2`.`name`,'') AS `parentName`,`g`.`titleGender` AS `titleGender` from ((`people` `p` left join `people` `p2` on((`p`.`parent` = `p2`.`id`))) join `gender` `g` on((`p`.`gender` = `g`.`idGender`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `owner`
--

/*!50001 DROP VIEW IF EXISTS `owner`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `owner` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`pa`.`idPeopleAssets` AS `idPeopleAssets`,`a`.`idAssets` AS `idAssets`,`a`.`titleAssets` AS `titleAssets`,`a`.`price` AS `price` from ((`people_assets` `pa` join `people` `p` on((`pa`.`idPeople` = `p`.`id`))) join `assets` `a` on((`pa`.`idAsset` = `a`.`idAssets`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `owner_detail`
--

/*!50001 DROP VIEW IF EXISTS `owner_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `owner_detail` AS select `o`.`id` AS `id`,`o`.`name` AS `name`,cast(concat('[',group_concat(json_object('idPeopleAssets',`o`.`idPeopleAssets`,'idAssets',`o`.`idAssets`,'titleAssets',`o`.`titleAssets`) separator ','),']') as json) AS `data_assets`,sum(`o`.`price`) AS `total` from `owner` `o` group by `o`.`id` */;
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

-- Dump completed on 2022-12-26  5:01:06
