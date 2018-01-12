-- MySQL dump 10.15  Distrib 10.0.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: ConcernDB
-- ------------------------------------------------------
-- Server version	10.0.31-MariaDB-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ConcernDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ConcernDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ConcernDB`;

--
-- Table structure for table `Brand_Model`
--

DROP TABLE IF EXISTS `Brand_Model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brand_Model` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Brand` varchar(100) DEFAULT NULL,
  `Model` varchar(100) DEFAULT NULL,
  `In_Production` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand_Model`
--

/*!40000 ALTER TABLE `Brand_Model` DISABLE KEYS */;
INSERT INTO `Brand_Model` (`ID`, `Brand`, `Model`, `In_Production`) VALUES (1,'Volkswagen','Golf I',0),(2,'Volkswagen','Beetle',1);
/*!40000 ALTER TABLE `Brand_Model` ENABLE KEYS */;

--
-- Table structure for table `Dealer`
--

DROP TABLE IF EXISTS `Dealer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dealer` (
  `ID` varchar(100) NOT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone_Number` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dealer`
--

/*!40000 ALTER TABLE `Dealer` DISABLE KEYS */;
INSERT INTO `Dealer` (`ID`, `Country`, `City`, `Address`, `Phone_Number`) VALUES ('Krotoski-Cichy','Poland','Warszawa','ul. Radzymińska 78',543328190);
/*!40000 ALTER TABLE `Dealer` ENABLE KEYS */;

--
-- Table structure for table `Factory`
--

DROP TABLE IF EXISTS `Factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Factory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Country` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone_Number` int(11) DEFAULT NULL,
  `Workers` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factory`
--

/*!40000 ALTER TABLE `Factory` DISABLE KEYS */;
INSERT INTO `Factory` (`ID`, `Country`, `City`, `Address`, `Phone_Number`, `Workers`) VALUES (1,'Poland','Bielany Wrocławskie','ul. Ryszarda Chomicza',500121001,4000);
/*!40000 ALTER TABLE `Factory` ENABLE KEYS */;

--
-- Table structure for table `Factory_Model`
--

DROP TABLE IF EXISTS `Factory_Model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Factory_Model` (
  `ID_Factory` int(11) NOT NULL DEFAULT '0',
  `ID_Brand_Model` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Factory`,`ID_Brand_Model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factory_Model`
--

/*!40000 ALTER TABLE `Factory_Model` DISABLE KEYS */;
INSERT INTO `Factory_Model` (`ID_Factory`, `ID_Brand_Model`) VALUES (1,2);
/*!40000 ALTER TABLE `Factory_Model` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-12 14:31:58
