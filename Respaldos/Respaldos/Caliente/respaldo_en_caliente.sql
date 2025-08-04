-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurante_bd
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_roles_privilegios`
--

DROP TABLE IF EXISTS `audit_roles_privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_roles_privilegios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) DEFAULT NULL,
  `rol_privilegio` varchar(100) DEFAULT NULL,
  `accion` enum('GRANT','REVOKE') DEFAULT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `admin_responsable` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_roles_privilegios`
--

LOCK TABLES `audit_roles_privilegios` WRITE;
/*!40000 ALTER TABLE `audit_roles_privilegios` DISABLE KEYS */;
INSERT INTO `audit_roles_privilegios` VALUES (1,'jimy_user','administrador','GRANT','2025-08-02 17:54:59','admin_root'),(2,'jimy_user','administrador','GRANT','2025-08-02 17:58:17','admin_root'),(3,'jimy_user','administrador','REVOKE','2025-08-02 18:00:03','admin_root');
/*!40000 ALTER TABLE `audit_roles_privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_plato`
--

DROP TABLE IF EXISTS `categorias_plato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_plato` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre_categoria` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_plato`
--

LOCK TABLES `categorias_plato` WRITE;
/*!40000 ALTER TABLE `categorias_plato` DISABLE KEYS */;
INSERT INTO `categorias_plato` VALUES (4,'bebida'),(1,'entrada'),(5,'especial'),(6,'pastas'),(2,'plato fuerte'),(3,'postre');
/*!40000 ALTER TABLE `categorias_plato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varbinary(255) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password_hash` char(64) DEFAULT NULL,
  `version_hash` char(64) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `correo` (`correo`),
  KEY `idx_clientes_correo` (`correo`),
  KEY `idx_correo` (`correo`),
  CONSTRAINT `chk_nombre_valido` CHECK (regexp_like(`nombre`,_utf8mb4'^[A-Za-z√°√©√≠√≥√∫√Å√â√ç√ì√ö√±√ë ]+$'))
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'pedro salazar','0987654321',_binary 'pedro@example.com','2025-08-02 21:21:30',NULL,'ab32415ba0c72ebdf9c1c4fb82b2d675997fb01038434093cfc8f3dafc3046b1'),(2,'lucia vallejo','0971234567',_binary 'lucia@example.com','2025-08-02 21:21:30',NULL,NULL),(3,'andres almeida','0968889999',_binary 'andres@example.com','2025-08-02 21:21:30',NULL,NULL),(4,'karina morales','0953332211',_binary 'karina@example.com','2025-08-02 21:21:30',NULL,NULL),(5,'roberto suarez','0944445566',_binary 'roberto@example.com','2025-08-02 21:21:30',NULL,NULL),(6,'Nombre Valido',NULL,_binary 'cliente1@test.com','2025-08-02 21:50:21',NULL,NULL),(7,'Nombre Valido',NULL,_binary 'cliente2@test.com','2025-08-02 21:50:21',NULL,NULL),(8,'Nombre Valido',NULL,_binary 'cliente3@test.com','2025-08-02 21:50:21',NULL,NULL),(9,'Nombre Valido',NULL,_binary 'cliente4@test.com','2025-08-02 21:50:21',NULL,NULL),(10,'Nombre Valido',NULL,_binary 'cliente5@test.com','2025-08-02 21:50:21',NULL,NULL),(11,'Nombre Valido',NULL,_binary 'cliente6@test.com','2025-08-02 21:50:21',NULL,NULL),(12,'Nombre Valido',NULL,_binary 'cliente7@test.com','2025-08-02 21:50:21',NULL,NULL),(13,'Nombre Valido',NULL,_binary 'cliente8@test.com','2025-08-02 21:50:21',NULL,NULL),(14,'Nombre Valido',NULL,_binary 'cliente9@test.com','2025-08-02 21:50:21',NULL,NULL),(15,'Nombre Valido',NULL,_binary 'cliente10@test.com','2025-08-02 21:50:21',NULL,NULL),(16,'Nombre Valido',NULL,_binary 'cliente11@test.com','2025-08-02 21:50:21',NULL,NULL),(17,'Nombre Valido',NULL,_binary 'cliente12@test.com','2025-08-02 21:50:21',NULL,NULL),(18,'Nombre Valido',NULL,_binary 'cliente13@test.com','2025-08-02 21:50:21',NULL,NULL),(19,'Nombre Valido',NULL,_binary 'cliente14@test.com','2025-08-02 21:50:21',NULL,NULL),(20,'Nombre Valido',NULL,_binary 'cliente15@test.com','2025-08-02 21:50:21',NULL,NULL),(21,'Nombre Valido',NULL,_binary 'cliente16@test.com','2025-08-02 21:50:21',NULL,NULL),(22,'Nombre Valido',NULL,_binary 'cliente17@test.com','2025-08-02 21:50:21',NULL,NULL),(23,'Nombre Valido',NULL,_binary 'cliente18@test.com','2025-08-02 21:50:21',NULL,NULL),(24,'Nombre Valido',NULL,_binary 'cliente19@test.com','2025-08-02 21:50:21',NULL,NULL),(25,'Nombre Valido',NULL,_binary 'cliente20@test.com','2025-08-02 21:50:21',NULL,NULL),(26,'Nombre Valido',NULL,_binary 'cliente21@test.com','2025-08-02 21:50:21',NULL,NULL),(27,'Nombre Valido',NULL,_binary 'cliente22@test.com','2025-08-02 21:50:21',NULL,NULL),(28,'Nombre Valido',NULL,_binary 'cliente23@test.com','2025-08-02 21:50:21',NULL,NULL),(29,'Nombre Valido',NULL,_binary 'cliente24@test.com','2025-08-02 21:50:21',NULL,NULL),(30,'Nombre Valido',NULL,_binary 'cliente25@test.com','2025-08-02 21:50:21',NULL,NULL),(31,'Nombre Valido',NULL,_binary 'cliente26@test.com','2025-08-02 21:50:21',NULL,NULL),(32,'Nombre Valido',NULL,_binary 'cliente27@test.com','2025-08-02 21:50:21',NULL,NULL),(33,'Nombre Valido',NULL,_binary 'cliente28@test.com','2025-08-02 21:50:21',NULL,NULL),(34,'Nombre Valido',NULL,_binary 'cliente29@test.com','2025-08-02 21:50:21',NULL,NULL),(35,'Nombre Valido',NULL,_binary 'cliente30@test.com','2025-08-02 21:50:21',NULL,NULL),(36,'Nombre Valido',NULL,_binary 'cliente31@test.com','2025-08-02 21:50:21',NULL,NULL),(37,'Nombre Valido',NULL,_binary 'cliente32@test.com','2025-08-02 21:50:21',NULL,NULL),(38,'Nombre Valido',NULL,_binary 'cliente33@test.com','2025-08-02 21:50:21',NULL,NULL),(39,'Nombre Valido',NULL,_binary 'cliente34@test.com','2025-08-02 21:50:21',NULL,NULL),(40,'Nombre Valido',NULL,_binary 'cliente35@test.com','2025-08-02 21:50:21',NULL,NULL),(41,'Nombre Valido',NULL,_binary 'cliente36@test.com','2025-08-02 21:50:21',NULL,NULL),(42,'Nombre Valido',NULL,_binary 'cliente37@test.com','2025-08-02 21:50:21',NULL,NULL),(43,'Nombre Valido',NULL,_binary 'cliente38@test.com','2025-08-02 21:50:21',NULL,NULL),(44,'Nombre Valido',NULL,_binary 'cliente39@test.com','2025-08-02 21:50:21',NULL,NULL),(45,'Nombre Valido',NULL,_binary 'cliente40@test.com','2025-08-02 21:50:21',NULL,NULL),(46,'Nombre Valido',NULL,_binary 'cliente41@test.com','2025-08-02 21:50:21',NULL,NULL),(47,'Nombre Valido',NULL,_binary 'cliente42@test.com','2025-08-02 21:50:21',NULL,NULL),(48,'Nombre Valido',NULL,_binary 'cliente43@test.com','2025-08-02 21:50:21',NULL,NULL),(49,'Nombre Valido',NULL,_binary 'cliente44@test.com','2025-08-02 21:50:22',NULL,NULL),(50,'Nombre Valido',NULL,_binary 'cliente45@test.com','2025-08-02 21:50:22',NULL,NULL),(51,'Nombre Valido',NULL,_binary 'cliente46@test.com','2025-08-02 21:50:22',NULL,NULL),(52,'Nombre Valido',NULL,_binary 'cliente47@test.com','2025-08-02 21:50:22',NULL,NULL),(53,'Nombre Valido',NULL,_binary 'cliente48@test.com','2025-08-02 21:50:22',NULL,NULL),(54,'Nombre Valido',NULL,_binary 'cliente49@test.com','2025-08-02 21:50:22',NULL,NULL),(55,'Nombre Valido',NULL,_binary 'cliente50@test.com','2025-08-02 21:50:22',NULL,NULL),(56,'Nombre Valido',NULL,_binary 'cliente51@test.com','2025-08-02 21:50:22',NULL,NULL),(57,'Nombre Valido',NULL,_binary 'cliente52@test.com','2025-08-02 21:50:22',NULL,NULL),(58,'Nombre Valido',NULL,_binary 'cliente53@test.com','2025-08-02 21:50:22',NULL,NULL),(59,'Nombre Valido',NULL,_binary 'cliente54@test.com','2025-08-02 21:50:22',NULL,NULL),(60,'Nombre Valido',NULL,_binary 'cliente55@test.com','2025-08-02 21:50:22',NULL,NULL),(61,'Nombre Valido',NULL,_binary 'cliente56@test.com','2025-08-02 21:50:22',NULL,NULL),(62,'Nombre Valido',NULL,_binary 'cliente57@test.com','2025-08-02 21:50:22',NULL,NULL),(63,'Nombre Valido',NULL,_binary 'cliente58@test.com','2025-08-02 21:50:22',NULL,NULL),(64,'Nombre Valido',NULL,_binary 'cliente59@test.com','2025-08-02 21:50:22',NULL,NULL),(65,'Nombre Valido',NULL,_binary 'cliente60@test.com','2025-08-02 21:50:22',NULL,NULL),(66,'Nombre Valido',NULL,_binary 'cliente61@test.com','2025-08-02 21:50:22',NULL,NULL),(67,'Nombre Valido',NULL,_binary 'cliente62@test.com','2025-08-02 21:50:22',NULL,NULL),(68,'Nombre Valido',NULL,_binary 'cliente63@test.com','2025-08-02 21:50:22',NULL,NULL),(69,'Nombre Valido',NULL,_binary 'cliente64@test.com','2025-08-02 21:50:22',NULL,NULL),(70,'Nombre Valido',NULL,_binary 'cliente65@test.com','2025-08-02 21:50:22',NULL,NULL),(71,'Nombre Valido',NULL,_binary 'cliente66@test.com','2025-08-02 21:50:22',NULL,NULL),(72,'Nombre Valido',NULL,_binary 'cliente67@test.com','2025-08-02 21:50:22',NULL,NULL),(73,'Nombre Valido',NULL,_binary 'cliente68@test.com','2025-08-02 21:50:22',NULL,NULL),(74,'Nombre Valido',NULL,_binary 'cliente69@test.com','2025-08-02 21:50:22',NULL,NULL),(75,'Nombre Valido',NULL,_binary 'cliente70@test.com','2025-08-02 21:50:22',NULL,NULL),(76,'Nombre Valido',NULL,_binary 'cliente71@test.com','2025-08-02 21:50:22',NULL,NULL),(77,'Nombre Valido',NULL,_binary 'cliente72@test.com','2025-08-02 21:50:22',NULL,NULL),(78,'Nombre Valido',NULL,_binary 'cliente73@test.com','2025-08-02 21:50:22',NULL,NULL),(79,'Nombre Valido',NULL,_binary 'cliente74@test.com','2025-08-02 21:50:22',NULL,NULL),(80,'Nombre Valido',NULL,_binary 'cliente75@test.com','2025-08-02 21:50:22',NULL,NULL),(81,'Nombre Valido',NULL,_binary 'cliente76@test.com','2025-08-02 21:50:22',NULL,NULL),(82,'Nombre Valido',NULL,_binary 'cliente77@test.com','2025-08-02 21:50:22',NULL,NULL),(83,'Nombre Valido',NULL,_binary 'cliente78@test.com','2025-08-02 21:50:22',NULL,NULL),(84,'Nombre Valido',NULL,_binary 'cliente79@test.com','2025-08-02 21:50:22',NULL,NULL),(85,'Nombre Valido',NULL,_binary 'cliente80@test.com','2025-08-02 21:50:22',NULL,NULL),(86,'Nombre Valido',NULL,_binary 'cliente81@test.com','2025-08-02 21:50:22',NULL,NULL),(87,'Nombre Valido',NULL,_binary 'cliente82@test.com','2025-08-02 21:50:22',NULL,NULL),(88,'Nombre Valido',NULL,_binary 'cliente83@test.com','2025-08-02 21:50:22',NULL,NULL),(89,'Nombre Valido',NULL,_binary 'cliente84@test.com','2025-08-02 21:50:22',NULL,NULL),(90,'Nombre Valido',NULL,_binary 'cliente85@test.com','2025-08-02 21:50:22',NULL,NULL),(91,'Nombre Valido',NULL,_binary 'cliente86@test.com','2025-08-02 21:50:22',NULL,NULL),(92,'Nombre Valido',NULL,_binary 'cliente87@test.com','2025-08-02 21:50:22',NULL,NULL),(93,'Nombre Valido',NULL,_binary 'cliente88@test.com','2025-08-02 21:50:22',NULL,NULL),(94,'Nombre Valido',NULL,_binary 'cliente89@test.com','2025-08-02 21:50:22',NULL,NULL),(95,'Nombre Valido',NULL,_binary 'cliente90@test.com','2025-08-02 21:50:22',NULL,NULL),(96,'Nombre Valido',NULL,_binary 'cliente91@test.com','2025-08-02 21:50:22',NULL,NULL),(97,'Nombre Valido',NULL,_binary 'cliente92@test.com','2025-08-02 21:50:22',NULL,NULL),(98,'Nombre Valido',NULL,_binary 'cliente93@test.com','2025-08-02 21:50:22',NULL,NULL),(99,'Nombre Valido',NULL,_binary 'cliente94@test.com','2025-08-02 21:50:22',NULL,NULL),(100,'Nombre Valido',NULL,_binary 'cliente95@test.com','2025-08-02 21:50:22',NULL,NULL),(101,'Nombre Valido',NULL,_binary 'cliente96@test.com','2025-08-02 21:50:22',NULL,NULL),(102,'Nombre Valido',NULL,_binary 'cliente97@test.com','2025-08-02 21:50:22',NULL,NULL),(103,'Nombre Valido',NULL,_binary 'cliente98@test.com','2025-08-02 21:50:22',NULL,NULL),(104,'Nombre Valido',NULL,_binary 'cliente99@test.com','2025-08-02 21:50:22',NULL,NULL),(105,'Nombre Valido',NULL,_binary 'cliente100@test.com','2025-08-02 21:50:22',NULL,NULL),(106,'Nombre Valido',NULL,_binary 'cliente101@test.com','2025-08-02 21:50:22',NULL,NULL),(107,'Nombre Valido',NULL,_binary 'cliente102@test.com','2025-08-02 21:50:22',NULL,NULL),(108,'Nombre Valido',NULL,_binary 'cliente103@test.com','2025-08-02 21:50:22',NULL,NULL),(109,'Nombre Valido',NULL,_binary 'cliente104@test.com','2025-08-02 21:50:22',NULL,NULL),(110,'Nombre Valido',NULL,_binary 'cliente105@test.com','2025-08-02 21:50:22',NULL,NULL),(111,'Nombre Valido',NULL,_binary 'cliente106@test.com','2025-08-02 21:50:22',NULL,NULL),(112,'Nombre Valido',NULL,_binary 'cliente107@test.com','2025-08-02 21:50:22',NULL,NULL),(113,'Nombre Valido',NULL,_binary 'cliente108@test.com','2025-08-02 21:50:22',NULL,NULL),(114,'Nombre Valido',NULL,_binary 'cliente109@test.com','2025-08-02 21:50:22',NULL,NULL),(115,'Nombre Valido',NULL,_binary 'cliente110@test.com','2025-08-02 21:50:22',NULL,NULL),(116,'Nombre Valido',NULL,_binary 'cliente111@test.com','2025-08-02 21:50:22',NULL,NULL),(117,'Nombre Valido',NULL,_binary 'cliente112@test.com','2025-08-02 21:50:22',NULL,NULL),(118,'Nombre Valido',NULL,_binary 'cliente113@test.com','2025-08-02 21:50:22',NULL,NULL),(119,'Nombre Valido',NULL,_binary 'cliente114@test.com','2025-08-02 21:50:22',NULL,NULL),(120,'Nombre Valido',NULL,_binary 'cliente115@test.com','2025-08-02 21:50:22',NULL,NULL),(121,'Nombre Valido',NULL,_binary 'cliente116@test.com','2025-08-02 21:50:22',NULL,NULL),(122,'Nombre Valido',NULL,_binary 'cliente117@test.com','2025-08-02 21:50:22',NULL,NULL),(123,'Nombre Valido',NULL,_binary 'cliente118@test.com','2025-08-02 21:50:22',NULL,NULL),(124,'Nombre Valido',NULL,_binary 'cliente119@test.com','2025-08-02 21:50:22',NULL,NULL),(125,'Nombre Valido',NULL,_binary 'cliente120@test.com','2025-08-02 21:50:22',NULL,NULL),(126,'Nombre Valido',NULL,_binary 'cliente121@test.com','2025-08-02 21:50:22',NULL,NULL),(127,'Nombre Valido',NULL,_binary 'cliente122@test.com','2025-08-02 21:50:22',NULL,NULL),(128,'Nombre Valido',NULL,_binary 'cliente123@test.com','2025-08-02 21:50:22',NULL,NULL),(129,'Nombre Valido',NULL,_binary 'cliente124@test.com','2025-08-02 21:50:22',NULL,NULL),(130,'Nombre Valido',NULL,_binary 'cliente125@test.com','2025-08-02 21:50:22',NULL,NULL),(131,'Nombre Valido',NULL,_binary 'cliente126@test.com','2025-08-02 21:50:22',NULL,NULL),(132,'Nombre Valido',NULL,_binary 'cliente127@test.com','2025-08-02 21:50:22',NULL,NULL),(133,'Nombre Valido',NULL,_binary 'cliente128@test.com','2025-08-02 21:50:22',NULL,NULL),(134,'Nombre Valido',NULL,_binary 'cliente129@test.com','2025-08-02 21:50:22',NULL,NULL),(135,'Nombre Valido',NULL,_binary 'cliente130@test.com','2025-08-02 21:50:22',NULL,NULL),(136,'Nombre Valido',NULL,_binary 'cliente131@test.com','2025-08-02 21:50:22',NULL,NULL),(137,'Nombre Valido',NULL,_binary 'cliente132@test.com','2025-08-02 21:50:22',NULL,NULL),(138,'Nombre Valido',NULL,_binary 'cliente133@test.com','2025-08-02 21:50:22',NULL,NULL),(139,'Nombre Valido',NULL,_binary 'cliente134@test.com','2025-08-02 21:50:22',NULL,NULL),(140,'Nombre Valido',NULL,_binary 'cliente135@test.com','2025-08-02 21:50:22',NULL,NULL),(141,'Nombre Valido',NULL,_binary 'cliente136@test.com','2025-08-02 21:50:22',NULL,NULL),(142,'Nombre Valido',NULL,_binary 'cliente137@test.com','2025-08-02 21:50:22',NULL,NULL),(143,'Nombre Valido',NULL,_binary 'cliente138@test.com','2025-08-02 21:50:22',NULL,NULL),(144,'Nombre Valido',NULL,_binary 'cliente139@test.com','2025-08-02 21:50:22',NULL,NULL),(145,'Nombre Valido',NULL,_binary 'cliente140@test.com','2025-08-02 21:50:22',NULL,NULL),(146,'Nombre Valido',NULL,_binary 'cliente141@test.com','2025-08-02 21:50:22',NULL,NULL),(147,'Nombre Valido',NULL,_binary 'cliente142@test.com','2025-08-02 21:50:22',NULL,NULL),(148,'Nombre Valido',NULL,_binary 'cliente143@test.com','2025-08-02 21:50:22',NULL,NULL),(149,'Nombre Valido',NULL,_binary 'cliente144@test.com','2025-08-02 21:50:22',NULL,NULL),(150,'Nombre Valido',NULL,_binary 'cliente145@test.com','2025-08-02 21:50:22',NULL,NULL),(151,'Nombre Valido',NULL,_binary 'cliente146@test.com','2025-08-02 21:50:22',NULL,NULL),(152,'Nombre Valido',NULL,_binary 'cliente147@test.com','2025-08-02 21:50:22',NULL,NULL),(153,'Nombre Valido',NULL,_binary 'cliente148@test.com','2025-08-02 21:50:22',NULL,NULL),(154,'Nombre Valido',NULL,_binary 'cliente149@test.com','2025-08-02 21:50:22',NULL,NULL),(155,'Nombre Valido',NULL,_binary 'cliente150@test.com','2025-08-02 21:50:22',NULL,NULL),(156,'Nombre Valido',NULL,_binary 'cliente151@test.com','2025-08-02 21:50:22',NULL,NULL),(157,'Nombre Valido',NULL,_binary 'cliente152@test.com','2025-08-02 21:50:22',NULL,NULL),(158,'Nombre Valido',NULL,_binary 'cliente153@test.com','2025-08-02 21:50:22',NULL,NULL),(159,'Nombre Valido',NULL,_binary 'cliente154@test.com','2025-08-02 21:50:22',NULL,NULL),(160,'Nombre Valido',NULL,_binary 'cliente155@test.com','2025-08-02 21:50:22',NULL,NULL),(161,'Nombre Valido',NULL,_binary 'cliente156@test.com','2025-08-02 21:50:22',NULL,NULL),(162,'Nombre Valido',NULL,_binary 'cliente157@test.com','2025-08-02 21:50:22',NULL,NULL),(163,'Nombre Valido',NULL,_binary 'cliente158@test.com','2025-08-02 21:50:22',NULL,NULL),(164,'Nombre Valido',NULL,_binary 'cliente159@test.com','2025-08-02 21:50:22',NULL,NULL),(165,'Nombre Valido',NULL,_binary 'cliente160@test.com','2025-08-02 21:50:22',NULL,NULL),(166,'Nombre Valido',NULL,_binary 'cliente161@test.com','2025-08-02 21:50:22',NULL,NULL),(167,'Nombre Valido',NULL,_binary 'cliente162@test.com','2025-08-02 21:50:22',NULL,NULL),(168,'Nombre Valido',NULL,_binary 'cliente163@test.com','2025-08-02 21:50:22',NULL,NULL),(169,'Nombre Valido',NULL,_binary 'cliente164@test.com','2025-08-02 21:50:22',NULL,NULL),(170,'Nombre Valido',NULL,_binary 'cliente165@test.com','2025-08-02 21:50:22',NULL,NULL),(171,'Nombre Valido',NULL,_binary 'cliente166@test.com','2025-08-02 21:50:22',NULL,NULL),(172,'Nombre Valido',NULL,_binary 'cliente167@test.com','2025-08-02 21:50:22',NULL,NULL),(173,'Nombre Valido',NULL,_binary 'cliente168@test.com','2025-08-02 21:50:22',NULL,NULL),(174,'Nombre Valido',NULL,_binary 'cliente169@test.com','2025-08-02 21:50:22',NULL,NULL),(175,'Nombre Valido',NULL,_binary 'cliente170@test.com','2025-08-02 21:50:22',NULL,NULL),(176,'Nombre Valido',NULL,_binary 'cliente171@test.com','2025-08-02 21:50:22',NULL,NULL),(177,'Nombre Valido',NULL,_binary 'cliente172@test.com','2025-08-02 21:50:22',NULL,NULL),(178,'Nombre Valido',NULL,_binary 'cliente173@test.com','2025-08-02 21:50:22',NULL,NULL),(179,'Nombre Valido',NULL,_binary 'cliente174@test.com','2025-08-02 21:50:22',NULL,NULL),(180,'Nombre Valido',NULL,_binary 'cliente175@test.com','2025-08-02 21:50:22',NULL,NULL),(181,'Nombre Valido',NULL,_binary 'cliente176@test.com','2025-08-02 21:50:22',NULL,NULL),(182,'Nombre Valido',NULL,_binary 'cliente177@test.com','2025-08-02 21:50:22',NULL,NULL),(183,'Nombre Valido',NULL,_binary 'cliente178@test.com','2025-08-02 21:50:22',NULL,NULL),(184,'Nombre Valido',NULL,_binary 'cliente179@test.com','2025-08-02 21:50:22',NULL,NULL),(185,'Nombre Valido',NULL,_binary 'cliente180@test.com','2025-08-02 21:50:22',NULL,NULL),(186,'Nombre Valido',NULL,_binary 'cliente181@test.com','2025-08-02 21:50:22',NULL,NULL),(187,'Nombre Valido',NULL,_binary 'cliente182@test.com','2025-08-02 21:50:22',NULL,NULL),(188,'Nombre Valido',NULL,_binary 'cliente183@test.com','2025-08-02 21:50:22',NULL,NULL),(189,'Nombre Valido',NULL,_binary 'cliente184@test.com','2025-08-02 21:50:22',NULL,NULL),(190,'Nombre Valido',NULL,_binary 'cliente185@test.com','2025-08-02 21:50:22',NULL,NULL),(191,'Nombre Valido',NULL,_binary 'cliente186@test.com','2025-08-02 21:50:22',NULL,NULL),(192,'Nombre Valido',NULL,_binary 'cliente187@test.com','2025-08-02 21:50:22',NULL,NULL),(193,'Nombre Valido',NULL,_binary 'cliente188@test.com','2025-08-02 21:50:22',NULL,NULL),(194,'Nombre Valido',NULL,_binary 'cliente189@test.com','2025-08-02 21:50:22',NULL,NULL),(195,'Nombre Valido',NULL,_binary 'cliente190@test.com','2025-08-02 21:50:22',NULL,NULL),(196,'Nombre Valido',NULL,_binary 'cliente191@test.com','2025-08-02 21:50:22',NULL,NULL),(197,'Nombre Valido',NULL,_binary 'cliente192@test.com','2025-08-02 21:50:22',NULL,NULL),(198,'Nombre Valido',NULL,_binary 'cliente193@test.com','2025-08-02 21:50:22',NULL,NULL),(199,'Nombre Valido',NULL,_binary 'cliente194@test.com','2025-08-02 21:50:22',NULL,NULL),(200,'Nombre Valido',NULL,_binary 'cliente195@test.com','2025-08-02 21:50:22',NULL,NULL),(201,'Nombre Valido',NULL,_binary 'cliente196@test.com','2025-08-02 21:50:22',NULL,NULL),(202,'Nombre Valido',NULL,_binary 'cliente197@test.com','2025-08-02 21:50:22',NULL,NULL),(203,'Nombre Valido',NULL,_binary 'cliente198@test.com','2025-08-02 21:50:22',NULL,NULL),(204,'Nombre Valido',NULL,_binary 'cliente199@test.com','2025-08-02 21:50:22',NULL,NULL),(205,'Nombre Valido',NULL,_binary 'cliente200@test.com','2025-08-02 21:50:22',NULL,NULL),(206,'Nombre Valido',NULL,_binary 'cliente201@test.com','2025-08-02 21:50:22',NULL,NULL),(207,'Nombre Valido',NULL,_binary 'cliente202@test.com','2025-08-02 21:50:22',NULL,NULL),(208,'Nombre Valido',NULL,_binary 'cliente203@test.com','2025-08-02 21:50:22',NULL,NULL),(209,'Nombre Valido',NULL,_binary 'cliente204@test.com','2025-08-02 21:50:22',NULL,NULL),(210,'Nombre Valido',NULL,_binary 'cliente205@test.com','2025-08-02 21:50:22',NULL,NULL),(211,'Nombre Valido',NULL,_binary 'cliente206@test.com','2025-08-02 21:50:22',NULL,NULL),(212,'Nombre Valido',NULL,_binary 'cliente207@test.com','2025-08-02 21:50:22',NULL,NULL),(213,'Nombre Valido',NULL,_binary 'cliente208@test.com','2025-08-02 21:50:22',NULL,NULL),(214,'Nombre Valido',NULL,_binary 'cliente209@test.com','2025-08-02 21:50:22',NULL,NULL),(215,'Nombre Valido',NULL,_binary 'cliente210@test.com','2025-08-02 21:50:22',NULL,NULL),(216,'Nombre Valido',NULL,_binary 'cliente211@test.com','2025-08-02 21:50:22',NULL,NULL),(217,'Nombre Valido',NULL,_binary 'cliente212@test.com','2025-08-02 21:50:22',NULL,NULL),(218,'Nombre Valido',NULL,_binary 'cliente213@test.com','2025-08-02 21:50:22',NULL,NULL),(219,'Nombre Valido',NULL,_binary 'cliente214@test.com','2025-08-02 21:50:22',NULL,NULL),(220,'Nombre Valido',NULL,_binary 'cliente215@test.com','2025-08-02 21:50:22',NULL,NULL),(221,'Nombre Valido',NULL,_binary 'cliente216@test.com','2025-08-02 21:50:22',NULL,NULL),(222,'Nombre Valido',NULL,_binary 'cliente217@test.com','2025-08-02 21:50:22',NULL,NULL),(223,'Nombre Valido',NULL,_binary 'cliente218@test.com','2025-08-02 21:50:22',NULL,NULL),(224,'Nombre Valido',NULL,_binary 'cliente219@test.com','2025-08-02 21:50:22',NULL,NULL),(225,'Nombre Valido',NULL,_binary 'cliente220@test.com','2025-08-02 21:50:22',NULL,NULL),(226,'Nombre Valido',NULL,_binary 'cliente221@test.com','2025-08-02 21:50:22',NULL,NULL),(227,'Nombre Valido',NULL,_binary 'cliente222@test.com','2025-08-02 21:50:22',NULL,NULL),(228,'Nombre Valido',NULL,_binary 'cliente223@test.com','2025-08-02 21:50:22',NULL,NULL),(229,'Nombre Valido',NULL,_binary 'cliente224@test.com','2025-08-02 21:50:22',NULL,NULL),(230,'Nombre Valido',NULL,_binary 'cliente225@test.com','2025-08-02 21:50:22',NULL,NULL),(231,'Nombre Valido',NULL,_binary 'cliente226@test.com','2025-08-02 21:50:22',NULL,NULL),(232,'Nombre Valido',NULL,_binary 'cliente227@test.com','2025-08-02 21:50:22',NULL,NULL),(233,'Nombre Valido',NULL,_binary 'cliente228@test.com','2025-08-02 21:50:22',NULL,NULL),(234,'Nombre Valido',NULL,_binary 'cliente229@test.com','2025-08-02 21:50:22',NULL,NULL),(235,'Nombre Valido',NULL,_binary 'cliente230@test.com','2025-08-02 21:50:22',NULL,NULL),(236,'Nombre Valido',NULL,_binary 'cliente231@test.com','2025-08-02 21:50:22',NULL,NULL),(237,'Nombre Valido',NULL,_binary 'cliente232@test.com','2025-08-02 21:50:22',NULL,NULL),(238,'Nombre Valido',NULL,_binary 'cliente233@test.com','2025-08-02 21:50:22',NULL,NULL),(239,'Nombre Valido',NULL,_binary 'cliente234@test.com','2025-08-02 21:50:22',NULL,NULL),(240,'Nombre Valido',NULL,_binary 'cliente235@test.com','2025-08-02 21:50:22',NULL,NULL),(241,'Nombre Valido',NULL,_binary 'cliente236@test.com','2025-08-02 21:50:22',NULL,NULL),(242,'Nombre Valido',NULL,_binary 'cliente237@test.com','2025-08-02 21:50:22',NULL,NULL),(243,'Nombre Valido',NULL,_binary 'cliente238@test.com','2025-08-02 21:50:22',NULL,NULL),(244,'Nombre Valido',NULL,_binary 'cliente239@test.com','2025-08-02 21:50:22',NULL,NULL),(245,'Nombre Valido',NULL,_binary 'cliente240@test.com','2025-08-02 21:50:22',NULL,NULL),(246,'Nombre Valido',NULL,_binary 'cliente241@test.com','2025-08-02 21:50:22',NULL,NULL),(247,'Nombre Valido',NULL,_binary 'cliente242@test.com','2025-08-02 21:50:22',NULL,NULL),(248,'Nombre Valido',NULL,_binary 'cliente243@test.com','2025-08-02 21:50:22',NULL,NULL),(249,'Nombre Valido',NULL,_binary 'cliente244@test.com','2025-08-02 21:50:22',NULL,NULL),(250,'Nombre Valido',NULL,_binary 'cliente245@test.com','2025-08-02 21:50:22',NULL,NULL),(251,'Nombre Valido',NULL,_binary 'cliente246@test.com','2025-08-02 21:50:22',NULL,NULL),(252,'Nombre Valido',NULL,_binary 'cliente247@test.com','2025-08-02 21:50:22',NULL,NULL),(253,'Nombre Valido',NULL,_binary 'cliente248@test.com','2025-08-02 21:50:22',NULL,NULL),(254,'Nombre Valido',NULL,_binary 'cliente249@test.com','2025-08-02 21:50:22',NULL,NULL),(255,'Nombre Valido',NULL,_binary 'cliente250@test.com','2025-08-02 21:50:22',NULL,NULL),(256,'Nombre Valido',NULL,_binary 'cliente251@test.com','2025-08-02 21:50:22',NULL,NULL),(257,'Nombre Valido',NULL,_binary 'cliente252@test.com','2025-08-02 21:50:22',NULL,NULL),(258,'Nombre Valido',NULL,_binary 'cliente253@test.com','2025-08-02 21:50:22',NULL,NULL),(259,'Nombre Valido',NULL,_binary 'cliente254@test.com','2025-08-02 21:50:22',NULL,NULL),(260,'Nombre Valido',NULL,_binary 'cliente255@test.com','2025-08-02 21:50:22',NULL,NULL),(261,'Nombre Valido',NULL,_binary 'cliente256@test.com','2025-08-02 21:50:22',NULL,NULL),(262,'Nombre Valido',NULL,_binary 'cliente257@test.com','2025-08-02 21:50:22',NULL,NULL),(263,'Nombre Valido',NULL,_binary 'cliente258@test.com','2025-08-02 21:50:22',NULL,NULL),(264,'Nombre Valido',NULL,_binary 'cliente259@test.com','2025-08-02 21:50:22',NULL,NULL),(265,'Nombre Valido',NULL,_binary 'cliente260@test.com','2025-08-02 21:50:22',NULL,NULL),(266,'Nombre Valido',NULL,_binary 'cliente261@test.com','2025-08-02 21:50:22',NULL,NULL),(267,'Nombre Valido',NULL,_binary 'cliente262@test.com','2025-08-02 21:50:22',NULL,NULL),(268,'Nombre Valido',NULL,_binary 'cliente263@test.com','2025-08-02 21:50:22',NULL,NULL),(269,'Nombre Valido',NULL,_binary 'cliente264@test.com','2025-08-02 21:50:22',NULL,NULL),(270,'Nombre Valido',NULL,_binary 'cliente265@test.com','2025-08-02 21:50:22',NULL,NULL),(271,'Nombre Valido',NULL,_binary 'cliente266@test.com','2025-08-02 21:50:22',NULL,NULL),(272,'Nombre Valido',NULL,_binary 'cliente267@test.com','2025-08-02 21:50:22',NULL,NULL),(273,'Nombre Valido',NULL,_binary 'cliente268@test.com','2025-08-02 21:50:22',NULL,NULL),(274,'Nombre Valido',NULL,_binary 'cliente269@test.com','2025-08-02 21:50:22',NULL,NULL),(275,'Nombre Valido',NULL,_binary 'cliente270@test.com','2025-08-02 21:50:22',NULL,NULL),(276,'Nombre Valido',NULL,_binary 'cliente271@test.com','2025-08-02 21:50:22',NULL,NULL),(277,'Nombre Valido',NULL,_binary 'cliente272@test.com','2025-08-02 21:50:22',NULL,NULL),(278,'Nombre Valido',NULL,_binary 'cliente273@test.com','2025-08-02 21:50:22',NULL,NULL),(279,'Nombre Valido',NULL,_binary 'cliente274@test.com','2025-08-02 21:50:22',NULL,NULL),(280,'Nombre Valido',NULL,_binary 'cliente275@test.com','2025-08-02 21:50:22',NULL,NULL),(281,'Nombre Valido',NULL,_binary 'cliente276@test.com','2025-08-02 21:50:22',NULL,NULL),(282,'Nombre Valido',NULL,_binary 'cliente277@test.com','2025-08-02 21:50:22',NULL,NULL),(283,'Nombre Valido',NULL,_binary 'cliente278@test.com','2025-08-02 21:50:22',NULL,NULL),(284,'Nombre Valido',NULL,_binary 'cliente279@test.com','2025-08-02 21:50:22',NULL,NULL),(285,'Nombre Valido',NULL,_binary 'cliente280@test.com','2025-08-02 21:50:22',NULL,NULL),(286,'Nombre Valido',NULL,_binary 'cliente281@test.com','2025-08-02 21:50:22',NULL,NULL),(287,'Nombre Valido',NULL,_binary 'cliente282@test.com','2025-08-02 21:50:22',NULL,NULL),(288,'Nombre Valido',NULL,_binary 'cliente283@test.com','2025-08-02 21:50:22',NULL,NULL),(289,'Nombre Valido',NULL,_binary 'cliente284@test.com','2025-08-02 21:50:22',NULL,NULL),(290,'Nombre Valido',NULL,_binary 'cliente285@test.com','2025-08-02 21:50:22',NULL,NULL),(291,'Nombre Valido',NULL,_binary 'cliente286@test.com','2025-08-02 21:50:22',NULL,NULL),(292,'Nombre Valido',NULL,_binary 'cliente287@test.com','2025-08-02 21:50:22',NULL,NULL),(293,'Nombre Valido',NULL,_binary 'cliente288@test.com','2025-08-02 21:50:22',NULL,NULL),(294,'Nombre Valido',NULL,_binary 'cliente289@test.com','2025-08-02 21:50:22',NULL,NULL),(295,'Nombre Valido',NULL,_binary 'cliente290@test.com','2025-08-02 21:50:22',NULL,NULL),(296,'Nombre Valido',NULL,_binary 'cliente291@test.com','2025-08-02 21:50:22',NULL,NULL),(297,'Nombre Valido',NULL,_binary 'cliente292@test.com','2025-08-02 21:50:22',NULL,NULL),(298,'Nombre Valido',NULL,_binary 'cliente293@test.com','2025-08-02 21:50:22',NULL,NULL),(299,'Nombre Valido',NULL,_binary 'cliente294@test.com','2025-08-02 21:50:22',NULL,NULL),(300,'Nombre Valido',NULL,_binary 'cliente295@test.com','2025-08-02 21:50:22',NULL,NULL),(301,'Nombre Valido',NULL,_binary 'cliente296@test.com','2025-08-02 21:50:22',NULL,NULL),(302,'Nombre Valido',NULL,_binary 'cliente297@test.com','2025-08-02 21:50:22',NULL,NULL),(303,'Nombre Valido',NULL,_binary 'cliente298@test.com','2025-08-02 21:50:22',NULL,NULL),(304,'Nombre Valido',NULL,_binary 'cliente299@test.com','2025-08-02 21:50:22',NULL,NULL),(305,'Nombre Valido',NULL,_binary 'cliente300@test.com','2025-08-02 21:50:22',NULL,NULL),(306,'Nombre Valido',NULL,_binary 'cliente301@test.com','2025-08-02 21:50:22',NULL,NULL),(307,'Nombre Valido',NULL,_binary 'cliente302@test.com','2025-08-02 21:50:22',NULL,NULL),(308,'Nombre Valido',NULL,_binary 'cliente303@test.com','2025-08-02 21:50:22',NULL,NULL),(309,'Nombre Valido',NULL,_binary 'cliente304@test.com','2025-08-02 21:50:22',NULL,NULL),(310,'Nombre Valido',NULL,_binary 'cliente305@test.com','2025-08-02 21:50:22',NULL,NULL),(311,'Nombre Valido',NULL,_binary 'cliente306@test.com','2025-08-02 21:50:22',NULL,NULL),(312,'Nombre Valido',NULL,_binary 'cliente307@test.com','2025-08-02 21:50:22',NULL,NULL),(313,'Nombre Valido',NULL,_binary 'cliente308@test.com','2025-08-02 21:50:22',NULL,NULL),(314,'Nombre Valido',NULL,_binary 'cliente309@test.com','2025-08-02 21:50:22',NULL,NULL),(315,'Nombre Valido',NULL,_binary 'cliente310@test.com','2025-08-02 21:50:22',NULL,NULL),(316,'Nombre Valido',NULL,_binary 'cliente311@test.com','2025-08-02 21:50:22',NULL,NULL),(317,'Nombre Valido',NULL,_binary 'cliente312@test.com','2025-08-02 21:50:22',NULL,NULL),(318,'Nombre Valido',NULL,_binary 'cliente313@test.com','2025-08-02 21:50:22',NULL,NULL),(319,'Nombre Valido',NULL,_binary 'cliente314@test.com','2025-08-02 21:50:22',NULL,NULL),(320,'Nombre Valido',NULL,_binary 'cliente315@test.com','2025-08-02 21:50:22',NULL,NULL),(321,'Nombre Valido',NULL,_binary 'cliente316@test.com','2025-08-02 21:50:22',NULL,NULL),(322,'Nombre Valido',NULL,_binary 'cliente317@test.com','2025-08-02 21:50:22',NULL,NULL),(323,'Nombre Valido',NULL,_binary 'cliente318@test.com','2025-08-02 21:50:22',NULL,NULL),(324,'Nombre Valido',NULL,_binary 'cliente319@test.com','2025-08-02 21:50:22',NULL,NULL),(325,'Nombre Valido',NULL,_binary 'cliente320@test.com','2025-08-02 21:50:22',NULL,NULL),(326,'Nombre Valido',NULL,_binary 'cliente321@test.com','2025-08-02 21:50:22',NULL,NULL),(327,'Nombre Valido',NULL,_binary 'cliente322@test.com','2025-08-02 21:50:22',NULL,NULL),(328,'Nombre Valido',NULL,_binary 'cliente323@test.com','2025-08-02 21:50:23',NULL,NULL),(329,'Nombre Valido',NULL,_binary 'cliente324@test.com','2025-08-02 21:50:23',NULL,NULL),(330,'Nombre Valido',NULL,_binary 'cliente325@test.com','2025-08-02 21:50:23',NULL,NULL),(331,'Nombre Valido',NULL,_binary 'cliente326@test.com','2025-08-02 21:50:23',NULL,NULL),(332,'Nombre Valido',NULL,_binary 'cliente327@test.com','2025-08-02 21:50:23',NULL,NULL),(333,'Nombre Valido',NULL,_binary 'cliente328@test.com','2025-08-02 21:50:23',NULL,NULL),(334,'Nombre Valido',NULL,_binary 'cliente329@test.com','2025-08-02 21:50:23',NULL,NULL),(335,'Nombre Valido',NULL,_binary 'cliente330@test.com','2025-08-02 21:50:23',NULL,NULL),(336,'Nombre Valido',NULL,_binary 'cliente331@test.com','2025-08-02 21:50:23',NULL,NULL),(337,'Nombre Valido',NULL,_binary 'cliente332@test.com','2025-08-02 21:50:23',NULL,NULL),(338,'Nombre Valido',NULL,_binary 'cliente333@test.com','2025-08-02 21:50:23',NULL,NULL),(339,'Nombre Valido',NULL,_binary 'cliente334@test.com','2025-08-02 21:50:23',NULL,NULL),(340,'Nombre Valido',NULL,_binary 'cliente335@test.com','2025-08-02 21:50:23',NULL,NULL),(341,'Nombre Valido',NULL,_binary 'cliente336@test.com','2025-08-02 21:50:23',NULL,NULL),(342,'Nombre Valido',NULL,_binary 'cliente337@test.com','2025-08-02 21:50:23',NULL,NULL),(343,'Nombre Valido',NULL,_binary 'cliente338@test.com','2025-08-02 21:50:23',NULL,NULL),(344,'Nombre Valido',NULL,_binary 'cliente339@test.com','2025-08-02 21:50:23',NULL,NULL),(345,'Nombre Valido',NULL,_binary 'cliente340@test.com','2025-08-02 21:50:23',NULL,NULL),(346,'Nombre Valido',NULL,_binary 'cliente341@test.com','2025-08-02 21:50:23',NULL,NULL),(347,'Nombre Valido',NULL,_binary 'cliente342@test.com','2025-08-02 21:50:23',NULL,NULL),(348,'Nombre Valido',NULL,_binary 'cliente343@test.com','2025-08-02 21:50:23',NULL,NULL),(349,'Nombre Valido',NULL,_binary 'cliente344@test.com','2025-08-02 21:50:23',NULL,NULL),(350,'Nombre Valido',NULL,_binary 'cliente345@test.com','2025-08-02 21:50:23',NULL,NULL),(351,'Nombre Valido',NULL,_binary 'cliente346@test.com','2025-08-02 21:50:23',NULL,NULL),(352,'Nombre Valido',NULL,_binary 'cliente347@test.com','2025-08-02 21:50:23',NULL,NULL),(353,'Nombre Valido',NULL,_binary 'cliente348@test.com','2025-08-02 21:50:23',NULL,NULL),(354,'Nombre Valido',NULL,_binary 'cliente349@test.com','2025-08-02 21:50:23',NULL,NULL),(355,'Nombre Valido',NULL,_binary 'cliente350@test.com','2025-08-02 21:50:23',NULL,NULL),(356,'Nombre Valido',NULL,_binary 'cliente351@test.com','2025-08-02 21:50:23',NULL,NULL),(357,'Nombre Valido',NULL,_binary 'cliente352@test.com','2025-08-02 21:50:23',NULL,NULL),(358,'Nombre Valido',NULL,_binary 'cliente353@test.com','2025-08-02 21:50:23',NULL,NULL),(359,'Nombre Valido',NULL,_binary 'cliente354@test.com','2025-08-02 21:50:23',NULL,NULL),(360,'Nombre Valido',NULL,_binary 'cliente355@test.com','2025-08-02 21:50:23',NULL,NULL),(361,'Nombre Valido',NULL,_binary 'cliente356@test.com','2025-08-02 21:50:23',NULL,NULL),(362,'Nombre Valido',NULL,_binary 'cliente357@test.com','2025-08-02 21:50:23',NULL,NULL),(363,'Nombre Valido',NULL,_binary 'cliente358@test.com','2025-08-02 21:50:23',NULL,NULL),(364,'Nombre Valido',NULL,_binary 'cliente359@test.com','2025-08-02 21:50:23',NULL,NULL),(365,'Nombre Valido',NULL,_binary 'cliente360@test.com','2025-08-02 21:50:23',NULL,NULL),(366,'Nombre Valido',NULL,_binary 'cliente361@test.com','2025-08-02 21:50:23',NULL,NULL),(367,'Nombre Valido',NULL,_binary 'cliente362@test.com','2025-08-02 21:50:23',NULL,NULL),(368,'Nombre Valido',NULL,_binary 'cliente363@test.com','2025-08-02 21:50:23',NULL,NULL),(369,'Nombre Valido',NULL,_binary 'cliente364@test.com','2025-08-02 21:50:23',NULL,NULL),(370,'Nombre Valido',NULL,_binary 'cliente365@test.com','2025-08-02 21:50:23',NULL,NULL),(371,'Nombre Valido',NULL,_binary 'cliente366@test.com','2025-08-02 21:50:23',NULL,NULL),(372,'Nombre Valido',NULL,_binary 'cliente367@test.com','2025-08-02 21:50:23',NULL,NULL),(373,'Nombre Valido',NULL,_binary 'cliente368@test.com','2025-08-02 21:50:23',NULL,NULL),(374,'Nombre Valido',NULL,_binary 'cliente369@test.com','2025-08-02 21:50:23',NULL,NULL),(375,'Nombre Valido',NULL,_binary 'cliente370@test.com','2025-08-02 21:50:23',NULL,NULL),(376,'Nombre Valido',NULL,_binary 'cliente371@test.com','2025-08-02 21:50:23',NULL,NULL),(377,'Nombre Valido',NULL,_binary 'cliente372@test.com','2025-08-02 21:50:23',NULL,NULL),(378,'Nombre Valido',NULL,_binary 'cliente373@test.com','2025-08-02 21:50:23',NULL,NULL),(379,'Nombre Valido',NULL,_binary 'cliente374@test.com','2025-08-02 21:50:23',NULL,NULL),(380,'Nombre Valido',NULL,_binary 'cliente375@test.com','2025-08-02 21:50:23',NULL,NULL),(381,'Nombre Valido',NULL,_binary 'cliente376@test.com','2025-08-02 21:50:23',NULL,NULL),(382,'Nombre Valido',NULL,_binary 'cliente377@test.com','2025-08-02 21:50:23',NULL,NULL),(383,'Nombre Valido',NULL,_binary 'cliente378@test.com','2025-08-02 21:50:23',NULL,NULL),(384,'Nombre Valido',NULL,_binary 'cliente379@test.com','2025-08-02 21:50:23',NULL,NULL),(385,'Nombre Valido',NULL,_binary 'cliente380@test.com','2025-08-02 21:50:23',NULL,NULL),(386,'Nombre Valido',NULL,_binary 'cliente381@test.com','2025-08-02 21:50:23',NULL,NULL),(387,'Nombre Valido',NULL,_binary 'cliente382@test.com','2025-08-02 21:50:23',NULL,NULL),(388,'Nombre Valido',NULL,_binary 'cliente383@test.com','2025-08-02 21:50:23',NULL,NULL),(389,'Nombre Valido',NULL,_binary 'cliente384@test.com','2025-08-02 21:50:23',NULL,NULL),(390,'Nombre Valido',NULL,_binary 'cliente385@test.com','2025-08-02 21:50:23',NULL,NULL),(391,'Nombre Valido',NULL,_binary 'cliente386@test.com','2025-08-02 21:50:23',NULL,NULL),(392,'Nombre Valido',NULL,_binary 'cliente387@test.com','2025-08-02 21:50:23',NULL,NULL),(393,'Nombre Valido',NULL,_binary 'cliente388@test.com','2025-08-02 21:50:23',NULL,NULL),(394,'Nombre Valido',NULL,_binary 'cliente389@test.com','2025-08-02 21:50:23',NULL,NULL),(395,'Nombre Valido',NULL,_binary 'cliente390@test.com','2025-08-02 21:50:23',NULL,NULL),(396,'Nombre Valido',NULL,_binary 'cliente391@test.com','2025-08-02 21:50:23',NULL,NULL),(397,'Nombre Valido',NULL,_binary 'cliente392@test.com','2025-08-02 21:50:23',NULL,NULL),(398,'Nombre Valido',NULL,_binary 'cliente393@test.com','2025-08-02 21:50:23',NULL,NULL),(399,'Nombre Valido',NULL,_binary 'cliente394@test.com','2025-08-02 21:50:23',NULL,NULL),(400,'Nombre Valido',NULL,_binary 'cliente395@test.com','2025-08-02 21:50:23',NULL,NULL),(401,'Nombre Valido',NULL,_binary 'cliente396@test.com','2025-08-02 21:50:23',NULL,NULL),(402,'Nombre Valido',NULL,_binary 'cliente397@test.com','2025-08-02 21:50:23',NULL,NULL),(403,'Nombre Valido',NULL,_binary 'cliente398@test.com','2025-08-02 21:50:23',NULL,NULL),(404,'Nombre Valido',NULL,_binary 'cliente399@test.com','2025-08-02 21:50:23',NULL,NULL),(405,'Nombre Valido',NULL,_binary 'cliente400@test.com','2025-08-02 21:50:23',NULL,NULL),(406,'Nombre Valido',NULL,_binary 'cliente401@test.com','2025-08-02 21:50:23',NULL,NULL),(407,'Nombre Valido',NULL,_binary 'cliente402@test.com','2025-08-02 21:50:23',NULL,NULL),(408,'Nombre Valido',NULL,_binary 'cliente403@test.com','2025-08-02 21:50:23',NULL,NULL),(409,'Nombre Valido',NULL,_binary 'cliente404@test.com','2025-08-02 21:50:23',NULL,NULL),(410,'Nombre Valido',NULL,_binary 'cliente405@test.com','2025-08-02 21:50:23',NULL,NULL),(411,'Nombre Valido',NULL,_binary 'cliente406@test.com','2025-08-02 21:50:23',NULL,NULL),(412,'Nombre Valido',NULL,_binary 'cliente407@test.com','2025-08-02 21:50:23',NULL,NULL),(413,'Nombre Valido',NULL,_binary 'cliente408@test.com','2025-08-02 21:50:23',NULL,NULL),(414,'Nombre Valido',NULL,_binary 'cliente409@test.com','2025-08-02 21:50:23',NULL,NULL),(415,'Nombre Valido',NULL,_binary 'cliente410@test.com','2025-08-02 21:50:23',NULL,NULL),(416,'Nombre Valido',NULL,_binary 'cliente411@test.com','2025-08-02 21:50:23',NULL,NULL),(417,'Nombre Valido',NULL,_binary 'cliente412@test.com','2025-08-02 21:50:23',NULL,NULL),(418,'Nombre Valido',NULL,_binary 'cliente413@test.com','2025-08-02 21:50:23',NULL,NULL),(419,'Nombre Valido',NULL,_binary 'cliente414@test.com','2025-08-02 21:50:23',NULL,NULL),(420,'Nombre Valido',NULL,_binary 'cliente415@test.com','2025-08-02 21:50:23',NULL,NULL),(421,'Nombre Valido',NULL,_binary 'cliente416@test.com','2025-08-02 21:50:23',NULL,NULL),(422,'Nombre Valido',NULL,_binary 'cliente417@test.com','2025-08-02 21:50:23',NULL,NULL),(423,'Nombre Valido',NULL,_binary 'cliente418@test.com','2025-08-02 21:50:23',NULL,NULL),(424,'Nombre Valido',NULL,_binary 'cliente419@test.com','2025-08-02 21:50:23',NULL,NULL),(425,'Nombre Valido',NULL,_binary 'cliente420@test.com','2025-08-02 21:50:23',NULL,NULL),(426,'Nombre Valido',NULL,_binary 'cliente421@test.com','2025-08-02 21:50:23',NULL,NULL),(427,'Nombre Valido',NULL,_binary 'cliente422@test.com','2025-08-02 21:50:23',NULL,NULL),(428,'Nombre Valido',NULL,_binary 'cliente423@test.com','2025-08-02 21:50:23',NULL,NULL),(429,'Nombre Valido',NULL,_binary 'cliente424@test.com','2025-08-02 21:50:23',NULL,NULL),(430,'Nombre Valido',NULL,_binary 'cliente425@test.com','2025-08-02 21:50:23',NULL,NULL),(431,'Nombre Valido',NULL,_binary 'cliente426@test.com','2025-08-02 21:50:23',NULL,NULL),(432,'Nombre Valido',NULL,_binary 'cliente427@test.com','2025-08-02 21:50:23',NULL,NULL),(433,'Nombre Valido',NULL,_binary 'cliente428@test.com','2025-08-02 21:50:23',NULL,NULL),(434,'Nombre Valido',NULL,_binary 'cliente429@test.com','2025-08-02 21:50:23',NULL,NULL),(435,'Nombre Valido',NULL,_binary 'cliente430@test.com','2025-08-02 21:50:23',NULL,NULL),(436,'Nombre Valido',NULL,_binary 'cliente431@test.com','2025-08-02 21:50:23',NULL,NULL),(437,'Nombre Valido',NULL,_binary 'cliente432@test.com','2025-08-02 21:50:23',NULL,NULL),(438,'Nombre Valido',NULL,_binary 'cliente433@test.com','2025-08-02 21:50:23',NULL,NULL),(439,'Nombre Valido',NULL,_binary 'cliente434@test.com','2025-08-02 21:50:23',NULL,NULL),(440,'Nombre Valido',NULL,_binary 'cliente435@test.com','2025-08-02 21:50:23',NULL,NULL),(441,'Nombre Valido',NULL,_binary 'cliente436@test.com','2025-08-02 21:50:23',NULL,NULL),(442,'Nombre Valido',NULL,_binary 'cliente437@test.com','2025-08-02 21:50:23',NULL,NULL),(443,'Nombre Valido',NULL,_binary 'cliente438@test.com','2025-08-02 21:50:23',NULL,NULL),(444,'Nombre Valido',NULL,_binary 'cliente439@test.com','2025-08-02 21:50:23',NULL,NULL),(445,'Nombre Valido',NULL,_binary 'cliente440@test.com','2025-08-02 21:50:23',NULL,NULL),(446,'Nombre Valido',NULL,_binary 'cliente441@test.com','2025-08-02 21:50:23',NULL,NULL),(447,'Nombre Valido',NULL,_binary 'cliente442@test.com','2025-08-02 21:50:23',NULL,NULL),(448,'Nombre Valido',NULL,_binary 'cliente443@test.com','2025-08-02 21:50:23',NULL,NULL),(449,'Nombre Valido',NULL,_binary 'cliente444@test.com','2025-08-02 21:50:23',NULL,NULL),(450,'Nombre Valido',NULL,_binary 'cliente445@test.com','2025-08-02 21:50:23',NULL,NULL),(451,'Nombre Valido',NULL,_binary 'cliente446@test.com','2025-08-02 21:50:23',NULL,NULL),(452,'Nombre Valido',NULL,_binary 'cliente447@test.com','2025-08-02 21:50:23',NULL,NULL),(453,'Nombre Valido',NULL,_binary 'cliente448@test.com','2025-08-02 21:50:23',NULL,NULL),(454,'Nombre Valido',NULL,_binary 'cliente449@test.com','2025-08-02 21:50:23',NULL,NULL),(455,'Nombre Valido',NULL,_binary 'cliente450@test.com','2025-08-02 21:50:23',NULL,NULL),(456,'Nombre Valido',NULL,_binary 'cliente451@test.com','2025-08-02 21:50:23',NULL,NULL),(457,'Nombre Valido',NULL,_binary 'cliente452@test.com','2025-08-02 21:50:23',NULL,NULL),(458,'Nombre Valido',NULL,_binary 'cliente453@test.com','2025-08-02 21:50:23',NULL,NULL),(459,'Nombre Valido',NULL,_binary 'cliente454@test.com','2025-08-02 21:50:23',NULL,NULL),(460,'Nombre Valido',NULL,_binary 'cliente455@test.com','2025-08-02 21:50:23',NULL,NULL),(461,'Nombre Valido',NULL,_binary 'cliente456@test.com','2025-08-02 21:50:23',NULL,NULL),(462,'Nombre Valido',NULL,_binary 'cliente457@test.com','2025-08-02 21:50:23',NULL,NULL),(463,'Nombre Valido',NULL,_binary 'cliente458@test.com','2025-08-02 21:50:23',NULL,NULL),(464,'Nombre Valido',NULL,_binary 'cliente459@test.com','2025-08-02 21:50:23',NULL,NULL),(465,'Nombre Valido',NULL,_binary 'cliente460@test.com','2025-08-02 21:50:23',NULL,NULL),(466,'Nombre Valido',NULL,_binary 'cliente461@test.com','2025-08-02 21:50:23',NULL,NULL),(467,'Nombre Valido',NULL,_binary 'cliente462@test.com','2025-08-02 21:50:23',NULL,NULL),(468,'Nombre Valido',NULL,_binary 'cliente463@test.com','2025-08-02 21:50:23',NULL,NULL),(469,'Nombre Valido',NULL,_binary 'cliente464@test.com','2025-08-02 21:50:23',NULL,NULL),(470,'Nombre Valido',NULL,_binary 'cliente465@test.com','2025-08-02 21:50:23',NULL,NULL),(471,'Nombre Valido',NULL,_binary 'cliente466@test.com','2025-08-02 21:50:23',NULL,NULL),(472,'Nombre Valido',NULL,_binary 'cliente467@test.com','2025-08-02 21:50:23',NULL,NULL),(473,'Nombre Valido',NULL,_binary 'cliente468@test.com','2025-08-02 21:50:23',NULL,NULL),(474,'Nombre Valido',NULL,_binary 'cliente469@test.com','2025-08-02 21:50:23',NULL,NULL),(475,'Nombre Valido',NULL,_binary 'cliente470@test.com','2025-08-02 21:50:23',NULL,NULL),(476,'Nombre Valido',NULL,_binary 'cliente471@test.com','2025-08-02 21:50:23',NULL,NULL),(477,'Nombre Valido',NULL,_binary 'cliente472@test.com','2025-08-02 21:50:23',NULL,NULL),(478,'Nombre Valido',NULL,_binary 'cliente473@test.com','2025-08-02 21:50:23',NULL,NULL),(479,'Nombre Valido',NULL,_binary 'cliente474@test.com','2025-08-02 21:50:23',NULL,NULL),(480,'Nombre Valido',NULL,_binary 'cliente475@test.com','2025-08-02 21:50:23',NULL,NULL),(481,'Nombre Valido',NULL,_binary 'cliente476@test.com','2025-08-02 21:50:23',NULL,NULL),(482,'Nombre Valido',NULL,_binary 'cliente477@test.com','2025-08-02 21:50:23',NULL,NULL),(483,'Nombre Valido',NULL,_binary 'cliente478@test.com','2025-08-02 21:50:23',NULL,NULL),(484,'Nombre Valido',NULL,_binary 'cliente479@test.com','2025-08-02 21:50:23',NULL,NULL),(485,'Nombre Valido',NULL,_binary 'cliente480@test.com','2025-08-02 21:50:23',NULL,NULL),(486,'Nombre Valido',NULL,_binary 'cliente481@test.com','2025-08-02 21:50:23',NULL,NULL),(487,'Nombre Valido',NULL,_binary 'cliente482@test.com','2025-08-02 21:50:23',NULL,NULL),(488,'Nombre Valido',NULL,_binary 'cliente483@test.com','2025-08-02 21:50:23',NULL,NULL),(489,'Nombre Valido',NULL,_binary 'cliente484@test.com','2025-08-02 21:50:23',NULL,NULL),(490,'Nombre Valido',NULL,_binary 'cliente485@test.com','2025-08-02 21:50:23',NULL,NULL),(491,'Nombre Valido',NULL,_binary 'cliente486@test.com','2025-08-02 21:50:23',NULL,NULL),(492,'Nombre Valido',NULL,_binary 'cliente487@test.com','2025-08-02 21:50:23',NULL,NULL),(493,'Nombre Valido',NULL,_binary 'cliente488@test.com','2025-08-02 21:50:23',NULL,NULL),(494,'Nombre Valido',NULL,_binary 'cliente489@test.com','2025-08-02 21:50:23',NULL,NULL),(495,'Nombre Valido',NULL,_binary 'cliente490@test.com','2025-08-02 21:50:23',NULL,NULL),(496,'Nombre Valido',NULL,_binary 'cliente491@test.com','2025-08-02 21:50:23',NULL,NULL),(497,'Nombre Valido',NULL,_binary 'cliente492@test.com','2025-08-02 21:50:23',NULL,NULL),(498,'Nombre Valido',NULL,_binary 'cliente493@test.com','2025-08-02 21:50:23',NULL,NULL),(499,'Nombre Valido',NULL,_binary 'cliente494@test.com','2025-08-02 21:50:23',NULL,NULL),(500,'Nombre Valido',NULL,_binary 'cliente495@test.com','2025-08-02 21:50:23',NULL,NULL),(501,'Nombre Valido',NULL,_binary 'cliente496@test.com','2025-08-02 21:50:23',NULL,NULL),(502,'Nombre Valido',NULL,_binary 'cliente497@test.com','2025-08-02 21:50:23',NULL,NULL),(503,'Nombre Valido',NULL,_binary 'cliente498@test.com','2025-08-02 21:50:23',NULL,NULL),(504,'Nombre Valido',NULL,_binary 'cliente499@test.com','2025-08-02 21:50:23',NULL,NULL),(505,'Nombre Valido',NULL,_binary 'cliente500@test.com','2025-08-02 21:50:23',NULL,NULL),(506,'Sabrina',NULL,_binary '´\Ë\¬\”\Â®\’˙q”Ö\ƒ\Œ\\p\ˆ’Ö˝>S![)\09','2025-08-02 22:34:36',NULL,NULL),(507,'Nuevo Cliente',NULL,_binary '˙<\'\œ1áÜwAüƒ∏\Õ,','2025-08-03 00:28:26',NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_clientes_update_hash` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN
  SET NEW.version_hash = SHA2(CONCAT(NEW.nombre, NEW.correo), 256);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_clientes_delete` AFTER DELETE ON `clientes` FOR EACH ROW BEGIN
    INSERT INTO log_acciones (
        usuario,
        ip_origen,
        accion,
        tabla_afectada,
        id_afectado,
        terminal,
        rol_activo,
        transaccion
    ) VALUES (
        CURRENT_USER(),
        @ip_actual,
        'DELETE',
        'clientes',
        OLD.id_cliente,
        @terminal_actual,
        CURRENT_ROLE(),
        CONCAT('DELETE FROM clientes WHERE id_cliente=', OLD.id_cliente)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comandas`
--

DROP TABLE IF EXISTS `comandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comandas` (
  `id_comanda` int NOT NULL AUTO_INCREMENT,
  `id_mesa` int NOT NULL,
  `id_empleado` int NOT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(30) DEFAULT 'solicitado',
  PRIMARY KEY (`id_comanda`),
  KEY `id_mesa` (`id_mesa`),
  KEY `idx_comandas_id_empleado` (`id_empleado`),
  KEY `idx_comandas_estado` (`estado`),
  CONSTRAINT `comandas_ibfk_1` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`),
  CONSTRAINT `comandas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `comandas_chk_1` CHECK ((`estado` in (_utf8mb4'solicitado',_utf8mb4'en cocina',_utf8mb4'servido',_utf8mb4'cancelado')))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandas`
--

LOCK TABLES `comandas` WRITE;
/*!40000 ALTER TABLE `comandas` DISABLE KEYS */;
INSERT INTO `comandas` VALUES (1,1,1,'2025-08-02 16:21:30','solicitado'),(2,2,1,'2025-08-02 16:21:30','en cocina'),(3,3,2,'2025-08-02 16:21:30','servido'),(4,4,1,'2025-08-02 16:21:30','cancelado'),(5,5,2,'2025-08-02 16:21:30','solicitado'),(6,6,1,'2025-08-02 16:33:01','solicitado');
/*!40000 ALTER TABLE `comandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_comanda`
--

DROP TABLE IF EXISTS `detalle_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_comanda` (
  `id_comanda` int NOT NULL,
  `id_plato` int NOT NULL,
  `cantidad` int NOT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_comanda`,`id_plato`),
  KEY `id_plato` (`id_plato`),
  CONSTRAINT `detalle_comanda_ibfk_1` FOREIGN KEY (`id_comanda`) REFERENCES `comandas` (`id_comanda`) ON DELETE CASCADE,
  CONSTRAINT `detalle_comanda_ibfk_2` FOREIGN KEY (`id_plato`) REFERENCES `platos` (`id_plato`),
  CONSTRAINT `detalle_comanda_chk_1` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_comanda`
--

LOCK TABLES `detalle_comanda` WRITE;
/*!40000 ALTER TABLE `detalle_comanda` DISABLE KEYS */;
INSERT INTO `detalle_comanda` VALUES (1,1,2,'sin cebolla'),(1,4,2,NULL),(1,5,4,'Extra queso, sin cebolla. | adici√≥n: Extra queso, sin cebolla.'),(2,2,1,'sin picante'),(3,3,3,'extra dulce'),(4,5,1,NULL),(6,1,2,NULL);
/*!40000 ALTER TABLE `detalle_comanda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_baja_stock_comanda` AFTER INSERT ON `detalle_comanda` FOR EACH ROW begin
    -- declarar variables para usar en el cursor
    declare v_id_ingrediente int;
    declare v_cantidad_necesaria decimal(6,2);
    declare v_fin int default 0;

    -- cursor para recorrer los ingredientes del plato solicitado
    declare cur_ingredientes cursor for
        select id_ingrediente, cantidad 
        from plato_ingredientes 
        where id_plato = new.id_plato;

    -- handler para saber cu√°ndo el cursor ha terminado
    declare continue handler for not found set v_fin = 1;

    open cur_ingredientes;

    loop_ingredientes: loop
        fetch cur_ingredientes into v_id_ingrediente, v_cantidad_necesaria;
        
        if v_fin = 1 then
            leave loop_ingredientes;
        end if;

        -- 1. actualizar el stock del ingrediente
        update ingredientes
        set stock_actual = stock_actual - (v_cantidad_necesaria * new.cantidad)
        where id_ingrediente = v_id_ingrediente;

        -- 2. registrar el movimiento en el historial de stock
        insert into historial_stock (id_ingrediente, cantidad, tipo_movimiento)
        values (v_id_ingrediente, (v_cantidad_necesaria * new.cantidad), 'salida');

    end loop loop_ingredientes;

    close cur_ingredientes;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_rol` int NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `idx_empleados_id_rol` (`id_rol`),
  KEY `idx_empleados_nombre` (`nombre`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles_empleado` (`id_rol`),
  CONSTRAINT `empleados_chk_1` CHECK ((`salario` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'juan perez',1,'2022-01-10',800.00),(2,'ana lopez',2,'2021-11-20',950.00),(3,'mario ruiz',3,'2020-06-15',1200.00),(4,'carla moreno',4,'2023-03-05',750.00),(5,'sofia jimenez',5,'2019-09-01',1300.00);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_log_cambios_empleados` AFTER INSERT ON `empleados` FOR EACH ROW begin
    insert into log_acciones (usuario, accion, tabla_afectada, id_afectado, descripcion)
    values (user(), 'insert', 'empleados', new.id_empleado, 
            concat('se ha contratado al nuevo empleado: ', new.nombre, 
                   ' con el rol id: ', new.id_rol, 
                   ' y un salario de: ', new.salario));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_log_actualizacion_empleados` AFTER UPDATE ON `empleados` FOR EACH ROW begin
    -- solo registra si hubo un cambio en el rol o el salario para evitar logs innecesarios
    if old.id_rol <> new.id_rol or old.salario <> new.salario then
        insert into log_acciones (usuario, accion, tabla_afectada, id_afectado, descripcion)
        values (user(), 'update', 'empleados', new.id_empleado, 
                concat('se actualizo el empleado ', new.nombre, 
                       '. rol anterior: ', old.id_rol, ', rol nuevo: ', new.id_rol,
                       '. salario anterior: ', old.salario, ', salario nuevo: ', new.salario));
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_log_eliminacion_empleados` AFTER DELETE ON `empleados` FOR EACH ROW begin
    insert into log_acciones (usuario, accion, tabla_afectada, id_afectado, descripcion)
    values (user(), 'delete', 'empleados', old.id_empleado, 
            concat('se ha eliminado al empleado: ', old.nombre, 
                   ' (id: ', old.id_empleado, ')'));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_comanda` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_forma_pago` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) DEFAULT NULL,
  `propina` decimal(6,2) DEFAULT '0.00',
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `id_comanda` (`id_comanda`),
  KEY `id_forma_pago` (`id_forma_pago`),
  KEY `idx_facturas_id_cliente` (`id_cliente`),
  KEY `idx_facturas_fecha` (`fecha`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_comanda`) REFERENCES `comandas` (`id_comanda`),
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`id_forma_pago`) REFERENCES `formas_pago` (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,1,1,1,'2025-08-02 16:21:30',13.00,1.00),(2,2,2,2,'2025-08-02 16:21:30',8.90,0.50),(3,3,3,3,'2025-08-02 16:21:30',9.60,1.00),(4,4,4,4,'2025-08-02 16:21:30',10.00,0.00),(5,5,5,1,'2025-08-02 16:21:30',11.00,1.50);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_insert_factura_log` AFTER INSERT ON `facturas` FOR EACH ROW begin
    insert into log_acciones (usuario, ip_origen, accion, tabla_afectada, id_afectado, descripcion)
    values ('sistema', '127.0.0.1', 'inserci√≥n', 'facturas', new.id_factura, 
            concat('se registr√≥ la factura #', new.id_factura, ' para la comanda #', new.id_comanda));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `formas_pago`
--

DROP TABLE IF EXISTS `formas_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formas_pago` (
  `id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `nombre_forma` varchar(50) NOT NULL,
  PRIMARY KEY (`id_forma_pago`),
  UNIQUE KEY `nombre_forma` (`nombre_forma`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_pago`
--

LOCK TABLES `formas_pago` WRITE;
/*!40000 ALTER TABLE `formas_pago` DISABLE KEYS */;
INSERT INTO `formas_pago` VALUES (4,'cheque'),(1,'efectivo'),(2,'tarjeta'),(3,'transferencia');
/*!40000 ALTER TABLE `formas_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_stock`
--

DROP TABLE IF EXISTS `historial_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_stock` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_ingrediente` int NOT NULL,
  `fecha_movimiento` datetime DEFAULT CURRENT_TIMESTAMP,
  `cantidad` int DEFAULT NULL,
  `tipo_movimiento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_ingrediente` (`id_ingrediente`),
  KEY `idx_historial_tipo_fecha` (`tipo_movimiento`,`fecha_movimiento`),
  CONSTRAINT `historial_stock_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`),
  CONSTRAINT `historial_stock_chk_1` CHECK ((`tipo_movimiento` in (_utf8mb4'entrada',_utf8mb4'salida')))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_stock`
--

LOCK TABLES `historial_stock` WRITE;
/*!40000 ALTER TABLE `historial_stock` DISABLE KEYS */;
INSERT INTO `historial_stock` VALUES (1,1,'2025-08-02 16:21:30',20,'entrada'),(2,2,'2025-08-02 16:21:30',5,'salida'),(3,3,'2025-08-02 16:21:30',10,'entrada'),(4,4,'2025-08-02 16:21:30',3,'salida'),(5,5,'2025-08-02 16:21:30',15,'entrada'),(6,1,'2025-08-02 16:33:04',2,'salida'),(7,2,'2025-08-02 16:33:04',4,'salida'),(8,3,'2025-08-02 16:33:04',100,'salida');
/*!40000 ALTER TABLE `historial_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `id_ingrediente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `stock_actual` int NOT NULL DEFAULT '0',
  `unidad` varchar(20) NOT NULL,
  `fecha_actualizacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ingrediente`),
  KEY `idx_ingredientes_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'lechuga',98,'unidades','2025-08-02 16:21:30'),(2,'carne de res',46,'kg','2025-08-02 16:21:30'),(3,'papas',100,'kg','2025-08-02 16:21:30'),(4,'helado',30,'litros','2025-08-02 16:21:30'),(5,'frutas mixtas',60,'kg','2025-08-02 16:21:30'),(6,'spaghetti',10000,'gramos','2025-08-02 16:32:18'),(7,'huevo',200,'unidad','2025-08-02 16:32:22'),(8,'panceta',5000,'gramos','2025-08-02 16:32:24');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_acciones`
--

DROP TABLE IF EXISTS `log_acciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_acciones` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) DEFAULT NULL,
  `ip_origen` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `accion` varchar(50) DEFAULT NULL,
  `tabla_afectada` varchar(50) DEFAULT NULL,
  `id_afectado` int DEFAULT NULL,
  `descripcion` text,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_acciones`
--

LOCK TABLES `log_acciones` WRITE;
/*!40000 ALTER TABLE `log_acciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_acciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_intentos_fallidos`
--

DROP TABLE IF EXISTS `log_intentos_fallidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_intentos_fallidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) DEFAULT NULL,
  `ip_origen` varchar(45) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `motivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_intentos_fallidos`
--

LOCK TABLES `log_intentos_fallidos` WRITE;
/*!40000 ALTER TABLE `log_intentos_fallidos` DISABLE KEYS */;
INSERT INTO `log_intentos_fallidos` VALUES (1,'jimy_user','192.168.1.100','2025-08-02 17:47:29','Contrase√±a incorrecta');
/*!40000 ALTER TABLE `log_intentos_fallidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id_mesa` int NOT NULL AUTO_INCREMENT,
  `capacidad` int NOT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'disponible',
  PRIMARY KEY (`id_mesa`),
  CONSTRAINT `mesas_chk_1` CHECK ((`capacidad` > 0)),
  CONSTRAINT `mesas_chk_2` CHECK ((`estado` in (_utf8mb4'disponible',_utf8mb4'ocupada',_utf8mb4'reservada')))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,4,'salon principal','disponible'),(2,2,'terraza','reservada'),(3,6,'vip','ocupada'),(4,4,'salon secundario','disponible'),(5,8,'zona familiar','ocupada'),(6,4,'ventana','disponible');
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato_ingredientes`
--

DROP TABLE IF EXISTS `plato_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plato_ingredientes` (
  `id_plato` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `cantidad` decimal(6,2) NOT NULL,
  `unidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_plato`,`id_ingrediente`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `plato_ingredientes_ibfk_1` FOREIGN KEY (`id_plato`) REFERENCES `platos` (`id_plato`),
  CONSTRAINT `plato_ingredientes_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato_ingredientes`
--

LOCK TABLES `plato_ingredientes` WRITE;
/*!40000 ALTER TABLE `plato_ingredientes` DISABLE KEYS */;
INSERT INTO `plato_ingredientes` VALUES (1,1,1.00,'unidad'),(1,2,2.00,'unidad'),(1,3,50.00,'gramos'),(2,2,0.25,'kg'),(2,3,0.30,'kg'),(3,4,0.15,'litros'),(4,5,0.20,'kg');
/*!40000 ALTER TABLE `plato_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platos`
--

DROP TABLE IF EXISTS `platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos` (
  `id_plato` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(6,2) NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_plato`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `platos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_plato` (`id_categoria`),
  CONSTRAINT `platos_chk_1` CHECK ((`precio` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos`
--

LOCK TABLES `platos` WRITE;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
INSERT INTO `platos` VALUES (1,'ensalada mixta','ensalada con vegetales frescos',4.50,1),(2,'lomo saltado','carne con papas fritas y arroz',8.90,2),(3,'helado de vainilla','porci√≥n de helado con toppings',3.20,3),(4,'jugo natural','jugo de frutas de temporada',2.00,4),(5,'combo ejecutivo','plato completo con bebida',10.00,5),(6,'spaghetti carbonara','cl√°sica pasta italiana con huevo, panceta y queso',15.50,1);
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_notificar_cambio_precio` AFTER UPDATE ON `platos` FOR EACH ROW begin
    -- se activa solo si el precio realmente cambi√≥
    if old.precio <> new.precio then
        insert into log_acciones (usuario, ip_origen, accion, tabla_afectada, id_afectado, descripcion)
        values (
            user(), 
            substring_index(user(), '@', -1), -- simula obtener la ip o host de origen
            'notificacion_precio', 
            'platos', 
            new.id_plato,
            concat('cambio de precio para el plato "', new.nombre, 
                   '". precio anterior: ', old.precio, 
                   ', precio nuevo: ', new.precio)
        );
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `platos_promocion`
--

DROP TABLE IF EXISTS `platos_promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos_promocion` (
  `id_plato` int NOT NULL,
  `id_promocion` int NOT NULL,
  PRIMARY KEY (`id_plato`,`id_promocion`),
  KEY `id_promocion` (`id_promocion`),
  CONSTRAINT `platos_promocion_ibfk_1` FOREIGN KEY (`id_plato`) REFERENCES `platos` (`id_plato`),
  CONSTRAINT `platos_promocion_ibfk_2` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos_promocion`
--

LOCK TABLES `platos_promocion` WRITE;
/*!40000 ALTER TABLE `platos_promocion` DISABLE KEYS */;
INSERT INTO `platos_promocion` VALUES (2,1),(3,2),(4,3),(3,4),(5,5);
/*!40000 ALTER TABLE `platos_promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `descuento_porcentaje` decimal(5,2) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_promocion`),
  CONSTRAINT `promociones_chk_1` CHECK (((`descuento_porcentaje` > 0) and (`descuento_porcentaje` <= 100)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'descuento almuerzos',10.00,'2025-07-01','2025-07-31'),(2,'2x1 postres',50.00,'2025-07-15','2025-08-15'),(3,'jugo gratis por plato fuerte',100.00,'2025-07-10','2025-07-30'),(4,'martes de helado',20.00,'2025-07-01','2025-08-31'),(5,'combo ejecutivo promo',15.00,'2025-07-20','2025-08-20');
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_notif_eliminacion_promocion` BEFORE DELETE ON `promociones` FOR EACH ROW begin
    insert into log_acciones (usuario, ip_origen, accion, tabla_afectada, id_afectado, descripcion)
    values ('admin', '127.0.0.1', 'eliminaci√≥n', 'promociones', old.id_promocion, 
            concat('promoci√≥n "', left(old.descripcion, 50), '" eliminada.'));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `roles_empleado`
--

DROP TABLE IF EXISTS `roles_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_empleado` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_empleado`
--

LOCK TABLES `roles_empleado` WRITE;
/*!40000 ALTER TABLE `roles_empleado` DISABLE KEYS */;
INSERT INTO `roles_empleado` VALUES (5,'administrador'),(4,'cajero'),(2,'cocinero'),(3,'gerente'),(1,'mesero');
/*!40000 ALTER TABLE `roles_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos_empleados`
--

DROP TABLE IF EXISTS `turnos_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos_empleados` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  PRIMARY KEY (`id_turno`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `turnos_empleados_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos_empleados`
--

LOCK TABLES `turnos_empleados` WRITE;
/*!40000 ALTER TABLE `turnos_empleados` DISABLE KEYS */;
INSERT INTO `turnos_empleados` VALUES (1,1,'2025-07-27','08:00:00','16:00:00'),(2,2,'2025-07-27','10:00:00','18:00:00'),(3,3,'2025-07-27','09:00:00','17:00:00'),(4,4,'2025-07-27','12:00:00','20:00:00'),(5,5,'2025-07-27','08:00:00','14:00:00');
/*!40000 ALTER TABLE `turnos_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin123','administrador'),(2,'juan','clave123','cliente'),(3,'ana','ana456','operador');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_clientes_segura`
--

DROP TABLE IF EXISTS `vista_clientes_segura`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_segura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_segura` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_clientes_segura`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_segura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_segura` AS select `clientes`.`id_cliente` AS `id_cliente`,`clientes`.`nombre` AS `nombre` from `clientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-03 20:41:09
