-- --------------------------------------------------------
-- Host:                         10.200.4.111
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

-- Volcando estructura para tabla PDRMYE.PA
DROP TABLE IF EXISTS `PA`;
CREATE TABLE IF NOT EXISTS `PA` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `idCalculoPrincipal` char(36) DEFAULT NULL,
  `idCalculoDetalle` char(36) DEFAULT NULL,
  `ClaveEstado` int(5) DEFAULT NULL,
  `idMunicipio` char(36) DEFAULT NULL,
  `idTipoCalculo` char(36) DEFAULT NULL,
  `idFondo` char(36) DEFAULT NULL,
  `idEstatus` char(36) DEFAULT NULL,
  `idTipoParticipacion` char(36) DEFAULT NULL,
  `Anio` int(4) DEFAULT NULL,
  `Mes` int(2) DEFAULT NULL,
  `ClavePresupuestal` varchar(700) DEFAULT NULL,
  `TipoCvePresupuestal` varchar(2) DEFAULT 'E6',
  `total` decimal(30,2) DEFAULT 0.00,
  `Presupuesto` decimal(30,2) DEFAULT 0.00,
  `Retenciones` decimal(30,2) DEFAULT 0.00,
  `Descuentos` decimal(30,2) DEFAULT 0.00,
  `Procesado` int(1) DEFAULT 0,
  `Integrado` int(1) DEFAULT 0,
  `Comentario` varchar(300) DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  `NumProyecto` varchar(7) DEFAULT NULL,
  `ConceptoEgreso` int(11) DEFAULT NULL,
  `Uresp` char(36) DEFAULT NULL,
  `TipoSolicitud` char(36) DEFAULT NULL,
  `idDivisa` char(36) DEFAULT NULL,
  `idTipoSolicitud` char(36) DEFAULT NULL,
  `clasificacion` varchar(50) DEFAULT NULL,
  `ConceptoSolicitud` char(36) DEFAULT NULL,
  `ConceptoCheque` char(36) DEFAULT NULL,
  `ConceptoAnticipo` varchar(50) DEFAULT NULL,
  `NumSolEgreso` varchar(50) DEFAULT NULL,
  `NumParticipacion` varchar(50) DEFAULT NULL,
  `NumEgreso` varchar(50) DEFAULT NULL,
  `NumOrdenPago` varchar(50) DEFAULT NULL,
  `NumRequerimientoAnt` varchar(50) DEFAULT NULL,
  `NumCheque` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `ClaveBeneficiario` varchar(50) DEFAULT NULL,
  `DescripcionBeneficiario` varchar(200) DEFAULT NULL,
  `Detalle` int(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_TipoSolicitud` (`idTipoParticipacion`),
  KEY `FK2_divisa` (`idDivisa`),
  KEY `FK3_PA_MUNICIPIO` (`idMunicipio`),
  KEY `FK4_PA_CONCEPTO_CHEQUE` (`ConceptoCheque`),
  CONSTRAINT `FK1_TipoSolicitud` FOREIGN KEY (`idTipoParticipacion`) REFERENCES `TipoSolicitudes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_divisa` FOREIGN KEY (`idDivisa`) REFERENCES `Divisas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3_PA_MUNICIPIO` FOREIGN KEY (`idMunicipio`) REFERENCES `Municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK4_PA_CONCEPTO_CHEQUE` FOREIGN KEY (`ConceptoCheque`) REFERENCES `ConceptoCheque` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabla para Participaciones';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
