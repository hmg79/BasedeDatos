-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: sigef
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `dni` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_alumno_dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'DNI000001','Romero','Juan'),(2,'DNI000002','Fernández','Juan'),(3,'DNI000003','Sosa','Juan'),(4,'DNI000004','Pérez','Juan'),(5,'DNI000005','Díaz','Juan'),(6,'DNI000006','Martínez','Juan'),(7,'DNI000007','López','Juan'),(8,'DNI000008','Rodríguez','Juan'),(9,'DNI000009','González','Juan'),(10,'DNI000010','Gómez','Juan'),(11,'DNI000011','Romero','María'),(12,'DNI000012','Fernández','María'),(13,'DNI000013','Sosa','María'),(14,'DNI000014','Pérez','María'),(15,'DNI000015','Díaz','María'),(16,'DNI000016','Martínez','María'),(17,'DNI000017','López','María'),(18,'DNI000018','Rodríguez','María'),(19,'DNI000019','González','María'),(20,'DNI000020','Gómez','María'),(21,'DNI000021','Romero','Carlos'),(22,'DNI000022','Fernández','Carlos'),(23,'DNI000023','Sosa','Carlos'),(24,'DNI000024','Pérez','Carlos'),(25,'DNI000025','Díaz','Carlos'),(26,'DNI000026','Martínez','Carlos'),(27,'DNI000027','López','Carlos'),(28,'DNI000028','Rodríguez','Carlos'),(29,'DNI000029','González','Carlos'),(30,'DNI000030','Gómez','Carlos'),(31,'DNI000031','Romero','Laura'),(32,'DNI000032','Fernández','Laura'),(33,'DNI000033','Sosa','Laura'),(34,'DNI000034','Pérez','Laura'),(35,'DNI000035','Díaz','Laura'),(36,'DNI000036','Martínez','Laura'),(37,'DNI000037','López','Laura'),(38,'DNI000038','Rodríguez','Laura'),(39,'DNI000039','González','Laura'),(40,'DNI000040','Gómez','Laura'),(41,'DNI000041','Romero','Ana'),(42,'DNI000042','Fernández','Ana'),(43,'DNI000043','Sosa','Ana'),(44,'DNI000044','Pérez','Ana'),(45,'DNI000045','Díaz','Ana'),(46,'DNI000046','Martínez','Ana'),(47,'DNI000047','López','Ana'),(48,'DNI000048','Rodríguez','Ana'),(49,'DNI000049','González','Ana'),(50,'DNI000050','Gómez','Ana'),(51,'DNI000051','Romero','Luis'),(52,'DNI000052','Fernández','Luis'),(53,'DNI000053','Sosa','Luis'),(54,'DNI000054','Pérez','Luis'),(55,'DNI000055','Díaz','Luis'),(56,'DNI000056','Martínez','Luis'),(57,'DNI000057','López','Luis'),(58,'DNI000058','Rodríguez','Luis'),(59,'DNI000059','González','Luis'),(60,'DNI000060','Gómez','Luis'),(61,'DNI000061','Romero','Sofía'),(62,'DNI000062','Fernández','Sofía'),(63,'DNI000063','Sosa','Sofía'),(64,'DNI000064','Pérez','Sofía'),(65,'DNI000065','Díaz','Sofía'),(66,'DNI000066','Martínez','Sofía'),(67,'DNI000067','López','Sofía'),(68,'DNI000068','Rodríguez','Sofía'),(69,'DNI000069','González','Sofía'),(70,'DNI000070','Gómez','Sofía'),(71,'DNI000071','Romero','Miguel'),(72,'DNI000072','Fernández','Miguel'),(73,'DNI000073','Sosa','Miguel'),(74,'DNI000074','Pérez','Miguel'),(75,'DNI000075','Díaz','Miguel'),(76,'DNI000076','Martínez','Miguel'),(77,'DNI000077','López','Miguel'),(78,'DNI000078','Rodríguez','Miguel'),(79,'DNI000079','González','Miguel'),(80,'DNI000080','Gómez','Miguel'),(81,'DNI000081','Romero','Marta'),(82,'DNI000082','Fernández','Marta'),(83,'DNI000083','Sosa','Marta'),(84,'DNI000084','Pérez','Marta'),(85,'DNI000085','Díaz','Marta'),(86,'DNI000086','Martínez','Marta'),(87,'DNI000087','López','Marta'),(88,'DNI000088','Rodríguez','Marta'),(89,'DNI000089','González','Marta'),(90,'DNI000090','Gómez','Marta'),(91,'DNI000091','Romero','Diego'),(92,'DNI000092','Fernández','Diego'),(93,'DNI000093','Sosa','Diego'),(94,'DNI000094','Pérez','Diego'),(95,'DNI000095','Díaz','Diego'),(96,'DNI000096','Martínez','Diego'),(97,'DNI000097','López','Diego'),(98,'DNI000098','Rodríguez','Diego'),(99,'DNI000099','González','Diego'),(100,'DNI000100','Gómez','Diego'),(128,'DNI900001','Pérez','Lucía'),(129,'DNI900002','Gómez','Juan'),(130,'DNI900003','Rodríguez','Ana');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_catalogo`
--

DROP TABLE IF EXISTS `curso_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_catalogo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel_id` tinyint unsigned NOT NULL,
  `resolucion` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cc_nombre_nivel` (`nombre`,`nivel_id`),
  KEY `fk_cc_nivel` (`nivel_id`),
  CONSTRAINT `fk_cc_nivel` FOREIGN KEY (`nivel_id`) REFERENCES `nivel` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_catalogo`
--

LOCK TABLES `curso_catalogo` WRITE;
/*!40000 ALTER TABLE `curso_catalogo` DISABLE KEYS */;
INSERT INTO `curso_catalogo` VALUES (1,'TERMINALIDAD PRIMARIA',1,'S/N'),(2,'ASITENTE APÍCOLA',3,'4458/15'),(3,'OPERARIO HORTICOLA',3,'4458/15'),(4,'AUXILIAR EN CONSTRUCCIONES',3,'S/N'),(5,'ALBAÑIL',3,'3515/15'),(6,'AUXILIAR EN INSTALACIONES ELECTRICAS DOMICILIARIAS',3,'3515/15'),(7,'MONTADOR ELECTRICISTA DOMICILIARIO',3,'4124/18'),(8,'AUXILIAR EN INSTALACIONES SANITARIAS',3,'4124/18'),(9,'MONTADOR DE INSTALACIONES SANITARIAS DOMICILIARIAS',3,'4383/15'),(10,'AUXILIAR MECÁNICO DE MOTORES NAFTEROS',3,'4383/15'),(11,'OPERADOR DE IMFORMÁTICA PARA LA ADMINISTRACIÓN Y GESTIÓN',3,'5566/15'),(12,'HERRERO/A',3,'4708/12'),(13,'ORGANIZADOR/A DE EVENTOS',3,'S/N'),(14,'AUXILIAR GASTRONÓMICO',3,'S/N'),(15,'COCINERO/A',3,'1844/18'),(16,'PANADERO/A',3,'1844/18'),(17,'PASTELERO/A',3,'1844/18'),(18,'CONFECCIONISTA A MEDIDA: MODISTO/A',3,'1844/18'),(19,'MECÁNICO DE MOTOS',3,'4360/15'),(20,'PELUQUERO/A',3,'624/07'),(21,'AUXILIAR DE FAMILIA ESPECIALIZADO EN CUIDADOS',3,'3330/07'),(22,'AUXILIAR EN CUIDADOS GEREONTOLOGICOS',3,'3260/19'),(23,'REPARADOR DE RADIO Y TV',2,'624/07'),(24,'ARMADOR Y REPARADOR DE PC',2,'4705/09'),(25,'CONTABILIDAD',2,'624/07'),(26,'PINTURA SOBRE TELA',2,'624/07'),(27,'ARTESANIA MANUAL',2,'624/07'),(28,'INSEMINACIÓN ARTIFICIAL GANADERA',2,'624/07'),(29,'MANTENIMIENTO DE EDIFICIO',2,'624/07'),(30,'ADMINISTRACIÓN DE REDES',2,'4705/09'),(31,'BELLEZA INTEGRAL',2,'3330/07'),(32,'TEJIDO ARTESANAL',2,'624/07'),(33,'ASISTENTE EN TURISMO',2,'624/07'),(34,'ADMINISTRACION Y GESTIÓN DE MICROEMPRENDIMIENTO',2,'624/07'),(35,'ARTESANÍA EN MADERA',2,'624/07'),(36,'ELABORACIÓN DE COMIDAS PARA CATERING',2,'624/07'),(37,'REPARADOR DE ELECTRODOMÉSTICOS',2,'624/07'),(38,'MECÁNICA DENTAL ESPECIALIZADO EN PRÓTESIS REMOVIBLES DE ACRÍLICO',2,'624/07'),(39,'MECÁNICA GENERAL',2,'624/07'),(40,'RELOJERÍA',2,'624/07'),(41,'CARPINTERO/A DE MELAMINA',2,'624/07'),(42,'CARPINTERÍA CREATIVA',2,'624/07'),(43,'ARTESANIA EN CHAGUAR',2,'624/07'),(44,'AUXILIAR AGROPECUARIO',2,'624/07'),(45,'AUXILIAR EN GANADERÍA',2,'624/07'),(46,'AUXILIAR EN INSTALACIÓN Y EXPLOTACIÓN DE APIARIO',2,'624/07'),(47,'HUERTA Y JARDINERIA',2,'624/07'),(48,'JARDINERIA',2,'624/07'),(49,'JARDINERIA Y PRODUCCION BAJO CUBIERTA',2,'624/07'),(50,'MECANICA LIGERA',2,'624/07'),(51,'PRODUCCION FRUTIHORTICOLA',2,'624/07'),(52,'REPARACION DE IMPLEMENTOS AGRICOLAS',2,'624/07'),(53,'SOLDADURA ELÉCTRICA',2,'624/07'),(54,'MECANICA DE MOTOS',2,'624/07'),(55,'AUXILIAR EN PRODUCCIÓN VEGETAL',2,'624/07');
/*!40000 ALTER TABLE `curso_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_matricula`
--

DROP TABLE IF EXISTS `estado_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_matricula` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_matricula`
--

LOCK TABLES `estado_matricula` WRITE;
/*!40000 ALTER TABLE `estado_matricula` DISABLE KEYS */;
INSERT INTO `estado_matricula` VALUES (1,'INSCRIPTO','Inscripto'),(2,'CURSANDO','Cursando'),(3,'EGRESADO','Egresado'),(4,'ABANDONO','Abandono');
/*!40000 ALTER TABLE `estado_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `localidad_id` bigint unsigned NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_cue` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_institucion_nombre` (`localidad_id`,`nombre`),
  UNIQUE KEY `uq_institucion_cue` (`codigo_cue`),
  CONSTRAINT `fk_institucion_localidad` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` VALUES (1,1,'NEP y FP N° 1','CUE-FOR-0001','Av. 25 de Mayo 100'),(2,1,'NEP y FP N° 2','CUE-FOR-0002','Calle San Martín 250'),(3,1,'NEP y FP N° 3','CUE-FOR-0003','Av. Italia 345'),(4,1,'NEP y FP N° 4','CUE-FOR-0004','Av. Gutnisky 1200'),(5,1,'NEP y FP N° 5','CUE-FOR-0005','Barrio Centro, Mz 3 Casa 12'),(6,1,'NEP y FP N° 6','CUE-FOR-0006','Av. González Lelong 890'),(7,1,'NEP y FP N° 7','CUE-FOR-0007','Calle España 560'),(8,1,'NEP y FP N° 8','CUE-FOR-0008','Av. Néstor Kirchner 2100'),(9,1,'NEP y FP N° 9','CUE-FOR-0009','Calle Maipú 430'),(10,1,'NEP y FP N° 10','CUE-FOR-0010','Ruta 11 Km 5'),(16,2,'NEP y FP N° 11','CUE-CLO-0001','Av. San Vicente de Paul 150'),(17,2,'NEP y FP N° 12','CUE-CLO-0002','Calle Rivadavia 220'),(19,3,'NEP y FP N° 13','CUE-PIR-0001','Av. 9 de Julio 300'),(20,3,'NEP y FP N° 14','CUE-PIR-0002','Calle Belgrano 180'),(22,4,'NEP y FP N° 15','CUE-COL-0001','Av. Libertad 75'),(23,4,'NEP y FP N° 16','CUE-COL-0002','Calle Güemes 410'),(25,5,'NEP y FP N° 17','CUE-IJU-0001','Av. Independencia 640'),(26,5,'NEP y FP N° 18','CUE-IJU-0002','Calle Moreno 95'),(28,6,'NEP y FP N° 19','CUE-LLO-0001','Av. Sarmiento 210'),(29,6,'NEP y FP N° 20','CUE-LLO-0002','Calle Mitre 340'),(31,7,'NEP y FP N° 21','CUE-LBL-0001','Av. San Martín 70'),(32,7,'NEP y FP N° 22','CUE-LBL-0002','Calle Italia 55'),(34,8,'NEP y FP N° 23','CUE-IBA-0001','Av. 3 de Febrero 260'),(35,8,'NEP y FP N° 24','CUE-IBA-0002','Calle Córdoba 102'),(37,9,'NEP y FP N° 25','CUE-CFO-0001','Av. 25 de Mayo 50'),(38,9,'NEP y FP N° 26','CUE-CFO-0002','Calle Salta 399'),(40,10,'NEP y FP N° 27','CUE-HER-0001','Av. Costanera 10'),(41,10,'NEP y FP N° 28','CUE-HER-0002','Calle 9 de Julio 220');
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion_curso`
--

DROP TABLE IF EXISTS `institucion_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion_curso` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institucion_id` bigint unsigned NOT NULL,
  `curso_catalogo_id` bigint unsigned NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ic_inst_catalogo` (`institucion_id`,`curso_catalogo_id`),
  KEY `fk_ic_catalogo` (`curso_catalogo_id`),
  KEY `idx_ic_activo` (`activo`),
  CONSTRAINT `fk_ic_catalogo` FOREIGN KEY (`curso_catalogo_id`) REFERENCES `curso_catalogo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ic_institucion` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion_curso`
--

LOCK TABLES `institucion_curso` WRITE;
/*!40000 ALTER TABLE `institucion_curso` DISABLE KEYS */;
INSERT INTO `institucion_curso` VALUES (1,1,1,1),(2,1,24,1),(3,1,30,1),(4,1,15,1),(5,1,20,1),(6,1,16,1),(7,1,17,1),(8,1,53,1),(9,1,37,1),(10,2,1,1),(11,2,24,1),(12,2,30,1),(13,2,15,1),(14,2,20,1),(15,2,16,1),(16,2,17,1),(17,2,53,1),(18,2,37,1),(19,3,1,1),(20,3,24,1),(21,3,30,1),(22,3,15,1),(23,3,20,1),(24,3,16,1),(25,3,17,1),(26,3,53,1),(27,3,37,1),(28,4,1,1),(29,4,24,1),(30,4,30,1),(31,4,15,1),(32,4,20,1),(33,4,16,1),(34,4,17,1),(35,4,53,1),(36,4,37,1),(37,5,1,1),(38,5,24,1),(39,5,30,1),(40,5,15,1),(41,5,20,1),(42,5,16,1),(43,5,17,1),(44,5,53,1),(45,5,37,1),(46,6,1,1),(47,6,24,1),(48,6,30,1),(49,6,15,1),(50,6,20,1),(51,6,16,1),(52,6,17,1),(53,6,53,1),(54,6,37,1),(55,7,1,1),(56,7,24,1),(57,7,30,1),(58,7,15,1),(59,7,20,1),(60,7,16,1),(61,7,17,1),(62,7,53,1),(63,7,37,1),(64,8,1,1),(65,8,24,1),(66,8,30,1),(67,8,15,1),(68,8,20,1),(69,8,16,1),(70,8,17,1),(71,8,53,1),(72,8,37,1),(73,9,1,1),(74,9,24,1),(75,9,30,1),(76,9,15,1),(77,9,20,1),(78,9,16,1),(79,9,17,1),(80,9,53,1),(81,9,37,1),(82,10,1,1),(83,10,24,1),(84,10,30,1),(85,10,15,1),(86,10,20,1),(87,10,16,1),(88,10,17,1),(89,10,53,1),(90,10,37,1),(92,17,1,1),(94,16,1,1),(95,37,1,1),(96,38,1,1),(97,22,1,1),(98,23,1,1),(99,40,1,1),(100,41,1,1),(101,34,1,1),(102,35,1,1),(103,25,1,1),(104,26,1,1),(105,31,1,1),(106,32,1,1),(107,28,1,1),(108,29,1,1),(109,19,1,1),(110,20,1,1);
/*!40000 ALTER TABLE `institucion_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `provincia_id` bigint unsigned NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_localidad` (`provincia_id`,`nombre`),
  KEY `idx_localidad_provincia` (`provincia_id`),
  CONSTRAINT `fk_localidad_provincia` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (2,1,'Clorinda'),(9,1,'Comandante Fontana'),(4,1,'El Colorado'),(1,1,'Formosa'),(10,1,'Herradura'),(8,1,'Ibarreta'),(5,1,'Ingeniero Juárez'),(7,1,'Laguna Blanca'),(6,1,'Las Lomitas'),(3,1,'Pirané');
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `alumno_id` bigint unsigned NOT NULL,
  `institucion_curso_id` bigint unsigned NOT NULL,
  `periodo_id` int unsigned NOT NULL,
  `estado_id` tinyint unsigned NOT NULL,
  `fecha_estado` date DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_matricula` (`alumno_id`,`institucion_curso_id`,`periodo_id`),
  KEY `fk_matricula_oferta` (`institucion_curso_id`),
  KEY `fk_matricula_estado` (`estado_id`),
  KEY `idx_matricula_alumno` (`alumno_id`),
  KEY `idx_matricula_periodo_estado` (`periodo_id`,`estado_id`),
  CONSTRAINT `fk_matricula_alumno` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_matricula_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado_matricula` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_matricula_oferta` FOREIGN KEY (`institucion_curso_id`) REFERENCES `institucion_curso` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_matricula_periodo` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (449,1,1,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(450,2,2,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(451,3,3,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(452,4,4,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(453,5,5,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(454,6,6,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(455,7,7,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(456,8,8,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(457,9,9,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(458,10,10,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(459,11,11,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(460,12,12,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(461,13,13,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(462,14,14,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(463,15,15,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(464,16,16,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(465,17,17,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(466,18,18,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(467,19,19,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(468,20,20,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(469,21,21,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(470,22,22,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(471,23,23,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(472,24,24,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(473,25,25,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(474,26,26,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(475,27,27,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(476,28,28,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(477,29,29,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(478,30,30,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(479,31,31,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(480,32,32,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(481,33,33,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(482,34,34,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(483,35,35,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(484,36,36,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(485,37,37,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(486,38,38,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(487,39,39,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(488,40,40,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(489,41,41,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(490,42,42,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(491,43,43,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(492,44,44,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(493,45,45,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(494,46,46,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(495,47,47,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(496,48,48,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(497,49,49,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(498,50,50,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(499,51,51,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(500,52,52,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(501,53,53,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(502,54,54,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(503,55,55,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(504,56,56,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(505,57,57,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(506,58,58,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(507,59,59,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(508,60,60,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(509,61,61,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(510,62,62,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(511,63,63,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(512,64,64,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(513,65,65,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(514,66,66,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(515,67,67,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(516,68,68,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(517,69,69,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(518,70,70,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(519,71,71,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(520,72,72,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(521,73,73,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(522,74,74,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(523,75,75,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(524,76,76,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(525,77,77,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(526,78,78,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(527,79,79,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(528,80,80,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(529,81,81,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(530,82,82,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(531,83,83,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(532,84,84,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(533,85,85,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(534,86,86,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(535,87,87,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(536,88,88,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(537,89,89,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(538,90,90,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(539,91,92,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(540,92,94,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(541,93,95,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(542,94,96,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(543,95,97,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(544,96,98,1,4,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(545,97,99,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(546,98,100,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(547,99,101,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(548,100,102,1,3,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(549,128,103,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(550,129,104,1,2,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12'),(551,130,105,1,1,NULL,'2025-11-09 19:45:12','2025-11-09 19:45:12');
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula_estado_historial`
--

DROP TABLE IF EXISTS `matricula_estado_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula_estado_historial` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `matricula_id` bigint unsigned NOT NULL,
  `estado_id` tinyint unsigned NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mh_estado` (`estado_id`),
  KEY `idx_mh_matricula` (`matricula_id`),
  CONSTRAINT `fk_mh_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado_matricula` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mh_matricula` FOREIGN KEY (`matricula_id`) REFERENCES `matricula` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=771 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula_estado_historial`
--

LOCK TABLES `matricula_estado_historial` WRITE;
/*!40000 ALTER TABLE `matricula_estado_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula_estado_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES (1,'TP','Terminalidad Primaria'),(2,'CL','Capacitación Laboral'),(3,'FP','Formación Profesional');
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `anio` smallint NOT NULL,
  `cuatrimestre` tinyint DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_periodo` (`anio`,`cuatrimestre`),
  CONSTRAINT `chk_cuatrimestre` CHECK (((`cuatrimestre` in (1,2)) or (`cuatrimestre` is null)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,2025,1,'2025-03-01','2025-07-31'),(2,2025,2,'2025-08-01','2025-12-15');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_provincia_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Formosa');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recupero_contrasena`
--

DROP TABLE IF EXISTS `recupero_contrasena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recupero_contrasena` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint unsigned NOT NULL,
  `token` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expira` datetime NOT NULL,
  `usado` tinyint(1) NOT NULL DEFAULT '0',
  `usado_en` datetime DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `idx_rc_usuario` (`usuario_id`),
  KEY `idx_rc_expira` (`expira`),
  CONSTRAINT `fk_rc_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recupero_contrasena`
--

LOCK TABLES `recupero_contrasena` WRITE;
/*!40000 ALTER TABLE `recupero_contrasena` DISABLE KEYS */;
/*!40000 ALTER TABLE `recupero_contrasena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'DEP','Departamento'),(2,'INSTITUCION','Institución');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion_acceso`
--

DROP TABLE IF EXISTS `sesion_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesion_acceso` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exito` tinyint(1) NOT NULL,
  `mensaje` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sesion_usuario` (`usuario_id`),
  KEY `idx_sesion_fecha` (`creado_en`),
  CONSTRAINT `fk_sesion_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion_acceso`
--

LOCK TABLES `sesion_acceso` WRITE;
/*!40000 ALTER TABLE `sesion_acceso` DISABLE KEYS */;
INSERT INTO `sesion_acceso` VALUES (1,1,'127.0.0.1',1,'Login exitoso','2025-11-09 14:38:05'),(2,2,'127.0.0.1',1,'Login exitoso','2025-11-09 14:38:29'),(3,2,'127.0.0.1',1,'Login exitoso','2025-11-09 16:07:30'),(4,1,'127.0.0.1',1,'Login exitoso','2025-11-09 16:15:20'),(5,1,'127.0.0.1',1,'Login exitoso','2025-11-09 17:15:35'),(6,1,'127.0.0.1',1,'Login exitoso','2025-11-09 17:19:11'),(7,1,'127.0.0.1',1,'Login exitoso','2025-11-09 17:40:37'),(8,1,'127.0.0.1',1,'Login exitoso','2025-11-09 17:44:44'),(9,1,'127.0.0.1',1,'Login exitoso','2025-11-09 17:48:14'),(10,1,'127.0.0.1',1,'Login exitoso','2025-11-09 17:50:11'),(11,1,'127.0.0.1',0,'Contraseña incorrecta','2025-11-09 18:28:35'),(12,1,'127.0.0.1',1,'Login exitoso','2025-11-09 18:28:42'),(13,1,'127.0.0.1',1,'Login exitoso','2025-11-09 18:50:16'),(14,1,'127.0.0.1',1,'Login exitoso','2025-11-09 18:58:29'),(15,1,'127.0.0.1',1,'Login exitoso','2025-11-09 19:46:59'),(16,2,'127.0.0.1',1,'Login exitoso','2025-11-09 19:52:33'),(17,2,'127.0.0.1',1,'Login exitoso','2025-11-09 22:06:49'),(18,2,'127.0.0.1',1,'Login exitoso','2025-11-09 22:31:14'),(19,2,'127.0.0.1',1,'Login exitoso','2025-11-09 22:41:14'),(20,2,'127.0.0.1',1,'Login exitoso','2025-11-09 22:54:55'),(21,1,'127.0.0.1',1,'Login exitoso','2025-11-09 22:56:23'),(22,1,'127.0.0.1',1,'Login exitoso','2025-11-09 23:04:39'),(23,1,'127.0.0.1',0,'Contraseña incorrecta','2025-11-09 23:06:19'),(24,1,'127.0.0.1',1,'Login exitoso','2025-11-09 23:19:35'),(25,2,'127.0.0.1',1,'Login exitoso','2025-11-09 23:20:16'),(26,2,'127.0.0.1',1,'Login exitoso','2025-11-10 03:00:02'),(27,2,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-10 03:43:50'),(28,1,'127.0.0.1',1,'Login exitoso','2025-11-11 03:05:11'),(29,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 03:05:48'),(30,1,'127.0.0.1',1,'Login exitoso','2025-11-11 03:36:24'),(31,1,'127.0.0.1',1,'Login exitoso','2025-11-11 03:38:49'),(32,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 03:38:59'),(33,NULL,'127.0.0.1',0,'Usuario inexistente','2025-11-11 03:39:12'),(34,2,'127.0.0.1',1,'Login exitoso','2025-11-11 03:39:26'),(35,2,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 03:39:52'),(36,1,'127.0.0.1',1,'Login exitoso','2025-11-11 04:08:07'),(37,1,'127.0.0.1',1,'Login exitoso','2025-11-11 04:08:59'),(38,1,'127.0.0.1',1,'Login exitoso','2025-11-11 04:24:18'),(39,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 04:24:46'),(40,2,'127.0.0.1',1,'Login exitoso','2025-11-11 04:25:05'),(41,1,'127.0.0.1',1,'Login exitoso','2025-11-11 04:28:38'),(42,NULL,'127.0.0.1',0,'Usuario inexistente','2025-11-11 04:53:19'),(43,1,'127.0.0.1',1,'Login exitoso','2025-11-11 04:53:28'),(44,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 04:57:20'),(45,1,'127.0.0.1',1,'Login exitoso','2025-11-11 04:57:30'),(46,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 04:59:09'),(47,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 05:00:38'),(48,1,'127.0.0.1',1,'Login exitoso','2025-11-11 05:26:34'),(49,1,'127.0.0.1',1,'Login exitoso','2025-11-11 05:27:43'),(50,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 05:29:20'),(51,1,'127.0.0.1',1,'Login exitoso','2025-11-11 05:44:10'),(52,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 05:44:22'),(53,NULL,'127.0.0.1',0,'Usuario inexistente','2025-11-11 05:44:42'),(54,1,'127.0.0.1',1,'Login exitoso','2025-11-11 05:45:10'),(55,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 05:45:21'),(56,1,'127.0.0.1',1,'Login exitoso','2025-11-11 05:45:30'),(57,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 05:45:35'),(58,1,'127.0.0.1',1,'Login exitoso','2025-11-11 06:06:05'),(59,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-11 06:06:15'),(60,1,'127.0.0.1',0,'Contraseña incorrecta','2025-11-12 00:47:42'),(61,1,'127.0.0.1',1,'Login exitoso','2025-11-12 00:47:47'),(62,1,'192.168.1.5',1,'Cierre de sesión exitoso','2025-11-12 00:48:02');
/*!40000 ALTER TABLE `sesion_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_id` tinyint unsigned NOT NULL,
  `institucion_id` bigint unsigned DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `intentos_fallidos` tinyint unsigned NOT NULL DEFAULT '0',
  `bloqueado_hasta` datetime DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_usuario_rol` (`rol_id`),
  KEY `fk_usuario_institucion` (`institucion_id`),
  CONSTRAINT `fk_usuario_institucion` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'depadmin','depadmin@sigef.gov.ar','$2a$12$QO2faU.9Z7TJGLrhyU4WMevEEgzPzm4ujtjkY/SpYXS5eGqEzCN/K',1,NULL,1,0,NULL,'2025-10-18 06:20:37'),(2,'instuser','instuser@sigef.gov.ar','$2a$12$QO2faU.9Z7TJGLrhyU4WMevEEgzPzm4ujtjkY/SpYXS5eGqEzCN/K',2,4,1,0,NULL,'2025-10-18 06:20:37');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_cursando_por_alumno`
--

DROP TABLE IF EXISTS `v_cursando_por_alumno`;
/*!50001 DROP VIEW IF EXISTS `v_cursando_por_alumno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_cursando_por_alumno` AS SELECT 
 1 AS `alumno_id`,
 1 AS `periodo_id`,
 1 AS `ofertas_cursando`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_institucion_sin_tp_activa`
--

DROP TABLE IF EXISTS `v_institucion_sin_tp_activa`;
/*!50001 DROP VIEW IF EXISTS `v_institucion_sin_tp_activa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_institucion_sin_tp_activa` AS SELECT 
 1 AS `institucion_id`,
 1 AS `institucion`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_cursando_por_alumno`
--

/*!50001 DROP VIEW IF EXISTS `v_cursando_por_alumno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cursando_por_alumno` AS select `m`.`alumno_id` AS `alumno_id`,`m`.`periodo_id` AS `periodo_id`,count(0) AS `ofertas_cursando` from (`matricula` `m` join `estado_matricula` `e` on(((`e`.`id` = `m`.`estado_id`) and (`e`.`codigo` = 'CURSANDO')))) group by `m`.`alumno_id`,`m`.`periodo_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_institucion_sin_tp_activa`
--

/*!50001 DROP VIEW IF EXISTS `v_institucion_sin_tp_activa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_institucion_sin_tp_activa` AS select `i`.`id` AS `institucion_id`,`i`.`nombre` AS `institucion` from (`institucion` `i` left join (select `ic`.`institucion_id` AS `institucion_id` from ((`institucion_curso` `ic` join `curso_catalogo` `cc` on((`cc`.`id` = `ic`.`curso_catalogo_id`))) join `nivel` `n` on((`n`.`id` = `cc`.`nivel_id`))) where ((`ic`.`activo` = true) and (`n`.`codigo` = 'TP')) group by `ic`.`institucion_id`) `t` on((`t`.`institucion_id` = `i`.`id`))) where (`t`.`institucion_id` is null) */;
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

-- Dump completed on 2025-11-15 11:27:02
