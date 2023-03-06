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

-- Volcando estructura para tabla PDRMYE.PA_DESCUENTOS
DROP TABLE IF EXISTS `PA_DESCUENTOS`;
CREATE TABLE IF NOT EXISTS `PA_DESCUENTOS` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `idPA` char(36) NOT NULL,
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(50) NOT NULL DEFAULT '1',
  `CreadoPor` char(50) NOT NULL DEFAULT '1',
  `idMunicipio` char(36) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `NumOperacion` int(11) NOT NULL,
  `idUresp` char(36) NOT NULL,
  `idDivisa` char(36) NOT NULL,
  `ParcialDescuento` decimal(30,2) NOT NULL,
  `OtrosCargos` decimal(30,2) NOT NULL DEFAULT 0.00,
  `total` decimal(30,2) NOT NULL DEFAULT 0.00,
  `cveRetencion` int(11) DEFAULT NULL,
  `DescripcionDescuento` varchar(300) DEFAULT NULL,
  KEY `FK1_PADES_MUNICIPIO` (`idMunicipio`),
  KEY `FK2_PADES_URESPONSABLE` (`idUresp`),
  KEY `FK3_PADES_DIVISA` (`idDivisa`),
  KEY `FK4_PADES_PA` (`idPA`),
  CONSTRAINT `FK1_PADES_MUNICIPIO` FOREIGN KEY (`idMunicipio`) REFERENCES `Municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_PADES_URESPONSABLE` FOREIGN KEY (`idUresp`) REFERENCES `UResponsable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3_PADES_DIVISA` FOREIGN KEY (`idDivisa`) REFERENCES `Divisas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK4_PADES_PA` FOREIGN KEY (`idPA`) REFERENCES `PA` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabla para guardar los descuentos de las participaciones';

-- Volcando datos para la tabla PDRMYE.PA_DESCUENTOS: ~0 rows (aproximadamente)
DELETE FROM `PA_DESCUENTOS`;
/*!40000 ALTER TABLE `PA_DESCUENTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PA_DESCUENTOS` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
