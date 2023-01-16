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

-- Volcando estructura para tabla PDRMYE.Municipios
CREATE TABLE IF NOT EXISTS `Municipios` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '0',
  `CreadoPor` char(36) NOT NULL DEFAULT '0',
  `Nombre` varchar(100) NOT NULL,
  `ClaveEstado` int(5) NOT NULL DEFAULT 0,
  `MAM` int(1) NOT NULL,
  `Descentralizado` int(1) NOT NULL,
  `UltraCrecimiento` int(1) NOT NULL,
  `NombreCorto` varchar(100) NOT NULL,
  `OrdenSFTGNL` int(11) NOT NULL,
  `ClavePSIREGOB` varchar(10) NOT NULL DEFAULT '0',
  `ClaveDSIREGOB` varchar(10) NOT NULL DEFAULT '0',
  `ClaveINEGI` int(11) DEFAULT 0,
  `ArtF1` binary(1) DEFAULT '1',
  `ArtF2` binary(1) DEFAULT '1',
  `ArtF3` binary(1) DEFAULT '1',
  `UResponsable` varchar(5) DEFAULT NULL,
  `Clasificador01` varchar(50) DEFAULT NULL,
  `Clasificador02` varchar(50) DEFAULT NULL,
  `Clasificador03` varchar(50) DEFAULT NULL,
  `Clasificador04` varchar(50) DEFAULT NULL,
  `Clasificador05` varchar(50) DEFAULT NULL,
  `Clasificador06` varchar(50) DEFAULT NULL,
  `Clasificador07` varchar(50) DEFAULT NULL,
  `Clasificador08` varchar(50) DEFAULT NULL,
  `Clasificador09` varchar(50) DEFAULT NULL,
  `Clasificador10` varchar(50) DEFAULT NULL,
  `Clasificador11` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los municipios';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
