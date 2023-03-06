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

-- Volcando estructura para tabla PDRMYE.TipoSolicitudes
DROP TABLE IF EXISTS `TipoSolicitudes`;
CREATE TABLE IF NOT EXISTS `TipoSolicitudes` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `Tipo` varchar(50) NOT NULL DEFAULT '0',
  `Descripcion` varchar(100) NOT NULL,
  `Organismos` int(11) NOT NULL DEFAULT 0,
  `Municipios` int(11) NOT NULL DEFAULT 0,
  `Referencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los tipos de solicitudes de organismos';

-- Volcando datos para la tabla PDRMYE.TipoSolicitudes: ~14 rows (aproximadamente)
DELETE FROM `TipoSolicitudes`;
/*!40000 ALTER TABLE `TipoSolicitudes` DISABLE KEYS */;
INSERT INTO `TipoSolicitudes` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Tipo`, `Descripcion`, `Organismos`, `Municipios`, `Referencia`) VALUES
	('057b170a-3f45-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 10:48:37', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Donativos ICV', 'Donativos ICV', 0, 0, NULL),
	('0cd2fed6-3f45-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 10:48:50', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Ayudas Sociales', 'Ayudas Sociales', 0, 0, NULL),
	('1007ea15-7a57-11ed-aad1-040300000000', _binary 0x30, '2022-12-12 13:56:42', '2022-12-12 13:56:26', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Anticipo de Participaciones(Préstamo)', 'Anticipo de Participaciones(Préstamo)', 0, 1, 3),
	('8a5e35c6-6c52-11ed-a880-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-11-24 16:48:48', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Anticipo de Participaciones', 'Anticipo de Participaciones', 0, 1, 1),
	('a69ebec0-4410-11ed-aea4-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-10-04 13:16:20', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', ' Pago Virtual ICV', ' Pago Virtual ICV', 0, 0, NULL),
	('b85ef35d-6c52-11ed-a880-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-11-24 16:50:05', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Pago de Participaciones', 'Pago de Participaciones', 0, 1, 2),
	('d95cf78b-3f4c-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 11:44:39', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Servicios Personales', 'Servicios Personales', 1, 0, NULL),
	('e055ba26-3f4c-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 11:44:51', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Servicios Generales', 'Servicios Generales', 1, 0, NULL),
	('e7953bc7-3f4c-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 11:45:03', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Programa Estatal de Inversion (PEI)', 'Programa Estatal de Inversion (PEI)', 1, 0, NULL),
	('ee77fe41-3f44-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 10:47:59', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '3% ISN', '3% ISN', 0, 0, NULL),
	('ef2685af-3f4c-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 11:45:16', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Anticipos', 'Anticipos', 1, 0, NULL),
	('f67e6f25-3f44-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 10:48:12', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Pago de 1 y 2 al Millar', 'Pago de 1 y 2 al Millar', 0, 0, NULL),
	('fda9047c-3f4c-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 11:45:40', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Gastos Extraodinarios', 'Gastos Extraodinarios', 1, 0, NULL),
	('fef6506c-3f44-11ed-af5a-040300000000', _binary 0x30, '2022-11-30 17:58:07', '2022-09-28 10:48:26', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Gastos Extraordinario con Presupuesto Virtual', 'Gastos Extraordinario con Presupuesto Virtual', 0, 0, NULL);
/*!40000 ALTER TABLE `TipoSolicitudes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
