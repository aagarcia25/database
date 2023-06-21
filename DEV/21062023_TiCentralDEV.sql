-- --------------------------------------------------------
-- Host:                         10.200.4.161
-- Versión del servidor:         10.8.8-MariaDB - MariaDB Server
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
  `Nombre` varchar(500) NOT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Path` varchar(30) NOT NULL,
  `EstaActivo` tinyint(1) NOT NULL DEFAULT 0,
  `CreadoPor` char(36) NOT NULL,
  `FechaDeCreacion` datetime NOT NULL,
  `UltimaModificacion` datetime NOT NULL,
  `ModificadoPor` char(36) NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `FK1_Apps_C` (`CreadoPor`),
  KEY `FK2_Apps_M` (`ModificadoPor`),
  CONSTRAINT `FK1_Apps_C` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_Apps_M` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla TiCentral.Apps: ~15 rows (aproximadamente)
DELETE FROM `Apps`;
/*!40000 ALTER TABLE `Apps` DISABLE KEYS */;
INSERT INTO `Apps` (`Id`, `Nombre`, `Descripcion`, `Path`, `EstaActivo`, `CreadoPor`, `FechaDeCreacion`, `UltimaModificacion`, `ModificadoPor`, `Deleted`) VALUES
	('2488e7ee-c80b-11ed-afa1-0242ac120002', 'PLATAFORMA DE DOCUMENTACIÓN OFICIAL. DEV', 'Plataforma para enviar y recibir documentación oficial entre la Tesorería Estatal, Municipios y Organismos Públicos Descentralizados, en materia de distribución de recursos, usando la firma electrónica avanzada (efirma) expedida por el SAT.', 'http://10.200.4.106:3000', 1, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-03-21 11:10:16', '2023-03-21 11:10:22', 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('2493b951-d317-11ed-b61c-2c4138b7dab1', 'PABMI LOCAL', 'PABMI LOCAL', 'http://localhost:3008', 1, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-04-04 12:30:22', '2023-04-04 12:30:22', 'c18fc135-3a89-11ed-aed0-040300000000', 0),
	('7af0aa1e-70e8-11ed-a880-040300000000', 'PDRME Local', NULL, 'http://localhost:3000/', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-11-30 12:52:11', '2022-11-30 12:52:11', '3d472a7a-3087-11ed-aed0-040300000000', 0),
	('884be320-b6cb-11ed-9bd4-2c4138b7dab1', 'PLATAFORMA DE DOCUMENTACIÓN OFICIAL.', 'Plataforma para enviar y recibir documentación oficial entre la Tesorería Estatal, Municipios y Organismos Públicos Descentralizados, en materia de distribución de recursos, usando la firma electrónica avanzada (efirma) expedida por el SAT.', 'http://localHost:3002', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-27 12:21:19', '2023-02-27 12:21:19', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('88e59393-f451-11ed-b6df-2c4138b7dab1', 'SGCM DESARROLLO', 'Plataforma en el ambiente de desarrollo', 'http://10.200.4.106:4500', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-05-16 19:24:06', '2023-05-16 19:24:08', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('91d9e2d6-af0f-11ed-b719-2c4138b7dab1', 'YouTube', NULL, 'www.youtube.com.mx', 0, '30adc962-7109-11ed-a880-040300000000', '2023-02-17 16:08:12', '2023-02-17 16:08:12', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('973ecf89-38ff-11ed-aed0-040300000000', 'PLATAFORMA DE DISTRIBUCIÓN DE RECURSOS A MUNICIPIOS Y ORGANISMO PÚBLICO DEDENTRALIZADO', ' Plataforma de distribución de recursos económicos a los Municipios del Estado de Nuevo León, así como para los Organismos Públicos Descentralizados del Gobierno del Estado de Nuevo León.', 'http://10.200.4.106:81', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-20 11:16:28', '2022-11-04 12:41:32', '3d472a7a-3087-11ed-aed0-040300000000', 0),
	('999db602-acbf-11ed-b719-2c4138b7dab1', 'SGCM', NULL, 'http://localhost:3000', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-14 17:30:43', '2023-03-01 18:25:18', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('cf754e46-8d45-11ed-a98c-040300000000', 'Login local', 'teste', './admin', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-05 16:10:44', '2023-01-18 15:50:25', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('d96164aa-e531-11ed-b61c-2c4138b7dab1', 'Reportes SFYTGNL', NULL, 'http://localhost:3000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-27 13:29:38', '2023-04-27 13:29:38', '30adc962-7109-11ed-a880-040300000000', 0),
	('ebb88944-de38-11ed-b61c-2c4138b7dab1', 'PABMI Desarrollo', NULL, '/ruta/nueva/app', 1, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-04-18 16:32:37', '2023-04-18 16:32:37', 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('f0f64c9b-432d-11ed-aea4-040300000000', 'SIEDNL dev', NULL, 'http://10.200.4.106:3001', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-10-03 10:13:29', '2022-10-04 10:46:32', '3d472a7a-3087-11ed-aed0-040300000000', 0),
	('f18ad0d4-3087-11ed-aed0-040300000000', 'PLATAFORMA DE ACCESO ÚNICO Y APLICACIONES', 'Plataforma que concentra la gestión tanto de usuarios como de accesos a las diversas aplicaciones; permitirá la administración, autorización o denegación del acceso a usuarios y las aplicaciones activas.', './admin', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-09 16:39:54', '2022-09-09 16:39:54', '3d472a7a-3087-11ed-aed0-040300000000', 0),
	('fa82e267-3087-11ed-aed0-040300000000', 'PABMI Dev', NULL, 'http://10.200.4.106:3800/', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-09 16:40:09', '2022-10-20 10:25:51', '3d472a7a-3087-11ed-aed0-040300000000', 0),
	('ffcc48cb-3087-11ed-aed0-040300000000', 'SIEDNL', NULL, 'http://localhost:3001', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-09 16:40:18', '2023-03-27 10:21:08', 'a4f79e57-32b7-11ed-aed0-040300000000', 0);
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
  KEY `IdSolicitud` (`IdSolicitud`),
  KEY `CreadoPor` (`CreadoPor`),
  CONSTRAINT `FK_Comentarios_Solicitudes` FOREIGN KEY (`IdSolicitud`) REFERENCES `Solicitudes` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Comentarios_Usuario_Creado` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Comentarios de las solicitudes de nuevos usuarios';

-- Volcando datos para la tabla TiCentral.Comentarios: ~77 rows (aproximadamente)
DELETE FROM `Comentarios`;
/*!40000 ALTER TABLE `Comentarios` DISABLE KEYS */;
INSERT INTO `Comentarios` (`Id`, `IdSolicitud`, `Comentario`, `CreadoPor`, `FechaDeCreacion`) VALUES
	('0785d110-9e97-11ed-b58e-2c4138b7dab1', '30038d44-98ff-11ed-b58e-2c4138b7dab1', 'dfedfdfdfdfdfdf', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-27 16:03:50'),
	('08400fc7-9e96-11ed-b58e-2c4138b7dab1', 'b511c28d-9b5f-11ed-b58e-2c4138b7dab1', 'dcdcdcdcdcdcdcddcdc', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-27 15:56:42'),
	('0961a8d1-9c35-11ed-b58e-2c4138b7dab1', '83f8dcdd-96b7-11ed-a912-705a0f328da6', 'tytyrtyrtyrty', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-24 15:17:20'),
	('0c73aad0-978a-11ed-a912-705a0f328da6', '0c687b82-978a-11ed-a912-705a0f328da6', '463456457447', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 17:44:28'),
	('0e800156-c4f5-11ed-b789-2c4138b7dab1', 'dd131c61-c4f2-11ed-b789-2c4138b7dab1', 'fmdhfkmdhfmdgmd', '30adc962-7109-11ed-a880-040300000000', '2023-03-17 12:53:50'),
	('0f522b2f-9c47-11ed-b58e-2c4138b7dab1', '4d8c6b23-9778-11ed-a912-705a0f328da6', 'asdasdasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-24 17:26:21'),
	('109f0fa0-9b5c-11ed-b58e-2c4138b7dab1', '2e11cc89-9b58-11ed-b58e-2c4138b7dab1', 'no se acepta el cambio', '30adc962-7109-11ed-a880-040300000000', '2023-01-23 13:24:12'),
	('14630b43-a740-11ed-b719-2c4138b7dab1', '481d0d88-a0f5-11ed-802e-2c4138b7dab1', 'frewfrererere', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-07 17:35:18'),
	('17499be5-9dc2-11ed-b58e-2c4138b7dab1', 'a4cbcb26-978a-11ed-a912-705a0f328da6', 'asasiljniojkniojnaiosun', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-26 14:39:34'),
	('176b9868-bf6f-11ed-b789-2c4138b7dab1', 'c8c0b8fc-a0f5-11ed-802e-2c4138b7dab1', 'asdasdasdasdsa', '61a418d5-bf6e-11ed-b789-2c4138b7dab1', '2023-03-10 12:12:17'),
	('19f7d637-9dd6-11ed-b58e-2c4138b7dab1', '69b853ad-96c8-11ed-a912-705a0f328da6', 'tyfdgfdgfhdghfd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-26 17:02:48'),
	('2190aa67-9e93-11ed-b58e-2c4138b7dab1', '69b853ad-96c8-11ed-a912-705a0f328da6', 'cualquier cosa', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-27 15:35:56'),
	('235f0eca-9e96-11ed-b58e-2c4138b7dab1', '66ef1244-98ff-11ed-b58e-2c4138b7dab1', 'dcdcdcdcdcdcdcd', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-27 15:57:28'),
	('2a7da34e-9d24-11ed-b58e-2c4138b7dab1', '0c687b82-978a-11ed-a912-705a0f328da6', 'asdasdasdasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 19:49:06'),
	('3174a5fe-a352-11ed-b561-2c4138b7dab1', '02ac8e73-978a-11ed-a912-705a0f328da6', 'wewqeqweqweqwe', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-02 17:34:53'),
	('33ea4a5e-9cef-11ed-b58e-2c4138b7dab1', 'b7c6c52a-9779-11ed-a912-705a0f328da6', 'iojhjasdkjaskljdn', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 13:29:58'),
	('369db844-a355-11ed-b561-2c4138b7dab1', '819af6e6-a0f6-11ed-802e-2c4138b7dab1', 'asdasdasdasdasd', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-02 17:56:30'),
	('3e548f27-b920-11ed-b789-2c4138b7dab1', '9cb45ef5-b887-11ed-b789-2c4138b7dab1', 'negadoooeadscas', '30adc962-7109-11ed-a880-040300000000', '2023-03-02 11:32:45'),
	('41b108d4-9c40-11ed-b58e-2c4138b7dab1', '595ad41d-9778-11ed-a912-705a0f328da6', 'adsfasdasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-24 16:37:39'),
	('435711cc-bd18-11ed-b789-2c4138b7dab1', '0fd1acc2-bd07-11ed-b789-2c4138b7dab1', '12312312312312', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-03-07 12:45:42'),
	('458b1091-a0d8-11ed-802e-2c4138b7dab1', '458137b7-a0d8-11ed-802e-2c4138b7dab1', '2', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 13:57:05'),
	('49c7a9ea-9e96-11ed-b58e-2c4138b7dab1', 'd266b0ee-98ff-11ed-b58e-2c4138b7dab1', 'dcdcdcdcdccdcdccdcdcdcdcdc', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-27 15:58:32'),
	('4a76b530-9d24-11ed-b58e-2c4138b7dab1', '02ac8e73-978a-11ed-a912-705a0f328da6', 'asdasdasdasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 19:49:59'),
	('4d91246b-9778-11ed-a912-705a0f328da6', '4d8c6b23-9778-11ed-a912-705a0f328da6', 'Redactado', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 15:37:27'),
	('4e5a3f81-ad8f-11ed-b719-2c4138b7dab1', 'a4cbcb26-978a-11ed-a912-705a0f328da6', 'jtyjtyjtyjtyj', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-15 18:17:32'),
	('51386827-9ddb-11ed-b58e-2c4138b7dab1', 'a4cbcb26-978a-11ed-a912-705a0f328da6', 'asdasdsadasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-26 17:40:09'),
	('52b1b24b-c4f2-11ed-b789-2c4138b7dab1', '9f4087c9-c4f0-11ed-b789-2c4138b7dab1', 'dsavdavadvdavav', '30adc962-7109-11ed-a880-040300000000', '2023-03-17 12:34:16'),
	('596032cf-9778-11ed-a912-705a0f328da6', '595ad41d-9778-11ed-a912-705a0f328da6', 'Redactado', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 15:37:46'),
	('5a248ad5-9c58-11ed-b58e-2c4138b7dab1', 'a4cbcb26-978a-11ed-a912-705a0f328da6', 'Necesita permiso de administracion de plataforma', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-24 19:30:08'),
	('5cf8efd8-9925-11ed-b58e-2c4138b7dab1', '69b853ad-96c8-11ed-a912-705a0f328da6', 'extencion con mal formato', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-20 17:47:35'),
	('5f3089af-b3de-11ed-9bd4-2c4138b7dab1', 'c7732105-ad91-11ed-b719-2c4138b7dab1', 'qweqweqweqewqw', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-23 18:58:37'),
	('68b66df1-9cf0-11ed-b58e-2c4138b7dab1', '595ad41d-9778-11ed-a912-705a0f328da6', 'ijinsdklfjnsdfkljmnlkmnlkjsdflkjnsfd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 13:38:36'),
	('6d11ec46-dfc6-11ed-b61c-2c4138b7dab1', '75f68ce2-da4f-11ed-b61c-2c4138b7dab1', 'Verificar', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-04-20 15:57:57'),
	('7166c9f4-9df3-11ed-b58e-2c4138b7dab1', '02ac8e73-978a-11ed-a912-705a0f328da6', 'comentario de prueba', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-26 20:32:50'),
	('71d4b622-c1c8-11ed-b789-2c4138b7dab1', '5c65bc63-c1c8-11ed-b789-2c4138b7dab1', 'no se da de baja el usuario', '30adc962-7109-11ed-a880-040300000000', '2023-03-13 11:56:56'),
	('7667726a-9764-11ed-a912-705a0f328da6', '69b853ad-96c8-11ed-a912-705a0f328da6', 'Comentario desde el back', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 13:15:25'),
	('776b7c45-9cf1-11ed-b58e-2c4138b7dab1', '4d8c6b23-9778-11ed-a912-705a0f328da6', 'gyjytyjtyjtyj', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 13:46:10'),
	('7a25f734-a29a-11ed-b561-2c4138b7dab1', '83f8dcdd-96b7-11ed-a912-705a0f328da6', 'asdasdasdasd', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-01 19:39:47'),
	('7f15b015-9931-11ed-b58e-2c4138b7dab1', '74318f94-98ff-11ed-b58e-2c4138b7dab1', 'checar extension', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-20 19:14:26'),
	('819f7d67-a0f6-11ed-802e-2c4138b7dab1', '819af6e6-a0f6-11ed-802e-2c4138b7dab1', '13', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 17:33:31'),
	('81ac71b9-a1bc-11ed-b561-2c4138b7dab1', '203e57af-a1b3-11ed-b561-2c4138b7dab1', 'qweqweqweqweqwe', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-31 17:10:51'),
	('955b64a4-c4f7-11ed-b789-2c4138b7dab1', '327a5944-c4f5-11ed-b789-2c4138b7dab1', 'hgrfshbrfshbrf', '30adc962-7109-11ed-a880-040300000000', '2023-03-17 13:11:56'),
	('9866f3f7-b3dd-11ed-9bd4-2c4138b7dab1', 'c7732105-ad91-11ed-b719-2c4138b7dab1', 'no se sabe con sertesa', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-23 18:53:04'),
	('a4d35506-978a-11ed-a912-705a0f328da6', 'a4cbcb26-978a-11ed-a912-705a0f328da6', '2342352523235', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 17:48:44'),
	('a9afc8dc-9dd5-11ed-b58e-2c4138b7dab1', '4d8c6b23-9778-11ed-a912-705a0f328da6', 'asdasdasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-26 16:59:40'),
	('ad8b99e0-9765-11ed-a912-705a0f328da6', '69b853ad-96c8-11ed-a912-705a0f328da6', 'Comentario desde el back', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 13:24:07'),
	('b37d51f9-9dcd-11ed-b58e-2c4138b7dab1', 'a4cbcb26-978a-11ed-a912-705a0f328da6', '123456778890', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-26 16:02:40'),
	('b435cbc1-9d25-11ed-b58e-2c4138b7dab1', '4d8c6b23-9778-11ed-a912-705a0f328da6', 'asddsadasdasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 20:00:06'),
	('b443ddb5-9c5b-11ed-b58e-2c4138b7dab1', '0c687b82-978a-11ed-a912-705a0f328da6', 'asdasdasdasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-24 19:54:08'),
	('b50a7d32-c4f7-11ed-b789-2c4138b7dab1', 'a46d78a2-c4f7-11ed-b789-2c4138b7dab1', 'dvgfshghndhndht', '30adc962-7109-11ed-a880-040300000000', '2023-03-17 13:12:49'),
	('b63fd1be-9c24-11ed-b58e-2c4138b7dab1', 'a4cbcb26-978a-11ed-a912-705a0f328da6', 'asdasdasdas', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-24 13:20:29'),
	('b7cbee02-9779-11ed-a912-705a0f328da6', 'b7c6c52a-9779-11ed-a912-705a0f328da6', 'Redactado', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 15:47:34'),
	('b872ac64-9dd4-11ed-b58e-2c4138b7dab1', '02ac8e73-978a-11ed-a912-705a0f328da6', 'dfgdfgfgdfgd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-26 16:52:55'),
	('b96554d8-f032-11ed-b61c-2c4138b7dab1', 'b9613ec7-f032-11ed-b61c-2c4138b7dab1', 'dar permisos de administrador de plataformas', '191cc303-daf6-11ed-b61c-2c4138b7dab1', '2023-05-11 13:33:36'),
	('bcb9603a-dfc5-11ed-b61c-2c4138b7dab1', 'a4cbcb26-978a-11ed-a912-705a0f328da6', 'Verificar correo electronico', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-24 19:30:08'),
	('be7f0edf-a72b-11ed-b719-2c4138b7dab1', 'c8c0b8fc-a0f5-11ed-802e-2c4138b7dab1', 'asdasdasdasdas', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-07 15:09:43'),
	('c8a4b3d5-9c57-11ed-b58e-2c4138b7dab1', '02ac8e73-978a-11ed-a912-705a0f328da6', 'asdasdasdASas', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-24 19:26:04'),
	('cadd5df8-f034-11ed-b61c-2c4138b7dab1', 'cad8d847-f034-11ed-b61c-2c4138b7dab1', 'Dar permiso de administrador de plataformas', '191cc303-daf6-11ed-b61c-2c4138b7dab1', '2023-05-11 13:48:25'),
	('cbdf6e98-9dd8-11ed-b58e-2c4138b7dab1', '83f8dcdd-96b7-11ed-a912-705a0f328da6', 'asdasdasdasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-26 17:22:06'),
	('cf81daaf-a28f-11ed-b561-2c4138b7dab1', 'f977a292-96b6-11ed-a912-705a0f328da6', 'asdasdasdasd', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-01 18:23:26'),
	('d09d8e54-c8e4-11ed-b4d7-2c4138b7dab1', '9cbeaa67-c8e4-11ed-b4d7-2c4138b7dab1', 'cgnjfxgjnfxjnxjx', '30adc962-7109-11ed-a880-040300000000', '2023-03-22 13:07:39'),
	('d1a39689-cda9-11ed-b671-2c4138b7dab1', 'e4724bbd-c8e5-11ed-b4d7-2c4138b7dab1', 'bdgfbndfhndfdfndn', '30adc962-7109-11ed-a880-040300000000', '2023-03-28 14:47:56'),
	('d6cf3cdb-c4f2-11ed-b789-2c4138b7dab1', '6a597d26-c4f2-11ed-b789-2c4138b7dab1', 'vadvdavdvvdv', '30adc962-7109-11ed-a880-040300000000', '2023-03-17 12:37:58'),
	('d85ac50d-a294-11ed-b561-2c4138b7dab1', '62963803-a1c9-11ed-b561-2c4138b7dab1', 'asdasdasdasdas', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-01 18:59:28'),
	('d96d09f7-ad7d-11ed-b719-2c4138b7dab1', '819af6e6-a0f6-11ed-802e-2c4138b7dab1', 'gfhgfhgf', 'a6860b44-3087-11ed-aed0-040300000000', '2023-02-15 16:12:34'),
	('dccd2ca4-9ddb-11ed-b58e-2c4138b7dab1', '0c687b82-978a-11ed-a912-705a0f328da6', 'asdasdasdasdasd', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-26 17:44:03'),
	('e12c4fcf-da53-11ed-b61c-2c4138b7dab1', '75f68ce2-da4f-11ed-b61c-2c4138b7dab1', 'Asignar permisos de administrador', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-04-13 17:35:31'),
	('e3184386-ad7d-11ed-b719-2c4138b7dab1', '819af6e6-a0f6-11ed-802e-2c4138b7dab1', 'gfhgfhgf', 'a6860b44-3087-11ed-aed0-040300000000', '2023-02-15 16:12:51'),
	('e3bfa730-f033-11ed-b61c-2c4138b7dab1', 'e3bcf1ee-f033-11ed-b61c-2c4138b7dab1', 'dar permisos  de  administradore  de plataforma', '191cc303-daf6-11ed-b61c-2c4138b7dab1', '2023-05-11 13:41:57'),
	('e54fbfe2-9d21-11ed-b58e-2c4138b7dab1', '83f8dcdd-96b7-11ed-a912-705a0f328da6', 'sASsaSASDASDASD', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 19:32:51'),
	('e73901e7-dfc5-11ed-b61c-2c4138b7dab1', '75f68ce2-da4f-11ed-b61c-2c4138b7dab1', 'Revision de  numero  telefonico', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-04-13 17:35:31'),
	('e7916e7f-9c34-11ed-b58e-2c4138b7dab1', '02ac8e73-978a-11ed-a912-705a0f328da6', 'asdasdasdasddas', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-24 15:16:24'),
	('e80befd3-9dcd-11ed-b58e-2c4138b7dab1', '0c687b82-978a-11ed-a912-705a0f328da6', 'sdfssdfsdfsdfsdf', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-26 16:04:09'),
	('f23f8c56-a0eb-11ed-802e-2c4138b7dab1', 'f236cb5b-a0eb-11ed-802e-2c4138b7dab1', '3', '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 16:17:56'),
	('f56b98f5-a34c-11ed-b561-2c4138b7dab1', '22d6f0c2-a0f5-11ed-802e-2c4138b7dab1', '2rewrwerwrwr', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-02 16:57:24'),
	('f9b459e0-9e96-11ed-b58e-2c4138b7dab1', '90f64b89-98ff-11ed-b58e-2c4138b7dab1', 'wfefefeffefefef', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-27 16:03:27'),
	('fbc7b9bc-d7ec-11ed-b61c-2c4138b7dab1', 'debca262-cda9-11ed-b671-2c4138b7dab1', 'sgsdgdsgdsgsghg', '30adc962-7109-11ed-a880-040300000000', '2023-04-10 16:13:55');
/*!40000 ALTER TABLE `Comentarios` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Departamentos
DROP TABLE IF EXISTS `Departamentos`;
CREATE TABLE IF NOT EXISTS `Departamentos` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Descripcion` varchar(200) NOT NULL,
  `NombreCorto` varchar(50) NOT NULL,
  `IdResponsable` char(36) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT current_timestamp(),
  `CreadoPor` char(36) NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `fk_CreadoPor` (`CreadoPor`),
  KEY `fk_ModificadoPor` (`ModificadoPor`),
  KEY `fk_IdResponsable` (`IdResponsable`),
  CONSTRAINT `fk_CreadoPor` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `fk_IdResponsable` FOREIGN KEY (`IdResponsable`) REFERENCES `Usuarios` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ModificadoPor` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de las diferentes áreas de la SFyTGE';

-- Volcando datos para la tabla TiCentral.Departamentos: ~15 rows (aproximadamente)
DELETE FROM `Departamentos`;
/*!40000 ALTER TABLE `Departamentos` DISABLE KEYS */;
INSERT INTO `Departamentos` (`Id`, `Descripcion`, `NombreCorto`, `IdResponsable`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Deleted`) VALUES
	('1c88fea5-10b4-11ee-ba60-3cd92b4d9bf4', 'prueba front', 'PRBFT', '0294006b-98ff-11ed-b58e-2c4138b7dab1', '2023-06-21 16:20:38', '2023-06-21 16:20:38', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('225b057a-d884-11ed-8002-d89d6776f970', 'Dirección De Atención a Municipios y Organismos Paraestatales(Organismos)', 'DAMOP_ORG', '30adc962-7109-11ed-a880-040300000000', '2023-04-11 10:16:24', '2023-04-11 10:15:54', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('49f5a33e-054c-11ee-b6df-2c4138b7dab1', 'Prueba modificacion back', 'modificacion x2', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-21 12:49:34', '2023-06-07 09:59:31', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 1),
	('511732b0-2b01-11ed-afdb-040300000000', 'Coordinación De Planeación Hacendaria', 'CPH', '30adc962-7109-11ed-a880-040300000000', '2022-12-14 15:16:25', '2022-09-02 12:53:29', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('5b233179-2b01-11ed-afdb-040300000000', 'Dirección De Administración Financiera', 'DAF', '30adc962-7109-11ed-a880-040300000000', '2022-12-13 18:49:38', '2022-09-02 12:53:46', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('609dc46f-2b01-11ed-afdb-040300000000', 'Dirección De Atención a Municipios y Organismos Paraestatales', 'DAMOP', '30adc962-7109-11ed-a880-040300000000', '2022-12-13 18:50:32', '2022-09-02 12:53:55', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('66270023-2b01-11ed-afdb-040300000000', 'Dirección De Contabilidad y Cuenta Publica', 'DCCP', '30adc962-7109-11ed-a880-040300000000', '2022-12-13 18:51:05', '2022-09-02 12:54:05', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('665aa723-10b4-11ee-ba60-3cd92b4d9bf4', 'prueba front22', 'PRBFT2', '09e620ae-b87d-11ed-8002-d89d6776f970', '2023-06-21 16:22:42', '2023-06-21 16:22:42', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('6b71f18b-2b01-11ed-afdb-040300000000', 'Dirección De Presupuesto y Control Presupuestal', 'DPCP', '30adc962-7109-11ed-a880-040300000000', '2022-12-13 18:51:37', '2022-09-02 12:54:14', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('6d8fefa8-50c1-11ed-ab6c-040300000000', 'Municipios', 'MUN', '30adc962-7109-11ed-a880-040300000000', '2022-12-13 18:51:44', '2022-10-20 18:52:01', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('724605b7-2b01-11ed-afdb-040300000000', 'Coordinación De Gestión De La Información', 'DTI', '30adc962-7109-11ed-a880-040300000000', '2022-12-13 18:52:22', '2022-09-02 12:54:25', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('8d5f449a-03ba-11ee-b6df-2c4138b7dab1', 'prueba sp', 'sp', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-13 23:04:52', '2023-06-05 10:03:46', '3d472a7a-3087-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 1),
	('d0ab6e72-0afc-11ee-ba60-3cd92b4d9bf4', 'DIRECCIÓN DE PATRIMONIO DE LA PROCURADURÍA FISCAL', 'PATRIMONIO', 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 15:45:44', '2023-06-14 15:45:44', 'c18fc135-3a89-11ed-aed0-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', 0),
	('e0bb86e2-03c1-11ee-b6df-2c4138b7dab1', 'prueba2', 'PR', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-05 16:17:32', '2023-06-05 10:56:12', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('f99fe513-516d-11ed-ab6c-040300000000', 'Organismos', 'ORG', '30adc962-7109-11ed-a880-040300000000', '2022-11-30 19:42:52', '2022-10-21 15:27:09', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0);
/*!40000 ALTER TABLE `Departamentos` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Dependencias
DROP TABLE IF EXISTS `Dependencias`;
CREATE TABLE IF NOT EXISTS `Dependencias` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Nombre` varchar(200) NOT NULL,
  `Direccion` longtext NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `IdTipoDependencia` char(36) NOT NULL,
  `IdTitular` char(36) NOT NULL,
  `PerteneceA` char(36) DEFAULT NULL,
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_IdTipoDependencia` (`IdTipoDependencia`),
  KEY `fk_IdTitularDependencia` (`IdTitular`),
  KEY `fk_PerteneceASecretaria` (`PerteneceA`),
  KEY `FK_Dependencias_Usuarios` (`CreadoPor`),
  KEY `FK_Dependencias_Usuarios_2` (`ModificadoPor`),
  CONSTRAINT `FK_Dependencias_Usuarios` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Dependencias_Usuarios_2` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_IdTipoDependencia` FOREIGN KEY (`IdTipoDependencia`) REFERENCES `TipoDependencias` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_IdTitularDependencia` FOREIGN KEY (`IdTitular`) REFERENCES `Usuarios` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `fk_PerteneceASecretaria` FOREIGN KEY (`PerteneceA`) REFERENCES `Secretarias` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla TiCentral.Dependencias: ~5 rows (aproximadamente)
DELETE FROM `Dependencias`;
/*!40000 ALTER TABLE `Dependencias` DISABLE KEYS */;
INSERT INTO `Dependencias` (`Id`, `Nombre`, `Direccion`, `Telefono`, `IdTipoDependencia`, `IdTitular`, `PerteneceA`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Deleted`, `deleted_at`) VALUES
	('6d81f62f-0afc-11ee-ba60-3cd92b4d9bf4', 'PATRIMONIO', 'SIN DIRECCION', '123456', '4b077d2f-0489-11ee-b6df-2c4138b7dab1', 'c18fc135-3a89-11ed-aed0-040300000000', '5be40b30-f688-11ed-b6df-2c4138b7dab1', '2023-06-14 15:42:58', '2023-06-14 15:42:58', 'c18fc135-3a89-11ed-aed0-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', 0, NULL),
	('8ebdb1d3-0492-11ee-b6df-2c4138b7dab1', 'prueba sp modificar', 'xdxdxd', '324324', '4b077d2f-0489-11ee-b6df-2c4138b7dab1', 'a4f79e57-32b7-11ed-aed0-040300000000', '5be40b30-f688-11ed-b6df-2c4138b7dab1', '2023-06-21 11:53:10', '2023-06-06 11:50:00', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, NULL),
	('a78ea88f-0562-11ee-b6df-2c4138b7dab1', 'mod back', '_Modificaciond esde el back', '123123', '4b077d2f-0489-11ee-b6df-2c4138b7dab1', 'a4f79e57-32b7-11ed-aed0-040300000000', '460521dc-0481-11ee-b6df-2c4138b7dab1', '2023-06-13 17:43:17', '2023-06-07 12:39:37', '3d472a7a-3087-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 1, NULL),
	('c210ade4-10b7-11ee-ba60-3cd92b4d9bf4', 'prueba dependencia', 'antonio 444\n', '8218312', '4b077d2f-0489-11ee-b6df-2c4138b7dab1', '09158bf4-a0f5-11ed-802e-2c4138b7dab1', '55c5c826-10ae-11ee-ba60-3cd92b4d9bf4', '2023-06-21 16:46:44', '2023-06-21 16:46:44', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, NULL),
	('fa7e5bf0-048f-11ee-b6df-2c4138b7dab1', 'N/A', 'N/A', 'N/A', '4b077d2f-0489-11ee-b6df-2c4138b7dab1', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, '2023-06-06 11:30:44', '2023-06-06 11:30:45', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, NULL);
/*!40000 ALTER TABLE `Dependencias` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Perfiles
DROP TABLE IF EXISTS `Perfiles`;
CREATE TABLE IF NOT EXISTS `Perfiles` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Descripcion` varchar(200) NOT NULL DEFAULT '0',
  `Referencia` varchar(20) NOT NULL,
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK1_PERFIL_CREADO` (`CreadoPor`),
  KEY `FK2_PERFIL_MODIFICADO` (`ModificadoPor`),
  CONSTRAINT `FK_Perfiles_Usuarios` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Perfiles_Usuarios_2` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los Perfiles';

-- Volcando datos para la tabla TiCentral.Perfiles: ~15 rows (aproximadamente)
DELETE FROM `Perfiles`;
/*!40000 ALTER TABLE `Perfiles` DISABLE KEYS */;
INSERT INTO `Perfiles` (`Id`, `Descripcion`, `Referencia`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Deleted`) VALUES
	('1bcf9a67-74c7-11ed-aad1-040300000000', 'Validador', 'VAL', '2022-12-13 16:44:13', '2022-12-05 12:03:10', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('2d83e02b-04b6-11ee-b6df-2c4138b7dab1', 'Prueba alta backend', 'PRB  BCK', '2023-06-13 17:55:38', '2023-06-06 16:04:58', '3d472a7a-3087-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 1),
	('39bbd1c2-4fd4-11ed-ab6c-040300000000', 'Administrador', 'ADMIN', '2022-12-13 16:44:36', '2022-10-19 12:33:58', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('41bfc83a-4fd4-11ed-ab6c-040300000000', 'Municipio', 'MUN', '2022-12-13 16:44:45', '2022-10-19 12:34:17', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('4991ba04-4fd4-11ed-ab6c-040300000000', 'Organismo', 'ORG', '2022-12-13 16:44:50', '2022-10-19 12:34:30', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('49dc42ed-0567-11ee-b6df-2c4138b7dab1', 'Prueba alta front', 'prueba front', '2023-06-20 18:11:02', '2023-06-07 13:12:47', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('6b0d164c-0afd-11ee-ba60-3cd92b4d9bf4', 'Enlace', 'ENL', '2023-06-14 15:50:03', '2023-06-14 15:50:03', 'c18fc135-3a89-11ed-aed0-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', 0),
	('6b169126-0afd-11ee-ba60-3cd92b4d9bf4', 'Auxiliar', 'AUX', '2023-06-14 15:50:03', '2023-06-14 15:50:03', 'c18fc135-3a89-11ed-aed0-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', 0),
	('9c820343-10b4-11ee-ba60-3cd92b4d9bf4', 'perfil prueba front', 'prueba del front\n', '2023-06-21 16:24:13', '2023-06-21 16:24:13', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('a5395aa6-10b7-11ee-ba60-3cd92b4d9bf4', 'prueba perfil ', 'prueba perfil\n', '2023-06-21 16:45:56', '2023-06-21 16:45:56', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('a80ecf6a-4b33-11ed-a964-040300000000', 'Analista', 'ANA', '2022-12-13 16:43:54', '2022-10-13 15:14:13', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('b6ff3f86-4b33-11ed-a964-040300000000', 'Coordinador', 'COOR', '2022-12-13 16:44:02', '2022-10-13 15:15:00', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('bf9f7de8-4b33-11ed-a964-040300000000', 'Director', 'DIR', '2022-12-13 16:44:07', '2022-10-13 15:15:14', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('ebd771e7-04b4-11ee-b6df-2c4138b7dab1', 'Prueba ModicaPerfil', 'PruebaModificaPerfil', '2023-06-06 16:59:02', '2023-06-06 15:55:59', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('fd202ded-04b4-11ee-b6df-2c4138b7dab1', 'Prueba 1234', '123prueba', '2023-06-06 15:56:28', '2023-06-06 15:56:28', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0);
/*!40000 ALTER TABLE `Perfiles` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.plantillas
DROP TABLE IF EXISTS `plantillas`;
CREATE TABLE IF NOT EXISTS `plantillas` (
  `uuid` char(36) NOT NULL DEFAULT uuid(),
  `referencia` varchar(256) NOT NULL,
  `body` varchar(1000) NOT NULL,
  `parametros` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`parametros`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla TiCentral.plantillas: ~4 rows (aproximadamente)
DELETE FROM `plantillas`;
/*!40000 ALTER TABLE `plantillas` DISABLE KEYS */;
INSERT INTO `plantillas` (`uuid`, `referencia`, `body`, `parametros`, `created_at`, `updated_at`, `deleted_at`) VALUES
	('7fe08ecb-974a-11ed-a912-705a0f328da6', '008', 'Phrase para descarga de documentos firmado: {{ phrase }}', NULL, '2022-10-20 21:16:52', '2022-10-20 21:16:55', NULL),
	('d7848bb1-96b0-11ed-a912-705a0f328da6', '12345', 'hola {{ nombre }} esta es una notificacion de {{ descripcion }}', '{"nombre": "Jose Aguedo Serna Meza", "descripcion": "notificacion de bienvenida"}', '2022-10-20 21:16:52', '2022-10-20 21:16:55', NULL),
	('e2c74a54-50e5-11ed-bdc3-0242ac120002', '1234', '<h3>hola {{ nombre }} </h3> esta es una notificacion de {{ descripcion }} del equipo de {{ nombre_equipo }}', '{"nombre": "Jose Aguedo Serna Meza", "descripcion": "notificacion de bienvenida"}', '2022-10-20 21:16:52', '2022-10-20 21:16:55', NULL),
	('f63893d7-96b1-11ed-a912-705a0f328da6', '007', 'Documento firmado por {{ nombre }} con el siguiente identificador {{ id }} <br> el cual puede ser validado en la siguiente URL <br> {{ url }} <br> <br> <strong>Datos Adicionales: </strong> <br> Referencia: {{ referenciaDoc }} <br> Fecha del doc: {{ fechaDoc }} <br> Fecha Firmado: {{ fechaFirma }} <br> {{ linkDescarga }}', NULL, '2022-10-20 21:16:52', '2022-10-20 21:16:55', NULL);
/*!40000 ALTER TABLE `plantillas` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Roles
DROP TABLE IF EXISTS `Roles`;
CREATE TABLE IF NOT EXISTS `Roles` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `ControlInterno` varchar(50) NOT NULL DEFAULT '',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_Roles_Usuarios` (`ModificadoPor`),
  KEY `FK_Roles_Usuarios_2` (`CreadoPor`),
  CONSTRAINT `FK_Roles_Usuarios` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Roles_Usuarios_2` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla TiCentral.Roles: ~35 rows (aproximadamente)
DELETE FROM `Roles`;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` (`Id`, `Nombre`, `Descripcion`, `ControlInterno`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Deleted`) VALUES
	('0191ca3b-5acd-11ed-a988-040300000000', 'Administrador General', 'Administrador General de la Plataforma', 'ADMINGENL', '2022-11-30 17:55:59', '2022-11-02 10:40:05', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('0914b734-0af8-11ee-ba60-3cd92b4d9bf4', 'ENLACE', 'ENLACE', '', '2023-06-14 15:11:31', '2023-06-14 15:11:31', 'c18fc135-3a89-11ed-aed0-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', 0),
	('0c67e95b-74f1-11ed-aad1-040300000000', 'DPCP Presupuestal', 'Rol para Operaciones de DPCP', '', '2023-03-27 12:02:56', '2022-12-05 17:03:36', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('11aa824f-95cc-11ed-a912-705a0f328da6', 'Organismo', 'Rol para usuarios de tipo organismos', '.', '2023-06-20 18:09:47', '2023-01-16 12:32:02', 'a4f79e57-32b7-11ed-aed0-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('11f778ed-71d3-11ed-a880-040300000000', 'DAMOP PARTICIPACIONES', 'ROL PARA GENERAR OPERACIONES DE DAMOP', '', '2023-02-16 14:42:17', '2022-12-01 16:51:27', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 1),
	('12e83443-0af8-11ee-ba60-3cd92b4d9bf4', 'AUXILIAR', 'AUXILIAR', '', '2023-06-14 15:11:48', '2023-06-14 15:11:48', 'c18fc135-3a89-11ed-aed0-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', 0),
	('1ecd9989-fa68-11ed-b6df-2c4138b7dab1', 'SPEI Municipios', 'SPEI Municipios', '', '2023-05-24 13:21:01', '2023-05-24 13:21:01', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('1fe92a50-09ab-11ee-ba60-3cd92b4d9bf4', 'Prueba', 'PruebaDelete', 'Ninguno', '2023-06-12 23:31:58', '2023-06-12 23:28:27', '3d472a7a-3087-11ed-aed0-040300000000', '3d472a7a-3087-11ed-aed0-040300000000', 1),
	('22e1877d-95cc-11ed-a912-705a0f328da6', 'DAMOP ORGANISMOS', 'rol para los usuarios de damop de tipo organismos', '', '2023-01-16 12:32:30', '2023-01-16 12:32:30', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('25bc4557-d7ca-11ed-8581-040300000000', 'DCCP CONSULTA', 'Encargado DCCP', '', '2023-04-10 13:04:33', '2023-04-10 13:04:33', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('2621f126-71d3-11ed-a880-040300000000', 'DAMOP MUNICIPIOS', 'ROL PARA GENERAR OPERACIONES DE APORTACIONES DE DAMOP', '', '2023-02-16 14:41:55', '2022-12-01 16:52:00', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('2b2a55a0-71c3-11ed-a880-040300000000', 'CPH CALCULO', 'rol para Generar las operaciones de Coordinación de Planeación Hacendaria', '', '2022-12-01 14:57:37', '2022-12-01 14:57:37', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('2b91ec77-03f2-11ee-b6df-2c4138b7dab1', 'prueba modificar back', 'prueba modificar back', 'asdasd', '2023-06-07 12:28:22', '2023-06-05 16:41:54', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('31b651bf-d7cf-11ed-8002-d89d6776f970', 'DCCP', 'Rol para usuarios de DCCP', '', '2023-04-10 11:40:41', '2023-04-10 11:40:41', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('339edb88-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:22', '2023-06-07 12:14:54', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('34ed73ce-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:25', '2023-06-07 12:14:56', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('35e2140e-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:25', '2023-06-07 12:14:57', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('367692cc-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:27', '2023-06-07 12:14:58', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('58001c24-7583-11ed-aad1-040300000000', 'DAMOP Cordinacion', 'Solo se Puede Visualizar', '', '2023-02-16 14:42:23', '2022-12-06 10:30:49', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 1),
	('5eb9ce50-7655-11ed-aad1-040300000000', 'DPCP Autorizar', 'Revisión de Solicitudes', '', '2022-12-07 11:34:43', '2022-12-07 11:34:15', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('66e51736-e48a-11ed-b61c-2c4138b7dab1', 'Reportes', 'Rol de Reportes', '', '2023-04-26 17:31:00', '2023-04-26 17:31:00', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('6bd07950-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:27', '2023-06-07 12:16:28', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('6cb23d81-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:28', '2023-06-07 12:16:29', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('6d2ae0bf-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:29', '2023-06-07 12:16:30', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('6d8dc294-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:29', '2023-06-07 12:16:31', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('6de1314b-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:30', '2023-06-07 12:16:31', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('6e329bc5-055f-11ee-b6df-2c4138b7dab1', 'PRB  BCK', 'Prueba alta backend', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 12:23:54', '2023-06-07 12:16:32', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('8597013b-10b4-11ee-ba60-3cd92b4d9bf4', 'PedroTest', 'testeo del frontend', '343124dasd', '2023-06-21 16:23:34', '2023-06-21 16:23:34', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('abb64046-b850-11ed-8002-d89d6776f970', 'Gestión Usuarios', 'Administración de solicitudes de usuarios', '', '2023-03-01 08:46:53', '2023-03-01 08:46:53', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('d78871a5-ccd1-11ed-8002-d89d6776f970', 'DPCP Solicitudes', 'Autorización de Solicitudes', '', '2023-03-27 12:03:04', '2023-03-27 12:01:55', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('de8ab454-7269-11ed-a880-040300000000', 'Municipio', 'Rol De Municipio', '', '2022-12-02 10:50:54', '2022-12-02 10:50:54', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('ee999ece-9b56-11ed-b58e-2c4138b7dab1', 'DAF OPERACIONES', 'Rol para usuarios del departamento de DAF', '', '2023-01-23 12:47:27', '2023-01-23 12:47:27', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('efcb607f-0af7-11ee-ba60-3cd92b4d9bf4', 'DIRECTOR', 'DIRECTOR', '', '2023-06-14 15:10:49', '2023-06-14 15:10:49', 'c18fc135-3a89-11ed-aed0-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', 0),
	('f4ca7078-c386-11ed-8002-d89d6776f970', 'DAF Coordinación', 'Encargado de  DAF', '', '2023-03-15 16:13:11', '2023-03-15 16:13:11', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('fe7d8a34-0af7-11ee-ba60-3cd92b4d9bf4', 'COORDINADOR', 'COORDINADOR', '', '2023-06-14 15:11:13', '2023-06-14 15:11:13', 'c18fc135-3a89-11ed-aed0-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', 0);
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Secretarias
DROP TABLE IF EXISTS `Secretarias`;
CREATE TABLE IF NOT EXISTS `Secretarias` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Nombre` varchar(255) DEFAULT NULL,
  `Nombre_corto` varchar(255) DEFAULT NULL,
  `IdTitular` char(36) DEFAULT NULL,
  `PerteneceA` char(36) DEFAULT NULL,
  `Direccion` longtext DEFAULT NULL,
  `CreadoPor` char(36) DEFAULT NULL,
  `FechaDeCreacion` datetime DEFAULT current_timestamp(),
  `UltimaModificacion` datetime DEFAULT current_timestamp(),
  `ModificadoPor` char(36) DEFAULT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `fk_IdTitular` (`IdTitular`),
  KEY `fk_PerteneceA` (`PerteneceA`),
  KEY `FK_Secretarias_Usuarios` (`ModificadoPor`),
  KEY `FK_Secretarias_Usuarios_2` (`CreadoPor`),
  CONSTRAINT `FK_Secretarias_Usuarios` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Secretarias_Usuarios_2` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_IdTitular` FOREIGN KEY (`IdTitular`) REFERENCES `Usuarios` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `fk_PerteneceA` FOREIGN KEY (`PerteneceA`) REFERENCES `Secretarias` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla TiCentral.Secretarias: ~25 rows (aproximadamente)
DELETE FROM `Secretarias`;
/*!40000 ALTER TABLE `Secretarias` DISABLE KEYS */;
INSERT INTO `Secretarias` (`Id`, `Nombre`, `Nombre_corto`, `IdTitular`, `PerteneceA`, `Direccion`, `CreadoPor`, `FechaDeCreacion`, `UltimaModificacion`, `ModificadoPor`, `Deleted`) VALUES
	('460521dc-0481-11ee-b6df-2c4138b7dab1', 'Prueba modificacion front', 'RBD  front', 'a4f79e57-32b7-11ed-aed0-040300000000', '460521dc-0481-11ee-b6df-2c4138b7dab1', 'prueba', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, '2023-06-21 12:41:58', 'a4f79e57-32b7-11ed-aed0-040300000000', 1),
	('55c5c826-10ae-11ee-ba60-3cd92b4d9bf4', 'Prueba alta backend2', 'PRB  BCK2', 'a4f79e57-32b7-11ed-aed0-040300000000', '460521dc-0481-11ee-b6df-2c4138b7dab1', '460521dc-0481-11ee-b6df-2c4138b7dab1', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-21 15:39:17', '2023-06-21 15:39:17', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('5be3fbc5-f688-11ed-b6df-2c4138b7dab1', 'Unidades Administrativas del Gobernador', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be3fe3a-f688-11ed-b6df-2c4138b7dab1', 'Contraloría y Transparencia Gubernamental', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be3ff55-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Desarrollo Regional y Agropecuario', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40053-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Participación Ciudadana', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be401ae-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Economía', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be402a5-f688-11ed-b6df-2c4138b7dab1', 'Secretaría del Trabajo', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be4038e-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Movilidad y Planeación Urbana', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40475-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Cultura', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be4055c-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de las Mujeres', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40642-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Turismo', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40724-f688-11ed-b6df-2c4138b7dab1', 'Junta Local de Conciliación y Arbitraje', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40872-f688-11ed-b6df-2c4138b7dab1', 'Secretaría General de Gobierno', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40964-f688-11ed-b6df-2c4138b7dab1', 'Tribunal de Arbitraje del Estado de Nuevo León', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40a4a-f688-11ed-b6df-2c4138b7dab1', 'Tribunal de Justicia Administrativa', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40b30-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Finanzas y Tesorería General del Estado', NULL, 'a6860b44-3087-11ed-aed0-040300000000', NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 1),
	('5be40c20-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Seguridad Pública', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40d09-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Educación', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40dec-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Salud', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40ed5-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Igualdad e Inclusión', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be40fbe-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Administración', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('5be410a6-f688-11ed-b6df-2c4138b7dab1', 'Secretaría de Medio Ambiente', NULL, NULL, NULL, NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-05-19 00:00:00', NULL, 'a77a303c-3a98-11ed-a261-0242ac120002', 0),
	('edfeb4e5-10b3-11ee-ba60-3cd92b4d9bf4', 'prueba front', 'PRB FT', '0a0578bf-a749-11ed-b719-2c4138b7dab1', '460521dc-0481-11ee-b6df-2c4138b7dab1', 'zenpoala 111\n', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-21 16:19:20', '2023-06-21 16:19:20', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('f1a6f173-0570-11ee-b6df-2c4138b7dab1', 'Prueba alta backend', 'PRB  BCK', 'a4f79e57-32b7-11ed-aed0-040300000000', '460521dc-0481-11ee-b6df-2c4138b7dab1', 'mariano escobedo', 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-07 14:21:54', '2023-06-13 16:38:00', '3d472a7a-3087-11ed-aed0-040300000000', 1);
/*!40000 ALTER TABLE `Secretarias` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Solicitudes
DROP TABLE IF EXISTS `Solicitudes`;
CREATE TABLE IF NOT EXISTS `Solicitudes` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPaterno` varchar(20) NOT NULL,
  `ApellidoMaterno` varchar(20) NOT NULL,
  `NombreUsuario` varchar(30) NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `Puesto` varchar(255) NOT NULL DEFAULT '',
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
  `FechaDeCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `UltimaModificacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `IdUResponsable` char(36) DEFAULT NULL,
  `IdPerfil` char(36) DEFAULT NULL,
  `IdRol` char(36) DEFAULT NULL,
  `IdDepartamento` char(36) DEFAULT NULL,
  `IdTipoUsuario` char(36) DEFAULT NULL,
  `PuedeFirmar` tinyint(1) DEFAULT NULL,
  `IdDependencia` char(36) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `CreadoPor` (`CreadoPor`),
  KEY `ModificadoPor` (`ModificadoPor`),
  KEY `IdApp` (`IdApp`),
  KEY `FK_Solicitudes_TipoSolicitud` (`TipoSolicitud`),
  KEY `FK9_IdTipoUsuario` (`IdTipoUsuario`),
  KEY `FK_Solicitudes_UResponsable` (`IdUResponsable`) USING BTREE,
  KEY `FK_Solicitudes_Perfil` (`IdPerfil`) USING BTREE,
  KEY `FK_Solicitudes_Roles` (`IdRol`) USING BTREE,
  KEY `FK_Solicitudes_Departamentos` (`IdDepartamento`) USING BTREE,
  KEY `FK_Solicitudes_IdDependencias` (`IdDependencia`) USING BTREE,
  CONSTRAINT `FK9_IdTipoUsuario` FOREIGN KEY (`IdTipoUsuario`) REFERENCES `TipoUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_Apps` FOREIGN KEY (`IdApp`) REFERENCES `Apps` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_Departamentos` FOREIGN KEY (`IdDepartamento`) REFERENCES `Departamentos` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_IdDependencias` FOREIGN KEY (`IdDependencia`) REFERENCES `Dependencias` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_Perfil` FOREIGN KEY (`IdPerfil`) REFERENCES `Perfiles` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_Roles` FOREIGN KEY (`IdRol`) REFERENCES `Roles` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_TipoSolicitud` FOREIGN KEY (`TipoSolicitud`) REFERENCES `TipoSolicitud` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_UResponsable` FOREIGN KEY (`IdUResponsable`) REFERENCES `UResponsable` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_Usuarios_2` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Solicitudes_Usuarios_3` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Solicitudes de usuarios nuevos';

-- Volcando datos para la tabla TiCentral.Solicitudes: ~106 rows (aproximadamente)
DELETE FROM `Solicitudes`;
/*!40000 ALTER TABLE `Solicitudes` DISABLE KEYS */;
INSERT INTO `Solicitudes` (`Id`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `NombreUsuario`, `CorreoElectronico`, `Puesto`, `Curp`, `Rfc`, `Celular`, `Telefono`, `Ext`, `TipoSolicitud`, `DatosAdicionales`, `IdApp`, `Estatus`, `CreadoPor`, `FechaDeCreacion`, `UltimaModificacion`, `ModificadoPor`, `IdUResponsable`, `IdPerfil`, `IdRol`, `IdDepartamento`, `IdTipoUsuario`, `PuedeFirmar`, `IdDependencia`) VALUES
	('0060ee6a-f8fb-11ed-b6df-2c4138b7dab1', 'Andrea', 'Prado', 'Rosa', 'Andrea', 'Andrea@correo.com', 'Diseñadora', 'QOIWUEOI3J2JOIO23I', 'O3IJ43OIJ3OI4', '2343223432', '3311232131', '3432', 'a5838dce-6c49-11ed-a880-040300000000', '{"idRol":"32e30459-eecc-11ed-b61c-2c4138b7dab1","rol":"Autorizador","cargo":"Diseñadora","idEntePublico":"f45e24df-bc38-11ed-b789-2c4138b7dab1","correoDeRecuperacion":"correo@correo.com"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 2, '191cc303-daf6-11ed-b61c-2c4138b7dab1', '2023-05-22 17:47:24', '2023-05-22 17:47:24', '191cc303-daf6-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('0294006b-98ff-11ed-b58e-2c4138b7dab1', 'teste', 'teste', 'teste', 'disRecTeste', 'Testerec@hshshshs.com', '', 'BVKBVBDKBVDKJBVKJB', 'TESTEETETTFIY', '4999499949', '5654449444', '999', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: MUN Perfil: Municipio', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-20 13:13:03', '2023-01-30 19:44:18', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('02ac8e73-978a-11ed-a912-705a0f328da6', 'ricardo', 'pardo', 'gaytan', 'baxter009', 'pedro.pardorg@gmail.com', '', 'kasdiasii8sad990si', 'LMNASKNSALDK9', '8110665786', '8110870378', '0980', 'a5838dce-6c49-11ed-a880-040300000000', '', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 17:44:12', '2023-02-02 17:34:53', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('09158bf4-a0f5-11ed-802e-2c4138b7dab1', '4', '4', '4', '4', 'asdasd@com.com', 'Gerente', '4', '4', '4', '4', '4', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a532e192-56cf-11ed-a988-040300000000","rol":"4","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 17:22:59', '2023-02-14 16:15:58', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('09e620ae-b87d-11ed-8002-d89d6776f970', 'PEDRO HIGINIO', 'SALAZAR', 'OBREGÓN', 'pedroh.salazar', 'pedroh.salazar@nuevoleon.gob.mx', '', 'SAOP730910HNLLBD01', 'SAOP7309109X3', '8120202483', '8120202483', '2483', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-01 14:04:29', '2023-03-01 14:06:25', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('0c687b82-978a-11ed-a912-705a0f328da6', 'Gonzalo', 'Cantú', 'Treviño', 'gcantu', 'gcantu@cecapmex.com', 'Gerente', 'SDFSDSDWER23454354', 'SFSDFSDFSDFSD', '1111111111', '1111111111', '1111', 'ab75eb3e-6c49-11ed-a880-040300000000', '', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 17:44:28', '2023-02-02 17:56:54', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('0fd1acc2-bd07-11ed-b789-2c4138b7dab1', 'Emmanuel ', 'Gonzalez ', 'Alvarez ', 'EmmanuelGAdmin', 'emmanuel.gonzalez@nuevoleon.gob.mx', 'Admin QA', '000000000000000000', '0000000000000', '0000000000', '0000000000', '0000', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a518468f-56cf-11ed-a988-040300000000","rol":"Admin QA","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, 'a6860b44-3087-11ed-aed0-040300000000', '2023-03-07 10:42:34', '2023-03-07 12:45:42', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('1d4028de-da54-11ed-b61c-2c4138b7dab1', 'Pedro', 'Pardo', 'Gaytan', 'srpuc', 'srpuc@correo.com', 'Capturador', 'ASDASFASFASFFASFAS', 'ASDASJANSIUAH', '9809890980', '2534234234', '2359', 'a5838dce-6c49-11ed-a880-040300000000', '{"IdRol":"abda14cc-da4e-11ed-b61c-2c4138b7dab1","rol":"Capturador","cargo":"Desarrollador","idEntePublico":"f45e24df-bc38-11ed-b789-2c4138b7dab1","entePublico":"Monterrey","CorreoDeRecuperacion":"srpuc@correo.com"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 1, 'a6860b44-3087-11ed-aed0-040300000000', '2023-04-13 17:37:12', '2023-04-13 17:37:45', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('1e8d6604-0b05-11ee-ba60-3cd92b4d9bf4', 'coordinador', 'pabmi', 'coordinador', 'coordinadorpabmi', 'n2@n2.com', 'coordinador', 'TERN791123HNLRZX05', 'TERN791123MQ0', '90', '90', '90', 'a5838dce-6c49-11ed-a880-040300000000', '', 'fa82e267-3087-11ed-aed0-040300000000', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:45:11', '2023-06-14 16:45:11', 'c18fc135-3a89-11ed-aed0-040300000000', '2a51198f-a7d7-11ed-b719-2c4138b7dab1', 'b6ff3f86-4b33-11ed-a964-040300000000', 'fe7d8a34-0af7-11ee-ba60-3cd92b4d9bf4', 'd0ab6e72-0afc-11ee-ba60-3cd92b4d9bf4', 'b055eea8-6438-11ed-a880-040300000000', 1, '6d81f62f-0afc-11ee-ba60-3cd92b4d9bf4'),
	('203e57af-a1b3-11ed-b561-2c4138b7dab1', 'pedro', 'pardo', 'gaytan', 'qwewq', 'prqwe@cecapmex.com', 'SubGerente', 'JDJDUE9487JFJR8RJU', 'U8JNDJDKDKIOE', '8768768768', '8976878768', '8768', 'a5838dce-6c49-11ed-a880-040300000000', '{}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, 'a6860b44-3087-11ed-aed0-040300000000', '2023-01-31 16:03:43', '2023-02-15 16:05:17', 'a6860b44-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('22d6f0c2-a0f5-11ed-802e-2c4138b7dab1', '8', '8', '8', '8', '8@com.com', 'Gerente', '8', '8', '8', '8', '8', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a531a16a-56cf-11ed-a988-040300000000","rol":"8","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 17:23:43', '2023-02-02 16:57:24', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('27d97417-e5ee-11ed-b61c-2c4138b7dab1', 'getetet', 'ñmmkkkkmkl', 'kmlkmkmkmlkmkm', 'kmkjkkjkjkjkj', 'vfsvsv@vsvbsdkvbsdvs.com', 'ultimaprueba', 'KJBVSKBVDSKBVDBHBV', 'CSFSDFDSGGGDB', '4564654564', '4646464646', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '440b6024-7267-11ed-a880-040300000000', '2023-04-28 11:57:35', '2023-04-28 11:57:57', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('29d9a841-f051-11ed-b61c-2c4138b7dab1', '', 'PRUEBASRPU', 'PRUEBASRPU', 'PRUEBASRPU', 'PRUEBASRPU@COM.UTY', 'PRUEBASRPU', 'PRUEBASRPUSADSADAS', 'PRUEBASRPUADS', '2342342342', '3242342342', '2342', 'a5838dce-6c49-11ed-a880-040300000000', '{"idRol":"32e30459-eecc-11ed-b61c-2c4138b7dab1","rol":"Autorizador","cargo":"PRUEBASRPU","idEntePublico":"f4395bf7-bc38-11ed-b789-2c4138b7dab1","entePublico":"El Carmen","correoDeRecuperacion":"PRUEBASRPU@COM.UTY"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 1, 'e3bcf1ee-f033-11ed-b61c-2c4138b7dab1', '2023-05-11 17:11:30', '2023-05-11 17:11:40', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('2cd79581-e5f0-11ed-b61c-2c4138b7dab1', 'fefdsfdsf', 'fdsfdsff', 'fdsfdsf', 'fsdfdsfdsfsfdsf', 'dsfdsfdsf@cdsjkvsdbnvj.co', 'vsvsvdsvdsvsv', 'VDSVSVSDDSVSVSDVSD', 'SVSDVDSDVSVVD', '5577657656', '5534534534', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '440b6024-7267-11ed-a880-040300000000', '2023-04-28 12:12:02', '2023-04-28 12:12:09', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('2dd731aa-b920-11ed-b789-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '4845645684', '8979465484', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-02 11:32:17', '2023-03-02 11:32:53', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('2e11cc89-9b58-11ed-b58e-2c4138b7dab1', 'Oswaldo', 'Calzada', 'Alba', 'oswaldo.calzada', 'oswaldo.calzada@nuevoleon.gob.mx', 'Gerente', 'XAXX010101000XCXCX', 'XAXX010101000', '8120201033', '7777777777', '637', 'b6e59f3b-6c49-11ed-a880-040300000000', 'Departamento:  Perfil: ', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-01-23 12:56:23', '2023-01-23 13:24:12', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('2f1672f7-ae57-11ed-b719-2c4138b7dab1', 'José A.', 'Pérez', 'Alonso', 'SpiderMan', 'japerez@cecapmex.com', 'DEV', '111111111111111111', 'GOTJ971127BF8', '9812312312', '9812313123', '---2', 'b6e59f3b-6c49-11ed-a880-040300000000', '{"Rol":"Administrador","IdRol":"06259956-32b7-11ed-aed0-040300000000","Cargo":"Desarrollador","IdInstitucion":"1"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 1, 'a6860b44-3087-11ed-aed0-040300000000', '2023-02-16 18:08:19', '2023-02-22 15:33:36', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('2fad75f3-b79f-11ed-8002-d89d6776f970', 'Juan Fernando', 'Chávez', 'Marroquín', 'juan.chavez', 'juan.chavez@nuevoleon.gob.mx', '', 'CAMJ871029HNLHRN02', 'CAMJ871029FP4', '8126902423', '8120201460', '1460', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 11:36:24', '2023-02-28 11:36:45', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('30038d44-98ff-11ed-b58e-2c4138b7dab1', 'teste', 'teste', 'teste', 'disRecrrTeste', 'Testerrrec@hshshshs.com', 'Gerente', 'BVKBVBDKBVDKJBVKJB', 'TESTEETETTFIY', '4999499949', '5654449444', '999', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: MUN Perfil: Municipio', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-01-20 13:14:19', '2023-01-27 16:03:50', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('327a5944-c4f5-11ed-b789-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '7777777', '8979465484', '0', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-17 12:54:51', '2023-03-17 13:11:55', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('39314051-b941-11ed-8002-d89d6776f970', 'JUAN CARLOS', 'GONZALEZ', 'ROMERO', 'juan.gonzalezr', 'juan.gonzalezr@nuevoleon.gob.mx', '', 'GORJ741101HDFNMN11', 'GORJ7411014U7', '6671672940', '8120201377', '1', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-02 13:28:50', '2023-03-02 13:34:48', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('3c927a72-0628-11ee-b6df-2c4138b7dab1', 'asdasda', 'asdfas', 'asfasf', 'asfasfasf', 'asdasdasd@kjb.cij', 'iyhiouahs', '98787UYGUYH78768YG', '87HA87SDY8A7S', '9807989879', '8768709788', '9879', 'a5838dce-6c49-11ed-a880-040300000000', '', '2493b951-d317-11ed-b61c-2c4138b7dab1', 2, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-08 12:13:57', '2023-06-08 12:13:57', 'a4f79e57-32b7-11ed-aed0-040300000000', '2a50e16b-a7d7-11ed-b719-2c4138b7dab1', '39bbd1c2-4fd4-11ed-ab6c-040300000000', NULL, '225b057a-d884-11ed-8002-d89d6776f970', 'b055eb06-6438-11ed-a880-040300000000', 0, 'fa7e5bf0-048f-11ee-b6df-2c4138b7dab1'),
	('40ad483f-b87d-11ed-8002-d89d6776f970', 'MARIA MAYELA', 'GUAJARDO', 'LOPEZ', 'mayela.guajardo', 'mayela.guajardo@nuevoleon.gob.mx', '', 'GULM720817MNLJPY07', 'GULM7208176R0', '8111836742', '8120201475', '1475', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-01 14:06:01', '2023-03-01 14:06:22', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('449cb358-a1c8-11ed-b561-2c4138b7dab1', 'test', 'test', 'test', 'test', 'test@test.test', '', 'test', 'test', '1234567689', '123456789', '123', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-31 18:35:03', '2023-02-02 17:54:04', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('458137b7-a0d8-11ed-802e-2c4138b7dab1', '2', '2', '2', '2', '2dasdas@com.com', '', '2', '2', '2', '2', '2', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a537ff3c-56cf-11ed-a988-040300000000","rol":"2","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 13:57:05', '2023-01-30 13:57:05', '3d472a7a-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('481d0d88-a0f5-11ed-802e-2c4138b7dab1', '11', '11', '11', '11', '11@com.com', '', '11', '11', '11', '11', '11', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a531a16a-56cf-11ed-a988-040300000000","rol":"11","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 17:24:45', '2023-02-07 17:35:17', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('4b4c7ed4-a0f6-11ed-802e-2c4138b7dab1', '12', '12', '12', '12', '12@com.com', '', '12', '12', '12', '12', '12', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a531a16a-56cf-11ed-a988-040300000000","rol":"12","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 17:32:00', '2023-02-03 16:14:39', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('4bbee144-c1c9-11ed-b789-2c4138b7dab1', 'fbdfbdfdfb', 'bdfbdfb', 'gfjfjhjj', 'abelino_olguin', 'abelino_olguin@hotmail.com', 'teste', 'BDBFDBDFBDFBFDBBDG', 'GFGFBDFBFDBFG', '4242', '111', '020', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-13 12:03:02', '2023-03-13 12:03:02', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('4c24face-0b05-11ee-ba60-3cd92b4d9bf4', 'auxiliar', 'pabmi', 'auxiliar', 'auxiliarpabmi', 'n3@n3.com', 'auxiliar', 'TERN791123HNLRZX05', 'TERN791123MQ0', '9', '9', '9', 'a5838dce-6c49-11ed-a880-040300000000', '', 'fa82e267-3087-11ed-aed0-040300000000', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:46:27', '2023-06-14 16:46:27', 'c18fc135-3a89-11ed-aed0-040300000000', '2a51198f-a7d7-11ed-b719-2c4138b7dab1', '6b169126-0afd-11ee-ba60-3cd92b4d9bf4', '12e83443-0af8-11ee-ba60-3cd92b4d9bf4', 'd0ab6e72-0afc-11ee-ba60-3cd92b4d9bf4', 'b055eea8-6438-11ed-a880-040300000000', 1, '6d81f62f-0afc-11ee-ba60-3cd92b4d9bf4'),
	('4d8c6b23-9778-11ed-a912-705a0f328da6', 'Alpharius2', 'Alpharius2', 'Alpharius2', 'Alpharius2', 'Alpharius2@gmail.com', '', 'redactado', 'redactado', '47574574', '474575', '1234', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a59a08ee-56cf-11ed-a988-040300000000","rol":"Alpharius2","userType":"0c50b8a4-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 15:37:27', '2023-01-26 16:59:38', 'c18fc135-3a89-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('4ef51283-9777-11ed-a912-705a0f328da6', 'Alpharius', 'Alpharius', 'Alpharius', 'Alpharius', 'Alpharius@gmail.com', '', 'redactado', 'redactado', '47574574', '474575', '1234', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a59a08ee-56cf-11ed-a988-040300000000","rol":"Alpharius","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 15:30:19', '2023-01-25 19:31:42', 'c18fc135-3a89-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('5013fc92-e528-11ed-b61c-2c4138b7dab1', 'rtertretrt', 'tetetertrtt', 'etertteet', 'trtrtrtrtrtrt3343434', 'trtrtrtrtrtrt3343434@gbgbgbg.cvom', 'teste', 'BVADKBVBSVBSVKBSKB', 'TESTETECHJCVJ', '3453453466', '5345345345', '3633', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '440b6024-7267-11ed-a880-040300000000', '2023-04-27 12:21:22', '2023-04-27 12:21:33', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('5164f9fe-f061-11ed-b61c-2c4138b7dab1', 'admin', 'prueba2', 'prueba2', 'prueba2srpu', 'prueba2srpunet.net', 'autorizador', 'ASDASDASDASDASDASD', 'DASDASDASDASD', '2342342342', '3423423423', '4234', 'a5838dce-6c49-11ed-a880-040300000000', '{"idRol":"32e30459-eecc-11ed-b61c-2c4138b7dab1","rol":"Autorizador","cargo":"autorizador","idEntePublico":"f42bccae-bc38-11ed-b789-2c4138b7dab1","correoDeRecuperacion":"prueba2srpunet.net"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 1, '29d9a841-f051-11ed-b61c-2c4138b7dab1', '2023-05-11 19:07:08', '2023-05-11 19:10:27', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('5837a5e1-073a-11ee-b98c-3cd92b4d9bf4', 'ferprueba', 'ferprueba', 'ferprueba', 'ferprueba', 'ferprueba@xdd.yv', 'dasdmasdm', 'ASDASDASDASÑDLJASL', 'LKMLÑAKMSDLÑK', '3242349872', '2340234982', '3243', 'a5838dce-6c49-11ed-a880-040300000000', '', 'ebb88944-de38-11ed-b61c-2c4138b7dab1', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-09 20:56:06', '2023-06-10 16:36:04', 'a4f79e57-32b7-11ed-aed0-040300000000', '2a50e7ef-a7d7-11ed-b719-2c4138b7dab1', 'bf9f7de8-4b33-11ed-a964-040300000000', NULL, 'e0bb86e2-03c1-11ee-b6df-2c4138b7dab1', 'b055eb06-6438-11ed-a880-040300000000', 0, '8ebdb1d3-0492-11ee-b6df-2c4138b7dab1'),
	('595ad41d-9778-11ed-a912-705a0f328da6', 'Alpharius3', 'Alpharius3', 'Alpharius3', 'Alpharius3', 'Alpharius3@gmail.com', '', 'redactado', 'redactado', '47574574', '474575', '1234', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a59a08ee-56cf-11ed-a988-040300000000","rol":"Alpharius3","userType":"0c50b8a4-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 15:37:46', '2023-01-25 19:51:44', 'c18fc135-3a89-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('5969b807-e5ef-11ed-b61c-2c4138b7dab1', 'kbkbkb', 'hbkhbkbkb', 'bkbkbkbkhb', 'khbkhbhbhbh.teste', 'kcbadskcbadskcbads@nsdjdvs.com', 'bkbhjbbhk', '6876JCBDJSCBVDCBVD', '8765868787676', '5353536355', '3463464334', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '440b6024-7267-11ed-a880-040300000000', '2023-04-28 12:06:07', '2023-04-28 12:06:14', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('59d8059d-e5ea-11ed-b61c-2c4138b7dab1', 'teste', 'testeetetett', 'tetetgdgdgd', 'pruebas.testeteste', 'pruebas.testeteste@hdhdhd.com', 'sadsvadaadv', 'FHDFHFDHDHDFSHFDBC', 'FDGDSGFDSHGDF', '3453454353', '3453454353', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '440b6024-7267-11ed-a880-040300000000', '2023-04-28 11:30:21', '2023-04-28 11:30:52', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('5a94a875-96bb-11ed-a912-705a0f328da6', 'zaragoza', 'zaragoza', 'zaragoza', 'zaragoza', 'zaragoza@gmail.com', '', 'GAMA920807HVZRRD00', 'GAMA920807EB6', '8126902423', '8126902423', '258', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: CPH Perfil: Analista', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-17 17:04:54', '2023-01-18 15:59:23', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('5c65bc63-c1c8-11ed-b789-2c4138b7dab1', 'fbdfbdfdfb', 'bdfbdfb', 'gfjfjhjj', 'abelino_olguin', 'abelino_olguin@hotmail.com', 'teste', 'BDBFDBDFBDFBFDBBDG', 'GFGFBDFBFDBFG', '4242', '111', '020', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-13 11:56:20', '2023-03-13 11:56:56', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('5e6f44d1-d7c5-11ed-8581-040300000000', 'Usuario ', 'Genérico', 'DCCP', 'DCCP', 'dccp@test.com', '', 'DCCP980207MMCCRRB4', 'RFCGENERICO10', '3254561874', '9187563254', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-10 12:30:21', '2023-04-10 12:32:14', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('5e82153e-b7b0-11ed-8002-d89d6776f970', 'Samantha Rubi', 'Nava', 'Luevano', 'samantha.nava', 'samantha.nava@nuevoleon.gob.mx', '', 'NALS921204MNLVVM06', 'NALS921204I74', '8120201300', '8120201300', '1347', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 13:39:24', '2023-02-28 13:44:03', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('5f70c093-0afe-11ee-ba60-3cd92b4d9bf4', 'administrador', 'pabmi', 'admin', 'adminpabmi', 'n@n.com', 'Director', 'TERN791123HNLRZX05', 'TERN791123MQ0', '234', '234', '99', 'a5838dce-6c49-11ed-a880-040300000000', '', 'fa82e267-3087-11ed-aed0-040300000000', 2, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 15:56:53', '2023-06-14 15:56:53', 'c18fc135-3a89-11ed-aed0-040300000000', '2a51198f-a7d7-11ed-b719-2c4138b7dab1', 'bf9f7de8-4b33-11ed-a964-040300000000', 'efcb607f-0af7-11ee-ba60-3cd92b4d9bf4', 'd0ab6e72-0afc-11ee-ba60-3cd92b4d9bf4', 'b055ed42-6438-11ed-a880-040300000000', 1, '6d81f62f-0afc-11ee-ba60-3cd92b4d9bf4'),
	('6145c381-daf1-11ed-b61c-2c4138b7dab1', 'Fernando', 'Elizondo', 'X.', 'srpuv', 'srpuv@correo.com', 'Desarrollador', 'LAMSDNLADMLASMDLAS', 'LKMASDLKMASDL', '9099090909', '2342342342', '9989', 'a5838dce-6c49-11ed-a880-040300000000', '{"idRol":"b32dc972-da4e-11ed-b61c-2c4138b7dab1","rol":"Verificador","cargo":"Desarrollador","idEntePublico":"f432d16b-bc38-11ed-b789-2c4138b7dab1","entePublico":"Monterrey","correoDeRecuperacion":"srpuv@correo.com"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 1, 'a6860b44-3087-11ed-aed0-040300000000', '2023-04-14 12:22:57', '2023-04-14 12:23:24', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('62963803-a1c9-11ed-b561-2c4138b7dab1', 'test', 'test', 'test', 'test0', 'test@test.test0', '', 'test', 'test', '1234567689', '123456789', '123', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-31 18:43:03', '2023-02-01 18:59:26', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('6296ecf1-a1c9-11ed-b561-2c4138b7dab1', 'test', 'test', 'test', 'test1', 'test@test.test1', '', 'test', 'test', '1234567689', '123456789', '123', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-31 18:43:03', '2023-02-02 17:42:55', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('62983780-a1c9-11ed-b561-2c4138b7dab1', 'test', 'test', 'test', 'test2', 'test@test.test2', '', 'test', 'test', '1234567689', '123456789', '123', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-31 18:43:03', '2023-02-02 17:42:08', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('63706311-9906-11ed-b58e-2c4138b7dab1', 'teste', 'dis', 'rec', 'disdisteste', 'testetetstst@disrec.com', '', 'BFBBBBSBDFSBSDFLLB', 'VDVDSVBSBDSBD', '9493457357', '8348932747', '737', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: MUN Perfil: Municipio', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-20 14:05:52', '2023-01-20 16:40:39', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('66ef1244-98ff-11ed-b58e-2c4138b7dab1', 'teste', 'teste', 'teste', 'disRecrqrTeste', 'Testeqrrrec@hshshshs.com', '', 'BVKBVBDKBVDKJBVKJB', 'TESTEETETTFIY', '4999499949', '5654449444', '999', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: MUN Perfil: Municipio', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-01-20 13:15:51', '2023-01-27 15:57:27', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('676a5314-9b7f-11ed-b58e-2c4138b7dab1', 'menganmitoasd', 'menganmitoasdas', 'menganmitoads', 'menganmitoasd', 'menganitoasdasd@menganito.com', '', 'menganmito', 'menganmito', '3123123123', '12321312', '1231', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a5436e61-56cf-11ed-a988-040300000000","rol":"prueba","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-23 17:37:10', '2023-01-23 18:28:38', 'c18fc135-3a89-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('69b853ad-96c8-11ed-a912-705a0f328da6', 'José A.', 'Pérez', 'Alonso', 'Spiderman', 'japerez@cecapmex.com', '', '111111111111111111', 'DLOSDJ245', '9812312312', '9812313123', '---2', 'b6e59f3b-6c49-11ed-a880-040300000000', '', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-17 18:38:22', '2023-01-27 15:35:56', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('6a597d26-c4f2-11ed-b789-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '7777777', '8979465484', '0', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-17 12:34:56', '2023-03-17 12:37:58', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('74318f94-98ff-11ed-b58e-2c4138b7dab1', 'teste', 'teste', 'teste', 'di3sRecrqrTeste', 'T3esteqrrrec@hshshshs.com', '', 'BVKBVBDKBVDKJBVKJB', 'TESTEETETTFIY', '4999499949', '5654449444', '999', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: MUN Perfil: Municipio', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-20 13:16:13', '2023-02-02 17:40:08', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('75f68ce2-da4f-11ed-b61c-2c4138b7dab1', 'SRPU C', 'CAPTURADOR', 'CAPTURADOR', 'srpucapturador', 'srpucapturador@correo.com', 'DESARROLLADOR', 'SFDAASDPLKASDPKASP', 'PLMDAÑSLMÑLAM', '4564564564', '1231231231', '1242', 'a5838dce-6c49-11ed-a880-040300000000', '{"IdRol":"abda14cc-da4e-11ed-b61c-2c4138b7dab1","rol":"Capturador","cargo":"Desarrollador","idEntePublico":"f45e24df-bc38-11ed-b789-2c4138b7dab1","entePublico":"Monterrey","CorreoDeRecuperacion":"srpuc@correo.com"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 2, 'a6860b44-3087-11ed-aed0-040300000000', '2023-04-13 17:03:53', '2023-04-13 17:35:31', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('76de21e2-0b05-11ee-ba60-3cd92b4d9bf4', 'enlace', 'pabmi', 'enlace', 'enlacepabmi', 'n4@n4.com', 'auxiliar', 'TERN791123HNLRZX05', 'TERN791123MQ0', '7', '7', '7', 'a5838dce-6c49-11ed-a880-040300000000', '', 'fa82e267-3087-11ed-aed0-040300000000', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:47:39', '2023-06-14 16:47:39', 'c18fc135-3a89-11ed-aed0-040300000000', '2a51198f-a7d7-11ed-b719-2c4138b7dab1', '6b169126-0afd-11ee-ba60-3cd92b4d9bf4', '12e83443-0af8-11ee-ba60-3cd92b4d9bf4', 'd0ab6e72-0afc-11ee-ba60-3cd92b4d9bf4', 'b055eea8-6438-11ed-a880-040300000000', 0, '6d81f62f-0afc-11ee-ba60-3cd92b4d9bf4'),
	('7ac032c6-96ca-11ed-a912-705a0f328da6', 'José A.', 'Pérez', 'Alonso', 'Spiderman', 'japerez@cecapmex.com', '', '111111111111111111', 'DLOSDJ245', '9812312312', '9812313123', '---2', 'c326ea8b-6c49-11ed-a880-040300000000', '', 'fa82e267-3087-11ed-aed0-040300000000', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-17 18:53:10', '2023-02-14 17:28:02', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('7f4a407b-98fd-11ed-b58e-2c4138b7dab1', 'testeDis', 'teste', 'recurs', 'dis.recTeste', 'teste.teste@hotmail.com', '', 'WGWEGWEEWGEWGEWGWG', 'E32REWTERGTRT', '4364343636', '3443433424', '4646', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: MUN Perfil: Municipio', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-20 13:02:13', '2023-01-30 19:25:10', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('80f962e2-c1c3-11ed-b789-2c4138b7dab1', 'fbdfbdfdfb', 'bdfbdfb', 'gfjfjhjj', 'abelino_olguin', 'abelino_olguin@hotmail.com', 'teste', 'BDBFDBDFBDFBFDBBDG', 'GFGFBDFBFDBFG', '4242', '111', '020', 'b6e59f3b-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-13 11:21:34', '2023-03-13 11:22:26', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('819af6e6-a0f6-11ed-802e-2c4138b7dab1', '13', '13', '13', '13', '13@com.com', 'subgerente', '13', '13', '13', '13', '13', 'a5838dce-6c49-11ed-a880-040300000000', '{}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 17:33:31', '2023-02-15 16:13:12', 'a6860b44-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('83f8dcdd-96b7-11ed-a912-705a0f328da6', 'Pedro', 'Pardo', 'Gaytan', 'Ejemplo', 'ejemplo@cecapmex.com', '', '22222', '22222', '22222', '3333333', '222', 'ab75eb3e-6c49-11ed-a880-040300000000', '', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-17 16:37:25', '2023-02-01 19:39:45', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('84959568-09a6-11ee-ba60-3cd92b4d9bf4', 'pruebaalta', 'pruebaalta', 'pruebaalta', 'pruebaaltaxd', 'pruebaalta@pruebaalta.com', 'pruebaalta', 'PRUEBAALTA21321312', 'PRUEBAALTA123', '2314342342', '4234234233', '2342', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-12 22:55:28', '2023-06-12 22:55:28', 'a4f79e57-32b7-11ed-aed0-040300000000', '2a50e5dc-a7d7-11ed-b719-2c4138b7dab1', 'ebd771e7-04b4-11ee-b6df-2c4138b7dab1', '25bc4557-d7ca-11ed-8581-040300000000', '8d5f449a-03ba-11ee-b6df-2c4138b7dab1', 'b055ed42-6438-11ed-a880-040300000000', 1, '8ebdb1d3-0492-11ee-b6df-2c4138b7dab1'),
	('85940667-96b2-11ed-a912-705a0f328da6', 'usuario2', 'usuario2|', 'usuario2', 'usuario2q', 'usuario2q@gmail.com', '', 'GAMA920807HVZRRD00', 'GAMA920807EB6', '8126902423', '8126902423', '569', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: DAMOP Perfil: Analista', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-17 16:01:40', '2023-01-17 16:02:46', 'c18fc135-3a89-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('8771622d-f452-11ed-b6df-2c4138b7dab1', 'srpuvdev', 'srpuvdev', 'srpuvdev', 'srpuvdev', 'srpuvdev@correo.com', 'Desarrollador', 'LAMSDNLADMLASMDLAS', 'LKMASDLKMASDL', '9099090909', '2342342342', '9989', 'a5838dce-6c49-11ed-a880-040300000000', '{"idRol":"abda14cc-da4e-11ed-b61c-2c4138b7dab1","rol":"Capturador","cargo":"Desarrollador","idEntePublico":"f45e24df-bc38-11ed-b789-2c4138b7dab1","entePublico":"Monterrey","correoDeRecuperacion":"srpuc@correo.com"}', '88e59393-f451-11ed-b6df-2c4138b7dab1', 1, 'a6860b44-3087-11ed-aed0-040300000000', '2023-04-14 12:22:57', '2023-05-16 19:38:03', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('89cdbf65-e5ec-11ed-b61c-2c4138b7dab1', 'testet', 'restet', 'tcgzjhcdbcjvh', '12345.1234', '12345.1234@kjsbvksjbv.com', 'fsdvdsvdsv', 'CAMV821001MNLRDR04', 'VDSVDSVDSVDSV', '5474574575', '6456474656', '5745', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '440b6024-7267-11ed-a880-040300000000', '2023-04-28 11:46:00', '2023-04-28 11:46:26', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('90f64b89-98ff-11ed-b58e-2c4138b7dab1', 'teste', 'teste', 'teste', 'di3sR3ecrqrTeste', 'T3e3steqrrrec@hshshshs.com', '', 'BVKBVBDKBVDKJBVKJB', 'TESTEETETTFIY', '4999499949', '5654449444', '999', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: MUN Perfil: Municipio', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-01-20 13:17:02', '2023-01-27 16:03:27', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('94b76caa-b7b0-11ed-8002-d89d6776f970', 'Francisco Alberto', 'Bernal', 'Hernandez', 'francisco.bernal', 'francisco.bernal@nuevoleon.gob.mx', '', 'BEHF941004HNLRRR02', 'BEHF941004MN6', '8120201300', '8120201300', '1378', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 13:40:55', '2023-02-28 13:44:01', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('9cb45ef5-b887-11ed-b789-2c4138b7dab1', 'organismo', 'teste', 'teste', 'teste.teste2', 'testegggkhgkhghghjte@testye.com', 'organismo', 'HSBJBIUFSBDHJBDSBS', 'CDVBDSVBVY97S', '4465465464', '6465454464', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-01 17:20:10', '2023-03-02 11:32:45', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('9cbeaa67-c8e4-11ed-b4d7-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '7777777', '8979465484', '0', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-22 13:06:12', '2023-03-22 13:07:39', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('9f4087c9-c4f0-11ed-b789-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '7777777', '8979465484', '0', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-17 12:22:06', '2023-03-17 12:34:16', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('a143de74-977b-11ed-a912-705a0f328da6', 'Visualizar', 'dvdsvs', 'sdvdvd', 'vsdvdsv', 'vdsvsvd@dfbdf.com', '', 'OUMA920204HVZLRB05', 'VVWBBSBSBBSBS', '5474575475', '4567457457', '5745', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: ORG Perfil: Organismo', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-18 16:01:16', '2023-02-02 17:40:37', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('a46d78a2-c4f7-11ed-b789-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '7777777', '8979465484', '0', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-17 13:12:21', '2023-03-17 13:12:49', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('a4cbcb26-978a-11ed-a912-705a0f328da6', 'José A.', 'Pérez', 'Alonso', 'SpiderMan', 'japerez@cecapmex.com', '', '111111111111111111', 'GOTJ971127BF8', '9812312312', '9812313123', '---2', 'ab75eb3e-6c49-11ed-a880-040300000000', '', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 17:48:44', '2023-02-15 18:17:32', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('a52a911f-f452-11ed-b6df-2c4138b7dab1', 'srpucdev', 'srpucdev', 'srpucdev', 'srpucdev', 'srpucdev@correo.com', 'Capturador', 'ASDASFASFASFFASFAS', 'ASDASJANSIUAH', '9809890980', '2534234234', '2359', 'a5838dce-6c49-11ed-a880-040300000000', '{"idRol":"abda14cc-da4e-11ed-b61c-2c4138b7dab1","rol":"Capturador","cargo":"Desarrollador","idEntePublico":"f45e24df-bc38-11ed-b789-2c4138b7dab1","entePublico":"Monterrey","correoDeRecuperacion":"srpucdev@correo.com"}\r\n', '88e59393-f451-11ed-b6df-2c4138b7dab1', 1, 'a6860b44-3087-11ed-aed0-040300000000', '2023-04-13 17:37:12', '2023-05-16 19:37:58', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('ab583a15-a3e0-11ed-b561-2c4138b7dab1', 'fbdfbdfdfb', 'bdfbdfb', 'gfjfjhjj', 'abelino_olguin', 'abelino_olguin@hotmail.com', '', 'BDBFDBDFBDFBFDBBDG', 'GFGFBDFBFDBFG', '4242', '3424242442', '020', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-03 10:34:46', '2023-02-03 10:44:30', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('b17a8c4b-96ba-11ed-a912-705a0f328da6', 'escobedo', 'escobedo', 'escobedo', 'escobedo1', 'escobedo@prueba.com', '', 'GAMA920807HVZRRD00', 'GAMA920807EB6', '8126902423', '8126902423', '345', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: CPH Perfil: Validador', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-17 17:00:10', '2023-01-30 19:19:37', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('b511c28d-9b5f-11ed-b58e-2c4138b7dab1', 'teste', 'dis', 'rec', 'disdisteste', 'testetetstst@disrec.com', '', 'BFBBBBSBDFSBSDFLLB', 'VDVDSVBSBDSBD', '9493457357', '8348932747', '737', 'b6e59f3b-6c49-11ed-a880-040300000000', 'Departamento: DAF Perfil: Administrador', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-01-23 13:50:16', '2023-01-27 15:56:42', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('b547bd37-0628-11ee-b6df-2c4138b7dab1', 'afgfdg', 'adfgdfg', 'asdlaksmd', 'llzxkmclzkxc', 'pedro@njcd.mcs', 'sadfsdfsdf', 'ASDASLKDMALSKÑDMAO', 'TESTSADASDASD', '2131231231', '1231231231', '9901', 'a5838dce-6c49-11ed-a880-040300000000', '', '2493b951-d317-11ed-b61c-2c4138b7dab1', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-08 12:17:20', '2023-06-10 16:36:36', 'a4f79e57-32b7-11ed-aed0-040300000000', '2a50e065-a7d7-11ed-b719-2c4138b7dab1', '2d83e02b-04b6-11ee-b6df-2c4138b7dab1', NULL, '49f5a33e-054c-11ee-b6df-2c4138b7dab1', 'b055eb06-6438-11ed-a880-040300000000', 0, 'fa7e5bf0-048f-11ee-b6df-2c4138b7dab1'),
	('b7c6c52a-9779-11ed-a912-705a0f328da6', '1', '1', '1', '1', 'asdasdadsa@com.com', '', 'redactado', 'redactado', '1', '1', '1234', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a5436e61-56cf-11ed-a988-040300000000","rol":"1","userType":"1146ff55-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-18 15:47:34', '2023-01-25 19:34:25', 'c18fc135-3a89-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('b8664c36-c4ef-11ed-b789-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '7777777', '8979465484', '0', 'b6e59f3b-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-17 12:15:38', '2023-03-17 12:15:50', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('b9613ec7-f032-11ed-b61c-2c4138b7dab1', 'admin', 'revisor', 'srpu', 'srpurevisor', 'srpurevisor@correo.com', 'revisor', 'CURPFICTICION12312', 'RFCFICTICIOA8', '9789797979', '2342342342', '9879', 'a5838dce-6c49-11ed-a880-040300000000', '{"idRol":"193e0c31-eecc-11ed-b61c-2c4138b7dab1","rol":"Revisador","cargo":"Revisador","idEntePublico":"f42bccae-bc38-11ed-b789-2c4138b7dab1","entePublico":"Secretaría de Finanzas y Tesorería General del Estado","correoDeRecuperacion":"correoDeRecuperacion@correo.uki"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 1, '191cc303-daf6-11ed-b61c-2c4138b7dab1', '2023-05-11 13:33:36', '2023-05-11 13:39:13', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('bf4d7d36-9827-11ed-a912-705a0f328da6', 'teste', 'teset2', 'teste3', 'teste.teste', 'teste@teste.com', '', 'NFLSNLFSNLBNLBNSBN', 'CSDNVNDSVDSBV', '7657576576', '4564646464', '45', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: ORG Perfil: Organismo', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-19 12:33:19', '2023-01-30 19:24:16', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('c7732105-ad91-11ed-b719-2c4138b7dab1', 'josvan', 'josvan', 'josvan', 'Josvan', 'josvan@cecapmex.com', 'Desarrollador', 'lkamsldmlaskmdlmas', 'lamksdlmasldm', '8776876876', '8768678767', '6876', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a531a16a-56cf-11ed-a988-040300000000","rol":"Desarrollador","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, 'a6860b44-3087-11ed-aed0-040300000000', '2023-02-15 18:35:14', '2023-02-23 18:58:37', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('c8c0b8fc-a0f5-11ed-802e-2c4138b7dab1', '111', '111', '111', '111', '111@com.com', 'gerente', '111', '111', '111', '111', '111', 'a5838dce-6c49-11ed-a880-040300000000', '{}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 17:28:21', '2023-03-10 12:12:17', '61a418d5-bf6e-11ed-b789-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('c9839247-b7b0-11ed-8002-d89d6776f970', 'Alexa Gabriela', 'Hernandez', 'Ibarra', 'alexa.hernandez', 'alexa.hernandez@nuevoleon.gob.mx', '', 'HEIA991014MNLRBL07', 'HEIA991014UFA', '8120201300', '8120201300', '6284', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 13:42:24', '2023-02-28 13:43:59', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('cad8d847-f034-11ed-b61c-2c4138b7dab1', 'admin', 'autorizador', 'srpu', 'srpuautorizador', 'srpuautorizador@correo.com', 'autorizador', 'CURPFICTICION12312', 'RFCFICTICIOA8', '2342342342', '2342342342', '2342', 'a5838dce-6c49-11ed-a880-040300000000', '{"idRol":"32e30459-eecc-11ed-b61c-2c4138b7dab1","rol":"Autorizador","cargo":"Autorizador","idEntePublico":"f42bccae-bc38-11ed-b789-2c4138b7dab1","entePublico":"Secretaría de Finanzas y Tesorería General del Estado","correoDeRecuperacion":"correoDeRecuperacion@correo.uki"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 1, '5164f9fe-f061-11ed-b61c-2c4138b7dab1', '2023-05-11 13:48:25', '2023-05-11 13:48:58', '5164f9fe-f061-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('cb7cdab5-0b35-11ee-ba60-3cd92b4d9bf4', 'asdasd', 'asdasdasd', 'asdasdasd', 'prpardo', 'prpardo@cecapmex.com', 'asdasdasd', 'ASDASDASDASDASASDA', 'ADSDASDASDASD', '1234234234', '2342342342', '2342', 'c326ea8b-6c49-11ed-a880-040300000000', '', '999db602-acbf-11ed-b719-2c4138b7dab1', 0, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-14 16:33:49', '2023-06-14 16:33:49', 'a4f79e57-32b7-11ed-aed0-040300000000', '2a50e5dc-a7d7-11ed-b719-2c4138b7dab1', '4991ba04-4fd4-11ed-ab6c-040300000000', '22e1877d-95cc-11ed-a912-705a0f328da6', '66270023-2b01-11ed-afdb-040300000000', 'b055eb06-6438-11ed-a880-040300000000', 0, '6d81f62f-0afc-11ee-ba60-3cd92b4d9bf4'),
	('cb993d7a-b84f-11ed-8002-d89d6776f970', 'Karla Yesenia', 'Delgado', 'Garcia ', 'karla.delgado', 'karla.delgado@nuevoleon.gob.mx', '', 'DEGK900306MNLLRR05', 'DEGK900306PR9', '8120201377', '8120201377', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-01 08:40:37', '2023-03-01 08:42:04', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('d266b0ee-98ff-11ed-b58e-2c4138b7dab1', 'teste', 'teste', 'teste', 'di33sR3ecrqrTeste', 'T33e3steqrrrec@hshshshs.com', '', 'BVKBVBDKBVDKJBVKJB', 'TESTEETETTFIY', '4999499949', '5654449444', '999', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: MUN Perfil: Municipio', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-01-20 13:18:51', '2023-01-27 15:58:32', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('d3413f61-b87c-11ed-8002-d89d6776f970', 'ELISA', 'MADERA', 'HOLTEN', 'elisa.madera', 'elisa.madera@nuevoleon.gob.mx', '', 'MAHE701125MNLDLL01', 'MAHE701125Q47', '8120201340', '8120201340', '1340', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-01 14:02:57', '2023-03-01 14:06:28', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('d6ff8fec-0b04-11ee-ba60-3cd92b4d9bf4', 'director', 'pabmi', 'director', 'directorpabmi', 'n1@n1.com', 'director', 'TERN791123HNLRZX05', 'TERN791123MQ0', '90', '90', '90', 'a5838dce-6c49-11ed-a880-040300000000', '', 'fa82e267-3087-11ed-aed0-040300000000', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:43:10', '2023-06-14 16:43:10', 'c18fc135-3a89-11ed-aed0-040300000000', '2a51198f-a7d7-11ed-b719-2c4138b7dab1', 'bf9f7de8-4b33-11ed-a964-040300000000', 'efcb607f-0af7-11ee-ba60-3cd92b4d9bf4', 'd0ab6e72-0afc-11ee-ba60-3cd92b4d9bf4', 'b055ed42-6438-11ed-a880-040300000000', 1, '6d81f62f-0afc-11ee-ba60-3cd92b4d9bf4'),
	('d8c2a7fe-e515-11ed-b61c-2c4138b7dab1', 'rgergergrg', 'gregergerg', 'gergedfbbb', 'ggergergf.rerbreberb', 'ggergergf.rerbreberb@vsvsd.com', 'teste', 'VHUDSVIUSHVUIDSVDS', 'SDVOHSVOUDHUD', '4564468484', '7454464654', '5454', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '440b6024-7267-11ed-a880-040300000000', '2023-04-27 10:09:11', '2023-04-27 12:09:37', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('dd131c61-c4f2-11ed-b789-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '7777777', '8979465484', '0', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-17 12:38:08', '2023-03-17 12:53:50', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('debca262-cda9-11ed-b671-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '7777777', '8979465484', '0', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-28 14:48:18', '2023-04-10 16:13:55', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('e3bcf1ee-f033-11ed-b61c-2c4138b7dab1', 'admin', 'validador', 'sepu', 'srpuvalidador', 'srpuvalidador@correo.com', 'validador', 'CURPFICTICION12312', 'RFCFICTICIOA8', '3333333333', '1122222223', '3123', 'a5838dce-6c49-11ed-a880-040300000000', '{"idRol":"28cc0b93-eecc-11ed-b61c-2c4138b7dab1","rol":"Validador","cargo":"Validador","idEntePublico":"f42bccae-bc38-11ed-b789-2c4138b7dab1","entePublico":"Secretaría de Finanzas y Tesorería General del Estado","correoDeRecuperacion":"correoDeRecuperacion@correo.uki"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 1, '191cc303-daf6-11ed-b61c-2c4138b7dab1', '2023-05-11 13:41:57', '2023-05-11 13:45:07', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('e4724bbd-c8e5-11ed-b4d7-2c4138b7dab1', 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '7777777', '8979465484', '0', 'ab75eb3e-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-03-22 13:15:22', '2023-03-28 14:47:56', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('e92de6e7-ae61-11ed-b719-2c4138b7dab1', 'ricardo', 'pardo', 'gaytan', 'pedrop009', 'pedro.pardorg@gmail.com', 'Prueba', 'kasdiasii8sad990si', 'lmnasknsaldk9', '8110665786', '8110870378', '0980', 'b6e59f3b-6c49-11ed-a880-040300000000', '{"Rol":"Administrador","IdRol":"06259956-32b7-11ed-aed0-040300000000","Cargo":"prueba","IdInstitucion":"a532e192-56cf-11ed-a988-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2023-02-16 19:25:06', '2023-02-22 15:33:08', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('f236cb5b-a0eb-11ed-802e-2c4138b7dab1', '3', '3', '3', '3', 'qwe@com.com', '', '3', '3', '3', '3', '3', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a531a16a-56cf-11ed-a988-040300000000","rol":"3","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 2, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 16:17:55', '2023-02-02 17:41:17', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('f26ec6dc-f985-11ed-b6df-2c4138b7dab1', 'Fernando', 'Elizondo', 'Acevedo', 'srpuv', 'srpuv@correo.com', 'Desarrollador', 'LAMSDNLADMLASMDLAS', 'LKMASDLKMASDL', '9099090909', '2342342342', '9989', 'b6e59f3b-6c49-11ed-a880-040300000000', '{"idRol":"b32dc972-da4e-11ed-b61c-2c4138b7dab1","rol":"Verificador","cargo":"Desarrollador","idEntePublico":"f45e24df-bc38-11ed-b789-2c4138b7dab1","correoDeRecuperacion":"srpuv@correo.com"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 2, '6145c381-daf1-11ed-b61c-2c4138b7dab1', '2023-05-23 10:22:01', '2023-05-23 10:22:01', '6145c381-daf1-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('f54453af-dfc1-11ed-b61c-2c4138b7dab1', 'Josvan', 'Josvan', 'Josvan', 'Josvan', 'josvan@cecapmex.com', 'Dev', '111111111111111111', '1111111111111', '1111111111', '1111111111', '1111', 'c326ea8b-6c49-11ed-a880-040300000000', '{"idRol":"700e7018-da4e-11ed-b61c-2c4138b7dab1","rol":"Administrador","cargo":"Dev","idEntePublico":"f43d520a-bc38-11ed-b789-2c4138b7dab1","correoDeRecuperacion":"josvan@cecapmex.com"}', '999db602-acbf-11ed-b719-2c4138b7dab1', 1, 'a6860b44-3087-11ed-aed0-040300000000', '2023-04-20 15:26:05', '2023-04-20 15:26:29', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('f739ea4e-b7b0-11ed-8002-d89d6776f970', 'Monica Elizabeth', 'Gonzalez', 'Sandoval', 'monica.gonzalezs', 'monica.gonzalezs@nuevoleon.gob.mx', '', 'GOSM701129MNLNNN02', 'GOSM701129QQ2', '8120201300', '8120201300', '2497', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-28 13:43:40', '2023-02-28 13:43:56', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('f8182503-a334-11ed-b561-2c4138b7dab1', 'Iris Cecilia ', 'Lechuga ', 'Arteaga', 'iclechuga', 'iclechuga@cecapmex.com', '', 'iclechuga', 'iclechuga', '8328423894', '8128748459', '9898', 'c326ea8b-6c49-11ed-a880-040300000000', '{"institution":"1","rol":"prueba","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 1, 'a6860b44-3087-11ed-aed0-040300000000', '2023-02-02 14:05:41', '2023-03-27 12:07:15', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('f977a292-96b6-11ed-a912-705a0f328da6', 'usuario12', 'usuario12', 'usuario12', 'usuario12', 'usuario12@gmail.com', '', 'GAMA920807HVZRRD00', 'GAMA920807EB6', '8126902423', '8126902423', '56', 'a5838dce-6c49-11ed-a880-040300000000', 'Departamento: CPH Perfil: Validador', '973ecf89-38ff-11ed-aed0-040300000000', 2, '30adc962-7109-11ed-a880-040300000000', '2023-01-17 16:33:33', '2023-02-01 18:23:24', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('fafc8d0e-e5ee-11ed-b61c-2c4138b7dab1', 'fegfe', 'gsdgdsgds', 'gsdgdsgs', 'gsdgdsg', 'gsdgdsggsdg@hdhdht.com', 'csdvsdvdsv', 'KBKBKBBKBBBKJBJKBK', 'UBKBBKBKBKBKB', '8768768768', '6876876876', '0', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '440b6024-7267-11ed-a880-040300000000', '2023-04-28 12:03:29', '2023-04-28 12:03:36', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('fb5402d0-0b38-11ee-ba60-3cd92b4d9bf4', 'pedro ricardo', 'pardo', 'gaytan', 'prpardo', 'pedropardog009@gmail.com', 'asdasdsa', 'ASSSSSSSSSSSSSASDA', 'ASDASDADDDDDD', '4343242342', '8110665786', '2342', 'c326ea8b-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 0, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-14 16:56:38', '2023-06-14 16:56:38', 'a4f79e57-32b7-11ed-aed0-040300000000', '2a50e673-a7d7-11ed-b719-2c4138b7dab1', 'fd202ded-04b4-11ee-b6df-2c4138b7dab1', '2621f126-71d3-11ed-a880-040300000000', 'd0ab6e72-0afc-11ee-ba60-3cd92b4d9bf4', 'b055eb06-6438-11ed-a880-040300000000', 1, '8ebdb1d3-0492-11ee-b6df-2c4138b7dab1'),
	('fba5160b-a0f4-11ed-802e-2c4138b7dab1', 'Jesus', 'Rodrigues ', 'Gonzalo', 'Admin user', 'qwer@com.com', '', '2', '2', '1', '1', '1', 'a5838dce-6c49-11ed-a880-040300000000', '{"institution":"a531a16a-56cf-11ed-a988-040300000000","rol":"Admin","userType":"06259956-32b7-11ed-aed0-040300000000"}', 'ffcc48cb-3087-11ed-aed0-040300000000', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2023-01-30 17:22:37', '2023-02-14 17:28:09', 'a4f79e57-32b7-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL),
	('ffb804ea-c8e1-11ed-b4d7-2c4138b7dab1', 'Juanita', 'Reyes', 'Hinojosa', 'jreyes', 'jjreyes@cecapmex.com', 'analista', 'REHS920429MVZYNN02', 'REHS9204292I3', '3232', '122', '2321', 'a5838dce-6c49-11ed-a880-040300000000', '', '973ecf89-38ff-11ed-aed0-040300000000', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-22 12:47:30', '2023-03-22 12:48:17', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, 0, NULL);
/*!40000 ALTER TABLE `Solicitudes` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.TipoDependencias
DROP TABLE IF EXISTS `TipoDependencias`;
CREATE TABLE IF NOT EXISTS `TipoDependencias` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Nombre` varchar(200) NOT NULL,
  `Descripcion` longtext NOT NULL,
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(50) NOT NULL,
  `CreadoPor` char(50) NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_TipoDependencias_Usuarios` (`CreadoPor`),
  KEY `FK_TipoDependencias_Usuarios_2` (`ModificadoPor`),
  CONSTRAINT `FK_TipoDependencias_Usuarios` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TipoDependencias_Usuarios_2` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla TiCentral.TipoDependencias: ~2 rows (aproximadamente)
DELETE FROM `TipoDependencias`;
/*!40000 ALTER TABLE `TipoDependencias` DISABLE KEYS */;
INSERT INTO `TipoDependencias` (`Id`, `Nombre`, `Descripcion`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Deleted`, `deleted_at`) VALUES
	('4b077d2f-0489-11ee-b6df-2c4138b7dab1', 'No Aplica', 'No aplica', '2023-06-21 12:08:06', '2023-06-06 10:43:41', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, NULL),
	('525d3e56-0578-11ee-b6df-2c4138b7dab1', 'mod back', 'Modificaciond esde el back', '2023-06-13 17:19:10', '2023-06-07 15:14:43', '3d472a7a-3087-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, NULL),
	('66ba12fc-10ba-11ee-ba60-3cd92b4d9bf4', 'asdasd', 'asdasd', '2023-06-21 17:05:39', '2023-06-21 17:05:39', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, NULL);
/*!40000 ALTER TABLE `TipoDependencias` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.TipoSolicitud
DROP TABLE IF EXISTS `TipoSolicitud`;
CREATE TABLE IF NOT EXISTS `TipoSolicitud` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `tipoSoli` varchar(50) NOT NULL,
  `creadoPor` char(36) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_TipoSolicitud_Usuarios` (`creadoPor`),
  CONSTRAINT `FK_TipoSolicitud_Usuarios` FOREIGN KEY (`creadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla TiCentral.TipoSolicitud: ~4 rows (aproximadamente)
DELETE FROM `TipoSolicitud`;
/*!40000 ALTER TABLE `TipoSolicitud` DISABLE KEYS */;
INSERT INTO `TipoSolicitud` (`id`, `tipoSoli`, `creadoPor`, `fechaCreacion`) VALUES
	('a5838dce-6c49-11ed-a880-040300000000', 'Alta', 'c18fc135-3a89-11ed-aed0-040300000000', '2022-11-24 15:45:08'),
	('ab75eb3e-6c49-11ed-a880-040300000000', 'Baja', 'c18fc135-3a89-11ed-aed0-040300000000', '2022-11-24 15:45:18'),
	('b6e59f3b-6c49-11ed-a880-040300000000', 'Modificacion', 'c18fc135-3a89-11ed-aed0-040300000000', '2022-11-24 15:45:37'),
	('c326ea8b-6c49-11ed-a880-040300000000', 'Vinculacion', 'c18fc135-3a89-11ed-aed0-040300000000', '2022-11-24 15:45:58');
/*!40000 ALTER TABLE `TipoSolicitud` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.TipoUsuario
DROP TABLE IF EXISTS `TipoUsuario`;
CREATE TABLE IF NOT EXISTS `TipoUsuario` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tipo de Usuario central\r\n';

-- Volcando datos para la tabla TiCentral.TipoUsuario: ~3 rows (aproximadamente)
DELETE FROM `TipoUsuario`;
/*!40000 ALTER TABLE `TipoUsuario` DISABLE KEYS */;
INSERT INTO `TipoUsuario` (`Id`, `Nombre`, `Descripcion`) VALUES
	('b055eb06-6438-11ed-a880-040300000000', 'AdminGeneral', 'Administración General'),
	('b055ed42-6438-11ed-a880-040300000000', 'AdminPlataforma', 'Administración de la plataforma'),
	('b055eea8-6438-11ed-a880-040300000000', 'User', 'Usuario');
/*!40000 ALTER TABLE `TipoUsuario` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.UResponsable
DROP TABLE IF EXISTS `UResponsable`;
CREATE TABLE IF NOT EXISTS `UResponsable` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `Clave` varchar(10) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de las unidades Responsable';

-- Volcando datos para la tabla TiCentral.UResponsable: ~1,096 rows (aproximadamente)
DELETE FROM `UResponsable`;
/*!40000 ALTER TABLE `UResponsable` DISABLE KEYS */;
INSERT INTO `UResponsable` (`Id`, `Clave`, `Descripcion`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Deleted`) VALUES
	('07f8b234-10b4-11ee-ba60-3cd92b4d9bf4', 'prueba01', 'prueba front', '2023-06-21 16:20:03', '2023-06-21 16:20:03', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('1e8457d8-047e-11ee-b6df-2c4138b7dab1', 'XDD', 'PRB modificacion front', '2023-06-21 12:47:47', '2023-06-06 09:23:41', '3d472a7a-3087-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 1),
	('2a50dd9c-a7d7-11ed-b719-2c4138b7dab1', '0001', 'MIGRACIÓN Y SERVICIO GENL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e065-a7d7-11ed-b719-2c4138b7dab1', '0002', 'DESPACHO DEL C. GOBERNADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e16b-a7d7-11ed-b719-2c4138b7dab1', '0004', 'SECRETARÍA PARTICULAR DEL GOBERNADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e208-a7d7-11ed-b719-2c4138b7dab1', '0005', 'REPRESENTACIÓN DEL GOBIERNO DEL ESTADO DE NUEVO LEÓN EN LA CIUDAD DE MÉXICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e293-a7d7-11ed-b719-2c4138b7dab1', '0010', 'OFICINA DEL C. SECRETARIO GENERAL DE GOBIERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e537-a7d7-11ed-b719-2c4138b7dab1', '0011', 'UNIDAD DE ENLACE ADMINISTRATIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e5dc-a7d7-11ed-b719-2c4138b7dab1', '0013', 'DIRECCIÓN DE INFORMATEL Y LOCATEL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e673-a7d7-11ed-b719-2c4138b7dab1', '0016', 'COORDINACIÓN EJECUTIVA DEL FONDO DE APORTACIONES PARA  LA SEGURIDAD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e6f6-a7d7-11ed-b719-2c4138b7dab1', '0017', 'COORDINACIÓN GENERAL DE COMUNICACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e772-a7d7-11ed-b719-2c4138b7dab1', '0018', 'DIRECCIÓN DE ENLACE Y PRENSA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e7ef-a7d7-11ed-b719-2c4138b7dab1', '0019', 'DIRECCIÓN DE TELEVISIÓN ESTATAL Y RADIO NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e86e-a7d7-11ed-b719-2c4138b7dab1', '0020', 'CENTRO DE INFORMACIÓN PARA LA SEGURIDAD DE ESTADO', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e93c-a7d7-11ed-b719-2c4138b7dab1', '0021', 'DIRECCIÓN GENERAL DE LA COMISIÓN EJECUTIVA PARA LA REFORMA DEL SISTEMA DE JUSTICIA PENAL DEL ESTADO DE NUEVO LEÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50e9df-a7d7-11ed-b719-2c4138b7dab1', '0022', 'OFICINA DEL C. SECRETARIO EJECUTIVO DEL CONSEJO DE COORDINACIÓN DEL SISTEMA INTEGRAL DE SEGURIDAD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50ea5e-a7d7-11ed-b719-2c4138b7dab1', '0023', 'SUBSECRETARÍA DE GOBIERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50eada-a7d7-11ed-b719-2c4138b7dab1', '0024', 'DIRECCIÓN DE GOBIERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50eb52-a7d7-11ed-b719-2c4138b7dab1', '0025', 'DIRECCIÓN DE ASUNTOS AGRARIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50ebd3-a7d7-11ed-b719-2c4138b7dab1', '0026', 'DIRECCIÓN DE RELACIONES CON PODERES LEGISLATIVOS E INSTITUCIONES POLÍTICAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50ec4c-a7d7-11ed-b719-2c4138b7dab1', '0027', 'SUBSECRETARÍA DE DESARROLLO POLÍTICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50ee70-a7d7-11ed-b719-2c4138b7dab1', '0028', 'DIRECCIÓN DE DESARROLLO POLÍTICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50ef11-a7d7-11ed-b719-2c4138b7dab1', '0029', 'DIRECCIÓN DE PARTICIPACIÓN CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50ef8c-a7d7-11ed-b719-2c4138b7dab1', '0030', 'DIRECCIÓN DE FORMACIÓN CÍVICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f008-a7d7-11ed-b719-2c4138b7dab1', '0032', 'SUBSECRETARÍA DE ASUNTOS JURÍDICOS Y ATENCIÓN CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f085-a7d7-11ed-b719-2c4138b7dab1', '0033', 'DIRECCIÓN DEL ARCHIVO GENERAL DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f0fe-a7d7-11ed-b719-2c4138b7dab1', '0034', 'DIRECCIÓN DEL ARCHIVO GENERAL DE NOTARÍAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f178-a7d7-11ed-b719-2c4138b7dab1', '0035', 'DIRECCIÓN GENERAL DEL REGISTRO CIVIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f1f1-a7d7-11ed-b719-2c4138b7dab1', '0036', 'DIRECCIÓN DE ASUNTOS RELIGIOSOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f270-a7d7-11ed-b719-2c4138b7dab1', '0037', 'COORDINACIÓN GENERAL DE ASUNTOS JURÍDICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f2e4-a7d7-11ed-b719-2c4138b7dab1', '0040', 'UNIDAD DE LEGALIZACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f35a-a7d7-11ed-b719-2c4138b7dab1', '0041', 'DIRECCIÓN DE PROTECCIÓN CIVIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f3d4-a7d7-11ed-b719-2c4138b7dab1', '0043', 'COORDINACIÓN DE DESARROLLO Y FORTALECIMIENTO MUNICIPAL', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f46b-a7d7-11ed-b719-2c4138b7dab1', '0046', 'COMISIÓN EJECUTIVA ESTATAL DE ATENCIÓN A VÍCTIMAS', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f4fd-a7d7-11ed-b719-2c4138b7dab1', '0047', 'OFICINA DEL C. SECRETARIO DE SEGURIDAD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f579-a7d7-11ed-b719-2c4138b7dab1', '0048', 'COMISIÓN DE HONOR Y JUSTICIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f5f3-a7d7-11ed-b719-2c4138b7dab1', '0050', 'COMISARÍA DE PROTECCIÓN INSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f730-a7d7-11ed-b719-2c4138b7dab1', '0053', 'DIRECCIÓN DE PLANEACIÓN ESTRATÉGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f7c5-a7d7-11ed-b719-2c4138b7dab1', '0058', 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f83c-a7d7-11ed-b719-2c4138b7dab1', '0059', 'DIRECCIÓN DE RECURSOS MATERIALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f8b3-a7d7-11ed-b719-2c4138b7dab1', '0060', 'DIRECCIÓN DE RECURSOS HUMANOS Y FINANCIEROS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f933-a7d7-11ed-b719-2c4138b7dab1', '0062', 'DIRECCIÓN GENERAL JURÍDICA Y DE DERECHOS HUMANOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50f9af-a7d7-11ed-b719-2c4138b7dab1', '0063', 'SUBSECRETARÍA DE PREVENCIÓN Y PARTICIPACIÓN CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fa25-a7d7-11ed-b719-2c4138b7dab1', '0065', 'DIRECCIÓN DE ATENCIÓN INTEGRAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fa9e-a7d7-11ed-b719-2c4138b7dab1', '0067', 'AGENCIA DE ADMINISTRACIÓN PENITENCIARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fb19-a7d7-11ed-b719-2c4138b7dab1', '0068', 'DIRECCIÓN DE REINSERCIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fb93-a7d7-11ed-b719-2c4138b7dab1', '0069', 'CENTRO DE REINSERCIÓN SOCIAL NÚMERO 2 NORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fc0d-a7d7-11ed-b719-2c4138b7dab1', '0070', 'CENTRO DE REINSERCIÓN SOCIAL NÚMERO 1 NORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fc88-a7d7-11ed-b719-2c4138b7dab1', '0071', 'CENTRO DE REINSERCIÓN SOCIAL NÚMERO 3 ORIENTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fd0c-a7d7-11ed-b719-2c4138b7dab1', '0072', 'CENTRO DE INTERNAMIENTO Y DE ADAPTACIÓN DE ADOLESCENTES INFRACTORES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fd85-a7d7-11ed-b719-2c4138b7dab1', '0074', 'COMISARÍA DE LA POLICÍA PROCESAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fdf8-a7d7-11ed-b719-2c4138b7dab1', '0078', 'COMISARÍA DE CUSTODIA Y ESCOLTAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50fe6c-a7d7-11ed-b719-2c4138b7dab1', '0079', 'COMISARÍA DE VIGILANCIA INSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50feee-a7d7-11ed-b719-2c4138b7dab1', '0080', 'DIRECCIÓN GENERAL DEL CENTRO DE COORDINACIÓN INTEGRAL DE CONTROL', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a50ff8a-a7d7-11ed-b719-2c4138b7dab1', '0081', 'INSTITUCIÓN POLICIAL ESTATAL FUERZA CIVIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51000a-a7d7-11ed-b719-2c4138b7dab1', '0082', 'DESPACHO DEL C. PROCURADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510156-a7d7-11ed-b719-2c4138b7dab1', '0083', 'VISITADURÍA GENERAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5101e7-a7d7-11ed-b719-2c4138b7dab1', '0084', 'DIRECCIÓN GENERAL JURÍDICA Y DE AGENTES DEL MINISTERIO PÚBLICO AUXILIARES DEL PROCURADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510261-a7d7-11ed-b719-2c4138b7dab1', '0085', 'OFICINA EJECUTIVA DEL PROCURADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5102db-a7d7-11ed-b719-2c4138b7dab1', '0087', 'UNIDAD ESPECIALIZADA ANTISECUESTROS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510352-a7d7-11ed-b719-2c4138b7dab1', '0088', 'CENTRO DE EVALUACIÓN Y CONTROL DE CONFIANZA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5103ca-a7d7-11ed-b719-2c4138b7dab1', '0089', 'DIRECCIÓN DE TRANSPARENCIA', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51045e-a7d7-11ed-b719-2c4138b7dab1', '0090', 'SUBPROCURADURÍA DEL MINISTERIO PÚBLICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5104d7-a7d7-11ed-b719-2c4138b7dab1', '0091', 'FISCALÍA REGIONAL NORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51054f-a7d7-11ed-b719-2c4138b7dab1', '0101', 'FISCALÍA REGIONAL CENTRO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5105cd-a7d7-11ed-b719-2c4138b7dab1', '0112', 'DIRECCIÓN GENERAL DE LAS FISCALÍAS INVESTIGADORAS', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510657-a7d7-11ed-b719-2c4138b7dab1', '0114', 'DIRECCIÓN DE BIENES ASEGURADOS', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5106e9-a7d7-11ed-b719-2c4138b7dab1', '0115', 'FISCALÍA ESPECIALIZADA EN OPERACIONES ESTRATÉGICAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51075f-a7d7-11ed-b719-2c4138b7dab1', '0116', 'SUBPROCURADURÍA JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5107db-a7d7-11ed-b719-2c4138b7dab1', '0118', 'DIRECCIÓN CONSULTIVA Y ANÁLISIS JURÍDICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510853-a7d7-11ed-b719-2c4138b7dab1', '0120', 'INSTITUTO DE FORMACIÓN PROFESIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5108c7-a7d7-11ed-b719-2c4138b7dab1', '0121', 'AGENCIA ESTATAL DE INVESTIGACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51093f-a7d7-11ed-b719-2c4138b7dab1', '0122', 'DIRECCIÓN DE ANÁLISIS E INFORMACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5109be-a7d7-11ed-b719-2c4138b7dab1', '0124', 'DIRECCIÓN OPERATIVA Y DESPLIEGUE TERRITORIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510b10-a7d7-11ed-b719-2c4138b7dab1', '0128', 'INSTITUTO CRIMINALÍSTA Y SERVICIOS PERICIALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510b91-a7d7-11ed-b719-2c4138b7dab1', '0129', 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510c06-a7d7-11ed-b719-2c4138b7dab1', '0131', 'DIRECCIÓN DE INFORMÁTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510c7f-a7d7-11ed-b719-2c4138b7dab1', '0132', 'DIRECCIÓN DE RECURSOS FINANCIEROS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510cf9-a7d7-11ed-b719-2c4138b7dab1', '0133', 'FISCALÍA ESPECIALIZADA DE ATENCIÓN A LA MUJER\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510d6d-a7d7-11ed-b719-2c4138b7dab1', '0136', 'DIRECCIÓN DE ORIENTACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510ec5-a7d7-11ed-b719-2c4138b7dab1', '0137', 'DIRECCIÓN GENERAL DE ASESORES DEL PROCURADOR EN POLÍTICAS PÚBLICAS Y RELACIONES INTERINSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a510f6c-a7d7-11ed-b719-2c4138b7dab1', '0139', 'DIRECCIÓN DE ASESORÍA MULTIDISCIPLINARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51162e-a7d7-11ed-b719-2c4138b7dab1', '0140', 'OFICINA DEL C. SECRETARIO DE FINANZAS Y TESORERO GENERAL DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5116f3-a7d7-11ed-b719-2c4138b7dab1', '0141', 'PROCURADURÍA FISCAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511788-a7d7-11ed-b719-2c4138b7dab1', '0143', 'UNIDAD DE FOMENTO A LA INVERSIÓN Y AL FINANCIAMIENTO DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511817-a7d7-11ed-b719-2c4138b7dab1', '0144', 'UNIDAD DE INFORMACIÓN FINANCIERA Y SEGUIMIENTO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511899-a7d7-11ed-b719-2c4138b7dab1', '0147', 'DIRECCIÓN DE DEUDA PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511914-a7d7-11ed-b719-2c4138b7dab1', '0153', 'DIRECCIÓN DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51198f-a7d7-11ed-b719-2c4138b7dab1', '0155', 'DIRECCIÓN DE PATRIMONIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511a0f-a7d7-11ed-b719-2c4138b7dab1', '0159', 'SUBSECRETARÍA DE TECNOLOGÍAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511a89-a7d7-11ed-b719-2c4138b7dab1', '0162', 'SUBSECRETARÍA DE EGRESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511b05-a7d7-11ed-b719-2c4138b7dab1', '0163', 'DIRECCIÓN DE ADMINISTRACIÓN FINANCIERA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511b83-a7d7-11ed-b719-2c4138b7dab1', '0165', 'DIRECCIÓN DE CONTABILIDAD Y CUENTA PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511c05-a7d7-11ed-b719-2c4138b7dab1', '0166', 'DIRECCIÓN DE PRESUPUESTO Y CONTROL PRESUPUESTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511c86-a7d7-11ed-b719-2c4138b7dab1', '0167', 'DIRECCIÓN DE ATENCIÓN A MUNICIPIOS Y ORGANISMOS PARAESTATALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511d0d-a7d7-11ed-b719-2c4138b7dab1', '0168', 'DIRECCIÓN DEL CENTRO DE SERVICIOS COMPARTIDOS Y ATENCIÓN A ORGANISMOS PARAESTATALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511e66-a7d7-11ed-b719-2c4138b7dab1', '0169', 'SUBSECRETARÍA DE INGRESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511efa-a7d7-11ed-b719-2c4138b7dab1', '0170', 'COORDINACIÓN DE PLANEACIÓN HACENDARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511f78-a7d7-11ed-b719-2c4138b7dab1', '0171', 'DIRECCIÓN DE CRÉDITOS Y COBRANZAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a511ff0-a7d7-11ed-b719-2c4138b7dab1', '0172', 'DIRECCIÓN DE FISCALIZACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512068-a7d7-11ed-b719-2c4138b7dab1', '0173', 'DIRECCIÓN DE RECAUDACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5120e7-a7d7-11ed-b719-2c4138b7dab1', '0174', 'COORDINACIÓN GENERAL DE INGRESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512162-a7d7-11ed-b719-2c4138b7dab1', '0175', 'DIRECCIÓN DE COMERCIO EXTERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5121de-a7d7-11ed-b719-2c4138b7dab1', '0176', 'OFICINA DEL C. SECRETARIO DE EDUCACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51225b-a7d7-11ed-b719-2c4138b7dab1', '0184', 'DIRECCIÓN DE RECURSOS MATERIALES Y SERVICIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5122db-a7d7-11ed-b719-2c4138b7dab1', '0185', 'COORDINACIÓN DE UNIDADES REGIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512355-a7d7-11ed-b719-2c4138b7dab1', '0186', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5123cf-a7d7-11ed-b719-2c4138b7dab1', '0188', 'CENTRO ESTATAL DE BECAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51244b-a7d7-11ed-b719-2c4138b7dab1', '0190', 'COORDINACIÓN DEL INSTITUTO DE SALUD MENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5124cb-a7d7-11ed-b719-2c4138b7dab1', '0191', 'SUBSECRETARÍA DE PLANEACIÓN Y FINANZAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512545-a7d7-11ed-b719-2c4138b7dab1', '0192', 'DIRECCIÓN DE SELECCIÓN Y CONTRATACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5125bf-a7d7-11ed-b719-2c4138b7dab1', '0193', 'DIRECCIÓN DE NÓMINAS Y PRESTACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512639-a7d7-11ed-b719-2c4138b7dab1', '0194', 'SUELDOS Y PRESTACIONES MAGISTERIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5126b6-a7d7-11ed-b719-2c4138b7dab1', '0195', 'ESCUELA NORMAL SUPERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5127e3-a7d7-11ed-b719-2c4138b7dab1', '0196', 'DIRECCIÓN DE RELACIONES LABORALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51287a-a7d7-11ed-b719-2c4138b7dab1', '0197', 'SUBSECRETARÍA DE EDUCACIÓN BÁSICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5128f3-a7d7-11ed-b719-2c4138b7dab1', '0198', 'COORDINACIÓN DE IDIOMAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512974-a7d7-11ed-b719-2c4138b7dab1', '0199', 'COORDINACIÓN DE TECNOLOGÍA EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5129ef-a7d7-11ed-b719-2c4138b7dab1', '0200', 'DIRECCIÓN DE EDUCACIÓN INICIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512a69-a7d7-11ed-b719-2c4138b7dab1', '0201', 'DIRECCIÓN DE EDUCACIÓN PREESCOLAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512ae3-a7d7-11ed-b719-2c4138b7dab1', '0202', 'DIRECCIÓN DE EDUCACIÓN PRIMARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512b61-a7d7-11ed-b719-2c4138b7dab1', '0203', 'DIRECCIÓN DE EDUCACIÓN SECUNDARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512bdc-a7d7-11ed-b719-2c4138b7dab1', '0204', 'DIRECCIÓN DE EDUCACIÓN FÍSICA Y DEPORTES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512d9f-a7d7-11ed-b719-2c4138b7dab1', '0205', 'DIRECCIÓN DE EDUCACIÓN EXTRAESCOLAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512e35-a7d7-11ed-b719-2c4138b7dab1', '0206', 'SUBSECRETARÍA DE DESARROLLO MAGISTERIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512ebb-a7d7-11ed-b719-2c4138b7dab1', '0207', 'COORDINACIÓN DEL SISTEMA ESTATAL DE EDUCACIÓN PARA ADULTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512f3a-a7d7-11ed-b719-2c4138b7dab1', '0208', 'DIRECCIÓN DE INSTITUCIONES FORMADORAS DE DOCENTES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a512fbd-a7d7-11ed-b719-2c4138b7dab1', '0209', 'DIRECCIÓN DE CENTROS DE CAPACITACIÓN DEL MAGISTERIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513038-a7d7-11ed-b719-2c4138b7dab1', '0210', 'DIRECCIÓN DE CARRERA MAGISTERIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5130bd-a7d7-11ed-b719-2c4138b7dab1', '0211', 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513225-a7d7-11ed-b719-2c4138b7dab1', '0212', 'DIRECCIÓN GENERAL DE PLANEACIÓN Y COORDINACIÓN EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5132b1-a7d7-11ed-b719-2c4138b7dab1', '0213', 'SUBSECRETARÍA DE EDUCACIÓN MEDIA SUPERIOR Y SUPERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51332d-a7d7-11ed-b719-2c4138b7dab1', '0215', 'DIRECCIÓN DE EDUCACIÓN SUPERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5133ac-a7d7-11ed-b719-2c4138b7dab1', '0216', 'DIRECCIÓN DE EDUCACIÓN MEDIA SUPERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513427-a7d7-11ed-b719-2c4138b7dab1', '0217', 'DIRECCIÓN DE ACREDITACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5134c6-a7d7-11ed-b719-2c4138b7dab1', '0218', 'OFICINA DEL C. SECRETARIO DE SALUD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513545-a7d7-11ed-b719-2c4138b7dab1', '0221', 'DIRECCIÓN DE SALUD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5135c9-a7d7-11ed-b719-2c4138b7dab1', '0222', 'DIRECCIÓN DE SALUD MENTAL Y ADICCIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51364a-a7d7-11ed-b719-2c4138b7dab1', '0224', 'SUBSECRETARÍA DE PREVENCIÓN Y CONTROL DE ENFERMEDADES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5136c9-a7d7-11ed-b719-2c4138b7dab1', '0225', 'SUBSECRETARÍA DE REGULACIÓN Y FOMENTO SANITARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513743-a7d7-11ed-b719-2c4138b7dab1', '0226', 'DIRECCIÓN DE CONTROL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5137c2-a7d7-11ed-b719-2c4138b7dab1', '0227', 'DIRECCIÓN DE FOMENTO Y CALIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513840-a7d7-11ed-b719-2c4138b7dab1', '0228', 'COMISIÓN ESTATAL DE ARBITRAJE MÉDICO (COESAMED)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5138bb-a7d7-11ed-b719-2c4138b7dab1', '0229', 'CENTRO DE ESPECIALIDADES DENTALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5139d0-a7d7-11ed-b719-2c4138b7dab1', '0231', 'OFICINA DEL C. SECRETARIO DE ECONOMÍA Y TRABAJO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513a5c-a7d7-11ed-b719-2c4138b7dab1', '0236', 'DIRECCIÓN GENERAL JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513c22-a7d7-11ed-b719-2c4138b7dab1', '0238', 'SUBSECRETARÍA DE INDUSTRIA', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513ccd-a7d7-11ed-b719-2c4138b7dab1', '0239', 'DIRECCIÓN DE CADENAS PRODUCTIVAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513d50-a7d7-11ed-b719-2c4138b7dab1', '0240', 'DIRECCIÓN DE FONDOS DE FOMENTO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513dd5-a7d7-11ed-b719-2c4138b7dab1', '0243', 'SUBSECRETARÍA DE INVERSIÓN Y FOMENTO INDUSTRIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513e53-a7d7-11ed-b719-2c4138b7dab1', '0244', 'DIRECCIÓN DE INVERSIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513ed1-a7d7-11ed-b719-2c4138b7dab1', '0245', 'DIRECCIÓN DE APOYO Y FOMENTO A PYMES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513f4e-a7d7-11ed-b719-2c4138b7dab1', '0246', 'SUBSECRETARÍA DE DESARROLLO REGIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a513fcd-a7d7-11ed-b719-2c4138b7dab1', '0247', 'DIRECCIÓN DE INFRAESTRUCTURA Y COMUNIDADES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514049-a7d7-11ed-b719-2c4138b7dab1', '0248', 'DIRECCIÓN DE DESARROLLO EMPRESARIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5140c5-a7d7-11ed-b719-2c4138b7dab1', '0249', 'SUBSECRETARÍA DE COMPETITIVIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514140-a7d7-11ed-b719-2c4138b7dab1', '0254', 'SECRETARÍA TÉCNICA DE ECONOMÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5141c4-a7d7-11ed-b719-2c4138b7dab1', '0255', 'OFICINA DEL C. SECRETARIO DE INFRAESTRUCTURA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514241-a7d7-11ed-b719-2c4138b7dab1', '0256', 'DIRECCIÓN DE TRANSPARENCIA Y NORMATIVIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5142bc-a7d7-11ed-b719-2c4138b7dab1', '0258', 'SUBSECRETARÍA DE CONSTRUCCIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514335-a7d7-11ed-b719-2c4138b7dab1', '0259', 'DIRECCIÓN DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5143b3-a7d7-11ed-b719-2c4138b7dab1', '0260', 'DIRECCIÓN DE EDIFICACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514430-a7d7-11ed-b719-2c4138b7dab1', '0261', 'DIRECCIÓN DE OBRAS ESPECIALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5145af-a7d7-11ed-b719-2c4138b7dab1', '0262', 'SUBSECRETARÍA DE PLANEACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514634-a7d7-11ed-b719-2c4138b7dab1', '0263', 'DIRECCIÓN DE BIENESTAR CIUDADANO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5146b4-a7d7-11ed-b719-2c4138b7dab1', '0264', 'DIRECCIÓN DE LICITACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514733-a7d7-11ed-b719-2c4138b7dab1', '0265', 'UNIDAD DE ENLACE ADMINISTRATIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5147af-a7d7-11ed-b719-2c4138b7dab1', '0266', 'OFICINA DEL C. CONTRALOR INTERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514826-a7d7-11ed-b719-2c4138b7dab1', '0267', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5148a4-a7d7-11ed-b719-2c4138b7dab1', '0268', 'DIRECCIÓN ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514922-a7d7-11ed-b719-2c4138b7dab1', '0269', 'DIRECCIÓN DE TRANSPARENCIA GUBERNAMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5149a0-a7d7-11ed-b719-2c4138b7dab1', '0271', 'DIRECCIÓN DE ÓRGANOS  INTERNOS DE CONTROL Y VIGILANCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514a1a-a7d7-11ed-b719-2c4138b7dab1', '0273', 'UNIDAD ANTICORRUPCIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514a9d-a7d7-11ed-b719-2c4138b7dab1', '0275', 'DIRECCIÓN DE CONTROL Y AUDITORÍA DEL SECTOR CENTRAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514bd0-a7d7-11ed-b719-2c4138b7dab1', '0276', 'DIRECCIÓN DE CONTROL Y AUDITORÍA DEL SECTOR PARAESTATAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514c70-a7d7-11ed-b719-2c4138b7dab1', '0279', 'DIRECCIÓN DE CONTROL Y AUDITORÍA DE OBRA PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514cf0-a7d7-11ed-b719-2c4138b7dab1', '0282', 'OFICINA DEL C. SECRETARIO DE DESARROLLO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514d76-a7d7-11ed-b719-2c4138b7dab1', '0286', 'DIRECCIÓN DEL CENTRO DE COLABORACIÓN GEOESPACIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514dee-a7d7-11ed-b719-2c4138b7dab1', '0288', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514f4f-a7d7-11ed-b719-2c4138b7dab1', '0289', 'SUBSECRETARÍA DE DESARROLLO URBANO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a514fd7-a7d7-11ed-b719-2c4138b7dab1', '0291', 'DIRECCIÓN DE PLANEACIÓN Y ORDENAMIENTO TERRITORIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51505f-a7d7-11ed-b719-2c4138b7dab1', '0292', 'OFICINA DEL C. SECRETARIO DE DESARROLLO SUSTENTABLE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5150e5-a7d7-11ed-b719-2c4138b7dab1', '0294', 'SUBSECRETARÍA DE PROTECCIÓN AL MEDIO AMBIENTE Y RECURSOS NATURALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515164-a7d7-11ed-b719-2c4138b7dab1', '0298', 'OFICINA DEL C. SECRETARIO DE DESARROLLO SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5151e0-a7d7-11ed-b719-2c4138b7dab1', '0302', 'DIRECCIÓN DE ATENCIÓN A GRUPOS VULNERABLES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515261-a7d7-11ed-b719-2c4138b7dab1', '0304', 'DIRECCIÓN DE CENTROS COMUNITARIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5152e1-a7d7-11ed-b719-2c4138b7dab1', '0305', 'JUNTA DE BENEFICENCIA PRIVADA DEL ESTADO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51535e-a7d7-11ed-b719-2c4138b7dab1', '0306', 'OFICINA DEL C. SECRETARIO DEL TRABAJO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5153dc-a7d7-11ed-b719-2c4138b7dab1', '0307', 'UNIDAD DE ENLACE DE ADMINISTRACIÓN Y FINANZAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51545d-a7d7-11ed-b719-2c4138b7dab1', '0308', 'DIRECCIÓN DE CAPACITACIÓN Y CERTIFICACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5154d9-a7d7-11ed-b719-2c4138b7dab1', '0309', 'PROCURADURÍA DE LA DEFENSA DEL TRABAJO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515555-a7d7-11ed-b719-2c4138b7dab1', '0310', 'DIRECCIÓN DE SERVICIO ESTATAL DEL EMPLEO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5155d1-a7d7-11ed-b719-2c4138b7dab1', '0311', 'DIRECCIÓN DE INSPECCIÓN Y DEFENSA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515651-a7d7-11ed-b719-2c4138b7dab1', '0314', 'JUNTA LOCAL DE CONCILIACIÓN Y ARBITRAJE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5156ca-a7d7-11ed-b719-2c4138b7dab1', '0315', 'TRIBUNAL DE ARBITRAJE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515746-a7d7-11ed-b719-2c4138b7dab1', '0316', 'TRIBUNAL DE JUSTICIA ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5157bd-a7d7-11ed-b719-2c4138b7dab1', '0317', 'H. CONGRESO DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515911-a7d7-11ed-b719-2c4138b7dab1', '0318', 'AUDITORÍA SUPERIOR DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51598b-a7d7-11ed-b719-2c4138b7dab1', '0319', 'PODER JUDICIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515a09-a7d7-11ed-b719-2c4138b7dab1', '0320', 'UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN (UANL)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515a88-a7d7-11ed-b719-2c4138b7dab1', '0321', 'COMISIÓN ESTATAL DE LOS DERECHOS HUMANOS (CEDH)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515b12-a7d7-11ed-b719-2c4138b7dab1', '0322', 'COMISIÓN DE TRANSPARENCIA Y ACCESO A LA INFORMACIÓN PÚBLICA DEL ESTADO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515b93-a7d7-11ed-b719-2c4138b7dab1', '0323', 'COMISIÓN ESTATAL ELECTORAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515d34-a7d7-11ed-b719-2c4138b7dab1', '0324', 'TRIBUNAL ELECTORAL DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515dc3-a7d7-11ed-b719-2c4138b7dab1', '0325', 'HOSPITAL UNIVERSITARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515e3f-a7d7-11ed-b719-2c4138b7dab1', '0326', 'SERVICIOS DE SALUD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515ebf-a7d7-11ed-b719-2c4138b7dab1', '0327', 'SISTEMA PARA EL DESARROLLO INTEGRAL DE LA FAMILIA (DIF)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515f42-a7d7-11ed-b719-2c4138b7dab1', '0328', 'COLEGIO DE ESTUDIOS CIENTÍFICOS Y TENOLÓGICOS (CECYTE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a515fc2-a7d7-11ed-b719-2c4138b7dab1', '0329', 'FIDEICOMISO VIDA SILVESTRE DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516043-a7d7-11ed-b719-2c4138b7dab1', '0330', 'MUSEO DE HISTORIA MEXICANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5160c7-a7d7-11ed-b719-2c4138b7dab1', '0331', 'CONSEJO PARA LA CULTURA Y LAS ARTES (CONARTE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516141-a7d7-11ed-b719-2c4138b7dab1', '0332', 'SISTEMA DE CAMINOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5162f1-a7d7-11ed-b719-2c4138b7dab1', '0333', 'CONSEJO ESTATAL DEL TRANSPORTE (CET)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51638d-a7d7-11ed-b719-2c4138b7dab1', '0334', 'FIDEICOMISO PARA LA REORDENACIÓN COMERCIAL (FIRECOM)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51640d-a7d7-11ed-b719-2c4138b7dab1', '0335', 'FIDEICOMISO TURISMO NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51648c-a7d7-11ed-b719-2c4138b7dab1', '0336', 'FID. FONDO ESTATAL FOMENTO Y ACTIVIDADES AGROPEC. FORESTALES', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51652c-a7d7-11ed-b719-2c4138b7dab1', '0337', 'INSTITUTO DE CAPACITACIÓN Y EDUCACIÓN PARA EL TRABAJO (ICET)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5165b4-a7d7-11ed-b719-2c4138b7dab1', '0338', 'UNIVERSIDAD TECNOLÓGICA GRAL. MARIANO ESCOBEDO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516639-a7d7-11ed-b719-2c4138b7dab1', '0340', 'COLEGIO DE EDUCACIÓN PROFESIONAL TÉCNICA DE NUEVO LEÓN (CONALEP)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5166b9-a7d7-11ed-b719-2c4138b7dab1', '0341', 'INSTITUTO CONSTRUCTOR DE INFRAESTRUCTURA FISICA', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516754-a7d7-11ed-b719-2c4138b7dab1', '0343', 'UNIVERSIDAD TECNOLÓGICA SANTA CATARINA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5167db-a7d7-11ed-b719-2c4138b7dab1', '0344', 'UNIDAD DE INTEGRACIÓN EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51685e-a7d7-11ed-b719-2c4138b7dab1', '0345', 'FIDEICOMISO SISTEMA INTEGRAL DE TRÁNSITO METROPOLITANO (SINTRAM)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5168db-a7d7-11ed-b719-2c4138b7dab1', '0346', 'UNIVERSIDAD TECNOLÓGICA CADEREYTA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516957-a7d7-11ed-b719-2c4138b7dab1', '0347', 'UNIVERSIDAD TECNOLÓGICA LINARES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5169df-a7d7-11ed-b719-2c4138b7dab1', '0349', 'CORPORACIÓN PARA EL DESARROLLO TURÍSTICO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516a5f-a7d7-11ed-b719-2c4138b7dab1', '0350', 'INSTITUTO ESTATAL DE LAS MUJERES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516add-a7d7-11ed-b719-2c4138b7dab1', '0351', 'INSTITUTO ESTATAL DE CULTURA FÍSICA Y DEPORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516c14-a7d7-11ed-b719-2c4138b7dab1', '0352', 'INSTITUTO ESTATAL DE LA JUVENTUD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516cb7-a7d7-11ed-b719-2c4138b7dab1', '0353', 'AGENCIA RACIONALIZACIÓN Y MODERNIZACIÓN SISTEMA DE TRANSPORTE PÚBLICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516d3c-a7d7-11ed-b719-2c4138b7dab1', '0355', 'INSTITUTO DE INNOVACIÓN Y TRANSFERENCIA DE TECNOLOGÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516dbe-a7d7-11ed-b719-2c4138b7dab1', '0358', 'FIDEICOMISO PARA EL DESARROLLO DE LA ZONA CITRÍCOLA (FIDECITRUS)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516e3c-a7d7-11ed-b719-2c4138b7dab1', '0360', 'FIDEICOMISO FONDO EDITORIAL DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516ebe-a7d7-11ed-b719-2c4138b7dab1', '0361', 'PARQUES Y VIDA SILVESTRE DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516f44-a7d7-11ed-b719-2c4138b7dab1', '0363', 'CONSEJO ESTATAL PARA LA PROMOCIÓN DE VALORES Y CULTURA DE LA LEGALIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a516fc2-a7d7-11ed-b719-2c4138b7dab1', '0364', 'SERVICIOS DE AGUA Y DRENAJE DE MONTERREY\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517043-a7d7-11ed-b719-2c4138b7dab1', '0366', 'FIDEICOMISO FESTIVAL INTERNACIONAL DE SANTA LUCÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5170c3-a7d7-11ed-b719-2c4138b7dab1', '0369', 'INSTITUTO ESTATAL DE SEGURIDAD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517142-a7d7-11ed-b719-2c4138b7dab1', '0370', 'INSTITUTO DE DEFENSORIA PÚBLICA DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5171c0-a7d7-11ed-b719-2c4138b7dab1', '0371', 'UNIVERSIDAD POLITÉCNICA DE APODACA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517239-a7d7-11ed-b719-2c4138b7dab1', '0372', 'INSTITUTO DE CONTROL VEHICULAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5172c3-a7d7-11ed-b719-2c4138b7dab1', '0374', 'FIDEICOMISO PARA EL DESARROLLO DEL SUR DEL ESTADO DE NUEVO LEÓN (FIDESUR)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517341-a7d7-11ed-b719-2c4138b7dab1', '0375', 'INSTITUTO DE INVESTIGACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5173dd-a7d7-11ed-b719-2c4138b7dab1', '0376', 'INSTITUTO REGISTRAL Y CATASTRAL DEL ESTADO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517460-a7d7-11ed-b719-2c4138b7dab1', '0382', 'UNIVERSIDAD DE CIENCIAS DE LA SEGURIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5174de-a7d7-11ed-b719-2c4138b7dab1', '0388', 'FIDEICOMISO ELEVEMOS MEXICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51763f-a7d7-11ed-b719-2c4138b7dab1', '0389', 'FIDEICOMISO FONDO DE FOMENTO AGROPECUARIO (FOFAE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5176c3-a7d7-11ed-b719-2c4138b7dab1', '0390', 'FIDEICOMISO LINEA 3\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51774d-a7d7-11ed-b719-2c4138b7dab1', '0392', 'INSTITUTO DE SEGURIDAD Y SERVICIOS SOCIALES DE LOS TRABAJADORES DEL ESTADO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5177d3-a7d7-11ed-b719-2c4138b7dab1', '0393', 'FOMENTO METROPOLITANO DE MONTERREY (FOMERREY)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517852-a7d7-11ed-b719-2c4138b7dab1', '0395', 'SISTEMA DE TRANSPORTE COLECTIVO METRORREY\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5178cf-a7d7-11ed-b719-2c4138b7dab1', '0396', 'PROMOTORA DE DESARROLLO RURAL (PRODERLEON)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517946-a7d7-11ed-b719-2c4138b7dab1', '0397', 'PARQUE FUNDIDORA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5179ca-a7d7-11ed-b719-2c4138b7dab1', '0403', 'INSTITUTO DEL AGUA DEL ESTADO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517af9-a7d7-11ed-b719-2c4138b7dab1', '0407', 'FISCALÍA ESPECIALIZADA EN JUSTICIA PARA ADOLESCENTES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517ba2-a7d7-11ed-b719-2c4138b7dab1', '0415', 'OFICINA DEL C. COORDINADOR EJECUTIVO DE LA  ADMINISTRACIÓN PÚBLICA DEL ESTADO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517c28-a7d7-11ed-b719-2c4138b7dab1', '0417', 'SUBPROCURADURÍA ESPECIALIZADA EN COMBATE A LA CORRUPCIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517caa-a7d7-11ed-b719-2c4138b7dab1', '0418', 'FISCALÍA REGIONAL SUR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517d29-a7d7-11ed-b719-2c4138b7dab1', '0419', 'DIRECCIÓN DE INVESTIGACIÓN Y PROCESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517da3-a7d7-11ed-b719-2c4138b7dab1', '041B', 'CONSEJERÍA JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517e1e-a7d7-11ed-b719-2c4138b7dab1', '041D', 'SUBSECRETARÍA DE TRABAJO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517ea5-a7d7-11ed-b719-2c4138b7dab1', '041E', 'UNIDAD ESPECIALIZADA EN INTELIGENCIA PATRIMONIAL Y ECONÓMICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517f2c-a7d7-11ed-b719-2c4138b7dab1', '041F', 'DIRECCIÓN DE MECANISMOS ALTERNATIVOS DE SOLUCIÓN DE CONTROVERSIAS EN MATERIA PENAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a517fa9-a7d7-11ed-b719-2c4138b7dab1', '041I', 'UNIVERSIDAD POLITÉCNICA DE GARCÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51802b-a7d7-11ed-b719-2c4138b7dab1', '041J', 'OFICINA DEL C. SECRETARIO DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5180a9-a7d7-11ed-b719-2c4138b7dab1', '041K', 'SECRETARÍA TECNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518123-a7d7-11ed-b719-2c4138b7dab1', '041L', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51819e-a7d7-11ed-b719-2c4138b7dab1', '041N', 'COORDINACIÓN DE COMUNICACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518234-a7d7-11ed-b719-2c4138b7dab1', '041O', 'SUBSECRETARÍA DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5182ba-a7d7-11ed-b719-2c4138b7dab1', '041Q', 'DIRECCIÓN DE RECURSOS HUMANOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518339-a7d7-11ed-b719-2c4138b7dab1', '041S', 'DIRECCIÓN DE SISTEMAS GUBERNAMENTALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5183b9-a7d7-11ed-b719-2c4138b7dab1', '041T', 'DIRECCIÓN DE INFRAESTRUCTURA TECNOLÓGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5184cc-a7d7-11ed-b719-2c4138b7dab1', '041U', 'DIRECCIÓN GENERAL DE ADQUISICIONES Y SERVICIOS GENERALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51854e-a7d7-11ed-b719-2c4138b7dab1', '041V', 'DIRECCIÓN DE ADQUISICIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5185d0-a7d7-11ed-b719-2c4138b7dab1', '041W', 'DIRECCIÓN DE MANTENIMIENTO Y SERVICIOS GENERALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51864b-a7d7-11ed-b719-2c4138b7dab1', '041X', 'DIRECCIÓN DE CONCURSOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5186c8-a7d7-11ed-b719-2c4138b7dab1', '0425', 'RÉGIMEN DE PROTECCIÓN SOCIAL EN SALUD O.P.D.\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518745-a7d7-11ed-b719-2c4138b7dab1', '0426', 'AMAR A NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5187c2-a7d7-11ed-b719-2c4138b7dab1', '0427', 'DIRECCIÓN DE PLANEACIÓN Y PROGRAMACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51883f-a7d7-11ed-b719-2c4138b7dab1', '0428', 'DIRECCIÓN DE OBRAS VIALES Y SERVICIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5188be-a7d7-11ed-b719-2c4138b7dab1', '0429', 'DIRECCIÓN DE MAQUINARIA Y EQUIPO PESADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51893c-a7d7-11ed-b719-2c4138b7dab1', '042B', 'UNIVERSIDAD CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518b33-a7d7-11ed-b719-2c4138b7dab1', '042C', 'COLEGIO DE BACHILLERES MODALIDAD MILITARIZADA GRAL. MARIANO ESCOBEDO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518bce-a7d7-11ed-b719-2c4138b7dab1', '042F', 'PROCURADURÍA ESTATAL DE DESARROLLO SUSTENTABLE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518c53-a7d7-11ed-b719-2c4138b7dab1', '042G', 'DIRECCIÓN DE BIENESTAR Y SUSTENTABILIDAD ANIMAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518cd3-a7d7-11ed-b719-2c4138b7dab1', '042I', 'PROGRAMA ALIADOS CONTIGO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518d59-a7d7-11ed-b719-2c4138b7dab1', '042J', 'OFICINA DEL C. SECRETARIO DE DESARROLLO AGROPECUARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518dd4-a7d7-11ed-b719-2c4138b7dab1', '042K', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518e56-a7d7-11ed-b719-2c4138b7dab1', '042L', 'UNIDAD DE ENLACE INTERINSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518ed7-a7d7-11ed-b719-2c4138b7dab1', '042M', 'DIRECCIÓN DE FIDEICOMISOS Y PROYECTOS ESTRATÉGICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518f54-a7d7-11ed-b719-2c4138b7dab1', '042N', 'DIRECCIÓN DE FOMENTO AGROPECUARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a518fd2-a7d7-11ed-b719-2c4138b7dab1', '042O', 'DIRECCIÓN DE SEGURIDAD SANITARIA E INOCUIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519051-a7d7-11ed-b719-2c4138b7dab1', '042P', 'DIRECCIÓN DE FOMENTO RURAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5190d2-a7d7-11ed-b719-2c4138b7dab1', '042Q', 'DIRECCIÓN DE ORGANIZACIÓN DE PRODUCTORES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519154-a7d7-11ed-b719-2c4138b7dab1', '042R', 'DIRECCIÓN DE INFORMACIÓN SECTORIAL Y ESTADÍSTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5191d5-a7d7-11ed-b719-2c4138b7dab1', '042R', 'DIRECCIÓN DE INFORMACIÓN SECTORIAL Y ESTADÍSTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519252-a7d7-11ed-b719-2c4138b7dab1', '042S', 'SEGURIDAD GUBERNAMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5192cc-a7d7-11ed-b719-2c4138b7dab1', '042T', 'FIDEICOMISO ZARAGOZA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51934c-a7d7-11ed-b719-2c4138b7dab1', '042U', 'OPERADORA DE SERVICIOS TURÍSTICOS DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5193d0-a7d7-11ed-b719-2c4138b7dab1', '042V', 'FIDEICOMISO PROMOTOR DE PROYECTOS ESTRATÉGICOS URBANOS (FIDEPROES)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519457-a7d7-11ed-b719-2c4138b7dab1', '042W', 'FIDEICOMISO 71479 FONDO NUEVO LEÓN PARA LA PLANEACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5194e0-a7d7-11ed-b719-2c4138b7dab1', '042X', 'FID. PROGRAMA DE TECNOLOGÍAS EDUCATIVAS DE LA INFORMACIÓN PARA EL MAGISTERIO DE N.L.\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519561-a7d7-11ed-b719-2c4138b7dab1', '042Y', 'DIRECCIÓN DE FOMENTO ENERGÉTICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5195dd-a7d7-11ed-b719-2c4138b7dab1', '042Z', 'FIDEICOMISO DE TURISMO RURAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519660-a7d7-11ed-b719-2c4138b7dab1', '0430', 'FIDEICOMISO FONDO DE DESASTRES NATURALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5196e3-a7d7-11ed-b719-2c4138b7dab1', '0431', 'FIDEICOMISO EMPRESARIOS UNIDOS POR LA EDUCACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519763-a7d7-11ed-b719-2c4138b7dab1', '0432', 'FIDEICOMISO PROGRAMA ESCUELAS DE CALIDAD (PEC)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5197dc-a7d7-11ed-b719-2c4138b7dab1', '0433', 'FIDEVALLE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519864-a7d7-11ed-b719-2c4138b7dab1', '0434', 'FONDO DE GARANTÍA PARA LAS EMPRESAS EN SOLIDARIDAD DEL ESTADO DE N.L.\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5198e4-a7d7-11ed-b719-2c4138b7dab1', '0435', 'FIDEICOMISO MUSEO NACIONAL DE HISTORIA NATURAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519962-a7d7-11ed-b719-2c4138b7dab1', '0436', 'FIDEICOMISO SISTEMA DE JUSTICIA PENAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5199e2-a7d7-11ed-b719-2c4138b7dab1', '0437', 'FIDEICOMISO FONDO METROPOLITANO CIUDAD DE MONTERREY\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519a74-a7d7-11ed-b719-2c4138b7dab1', '0438', 'FIDEICOMISO FONDO DE APOYO PARA LA CREACIÓN Y CONSOLIDACIÓN DEL EMPLEO PRODUCTIVO EN EL ESTADO DE NUEVO LEÓN (FOCRECE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519af4-a7d7-11ed-b719-2c4138b7dab1', '0439', 'FIDEICOMISO DE MOVILIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519b6f-a7d7-11ed-b719-2c4138b7dab1', '043A', 'FID.PARA LA EDUCACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519c0b-a7d7-11ed-b719-2c4138b7dab1', '043B', 'COORDINACIÓN DE SERVICIO SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519c92-a7d7-11ed-b719-2c4138b7dab1', '043C', 'UNIDAD DE INVERSIONES DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519d11-a7d7-11ed-b719-2c4138b7dab1', '043D', 'ENLACE DE GESTIÓN ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519d95-a7d7-11ed-b719-2c4138b7dab1', '043E', 'CORPORACIÓN PARA EL DESARROLLO DE LA ZONA FRONTERIZA DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519e15-a7d7-11ed-b719-2c4138b7dab1', '043F', 'DIRECCIÓN DE INNOVACIÓN Y MEJORA CONTINUA DE PROCESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519e96-a7d7-11ed-b719-2c4138b7dab1', '043G', 'DIRECCIÓN GENERAL EJECUTIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519f16-a7d7-11ed-b719-2c4138b7dab1', '043H', 'COMISIÓN DE CARRERA POLICIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a519f8f-a7d7-11ed-b719-2c4138b7dab1', '043I', 'FIDEICOMISO LINEA 3\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a012-a7d7-11ed-b719-2c4138b7dab1', '043J', 'SISTEMA INTEGRAL PARA EL MANEJO ECOLÓGICO Y PROCESAMIENTO DE DESECHOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a095-a7d7-11ed-b719-2c4138b7dab1', '043K', 'CONSEJO CIUDADANO DE SEGURIDAD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a117-a7d7-11ed-b719-2c4138b7dab1', '043L', 'SERVICIOS DE SEGURIDAD E INTELIGENCIA DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a199-a7d7-11ed-b719-2c4138b7dab1', '043M', 'UNIDAD DE MEDIDAS CAUTELARES Y SUSPENSIÓN CONDICIONAL DEL PROCESO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a21f-a7d7-11ed-b719-2c4138b7dab1', '043N', 'DIRECCIÓN DE CONTROL Y SUPERVISIÓN A EMPRESAS Y SERVICIOS DE SEGURIDAD PRIVADA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a2a6-a7d7-11ed-b719-2c4138b7dab1', '043O', 'DIRECCIÓN DE RECLUTAMIENTO Y SELECCIÓN DE PERSONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a323-a7d7-11ed-b719-2c4138b7dab1', '043P', 'DIRECCIÓN DE CLUSTERS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a39d-a7d7-11ed-b719-2c4138b7dab1', '043Q', 'DIRECCIÓN DE ENLACE MUNICIPAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a419-a7d7-11ed-b719-2c4138b7dab1', '043R', 'DIRECCIÓN DE DESARROLLO MINERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a49a-a7d7-11ed-b719-2c4138b7dab1', '043S', 'DIRECCIÓN DE COMPETENCIA Y COMPETITIVIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a515-a7d7-11ed-b719-2c4138b7dab1', '043U', 'SECRETARÍA PARTICULAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a592-a7d7-11ed-b719-2c4138b7dab1', '043V', 'DIRECCIÓN DE INGENIERÍA URBANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a60e-a7d7-11ed-b719-2c4138b7dab1', '043W', 'COORDINACIÓN DE SERVICIOS AEREOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a68d-a7d7-11ed-b719-2c4138b7dab1', '043X', 'SUBSECRETARÍA DE TURISMO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a70b-a7d7-11ed-b719-2c4138b7dab1', '043Y', 'DIRECCIÓN DE OPERACIÓN INSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a786-a7d7-11ed-b719-2c4138b7dab1', '043Z', 'DIRECCIÓN DE MERCADOTECNIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a85d-a7d7-11ed-b719-2c4138b7dab1', '0440', 'DIRECCIÓN DE PLANEACIÓN Y PRESTADORES DE SERVICIOS TURÍSTICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a8f0-a7d7-11ed-b719-2c4138b7dab1', '0441', 'FIDEICOMISO ESTATAL AGROPECUARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a970-a7d7-11ed-b719-2c4138b7dab1', '0442', 'FIDEICOMISO PUENTE INTERNACIONAL SOLIDARIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51a9ec-a7d7-11ed-b719-2c4138b7dab1', '0444', 'FIDEICOMISO ESTATAL AGROPECUARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51aa6b-a7d7-11ed-b719-2c4138b7dab1', '0445', 'FIDEICOMISO FIDEMEJORA BANORTE NO. 750147\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51aaeb-a7d7-11ed-b719-2c4138b7dab1', '0446', 'FIDEICOMISO PRESA DE LA BOCA (FIPREBOCA)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ab64-a7d7-11ed-b719-2c4138b7dab1', '0447', 'GUARDIA CIVIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51abe0-a7d7-11ed-b719-2c4138b7dab1', '0448', 'FIDEICOMISO 62364 INNOVEC NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ac62-a7d7-11ed-b719-2c4138b7dab1', '0449', 'FIDEICOMISO DESARROLLO COMPETITIVO NUEVO LEÓN (FIDEKIA)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ace2-a7d7-11ed-b719-2c4138b7dab1', '044A', 'DIRECCIÓN INTERSECTORIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ad63-a7d7-11ed-b719-2c4138b7dab1', '044B', 'DIRECCIÓN DE PLANEACIÓN Y SUSTENTABILIDAD ENERGÉTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51addd-a7d7-11ed-b719-2c4138b7dab1', '044C', 'DIRECCIÓN DE VINCULACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ae79-a7d7-11ed-b719-2c4138b7dab1', '044D', 'DIRECCIÓN DE PROYECTOS URBANOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51af01-a7d7-11ed-b719-2c4138b7dab1', '044E', 'DIRECCIÓN DE FORTALECIMIENTO URBANO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51af84-a7d7-11ed-b719-2c4138b7dab1', '044F', 'DIRECCIÓN DE GESTIÓN INTEGRAL DE LA CALIDAD DEL AIRE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b001-a7d7-11ed-b719-2c4138b7dab1', '044G', 'DIRECCIÓN DE GESTIÓN INTEGRAL DEL AGUA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b07d-a7d7-11ed-b719-2c4138b7dab1', '044H', 'DIRECCIÓN DE GESTIÓN INTEGRAL DE RESIDUOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b16a-a7d7-11ed-b719-2c4138b7dab1', '044I', 'FIDEICOMISO BP3417\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b23d-a7d7-11ed-b719-2c4138b7dab1', '044J', 'DIRECCIÓN DE PLANEACIÓN Y GESTIÓN DE CALIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b2b2-a7d7-11ed-b719-2c4138b7dab1', '044K', 'DIRECCIÓN DE ATENCIÓN A DENUNCIAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b325-a7d7-11ed-b719-2c4138b7dab1', '044L', 'FISCALÍA REGIONAL NORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b39c-a7d7-11ed-b719-2c4138b7dab1', '044M', 'FISCALÍA REGIONAL CENTRO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b511-a7d7-11ed-b719-2c4138b7dab1', '044N', 'FISCALÍA REGIONAL SUR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b59a-a7d7-11ed-b719-2c4138b7dab1', '044O', 'DIRECCIÓN DE ASUNTOS JURIDICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b614-a7d7-11ed-b719-2c4138b7dab1', '044P', 'DIRECCIÓN DE RECURSOS HUMANOS.\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b68f-a7d7-11ed-b719-2c4138b7dab1', '044Q', 'SECRETARÍA TÉCNICA DEL PROCURADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b70e-a7d7-11ed-b719-2c4138b7dab1', '044R', 'DIRECCIÓN DE ANÁLISIS Y PROCESAMIENTO DE INFORMACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b789-a7d7-11ed-b719-2c4138b7dab1', '044S', 'DIRECCIÓN DE INVESTIGACIÓN Y PROCESOS DE LA REGIÓN NORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b809-a7d7-11ed-b719-2c4138b7dab1', '044T', 'DIRECCIÓN DE INVESTIGACIÓN Y PROCESOS DE LA REGIÓN SUR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b884-a7d7-11ed-b719-2c4138b7dab1', '044U', 'FISCALÍA ESPECIALIZADA DE ATENCIÓN A LA MUJER\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b8f8-a7d7-11ed-b719-2c4138b7dab1', '044V', 'VISITADURÍA GENERAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b971-a7d7-11ed-b719-2c4138b7dab1', '044W', 'CENTRO DE EVALUACIÓN Y CONTROL DE CONFIANZA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51b9f1-a7d7-11ed-b719-2c4138b7dab1', '044X', 'DIRECCIÓN DE DERECHOS HUMANOS Y ATENCIÓN A GRUPOS VULNERABLES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ba68-a7d7-11ed-b719-2c4138b7dab1', '044Y', 'FIDEICOMISO DE LOS INMUEBLES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51bae5-a7d7-11ed-b719-2c4138b7dab1', '044Z', 'FIDEICOMISO PROMOTOR DE PROYECTOS ESTRATÉGICOS URBANOS (FIDEPROES)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51bb60-a7d7-11ed-b719-2c4138b7dab1', '0450', 'FIDEICOMISO FONDO DE FOMENTO AGROPECUARIO (FOFAE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51bbdd-a7d7-11ed-b719-2c4138b7dab1', '0451', 'UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51bc57-a7d7-11ed-b719-2c4138b7dab1', '0452', 'PROMOTORA DE DESARROLLO RURAL (PRODERLEÓN)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51bcce-a7d7-11ed-b719-2c4138b7dab1', '0453', 'INSTITUTO DE LA VIVIENDA DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51bd45-a7d7-11ed-b719-2c4138b7dab1', '0454', 'FOMENTO METROPOLITANO DE MONTERREY (FOMERREY)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51bdc1-a7d7-11ed-b719-2c4138b7dab1', '0455', 'SERVICIOS DE AGUA Y DRENAJE DE MONTERREY\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51be3a-a7d7-11ed-b719-2c4138b7dab1', '0456', 'DIRECCIÓN DE EDUCACIÓN ESPECIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51beb1-a7d7-11ed-b719-2c4138b7dab1', '0457', 'DIRECCIÓN DE PARTICIPACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51bf2b-a7d7-11ed-b719-2c4138b7dab1', '0458', 'DIRECCIÓN DE ADMINISTRACIÓN FINANCIERA Y CONTABILIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51bfa5-a7d7-11ed-b719-2c4138b7dab1', '0459', 'DIRECCIÓN DE INFORMÁTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c01f-a7d7-11ed-b719-2c4138b7dab1', '0460', 'DIRECCIÓN DE ADMINISTRACIÓN CENTRAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c097-a7d7-11ed-b719-2c4138b7dab1', '0461', 'DIRECCIÓN DE PROGRAMACIÓN Y PRESUPUESTO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c10c-a7d7-11ed-b719-2c4138b7dab1', '0462', 'DIRECCIÓN DE CALIDAD EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c187-a7d7-11ed-b719-2c4138b7dab1', '0463', 'DIRECCIÓN DE PLANEACIÓN ESTRATÉGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c201-a7d7-11ed-b719-2c4138b7dab1', '0464', 'DIRECCIÓN GENERAL DE LA OFICINA DEL C. SECRETARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c277-a7d7-11ed-b719-2c4138b7dab1', '0465', 'DIRECCIÓN DE COMUNICACIÓN Y PRENSA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c2ec-a7d7-11ed-b719-2c4138b7dab1', '0466', 'DIRECCIÓN DE CONTROL Y GESTIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c366-a7d7-11ed-b719-2c4138b7dab1', '0467', 'SECRETARÍA PARTICULAR DE LA SECRETARÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c3de-a7d7-11ed-b719-2c4138b7dab1', '0468', 'DIRECCIÓN GENERAL DE EVALUACIÓN EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c450-a7d7-11ed-b719-2c4138b7dab1', '0469', 'FIDEMEJORA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c4cc-a7d7-11ed-b719-2c4138b7dab1', '046A', 'UNIVERSIDAD TECNOLÓGICA BILINGÜE FRANCO MEXICANA DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c54c-a7d7-11ed-b719-2c4138b7dab1', '046B', 'FIDEICOMISO DE GARANTÍAS  PARA EMPRESAS EN SOLIDARIDAD (FOGALEON)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c5ca-a7d7-11ed-b719-2c4138b7dab1', '046C', 'FIDEICOMISO FONDO DE GARANTÍAS PARA EMPRESAS EN SOLIDARIDAD (FOGALEÓN)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c647-a7d7-11ed-b719-2c4138b7dab1', '046D', 'CORPORACIÓN PARA EL DESARROLLO AGROPECUARIO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c6c0-a7d7-11ed-b719-2c4138b7dab1', '046E', 'FIDEICOMISO DE MOVILIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c73a-a7d7-11ed-b719-2c4138b7dab1', '046F', 'FISCALÍA GENERAL DE JUSTICIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c7b4-a7d7-11ed-b719-2c4138b7dab1', '046G', 'SISTEMA DE RADIO Y TELEVISIÓN DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c832-a7d7-11ed-b719-2c4138b7dab1', '046H', 'FIDEICOMISO DE EQUIPAMIENTO EDUCATIVO BP1018 (FIDEQUIPA)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c8ad-a7d7-11ed-b719-2c4138b7dab1', '046I', 'INSTITUTO ESTATAL DE LAS PERSONAS ADULTAS MAYORES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c92a-a7d7-11ed-b719-2c4138b7dab1', '046J', 'FIDEICOMISO PUENTE INTERNACIONAL SOLIDARIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51c9a1-a7d7-11ed-b719-2c4138b7dab1', '046K', 'OFICINA EJECUTIVA DEL C. GOBERNADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ca14-a7d7-11ed-b719-2c4138b7dab1', '046L', 'PROGRAMA  ALIADOS CONTIGO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ca8b-a7d7-11ed-b719-2c4138b7dab1', '046M', 'COORDINACIÓN DE ENLACE Y ACCIÓN GUBERNAMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51cb0a-a7d7-11ed-b719-2c4138b7dab1', '046N', 'COORDINACIÓN GENERAL DE SEGUIMIENTO DE ACUERDOS GUBERNAMENTALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51cb82-a7d7-11ed-b719-2c4138b7dab1', '046O', 'DIRECCIÓN DE OPERACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51cbfc-a7d7-11ed-b719-2c4138b7dab1', '046P', 'DIRECCIÓN DE RELACIONES INSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51cc79-a7d7-11ed-b719-2c4138b7dab1', '046Q', 'DIRECCIÓN DE ESTRATEGIAS Y COMUNICACIÓN EN NUEVOS MEDIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ccf5-a7d7-11ed-b719-2c4138b7dab1', '046R', 'DIRECCIÓN GENERAL DE PLANEACIÓN ESTRATÉGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51cd6f-a7d7-11ed-b719-2c4138b7dab1', '046S', 'DIRECCIÓN JURÍDICA Y DE RELACIONES INSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51cde6-a7d7-11ed-b719-2c4138b7dab1', '046T', 'DIRECCIÓN DE INFORMACIÓN ESTRATÉGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ce63-a7d7-11ed-b719-2c4138b7dab1', '046U', 'DIRECCIÓN DE PROYECTOS DE INVERSIÓN Y FORTALECIMIENTO MUNICIPAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51cedd-a7d7-11ed-b719-2c4138b7dab1', '046V', 'DIRECCIÓN DE ENLACE Y DESARROLLO MUNICIPAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51cf52-a7d7-11ed-b719-2c4138b7dab1', '046W', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51cfcd-a7d7-11ed-b719-2c4138b7dab1', '046X', 'COORDINACIÓN GENERAL DE ORGANIZACIÓN Y SEGUIMIENTO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d042-a7d7-11ed-b719-2c4138b7dab1', '046Y', 'DIRECCIÓN JURÍDICA CONSULTIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d0bc-a7d7-11ed-b719-2c4138b7dab1', '046Z', 'DIRECCIÓN DE ASUNTOS LEGISLATIVOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d134-a7d7-11ed-b719-2c4138b7dab1', '0470', 'DIRECCIÓN DE ASUNTOS INTERINSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d1ac-a7d7-11ed-b719-2c4138b7dab1', '0471', 'UNIDAD DEL PERIÓDICO OFICIAL DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d221-a7d7-11ed-b719-2c4138b7dab1', '0472', 'COORDINACIÓN DE ASESORES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d299-a7d7-11ed-b719-2c4138b7dab1', '0473', 'DIRECCIÓN DE INFORMÁTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d313-a7d7-11ed-b719-2c4138b7dab1', '0474', 'DIVISIÓN CIENTÍFICA (SSIE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d388-a7d7-11ed-b719-2c4138b7dab1', '0475', 'JEFATURA DE ESTADO MAYOR (SSIE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d3ff-a7d7-11ed-b719-2c4138b7dab1', '0476', 'CENTRO ESTATAL DE PREVENCIÓN DEL DELITO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d476-a7d7-11ed-b719-2c4138b7dab1', '0477', 'SUB DIRECCIÓN DE APOYO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d535-a7d7-11ed-b719-2c4138b7dab1', '0478', 'DIRECCIÓN DE OPERACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d5ba-a7d7-11ed-b719-2c4138b7dab1', '0479', 'DIRECCIÓN DE SERVICIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d635-a7d7-11ed-b719-2c4138b7dab1', '047A', 'DIRECCIÓN DE TECNOLOGÍA DE INFORMACIÓN Y COMUNICACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d6b1-a7d7-11ed-b719-2c4138b7dab1', '047B', 'DIRECCIÓN DE EVALUACIÓN DE RIESGO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d733-a7d7-11ed-b719-2c4138b7dab1', '047C', 'DIRECCIÓN DE SUPERVISIÓN DE MEDIDAS CAUTELARES Y SUSPENSIÓN CONDICIONAL DEL PROCESO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d7f2-a7d7-11ed-b719-2c4138b7dab1', '047D', 'DIRECCIÓN DE VINCULACIÓN Y GESTIÓN DE SERVICIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d87b-a7d7-11ed-b719-2c4138b7dab1', '047E', 'COORDINACIÓN DE PROGRAMAS COMPENSATORIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d8ff-a7d7-11ed-b719-2c4138b7dab1', '047F', 'COORDINACIÓN DE PROYECTOS DE INVESTIGACIÓN E INNOVACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51d983-a7d7-11ed-b719-2c4138b7dab1', '047G', 'COORDINACIÓN DEL PROYECTO DE MODERNIZACIÓN DE LA EDUCACIÓN TÉCNICA Y CAPACITACIÓN (PMETYC)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51da00-a7d7-11ed-b719-2c4138b7dab1', '047H', 'COORDINACIÓN DE ORGANISMOS DESCENTRALIZADOS Y DESCONCENTRADOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51da79-a7d7-11ed-b719-2c4138b7dab1', '047I', 'DIRECCIÓN DE PROMOCIÓN A LA SALUD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51daf1-a7d7-11ed-b719-2c4138b7dab1', '047J', 'DIRECCIÓN DE ENFERMERÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51dc63-a7d7-11ed-b719-2c4138b7dab1', '047K', 'DIRECCIÓN SECTORIAL ENTRE LAS DEPENDENCIAS DE SALUD', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51dd07-a7d7-11ed-b719-2c4138b7dab1', '047L', 'DIRECCIÓN DE PREVISIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51dd82-a7d7-11ed-b719-2c4138b7dab1', '047M', 'SECRETARÍA PARTICULAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ddfa-a7d7-11ed-b719-2c4138b7dab1', '047N', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51de73-a7d7-11ed-b719-2c4138b7dab1', '047O', 'REGISTRO ESTATAL DE CONTRATISTAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51deeb-a7d7-11ed-b719-2c4138b7dab1', '047P', 'COORDINACIÓN DE EDUCACIÓN AMBIENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51df67-a7d7-11ed-b719-2c4138b7dab1', '047Q', 'COORDINACIÓN DE IMPACTO AMBIENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51dfe3-a7d7-11ed-b719-2c4138b7dab1', '047R', 'DIRECCIÓN DE OPERACIONES Y COMUNICACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e058-a7d7-11ed-b719-2c4138b7dab1', '047S', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e0d7-a7d7-11ed-b719-2c4138b7dab1', '047T', 'SUBSECRETARÍA DE INCLUSIÓN SOCIAL Y ATENCIÓN A GRUPOS VULNERABLES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e153-a7d7-11ed-b719-2c4138b7dab1', '047U', 'DIRECCIÓN DE INCLUSIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e1cc-a7d7-11ed-b719-2c4138b7dab1', '047V', 'COORDINACIÓN DE ESTUDIOS TÉCNICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e243-a7d7-11ed-b719-2c4138b7dab1', '047W', 'COORDINACIÓN DE ESTADÍSTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e2b9-a7d7-11ed-b719-2c4138b7dab1', '047X', 'DIRECCIÓN DE MOVILIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e331-a7d7-11ed-b719-2c4138b7dab1', '047Y', 'DIRECCIÓN DE TRANSPORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e3ad-a7d7-11ed-b719-2c4138b7dab1', '047Z', 'SUBSECRETARÍA DE DESARROLLO INTEGRAL COMUNITARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e424-a7d7-11ed-b719-2c4138b7dab1', '0480', 'DIRECCIÓN DE PROMOCIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e499-a7d7-11ed-b719-2c4138b7dab1', '0481', 'SUBSECRETARÍA DE PLANEACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e526-a7d7-11ed-b719-2c4138b7dab1', '0482', 'DIRECCIÓN DE INNOVACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e5a7-a7d7-11ed-b719-2c4138b7dab1', '0483', 'DIRECCIÓN DE PLANEACIÓN Y EVALUACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e621-a7d7-11ed-b719-2c4138b7dab1', '0484', 'SUBSECRETARÍA DE VINCULACIÓN Y PROYECTOS ESTRATÉGICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e698-a7d7-11ed-b719-2c4138b7dab1', '0485', 'DIRECCIÓN DE PROYECTOS ESTRATÉGICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e714-a7d7-11ed-b719-2c4138b7dab1', '0486', 'COMISIÓN ESTATAL DE MEJORA REGULATORIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e78b-a7d7-11ed-b719-2c4138b7dab1', '0487', 'CENTRO DE GOBIERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e808-a7d7-11ed-b719-2c4138b7dab1', '0488', 'SECRETARÍA EJECUTIVA DEL SISTEMA ESTATAL ANTICORRUPCIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e88b-a7d7-11ed-b719-2c4138b7dab1', '0489', 'COLEGIO DE BACHILLERES MODALIDAD MILITARIZADA GRAL. MARIANO ESCOBEDO UNIDAD SAN NICOLÁS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e913-a7d7-11ed-b719-2c4138b7dab1', '048A', 'COLEGIO DE BACHILLERES MODALIDAD MILITARIZADA GRAL. MARIANO ESCOBEDO  UNIDAD SAN BERNABÉ\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51e99b-a7d7-11ed-b719-2c4138b7dab1', '048B', 'COLEGIO DE BACHILLERES MODALIDAD MILITARIZADA GRAL. MARIANO ESCOBEDO  UNIDAD MONTEMORELOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ea1d-a7d7-11ed-b719-2c4138b7dab1', '048C', 'COLEGIO DE BACHILLERES MODALIDAD MILITARIZADA GRAL. MARIANO ESCOBEDO  UNIDAD APODACA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51eaa1-a7d7-11ed-b719-2c4138b7dab1', '048D', 'COLEGIO DE BACHILLERES MODALIDAD MILITARIZADA GRAL. MARIANO ESCOBEDO  UNIDAD GARCÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51eb2a-a7d7-11ed-b719-2c4138b7dab1', '048E', 'COLEGIO DE BACHILLERES MODALIDAD MILITARIZADA GRAL. MARIANO ESCOBEDO  UNIDAD GALEANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51eba5-a7d7-11ed-b719-2c4138b7dab1', '048F', 'INSTITUTO ESTATAL DE EVALUACIÓN EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ec21-a7d7-11ed-b719-2c4138b7dab1', '048G', 'FIDEICOMISO PUENTE INTERNACIONAL SOLIDARIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ec9c-a7d7-11ed-b719-2c4138b7dab1', '048H', 'FIDEICOMISO 71479 FONDO NUEVO LEÓN PARA LA PLANEACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ed20-a7d7-11ed-b719-2c4138b7dab1', '048I', 'FIDEICOMISO FONDO DE GARANTÍAS PARA EMPRESAS EN SOLIDARIDAD (FOGALEÓN)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ed9c-a7d7-11ed-b719-2c4138b7dab1', '048J', 'FIDEICOMISO AFIRME 71630 FINANCIAMIENTO FAIS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ee19-a7d7-11ed-b719-2c4138b7dab1', '048K', 'FIDEICOMISO 71479 FONDO NUEVO LEÓN PARA LA PLANEACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ee8f-a7d7-11ed-b719-2c4138b7dab1', '048L', 'FIDEICOMISO FONDO DE DESASTRES NATURALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ef0c-a7d7-11ed-b719-2c4138b7dab1', '048M', 'FIDEICOMISO FONDO METROPOLITANO CIUDAD DE MONTERREY\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ef81-a7d7-11ed-b719-2c4138b7dab1', '048N', 'FIDEICOMISO DE LOS INMUEBLES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51eff9-a7d7-11ed-b719-2c4138b7dab1', '048O', 'COORDINACIÓN DE POLÍTICAS PÚBLICAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f075-a7d7-11ed-b719-2c4138b7dab1', '048P', 'COORDINACIÓN TÉCNICA DE GABINETE Y EFICIENCIA GUBERNAMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f0f6-a7d7-11ed-b719-2c4138b7dab1', '048Q', 'COORDINACIÓN DE PRIORIDADES ESTRATÉGICAS Y GESTIÓN DE CUMPLIMIENTO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f171-a7d7-11ed-b719-2c4138b7dab1', '048R', 'COORDINACIÓN DE ENLACE CON LA SOCIEDAD CIVIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f1ef-a7d7-11ed-b719-2c4138b7dab1', '048S', 'COLEGIO DE BACHILLERES MILITARIZADO GENERAL MARIANO ESCOBEDO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f269-a7d7-11ed-b719-2c4138b7dab1', '048T', 'FIDEICOMISO DE PATRIMONIO CULTURAL BP-5518\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f2e8-a7d7-11ed-b719-2c4138b7dab1', '048U', 'COMISIÓN LOCAL DE BÚSQUEDA DE PERSONAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f362-a7d7-11ed-b719-2c4138b7dab1', '048V', 'SUBSECRETARÍA DE RELACIONES INTERINSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f3dc-a7d7-11ed-b719-2c4138b7dab1', '048W', 'DIRECCIÓN DE MAQUINARIA Y EQUIPO PESADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f454-a7d7-11ed-b719-2c4138b7dab1', '048X', 'SUBSECRETARÍA DE DESARROLLO REGIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f4d0-a7d7-11ed-b719-2c4138b7dab1', '048Y', 'DIRECCIÓN DE DESARROLLO EMPRESARIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f54b-a7d7-11ed-b719-2c4138b7dab1', '048Z', 'DIRECCIÓN DE INFRAESTRUCTURA Y COMUNIDADES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f5c5-a7d7-11ed-b719-2c4138b7dab1', '0490', 'DIRECCIÓN DE OFICINAS REGIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f63c-a7d7-11ed-b719-2c4138b7dab1', '0491', 'DIRECCIÓN DE GESTIÓN ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f6be-a7d7-11ed-b719-2c4138b7dab1', '0492', 'UNIVERSIDAD TECNOLÓGICA BILINGÜE FRANCO MEXICANA DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f742-a7d7-11ed-b719-2c4138b7dab1', '0493', 'INSTITUTO DE INVESTIGACIONES JURÍDICAS Y DOCENCIA DE LA ADMINISTRACIÓN PÚBLICA DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f7bb-a7d7-11ed-b719-2c4138b7dab1', '0494', 'CENTRO DE REINSERCIÓN SOCIAL FEMENIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f835-a7d7-11ed-b719-2c4138b7dab1', '0495', 'DIRECCIÓN DE RELACIONES INTERINSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f926-a7d7-11ed-b719-2c4138b7dab1', '0496', 'DIRECCIÓN DE CULTURA Y REGULACIÓN AMBIENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51f9a9-a7d7-11ed-b719-2c4138b7dab1', '0497', 'DIRECCIÓN DE INSPECCIÓN Y VIGILANCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51fa26-a7d7-11ed-b719-2c4138b7dab1', '0498', 'DIVISIÓN DE ACCIONES TÁCTICAS Y GRUPOS ESPECIALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51fa9e-a7d7-11ed-b719-2c4138b7dab1', '0499', 'DIRECCIÓN DE DESARROLLO MINERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51fb1a-a7d7-11ed-b719-2c4138b7dab1', '049A', 'DIRECCIÓN DE GESTORÍA Y TRÁMITES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51fb92-a7d7-11ed-b719-2c4138b7dab1', '049B', 'UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51fc0c-a7d7-11ed-b719-2c4138b7dab1', '049C', 'INSTITUTO DE LA VIVIENDA DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51fc84-a7d7-11ed-b719-2c4138b7dab1', '049D', 'INSTITUTO DE MOVILIDAD Y ACCESIBILIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51fd73-a7d7-11ed-b719-2c4138b7dab1', '049E', 'COORDINACIÓN GENERAL DE SEGUIMIENTO Y CONTROL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51fe10-a7d7-11ed-b719-2c4138b7dab1', '049F', 'ÓRGANO INTERNO DE CONTROL DE LA SECRETARÍA DE FINANZAS Y TESORERÍA GENERAL DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51fe8e-a7d7-11ed-b719-2c4138b7dab1', '049G', 'COMISIÓN ESTATAL DE MEJORA REGULATORIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ff5a-a7d7-11ed-b719-2c4138b7dab1', '049H', 'UNIDAD DE INTELIGENCIA FINANCIERA Y ECONÓMICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a51ffe2-a7d7-11ed-b719-2c4138b7dab1', '049I', 'ÓRGANO INTERNO DE CONTROL DE LA SECRETARÍA DE INFRAESTRUCTURA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520061-a7d7-11ed-b719-2c4138b7dab1', '049J', 'DIRECCIÓN DE ESTADÍSTICA Y  PLANEACIÓN ESTRATÉGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5200da-a7d7-11ed-b719-2c4138b7dab1', '049K', 'UNIDAD DE COMUNICACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520151-a7d7-11ed-b719-2c4138b7dab1', '049L', 'UNIDAD DE LOGÍSTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5201c8-a7d7-11ed-b719-2c4138b7dab1', '049M', 'UNIDAD DE ARCHIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520240-a7d7-11ed-b719-2c4138b7dab1', '049N', 'UNIDAD DE TRANSPARENCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5202ba-a7d7-11ed-b719-2c4138b7dab1', '049O', 'UNIDAD DE IGUALIDAD DE GÉNERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520333-a7d7-11ed-b719-2c4138b7dab1', '049P', 'UNIDAD DE LA LICENCIA OFICIAL COLECTIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5204b1-a7d7-11ed-b719-2c4138b7dab1', '049Q', 'OFICIALÍA DE PARTES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520544-a7d7-11ed-b719-2c4138b7dab1', '049R', 'DIRECCIÓN DE CONTROL Y SUPERVISIÓN DE EMPRESAS Y SERVICIOS DE SEGURIDAD PRIVADA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5205c0-a7d7-11ed-b719-2c4138b7dab1', '049S', 'DIRECCIÓN DE NORMATIVIDAD Y CONVENIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520638-a7d7-11ed-b719-2c4138b7dab1', '049T', 'DIRECCIÓN DE PROCESOS JURÍDICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5206ae-a7d7-11ed-b719-2c4138b7dab1', '049U', 'DIRECCIÓN LABORAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520724-a7d7-11ed-b719-2c4138b7dab1', '049V', 'DIRECCIÓN DE MEDICINA PREVENTIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5207a0-a7d7-11ed-b719-2c4138b7dab1', '049W', 'DIVISIÓN GENERAL DE INTELIGENCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520819-a7d7-11ed-b719-2c4138b7dab1', '049X', 'SERVICIOS DE PROTECCIÓN INSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520890-a7d7-11ed-b719-2c4138b7dab1', '049Y', 'SERVICIOS DE CUSTODIA Y ESCOLTAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520907-a7d7-11ed-b719-2c4138b7dab1', '049Z', 'SERVICIOS DE VIGILANCIA INSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520981-a7d7-11ed-b719-2c4138b7dab1', '04A0', 'SERVICIOS DE LA POLICÍA PROCESAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5209fc-a7d7-11ed-b719-2c4138b7dab1', '04A1', 'UNIDAD GENERAL DE INSPECCIÓN Y DE ASUNTOS INTERNOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520a73-a7d7-11ed-b719-2c4138b7dab1', '04A2', 'UNIDAD DE CONTRAINTELIGENCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520aea-a7d7-11ed-b719-2c4138b7dab1', '04A3', 'DIRECCIÓN DE POLÍTICAS PÚBLICAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520b63-a7d7-11ed-b719-2c4138b7dab1', '04A4', 'JEFATURA DE ESTADO MAYOR (C5)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520bdb-a7d7-11ed-b719-2c4138b7dab1', '04A5', 'CENTRO DE COMANDO DE EMERGENCIAS 911\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520c53-a7d7-11ed-b719-2c4138b7dab1', '04A6', 'CENTRO DE CONTROL Y COORDINACIÓN DE OPERACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520cc6-a7d7-11ed-b719-2c4138b7dab1', '04A7', 'CENTRO DE CÓMPUTO', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520d59-a7d7-11ed-b719-2c4138b7dab1', '04A8', 'CENTRO DE CONTROL VIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520dde-a7d7-11ed-b719-2c4138b7dab1', '04A9', 'DIRECCIÓN DE GESTIÓN Y ANÁLISIS DE INFORMACIÓN DE MEDIDAS CAUTELARES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520e55-a7d7-11ed-b719-2c4138b7dab1', '04AA', 'ESCUELA SUPERIOR DE INTELIGENCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520eca-a7d7-11ed-b719-2c4138b7dab1', '04AB', 'CONSEJO DIRECTIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520f41-a7d7-11ed-b719-2c4138b7dab1', '04AC', 'DIRECCIÓN GENERAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a520fb8-a7d7-11ed-b719-2c4138b7dab1', '04AD', 'DIVISIÓN DE INVESTIGACIÓN TECNOLÓGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52102e-a7d7-11ed-b719-2c4138b7dab1', '04AE', 'DIVISIÓN CIENTÍFICA (ESI)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5210a1-a7d7-11ed-b719-2c4138b7dab1', '04AF', 'DIVISIÓN ACADÉMICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52111e-a7d7-11ed-b719-2c4138b7dab1', '04AG', 'DIVISIÓN DE PROFESIONALIZACIÓN Y ESPECIALIZACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521198-a7d7-11ed-b719-2c4138b7dab1', '04AH', 'DIRECCIÓN DE PLANEACIÓN Y ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52120b-a7d7-11ed-b719-2c4138b7dab1', '04AI', 'UNIDAD JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521286-a7d7-11ed-b719-2c4138b7dab1', '04AJ', 'DIRECCIÓN GENERAL DEL CENTRO DE COORDINACIÓN INTEGRAL DE CONTROL', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52131a-a7d7-11ed-b719-2c4138b7dab1', '04AK', 'UNIDAD DE MEDIDAS CAUTELARES Y SUSPENSIÓN CONDICIONAL DEL PROCESO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52139a-a7d7-11ed-b719-2c4138b7dab1', '04AL', 'DIRECCIÓN DE EVALUACIÓN DE RIESGO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52141c-a7d7-11ed-b719-2c4138b7dab1', '04AM', 'DIRECCIÓN DE SUPERVISIÓN DE MEDIDAS CAUTELARES Y SUSPENSIÓN CONDICIONAL DEL PROCESO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521495-a7d7-11ed-b719-2c4138b7dab1', '04AN', 'DIRECCIÓN CONTRA LA VIOLENCIA DE GÉNERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52150f-a7d7-11ed-b719-2c4138b7dab1', '04AO', 'JEFATURA DE ESTADO MAYOR (AAP)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52158a-a7d7-11ed-b719-2c4138b7dab1', '04AP', 'INSTITUCIÓN POLICIAL ESTATAL FUERZA CIVIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521602-a7d7-11ed-b719-2c4138b7dab1', '04AQ', 'COORDINACIÓN DE ASESORES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52167a-a7d7-11ed-b719-2c4138b7dab1', '04AR', 'DIRECCIÓN DE RELACIONES INTERINSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5216f2-a7d7-11ed-b719-2c4138b7dab1', '04AS', 'SEGURIDAD GUBERNAMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521767-a7d7-11ed-b719-2c4138b7dab1', '04AT', 'FIDEICOMISO 731012 AFIRME\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5217e0-a7d7-11ed-b719-2c4138b7dab1', '04AU', 'COORDINACIÓN GENERAL DE PLANEACIÓN Y EVALUACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521859-a7d7-11ed-b719-2c4138b7dab1', '04AV', 'COORDINACIÓN GENERAL DE PROYECTOS ESTRATÉGICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5218d4-a7d7-11ed-b719-2c4138b7dab1', '04AW', 'COORDINACIÓN GENERAL JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52194b-a7d7-11ed-b719-2c4138b7dab1', '04AX', 'UNIDAD DE ENLACE ADMINISTRATIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5219c0-a7d7-11ed-b719-2c4138b7dab1', '04AY', 'GERENCIA DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521a3b-a7d7-11ed-b719-2c4138b7dab1', '04AZ', 'REPRESENTACIÓN DEL ESTADO EN LA CIUDAD DE MÉXICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521ab4-a7d7-11ed-b719-2c4138b7dab1', '04B0', 'SISTEMA ESTATAL DE INFORMACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521b29-a7d7-11ed-b719-2c4138b7dab1', '04B1', 'COMUNICACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521ba5-a7d7-11ed-b719-2c4138b7dab1', '04B2', 'OFICINA DE LA C. SECRETARIA DE PARTICIPACIÓN CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521c1c-a7d7-11ed-b719-2c4138b7dab1', '04B3', 'OFICINA DEL C. SECRETARIO DE ECONOMÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521c96-a7d7-11ed-b719-2c4138b7dab1', '04B4', 'OFICINA DEL C. SECRETARIO DEL TRABAJO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521d0d-a7d7-11ed-b719-2c4138b7dab1', '04B5', 'OFICINA DE LA C. SECRETARIA DE TURISMO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521d82-a7d7-11ed-b719-2c4138b7dab1', '04B6', 'OFICINA DEL C. SECRETARIO DE MEDIO AMBIENTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521dfb-a7d7-11ed-b719-2c4138b7dab1', '04B7', 'OFICINA DE LA C. SECRETARIA DE IGUALDAD E INCLUSIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521e7b-a7d7-11ed-b719-2c4138b7dab1', '04B8', 'OFICINA DE LA TITULAR DE LA SECRETARÍA DE LAS MUJERES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521ef3-a7d7-11ed-b719-2c4138b7dab1', '04B9', 'OFICINA DE LA C. SECRETARIA DE CULTURA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521f6e-a7d7-11ed-b719-2c4138b7dab1', '04BA', 'OFICINA DEL C. SECRETARIO DE DESARROLLO REGIONAL Y AGROPECUARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a521fe8-a7d7-11ed-b719-2c4138b7dab1', '04BB', 'OFICINA DEL C. SECRETARIO DE MOVILIDAD Y PLANEACIÓN URBANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52205f-a7d7-11ed-b719-2c4138b7dab1', '04BC', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5220d6-a7d7-11ed-b719-2c4138b7dab1', '04BD', 'DIRECCIÓN GENERAL JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52214c-a7d7-11ed-b719-2c4138b7dab1', '04BE', 'DIRECCIÓN ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5221c3-a7d7-11ed-b719-2c4138b7dab1', '04BF', 'DIRECCIÓN GENENRAL DE LICITACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522240-a7d7-11ed-b719-2c4138b7dab1', '04BG', 'DIRECCIÓN GENERAL DE VINCULACIÓN INTERSECTORIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5222b9-a7d7-11ed-b719-2c4138b7dab1', '04BH', 'DIRECCIÓN DE ASOCIACIONES PÚBLICO PRIVADAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52232f-a7d7-11ed-b719-2c4138b7dab1', '04BI', 'SUBSECRETARÍA DE TRANSPORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5223a6-a7d7-11ed-b719-2c4138b7dab1', '04BJ', 'DIRECCIÓN DE TRANSPORTE PÚBLICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522421-a7d7-11ed-b719-2c4138b7dab1', '04BK', 'DIRECCIÓN DE LOGÍSTICA Y TRANSPORTE DE CARGA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52249a-a7d7-11ed-b719-2c4138b7dab1', '04BL', 'DIRECCIÓN DE GESTIÓN DE LA VIALIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522517-a7d7-11ed-b719-2c4138b7dab1', '04BM', 'SUBSECRETARÍA DE ORDENAMIENTO TERRITORIAL Y DEL ESPACIO PÚBLICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522591-a7d7-11ed-b719-2c4138b7dab1', '04BN', 'DIRECCIÓN DE ESPACIO PÚBLICO Y MOVILIDAD NO MOTORIZADA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522664-a7d7-11ed-b719-2c4138b7dab1', '04BO', 'DIRECCIÓN DE ORDENAMIENTO TERRITORIAL Y DESARROLLO URBANO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5226e8-a7d7-11ed-b719-2c4138b7dab1', '04BP', 'DIRECCIÓN DE GESTIÓN DE DISTRITOS Y POLÍGONOS DE ACTUACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52275f-a7d7-11ed-b719-2c4138b7dab1', '04BQ', 'SUBSECRETARÍA DE INFRAESTRUCTURA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5227d4-a7d7-11ed-b719-2c4138b7dab1', '04BR', 'DIRECCIÓN DE VÍAS DE COMUNICACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52284c-a7d7-11ed-b719-2c4138b7dab1', '04BS', 'DIRECCIÓN DE EDIFICACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5228c0-a7d7-11ed-b719-2c4138b7dab1', '04BT', 'DIRECCIÓN DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522934-a7d7-11ed-b719-2c4138b7dab1', '04BU', 'SUBCONTRALORÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5229ac-a7d7-11ed-b719-2c4138b7dab1', '04BV', 'DIRECCIÓN DE SEGUIMIENTO DE CONCURSOS Y LICITACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522a71-a7d7-11ed-b719-2c4138b7dab1', '04BW', 'OFICINA DE LA C. SECRETARIA DE CULTURA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522af9-a7d7-11ed-b719-2c4138b7dab1', '04BX', 'DESPACHO DEL C. GOBERNADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522c6c-a7d7-11ed-b719-2c4138b7dab1', '04BY', 'OFICINA EJECUTIVA DEL C. GOBERNADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522cf8-a7d7-11ed-b719-2c4138b7dab1', '04BZ', 'COORDINACIÓN GENERAL DE PLANEACIÓN Y EVALUACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522d78-a7d7-11ed-b719-2c4138b7dab1', '04C0', 'COORDINACIÓN GENERAL DE PROYECTOS ESTRATÉGICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522df3-a7d7-11ed-b719-2c4138b7dab1', '04C1', 'COORDINACIÓN GENERAL JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522e6e-a7d7-11ed-b719-2c4138b7dab1', '04C2', 'UNIDAD DE ENLACE ADMINISTRATIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522ee2-a7d7-11ed-b719-2c4138b7dab1', '04C3', 'AMAR A NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522f60-a7d7-11ed-b719-2c4138b7dab1', '04C4', 'SECRETARÍA PARTICULAR DEL C. GOBERNADOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a522fd8-a7d7-11ed-b719-2c4138b7dab1', '04C5', 'CONSEJERÍA JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52304e-a7d7-11ed-b719-2c4138b7dab1', '04C6', 'GERENCIA DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5230cc-a7d7-11ed-b719-2c4138b7dab1', '04C7', 'REPRESENTACIÓN DEL GOBIERNO DEL ESTADO EN LA CIUDAD DE MÉXICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523146-a7d7-11ed-b719-2c4138b7dab1', '04C8', 'SISTEMA ESTATAL DE INFORMACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5231ba-a7d7-11ed-b719-2c4138b7dab1', '04C9', 'COMUNICACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523233-a7d7-11ed-b719-2c4138b7dab1', '04CA', 'OFICINA DEL C. SECRETARIO GENERAL DE GOBIERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5232a9-a7d7-11ed-b719-2c4138b7dab1', '04CB', 'SECRETARÍA PARTICULAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523324-a7d7-11ed-b719-2c4138b7dab1', '04CC', 'DIRECCIÓN DE PROTECCIÓN CIVIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52339f-a7d7-11ed-b719-2c4138b7dab1', '04CD', 'CENTRO DE INFORMACIÓN PARA LA SEGURIDAD DE ESTADO', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523434-a7d7-11ed-b719-2c4138b7dab1', '04CE', 'COORDINACIÓN GENERAL DE COMUNICACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5234ad-a7d7-11ed-b719-2c4138b7dab1', '04CF', 'DIRECCIÓN DE ENLACE Y PRENSA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523526-a7d7-11ed-b719-2c4138b7dab1', '04CG', 'DIRECCIÓN DE OPERACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5235a1-a7d7-11ed-b719-2c4138b7dab1', '04CH', 'DIRECCIÓN DE PLANEACIÓN Y ANÁLISIS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52361a-a7d7-11ed-b719-2c4138b7dab1', '04CI', 'DIRECCIÓN DE RELACIONES INSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523696-a7d7-11ed-b719-2c4138b7dab1', '04CJ', 'DIRECCIÓN DE ESTRATEGIAS Y COMUNICACIÓN EN NUEVOS MEDIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52371e-a7d7-11ed-b719-2c4138b7dab1', '04CK', 'OFICINA DEL C. SECRETARIO EJECUTIVO DEL CONSEJO DE COORDINACIÓN DEL SISTEMA INTEGRAL DE SEGURIDAD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52379c-a7d7-11ed-b719-2c4138b7dab1', '04CL', 'DIRECCIÓN GENERAL DE PLANEACIÓN ESTRATÉGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523819-a7d7-11ed-b719-2c4138b7dab1', '04CM', 'DIRECCIÓN JURÍDICA Y DE RELACIONES INSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523891-a7d7-11ed-b719-2c4138b7dab1', '04CN', 'DIRECCIÓN DE INFORMACIÓN ESTRATÉGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523916-a7d7-11ed-b719-2c4138b7dab1', '04CO', 'COORDINACIÓN EJECUTIVA DEL FONDO DE APORTACIONES PARA  LA SEGURIDAD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52399c-a7d7-11ed-b719-2c4138b7dab1', '04CP', 'COMISIÓN EJECUTIVA PARA LA REFORMA DEL SISTEMA DE JUSTICIA PENAL DEL ESTADO DE NUEVO LEÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523a2b-a7d7-11ed-b719-2c4138b7dab1', '04CQ', 'COORDINACIÓN DE DESARROLLO Y FORTALECIMIENTO MUNICIPAL', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523abc-a7d7-11ed-b719-2c4138b7dab1', '04CR', 'DIRECCIÓN DE PROYECTOS DE INVERSIÓN Y FORTALECIMIENTO MUNICIPAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523b3e-a7d7-11ed-b719-2c4138b7dab1', '04CS', 'DIRECCIÓN DE ENLACE Y DESARROLLO MUNICIPAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523bb7-a7d7-11ed-b719-2c4138b7dab1', '04CT', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523c32-a7d7-11ed-b719-2c4138b7dab1', '04CU', 'COORDINACIÓN GENERAL DE ORGANIZACIÓN Y SEGUIMIENTO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523ca6-a7d7-11ed-b719-2c4138b7dab1', '04CV', 'UNIDAD DE ENLACE ADMINISTRATIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523d1f-a7d7-11ed-b719-2c4138b7dab1', '04CW', 'SUBSECRETARÍA DE GOBIERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523d93-a7d7-11ed-b719-2c4138b7dab1', '04CX', 'DIRECCIÓN DE GOBIERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523e0f-a7d7-11ed-b719-2c4138b7dab1', '04CY', 'DIRECCIÓN DE RELACIONES CON PODERES LEGISLATIVOS E INSTITUCIONES POLÍTICAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523e87-a7d7-11ed-b719-2c4138b7dab1', '04CZ', 'DIRECCIÓN DE DERECHOS HUMANOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523f00-a7d7-11ed-b719-2c4138b7dab1', '04D0', 'DIRECCIÓN DE ASUNTOS RELIGIOSOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523f78-a7d7-11ed-b719-2c4138b7dab1', '04D1', 'DIRECCIÓN DE ASUNTOS AGRARIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a523ff3-a7d7-11ed-b719-2c4138b7dab1', '04D2', 'SUBSECRETARÍA DE ASUNTOS JURÍDICOS Y ATENCIÓN CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52406d-a7d7-11ed-b719-2c4138b7dab1', '04D3', 'COORDINACIÓN GENERAL DE ASUNTOS JURÍDICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5240e7-a7d7-11ed-b719-2c4138b7dab1', '04D4', 'DIRECCIÓN JURÍDICA CONSULTIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524160-a7d7-11ed-b719-2c4138b7dab1', '04D5', 'DIRECCIÓN DE ASUNTOS JURISDICCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5241d9-a7d7-11ed-b719-2c4138b7dab1', '04D6', 'DIRECCIÓN DE ASUNTOS LEGISLATIVOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524252-a7d7-11ed-b719-2c4138b7dab1', '04D7', 'DIRECCIÓN DE ASUNTOS INTERINSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5242da-a7d7-11ed-b719-2c4138b7dab1', '04D8', 'INSTITUTO DE INVESTIGACIONES JURÍDICAS Y DOCENCIA DE LA ADMINISTRACIÓN PÚBLICA DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524355-a7d7-11ed-b719-2c4138b7dab1', '04D9', 'DIRECCIÓN GENERAL DEL REGISTRO CIVIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5243d0-a7d7-11ed-b719-2c4138b7dab1', '04DA', 'DIRECCIÓN DEL ARCHIVO GENERAL DE NOTARÍAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52444a-a7d7-11ed-b719-2c4138b7dab1', '04DB', 'DIRECCIÓN DEL ARCHIVO GENERAL DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5244c2-a7d7-11ed-b719-2c4138b7dab1', '04DC', 'DIRECCIÓN DE INFORMATEL Y LOCATEL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52453c-a7d7-11ed-b719-2c4138b7dab1', '04DD', 'COMISIÓN EJECUTIVA ESTATAL DE ATENCIÓN A VÍCTIMAS', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5245cf-a7d7-11ed-b719-2c4138b7dab1', '04DE', 'UNIDAD DEL PERIÓDICO OFICIAL DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52464c-a7d7-11ed-b719-2c4138b7dab1', '04DF', 'UNIDAD DE LEGALIZACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5246c8-a7d7-11ed-b719-2c4138b7dab1', '04DG', 'COMISIÓN LOCAL DE BÚSQUEDA DE PERSONAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524741-a7d7-11ed-b719-2c4138b7dab1', '04DH', 'SUBSECRETARÍA DE DESARROLLO POLÍTICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5247b9-a7d7-11ed-b719-2c4138b7dab1', '04DI', 'DIRECCIÓN DE DESARROLLO POLÍTICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524832-a7d7-11ed-b719-2c4138b7dab1', '04DJ', 'DIRECCIÓN DE PARTICIPACIÓN CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5248ad-a7d7-11ed-b719-2c4138b7dab1', '04DK', 'DIRECCIÓN DE FORMACIÓN CÍVICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52492a-a7d7-11ed-b719-2c4138b7dab1', '04DL', 'OFICINA DE LA C. SECRETARIA DE PARTICIPACIÓN CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5249a9-a7d7-11ed-b719-2c4138b7dab1', '04DM', 'OFICINA DEL C. SECRETARIO DE FINANZAS Y TESORERO GENERAL DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524a22-a7d7-11ed-b719-2c4138b7dab1', '04DN', 'COORDINACIÓN GENERAL DE SEGUIMIENTO Y CONTROL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524a9c-a7d7-11ed-b719-2c4138b7dab1', '04DO', 'SUBSECRETARÍA DE EGRESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524b17-a7d7-11ed-b719-2c4138b7dab1', '04DP', 'DIRECCIÓN DE ADMINISTRACIÓN FINANCIERA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524b94-a7d7-11ed-b719-2c4138b7dab1', '04DQ', 'DIRECCIÓN DE ATENCIÓN A MUNICIPIOS Y ORGANISMOS PARAESTATALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524c0f-a7d7-11ed-b719-2c4138b7dab1', '04DR', 'FIDEICOMISO 71479 CONSEJO NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524c8d-a7d7-11ed-b719-2c4138b7dab1', '04DS', 'FIDEICOMISO DE PATRIMONIO CULTURAL BP-5518\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524d57-a7d7-11ed-b719-2c4138b7dab1', '04DT', 'DIRECCIÓN DE CONTABILIDAD Y CUENTA PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524dd7-a7d7-11ed-b719-2c4138b7dab1', '04DU', 'DIRECCIÓN DE DEUDA PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524e4d-a7d7-11ed-b719-2c4138b7dab1', '04DV', 'FIDEICOMISO 73102 AFIRME\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524ecd-a7d7-11ed-b719-2c4138b7dab1', '04DW', 'DIRECCIÓN DE PRESUPUESTO Y CONTROL PRESUPUESTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524f47-a7d7-11ed-b719-2c4138b7dab1', '04DX', 'SUBSECRETARÍA DE INGRESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a524fc0-a7d7-11ed-b719-2c4138b7dab1', '04DY', 'COORDINACIÓN DE PLANEACIÓN HACENDARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525039-a7d7-11ed-b719-2c4138b7dab1', '04DZ', 'DIRECCIÓN DE CRÉDITOS Y COBRANZAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5250b3-a7d7-11ed-b719-2c4138b7dab1', '04E0', 'DIRECCIÓN DE COMERCIO EXTERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52512a-a7d7-11ed-b719-2c4138b7dab1', '04E1', 'DIRECCIÓN DE FISCALIZACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5251a1-a7d7-11ed-b719-2c4138b7dab1', '04E2', 'DIRECCIÓN DE RECAUDACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525215-a7d7-11ed-b719-2c4138b7dab1', '04E3', 'PROCURADURÍA FISCAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525290-a7d7-11ed-b719-2c4138b7dab1', '04E4', 'DIRECCIÓN DE PATRIMONIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52530b-a7d7-11ed-b719-2c4138b7dab1', '04E5', 'UNIDAD DE INVERSIONES Y FINANCIAMIENTO DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525479-a7d7-11ed-b719-2c4138b7dab1', '04E6', 'FIDEICOMISO LINEA 3\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525503-a7d7-11ed-b719-2c4138b7dab1', '04E7', 'UNIDAD DE INFORMACIÓN FINANCIERA Y SEGUIMIENTO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525581-a7d7-11ed-b719-2c4138b7dab1', '04E8', 'UNIDAD DE INTELIGENCIA FINANCIERA Y ECONÓMICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525600-a7d7-11ed-b719-2c4138b7dab1', '04E9', 'OFICINA DE LA C. SECRETARIA DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525679-a7d7-11ed-b719-2c4138b7dab1', '04EA', 'SECRETARÍA TECNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5256ef-a7d7-11ed-b719-2c4138b7dab1', '04EB', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5257b8-a7d7-11ed-b719-2c4138b7dab1', '04EC', 'SUBSECRETARÍA DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525843-a7d7-11ed-b719-2c4138b7dab1', '04ED', 'DIRECCIÓN DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5258bf-a7d7-11ed-b719-2c4138b7dab1', '04EE', 'COORDINACIÓN DE SERVICIOS AEREOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525935-a7d7-11ed-b719-2c4138b7dab1', '04EF', 'CENTRO DE GOBIERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5259b1-a7d7-11ed-b719-2c4138b7dab1', '04EG', 'DIRECCIÓN DE RECURSOS HUMANOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525a2a-a7d7-11ed-b719-2c4138b7dab1', '04EH', 'UNIDAD DE GESTIÓN DOCUMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525aa3-a7d7-11ed-b719-2c4138b7dab1', '04EI', 'SUBSECRETARÍA DE TECNOLOGÍAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525b1c-a7d7-11ed-b719-2c4138b7dab1', '04EJ', 'DIRECCIÓN DE SISTEMAS GUBERNAMENTALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525b99-a7d7-11ed-b719-2c4138b7dab1', '04EK', 'DIRECCIÓN DE INFRAESTRUCTURA TECNOLÓGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525c15-a7d7-11ed-b719-2c4138b7dab1', '04EL', 'DIRECCIÓN GENERAL DE ADQUISICIONES Y SERVICIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525c8c-a7d7-11ed-b719-2c4138b7dab1', '04EM', 'DIRECCIÓN DE ADQUISICIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525d07-a7d7-11ed-b719-2c4138b7dab1', '04EN', 'DIRECCIÓN DE MANTENIMIENTO Y SERVICIOS GENERALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525d83-a7d7-11ed-b719-2c4138b7dab1', '04EO', 'DIRECCIÓN DE CONCURSOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525e05-a7d7-11ed-b719-2c4138b7dab1', '04EP', 'OFICINA DE LA TITULAR DE LA CONTRALORÍA Y TRANSPARENCIA GUBERNAMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525e7b-a7d7-11ed-b719-2c4138b7dab1', '04EQ', 'SUBCONTRALORÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525ef0-a7d7-11ed-b719-2c4138b7dab1', '04ER', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525f6b-a7d7-11ed-b719-2c4138b7dab1', '04ES', 'DIRECCIÓN ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a525fe9-a7d7-11ed-b719-2c4138b7dab1', '04ET', 'DIRECCIÓN DE ÓRGANOS  INTERNOS DE CONTROL Y VIGILANCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52606c-a7d7-11ed-b719-2c4138b7dab1', '04EU', 'ÓRGANO INTERNO DE CONTROL DE LA SECRETARÍA DE FINANZAS Y TESORERÍA GENERAL DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5260ef-a7d7-11ed-b719-2c4138b7dab1', '04EV', 'ÓRGANO INTERNO DE CONTROL DE LA SECRETARÍA DE MOVILIDAD Y PLANEACIÓN URBANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52616e-a7d7-11ed-b719-2c4138b7dab1', '04EW', 'DIRECCIÓN DE TRANSPARENCIA GUBERNAMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5261ec-a7d7-11ed-b719-2c4138b7dab1', '04EX', 'DIRECCIÓN DE CONTROL Y AUDITORÍA DEL SECTOR CENTRAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52626a-a7d7-11ed-b719-2c4138b7dab1', '04EY', 'DIRECCIÓN DE CONTROL Y AUDITORÍA DEL SECTOR PARAESTATAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5262e5-a7d7-11ed-b719-2c4138b7dab1', '04EZ', 'DIRECCIÓN DE CONTROL Y AUDITORÍA DE OBRA PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526364-a7d7-11ed-b719-2c4138b7dab1', '04F0', 'DIRECCIÓN DE SEGUIMIENTO DE CONCURSOS Y LICITACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5263e0-a7d7-11ed-b719-2c4138b7dab1', '04F1', 'UNIDAD ANTICORRUPCIÓN DEL PODER EJECUTIVO DEL ESTADO', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526489-a7d7-11ed-b719-2c4138b7dab1', '04F2', 'OFICINA DEL C. SECRETARIO DE SEGURIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52650c-a7d7-11ed-b719-2c4138b7dab1', '04F3', 'DIRECCIÓN DE ESTADÍSTICA Y PLANEACIÓN ESTRATÉGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52658a-a7d7-11ed-b719-2c4138b7dab1', '04F4', 'DIRECCIÓN DE RELACIONES INTERINSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526604-a7d7-11ed-b719-2c4138b7dab1', '04F5', 'COORDINACIÓN DE ASESORES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52667d-a7d7-11ed-b719-2c4138b7dab1', '04F6', 'UNIDAD DE COMUNICACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5266f1-a7d7-11ed-b719-2c4138b7dab1', '04F7', 'UNIDAD DE LOGÍSTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526769-a7d7-11ed-b719-2c4138b7dab1', '04F8', 'UNIDAD DE ARCHIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5267e0-a7d7-11ed-b719-2c4138b7dab1', '04F9', 'UNIDAD DE TRANSPARENCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526858-a7d7-11ed-b719-2c4138b7dab1', '04FA', 'UNIDAD DE IGUALIDAD DE GÉNERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5268d0-a7d7-11ed-b719-2c4138b7dab1', '04FB', 'UNIDAD DE LA LICENCIA OFICIAL COLECTIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52694a-a7d7-11ed-b719-2c4138b7dab1', '04FC', 'OFICIALÍA DE PARTES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5269c8-a7d7-11ed-b719-2c4138b7dab1', '04FD', 'UNIDAD GENERAL DE INSPECCIÓN Y DE ASUNTOS INTERNOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526a3f-a7d7-11ed-b719-2c4138b7dab1', '04FE', 'UNIDAD DE CONTRAINTELIGENCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526abb-a7d7-11ed-b719-2c4138b7dab1', '04FF', 'DIRECCIÓN GENERAL JURÍDICA Y DE DERECHOS HUMANOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526b40-a7d7-11ed-b719-2c4138b7dab1', '04FG', 'DIRECCIÓN DE CONTROL Y SUPERVISIÓN DE EMPRESAS Y SERVICIOS DE SEGURIDAD PRIVADA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526bbc-a7d7-11ed-b719-2c4138b7dab1', '04FH', 'DIRECCIÓN DE NORMATIVIDAD Y CONVENIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526c34-a7d7-11ed-b719-2c4138b7dab1', '04FI', 'DIRECCIÓN DE PROCESOS JURÍDICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526caa-a7d7-11ed-b719-2c4138b7dab1', '04FJ', 'DIRECCIÓN LABORAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526d27-a7d7-11ed-b719-2c4138b7dab1', '04FK', 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526da2-a7d7-11ed-b719-2c4138b7dab1', '04FL', 'CONSEJO CIUDADANO DE SEGURIDAD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526e1c-a7d7-11ed-b719-2c4138b7dab1', '04FM', 'DIRECCIÓN DE RECURSOS HUMANOS Y FINANCIEROS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526e94-a7d7-11ed-b719-2c4138b7dab1', '04FN', 'DIRECCIÓN DE RECURSOS MATERIALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526f14-a7d7-11ed-b719-2c4138b7dab1', '04FO', 'DIRECCIÓN DE RECLUTAMIENTO Y SELECCIÓN DE PERSONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a526f8d-a7d7-11ed-b719-2c4138b7dab1', '04FP', 'DIRECCIÓN DE MEDICINA PREVENTIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52700a-a7d7-11ed-b719-2c4138b7dab1', '04FQ', 'SUBSECRETARÍA DE PREVENCIÓN Y PARTICIPACIÓN CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527084-a7d7-11ed-b719-2c4138b7dab1', '04FR', 'CENTRO ESTATAL DE PREVENCIÓN DEL DELITO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527103-a7d7-11ed-b719-2c4138b7dab1', '04FS', 'DIRECCIÓN CONTRA LA VIOLENCIA DE GÉNERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52717b-a7d7-11ed-b719-2c4138b7dab1', '04FT', 'DIRECCIÓN DE POLÍTICAS PÚBLICAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5271f9-a7d7-11ed-b719-2c4138b7dab1', '04FU', 'DIRECCIÓN GENERAL DEL CENTRO DE COORDINACIÓN INTEGRAL DE CONTROL', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527287-a7d7-11ed-b719-2c4138b7dab1', '04FV', 'JEFATURA DE ESTADO MAYOR (C5)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527308-a7d7-11ed-b719-2c4138b7dab1', '04FW', 'CENTRO DE COMANDO DE EMERGENCIAS 911\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527384-a7d7-11ed-b719-2c4138b7dab1', '04FX', 'CENTRO DE CONTROL Y COORDINACIÓN DE OPERACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527441-a7d7-11ed-b719-2c4138b7dab1', '04FY', 'CENTRO DE CÓMPUTO', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5274d7-a7d7-11ed-b719-2c4138b7dab1', '04FZ', 'CENTRO DE CONTROL VIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52755a-a7d7-11ed-b719-2c4138b7dab1', '04G0', 'SERVICIOS DE SEGURIDAD E INTELIGENCIA DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5275d3-a7d7-11ed-b719-2c4138b7dab1', '04G1', 'JEFATURA DE ESTADO MAYOR (SSIE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52764f-a7d7-11ed-b719-2c4138b7dab1', '04G2', 'DIVISIÓN DE ACCIONES TÁCTICAS Y GRUPOS ESPECIALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5276c5-a7d7-11ed-b719-2c4138b7dab1', '04G3', 'DIVISIÓN CIENTÍFICA (SSIE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527740-a7d7-11ed-b719-2c4138b7dab1', '04G4', 'DIVISIÓN GENERAL DE INTELIGENCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5277ba-a7d7-11ed-b719-2c4138b7dab1', '04G5', 'SERVICIOS DE PROTECCIÓN INSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527832-a7d7-11ed-b719-2c4138b7dab1', '04G6', 'SERVICIOS DE CUSTODIA Y ESCOLTAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5278a8-a7d7-11ed-b719-2c4138b7dab1', '04G7', 'SERVICIOS DE VIGILANCIA INSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527923-a7d7-11ed-b719-2c4138b7dab1', '04G8', 'SERVICIOS DE LA POLICÍA PROCESAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527999-a7d7-11ed-b719-2c4138b7dab1', '04G9', 'SEGURIDAD GUBERNAMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527a13-a7d7-11ed-b719-2c4138b7dab1', '04GA', 'INSTITUCIÓN POLICIAL ESTATAL FUERZA CIVIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527a8d-a7d7-11ed-b719-2c4138b7dab1', '04GB', 'AGENCIA DE ADMINISTRACIÓN PENITENCIARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527b07-a7d7-11ed-b719-2c4138b7dab1', '04GC', 'JEFATURA DE ESTADO MAYOR (AAP)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527b81-a7d7-11ed-b719-2c4138b7dab1', '04GD', 'DIRECCIÓN DE REINSERCIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527cfa-a7d7-11ed-b719-2c4138b7dab1', '04GE', 'CENTRO DE REINSERCIÓN SOCIAL NÚMERO 1 NORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527d88-a7d7-11ed-b719-2c4138b7dab1', '04GF', 'CENTRO DE REINSERCIÓN SOCIAL NÚMERO 2 NORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527e08-a7d7-11ed-b719-2c4138b7dab1', '04GG', 'CENTRO DE REINSERCIÓN SOCIAL NÚMERO 3 ORIENTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527e83-a7d7-11ed-b719-2c4138b7dab1', '04GH', 'CENTRO DE REINSERCIÓN SOCIAL FEMENIL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527f08-a7d7-11ed-b719-2c4138b7dab1', '04GI', 'CENTRO DE INTERNAMIENTO Y DE ADAPTACIÓN DE ADOLESCENTES INFRACTORES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a527f8b-a7d7-11ed-b719-2c4138b7dab1', '04GJ', 'UNIDAD DE MEDIDAS CAUTELARES Y SUSPENSIÓN CONDICIONAL DEL PROCESO (UMECA)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52800a-a7d7-11ed-b719-2c4138b7dab1', '04GK', 'DIRECCIÓN DE EVALUACIÓN DE RIESGO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528091-a7d7-11ed-b719-2c4138b7dab1', '04GL', 'DIRECCIÓN DE SUPERVISIÓN DE MEDIDAS CAUTELARES Y SUSPENSIÓN CONDICIONAL DEL PROCESO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528113-a7d7-11ed-b719-2c4138b7dab1', '04GM', 'DIRECCIÓN DE GESTIÓN Y ANÁLISIS DE INFORMACIÓN DE MEDIDAS CAUTELARES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528190-a7d7-11ed-b719-2c4138b7dab1', '04GN', 'ESCUELA SUPERIOR DE INTELIGENCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52820b-a7d7-11ed-b719-2c4138b7dab1', '04GO', 'CONSEJO DIRECTIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528284-a7d7-11ed-b719-2c4138b7dab1', '04GP', 'DIRECCIÓN GENERAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5282ff-a7d7-11ed-b719-2c4138b7dab1', '04GQ', 'DIVISIÓN DE INVESTIGACIÓN TECNOLÓGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528378-a7d7-11ed-b719-2c4138b7dab1', '04GR', 'DIVISIÓN CIENTÍFICA (ESI)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5283f2-a7d7-11ed-b719-2c4138b7dab1', '04GS', 'DIVISIÓN ACADÉMICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5284b8-a7d7-11ed-b719-2c4138b7dab1', '04GT', 'DIVISIÓN DE PROFESIONALIZACIÓN Y ESPECIALIZACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528544-a7d7-11ed-b719-2c4138b7dab1', '04GU', 'DIRECCIÓN DE PLANEACIÓN Y ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5285bc-a7d7-11ed-b719-2c4138b7dab1', '04GV', 'UNIDAD JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528638-a7d7-11ed-b719-2c4138b7dab1', '04GW', 'COMISIÓN DE HONOR Y JUSTICIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5286b3-a7d7-11ed-b719-2c4138b7dab1', '04GX', 'COMISIÓN DE CARRERA POLICIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52872c-a7d7-11ed-b719-2c4138b7dab1', '04GY', 'OFICINA DEL C. SECRETARIO DE ECONOMÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5287a7-a7d7-11ed-b719-2c4138b7dab1', '04GZ', 'SECRETARÍA TÉCNICA DE ECONOMÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528822-a7d7-11ed-b719-2c4138b7dab1', '04H0', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52889c-a7d7-11ed-b719-2c4138b7dab1', '04H1', 'DIRECCIÓN ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528915-a7d7-11ed-b719-2c4138b7dab1', '04H2', 'COMISIÓN ESTATAL DE MEJORA REGULATORIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52898d-a7d7-11ed-b719-2c4138b7dab1', '04H3', 'SUBSECRETARÍA DE INVERSIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528a09-a7d7-11ed-b719-2c4138b7dab1', '04H4', 'DIRECCIÓN DE APOYO Y FOMENTO A MPYMES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528a83-a7d7-11ed-b719-2c4138b7dab1', '04H5', 'DIRECCIÓN DE CADENAS PRODUCTIVAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528afb-a7d7-11ed-b719-2c4138b7dab1', '04H6', 'DIRECCIÓN DE INVERSIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528b73-a7d7-11ed-b719-2c4138b7dab1', '04H7', 'SUBSECRETARÍA DE FOMENTO EMPRESARIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528bf0-a7d7-11ed-b719-2c4138b7dab1', '04H8', 'DIRECCIÓN DE FOMENTO ECONÓMICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528c67-a7d7-11ed-b719-2c4138b7dab1', '04H9', 'DIRECCIÓN DE CLUSTERS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528cdf-a7d7-11ed-b719-2c4138b7dab1', '04HA', 'DIRECCIÓN DE DESARROLLO MINERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528d5a-a7d7-11ed-b719-2c4138b7dab1', '04HB', 'DIRECCIÓN DE FOMENTO ENERGÉTICO Y MINERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528dd7-a7d7-11ed-b719-2c4138b7dab1', '04HC', 'OFICINA DEL C. SECRETARIO DEL TRABAJO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528e4f-a7d7-11ed-b719-2c4138b7dab1', '04HD', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528ec9-a7d7-11ed-b719-2c4138b7dab1', '04HE', 'DIRECCIÓN DE CAPACITACIÓN Y CERTIFICACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528f40-a7d7-11ed-b719-2c4138b7dab1', '04HF', 'DIRECCIÓN ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a528fbd-a7d7-11ed-b719-2c4138b7dab1', '04HG', 'SUBSECRETARÍA DE COMPETITIVIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529039-a7d7-11ed-b719-2c4138b7dab1', '04HH', 'DIRECCIÓN DE COMPETENCIA Y COMPETITIVIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5290b0-a7d7-11ed-b719-2c4138b7dab1', '04HI', 'SUBSECRETARÍA DE TRABAJO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52912a-a7d7-11ed-b719-2c4138b7dab1', '04HJ', 'DIRECCIÓN DE SERVICIO ESTATAL DEL EMPLEO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5291a5-a7d7-11ed-b719-2c4138b7dab1', '04HK', 'DIRECCIÓN DE INSPECCIÓN Y DEFENSA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52921f-a7d7-11ed-b719-2c4138b7dab1', '04HL', 'DIRECCIÓN DE PREVISIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52929a-a7d7-11ed-b719-2c4138b7dab1', '04HM', 'PROCURADURÍA DE LA DEFENSA DEL TRABAJO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529319-a7d7-11ed-b719-2c4138b7dab1', '04HN', 'OFICINA DEL C. SECRETARIO DE DESARROLLO REGIONAL Y AGROPECUARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529395-a7d7-11ed-b719-2c4138b7dab1', '04HO', 'FIDEICOMISO ESTATAL AGROPECUARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529411-a7d7-11ed-b719-2c4138b7dab1', '04HP', 'FIDEICOMISO FONDO DE FOMENTO AGROPECUARIO (FOFAE)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52948a-a7d7-11ed-b719-2c4138b7dab1', '04HQ', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529503-a7d7-11ed-b719-2c4138b7dab1', '04HR', 'DIRECCIÓN DE ASUNTOS JURÍDICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529583-a7d7-11ed-b719-2c4138b7dab1', '04HS', 'DIRECCIÓN DE INFORMACIÓN SECTORIAL Y ESTADÍSTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5295fe-a7d7-11ed-b719-2c4138b7dab1', '04HT', 'DIRECCIÓN DE CONTROL DE PROCESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52967c-a7d7-11ed-b719-2c4138b7dab1', '04HU', 'UNIDAD DE ENLACE ADMINISTRATIVO Y CONTROL DE FIDEICOMISOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5296f7-a7d7-11ed-b719-2c4138b7dab1', '04HV', 'SUBSECRETARÍA DE FOMENTO AGROPECUARIO', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52978f-a7d7-11ed-b719-2c4138b7dab1', '04HW', 'DIRECCIÓN DE SEGURIDAD SANITARIA E INOCUIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52980f-a7d7-11ed-b719-2c4138b7dab1', '04HX', 'DIRECCIÓN DE FOMENTO AGROPECUARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529887-a7d7-11ed-b719-2c4138b7dab1', '04HY', 'DIRECCIÓN DE FOMENTO RURAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529901-a7d7-11ed-b719-2c4138b7dab1', '04HZ', 'SUBSECRETARÍA DE DESARROLLO REGIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52997f-a7d7-11ed-b719-2c4138b7dab1', '04I0', 'DIRECCIÓN DE INFRAESTRUCTURA Y COMUNIDADES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5299f9-a7d7-11ed-b719-2c4138b7dab1', '04I1', 'DIRECCIÓN DE DESARROLLO EMPRESARIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529a72-a7d7-11ed-b719-2c4138b7dab1', '04I2', 'DIRECCIÓN DE OFICINAS REGIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529b34-a7d7-11ed-b719-2c4138b7dab1', '04I3', 'OFICINA DEL C. SECRETARIO DE MOVILIDAD Y PLANEACIÓN URBANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529bc4-a7d7-11ed-b719-2c4138b7dab1', '04I4', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529c3f-a7d7-11ed-b719-2c4138b7dab1', '04I5', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529cb8-a7d7-11ed-b719-2c4138b7dab1', '04I6', 'UNIDAD DE ENLACE ADMINISTRATIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529d31-a7d7-11ed-b719-2c4138b7dab1', '04I7', 'DIRECCIÓN DE LICITACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529db1-a7d7-11ed-b719-2c4138b7dab1', '04I8', 'DIRECCIÓN DE VINCULACIÓN INTERSECTORIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529e2f-a7d7-11ed-b719-2c4138b7dab1', '04I9', 'DIRECCIÓN DE ASOCIACIONES PÚBLICO PRIVADAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529ea8-a7d7-11ed-b719-2c4138b7dab1', '04IA', 'SECRETARÍA PARTICULAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529f23-a7d7-11ed-b719-2c4138b7dab1', '04IB', 'DIRECCIÓN DE TRANSPARENCIA Y NORMATIVIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a529fa2-a7d7-11ed-b719-2c4138b7dab1', '04IC', 'UNIDAD DE INVERSIONES DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a01d-a7d7-11ed-b719-2c4138b7dab1', '04ID', 'REGISTRO ESTATAL DE CONTRATISTAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a096-a7d7-11ed-b719-2c4138b7dab1', '04IE', 'SUBSECRETARÍA DE DESARROLLO URBANO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a114-a7d7-11ed-b719-2c4138b7dab1', '04IF', 'DIRECCIÓN DE ESPACIO PÚBLICO Y MOVILIDAD NO MOTORIZADA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a196-a7d7-11ed-b719-2c4138b7dab1', '04IG', 'DIRECCIÓN DE ORDENAMIENTO TERRITORIAL Y DESARROLLO URBANO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a217-a7d7-11ed-b719-2c4138b7dab1', '04IH', 'DIRECCIÓN DE GESTIÓN DE DISTRITOS Y POLÍGONOS DE ACTUACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a290-a7d7-11ed-b719-2c4138b7dab1', '04II', 'DIRECCIÓN DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a309-a7d7-11ed-b719-2c4138b7dab1', '04IJ', 'DIRECCIÓN DE FORTALECIMIENTO URBANO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a386-a7d7-11ed-b719-2c4138b7dab1', '04IK', 'DIRECCIÓN DE INGENIERÍA URBANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a3fe-a7d7-11ed-b719-2c4138b7dab1', '04IL', 'SUBSECRETARÍA DE CONSTRUCCIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a478-a7d7-11ed-b719-2c4138b7dab1', '04IM', 'DIRECCIÓN DE VÍAS DE COMUNICACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a5f7-a7d7-11ed-b719-2c4138b7dab1', '04IN', 'DIRECCIÓN DE EDIFICACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a67f-a7d7-11ed-b719-2c4138b7dab1', '04IO', 'DIRECCIÓN DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a6fe-a7d7-11ed-b719-2c4138b7dab1', '04IP', 'DIRECCIÓN DE MAQUINARIA Y EQUIPO PESADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a776-a7d7-11ed-b719-2c4138b7dab1', '04IQ', 'DIRECCIÓN DE OBRAS ESPECIALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a7f1-a7d7-11ed-b719-2c4138b7dab1', '04IR', 'SUBSECRETARÍA DE PLANEACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a867-a7d7-11ed-b719-2c4138b7dab1', '04IS', 'DIRECCIÓN DE PLANEACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a8fe-a7d7-11ed-b719-2c4138b7dab1', '04IT', 'DIRECCIÓN DEL CENTRO DE COLABORACIÓN GEOESPACIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a97f-a7d7-11ed-b719-2c4138b7dab1', '04IU', 'REGISTRO ESTATAL DE CONTRATISTAS DE OBRAS PÚBLICAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52a9f5-a7d7-11ed-b719-2c4138b7dab1', '04IV', 'DIRECCIÓN DE BIENESTAR CIUDADANO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52aa70-a7d7-11ed-b719-2c4138b7dab1', '04IW', 'DIRECCIÓN DE INNOVACIÓN Y MEJORA CONTINUA DE PROCESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52aaee-a7d7-11ed-b719-2c4138b7dab1', '04IX', 'OFICINA DE LA C. SECRETARIA DE TURISMO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ab68-a7d7-11ed-b719-2c4138b7dab1', '04IY', 'OFICINA DEL C. SECRETARIO DEL MEDIO AMBIENTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52abdc-a7d7-11ed-b719-2c4138b7dab1', '04IZ', 'SECRETARÍA PARTICULAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52acb9-a7d7-11ed-b719-2c4138b7dab1', '04J0', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ad3e-a7d7-11ed-b719-2c4138b7dab1', '04J1', 'DIRECCIÓN INTERSECTORIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52adba-a7d7-11ed-b719-2c4138b7dab1', '04J2', 'DIRECCIÓN DE PLANEACIÓN Y SUSTENTABILIDAD ENERGÉTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ae2e-a7d7-11ed-b719-2c4138b7dab1', '04J3', 'DIRECCIÓN DE VINCULACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52aec3-a7d7-11ed-b719-2c4138b7dab1', '04J4', 'SUBSECRETARÍA DE PROTECCIÓN AL MEDIO AMBIENTE Y RECURSOS NATURALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52af47-a7d7-11ed-b719-2c4138b7dab1', '04J5', 'DIRECCIÓN DE GESTIÓN INTEGRAL DE LA CALIDAD DEL AIRE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52afc0-a7d7-11ed-b719-2c4138b7dab1', '04J6', 'DIRECCIÓN DE GESTORÍA Y TRÁMITES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b039-a7d7-11ed-b719-2c4138b7dab1', '04J7', 'DIRECCIÓN DE CULTURA Y REGULACIÓN AMBIENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b0b2-a7d7-11ed-b719-2c4138b7dab1', '04J8', 'DIRECCIÓN DE BIENESTAR Y SUSTENTABILIDAD ANIMAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b12e-a7d7-11ed-b719-2c4138b7dab1', '04J9', 'SUBSECRETARÍA DE CAMBIO CLIMÁTICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b1a7-a7d7-11ed-b719-2c4138b7dab1', '04JA', 'DIRECCIÓN DE POLÍTICA DE CAMBIO CLIMÁTICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b224-a7d7-11ed-b719-2c4138b7dab1', '04JB', 'DIRECCIÓN DE POLÍTICA ENERGÉTICA Y ECONOMÍA BAJA EN CARBONO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b29f-a7d7-11ed-b719-2c4138b7dab1', '04JC', 'DIRECCIÓN DE INVENTARIO Y REGISTRO ESTATAL DE EMISIONES GyCEI\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b31b-a7d7-11ed-b719-2c4138b7dab1', '04JD', 'PROCURADURÍA ESTATAL DE DESARROLLO SUSTENTABLE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b395-a7d7-11ed-b719-2c4138b7dab1', '04JE', 'DIRECCIÓN DE INSPECCIÓN Y VIGILANCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b45c-a7d7-11ed-b719-2c4138b7dab1', '04JF', 'OFICINA DE LA C. SECRETARIA DE IGUALDAD E INCLUSIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b4e7-a7d7-11ed-b719-2c4138b7dab1', '04JG', 'DIRECCIÓN DE OPERACIONES Y COMUNICACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b560-a7d7-11ed-b719-2c4138b7dab1', '04JH', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b5da-a7d7-11ed-b719-2c4138b7dab1', '04JI', 'ENLACE DE GESTIÓN ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b64f-a7d7-11ed-b719-2c4138b7dab1', '04JJ', 'PROGRAMA  ALIADOS CONTIGO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b6cc-a7d7-11ed-b719-2c4138b7dab1', '04JK', 'SUBSECRETARÍA DE INCLUSIÓN SOCIAL Y ATENCIÓN A GRUPOS VULNERABLES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b746-a7d7-11ed-b719-2c4138b7dab1', '04JL', 'DIRECCIÓN DE INCLUSIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b7c1-a7d7-11ed-b719-2c4138b7dab1', '04JM', 'DIRECCIÓN DE ATENCIÓN A GRUPOS VULNERABLES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b83a-a7d7-11ed-b719-2c4138b7dab1', '04JN', 'SUBSECRETARÍA DE DESARROLLO INTEGRAL COMUNITARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b8b0-a7d7-11ed-b719-2c4138b7dab1', '04JO', 'DIRECCIÓN DE PROMOCIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b92a-a7d7-11ed-b719-2c4138b7dab1', '04JP', 'DIRECCIÓN DE CENTROS COMUNITARIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52b9a5-a7d7-11ed-b719-2c4138b7dab1', '04JQ', 'SUBSECRETARÍA DE DIVERSIDAD E INCLUSIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ba1c-a7d7-11ed-b719-2c4138b7dab1', '04JR', 'DIRECCIÓN DE PLANEACIÓN Y EVALUACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ba92-a7d7-11ed-b719-2c4138b7dab1', '04JS', 'DIRECCIÓN DE INNOVACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52bb10-a7d7-11ed-b719-2c4138b7dab1', '04JT', 'SUBSECRETARÍA DE VINCULACIÓN Y PROYECTOS ESTRATÉGICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52bb85-a7d7-11ed-b719-2c4138b7dab1', '04JU', 'DIRECCIÓN DE VINCULACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52bbfe-a7d7-11ed-b719-2c4138b7dab1', '04JV', 'DIRECCIÓN DE DESARROLLO DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52bc78-a7d7-11ed-b719-2c4138b7dab1', '04JW', 'JUNTA DE BENEFICENCIA PRIVADA DEL ESTADO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52bcf5-a7d7-11ed-b719-2c4138b7dab1', '04JX', 'OFICINA DE LA C. SECRETARIA DE EDUCACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52bd6e-a7d7-11ed-b719-2c4138b7dab1', '04JY', 'FIDEICOMISO PROGRAMA ESCUELAS DE CALIDAD (PEC)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52bdea-a7d7-11ed-b719-2c4138b7dab1', '04JZ', 'FIDEICOMISO DE EQUIPAMIENTO EDUCATIVO BP1018 (FIDEQUIPA)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52be5e-a7d7-11ed-b719-2c4138b7dab1', '04K0', 'ESCUELA NORMAL SUPERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52beda-a7d7-11ed-b719-2c4138b7dab1', '04K1', 'SUBSECRETARÍA DE PLANEACIÓN Y FINANZAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52bf52-a7d7-11ed-b719-2c4138b7dab1', '04K2', 'DIRECCIÓN GENERAL DE RECURSOS HUMANOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52bfc9-a7d7-11ed-b719-2c4138b7dab1', '04K3', 'DIRECCIÓN DE SELECCIÓN Y CONTRATACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c041-a7d7-11ed-b719-2c4138b7dab1', '04K4', 'DIRECCIÓN DE NÓMINAS Y PRESTACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c0bb-a7d7-11ed-b719-2c4138b7dab1', '04K5', 'DIRECCIÓN DE RELACIONES LABORALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c135-a7d7-11ed-b719-2c4138b7dab1', '04K6', 'COORDINACIÓN DE ESTUDIOS TÉCNICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c1aa-a7d7-11ed-b719-2c4138b7dab1', '04K7', 'SUELDOS Y PRESTACIONES MAGISTERIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c26a-a7d7-11ed-b719-2c4138b7dab1', '04K8', 'DIRECCIÓN GENERAL DE ADMINISTRACIÓN Y FINANZAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c2f6-a7d7-11ed-b719-2c4138b7dab1', '04K9', 'DIRECCIÓN DE ADMINISTRACIÓN FINANCIERA Y CONTABILIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c36e-a7d7-11ed-b719-2c4138b7dab1', '04KA', 'DIRECCIÓN DE INFORMÁTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c3e9-a7d7-11ed-b719-2c4138b7dab1', '04KB', 'DIRECCIÓN DE ADMINISTRACIÓN CENTRAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c465-a7d7-11ed-b719-2c4138b7dab1', '04KC', 'DIRECCIÓN GENERAL DE PLANEACIÓN Y COORDINACIÓN EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c4e1-a7d7-11ed-b719-2c4138b7dab1', '04KD', 'DIRECCIÓN DE PROGRAMACIÓN Y PRESUPUESTO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c559-a7d7-11ed-b719-2c4138b7dab1', '04KE', 'DIRECCIÓN DE CALIDAD EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c5ce-a7d7-11ed-b719-2c4138b7dab1', '04KF', 'COORDINACIÓN DE ESTADÍSTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c646-a7d7-11ed-b719-2c4138b7dab1', '04KG', 'DIRECCIÓN DE PLANEACIÓN ESTRATÉGICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c6c0-a7d7-11ed-b719-2c4138b7dab1', '04KH', 'COORDINACIÓN OPERATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c73a-a7d7-11ed-b719-2c4138b7dab1', '04KI', 'COORDINACIÓN DE PROGRAMAS COMPENSATORIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c7b1-a7d7-11ed-b719-2c4138b7dab1', '04KJ', 'SUBSECRETARÍA DE EDUCACIÓN BÁSICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c827-a7d7-11ed-b719-2c4138b7dab1', '04KK', 'FIDEICOMISO 62364 INNOVEC NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c8a1-a7d7-11ed-b719-2c4138b7dab1', '04KL', 'FIDEICOMISO BP3417 CENDIS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c91b-a7d7-11ed-b719-2c4138b7dab1', '04KM', 'DIRECCIÓN DE EDUCACIÓN INICIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52c993-a7d7-11ed-b719-2c4138b7dab1', '04KN', 'DIRECCIÓN DE EDUCACIÓN PREESCOLAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ca09-a7d7-11ed-b719-2c4138b7dab1', '04KO', 'DIRECCIÓN DE EDUCACIÓN PRIMARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ca83-a7d7-11ed-b719-2c4138b7dab1', '04KP', 'DIRECCIÓN DE EDUCACIÓN SECUNDARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52caf7-a7d7-11ed-b719-2c4138b7dab1', '04KQ', 'COORDINACIÓN DE IDIOMAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52cb6e-a7d7-11ed-b719-2c4138b7dab1', '04KR', 'COORDINACIÓN DE TECNOLOGÍA EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52cbe8-a7d7-11ed-b719-2c4138b7dab1', '04KS', 'DIRECCIÓN DE EDUCACIÓN FÍSICA Y DEPORTES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52cc63-a7d7-11ed-b719-2c4138b7dab1', '04KT', 'DIRECCIÓN DE EDUCACIÓN EXTRAESCOLAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ccdb-a7d7-11ed-b719-2c4138b7dab1', '04KU', 'DIRECCIÓN DE EDUCACIÓN ESPECIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ce4d-a7d7-11ed-b719-2c4138b7dab1', '04KV', 'DIRECCIÓN DE PARTICIPACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ceda-a7d7-11ed-b719-2c4138b7dab1', '04KW', 'SUBSECRETARÍA DE DESARROLLO MAGISTERIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52cf59-a7d7-11ed-b719-2c4138b7dab1', '04KX', 'DIRECCIÓN DE INSTITUCIONES FORMADORAS DE DOCENTES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52cfd6-a7d7-11ed-b719-2c4138b7dab1', '04KY', 'DIRECCIÓN DE CENTROS DE CAPACITACIÓN DEL MAGISTERIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d04f-a7d7-11ed-b719-2c4138b7dab1', '04KZ', 'DIRECCIÓN DE CARRERA MAGISTERIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d0cd-a7d7-11ed-b719-2c4138b7dab1', '04L0', 'COORDINACIÓN DEL SISTEMA ESTATAL DE EDUCACIÓN PARA ADULTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d14f-a7d7-11ed-b719-2c4138b7dab1', '04L1', 'COORDINACIÓN DE PROYECTOS DE INVESTIGACIÓN E INNOVACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d1ce-a7d7-11ed-b719-2c4138b7dab1', '04L2', 'SUBSECRETARÍA DE EDUCACIÓN MEDIA SUPERIOR Y SUPERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d246-a7d7-11ed-b719-2c4138b7dab1', '04L3', 'DIRECCIÓN DE EDUCACIÓN SUPERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d2c0-a7d7-11ed-b719-2c4138b7dab1', '04L4', 'DIRECCIÓN DE EDUCACIÓN MEDIA SUPERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d339-a7d7-11ed-b719-2c4138b7dab1', '04L5', 'DIRECCIÓN DE ACREDITACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d3d5-a7d7-11ed-b719-2c4138b7dab1', '04L6', 'COORDINACIÓN DEL PROYECTO DE MODERNIZACIÓN DE LA EDUCACIÓN TÉCNICA (PMETyC)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d453-a7d7-11ed-b719-2c4138b7dab1', '04L7', 'COORDINACIÓN DE SERVICIO SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d4cd-a7d7-11ed-b719-2c4138b7dab1', '04L8', 'DIRECCIÓN GENERAL DE LA OFICINA DEL SECRETARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d54b-a7d7-11ed-b719-2c4138b7dab1', '04L9', 'DIRECCIÓN DE COMUNICACIÓN Y PRENSA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d5c6-a7d7-11ed-b719-2c4138b7dab1', '04LA', 'DIRECCIÓN DE CONTROL DE GESTIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d645-a7d7-11ed-b719-2c4138b7dab1', '04LB', 'COORDINACIÓN DE ORGANISMOS DESCENTRALIZADOS Y DESCONCENTRADOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d6c0-a7d7-11ed-b719-2c4138b7dab1', '04LC', 'SECRETARÍA PARTICULAR DE LA C. SECRETARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d73e-a7d7-11ed-b719-2c4138b7dab1', '04LD', 'COORDINACIÓN DE UNIDADES REGIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d7ba-a7d7-11ed-b719-2c4138b7dab1', '04LE', 'DIRECCIÓN GENERAL DE EVALUACIÓN EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d831-a7d7-11ed-b719-2c4138b7dab1', '04LF', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d8ab-a7d7-11ed-b719-2c4138b7dab1', '04LG', 'DIRECCIÓN DE RECURSOS MATERIALES Y SERVICIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d925-a7d7-11ed-b719-2c4138b7dab1', '04LH', 'CENTRO ESTATAL DE BECAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52d9a1-a7d7-11ed-b719-2c4138b7dab1', '04LI', 'COORDINACIÓN DEL INSTITUTO DE SALUD MENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52da18-a7d7-11ed-b719-2c4138b7dab1', '04LJ', 'UNIVERSIDAD CIUDADANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52da92-a7d7-11ed-b719-2c4138b7dab1', '04LK', 'OFICINA DE LA C. SECRETARIA DE SALUD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52db0d-a7d7-11ed-b719-2c4138b7dab1', '04LL', 'SECRETARÍA PARTICULAR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52db84-a7d7-11ed-b719-2c4138b7dab1', '04LM', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52dbfb-a7d7-11ed-b719-2c4138b7dab1', '04LN', 'DIRECCIÓN DE CONTRALORÍA INTERNA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52dc77-a7d7-11ed-b719-2c4138b7dab1', '04LO', 'DIRECCIÓN ENSEÑANZA INVESTIGACIÓN DE SALUD Y CALIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52dcf5-a7d7-11ed-b719-2c4138b7dab1', '04LP', 'DIRECCIÓN DE SALUD MENTAL Y ADICCIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52dd6f-a7d7-11ed-b719-2c4138b7dab1', '04LQ', 'UNIDAD DE COMUNICACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ddeb-a7d7-11ed-b719-2c4138b7dab1', '04LR', 'SUBSECRETARÍA DE PREVENCIÓN Y CONTROL DE ENFERMEDADES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52de62-a7d7-11ed-b719-2c4138b7dab1', '04LS', 'DIRECCIÓN DE SALUD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52dedf-a7d7-11ed-b719-2c4138b7dab1', '04LT', 'DIRECCIÓN DE PROMOCIÓN DE LA SALUD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52df59-a7d7-11ed-b719-2c4138b7dab1', '04LU', 'DIRECCIÓN DE ENFERMERÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52dfd6-a7d7-11ed-b719-2c4138b7dab1', '04LV', 'DIRECCIÓN SECTORIAL ENTRE DEPENDENCIAS DE SALUD', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e06b-a7d7-11ed-b719-2c4138b7dab1', '04LW', 'SUBSECRETARÍA DE REGULACIÓN Y FOMENTO SANITARIO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e0ec-a7d7-11ed-b719-2c4138b7dab1', '04LX', 'DIRECCIÓN DE CONTROL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e1ae-a7d7-11ed-b719-2c4138b7dab1', '04LY', 'DIRECCIÓN DE FOMENTO Y CALIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e23b-a7d7-11ed-b719-2c4138b7dab1', '04LZ', 'COORDINACIÓN DE PROCEDIMIENTOS DE REGULACIÓN SANITARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e2bb-a7d7-11ed-b719-2c4138b7dab1', '04M0', 'COORDINACIÓN GENERAL DE OFICINAS REGIONALES DE REGULACIÓN SANITARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e33d-a7d7-11ed-b719-2c4138b7dab1', '04M1', 'COMISIÓN ESTATAL DE ARBITRAJE MÉDICO (COESAMED)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e3b7-a7d7-11ed-b719-2c4138b7dab1', '04M2', 'CENTRO DE ESPECIALIDADES DENTALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e436-a7d7-11ed-b719-2c4138b7dab1', '04M3', 'OFICINA DE LA C. TITULAR DE LA SECRETARÍA  DE LAS MUJERES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e4b1-a7d7-11ed-b719-2c4138b7dab1', '04M4', 'JUNTA LOCAL DE CONCILIACIÓN Y ARBITRAJE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e530-a7d7-11ed-b719-2c4138b7dab1', '04M5', 'TRIBUNAL DE JUSTICIA ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e5a8-a7d7-11ed-b719-2c4138b7dab1', '04M6', 'TRIBUNAL DE ARBITRAJE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e62d-a7d7-11ed-b719-2c4138b7dab1', '04M7', 'CONSEJO ESTATAL PARA PREVENIR Y ELIMINAR LA DISCRIMINACIÓN EN EL ESTADO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e6a9-a7d7-11ed-b719-2c4138b7dab1', '04M8', 'DIRECCIÓN GENERAL JURÍDICA TRIBUTARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e727-a7d7-11ed-b719-2c4138b7dab1', '04M9', 'SUBSECRETARÍA DE POLÍTICA DE INGRESOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e7a3-a7d7-11ed-b719-2c4138b7dab1', '04MA', 'UNIDAD DE INVERSIONES Y FINANCIAMIENTO DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e81b-a7d7-11ed-b719-2c4138b7dab1', '04MB', 'FIDEICOMISO LÍNEA 3\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e897-a7d7-11ed-b719-2c4138b7dab1', '04MC', 'UNIDAD DE INFORMACIÓN FINANCIERA Y SEGUIMIENTO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e957-a7d7-11ed-b719-2c4138b7dab1', '04MD', 'COORDINACIÓN DE PLANEACIÓN HACENDARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52e9e5-a7d7-11ed-b719-2c4138b7dab1', '04ME', 'SUBSECRETARÍA DE ADMINISTRACIÓN TRIBUTARIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ea63-a7d7-11ed-b719-2c4138b7dab1', '04MF', 'DIRECCIÓN GENERAL DE CRÉDITOS Y COBRANZA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52eadd-a7d7-11ed-b719-2c4138b7dab1', '04MG', 'DIRECCIÓN GENERAL DE COMERCIO EXTERIOR\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52eb5b-a7d7-11ed-b719-2c4138b7dab1', '04MH', 'DIRECCIÓN GENERAL DE FISCALIZACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ebd6-a7d7-11ed-b719-2c4138b7dab1', '04MI', 'DIRECCIÓN GENERAL DE RECAUDACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ec52-a7d7-11ed-b719-2c4138b7dab1', '04MJ', 'DIRECCIÓN GENERAL DE SERVICIOS AL CONTRIBUYENTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ecd0-a7d7-11ed-b719-2c4138b7dab1', '04MK', 'COORDINACIÓN GENERAL DE TECNOLOGÍAS DE LA INFORMACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ed4f-a7d7-11ed-b719-2c4138b7dab1', '04ML', 'DIRECCIÓN DE INFORMACIÓN Y SISTEMAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52edcb-a7d7-11ed-b719-2c4138b7dab1', '04MM', 'COORDINACIÓN GENERAL ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ee45-a7d7-11ed-b719-2c4138b7dab1', '04MN', 'DIRECCIÓN DE ADQUISICIONES Y SERVICIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52eebe-a7d7-11ed-b719-2c4138b7dab1', '04MO', 'DIRECCIÓN DE COMPETENCIA Y COMPETITIVIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ef38-a7d7-11ed-b719-2c4138b7dab1', '04MP', 'DIRECCIÓN DE INNOVACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52efb1-a7d7-11ed-b719-2c4138b7dab1', '04MQ', 'DIRECCIÓN DE FOMENTO A LA MUJER\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f02a-a7d7-11ed-b719-2c4138b7dab1', '04MR', 'UNIDAD DE GESTIÓN DOCUMENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f0ab-a7d7-11ed-b719-2c4138b7dab1', '04MS', 'ÓRGANO INTERNO DE CONTROL DEL SISTEMA DE TRANSPORTE COLECTIVO (METRORREY)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f131-a7d7-11ed-b719-2c4138b7dab1', '04MT', 'ÓRGANO INTERNO DE CONTROL DEL INSTITUTO DE MOVILIDAD Y ACCESIBILIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f1b2-a7d7-11ed-b719-2c4138b7dab1', '04MU', 'ÓRGANO INTERNO DE CONTROL DE LA SECRETARÍA DE SEGURIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f22f-a7d7-11ed-b719-2c4138b7dab1', '04MV', 'SUBSECRETARÍA DE PREVENCIÓN Y SEGURIDAD HUMANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f2ae-a7d7-11ed-b719-2c4138b7dab1', '04MW', 'ÓRGANO INTERNO DE CONTROL DE LA UNIDAD DE INTEGRACIÓN EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f330-a7d7-11ed-b719-2c4138b7dab1', '04MX', 'ÓRGANO INTERNO DE CONTROL DEL FIDEICOMISO DE PROYECTOS ESTRATÉGICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f3b1-a7d7-11ed-b719-2c4138b7dab1', '04MY', 'ÓRGANO INTERNO DE CONTROL DE LA SECRETARÍA DE ADMINISTRACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f42a-a7d7-11ed-b719-2c4138b7dab1', '04MZ', 'SUBSECRETARÍA DE TRANSPORTE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f4a3-a7d7-11ed-b719-2c4138b7dab1', '04N0', 'DIRECCIÓN DE TRANSPORTE PÚBLICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f523-a7d7-11ed-b719-2c4138b7dab1', '04N1', 'DIRECCIÓN DE LOGÍSTICA Y TRANSPORTE DE CARGA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f696-a7d7-11ed-b719-2c4138b7dab1', '04N2', 'DIRECCIÓN DE CLUSTERS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f722-a7d7-11ed-b719-2c4138b7dab1', '04N3', 'DIRECCIÓN DE APOYO Y FOMENTO A MICRO', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f7ba-a7d7-11ed-b719-2c4138b7dab1', '04N4', 'COMISIÓN ESTATAL DE MEJORA REGULATORIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f83b-a7d7-11ed-b719-2c4138b7dab1', '04N5', 'DIRECCIÓN DE EVALUACIÓN EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f8bc-a7d7-11ed-b719-2c4138b7dab1', '04N6', 'DIRECCIÓN DE RELACIONES INTERNACIONALES E IGUALDAD DE GÉNERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f940-a7d7-11ed-b719-2c4138b7dab1', '04N7', 'DIRECCIÓN DE INNOVACIÓN TECNOLÓGICA DE LA INFORMACIÓN Y COMUNICACIÓN EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52f9bf-a7d7-11ed-b719-2c4138b7dab1', '04N8', 'DIRECCIÓN DE UNIDADES REGIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52fa3e-a7d7-11ed-b719-2c4138b7dab1', '04N9', 'DIRECCIÓN DE PLANEACIÓN ESTRATÉGICA Y CALIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52fabb-a7d7-11ed-b719-2c4138b7dab1', '04NA', 'DIRECCIÓN GENERAL DE EDUCACIÓN INCLUSIVA \r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52fb34-a7d7-11ed-b719-2c4138b7dab1', '04NB', 'DIRECCIÓN DE EDUCACIÓN ESPECIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52fbb1-a7d7-11ed-b719-2c4138b7dab1', '04NC', 'DIRECCIÓN DE PRIMERA INFANCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52fc2c-a7d7-11ed-b719-2c4138b7dab1', '04ND', 'DIRECCIÓN DE ESCUELAS PARTICULARES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52fca4-a7d7-11ed-b719-2c4138b7dab1', '04NE', 'COORDINACIÓN DE ACREDITACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52fd32-a7d7-11ed-b719-2c4138b7dab1', '04NF', 'DIRECCIÓN DE DESARROLLO INSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52fdb5-a7d7-11ed-b719-2c4138b7dab1', '04NG', 'DIRECCIÓN DE DESARROLLO ACADÉMICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52fe2e-a7d7-11ed-b719-2c4138b7dab1', '04NH', 'COORDINACIÓN DE ACREDITACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52febd-a7d7-11ed-b719-2c4138b7dab1', '04NI', 'COORDINACIÓN DE INNOVACIÓN Y CALIDAD EDUCATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ff3d-a7d7-11ed-b719-2c4138b7dab1', '04NJ', 'COORDINACIÓN DE MONITOREO Y DESARROLLO EDUCATIVO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a52ffb9-a7d7-11ed-b719-2c4138b7dab1', '04NK', 'COORDINACIÓN DE ACREDITACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a53004c-a7d7-11ed-b719-2c4138b7dab1', '04NL', 'DIRECCIÓN GENERAL DE GESTIÓN Y PROYECTOS ESTRATÉGICOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5300c9-a7d7-11ed-b719-2c4138b7dab1', '04NM', 'DIRECCIÓN DE CONTROL DE GESTIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a53013f-a7d7-11ed-b719-2c4138b7dab1', '04NN', 'CENTRO ESTATAL DE BECAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5301c1-a7d7-11ed-b719-2c4138b7dab1', '04NO', 'COORDINACIÓN DE ORGANISMOS DESCENTRALIZADOS Y DESCONCENTRADOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a53023a-a7d7-11ed-b719-2c4138b7dab1', '04NP', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5302b4-a7d7-11ed-b719-2c4138b7dab1', '04NQ', 'DIRECCIÓN DE COMUNICACIÓN Y PRENSA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530330-a7d7-11ed-b719-2c4138b7dab1', '04NR', 'DIRECCIÓN DE RECURSOS MATERIALES Y DE SERVICIOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5303ad-a7d7-11ed-b719-2c4138b7dab1', '04NS', 'DIRECCIÓN JURÍDICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530427-a7d7-11ed-b719-2c4138b7dab1', '04NT', 'SUBSECRETARÍA DE RECURSOS HUMANOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5304a1-a7d7-11ed-b719-2c4138b7dab1', '04NU', 'DIRECCIÓN DE SELECCIÓN Y CONTRATACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a53051a-a7d7-11ed-b719-2c4138b7dab1', '04NV', 'DIRECCIÓN DE NÓMINAS Y PRESTACIONES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530598-a7d7-11ed-b719-2c4138b7dab1', '04NW', 'DIRECCIÓN DE RELACIONES LABORALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530612-a7d7-11ed-b719-2c4138b7dab1', '04NX', 'DIRECCIÓN DE DESARROLLO ORGANIZACIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530698-a7d7-11ed-b719-2c4138b7dab1', '04NY', 'COORDINACIÓN ESTATAL DE LA UNIDAD DEL SISTEMA PARA LA CARRERA DE LAS MAESTRAS Y LOS MAESTROS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530728-a7d7-11ed-b719-2c4138b7dab1', '04NZ', 'OFICINA DE LA PERSONA TITULAR DE LA SECRETARÍA EJECUTIVA DEL CONSEJO DE COORDINACIÓN DEL SISTEMA INTEGRAL DE SEGURIDAD PÚBLICA DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5307af-a7d7-11ed-b719-2c4138b7dab1', '04O0', 'DIRECCIÓN JURÍDICA Y DE RELACIONES INSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530835-a7d7-11ed-b719-2c4138b7dab1', '04O1', 'COORDINACIÓN EJECUTIVA DEL FONDO DE APORTACIONES PARA LA SEGURIDAD PÚBLICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5308b1-a7d7-11ed-b719-2c4138b7dab1', '04O2', 'DIRECCIÓN DE GESTIÓN DE LA VIALIDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530973-a7d7-11ed-b719-2c4138b7dab1', '04O3', 'NUEVO CENTRO DE CONCILIACIÓN LABORAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5309ff-a7d7-11ed-b719-2c4138b7dab1', '04O4', 'SUBSECRETARÍA DE GESTIÓN INTEGRAL DEL AGUA', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530a90-a7d7-11ed-b719-2c4138b7dab1', '04O5', 'DIRECCIÓN DE POLÍTICA PARA LA GESTIÓN DEL AGUA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530b0e-a7d7-11ed-b719-2c4138b7dab1', '04O6', 'DIRECCIÓN DE AGUA RESIDUAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530b8b-a7d7-11ed-b719-2c4138b7dab1', '04O7', 'DIRECCIÓN DE GESTIÓN INTEGRAL DE RESIDUOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530c0c-a7d7-11ed-b719-2c4138b7dab1', '04O8', 'DIRECCIÓN DE CONSERVACIÓN DE LA BIODIVERSIDAD Y DEL SUELO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530c85-a7d7-11ed-b719-2c4138b7dab1', '04O9', 'DIRECCIÓN DE BIENESTAR ANIMAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530cff-a7d7-11ed-b719-2c4138b7dab1', '04OA', 'DIRECCIÓN DE IMPACTO Y RIESGO AMBIENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530d78-a7d7-11ed-b719-2c4138b7dab1', '04OB', 'UNIDAD DE ENLACE DE PROYECTOS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530df9-a7d7-11ed-b719-2c4138b7dab1', '04OC', 'SUBSECRETARÍA DE CAMBIO CLIMÁTICO Y CALIDAD DEL AIRE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530e75-a7d7-11ed-b719-2c4138b7dab1', '04OD', 'DIRECCIÓN DE POLÍTICA DE CAMBIO CLIMÁTICO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530ef4-a7d7-11ed-b719-2c4138b7dab1', '04OE', 'ÓRGANO INTERNO DE CONTROL DE SERVICIOS DE AGUA Y DRENAJE DE MONTERREY\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a530f7f-a7d7-11ed-b719-2c4138b7dab1', '04OF', 'ÓRGANO INTERNO DE CONTROL DEL INSTITUTO DE SEGURIDAD Y SERVICIOS SOCIALES DE LOS TRABAJADORES DEL ESTADO DE NUEVO LEÓN (ISSSTELEON)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531008-a7d7-11ed-b719-2c4138b7dab1', '04OG', 'ÓRGANO INTERNO DE CONTROL DE LA RED ESTATAL DE AUTOPISTAS DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5310ea-a7d7-11ed-b719-2c4138b7dab1', '04OH', 'ÓRGANO INTERNO DE CONTROL DEL INSTITUTO CONSTRUCTOR DE INFRAESTRUCTURA FÍSICA EDUCATIVA Y DEPORTIVA DE NUEVO LEÓN (ICIFED)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531178-a7d7-11ed-b719-2c4138b7dab1', '04OI', 'ÓRGANO INTERNO DE CONTROL DEL SISTEMA PARA EL DESARROLLO INTEGRAL DE LA FAMILIA DEL ESTADO DE NUEVO LEÓN (DIF)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531202-a7d7-11ed-b719-2c4138b7dab1', '04OJ', 'ÓRGANO INTERNO DE CONTROL DEL COLEGIO DE EDUCACIÓN PROFESIONAL TÉCNICA DE NUEVO LEÓN (CONALEP)\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a53128d-a7d7-11ed-b719-2c4138b7dab1', '04OK', 'ÓRGANO INTERNO DE CONTROL DE LA SECRETARÍA DE SALUD /  SERVICIOS DE SALUD DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531310-a7d7-11ed-b719-2c4138b7dab1', '04OL', 'ÓRGANO INTERNO DE CONTROL DE LA SECRETARÍA DE IGUALDAD E INCLUSIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531393-a7d7-11ed-b719-2c4138b7dab1', '04OM', 'OFICINA DE SEGUIMIENTO AL ACUERDO POR LA SEGURIDAD: NUEVO LEÓN 2021 - 2027\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531410-a7d7-11ed-b719-2c4138b7dab1', '04ON', 'DIRECCIÓN DE RELACIONES INTERINSTITUCIONALES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531491-a7d7-11ed-b719-2c4138b7dab1', '04OO', 'DIRECCIÓN DE ASISTENCIA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a53150c-a7d7-11ed-b719-2c4138b7dab1', '04OP', 'UNIDAD DE ATENCIÓN AL POLICÍA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a53158b-a7d7-11ed-b719-2c4138b7dab1', '04OQ', 'CENTRO ESTATAL DE PREVENCIÓN DE LA VIOLENCIA Y LA DELICUENCIA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531603-a7d7-11ed-b719-2c4138b7dab1', '04OR', 'DIRECCIÓN ADMINISTRATIVA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531682-a7d7-11ed-b719-2c4138b7dab1', '04OS', 'UNIDAD DE ENLACE DE COMUNICACIÓN SOCIAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531704-a7d7-11ed-b719-2c4138b7dab1', '04OT', 'DIRECCIÓN DE REGISTRO ESTATAL DE GASES Y COMPUESTOS DE EFECTO INVERNADERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a53177e-a7d7-11ed-b719-2c4138b7dab1', '04OU', 'UNIDAD DE IGUALDAD DE GÉNERO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5317f8-a7d7-11ed-b719-2c4138b7dab1', '04OV', 'FIDEICOMISO FIDEMEJORA BANORTE N°750147\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531872-a7d7-11ed-b719-2c4138b7dab1', '04OW', 'DIRECCIÓN DE PLANEACIÓN', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531900-a7d7-11ed-b719-2c4138b7dab1', '04OX', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531981-a7d7-11ed-b719-2c4138b7dab1', '04OY', 'DIRECCIÓN DE GESTIÓN INTEGRAL DEL AIRE\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5319fa-a7d7-11ed-b719-2c4138b7dab1', '04OZ', 'OFICIALÍA DE PARTES\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531a74-a7d7-11ed-b719-2c4138b7dab1', '04P0', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531af1-a7d7-11ed-b719-2c4138b7dab1', '04P1', 'DIRECCIÓN PARA LA NO DISCRIMINACIÓN E IGUALDAD\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531b68-a7d7-11ed-b719-2c4138b7dab1', '04P2', 'UNIDAD DE LOGÍSTICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531be2-a7d7-11ed-b719-2c4138b7dab1', '04P3', 'SECRETARÍA TÉCNICA DE GOBIERNO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531c5d-a7d7-11ed-b719-2c4138b7dab1', '04P4', 'FIDEICOMISO SEDENA BP6822\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531cd8-a7d7-11ed-b719-2c4138b7dab1', '04P5', 'DIRECCIÓN DE ALIANZAS ESTRATÉGICAS\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531d52-a7d7-11ed-b719-2c4138b7dab1', '04P6', 'DIRECCIÓN DE CULTURA Y EDUCACIÓN AMBIENTAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531eca-a7d7-11ed-b719-2c4138b7dab1', '04P7', 'UNIDAD DE ATENCIÓN A LA MUJER\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531f55-a7d7-11ed-b719-2c4138b7dab1', '04P8', 'SECRETARÍA TÉCNICA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a531fd2-a7d7-11ed-b719-2c4138b7dab1', '04P9', 'DIRECCIÓN DE POLÍTICA LABORAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a532053-a7d7-11ed-b719-2c4138b7dab1', '04PA', 'DIRECCIÓN DE PRODUCTIVIDAD LABORAL Y VINCULACIÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5320d2-a7d7-11ed-b719-2c4138b7dab1', '04PB', 'DIRECCIÓN DE SEGURIDAD HUMANA\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a532151-a7d7-11ed-b719-2c4138b7dab1', '04PC', 'SINDICATO ÚNICO DE SERVIDORES PÚBLICOS DEL ESTADO\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a5321d9-a7d7-11ed-b719-2c4138b7dab1', '04PD', 'DIRECCIÓN DE ANÁLISIS ESTRATÉGICO Y VINCULACIÓN INTERINSTITUCIONAL\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2a532259-a7d7-11ed-b719-2c4138b7dab1', '04PE', 'CENTRO DE CONCILIACIÓN LABORAL DEL ESTADO DE NUEVO LEÓN\r', '2023-02-08 11:36:48', '2023-02-08 11:36:48', '1', '1', 0),
	('2fe9bb10-0575-11ee-b6df-2c4138b7dab1', 'Pru', 'PRB  BCK', '2023-06-07 14:52:16', '2023-06-07 14:52:16', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('3ba487f9-03fb-11ee-b6df-2c4138b7dab1', '88888', 'pruebasp', '2023-06-05 17:46:46', '2023-06-05 17:46:46', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('45cc6686-03f7-11ee-b6df-2c4138b7dab1', '120515', 'pruebasp', '2023-06-05 17:18:25', '2023-06-05 17:18:25', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('4b9a7bf8-03fc-11ee-b6df-2c4138b7dab1', '2029', 'pruebasp', '2023-06-05 17:54:23', '2023-06-05 17:54:23', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('4ea3921e-03fd-11ee-b6df-2c4138b7dab1', '2026', 'pruebasp', '2023-06-05 18:01:37', '2023-06-05 18:01:37', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('5ab08598-03f9-11ee-b6df-2c4138b7dab1', '120', 'pruebasp', '2023-06-05 17:33:19', '2023-06-05 17:33:19', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('912be9c9-6c4f-11ed-a880-040300000000', '0405', 'TRANSFERENCIAS A MUNICIPIOS DEL ESTADO', '2022-11-30 17:59:14', '2022-11-24 16:27:31', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 0),
	('9f4a9d2c-03f8-11ee-b6df-2c4138b7dab1', '1205153', 'pruebasp', '2023-06-05 17:28:05', '2023-06-05 17:28:05', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('a9972209-0a36-11ee-ba60-3cd92b4d9bf4', 'prueba', 'prueba a borrar', '2023-06-13 16:11:30', '2023-06-13 16:07:18', '3d472a7a-3087-11ed-aed0-040300000000', '3d472a7a-3087-11ed-aed0-040300000000', 1),
	('b2023865-03fb-11ee-b6df-2c4138b7dab1', '2023', 'pruebasp', '2023-06-05 17:50:05', '2023-06-05 17:50:05', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('d2985c50-03fc-11ee-b6df-2c4138b7dab1', '2027', 'pruebasp', '2023-06-05 17:58:09', '2023-06-05 17:58:09', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('dfd5e5d5-03fa-11ee-b6df-2c4138b7dab1', '2120', 'pruebasp', '2023-06-05 17:44:12', '2023-06-05 17:44:12', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0),
	('e05c1fe8-03fc-11ee-b6df-2c4138b7dab1', '2025', 'pruebasp', '2023-06-05 17:58:32', '2023-06-05 17:58:32', 'a4f79e57-32b7-11ed-aed0-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 0);
/*!40000 ALTER TABLE `UResponsable` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.UsuarioAplicacion
DROP TABLE IF EXISTS `UsuarioAplicacion`;
CREATE TABLE IF NOT EXISTS `UsuarioAplicacion` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `IdUsuario` char(36) NOT NULL,
  `IdApp` char(36) NOT NULL,
  `IdDepartamento` char(36) DEFAULT NULL,
  `IdPerfil` char(36) DEFAULT NULL,
  `IdRol` char(36) DEFAULT NULL,
  `IdUnidadResponsable` char(36) DEFAULT NULL,
  `IdDependencia` char(36) DEFAULT NULL,
  `Acceso` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK1_Usuario` (`IdUsuario`),
  KEY `FK2_App` (`IdApp`),
  KEY `fk_IdDepartamento` (`IdDepartamento`),
  KEY `fk_IdPerfil` (`IdPerfil`),
  KEY `fk_IdRol` (`IdRol`),
  KEY `fk_IdUnidadResponsable` (`IdUnidadResponsable`),
  KEY `fk_IdDependencias` (`IdDependencia`) USING BTREE,
  CONSTRAINT `FK1_Usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_App` FOREIGN KEY (`IdApp`) REFERENCES `Apps` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_IdDepartamento` FOREIGN KEY (`IdDepartamento`) REFERENCES `Departamentos` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `fk_IdDependencias` FOREIGN KEY (`IdDependencia`) REFERENCES `Dependencias` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `fk_IdPerfil` FOREIGN KEY (`IdPerfil`) REFERENCES `Perfiles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `fk_IdRol` FOREIGN KEY (`IdRol`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `fk_IdUnidadResponsable` FOREIGN KEY (`IdUnidadResponsable`) REFERENCES `UResponsable` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla TiCentral.UsuarioAplicacion: ~144 rows (aproximadamente)
DELETE FROM `UsuarioAplicacion`;
/*!40000 ALTER TABLE `UsuarioAplicacion` DISABLE KEYS */;
INSERT INTO `UsuarioAplicacion` (`Id`, `IdUsuario`, `IdApp`, `IdDepartamento`, `IdPerfil`, `IdRol`, `IdUnidadResponsable`, `IdDependencia`, `Acceso`) VALUES
	('00c09d86-f342-11ed-a05b-0242ac120003', 'a77a303c-3a98-11ed-a261-0242ac120002', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('02204db9-b7b1-11ed-8002-d89d6776f970', 'c9839247-b7b0-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('0336747b-991c-11ed-b58e-2c4138b7dab1', '63706311-9906-11ed-b58e-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('038dbf77-b7b1-11ed-8002-d89d6776f970', '94b76caa-b7b0-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('03dcffe9-dfc2-11ed-b61c-2c4138b7dab1', 'c7732105-ad91-11ed-b719-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('04ff744b-b7b1-11ed-8002-d89d6776f970', '5e82153e-b7b0-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('07729303-a3e2-11ed-b561-2c4138b7dab1', 'ab583a15-a3e0-11ed-b561-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('0809601f-c411-11ed-865d-040300000000', '0d656428-c40e-11ed-865d-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('0a0aa66a-a749-11ed-b719-2c4138b7dab1', '0a0578bf-a749-11ed-b719-2c4138b7dab1', 'f18ad0d4-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('0cf60fde-56e5-11ed-a988-040300000000', '0cecc3ad-56e5-11ed-a988-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('0e88ee24-b942-11ed-8002-d89d6776f970', '39314051-b941-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('0f3064c7-8dd9-11ed-a98c-040300000000', '3ab780cc-8c7a-11ed-a98c-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('0fcdc1f3-977a-11ed-a912-705a0f328da6', '30adc962-7109-11ed-a880-040300000000', 'cf754e46-8d45-11ed-a98c-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('14bf938d-8195-11ed-a963-040300000000', '868a18b0-8194-11ed-a963-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('156f8db1-0971-11ee-ba60-3cd92b4d9bf4', '831dd32e-0970-11ee-ba60-3cd92b4d9bf4', 'cf754e46-8d45-11ed-a98c-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('16b281c1-a353-11ed-b561-2c4138b7dab1', 'f236cb5b-a0eb-11ed-802e-2c4138b7dab1', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('16d628b2-c382-11ed-b789-2c4138b7dab1', 'a6860b44-3087-11ed-aed0-040300000000', '884be320-b6cb-11ed-9bd4-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('1a678f31-a106-11ed-802e-2c4138b7dab1', '7f4a407b-98fd-11ed-b58e-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('1bf02f4e-c8e2-11ed-b4d7-2c4138b7dab1', 'ffb804ea-c8e1-11ed-b4d7-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('1daf9e20-9d22-11ed-b58e-2c4138b7dab1', 'b7c6c52a-9779-11ed-a912-705a0f328da6', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('202fad43-4b3e-11ed-a964-040300000000', 'fbd8f92b-4b3d-11ed-a964-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('2488eb18-c80b-11ed-afa1-0242ac120002', 'a77a303c-3a98-11ed-a261-0242ac120002', '2488e7ee-c80b-11ed-afa1-0242ac120002', NULL, NULL, NULL, NULL, NULL, NULL),
	('285057e7-acb5-11ed-b719-2c4138b7dab1', '09158bf4-a0f5-11ed-802e-2c4138b7dab1', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('2abf646e-e52d-11ed-b5ea-0242ac120002', 'ce774db8-e2e1-11ed-b5ea-0242ac120002', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('2b29f7a0-74c2-11ed-aad1-040300000000', '0c130706-7266-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('2bc47464-8c7e-11ed-a98c-040300000000', 'afd7a5f6-75b5-11ed-aad1-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('2e431f8c-74c2-11ed-aad1-040300000000', 'bdc43309-7266-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('2efe62da-07df-11ee-ba60-3cd92b4d9bf4', '5837a5e1-073a-11ee-b98c-3cd92b4d9bf4', 'ebb88944-de38-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('2f96706d-daf6-11ed-b61c-2c4138b7dab1', '191cc303-daf6-11ed-b61c-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('2fe2669a-74c2-11ed-aad1-040300000000', '6c261f7f-71d9-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('2fef924a-f051-11ed-b61c-2c4138b7dab1', '29d9a841-f051-11ed-b61c-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('30cd3f4d-e5f0-11ed-b61c-2c4138b7dab1', '2cd79581-e5f0-11ed-b61c-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('31468183-da54-11ed-b61c-2c4138b7dab1', '1d4028de-da54-11ed-b61c-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('33be387e-c414-11ed-865d-040300000000', '1fe4e155-c414-11ed-865d-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('34fe148b-74c2-11ed-aad1-040300000000', '93a07e88-7267-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('3519c9e9-e5ee-11ed-b61c-2c4138b7dab1', '27d97417-e5ee-11ed-b61c-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('353f6d25-a353-11ed-b561-2c4138b7dab1', '62983780-a1c9-11ed-b561-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('367e81b3-74c2-11ed-aad1-040300000000', 'd1a8f9cd-71db-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('37feb922-74c2-11ed-aad1-040300000000', '209d29f5-71dc-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('3939fe7a-7b4d-11ed-aa0d-040300000000', '18b23f6c-7825-11ed-aad1-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('397f4d81-74c2-11ed-aad1-040300000000', '74f8e43f-7266-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('3b9e5ca4-74c2-11ed-aad1-040300000000', '5430da9a-71da-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('3c2e162f-b79f-11ed-8002-d89d6776f970', '2fad75f3-b79f-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('3da49150-acbf-11ed-b719-2c4138b7dab1', 'fba5160b-a0f4-11ed-802e-2c4138b7dab1', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('41ead2eb-07df-11ee-ba60-3cd92b4d9bf4', 'b547bd37-0628-11ee-b6df-2c4138b7dab1', '2493b951-d317-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('42dbb9db-b920-11ed-b789-2c4138b7dab1', '2dd731aa-b920-11ed-b789-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('43537a19-74bc-11ed-aad1-040300000000', '440b6024-7267-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('4379bc1e-9742-11ed-a912-705a0f328da6', '30adc962-7109-11ed-a880-040300000000', 'f18ad0d4-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('450e2cb5-e5eb-11ed-b61c-2c4138b7dab1', '59d8059d-e5ea-11ed-b61c-2c4138b7dab1', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('4c98507e-e532-11ed-b61c-2c4138b7dab1', '30adc962-7109-11ed-a880-040300000000', 'd96164aa-e531-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('4cd26782-e5f0-11ed-b61c-2c4138b7dab1', '2cd79581-e5f0-11ed-b61c-2c4138b7dab1', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('4d4f866c-b87d-11ed-8002-d89d6776f970', '40ad483f-b87d-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('4f1e5a0f-b87d-11ed-8002-d89d6776f970', '09e620ae-b87d-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('4f628ffe-b6cc-11ed-9bd4-2c4138b7dab1', '5dbda069-b6ca-11ed-9bd4-2c4138b7dab1', '884be320-b6cb-11ed-9bd4-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('50f61235-b87d-11ed-8002-d89d6776f970', 'd3413f61-b87c-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('5127e527-a353-11ed-b561-2c4138b7dab1', '6296ecf1-a1c9-11ed-b561-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('53f55ae8-a105-11ed-802e-2c4138b7dab1', 'b17a8c4b-96ba-11ed-a912-705a0f328da6', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('5508f0d2-f034-11ed-b61c-2c4138b7dab1', 'e3bcf1ee-f033-11ed-b61c-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('56ec2f85-e528-11ed-b61c-2c4138b7dab1', '5013fc92-e528-11ed-b61c-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('5b6fbd32-5711-11ed-a988-040300000000', '2a5a9661-38f9-11ed-aed0-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('5d99d7b2-e5ef-11ed-b61c-2c4138b7dab1', '5969b807-e5ef-11ed-b61c-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('5e14d9ad-977b-11ed-a912-705a0f328da6', '5a94a875-96bb-11ed-a912-705a0f328da6', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('5ed61328-74c3-11ed-aad1-040300000000', 'e01a653e-725f-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('61aa18cc-bf6e-11ed-b789-2c4138b7dab1', '61a418d5-bf6e-11ed-b789-2c4138b7dab1', 'f18ad0d4-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('6266168c-e5ee-11ed-b61c-2c4138b7dab1', '27d97417-e5ee-11ed-b61c-2c4138b7dab1', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('6c6bdf1a-e5ea-11ed-b61c-2c4138b7dab1', '59d8059d-e5ea-11ed-b61c-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('7140c144-9396-11ed-a912-705a0f328da6', 'c18fc135-3a89-11ed-aed0-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('71c50785-daf1-11ed-b61c-2c4138b7dab1', '6145c381-daf1-11ed-b61c-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('71f1a341-e5ef-11ed-b61c-2c4138b7dab1', '5969b807-e5ef-11ed-b61c-2c4138b7dab1', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('73e66d16-d010-11ed-b7d9-2c4138b7dab1', '502fba77-d010-11ed-b7d9-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('741285cf-f453-11ed-b6df-2c4138b7dab1', 'a52a911f-f452-11ed-b6df-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('771de2b9-f453-11ed-b6df-2c4138b7dab1', '8771622d-f452-11ed-b6df-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('7c9deeed-a734-11ed-8002-d89d6776f970', '0c130706-7266-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('81dbe811-f033-11ed-b61c-2c4138b7dab1', 'b9613ec7-f032-11ed-b61c-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('830b0d35-a734-11ed-8002-d89d6776f970', '209d29f5-71dc-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('840c1541-f9b0-11ed-b6df-2c4138b7dab1', '5430da9a-71da-11ed-a880-040300000000', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('860ccdb8-a734-11ed-8002-d89d6776f970', '440b6024-7267-11ed-a880-040300000000', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('863e3956-70e8-11ed-a880-040300000000', 'c3f329d8-3aa5-11ed-aed0-040300000000', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('8798ce57-65e6-11ed-a880-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 'f18ad0d4-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('89078a6c-9d24-11ed-b58e-2c4138b7dab1', '595ad41d-9778-11ed-a912-705a0f328da6', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('89d3ce9f-70e8-11ed-a880-040300000000', '2a5a9661-38f9-11ed-aed0-040300000000', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('8aeddf2c-a734-11ed-8002-d89d6776f970', '6c261f7f-71d9-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('8d480b7f-a734-11ed-8002-d89d6776f970', '74f8e43f-7266-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('8fce66df-a734-11ed-8002-d89d6776f970', '93a07e88-7267-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('9202f764-a734-11ed-8002-d89d6776f970', 'bdc43309-7266-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('938b8a72-7b38-11ed-aa0d-040300000000', '971ffd7d-7824-11ed-aad1-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('95af0380-4404-11ed-aea4-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('97429e7a-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('9743673e-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('97e02944-9b86-11ed-b58e-2c4138b7dab1', '676a5314-9b7f-11ed-b58e-2c4138b7dab1', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('99683313-e5ec-11ed-b61c-2c4138b7dab1', '89cdbf65-e5ec-11ed-b61c-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('99841aa5-548e-11ed-ab6c-040300000000', 'c3f329d8-3aa5-11ed-aed0-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('99d1d1e8-0620-11ee-be56-0242ac120002', 'a77a303c-3a98-11ed-a261-0242ac120002', '2493b951-d317-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('99f7953a-4b3d-11ed-a964-040300000000', '6c601e3e-4b3d-11ed-a964-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('a05a7fab-f043-11ed-b61c-2c4138b7dab1', '2fad75f3-b79f-11ed-8002-d89d6776f970', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('a1ffa446-d7c5-11ed-8581-040300000000', '5e6f44d1-d7c5-11ed-8581-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('a3104cd8-0ef1-11ee-be56-0242ac120002', 'ce774db8-e2e1-11ed-b5ea-0242ac120002', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('a3104f76-0ef1-11ee-be56-0242ac120002', '892ae82c-3a8c-11ed-aed0-040300000000', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('a3105070-0ef1-11ee-be56-0242ac120002', '5dbda069-b6ca-11ed-9bd4-2c4138b7dab1', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('a4fc9602-acbf-11ed-b719-2c4138b7dab1', 'a6860b44-3087-11ed-aed0-040300000000', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('a58863fa-a732-11ed-8002-d89d6776f970', '30adc962-7109-11ed-a880-040300000000', 'f18ad0d4-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('a83d695d-ea05-11ed-b61c-2c4138b7dab1', 'd8483c80-c9b4-11ed-afa1-0242ac120002', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('a947c048-af0f-11ed-b719-2c4138b7dab1', '30adc962-7109-11ed-a880-040300000000', '91d9e2d6-af0f-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('ac0f8b7b-e526-11ed-b61c-2c4138b7dab1', 'd8c2a7fe-e515-11ed-b61c-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('acb4be96-96b2-11ed-a912-705a0f328da6', '85940667-96b2-11ed-a912-705a0f328da6', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('bca0396a-9d21-11ed-b58e-2c4138b7dab1', '4ef51283-9777-11ed-a912-705a0f328da6', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('bdd47c7c-f03f-11ed-a05b-0242ac120003', 'c18fc135-3a89-11ed-aed0-040300000000', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('bdd4800a-f03f-11ed-a05b-0242ac120003', 'c18fc135-3a89-11ed-aed0-040300000000', '2493b951-d317-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('bdd481cc-f03f-11ed-a05b-0242ac120003', '892ae82c-3a8c-11ed-aed0-040300000000', '2493b951-d317-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('bdd484b0-f03f-11ed-a05b-0242ac120003', 'ce774db8-e2e1-11ed-b5ea-0242ac120002', '2493b951-d317-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('bf65bfdf-7d76-11ed-aa0d-040300000000', 'b3554a44-7d76-11ed-aa0d-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('bf776417-0b2d-11ee-ba60-3cd92b4d9bf4', 'a4f79e57-32b7-11ed-aed0-040300000000', 'f0f64c9b-432d-11ed-aea4-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('c459ee8a-9104-11ed-a912-705a0f328da6', 'a4f79e57-32b7-11ed-aed0-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('c6dca1b4-a108-11ed-802e-2c4138b7dab1', '0294006b-98ff-11ed-b58e-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('c7f6ade8-f061-11ed-b61c-2c4138b7dab1', '5164f9fe-f061-11ed-b61c-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('cd2ee20e-0581-11ee-b6df-2c4138b7dab1', '6145c381-daf1-11ed-b61c-2c4138b7dab1', '88e59393-f451-11ed-b6df-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('cd443345-b3dd-11ed-9bd4-2c4138b7dab1', 'c7732105-ad91-11ed-b719-2c4138b7dab1', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('ce159f63-0b2d-11ee-ba60-3cd92b4d9bf4', '0cecc3ad-56e5-11ed-a988-040300000000', 'f0f64c9b-432d-11ed-aea4-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('ce775952-e2e1-11ed-b5ea-0242ac120002', '5dbda069-b6ca-11ed-9bd4-2c4138b7dab1', '2493b951-d317-11ed-b61c-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('d4b59bf6-a40f-11ed-b561-2c4138b7dab1', '92e113bd-9c3a-11ed-b58e-2c4138b7dab1', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('d83fb1f2-e5ec-11ed-b61c-2c4138b7dab1', '89cdbf65-e5ec-11ed-b61c-2c4138b7dab1', '7af0aa1e-70e8-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('d8c858d3-f4da-11ed-b6df-2c4138b7dab1', 'a6860b44-3087-11ed-aed0-040300000000', '88e59393-f451-11ed-b6df-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('d918d726-818b-11ed-a963-040300000000', 'cf2cba70-818b-11ed-a963-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('d96fcf09-780c-11ed-aad1-040300000000', 'cf1c90c2-7656-11ed-aad1-040300000000', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('de95a008-4017-11ed-af5a-040300000000', 'c18fc135-3a89-11ed-aed0-040300000000', 'f18ad0d4-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('deefde4c-f034-11ed-b61c-2c4138b7dab1', 'cad8d847-f034-11ed-b61c-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('dfb0e65c-defe-11ed-b5ea-0242ac120002', 'a6860b44-3087-11ed-aed0-040300000000', '2488e7ee-c80b-11ed-afa1-0242ac120002', NULL, NULL, NULL, NULL, NULL, NULL),
	('dfc973d0-a354-11ed-b561-2c4138b7dab1', '449cb358-a1c8-11ed-b561-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('e9acc9b3-3372-11ed-aed0-040300000000', '3d472a7a-3087-11ed-aed0-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('eb07805c-d98b-11ed-b61c-2c4138b7dab1', 'd757055b-d98b-11ed-b61c-2c4138b7dab1', '999db602-acbf-11ed-b719-2c4138b7dab1', NULL, NULL, NULL, NULL, NULL, NULL),
	('ed5fba2f-a352-11ed-b561-2c4138b7dab1', '74318f94-98ff-11ed-b58e-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('ed8a1d54-8d45-11ed-a98c-040300000000', 'a4f79e57-32b7-11ed-aed0-040300000000', 'cf754e46-8d45-11ed-a98c-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('ef64bc23-3372-11ed-aed0-040300000000', 'a6860b44-3087-11ed-aed0-040300000000', 'ffcc48cb-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('efb07f7d-0b08-11ee-ba60-3cd92b4d9bf4', '1e8d6604-0b05-11ee-ba60-3cd92b4d9bf4', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('f8c13f02-017c-11ee-be56-0242ac120002', 'f2dfe0bc-0176-11ee-be56-0242ac120002', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('f8f0028f-0b08-11ee-ba60-3cd92b4d9bf4', '4c24face-0b05-11ee-ba60-3cd92b4d9bf4', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('fa1d997a-a105-11ed-802e-2c4138b7dab1', 'bf4d7d36-9827-11ed-a912-705a0f328da6', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('fa8bb866-0b08-11ee-ba60-3cd92b4d9bf4', '5f70c093-0afe-11ee-ba60-3cd92b4d9bf4', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('fb7fc2d4-0b2c-11ee-ba60-3cd92b4d9bf4', 'a6860b44-3087-11ed-aed0-040300000000', 'f0f64c9b-432d-11ed-aea4-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('fbed87b6-0b08-11ee-ba60-3cd92b4d9bf4', '76de21e2-0b05-11ee-ba60-3cd92b4d9bf4', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('fd513ad1-0b08-11ee-ba60-3cd92b4d9bf4', 'd6ff8fec-0b04-11ee-ba60-3cd92b4d9bf4', 'fa82e267-3087-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('fe7c00e7-a352-11ed-b561-2c4138b7dab1', 'a143de74-977b-11ed-a912-705a0f328da6', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('ff652039-b84f-11ed-8002-d89d6776f970', 'cb993d7a-b84f-11ed-8002-d89d6776f970', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL),
	('ff694b67-e5ee-11ed-b61c-2c4138b7dab1', 'fafc8d0e-e5ee-11ed-b61c-2c4138b7dab1', '973ecf89-38ff-11ed-aed0-040300000000', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `UsuarioAplicacion` ENABLE KEYS */;

-- Volcando estructura para tabla TiCentral.Usuarios
DROP TABLE IF EXISTS `Usuarios`;
CREATE TABLE IF NOT EXISTS `Usuarios` (
  `Id` char(36) NOT NULL DEFAULT uuid(),
  `IdAutoridad` char(36) DEFAULT NULL,
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPaterno` varchar(20) NOT NULL,
  `ApellidoMaterno` varchar(20) NOT NULL,
  `NombreUsuario` varchar(30) NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `Puesto` varchar(255) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Curp` varchar(18) NOT NULL,
  `Rfc` varchar(13) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Ext` varchar(4) NOT NULL,
  `Celular` varchar(10) NOT NULL,
  `IdTipoUsuario` char(36) NOT NULL,
  `UltimoInicioDeSesion` datetime NOT NULL DEFAULT current_timestamp(),
  `EstaActivo` tinyint(1) NOT NULL DEFAULT 0,
  `CreadoPor` char(36) NOT NULL DEFAULT '0',
  `FechaDeCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `UltimaModificacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '',
  `Deleted` tinyint(1) NOT NULL DEFAULT 0,
  `PuedeFirmar` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IdTipoUsuario` (`IdTipoUsuario`),
  KEY `FK_Usuario_Creado` (`CreadoPor`),
  KEY `FK_Usuario_Modificado` (`ModificadoPor`),
  CONSTRAINT `FK_Usuario_Creado` FOREIGN KEY (`CreadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Usuario_Modificado` FOREIGN KEY (`ModificadoPor`) REFERENCES `Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Usuarios_TipoUsuario` FOREIGN KEY (`IdTipoUsuario`) REFERENCES `TipoUsuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla TiCentral.Usuarios: ~119 rows (aproximadamente)
DELETE FROM `Usuarios`;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` (`Id`, `IdAutoridad`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `NombreUsuario`, `CorreoElectronico`, `Puesto`, `Contrasena`, `Curp`, `Rfc`, `Telefono`, `Ext`, `Celular`, `IdTipoUsuario`, `UltimoInicioDeSesion`, `EstaActivo`, `CreadoPor`, `FechaDeCreacion`, `UltimaModificacion`, `ModificadoPor`, `Deleted`, `PuedeFirmar`) VALUES
	('023db368-71bd-11ed-a880-040300000000', NULL, 'opokjasd', 'iuhiu', 'ihiuh', 'PedroGayat', 'pedrops@kalmsndk.com', '', '$2a$10$6HDG2YDid568JQGTVZ7o3uW.03DqiVa/wcfDWdOyMqzS9MJUaNxO2', 'iuhiouh', 'iouhiuiuhihih', '7686867868', '8767', '8768678768', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-01 14:13:31', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-12-01 14:13:31', '2022-12-02 10:39:22', 'c18fc135-3a89-11ed-aed0-040300000000', 1, 0),
	('0294006b-98ff-11ed-b58e-2c4138b7dab1', NULL, 'teste', 'teste', 'teste', 'disRecTeste', 'Testerec@hshshshs.com', '', '$2a$10$v3pSVVir.S2/0lhqJi4R8e/coVBRSAAcXbu/1SGcuvxjrO8AL7mnS', 'BVKBVBDKBVDKJBVKJB', 'TESTEETETTFIY', '5654449444', '999', '4999499949', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-30 19:44:18', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-30 19:44:18', '2023-01-30 19:44:18', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('09158bf4-a0f5-11ed-802e-2c4138b7dab1', NULL, '4', '4', '4', '4', 'asdasd@com.com', 'Gerente', '$2a$10$lel.8Rf0m7Pc73fBUf8KneLIy6y4rqoV5XboN3upz0KWrkHacngS2', '4', '4', '4', '4', '4', 'b055eea8-6438-11ed-a880-040300000000', '2023-02-14 16:15:58', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-14 16:15:58', '2023-02-14 16:15:58', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('09e620ae-b87d-11ed-8002-d89d6776f970', NULL, 'PEDRO HIGINIO', 'SALAZAR', 'OBREGÓN', 'pedroh.salazar', 'pedroh.salazar@nuevoleon.gob.mx', 'GENERICO', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'SAOP730910HNLLBD01', 'SAOP7309109X3', '8120202483', '2483', '8120202483', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('0a0578bf-a749-11ed-b719-2c4138b7dab1', NULL, 'BXTRPRUEBA', 'BXTRPRUEBA', 'BXTRPRUEBA', 'BXTRPRUEBA', 'BXTRPRUEBA@BXTRPRUEBA.com', '', '$2a$10$Uzfki6D14446d.XSqJXX.uAmevsSxYct1o8EnvPyrnOpoYF6W5slO', 'BXTRPRUEBABXTRPRUE', 'BXTRPRUEBABXT', '3249283409', '9890', '9809808098', 'b055eb06-6438-11ed-a880-040300000000', '2023-02-07 18:39:26', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-07 18:39:26', '2023-02-07 18:39:26', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('0c130706-7266-11ed-a880-040300000000', '609dc46f-2b01-11ed-afdb-040300000000', 'Angel Genaro', 'Carreon', 'Diaz', 'angel.carreon', 'angel.carreon@nuevoleon.gob.mx', '', '$2a$10$ENzhbehhmLjUpKb9tnqHi.4p59WG0AmI1EGQUHTy4xGFt4Utu..96', 'CADA880713HNLRZN00', 'CADA8807133DA', '8120202470', '2470', '8111982868', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-02 10:23:33', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:23:33', '2022-12-02 10:39:13', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('0cecc3ad-56e5-11ed-a988-040300000000', NULL, 'Marlon', 'Mendez', 'Maldonado', 'Mmaldonado', 'mimendez@cecapmex.com', 'DESARROLLADOR', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'ASDASDASDASDASDASD', 'ASDASDASDASDA', '2342342343', '2342', '3243242342', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 17:01:29', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-10-28 12:22:08', '2023-02-14 17:57:06', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('0d656428-c40e-11ed-865d-040300000000', NULL, 'Usuario', 'Genérico ', 'DAF', 'DAF', 'DAF@pruebas.com', 'DAF', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'RFCGENERICOVZYNN02', 'RFCGENERICO12', '1234', '12', '567', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-12 14:48:11', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-16 09:41:34', '2023-03-16 09:41:34', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('17348244-711a-11ed-a880-040300000000', NULL, 'PedroRicardo', 'Pardo', 'Gaytan', 'Pe', 'pedropardog009@gmail.com', '', '2a10kwaL3CpjqmwpWc8YTcmveI7KXGwlzhlmo3mvRuTyZxvBWzfZ1p2y', 'jksjskdi899sjdj8s8', 'ksksjkjhd89d9', '8110870378', '52', '8110665786', 'b055eea8-6438-11ed-a880-040300000000', '2022-11-30 18:47:19', 0, 'a6860b44-3087-11ed-aed0-040300000000', '2022-11-30 18:47:19', '2022-12-05 10:15:54', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('18b23f6c-7825-11ed-aad1-040300000000', NULL, 'Prueba  back 12', '12', 'Prueba', 'PruebaBack', 'PruebaBack@Prueba.com', '', '', 'Prueba', 'Prueba', '121221', '121', '12122', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-13 19:18:32', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-12-13 19:18:32', '2022-12-14 13:55:49', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('191cc303-daf6-11ed-b61c-2c4138b7dab1', NULL, 'srpua', 'srpua', 'srpua', 'srpua', 'srpua@.correo.com', 'DESARROLLADOR', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'ASDASDASDASDASDASD', 'ASDASDASDASDA', '2343242342', '4234', '4234234234', 'b055ed42-6438-11ed-a880-040300000000', '2023-06-08 10:18:20', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-04-14 12:57:21', '2023-05-11 13:33:27', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('1d4028de-da54-11ed-b61c-2c4138b7dab1', NULL, 'Pedro', 'Pardo', 'Gaytan', 'srpuc', 'srpuc@correo.com', 'Capturador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'ASDASFASFASFFASFAS', 'ASDASJANSIUAH', '2534234234', '2359', '9809890980', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 10:40:58', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-04-13 17:37:45', '2023-04-13 17:37:45', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('1e8d6604-0b05-11ee-ba60-3cd92b4d9bf4', NULL, 'coordinador', 'pabmi', 'coordinador', 'coordinadorpabmi', 'n2@n2.com', 'coordinador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'TERN791123HNLRZX05', 'TERN791123MQ0', '90', '90', '90', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-14 17:14:57', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:48:33', '2023-06-14 16:48:33', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 1),
	('1fe4e155-c414-11ed-865d-040300000000', NULL, 'Dirección ', 'De Administración', 'Financiera', 'DAFC', 'DAFC@pruebas.com', 'Coordinador DAF', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'CURPGENERICOCONN02', 'RFCGENERICOCO', '1234', '9101', '5678', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-25 12:40:30', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-16 10:04:16', '2023-03-16 10:04:16', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('209d29f5-71dc-11ed-a880-040300000000', '511732b0-2b01-11ed-afdb-040300000000', 'Mario Alberto', 'Inguanzo', 'Vieyra', 'mario.inguanzo', 'mario.inguanzo@nuevoleon.gob.mx', '', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'XAXX010101000CVCVC', 'XAXX010101000', '8120201143', '', '8120201143', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-01 17:56:17', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-01 17:56:17', '2022-12-01 17:56:48', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('27d97417-e5ee-11ed-b61c-2c4138b7dab1', NULL, 'getetet', 'ñmmkkkkmkl', 'kmlkmkmkmlkmkm', 'kmkjkkjkjkjkj', 'vfsvsv@vsvbsdkvbsdvs.com', 'ultimaprueba', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'KJBVSKBVDSKBVDBHBV', 'CSFSDFDSGGGDB', '4646464646', '0', '4564654564', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-28 12:01:38', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-28 11:57:57', '2023-04-28 11:57:57', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('29d9a841-f051-11ed-b61c-2c4138b7dab1', NULL, 'PRUEBASRPU', 'PRUEBASRPU', 'PRUEBASRPU', 'PRUEBASRPU', 'PRUEBASRPU@COM.UTY', 'PRUEBASRPU', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'PRUEBASRPUSADSADAS', 'PRUEBASRPUADS', '3242342342', '2342', '2342342342', 'b055ed42-6438-11ed-a880-040300000000', '2023-05-12 13:11:22', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-05-11 17:11:40', '2023-05-11 17:11:40', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('2a5a9661-38f9-11ed-aed0-040300000000', NULL, 'Adolfo', 'Garcia', 'Martinez', 'Aagarcia', 'aagarcia@cecapmex.com', 'E', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'DFGFGHFGHFGHFHFGHF', 'FGHFGHFGHFGHF', '1234', '1234', '3423453453', 'b055ed42-6438-11ed-a880-040300000000', '2023-06-13 22:33:46', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-20 10:30:32', '2022-11-30 12:49:30', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('2cd79581-e5f0-11ed-b61c-2c4138b7dab1', NULL, 'fefdsfdsf', 'fdsfdsff', 'fdsfdsf', 'fsdfdsfdsfsfdsf', 'dsfdsfdsf@cdsjkvsdbnvj.co', 'vsvsvdsvdsvsv', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'VDSVSVSDDSVSVSDVSD', 'SVSDVDSDVSVVD', '5534534534', '0', '5577657656', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-28 12:20:46', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-28 12:12:09', '2023-04-28 12:12:09', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('2dd731aa-b920-11ed-b789-2c4138b7dab1', NULL, 'organismo', 'prueba', 'test', 'organismo.prueba', 'organismo.prueba@prueba.teste', 'organismo', '$2a$10$OqhZa2ui6erwMXRxA2QU7.jgOgsuASLhae61dnchSWJGoJUJVEXei', 'Y97VSD7VDSDYS7YV97', 'FW8979VSD9V6D', '8979465484', '0', '7777777', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-12 10:46:28', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-02 11:32:53', '2023-03-17 12:15:50', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('2fad75f3-b79f-11ed-8002-d89d6776f970', NULL, 'Juan Fernando', 'Chávez', 'Marroquín', 'juan.chavez', 'juan.chavez@nuevoleon.gob.mx', 'GENERICO', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'CAMJ871029HNLHRN02', 'CAMJ871029FP4', '8120201460', '1460', '8126902423', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-30 11:47:14', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('30adc962-7109-11ed-a880-040300000000', '724605b7-2b01-11ed-afdb-040300000000', 'Distribución', 'De', 'Recursos', 'Disrec', 'disrec@pruebas.com', '', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'SISTEMASISTEMASIST', 'SISTEMASISTEM', '123', '456', '789', 'b055eb06-6438-11ed-a880-040300000000', '2023-06-21 12:50:04', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2022-11-30 16:46:20', '2023-01-18 15:53:00', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('334680d7-5bc9-11ed-a988-040300000000', NULL, 'Jose Luis', 'Roman ', 'Salas', 'jose.roman', 'jose.roman@pruebas.com', '', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', '----------', '----------', '----------', '9876', '----------', 'b055eea8-6438-11ed-a880-040300000000', '2022-11-09 13:22:27', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-11-03 16:45:22', '2022-11-03 16:45:22', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('3510f679-a739-11ed-b719-2c4138b7dab1', NULL, 'EmanuelP', 'Prueba', 'Prueba', 'EmanuelP', 'EmanuelP@prueba.com', '', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'EMANUELPEMANUELPEM', 'EMANUELPEMANU', '3204923940', '9023', '9809809', 'b055ed42-6438-11ed-a880-040300000000', '2023-02-07 16:46:06', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-07 16:46:06', '2023-02-07 16:46:06', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('39314051-b941-11ed-8002-d89d6776f970', NULL, 'JUAN CARLOS', 'GONZALEZ', 'ROMERO', 'juan.gonzalezr', 'juan.gonzalezr@nuevoleon.gob.mx', 'GENERICO', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'GORJ741101HDFNMN11', 'GORJ7411014U7', '8120201377', '1', '6671672940', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-02 13:48:57', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('3ab780cc-8c7a-11ed-a98c-040300000000', NULL, 'Pruebita', 'Pruebita', 'Pruebita', 'Pruebita', 'pruebita@pruebita.com', '', '$2a$10$YAXR9UnmD8NXvmyaRpeIhuBikUSdKg/K46/rEKbcnSA3u03F39as2', 'Pruebita', 'Pruebita', '3242342342', '4234', '2342342342', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-06 09:44:47', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-06 09:44:47', '2023-01-06 09:44:47', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('3d472a7a-3087-11ed-aed0-040300000000', NULL, 'Emilio Alejandro', 'Pérez', 'Alonso', 'Emperez', 'eaperez@cecapmex.com', '', '$2a$10$RNFw0UcWqOueg13cn/OVOe3C./6l/izMYdnHONb89Wn1K4M6fbchC', 'PEAE950602HTSRLM09', 'GOTJ971127BF8', '8182873837', '0', '8182873837', 'b055eb06-6438-11ed-a880-040300000000', '2023-06-15 12:44:14', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-09 16:34:52', '2022-11-28 13:46:03', '3d472a7a-3087-11ed-aed0-040300000000', 0, 1),
	('40ad483f-b87d-11ed-8002-d89d6776f970', NULL, 'MARIA MAYELA', 'GUAJARDO', 'LOPEZ', 'mayela.guajardo', 'mayela.guajardo@nuevoleon.gob.mx', 'GENERICO', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'GULM720817MNLJPY07', 'GULM7208176R0', '8120201475', '1475', '8111836742', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('440b6024-7267-11ed-a880-040300000000', '609dc46f-2b01-11ed-afdb-040300000000', 'Verónica', 'Cárdenas', 'Medina', 'veronica.cardenas', 'veronica.cardenas@nuevoleon.gob.mx', '', '$2a$10$OqhZa2ui6erwMXRxA2QU7.jgOgsuASLhae61dnchSWJGoJUJVEXei', 'CAMV821001MNLRDR04', 'CAMV821001IBA', '8120201432', '1432', '8180274081', 'b055ed42-6438-11ed-a880-040300000000', '2023-06-21 15:39:20', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:32:16', '2023-04-26 15:43:55', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('449cb358-a1c8-11ed-b561-2c4138b7dab1', NULL, 'test', 'test', 'test', 'test', 'test@test.test', '', '$2a$10$tndyAVzg9iB0JH2tzYvCeu1Nkr/2oEmsu8uNFSrWelPe4dbPvOYgq', 'test', 'test', '123456789', '123', '1234567689', 'b055eea8-6438-11ed-a880-040300000000', '2023-02-02 17:54:04', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-02 17:54:04', '2023-02-02 17:54:04', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('49f7945e-a735-11ed-b719-2c4138b7dab1', NULL, 'Marlon', 'prueba', 'prueba', 'marlonI2', 'prueba2@marlon.isr', '', '$2a$10$2kpTdZiAm.1COUWADn3EvuHSye7slUUnXDHNb7roY3HeY.gDIjbue', 'LJKASLKDJLKJASDKJL', 'LKJLKJASLDKJA', '4234234234', '2342', '2342342342', 'b055ed42-6438-11ed-a880-040300000000', '2023-02-07 16:18:03', 0, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-07 16:18:03', '2023-02-07 16:18:03', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('4c24face-0b05-11ee-ba60-3cd92b4d9bf4', NULL, 'auxiliar', 'pabmi', 'auxiliar', 'auxiliarpabmi', 'n3@n3.com', 'auxiliar', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'TERN791123HNLRZX05', 'TERN791123MQ0', '9', '9', '9', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-14 17:14:10', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:48:27', '2023-06-14 16:48:27', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 1),
	('4ef51283-9777-11ed-a912-705a0f328da6', NULL, 'Alpharius', 'Alpharius', 'Alpharius', 'Alpharius', 'Alpharius@gmail.com', 'J', '$2a$10$yq/uBBhbnoXwPKc/fFdlQOILK6FJbHtMTDmTegA3Xhvb/LLwWh3.K', 'redactado', 'redactado', '474575', '1234', '47574574', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-25 19:31:42', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 19:31:42', '2023-01-25 19:31:42', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('5013fc92-e528-11ed-b61c-2c4138b7dab1', NULL, 'rtertretrt', 'tetetertrtt', 'etertteet', 'trtrtrtrtrtrt3343434', 'trtrtrtrtrtrt3343434@gbgbgbg.cvom', 'teste', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'BVADKBVBSVBSVKBSKB', 'TESTETECHJCVJ', '5345345345', '3633', '3453453466', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-27 12:24:32', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-27 12:21:33', '2023-04-27 12:21:33', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('502fba77-d010-11ed-b7d9-2c4138b7dab1', NULL, 'FERNANDO', 'ELIZONDO', 'ACEVEDO', 'FELIZONDO', 'FELIZONDO@CECAPMEX.COM', 'DEV', '$2a$10$rXWWrmtLic3a3QZEbpucauj6QXwIHm/v2Y3W80EtX5ToQ1fCGqkVq', 'ASDASDASDASDASDASD', 'DDASDASDASDAS', '2342343453', '3453', '3453453453', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-31 16:27:09', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-03-31 16:07:40', '2023-03-31 16:07:40', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('511bcbd8-aca2-11ed-b719-2c4138b7dab1', NULL, 'pruebita34', 'pruebita34', 'pruebita34', 'pruebita34', 'pruebita34@pruebita34.com', '$2a$10$pHQrYBS2PyIKPXy7VI8oPujg2jQHLYRlu2rPpxW0PSTUOcK1GAvUu', 'pruebita34', 'ASDASDASDASDASDASD', 'ASDASDASDASDS', '4325345345', '3453', '3453453453', 'b055ed42-6438-11ed-a880-040300000000', '2023-02-14 14:01:06', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-14 14:01:06', '2023-02-14 14:01:06', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('5164f9fe-f061-11ed-b61c-2c4138b7dab1', NULL, 'admin', 'prueba2', 'srpu', 'prueba2srpu', 'prueba2srpunet.net', 'autorizador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'ASDASDASDASDASDASD', 'DASDASDASDASD', '3423423423', '4234', '2342342342', 'b055ed42-6438-11ed-a880-040300000000', '2023-05-11 19:13:42', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-05-11 19:10:27', '2023-05-11 19:10:27', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('5430da9a-71da-11ed-a880-040300000000', '511732b0-2b01-11ed-afdb-040300000000', 'Oswaldo', 'Calzada', 'Alba', 'oswaldo.calzada', 'aagarcia@cecapmex.com', '', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'XAXX010101000XCXCX', 'XAXX010101000', '8120201033', '637', '8120201033', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-12 17:38:07', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-01 17:43:24', '2022-12-01 17:57:33', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('5837a5e1-073a-11ee-b98c-3cd92b4d9bf4', NULL, 'ferprueba', 'ferprueba', 'ferprueba', 'ferprueba', 'ferprueba@xdd.yv', 'dasdmasdm', '$2a$10$pPKtHwiFGuX0j2ro9Mmd0.EDoiB5hs3s6m2g1UVdSdhh9yZR4wpE.', 'ASDASDASDASÑDLJASL', 'LKMLÑAKMSDLÑK', '2340234982', '3243', '3242349872', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-10 16:36:04', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-10 16:36:04', '2023-06-10 16:36:04', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('584ccceb-74b9-11ed-aad1-040300000000', '6d8fefa8-50c1-11ed-ab6c-040300000000', 'pruebaDistribucionRe', 'login', 'prueba', 'distribucion.recursos', 'distribucion.recursos11111@hotmail.com', '', '$2a$10$sAGEBM9dtLh5TxcDJU9OBOM.PzSDMT.YDFQ/ANNHJnrrcTOxavnMq', 'OUMA920204HVGGGDGD', 'XXN00XXX0X0XX', '8411515555', '2525', '8418188188', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-05 10:24:51', 0, '30adc962-7109-11ed-a880-040300000000', '2022-12-05 10:24:51', '2022-12-05 10:32:41', 'c18fc135-3a89-11ed-aed0-040300000000', 1, 0),
	('595ad41d-9778-11ed-a912-705a0f328da6', NULL, 'Alpharius3', 'Alpharius3', 'Alpharius3', 'Alpharius3', 'Alpharius3@gmail.com', 'K', '$2a$10$JIrYkToxE.5Yo91K04cu.O4Lkdn847YWmfK9jKQSxG5fdmqE8mFP2', 'redactado', 'redactado', '474575', '1234', '47574574', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-25 19:51:44', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 19:51:44', '2023-01-25 19:51:44', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('5969b807-e5ef-11ed-b61c-2c4138b7dab1', NULL, 'kbkbkb', 'hbkhbkbkb', 'bkbkbkbkhb', 'khbkhbhbhbh.teste', 'kcbadskcbadskcbads@nsdjdvs.com', 'bkbhjbbhk', '$2a$10$OqhZa2ui6erwMXRxA2QU7.jgOgsuASLhae61dnchSWJGoJUJVEXei', '6876JCBDJSCBVDCBVD', '8765868787676', '3463464334', '0', '5353536355', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-28 12:16:07', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-28 12:06:14', '2023-04-28 12:06:14', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('59d8059d-e5ea-11ed-b61c-2c4138b7dab1', NULL, 'teste', 'testeetetett', 'tetetgdgdgd', 'pruebas.testeteste', 'pruebas.testeteste@hdhdhd.com', 'sadsvadaadv', '$2a$10$OqhZa2ui6erwMXRxA2QU7.jgOgsuASLhae61dnchSWJGoJUJVEXei', 'FHDFHFDHDHDFSHFDBC', 'FDGDSGFDSHGDF', '3453454353', '0', '3453454353', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-28 11:44:07', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-28 11:30:52', '2023-04-28 11:30:52', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('5a94a875-96bb-11ed-a912-705a0f328da6', NULL, 'zaragoza', 'zaragoza', 'zaragoza', 'zaragoza', 'zaragoza@gmail.com', '', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'GAMA920807HVZRRD00', 'GAMA920807EB6', '8126902423', '258', '8126902423', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-18 16:06:01', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-18 15:59:23', '2023-01-18 15:59:23', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('5dbda069-b6ca-11ed-9bd4-2c4138b7dab1', NULL, 'Jonathan', 'Bustos', 'H', 'jbustos', 'jabustos@cecapmex.com', 'DEV', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'CURP261188XXXXXXXX', 'GOTJ971127BF8', '1234123412', '8', '1234123412', 'b055ed42-6438-11ed-a880-040300000000', '2023-06-21 11:57:28', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-27 12:12:59', '2023-02-27 12:12:59', '30adc962-7109-11ed-a880-040300000000', 0, 1),
	('5e6f44d1-d7c5-11ed-8581-040300000000', NULL, 'Usuario ', 'Genérico', 'DCCP', 'DCCP', 'dccp@test.com', 'Admi', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'DCCP980207MMCCRRB4', 'RFCGENERICO10', '9187563254', '0', '3254561874', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-25 17:44:10', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-10 12:32:14', '2023-04-10 12:32:14', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('5e82153e-b7b0-11ed-8002-d89d6776f970', NULL, 'Samantha Rubi', 'Nava', 'Luevano', 'samantha.nava', 'samantha.nava@nuevoleon.gob.mx', 'GENERICO', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'NALS921204MNLVVM06', 'NALS921204I74', '8120201300', '1347', '8120201300', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-02 07:33:24', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('5f70c093-0afe-11ee-ba60-3cd92b4d9bf4', NULL, 'administrador', 'pabmi', 'admin', 'adminpabmi', 'n@n.com', 'Director', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'TERN791123HNLRZX05', 'TERN791123MQ0', '234', '99', '234', 'b055ed42-6438-11ed-a880-040300000000', '2023-06-19 15:52:01', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:05:21', '2023-06-14 16:05:21', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 1),
	('6145c381-daf1-11ed-b61c-2c4138b7dab1', NULL, 'Fernando', 'Elizondo', 'Acevedo', 'srpuv', 'srpuv@correo.com', 'Desarrollador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'LAMSDNLADMLASMDLAS', 'LKMASDLKMASDL', '2342342342', '9989', '9099090909', 'b055ed42-6438-11ed-a880-040300000000', '2023-06-21 16:42:22', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-04-14 12:23:24', '2023-05-22 17:27:59', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('61a418d5-bf6e-11ed-b789-2c4138b7dab1', NULL, 'emanuel', 'pardo', 'pardo', 'emanuel', 'asdasdas@asda.com', 'Test', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'ASDPLDLKAPSODKIOAS', 'OIASJDOJASDOI', '9723403748', '9879', '9879879789', 'b055eb06-6438-11ed-a880-040300000000', '2023-03-10 12:11:10', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-03-10 12:07:12', '2023-03-10 12:07:12', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('625607c5-75b9-11ed-aad1-040300000000', NULL, 'ñlmlñkmlkm', 'poioopimadi', 'kawasaki', 'fwefwef', 'wefwefsadasda@asdkm.sdi', '', '$2a$10$raeN2I8834JdETrDZkD.3OgGM1kpBWDSjLVCbQ7xiJZ9iiyx6FQEW', 'kksujjriifo', 'ifkfujer', '383948238', '81', '9845758594', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-06 16:57:39', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-12-06 16:57:39', '2023-01-06 09:44:10', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('6296ecf1-a1c9-11ed-b561-2c4138b7dab1', NULL, 'test', 'test', 'test', 'test1', 'test@test.test1', '', '$2a$10$y5LkOHb2./5XHUdlhtfjc.rCo8kAP6HONsz0wCoKaVdGgn.35znIK', 'test', 'test', '123456789', '123', '1234567689', 'b055eea8-6438-11ed-a880-040300000000', '2023-02-02 17:42:55', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-02 17:42:55', '2023-02-02 17:42:55', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('62983780-a1c9-11ed-b561-2c4138b7dab1', NULL, 'test', 'test', 'test', 'test2', 'test@test.test2', '', '$2a$10$kCgJyVPVnGTa7cimSHyqou6iAzhkqrurIOqKPQROG8/bTeGDZaEYC', 'test', 'test', '123456789', '123', '1234567689', 'b055eea8-6438-11ed-a880-040300000000', '2023-02-02 17:42:08', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-02 17:42:08', '2023-02-02 17:42:08', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('63706311-9906-11ed-b58e-2c4138b7dab1', '609dc46f-2b01-11ed-afdb-040300000000', 'teste', 'dis', 'rec', 'disdisteste', 'testetetstst@disrec.com', '', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'BFBBBBSBDFSBSDFLLB', 'VDVDSVBSBDSBD', '8348932747', '737', '9493457357', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-26 10:06:13', 1, '30adc962-7109-11ed-a880-040300000000', '2023-01-20 16:40:39', '2023-01-20 16:40:39', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('676a5314-9b7f-11ed-b58e-2c4138b7dab1', NULL, 'menganmitoasd', 'menganmitoasdas', 'menganmitoads', 'menganmitoasd', 'menganitoasdasdP_IdUsuario.com', '', '$2a$10$cvKy5Um.ax1uiR9xyPxu8uK5SbK6UyYOfUtMg8c1qlWL0IyFGWGaC', 'menganmito', 'menganmito', '12321312', '1231', '3123123123', 'b055ed42-6438-11ed-a880-040300000000', '2023-01-23 18:28:38', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-23 18:28:38', '2023-01-23 18:28:38', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 1),
	('6c261f7f-71d9-11ed-a880-040300000000', '511732b0-2b01-11ed-afdb-040300000000', 'César Gabriel', 'Rivera', 'Cantú', 'cesar.rivera', 'aagarcia@cecapmex.com', '', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'XAXX010101000XCXC', 'XAXX010101000', '8120201212', '631', '8120201212', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-30 13:03:50', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-01 17:36:55', '2022-12-01 17:37:25', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('6c601e3e-4b3d-11ed-a964-040300000000', NULL, 'AnalistaP', 'Participaciones ', 'Estatales', 'CPHAnalista', 'aagarcia@cecapmex.com', 'M', '$2a$10$Ew6aqnFrRENbCOyIGxsUSu.PrfZzxjPyfrnucbIjGZ42lEvwwtMhG', '----------', '----------', '----------', '---', '----------', 'b055eea8-6438-11ed-a880-040300000000', '2022-10-21 12:31:29', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-10-13 16:24:30', '2022-10-13 16:25:28', '3d472a7a-3087-11ed-aed0-040300000000', 1, 0),
	('724751b4-7042-11ed-a880-040300000000', NULL, 'Alfonso', 'Ortiz', 'Espinoza', 'Atiz', 'atiz@cecapmexcom', 'H', '$2a$10$4E3jq4LudqZzZjEq.uMWYu0jIelQhadn36nOtHSHWDPDplbInTROC', 'AOELJKASLOAS021', '0192u98712', '8182873839', '123', '234212332', 'b055eea8-6438-11ed-a880-040300000000', '2022-11-29 17:03:40', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-11-29 17:03:40', '2022-11-29 17:06:24', '3d472a7a-3087-11ed-aed0-040300000000', 1, 0),
	('74318f94-98ff-11ed-b58e-2c4138b7dab1', NULL, 'teste', 'teste', 'teste', 'di3sRecrqrTeste', 'T3esteqrrrec@hshshshs.com', '', '$2a$10$CuVGweLn.NJMULrS0wEWP..Iu0Uri.4vwIXAJ6RMzHdjOGqTxdCAW', 'BVKBVBDKBVDKJBVKJB', 'TESTEETETTFIY', '5654449444', '999', '4999499949', 'b055eea8-6438-11ed-a880-040300000000', '2023-02-02 17:40:08', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-02 17:40:08', '2023-02-02 17:40:08', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('74f8e43f-7266-11ed-a880-040300000000', '609dc46f-2b01-11ed-afdb-040300000000', 'Norma Lydia', 'Mendoza', 'Rodríguez ', 'norma.mendoza', 'norma.mendoza@nuevoleon.gob.mx', '', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'MERN730513MNLNDR00', 'MERN730513V26', '8120201329', '1329', '8115331501', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-06 09:44:11', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:26:29', '2022-12-02 10:39:01', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('76de21e2-0b05-11ee-ba60-3cd92b4d9bf4', NULL, 'enlace', 'pabmi', 'enlace', 'enlacepabmi', 'n4@n4.com', 'auxiliar', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'TERN791123HNLRZX05', 'TERN791123MQ0', '7', '7', '7', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-20 16:41:10', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:48:21', '2023-06-14 16:48:21', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('7f4a407b-98fd-11ed-b58e-2c4138b7dab1', NULL, 'testeDis', 'teste', 'recurs', 'dis.recTeste', 'teste.teste@hotmail.com', '', '$2a$10$8DWm3skg0YDAE.ZFCVYeSucTgAQW314iuTTGTDS5csRGZeAiCycOu', 'WGWEGWEEWGEWGEWGWG', 'E32REWTERGTRT', '3443433424', '4646', '4364343636', 'b055ed42-6438-11ed-a880-040300000000', '2023-01-30 19:25:10', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-30 19:25:10', '2023-01-30 19:25:10', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('831dd32e-0970-11ee-ba60-3cd92b4d9bf4', NULL, 'pruebaalta', 'pruebaalta', 'pruebaalta', 'pruebaalta', 'pruebaalta@prueba.net', 'pruebaalta', '$2a$10$IW3QrTtJmc.DkwfbZwvQIeXFjhysYLdnqLDnhaXVdaXy2d1GaI2RS', 'PRUEBAALTA', 'PRUEBAALTA', '1231231231', '1231', '3123123123', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-12 16:32:59', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-12 16:32:59', '2023-06-12 16:32:59', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('84959568-09a6-11ee-ba60-3cd92b4d9bf4', NULL, 'pruebaalta', 'pruebaalta', 'pruebaalta', 'pruebaaltaxd', 'pruebaalta@pruebaalta.com', 'pruebaalta', '$2a$10$PMPWUggHQOLKOHFRVjhyXOYsmTupjSkv/HPoNCtwBMzUGI/PcYGV2', 'PRUEBAALTA21321312', 'PRUEBAALTA123', '4234234233', '2342', '2314342342', 'b055ed42-6438-11ed-a880-040300000000', '2023-06-14 16:13:58', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:13:58', '2023-06-14 16:13:58', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 1),
	('85940667-96b2-11ed-a912-705a0f328da6', NULL, 'usuario2', 'usuario2|', 'usuario2', 'usuario2q', 'usuario2q@gmail.com', '', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'GAMA920807HVZRRD00', 'GAMA920807EB6', '8126902423', '569', '8126902423', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-20 12:47:35', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-17 16:02:46', '2023-01-17 16:02:46', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('868a18b0-8194-11ed-a963-040300000000', NULL, 'Pedro', 'Pardo', 'Gaytán', 'ricardop', 'Baxterspartan009@gmail.com', '', '$2a$10$Zxvos2qBVBqR7j9liHM8q.Vjxo49K4Ey9po7lGqsFd/F9D2Z7jQ3W', '030198', 'lkmalskmdlakm', '1111111111', '1111', '1111111111', 'b055eb06-6438-11ed-a880-040300000000', '2023-04-11 15:25:54', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2022-12-21 19:08:01', '2023-01-23 15:48:54', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('8771622d-f452-11ed-b6df-2c4138b7dab1', NULL, 'srpuvdev', 'srpuvdev', 'srpuvdev', 'srpuvdev', 'srpuvdev@correo.com', 'Desarrollador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'LAMSDNLADMLASMDLAS', 'LKMASDLKMASDL', '2342342342', '9989', '9099090909', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-16 20:08:34', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-05-16 19:38:03', '2023-05-16 19:38:03', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('892ae82c-3a8c-11ed-aed0-040300000000', NULL, 'Gerardo', 'Flores', 'de la Cruz', 'gerardoflores', 'gaflores@cecapmex.com', '', '$2a$10$WYBluOktUkDIOmSh65BZNeg5OYF2wiO7msZNsnmPLvY21vD0eOubm', '----------', '----------', '----------', '---', '----------', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 15:11:03', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-22 10:37:58', '2022-09-22 11:27:20', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('89cdbf65-e5ec-11ed-b61c-2c4138b7dab1', NULL, 'testet', 'restet', 'tcgzjhcdbcjvh', '12345.1234', '12345.1234@kjsbvksjbv.com', 'fsdvdsvdsv', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'CAMV821001MNLRDR04', 'VDSVDSVDSVDSV', '6456474656', '5745', '5474574575', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-28 11:56:40', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-28 11:46:26', '2023-04-28 11:46:26', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('92e113bd-9c3a-11ed-b58e-2c4138b7dab1', NULL, 'Iris Cecilia ', 'Lechuga ', 'Arteaga', 'iclechuga', 'iclechuga@cecapmex.com', '', '$2a$10$R572IfaW0CpyuKOKocppue2rddXkWpTZ5pe93hklHLhWhojPN6UkG', 'iclechuga', 'iclechuga', '8128748459', '9898', '8328423894', 'b055ed42-6438-11ed-a880-040300000000', '2023-01-24 16:05:07', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-24 16:05:07', '2023-01-24 16:05:07', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 1),
	('93a07e88-7267-11ed-a880-040300000000', '609dc46f-2b01-11ed-afdb-040300000000', 'Cynthia Selene', 'Vera', 'Zapata', 'cynthia.vera', 'cynthia.vera@nuevoleon.gob.mx', '', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'VEZC841002MTSRPY07', 'VEZC841002231', '8120202476', '2476', '8120115044', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-02 10:34:30', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:34:30', '2022-12-02 10:39:05', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('94b76caa-b7b0-11ed-8002-d89d6776f970', NULL, 'Francisco Alberto', 'Bernal', 'Hernandez', 'francisco.bernal', 'francisco.bernal@nuevoleon.gob.mx', 'GENERICO', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'BEHF941004HNLRRR02', 'BEHF941004MN6', '8120201300', '1378', '8120201300', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-31 10:10:05', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('971ffd7d-7824-11ed-aad1-040300000000', NULL, 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba@asd.com', '', 'asdasdasdasd', 'Prueba', 'Prueba', '234234', '23', '23423', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-13 16:50:44', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-12-13 16:50:44', '2022-12-13 16:50:44', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('9cdd8f7b-96b1-11ed-a912-705a0f328da6', NULL, 'tes2', 'tes23', 'tesr4', 'tes1', 'pruebas@gmail.com', '', '$2a$10$SPBOCpnCMFpDAiRiWHO.zeRCeIwyR8ogztns63kMMTcPi564M6Z/i', 'GAMA920807HVZRRD00', 'GAMA920807EB6', '8126902423', '858', '8126902423', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-17 15:55:10', 0, '30adc962-7109-11ed-a880-040300000000', '2023-01-17 15:55:10', '2023-01-17 15:55:10', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('a143de74-977b-11ed-a912-705a0f328da6', NULL, 'Visualizar', 'dvdsvs', 'sdvdvd', 'vsdvdsv', 'vdsvsvd@dfbdf.com', '', '$2a$10$6jc/yHa1UsvWkW5cImW8.ukEdayyg.m/am1.QUqRmgY.onooyeEEu', 'OUMA920204HVZLRB05', 'VVWBBSBSBBSBS', '4567457457', '5745', '5474575475', 'b055eea8-6438-11ed-a880-040300000000', '2023-02-02 17:40:37', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-02 17:40:37', '2023-02-02 17:40:37', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('a4f79e57-32b7-11ed-aed0-040300000000', NULL, 'Pedro Ricardo', 'Pardo G', 'Gaytan', 'prpardo', 'prpardo@cecapmex.com', 'Desarrollador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', '22222222222222222', '2222222222222', '98', '2222', '98', 'b055eb06-6438-11ed-a880-040300000000', '2023-06-21 16:57:15', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-12 11:26:24', '2023-02-07 13:25:14', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('a52a911f-f452-11ed-b6df-2c4138b7dab1', NULL, 'srpucdev', 'srpucdev', 'srpucdev', 'srpucdev', 'srpucdev@correo.com', 'Capturador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'ASDASFASFASFFASFAS', 'ASDASJANSIUAH', '2534234234', '2359', '9809890980', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-17 17:58:17', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-05-16 19:37:58', '2023-05-16 19:37:58', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('a6860b44-3087-11ed-aed0-040300000000', 'f99fe513-516d-11ed-ab6c-040300000000', 'José A.', 'Pérez', 'Alonso', 'SpiderMan', 'japerez@cecapmex.com', 'DEV', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', '111111111111111111', 'GOTJ971127BF8', '9812313123', '---2', '9812312312', 'b055ed42-6438-11ed-a880-040300000000', '2023-06-21 17:03:38', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-09 16:37:49', '2023-02-22 15:33:36', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('a77a303c-3a98-11ed-a261-0242ac120002', NULL, 'Jose', 'serna', 'meza', 'jaguedo', 'joseaguedosernameza@gmail.com', '', '$2y$10$UzjgRgXC4qANCryExLYpuuoTRe4MxFghcP2/G.RqV4RHXHWw54LEO', '----------', 'GOTJ971127BF8', '----------', '---', '----------', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-21 16:45:10', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-22 00:00:00', '2022-09-22 00:00:00', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('aab29190-74bb-11ed-aad1-040300000000', NULL, 'Alex', 'Alonso', 'Alonso', 'eavoley', 'eavoley@gmail.com', 'G', '$2a$10$nrMt202N8Y72IcbQEB4TJe52cT0IhwHbXZ98vvzcl9CPlDyp1meDW', 'PEAE950602HTSRLM09', 'GOTJ971127BF8', '8182873837', '123', '8182873837', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-05 10:41:28', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-12-05 10:41:28', '2022-12-06 13:38:45', '3d472a7a-3087-11ed-aed0-040300000000', 1, 0),
	('ab583a15-a3e0-11ed-b561-2c4138b7dab1', '6d8fefa8-50c1-11ed-ab6c-040300000000', 'fbdfbdfdfb', 'bdfbdfb', 'gfjfjhjj', 'abelino_olguin', 'abelino_olguin@hotmail.com', 'teste', '$2a$10$H4h5bP5/unAGkOX4Ey5bf..ayluw6MUpcRBreocfbtWcyNV4bsc0y', 'BDBFDBDFBDFBFDBBDG', 'GFGFBDFBFDBFG', '111', '020', '4242', 'b055eea8-6438-11ed-a880-040300000000', '2023-02-03 11:06:26', 1, '30adc962-7109-11ed-a880-040300000000', '2023-02-03 10:44:30', '2023-03-13 11:22:26', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('afd7a5f6-75b5-11ed-aad1-040300000000', NULL, 'Alejandro', 'Rodriguez', 'Pruebita', 'AlexRo', 'AlexRodirguez@gmail.com', 'F', '$2a$2a$10$ffuuHTk2xXwVNM2gWSuhPOU2IZDsIJ5M45/LZtxmxXHMQ1DjEBT/S', 'AlexNL123123123klm', 'ASDSADqwe323', '2674846736', '87', '7663737384', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-06 16:31:11', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-12-06 16:31:11', '2022-12-06 16:31:11', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('b17a8c4b-96ba-11ed-a912-705a0f328da6', NULL, 'escobedo', 'escobedo', 'escobedo', 'escobedo1', 'escobedo@prueba.com', '', '$2a$10$ek7mnRjmDz29SrbtilTCzeJAb0CFHnVrK1UOkEH5sElz08UIK91pG', 'GAMA920807HVZRRD00', 'GAMA920807EB6', '8126902423', '345', '8126902423', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-30 19:19:37', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-30 19:19:37', '2023-01-30 19:19:37', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('b3554a44-7d76-11ed-aa0d-040300000000', NULL, 'rodrigo', 'gomez', 'morin', 'RodrigoGomez3', 'rodrigoGomez3@mail.com', '', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'jjushsdhd789rjdf8d', 'jsjdyuf8er9rk', '3847483897', '9867', '8384949277', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-16 17:38:54', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2022-12-16 13:20:48', '2022-12-16 13:20:48', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('b547bd37-0628-11ee-b6df-2c4138b7dab1', NULL, 'afgfdg', 'adfgdfg', 'asdlaksmd', 'llzxkmclzkxc', 'pedro@njcd.mcs', 'sadfsdfsdf', '$2a$10$JoFVHyXn/znsyaMMxJDQFev/dunDKgSLAwfURP.59AMJ/yB1iJp1q', 'ASDASLKDMALSKÑDMAO', 'TESTSADASDASD', '1231231231', '9901', '2131231231', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-10 16:36:35', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-06-10 16:36:35', '2023-06-10 16:36:35', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('b63716b4-75bb-11ed-aad1-040300000000', NULL, 'iuohb', 'oihub', 'ohijoib', 'rhrthrt', 'rthrth@jhbads.com', '', '$2a$10$BkV7OtSnGJafE65T3YVWq.5q2oq2/xRC6vtAdx3fGb.VxODBQOxoy', 'jikhjbijb', 'iohihb', '12312', '878', '8767979', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-06 17:14:19', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-12-06 17:14:19', '2022-12-06 17:14:19', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('b7c6c52a-9779-11ed-a912-705a0f328da6', NULL, '1', '1', '1', '1', '1', 'Gerentegeneral', '$2a$10$UoW/luvV/xfjA/sSUXrgsOTgT8NoYWhAqMx9CD.lix3u73wqqQDWa', 'redactado', 'redactado', '1', '1234', '1', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-25 19:34:25', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-01-25 19:34:25', '2023-02-14 18:17:58', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('b9613ec7-f032-11ed-b61c-2c4138b7dab1', NULL, 'admin', 'revisor', 'srpu', 'srpurevisor', 'srpurevisor@correo.com', 'revisor', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'CURPFICTICION12312', 'RFCFICTICIOA8', '2342342342', '9879', '9789797979', 'b055ed42-6438-11ed-a880-040300000000', '2023-05-17 10:11:02', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-05-11 13:39:13', '2023-05-11 16:46:13', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('bdc43309-7266-11ed-a880-040300000000', '609dc46f-2b01-11ed-afdb-040300000000', 'Carlos Alberto', 'Esquivel', 'Esqueda', 'carlos.esquivel', 'carlos.esquivel@nuevoleon.gob.mx', '', '$2a$10$Haq39bK7XBnvVx2F/YqXh.k.Pw8rMUrogHnKIcvOqHt6u7ica7Pwu', 'EUEC850408HNLSSR06', 'EUEC850408EFA', '8120201494', '1494', '8120738801', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-02 10:28:31', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 10:28:31', '2022-12-02 10:39:09', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('bf4d7d36-9827-11ed-a912-705a0f328da6', NULL, 'teste', 'teset2', 'teste3', 'teste.teste', 'teste@teste.com', '', '$2a$10$OPzueYeAc17I8hkKwTUxbudkcs/K4PGFOmTj7XbGv97NWyEsAlMj2', 'NFLSNLFSNLBNLBNSBN', 'CSDNVNDSVDSBV', '4564646464', '45', '7657576576', 'b055ed42-6438-11ed-a880-040300000000', '2023-01-30 19:24:16', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-01-30 19:24:16', '2023-01-30 19:24:16', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('c18fc135-3a89-11ed-aed0-040300000000', NULL, 'Noe', 'Treviño', 'Ruiz', 'NoeTrevino', 'ntrevino@cecapmex.com', '', '$2a$10$T44bULjFwmEjcwImUieOdOp4Lu/pgifA88.P8FG.ycUslRXYCga/q', 'TERN791123N', 'TERN791123M', '81117650', '1221', '81117650', 'b055eb06-6438-11ed-a880-040300000000', '2023-06-21 16:16:33', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-22 10:18:05', '2022-11-30 12:48:39', '3d472a7a-3087-11ed-aed0-040300000000', 0, 1),
	('c3f329d8-3aa5-11ed-aed0-040300000000', NULL, 'Abelino', 'Olguin', 'Morales', 'aolguin', 'aolguin@cecapmex.com', 'D', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'CURP', 'RFC', '9889', '52', '78676', 'b055ed42-6438-11ed-a880-040300000000', '2023-03-28 17:35:25', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-22 13:38:34', '2022-11-30 12:49:06', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('c7732105-ad91-11ed-b719-2c4138b7dab1', NULL, 'Josvan', 'De Jesus', 'Hdz', 'Josvan', 'josvan@cecapmex.com', 'Desarrollador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'lkamsldmlaskmdlmas', 'lamksdlmasldm', '8768678767', '6876', '8776876876', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-20 16:27:10', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-23 18:54:33', '2023-02-23 18:54:33', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('c9839247-b7b0-11ed-8002-d89d6776f970', NULL, 'Alexa Gabriela', 'Hernandez', 'Ibarra', 'alexa.hernandez', 'alexa.hernandez@nuevoleon.gob.mx', 'GENERICO', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'HEIA991014MNLRBL07', 'HEIA991014UFA', '8120201300', '6284', '8120201300', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-02 07:31:41', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('c9c8d27a-432d-11ed-aea4-040300000000', NULL, 'Juan', 'Caballero', 'Alanis', 'Jcaballero', 'jacaballero@cecapmex.com', '', '$2a$10$dcB3hRQoSDrYtbXcJ5azy.TO.t5fWL/lB36igSJQAi0oEZ2TOl6uW', '----------', '----------', '----------', '---', '----------', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-30 09:15:45', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-10-03 10:12:24', '2022-11-01 10:23:42', '3d472a7a-3087-11ed-aed0-040300000000', 0, 1),
	('cad8d847-f034-11ed-b61c-2c4138b7dab1', NULL, 'admin', 'autorizador', 'srpu', 'srpuautorizador', 'srpuautorizador@correo.com', 'autorizador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'CURPFICTICION12312', 'RFCFICTICIOA8', '2342342342', '2342', '2342342342', 'b055ed42-6438-11ed-a880-040300000000', '2023-05-17 10:26:57', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-05-11 13:48:58', '2023-05-11 16:46:09', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('cb993d7a-b84f-11ed-8002-d89d6776f970', NULL, 'Karla Yesenia', 'Delgado', 'Garcia ', 'karla.delgado', 'karla.delgado@nuevoleon.gob.mx', 'GENERICO', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'DEGK900306MNLLRR05', 'DEGK900306PR9', '8120201377', '0', '8120201377', 'b055eea8-6438-11ed-a880-040300000000', '0000-00-00 00:00:00', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('cddd8670-a71f-11ed-b719-2c4138b7dab1', NULL, 'baxter', 'baxter', 'baxter', 'baxter', 'baxter@baxter.bax', '', '$2a$10$VfpbwoTpaFB6NcnaWKaPJevprWErW1LMVeFq9aI4vYQ4qX/BIuZu2', 'BAXTERASDSADASDASD', 'BAXTERBAXTERB', '4545654645', '4564', '4564564564', 'b055ed42-6438-11ed-a880-040300000000', '2023-02-07 13:44:15', 0, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-07 13:44:15', '2023-02-07 13:44:15', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('ce774db8-e2e1-11ed-b5ea-0242ac120002', NULL, 'Mayra', 'Cortes', 'Carrizales', 'mkcortes', 'mkcortes@cecapmex.com', 'Front End', '$2y$10$NQinyMPHv4JLziYFaVGeB.lOOdj8DOw5wjAS4PCOj3mWx7GkQmQ3O', 'MKCORTES86', 'MKCORTES86', '8211413604', '821', '8211413604', 'b055eb06-6438-11ed-a880-040300000000', '2023-06-21 16:16:17', 1, 'a77a303c-3a98-11ed-a261-0242ac120002', '2023-04-24 15:05:23', '2023-04-24 15:05:23', 'a77a303c-3a98-11ed-a261-0242ac120002', 0, 0),
	('cf1c90c2-7656-11ed-aad1-040300000000', '6b71f18b-2b01-11ed-afdb-040300000000', 'Alma Adriana', 'Mendoza', 'Garcia', 'alma.mendoza', 'alma.mendoza@prueba.es', 'I', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'XAXX010101000XCXCX', 'XAXX010101000', '7888845558', '', '4841518515', 'b055eea8-6438-11ed-a880-040300000000', '2023-05-25 17:53:22', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-07 11:44:33', '2022-12-09 16:00:03', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('cf2cba70-818b-11ed-a963-040300000000', NULL, 'ricardo', 'pardo', 'gaytan', 'pedrop009', 'pedro.pardorg@gmail.com', 'Prueba', '$2a$10$HOLO7Qt4AoVEy9mPL2JVFe9/wvoojdDWh6Ixd4WqpGHpFjiY8Yhhy', 'kasdiasii8sad990si', 'lmnasknsaldk9', '8110870378', '0980', '8110665786', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-21 18:18:58', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2022-12-21 18:01:56', '2023-02-22 15:33:08', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('d1a8f9cd-71db-11ed-a880-040300000000', '511732b0-2b01-11ed-afdb-040300000000', 'Juan Luis', 'Jiménez', 'Herrera', 'juanluis.jimenez', 'aagarcia@cecapmex.com', '', '$2a$10$SNzKDwyIf3xLNGv.ReshOuDX4pcRSlt0PTs5L98eFgxkWSBbsgtFO', 'XAXX010101000XCXCX', 'XAXX010101000', '8120202462', '504', '8120202462', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-01 11:47:06', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-01 17:54:04', '2022-12-01 17:56:53', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('d3413f61-b87c-11ed-8002-d89d6776f970', NULL, 'ELISA', 'MADERA', 'HOLTEN', 'elisa.madera', 'elisa.madera@nuevoleon.gob.mx', 'GENERICO', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'MAHE701125MNLDLL01', 'MAHE701125Q47', '8120201340', '1340', '8120201340', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-14 15:16:06', 1, '30adc962-7109-11ed-a880-040300000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('d6ff8fec-0b04-11ee-ba60-3cd92b4d9bf4', NULL, 'director', 'pabmi', 'director', 'directorpabmi', 'n1@n1.com', 'Director', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'TERN791123HNLRZX05', 'TERN791123MQ0', '90', '90', '90', 'b055ed42-6438-11ed-a880-040300000000', '2023-06-14 17:13:16', 1, 'c18fc135-3a89-11ed-aed0-040300000000', '2023-06-14 16:50:58', '2023-06-15 09:59:36', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 1),
	('d757055b-d98b-11ed-b61c-2c4138b7dab1', NULL, 'SRPU1', 'SRPU1', 'SRPU1', 'SRPU1', 'SRPU1@correo.com', 'SRPU1', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'SRPU11111111111111', 'SRPU111111111', '2222222222', '3333', '4444444444', 'b055ed42-6438-11ed-a880-040300000000', '2023-04-14 12:17:44', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-04-12 17:44:08', '2023-04-12 17:44:08', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 1),
	('d8483c80-c9b4-11ed-afa1-0242ac120002', NULL, 'José Aguedo', 'Serna', 'Meza', 'jaguedo1', 'joseaguedosernameza@gmail.com', 'GENERICO', '$2y$10$UzjgRgXC4qANCryExLYpuuoTRe4MxFghcP2/G.RqV4RHXHWw54LEO', 'SEMA97', 'GOTJ971127BF8', '8211413604', '821', '8211412232', 'b055ed42-6438-11ed-a880-040300000000', '2023-04-05 14:39:23', 1, '0c130706-7266-11ed-a880-040300000000', '2023-03-23 13:55:08', '2023-03-23 13:55:58', '2fad75f3-b79f-11ed-8002-d89d6776f970', 0, 0),
	('d8c2a7fe-e515-11ed-b61c-2c4138b7dab1', NULL, 'rgergergrg', 'gregergerg', 'gergedfbbb', 'ggergergf.rerbreberb', 'ggergergf.rerbreberb@vsvsd.com', 'teste', '$2a$10$BFOKXxZV3r5L2TYDGRqH6e3TBfbOmKSFz9bgRHk46346nbP9x./PW', 'VHUDSVIUSHVUIDSVDS', 'SDVOHSVOUDHUD', '7454464654', '5454', '4564468484', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-27 12:09:37', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-27 12:09:37', '2023-04-27 12:09:37', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('d9e88484-759c-11ed-aad1-040300000000', NULL, 'José Ángel', 'Perez', 'Alonso', 'prprueba', 'japa97@hotmail.com', '', '$2a$10$qJs8p8O9lPR7fzw/2vQZ2exCLJ5JaWwqT8BIT7M/EF9my8ZNobILy', 'asdjksjalfhhjsnehj', 'safddsaxedwwx', '343525325', '3222', '2231231232', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-06 13:33:24', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-12-06 13:33:24', '2022-12-06 13:33:24', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('da751079-96b0-11ed-a912-705a0f328da6', NULL, 'test', 'test', 'test', 'pruebaregistro', 'pruebaregistro@gmail.com', '', '$2a$10$XDD2q1eRJdVo5jfhgv9EEen9bvUaTodNKbV8UL3jXzKFAynwACyLy', 'GAMA920807HVZRRD00', 'GAMA920807EB6', '8126902423', '256', '8126902423', 'b055eea8-6438-11ed-a880-040300000000', '2023-01-17 15:49:44', 0, '30adc962-7109-11ed-a880-040300000000', '2023-01-17 15:49:44', '2023-01-17 15:49:44', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('e01a653e-725f-11ed-a880-040300000000', '6d8fefa8-50c1-11ed-ab6c-040300000000', 'Jaime Arturo', 'Zurricanday', 'Cortaza', 'jaime.zurricanday', 'jaime.zurricandayTeste999@gmail.com', '', '$2a$10$kg1uL312iwStvTE3cKKM3eaSeNDRqaYM6f92Kg7i8HFuHgFCELj3K', 'MGE850101H1XVXVXVX', 'MGE850101H1', '8182206100', '1145', '8343011114', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-16 13:05:26', 1, '30adc962-7109-11ed-a880-040300000000', '2022-12-02 09:39:22', '2022-12-02 10:12:07', 'c18fc135-3a89-11ed-aed0-040300000000', 0, 0),
	('e3bcf1ee-f033-11ed-b61c-2c4138b7dab1', NULL, 'admin', 'validador', 'sepu', 'srpuvalidador', 'srpuvalidador@correo.com', 'validador', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'CURPFICTICION12312', 'RFCFICTICIOA8', '1122222223', '3123', '3333333333', 'b055ed42-6438-11ed-a880-040300000000', '2023-05-17 10:12:47', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-05-11 13:45:07', '2023-05-11 16:46:04', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('efd486ed-75bc-11ed-aad1-040300000000', NULL, 'asasas', 'asasadaas', 'asdasd', 'emilioa', 'asd@hotmail.com', '', '$2a$10$kxg9duEZZsjIHhaM2gOLEevL1wSht.bZ.b5u8gJQkmBhNDJdzWAm.', 'sdasdsadasdasdasds', 'asdsadasdasda', '123123123', '12', '1231231231', 'b055eea8-6438-11ed-a880-040300000000', '2022-12-06 17:23:05', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-12-06 17:23:05', '2022-12-06 17:23:05', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('f236cb5b-a0eb-11ed-802e-2c4138b7dab1', NULL, '3', '3', '3', '3', '3', 'C', '$2a$10$9L7d2Pfsc6ABalaAz8ewtum/eABY9RnSCNLf9lCG55YhXKlVATKle', '3', '3', '3', '3', '3', 'b055ed42-6438-11ed-a880-040300000000', '2023-02-02 17:41:17', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-02 17:41:17', '2023-02-08 19:26:28', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('f2dfe0bc-0176-11ee-be56-0242ac120002', NULL, 'Jose Alberto', 'Sobrado', 'test', 'jsobrado', 'jose.sobrado.sanchez@outlook.com', '', '$2y$10$UzjgRgXC4qANCryExLYpuuoTRe4MxFghcP2/G.RqV4RHXHWw54LEO', '----------', 'GOTJ971127BF8', '----------', '---', '----------', 'b055eea8-6438-11ed-a880-040300000000', '2023-06-09 08:52:44', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-09-22 00:00:00', '2022-09-22 00:00:00', '3d472a7a-3087-11ed-aed0-040300000000', 0, 0),
	('fa366d92-49a1-11ed-ad60-040300000000', NULL, 'Gonzalo', 'Cantú', 'Treviño', 'gcantu', 'gcantu@cecapmex.com', 'Gerente', '$2a$10$lrJQbPGGxOpzpNfl0kgtxePDqSHoD2sDD1xZU6t78ekQYHIVZ3EoO', 'SDFSDSDWER23454354', 'SFSDFSDFSDFSD', '1111111111', '1111', '1111111111', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-11 17:46:38', 1, '3d472a7a-3087-11ed-aed0-040300000000', '2022-10-11 15:19:14', '2023-02-02 17:56:54', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('fafc8d0e-e5ee-11ed-b61c-2c4138b7dab1', NULL, 'fegfe', 'gsdgdsgds', 'gsdgdsgs', 'gsdgdsg', 'gsdgdsggsdg@hdhdht.com', 'csdvsdvdsv', '$2a$10$8UIsjOh/oqO12TvBEGnDmuCu00rCJ3eTi3YFu7UXIUvjhgSyZpxI.', 'KBKBKBBKBBBKJBJKBK', 'UBKBBKBKBKBKB', '6876876876', '0', '8768768768', 'b055eea8-6438-11ed-a880-040300000000', '2023-04-28 12:05:11', 1, '30adc962-7109-11ed-a880-040300000000', '2023-04-28 12:03:36', '2023-04-28 12:03:36', '30adc962-7109-11ed-a880-040300000000', 0, 0),
	('fba5160b-a0f4-11ed-802e-2c4138b7dab1', NULL, 'Jesus', 'Rodrigues ', 'Gonzalo', 'Admin user', 'qwer@com.com', '', '$2a$10$CeqPPucrSi8OIvvz//9SpeatSK/LlTGSIdL0sWDEx0HhjqS.NqnKm', '2', '2', '1', '1', '1', 'b055eea8-6438-11ed-a880-040300000000', '2023-02-14 17:28:09', 1, 'a4f79e57-32b7-11ed-aed0-040300000000', '2023-02-14 17:28:09', '2023-02-14 17:28:09', 'a4f79e57-32b7-11ed-aed0-040300000000', 0, 0),
	('fbd8f92b-4b3d-11ed-a964-040300000000', NULL, 'ANALISTAA ', 'APORTACIONES ', 'FEDERALES', 'CPHAnalistaA', 'aagarcia1@cecapmex.com', 'L', '$2a$10$Ew6aqnFrRENbCOyIGxsUSu.PrfZzxjPyfrnucbIjGZ42lEvwwtMhG', '----------', '----------', '----------', '---', '----------', 'b055eea8-6438-11ed-a880-040300000000', '2022-10-20 15:17:31', 0, '3d472a7a-3087-11ed-aed0-040300000000', '2022-10-13 16:28:30', '2022-10-13 16:30:29', '3d472a7a-3087-11ed-aed0-040300000000', 1, 0),
	('ffb804ea-c8e1-11ed-b4d7-2c4138b7dab1', NULL, 'Juanita', 'Reyes', 'Hinojosa', 'jreyes', 'jjreyes@cecapmex.com', 'analista', '$2a$10$7CjfzqAo4/CmOUJdLitnEOxoXv7d6U74rhAc2U3QoAGFWio3JwCBS', 'REHS920429MVZYNN02', 'REHS9204292I3', '122', '2321', '3232', 'b055eea8-6438-11ed-a880-040300000000', '2023-03-22 12:48:17', 1, '30adc962-7109-11ed-a880-040300000000', '2023-03-22 12:48:17', '2023-03-22 12:48:17', '30adc962-7109-11ed-a880-040300000000', 0, 0);
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;

-- Volcando estructura para procedimiento TiCentral.HeidiSQL_temproutine_1
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_1`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `HeidiSQL_temproutine_1`()
SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.HeidiSQL_temproutine_2
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_2`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `HeidiSQL_temproutine_2`()
SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.spDetalleUsuarioAplicacion
DROP PROCEDURE IF EXISTS `spDetalleUsuarioAplicacion`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `spDetalleUsuarioAplicacion`(
	IN `ch_IdUsuario` CHAR(36),
	IN `ch_IdApp` CHAR(36)
)
proc:BEGIN

-- leave proc;
-- IF()THEN
--	END IF;
	
	SELECT COUNT(*) INTO @ExisteUsuario FROM TiCentral.Usuarios u WHERE u.Id= ch_IdUsuario;
	SELECT COUNT(*) INTO @ExisteAplicacion FROM TiCentral.Apps a WHERE a.Id= ch_IdApp;
	SELECT COUNT(*) INTO @ExisteUsuarioAplicacion FROM TiCentral.UsuarioAplicacion ua WHERE ua.IdUsuario=ch_IdUsuario AND ua.IdApp=ch_IdApp;
	
	IF(@ExisteUsuario!=1)THEN
		SELECT 'Error: Usuario no encontrado' AS Error;
		leave proc;
	END IF;
	
	
	IF(@ExisteAplicacion!=1)THEN
		SELECT 'Error: Aplicacion no encontrado' AS ERROR;
		leave proc;
	END IF;
	
	IF(@ExisteUsuarioAplicacion!=1)THEN
		SELECT 'Error: El usuario no esta vinculado a la aplicación' AS ERROR;
		leave proc;
	END IF;
	
	SELECT 
	U.Id,
	U.Nombre,
	U.ApellidoPaterno,
	U.ApellidoMaterno,
	U.NombreUsuario,
	U.CorreoElectronico,
	U.Puesto,
	U.Curp,
	U.Rfc,
	U.Telefono,
	U.Ext,
	U.Celular,
	U.IdTipoUsuario,
	tpo.Nombre AS TipoUsuario,
	U.EstaActivo,
	U.PuedeFirmar,
	U.UltimoInicioDeSesion,
	U.Deleted,
	
	ua.IdApp,
	-- (SELECT app.Nombre  FROM TiCentral.Apps app WHERE app.Id=ua.IdApp) AS Aplicacion,
	app.Nombre AS Aplicacion,
	ua.IdDepartamento,
	-- (SELECT depto.NombreCorto FROM TiCentral.Departamentos depto WHERE depto.Id=ua.IdDepartamento)AS NombreCortoDepartamento ,
	-- (SELECT depto.Descripcion  FROM TiCentral.Departamentos depto WHERE depto.Id=ua.IdDepartamento)AS Departamento,
	dto.NombreCorto AS NombreCortoDepartamento,
	dto.Descripcion AS Departamento,
	ua.IdPerfil,
	-- (SELECT p.Descripcion FROM TiCentral.Perfiles p WHERE p.Id=ua.IdPerfil) AS Perfil,
	p.Descripcion AS Perfil,
	ua.IdRol,
	-- (SELECT rol.Nombre FROM TiCentral.Roles rol WHERE rol.Id=ua.IdRol) AS Rol,
	rol.Nombre AS Rol,
	rol.Descripcion AS DescRol,
	ua.IdUnidadResponsable,
 	-- (SELECT ur.Clave FROM TiCentral.UResponsable ur WHERE ur.Id=ua.IdUnidadResponsable )AS ClaveUResponsable ,
 	-- (SELECT ur.Descripcion FROM TiCentral.UResponsable ur WHERE ur.Id=ua.IdUnidadResponsable )AS UnidadResponsable ,	
 	ur.Clave AS ClaveUResponsable,
 	ur.Descripcion AS UnidadResponsable,
	ua.IdDependencia,
	-- (SELECT dep.Nombre FROM TiCentral.Dependencias dep WHERE dep.Id =	ua.IdDependencia) AS Dependencia,
	dep.Nombre AS Dependencia,
	dep.IdTipoDependencia,
	tpoDep.Nombre AS TipoDependencia,
	dep.PerteneceA AS IdSecretaria,
	sec.Nombre_corto AS NombreCortoSecretaria,
	sec.Nombre AS Secretaria,
	
	
	ua.Acceso
	FROM TiCentral.Usuarios U 
	INNER JOIN TiCentral.TipoUsuario tpo ON tpo.Id=U.IdTipoUsuario
	INNER JOIN TiCentral.UsuarioAplicacion ua ON ua.IdUsuario=U.Id AND ua.IdApp=ch_IdApp
	LEFT JOIN TiCentral.Apps app ON app.Id=ua.IdApp
	LEFT JOIN TiCentral.Departamentos dto ON dto.Id=ua.IdDepartamento
	LEFT JOIN TiCentral.Perfiles p ON p.Id=ua.IdPerfil
	LEFT JOIN TiCentral.Roles rol ON rol.Id=ua.IdRol
	LEFT JOIN TiCentral.UResponsable ur ON ur.Id=ua.IdUnidadResponsable
	LEFT JOIN TiCentral.Dependencias dep ON dep.Id=ua.IdDependencia
	LEFT JOIN TiCentral.TipoDependencias tpoDep ON tpoDep.Id=dep.IdTipoDependencia
	LEFT JOIN TiCentral.Secretarias sec ON sec.Id=dep.PerteneceA
	
	WHERE U.Id= ch_IdUsuario;
	
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


				SELECT Id,Nombre,ApellidoPaterno,ApellidoMaterno,NombreUsuario,CorreoElectronico,Puesto,Curp,Rfc,Telefono,Ext,Celular,s.IdApp,s.IdUResponsable,s.IdPerfil,s.IdRol,s.IdDepartamento,s.IdDependencia,s.IdTipoUsuario,s.PuedeFirmar
				INTO @Id,@Nombre,@ApellidoPaterno,@ApellidoMaterno,@NombreUsuario,@CorreoElectronico,@Puesto,@Curp,@Rfc,@Telefono,@Ext,@Celular,@IdApp,@IdUResponsable,@IdPerfil,@IdRol,@IdDepartamento,@IdDependencia,@IdTipoUsuario,@PuedeFirmar
				from TiCentral.Solicitudes s
				where Id=P_IdSolicitud;

	
					INSERT INTO TiCentral.Usuarios (Id,Nombre,ApellidoPaterno,ApellidoMaterno,NombreUsuario,CorreoElectronico,Puesto,Curp,Rfc,Telefono,Ext,Celular,
					IdTipoUsuario,CreadoPor,ModificadoPor,Contrasena,EstaActivo,PuedeFirmar)
					VALUES(@Id,@Nombre,@ApellidoPaterno,@ApellidoMaterno,@NombreUsuario,@CorreoElectronico,@Puesto,@Curp,@Rfc,@Telefono,@Ext,@Celular,
					@IdTipoUsuario,P_IdUsuario,P_IdUsuario,P_Contrasena,1,@PuedeFirmar);
	
				
				CALL `sp_VinculaUsuarioApp`(P_IdSolicitud, @IdApp,@IdDepartamento,@IdPerfil,@IdRol,@IdUResponsable,@IdDependencia,P_IdUsuario);
					
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
			
			SELECT Nombre,ApellidoPaterno,ApellidoMaterno,Puesto,Curp,Rfc,Telefono,Ext,Celular
				INTO @Nombre,@ApellidoPaterno,@ApellidoMaterno,@Puesto,@Curp,@Rfc,@Telefono,@Ext,@Celular
				from TiCentral.Solicitudes
				where Id=P_IdSolicitud;
				
			
				IF(P_EsAdmin = 1) THEN
					SET @P_IdTipoUsuario = (SELECT Id FROM TiCentral.TipoUsuario WHERE UCASE(Nombre)= UCASE('AdminPlataforma'));
				ELSE
					SET @P_IdTipoUsuario = (SELECT Id FROM TiCentral.TipoUsuario WHERE UCASE(Nombre)= 'USER');
				END IF;

			IF(P_PuedeFirmar = 1) THEN
				UPDATE TiCentral.Usuarios u
				SET
					u.Nombre=@Nombre,
					u.ApellidoPaterno=@ApellidoPaterno,
					u.ApellidoMaterno=@ApellidoMaterno,
					u.Puesto=@Puesto,
					u.Curp=@Curp,
					u.Rfc=@Rfc,
					u.Telefono=@Telefono,
					u.Ext=@Ext,
					u.Celular=@Celular,
					u.IdTipoUsuario= @P_IdTipoUsuario,
					u.PuedeFirmar=1,
					u.UltimaModificacion = CURRENT_TIMESTAMP(),
							u.ModificadoPor = P_IdUsuario
				WHERE u.Id =  @IdUser;
			ELSE
				UPDATE TiCentral.Usuarios u
				SET
					u.Nombre=@Nombre,
					u.ApellidoPaterno=@ApellidoPaterno,
					u.ApellidoMaterno=@ApellidoMaterno,
					u.Puesto=@Puesto,
					u.Curp=@Curp,
					u.Rfc=@Rfc,
					u.Telefono=@Telefono,
					u.Ext=@Ext,
					u.Celular=@Celular,
					u.IdTipoUsuario= @P_IdTipoUsuario,
					u.UltimaModificacion = CURRENT_TIMESTAMP(),
							u.ModificadoPor = P_IdUsuario
				WHERE u.Id =  @IdUser;
			END IF;	
				
			
            
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

-- Volcando estructura para procedimiento TiCentral.sp_CrearDepartamento
DROP PROCEDURE IF EXISTS `sp_CrearDepartamento`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CrearDepartamento`(
	IN `st_Descripcion` VARCHAR(200),
	IN `st_NombreCorto` VARCHAR(50),
	IN `ch_IdResponsable` CHAR(36),
	IN `ch_CreadoPor` CHAR(36)
)
proc : BEGIN
	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_CreadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	
	SELECT COUNT(*) INTO @Existe FROM TiCentral.Departamentos D WHERE D.Descripcion=st_Descripcion OR D.NombreCorto=st_NombreCorto;
	
	IF(@Existe != 0)THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dependencia existente o invalida.';
		LEAVE proc;	
	END IF;

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
	INSERT INTO TiCentral.Departamentos(Descripcion,NombreCorto,IdResponsable,ModificadoPor,CreadoPor)
VALUES(st_Descripcion,st_NombreCorto,ch_IdResponsable,ch_CreadoPor,ch_CreadoPor);
		
			IF(SELECT ROW_COUNT() != 1)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se registro el departamento';
				LEAVE proc;	
			END IF;
			
		SELECT CONCAT('El departamento ',st_Descripcion,' se creo con exito') AS Respuesta;

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CrearDependencia
DROP PROCEDURE IF EXISTS `sp_CrearDependencia`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CrearDependencia`(
	IN `st_Nombre` VARCHAR(200),
	IN `st_Direccion` LONGTEXT,
	IN `st_Telefono` VARCHAR(10),
	IN `ch_IdTipoDependencia` CHAR(36),
	IN `ch_IdTitular` CHAR(36),
	IN `ch_PerteneceA` CHAR(36),
	IN `ch_CreadoPor` CHAR(36)
)
proc : BEGIN
	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_CreadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		SELECT COUNT(*) INTO @Existe FROM TiCentral.Dependencias D WHERE D.Nombre=st_Nombre;
		
		IF(@Existe != 0)THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nombre de dependencia invalido o en uso.';
			LEAVE proc;	
		END IF;
	
		INSERT INTO TiCentral.Dependencias(Nombre,Direccion,Telefono,IdTipoDependencia,IdTitular,PerteneceA,ModificadoPor,CreadoPor)
		VALUES(st_Nombre,st_Direccion,st_Telefono,ch_IdTipoDependencia,ch_IdTitular,ch_PerteneceA,ch_CreadoPor,ch_CreadoPor);
		
			IF(SELECT ROW_COUNT() != 1)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se registro la unidad responsable';
				LEAVE proc;	
			END IF;
			
		SELECT CONCAT('La dependencia ',st_Nombre,' se creo con exito') AS Respuesta;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CrearPerfil
DROP PROCEDURE IF EXISTS `sp_CrearPerfil`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CrearPerfil`(
	IN `st_Descripcion` VARCHAR(200),
	IN `st_Referencia` VARCHAR(20),
	IN `ch_CreadoPor` CHAR(36)
)
proc: BEGIN

SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_CreadoPor;
SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';


IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN

	SELECT COUNT(*) INTO @Existe FROM TiCentral.Perfiles Perfil WHERE Perfil.Descripcion = st_Descripcion;
	IF(@Existe != 0)
	THEN
  	 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Perfil invalido o en uso.';
   	LEAVE proc;    
	END IF;

   INSERT INTO TiCentral.Perfiles(Descripcion,Referencia,CreadoPor,ModificadoPor)
   VALUES(st_Descripcion, st_Referencia, ch_CreadoPor, ch_CreadoPor);
   
   IF(SELECT ROW_COUNT() = 0)
	THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se registro el perfil.';
      LEAVE proc;    
   END IF;
            
   SELECT CONCAT('El perfil ',st_Descripcion,' se creo con exito.') AS Respuesta;

ELSE

   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado.';
   
END IF;	
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CrearRol
DROP PROCEDURE IF EXISTS `sp_CrearRol`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CrearRol`(
	IN `st_Nombre` VARCHAR(100),
	IN `st_Descripcion` VARCHAR(200),
	IN `st_ControlInterno` VARCHAR(50),
	IN `ch_CreadoPor` CHAR(36)
)
proc: BEGIN
	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_CreadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
		SELECT COUNT(*) INTO @Existe FROM TiCentral.Roles R WHERE R.Nombre=st_Nombre;
		
		IF(@Existe != 0)THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nombre de dependencia invalido o en uso.';
			LEAVE proc;	
		END IF;
		INSERT INTO TiCentral.Roles(Nombre,Descripcion,ControlInterno,ModificadoPor,CreadoPor)
		VALUES(st_Nombre,st_Descripcion,st_ControlInterno,ch_CreadoPor,ch_CreadoPor);
		
		IF(SELECT ROW_COUNT() != 1)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se registro la unidad responsable';
				LEAVE proc;	
			END IF;
			
		SELECT CONCAT('Rol ',st_Nombre,' se creo con exito') AS Respuesta;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CrearSecretaria
DROP PROCEDURE IF EXISTS `sp_CrearSecretaria`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CrearSecretaria`(
	IN `st_Nombre` VARCHAR(255),
	IN `st_Nombre_corto` VARCHAR(255),
	IN `ch_IdTitular` CHAR(36),
	IN `ch_PerteneceA` CHAR(36),
	IN `st_Direccion` LONGTEXT,
	IN `ch_CreadoPor` CHAR(36)
)
proc : BEGIN
	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_CreadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	
	SELECT COUNT(*) INTO @Existe FROM TiCentral.Secretarias S WHERE S.Nombre_corto=st_Nombre_corto OR S.Nombre=st_Nombre;
	
	IF(@Existe != 0)THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre o nombre corto ya existe';
		LEAVE proc;	
	END IF;

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		INSERT INTO TiCentral.Secretarias(Nombre,Nombre_corto,IdTitular,PerteneceA,Direccion,CreadoPor,ModificadoPor)
		VALUES(st_Nombre,st_Nombre_corto,ch_IdTitular,ch_PerteneceA,st_Direccion,ch_CreadoPor,ch_CreadoPor);
		
		IF(SELECT ROW_COUNT() != 1)THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se registro la unidad responsable';
			LEAVE proc;	
		END IF;
		
		SELECT CONCAT('La Secretaria ',st_Nombre,' se creo con exito') AS Respuesta;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CrearTpoDependencia
DROP PROCEDURE IF EXISTS `sp_CrearTpoDependencia`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CrearTpoDependencia`(
	IN `st_Nombre` VARCHAR(200),
	IN `st_Descripcion` LONGTEXT,
	IN `ch_CreadoPor` CHAR(36)
)
proc : BEGIN

	
	
	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_CreadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	
	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		SELECT COUNT(*) INTO @Existe FROM TiCentral.TipoDependencias tpo WHERE tpo.Nombre=st_Nombre;
	
		IF(@Existe != 0)THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nombre invalido o en uso.';
			LEAVE proc;	
		END IF;
	
		INSERT INTO TiCentral.TipoDependencias(Nombre,Descripcion,ModificadoPor,CreadoPor)
		VALUES(st_Nombre,st_Descripcion,ch_CreadoPor,ch_CreadoPor);
		
			IF(SELECT ROW_COUNT() != 1)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se registro el  tipo de dependencia';
				LEAVE proc;	
			END IF;
			
		SELECT CONCAT('El tipo de dependencia ',st_Nombre,' se creo con exito') AS Respuesta;

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_CrearUResponsable
DROP PROCEDURE IF EXISTS `sp_CrearUResponsable`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_CrearUResponsable`(
	IN `st_Clave` VARCHAR(10),
	IN `st_Descripcion` VARCHAR(500),
	IN `ch_CreadoPor` CHAR(36)
)
proc : BEGIN
	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_CreadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	
	SELECT COUNT(*) INTO @Existe FROM TiCentral.UResponsable Ur WHERE Ur.Clave=st_Clave;
	
	IF(@Existe != 0)THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Clave invalida o en uso.';
		LEAVE proc;	
	END IF;

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		INSERT INTO TiCentral.UResponsable(Clave,Descripcion,ModificadoPor,CreadoPor)
		VALUES(st_Clave,st_Descripcion,ch_CreadoPor,ch_CreadoPor);
		
			IF(SELECT ROW_COUNT() != 1)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se registro la unidad responsable';
				LEAVE proc;	
			END IF;
			
		SELECT CONCAT('La unidad responsable con clave ',st_Clave,' se creo con exito') AS Respuesta;

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
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
	IN `P_Puesto` VARCHAR(255),
	IN `P_Contrasena` VARCHAR(255),
	IN `P_IdUsuario` CHAR(37),
	IN `P_Curp` VARCHAR(18),
	IN `P_Rfc` VARCHAR(13),
	IN `P_Telefono` VARCHAR(10),
	IN `P_Ext` VARCHAR(4),
	IN `P_Celular` VARCHAR(10),
	IN `P_IdTipoUsuario` VARCHAR(37),
	IN `P_PuedeFirmar` TINYINT(1)
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
				Puesto,
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
				IdTipoUsuario,
				PuedeFirmar,
				EstaActivo
				) VALUES(
				P_Nombre,
				P_ApellidoPaterno,
				P_ApellidoMaterno,
				P_NombreUsuario,
				P_CorreoElectronico,
				P_Puesto,
				P_Contrasena,
				P_Curp,
				P_Rfc,
				P_Telefono,
				P_Ext,
				P_Celular, CURRENT_TIMESTAMP(),
				P_IdUsuario, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(),
				P_IdUsuario,
				P_IdTipoUsuario,
				P_PuedeFirmar,
				1); 
				SET Respuesta=201;
				SELECT Respuesta,'Usuario creado con éxito' AS Mensaje,TiCentral.Usuarios.*
				FROM TiCentral.Usuarios
				WHERE NombreUsuario = P_NombreUsuario AND CorreoElectronico = P_CorreoElectronico; 
				
				
				
				IF(P_IdTipoUsuario=(SELECT tu.Id FROM TiCentral.TipoUsuario tu WHERE tu.Nombre='AdminGeneral'))THEN
					SET @IdUsuarioCreado = (SELECT Id FROM TiCentral.Usuarios WHERE NombreUsuario=P_NombreUsuario AND CorreoElectronico=P_CorreoElectronico);
					SET @IdTiCentral = (SELECT Id FROM TiCentral.Apps ap WHERE ap.Nombre='ADMIN');
					CALL sp_VinculaUsuarioApp(@IdUsuarioCreado , @IdTiCentral, P_IdUsuario);
				END IF;
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
	IN `P_Puesto` VARCHAR(255),
	IN `P_Curp` VARCHAR(18),
	IN `P_Rfc` VARCHAR(13),
	IN `P_Celular` VARCHAR(10),
	IN `P_Telefono` VARCHAR(10),
	IN `P_Ext` VARCHAR(4),
	IN `P_TipoSolicitud` VARCHAR(36),
	IN `P_DatosAdicionales` VARCHAR(2000),
	IN `P_IdApp` CHAR(36),
	IN `P_CreadoPor` CHAR(36),
	IN `P_IdUResponsable` CHAR(36),
	IN `P_IdPerfil` CHAR(36),
	IN `P_IdRol` CHAR(36),
	IN `P_IdDepartamento` CHAR(36),
	IN `P_IdTipoUsuario` CHAR(36),
	IN `P_PuedeFirmar` TINYINT(1),
	IN `P_IdDependencia` CHAR(36)
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

SET @TpoTexto = UPPER(P_TipoSolicitud);

#region obtener los UUID de los tipos de solicitud
CASE UPPER(P_TipoSolicitud)
	WHEN 'ALTA' THEN 
		SET @TpoAlta = (SELECT ID FROM TiCentral.TipoSolicitud t WHERE UPPER(t.tipoSoli)='ALTA');
		SET @TpoVinculacion = (SELECT ID FROM TiCentral.TipoSolicitud t WHERE UPPER(t.tipoSoli)='VINCULACION');
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

#region obtiene el id del usuario solicitado, si es que existe
	SET @Existe = 0;
	SET @Respuesta ='';
	
	SET @ExisteNom =  (SELECT COUNT(Id) FROM TiCentral.Usuarios U WHERE (U.NombreUsuario = P_NombreUsuario));
	IF (@ExisteNom != 0) THEN -- nombre de usuario ya existe
		SET @Existe = @Existe +1;
		SET @Respuesta = P_NombreUsuario;
	END IF;

	SET @ExisteMail = (SELECT COUNT(Id) FROM TiCentral.Usuarios U WHERE (U.CorreoElectronico = P_CorreoElectronico));
	IF (@ExisteMail != 0) THEN -- correo ya existe
		SET @Existe = @Existe +1;
		SET @Respuesta = @Respuesta + '-' + P_CorreoElectronico;
	END IF;	

	-- existe nombre y correo	
	IF (@Existe = 2) THEN
		SET @IdUsuario = (
			SELECT Id FROM TiCentral.Usuarios U 
			WHERE (U.NombreUsuario = P_NombreUsuario AND U.CorreoElectronico = P_CorreoElectronico));
			
		-- revisar si ese usuario ya esta vinculado a la app de q esta haciendo la solicitud
		SET @EstaVinculado = 0;
		SET @EstaVinculado = (
				SELECT COUNT(Id) FROM TiCentral.UsuarioAplicacion UA 
				WHERE (UA.IdUsuario = @IdUsuario AND UA.IdApp = P_IdApp));		
				
		-- esta vinculado		
		IF (@EstaVinculado != 0) THEN		
			-- si es tipo alta o vinculacion
			IF (@TpoTexto = 'ALTA' OR @TpoTexto = 'VINCULACION') THEN
				SELECT '406' AS Respuesta, CONCAT(@Respuesta,' ya esta vinculado a la aplicación') AS Mensaje;
				LEAVE proc;				
			END IF;			
		ELSE
			-- si no esta vinculado
			CASE UPPER(@TpoTexto)
				WHEN 'ALTA' THEN 
					SET P_TipoSolicitud = @TpoVinculacion;			
					#SELECT '201' AS Respuesta, CONCAT(@Respuesta,' usuario existente, se creo solicitud de vinculación') AS Mensaje;
				WHEN 'BAJA' THEN 
					SELECT '406' AS Respuesta, CONCAT(@Respuesta,' no esta vinculado a la aplicación') AS Mensaje;
					LEAVE proc;				
				WHEN 'MODIFICACION' THEN 
					SELECT '406' AS Respuesta, CONCAT(@Respuesta,' no esta vinculado a la aplicación') AS Mensaje;
					LEAVE proc;				
				WHEN 'VINCULACION' THEN 
					SET @TpoVinculacion = (SELECT ID FROM TiCentral.TipoSolicitud t WHERE UPPER(t.tipoSoli)='VINCULACION');
					SET P_TipoSolicitud = @TpoVinculacion ;
			END CASE;
		END IF;
	ELSE	
		-- al menos uno de los 2 existe
		IF (@Existe = 1) THEN			
			SELECT '406' AS Respuesta, CONCAT(@Respuesta,' ya existe') AS Mensaje;
			LEAVE proc;
		END IF;
		-- ninguno de los 2 existe
		IF (@Existe = 0) THEN			
			CASE UPPER(@TpoTexto)
				WHEN 'ALTA' THEN 
					SET @Continuar = 0;
				WHEN 'BAJA' THEN 
					SELECT '406' AS Respuesta, 'Usuario no existe' AS Mensaje;
					LEAVE proc;				
				WHEN 'MODIFICACION' THEN 
					SELECT '406' AS Respuesta, 'Usuario no existe' AS Mensaje;
					LEAVE proc;				
				WHEN 'VINCULACION' THEN 
					SELECT '406' AS Respuesta, 'Usuario no existe' AS Mensaje;
					LEAVE proc;
			END CASE;
		END IF;				
	END IF;
#endregion


#region valida  solicitud existente
	-- validar solicitud del mismo tipo, para el mismo usuario/correo, misma app, pendiente y/o revision que no se cree la solicitud.
	SET @Existe = 0;
	SET @Existe = (
			SELECT COUNT(Id) FROM TiCentral.Solicitudes S
			WHERE S.TipoSolicitud = P_TipoSolicitud
			AND S.CorreoElectronico = P_CorreoElectronico
			AND S.NombreUsuario = P_NombreUsuario
			AND S.IdApp = P_IdApp
			AND S.Estatus IN (0,3)				
			);
	IF (@Existe != 0) THEN
		SELECT '403' AS Respuesta,'Ya existe solicitud para este usuario' AS Mensaje;
		LEAVE proc;	
	END IF;	
#endregion 



	-- genera UUID
	SET @UUID = UUID();	
	INSERT INTO TiCentral.Solicitudes (
	Id,
	DatosAdicionales,
	Estatus,
	TiCentral.Solicitudes.TipoSolicitud,
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
	Puesto,
	Curp,
	Rfc,
	Telefono,
	Ext,
	Celular,idUResponsable,idPerfil,idRol,idDepartamento,IdTipoUsuario,PuedeFirmar,IdDependencia
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
	P_Puesto,
	P_Curp,
	P_Rfc,
	P_Telefono,
	P_Ext,
	P_Celular,P_IdUResponsable,P_IdPerfil,P_IdRol,P_IdDepartamento,P_IdTipoUsuario,P_PuedeFirmar,P_IdDependencia
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
	IN `P_Id` CHAR(36)
)
BEGIN

--	DECLARE P_NombreTipoUsuario CHAR(36);
   DECLARE Respuesta INT;
--	IF ((SELECT Tipo.Nombre FROM TiCentral.TipoUsuario AS Tipo,TiCentral.Usuarios AS Usuario WHERE Usuario.id = P_IdUsuario and Usuario.IdTipoUsuario=Tipo.Id) = 'User') THEN
--		SET Respuesta = 401;
--		SELECT Respuesta,'No tiene permisos para ver los detalles de la aplicación' AS Mensaje;
--	ELSE
		SET Respuesta = 201;
		SELECT Respuesta,TiCentral.Apps.* FROM TiCentral.Apps WHERE id=P_Id;
--	END IF;

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

-- Volcando estructura para procedimiento TiCentral.sp_DetalleDepartamento
DROP PROCEDURE IF EXISTS `sp_DetalleDepartamento`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleDepartamento`(
	IN `ch_IdDepartamento` CHAR(36),
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN
	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
		SELECT COUNT(*)  INTO @NumRegistros	FROM  TiCentral.Departamentos D WHERE  D.Id=ch_IdDepartamento;
		
		IF(@NumRegistros=1)THEN
			SELECT
			D.Id,
			D.Descripcion,
			D.NombreCorto,
			D.IdResponsable,
			CONCAT(U.Nombre,' ',U.ApellidoPaterno,' ',U.ApellidoMaterno) AS Responsable,
			D.UltimaActualizacion,
			D.FechaCreacion,
			D.ModificadoPor,
			CONCAT(UM.Nombre,' ',UM.ApellidoPaterno,' ',UM.ApellidoMaterno) AS Modificador,
			D.CreadoPor,
			CONCAT(UC.Nombre,' ',UC.ApellidoPaterno,' ',UC.ApellidoMaterno) AS Creador,
			D.Deleted
			FROM  TiCentral.Departamentos D
			INNER JOIN TiCentral.Usuarios U ON U.Id=D.IdResponsable
			LEFT JOIN TiCentral.Usuarios UM ON UM.Id=D.ModificadoPor
			LEFT JOIN TiCentral.Usuarios UC ON UC.Id=D.CreadoPor
			WHERE  D.Id=ch_IdDepartamento;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id invalido.';
		END IF;
	
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetalleDependencias
DROP PROCEDURE IF EXISTS `sp_DetalleDependencias`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleDependencias`(
	IN `P_Id` CHAR(36)
)
BEGIN

IF 
	(( SELECT COUNT(*) FROM TiCentral.Dependencias WHERE Id = P_Id) = 1) THEN 
	
	SELECT Id, 
	Nombre, 
	Direccion, 
	Telefono, PerteneceA, 
	FechaCreacion, 
	CreadoPor,
	UltimaActualizacion, 
	ModificadoPor, 
	Deleted,
	(SELECT tpo.Nombre FROM TiCentral.TipoDependencias tpo WHERE tpo.Id = D.IdTipoDependencia )  AS tipoDependencia
	FROM TiCentral.Dependencias D 
	WHERE Id = P_Id;
	
ELSE

 SELECT 'Verificar Id' AS ERROR; 
 
END IF; 

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetallePerfil
DROP PROCEDURE IF EXISTS `sp_DetallePerfil`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetallePerfil`()
BEGIN

IF 
	(( SELECT COUNT(*) FROM TiCentral.Perfiles WHERE Id = P_Id) = 1) THEN 
	SELECT Id, Descripcion, FechaCreacion, CreadoPor,UltimaActualizacion, ModificadoPor, Deleted
	FROM TiCentral.Perfiles
	WHERE Id = P_Id;
	
ELSE

 SELECT 'Verificar Id' AS ERROR; 
 
END IF; 

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetalleRol
DROP PROCEDURE IF EXISTS `sp_DetalleRol`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleRol`(
	IN `ch_IdRol` CHAR(36),
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN
	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
		SELECT COUNT(*)  INTO @NumRegistros	FROM  TiCentral.Roles  R WHERE  R.Id=ch_IdRol;
		
		IF(@NumRegistros=1)THEN
			SELECT
			R.Id,
			R.Descripcion,
			R.ControlInterno,
			CONCAT(U.Nombre,' ',U.ApellidoPaterno,' ',U.ApellidoMaterno) AS Responsable,
			R.UltimaActualizacion,
			R.FechaCreacion,
			R.ModificadoPor,
			CONCAT(UM.Nombre,' ',UM.ApellidoPaterno,' ',UM.ApellidoMaterno) AS Modificador,
			R.CreadoPor,
			CONCAT(UC.Nombre,' ',UC.ApellidoPaterno,' ',UC.ApellidoMaterno) AS Creador,
			R.Deleted
			FROM  TiCentral.Roles  R
			INNER JOIN TiCentral.Usuarios U ON U.Id=ch_IdUsuario
			LEFT JOIN TiCentral.Usuarios UM ON UM.Id=R.ModificadoPor
			LEFT JOIN TiCentral.Usuarios UC ON UC.Id=R.CreadoPor
			WHERE  R.Id=ch_IdRol;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id invalido.';
		END IF;
	
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetalleSecretaria
DROP PROCEDURE IF EXISTS `sp_DetalleSecretaria`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleSecretaria`(
	IN `P_Id` CHAR(36)
)
BEGIN
	IF 
		((SELECT COUNT(*) FROM TiCentral.Secretarias WHERE Id = P_Id ) = 1) THEN
	SELECT Id, Nombre, FechaDeCreacion, CreadoPor, UltimaModificacion, ModificadoPor, Deleted
	FROM TiCentral.Secretarias
	WHERE Id = P_Id;
	
ELSE
	
	SELECT 'Verificar Id' AS ERROR;
	
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
		
			SELECT '201' AS Respuesta,'Ok' AS Mensaje,
			s.Id,
			s.Nombre,
			s.ApellidoPaterno,
			s.ApellidoMaterno,
			s.NombreUsuario,
			s.CorreoElectronico,
			s.Puesto,
			s.Curp,
			s.Rfc,
			s.Telefono,
			s.Ext,
			s.Celular,
			s.FechaDeCreacion,
			s.CreadoPor,
			s.Estatus,
			s.DatosAdicionales,
			@NombreApp  AS NombreApp, 
			CONCAT(uC.Nombre,uC.ApellidoPaterno,uC.ApellidoMaterno) AS NombreSolicitante,
			s.IdUResponsable,
			(SELECT ur.Descripcion FROM TiCentral.UResponsable ur WHERE ur.Id=s.IdUResponsable) AS UResponsable,
			s.IdPerfil,
			(SELECT p.Descripcion FROM TiCentral.Perfiles p WHERE p.Id=s.IdPerfil) AS Perfil,
			s.IdRol,
		   (SELECT r.Descripcion FROM TiCentral.Roles r WHERE r.Id = s.IdRol) AS Rol,
			s.IdDepartamento,
			(SELECT CONCAT(NombreCorto,' - ',Descripcion) FROM TiCentral.Departamentos dpto WHERE dpto.Id=s.IdDepartamento) AS Departamento,
			s.IdTipoUsuario,
			(SELECT tpo.Descripcion FROM TiCentral.TipoUsuario tpo WHERE tpo.Id=s.IdTipoUsuario) AS TpoUsuario,
			s.PuedeFirmar,
			s.IdDependencia,
			(SELECT dep.Nombre FROM TiCentral.Dependencias dep WHERE dep.Id=s.IdDependencia) AS Dependencia,
			(SELECT CONCAT(sec.Nombre_corto,' - ',sec.Nombre)  FROM TiCentral.Secretarias sec WHERE sec.Id=(SELECT dep.PerteneceA FROM  TiCentral.Dependencias dep WHERE dep.Id=s.IdDependencia))AS Secretaria
			
			FROM TiCentral.Solicitudes s ,TiCentral.Usuarios uC
			WHERE s.Id = P_IdSol
			AND s.CreadoPor = uC.Id;
		ELSEIF (@TpoUser = 'ADMINPLATAFORMA' AND @Tiene >= 1) then	
			SELECT '201' AS Respuesta,'Ok' AS Mensaje,s.Id,s.Nombre,s.ApellidoPaterno,s.ApellidoMaterno,s.NombreUsuario,s.CorreoElectronico,s.Puesto,
			s.Curp,s.Rfc,s.Telefono,s.Ext,s.Celular,
			s.FechaDeCreacion,s.CreadoPor,s.Estatus,s.DatosAdicionales,@NombreApp  AS NombreApp, CONCAT(uC.Nombre,uC.ApellidoPaterno,uC.ApellidoMaterno) AS NombreSolicitante
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
			s.Puesto,
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
			s.Puesto,
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

-- Volcando estructura para procedimiento TiCentral.sp_DetalleTipoDependencias
DROP PROCEDURE IF EXISTS `sp_DetalleTipoDependencias`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleTipoDependencias`(
	IN `P_Id` CHAR(36)
)
BEGIN

IF 
	(( SELECT COUNT(*) FROM TiCentral.TipoDependencias WHERE Id = P_Id) = 1) THEN 
	SELECT Id, Nombre, Descripcion, FechaCreacion, CreadoPor,UltimaActualizacion, ModificadoPor, Deleted
	FROM TiCentral.TipoDependencias
	WHERE Id = P_Id;
	
ELSE

 SELECT 'Verificar Id' AS ERROR; 
 
END IF; 

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_DetalleUnidadResponsable
DROP PROCEDURE IF EXISTS `sp_DetalleUnidadResponsable`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DetalleUnidadResponsable`(
	IN `P_Id` CHAR(36)
)
BEGIN
 IF 
 	((SELECT COUNT(*) FROM TiCentral.UResponsable WHERE Id = P_Id) = 1 ) THEN
 	SELECT Id, Descripcion, FechaCreacion, CreadoPor, UltimaActualizacion,ModificadoPor, Deleted
 	FROM TiCentral.UResponsable
 	WHERE Id = P_Id;
 
 ELSE
 
 SELECT 'Verificar Id' AS ERROR;
 
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
	SELECT 
	us.Id, 
	us.Nombre, 
	us.ApellidoPaterno, 
	us.ApellidoMaterno, 
	us.NombreUsuario, 
	us.CorreoElectronico,
	us.Puesto, 
	us.Curp, 
	us.Rfc,
	us.Telefono, 
	us.Ext, 
	us.Celular,
	us.PuedeFirmar, 
	us.UltimoInicioDeSesion, 
	us.EstaActivo, 
	us.CreadoPor, 
	us.ModificadoPor, 
	us.Deleted, 
	us.IdTipoUsuario 
	FROM TiCentral.Usuarios us  
	WHERE us.Id = P_Id OR us.CorreoElectronico=P_ID;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_EliminarDepartamento
DROP PROCEDURE IF EXISTS `sp_EliminarDepartamento`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EliminarDepartamento`(
	IN `ch_IdDepartamento` CHAR(36),
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		SELECT COUNT(*) INTO @Existe FROM TiCentral.Departamentos D WHERE D.Id=ch_IdDepartamento;
		IF( @Existe=1)THEN 
			UPDATE 
			TiCentral.Departamentos D SET 
			UltimaActualizacion = CURRENT_TIMESTAMP(),
			ModificadoPor = ch_IdUsuario,
			D.Deleted=1
			WHERE Id = ch_IdDepartamento;
		
			SELECT CONCAT('El departamento ',(SELECT Descripcion FROM TiCentral.Departamentos WHERE Id=ch_IdDepartamento),' fue eliminado con exito.') AS Respuesta;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id invalido.';
		END IF;
		
		
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_EliminarDependencia
DROP PROCEDURE IF EXISTS `sp_EliminarDependencia`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EliminarDependencia`(
	IN `ch_IdDependencia` CHAR(36),
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		SELECT COUNT(*) INTO @Existe FROM TiCentral.Dependencias D WHERE D.Id=ch_IdDependencia;
		IF( @Existe=1)THEN 
			UPDATE 
			TiCentral.Dependencias D SET 
			UltimaActualizacion = CURRENT_TIMESTAMP(),
			ModificadoPor = ch_IdUsuario,
			D.Deleted=1
			WHERE Id = ch_IdDependencia;
		
			SELECT CONCAT('La Dependencia ',(SELECT Nombre FROM TiCentral.Dependencias WHERE Id=ch_IdDependencia),' fue eliminado con exito.') AS Respuesta;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id invalido.';
		END IF;
		
		
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_EliminarPerfil
DROP PROCEDURE IF EXISTS `sp_EliminarPerfil`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EliminarPerfil`(
	IN `ch_IdPerfil` CHAR(36),
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		SELECT COUNT(*) INTO @Existe FROM TiCentral.Perfiles D WHERE D.Id=ch_IdPerfil;
		IF( @Existe=1)THEN 
			UPDATE 
			TiCentral.Perfiles D SET 
			UltimaActualizacion = CURRENT_TIMESTAMP(),
			ModificadoPor = ch_IdUsuario,
			D.Deleted=1
			WHERE Id = ch_IdPerfil;
		
			SELECT CONCAT('El Perfil ',(SELECT Descripcion FROM TiCentral.Perfiles WHERE Id=ch_IdPerfil),' fue eliminado con exito.') AS Respuesta;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id invalido.';
		END IF;
		
		
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_EliminarRoles
DROP PROCEDURE IF EXISTS `sp_EliminarRoles`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EliminarRoles`(
	IN `ch_IdRol` CHAR(36),
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		SELECT COUNT(*) INTO @Existe FROM TiCentral.Roles D WHERE D.Id=ch_IdRol;
		IF( @Existe=1)THEN 
			UPDATE 
			TiCentral.Roles D SET 
			UltimaActualizacion = CURRENT_TIMESTAMP(),
			ModificadoPor = ch_IdUsuario,
			D.Deleted=1
			WHERE Id = ch_IdRol;
		
			SELECT CONCAT('El Rol ',(SELECT Descripcion FROM TiCentral.Roles WHERE Id=ch_IdRol),' fue eliminado con exito.') AS Respuesta;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id invalido.';
		END IF;
		
		
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_EliminarSecretaria
DROP PROCEDURE IF EXISTS `sp_EliminarSecretaria`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EliminarSecretaria`(
	IN `ch_IdSecretaria` CHAR(36),
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		SELECT COUNT(*) INTO @Existe FROM TiCentral.Secretarias D WHERE D.Id=ch_IdSecretaria;
		IF( @Existe=1)THEN 
			UPDATE 
			TiCentral.Secretarias D SET 
			UltimaModificacion = CURRENT_TIMESTAMP(),
			ModificadoPor = ch_IdUsuario,
			D.Deleted=1
			WHERE Id = ch_IdSecretaria;
		
			SELECT CONCAT('La Institucion ',(SELECT Nombre FROM TiCentral.Secretarias WHERE Id=ch_IdSecretaria),' fue eliminado con exito.') AS Respuesta;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id invalido.';
		END IF;
		
		
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_EliminarTipoDependencia
DROP PROCEDURE IF EXISTS `sp_EliminarTipoDependencia`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EliminarTipoDependencia`(
	IN `ch_IdTipoD` CHAR(36),
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		SELECT COUNT(*) INTO @Existe FROM TiCentral.TipoDependencias D WHERE D.Id=ch_IdTipoD;
		IF( @Existe=1)THEN 
			UPDATE 
			TiCentral.TipoDependencias D SET 
			UltimaActualizacion = CURRENT_TIMESTAMP(),
			ModificadoPor = ch_IdUsuario,
			D.Deleted=1
			WHERE Id = ch_IdTipoD;
		
			SELECT CONCAT('La Tipo de Dependencia ',(SELECT Nombre FROM TiCentral.TipoDependencias WHERE Id=ch_IdTipoD),' fue eliminado con exito.') AS Respuesta;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id invalido.';
		END IF;
		
		
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_EliminarUnidadesResponsables
DROP PROCEDURE IF EXISTS `sp_EliminarUnidadesResponsables`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EliminarUnidadesResponsables`(
	IN `ch_IdUnidadR` CHAR(36),
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
	
		SELECT COUNT(*) INTO @Existe FROM TiCentral.UResponsable D WHERE D.Id=ch_IdUnidadR;
		IF( @Existe=1)THEN 
			UPDATE 
			TiCentral.UResponsable D SET 
			UltimaActualizacion = CURRENT_TIMESTAMP(),
			ModificadoPor = ch_IdUsuario,
			D.Deleted=1
			WHERE Id = ch_IdUnidadR;
		
			SELECT CONCAT('La Unidad Responsable ',(SELECT Descripcion FROM TiCentral.UResponsable WHERE Id=ch_IdUnidadR),' fue eliminado con exito.') AS Respuesta;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id invalido.';
		END IF;
		
		
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;

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
	u.Puesto,
	u.PuedeFirmar,
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
		SELECT Respuesta,Id, Nombre,Descripcion, Path, EstaActivo, Deleted FROM TiCentral.Apps WHERE Deleted = 0 ORDER BY Nombre ASC;
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

-- Volcando estructura para procedimiento TiCentral.sp_ListaDepartamentos
DROP PROCEDURE IF EXISTS `sp_ListaDepartamentos`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaDepartamentos`(
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
			SELECT
			D.Id,
			D.Descripcion,
			D.NombreCorto,
			D.IdResponsable,
			CONCAT(U.Nombre,' ',U.ApellidoPaterno,' ',U.ApellidoMaterno) AS Responsable,
			D.UltimaActualizacion,
			D.FechaCreacion,
			D.ModificadoPor,
			(SELECT CONCAT(US.Nombre,' ',US.ApellidoPaterno,' ',US.ApellidoMaterno) FROM  TiCentral.Usuarios US WHERE US.Id=D.ModificadoPor) AS Modificador,
			D.CreadoPor,
			(SELECT CONCAT(US.Nombre,' ',US.ApellidoPaterno,' ',US.ApellidoMaterno) FROM  TiCentral.Usuarios US WHERE US.Id=D.ModificadoPor) AS Creador,
			D.Deleted
		FROM  TiCentral.Departamentos D 
		INNER JOIN TiCentral.Usuarios U ON U.Id=D.IdResponsable
		ORDER BY  D.Descripcion ASC;
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'permiso denegado';
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaDependencias
DROP PROCEDURE IF EXISTS `sp_ListaDependencias`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaDependencias`(
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
			SELECT
			D.Id,
			D.Nombre,
			D.Direccion,
			D.Telefono,
			D.IdTipoDependencia,
			tpo.Nombre AS TipoDependencia,
			D.IdTitular,
			CONCAT(U.Nombre,' ',U.ApellidoPaterno,' ', U.ApellidoMaterno)AS Titular,
			D.PerteneceA AS IdPerteneceA,
			S.Nombre AS PerteneceA,
			D.Deleted
		FROM  TiCentral.Dependencias D
		LEFT JOIN TiCentral.Usuarios U ON U.Id=D.IdTitular
		LEFT JOIN TiCentral.TipoDependencias tpo ON tpo.Id=D.IdTipoDependencia
		LEFT JOIN TiCentral.Secretarias S ON S.Id=D.PerteneceA;
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'permiso denegado';
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaPerfiles
DROP PROCEDURE IF EXISTS `sp_ListaPerfiles`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaPerfiles`(
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
			SELECT
			P.Id,
			P.Descripcion,
			P.Referencia,
			P.Deleted
		FROM  TiCentral.Perfiles P
		ORDER BY P.Descripcion ASC;
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado.';
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaRoles
DROP PROCEDURE IF EXISTS `sp_ListaRoles`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaRoles`(
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
			SELECT
			R.Id,
			R.Nombre,
			R.Descripcion,
			R.ControlInterno,
			R.Deleted
			FROM  TiCentral.Roles R
			ORDER BY R.Nombre ASC;
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'permiso denegado';
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaSecretarias
DROP PROCEDURE IF EXISTS `sp_ListaSecretarias`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaSecretarias`(
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
			SELECT
			S.Id,
			S.Nombre,
			S.Nombre_corto AS NombreCorto,
			S.IdTitular,
			CONCAT(U.Nombre,' ',U.ApellidoPaterno,' ',U.ApellidoMaterno) AS Titular,
			S.PerteneceA,
			S.Direccion,
			S.Deleted
		FROM  TiCentral.Secretarias S
		INNER JOIN TiCentral.Usuarios U ON U.Id=S.IdTitular;
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'permiso denegado';
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
		SELECT 
		'201' AS Respuesta,
		'Ok' AS Mensaje,  
		s.Id, 
		concat(s.Nombre,' ', s.ApellidoPaterno) as NombreUsuario, 
		s.DatosAdicionales,
      s.Estatus, 
		s.TipoSolicitud, 
		ts.tipoSoli,
		s.CreadoPor, 
		concat(uC.Nombre,' ',uC.ApellidoPaterno) as NombreSolicitante, 
		s.FechaDeCreacion, 
		s.UltimaModificacion, 
		s.ModificadoPor, 
		s.IdApp, 
		a.Nombre AS AppNombre,
		s.IdUResponsable,
		s.IdPerfil,
		s.IdRol,
		s.IdDepartamento,
		s.IdTipoUsuario,
		s.PuedeFirmar,
		s.IdDependencia	
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
		s.Id, concat(s.Nombre,' ', s.ApellidoPaterno) as NombreUsuario, 
		s.DatosAdicionales,
        s.Estatus, 
		  s.TipoSolicitud, 
		  ts.tipoSoli,
		  s.CreadoPor, 
		  concat(uC.Nombre,' ',uC.ApellidoPaterno) as NombreSolicitante, 
		  DATE_FORMAT(s.FechaDeCreacion, '%d/%m/%Y')  AS FechaDeCreacion, 
		  DATE_FORMAT(s.UltimaModificacion, '%d/%m/%Y') AS UltimaModificacion, 
		  s.ModificadoPor, 
		  s.IdApp, 
		  a.Nombre AS AppNombre		
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

-- Volcando estructura para procedimiento TiCentral.sp_ListaTpoDependencias
DROP PROCEDURE IF EXISTS `sp_ListaTpoDependencias`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaTpoDependencias`(
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN
	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
			SELECT
			tpo.Id,
			tpo.Nombre,
			tpo.Descripcion,
			tpo.Deleted
		FROM  TiCentral.TipoDependencias tpo;
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'permiso denegado';
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaUResponsables
DROP PROCEDURE IF EXISTS `sp_ListaUResponsables`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaUResponsables`(
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
			SELECT
		UR.Id,
		UR.Clave,
--		UR.Descripcion,
		CONCAT(UR.Clave,'-',UR.Descripcion) AS Descripcion,		
		UR.Deleted
		FROM  TiCentral.UResponsable UR ORDER BY descripcion;
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'permiso denegado';
	END IF;
	
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
    
	-- IF (SELECT t.Nombre from TiCentral.TipoUsuario t INNER JOIN TiCentral.Usuarios u ON t.Id = u.IdTipoUsuario WHERE u.Id = P_IdUsuario) = 'AdminGeneral' THEN	
		SELECT 
		US.Id, 
		US.EstaActivo, 
		US.Nombre, 
		US.ApellidoPaterno,
		US.ApellidoMaterno, 
		US.NombreUsuario, 
		US.CorreoElectronico, 
		US.Puesto,
		US.Curp, US.Rfc, 
		US.Telefono, 
		US.Ext, 
		US.Celular, 
		US.IdTipoUsuario,
		US.PuedeFirmar,
		US.CreadoPor,
		US.ModificadoPor, 
		(SELECT NombreUsuario FROM TiCentral.Usuarios WHERE Id = US.ModificadoPor) AS NombreModificadoPor,
		(SELECT NombreUsuario FROM TiCentral.Usuarios WHERE Id = US.CreadoPor) AS NombreCreadoPor FROM TiCentral.Usuarios US WHERE Deleted = 0 ORDER BY US.Nombre ASC;
	-- END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ListaUsuariosAsignables
DROP PROCEDURE IF EXISTS `sp_ListaUsuariosAsignables`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ListaUsuariosAsignables`(
	IN `ch_IdUsuario` CHAR(36)
)
BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id=ch_IdUsuario;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';

	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
			SELECT
			U.Id,
			UCASE(CONCAT(U.Nombre,' ',U.ApellidoPaterno,' ',U.ApellidoMaterno)) AS Nombre
		FROM  TiCentral.Usuarios U WHERE U.Deleted=0;
	ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'permiso denegado';
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
	IN `P_IdUsuario` CHAR(36),
	IN `P_Descripcion` INT
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
		ModificadoPor = P_IdUsuario,
		Descripcion = P_Descripcion
		WHERE Id = P_Id;		
      SET Respuesta = 201;        
		SELECT Respuesta,'Ok' as Mensaje,TiCentral.Apps.* FROM TiCentral.Apps
		WHERE Id = P_Id;
	END IF;    
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ModificaDepartamento
DROP PROCEDURE IF EXISTS `sp_ModificaDepartamento`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaDepartamento`(
	IN `ch_IdDepartamento` CHAR(36),
	IN `st_Descripcion` VARCHAR(200),
	IN `st_NombreCorto` VARCHAR(50),
	IN `ch_IdResponsable` CHAR(36),
	IN `ch_IdModificacdor` CHAR(36)
)
BEGIN
	IF((SELECT COUNT(*) FROM  TiCentral.Departamentos  WHERE  Id=ch_IdDepartamento) = 1 )THEN
		UPDATE 
		TiCentral.Departamentos SET 
		Descripcion = st_Descripcion,
		NombreCorto = st_NombreCorto ,
		IdResponsable=ch_IdResponsable,
		UltimaActualizacion = CURRENT_TIMESTAMP(),
		ModificadoPor = ch_IdModificacdor
		WHERE Id = ch_IdDepartamento;    
		
		SELECT 'Se modifico el departamento con exito';
	ELSE
	SELECT 'xd';
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Departamento no valido (no se encontro el registro o se encontro mas de uno).';
	END IF;
			
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ModificaDependencia
DROP PROCEDURE IF EXISTS `sp_ModificaDependencia`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaDependencia`(
	IN `ch_IdDependencia` CHAR(36),
	IN `st_Nombre` VARCHAR(200),
	IN `st_Direccion` LONGTEXT,
	IN `st_Telefono` VARCHAR(10),
	IN `ch_IdTipoDependencia` CHAR(36),
	IN `ch_IdTitular` CHAR(36),
	IN `ch_PerteneceA` CHAR(36),
	IN `ch_ModificadoPor` CHAR(36)
)
proc:BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_ModificadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	
	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
		IF((SELECT COUNT(*) FROM  TiCentral.Dependencias  WHERE  Id=ch_IdDependencia) = 1 )THEN
			UPDATE 
			TiCentral.Dependencias SET 
			Nombre = st_Nombre,
			Direccion = st_Direccion,
			Telefono=st_Telefono,
			IdTipoDependencia=ch_IdTipoDependencia,
			IdTitular=ch_IdTitular,
			PerteneceA=ch_PerteneceA,
			UltimaActualizacion = NOW(),
			ModificadoPor = ch_ModificadoPor
			WHERE Id = ch_IdDependencia;    
			
			IF(SELECT ROW_COUNT() = 0)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se actualizo la dependencia';
				LEAVE proc;	
			END IF;
				
			SELECT 'Se modifico la dependencia';
		ELSE
	    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dependencia no valida (no se encontro el registro o se encontro mas de uno).';
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ModificaPerfil
DROP PROCEDURE IF EXISTS `sp_ModificaPerfil`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaPerfil`(
	IN `ch_IdPerfil` CHAR(36),
	IN `st_Descripcion` VARCHAR(200),
	IN `st_Referencia` VARCHAR(20),
	IN `ch_ModificadoPor` CHAR(36)
)
proc:BEGIN

   SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_ModificadoPor;
   SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
   SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
    
   IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
   
      IF((SELECT COUNT(*) FROM  TiCentral.Perfiles  WHERE  Id=ch_IdPerfil) = 1 )THEN
         UPDATE
         TiCentral.Perfiles SET
         Descripcion=st_Descripcion,
         Referencia=st_Referencia,
         ModificadoPor = ch_ModificadoPor,
         UltimaActualizacion = NOW()
         WHERE Id = ch_IdPerfil;    
            
         IF(SELECT ROW_COUNT() = 0)THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se actualizo el perfil.';
            LEAVE proc;    
         END IF;
                
         SELECT 'Se modifico el perfil con exito.';
      ELSE
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Perfil no valido (no se encontro el registro o se encontro mas de uno).';
      END IF;
   ELSE
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado.';
   END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ModificaRol
DROP PROCEDURE IF EXISTS `sp_ModificaRol`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaRol`(
	IN `ch_IdRol` CHAR(36),
	IN `st_Nombre` VARCHAR(100),
	IN `st_Descripcion` VARCHAR(200),
	IN `st_ControlInterno` VARCHAR(50),
	IN `ch_IdModificador` CHAR(36)
)
proc:BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_IdModificador;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	
	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
		IF((SELECT COUNT(*) FROM  TiCentral.Roles  WHERE  Id=ch_IdRol) = 1 )THEN
			UPDATE 
			TiCentral.Roles SET 
			Nombre = st_Nombre,
			Descripcion = st_Descripcion ,
			ControlInterno=st_ControlInterno,
			UltimaActualizacion = CURRENT_TIMESTAMP(),
			ModificadoPor = ch_IdModificador
			WHERE Id = ch_IdRol;    
			
			IF(SELECT ROW_COUNT() != 1)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se actualizo el rol';
				LEAVE proc;	
			END IF;
				
			SELECT 'Se modifico el rol con exito';
		ELSE
	    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rol no valido (no se encontro el registro o se encontro mas de uno).';
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ModificaSecretaria
DROP PROCEDURE IF EXISTS `sp_ModificaSecretaria`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaSecretaria`(
	IN `ch_IdSecretaria` CHAR(36),
	IN `st_Nombre` VARCHAR(255),
	IN `st_Nombre_corto` VARCHAR(255),
	IN `ch_IdTitular` CHAR(36),
	IN `ch_PerteneceA` CHAR(36),
	IN `st_Direccion` LONGTEXT,
	IN `ch_ModificadoPor` CHAR(36)
)
proc:BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_ModificadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	
	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
		IF((SELECT COUNT(*) FROM  TiCentral.Secretarias  WHERE  Id=ch_IdSecretaria) = 1 )THEN
			UPDATE 
			TiCentral.Secretarias SET 
			Nombre = st_Nombre,
			Nombre_corto = st_Nombre_corto ,
			IdTitular=ch_IdTitular,
			PerteneceA=ch_PerteneceA,
			Direccion=st_Direccion,
			UltimaModificacion = NOW(),
			ModificadoPor = ch_ModificadoPor
			WHERE Id = ch_IdSecretaria;    
			
			IF(SELECT ROW_COUNT() = 0)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se actualizo la secretaria';
				LEAVE proc;	
			END IF;
				
			SELECT 'Se modifico la secretaria con exito';
		ELSE
	    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Secretaria no valida (no se encontro el registro o se encontro mas de uno).';
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
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
	IN `P_Puesto` VARCHAR(255),
	IN `P_Curp` VARCHAR(18),
	IN `P_Rfc` VARCHAR(13),
	IN `P_Telefono` VARCHAR(10),
	IN `P_Ext` VARCHAR(4),
	IN `P_Celular` CHAR(36),
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
		Puesto=P_Puesto,
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

-- Volcando estructura para procedimiento TiCentral.sp_ModificaTipoDependencias
DROP PROCEDURE IF EXISTS `sp_ModificaTipoDependencias`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaTipoDependencias`(
	IN `ch_IdTpoDependencia` CHAR(36),
	IN `st_Nombre` VARCHAR(200),
	IN `st_Descripcion` LONGTEXT,
	IN `ch_ModificadoPor` CHAR(36)
)
proc:BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_ModificadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	
	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
		IF((SELECT COUNT(*) FROM  TiCentral.TipoDependencias  WHERE  Id=ch_IdTpoDependencia) = 1 )THEN
			UPDATE 
			TiCentral.TipoDependencias SET 
			Nombre = st_Nombre,
			Descripcion = st_Descripcion,
			UltimaActualizacion = NOW(),
			ModificadoPor = ch_ModificadoPor
			WHERE Id = ch_IdTpoDependencia;    
			
			IF(SELECT ROW_COUNT() = 0)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se actualizo el tipo de dependencia';
				LEAVE proc;	
			END IF;
				
			SELECT 'Se modifico el tipo de dependencia';
		ELSE
	    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tipo de dependencia no valida (no se encontro el registro o se encontro mas de uno).';
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento TiCentral.sp_ModificaUResponsable
DROP PROCEDURE IF EXISTS `sp_ModificaUResponsable`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ModificaUResponsable`(
	IN `ch_IdUResponsable` CHAR(36),
	IN `st_Clave` VARCHAR(10),
	IN `st_Descripcion` VARCHAR(500),
	IN `ch_ModificadoPor` CHAR(36)
)
proc:BEGIN

	SELECT U.IdTipoUsuario INTO @IdTpoUSer FROM TiCentral.Usuarios U  WHERE U.Id = ch_ModificadoPor;
	SELECT Tpo.Id INTO @IdAdminPlataforma FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre = 'AdminPlataforma';
	SELECT Tpo.Id INTO @IdAdminGeneral FROM TiCentral.TipoUsuario Tpo  WHERE Tpo.Nombre ='AdminGeneral';
	
	IF(@IdTpoUSer=@IdAdminPlataforma OR @IdTpoUSer=@IdAdminGeneral)THEN
		IF((SELECT COUNT(*) FROM  TiCentral.UResponsable  WHERE  Id=ch_IdUResponsable) = 1 )THEN
			UPDATE 
			TiCentral.UResponsable SET 
			Clave = st_Clave,
			Descripcion = st_Descripcion ,
			UltimaActualizacion = NOW(),
			ModificadoPor = ch_ModificadoPor
			WHERE Id = ch_IdUResponsable;    
			
			IF(SELECT ROW_COUNT() != 1)THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error, no se actualizo la unidad responsable';
				LEAVE proc;	
			END IF;
				
			SELECT 'Se modifico la unidad responsable con exito';
		ELSE
	    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Unidad responsable no valida (no se encontro el registro o se encontro mas de uno).';
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Permiso denegado';
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
	IN `P_Puesto` VARCHAR(255),
	IN `P_EstaActivo` TINYINT(1),
	IN `P_IdUsuario` CHAR(36),
	IN `P_Curp` VARCHAR(18),
	IN `P_Rfc` VARCHAR(13),
	IN `P_Telefono` VARCHAR(10),
	IN `P_Ext` VARCHAR(4),
	IN `P_Celular` VARCHAR(10),
	IN `P_IdTipoUsuario` VARCHAR(37),
	IN `P_PuedeFirmar` TINYINT(1)
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
		Puesto=P_Puesto,
		UltimaModificacion = CURRENT_TIMESTAMP(),
		EstaActivo=P_EstaActivo,
		ModificadoPor = P_IdUsuario,
		Curp = P_Curp,
		Rfc = P_Rfc,
		Telefono = P_Telefono,
		Ext = P_Ext,
		Celular = P_Celular,
		IdTipoUsuario = P_IdTipoUsuario,
		PuedeFirmar=P_PuedeFirmar
		WHERE Usuarios.Id = P_Id;
      SET Respuesta = 201;
      SELECT Respuesta,'Ok' as Mensaje, us.Id, us.Nombre, us.ApellidoPaterno, us.ApellidoMaterno, us.NombreUsuario, us.CorreoElectronico, us.Curp, us.Rfc, us.Telefono, us.Ext, us.Celular, us.UltimoInicioDeSesion, us.IdTipoUsuario, us.EstaActivo, us.CreadoPor, us.ModificadoPor, us.Deleted 
		FROM TiCentral.Usuarios us 
		WHERE us.Id = P_Id; 
		
		SET @IdTiCentral = (SELECT Id FROM TiCentral.Apps ap WHERE ap.Nombre='ADMIN');
		
		IF(P_IdTipoUsuario=(SELECT tu.Id FROM TiCentral.TipoUsuario tu WHERE tu.Nombre='AdminGeneral'))THEN
			CALL sp_VinculaUsuarioApp(P_Id , @IdTiCentral, P_IdUsuario);
		ELSE
			CALL sp_DesvinculaUsuarioApp(P_Id, @IdTiCentral, P_IdUsuario);
			
			IF (SELECT COUNT(*) FROM TiCentral.UsuarioAplicacion WHERE IdApp =@IdTiCentral AND IdUsuario = P_Id) = 1 THEN
				DELETE FROM TiCentral.UsuarioAplicacion WHERE IdUsuario = P_Id AND IdApp = @IdTiCentral;
           	SET Respuesta = 201;
				SELECT Respuesta,'El usuario fue desvinculado con éxito de la aplicación' AS Mensaje;
			END IF;
			
		END IF;       
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
				DATE_FORMAT(s.FechaDeCreacion,"%d/%m/%Y")  AS Fecha,
				ts.tipoSoli AS TipoDeMovimiento,
				s.Nombre AS Nombre,
				s.ApellidoPaterno AS ApellidoPaterno,
				s.ApellidoMaterno AS ApellidoMaterno,
				s.NombreUsuario AS NombreUsuario,
				s.CorreoElectronico AS Correo,
				s.Puesto,
				s.Curp AS CURP,
				s.Rfc AS RFC,
				s.Telefono AS Telefono,
				s.Ext AS Extension,
				s.Celular AS Celular,
				s.Estatus,
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
					DATE_FORMAT(s.FechaDeCreacion,"%d/%m/%Y")  AS Fecha,
					ts.tipoSoli AS TipoDeMovimiento,
					s.Nombre AS Nombre,
					s.ApellidoPaterno AS ApellidoPaterno,
					s.ApellidoMaterno AS ApellidoMaterno,
					s.NombreUsuario AS NombreUsuario,
					s.CorreoElectronico AS Correo,
					s.Puesto,
					s.Curp AS CURP,
					s.Rfc AS RFC,
					s.Telefono AS Telefono,
					s.Ext AS Extension,
					s.Celular AS Celular,
					s.Estatus,
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
		DATE_FORMAT(s.FechaDeCreacion,"%d/%m/%Y")  AS Fecha,
		ts.tipoSoli AS TipoDeMovimiento,
		s.Nombre AS Nombre,
		s.ApellidoPaterno AS ApellidoPaterno,
		s.ApellidoMaterno AS ApellidoMaterno,
		s.NombreUsuario AS NombreUsuario,
		s.CorreoElectronico AS Correo,
		s.Puesto,
		s.Curp AS CURP,
		s.Rfc AS RFC,
		s.Telefono AS Telefono,
		s.Ext AS Extension,
		s.Celular AS Celular,
		s.Estatus,
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
	IN `P_IdDepartamento` CHAR(36),
	IN `P_IdPerfil` CHAR(36),
	IN `P_IdRol` CHAR(36),
	IN `P_IdUnidadResponsable` CHAR(36),
	IN `P_IdDependencia` CHAR(36),
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
			INSERT INTO TiCentral.UsuarioAplicacion(IdUsuario , IdApp,IdDepartamento,IdPerfil,IdRol,IdUnidadResponsable,IdDependencia) 
			VALUES ( P_IdUsuario , P_IdApp,P_IdDepartamento,P_IdPerfil,P_IdRol,P_IdUnidadResponsable,P_IdDependencia);
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
