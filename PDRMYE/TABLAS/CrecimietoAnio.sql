-- --------------------------------------------------------
-- Host:                         10.210.0.29
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

-- Volcando estructura para tabla PDRMYE.CrecimietoAnio
DROP TABLE IF EXISTS `CrecimietoAnio`;
CREATE TABLE IF NOT EXISTS `CrecimietoAnio` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Anio` int(4) NOT NULL,
  `Crecimiento` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de la crecimiento por año';

-- Volcando datos para la tabla PDRMYE.CrecimietoAnio: ~1 rows (aproximadamente)
DELETE FROM `CrecimietoAnio`;
/*!40000 ALTER TABLE `CrecimietoAnio` DISABLE KEYS */;
INSERT INTO `CrecimietoAnio` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Anio`, `Crecimiento`) VALUES
	('90da435c-350d-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:42:29', '2022-09-15 10:46:29', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 3.50);
/*!40000 ALTER TABLE `CrecimietoAnio` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
