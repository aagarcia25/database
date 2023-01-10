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

-- Volcando estructura para tabla PDRMYE.TipoFondosCalculo
DROP TABLE IF EXISTS `TipoFondosCalculo`;
CREATE TABLE IF NOT EXISTS `TipoFondosCalculo` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `Descripcion` varchar(255) NOT NULL,
  `NumProyecto` varchar(7) DEFAULT NULL,
  `ConceptoEgreso` int(11) DEFAULT NULL,
  `ClasificacionOP` varchar(50) DEFAULT NULL,
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
  `Referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los Tipos  calculos';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
