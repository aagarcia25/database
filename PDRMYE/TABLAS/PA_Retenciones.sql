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

-- Volcando estructura para tabla PDRMYE.PA_Retenciones
DROP TABLE IF EXISTS `PA_Retenciones`;
CREATE TABLE IF NOT EXISTS `PA_Retenciones` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL,
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `idRetencion` char(36) NOT NULL,
  `idMunicipio` char(36) NOT NULL,
  `idDivisa` char(36) NOT NULL,
  `importe` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `idPA` char(36) NOT NULL,
  `tipo` int(1) NOT NULL,
  `ClaveTipoRetencion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_idRetencion` (`idRetencion`) USING BTREE,
  KEY `FK2_idMunicipio` (`idMunicipio`) USING BTREE,
  KEY `FK3_idDivisa` (`idDivisa`) USING BTREE,
  KEY `FK4_idPA` (`idPA`) USING BTREE,
  CONSTRAINT `FK1_idRetencion` FOREIGN KEY (`idRetencion`) REFERENCES `CatRetenciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_idMunicipio` FOREIGN KEY (`idMunicipio`) REFERENCES `Municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3_idDivisa` FOREIGN KEY (`idDivisa`) REFERENCES `Divisas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK4_idPA` FOREIGN KEY (`idPA`) REFERENCES `PA` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabla para guardar las retenciones de las participaciones';

-- Volcando datos para la tabla PDRMYE.PA_Retenciones: ~0 rows (aproximadamente)
DELETE FROM `PA_Retenciones`;
/*!40000 ALTER TABLE `PA_Retenciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `PA_Retenciones` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
