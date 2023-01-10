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

-- Volcando estructura para procedimiento PDRMYE.sp_BorraCalculo
DROP PROCEDURE IF EXISTS `sp_BorraCalculo`;
DELIMITER //
CREATE PROCEDURE `sp_BorraCalculo`(
	IN `P_IDCALCULO` CHAR(36),
	IN `P_USUARIO` CHAR(36),
	IN `P_CLAVE` CHAR(36),
	IN `P_ANIO` INT,
	IN `P_MES` INT
)
    COMMENT 'elimina de forma logica un calculo realizado'
BEGIN

-- paso 1
-- SE ELIMINA DE FORMA LOGICA EL DETALLE DEL CALCULO


DECLARE VidFondo CHAR(36); 

-- se obtiene el id del fondo
SELECT f.id into VidFondo FROM PDRMYE.Fondos f WHERE f.Clave=P_CLAVE;


UPDATE PDRMYE.CalculoTotalDetalle  CTD 
SET CTD.deleted = 1,
    CTD.ModificadoPor= P_USUARIO
WHERE CTD.id IN (
SELECT id  from PDRMYE.CalculoTotalDetalle where id IN (
                                                       SELECT cp.id FROM PDRMYE.CalculoPrincipal cp
                                                        WHERE cp.ClaveFondo=VidFondo
                                                        AND cp.Mes=P_MES
                                                        AND cp.Anio=P_ANIO
                                                        AND cp.id=P_IDCALCULO
										                          )										  
);
					

-- SE ELIMINA LOS AJUSTE SI ES QUE HA TENIDO
UPDATE PDRMYE.CalculoAjuste ca
SET ca.deleted=1
WHERE ca.idCalculo IN (
                     SELECT cp.id FROM PDRMYE.CalculoPrincipal cp
                                                                              WHERE cp.ClaveFondo=VidFondo
                                                                              AND cp.Mes=P_MES
                                                                              AND cp.Anio=P_ANIO
                                                                              AND cp.id=P_IDCALCULO
                );


-- SE ELIMINA DE FORMA LOGICA EL CALCULO PRINCIPAL

UPDATE PDRMYE.CalculoPrincipal cp
SET cp.deleted=1,
    cp.ModificadoPor=P_USUARIO
 where id IN (                      SELECT cp.id FROM PDRMYE.CalculoPrincipal cp
                                                                              WHERE cp.ClaveFondo=VidFondo
                                                                              AND cp.Mes=P_MES
                                                                              AND cp.Anio=P_ANIO
                                                                              AND cp.id=P_IDCALCULO
										                    
				 ) ;                                        


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
