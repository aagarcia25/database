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

-- Volcando estructura para tabla PDRMYE.ORG
DROP TABLE IF EXISTS `ORG`;
CREATE TABLE IF NOT EXISTS `ORG` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `idAportacion` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganismo` char(36) DEFAULT NULL,
  `idEstatus` char(36) DEFAULT NULL,
  `Anio` int(4) DEFAULT NULL,
  `Mes` int(2) DEFAULT NULL,
  `total` decimal(30,2) DEFAULT 0.00,
  `Presupuesto` decimal(30,2) DEFAULT 0.00,
  `Procesado` int(1) DEFAULT 0,
  `Comentario` varchar(300) DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  `NumProyecto` varchar(7) DEFAULT NULL,
  `Uresp` char(36) DEFAULT NULL,
  `idDivisa` char(36) DEFAULT 'd7c1ea77-7049-11ed-a880-040300000000',
  `clasificacion` varchar(50) DEFAULT NULL,
  `ConceptoSolicitud` char(36) DEFAULT NULL,
  `ConceptoCheque` char(36) DEFAULT NULL,
  `SolEgreso` varchar(50) DEFAULT NULL,
  `NumEgreso` varchar(50) DEFAULT NULL,
  `NumOrdenPago` varchar(50) DEFAULT NULL,
  `NumReqAnticipo` varchar(50) DEFAULT NULL,
  `NumCheque` varchar(50) DEFAULT NULL,
  `NumAportacion` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Cuenta` varchar(18) DEFAULT NULL,
  `TipoSolicitud` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idAportacion` (`idAportacion`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabla para Participaciones';

-- Volcando datos para la tabla PDRMYE.ORG: ~0 rows (aproximadamente)
DELETE FROM `ORG`;
/*!40000 ALTER TABLE `ORG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORG` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
