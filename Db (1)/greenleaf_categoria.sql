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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `nome` varchar(30) NOT NULL,
  `CO2max` varchar(10) NOT NULL,
  `descrizione` varchar(500) DEFAULT NULL,
  `prezzo` double NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('ciliegio','-150 kg','Il ciliegio è una pianta a foglia caduca, semplice, ovato-oblunga, con apice pronunciato, appuntito e margine seghettato.',50,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\catalogo\\alberi\\ciliegio.jpg'),('melo','-800 kg','Il melo domestico  è una pianta da frutto appartenente alla famiglia delle Rosacee. È una delle più diffuse piante da frutto coltivate.',50,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\catalogo\\alberi\\melo.jpg'),('pero','-55 kg','Il pero è uno di quegli alberi da frutto che si sviluppano alla perfezione in tutte quelle zone caratterizzate da un clima temperato. In particolar modo, all’interno della penisola italiana, si caratterizza per crescere ottimamente in ogni regione.',50,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\catalogo\\alberi\\pero.jpg'),('pino','-1200 kg','La sua chioma è piramidale o ovale, il tronco è dritto ed i rami tesi verso l\'esterno.',50,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\catalogo\\alberi\\pino.jpg');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-03 11:46:40
