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

-- Volcando estructura para tabla PDRMYE.TblAnticiposParticipacionesPrest
DROP TABLE IF EXISTS `TblAnticiposParticipacionesPrest`;
CREATE TABLE IF NOT EXISTS `TblAnticiposParticipacionesPrest` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `idusuario` char(36) NOT NULL,
  `Anio` int(4) NOT NULL DEFAULT 0,
  `Mes` int(2) NOT NULL DEFAULT 0,
  `Tipo` int(2) NOT NULL DEFAULT 0,
  `ClaveEstadoMunicipio` int(4) NOT NULL DEFAULT 0,
  `Importe` double NOT NULL DEFAULT 0,
  `ConceptoCheque` int(11) NOT NULL DEFAULT 0,
  `UResp` varchar(4) NOT NULL DEFAULT '0',
  `Proyecto` varchar(20) NOT NULL DEFAULT '0',
  `ClaveBeneficiario` varchar(20) DEFAULT '0',
  `Beneficiario` varchar(200) DEFAULT '0',
  `Descripcion` varchar(300) DEFAULT '0',
  `Clasificacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabla Temporal para la generación de los anticipos de Participaciones prestamos';

-- Volcando datos para la tabla PDRMYE.TblAnticiposParticipacionesPrest: ~0 rows (aproximadamente)
DELETE FROM `TblAnticiposParticipacionesPrest`;
/*!40000 ALTER TABLE `TblAnticiposParticipacionesPrest` DISABLE KEYS */;
/*!40000 ALTER TABLE `TblAnticiposParticipacionesPrest` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
