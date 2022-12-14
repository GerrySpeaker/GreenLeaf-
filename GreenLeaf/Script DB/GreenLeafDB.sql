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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('alexborelli2001@gmail.com','123','borelli','alessandro'),('fa.mikela@gmail.com','peppevessicchio','faella','michela'),('vincenzocerciello02@gmail.com','vincenzoebello','cerciello','vincenzo');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albero`
--

DROP TABLE IF EXISTS `albero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albero` (
  `idalbero` int NOT NULL AUTO_INCREMENT,
  `CO2` varchar(10) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `datapiantumazione` date DEFAULT NULL,
  `stato` varchar(30) NOT NULL,
  `utenteAlbero` varchar(30) NOT NULL,
  `utente` varchar(30) NOT NULL,
  `ordine` int NOT NULL,
  PRIMARY KEY (`idalbero`),
  UNIQUE KEY `idalbero_UNIQUE` (`idalbero`),
  KEY `categoria_idx` (`categoria`),
  KEY `utente_idx` (`utente`),
  KEY `utenteAlbero_idx` (`utenteAlbero`),
  KEY `ordine_idx` (`ordine`),
  CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nome`),
  CONSTRAINT `ordine` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`idordine`),
  CONSTRAINT `utenteAlbero` FOREIGN KEY (`utenteAlbero`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albero`
--

LOCK TABLES `albero` WRITE;
/*!40000 ALTER TABLE `albero` DISABLE KEYS */;
/*!40000 ALTER TABLE `albero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associato`
--

DROP TABLE IF EXISTS `associato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoriaAssociato` varchar(30) NOT NULL,
  `regioneAssociato` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `categoriaAssociato_idx` (`categoriaAssociato`),
  KEY `regioneAssociato_idx` (`regioneAssociato`),
  CONSTRAINT `categoriaAssociato` FOREIGN KEY (`categoriaAssociato`) REFERENCES `categoria` (`nome`),
  CONSTRAINT `regioneAssociato` FOREIGN KEY (`regioneAssociato`) REFERENCES `regione` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associato`
--

LOCK TABLES `associato` WRITE;
/*!40000 ALTER TABLE `associato` DISABLE KEYS */;
INSERT INTO `associato` VALUES (1,'melo','Trentino Alto Adige'),(2,'melo','Emilia Romagna'),(3,'melo','Piemonte'),(4,'melo','Veneto'),(5,'pero','Emilia Romagna'),(6,'pero','Veneto'),(7,'pero','Lombardia'),(8,'pero','Toscana'),(9,'ciliegio','Campania'),(10,'ciliegio','Puglia'),(11,'ciliegio','Veneto'),(12,'pino','Lazio'),(13,'pino','Campania'),(14,'pino','Trentino Alto Adige');
/*!40000 ALTER TABLE `associato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buonoregalo`
--

DROP TABLE IF EXISTS `buonoregalo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buonoregalo` (
  `key` varchar(6) NOT NULL,
  `stato` varchar(30) NOT NULL,
  `prezzo` double NOT NULL,
  `url` varchar(100) NOT NULL,
  `utenteRegalo` varchar(30) NOT NULL,
  `ordineRegalo` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `key_UNIQUE` (`key`),
  KEY `utenteRegalo_idx` (`utenteRegalo`),
  KEY `ordineRegalo_idx` (`ordineRegalo`),
  CONSTRAINT `ordineRegalo` FOREIGN KEY (`ordineRegalo`) REFERENCES `ordine` (`idordine`),
  CONSTRAINT `utenteRegalo` FOREIGN KEY (`utenteRegalo`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buonoregalo`
--

LOCK TABLES `buonoregalo` WRITE;
/*!40000 ALTER TABLE `buonoregalo` DISABLE KEYS */;
/*!40000 ALTER TABLE `buonoregalo` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `categoria` VALUES ('ciliegio','-150 kg','Il ciliegio ?? una pianta a foglia caduca, semplice, ovato-oblunga, con apice pronunciato, appuntito e margine seghettato.',50,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\catalogo\\alberi\\ciliegio.jpg'),('melo','-800 kg','Il melo domestico  ?? una pianta da frutto appartenente alla famiglia delle Rosacee. ?? una delle pi?? diffuse piante da frutto coltivate.',50,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\catalogo\\alberi\\melo.jpg'),('pero','-55 kg','Il pero ?? uno di quegli alberi da frutto che si sviluppano alla perfezione in tutte quelle zone caratterizzate da un clima temperato. In particolar modo, all???interno della penisola italiana, si caratterizza per crescere ottimamente in ogni regione.',50,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\catalogo\\alberi\\pero.jpg'),('pino','-1200 kg','La sua chioma ?? piramidale o ovale, il tronco ?? dritto ed i rami tesi verso l\'esterno.',50,'C:\\Users\\vince\\Documents\\GitHub\\GreenLeaf-\\Front\\catalogo\\alberi\\pino.jpg');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot`
--

DROP TABLE IF EXISTS `iot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot` (
  `idiot` int NOT NULL AUTO_INCREMENT,
  `IPV4` varchar(30) NOT NULL,
  `latitudine` varchar(30) NOT NULL,
  `longitudine` varchar(30) NOT NULL,
  `altitudine` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idiot`),
  UNIQUE KEY `idiot_UNIQUE` (`idiot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot`
--

LOCK TABLES `iot` WRITE;
/*!40000 ALTER TABLE `iot` DISABLE KEYS */;
/*!40000 ALTER TABLE `iot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatore`
--

DROP TABLE IF EXISTS `operatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operatore` (
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `admin` varchar(30) NOT NULL,
  `regione` varchar(30) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `admin_idx` (`admin`),
  KEY `regione_idx` (`regione`),
  CONSTRAINT `admin` FOREIGN KEY (`admin`) REFERENCES `admin` (`email`),
  CONSTRAINT `regione` FOREIGN KEY (`regione`) REFERENCES `regione` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatore`
--

LOCK TABLES `operatore` WRITE;
/*!40000 ALTER TABLE `operatore` DISABLE KEYS */;
/*!40000 ALTER TABLE `operatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `idordine` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Totale` double NOT NULL,
  `Utente` varchar(30) NOT NULL,
  PRIMARY KEY (`idordine`),
  UNIQUE KEY `idordine_UNIQUE` (`idordine`),
  KEY `Utente_idx` (`Utente`),
  CONSTRAINT `Utente` FOREIGN KEY (`Utente`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regione`
--

DROP TABLE IF EXISTS `regione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regione` (
  `nome` varchar(30) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regione`
--

LOCK TABLES `regione` WRITE;
/*!40000 ALTER TABLE `regione` DISABLE KEYS */;
INSERT INTO `regione` VALUES ('Abruzzo',NULL),('Basilicata',NULL),('Calabria',NULL),('Campania',NULL),('Emilia Romagna',NULL),('Friuli Venezia Giulia',NULL),('Lazio',NULL),('Liguria',NULL),('Lombardia',NULL),('Marche',NULL),('Molise',NULL),('Piemonte',NULL),('Puglia',NULL),('Sardegna',NULL),('Sicilia',NULL),('Toscana',NULL),('Trentino Alto Adige',NULL),('Umbria',NULL),('Val d\'Aosta',NULL),('Veneto',NULL);
/*!40000 ALTER TABLE `regione` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `email` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `DataDiNascita` date NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('gigiodonnarumma@gmail.com','donnarumma','gigio','bestportiereeu','1999-10-02'),('mariorossi@gmail.com','rossi','mario','mariothegamer','2000-12-31'),('mirkovitale@gmail.com','vitale','mirko','1234','1998-02-25'),('pepperomano@gmail.com','romano','peppe','123','2002-01-01');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04 15:11:15
