-- MySQL dump 10.16  Distrib 10.2.12-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: concerndb
-- ------------------------------------------------------
-- Server version	10.2.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand_model`
--

DROP TABLE IF EXISTS `brand_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_model` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Brand` varchar(30) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `In_Production` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_model`
--

LOCK TABLES `brand_model` WRITE;
/*!40000 ALTER TABLE `brand_model` DISABLE KEYS */;
INSERT INTO `brand_model` VALUES (1,'Volkswagen','Golf I',1),(2,'Volkswagen','Beetle',1),(3,'Volkswagen','Golf III',1),(4,'Volkswagen','Touran',1),(5,'Volkswagen','Caddy',1),(6,'Volkswagen','Passat',1),(7,'Volkswagen','Polo',1),(8,'Volkswagen','Jetta',1),(9,'Volkswagen','Bora',1);
/*!40000 ALTER TABLE `brand_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_store`
--

DROP TABLE IF EXISTS `car_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_store` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Dealer` varchar(100) NOT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Dealer` (`ID_Dealer`),
  CONSTRAINT `car_store_ibfk_1` FOREIGN KEY (`ID_Dealer`) REFERENCES `dealer` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_store`
--

LOCK TABLES `car_store` WRITE;
/*!40000 ALTER TABLE `car_store` DISABLE KEYS */;
INSERT INTO `car_store` VALUES (1,'dealertest','Poland','Wroclaw','Legnicka 1'),(3,'Auto-Centrum','Poland','Lubin','ul. Mila 58'),(4,'Inter Auto','Poland','Krakow','ul. Biala 13'),(5,'Volkswagen Centrum','Poland','Poznan','ul. Nizinna 20');
/*!40000 ALTER TABLE `car_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealer`
--

DROP TABLE IF EXISTS `dealer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealer` (
  `ID` varchar(100) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  `Is_Available` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealer`
--

LOCK TABLES `dealer` WRITE;
/*!40000 ALTER TABLE `dealer` DISABLE KEYS */;
INSERT INTO `dealer` VALUES ('a','a','a','a',123456789,0),('Auto-Centrum','Poland','Lubin','ul. Mila 56',603587946,1),('dealertest','Poland','Wroclaw','ul. Legnicka 1',0,1),('Inter Auto','Poland','Krakow','ul. Jasnogorska 60',123781717,1),('Krotoski-Cichy','Poland','Warszawa','ul. Radzymińska 78',543328190,1),('Volkswagen Centrum','Poland','Poznan','ul. Nizinna 19',618302004,1);
/*!40000 ALTER TABLE `dealer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealer_orders`
--

DROP TABLE IF EXISTS `dealer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealer_orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Dealer` varchar(100) NOT NULL,
  `ID_Brand_Model` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Dealer` (`ID_Dealer`),
  KEY `ID_Brand_Model` (`ID_Brand_Model`),
  CONSTRAINT `dealer_orders_ibfk_1` FOREIGN KEY (`ID_Dealer`) REFERENCES `dealer` (`ID`),
  CONSTRAINT `dealer_orders_ibfk_2` FOREIGN KEY (`ID_Brand_Model`) REFERENCES `brand_model` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealer_orders`
--

LOCK TABLES `dealer_orders` WRITE;
/*!40000 ALTER TABLE `dealer_orders` DISABLE KEYS */;
INSERT INTO `dealer_orders` VALUES (4,'Auto-Centrum',3,5),(6,'Auto-Centrum',8,5),(8,'Auto-Centrum',1,15),(9,'Inter Auto',1,15),(11,'Inter Auto',3,5),(16,'Volkswagen Centrum',9,5);
/*!40000 ALTER TABLE `dealer_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS new_orders_log */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER new_orders_log AFTER DELETE ON Dealer_Orders
  FOR EACH ROW
  BEGIN
    INSERT INTO Orders_LOG VALUES(NOW(), OLD.ID_Dealer, OLD.ID_Brand_Model, OLD.Amount);
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Country` varchar(30) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  `Workers` int(11) NOT NULL DEFAULT 0,
  `Is_Available` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
INSERT INTO `factory` VALUES (1,'Poland','Bielany Wrocławskie','ul. Ryszarda Chomicza',500121001,4000,1),(2,'Poland','Wroclaw','Legnicka 1',100000000,0,1),(3,'Poland','Warszawa','ul. Fabryczna 2',687498233,0,1),(4,'Poland','Krakow','ul. Biala 13',533167899,0,1),(5,'a','a','a',0,0,0);
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS set_factory_unavailable */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER set_factory_unavailable AFTER UPDATE ON Factory
  FOR EACH ROW
  BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id INT;
    DECLARE id_dealer VARCHAR(100);
    DECLARE id_brand_model INT;
    DECLARE amount INT;
    DECLARE curP CURSOR FOR(SELECT p.ID, p.ID_Dealer, p.ID_Brand_Model, p.Amount FROM Production_Orders AS p WHERE p.ID_Factory = NEW.ID);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    IF NEW.Is_Available = FALSE THEN
      OPEN curP;
      read_loop: LOOP
        FETCH curP INTO id, id_dealer, id_brand_model, amount;
        IF done THEN
          LEAVE read_loop;
        END IF;
        INSERT INTO Dealer_Orders(ID_Dealer, ID_Brand_Model, Amount) VALUES(id_dealer, id_brand_model, amount);
        DELETE FROM Production_Orders WHERE Production_Orders.ID = id;
      END LOOP;
      CLOSE curP;

      DELETE FROM Factory_Model WHERE Factory_Model.ID_Factory = NEW.ID;
    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `factory_model`
--

DROP TABLE IF EXISTS `factory_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_model` (
  `ID_Factory` int(11) NOT NULL DEFAULT 0,
  `ID_Brand_Model` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_Factory`,`ID_Brand_Model`),
  KEY `ID_Brand_Model` (`ID_Brand_Model`),
  CONSTRAINT `factory_model_ibfk_1` FOREIGN KEY (`ID_Factory`) REFERENCES `factory` (`ID`),
  CONSTRAINT `factory_model_ibfk_2` FOREIGN KEY (`ID_Brand_Model`) REFERENCES `brand_model` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory_model`
--

LOCK TABLES `factory_model` WRITE;
/*!40000 ALTER TABLE `factory_model` DISABLE KEYS */;
INSERT INTO `factory_model` VALUES (1,1),(1,2),(1,5),(1,7),(1,9),(2,3),(2,4),(2,6),(2,9),(3,2),(3,5),(3,8),(4,1),(4,2),(4,3),(4,5),(4,8);
/*!40000 ALTER TABLE `factory_model` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS new_factory_model */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER new_factory_model AFTER INSERT ON Factory_Model
  FOR EACH ROW
  BEGIN
    DECLARE b TINYINT DEFAULT FALSE;
    SELECT In_Production INTO b FROM Brand_Model WHERE ID = NEW.ID_Brand_Model;
    IF b = FALSE THEN
      UPDATE Brand_Model SET In_Production = TRUE WHERE ID = NEW.ID_Brand_Model;
    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50032 DROP TRIGGER IF EXISTS delete_factory_model */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER delete_factory_model AFTER DELETE ON Factory_Model
  FOR EACH ROW
  BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id INT;
    DECLARE id_dealer VARCHAR(100);
    DECLARE id_brand_model INT;
    DECLARE amount INT;
    DECLARE c INT;

    DECLARE curP CURSOR FOR(SELECT p.ID, p.ID_Dealer, p.ID_Brand_Model, p.Amount FROM Production_Orders AS p WHERE p.ID_Factory = OLD.ID_Factory);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SELECT count(*) INTO c FROM Factory_Model WHERE ID_Brand_Model = OLD.ID_Brand_Model GROUP BY Factory_Model.ID_Brand_Model;
    IF c = 0 THEN
      UPDATE Brand_Model SET In_Production = FALSE WHERE ID = OLD.ID_Brand_Model;
    END IF;

    OPEN curP;
    read_loop: LOOP
      FETCH curP INTO id, id_dealer, id_brand_model, amount;
      IF done THEN
        LEAVE read_loop;
      END IF;
      IF id_brand_model = OLD.ID_Brand_Model THEN
        INSERT INTO Dealer_Orders(ID_Dealer, ID_Brand_Model, Amount) VALUES(id_dealer, id_brand_model, amount);
        DELETE FROM Orders_LOG WHERE Orders_LOG.ID_Dealer = id_dealer AND Orders_LOG.ID_Brand_Model = id_brand_model AND Orders_LOG.Amount = amount LIMIT 1;
        DELETE FROM Production_Orders WHERE Production_Orders.ID = id;
      END IF;
    END LOOP;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders_log`
--

DROP TABLE IF EXISTS `orders_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_log` (
  `Date` datetime NOT NULL,
  `ID_Dealer` varchar(100) NOT NULL,
  `ID_Brand_Model` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`Date`),
  KEY `ID_Dealer` (`ID_Dealer`),
  KEY `ID_Brand_Model` (`ID_Brand_Model`),
  CONSTRAINT `orders_log_ibfk_1` FOREIGN KEY (`ID_Dealer`) REFERENCES `dealer` (`ID`),
  CONSTRAINT `orders_log_ibfk_2` FOREIGN KEY (`ID_Brand_Model`) REFERENCES `brand_model` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_log`
--

LOCK TABLES `orders_log` WRITE;
/*!40000 ALTER TABLE `orders_log` DISABLE KEYS */;
INSERT INTO `orders_log` VALUES ('2018-01-13 21:30:43','dealertest',2,100),('2018-01-13 22:39:51','dealertest',1,100),('2018-01-13 22:40:22','dealertest',1,10),('2018-01-13 23:36:13','Auto-Centrum',5,5),('2018-01-13 23:36:18','Auto-Centrum',9,50),('2018-01-13 23:36:20','Inter Auto',4,5),('2018-01-13 23:36:23','Inter Auto',6,13),('2018-01-13 23:36:26','Inter Auto',2,1),('2018-01-13 23:36:28','Inter Auto',5,7),('2018-01-13 23:36:32','Volkswagen Centrum',6,7),('2018-01-13 23:36:36','Volkswagen Centrum',1,13),('2018-01-13 23:36:39','Volkswagen Centrum',7,14);
/*!40000 ALTER TABLE `orders_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_log`
--

DROP TABLE IF EXISTS `production_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_log` (
  `Date` datetime NOT NULL,
  `ID_Factory` int(11) NOT NULL,
  `ID_Brand_Model` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`Date`,`ID_Factory`,`ID_Brand_Model`),
  KEY `ID_Factory` (`ID_Factory`),
  KEY `ID_Brand_Model` (`ID_Brand_Model`),
  CONSTRAINT `production_log_ibfk_1` FOREIGN KEY (`ID_Factory`) REFERENCES `factory` (`ID`),
  CONSTRAINT `production_log_ibfk_2` FOREIGN KEY (`ID_Brand_Model`) REFERENCES `brand_model` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_log`
--

LOCK TABLES `production_log` WRITE;
/*!40000 ALTER TABLE `production_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `production_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_orders`
--

DROP TABLE IF EXISTS `production_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Dealer` varchar(100) NOT NULL,
  `ID_Factory` int(11) NOT NULL,
  `ID_Brand_Model` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Accomplished` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `ID_Dealer` (`ID_Dealer`),
  KEY `ID_Factory` (`ID_Factory`),
  KEY `ID_Brand_Model` (`ID_Brand_Model`),
  CONSTRAINT `production_orders_ibfk_1` FOREIGN KEY (`ID_Dealer`) REFERENCES `dealer` (`ID`),
  CONSTRAINT `production_orders_ibfk_2` FOREIGN KEY (`ID_Factory`) REFERENCES `factory` (`ID`),
  CONSTRAINT `production_orders_ibfk_3` FOREIGN KEY (`ID_Brand_Model`) REFERENCES `brand_model` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_orders`
--

LOCK TABLES `production_orders` WRITE;
/*!40000 ALTER TABLE `production_orders` DISABLE KEYS */;
INSERT INTO `production_orders` VALUES (1,'dealertest',1,2,100,0),(2,'dealertest',1,1,100,0),(3,'dealertest',1,1,10,0),(4,'Auto-Centrum',1,5,5,0),(5,'Auto-Centrum',1,9,50,0),(6,'Inter Auto',2,4,5,0),(7,'Inter Auto',2,6,13,0),(8,'Inter Auto',3,2,1,0),(9,'Inter Auto',4,5,7,0),(10,'Volkswagen Centrum',2,6,7,0),(11,'Volkswagen Centrum',4,1,13,0),(12,'Volkswagen Centrum',1,7,14,0);
/*!40000 ALTER TABLE `production_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS new_production_order */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER new_production_order AFTER INSERT ON Production_Orders
  FOR EACH ROW
  BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id_dealer VARCHAR(100);
    DECLARE id_brand_model INT;
    DECLARE amount INT;
    DECLARE id INT;

    DECLARE curP CURSOR FOR(SELECT dO.ID, dO.ID_Dealer, dO.ID_Brand_Model, dO.Amount FROM Dealer_Orders AS dO);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN curP;
    read_loop: LOOP
      FETCH curP INTO id, id_dealer, id_brand_model, amount;
      IF done THEN
        LEAVE read_loop;
      END IF;
      IF NEW.ID_Dealer = id_dealer AND NEW.ID_Brand_Model = id_brand_model AND NEW.Amount = amount THEN
        DELETE FROM Dealer_Orders WHERE Dealer_Orders.ID = id;
        LEAVE read_loop;
      END IF;
    END LOOP;
    CLOSE curP;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS new_production_LOG */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER new_production_LOG AFTER UPDATE ON Production_Orders
  FOR EACH ROW
  BEGIN
    IF NEW.Accomplished = TRUE THEN
      INSERT INTO Production_LOG VALUES(NOW(), NEW.ID_Factory, NEW.ID_Brand_Model, NEW.Amount);
      DELETE FROM Production_Orders WHERE ID = NEW.ID;
    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `Date` datetime NOT NULL,
  `ID_Car_Store` int(11) NOT NULL,
  `ID_Brand_Model` int(11) NOT NULL,
  `Type` enum('sale','leasing') NOT NULL,
  PRIMARY KEY (`Date`,`ID_Car_Store`),
  KEY `ID_Car_Store` (`ID_Car_Store`),
  KEY `ID_Brand_Model` (`ID_Brand_Model`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`ID_Car_Store`) REFERENCES `car_store` (`ID`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`ID_Brand_Model`) REFERENCES `brand_model` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES ('1901-02-01 00:00:00',1,1,'sale'),('2018-01-13 00:00:00',1,1,'leasing'),('2018-01-13 22:40:55',1,2,'sale'),('2018-01-13 22:41:01',1,5,'sale'),('2018-01-13 22:41:04',1,7,'sale'),('2018-01-13 22:41:06',1,7,'leasing'),('2018-01-13 22:41:09',1,9,'leasing'),('2018-01-13 22:41:12',1,2,'leasing'),('2018-01-13 22:41:13',1,2,'leasing'),('2018-01-13 22:41:18',1,4,'leasing'),('2018-01-13 22:41:20',1,3,'leasing'),('2018-01-13 23:37:40',1,1,'leasing'),('2018-01-13 23:37:44',1,1,'leasing'),('2018-01-13 23:37:45',1,1,'leasing'),('2018-01-13 23:37:49',1,1,'leasing'),('2018-01-13 23:37:51',1,1,'sale'),('2018-01-13 23:37:53',1,5,'sale'),('2018-01-13 23:37:54',1,5,'sale'),('2018-01-13 23:37:55',1,5,'sale'),('2018-01-13 23:42:10',3,1,'sale'),('2018-01-13 23:42:13',3,5,'sale'),('2018-01-13 23:42:14',3,8,'sale'),('2018-01-13 23:42:16',3,6,'sale'),('2018-01-13 23:42:18',3,9,'sale'),('2018-01-13 23:42:20',3,5,'sale'),('2018-01-13 23:42:22',3,7,'sale'),('2018-01-13 23:42:37',3,3,'sale'),('2018-01-13 23:42:39',3,6,'sale'),('2018-01-13 23:42:41',3,4,'sale'),('2018-01-13 23:42:43',3,8,'sale'),('2018-01-13 23:42:44',3,9,'sale'),('2018-01-13 23:42:46',3,5,'sale'),('2018-01-13 23:42:49',3,7,'leasing'),('2018-01-13 23:42:50',3,3,'leasing'),('2018-01-13 23:42:52',3,3,'leasing'),('2018-01-13 23:42:54',3,3,'leasing'),('2018-01-13 23:42:55',3,3,'leasing'),('2018-01-13 23:42:56',3,3,'leasing'),('2018-01-13 23:42:57',3,3,'leasing'),('2018-01-13 23:42:59',3,3,'leasing'),('2018-01-13 23:43:18',4,1,'leasing'),('2018-01-13 23:43:20',4,1,'leasing'),('2018-01-13 23:43:22',4,4,'leasing'),('2018-01-13 23:43:24',4,7,'leasing'),('2018-01-13 23:43:25',4,7,'leasing'),('2018-01-13 23:43:27',4,5,'leasing'),('2018-01-13 23:43:28',4,9,'leasing'),('2018-01-13 23:43:31',4,8,'leasing'),('2018-01-13 23:43:32',4,4,'leasing'),('2018-01-13 23:43:34',4,2,'leasing'),('2018-01-13 23:43:35',4,2,'leasing'),('2018-01-13 23:43:37',4,2,'leasing');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `login` varchar(100) NOT NULL,
  `is_company` tinyint(4) DEFAULT 0,
  `is_worker` tinyint(4) DEFAULT 0,
  `dealer_id` varchar(100) DEFAULT NULL,
  `car_store_id` int(11) DEFAULT NULL,
  `factory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('carstore1',0,0,NULL,3,NULL),('carstore2',0,0,NULL,3,NULL),('carstore3',0,0,NULL,4,NULL),('carstoretest',0,0,NULL,1,NULL),('companytest',1,0,NULL,NULL,NULL),('dealer1',0,0,'Auto-Centrum',NULL,NULL),('dealer2',0,0,'Inter Auto',NULL,NULL),('dealer3',0,0,'Volkswagen Centrum',NULL,NULL),('dealertest',0,0,'dealertest',NULL,NULL),('factory1',0,0,NULL,NULL,1),('factory3',0,0,NULL,NULL,3),('factory4',0,0,NULL,NULL,4),('factorytest',0,0,NULL,NULL,2),('Krotoski-Cichy',0,0,'Krotoski-Cichy',NULL,NULL),('root',1,1,'%',1,1),('worker',0,1,NULL,NULL,NULL),('workertest',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'concerndb'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_car_store` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_car_store`(
  IN ID_Dealer VARCHAR(100),
  IN Country VARCHAR(30),
  IN City VARCHAR(50),
  IN Address VARCHAR(100)
)
BEGIN
    INSERT INTO car_store(ID_Dealer, Country, City, Address) VALUES(ID_Dealer, Country, City, Address);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_dealer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_dealer`(IN ID VARCHAR(100), IN Country VARCHAR(30),
  IN City VARCHAR(50),
  IN Address VARCHAR(100),
  IN Phone_Number VARCHAR(20))
BEGIN
    INSERT INTO dealer VALUES(ID, Country, City, Address, Phone_Number, 1);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_factory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_factory`(
  IN Country VARCHAR(30),
  IN City VARCHAR(50),
  IN Address VARCHAR(100),
  IN Phone_Number VARCHAR(20),
  IN Workers INT
)
BEGIN
    INSERT INTO factory(Country, City, Address, Phone_Number, Workers, Is_Available) VALUES(Country, City, Address, Phone_Number, Workers, TRUE);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_model` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_model`(
  IN Brand VARCHAR(100),
  IN Model VARCHAR(100)
)
BEGIN
    INSERT INTO brand_model(Brand, Model, In_Production) VALUES(Brand, Model, FALSE);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_order`(
  IN ID_Dealer VARCHAR(100),
  IN ID_Brand_Model INT,
  IN Amount INT
)
BEGIN
    INSERT INTO dealer_orders(ID_Dealer, ID_Brand_Model, Amount) VALUES(ID_Dealer, ID_Brand_Model, Amount);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_transaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_transaction`(
  IN ID_Car_store INT,
  IN ID_Brand_Model INT,
  IN Type ENUM('Leasing', 'Sale', 'Lend')
)
BEGIN
    INSERT INTO transaction VALUES(NOW(), ID_Car_store, ID_Brand_Model, Type);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assigne_model_to_factory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assigne_model_to_factory`(
  IN ID_Brand_Model INT,
  in ID_Factory INT
)
BEGIN
    INSERT INTO factory_model VALUES(ID_Factory,ID_Brand_Model);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_car_store` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_car_store`(
  IN ID_Car_Store INT
)
BEGIN
    UPDATE car_store SET ID_Dealer = NULL WHERE car_store.ID = ID_Car_Store;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_dealer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_dealer`(IN ID VARCHAR(100))
BEGIN
    UPDATE dealer SET Is_Available = FALSE WHERE dealer.ID = ID;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_factory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_factory`(
  IN ID INT
)
BEGIN
    UPDATE factory SET Is_Available = FALSE WHERE factory.ID = ID;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manage_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manage_order`(
  IN ID_Dealer VARCHAR(100),
  in ID_Factory INT,
  IN ID_Brand_Model INT,
  IN Amount INT
)
BEGIN
    INSERT INTO production_orders(ID_Dealer, ID_Factory, ID_Brand_Model, Amount, Accomplished)
    VALUES(ID_Dealer, ID_Factory, ID_Brand_Model, Amount, FALSE);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_production_accomplished` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_production_accomplished`(
  IN ID_Order INT
)
BEGIN
    UPDATE production_orders SET Accomplished = TRUE WHERE production_orders.ID = ID_Order;
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

-- Dump completed on 2018-01-14  0:41:00
