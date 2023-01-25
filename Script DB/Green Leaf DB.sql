CREATE DATABASE  IF NOT EXISTS `greenleaf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `greenleaf`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: greenleaf
-- ------------------------------------------------------
-- Server version	8.0.27

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
INSERT INTO `albero` VALUES (4,'-800 kg','melo',NULL,'Da Piantare','test@gmail.com','Piemonte',15,10),(5,'-800 kg','melo',NULL,'Da Piantare','test@gmail.com','Piemonte',15,10),(6,'-1200 kg','pino',NULL,'Da Piantare','test@gmail.com','Lombardia',15,10),(7,'-150 kg','ciliegio',NULL,'Da Piantare','test@gmail.com','Veneto',15,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associato`
--

LOCK TABLES `associato` WRITE;
/*!40000 ALTER TABLE `associato` DISABLE KEYS */;
INSERT INTO `associato` VALUES (1,'melo','Trentino Alto Adige'),(2,'melo','Emilia Romagna'),(3,'melo','Piemonte'),(4,'melo','Veneto'),(5,'pero','Emilia Romagna'),(6,'pero','Veneto'),(7,'pero','Lombardia'),(8,'pero','Toscana'),(9,'ciliegio','Campania'),(10,'ciliegio','Puglia'),(11,'ciliegio','Veneto'),(12,'pino','Lazio'),(13,'pino','Campania'),(14,'pino','Trentino Alto Adige'),(15,'pesco','Basilicata'),(16,'pesco','Calabria'),(17,'pesco','Campania'),(18,'fico','Puglia'),(19,'fico','Campania'),(20,'fico','Sicilia'),(21,'banano','Sardegna'),(22,'banano','Sicilia'),(23,'mandorlo','Calabria'),(24,'mandorlo','Sicilia'),(25,'mandorlo','Liguria'),(26,'limone','Campania'),(27,'limone','Sicilia'),(28,'limone','Calabria'),(29,'limone','Toscana'),(30,'castagno','Campania'),(31,'castagno','Marche');
/*!40000 ALTER TABLE `associato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buonoregalo`
--

DROP TABLE IF EXISTS `buonoregalo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buonoregalo` (
  `idBuono` varchar(20) NOT NULL,
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
INSERT INTO `buonoregalo` VALUES ('1','Riscattato',50,'test@gmail.com',4),('2','Riscattato',50,'test@gmail.com',4),('ciilvoomah','Da riscattare',50,'test@gmail.com',14),('cptzkwmejt','Da riscattare',50,'test@gmail.com',13),('iroyhajizu','Da riscattare',50,'test@gmail.com',15),('krxffypxsh','Da riscattare',50,'test@gmail.com',14),('mezzzdoqcs','Da riscattare',50,'test@gmail.com',16),('nbncxnmrqm','Da riscattare',50,'test@gmail.com',14),('qkrgtgiqma','Da riscattare',50,'test@gmail.com',15),('qrubpxovep','Da riscattare',50,'test@gmail.com',15),('vvodlqyxtw','Da riscattare',50,'test@gmail.com',14),('zsediooqve','Da riscattare',50,'test@gmail.com',15);
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
INSERT INTO `categoria` VALUES ('banano','-130kg','La pianta di banano ha una crescita molto rapida, raggiungendo infatti anche i tre metri di altezza in pochi mesi',50,'risorse\\img\\banano.jpg'),('castagno','-330kg','Il castagno europeo si caratterizza per essere una pianta decisamente longeva, che si può sviluppare fino a raggiungere un\'altezza pari a 25 metri',50,'risorse\\img\\castagno.jpg'),('ciliegio','-150 kg','Il ciliegio è una pianta a foglia caduca, semplice, ovato-oblunga, con apice pronunciato, appuntito e margine seghettato.',50,'risorse\\img\\ciliegio.jpg'),('fico','-20kg','La pianta di fico rappresenta un albero che può arrivare fino ad altezze anche piuttosto elevate, dal momento che raggiunge i sette-otto metri',50,'risorse\\img\\fico.jpg'),('limone','-167kg','La pianta del limone può arrivare ad un’altezza di 6 metri, i suoi rami, di solito, sono spinosi, le foglie cambiano colore a seconda dell’età della pianta.',50,'risorse\\img\\limone.jpg'),('mandorlo','-100kg','Quando parliamo della pianta di mandorlo, dobbiamo ricordare come faccia parte di due categorie molto importanti, come quella delle piante rustiche e, soprattutto, di quelle piante estremamente longeva.',50,'risorse\\img\\mandorlo.jpg'),('melo','-800 kg','Il melo domestico  è una pianta da frutto appartenente alla famiglia delle Rosacee. È una delle più diffuse piante da frutto coltivate.',50,'risorse\\img\\melo.jpg'),('pero','-55 kg','Il pero è uno di quegli alberi da frutto che si sviluppano alla perfezione in tutte quelle zone caratterizzate da un clima temperato. In particolar modo, all’interno della penisola italiana, si caratterizza per crescere ottimamente in ogni regione.',50,'risorse\\img\\pero.jpg'),('pesco','-70kg','Raggiunge un\'altezza media di 3-5 metri, I fiori, di colore rosa, hanno 5 petali, ed il frutto, la pesca, è una drupa tonda e carnosa, con un solco laterale',50,'risorse\\img\\pesco.jpg'),('pino','-1200 kg','La sua chioma è piramidale o ovale, il tronco è dritto ed i rami tesi verso l\'esterno.',50,'risorse\\img\\pino.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot`
--

LOCK TABLES `iot` WRITE;
/*!40000 ALTER TABLE `iot` DISABLE KEYS */;
INSERT INTO `iot` VALUES (1,'81.163.28.31','41.10146149627438','14.572733757856243',NULL,'Campania','Non usato'),(2,'132.163.126.85','40.81822600356137','14.994824642075685',NULL,'Campania','Non usato'),(3,'207.241.248.168','40.70588784738514','15.121167415068252',NULL,'Campania','Non usato'),(4,'13.212.80.117','40.76692437928502','15.701326695894107',NULL,'Basilicata','Non usato'),(5,'43.236.77.46','40.490550288191216','15.750347771858316',NULL,'Basilicata','Non usato'),(6,'107.182.255.55','40.437270339739165','16.08999379818175',NULL,'Basilicata','Non usato'),(7,'32.52.40.220','39.60646428048869','16.02627468720733',NULL,'Calabria','Non usato'),(8,'44.245.2.173','39.29464611251044','16.437601648094414',NULL,'Calabria','Non usato'),(9,'74.17.108.198','38.766971244514416','16.36056850986923',NULL,'Calabria','Non usato'),(10,'148.149.81.248','40.93558329034173','16.758124864383607',NULL,'Puglia','Non usato'),(11,'144.170.185.206','40.99639489288046','16.211890017925295',NULL,'Puglia','Non usato'),(12,'185.98.25.59','41.08618763950996','16.19788398302425',NULL,'Puglia','Non usato'),(13,'248.236.214.170','41.71050278637212','14.350447507920785',NULL,'Molise','Non usato'),(14,'73.245.247.85','41.696008644182974','14.237201975782787',NULL,'Molise','Non usato'),(15,'4.198.195.66','41.67667803835705','14.741953497713805',NULL,'Molise','Non usato'),(16,'169.53.249.198','42.119811724400556','12.318498926168065',NULL,'Lazio','Non usato'),(17,'252.107.30.100','41.927522751963444','13.030327985321211',NULL,'Lazio','Non usato'),(18,'126.17.223.65','42.10781070286889','11.981997916386575',NULL,'Lazio','Non usato'),(19,'1.84.166.215','42.363183887217865','13.786769991822979',NULL,'Abruzzo','Non usato'),(20,'82.31.230.207','42.606271450297044','13.555138143371893',NULL,'Abruzzo','Non usato'),(21,'169.8.43.56','41.91396674518301','13.751134322830506',NULL,'Abruzzo','Non usato'),(22,'116.211.139.255','43.23906786061388','12.290071755033239',NULL,'Umbria','Non usato'),(23,'224.196.161.187','42.7699849665593','12.209891499800168',NULL,'Umbria','Non usato'),(24,'136.155.139.228','42.82228214215616','12.851333541664715',NULL,'Umbria','Non usato'),(25,'218.179.248.29','43.51104479937211','12.601883873107647',NULL,'Marche','Non usato'),(26,'68.59.249.103','43.21310167770094','13.2611438430051',NULL,'Marche','Non usato'),(27,'53.146.30.40','42.91369583424416','13.403686518974999',NULL,'Marche','Non usato'),(28,'93.90.73.238','44.000091659140736','10.650830990173441',NULL,'Toscana','Non usato'),(29,'148.126.72.42','43.961628023877886','10.766646914398985',NULL,'Toscana','Non usato'),(30,'252.84.214.60','43.057072371802306','11.194274942308681',NULL,'Toscana','Non usato'),(31,'137.195.35.46','44.6818408805189','9.83121056417305',NULL,'Emilia Romagna','Non usato'),(32,'179.137.193.194','44.36766146851525','11.296681258507064',NULL,'Emilia Romagna','Non usato'),(33,'135.227.76.254','44.76374684995166','11.124989429276445',NULL,'Emilia Romagna','Non usato'),(34,'96.242.198.217','45.94602230562325','9.550909346975924',NULL,'Lombardia','Non usato'),(35,'222.192.66.236','45.934151067037945','9.457019713712574',NULL,'Lombardia','Non usato'),(36,'75.48.207.196','45.19918396669961','9.738688613502621',NULL,'Lombardia','Non usato'),(37,'176.125.221.113','45.13669493231019','7.907152768343592',NULL,'Piemonte','Non usato'),(38,'35.73.217.44','44.98853284039494','7.165493002098819',NULL,'Piemonte','Non usato'),(39,'60.12.228.236','44.56042800100334','7.236662373607156',NULL,'Piemonte','Non usato'),(40,'104.143.75.19','44.43485484442326','8.469016265266786',NULL,'Liguria','Non usato'),(41,'146.46.229.178','44.069970984621605','7.907152805990442',NULL,'Liguria','Non usato'),(42,'161.112.121.193','44.46426854419691','9.300574184995774',NULL,'Liguria','Non usato'),(43,'151.224.92.229','46.3138797351431','12.835955369251526',NULL,'Friuli Venezia Giulia','Non usato'),(44,'61.130.6.6','46.28921208448096','12.640948076334434',NULL,'Friuli Venezia Giulia','Non usato'),(45,'198.12.133.215','46.173315441397385','13.431963650068724',NULL,'Friuli Venezia Giulia','Non usato'),(46,'103.99.213.28','46.6035897557594','10.8692418640584',NULL,'Trentino Alto Adige','Non usato'),(47,'204.26.204.87','46.531817696261164','11.613485771782463',NULL,'Trentino Alto Adige','Non usato'),(48,'134.57.150.156','46.72838528954665','12.034438247885289',NULL,'Trentino Alto Adige','Non usato'),(49,'162.181.84.95','40.70308758893555','9.271870813753765',NULL,'Sardegna','Non usato'),(50,'26.31.209.245','39.84235374592679','8.699375514067553',NULL,'Sardegna','Non usato'),(51,'52.89.145.195','39.409186612796','8.665699331451954',NULL,'Sardegna','Non usato'),(52,'38.146.84.11','37.8953600795812','14.481910590647303',NULL,'Sicilia','Non usato'),(53,'62.247.164.144','37.8076102686192','14.875922097569589',NULL,'Sicilia','Non usato'),(54,'2.128.10.241','37.866121750194495','13.387434305088654',NULL,'Sicilia','Non usato'),(55,'55.69.133.152','45.77102621620896','7.373153631031927',NULL,'Valle dAosta','Non usato'),(56,'91.169.177.207','45.814115431986004','7.548934876965176',NULL,'Valle dAosta','Non usato'),(57,'206.55.173.185','45.63675781969758','7.194625830302339',NULL,'Valle dAosta','Non usato'),(58,'197.7.149.47','45.77919501729474','11.316241146026037',NULL,'Veneto','Non usato'),(59,'197.75.211.195','45.22426489986633','11.939655621721865',NULL,'Veneto','Non usato'),(60,'101.117.53.73','45.97697294341656','12.108003850207895',NULL,'Veneto','Non usato');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (4,'2022-12-12',100,'test@gmail.com'),(5,'2023-01-24',50,'test@gmail.com'),(6,'2023-01-24',100,'test@gmail.com'),(7,'2023-01-24',100,'test@gmail.com'),(8,'2023-01-24',100,'test@gmail.com'),(9,'2023-01-24',100,'test@gmail.com'),(10,'2023-01-24',50,'test@gmail.com'),(11,'2023-01-24',100,'test@gmail.com'),(12,'2023-01-24',100,'test@gmail.com'),(13,'2023-01-24',100,'test@gmail.com'),(14,'2023-01-24',400,'test@gmail.com'),(15,'2023-01-24',400,'test@gmail.com'),(16,'2023-01-24',50,'test@gmail.com');
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
INSERT INTO `utente` VALUES ('fa.mikela121@gmail.com','Cercielloa','Vincenzo','ciao123245','2023-01-04'),('lucaverdi@gmail.com','Verdi','Luca','lucave05','1994-04-12'),('mariorossi@gmail.com','Rossi','Mario','marioro01','1990-10-03'),('mirko@gmail.com','Cercielloa','Vincenzo','0cerciello','2023-01-03'),('test@gmail.com','michele','alaia','1','2022-11-17');
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

-- Dump completed on 2023-01-25 10:41:38
