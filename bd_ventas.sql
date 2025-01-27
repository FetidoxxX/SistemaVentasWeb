-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_ventas
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IdCliente` int unsigned NOT NULL AUTO_INCREMENT,
  `Dni` varchar(8) DEFAULT NULL,
  `Nombres` varchar(244) DEFAULT NULL,
  `Direccion` varchar(244) DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (17,'2','Juan Guerrero Solis','Los Alamos','1'),(18,'1','Maria Rosas Villanueva','Los Laureles 234','1'),(19,'3','Andres de Santa Cruz','Av. La Frontera 347','1'),(20,'4','Andres Mendoza','Chosica, Lurigancho','1');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `IdDetalleVentas` int unsigned NOT NULL AUTO_INCREMENT,
  `IdVentas` int unsigned NOT NULL,
  `IdProducto` int unsigned NOT NULL,
  `Cantidad` int unsigned DEFAULT NULL,
  `PrecioVenta` double DEFAULT NULL,
  PRIMARY KEY (`IdDetalleVentas`),
  KEY `Ventas_has_Producto_FKIndex1` (`IdVentas`),
  KEY `Ventas_has_Producto_FKIndex2` (`IdProducto`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`IdVentas`) REFERENCES `ventas` (`IdVentas`),
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `IdEmpleado` int unsigned NOT NULL AUTO_INCREMENT,
  `Dni` varchar(8) NOT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Telefono` varchar(9) DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL,
  `User` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`IdEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'123','Pedro Hernandez','988252459','1','emp01'),(2,'123','Roman Riquelme','988252459','1','Jo46'),(3,'123','Palermo Suarez','453536458','1','Em22');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `IdProducto` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(244) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int unsigned DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Teclado Logitech 345 Editado',150,99,'1'),(2,'Mouse Logitech 567',20,98,'1'),(3,'Laptop Lenovo Ideapad 520',800,100,'1'),(4,'HeadPhones Sony M333',500,98,'1'),(7,'Producto Nuevo w',22,35,'1');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `IdVentas` int unsigned NOT NULL AUTO_INCREMENT,
  `IdCliente` int unsigned NOT NULL,
  `IdEmpleado` int unsigned NOT NULL,
  `NumeroSerie` varchar(244) DEFAULT NULL,
  `FechaVentas` date DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`IdVentas`),
  KEY `Ventas_FKIndex1` (`IdEmpleado`),
  KEY `Ventas_FKIndex2` (`IdCliente`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleado` (`IdEmpleado`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-26 14:40:20
