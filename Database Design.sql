CREATE DATABASE  IF NOT EXISTS `airbnb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airbnb`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: airbnb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
  `houseid` int NOT NULL AUTO_INCREMENT,
  `beds` int NOT NULL,
  `baths` int NOT NULL,
  `sqft` int NOT NULL,
  `nightly_rate` int NOT NULL,
  `ownerid` int NOT NULL,
  `street` varchar(32) NOT NULL,
  `zip` char(5) NOT NULL,
  PRIMARY KEY (`houseid`),
  KEY `ownerid` (`ownerid`),
  KEY `zip` (`zip`),
  CONSTRAINT `house_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `owner` (`ownerid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `house_ibfk_2` FOREIGN KEY (`zip`) REFERENCES `zip` (`zipcode`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,2,1,715,201,1,'123 Main St','02108'),(2,2,1,812,109,1,'20 Library St','02108'),(3,2,2,916,302,1,'30 Congress St','02108'),(4,3,2,400,302,1,'22 State St','01850'),(5,2,2,304,203,1,'30 Washington St','01850'),(6,4,2,1032,400,1,'33 Kennedy St','01850'),(7,3,2,1080,567,1,'40 Lincoln Rd','01002'),(8,2,2,1035,472,1,'59 Truman Ave','01002'),(9,3,2,900,120,1,'33 5th St','01002'),(10,4,2,600,105,1,'44 King Blvd','05751'),(11,2,3,580,187,1,'10 Eisenhower Rd','05751'),(12,2,2,901,91,2,'12 Brady St','05751'),(13,3,2,1203,120,2,'34 Main St','05662'),(14,3,3,1089,109,2,'100 Beach Rd','05662'),(15,4,2,673,100,2,'55 Clinton Ave','05662'),(16,2,2,450,75,2,'10 Miflon Rd','03060'),(17,3,2,1020,140,2,'33 State St','03060'),(18,1,1,415,50,2,'55 Name Rd','03060'),(19,1,1,300,70,2,'98 Sheet Ave','03103'),(20,2,3,590,103,2,'33 Potter Rd','03103'),(21,2,2,999,130,2,'44 Field Blvd','03103'),(22,1,1,215,143,2,'88 Dirt Rd','02804'),(23,2,2,620,143,3,'44 City St','02804'),(24,3,2,647,230,3,'22 Main Ave','02804'),(25,4,2,1523,200,3,'23 Lincon Ave','02874'),(26,2,3,689,150,3,'221 Street St','02874'),(27,1,1,893,160,3,'88 Park Ave','02874'),(28,2,3,1221,160,3,'30 Street Rd','02860'),(29,1,1,700,105,3,'55 Main St','02860'),(30,2,2,2031,560,3,'90 Kennedy Ave','02860');
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `ownerid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `phone` char(10) NOT NULL,
  PRIMARY KEY (`ownerid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'Leah Taylor','8374938584'),(2,'Aaron Jackson','7483928304'),(3,'Luke Thompson','2837463820');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewid` int NOT NULL AUTO_INCREMENT,
  `transactionid` int NOT NULL,
  `rating` int NOT NULL,
  `review` varchar(1000) NOT NULL,
  PRIMARY KEY (`reviewid`),
  KEY `transactionid` (`transactionid`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`transactionid`) REFERENCES `transaction` (`transactionid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,5,'It was great, I reccomend staying here'),(2,2,1,'It was terrible, don\'t stay here'),(3,3,3,'It was ok, not bad'),(4,4,2,'It was too small for me'),(5,5,5,'Best place that I have ever stayed'),(6,7,4,'Pretty good, no big problems'),(7,12,5,'It was great, I would recommend staying here!');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `stateid` char(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES ('MA','Massachusetts'),('NH','New Hampshire'),('RI','Rhode Island'),('VT','Vermont');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town`
--

DROP TABLE IF EXISTS `town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `town` (
  `townid` int NOT NULL AUTO_INCREMENT,
  `town_name` varchar(32) NOT NULL,
  `state` char(2) NOT NULL,
  PRIMARY KEY (`townid`),
  KEY `state` (`state`),
  CONSTRAINT `town_ibfk_1` FOREIGN KEY (`state`) REFERENCES `state` (`stateid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `town`
--

LOCK TABLES `town` WRITE;
/*!40000 ALTER TABLE `town` DISABLE KEYS */;
INSERT INTO `town` VALUES (1,'Boston','MA'),(2,'Lowell','MA'),(3,'Amherst','MA'),(4,'Killington','VT'),(5,'Stowe','VT'),(6,'Nashua','NH'),(7,'Bedford','NH'),(8,'Westerly','RI'),(9,'Narragansett','RI'),(10,'Providence','RI');
/*!40000 ALTER TABLE `town` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transactionid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `houseid` int NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`transactionid`),
  KEY `username` (`username`),
  KEY `houseid` (`houseid`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`houseid`) REFERENCES `house` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'tcauley',1,'2022-10-11','2022-10-13',603),(2,'ykim',4,'2022-11-12','2022-11-15',906),(3,'dsmith',7,'2022-11-30','2022-12-01',1134),(4,'jchen',10,'2022-12-01','2022-12-02',210),(5,'clopez',13,'2022-12-03','2022-12-04',240),(6,'mwilliams',19,'2022-12-06','2022-12-09',280),(7,'gjones',22,'2022-12-20','2022-12-22',429),(8,'mjohnson',25,'2022-12-22','2022-12-23',400),(12,'jchen',9,'2022-12-24','2022-12-24',500);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` char(10) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('clopez','password','Courtney Lopez','clopez@gmail.com','2938473937'),('dsmith','password','David Smith','dsmith@gmail.com','2938402983'),('gjones','password','Grace Jones','gjones@gmail.com','4938203948'),('jchen','password','Joe Chen','jchen@gmail.com','2938473628'),('mjohnson','password','Michaela Johnson','mjohnson@gmail.com','3948303940'),('mwilliams','password','Mike Williams','mwilliams@gmail.com','3748372930'),('tcauley','password','Tim Cauley','tcauley@gmail.com','1111111111'),('ykim','password','Yihyun Kim','ykim@gmail.com','4930293840');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zip`
--

DROP TABLE IF EXISTS `zip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zip` (
  `zipcode` char(5) NOT NULL,
  `town` int NOT NULL,
  PRIMARY KEY (`zipcode`),
  KEY `town` (`town`),
  CONSTRAINT `zip_ibfk_1` FOREIGN KEY (`town`) REFERENCES `town` (`townid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zip`
--

LOCK TABLES `zip` WRITE;
/*!40000 ALTER TABLE `zip` DISABLE KEYS */;
INSERT INTO `zip` VALUES ('02108',1),('01850',2),('01002',3),('05751',4),('05662',5),('03060',6),('03103',7),('02804',8),('02874',9),('02860',10);
/*!40000 ALTER TABLE `zip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'airbnb'
--

--
-- Dumping routines for database 'airbnb'
--
/*!50003 DROP PROCEDURE IF EXISTS `checkAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkAccount`(input_username VARCHAR(32), input_passsword VARCHAR(32))
BEGIN
	SELECT COUNT(1) 
    FROM user 
    WHERE username=input_username and password = input_passsword;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkUser`(input_username VARCHAR(32))
BEGIN
	SELECT COUNT(1) 
    FROM user 
    WHERE username=input_username;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletableTransactions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletableTransactions`(input_username VARCHAR(32), todays_date DATE)
BEGIN
	SELECT *
    FROM transaction 
    LEFT JOIN house ON transaction.houseid = house.houseid
    LEFT JOIN zip ON house.zip = zip.zipcode
    LEFT JOIN town ON zip.town = town.townid
    WHERE username=input_username AND startdate > todays_date;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `homeReviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `homeReviews`(reviewedHouse INT)
BEGIN
	SELECT rating, review 
	FROM review
	LEFT JOIN transaction ON review.transactionid = transaction.transactionid
    WHERE houseid = reviewedHouse;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `houseSearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `houseSearch`(in_startdate DATE, in_enddate DATE, in_town_name VARCHAR(32))
BEGIN
	SELECT houseid, beds, baths, sqft, nightly_rate, street, town_name, state
	FROM house
	LEFT JOIN zip  ON house.zip = zip.zipcode
	LEFT JOIN town ON zip.town = town.townid
    WHERE houseid NOT IN (
	SELECT houseid
    FROM transaction 
    WHERE (enddate >= in_enddate AND startdate <= in_enddate) 
    OR (startdate <= in_startdate AND enddate >= in_startdate))
    AND town_name = in_town_name
    ORDER BY houseid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reviewableTransactions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reviewableTransactions`(input_username VARCHAR(32), todays_date DATE)
BEGIN
	SELECT *
    FROM transaction 
    LEFT JOIN house ON transaction.houseid = house.houseid
    LEFT JOIN zip ON house.zip = zip.zipcode
    LEFT JOIN town ON zip.town = town.townid
    WHERE username=input_username AND enddate < todays_date 
    AND transactionid NOT IN (SELECT transactionid FROM review);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stateSearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stateSearch`(in_startdate DATE, in_enddate DATE)
BEGIN
	SELECT distinct state
	FROM house
	LEFT JOIN zip  ON house.zip = zip.zipcode
	LEFT JOIN town ON zip.town = town.townid
    WHERE houseid NOT IN (
	SELECT houseid
    FROM transaction 
    WHERE (enddate >= in_enddate AND startdate <= in_enddate) 
    OR (startdate <= in_startdate AND enddate >= in_startdate))
    ORDER BY state;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `townSearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `townSearch`(in_startdate DATE, in_enddate DATE, in_state CHAR(2))
BEGIN
	SELECT distinct town_name
	FROM house
	LEFT JOIN zip  ON house.zip = zip.zipcode
	LEFT JOIN town ON zip.town = town.townid
    WHERE houseid NOT IN (
	SELECT houseid
    FROM transaction 
    WHERE (enddate >= in_enddate AND startdate <= in_enddate) 
    OR (startdate <= in_startdate AND enddate >= in_startdate))
    AND state = in_state
    ORDER BY town_name;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userDetails`(input_username VARCHAR(32))
BEGIN
	SELECT *
    FROM user 
    WHERE username=input_username;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userTransactions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userTransactions`(input_username VARCHAR(32))
BEGIN
	SELECT *
    FROM transaction 
    LEFT JOIN house ON transaction.houseid = house.houseid
    LEFT JOIN zip ON house.zip = zip.zipcode
    LEFT JOIN town ON zip.town = town.townid
    WHERE username=input_username;
    
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

-- Dump completed on 2022-12-07 12:19:29
