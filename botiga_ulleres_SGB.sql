CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `idAddress` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL,
  `num` int(11) NOT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `door` varchar(10) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `postcode` int(11) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=5001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1000,'c/Tajo',23,'3','2','Lleida',6784,'Espanya'),(2000,'c/Marina',246,'1','3','Barceona',35468,'Espanya'),(3000,'c/Padilla',375,'4','8','Barcelona',8024,'Espanya'),(4000,'Plaça Catalana',1,'1','3','Girona',4684,'Espanya'),(5000,'Plaça Cerdà',4,'5','6','Barcelona',6574,'Espanya');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brand` (
  `idBrand` int(11) NOT NULL,
  `brandName` varchar(45) DEFAULT NULL,
  `Brand_Group_idBrand_Group` int(11) NOT NULL,
  PRIMARY KEY (`idBrand`),
  KEY `fk_Brand_Brand_Group1_idx` (`Brand_Group_idBrand_Group`),
  CONSTRAINT `fk_Brand_Brand_Group1` FOREIGN KEY (`Brand_Group_idBrand_Group`) REFERENCES `brand_group` (`idBrand_Group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (10,'CH',30),(20,'Diesel',20),(30,'Adidas',10),(40,'Nike',10),(50,'Rayman',20),(60,'Gucci',30);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_group`
--

DROP TABLE IF EXISTS `brand_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brand_group` (
  `idBrand_Group` int(11) NOT NULL,
  `BrGrName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBrand_Group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_group`
--

LOCK TABLES `brand_group` WRITE;
/*!40000 ALTER TABLE `brand_group` DISABLE KEYS */;
INSERT INTO `brand_group` VALUES (10,'Sport'),(20,'Urban'),(30,'Classic');
/*!40000 ALTER TABLE `brand_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `clName` varchar(45) DEFAULT NULL,
  `clTel` int(11) NOT NULL,
  `clEmail` varchar(45) DEFAULT NULL,
  `recom` varchar(45) DEFAULT NULL,
  `Address_idAddress` int(11) NOT NULL,
  `regDate` date NOT NULL,
  PRIMARY KEY (`idClient`),
  KEY `fk_Client_Address1_idx` (`Address_idAddress`),
  CONSTRAINT `fk_Client_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (100,'Josefina Montero',934536462,'josefa@gmail.com',NULL,4000,'2019-02-20'),(200,'Martí',669435467,'mmart@gmail.com','Josefina Montero',5000,'2019-04-15');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `idEmployee` int(11) NOT NULL,
  `empName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'Pepita Moreno'),(200,'Jan Valls'),(300,'Maria Sellers');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glasses` (
  `idGlasses` int(11) NOT NULL AUTO_INCREMENT,
  `gradL` varchar(10) DEFAULT NULL,
  `gradR` varchar(10) DEFAULT NULL,
  `mountColor1` varchar(10) DEFAULT NULL,
  `mountColor2` varchar(10) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `Mount_idMount` int(11) NOT NULL,
  `Brand_idBrand` int(11) NOT NULL,
  PRIMARY KEY (`idGlasses`),
  KEY `fk_Glasses_Mount1_idx` (`Mount_idMount`),
  KEY `fk_Glasses_Brand1_idx` (`Brand_idBrand`),
  CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_idBrand`) REFERENCES `brand` (`idBrand`),
  CONSTRAINT `fk_Glasses_Mount1` FOREIGN KEY (`Mount_idMount`) REFERENCES `mount` (`idMount`)
) ENGINE=InnoDB AUTO_INCREMENT=40001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (10000,'2','1.5','blue','black','200',1,10),(20000,'1','1','black','white','150',2,20),(30000,'3','3','black','grey','65',2,10),(40000,'2','2','Yellow','black','400',3,30);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mount`
--

DROP TABLE IF EXISTS `mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mount` (
  `idMount` int(11) NOT NULL,
  `mount_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mount`
--

LOCK TABLES `mount` WRITE;
/*!40000 ALTER TABLE `mount` DISABLE KEYS */;
INSERT INTO `mount` VALUES (1,'Flotant'),(2,'Pasta'),(3,'Metàl·lica');
/*!40000 ALTER TABLE `mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_header`
--

DROP TABLE IF EXISTS `order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_header` (
  `idOrder` int(11) NOT NULL,
  `orderDate` datetime DEFAULT NULL,
  `Employee_idEmployee` int(11) NOT NULL,
  `Client_idClient` int(11) NOT NULL,
  `Supplier_idSupplier` int(11) NOT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fk_Order_header_Employee1_idx` (`Employee_idEmployee`),
  KEY `fk_Order_header_Client1_idx` (`Client_idClient`),
  KEY `fk_Order_header_Supplier1_idx` (`Supplier_idSupplier`),
  CONSTRAINT `fk_Order_header_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`),
  CONSTRAINT `fk_Order_header_Employee1` FOREIGN KEY (`Employee_idEmployee`) REFERENCES `employee` (`idEmployee`),
  CONSTRAINT `fk_Order_header_Supplier1` FOREIGN KEY (`Supplier_idSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_header`
--

LOCK TABLES `order_header` WRITE;
/*!40000 ALTER TABLE `order_header` DISABLE KEYS */;
INSERT INTO `order_header` VALUES (10000,'2019-03-20 18:30:23',100,100,300),(10001,'2019-04-22 00:00:00',200,200,200);
/*!40000 ALTER TABLE `order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_item` (
  `Order_header_idOrder` int(11) NOT NULL,
  `itemNum` int(11) NOT NULL,
  `Glasses_idGlasses` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Order_header_idOrder`,`itemNum`),
  KEY `fk_Order_item_Order_header_idx` (`Order_header_idOrder`),
  KEY `fk_Order_item_Glasses1_idx` (`Glasses_idGlasses`),
  CONSTRAINT `fk_Order_item_Glasses1` FOREIGN KEY (`Glasses_idGlasses`) REFERENCES `glasses` (`idGlasses`),
  CONSTRAINT `fk_Order_item_Order_header` FOREIGN KEY (`Order_header_idOrder`) REFERENCES `order_header` (`idOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (10000,1,10000,1),(10000,2,30000,1),(10001,1,20000,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier` (
  `idSupplier` int(11) NOT NULL AUTO_INCREMENT,
  `supName` varchar(45) DEFAULT NULL,
  `supTel` int(11) DEFAULT NULL,
  `supFax` int(11) DEFAULT NULL,
  `supNif` varchar(9) NOT NULL,
  `Brand_Group_idBrand_Group` int(11) NOT NULL,
  `Address_idAddress` int(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  KEY `fk_Supplier_Brand_Group1_idx` (`Brand_Group_idBrand_Group`),
  KEY `fk_Supplier_Address1_idx` (`Address_idAddress`),
  CONSTRAINT `fk_Supplier_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`),
  CONSTRAINT `fk_Supplier_Brand_Group1` FOREIGN KEY (`Brand_Group_idBrand_Group`) REFERENCES `brand_group` (`idBrand_Group`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (100,'Gafas García',972434523,972569812,'78315336H',30,1000),(200,'Tu vista',934553512,934562138,'74546546V',20,2000),(300,'Miramos por el deporte',934568765,934562476,'43546843M',10,3000);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-24 11:07:24
