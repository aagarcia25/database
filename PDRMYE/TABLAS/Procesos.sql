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

-- Volcando estructura para tabla PDRMYE.Procesos
DROP TABLE IF EXISTS `Procesos`;
CREATE TABLE IF NOT EXISTS `Procesos` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Nombre` varchar(50) NOT NULL DEFAULT '0',
  `Descripcion` varchar(200) NOT NULL DEFAULT '0',
  `DPCP` tinyint(1) DEFAULT NULL,
  `DAF` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los procesos';

-- Volcando datos para la tabla PDRMYE.Procesos: ~6 rows (aproximadamente)
DELETE FROM `Procesos`;
/*!40000 ALTER TABLE `Procesos` DISABLE KEYS */;
INSERT INTO `Procesos` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Nombre`, `Descripcion`, `DPCP`, `DAF`) VALUES
	('02d3caff-5bbd-11ed-a988-040300000000', _binary 0x30, '2022-11-30 17:55:19', '2022-11-03 15:18:07', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'CUENTA_BANCARIA', 'Registro de Cuenta Bancaria', 0, 0),
	('4a240f56-5a41-11ed-a988-040300000000', _binary 0x30, '2022-11-30 17:55:19', '2022-11-01 17:59:58', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'SOL_ANT_PART', 'Solicitud de Anticipo de Participaciones', 1, 1),
	('57bf13a0-b46a-11ed-9bd4-2c4138b7dab1', _binary 0x30, '2023-02-24 11:40:45', '2023-02-24 11:40:35', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DAMOP_OPERACION_ORG', 'Operaciones de DAMOP con Organismos', 0, 0),
	('6db6744f-8e12-11ed-a98c-040300000000', _binary 0x30, '2023-01-06 16:35:32', '2023-01-06 16:35:26', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DAMOP_OPERACION', 'Operaciones DAMOP', 0, 0),
	('6fbbcf10-4b39-11ed-a964-040300000000', _binary 0x30, '2022-11-30 17:55:19', '2022-10-13 15:55:57', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'PARTICIPACIONES_FEDERALES_CPH', 'Participaciones y Aportaciones', 1, 1),
	('73958c19-66b0-11ed-a880-040300000000', _binary 0x30, '2022-11-30 17:55:19', '2022-11-17 12:45:55', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'SOL_ORDEN_PAGO_PRESUPUESTAL', 'Solicitudes de ordenes de pago Presupuestales', 0, 0);
/*!40000 ALTER TABLE `Procesos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
