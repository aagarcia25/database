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

-- Volcando estructura para tabla PDRMYE.Meses
DROP TABLE IF EXISTS `Meses`;
CREATE TABLE IF NOT EXISTS `Meses` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `mes` int(11) NOT NULL DEFAULT 0,
  `Descripcion` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los meses';

-- Volcando datos para la tabla PDRMYE.Meses: ~12 rows (aproximadamente)
DELETE FROM `Meses`;
/*!40000 ALTER TABLE `Meses` DISABLE KEYS */;
INSERT INTO `Meses` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `mes`, `Descripcion`) VALUES
	('019e3bb0-32aa-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:48:47', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 7, 'Julio'),
	('06ecdb41-32aa-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:48:56', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 8, 'Agosto'),
	('0d45a26e-32aa-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:49:06', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 9, 'Septiembre'),
	('13b594ac-32aa-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:49:17', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 10, 'Octubre'),
	('1c487588-32aa-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:49:31', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 11, 'Noviembre'),
	('25da83ac-32aa-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:49:47', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 12, 'Diciembre'),
	('dc92a08e-32a9-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:47:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 1, 'Enero'),
	('e3c86aa9-32a9-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:47:57', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2, 'Febrero'),
	('e96d8773-32a9-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:48:06', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 3, 'Marzo'),
	('ef4776b4-32a9-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:48:16', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 4, 'Abril'),
	('f4b49496-32a9-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:48:25', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 5, 'Mayo'),
	('fc87b95d-32a9-11ed-aed0-040300000000', _binary 0x30, '2022-11-30 17:44:51', '2022-09-12 09:48:38', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 6, 'Junio');
/*!40000 ALTER TABLE `Meses` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
