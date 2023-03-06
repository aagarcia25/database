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

-- Volcando estructura para tabla PDRMYE.CatClasificacion
DROP TABLE IF EXISTS `CatClasificacion`;
CREATE TABLE IF NOT EXISTS `CatClasificacion` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Clasificacion` varchar(10) NOT NULL,
  `DescripcionClasificacion` varchar(250) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información del catálogo de Clasificación de SIREGOB';

-- Volcando datos para la tabla PDRMYE.CatClasificacion: ~4 rows (aproximadamente)
DELETE FROM `CatClasificacion`;
/*!40000 ALTER TABLE `CatClasificacion` DISABLE KEYS */;
INSERT INTO `CatClasificacion` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Clasificacion`, `DescripcionClasificacion`, `tipo`) VALUES
	('00d34179-a28a-11ed-b561-2c4138b7dab1', _binary 0x30, '2023-02-01 17:41:52', '2023-02-01 17:41:52', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'OPPD', 'GC PRESTAMO A DEPEND. Y ORGAN.', 'Orden de Pago'),
	('0ac2a799-a28a-11ed-b561-2c4138b7dab1', _binary 0x30, '2023-02-01 17:42:08', '2023-02-01 17:42:08', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'SIEO', 'PEI OBRAS', 'Orden de Pago'),
	('70b6dd7e-a288-11ed-b561-2c4138b7dab1', _binary 0x30, '2023-02-01 17:32:30', '2023-02-01 17:30:40', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'OPMP', 'GC MUNICIPIOS', 'Orden de Pago'),
	('f547edca-a289-11ed-b561-2c4138b7dab1', _binary 0x30, '2023-02-01 17:41:32', '2023-02-01 17:41:32', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'OPOR', 'GC ORGANISMOS', 'Orden de Pago');
/*!40000 ALTER TABLE `CatClasificacion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
