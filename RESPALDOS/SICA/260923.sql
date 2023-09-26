-- MariaDB dump 10.19  Distrib 10.8.6-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: SICA
-- ------------------------------------------------------
-- Server version	10.8.6-MariaDB

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
-- Table structure for table `Cat_Edificios`
--

DROP TABLE IF EXISTS `Cat_Edificios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cat_Edificios` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Descripcion` varchar(200) NOT NULL,
  `Calle` varchar(200) NOT NULL,
  `Colonia` varchar(200) NOT NULL,
  `Municipio` varchar(200) NOT NULL,
  `Estado` varchar(200) NOT NULL,
  `CP` varchar(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Cat_Edificios` (`Descripcion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cat_Edificios`
--

LOCK TABLES `Cat_Edificios` WRITE;
/*!40000 ALTER TABLE `Cat_Edificios` DISABLE KEYS */;
INSERT INTO `Cat_Edificios` VALUES
('726b09f7-5c07-11ee-a933-236cb4402701','0','2023-09-25 17:57:51','2023-09-25 17:55:54','1','1','Edificio Víctor Gómez Garza','Gral. Mariano Escobedo 333','Zona Centro','Monterrey','Nuevo León','64000');
/*!40000 ALTER TABLE `Cat_Edificios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cat_Entradas_Edi`
--

DROP TABLE IF EXISTS `Cat_Entradas_Edi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cat_Entradas_Edi` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Descripcion` varchar(200) NOT NULL,
  `idEdificio` char(36) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Cat_Entradas` (`Descripcion`) USING BTREE,
  KEY `FK1_CATENTRADA_EDIFICIO` (`idEdificio`),
  CONSTRAINT `FK1_CATENTRADA_EDIFICIO` FOREIGN KEY (`idEdificio`) REFERENCES `Cat_Edificios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cat_Entradas_Edi`
--

LOCK TABLES `Cat_Entradas_Edi` WRITE;
/*!40000 ALTER TABLE `Cat_Entradas_Edi` DISABLE KEYS */;
INSERT INTO `Cat_Entradas_Edi` VALUES
('ea82bc35-5c07-11ee-a933-236cb4402701','0','2023-09-25 17:59:16','2023-09-25 17:59:16','1','1','Acceso Frontal','726b09f7-5c07-11ee-a933-236cb4402701'),
('f46bd706-5c07-11ee-a933-236cb4402701','0','2023-09-25 17:59:33','2023-09-25 17:59:33','1','1','Acceso Posterio','726b09f7-5c07-11ee-a933-236cb4402701');
/*!40000 ALTER TABLE `Cat_Entradas_Edi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cat_Estatus`
--

DROP TABLE IF EXISTS `Cat_Estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cat_Estatus` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `catanio` (`Descripcion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cat_Estatus`
--

LOCK TABLES `Cat_Estatus` WRITE;
/*!40000 ALTER TABLE `Cat_Estatus` DISABLE KEYS */;
INSERT INTO `Cat_Estatus` VALUES
('0779435b-5718-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 12:12:01','2023-09-19 12:12:01','1','1','Finalizado'),
('35f06795-5183-11ee-b06d-3cd92b4d9bf4','0','2023-09-12 09:44:08','2023-09-12 09:44:08','1','1','Generado'),
('4112a976-5183-11ee-b06d-3cd92b4d9bf4','0','2023-09-12 09:44:26','2023-09-12 09:44:26','1','1','En Visita'),
('4c103ef2-5183-11ee-b06d-3cd92b4d9bf4','0','2023-09-12 09:44:45','2023-09-12 09:44:45','1','1','Vencido');
/*!40000 ALTER TABLE `Cat_Estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cat_Pisos`
--

DROP TABLE IF EXISTS `Cat_Pisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cat_Pisos` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Cat_Pisos` (`Descripcion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cat_Pisos`
--

LOCK TABLES `Cat_Pisos` WRITE;
/*!40000 ALTER TABLE `Cat_Pisos` DISABLE KEYS */;
INSERT INTO `Cat_Pisos` VALUES
('1790a832-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:15:43','2023-09-19 11:15:12','1','1','Sotano'),
('31318c69-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:15:55','2023-09-19 11:15:55','1','1','Piso 1'),
('3a8534d9-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:16:10','2023-09-19 11:16:10','1','1','Piso 2'),
('427d055b-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:16:24','2023-09-19 11:16:24','1','1','Piso 3'),
('493b0432-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:16:35','2023-09-19 11:16:35','1','1','Piso 4'),
('4e99655d-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:16:44','2023-09-19 11:16:44','1','1','Piso 5'),
('536a403f-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:16:52','2023-09-19 11:16:52','1','1','Piso 6'),
('58822be0-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:17:01','2023-09-19 11:17:01','1','1','Piso 7'),
('5ee94704-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:17:11','2023-09-19 11:17:11','1','1','Piso 8'),
('64048868-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:17:20','2023-09-19 11:17:20','1','1','Piso 9'),
('6aec24bf-5710-11ee-b06d-3cd92b4d9bf4','0','2023-09-19 11:17:32','2023-09-19 11:17:32','1','1','Piso 10');
/*!40000 ALTER TABLE `Cat_Pisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cat_TipoAcceso`
--

DROP TABLE IF EXISTS `Cat_TipoAcceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cat_TipoAcceso` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `catanio` (`Descripcion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cat_TipoAcceso`
--

LOCK TABLES `Cat_TipoAcceso` WRITE;
/*!40000 ALTER TABLE `Cat_TipoAcceso` DISABLE KEYS */;
INSERT INTO `Cat_TipoAcceso` VALUES
('f751513c-528e-11ee-b06d-3cd92b4d9bf4','0','2023-09-13 17:40:48','2023-09-13 17:40:48','1','1','Visitante'),
('fca60b42-528e-11ee-b06d-3cd92b4d9bf4','0','2023-09-13 17:40:57','2023-09-13 17:40:57','1','1','Proveedor');
/*!40000 ALTER TABLE `Cat_TipoAcceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Edificio`
--

DROP TABLE IF EXISTS `Usuario_Edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_Edificio` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `idUsuario` char(36) DEFAULT '',
  `IdEdificio` char(36) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_UE_EDIFICIO` (`IdEdificio`),
  CONSTRAINT `FK1_UE_EDIFICIO` FOREIGN KEY (`IdEdificio`) REFERENCES `Cat_Edificios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Edificio`
--

LOCK TABLES `Usuario_Edificio` WRITE;
/*!40000 ALTER TABLE `Usuario_Edificio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_Edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visita`
--

DROP TABLE IF EXISTS `Visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visita` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `FechaVisita` datetime NOT NULL,
  `FechaEntrada` datetime DEFAULT NULL,
  `FechaSalida` datetime DEFAULT NULL,
  `Duracion` int(11) NOT NULL DEFAULT 0,
  `IdTipoAcceso` char(36) NOT NULL,
  `Proveedor` varchar(300) DEFAULT NULL,
  `NombreVisitante` varchar(300) DEFAULT NULL,
  `ApellidoPVisitante` varchar(300) DEFAULT NULL,
  `ApellidoMVisitante` varchar(300) DEFAULT NULL,
  `idTipoentidad` char(36) DEFAULT NULL,
  `idEntidad` char(36) DEFAULT NULL,
  `NombreReceptor` varchar(300) NOT NULL,
  `ApellidoPReceptor` varchar(300) NOT NULL,
  `ApellidoMReceptor` varchar(300) NOT NULL,
  `IdEntidadReceptor` varchar(300) NOT NULL,
  `PisoReceptor` char(36) DEFAULT NULL,
  `IdEstatus` char(36) NOT NULL DEFAULT '35f06795-5183-11ee-b06d-3cd92b4d9bf4',
  `Finalizado` int(1) DEFAULT 0,
  `EmailNotificacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_TIPO_ACCESO` (`IdTipoAcceso`),
  KEY `FK2_ESTATUS_VISITAS` (`IdEstatus`),
  CONSTRAINT `FK1_TIPO_ACCESO` FOREIGN KEY (`IdTipoAcceso`) REFERENCES `Cat_TipoAcceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_ESTATUS_VISITAS` FOREIGN KEY (`IdEstatus`) REFERENCES `Cat_Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visita`
--

LOCK TABLES `Visita` WRITE;
/*!40000 ALTER TABLE `Visita` DISABLE KEYS */;
INSERT INTO `Visita` VALUES
('008d31c1-cdfa-4399-a9fe-9d5031710c33','0','2023-09-25 17:35:44','2023-09-25 17:35:44','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','2023-09-28 15:00:00',NULL,NULL,2,'f751513c-528e-11ee-b06d-3cd92b4d9bf4',NULL,'Adolfo Angel','Garcia','martinez','140bc448-4361-11ee-9014-3cd92b4d9bf4','57f9c228-4361-11ee-9014-3cd92b4d9bf4','veronica','cardenas','medina','0d6c5ee9-366c-11ee-af0d-3cd92b4d9bf4','5ee94704-5710-11ee-b06d-3cd92b4d9bf4','35f06795-5183-11ee-b06d-3cd92b4d9bf4',0,'aagarcia@cecapmex.com'),
('26ba2639-0301-4ad0-a115-81ba88b15739','0','2023-09-22 15:41:00','2023-09-22 15:23:59','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','2023-09-29 09:00:00','2023-09-22 21:42:07','2023-09-22 21:43:41',3,'fca60b42-528e-11ee-b06d-3cd92b4d9bf4','Ricardo','Ricardo','Rodriguez','López',NULL,NULL,'Oswaldo','Castro','López','57d290ef-3647-11ee-af0d-3cd92b4d9bf4','4e99655d-5710-11ee-b06d-3cd92b4d9bf4','0779435b-5718-11ee-b06d-3cd92b4d9bf4',0,'Ricardo'),
('57762a84-b823-4385-a027-8499e9599fa0','0','2023-09-22 13:16:16','2023-09-22 11:37:16','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','2023-09-25 13:00:00','2023-09-22 17:47:01','2023-09-22 19:18:57',2,'f751513c-528e-11ee-b06d-3cd92b4d9bf4',NULL,'Ricardo','Morales','Arjona','140bc448-4361-11ee-9014-3cd92b4d9bf4','57f9c228-4361-11ee-9014-3cd92b4d9bf4','Nelson','Torres','Cancela','57d290ef-3647-11ee-af0d-3cd92b4d9bf4','4e99655d-5710-11ee-b06d-3cd92b4d9bf4','0779435b-5718-11ee-b06d-3cd92b4d9bf4',1,NULL),
('b515fd64-1e48-4802-9dfa-e9a5c818fd77','0','2023-09-22 13:11:37','2023-09-22 11:59:09','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','2023-09-26 10:25:00','2023-09-22 18:22:38','2023-09-23 00:23:09',1,'f751513c-528e-11ee-b06d-3cd92b4d9bf4',NULL,'Ricardo','López','Martinez','140bc448-4361-11ee-9014-3cd92b4d9bf4','57f9c228-4361-11ee-9014-3cd92b4d9bf4','Guadalupe','Jiménez','Esparza','0d6c5ee9-366c-11ee-af0d-3cd92b4d9bf4','5ee94704-5710-11ee-b06d-3cd92b4d9bf4','0779435b-5718-11ee-b06d-3cd92b4d9bf4',1,NULL),
('f2139285-2591-4744-933d-6469a2f664f0','0','2023-09-22 11:13:57','2023-09-22 11:12:08','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','2023-09-25 18:00:00','2023-09-22 17:15:55','2023-09-22 17:16:38',2,'f751513c-528e-11ee-b06d-3cd92b4d9bf4',NULL,'Angel','Perez','Ochoa','140bc448-4361-11ee-9014-3cd92b4d9bf4','57f9c228-4361-11ee-9014-3cd92b4d9bf4','Juan','Chaves','Marroquí','27ee21b0-4d8c-11ee-8002-d89d6776f970','5ee94704-5710-11ee-b06d-3cd92b4d9bf4','0779435b-5718-11ee-b06d-3cd92b4d9bf4',NULL,NULL),
('f69087a0-2e7c-41af-becb-37e9f8e106bb','0','2023-09-22 15:53:55','2023-09-22 15:53:18','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','2023-09-22 16:00:00','2023-09-22 21:56:36',NULL,6,'f751513c-528e-11ee-b06d-3cd92b4d9bf4',NULL,'Antonio','Aguilar','Tarso','140bc448-4361-11ee-9014-3cd92b4d9bf4','57f9c228-4361-11ee-9014-3cd92b4d9bf4','Fernando','García','Lemis','0d6c5ee9-366c-11ee-af0d-3cd92b4d9bf4','5ee94704-5710-11ee-b06d-3cd92b4d9bf4','4112a976-5183-11ee-b06d-3cd92b4d9bf4',0,NULL);
/*!40000 ALTER TABLE `Visita` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `INS_VISITA` BEFORE INSERT ON `Visita` FOR EACH ROW BEGIN
INSERT INTO SICA.VisitaBitacora(	
	ModificadoPor,
	CreadoPor,
	IdVisita,
	IdEstatus
	)
	VALUES(
	NEW.ModificadoPor,
	NEW.CreadoPor,
	NEW.Id,
	NEW.IdEstatus
	);
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `UPS_VISITA` BEFORE UPDATE ON `Visita` FOR EACH ROW BEGIN
INSERT INTO SICA.VisitaBitacora(	
	ModificadoPor,
	CreadoPor,
	IdVisita,
	IdEstatus
	)
	VALUES(
	NEW.ModificadoPor,
	NEW.CreadoPor,
	NEW.Id,
	NEW.IdEstatus
	);

	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `VisitaBitacora`
--

DROP TABLE IF EXISTS `VisitaBitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VisitaBitacora` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `IdVisita` char(36) NOT NULL,
  `IdEstatus` char(36) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK2_ESTATUS` (`IdEstatus`),
  CONSTRAINT `FK2_ESTATUS` FOREIGN KEY (`IdEstatus`) REFERENCES `Cat_Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VisitaBitacora`
--

LOCK TABLES `VisitaBitacora` WRITE;
/*!40000 ALTER TABLE `VisitaBitacora` DISABLE KEYS */;
INSERT INTO `VisitaBitacora` VALUES
('049e02d5-597d-11ee-a933-236cb4402701','0','2023-09-22 12:19:57','2023-09-22 12:19:57','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','b515fd64-1e48-4802-9dfa-e9a5c818fd77','4112a976-5183-11ee-b06d-3cd92b4d9bf4'),
('09cc5d21-5984-11ee-a933-236cb4402701','0','2023-09-22 13:10:13','2023-09-22 13:10:13','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','57762a84-b823-4385-a027-8499e9599fa0','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('0ac16222-5999-11ee-a933-236cb4402701','0','2023-09-22 15:40:34','2023-09-22 15:40:34','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','26ba2639-0301-4ad0-a115-81ba88b15739','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('0b07364a-5978-11ee-a933-236cb4402701','0','2023-09-22 11:44:21','2023-09-22 11:44:21','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','57762a84-b823-4385-a027-8499e9599fa0','4112a976-5183-11ee-b06d-3cd92b4d9bf4'),
('0de455e0-5977-11ee-a933-236cb4402701','0','2023-09-22 11:37:16','2023-09-22 11:37:16','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','57762a84-b823-4385-a027-8499e9599fa0','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('176497e0-597d-11ee-a933-236cb4402701','0','2023-09-22 12:20:29','2023-09-22 12:20:29','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','b515fd64-1e48-4802-9dfa-e9a5c818fd77','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('1a835cbb-5999-11ee-a933-236cb4402701','0','2023-09-22 15:41:00','2023-09-22 15:41:00','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','26ba2639-0301-4ad0-a115-81ba88b15739','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('1ca033af-597a-11ee-a933-236cb4402701','0','2023-09-22 11:59:09','2023-09-22 11:59:09','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','b515fd64-1e48-4802-9dfa-e9a5c818fd77','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('2968cbde-5977-11ee-a933-236cb4402701','0','2023-09-22 11:38:02','2023-09-22 11:38:02','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','57762a84-b823-4385-a027-8499e9599fa0','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('31d67477-5997-11ee-a933-236cb4402701','0','2023-09-22 15:27:20','2023-09-22 15:27:20','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','26ba2639-0301-4ad0-a115-81ba88b15739','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('39f69125-597a-11ee-a933-236cb4402701','0','2023-09-22 11:59:58','2023-09-22 11:59:58','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','b515fd64-1e48-4802-9dfa-e9a5c818fd77','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('3c034153-5984-11ee-a933-236cb4402701','0','2023-09-22 13:11:37','2023-09-22 13:11:37','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','b515fd64-1e48-4802-9dfa-e9a5c818fd77','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('3dc0f198-5997-11ee-a933-236cb4402701','0','2023-09-22 15:27:40','2023-09-22 15:27:40','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','26ba2639-0301-4ad0-a115-81ba88b15739','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('6f192d41-5997-11ee-a933-236cb4402701','0','2023-09-22 15:29:03','2023-09-22 15:29:03','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','26ba2639-0301-4ad0-a115-81ba88b15739','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('860a049f-5978-11ee-a933-236cb4402701','0','2023-09-22 11:47:47','2023-09-22 11:47:47','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','57762a84-b823-4385-a027-8499e9599fa0','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('8adb9f7a-5973-11ee-a933-236cb4402701','0','2023-09-22 11:12:08','2023-09-22 11:12:08','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','f2139285-2591-4744-933d-6469a2f664f0','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('9c6b5c34-5978-11ee-a933-236cb4402701','0','2023-09-22 11:48:25','2023-09-22 11:48:25','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','57762a84-b823-4385-a027-8499e9599fa0','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('a0d94d0a-5c04-11ee-a933-236cb4402701','0','2023-09-25 17:35:44','2023-09-25 17:35:44','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','008d31c1-cdfa-4399-a9fe-9d5031710c33','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('b2c05d2d-5973-11ee-a933-236cb4402701','0','2023-09-22 11:13:15','2023-09-22 11:13:15','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','f2139285-2591-4744-933d-6469a2f664f0','4112a976-5183-11ee-b06d-3cd92b4d9bf4'),
('b9da016f-5996-11ee-a933-236cb4402701','0','2023-09-22 15:23:59','2023-09-22 15:23:59','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','26ba2639-0301-4ad0-a115-81ba88b15739','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('c4dfd33d-5973-11ee-a933-236cb4402701','0','2023-09-22 11:13:45','2023-09-22 11:13:45','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','f2139285-2591-4744-933d-6469a2f664f0','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('cc3beb43-5973-11ee-a933-236cb4402701','0','2023-09-22 11:13:57','2023-09-22 11:13:57','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','f2139285-2591-4744-933d-6469a2f664f0','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('d28ebd22-599a-11ee-a933-236cb4402701','0','2023-09-22 15:53:18','2023-09-22 15:53:18','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','f69087a0-2e7c-41af-becb-37e9f8e106bb','35f06795-5183-11ee-b06d-3cd92b4d9bf4'),
('d9f0a047-5984-11ee-a933-236cb4402701','0','2023-09-22 13:16:02','2023-09-22 13:16:02','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','57762a84-b823-4385-a027-8499e9599fa0','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('e280f484-5984-11ee-a933-236cb4402701','0','2023-09-22 13:16:16','2023-09-22 13:16:16','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','57762a84-b823-4385-a027-8499e9599fa0','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('e2da42b6-5998-11ee-a933-236cb4402701','0','2023-09-22 15:39:27','2023-09-22 15:39:27','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','26ba2639-0301-4ad0-a115-81ba88b15739','4112a976-5183-11ee-b06d-3cd92b4d9bf4'),
('e8984f94-599a-11ee-a933-236cb4402701','0','2023-09-22 15:53:55','2023-09-22 15:53:55','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','f69087a0-2e7c-41af-becb-37e9f8e106bb','4112a976-5183-11ee-b06d-3cd92b4d9bf4'),
('fb4281c2-5998-11ee-a933-236cb4402701','0','2023-09-22 15:40:08','2023-09-22 15:40:08','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','26ba2639-0301-4ad0-a115-81ba88b15739','0779435b-5718-11ee-b06d-3cd92b4d9bf4'),
('fda02248-5997-11ee-a933-236cb4402701','0','2023-09-22 15:33:02','2023-09-22 15:33:02','30adc962-7109-11ed-a880-040300000000','30adc962-7109-11ed-a880-040300000000','26ba2639-0301-4ad0-a115-81ba88b15739','35f06795-5183-11ee-b06d-3cd92b4d9bf4');
/*!40000 ALTER TABLE `VisitaBitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'SICA'
--

--
-- Dumping routines for database 'SICA'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUserName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getUserName`(`ID_USUARIO` CHAR(36)
) RETURNS varchar(150) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
BEGIN
   DECLARE RESP VARCHAR(150);
	   SELECT   concat(usu.Nombre,' ',usu.ApellidoPaterno,' ',usu.ApellidoMaterno)  INTO RESP	FROM TiCentral.Usuarios usu	WHERE usu.Id = ID_USUARIO ;
	   if RESP IS NOT NULL then
	   RETURN RESP;
	   else
		RETURN 'Validando...';
      END if;
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

-- Dump completed on 2023-09-26  9:17:58
