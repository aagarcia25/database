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

-- Volcando estructura para tabla PDRMYE.ArticuloDetalle
CREATE TABLE IF NOT EXISTS `ArticuloDetalle` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `idArticuloPrincipal` char(36) NOT NULL DEFAULT '1',
  `IdMunicipio` char(36) NOT NULL,
  `Poblacion` int(30) DEFAULT NULL,
  `Proyeccion` int(30) DEFAULT NULL,
  `EstructuraPoblacion1` decimal(30,20) DEFAULT NULL,
  `EstructuraPoblacion2` decimal(30,20) DEFAULT NULL,
  `Territorio` decimal(30,20) DEFAULT NULL,
  `EstructuraTerritorio1` decimal(30,20) DEFAULT NULL,
  `EstructuraTerritorio2` decimal(30,20) DEFAULT NULL,
  `CoeficienteTerritorio` decimal(30,20) DEFAULT NULL,
  `Coeficientepoblacion` decimal(30,20) DEFAULT NULL,
  `ProporcionRecaudacion` decimal(30,20) DEFAULT NULL,
  `RecaudacionPonderada` decimal(30,20) DEFAULT NULL,
  `CoeficienteEfectividadReca` decimal(30,20) DEFAULT NULL,
  `Coeficienteproyeccion` decimal(30,20) DEFAULT NULL,
  `Facturacion1` decimal(30,2) DEFAULT NULL,
  `Facturacion2` decimal(30,2) DEFAULT NULL,
  `Recaudacion1` decimal(30,2) DEFAULT NULL,
  `Recaudacion2` decimal(30,2) DEFAULT NULL,
  `EficienciaRecaudatoria` decimal(30,20) DEFAULT NULL,
  `CoeficienteEficienciaRecaudatoria` decimal(30,20) DEFAULT NULL,
  `Tasa1` decimal(30,20) DEFAULT NULL,
  `Tasa2` decimal(30,20) DEFAULT NULL,
  `CoeficienteCrecimientoRecaudacion` decimal(30,20) DEFAULT NULL,
  `CoeficienteimpuestoPredial` decimal(30,20) DEFAULT NULL,
  `Pobreza1` decimal(30,20) DEFAULT NULL,
  `Pobreza2` decimal(30,20) DEFAULT NULL,
  `Carencia1` decimal(30,20) DEFAULT NULL,
  `Incidencia` decimal(30,20) DEFAULT NULL,
  `Intensidad` decimal(30,20) DEFAULT NULL,
  `ProporcionIntensidad` decimal(30,20) DEFAULT NULL,
  `DisPobreza` decimal(30,20) DEFAULT NULL,
  `MejoraPobreza` decimal(30,20) DEFAULT NULL,
  `ProporcionPobreza` decimal(30,20) DEFAULT NULL,
  `DisEficacia` decimal(30,20) DEFAULT NULL,
  `DisPobreza15` decimal(30,20) DEFAULT NULL,
  `CoeficientePobreza` decimal(30,20) DEFAULT NULL,
  `A3_1` decimal(30,20) DEFAULT NULL,
  `A3_2` decimal(30,20) DEFAULT NULL,
  `A3_3` decimal(30,20) DEFAULT NULL,
  `A3_4` decimal(30,20) DEFAULT NULL,
  `A3_5_COF` decimal(30,20) DEFAULT NULL,
  `A2_1` decimal(30,20) DEFAULT NULL,
  `A2_2` decimal(30,20) DEFAULT NULL,
  `A2_3` decimal(30,20) DEFAULT NULL,
  `A2_4` decimal(30,20) DEFAULT NULL,
  `A2_5` decimal(30,20) DEFAULT NULL,
  `A2_6_COF` decimal(30,20) DEFAULT NULL,
  `A1_1` decimal(30,20) DEFAULT NULL,
  `A1_2` decimal(30,20) DEFAULT NULL,
  `A1_3` decimal(30,20) DEFAULT NULL,
  `A1_4` decimal(30,20) DEFAULT NULL,
  `A1_5_COF` decimal(30,20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_ART_PRINCIPAL` (`idArticuloPrincipal`),
  KEY `FK2_ART_MUNICIPIO` (`IdMunicipio`),
  CONSTRAINT `FK1_ART_PRINCIPAL` FOREIGN KEY (`idArticuloPrincipal`) REFERENCES `ArticuloPrincipal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_ART_MUNICIPIO` FOREIGN KEY (`IdMunicipio`) REFERENCES `Municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de detalle de  los articulos';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
