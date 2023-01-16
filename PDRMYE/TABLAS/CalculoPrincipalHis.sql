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

-- Volcando estructura para tabla PDRMYE.CalculoPrincipalHis
CREATE TABLE IF NOT EXISTS `CalculoPrincipalHis` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `idCalculo` char(36) NOT NULL DEFAULT '1',
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `IdEstatus` char(36) NOT NULL DEFAULT '0',
  `ClaveFondo` char(36) NOT NULL DEFAULT '',
  `Anio` int(4) NOT NULL DEFAULT 0,
  `Mes` int(2) NOT NULL DEFAULT 0,
  `Comentario` varchar(300) DEFAULT NULL,
  `idPerfilAsignado` char(36) DEFAULT NULL,
  `idAreaAsignado` char(36) DEFAULT NULL,
  `ComentarioPresupuesto` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK2_CH_Fondo` (`ClaveFondo`) USING BTREE,
  KEY `FK3_CH_Estatus` (`IdEstatus`) USING BTREE,
  CONSTRAINT `FK2_CH_Fondo` FOREIGN KEY (`ClaveFondo`) REFERENCES `Fondos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3_CH_Estatus` FOREIGN KEY (`IdEstatus`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
