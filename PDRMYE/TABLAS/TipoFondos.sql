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

-- Volcando estructura para tabla PDRMYE.TipoFondos
DROP TABLE IF EXISTS `TipoFondos`;
CREATE TABLE IF NOT EXISTS `TipoFondos` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `Clave` varchar(50) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los Tipos  Fondos';

-- Volcando datos para la tabla PDRMYE.TipoFondos: ~5 rows (aproximadamente)
DELETE FROM `TipoFondos`;
/*!40000 ALTER TABLE `TipoFondos` DISABLE KEYS */;
INSERT INTO `TipoFondos` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Clave`, `Descripcion`) VALUES
	('0b2892c4-77ee-11ed-aad1-040300000000', _binary 0x30, '2022-12-09 12:19:48', '2022-12-09 12:19:39', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'CONV', 'RECURSOS POR CONVENIOS'),
	('c79a2db3-2b0c-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:57:06', '2022-09-02 12:15:33', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'PARTF', 'PARTICIPACIONES FEDERALES'),
	('d5c9a65b-2b0c-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:57:06', '2022-09-02 12:15:56', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'PARTE', 'PARTICIPACIONES ESTATALES'),
	('dc9c84ff-2b0c-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:57:06', '2022-09-02 12:16:08', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'APORTF', 'APORTACIONES FEDERALES'),
	('e7179b31-2b0c-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:57:06', '2022-09-02 12:16:25', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'APORTE', 'APORTACIONES ESTATALES');
/*!40000 ALTER TABLE `TipoFondos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
