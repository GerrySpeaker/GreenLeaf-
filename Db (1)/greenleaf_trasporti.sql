CREATE DATABASE  IF NOT EXISTS `greenleaf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `greenleaf`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: greenleaf
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `trasporti`
--

DROP TABLE IF EXISTS `trasporti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trasporti` (
  `Nome` varchar(30) NOT NULL,
  `CO2Media` int NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Nome`),
  UNIQUE KEY `Nome_UNIQUE` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trasporti`
--

LOCK TABLES `trasporti` WRITE;
/*!40000 ALTER TABLE `trasporti` DISABLE KEYS */;
INSERT INTO `trasporti` VALUES ('Aereo',26,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\plane.png'),('Autobus',5200,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\bus.png'),('Macchina',2300,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\sports-car.png'),('Metropolitana',2,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\underground.png'),('Nave',1000,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\ship.png'),('Nave da crociera',100000000,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\cruise.png'),('Scooter',72,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\scooter.png'),('Taxi',2200,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\taxi.png'),('Tram',1,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\tram.png'),('Treno',1,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\png\\train.png');
/*!40000 ALTER TABLE `trasporti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-03 11:46:41
