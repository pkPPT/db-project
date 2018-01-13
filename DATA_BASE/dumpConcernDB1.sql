-- MySQL dump 10.16  Distrib 10.2.9-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: concerndb
-- ------------------------------------------------------
-- Server version	10.2.9-MariaDB
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

CREATE DATABASE IF NOT EXISTS concerndb;
USE concerndb;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_model`
--

LOCK TABLES `brand_model` WRITE;
/*!40000 ALTER TABLE `brand_model` DISABLE KEYS */;
INSERT INTO `brand_model` VALUES (1,'Volkswagen','Golf I',0),(2,'Volkswagen','Beetle',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_store`
--

LOCK TABLES `car_store` WRITE;
/*!40000 ALTER TABLE `car_store` DISABLE KEYS */;
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
INSERT INTO `dealer` VALUES ('Krotoski-Cichy','Poland','Warszawa','ul. Radzymińska 78',543328190,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealer_orders`
--

LOCK TABLES `dealer_orders` WRITE;
/*!40000 ALTER TABLE `dealer_orders` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
INSERT INTO `factory` VALUES (1,'Poland','Bielany Wrocławskie','ul. Ryszarda Chomicza',500121001,4000,1);
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
INSERT INTO `factory_model` VALUES (1,2);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

    DECLARE curP CURSOR FOR(SELECT p.ID, p.ID_Dealer, p.ID_Brand_Model, p.Amount FROM Production_Orders AS p WHERE Production_Orders.ID_Factory = OLD.ID_Factory);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_orders`
--

LOCK TABLES `production_orders` WRITE;
/*!40000 ALTER TABLE `production_orders` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-13  3:37:55

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  login VARCHAR(100) NOT NULL,
  is_company TINYINT DEFAULT FALSE,
  is_worker TINYINT DEFAULT FALSE,
  dealer_id VARCHAR(100) DEFAULT NULL,
  car_store_id INT DEFAULT NULL,
  factory_id INT DEFAULT NULL,
  PRIMARY KEY (login)
);
# -----------------------------------------------------------------------------------------------
# SELECT * FROM dealer;
# INSERT INTO users(login, dealer_id) VALUES('Krotoski-Cichy', 'Krotoski-Cichy');
# INSERT INTO users(login, is_company, is_worker, dealer_id, car_store_id, factory_id)
# VALUES('root', TRUE, TRUE, '%', 1, 1);
#
#
# SELECT * FROM users;
#
# SELECT * FROM dealer_orders;
# SELECT * FROM orders_log;


CREATE USER 'Krotoski-Cichy'@'%';
SET PASSWORD FOR 'Krotoski-Cichy'@'%' = PASSWORD('1234');

GRANT SELECT ON concerndb.dealer TO 'Krotoski-Cichy'@'%';
GRANT INSERT, SELECT, DELETE ON concerndb.car_store TO 'Krotoski-Cichy'@'%';
GRANT INSERT, SELECT ON concerndb.dealer_orders TO 'Krotoski-Cichy'@'%';
GRANT SELECT ON concerndb.brand_model TO 'Krotoski-Cichy'@'%';
GRANT SELECT ON concerndb.users TO 'Krotoski-Cichy'@'%';
GRANT SELECT ON concerndb.orders_log TO 'Krotoski-Cichy'@'%';
GRANT SELECT ON concerndb.transaction TO 'Krotoski-Cichy'@'%';
FLUSH PRIVILEGES;

# Przykladowy dealer user
CREATE USER 'dealertest'@'%';
SET PASSWORD FOR 'dealertest'@'%' = PASSWORD('test');
GRANT SELECT ON concerndb.dealer TO 'dealertest'@'%';
GRANT INSERT, SELECT, DELETE ON concerndb.car_store TO 'dealertest'@'%';
GRANT INSERT, SELECT ON concerndb.dealer_orders TO 'dealertest'@'%';
GRANT SELECT ON concerndb.brand_model TO 'dealertest'@'%';
GRANT SELECT ON concerndb.users TO 'dealertest'@'%';
GRANT SELECT ON concerndb.orders_log TO 'dealertest'@'%';
GRANT SELECT ON concerndb.transaction TO 'dealertest'@'%';

INSERT INTO dealer(ID, Country, City, Address, Phone_Number, Is_Available) VALUES('dealertest', 'Poland', 'Wroclaw', 'ul. Legnicka 1', 000000000, TRUE);
INSERT INTO users(login, dealer_id) VALUES('dealertest', 'dealertest');


# Przykladowy factory user
CREATE USER 'factorytest'@'%';
SET PASSWORD FOR 'factorytest'@'%' = PASSWORD('test');
GRANT SELECT ON concerndb.factory_model TO 'factorytest'@'%';
GRANT SELECT, DELETE, UPDATE ON concerndb.production_orders TO 'factorytest'@'%';
GRANT SELECT ON concerndb.brand_model TO 'factorytest'@'%';
GRANT SELECT ON concerndb.users TO 'factorytest'@'%';
FLUSH PRIVILEGES ;

INSERT INTO factory(Country, City, Address, Phone_Number, Workers, Is_Available) VALUES('Poland', 'Wroclaw', 'Legnicka 1', 100000000, 0, TRUE);
INSERT INTO users(login, factory_id) VALUES('factorytest', 2);

# Przykladowy carstore user
CREATE USER 'carstoretest'@'%';
SET PASSWORD FOR 'carstoretest'@'%' = PASSWORD('test');
GRANT INSERT, SELECT ON concerndb.transaction TO 'carstoretest'@'%';
GRANT SELECT ON concerndb.brand_model TO 'carstoretest'@'%';
GRANT SELECT ON concerndb.users TO 'carstoretest'@'%';
FLUSH PRIVILEGES ;

INSERT INTO car_store(ID_Dealer, Country, City, Address) VALUES('dealertest', 'Poland', 'Wroclaw', 'Legnicka 1');
INSERT INTO users(login, car_store_id) VALUES('carstoretest', 1);

# Przykladowy worker user
CREATE USER 'workertest'@'%';
SET PASSWORD FOR 'workertest'@'%' = PASSWORD('test');
GRANT INSERT, SELECT, UPDATE ON concerndb.dealer_orders TO 'carstoretest'@'%';
GRANT SELECT ON concerndb.factory TO 'carstoretest'@'%';
GRANT SELECT ON concerndb.dealer TO 'carstoretest'@'%';
FLUSH PRIVILEGES;

INSERT INTO users(login, is_worker) VALUES('workertest', TRUE);

# Przykladowy company user
CREATE USER 'companytest'@'%';
SET PASSWORD FOR 'companytest'@'%' = PASSWORD('test');
GRANT INSERT, SELECT, UPDATE, DELETE ON concerndb.dealer TO 'companytest'@'%';
GRANT INSERT, SELECT, UPDATE, DELETE ON concerndb.factory TO 'companytest'@'%';
GRANT INSERT, SELECT, UPDATE, DELETE ON concerndb.factory_model TO 'companytest'@'%';
GRANT SELECT ON concerndb.car_store TO 'companytest'@'%';
GRANT SELECT ON concerndb.dealer_orders TO 'companytest'@'%';
GRANT INSERT, SELECT, UPDATE, DELETE ON concerndb.brand_model TO 'companytest'@'%';
GRANT SELECT ON concerndb.users TO 'dealertest'@'%';
GRANT SELECT ON concerndb.production_log TO 'companytest'@'%';
GRANT SELECT ON concerndb.production_orders TO 'companytest'@'%';
GRANT SELECT ON concerndb.transaction TO 'companytest'@'%';
FLUSH PRIVILEGES ;

INSERT INTO users(login, is_company) VALUES('companytest', TRUE);
