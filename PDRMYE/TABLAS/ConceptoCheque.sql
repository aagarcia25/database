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

-- Volcando estructura para tabla PDRMYE.ConceptoCheque
DROP TABLE IF EXISTS `ConceptoCheque`;
CREATE TABLE IF NOT EXISTS `ConceptoCheque` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `ClaveSIREGOB` varchar(50) NOT NULL DEFAULT '0.00000',
  `DescripcionConcepto` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de concepto de cheque';

-- Volcando datos para la tabla PDRMYE.ConceptoCheque: ~7 rows (aproximadamente)
DELETE FROM `ConceptoCheque`;
/*!40000 ALTER TABLE `ConceptoCheque` DISABLE KEYS */;
INSERT INTO `ConceptoCheque` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `ClaveSIREGOB`, `DescripcionConcepto`) VALUES
	('02ebe044-71d4-11ed-a880-040300000000', _binary 0x30, '2022-12-01 16:57:45', '2022-12-01 16:57:46', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '4', 'PAGO DE CERTIFICADOS DE DEPÓSITOS'),
	('12492545-71d4-11ed-a880-040300000000', _binary 0x30, '2022-12-01 16:58:19', '2022-12-01 16:58:20', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '5', 'PAGO A PROVEEDOR'),
	('38b8660c-74ed-11ed-aad1-040300000000', _binary 0x30, '2022-12-05 16:36:18', '2022-12-05 16:36:12', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '8', 'ANTICIPO DE PARTICIPACIONES'),
	('3d76ac64-a7e5-11ed-b719-2c4138b7dab1', _binary 0x30, '2023-02-08 13:17:40', '2023-02-08 13:17:33', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '18', 'PAGO DE APOARTACIONES A ORGANISMOS'),
	('45b5080b-74df-11ed-aad1-040300000000', _binary 0x30, '2022-12-05 14:56:25', '2022-12-05 14:56:21', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '20', 'PAGO DE PARTICIPACIONES A MUNICIPIOS'),
	('c5bf2a43-71d3-11ed-a880-040300000000', _binary 0x30, '2022-12-01 16:55:49', '2022-12-01 16:55:51', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '2', 'SALDOS INICIALES (NEGATIVO)'),
	('eecdf9f6-71d3-11ed-a880-040300000000', _binary 0x30, '2022-12-01 16:57:09', '2022-12-01 16:57:11', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '3', 'ANTICIPO A DEUDORES POR GASTOS A COMPROBAR');
/*!40000 ALTER TABLE `ConceptoCheque` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
