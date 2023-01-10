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

-- Volcando estructura para procedimiento PDRMYE.sp_DCCP
DROP PROCEDURE IF EXISTS `sp_DCCP`;
DELIMITER //
CREATE PROCEDURE `sp_DCCP`(
	IN `P_FONDO` CHAR(36),
	IN `P_ANIO` CHAR(36),
	IN `P_MES` CHAR(36),
	IN `P_IDPROCESO` CHAR(36),
	IN `P_IDESTATUS` CHAR(36)
)
    COMMENT 'consulta para DCCP'
BEGIN


DECLARE VPROCESO VARCHAR(30);




SELECT NOMBRE INTO VPROCESO FROM PDRMYE.Procesos WHERE id = P_IDPROCESO;


IF VPROCESO ='SOL_ANT_PART' THEN
SELECT 
sol.id,
sol.Anio,
VPROCESO proceso,
mes.Descripcion descripcionMes,
sol.Concepto,
sol.Total,
mun.ClaveEstado,
mun.Nombre municipio
FROM PDRMYE.Solicitudes sol
INNER JOIN PDRMYE.Meses mes ON sol.Mes = mes.mes
INNER JOIN PDRMYE.Municipios mun ON sol.idMunicipio = mun.id
WHERE 
sol.Anio = IFNULL(P_ANIO,'')
AND sol.Mes = IFNULL(P_MES,'')
;
ELSEIF VPROCESO ='ANT_PART' THEN

 SELECT 
         apd.id,
         app.id idprincipal,
         VPROCESO proceso,
         apd.Anio,
         mes.Descripcion mesdescripcion,
         mun.ClaveEstado,
         mun.Nombre,
         apd.Total
      FROM PDRMYE.AnticipoPartPrincipal app
      INNER JOIN PDRMYE.Estatus est             ON app.IdEstatus = est.id
      INNER JOIN PDRMYE.AnticipoPartDetalle apd ON app.id = apd.idPrincipal
      INNER JOIN PDRMYE.Meses mes ON mes.mes = apd.Mes
      INNER JOIN PDRMYE.Municipios mun ON mun.id = apd.IdMunicipio
      WHERE 
   	apd.Anio = IFNULL(P_ANIO,'')
     AND apd.Mes = IFNULL(P_MES,'')
            ;


ELSEIF
 VPROCESO ='PARTICIPACIONES_FEDERALES_CPH' ||
 VPROCESO ='PARTICIPACIONES_ESTATALES_CPH' ||
 VPROCESO ='APORTACIONES_FEDERALES_CPH' ||
 VPROCESO ='APORTACIONES_ESTATALES_CPH' 
   THEN
   
   CALL sp_GetParticipacionesFederales();
 
 /*  
SELECT 



ctd.id,
ct.id idcalculo,
VPROCESO proceso,
ct.Anio,
mes.Descripcion,
mun.ClaveEstado,
mun.Nombre municipio,
(
ctd.Mensual
+ ctd.PrimerAjuste
+ ctd.SegundoAjuste
+ ctd.TercerAjuste
+ ctd.CuartoAjuste
+ ctd.AjusteAnual
+ ctd.AjusteSemestral
+ ctd.AjusteDefinitivo
+ ctd.AjusteEstatal
+ ctd.AjusteFofir
+ ctd.CompensacionFEIF
+ ctd.RetencionFEIF) total,
ctd.ComentarioPresupuesto,
fondo.Descripcion fondodescripcion


FROM 
PDRMYE.CalculoTotalDetalle ctd
INNER JOIN PDRMYE.CalculoPrincipal ct ON ctd.idCalculoTotal = ct.id
INNER JOIN PDRMYE.Municipios mun ON mun.id = ctd.IdMun
INNER JOIN PDRMYE.Fondos fondo ON fondo.id = ct.ClaveFondo
INNER JOIN PDRMYE.Meses mes ON mes.mes = ct.mes
WHERE 
ct.Anio = IFNULL(P_ANIO,'')
AND ct.Mes = IFNULL(P_MES,'')
AND  ct.ClaveFondo = IFNULL(P_FONDO,'')
;

*/
END IF;



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
