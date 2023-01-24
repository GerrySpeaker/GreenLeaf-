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
  `regione` varchar(30) NOT NULL,
  `ordine` int NOT NULL,
  `iot` int DEFAULT NULL,
  PRIMARY KEY (`idalbero`),
  UNIQUE KEY `idalbero_UNIQUE` (`idalbero`),
  KEY `categoria_idx` (`categoria`),
  KEY `utente_idx` (`regione`),
  KEY `utenteAlbero_idx` (`utenteAlbero`),
  KEY `ordine_idx` (`ordine`),
  KEY `iot_idx` (`iot`),
  CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordine` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`idordine`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utenteAlbero` FOREIGN KEY (`utenteAlbero`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albero`
--

LOCK TABLES `albero` WRITE;
/*!40000 ALTER TABLE `albero` DISABLE KEYS */;
INSERT INTO `albero` VALUES (3,'-500','melo','2023-01-24','Piantato','test@gmail.com','Basilicata',3,1),(4,'-800 kg','melo',NULL,'Da Piantare','test@gmail.com','Piemonte',15,10),(5,'-800 kg','melo',NULL,'Da Piantare','test@gmail.com','Piemonte',15,10),(6,'-1200 kg','pino',NULL,'Da Piantare','test@gmail.com','Lombardia',15,10),(7,'-150 kg','ciliegio',NULL,'Da Piantare','test@gmail.com','Veneto',15,10);
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
  CONSTRAINT `categoriaAssociato` FOREIGN KEY (`categoriaAssociato`) REFERENCES `categoria` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `regioneAssociato` FOREIGN KEY (`regioneAssociato`) REFERENCES `regione` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `idBuono` varchar(100) NOT NULL,
  `stato` varchar(30) NOT NULL,
  `prezzo` double NOT NULL,
  `utenteRegalo` varchar(30) NOT NULL,
  `ordineRegalo` int NOT NULL,
  PRIMARY KEY (`idBuono`),
  UNIQUE KEY `key_UNIQUE` (`idBuono`),
  KEY `utenteRegalo_idx` (`utenteRegalo`),
  KEY `ordineRegalo_idx` (`ordineRegalo`),
  CONSTRAINT `ordineRegalo` FOREIGN KEY (`ordineRegalo`) REFERENCES `ordine` (`idordine`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utenteRegalo` FOREIGN KEY (`utenteRegalo`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buonoregalo`
--

LOCK TABLES `buonoregalo` WRITE;
/*!40000 ALTER TABLE `buonoregalo` DISABLE KEYS */;
INSERT INTO `buonoregalo` VALUES ('1','Riscattato',50,'test@gmail.com',4),('2','Riscattato',50,'test@gmail.com',4),('ciilvoomah','Da riscattare',50,'test@gmail.com',14),('cptzkwmejt','Da riscattare',50,'test@gmail.com',13),('iroyhajizu','Da riscattare',50,'test@gmail.com',15),('krxffypxsh','Da riscattare',50,'test@gmail.com',14),('nbncxnmrqm','Da riscattare',50,'test@gmail.com',14),('qkrgtgiqma','Da riscattare',50,'test@gmail.com',15),('qrubpxovep','Da riscattare',50,'test@gmail.com',15),('vvodlqyxtw','Da riscattare',50,'test@gmail.com',14),('zsediooqve','Da riscattare',50,'test@gmail.com',15);
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
INSERT INTO `categoria` VALUES ('ciliegio','-150 kg','Il ciliegio è una pianta a foglia caduca, semplice, ovato-oblunga, con apice pronunciato, appuntito e margine seghettato.',50,'risorse\\img\\ciliegio.jpg'),('melo','-800 kg','Il melo domestico  è una pianta da frutto appartenente alla famiglia delle Rosacee. È una delle più diffuse piante da frutto coltivate.',50,'risorse\\img\\melo.jpg'),('pero','-55 kg','Il pero è uno di quegli alberi da frutto che si sviluppano alla perfezione in tutte quelle zone caratterizzate da un clima temperato. In particolar modo, all’interno della penisola italiana, si caratterizza per crescere ottimamente in ogni regione.',50,'risorse\\img\\pero.jpg'),('pino','-1200 kg','La sua chioma è piramidale o ovale, il tronco è dritto ed i rami tesi verso l\'esterno.',50,'risorse\\img\\pino.jpg');
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
  `regione` varchar(30) NOT NULL,
  `stato` varchar(45) NOT NULL,
  PRIMARY KEY (`idiot`),
  UNIQUE KEY `idiot_UNIQUE` (`idiot`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot`
--

LOCK TABLES `iot` WRITE;
/*!40000 ALTER TABLE `iot` DISABLE KEYS */;
INSERT INTO `iot` VALUES (10,'192.158.2.254','125666','1235448','12335678','Campania','Non usato');
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
  CONSTRAINT `admin` FOREIGN KEY (`admin`) REFERENCES `admin` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `regione` FOREIGN KEY (`regione`) REFERENCES `regione` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatore`
--

LOCK TABLES `operatore` WRITE;
/*!40000 ALTER TABLE `operatore` DISABLE KEYS */;
INSERT INTO `operatore` VALUES ('anna@gmail.com','annarella03','Saccardo','Anna','fa.mikela@gmail.com','Calabria'),('fa.mikela@gmail.com','1234','vitale','mirko','fa.mikela@gmail.com','Basilicata'),('gerarda@gmail.com','gerra25a4','Desiderato','Gerarda','fa.mikela@gmail.com','Basilicata'),('hsjka@gmail.com','jakshdf02','klfas','klsamf','fa.mikela@gmail.com','Veneto'),('mitico@gmail.com','mitico085','Faella','Orazio','fa.mikela@gmail.com','Piemonte');
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
  `DataOrdine` date NOT NULL,
  `Totale` double NOT NULL,
  `Utente` varchar(30) NOT NULL,
  PRIMARY KEY (`idordine`),
  UNIQUE KEY `idordine_UNIQUE` (`idordine`),
  KEY `Utente_idx` (`Utente`),
  CONSTRAINT `Utente` FOREIGN KEY (`Utente`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (3,'2022-12-12',50,'laSabatino@gmail.com'),(4,'2022-12-12',100,'test@gmail.com'),(5,'2023-01-24',50,'test@gmail.com'),(6,'2023-01-24',100,'test@gmail.com'),(7,'2023-01-24',100,'test@gmail.com'),(8,'2023-01-24',100,'test@gmail.com'),(9,'2023-01-24',100,'test@gmail.com'),(10,'2023-01-24',50,'test@gmail.com'),(11,'2023-01-24',100,'test@gmail.com'),(12,'2023-01-24',100,'test@gmail.com'),(13,'2023-01-24',100,'test@gmail.com'),(14,'2023-01-24',400,'test@gmail.com'),(15,'2023-01-24',400,'test@gmail.com');
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
INSERT INTO `regione` VALUES ('Abruzzo','risorse\\img\\abruzzo.png'),('Basilicata','risorse\\img\\basilicata.png'),('Calabria','risorse\\img\\calabria.png'),('Campania','risorse\\img\\campania.png'),('Emilia Romagna','risorse\\img\\emilia.png'),('Friuli Venezia Giulia','risorse\\img\\fruli.png'),('Lazio','risorse\\img\\lazio.png'),('Liguria','risorse\\img\\liguria.png'),('Lombardia','risorse\\img\\lombardia.png'),('Marche','risorse\\img\\marche.png'),('Molise','risorse\\img\\molise.png'),('Piemonte','risorse\\img\\piemonte.png'),('Puglia','risorse\\img\\puglia.png'),('Sardegna','risorse\\img\\sardegna.png'),('Sicilia','risorse\\img\\sicilia.png'),('Toscana','risorse\\img\\toscana.png'),('Trentino Alto Adige','risorse\\img\\trentino.png'),('Umbria','risorse\\img\\umbria.png'),('Valle dAosta','risorse\\img\\valle.png'),('Veneto','risorse\\img\\veneto.png');
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
INSERT INTO `trasporti` VALUES ('Aereo',26,'risorse\\img\\plane.png'),('Autobus',5200,'risorse\\img\\bus.png'),('Macchina',2300,'risorse\\img\\sports-car.png'),('Metropolitana',2,'risorse\\img\\underground.png'),('Nave',1000,'risorse\\img\\ship.png'),('Nave da crociera',100000000,'risorse\\img\\cruise.png'),('Scooter',72,'risorse\\img\\scooter.png'),('Taxi',2200,'risorse\\img\\taxi.png'),('Tram',1,'risorse\\img\\tram.png'),('Treno',1,'risorse\\img\\train.png');
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
INSERT INTO `utente` VALUES ('fa.mikela121@gmail.com','Cercielloa','Vincenzo','ciao123245','2023-01-04'),('laSabatino@gmail.com','Sabatino','Michelina','abcd1aa2','2023-01-05'),('mirk155o@gmail.com','vitale','mirko','ciaoottto89','2022-10-01'),('mirko@gmail.com','Cercielloa','Vincenzo','0cerciello','2023-01-03'),('pepe@gmail.com','Adreucci','Peppe','vessicchio1','2022-12-15'),('peppe@gmail.com','Vessicchio','Peppe','peppevess1','2023-01-04'),('pippobaudo@gmail.com','Giametta','Antonio','pippobaudo1','2022-11-17'),('test@gmail.com','michele','alaia','1','2022-11-17');
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

-- Dump completed on 2023-01-24 11:21:01
