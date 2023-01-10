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

-- Volcando estructura para procedimiento PDRMYE.sp_IntegrarOperaciones
DROP PROCEDURE IF EXISTS `sp_IntegrarOperaciones`;
DELIMITER //
CREATE PROCEDURE `sp_IntegrarOperaciones`()
BEGIN

 DECLARE VIDPA CHAR(36);
 DECLARE VTOTAL DECIMAL(30,2);
 DECLARE VIDUSER CHAR(36);
 DECLARE VTOTAL2 DECIMAL(30,2);
 
 -- SE OBTIENE EL TOTAL
 SELECT 
 SUM(total) INTO VTOTAL
 FROM 
 PDRMYE.TblIntegraOper oper
 INNER JOIN PDRMYE.PA asb on oper.idPA = asb.id
 ;  
 
 
 SELECT 
 asb.id,
 max(asb.total),
 oper.idusuario
 INTO VIDPA,VTOTAL2,VIDUSER
 FROM 
 PDRMYE.TblIntegraOper oper
 INNER JOIN PDRMYE.PA asb on oper.idPA = asb.id
 INNER JOIN PDRMYE.TipoFondosCalculo tfc ON tfc.id = asb.idTipoCalculo AND tfc.Descripcion='Mensual'
 ;  
 
 
   INSERT INTO PDRMYE.PA(
   CreadoPor,
   ModificadoPor,
	idCalculoPrincipal,
	idCalculoDetalle,
	ClaveEstado,
	idMunicipio,
	idTipoCalculo,
	idFondo,
	idEstatus,
	idTipoParticipacion,
	Anio,
	Mes,
	ClavePresupuestal,
	total,
	NumProyecto,
	ConceptoEgreso,
	ConceptoCheque,
	idDivisa,
	Uresp,
	Clasificacion,
   Integrado
    )
   SELECT 
   VIDUSER,
   VIDUSER,
   aq.idCalculoPrincipal,
	aq.idCalculoDetalle,
	aq.ClaveEstado,
	aq.idMunicipio,
	aq.idTipoCalculo,
	aq.idFondo,
	aq.idEstatus,
	aq.idTipoParticipacion,
	aq.Anio,
	aq.Mes,
	aq.ClavePresupuestal,
	VTOTAL,
	aq.NumProyecto,
	aq.ConceptoEgreso,
	aq.ConceptoCheque,
	aq.idDivisa,
	aq.Uresp,
	aq.clasificacion,
   1
   FROM PDRMYE.PA aq
   WHERE 1=1
   and aq.deleted=0
   and aq.id=VIDPA
   ;
 
 
 
 
 
 UPDATE PDRMYE.PA SET DELETED= 1 WHERE ID IN (
                                                SELECT 
                                                       oper.idPA
                                                       FROM 
                                                       PDRMYE.TblIntegraOper oper
                                                       INNER JOIN PDRMYE.PA asb on oper.idPA = asb.id  
                                             );
 
TRUNCATE TABLE PDRMYE.TblIntegraOper;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
