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

-- Volcando estructura para tabla PDRMYE.TblOrgOper
DROP TABLE IF EXISTS `TblOrgOper`;
CREATE TABLE IF NOT EXISTS `TblOrgOper` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `IDENTIFICADORC` int(11) DEFAULT NULL,
  `Anio` int(4) DEFAULT NULL,
  `Mes` varchar(50) DEFAULT NULL,
  `clasificacion` varchar(50) DEFAULT NULL,
  `SolEgreso` varchar(50) DEFAULT NULL,
  `Aportacion` varchar(50) DEFAULT NULL,
  `ReqAnticipo` varchar(50) DEFAULT NULL,
  `NumEgreso` varchar(50) DEFAULT NULL,
  `NumOrdenPago` varchar(50) DEFAULT NULL,
  `Uresp` varchar(50) DEFAULT NULL,
  `Proveedor` varchar(50) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `NumProyecto` varchar(7) DEFAULT NULL,
  `TotalC` decimal(30,2) DEFAULT 0.00,
  `ConceptoCheque` char(36) DEFAULT NULL,
  `Cuenta` varchar(18) DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  `IDENTIFICADORCD` int(11) DEFAULT NULL,
  `ConceptoEgreso` char(36) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT '',
  `totaldetalle` decimal(30,2) DEFAULT 0.00,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabla para migrar operaciones de organismos';

-- Volcando datos para la tabla PDRMYE.TblOrgOper: ~3 rows (aproximadamente)
DELETE FROM `TblOrgOper`;
/*!40000 ALTER TABLE `TblOrgOper` DISABLE KEYS */;
INSERT INTO `TblOrgOper` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `IDENTIFICADORC`, `Anio`, `Mes`, `clasificacion`, `SolEgreso`, `Aportacion`, `ReqAnticipo`, `NumEgreso`, `NumOrdenPago`, `Uresp`, `Proveedor`, `Tipo`, `NumProyecto`, `TotalC`, `ConceptoCheque`, `Cuenta`, `Observaciones`, `IDENTIFICADORCD`, `ConceptoEgreso`, `Descripcion`, `totaldetalle`, `Clasificador01`, `Clasificador02`, `Clasificador03`, `Clasificador04`, `Clasificador05`, `Clasificador06`, `Clasificador07`, `Clasificador08`, `Clasificador09`, `Clasificador10`, `Clasificador11`) VALUES
	('ace231be-b929-11ed-8002-d89d6776f970', _binary 0x30, '2023-03-02 10:40:16', '2023-03-02 10:40:16', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 498634, 2021, 'Enero', 'OPOR', NULL, NULL, NULL, '607716', '498634', '044Z', '0005194', 'Egreso', '0018292', 1312500.00, '18', '12000011906', NULL, 498634, '465', 'APORTACION ESTATAL A UTILIZAR EN SERVICIOS PERSONALES EN LA PRIMER QUINCENA DEL MES DEENERO DE 2021.', 1312500.00, '211213210500001', '221', '1', '11', '99X00001', '21', '00', '90', '00', '90', '121015801'),
	('ace23394-b929-11ed-8002-d89d6776f970', _binary 0x30, '2023-03-02 10:40:16', '2023-03-02 10:40:16', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 500926, 2021, 'Enero', 'OPOR', NULL, NULL, NULL, '6009367', '500926', '044Z', '0005194', 'Egreso', '0018292', 2654822.96, '18', '12000011906', NULL, 500926, '465', 'APORTACION ESTATAL A UTILIZAR EN SERVICIOS PERSONALES EN LA SEGUNDA QUINCENA DEL MES DE ENERO DE 2021.', 1312500.00, '211213210500001', '221', '1', '11', '99X00001', '21', '00', '90', '00', '90', '121015801'),
	('ace234b0-b929-11ed-8002-d89d6776f970', _binary 0x30, '2023-03-02 10:40:16', '2023-03-02 10:40:16', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500926, '465', 'APORTACION ESTATAL A UTILIZAR EN SERVICIOS PERSONALES Y GASTO OPERATIVO CORRESPONDIENTES A LA SEGUNDA QUINCENA DEL MES DE FEBRERO DE 2021.', 1342322.96, '211213210500001', '221', '1', '11', '99X00001', '21', '00', '90', '00', '90', '121015801');
/*!40000 ALTER TABLE `TblOrgOper` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
