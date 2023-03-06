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

-- Volcando estructura para tabla PDRMYE.Roles
DROP TABLE IF EXISTS `Roles`;
CREATE TABLE IF NOT EXISTS `Roles` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `ControlInterno` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla PDRMYE.Roles: ~12 rows (aproximadamente)
DELETE FROM `Roles`;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Nombre`, `Descripcion`, `ControlInterno`) VALUES
	('0191ca3b-5acd-11ed-a988-040300000000', _binary 0x30, '2022-11-30 17:55:59', '2022-11-02 10:40:05', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Administrador General', 'Administrador General de la Plataforma', 'ADMINGENL'),
	('0c67e95b-74f1-11ed-aad1-040300000000', _binary 0x30, '2022-12-05 17:03:36', '2022-12-05 17:03:36', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DPCP', 'Rol para Operaciones de DPCP', ''),
	('11aa824f-95cc-11ed-a912-705a0f328da6', _binary 0x30, '2023-01-16 12:32:02', '2023-01-16 12:32:02', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Organismo', 'Rol para usuarios de tipo organismos', ''),
	('11f778ed-71d3-11ed-a880-040300000000', _binary 0x31, '2023-02-16 14:42:17', '2022-12-01 16:51:27', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DAMOP PARTICIPACIONES', 'ROL PARA GENERAR OPERACIONES DE DAMOP', ''),
	('22e1877d-95cc-11ed-a912-705a0f328da6', _binary 0x30, '2023-01-16 12:32:30', '2023-01-16 12:32:30', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DAMOP ORGANISMOS', 'rol para los usuarios de damop de tipo organismos', ''),
	('2621f126-71d3-11ed-a880-040300000000', _binary 0x30, '2023-02-16 14:41:55', '2022-12-01 16:52:00', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DAMOP MUNICIPIOS', 'ROL PARA GENERAR OPERACIONES DE APORTACIONES DE DAMOP', ''),
	('2b2a55a0-71c3-11ed-a880-040300000000', _binary 0x30, '2022-12-01 14:57:37', '2022-12-01 14:57:37', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'CPH CALCULO', 'rol para Generar las operaciones de Coordinación de Planeación Hacendaria', ''),
	('58001c24-7583-11ed-aad1-040300000000', _binary 0x31, '2023-02-16 14:42:23', '2022-12-06 10:30:49', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DAMOP Cordinacion', 'Solo se Puede Visualizar', ''),
	('5eb9ce50-7655-11ed-aad1-040300000000', _binary 0x30, '2022-12-07 11:34:43', '2022-12-07 11:34:15', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DPCP Autorizar', 'Revisión de Solicitudes', ''),
	('abb64046-b850-11ed-8002-d89d6776f970', _binary 0x30, '2023-03-01 08:46:53', '2023-03-01 08:46:53', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Gestión Usuarios', 'Administración de solicitudes de usuarios', ''),
	('de8ab454-7269-11ed-a880-040300000000', _binary 0x30, '2022-12-02 10:50:54', '2022-12-02 10:50:54', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Municipio', 'Rol De Municipio', ''),
	('ee999ece-9b56-11ed-b58e-2c4138b7dab1', _binary 0x30, '2023-01-23 12:47:27', '2023-01-23 12:47:27', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DAF OPERACIONES', 'Rol para usuarios del departamento de DAF', '');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
