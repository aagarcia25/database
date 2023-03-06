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

-- Volcando estructura para tabla PDRMYE.Anios
DROP TABLE IF EXISTS `Anios`;
CREATE TABLE IF NOT EXISTS `Anios` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `anio` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los años';

-- Volcando datos para la tabla PDRMYE.Anios: ~7 rows (aproximadamente)
DELETE FROM `Anios`;
/*!40000 ALTER TABLE `Anios` DISABLE KEYS */;
INSERT INTO `Anios` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `anio`) VALUES
	('5b05b4e3-3052-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:23:32', '2022-09-09 10:16:19', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2019),
	('73d9b1fb-a265-11ed-854b-040300000000', _binary 0x30, '2023-02-01 13:20:20', '2023-02-01 13:20:13', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2023),
	('aec21c07-2fc9-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:23:33', '2022-09-08 17:57:56', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2020),
	('b11dbd8e-40ff-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:23:31', '2022-09-30 15:37:23', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2015),
	('b2f93b07-2fc9-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:23:33', '2022-09-08 17:58:05', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021),
	('b86edfd8-2fc9-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:23:34', '2022-09-08 17:58:14', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2022),
	('deaa898d-40ff-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:23:31', '2022-09-30 15:38:37', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2010);
/*!40000 ALTER TABLE `Anios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
