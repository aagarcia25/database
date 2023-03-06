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

-- Volcando estructura para tabla PDRMYE.Perfil
DROP TABLE IF EXISTS `Perfil`;
CREATE TABLE IF NOT EXISTS `Perfil` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Descripcion` varchar(100) NOT NULL DEFAULT '0',
  `Referencia` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_PERFIL_CREADO` (`CreadoPor`),
  KEY `FK2_PERFIL_MODIFICADO` (`ModificadoPor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los Perfiles';

-- Volcando datos para la tabla PDRMYE.Perfil: ~7 rows (aproximadamente)
DELETE FROM `Perfil`;
/*!40000 ALTER TABLE `Perfil` DISABLE KEYS */;
INSERT INTO `Perfil` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Descripcion`, `Referencia`) VALUES
	('1bcf9a67-74c7-11ed-aad1-040300000000', _binary 0x30, '2022-12-13 16:44:13', '2022-12-05 12:03:10', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Validador', 'VAL'),
	('39bbd1c2-4fd4-11ed-ab6c-040300000000', _binary 0x30, '2022-12-13 16:44:36', '2022-10-19 12:33:58', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Administrador', 'ADMIN'),
	('41bfc83a-4fd4-11ed-ab6c-040300000000', _binary 0x30, '2022-12-13 16:44:45', '2022-10-19 12:34:17', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Municipio', 'MUN'),
	('4991ba04-4fd4-11ed-ab6c-040300000000', _binary 0x30, '2022-12-13 16:44:50', '2022-10-19 12:34:30', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Organismo', 'ORG'),
	('a80ecf6a-4b33-11ed-a964-040300000000', _binary 0x30, '2022-12-13 16:43:54', '2022-10-13 15:14:13', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Analista', 'ANA'),
	('b6ff3f86-4b33-11ed-a964-040300000000', _binary 0x30, '2022-12-13 16:44:02', '2022-10-13 15:15:00', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Coordinador', 'COOR'),
	('bf9f7de8-4b33-11ed-a964-040300000000', _binary 0x30, '2022-12-13 16:44:07', '2022-10-13 15:15:14', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Director', 'DIR');
/*!40000 ALTER TABLE `Perfil` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
