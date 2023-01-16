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

-- Volcando estructura para tabla PDRMYE.TblAnticiposParticipaciones
CREATE TABLE IF NOT EXISTS `TblAnticiposParticipaciones` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `idusuario` char(36) NOT NULL DEFAULT uuid(),
  `Anio` int(4) NOT NULL DEFAULT 0,
  `Mes` int(2) NOT NULL DEFAULT 0,
  `Tipo` int(2) NOT NULL DEFAULT 0,
  `ClaveEstadoMunicipio` int(4) NOT NULL DEFAULT 0,
  `Importe` double NOT NULL DEFAULT 0,
  `ConceptoCheque` char(36) NOT NULL DEFAULT '0',
  `UResp` varchar(4) NOT NULL DEFAULT '0',
  `Proyecto` varchar(20) NOT NULL DEFAULT '0',
  `ClaveBeneficiario` varchar(20) DEFAULT '0',
  `Beneficiario` varchar(200) DEFAULT '0',
  `Descripcion` varchar(300) NOT NULL DEFAULT '0',
  KEY `FK1_CCHEQUE` (`ConceptoCheque`),
  CONSTRAINT `FK1_CCHEQUE` FOREIGN KEY (`ConceptoCheque`) REFERENCES `ConceptoCheque` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabla Temporal para la generación de los anticipos de Participaciones';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
