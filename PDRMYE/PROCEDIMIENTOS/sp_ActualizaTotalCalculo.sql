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

-- Volcando estructura para procedimiento PDRMYE.sp_ActualizaTotalCalculo
DELIMITER //
CREATE PROCEDURE `sp_ActualizaTotalCalculo`(
	IN `ID_CALCULO_PRINCIPAL` CHAR(36),
	IN `COMENTARIO` VARCHAR(100)
)
    COMMENT 'Actualiza el total principal del calculo'
BEGIN


UPDATE PDRMYE.CalculoPrincipal cp
SET cp.Total = 
(
SELECT 
sum(Mensual
	      + PrimerAjuste
	      + SegundoAjuste
	      + TercerAjuste
	      + CuartoAjuste
	      + AjusteAnual
	      + AjusteSemestral
	      + AjusteDefinitivo
          + AjusteEstatal
          + AjusteFofir
	      + CompensacionFEIF
	      + RetencionFEIF) total
 FROM 
PDRMYE.CalculoTotalDetalle ctd
WHERE ctd.idCalculoTotal=ID_CALCULO_PRINCIPAL
)
,cp.Comentario=COMENTARIO
WHERE cp.id=ID_CALCULO_PRINCIPAL
;




END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
