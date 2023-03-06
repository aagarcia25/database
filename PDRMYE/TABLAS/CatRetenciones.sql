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

-- Volcando estructura para tabla PDRMYE.CatRetenciones
DROP TABLE IF EXISTS `CatRetenciones`;
CREATE TABLE IF NOT EXISTS `CatRetenciones` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `ClaveRetencion` varchar(250) NOT NULL,
  `Descripcion` varchar(250) NOT NULL,
  `Retencion` varchar(250) NOT NULL,
  `ClaveAuxiliar` varchar(250) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabla para administar el cat de retenciones';

-- Volcando datos para la tabla PDRMYE.CatRetenciones: ~1 rows (aproximadamente)
DELETE FROM `CatRetenciones`;
/*!40000 ALTER TABLE `CatRetenciones` DISABLE KEYS */;
INSERT INTO `CatRetenciones` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `ClaveRetencion`, `Descripcion`, `Retencion`, `ClaveAuxiliar`) VALUES
	('ac6b6092-a70b-11ed-8860-040300000000', _binary 0x30, '2023-02-07 11:20:09', '2023-02-07 11:20:09', '1', '1', '527', 'MONEX DEUDA MUNICIPIOS', '0', 'MONEXMUN');
/*!40000 ALTER TABLE `CatRetenciones` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
