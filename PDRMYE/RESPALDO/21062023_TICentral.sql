-- --------------------------------------------------------
-- Host:                         10.210.0.29
-- Versión del servidor:         10.8.6-MariaDB - MariaDB Server
-- SO del servidor:              Linux
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para TiCentral
CREATE DATABASE IF NOT EXISTS `TiCentral` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `TiCentral`;

-- Volcando estructura para tabla TiCentral.Apps
DROP TABLE IF EXISTS `Apps`;
CREATE TABLE IF NOT EXISTS `Apps` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Nombre` varchar(3000) NOT NULL,
  `Descripcion` varchar(5000) NOT NULL,
  `Path` varchar(30) NOT NULL,
  `EstaActivo` tinyint(1) NOT NULL DEFAULT 0,
  `CreadoPor` char(36) NOT NULL,
  `FechaDeCreacion` datetime NOT NULL,
  `UltimaModificacion` datetime NOT NULL,
  `ModificadoPor` char(36) NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK1_Apps_C` (`CreadoPor`) USING BTREE,
  KEY `FK2_Apps_M` (`ModificadoPor`) USING BTREE,
  CONSTRAINT `FK1_Apps_C` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_Apps_M` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla TiCentral.Apps: ~3 rows (aproximadamente)
DELETE FROM `Apps`;
/*!40000 ALTER TABLE `Apps` DISABLE KEYS */;
INSERT INTO `Apps` (`Id`, `Nombre`, `Descripcion`, `Path`, `EstaActivo`, `CreadoPor`, `FechaDeCreacion`, `UltimaModificacion`, `ModificadoPor`, `Deleted`) VALUES
	('8d2de28e-c9b6-11ed-afa1-0242ac120002', 'PLATAFORMA DE DOCUMENTACIÓN OFICIAL', 'Plataforma para enviar y recibir documentación oficial entre la Tesorería Estatal, Municipios y Organismos Públicos Descentralizados, en materia de distribución de recursos, usando la firma electrónica avanzada (efirma) expedida por el SAT.', 'http://10.210.0.28:3000', 1, 'd8483c80-c9b4-11ed-afa1-0242ac120002', '2023-03-23 14:10:19', '2023-03-23 14:10:24', 'd8483c80-c9b4-11ed-afa1-0242ac120002', 0),
	('973ecf89-38ff-11ed-aed0-040300000000', 'PLATAFORMA DE DISTRIBUCIÓN DE RECURSOS A MUNICIPIOS Y ORGANISMOS PÚBLICOS DESCENTRALIZADOS', 'Plataforma de distribución de recursos económicos a los Municipios del Estado de Nuevo León, así como para los Organismos Públicos Descentralizados del Gobierno del Estado de Nuevo León.', 'http://10.210.0.28:81', 1, '30adc962-7109-11ed-a880-040300000000', '2022-09-20 11:16:28', '2022-11-04 12:41:32', '30adc962-7109-11ed-a880-040300000000', 0),
	('f18ad0d4-3087-11ed-aed0-040300000000', 'PLATAFORMA DE ACCESO ÚNICO Y APLICACIONES', 'Plataforma que concentra la gestión tanto de usuarios como de accesos a las diversas aplicaciones; permitirá la administración, autorización o denegación del acceso a usuarios y las aplicaciones activas.', './admin', 1, '30adc962-7109-11ed-a880-040300000000', '2022-09-09 16:39:54', '2022-09-09 16:39:54', '30adc962-7109-11ed-a880-040300000000', 0);
/*!40000 ALTER TABLE `Apps` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Comentarios
DROP TABLE IF EXISTS `Comentarios`;
CREATE TABLE IF NOT EXISTS `Comentarios` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `IdSolicitud` char(36) NOT NULL,
  `Comentario` varchar(2000) NOT NULL,
  `CreadoPor` char(36) NOT NULL,
  `FechaDeCreacion` datetime NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IdSolicitud` (`IdSolicitud`) USING BTREE,
  KEY `CreadoPor` (`CreadoPor`) USING BTREE,
  CONSTRAINT `FK_Comentarios_Solicitudes` FOREIGN KEY (`IdSolicitud`) REFERENCES `Solicitudes` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Comentarios_Usuario_Creado` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC COMMENT='Comentarios de las solicitudes de nuevos usuarios';

-- Volcando datos para la tabla TiCentral.Comentarios: ~0 rows (aproximadamente)
DELETE FROM `Comentarios`;
/*!40000 ALTER TABLE `Comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comentarios` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.plantillas
DROP TABLE IF EXISTS `plantillas`;
CREATE TABLE IF NOT EXISTS `plantillas` (
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `referencia` varchar(256) NOT NULL,
  `body` varchar(256) NOT NULL,
  `parametros` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`parametros`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla TiCentral.plantillas: ~0 rows (aproximadamente)
DELETE FROM `plantillas`;
/*!40000 ALTER TABLE `plantillas` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantillas` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Solicitudes
DROP TABLE IF EXISTS `Solicitudes`;
CREATE TABLE IF NOT EXISTS `Solicitudes` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPaterno` varchar(20) NOT NULL,
  `ApellidoMaterno` varchar(20) NOT NULL,
  `NombreUsuario` varchar(30) NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `Curp` varchar(18) NOT NULL,
  `Rfc` varchar(13) NOT NULL,
  `Celular` varchar(10) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Ext` varchar(4) NOT NULL,
  `TipoSolicitud` char(36) NOT NULL,
  `DatosAdicionales` varchar(2000) NOT NULL,
  `IdApp` char(36) NOT NULL,
  `Estatus` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `CreadoPor` char(36) NOT NULL,
  `FechaDeCreacion` datetime NOT NULL,
  `UltimaModificacion` datetime NOT NULL,
  `ModificadoPor` char(36) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `CreadoPor` (`CreadoPor`),
  KEY `ModificadoPor` (`ModificadoPor`),
  KEY `IdApp` (`IdApp`),
  KEY `FK_Solicitudes_TipoSolicitud` (`TipoSolicitud`),
  CONSTRAINT `FK_Solicitudes_Apps` FOREIGN KEY (`IdApp`) REFERENCES `Apps` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_TipoSolicitud` FOREIGN KEY (`TipoSolicitud`) REFERENCES `TipoSolicitud` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_Usuarios_2` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_Usuarios_3` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Solicitudes de usuarios nuevos';

-- Volcando datos para la tabla TiCentral.Solicitudes: ~26 rows (aproximadamente)
DELETE FROM `Solicitudes`;
/*!40000 ALTER TABLE `Solicitudes` DISABLE KEYS */;
INSERT INTO `Solicitudes` (`Id`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `NombreUsuario`, `CorreoElectronico`, `Curp`, `Rfc`, `Celular`, `Telefono`, `Ext`, `TipoSolicitud`, `DatosAdicionales`, `IdApp`, `Estatus`, `CreadoPor`, `FechaDeCreacion`, `UltimaModificacion`, `ModificadoPor`) VALUES
	('09e620ae-b87d-11ed-8002-d89d6776f970', 'PEDRO HIGINIO', 'SALAZAR', 'OBREGÓN', 'pedroh.salazar', 'pedroh.salazar@nuevoleon.gob.mx', 'SAOP730910HNLLBD01', 'SAOP7309109X3', '8120202483', '8120202483', '2483', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-01 14:04:29', '2023-03-01 14:06:25', '30adc962-7109-11ed-a880-040300000000'),
	('1ad71765-0fbd-11ee-8002-d89d6776f970', 'Yessica Guadalupe', 'Rodríguez', 'Cantú', 'yessica.rodriguez', 'yessica.rodriguez@nuevoleon.gob.mx', 'ROCY871008MNLDNS00', 'ROCY871008QB3', '0', '8120206226', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-20 15:52:16', '2023-06-20 16:54:27', '30adc962-7109-11ed-a880-040300000000'),
	('1fcd0149-e085-11ed-8002-d89d6776f970', 'Rocío Esmeralda', 'Martínez', 'Lucio', 'rocio.martinez', 'rocio.martinezl@nuevoleon.gob.mx', 'MALR890330MNLRCC09', 'MALR890330CK7', '8120201420', '8120201420', '1420', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-21 13:43:08', '2023-04-21 13:44:11', '30adc962-7109-11ed-a880-040300000000'),
	('216c9795-0fbe-11ee-8002-d89d6776f970', 'Gabriela', 'Flores', 'Guerrero', 'gabriela.flores', 'gabriela.flores@nuevoleon.gob.mx', 'FOGG680324MNLLRB09', 'FOGG680324MT3', '0', '8120201343', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-20 15:59:37', '2023-06-20 16:54:36', '30adc962-7109-11ed-a880-040300000000'),
	('280971e0-0ed7-11ee-8002-d89d6776f970', 'Juan José', 'Garza', 'Hernández', 'juanjose.garza', 'juanjose.garza@nuevoleon.gob.mx', 'GAHJ850624HNLRRN02', 'GAHJ8506243R2', '8112497438', '8120201300', '1324', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-19 12:26:14', '2023-06-19 13:05:37', '30adc962-7109-11ed-a880-040300000000'),
	('2ada55e8-dedc-11ed-8002-d89d6776f970', 'Usuario', 'Genérico', 'DORG', 'DAMOPORG', 'DAMOPORG@pruebas.com', 'DAMOPORG12MVZYNN09', 'DAMOPORG12345', '5678', '1234', '910', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-19 11:01:11', '2023-04-19 11:02:34', '30adc962-7109-11ed-a880-040300000000'),
	('2fad75f3-b79f-11ed-8002-d89d6776f970', 'Juan Fernando', 'Chávez', 'Marroquín', 'juan.chavez', 'juan.chavez@nuevoleon.gob.mx', 'CAMJ871029HNLHRN02', 'CAMJ871029FP4', '8126902423', '8120201460', '1460', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 11:36:24', '2023-02-28 11:36:45', '30adc962-7109-11ed-a880-040300000000'),
	('39314051-b941-11ed-8002-d89d6776f970', 'JUAN CARLOS', 'GONZALEZ', 'ROMERO', 'juan.gonzalezr', 'juan.gonzalezr@nuevoleon.gob.mx', 'GORJ741101HDFNMN11', 'GORJ7411014U7', '6671672940', '8120201377', '1', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-02 13:28:50', '2023-03-02 13:34:48', '30adc962-7109-11ed-a880-040300000000'),
	('3e0cf417-ded7-11ed-8002-d89d6776f970', 'Cesar', 'Mares', 'Gomez', 'cesar.mares', 'cesar.mare2@nuevoleon.gob.mx', 'GAMA920807EB6HDDDD', 'XXXXXXXXXXXXX', '1234567895', '1234567895', '125', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-19 10:25:55', '2023-04-19 10:26:19', '30adc962-7109-11ed-a880-040300000000'),
	('40ad483f-b87d-11ed-8002-d89d6776f970', 'MARIA MAYELA', 'GUAJARDO', 'LOPEZ', 'mayela.guajardo', 'mayela.guajardo@nuevoleon.gob.mx', 'GULM720817MNLJPY07', 'GULM7208176R0', '8111836742', '8120201475', '1475', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-01 14:06:01', '2023-03-01 14:06:22', '30adc962-7109-11ed-a880-040300000000'),
	('5e6f44d1-d7c5-11ed-8581-040300000000', 'Usuario ', 'Genérico', 'DCCP', 'DCCP', 'dccp@test.com', 'DCCP980207MMCCRRB4', 'RFCGENERICO10', '3254561874', '9187563254', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-10 12:30:21', '2023-04-10 12:32:14', '30adc962-7109-11ed-a880-040300000000'),
	('5e82153e-b7b0-11ed-8002-d89d6776f970', 'Samantha Rubi', 'Nava', 'Luevano', 'samantha.nava', 'samantha.nava@nuevoleon.gob.mx', 'NALS921204MNLVVM06', 'NALS921204I74', '8120201300', '8120201300', '1347', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 13:39:24', '2023-02-28 13:44:03', '30adc962-7109-11ed-a880-040300000000'),
	('738d370b-0ed5-11ee-8002-d89d6776f970', 'Héctor Inocencio', 'Pérez', 'Trujillo', 'hector.perez', 'hector.perez@nuevoleon.gob.mx', 'PETH650915HNLRRC05', 'PETH6509154M8', '8114953190', '8120201300', '1333', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-19 12:14:02', '2023-06-19 13:05:18', '30adc962-7109-11ed-a880-040300000000'),
	('804945f7-0fbf-11ee-8002-d89d6776f970', 'María de Lourdes', 'Dávila', 'Gámez', 'lourdes.davila', 'lourdes.davila@nuevoleon.gob.mx', 'DAGL770703MNLVMR07', 'DAGL770703786', '0', '8120207738', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-20 16:09:26', '2023-06-20 16:54:40', '30adc962-7109-11ed-a880-040300000000'),
	('91a8c8a8-0ed7-11ee-8002-d89d6776f970', 'Miguel Ángel', 'Contreras', 'Sánchez', 'miguel.contreras', 'miguel.contreras@nuevoleon.gob.mx', 'COSM820913HNLNNG03', 'COSM820913QE2', '8111704814', '8120201300', '6200', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-19 12:29:11', '2023-06-19 13:05:43', '30adc962-7109-11ed-a880-040300000000'),
	('94b76caa-b7b0-11ed-8002-d89d6776f970', 'Francisco Alberto', 'Bernal', 'Hernandez', 'francisco.bernal', 'francisco.bernal@nuevoleon.gob.mx', 'BEHF941004HNLRRR02', 'BEHF941004MN6', '8120201300', '8120201300', '1378', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 13:40:55', '2023-02-28 13:44:01', '30adc962-7109-11ed-a880-040300000000'),
	('af9f7a80-df05-11ed-8002-d89d6776f970', 'Susana Patricia', 'Ruiz', 'González', 'susana.ruiz', 'susana.ruiz@nuevoleon.gob.mx', 'RUGS711123MNLZNS05', 'RUGS711123KFA', '0', '8120201474', '1474', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-19 15:58:23', '2023-04-19 16:03:52', '30adc962-7109-11ed-a880-040300000000'),
	('c9839247-b7b0-11ed-8002-d89d6776f970', 'Alexa Gabriela', 'Hernandez', 'Ibarra', 'alexa.hernandez', 'alexa.hernandez@nuevoleon.gob.mx', 'HEIA991014MNLRBL07', 'HEIA991014UFA', '8120201300', '8120201300', '6284', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 13:42:24', '2023-02-28 13:43:59', '30adc962-7109-11ed-a880-040300000000'),
	('cb8b018d-0ed6-11ee-8002-d89d6776f970', 'Alfredo Francisco', 'Acevedo', 'Puente', 'alfredo.acevedo', 'alfredo.acevedo@nuevoleon.gob.mx', 'AEPA741004HNLCNL00', 'AEPA7410041B9', '8117380599', '8120201300', '1319', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-19 12:23:39', '2023-06-19 13:05:28', '30adc962-7109-11ed-a880-040300000000'),
	('cb993d7a-b84f-11ed-8002-d89d6776f970', 'Karla Yesenia', 'Delgado', 'Garcia ', 'karla.delgado', 'karla.delgado@nuevoleon.gob.mx', 'DEGK900306MNLLRR05', 'DEGK900306PR9', '8120201377', '8120201377', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-01 08:40:37', '2023-03-01 08:42:04', '30adc962-7109-11ed-a880-040300000000'),
	('cd3a3266-0f9f-11ee-8002-d89d6776f970', 'Organismo', 'x', 'x', 'organismo', 'Organismo@nuevoleon.gob.mx', 'PETH650915HNLRRC05', 'GAMA920807EB6', '8114953190', '8120201300', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-20 12:22:31', '2023-06-20 12:23:30', '30adc962-7109-11ed-a880-040300000000'),
	('d3413f61-b87c-11ed-8002-d89d6776f970', 'ELISA', 'MADERA', 'HOLTEN', 'elisa.madera', 'elisa.madera@nuevoleon.gob.mx', 'MAHE701125MNLDLL01', 'MAHE701125Q47', '8120201340', '8120201340', '1340', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-01 14:02:57', '2023-03-01 14:06:28', '30adc962-7109-11ed-a880-040300000000'),
	('d402cfd3-0ef4-11ee-8002-d89d6776f970', 'Municipio GENL', 'x', 'x', 'Municipio', 'municipio@genl.com', 'GAMA920807EB6SSSSS', 'MUNI920807EB6', '8126980895', '8126980895', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-19 15:58:38', '2023-06-19 15:59:05', '30adc962-7109-11ed-a880-040300000000'),
	('da8fa090-0fbd-11ee-8002-d89d6776f970', 'Fabian', 'Pino', 'Pérez', 'fabian.pino', 'fabian.pino@nuevoleon.gob.mx', 'PIPF750524MNLNRB08', 'PIPF7505241X1', '0', '8120201344', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-20 15:57:38', '2023-06-20 16:54:33', '30adc962-7109-11ed-a880-040300000000'),
	('dc238691-0717-11ee-8002-d89d6776f970', 'Olaguibel Antonio', 'Montemayor', 'Garza', 'olaguibel.montemayor', 'olaguibel.montemayor@nuevoleon.gob.mx', 'MOGO740613HNLNRL02', 'MOGO740613CQ4', '8112512736', '8120202485', '2485', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-06-09 15:49:15', '2023-06-09 15:51:07', '30adc962-7109-11ed-a880-040300000000'),
	('f739ea4e-b7b0-11ed-8002-d89d6776f970', 'Monica Elizabeth', 'Gonzalez', 'Sandoval', 'monica.gonzalezs', 'monica.gonzalezs@nuevoleon.gob.mx', 'GOSM701129MNLNNN02', 'GOSM701129QQ2', '8120201300', '8120201300', '2497', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 13:43:40', '2023-02-28 13:43:56', '30adc962-7109-11ed-a880-040300000000');
/*!40000 ALTER TABLE `Solicitudes` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.TipoSolicitud
DROP TABLE IF EXISTS `TipoSolicitud`;
CREATE TABLE IF NOT EXISTS `TipoSolicitud` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `tipoSoli` varchar(50) NOT NULL,
  `creadoPor` char(36) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_TipoSolicitud_Usuarios` (`creadoPor`) USING BTREE,
  CONSTRAINT `FK_TipoSolicitud_Usuarios` FOREIGN KEY (`creadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla TiCentral.TipoSolicitud: ~4 rows (aproximadamente)
DELETE FROM `TipoSolicitud`;
/*!40000 ALTER TABLE `TipoSolicitud` DISABLE KEYS */;
INSERT INTO `TipoSolicitud` (`id`, `tipoSoli`, `creadoPor`, `fechaCreacion`) VALUES
	('a5838dce-6c49-11ed-a880-040300000000', 'Alta ', '30adc962-7109-11ed-a880-040300000000', '2022-11-24 15:45:08'),
	('ab75eb3e-6c49-11ed-a880-040300000000', 'Baja ', '30adc962-7109-11ed-a880-040300000000', '2022-11-24 15:45:18'),
	('b6e59f3b-6c49-11ed-a880-040300000000', 'Modificacion ', '30adc962-7109-11ed-a880-040300000000', '2022-11-24 15:45:37'),
	('c326ea8b-6c49-11ed-a880-040300000000', 'Vinculacion ', '30adc962-7109-11ed-a880-040300000000', '2022-11-24 15:45:58');
/*!40000 ALTER TABLE `TipoSolicitud` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.TipoUsuario
DROP TABLE IF EXISTS `TipoUsuario`;
CREATE TABLE IF NOT EXISTS `TipoUsuario` (
  `Id` char(36) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC COMMENT='Tipo de Usuario central\r\n';

-- Volcando datos para la tabla TiCentral.TipoUsuario: ~3 rows (aproximadamente)
DELETE FROM `TipoUsuario`;
/*!40000 ALTER TABLE `TipoUsuario` DISABLE KEYS */;
INSERT INTO `TipoUsuario` (`Id`, `Nombre`, `Descripcion`) VALUES
	('b055eb06-6438-11ed-a880-040300000000', 'AdminGeneral', 'Administración General'),
	('b055ed42-6438-11ed-a880-040300000000', 'AdminPlataforma', 'Administración de la plataforma'),
	('b055eea8-6438-11ed-a880-040300000000', 'User', 'Usuario');
/*!40000 ALTER TABLE `TipoUsuario` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.UsuarioAplicacion
DROP TABLE IF EXISTS `UsuarioAplicacion`;
CREATE TABLE IF NOT EXISTS `UsuarioAplicacion` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `IdUsuario` char(36) NOT NULL,
  `IdApp` char(36) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK1_Usuario` (`IdUsuario`) USING BTREE,
  KEY `FK2_App` (`IdApp`) USING BTREE,
  CONSTRAINT `FK1_Usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_App` FOREIGN KEY (`IdApp`) REFERENCES `Apps` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla TiCentral.UsuarioAplicacion: ~40 rows (aproximadamente)
DELETE FROM `UsuarioAplicacion`;
/*!40000 ALTER TABLE `UsuarioAplicacion` DISABLE KEYS */;
INSERT INTO `UsuarioAplicacion` (`Id`, `IdUsuario`, `IdApp`) VALUES
	('0097a86e-b7b1-11ed-8002-d89d6776f970', 'f739ea4e-b7b0-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('02204db9-b7b1-11ed-8002-d89d6776f970', 'c9839247-b7b0-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('038dbf77-b7b1-11ed-8002-d89d6776f970', '94b76caa-b7b0-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('04ff744b-b7b1-11ed-8002-d89d6776f970', '5e82153e-b7b0-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('0e88ee24-b942-11ed-8002-d89d6776f970', '39314051-b941-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('156d66d4-c9b7-11ed-8002-d89d6776f970', 'd8483c80-c9b4-11ed-afa1-0242ac120002', '8d2de28e-c9b6-11ed-afa1-0242ac120002'),
	('1eb1ee04-0718-11ee-8002-d89d6776f970', 'dc238691-0717-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('3c2e162f-b79f-11ed-8002-d89d6776f970', '2fad75f3-b79f-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('457a8087-e085-11ed-8002-d89d6776f970', '1fcd0149-e085-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('4c69e88e-ded7-11ed-8002-d89d6776f970', '3e0cf417-ded7-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('4d4f866c-b87d-11ed-8002-d89d6776f970', '40ad483f-b87d-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('4f1e5a0f-b87d-11ed-8002-d89d6776f970', '09e620ae-b87d-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('50f61235-b87d-11ed-8002-d89d6776f970', 'd3413f61-b87c-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('5c739526-dedc-11ed-8002-d89d6776f970', '2ada55e8-dedc-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('73af3d9b-df06-11ed-8002-d89d6776f970', 'af9f7a80-df05-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('7c9deeed-a734-11ed-8002-d89d6776f970', '0c130706-7266-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('830b0d35-a734-11ed-8002-d89d6776f970', '209d29f5-71dc-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('860ccdb8-a734-11ed-8002-d89d6776f970', '440b6024-7267-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('8870c886-a734-11ed-8002-d89d6776f970', '5430da9a-71da-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('8aeddf2c-a734-11ed-8002-d89d6776f970', '6c261f7f-71d9-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('8d480b7f-a734-11ed-8002-d89d6776f970', '74f8e43f-7266-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('8fce66df-a734-11ed-8002-d89d6776f970', '93a07e88-7267-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('9202f764-a734-11ed-8002-d89d6776f970', 'bdc43309-7266-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('94649813-a734-11ed-8002-d89d6776f970', 'd1a8f9cd-71db-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('97429e7a-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('97531051-a734-11ed-8002-d89d6776f970', 'e01a653e-725f-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('9ce97724-0edc-11ee-8002-d89d6776f970', '738d370b-0ed5-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('a1ffa446-d7c5-11ed-8581-040300000000', '5e6f44d1-d7c5-11ed-8581-040300000000', '973ecf89-38ff-11ed-aed0-040300000000'),
	('a2cd3091-0edc-11ee-8002-d89d6776f970', 'cb8b018d-0ed6-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('a48261c8-ee8a-11ed-a05b-0242ac120003', '30adc962-7109-11ed-a880-040300000000', '8d2de28e-c9b6-11ed-afa1-0242ac120002'),
	('a58863fa-a732-11ed-8002-d89d6776f970', '30adc962-7109-11ed-a880-040300000000', 'f18ad0d4-3087-11ed-aed0-040300000000'),
	('a8302c49-0edc-11ee-8002-d89d6776f970', '280971e0-0ed7-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('abfbdec0-0edc-11ee-8002-d89d6776f970', '91a8c8a8-0ed7-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('ca69da35-0fc5-11ee-8002-d89d6776f970', '1ad71765-0fbd-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('cdf1f96a-0fc5-11ee-8002-d89d6776f970', 'da8fa090-0fbd-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('d0200237-0fc5-11ee-8002-d89d6776f970', '216c9795-0fbe-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('d24d5eb6-0fc5-11ee-8002-d89d6776f970', '804945f7-0fbf-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('e421c73d-0ef4-11ee-8002-d89d6776f970', 'd402cfd3-0ef4-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('f0502079-0f9f-11ee-8002-d89d6776f970', 'cd3a3266-0f9f-11ee-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000'),
	('ff652039-b84f-11ed-8002-d89d6776f970', 'cb993d7a-b84f-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000');
/*!40000 ALTER TABLE `UsuarioAplicacion` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Usuarios
DROP TABLE IF EXISTS `Usuarios`;
CREATE TABLE IF NOT EXISTS `Usuarios` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPaterno` varchar(20) NOT NULL,
  `ApellidoMaterno` varchar(20) NOT NULL,
  `NombreUsuario` varchar(30) NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Curp` varchar(18) NOT NULL,
  `Rfc` varchar(13) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Ext` varchar(4) NOT NULL,
  `Celular` varchar(10) NOT NULL,
  `IdTipoUsuario` char(36) NOT NULL,
  `UltimoInicioDeSesion` datetime NOT NULL,
  `EstaActivo` tinyint(1) NOT NULL DEFAULT 0,
  `CreadoPor` char(36) NOT NULL DEFAULT '0',
  `FechaDeCreacion` datetime NOT NULL,
  `UltimaModificacion` datetime NOT NULL,
  `ModificadoPor` char(36) NOT NULL DEFAULT '',
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  `PuedeFirmar` tinyint(1) NOT NULL DEFAULT 0,
  `Puesto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IdTipoUsuario` (`IdTipoUsuario`) USING BTREE,
  KEY `FK_Usuario_Creado` (`CreadoPor`) USING BTREE,
  KEY `FK_Usuario_Modificado` (`ModificadoPor`) USING BTREE,
  CONSTRAINT `FK_Usuario_Creado` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Usuario_Modificado` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Usuarios_TipoUsuario` FOREIGN KEY (`IdTipoUsuario`) REFERENCES `TipoUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla TiCentral.Usuarios: ~38 rows (aproximadamente)
DELETE FROM `Usuarios`;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` (`Id`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `NombreUsuario`, `CorreoElectronico`, `Contrasena`, `Curp`, `Rfc`, `Telefono`, `Ext`, `Celular`, `IdTipoUsuario`, `UltimoInicioDeSesion`, `EstaActivo`, `CreadoPor`, `FechaDeCreacion`, `UltimaModificacion`, `ModificadoPor`, `Deleted`, `PuedeFirmar`, `Puesto`) VALUES
	('09e620ae-b87d-11ed-8002-d89d6776f970', 'PEDRO HIGINIO', 'SALAZAR', 'OBREGÓN', 'pedroh.salazar', 'pedroh.salazar@nuevoleon.gob.mx', '$2a$10$9iWvs9oOFS2n6UD/S0OvXuepItogbFORLRb1HtfSrUPw.RYNn5Hzy', 'SAOP730910HNLLBD01', 'SAOP7309109X3', '8120202483', '2483', '8120202483', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-16 09:24:06', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'GENERICO'),
	('0c130706-7266-11ed-a880-040300000000', 'Angel Genaro', 'Carreon', 'Diaz', 'angel.carreon', 'angel.carreon@nuevoleon.gob.mx', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'CADA880713HNLRZN00', 'CADA8807133DA', '8120202470', '2470', '8111982868', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-15 11:51:04', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:23:33', '2022-12-02 10:39:13', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'COORDINADOR'),
	('1ad71765-0fbd-11ee-8002-d89d6776f970', 'Yessica Guadalupe', 'Rodríguez', 'Cantú', 'yessica.rodriguez', 'yessica.rodriguez@nuevoleon.gob.mx', '$2a$10$80jR5tzIVrEkXpQYc.dSouuQnyJ/FE1V5.B8SuvBQIUgOs7KXaOAm', 'ROCY871008MNLDNS00', 'ROCY871008QB3', '8120206226', '0', '0', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('1fcd0149-e085-11ed-8002-d89d6776f970', 'Rocío Esmeralda', 'Martínez', 'Lucio', 'rocio.martinez', 'rocio.martinezl@nuevoleon.gob.mx', '$2a$10$FmxH/cX090CyrGJ/p5gGlOzvP.1TjsVgTKNeox6oOH1RBqWhjsctu', 'MALR890330MNLRCC09', 'MALR890330CK7', '8120201420', '1420', '8120201420', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-12 16:20:08', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Coordinador'),
	('209d29f5-71dc-11ed-a880-040300000000', 'Mario Alberto', 'Inguanzo', 'Vieyra', 'mario.inguanzo', 'mario.inguanzo@nuevoleon.gob.mx', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'XAXX010101000CVCVC', 'XAXX010101000', '8120201143', '', '8120201143', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-17 10:19:40', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-01 17:56:17', '2022-12-01 17:56:48', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'DIRECTOR'),
	('216c9795-0fbe-11ee-8002-d89d6776f970', 'Gabriela', 'Flores', 'Guerrero', 'gabriela.flores', 'gabriela.flores@nuevoleon.gob.mx', '$2a$10$TZuch6NHTC7kxeQz9J/nse6c7kkR7AMV.g3NdNmDFKlQgCDEuVRTu', 'FOGG680324MNLLRB09', 'FOGG680324MT3', '8120201343', '0', '0', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('280971e0-0ed7-11ee-8002-d89d6776f970', 'Juan José', 'Garza', 'Hernández', 'juanjose.garza', 'juanjose.garza@nuevoleon.gob.mx', '$2a$10$Dtf1VKqLIgd8BA6XPYHLxuzjpkHie7mq4.X1jM.RVhOe2l1HXrAhm', 'GAHJ850624HNLRRN02', 'GAHJ8506243R2', '8120201300', '1324', '8112497438', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('2ada55e8-dedc-11ed-8002-d89d6776f970', 'Usuario', 'Genérico', 'DORG', 'DAMOPORG', 'DAMOPORG@pruebas.com', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'DAMOPORG12MVZYNN09', 'DAMOPORG12345', '1234', '910', '5678', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 11:42:08', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Administrador'),
	('2fad75f3-b79f-11ed-8002-d89d6776f970', 'Juan Fernando', 'Chávez', 'Marroquín', 'juan.chavez', 'juan.chavez@nuevoleon.gob.mx', '$2a$10$bDUxNZz3ltW0eFizXMsR7umaLVa6daq1.mkDY9tYBrmf/0nc9JW1m', 'CAMJ871029HNLHRN02', 'CAMJ871029FP4', '8120201460', '1460', '8126902423', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 10:13:05', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Analista'),
	('30adc962-7109-11ed-a880-040300000000', 'Adolfo', 'Lopez', 'Recursos', 'Disrec', 'aagarcia@cecapmex.com', '$2a$10$xuvxfqDHBcwafJSaZBCMqOTLIFX37BBDB25YZAWUIGFWVVFenjqdS', 'SISTEMASISTEMASIST', 'SISTEMASISTEM', '123', '456', '789', 'b055eb06-6438-11ed-a880-040300000000', '2023-06-21 12:23:50', 1, '30adc962-7109-11ed-a880-040300000000', '2022-11-30 16:46:20', '2022-11-30 16:46:33', '30adc962-7109-11ed-a880-040300000000', 0, 0, ''),
	('39314051-b941-11ed-8002-d89d6776f970', 'JUAN CARLOS', 'GONZALEZ', 'ROMERO', 'juan.gonzalezr', 'juan.gonzalezr@nuevoleon.gob.mx', '$2a$10$sRQXazAbJDD2CfpJDkHa.OOdprRdQztwiTu4npJbaKKjRWnq4mxQS', 'GORJ741101HDFNMN11', 'GORJ7411014U7', '8120201377', '1', '6671672940', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-02 13:48:57', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Analista'),
	('3e0cf417-ded7-11ed-8002-d89d6776f970', 'Cesar', 'Mares', 'Gomez', 'cesar.mares', 'cesar.mares@nuevoleon.gob.mx', '$2a$10$fhlscrUCoTHVftCqjUflaeadJrOu/YB.XXgbpNCmaquAWxsHgPxoC', 'GAMA920807EB6HDDDD', 'XXXXXXXXXXXXX', '1234567895', '125', '1234567895', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-02 12:06:08', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Analista'),
	('40ad483f-b87d-11ed-8002-d89d6776f970', 'MARIA MAYELA', 'GUAJARDO', 'LOPEZ', 'mayela.guajardo', 'mayela.guajardo@nuevoleon.gob.mx', '$2a$10$DRZHfZGtUW6LWuagJl.Mg.hniKu.niZ4aZGrrUZ/p3Qdkl/XGe0FS', 'GULM720817MNLJPY07', 'GULM7208176R0', '8120201475', '1475', '8111836742', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'GENERICO'),
	('440b6024-7267-11ed-a880-040300000000', 'Verónica', 'Cárdenas', 'Medina', 'veronica.cardenas', 'veronica.cardenas@nuevoleon.gob.mx', '$2a$10$lbj.Pu2MxJgbFHcjDkMDRui33EUCA.XoMAgz422VIIUBqfhKHUp6a', 'CAMV821001MNLRDR04', 'CAMV821001IBA', '8120201432', '1432', '8180274081', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 15:13:33', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:32:16', '2022-12-02 10:38:58', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'ANALISTA'),
	('5430da9a-71da-11ed-a880-040300000000', 'Oswaldo', 'Calzada', 'Alba', 'oswaldo.calzada', 'oswaldo.calzada@nuevoleon.gob.mx', '$2a$10$RUDNCPHyZUzt8JaTIfLjH.2.H/MpsKi2nJ3Q9rdNr4trpS4KBxPpG', 'XAXX010101000XCXCX', 'XAXX010101000', '8120201033', '637', '8120201033', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-20 12:47:52', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-01 17:43:24', '2022-12-01 17:57:33', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'ANALISTA'),
	('5e6f44d1-d7c5-11ed-8581-040300000000', 'Usuario ', 'Genérico', 'DCCP', 'DCCP', 'dccp@test.com', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'DCCP980207MMCCRRB4', 'RFCGENERICO10', '9187563254', '0', '3254561874', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-31 15:53:41', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-10 12:32:14', '2023-04-10 12:32:14', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Admi'),
	('5e82153e-b7b0-11ed-8002-d89d6776f970', 'Samantha Rubi', 'Nava', 'Luevano', 'samantha.nava', 'samantha.nava@nuevoleon.gob.mx', '$2a$10$khLJj57PJeddWFBnY/MsSuJv1QSjclY680lWNPFxPnBxnSNRGOkiO', 'NALS921204MNLVVM06', 'NALS921204I74', '8120201300', '1347', '8120201300', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-02 07:33:24', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'ANALISTA'),
	('6c261f7f-71d9-11ed-a880-040300000000', 'Cesar Gabriel', 'Rivera', 'Cantu', 'cesar.rivera', 'cesar.rivera@nuevoleon.gob.mx', '$2a$10$ixtVJT9ShNX3i78ZzjsJzOkt9OI.KB398uadQ.dGEHBVDCY.OnjsW', 'XAXX010101000XCXC', 'XAXX010101000', '8120201212', '631', '8120201212', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 15:06:55', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-01 17:36:55', '2022-12-01 17:37:25', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'COORDINADOR'),
	('738d370b-0ed5-11ee-8002-d89d6776f970', 'Héctor Inocencio', 'Pérez', 'Trujillo', 'hector.perez', 'hector.perez@nuevoleon.gob.mx', '$2a$10$bcjAB2LPEOEKvpCw4XuWte6nylldTkgdRiA2z9FeR5oPzLaUYK.9C', 'PETH650915HNLRRC05', 'PETH6509154M8', '8120201300', '1333', '8114953190', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('74f8e43f-7266-11ed-a880-040300000000', 'Norma Lydia', 'Mendoza', 'Rodriguez', 'norma.mendoza', 'norma.mendoza@nuevoleon.gob.mx', '$2a$10$xuvxfqDHBcwafJSaZBCMqOTLIFX37BBDB25YZAWUIGFWVVFenjqdS', 'MERN730513MNLNDR00', 'MERN730513V26', '8120201329', '1329', '8115331501', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-07 09:54:27', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:26:29', '2022-12-02 10:39:01', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'ANALISTA'),
	('804945f7-0fbf-11ee-8002-d89d6776f970', 'María de Lourdes', 'Dávila', 'Gámez', 'lourdes.davila', 'lourdes.davila@nuevoleon.gob.mx', '$2a$10$vuXzo8lxNmqGgJpbiHHty.L.A/NDXhB4RU2h3Y767LBKukmKKpBPG', 'DAGL770703MNLVMR07', 'DAGL770703786', '8120207738', '0', '0', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('91a8c8a8-0ed7-11ee-8002-d89d6776f970', 'Miguel Ángel', 'Contreras', 'Sánchez', 'miguel.contreras', 'miguel.contreras@nuevoleon.gob.mx', '$2a$10$6b249bLE0tPcaBcABrvtqeVtk1msnV4DIEhfGqJgeIdVZoAund.5S', 'COSM820913HNLNNG03', 'COSM820913QE2', '8120201300', '6200', '8111704814', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('93a07e88-7267-11ed-a880-040300000000', 'Cynthia Selene', 'Vera', 'Zapata', 'cynthia.vera', 'cynthia.vera@nuevoleon.gob.mx', '$2a$10$xuvxfqDHBcwafJSaZBCMqOTLIFX37BBDB25YZAWUIGFWVVFenjqdS', 'VEZC841002MTSRPY07', 'VEZC841002231', '8120202476', '2476', '8120115044', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 14:38:54', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:34:30', '2022-12-02 10:39:05', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'ANALISTA'),
	('94b76caa-b7b0-11ed-8002-d89d6776f970', 'Francisco Alberto', 'Bernal', 'Hernandez', 'francisco.bernal', 'francisco.bernal@nuevoleon.gob.mx', '$2a$10$lYog2XZwXKCQR//6uqVDxOGD5ZsPB46tjoxkIR35cCLUIsP2h7nJi', 'BEHF941004HNLRRR02', 'BEHF941004MN6', '8120201300', '1378', '8120201300', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-16 10:36:14', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Analista'),
	('af9f7a80-df05-11ed-8002-d89d6776f970', 'Susana Patricia', 'Ruiz', 'González', 'susana.ruiz', 'susana.ruiz@nuevoleon.gob.mx', '$2a$10$7jGdac1LrMdv6u4WmGzZkuhpRSMFruPYd98YJZ5N/iEbus8EyAvQm', 'RUGS711123MNLZNS05', 'RUGS711123KFA', '8120201474', '1474', '0', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('bdc43309-7266-11ed-a880-040300000000', 'Carlos Alberto', 'Esquivel', 'Esqueda', 'carlos.esquivel', 'carlos.esquivel@nuevoleon.gob.mx', '$2a$10$xuvxfqDHBcwafJSaZBCMqOTLIFX37BBDB25YZAWUIGFWVVFenjqdS', 'EUEC850408HNLSSR06', 'EUEC850408EFA', '8120201494', '1494', '8120738801', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-06 12:16:38', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:28:31', '2022-12-02 10:39:09', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'ANALISTA'),
	('c9839247-b7b0-11ed-8002-d89d6776f970', 'Alexa Gabriela', 'Hernandez', 'Ibarra', 'alexa.hernandez', 'alexa.hernandez@nuevoleon.gob.mx', '$2a$10$UI1bdqQAQQaMja.ZdGpbYOQofZwd/KNK.MxBigmU/k7bLjAw.48wG', 'HEIA991014MNLRBL07', 'HEIA991014UFA', '8120201300', '6284', '8120201300', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-02 07:31:41', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Analista'),
	('cb8b018d-0ed6-11ee-8002-d89d6776f970', 'Alfredo Francisco', 'Acevedo', 'Puente', 'alfredo.acevedo', 'alfredo.acevedo@nuevoleon.gob.mx', '$2a$10$uwUmTldRZMF21oLvmqSfS.1.4YyEbLe2/cBKLrgtJo8retqXVSMAO', 'AEPA741004HNLCNL00', 'AEPA7410041B9', '8120201300', '1319', '8117380599', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('cb993d7a-b84f-11ed-8002-d89d6776f970', 'Karla Yesenia', 'Delgado', 'Garcia ', 'karla.delgado', 'karla.delgado@nuevoleon.gob.mx', '$2a$10$n.z5kOF36Sc5Yq9wK.doluy6TiR5.DG/pCfArGB2kA.oomjD1m3Ce', 'DEGK900306MNLLRR05', 'DEGK900306PR9', '8120201377', '0', '8120201377', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-09 11:23:28', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'GENERICO'),
	('cd3a3266-0f9f-11ee-8002-d89d6776f970', 'Organismo', 'x', 'x', 'organismo', 'Organismo@nuevoleon.gob.mx', '$2a$10$xuvxfqDHBcwafJSaZBCMqOTLIFX37BBDB25YZAWUIGFWVVFenjqdS', 'XAXX010101000XCXCX', 'GAMA920807EB6', '8120201300', '0', '8114953190', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 11:39:46', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('d1a8f9cd-71db-11ed-a880-040300000000', 'Juan Luis', 'Jimenez', 'Herrera', 'juanluis.jimenez', 'juanluis.jimenez@nuevoleon.gob.mx', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'XAXX010101000XCXCX', 'XAXX010101000', '8120202462', '504', '8120202462', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-19 15:04:13', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-01 17:54:04', '2022-12-01 17:56:53', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'JEFE DE DEPARTAMENTO'),
	('d3413f61-b87c-11ed-8002-d89d6776f970', 'ELISA', 'MADERA', 'HOLTEN', 'elisa.madera', 'elisa.madera@nuevoleon.gob.mx', '$2a$10$rGDRHtZTDQ95nSSgDoYN8e2iCqxieMosgTs6GKjLbwViob0nJ.rYC', 'MAHE701125MNLDLL01', 'MAHE701125Q47', '8120201340', '1340', '8120201340', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-03 10:54:24', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Analista'),
	('d402cfd3-0ef4-11ee-8002-d89d6776f970', 'Municipio GENL', 'x', 'x', 'Municipio', 'municipio@genl.com', '$2a$10$xuvxfqDHBcwafJSaZBCMqOTLIFX37BBDB25YZAWUIGFWVVFenjqdS', 'XAXX010101000XCXCX', 'MUNI920807EB6', '8126980895', '0', '8126980895', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 11:47:35', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('d8483c80-c9b4-11ed-afa1-0242ac120002', 'José Aguedo', 'Serna', 'Meza', 'jaguedo', 'joseaguedosernameza@gmail.com', '$2y$10$UzjgRgXC4qANCryExLYpuuoTRe4MxFghcP2/G.RqV4RHXHWw54LEO', 'SEMA97', 'GOTJ971127BF8', '8211413604', '821', '8211412232', 'b055ed42-6438-11ed-a880-040300000000', '2023-05-23 16:46:05', 1, '0c130706-7266-11ed-a880-040300000000', '2023-03-23 13:55:08', '2023-03-23 13:55:58', '2fad75f3-b79f-11ed-8002-d89d6776f970', 0, 0, 'Desarrollador'),
	('da8fa090-0fbd-11ee-8002-d89d6776f970', 'Fabian', 'Pino', 'Pérez', 'fabian.pino', 'fabian.pino@nuevoleon.gob.mx', '$2a$10$STCTRXFpTHAf9Xp6u0rFk.t58j8ov/XLfjblVbAjDK.PP8Tl/mxmK', 'PIPF750524MNLNRB08', 'PIPF7505241X1', '8120201344', '0', '0', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 07:42:33', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('dc238691-0717-11ee-8002-d89d6776f970', 'Olaguibel Antonio', 'Montemayor', 'Garza', 'olaguibel.montemayor', 'olaguibel.montemayor@nuevoleon.gob.mx', '$2a$10$IN5hGJ/6YyGAusUnnqc2K.I81IuxOTjzL0pt5LHUTeQZyiHZ8hXC2', 'MOGO740613HNLNRL02', 'MOGO740613CQ4', '8120202485', '2485', '8112512736', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-19 17:29:54', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, NULL),
	('e01a653e-725f-11ed-a880-040300000000', 'Jaime Arturo', 'Zurricanday', 'Cortaza', 'jaime.zurricanday', 'jaime.zurricandayTeste999@gmail.com', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'MGE850101H1XVXVXVX', 'MGE850101H1', '8182206100', '1145', '8343011114', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-20 09:54:38', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 09:39:22', '2022-12-02 10:12:07', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'Tesorero'),
	('f739ea4e-b7b0-11ed-8002-d89d6776f970', 'Monica Elizabeth', 'Gonzalez', 'Sandoval', 'monica.gonzalezs', 'monica.gonzalezs@nuevoleon.gob.mx', '$2a$10$sO7VWdYpgHvc3.fAwRtKu.cyrNxHX33MCCryD/JDL7gMHz6ykm9Dq', 'GOSM701129MNLNNN02', 'GOSM701129QQ2', '8120201300', '2497', '8120201300', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0, 'GENERICO');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;

-- Volcando estructura para procedimiento TiCentral.GenerarSolicitudesTesting
DROP PROCEDURE IF EXISTS `GenerarSolicitudesTesting`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `GenerarSolicitudesTesting`(
	IN `P_start` INT,
	IN `P_end` INT

)
BEGIN
	while P_start < P_end DO
 		call sp_CreaSolicitud('test', 'test', 'test', CONCAT('test',P_start), CONCAT('test@test.test',P_start), 'test', 'test', '1234567689', '123456789', '123', 'ALTA', '', '973ecf89-38ff-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000');
 		SET P_start=P_start+1;
 	End While; 
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_AceptarUsuario
DROP PROCEDURE IF EXISTS `sp_AceptarUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_AceptarUsuario`(
	IN `P_Id` CHAR(36),
	IN `P_Nombre` VARCHAR(20),
	IN `P_ApellidoPaterno` VARCHAR(20),
	IN `P_ApellidoMaterno` VARCHAR(20),
	IN `P_NombreUsuario` VARCHAR(30),
	IN `P_CorreoElectronico` VARCHAR(100),
	IN `P_Contrasena` VARCHAR(255),
	IN `P_IdUsuario` CHAR(37),
	IN `P_Curp` VARCHAR(18),
	IN `P_Rfc` VARCHAR(13),
	IN `P_Telefono` VARCHAR(10),
	IN `P_Ext` VARCHAR(4),
	IN `P_Celular` VARCHAR(10)

)
BEGIN
DECLARE P_NombreTipoUsuario CHAR(36); 
		DECLARE P_CorreoExiste INT; 
		DECLARE P_UsuarioExiste INT; 
		DECLARE Respuesta INT;
		DECLARE  P_IdTipoUsuario CHAR(36);
		
		SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t
							INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
							WHERE u.Id = P_IdUsuario);
							
IF ((@TpoUser = 'ADMINPLATAFORMA') or (@TpoUser = 'ADMINGENERAL')) then
			
		IF (TiCentral.ValidaCorreo(P_CorreoElectronico) = 0 ) THEN			
			SET P_Nombre = P_Nombre; 
			SET P_ApellidoPaterno = TiCentral.limpiar(P_ApellidoPaterno); 
			SET P_ApellidoMaterno = TiCentral.limpiar(P_ApellidoMaterno); 
			SET P_NombreUsuario = TiCentral.limpiar(REPLACE(P_NombreUsuario,' ','')); 
			SET P_CorreoElectronico = TiCentral.limpiar(REPLACE(P_CorreoElectronico,' ','')); 
			SET P_Contrasena = P_Contrasena; 
			SET P_IdUsuario = TiCentral.limpiar_ids(P_IdUsuario); 
			SET P_Curp = TiCentral.limpiar(P_Curp); 
			SET P_Rfc = TiCentral.limpiar(P_Rfc); 
			SET P_Telefono = TiCentral.limpiar(P_Telefono); 
			SET P_Ext 		= TiCentral.limpiar(P_Ext); 
			SET P_Celular = TiCentral.limpiar(P_Celular); 
			
			SET P_CorreoExiste = (SELECT COUNT(*) FROM TiCentral.Usuarios WHERE (CorreoElectronico = P_CorreoElectronico)); 
			SET P_UsuarioExiste = (SELECT COUNT(*) FROM TiCentral.Usuarios WHERE (NombreUsuario = P_NombreUsuario)); 
			
		-- 	SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t
			-- 					INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
				--				WHERE u.Id = P_IdUsuario);
		
			-- 
			 SET P_IdTipoUsuario= (SELECT Id FROM TiCentral.TipoUsuario t WHERE (trim(t.Nombre) = 'USER'));
			-- 
			SET Respuesta=0;
				
			IF (@P_NombreTipoUsuario= (SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario AND Usuario.IdTipoUsuario=Tipo.id = 'User')) THEN 
				SET Respuesta = 401;
				SELECT Respuesta,'No tiene permisos para crear usuarios' AS Mensaje; 
			ELSEIF P_UsuarioExiste >= 1 THEN 
				SET Respuesta = 409;
				SELECT Respuesta,'El nombre de usuario ya existe' AS Mensaje; 
			ELSEIF P_CorreoExiste >= 1 THEN 
				SET Respuesta = 409;
				SELECT Respuesta,'El correo electronico ya está registrado' AS Mensaje; 
			ELSE
				INSERT INTO TiCentral.Usuarios(
					Id,
					Nombre,
					ApellidoPaterno,
					ApellidoMaterno,
					NombreUsuario,
					CorreoElectronico,
					Contrasena,
					Curp,
					Rfc,
					Telefono,
					Ext,
					Celular,
					UltimoInicioDeSesion,
					EstaActivo,
					CreadoPor,
					FechaDeCreacion,
					UltimaModificacion,
					ModificadoPor,
					IdTipoUsuario
					) VALUES(
					P_Id,
					P_Nombre,
					P_ApellidoPaterno,
					P_ApellidoMaterno,
					P_NombreUsuario,
					P_CorreoElectronico,
					P_Contrasena,
					P_Curp,
					P_Rfc,
					P_Telefono,
					P_Ext,
					P_Celular, 
					CURRENT_TIMESTAMP(),
					1,
					P_IdUsuario, 
					CURRENT_TIMESTAMP(), 
					CURRENT_TIMESTAMP(),
					P_IdUsuario,
					P_IdTipoUsuario); 
					SET Respuesta=201;
					SELECT Respuesta,'Usuario creado con éxito' AS Mensaje,TiCentral.Usuarios.*
					FROM TiCentral.Usuarios
					WHERE NombreUsuario = P_NombreUsuario AND CorreoElectronico = P_CorreoElectronico; 
			END IF;
		ELSE
			SET Respuesta = 409;
			SELECT Respuesta,'El formato del correo es incorrecto' AS Mensaje; 	
		END IF; 
	ELSE
	SELECT Respuesta,'El usuario no tiene permisos validos' AS Mensaje; 
	
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ActivarApp
DROP PROCEDURE IF EXISTS `sp_ActivarApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ActivarApp`(
	IN `P_Id` CHAR(36),
	IN `P_IdUsuario` CHAR(37),
	IN `P_IdTipoUsuario` VARCHAR(37)
)
BEGIN
	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;

	IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para crear usuarios' AS Mensaje;
	ELSE
		IF (SELECT COUNT(*) FROM TiCentral.Apps WHERE Id = P_Id) = 1 THEN
		UPDATE TiCentral.Apps  SET EstaActivo = 1 WHERE Id = P_Id;

		SET Respuesta=201;
		SELECT Respuesta,'Verifica ID' AS Mensaje, P_Id AS appId,'activo' AS Result;
		ELSE
			SET Respuesta=409;
			SELECT Respuesta,'Verifica ID' AS Mensaje;
		END IF;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ActivarUsuario
DROP PROCEDURE IF EXISTS `sp_ActivarUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ActivarUsuario`(
	IN `P_Id` CHAR(36),
	IN `P_IdUsuario` CHAR(37)
)
BEGIN
	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
	IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
	SET Respuesta = 401;
	SELECT Respuesta,'No tiene permisos para activar usuarios' AS Mensaje;
	ELSE
		IF (SELECT COUNT(*) FROM TiCentral.Usuarios us WHERE us.Id = P_Id) = 1 THEN
			UPDATE TiCentral.Usuarios us
			SET  us.EstaActivo = 1
			WHERE us.Id =  P_Id;
            SET Respuesta = 201;
			SELECT Respuesta,'Activo' AS Mensaje,P_Id AS UserId;
		ELSE
			SET Respuesta = 409;
            SELECT Respuesta,'Verifica ID' AS Mensaje;
	END IF;
END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ActualizaInicioSesion
DROP PROCEDURE IF EXISTS `sp_ActualizaInicioSesion`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ActualizaInicioSesion`(
	IN `P_Id` CHAR(36)
)
BEGIN
	UPDATE TiCentral.Usuarios us
	SET us.UltimoInicioDeSesion = CURRENT_TIMESTAMP()
	WHERE us.Id =  P_Id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_BajaApp
DROP PROCEDURE IF EXISTS `sp_BajaApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_BajaApp`(
	IN `P_Id` CHAR(36),
	IN `P_IdUsuario` CHAR(37)
)
BEGIN
	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
	IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para dar de baja aplicaciones' AS Mensaje;
	ELSE
		UPDATE TiCentral.Apps  SET deleted =1 WHERE Id =P_Id;
			IF (SELECT Deleted FROM TiCentral.Apps WHERE ID = P_Id) = 1 THEN
                	SET Respuesta = 201;
					SELECT Respuesta,'Baja exitosa' AS Mensaje;
			ELSE
					SET Respuesta = 409;
					SELECT Respuesta,'Verificar Id App' AS Mensaje;
			END IF;
    END IF;    
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_BajaUsuario
DROP PROCEDURE IF EXISTS `sp_BajaUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_BajaUsuario`(
	IN `P_Id` CHAR(36),
	IN `P_IdUsuario` CHAR(37)
)
BEGIN

	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;	
   IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para dar de baja usuarios' AS Mensaje;
	ELSE
    	UPDATE TiCentral.Usuarios us
			SET  us.Deleted = 1, us.EstaActivo = 0
		WHERE us.Id =  P_Id;

		IF (SELECT Deleted FROM TiCentral.Usuarios WHERE ID = P_Id) = 1 THEN
			SET Respuesta = 201;
			SELECT Respuesta,'La baja del usuario fue éxitosa' AS Mensaje;
		ELSE
			SET Respuesta = 409;
			SELECT Respuesta,'Verificar Id Usuario' AS Mensaje;
		END IF;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CambiaEstatusSolicitud
DROP PROCEDURE IF EXISTS `sp_CambiaEstatusSolicitud`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CambiaEstatusSolicitud`(
	IN `P_IdUsuario` CHAR(36),
	IN `P_IdSolicitud` CHAR(36),
	IN `P_Estatus` TINYINT,
	IN `P_Contrasena` VARCHAR(255),
	IN `P_TipoSol` VARCHAR(100),
	IN `P_EsAdmin` TINYINT,
	IN `P_PuedeFirmar` TINYINT
)
BEGIN

	-- Obtener el nombre del tipo de usuario
	SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t
	INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
	WHERE u.Id = P_IdUsuario);
	-- Obtener si el usuario tiene acceso a la app que se registro en la solicitud
	SET @App = (SELECT IdApp FROM TiCentral.Solicitudes WHERE id = P_IdSolicitud);
	SET @Tiene = (SELECT COUNT(id) FROM TiCentral.UsuarioAplicacion WHERE idusuario = P_IdUsuario AND idapp = @App);
	
	-- obtenemos el tipo de solicitud que se esta enviando
	SET @TipoSol = (SELECT id FROM TipoSolicitud s WHERE UPPER(s.tipoSoli) = UPPER(P_TipoSol));
	
	-- esto es cuando se va a activar un usuario
    If (@TpoUser = 'ADMINGENERAL') OR (@TpoUser = 'ADMINPLATAFORMA' AND @Tiene >= 1) then	
    
-- ACCIONES DE ALTA
	IF(UCASE (P_TipoSol) = 'ALTA')then
		IF (P_Estatus = 1) then
		
				IF(P_EsAdmin = 1) THEN
					SET @P_IdTipoUsuario = (SELECT Id FROM TiCentral.TipoUsuario WHERE UCASE(Nombre)= UCASE('AdminPlataforma'));
				ELSE
					SET @P_IdTipoUsuario = (SELECT Id FROM TiCentral.TipoUsuario WHERE UCASE(Nombre)= 'USER');
				END IF;


				SELECT Id,Nombre,ApellidoPaterno,ApellidoMaterno,NombreUsuario,CorreoElectronico,Curp,Rfc,Telefono,Ext,Celular
				INTO @Id,@Nombre,@ApellidoPaterno,@ApellidoMaterno,@NombreUsuario,@CorreoElectronico,@Curp,@Rfc,@Telefono,@Ext,@Celular
				from TiCentral.Solicitudes
				where Id=P_IdSolicitud;

				IF(P_PuedeFirmar = 1) THEN
					INSERT INTO TiCentral.Usuarios (Id,Nombre,ApellidoPaterno,ApellidoMaterno,NombreUsuario,CorreoElectronico,Curp,Rfc,Telefono,Ext,Celular,
					IdTipoUsuario,CreadoPor,ModificadoPor,Contrasena,EstaActivo,PuedeFirmar)
					VALUES(@Id,@Nombre,@ApellidoPaterno,@ApellidoMaterno,@NombreUsuario,@CorreoElectronico,@Curp,@Rfc,@Telefono,@Ext,@Celular,
					@P_IdTipoUsuario,P_IdUsuario,P_IdUsuario,P_Contrasena,1,1);
				ELSE
					INSERT INTO TiCentral.Usuarios (Id,Nombre,ApellidoPaterno,ApellidoMaterno,NombreUsuario,CorreoElectronico,Curp,Rfc,Telefono,Ext,Celular,
					IdTipoUsuario,CreadoPor,ModificadoPor,Contrasena,EstaActivo)
					VALUES(@Id,@Nombre,@ApellidoPaterno,@ApellidoMaterno,@NombreUsuario,@CorreoElectronico,@Curp,@Rfc,@Telefono,@Ext,@Celular,
					@P_IdTipoUsuario,P_IdUsuario,P_IdUsuario,P_Contrasena,1);
				END IF;
				
				CALL `sp_VinculaUsuarioApp`(P_IdSolicitud, (select IdApp from TiCentral.Solicitudes where Id=P_IdSolicitud), P_IdUsuario);
					
				UPDATE TiCentral.Solicitudes s
				SET  s.Estatus = 1,
					  s.UltimaModificacion = CURRENT_TIMESTAMP(),
					  s.ModificadoPor = P_IdUsuario
				WHERE Id =  P_IdSolicitud;
				
						 
				SELECT '201' as Respuesta,'Solicitud aprobada con éxito' AS Mensaje;
		END IF;
        
        
        
      IF (P_Estatus = 2) then
			UPDATE TiCentral.Solicitudes 
			SET  Estatus = 2,
				  UltimaModificacion = CURRENT_TIMESTAMP(),
				  ModificadoPor = P_IdUsuario
			WHERE Id =  P_IdSolicitud;
			
			SELECT '201' as Respuesta,'Solicitud rechazada con éxito' AS Mensaje;
		END IF;
		
		
		IF (P_Estatus = 3) then
			UPDATE TiCentral.Solicitudes 
			SET  Estatus = 3,
				  UltimaModificacion = CURRENT_TIMESTAMP(),
				  ModificadoPor = P_IdUsuario
			WHERE Id =  P_IdSolicitud;      
			SELECT '201' as Respuesta,'Se solicito una modificación con éxito' AS Mensaje;
		END IF;
		
	END IF;


 	IF(UCASE (P_TipoSol) = 'BAJA')THEN
        	IF (P_Estatus = 1) then
        	
        	SET @IdUser = (Select Id from TiCentral.Usuarios where CorreoElectronico= (Select CorreoElectronico from  TiCentral.Solicitudes where Id=P_IdSolicitud));
        	CALL `sp_DesvinculaUsuarioApp`(@IdUser, (select IdApp from TiCentral.Solicitudes where Id=P_IdSolicitud), P_IdUsuario);
        		
				UPDATE TiCentral.Solicitudes s
				SET  s.Estatus = 1,
					  s.UltimaModificacion = CURRENT_TIMESTAMP(),
					  s.ModificadoPor = P_IdUsuario
				WHERE Id =  P_IdSolicitud;
				
                
            IF (SELECT COUNT(*) FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = @IdUser )=0 THEN
					UPDATE TiCentral.Usuarios u 
					SET  u.EstaActivo = 0,
					  u.UltimaModificacion = CURRENT_TIMESTAMP(),
					  u.Contrasena = P_Contrasena,
					  u.ModificadoPor = P_IdUsuario
					WHERE u.Id =  @IdUser;
							 
					SELECT '201' as Respuesta,'Solicitud aprobada con éxito' AS Mensaje;
            END IF;
		END IF;
		
		
        
        IF (P_Estatus = 2) then
			UPDATE TiCentral.Solicitudes 
			SET  Estatus = 2,
				  UltimaModificacion = CURRENT_TIMESTAMP(),
				  ModificadoPor = P_IdUsuario
			WHERE Id =  P_IdSolicitud;
				         
			SELECT '201' as Respuesta,'Solicitud rechazada con éxito' AS Mensaje;
		END IF;
	END IF;
        

-- ACCIONES DE MODIFICACION 
	IF (UCASE (P_TipoSol) = 'MODIFICACION') then
		IF (P_Estatus = 1) then 
		
			SET @IdUser = (Select Id from TiCentral.Usuarios where CorreoElectronico=
			(Select CorreoElectronico from  TiCentral.Solicitudes where Id=P_IdSolicitud));
			
			SELECT Nombre,ApellidoPaterno,ApellidoMaterno,Curp,Rfc,Telefono,Ext,Celular
				INTO @Nombre,@ApellidoPaterno,@ApellidoMaterno,@Curp,@Rfc,@Telefono,@Ext,@Celular
				from TiCentral.Solicitudes
				where Id=P_IdSolicitud;
				
			UPDATE TiCentral.Usuarios u
			SET
				u.Nombre=@Nombre,
				u.ApellidoPaterno=@ApellidoPaterno,
				u.ApellidoMaterno=@ApellidoMaterno,
				u.Curp=@Curp,
				u.Rfc=@Rfc,
				u.Telefono=@Telefono,
				u.Ext=@Ext,
				u.Celular=@Celular,
				u.UltimaModificacion = CURRENT_TIMESTAMP(),
						u.ModificadoPor = P_IdUsuario
			WHERE u.Id =  @IdUser;
            
            UPDATE TiCentral.Solicitudes s
				SET  s.Estatus = 1,
					  s.UltimaModificacion = CURRENT_TIMESTAMP(),
					  s.ModificadoPor = P_IdUsuario
				WHERE Id =  P_IdSolicitud;
			SELECT '201' as Respuesta,'Se modifico el tipo de solicitud a modificacion' AS Mensaje;
		END IF;
            
		
      IF (P_Estatus = 2) then -- Pendiente
			UPDATE TiCentral.Solicitudes s
			SET  s.Estatus = 2,
				s.UltimaModificacion = CURRENT_TIMESTAMP(),
						s.ModificadoPor = P_IdUsuario
			WHERE Id =  P_IdSolicitud;
			SELECT '201' as Respuesta,'Se rechazo la modificación' AS Mensaje;
		END IF;
            
            
            
		IF (P_Estatus = 3) then -- Pendiente
			UPDATE TiCentral.Solicitudes s
			SET  s.Estatus = 3,
				s.UltimaModificacion = CURRENT_TIMESTAMP(),
						s.ModificadoPor = P_IdUsuario
			WHERE Id =  P_IdSolicitud;
			SELECT '201' as Respuesta,'Se solicito  una modificación' AS Mensaje;
		END IF;
	END IF;
-- ACCIONES DE VINCULACION
	IF (UCASE (P_TipoSol) = 'VINCULACION') then
		IF (P_Estatus = 1) then
					
				SET @IdUser = (Select Id from TiCentral.Usuarios where CorreoElectronico= (Select CorreoElectronico from  TiCentral.Solicitudes where Id=P_IdSolicitud));
				CALL `sp_VinculaUsuarioApp`(@IdUser, (select IdApp from TiCentral.Solicitudes where Id=P_IdSolicitud), P_IdUsuario);
						
				UPDATE TiCentral.Solicitudes s
				SET  s.Estatus = 1,
						s.UltimaModificacion = CURRENT_TIMESTAMP(),
						s.ModificadoPor = P_IdUsuario
				WHERE Id =  P_IdSolicitud;
							 
				SELECT '201' as Respuesta,'Vinculación aprobada con éxito' AS Mensaje;
		END IF;
        
        
        IF (P_Estatus = 2) then
					
				UPDATE TiCentral.Solicitudes s
				SET  s.Estatus = 2,
						s.UltimaModificacion = CURRENT_TIMESTAMP(),
						s.ModificadoPor = P_IdUsuario
				WHERE Id =  P_IdSolicitud;
							 
				SELECT '201' as Respuesta,'Vinculación denagada' AS Mensaje;
		END IF;
	END IF;
    ELSE 
			SELECT '403' AS Respuesta,'Usuario no tiene permiso para aprobar solicitud' AS Mensaje;
	END IF;


END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CambiarContrasena
DROP PROCEDURE IF EXISTS `sp_CambiarContrasena`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CambiarContrasena`(
	IN `P_id` CHAR(36),
	IN `P_Contrasena` VARCHAR(255)
)
BEGIN
    IF (SELECT COUNT(*) FROM TiCentral.Usuarios WHERE Id = P_id) = 1 THEN
        UPDATE TiCentral.Usuarios us
        SET us.Contrasena = P_Contrasena
        WHERE us.Id = P_id;
        SELECT Id,Nombre, NombreUsuario, CorreoElectronico FROM TiCentral.Usuarios WHERE Id = P_id;
    ELSE
        SELECT '409' AS Respuesta, 'Verifica informacion.' AS Mensaje;
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ComentariosSolicitud
DROP PROCEDURE IF EXISTS `sp_ComentariosSolicitud`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ComentariosSolicitud`(
	IN `P_IdUsuarioSolicitante` CHAR(36),
	IN `P_IdSol` CHAR(36)


)
BEGIN
	-- Obtener el nombre del tipo de usuario
	SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t
	INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
	WHERE u.Id = P_IdUsuarioSolicitante);
	-- Obtener si el usuario tiene acceso a la app que se registro en la solicitud
	 SET @App = (SELECT IdApp FROM TiCentral.Solicitudes WHERE Id = P_IdSol);
	 SET @Tiene = (SELECT COUNT(Id) FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = P_IdUsuarioSolicitante AND IdApp = @App);	
	
	IF((SELECT COUNT(Id) FROM TiCentral.Solicitudes WHERE Id = P_IdSol)=1) THEN
	
		If (@TpoUser = 'ADMINGENERAL') OR (@TpoUser = 'ADMINPLATAFORMA' AND @Tiene >= 1) then	
			SELECT '201' AS Respuesta,'Ok' AS Mensaje, c.Id,c.Comentario, c.CreadoPor, CONCAT(u.Nombre, ' ', u.ApellidoPaterno) AS NombreCreador,c.FechaDeCreacion
			FROM TiCentral.Comentarios c
			INNER JOIN TiCentral.Usuarios u ON c.CreadoPor = u.Id 
			WHERE c.IdSolicitud = P_IdSol ORDER BY c.FechaDeCreacion ASC;
		ELSE 
			SELECT '403' AS Respuesta,'Usuario no tiene permiso para visualizar los comentarios de las solicitudes' AS Mensaje;
		END IF;
	ELSE
		SELECT '403' AS Respuesta,'IdSolicitud invalido, no existe una solicitud con el Id o existe mas de uno' AS Mensaje;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CreaApp
DROP PROCEDURE IF EXISTS `sp_CreaApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CreaApp`(
	IN `P_Nombre` VARCHAR(30),
	IN `P_Path` VARCHAR(30),
	IN `P_IdUsuario` CHAR(36)
)
BEGIN
	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
	IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para crear aplicaciones' AS Mensaje;
	ELSE
		INSERT INTO TiCentral.Apps (
		Nombre,
		Path,
		EstaActivo,
		CreadoPor,
		FechaDeCreacion,
		UltimaModificacion,
		ModificadoPor
		)VALUES(
		P_Nombre,
		P_Path,
		1,
		P_IdUsuario,
		CURRENT_TIMESTAMP(),
		CURRENT_TIMESTAMP(),
		P_IdUsuario
		);

		SET Respuesta = 201;
		SELECT (select Id FROM TiCentral.Apps WHERE Nombre = P_Nombre AND Path = P_Path),Respuesta,'Se creo la aplicación con éxito' AS Mensaje;
        
END IF;



END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CreaComentarioSol
DROP PROCEDURE IF EXISTS `sp_CreaComentarioSol`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CreaComentarioSol`(
	IN `P_IdUsuario` CHAR(36),
	IN `P_IdSolicitud` CHAR(36),
	IN `P_Comentario` VARCHAR(2000)

)
BEGIN
	-- Obtener el nombre del tipo de usuario
	SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t
	INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
	WHERE u.Id = P_IdUsuario);
	-- Obtener si el usuario tiene acceso a la app que se registro en la solicitud
	SET @App = (SELECT IdApp FROM TiCentral.Solicitudes WHERE Id = P_IdSolicitud);
	SET @Tiene = (SELECT COUNT(Id) FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = P_IdUsuario AND IdApp = @App);
	
	IF((SELECT COUNT(Id) FROM TiCentral.Solicitudes WHERE Id  = P_IdSolicitud)=1)THEN
		If (@TpoUser = 'ADMINGENERAL') OR (@TpoUser = 'ADMINPLATAFORMA' AND @Tiene >= 1) then	
			INSERT INTO TiCentral.Comentarios (
			Id,
			IdSolicitud,
			Comentario,
			CreadoPor,
			FechaDeCreacion
			)VALUES(
			UUID(),
			P_IdSolicitud,
			P_Comentario,
			P_IdUsuario,		
			CURRENT_TIMESTAMP()
			);		
			SELECT '201' as Respuesta,'Se creó el comentario con éxito' AS Mensaje;
		ELSE 
			SELECT '403' AS Respuesta,'Usuario no tiene permiso para crear comentarios' AS Mensaje;
		END IF;
	ELSE
			SELECT '403' AS Respuesta,'IdSolicitud invalido, no existe un solicitud con el Id o existen mas de una' AS Mensaje;
	END IF;
		
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CrearUsuario
DROP PROCEDURE IF EXISTS `sp_CrearUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CrearUsuario`(
	IN `P_Nombre` VARCHAR(20),
	IN `P_ApellidoPaterno` VARCHAR(20),
	IN `P_ApellidoMaterno` VARCHAR(20),
	IN `P_NombreUsuario` VARCHAR(30),
	IN `P_CorreoElectronico` VARCHAR(100),
	IN `P_Contrasena` VARCHAR(255),
	IN `P_IdUsuario` CHAR(37),
	IN `P_Curp` VARCHAR(18),
	IN `P_Rfc` VARCHAR(13),
	IN `P_Telefono` VARCHAR(10),
	IN `P_Ext` VARCHAR(4),
	IN `P_Celular` VARCHAR(10),
	IN `P_IdTipoUsuario` VARCHAR(37)


)
BEGIN 
		DECLARE P_NombreTipoUsuario CHAR(36); 
		DECLARE P_CorreoExiste INT; 
		DECLARE P_UsuarioExiste INT; 
		DECLARE Respuesta INT; 
		
	IF (TiCentral.ValidaCorreo(P_CorreoElectronico) = 0 ) THEN			
		SET P_Nombre = P_Nombre; 
		SET P_ApellidoPaterno = TiCentral.limpiar(P_ApellidoPaterno); 
		SET P_ApellidoMaterno = TiCentral.limpiar(P_ApellidoMaterno); 
		SET P_NombreUsuario = TiCentral.limpiar(REPLACE(P_NombreUsuario,' ','')); 
		SET P_CorreoElectronico = TiCentral.limpiar(REPLACE(P_CorreoElectronico,' ','')); 
		SET P_Contrasena = P_Contrasena; 
		SET P_IdUsuario = TiCentral.limpiar_ids(P_IdUsuario); 
		SET P_Curp = TiCentral.limpiar(P_Curp); 
		SET P_Rfc = TiCentral.limpiar(P_Rfc); 
		SET P_Telefono = TiCentral.limpiar(P_Telefono); 
		SET P_Ext 		= TiCentral.limpiar(P_Ext); 
		SET P_Celular = TiCentral.limpiar(P_Celular); 
		SET P_IdTipoUsuario = TiCentral.limpiar_ids(P_IdTipoUsuario); 
		
		SET P_CorreoExiste = (SELECT COUNT(*) FROM TiCentral.Usuarios WHERE (CorreoElectronico = P_CorreoElectronico)); 
		SET P_UsuarioExiste = (SELECT COUNT(*) FROM TiCentral.Usuarios WHERE (NombreUsuario = P_NombreUsuario)); 
		
		SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t
							INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
							WHERE u.Id = P_IdUsuario);
	
		IF ((@TpoUser = 'ADMINPLATAFORMA') or (@TpoUser = 'ADMINGENERAL' and trim(P_IdTipoUsuario) = '')) then
			SET P_IdTipoUsuario = (SELECT Id FROM TiCentral.TipoUsuario t WHERE (trim(t.Nombre) = 'USER'));
		END IF;
		SET Respuesta=0;
			
		IF (@P_NombreTipoUsuario= (SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario AND Usuario.IdTipoUsuario=Tipo.id = 'User')) THEN 
			SET Respuesta = 401;
			SELECT Respuesta,'No tiene permisos para crear usuarios' AS Mensaje; 
		ELSEIF P_UsuarioExiste >= 1 THEN 
			SET Respuesta = 409;
			SELECT Respuesta,'El nombre de usuario ya existe' AS Mensaje; 
		ELSEIF P_CorreoExiste >= 1 THEN 
			SET Respuesta = 409;
			SELECT Respuesta,'El correo electronico ya está registrado' AS Mensaje; 
		ELSE
			INSERT INTO TiCentral.Usuarios(
				Nombre,
				ApellidoPaterno,
				ApellidoMaterno,
				NombreUsuario,
				CorreoElectronico,
				Contrasena,
				Curp,
				Rfc,
				Telefono,
				Ext,
				Celular,
				UltimoInicioDeSesion,
				CreadoPor,
				FechaDeCreacion,
				UltimaModificacion,
				ModificadoPor,
				IdTipoUsuario,EstaActivo
				) VALUES(
				P_Nombre,
				P_ApellidoPaterno,
				P_ApellidoMaterno,
				P_NombreUsuario,
				P_CorreoElectronico,
				P_Contrasena,
				P_Curp,
				P_Rfc,
				P_Telefono,
				P_Ext,
				P_Celular, CURRENT_TIMESTAMP(),
				P_IdUsuario, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(),
				P_IdUsuario,
				P_IdTipoUsuario,1); 
				SET Respuesta=201;
				SELECT Respuesta,'Usuario creado con éxito' AS Mensaje,TiCentral.Usuarios.*
				FROM TiCentral.Usuarios
				WHERE NombreUsuario = P_NombreUsuario AND CorreoElectronico = P_CorreoElectronico; 
		END IF;
	ELSE
		SET Respuesta = 409;
		SELECT Respuesta,'El formato del correo es incorrecto' AS Mensaje; 	
	END IF; 
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CreaSolicitud
DROP PROCEDURE IF EXISTS `sp_CreaSolicitud`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CreaSolicitud`(
	IN `P_Nombre` VARCHAR(20),
	IN `P_ApellidoPaterno` VARCHAR(20),
	IN `P_ApellidoMaterno` VARCHAR(20),
	IN `P_NombreUsuario` VARCHAR(30),
	IN `P_CorreoElectronico` VARCHAR(100),
	IN `P_Curp` VARCHAR(18),
	IN `P_Rfc` VARCHAR(13),
	IN `P_Celular` VARCHAR(10),
	IN `P_Telefono` VARCHAR(10),
	IN `P_Ext` VARCHAR(4),
	IN `P_TipoSolicitud` VARCHAR(36),
	IN `P_DatosAdicionales` VARCHAR(2000),
	IN `P_IdApp` CHAR(36),
	IN `P_CreadoPor` CHAR(36)



)
proc:BEGIN
-- LEAVE proc;
/*
Estatus de las Solicitudes
0- Pendiente
1- Activar
2- Denegado
3- Revision

Tipos de Solicitud
Alta
Baja
Modificacion
Vinculacion
*/

#region obtener los UUID de los tipos de solicitud
CASE UPPER(P_TipoSolicitud)
	WHEN 'ALTA' THEN 
		SET @TpoAlta = (SELECT ID FROM TiCentral.TipoSolicitud t WHERE UPPER(t.tipoSoli)='ALTA');
		SET P_TipoSolicitud = @TpoAlta ;
	WHEN 'BAJA' THEN 
		SET @TpoBaja = (SELECT ID FROM TiCentral.TipoSolicitud t WHERE UPPER(t.tipoSoli)='BAJA');
		SET P_TipoSolicitud = @TpoBaja ;
	WHEN 'MODIFICACION' THEN 
		SET @TpoModificacion = (SELECT ID FROM TiCentral.TipoSolicitud t WHERE UPPER(t.tipoSoli)='MODIFICACION');
		SET P_TipoSolicitud = @TpoModificacion ;
	WHEN 'VINCULACION' THEN 
		SET @TpoVinculacion = (SELECT ID FROM TiCentral.TipoSolicitud t WHERE UPPER(t.tipoSoli)='VINCULACION');
		SET P_TipoSolicitud = @TpoVinculacion ;
END CASE;
#endregion

#region valida permiso de creador
	-- Obtener el nombre del tipo de usuario creador   
	SET @TpoUser = (
		SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t 
										INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
										WHERE u.Id = P_CreadoPor);
	-- Obtener si el usuario creador tiene acceso a la app que se registro en la solicitud
	SET @TieneApp = (
		SELECT COUNT(id) FROM TiCentral.UsuarioAplicacion 
								WHERE idUsuario = P_CreadoPor AND IdApp = P_IdApp);	
	-- Si el usuario creador no tiene permiso para crear usuarios
	If (@TpoUser = 'AdminGeneral') OR (@TpoUser = 'AdminPlataforma' AND @TieneApp >= 1) then
			SET @Continuar = 0;
	ELSE
		SELECT '403' AS Respuesta,'Usuario no tiene permiso para crear solicitudes' AS Mensaje;
		LEAVE proc;
	END IF;
#endregion 

#region valida si existe solicitud existente
	-- Revisar si ya existe una solicitud para ese Usuario y/o Correo (Pendiente o xActivar o en Revision)
	SET @ExisteSol = (
		SELECT COUNT(Id) FROM TiCentral.Solicitudes S 
		WHERE (S.NombreUsuario = P_NombreUsuario OR S.CorreoElectronico = P_CorreoElectronico)
		AND S.Estatus != 2
		AND S.TipoSolicitud = P_TipoSolicitud);
	-- Valida si existe ya una solicitud, envia mensaje y se sale del SP
	IF @ExisteSol >= 1 THEN
		SELECT '403' AS Respuesta,'Ya existe solicitud para este usuario' AS Mensaje;
		LEAVE proc;		
	END IF;
#endregion 

#region obtiene el id del usuario solicitado, si es que existe
	SET @IdUsuario = (
		SELECT COUNT(Id) FROM TiCentral.Usuarios U 
					 WHERE (U.NombreUsuario = P_NombreUsuario OR U.CorreoElectronico = P_CorreoElectronico));
	-- si existe obtiene ID real
	IF @IdUsuario >= 1 THEN
		SET @IdUsuario =(
			SELECT Id FROM TiCentral.Usuarios U 
					 WHERE (U.NombreUsuario = P_NombreUsuario OR U.CorreoElectronico = P_CorreoElectronico));
	ELSE
		-- Alta y no existe
		IF (@IdUsuario = 0 AND P_TipoSolicitud != @TpoAlta) THEN
			-- usuario no existe
			SELECT '403' AS Respuesta,'Usuario no existe' AS Mensaje;
			LEAVE proc;	
		ELSE
			SET @IdUsuario= @IdUsuario;
		END IF;
	END IF;

	-- Alta y si existe
	IF (LENGTH(@IdUsuario) >= 2 AND P_TipoSolicitud = @TpoAlta) THEN			
			SELECT '403' AS Respuesta,'Usuario ya existe' AS Mensaje;
			LEAVE proc;	
	END IF;			
	
	-- si existe revisa si esta dado de baja
	IF LENGTH(@IdUsuario) >= 2 THEN			
		SELECT u.EstaActivo, u.Deleted INTO @EstaActivo, @Deleted FROM TiCentral.Usuarios u 
		WHERE u.Id = @IdUsuario;

		IF @EstaActivo = 0 THEN
			SELECT '403' AS Respuesta,'Usuario esta inactivo' AS Mensaje;
			LEAVE proc;	
		END IF;	
	END IF;	
#endregion


#region Si es tipo baja o modificacion
	IF P_TipoSolicitud = @TpoBaja OR P_TipoSolicitud = @TpoModificacion THEN
		-- revisa si esta vinculado a la app
		IF LENGTH(@IdUsuario) >= 2 THEN
			SET @Vinculado = (
			SELECT COUNT(Id) FROM TiCentral.UsuarioAplicacion UA 
			WHERE UA.IdUsuario = @IdUsuario AND UA.IdApp = P_IdApp);

			IF @Vinculado = 0 THEN
				SELECT '403' AS Respuesta,'Usuario no esta vinculado a la app' AS Mensaje;
				LEAVE proc;	
			END IF;	
		END IF;				
	END IF;
#endregion

#region Revisa si ya esta vincculado
	If (P_TipoSolicitud = @TpoVinculacion) THEN
		-- revisar usuario y app
		SET @Vinculado = (
		SELECT COUNT(id) FROM TiCentral.UsuarioAplicacion UA 
								WHERE UA.IdApp = P_IdApp AND UA.IdUsuario = @IdUsuario);
		IF @Vinculado >= 1 THEN
				SELECT '403' AS Respuesta,'Usuario ya está vinculado a la app' AS Mensaje;
				LEAVE proc;	
		END IF;
	END IF; 
#endregion

	-- genera UUID
	SET @UUID = UUID();	
	INSERT INTO TiCentral.Solicitudes (
	Id,
	DatosAdicionales,
	Estatus,
	TipoSolicitud,
	CreadoPor,
	FechaDeCreacion,
	UltimaModificacion,
	ModificadoPor,
	IdApp,
	Nombre,
	ApellidoPaterno,
	ApellidoMaterno,
	NombreUsuario,
	CorreoElectronico,
	Curp,
	Rfc,
	Telefono,
	Ext,
	Celular
	)VALUES(
	@UUID,
	P_DatosAdicionales,
	0,
	P_TipoSolicitud,
	P_CreadoPor,
	CURRENT_TIMESTAMP(),
	CURRENT_TIMESTAMP(),
	P_CreadoPor,
	P_IdApp,
	P_Nombre,
	P_ApellidoPaterno,
	P_ApellidoMaterno,
	P_NombreUsuario,
	P_CorreoElectronico,
	P_Curp,
	P_Rfc,
	P_Telefono,
	P_Ext,
	P_Celular
	);		
	SELECT '201' as Respuesta,'Se creó la solicitud con éxito' AS Mensaje, @UUID AS IdSolicitud;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DesvinculaUsuarioApp
DROP PROCEDURE IF EXISTS `sp_DesvinculaUsuarioApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DesvinculaUsuarioApp`(
	IN `P_IdUsuario` CHAR(36),
	IN `P_IdApp` CHAR(36),
	IN `P_IdUsuarioModificador` CHAR(36)
)
BEGIN

	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
    IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.Id = P_IdUsuarioModificador and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para desvincular aplicaciones' AS Mensaje;
	ELSE
		IF (SELECT COUNT(*) FROM TiCentral.UsuarioAplicacion WHERE IdApp = P_IdApp AND IdUsuario = P_IdUsuario) = 1 THEN
			DELETE FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = P_IdUsuario AND IdApp = P_IdApp;
           	SET Respuesta = 201;
			SELECT Respuesta,'El usuario fue desvinculado con éxito de la aplicación' AS Mensaje;
		ELSE
            SET Respuesta = 409;
			SELECT Respuesta,'No existe ninguna vinculación del usuario con la aplicación' AS Mensaje;
		END IF;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetalleApp
DROP PROCEDURE IF EXISTS `sp_DetalleApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleApp`(
	IN `P_Id` CHAR(36),
	IN `P_IdUsuario` CHAR(36),
	IN `P_IdTipoUsuario` VARCHAR(37)
)
BEGIN

	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
	IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para ver los detalles de la aplicación' AS Mensaje;
	ELSE
		SET Respuesta = 201;
		SELECT Respuesta,TiCentral.Apps.* FROM TiCentral.Apps WHERE id=P_Id;
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetalleAppUsuario
DROP PROCEDURE IF EXISTS `sp_DetalleAppUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleAppUsuario`(
	IN `P_IdUsuario` CHAR(36)
)
BEGIN
	IF((SELECT EstaActivo From TiCentral.Usuarios WHERE TiCentral.Usuarios.Id = P_IdUsuario) = 1) THEN
		IF((SELECT COUNT(*) FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = P_IdUsuario) > 0 ) THEN
			SELECT
			AP.Id IdApp,
			AP.Nombre ,
			AP.Path,
			AP.Descripcion
			FROM TiCentral.Usuarios US
			INNER JOIN TiCentral.UsuarioAplicacion UA ON US.Id = UA.IdUsuario
			INNER JOIN TiCentral.Apps AP ON AP.Id = UA.IdApp WHERE US.Id = P_IdUsuario AND US.EstaActivo = 1 ORDER BY AP.Nombre;
		ELSE 		
			SELECT '401' AS Respuesta,'Tu usuario no tiene aplicaciones vinculadas.' AS Mensaje;
		END IF;
	ELSEIF  
	((SELECT EstaActivo From TiCentral.Usuarios WHERE TiCentral.Usuarios.Id = P_IdUsuario) = 0) THEN
		SELECT '401' AS Respuesta,'El usuario no esta activo.' AS Mensaje;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetalleSolicitud
DROP PROCEDURE IF EXISTS `sp_DetalleSolicitud`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleSolicitud`(
	IN `P_IdUsuarioSolicitante` CHAR(36),
	IN `P_IdSol` CHAR(36)


)
BEGIN
	-- Obtener el nombre del tipo de usuario
	SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t
	INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
	WHERE u.Id = P_IdUsuarioSolicitante);
	-- Obtener si el usuario tiene acceso a la app que se registro en la solicitud
	 SET @App = (SELECT IdApp FROM TiCentral.Solicitudes WHERE Id = P_IdSol);
	 SET @NombreApp = (SELECT Nombre FROM TiCentral.Apps WHERE Id = @App);
	 SET @Tiene = (SELECT COUNT(id) FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = P_IdUsuarioSolicitante AND idapp = @App);	
	
	IF((SELECT COUNT(id) FROM TiCentral.Solicitudes WHERE Id = P_IdSol)=1) THEN
		If (@TpoUser = 'ADMINGENERAL') then	
			SELECT '201' AS Respuesta,'Ok' AS Mensaje,s.Id,s.Nombre,s.ApellidoPaterno,s.ApellidoMaterno,s.NombreUsuario,s.CorreoElectronico,
			s.Curp,s.Rfc,s.Telefono,s.Ext,s.Celular,
			s.FechaDeCreacion,s.CreadoPor,s.Estatus,s.DatosAdicionales,@NombreApp  AS NombreApp, CONCAT_WS(' ',uC.Nombre,uC.ApellidoPaterno,uC.ApellidoMaterno) AS NombreSolicitante
			FROM TiCentral.Solicitudes s, TiCentral.Usuarios uC
			WHERE s.Id = P_IdSol
			AND s.CreadoPor = uC.Id;
		ELSEIF (@TpoUser = 'ADMINPLATAFORMA' AND @Tiene >= 1) then	
			SELECT '201' AS Respuesta,'Ok' AS Mensaje,s.Id,s.Nombre,s.ApellidoPaterno,s.ApellidoMaterno,s.NombreUsuario,s.CorreoElectronico,
			s.Curp,s.Rfc,s.Telefono,s.Ext,s.Celular,
			s.FechaDeCreacion,s.CreadoPor,s.Estatus,s.DatosAdicionales,@NombreApp  AS NombreApp, CONCAT_WS(' ',uC.Nombre,uC.ApellidoPaterno,uC.ApellidoMaterno) AS NombreSolicitante
			FROM TiCentral.Solicitudes s, TiCentral.Usuarios uC
			WHERE s.Id = P_IdSol
			AND s.CreadoPor = uC.Id;
		ELSE 
			SELECT '403' AS Respuesta,'Usuario no tiene permiso para visualizar el detalle de solicitudes' AS Mensaje;
		END IF;
	ELSE
			SELECT '403' AS Respuesta,'IdSolicitud invalido' AS Mensaje;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetalleSolicitudDocumento
DROP PROCEDURE IF EXISTS `sp_DetalleSolicitudDocumento`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleSolicitudDocumento`(
	IN `P_IdSolicitud` CHAR(36)




)
BEGIN
	
	SET @UserName = (Select s.NombreUsuario from TiCentral.Solicitudes s where s.Id=P_IdSolicitud);
	SET @Existe = (Select Count(id) from TiCentral.Usuarios u where u.NombreUsuario =@UserName);
	
	IF(@Existe=1) THEN
	
			SELECT 
			s.FechaDeCreacion AS Fecha,
			ts.tipoSoli AS TipoDeMovimiento,
			s.Nombre AS Nombre,
			s.ApellidoPaterno AS ApellidoPaterno,
			s.ApellidoMaterno AS ApellidoMaterno,
			s.NombreUsuario AS NombreUsuario,
			s.CorreoElectronico AS Correo,
			s.Curp AS CURP,
			s.Rfc AS RFC,
			s.Telefono AS Telefono,
			s.Ext AS Extension,
			s.Celular AS Celular,
			tu.Descripcion AS TpoUsuario,
			a.Nombre AS AccesoApp
		FROM TiCentral.Solicitudes s
		INNER JOIN TiCentral.TipoSolicitud ts ON s.TipoSolicitud = ts.id
		INNER JOIN TiCentral.Apps a ON s.IdApp = a.id
		INNER JOIN TiCentral.Usuarios u On s.NombreUsuario =u.NombreUsuario
		INNER JOIN TiCentral.TipoUsuario tu On u.IdTipoUsuario=tu.Id
		WHERE s.Id= P_IdSolicitud;
		
	ELSE
	
		SELECT 
			s.FechaDeCreacion AS Fecha,
			ts.tipoSoli AS TipoDeMovimiento,
			s.Nombre AS Nombre,
			s.ApellidoPaterno AS ApellidoPaterno,
			s.ApellidoMaterno AS ApellidoMaterno,
			s.NombreUsuario AS NombreUsuario,
			s.CorreoElectronico AS Correo,
			s.Curp AS CURP,
			s.Rfc AS RFC,
			s.Telefono AS Telefono,
			s.Ext AS Extension,
			s.Celular AS Celular,
			/*tu.Descripcion*/'Usuario' AS TpoUsuario,
			a.Nombre AS AccesoApp
		FROM TiCentral.Solicitudes s
		INNER JOIN TiCentral.TipoSolicitud ts ON s.TipoSolicitud = ts.id
		INNER JOIN TiCentral.Apps a ON s.IdApp = a.id
		/*INNER JOIN TiCentral.Usuarios u On s.NombreUsuario =u.NombreUsuario*/
		/*INNER JOIN TiCentral.TipoUsuario tu On u.IdTipoUsuario=tu.Id*/
		WHERE s.Id= P_IdSolicitud;
	END IF;
	

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetalleUsuario
DROP PROCEDURE IF EXISTS `sp_DetalleUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleUsuario`(
	IN `P_Id` CHAR(36)

)
BEGIN
	SELECT us.Id, us.Nombre, us.ApellidoPaterno, us.ApellidoMaterno, us.NombreUsuario, us.CorreoElectronico, us.Curp, us.Rfc, 
			 us.Telefono, us.Ext, us.Celular, us.UltimoInicioDeSesion, us.EstaActivo, us.CreadoPor, us.ModificadoPor, us.Deleted, 
			 us.IdTipoUsuario 
	FROM TiCentral.Usuarios us  
	WHERE us.Id = P_Id OR us.CorreoElectronico=P_ID;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ExisteApp
DROP PROCEDURE IF EXISTS `sp_ExisteApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ExisteApp`(
	IN `P_Nombre` VARCHAR(30),
	IN `P_Path` VARCHAR(50),
	IN `P_IdUsuario` CHAR(36)
)
BEGIN
	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
    IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.Id = P_IdUsuario and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para ver realizar está validación' AS Mensaje;
	ELSE
		SET Respuesta = 201;
    	SELECT Respuesta,
		(SELECT count(*) FROM TiCentral.Apps ap  WHERE ap.Nombre = P_Nombre) AS ExisteNombre ,
		(SELECT count(*) FROM TiCentral.Apps ap  WHERE ap.Path = P_Path) AS ExistePath;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ExisteUsuario
DROP PROCEDURE IF EXISTS `sp_ExisteUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ExisteUsuario`(
	IN `P_NombreUsuario` VARCHAR(30),
	IN `P_CorreoElectronico` VARCHAR(100)
)
BEGIN
	SELECT
	(SELECT count(*) FROM TiCentral.Usuarios us  WHERE us.NombreUsuario = P_NombreUsuario) AS ExisteUsuario ,
	(SELECT count(*) FROM TiCentral.Usuarios us  WHERE us.CorreoElectronico = P_CorreoElectronico) AS ExisteCorreoElectronico;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_GeneraDocumentoSolicitud
DROP PROCEDURE IF EXISTS `sp_GeneraDocumentoSolicitud`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GeneraDocumentoSolicitud`(
	IN `P_IdSolicitud` CHAR(36)

)
BEGIN
	SELECT 
	u.Id,
	u.Nombre,
	u.ApellidoPaterno,
	u.ApellidoMaterno,
	u.NombreUsuario,
	u.CorreoElectronico,
	u.Curp,
	u.Rfc,
	u.Telefono,
	u.Ext,
	u.Celular,
	t.Nombre AS TipoUsuario,
	s.Id AS IdSolicitud, 
	s.DatosAdicionales,
	s.TipoSolicitud,
	CONCAT_WS(' ',trim(uc.Nombre),trim(uc.ApellidoPaterno),trim(uc.ApellidoMaterno)) AS CreadoPor,
	s.FechaDeCreacion,
	c.Comentario, 
	a.Nombre AS App
	FROM TiCentral.Usuarios u, TiCentral.Solicitudes s, TiCentral.Comentarios c, TiCentral.TipoUsuario t, TiCentral.Apps a, TiCentral.Usuarios uc
	WHERE s.Id = P_IdSolicitud 
	AND s.IdUsuario = u.Id 
	AND s.Id = c.IdSolicitud 
	AND u.IdTipoUsuario = t.Id
	AND s.IdApp = a.Id
	AND s.CreadoPor = uc.Id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_GenerarUsuario
DROP PROCEDURE IF EXISTS `sp_GenerarUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GenerarUsuario`(
	`P_Nombre` VARCHAR(20),
	`P_ApellidoPaterno` VARCHAR(20),
	`P_ApellidoMaterno` VARCHAR(20),
	`P_NombreUsuario` VARCHAR(30),
	`P_CorreoElectronico` VARCHAR(100),
	`P_Contrasena` VARCHAR(255),
	`P_IdUsuario` CHAR(37),
	`P_Curp` VARCHAR(18),
	`P_Rfc` VARCHAR(13),
	`P_Telefono` VARCHAR(10),
	`P_Ext` VARCHAR(4),
	`P_Celular` VARCHAR(10),
	`P_IdTipoUsuario` VARCHAR(37),
	
	`P_DatosAdicionales` VARCHAR(2000),
	`P_TipoSolicitud` CHAR(36),
	`P_IdApp` CHAR(36),

	`P_Comentario` VARCHAR(2000)	
)
BEGIN
	DECLARE CodigoError INT DEFAULT 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION, NOT FOUND, SQLWARNING
	BEGIN    
		ROLLBACK;
		GET DIAGNOSTICS CONDITION 1 @`errno` = MYSQL_ERRNO, @`sqlstate` = RETURNED_SQLSTATE, @`text` = MESSAGE_TEXT;
		SET @full_error = CONCAT('ERROR ', @`errno`, ' (', @`sqlstate`, '): ', @`text`);
		-- SET autocommit = 1;
		SELECT CodigoError, @full_error;    
	END;

	START TRANSACTION;	
		SET CodigoError = 201;
		-- SET FOREIGN_KEY_CHECKS = 0;
		-- se desactiva el autocommit
		-- SET autocommit = 0;
		
		-- 1er Crear Usuario
		CALL `sp_CrearUsuario`(P_Nombre, P_ApellidoPaterno, P_ApellidoMaterno, P_NombreUsuario, 
		P_CorreoElectronico, P_Contrasena, P_IdUsuario, P_Curp, P_Rfc, P_Telefono, P_Ext, 
		P_Celular, P_IdTipoUsuario);
		
		-- hay que obtener el IdUsuario recien generado
		SET @IdUsr = (SELECT Id FROM Usuarios u WHERE u.NombreUsuario = P_NombreUsuario);
		
		CALL `sp_CreaSolicitud`(@IdUsr, P_DatosAdicionales, P_TipoSolicitud, 
		P_IdUsuario, P_IdApp);
		
		
		IF len(TRIM(P_Comentario)) > 0 then
			-- hay que obtener el Id de la solicitud recien generado
			SET @IdSol = (SELECT * FROM Solicitudes s WHERE s.IdUsuario = @IdUsr);
			
			CALL `sp_CreaComentarioSol`(@IdUsr, @IdSol, P_Comentario);
		END IF;

		-- SET FOREIGN_KEY_CHECKS = 1;

		SELECT CodigoError, 'Congrates!, successfully executed.';
	
	COMMIT;
	-- SET autocommit = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_IniciaSesion
DROP PROCEDURE IF EXISTS `sp_IniciaSesion`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_IniciaSesion`(
	IN `P_Usuario` VARCHAR(50)
)
BEGIN
	SET @UserId = (SELECT Id FROM TiCentral.Usuarios WHERE NombreUsuario = P_Usuario OR CorreoElectronico = P_Usuario);
	IF (SELECT EstaActivo FROM TiCentral.Usuarios WHERE NombreUsuario = P_Usuario OR CorreoElectronico = P_Usuario) = 1 THEN
		SELECT US.Id, US.NombreUsuario, US.CorreoElectronico, US.Contrasena 
		FROM TiCentral.Usuarios US 
		WHERE US.NombreUsuario = P_Usuario OR US.CorreoElectronico = P_Usuario;
		CALL sp_DetalleAppUsuario(@UserId);
	ELSEIF (SELECT EstaActivo FROM TiCentral.Usuarios WHERE NombreUsuario = P_Usuario OR CorreoElectronico = P_Usuario) = 0 THEN
		SELECT '401' AS Respuesta, 'El usuario no esta activo.' AS Mensaje;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaApp
DROP PROCEDURE IF EXISTS `sp_ListaApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaApp`(
	IN `P_IdUsuario` CHAR(36)
)
BEGIN
	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
    IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.IdTipoUsuario=Tipo.id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para ver el listado de aplicaciones' AS Mensaje;
	ELSE
		SET Respuesta = 201;
		SELECT Respuesta,Id, Nombre, Path,	Descripcion, EstaActivo, Deleted FROM TiCentral.Apps WHERE EstaActivo = 1 AND Deleted = 0 ORDER BY Nombre ;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaAppUsuario
DROP PROCEDURE IF EXISTS `sp_ListaAppUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaAppUsuario`(
	IN `P_Id` CHAR(36)
)
BEGIN
	IF (SELECT COUNT(*) FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = P_Id ) >= 1 THEN
		SELECT 
		UA.Id,
		AP.Nombre Nombre,
		AP.Id IdApp,
		US.Id IdUsuario,
		US.NombreUsuario,
		AP.Path,
		AP.Descripcion,
		AP.EstaActivo, 
		US.CorreoElectronico
		FROM TiCentral.Usuarios US
		INNER JOIN TiCentral.UsuarioAplicacion UA ON US.Id = UA.IdUsuario
		INNER JOIN TiCentral.Apps AP ON AP.Id = UA.IdApp 
		WHERE US.Id = P_Id
		ORDER BY AP.Nombre;
	ELSE
		SELECT '401' AS Respuesta, 'tu usuario no tiene aplicaciones vinculadas.' AS Mensaje;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaSolicitudes
DROP PROCEDURE IF EXISTS `sp_ListaSolicitudes`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaSolicitudes`(
	IN `P_IdUsuarioSolicitante` CHAR(36)
)
BEGIN
	-- obtener el nombre del tipo de usuario
	SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t
	INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
	WHERE u.Id = P_IdUsuarioSolicitante);

	If (@TpoUser = 'ADMINGENERAL') then
		SELECT '201' AS Respuesta,'Ok' AS Mensaje,  s.Id, concat(s.Nombre,' ', s.ApellidoPaterno) as NombreUsuario, s.DatosAdicionales,
        s.Estatus, s.TipoSolicitud, ts.tipoSoli,
		  s.CreadoPor, concat(uC.Nombre,' ',uC.ApellidoPaterno) as NombreSolicitante, s.FechaDeCreacion, s.UltimaModificacion, s.ModificadoPor, s.IdApp, a.Nombre AS AppNombre		
		FROM TiCentral.Solicitudes s
        INNER JOIN TiCentral.Apps a ON a.Id = s.IdApp
        INNER JOIN TiCentral.Usuarios uC ON uC.Id = s.CreadoPor
        INNER JOIN TiCentral.TipoSolicitud ts ON ts.id = s.TipoSolicitud
      WHERE s.Estatus = 0
		ORDER BY s.FechaDeCreacion DESC;        
	ELSE 
		SELECT '403' AS Respuesta,'Usuario no tiene permiso para visualizar lista de solicitudes' AS Mensaje;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaSolicitudesApp
DROP PROCEDURE IF EXISTS `sp_ListaSolicitudesApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaSolicitudesApp`(
	IN `P_IdUsuarioSolicitante` CHAR(36),
	IN `P_IdApp` CHAR(36)
)
BEGIN
	-- Obtener el nombre del tipo de usuario
	SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t 
						INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
						WHERE u.Id = P_IdUsuarioSolicitante);
	-- Obtener si tiene acceso a la app
	SET @Tiene = (SELECT COUNT(id) FROM TiCentral.UsuarioAplicacion
					WHERE idUsuario = P_IdUsuarioSolicitante AND IdApp = P_IdApp);
					
	If (@TpoUser = 'ADMINGENERAL') OR (@TpoUser = 'ADMINPLATAFORMA' AND @Tiene >= 1) THEN
/*		SELECT '201' AS Respuesta,'Ok' AS Mensaje,
		s.Id,s.IdUsuario,s.DatosAdicionales,s.Estatus,s.TipoSolicitud,ts.tipoSoli,s.CreadoPor,s.FechaDeCreacion,s.UltimaModificacion,s.ModificadoPor,s.IdApp,a.Nombre AS AppNombre
		FROM TiCentral.Solicitudes s
		INNER JOIN TiCentral.TipoSolicitud ts ON ts.id = TipoSolicitud
		INNER JOIN TiCentral.Apps a ON a.Id = s.IdApp
		WHERE Estatus = 0; 
*/	
		SELECT '201' AS Respuesta,'Ok' AS Mensaje,  
		s.Id, concat(s.Nombre,' ', s.ApellidoPaterno) as NombreUsuario, s.DatosAdicionales,
        s.Estatus, s.TipoSolicitud, ts.tipoSoli,
		  s.CreadoPor, concat(uC.Nombre,' ',uC.ApellidoPaterno) as NombreSolicitante, s.FechaDeCreacion, s.UltimaModificacion, s.ModificadoPor, 
		  s.IdApp, a.Nombre AS AppNombre		
		FROM TiCentral.Solicitudes s
        INNER JOIN TiCentral.Apps a ON a.Id = P_IdApp AND s.IdApp = a.Id
        INNER JOIN TiCentral.Usuarios uC ON uC.Id = s.CreadoPor
        INNER JOIN TiCentral.TipoSolicitud ts ON ts.id = s.TipoSolicitud
      ORDER BY s.FechaDeCreacion DESC;
      /*WHERE s.Estatus = 0; 		*/
	ELSE
		SELECT '403' AS Respuesta,'Usuario no tiene permiso para visualizar lista de solicitudes' AS Mensaje; 
	END IF; 
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaTipoSolicitud
DROP PROCEDURE IF EXISTS `sp_ListaTipoSolicitud`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaTipoSolicitud`(
	IN `ch_IdUsuario` CHAR(36)




)
BEGIN
	IF (SELECT COUNT(*) FROM Usuarios WHERE Id = ch_IdUsuario  ) >= 1 THEN 	
		Select id, tipoSoli from TiCentral.TipoSolicitud;
	Else 
		SELECT 'Acceso denegado' AS error;
		END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaTipoUsuario
DROP PROCEDURE IF EXISTS `sp_ListaTipoUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaTipoUsuario`(
	IN `p_IdUsuario` VARCHAR(36)
)
BEGIN
	DECLARE p_TipoUsuario VARCHAR(36);
	SET p_TipoUsuario = (SELECT UPPER (tipo.Nombre) FROM TiCentral.TipoUsuario as tipo, TiCentral.Usuarios AS usuario WHERE usuario.Id = p_IdUsuario AND usuario.IdTipoUsuario = tipo.Id);

	if (p_TipoUsuario = 'ADMINGENERAL') then
		SELECT tipo.Id, tipo.Nombre, tipo.Descripcion FROM TiCentral.TipoUsuario AS tipo ORDER BY tipo.Nombre ;
	END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaUsuarios
DROP PROCEDURE IF EXISTS `sp_ListaUsuarios`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaUsuarios`(
	IN `P_IdUsuario` CHAR(37)
)
BEGIN
	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
	IF (SELECT t.Nombre from TiCentral.TipoUsuario t INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario WHERE u.Id = P_IdUsuario) = 'AdminGeneral' THEN	
		SELECT US.Id, US.EstaActivo, US.Nombre, US.ApellidoPaterno, US.ApellidoMaterno, US.NombreUsuario, 
				US.CorreoElectronico, US.Curp, US.Rfc, US.Telefono, US.Ext, US.Celular, US.IdTipoUsuario, US.CreadoPor, US.ModificadoPor, (SELECT NombreUsuario FROM TiCentral.Usuarios WHERE Id = US.ModificadoPor) AS NombreModificadoPor,
				(SELECT NombreUsuario FROM TiCentral.Usuarios WHERE Id = US.CreadoPor) AS NombreCreadoPor FROM TiCentral.Usuarios US WHERE Deleted = 0 ORDER BY US.Nombre ASC;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ModificaApp
DROP PROCEDURE IF EXISTS `sp_ModificaApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaApp`(
	IN `P_Id` CHAR(36),
	IN `P_Nombre` VARCHAR(30),
	IN `P_Path` VARCHAR(30),
	IN `P_IdUsuario` CHAR(36)
)
BEGIN
	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
    IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.idTipoUsuario=Tipo.id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para modificar la aplicación' AS Mensaje;
	ELSE
		UPDATE 
		TiCentral.Apps SET 
		Nombre = P_Nombre,
		Path = P_Path ,
		UltimaModificacion = CURRENT_TIMESTAMP(),
		ModificadoPor = P_IdUsuario
		WHERE Id = P_Id;		
      SET Respuesta = 201;        
		SELECT Respuesta,'Ok' as Mensaje,TiCentral.Apps.* FROM TiCentral.Apps
		WHERE Id = P_Id;
	END IF;    
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ModificaSolicitud
DROP PROCEDURE IF EXISTS `sp_ModificaSolicitud`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaSolicitud`(
	IN `P_IdSolicitud` CHAR(36),
	IN `P_Nombre` VARCHAR(20),
	IN `P_ApellidoPaterno` VARCHAR(20),
	IN `P_ApellidoMaterno` VARCHAR(20),
	IN `P_NombreUsuario` VARCHAR(30),
	IN `P_CorreoElectronico` VARCHAR(100),
	IN `P_Curp` VARCHAR(18),
	IN `P_Rfc` VARCHAR(13),
	IN `P_Telefono` VARCHAR(10),
	IN `P_Ext` VARCHAR(4),
	IN `P_Celular` CHAR(36)
,
	IN `P_DatosAdicionales` VARCHAR(2000),
	IN `P_Estatus` TINYINT,
	IN `P_IdApp` CHAR(36),
	IN `P_IdUsuarioSolicitante` CHAR(36)



)
BEGIN
	-- Obtener el nombre del tipo de usuario
	SET @TpoUser = (SELECT UPPER (t.Nombre) FROM TiCentral.TipoUsuario t
	INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
	WHERE u.Id = P_IdUsuarioSolicitante);
	-- Obtener si el usuario tiene acceso a la app que se registro en la solicitud
	SET @App = (SELECT IdApp FROM TiCentral.Solicitudes WHERE Id = P_IdSolicitud);
	SET @Tiene = (SELECT COUNT(id) FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = P_IdUsuarioSolicitante AND IdApp = @App);
	
	IF ((SELECT COUNT(id) FROM TiCentral.Solicitudes  WHERE Id = P_IdSolicitud )=1) THEN
		If (@TpoUser = 'ADMINGENERAL') OR (@TpoUser = 'ADMINPLATAFORMA' AND @Tiene >= 1) then	
		
		UPDATE TiCentral.Solicitudes s
		SET DatosAdicionales = P_DatosAdicionales, 
		Estatus = P_Estatus, 
		UltimaModificacion = NOW(), 
		ModificadoPor = P_IdUsuarioSolicitante, 
		IdApp = P_IdApp, Nombre = P_Nombre, 
		ApellidoPaterno = P_ApellidoPaterno, 
		ApellidoMaterno = P_ApellidoMaterno, 
		NombreUsuario = P_NombreUsuario, 
		CorreoElectronico = P_CorreoElectronico, 
		Curp = P_Curp, 
		Rfc = P_Rfc, 
		Telefono = P_Telefono, 
		Ext = P_Ext, 
		Celular = P_Celular
		where s.Id=P_IdSolicitud;
	         
			SELECT '201' as Respuesta,'Modificación de registro con éxito' AS Mensaje;
		ELSE 
			SELECT '403' AS Respuesta,'Usuario no tiene permiso para modificar solicitud' AS Mensaje;
		END IF;
	ELSE
		SELECT '403' AS Respuesta,'IdSolicitud invalido' AS Mensaje;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ModificaUsuario
DROP PROCEDURE IF EXISTS `sp_ModificaUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaUsuario`(
	IN `P_Id` CHAR(36),
	IN `P_Nombre` VARCHAR(20),
	IN `P_ApellidoPaterno` VARCHAR(20),
	IN `P_ApellidoMaterno` VARCHAR(20),
	IN `P_EstaActivo` TINYINT(1),
	IN `P_IdUsuario` CHAR(36),
	IN `P_Curp` VARCHAR(18),
	IN `P_Rfc` VARCHAR(13),
	IN `P_Telefono` VARCHAR(10),
	IN `P_Ext` VARCHAR(4),
	IN `P_Celular` VARCHAR(10),
	IN `P_IdTipoUsuario` VARCHAR(37)
)
BEGIN

	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
    IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.idTipoUsuario=Tipo.id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para modificar datos del usuario.' AS Mensaje;
	ELSE
		UPDATE 
		TiCentral.Usuarios
		SET 
		Nombre = P_Nombre,
		ApellidoPaterno = P_ApellidoPaterno,
		ApellidoMaterno = P_ApellidoMaterno,
		UltimaModificacion = CURRENT_TIMESTAMP(),
		EstaActivo=P_EstaActivo,
		ModificadoPor = P_IdUsuario,
		Curp = P_Curp,
		Rfc = P_Rfc,
		Telefono = P_Telefono,
		Ext = P_Ext,
		Celular = P_Celular,
		IdTipoUsuario = P_IdTipoUsuario
		WHERE Usuarios.Id = P_Id;
      SET Respuesta = 201;
      SELECT Respuesta,'Ok' as Mensaje, us.Id, us.Nombre, us.ApellidoPaterno, us.ApellidoMaterno, us.NombreUsuario, us.CorreoElectronico, us.Curp, us.Rfc, us.Telefono, us.Ext, us.Celular, us.UltimoInicioDeSesion, us.IdTipoUsuario, us.EstaActivo, us.CreadoPor, us.ModificadoPor, us.Deleted 
		FROM TiCentral.Usuarios us 
		WHERE us.Id = P_Id;        
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ObtenerDatosAdicionalesSolicitud
DROP PROCEDURE IF EXISTS `sp_ObtenerDatosAdicionalesSolicitud`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ObtenerDatosAdicionalesSolicitud`(
	IN `P_IdUsuario` CHAR(36)

,
	IN `P_IdApp` CHAR(36)



)
BEGIN
	SET @email = (select CorreoElectronico from TiCentral.Usuarios s where s.Id = P_IdUsuario);
	SET @IdAlta = (select t.id from TiCentral.TipoSolicitud t where Ucase(t.tipoSoli)='ALTA');
	SET @IdVinculacion = (select t.id from TiCentral.TipoSolicitud t where Ucase(t.tipoSoli)='VINCULACION');
	-- Obtener si el usuario tiene acceso a la app que se registro en la solicitud
	If (Select Count(*) from TiCentral.Solicitudes s where ((s.CorreoElectronico= @email) AND (s.TipoSolicitud= @IdAlta Or s.TipoSolicitud= @IdVinculacion) AND s.Estatus=1)  )=1 then	
		SELECT '200' AS Respuesta,'Ok' AS Mensaje,s.DatosAdicionales,s.CreadoPor,s.NombreUsuario
		FROM TiCentral.Solicitudes s
		WHERE ((s.CorreoElectronico= @email) AND ((s.IdApp= P_IdApp) AND (s.TipoSolicitud= @IdAlta Or s.TipoSolicitud= @IdVinculacion)) AND s.Estatus=1)
		ORDER BY s.UltimaModificacion DESC LIMIT 1;
	
	ELSE 
		SELECT '403' AS Respuesta,'No se encontro la solicitud' AS Mensaje;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_OlvideContrasena
DROP PROCEDURE IF EXISTS `sp_OlvideContrasena`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_OlvideContrasena`(
	IN `P_usuario` CHAR(36),
	IN `P_Contrasena` VARCHAR(255)
)
BEGIN

	DECLARE Respuesta INT;    
	UPDATE TiCentral.Usuarios us
	SET us.Contrasena = P_Contrasena
	WHERE us.NombreUsuario = P_usuario OR us.CorreoElectronico = P_usuario;
	SET Respuesta = 201;
	SELECT Respuesta,'Ok' as Mensaje, Id, Nombre, NombreUsuario, CorreoElectronico 
	FROM TiCentral.Usuarios us 
	WHERE (us.NombreUsuario = P_usuario OR us.CorreoElectronico = P_usuario);
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_PuedeFirmar
DROP PROCEDURE IF EXISTS `sp_PuedeFirmar`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_PuedeFirmar`(
	IN `P_IdUsuario`		VARCHAR(36),
	IN `P_Puede`			TINYINT
)
BEGIN
	DECLARE Respuesta INT;
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	GET DIAGNOSTICS CONDITION 1 
	 @sqlstateno = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, 
	 @text = MESSAGE_TEXT;	 
	SET @full_error = CONCAT("ERROR:(",@errno,") ",@sqlstateno," - ", @text);
	SELECT @full_error;
	END;	
	
	IF (SELECT COUNT(Id) FROM TiCentral.Usuarios u WHERE u.Id = P_IdUsuario) >= 1 then	
		UPDATE TiCentral.Usuarios s SET s.PuedeFirmar = P_Puede
		WHERE s.Id = P_IdUsuario;
		
		SET Respuesta = 201;
		SELECT Respuesta,'Se grabo el path con éxito' AS Mensaje;
	else
		SET Respuesta = 401;
		SELECT Respuesta,'Usuario no existe' AS Mensaje;
	
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_SolicitudActualDocumento
DROP PROCEDURE IF EXISTS `sp_SolicitudActualDocumento`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_SolicitudActualDocumento`(
	IN `P_IdSolicitud` CHAR(36)
)
BEGIN
SET @ExisteUsiario=(Select Count(u.Id) from TiCentral.Usuarios u where u.NombreUsuario = (Select s.NombreUsuario from TiCentral.Solicitudes s where  s.Id=P_IdSolicitud));
		IF (@ExisteUsiario=1) THEN
			SELECT 
				s.FechaDeCreacion AS Fecha,
				ts.tipoSoli AS TipoDeMovimiento,
				s.Nombre AS Nombre,
				s.ApellidoPaterno AS ApellidoPaterno,
				s.ApellidoMaterno AS ApellidoMaterno,
				s.NombreUsuario AS NombreUsuario,
				s.CorreoElectronico AS Correo,
				s.Curp AS CURP,
				s.Rfc AS RFC,
				s.Telefono AS Telefono,
				s.Ext AS Extension,
				s.Celular AS Celular,
				tu.Descripcion AS TpoUsuario,
				a.Nombre AS AccesoApp
			FROM TiCentral.Solicitudes s
			INNER JOIN TiCentral.TipoSolicitud ts ON s.TipoSolicitud = ts.id
			INNER JOIN TiCentral.Apps a ON s.IdApp = a.id
			INNER JOIN TiCentral.Usuarios u On s.NombreUsuario =u.NombreUsuario
			INNER JOIN TiCentral.TipoUsuario tu On u.IdTipoUsuario=tu.Id
			WHERE s.Id = P_IdSolicitud;
		ELSE
			SELECT 
					s.FechaDeCreacion AS Fecha,
					ts.tipoSoli AS TipoDeMovimiento,
					s.Nombre AS Nombre,
					s.ApellidoPaterno AS ApellidoPaterno,
					s.ApellidoMaterno AS ApellidoMaterno,
					s.NombreUsuario AS NombreUsuario,
					s.CorreoElectronico AS Correo,
					s.Curp AS CURP,
					s.Rfc AS RFC,
					s.Telefono AS Telefono,
					s.Ext AS Extension,
					s.Celular AS Celular,
					'Usuario' AS TpoUsuario,
					a.Nombre AS AccesoApp
				FROM TiCentral.Solicitudes s
				INNER JOIN TiCentral.TipoSolicitud ts ON s.TipoSolicitud = ts.id
				INNER JOIN TiCentral.Apps a ON s.IdApp = a.id
				WHERE s.Id = P_IdSolicitud;
		END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_UltimaSolicitudUsuario
DROP PROCEDURE IF EXISTS `sp_UltimaSolicitudUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_UltimaSolicitudUsuario`(
	IN `P_NombreUsuario` VARCHAR(30)






)
proc:BEGIN


#region obtiene id de vinculacion
	SET @IdVinculacion = (SELECT ID FROM TiCentral.TipoSolicitud ts WHERE UPPER(ts.tipoSoli) = 'VINCULACION');
#endregion 


#region 
	SELECT 
		s.FechaDeCreacion AS Fecha,
		ts.tipoSoli AS TipoDeMovimiento,
		s.Nombre AS Nombre,
		s.ApellidoPaterno AS ApellidoPaterno,
		s.ApellidoMaterno AS ApellidoMaterno,
		s.NombreUsuario AS NombreUsuario,
		s.CorreoElectronico AS Correo,
		s.Curp AS CURP,
		s.Rfc AS RFC,
		s.Telefono AS Telefono,
		s.Ext AS Extension,
		s.Celular AS Celular,
		tu.Descripcion AS TpoUsuario,
		/*a.Id,*/
		a.Nombre AS AccesoApp
	FROM TiCentral.Solicitudes s
	INNER JOIN TiCentral.TipoSolicitud ts ON s.TipoSolicitud = ts.id
	INNER JOIN TiCentral.Apps a ON s.IdApp = a.id
	INNER JOIN TiCentral.Usuarios u On s.NombreUsuario =u.NombreUsuario
	INNER JOIN TiCentral.TipoUsuario tu On u.IdTipoUsuario=tu.Id
	WHERE s.NombreUsuario = P_NombreUsuario AND s.TipoSolicitud != @IdVinculacion AND s.Estatus = 1
	ORDER BY s.FechaDeCreacion DESC LIMIT 1;
#endregion

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_VinculaUsuarioApp
DROP PROCEDURE IF EXISTS `sp_VinculaUsuarioApp`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_VinculaUsuarioApp`(
	IN `P_IdUsuario` CHAR(36),
	IN `P_IdApp` CHAR(36),
	IN `P_IdUsuarioModificador` CHAR(36)
)
BEGIN
	DECLARE Respuesta INT;
	IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.Id = P_IdUsuarioModificador and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para vincular usuarios.' AS Mensaje;
	ELSE
		IF (SELECT COUNT(*) FROM TiCentral.UsuarioAplicacion WHERE IdApp = P_IdApp AND IdUsuario = P_IdUsuario) = 1 THEN
			SET Respuesta = 409;
			SELECT Respuesta,'Este usuario ya está vinculado.' AS Mensaje;
		ELSE
			INSERT INTO TiCentral.UsuarioAplicacion (IdUsuario , IdApp) VALUES ( P_IdUsuario , P_IdApp);
			SET Respuesta = 201;
			SELECT Respuesta,'Vinculación exitosa' as Mensaje, Id FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = P_IdUsuario AND IdApp = P_IdApp; 
		END IF;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_VinculaUsuarioApps
DROP PROCEDURE IF EXISTS `sp_VinculaUsuarioApps`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_VinculaUsuarioApps`(
	IN `P_IdUsuario` CHAR(36),
	IN `P_IdApp` CHAR(36),
	IN `P_Estado` TINYINT(1),
	IN `P_IdUsuarioModificador` CHAR(36)
)
BEGIN
	DECLARE P_NombreTipoUsuario CHAR(36);
	DECLARE Respuesta INT;
    
	IF ((SELECT t.Nombre FROM TiCentral.TipoUsuario t
INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario
WHERE u.Id = P_IdUsuarioModificador ) = 'User') THEN
		SET Respuesta = 401;
		SELECT Respuesta,'No tiene permisos para vincular usuario1s a las aplicaciones.' AS Mensaje;
	ELSE
		IF P_Estado = 1 THEN
			CALL sp_VinculaUsuarioApp(P_IdUsuario,P_IdApp,P_IdUsuarioModificador);
            SET Respuesta = 201;
            SELECT Respuesta,'Se vinculo el usuario con éxito' AS Mensaje;
		ELSEIF P_Estado = 0 THEN
			CALL sp_DesvinculaUsuarioApp(P_IdUsuario,P_IdApp,P_IdUsuarioModificador);
            SET Respuesta = 201;
            SELECT Respuesta,'Se desvinculo el usuario con éxito' AS Mensaje;
		END IF;
    END IF;
END//
DELIMITER ;

-- Volcando estructura para función TiCentral.limpiar
DROP FUNCTION IF EXISTS `limpiar`;
DELIMITER //
CREATE DEFINER=`root`@`%` FUNCTION `limpiar`(`str` varchar(255)
) RETURNS varchar(255) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
BEGIN
	
    set str=REPLACE(str,'"','');
    set str=REPLACE(str,'\'','');
    set str=REPLACE(str,' ','');
    set str=REPLACE(str,',','');
    set str=REPLACE(str,';','');
    set str=REPLACE(str,':','');
    set str=REPLACE(str,'(','');
    set str=REPLACE(str,')','');
    set str=REPLACE(str,'/','');
    set str=REPLACE(str,'á','a');
    set str=REPLACE(str,'é','e');
    set str=REPLACE(str,'í','i');
    set str=REPLACE(str,'ó','o');
    set str=REPLACE(str,'ú','u');
    set str=REPLACE(str,'ñ','n');
    set str=REPLACE(str,'$','');
    set str=REPLACE(str,'%','');
    set str=REPLACE(str,'&','');
    set str=REPLACE(str,'=','');
    set str=REPLACE(str,'¿','');    
    set str=REPLACE(str,'?','');
    set str=REPLACE(str,'!','');    
    set str=REPLACE(str,'¡','');       
    set str=REPLACE(str,'´','');    
    set str=REPLACE(str,'|','');    
    set str=REPLACE(str,'^','');
    set str=REPLACE(str,'+','');
    set str=REPLACE(str,'*','');
    set str=REPLACE(str,'[','');
    set str=REPLACE(str,']','');
    set str=REPLACE(str,'{','');
    set str=REPLACE(str,'}','');
    set str=REPLACE(str,'\n','');
    RETURN str;
END//
DELIMITER ;

-- Volcando estructura para función TiCentral.limpiar_ids
DROP FUNCTION IF EXISTS `limpiar_ids`;
DELIMITER //
CREATE DEFINER=`root`@`%` FUNCTION `limpiar_ids`(`str` varchar(255)
) RETURNS varchar(255) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
BEGIN

	 set str=trim(str);
    set str=REPLACE(str,'"','');
    set str=REPLACE(str,'\'','');
    set str=REPLACE(str,',','');
    set str=REPLACE(str,';','');
    set str=REPLACE(str,':','');
    set str=REPLACE(str,'(','');
    set str=REPLACE(str,')','');
    set str=REPLACE(str,'/','');
    set str=REPLACE(str,'á','a');
    set str=REPLACE(str,'é','e');
    set str=REPLACE(str,'í','i');
    set str=REPLACE(str,'ó','o');
    set str=REPLACE(str,'ú','u');
    set str=REPLACE(str,'ñ','n');
    set str=REPLACE(str,'$','');
    set str=REPLACE(str,'%','');
    set str=REPLACE(str,'&','');
    set str=REPLACE(str,'=','');
    set str=REPLACE(str,'¿','');    
    set str=REPLACE(str,'?','');
    set str=REPLACE(str,'!','');    
    set str=REPLACE(str,'¡','');    
    set str=REPLACE(str,'"','');    
    set str=REPLACE(str,'´','');    
    set str=REPLACE(str,'|','');    
    set str=REPLACE(str,'^','');
    set str=REPLACE(str,'+','');
    set str=REPLACE(str,'*','');
    set str=REPLACE(str,'[','');
    set str=REPLACE(str,']','');
    set str=REPLACE(str,'{','');
    set str=REPLACE(str,'}','');
    set str=REPLACE(str,'\n','');
    RETURN str;
END//
DELIMITER ;

-- Volcando estructura para función TiCentral.ValidaCorreo
DROP FUNCTION IF EXISTS `ValidaCorreo`;
DELIMITER //
CREATE DEFINER=`root`@`%` FUNCTION `ValidaCorreo`(`P_Correo` VARCHAR(250)
) RETURNS int(11)
BEGIN
-- SET @Resp = (select P_Correo NOT REGEXP '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,4}$');
	
	if (select P_Correo NOT REGEXP '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,4}$') = 0 then
		RETURN 0;
	else	
		RETURN 1;
	END if;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
