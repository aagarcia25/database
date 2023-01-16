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

-- Volcando estructura para tabla PDRMYE.OpCabecera
CREATE TABLE IF NOT EXISTS `OpCabecera` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `IdEstatus` char(36) NOT NULL DEFAULT '0',
  `ClaveFondo` char(36) DEFAULT '',
  `Anio` int(4) NOT NULL DEFAULT 0,
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Mes` int(2) NOT NULL DEFAULT 0,
  `idPerfilAsignado` char(36) DEFAULT NULL,
  `idAreaAsignado` char(36) DEFAULT NULL,
  `Total` decimal(30,2) DEFAULT 0.00,
  `TotalCompleto` decimal(30,2) DEFAULT 0.00,
  `Comentario` varchar(300) DEFAULT NULL,
  `idProveedor` char(36) DEFAULT NULL,
  `idAcreedor` char(36) DEFAULT NULL,
  `idMun` char(36) DEFAULT NULL,
  `idtipo` char(36) DEFAULT NULL,
  `ClavePresupuestal` varchar(50) DEFAULT '',
  `llave` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `llave` (`llave`),
  KEY `FK1_Fondo` (`ClaveFondo`),
  KEY `FK2_Estatus` (`IdEstatus`),
  CONSTRAINT `FK1_Fondo` FOREIGN KEY (`ClaveFondo`) REFERENCES `Fondos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_Estatus` FOREIGN KEY (`IdEstatus`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
