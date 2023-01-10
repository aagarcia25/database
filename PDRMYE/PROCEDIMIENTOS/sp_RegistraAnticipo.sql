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

-- Volcando estructura para procedimiento PDRMYE.sp_RegistraAnticipo
DROP PROCEDURE IF EXISTS `sp_RegistraAnticipo`;
DELIMITER //
CREATE PROCEDURE `sp_RegistraAnticipo`(
	IN `P_CLAVE` VARCHAR(10),
	IN `P_CLASIFICACION` VARCHAR(50),
	IN `P_IMPORTE` DECIMAL(30,2),
	IN `P_OBSERVACIONES` VARCHAR(300),
	IN `P_IDUSUARIO` CHAR(36)
)
    COMMENT 'Registra el anticipo de participaciones en la tabla PA'
BEGIN


DECLARE VIDMUNICIPIO CHAR(36);
DECLARE VIDURESP CHAR(36);






SELECT id INTO VIDMUNICIPIO FROM PDRMYE.Municipios WHERE ClavePSIREGOB = P_CLAVE OR ClaveDSIREGOB = P_CLAVE;
SELECT idUResp INTO VIDURESP FROM PDRMYE.Usuarios WHERE id =P_IDUSUARIO;


INSERT INTO PDRMYE.PA
(
CreadoPor,
ModificadoPor,
idTipoParticipacion,
total,
Anio,
Mes,
Observaciones,
Uresp,
idMunicipio,
idDivisa,
clasificacion
)
VALUES(
P_IDUSUARIO,
P_IDUSUARIO,
'1007ea15-7a57-11ed-aad1-040300000000',
P_IMPORTE,
YEAR(NOW()),
MONTH(NOW()),
P_OBSERVACIONES,
VIDURESP,
VIDMUNICIPIO,
'd7c1ea77-7049-11ed-a880-040300000000',
P_CLASIFICACION
)
;




END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
