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

-- Volcando estructura para disparador PDRMYE.tr_RegistraSolicitudINS
DROP TRIGGER IF EXISTS `tr_RegistraSolicitudINS`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_RegistraSolicitudINS` BEFORE INSERT ON `Solicitudes` FOR EACH ROW BEGIN

INSERT INTO PDRMYE.SolicitudesHis(
	deleted,
	UltimaActualizacion,
	FechaCreacion,
	ModificadoPor,
	CreadoPor,
	idSolicitudPrincipal,
	Comentario,
	IdEstatus
 )VALUES(
   NEW.deleted,
	NEW.UltimaActualizacion,
	NEW.FechaCreacion,
	NEW.ModificadoPor,
	NEW.CreadoPor,
   NEW.id,
   NEW.Comentario,
   NEW.IdEstatus
 );

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
