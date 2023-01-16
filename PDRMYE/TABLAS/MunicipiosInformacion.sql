-- --------------------------------------------------------
-- Host:                         10.200.4.111
-- Versión del servidor:         10.8.6-MariaDB - MariaDB Server
-- SO del servidor:              Linux
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla PDRMYE.MunicipiosInformacion
CREATE TABLE IF NOT EXISTS `MunicipiosInformacion` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '0',
  `CreadoPor` char(36) NOT NULL DEFAULT '0',
  `idMunicipio` char(36) NOT NULL,
  `Municipio` varchar(300) NOT NULL DEFAULT '',
  `NombreArchivo` varchar(300) DEFAULT NULL,
  `Escudo` varchar(300) DEFAULT '',
  `Domicilio` varchar(300) DEFAULT '',
  `Rfc` varchar(15) DEFAULT '""',
  `Telefono` varchar(50) DEFAULT NULL,
  `CorreoMunicipio` varchar(50) DEFAULT NULL,
  `Web` varchar(100) DEFAULT '',
  `Tesorero` varchar(100) DEFAULT '',
  `TelefonoTesorero` varchar(20) DEFAULT '',
  `CelularTesorero` varchar(20) DEFAULT '',
  `CorreoTesorero` varchar(100) DEFAULT '',
  `Enlace` varchar(100) DEFAULT '',
  `CelularEnlace` varchar(100) DEFAULT '',
  `CorreoEnlace` varchar(100) DEFAULT '',
  `Horario` varchar(300) DEFAULT '',
  `ExtTelefonoTesorero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_MI_MUNICIPIO` (`idMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los municipios';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
