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

-- Volcando estructura para tabla PDRMYE.InflacionAnio
DROP TABLE IF EXISTS `InflacionAnio`;
CREATE TABLE IF NOT EXISTS `InflacionAnio` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Anio` int(4) NOT NULL,
  `Inflacion` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de la inflación y crecimiento por año';

-- Volcando datos para la tabla PDRMYE.InflacionAnio: ~4 rows (aproximadamente)
DELETE FROM `InflacionAnio`;
/*!40000 ALTER TABLE `InflacionAnio` DISABLE KEYS */;
INSERT INTO `InflacionAnio` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Anio`, `Inflacion`) VALUES
	('714577df-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-12-07 16:40:51', '2022-09-02 11:22:49', '5430da9a-71da-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2019, 2.83),
	('79430c30-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-12-09 12:10:01', '2022-09-02 11:23:05', '5430da9a-71da-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2020, 3.15),
	('80abf471-2b05-11ed-afdb-040300000000', _binary 0x30, '2023-02-01 13:33:43', '2022-09-02 11:23:19', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 7.36),
	('f43dac7e-3472-11ed-aed0-040300000000', _binary 0x30, '2023-02-03 12:17:19', '2022-09-14 16:19:44', 'd1a8f9cd-71db-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2022, 7.82);
/*!40000 ALTER TABLE `InflacionAnio` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
