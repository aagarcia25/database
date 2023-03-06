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

-- Volcando estructura para tabla PDRMYE.Departamentos
DROP TABLE IF EXISTS `Departamentos`;
CREATE TABLE IF NOT EXISTS `Departamentos` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) DEFAULT NULL,
  `CreadoPor` char(36) DEFAULT NULL,
  `NombreCorto` varchar(50) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Responsable` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_DEPARTAMENTO` (`Responsable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de las diferentes áreas de la SFyTGE';

-- Volcando datos para la tabla PDRMYE.Departamentos: ~8 rows (aproximadamente)
DELETE FROM `Departamentos`;
/*!40000 ALTER TABLE `Departamentos` DISABLE KEYS */;
INSERT INTO `Departamentos` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `NombreCorto`, `Descripcion`, `Responsable`) VALUES
	('511732b0-2b01-11ed-afdb-040300000000', _binary 0x30, '2022-12-14 13:16:25', '2022-09-02 10:53:29', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'CPH', 'Coordinación De Planeación Hacendaria', 'a96ab0cf-54a0-11ed-ab6c-040300000000'),
	('5b233179-2b01-11ed-afdb-040300000000', _binary 0x30, '2022-12-13 16:49:38', '2022-09-02 10:53:46', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DAF', 'Dirección De Administración Financiera', '4044550a-4be3-11ed-a964-040300000000'),
	('609dc46f-2b01-11ed-afdb-040300000000', _binary 0x30, '2022-12-13 16:50:32', '2022-09-02 10:53:55', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DAMOP', 'Dirección De Atención a Municipios y Organismos Paraestatales', '0f22da53-54a9-11ed-ab6c-040300000000'),
	('66270023-2b01-11ed-afdb-040300000000', _binary 0x30, '2022-12-13 16:51:05', '2022-09-02 10:54:05', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DCCP', 'Dirección De Contabilidad y Cuenta Publica', '2a5a9661-38f9-11ed-aed0-040300000000'),
	('6b71f18b-2b01-11ed-afdb-040300000000', _binary 0x30, '2022-12-13 16:51:37', '2022-09-02 10:54:14', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DPCP', 'Dirección De Presupuesto y Control Presupuestal', '2a5a9661-38f9-11ed-aed0-040300000000'),
	('6d8fefa8-50c1-11ed-ab6c-040300000000', _binary 0x30, '2022-12-13 16:51:44', '2022-10-20 16:52:01', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'MUN', 'Municipios', '2a5a9661-38f9-11ed-aed0-040300000000'),
	('724605b7-2b01-11ed-afdb-040300000000', _binary 0x30, '2022-12-13 16:52:22', '2022-09-02 10:54:25', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DTI', 'Coordinación De Gestión De La Información', '2a5a9661-38f9-11ed-aed0-040300000000'),
	('f99fe513-516d-11ed-ab6c-040300000000', _binary 0x30, '2022-11-30 17:42:52', '2022-10-21 13:27:09', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'ORG', 'Organismos', '2a5a9661-38f9-11ed-aed0-040300000000');
/*!40000 ALTER TABLE `Departamentos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
