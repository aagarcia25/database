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

-- Volcando estructura para tabla PDRMYE.Umas
DROP TABLE IF EXISTS `Umas`;
CREATE TABLE IF NOT EXISTS `Umas` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `Anio` int(4) NOT NULL,
  `Diario` decimal(20,2) NOT NULL,
  `Mensual` decimal(20,2) NOT NULL,
  `Anual` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información del valor de la UMA';

-- Volcando datos para la tabla PDRMYE.Umas: ~4 rows (aproximadamente)
DELETE FROM `Umas`;
/*!40000 ALTER TABLE `Umas` DISABLE KEYS */;
INSERT INTO `Umas` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Anio`, `Diario`, `Mensual`, `Anual`) VALUES
	('5776b340-acb2-11ed-8002-d89d6776f970', _binary 0x30, '2023-02-14 13:55:48', '2023-02-14 13:55:48', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 2023, 103.74, 3153.70, 37844.40),
	('83ce9e6b-7716-11ed-aad1-040300000000', _binary 0x30, '2022-12-08 10:36:50', '2022-12-08 10:36:50', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 2000, 96.26, 2925.09, 32565.00),
	('8b5ba887-6f3b-11ed-a880-040300000000', _binary 0x30, '2022-11-30 17:58:24', '2022-11-28 09:41:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2022, 96.22, 2925.09, 35101.08),
	('ca541dad-65f2-11ed-8793-040300000000', _binary 0x30, '2022-11-30 17:58:24', '2022-11-16 15:08:16', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 89.62, 2724.45, 32693.40);
/*!40000 ALTER TABLE `Umas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
