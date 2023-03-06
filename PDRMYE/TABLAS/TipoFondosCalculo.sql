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

-- Volcando estructura para tabla PDRMYE.TipoFondosCalculo
DROP TABLE IF EXISTS `TipoFondosCalculo`;
CREATE TABLE IF NOT EXISTS `TipoFondosCalculo` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `Descripcion` varchar(255) NOT NULL,
  `NumProyecto` varchar(7) DEFAULT NULL,
  `ConceptoEgreso` int(11) DEFAULT NULL,
  `ClasificacionOP` varchar(50) DEFAULT NULL,
  `Clasificador01` varchar(50) DEFAULT NULL,
  `Clasificador02` varchar(50) DEFAULT NULL,
  `Clasificador03` varchar(50) DEFAULT NULL,
  `Clasificador04` varchar(50) DEFAULT NULL,
  `Clasificador05` varchar(50) DEFAULT NULL,
  `Clasificador06` varchar(50) DEFAULT NULL,
  `Clasificador07` varchar(50) DEFAULT NULL,
  `Clasificador08` varchar(50) DEFAULT NULL,
  `Clasificador09` varchar(50) DEFAULT NULL,
  `Clasificador10` varchar(50) DEFAULT NULL,
  `Clasificador11` varchar(50) DEFAULT NULL,
  `Referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los Tipos  calculos';

-- Volcando datos para la tabla PDRMYE.TipoFondosCalculo: ~15 rows (aproximadamente)
DELETE FROM `TipoFondosCalculo`;
/*!40000 ALTER TABLE `TipoFondosCalculo` DISABLE KEYS */;
INSERT INTO `TipoFondosCalculo` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Descripcion`, `NumProyecto`, `ConceptoEgreso`, `ClasificacionOP`, `Clasificador01`, `Clasificador02`, `Clasificador03`, `Clasificador04`, `Clasificador05`, `Clasificador06`, `Clasificador07`, `Clasificador08`, `Clasificador09`, `Clasificador10`, `Clasificador11`, `Referencia`) VALUES
	('07d8b0d4-7fc1-11ed-a963-040300000000', _binary 0x30, '2022-12-19 11:17:40', '2022-12-19 11:17:35', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'FEIEF del IEPS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('2995d003-8159-11ed-a963-040300000000', _binary 0x30, '2022-12-21 11:59:14', '2022-12-21 11:59:06', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'Ajuste Definitivo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('3ae941a8-8159-11ed-a963-040300000000', _binary 0x30, '2022-12-21 11:59:44', '2022-12-21 11:59:35', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'Retención FEIEF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('3f105779-7581-11ed-aad1-040300000000', _binary 0x30, '2022-12-07 16:42:06', '2022-12-06 10:15:48', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'Faltante Inicial de FEIEF', '0020382', 1310, 'OPMP', '311113220100000', 'C04C99111', '422', 'C04C99111', '81102', '5', '15', '23R08001', '21', NULL, '522000101', 'FEIEF1'),
	('57c57d1a-7fbc-11ed-a963-040300000000', _binary 0x30, '2022-12-19 10:44:13', '2022-12-19 10:44:02', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '3er Ajuste Cuatrimestral', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('66717462-61de-11ed-a880-040300000000', _binary 0x30, '2022-12-07 16:49:44', '2022-11-11 09:32:14', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'Mensual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MENSUAL'),
	('6ffb2606-726a-11ed-a880-040300000000', _binary 0x30, '2022-12-07 16:52:23', '2022-12-02 10:54:58', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'Anual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ANUAL'),
	('a07946ae-7a44-11ed-aad1-040300000000', _binary 0x30, '2022-12-12 11:44:54', '2022-12-12 11:44:28', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'Semanal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEMANAL'),
	('a7791494-6a99-11ed-a880-040300000000', _binary 0x30, '2023-02-08 10:53:48', '2022-11-22 12:12:49', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'FEIEF del Fondo General de Participaciones', '0021904', 1310, 'OPMP', '311113220100000', '22NU11100', '422', 'C04C99111', '81102', '5', '15', '23R08001', '21', NULL, '522000101', 'FEIEF2'),
	('ac823294-6a99-11ed-a880-040300000000', _binary 0x30, '2023-02-08 10:54:29', '2022-11-22 12:12:57', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'FEIEF del Fondo de Fomento Municipal', '0021904', 1324, 'OPMP', '311113220100000', '22NU11100', '422', 'C04C99111', '81203', '5', '15', '23R08001', '21', NULL, '522000101', 'FEIEF3'),
	('b08fbf83-6a99-11ed-a880-040300000000', _binary 0x30, '2023-02-08 10:54:58', '2022-11-22 12:13:04', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'FEIEF del Fondo de Fiscalización', '0021904', 1325, 'OPMP', '311113220100000', '22NU11100', '422', 'C04C99111', '81312', '5', '15', '23R08001', '21', NULL, '522000101', 'FEIEF4'),
	('c91804ac-a73b-11ed-8860-040300000000', _binary 0x30, '2023-02-07 17:04:33', '2023-02-07 17:04:33', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'Diario', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('d2544778-a40e-11ed-854b-040300000000', _binary 0x30, '2023-02-03 16:24:26', '2023-02-03 16:05:08', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 'FOFIR 4to TRIMESTRE 2022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FOFIR4'),
	('e3baae40-8183-11ed-a963-040300000000', _binary 0x30, '2022-12-21 17:04:57', '2022-12-21 17:04:57', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '1er Ajuste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('fe59e48f-975a-11ed-88bc-040300000000', _binary 0x30, '2023-01-18 12:07:44', '2023-01-18 12:07:38', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '2do Ajuste Cuatrimestral', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `TipoFondosCalculo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
