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

-- Volcando estructura para tabla PDRMYE.Class_TG
DROP TABLE IF EXISTS `Class_TG`;
CREATE TABLE IF NOT EXISTS `Class_TG` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `Tipo` int(11) NOT NULL DEFAULT 0,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los tipos de clasificadores de tipo de Gasto';

-- Volcando datos para la tabla PDRMYE.Class_TG: ~5 rows (aproximadamente)
DELETE FROM `Class_TG`;
/*!40000 ALTER TABLE `Class_TG` DISABLE KEYS */;
INSERT INTO `Class_TG` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Tipo`, `Descripcion`) VALUES
	('524cf25e-4434-11ed-aea4-040300000000', _binary 0x30, '2022-11-30 17:41:54', '2022-10-04 17:31:41', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 1, 'GASTO CORRIENTE'),
	('5646fc8d-4434-11ed-aea4-040300000000', _binary 0x30, '2022-11-30 17:41:54', '2022-10-04 17:31:47', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2, 'GASTO DE CAPITAL'),
	('5a2026d1-4434-11ed-aea4-040300000000', _binary 0x30, '2022-11-30 17:41:54', '2022-10-04 17:31:54', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 3, 'AMORTIZACION DE LA DEUDA Y DISMINUCION DE PASIVOS'),
	('5f292fae-4434-11ed-aea4-040300000000', _binary 0x30, '2022-11-30 17:41:54', '2022-10-04 17:32:02', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 4, 'PENSIONES Y JUBILACIONES'),
	('62dda899-4434-11ed-aea4-040300000000', _binary 0x30, '2022-11-30 17:41:54', '2022-10-04 17:32:09', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 5, 'PARTICIPACIONES');
/*!40000 ALTER TABLE `Class_TG` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
