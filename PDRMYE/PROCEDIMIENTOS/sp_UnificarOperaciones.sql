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

-- Volcando estructura para procedimiento PDRMYE.sp_UnificarOperaciones
DELIMITER //
CREATE PROCEDURE `sp_UnificarOperaciones`()
BEGIN

 DECLARE VIDPA CHAR(36);
 DECLARE VTOTAL DECIMAL(30,2);
 DECLARE VIDUSER CHAR(36);
 DECLARE VCLAVEESTADO  INT;
 DECLARE	VIDMUNICIPIO  CHAR(36);
 DECLARE	VIDESTATUS   CHAR(36);
 DECLARE	VIDTIPOPARTICIPACION  CHAR(36);
 DECLARE	VANIO  INT;
 DECLARE	VMES INT;
 DECLARE	VNUMPROYECTO VARCHAR(7);
 DECLARE	VCONCEPTOCHEQUE CHAR(36);
 DECLARE	VIDDIVISA CHAR(36);
 DECLARE	VURESP CHAR(36);
 DECLARE	VCLASIFICACION VARCHAR(50);
 
 
 
 SELECT UUID() INTO VIDPA FROM DUAL;

 -- SE OBTIENE EL TOTAL
 SELECT 
 SUM(total),oper.idusuario INTO VTOTAL,VIDUSER
 FROM 
 PDRMYE.TblUnificaRegistro oper
 INNER JOIN PDRMYE.PA asb on oper.idPA = asb.id
 ;  
 
 

SELECT 
  distinct
	aq.ClaveEstado,
	aq.idMunicipio,
	aq.idEstatus,
	aq.idTipoParticipacion,
	aq.Anio,
	aq.Mes,
	aq.NumProyecto,
	aq.ConceptoCheque,
	aq.idDivisa,
	aq.Uresp,
	aq.clasificacion INTO 
   VCLAVEESTADO  ,VIDMUNICIPIO ,VIDESTATUS ,VIDTIPOPARTICIPACION ,VANIO ,VMES,VNUMPROYECTO,VCONCEPTOCHEQUE,VIDDIVISA ,VURESP,VCLASIFICACION 
   FROM PDRMYE.PA aq
   WHERE 1=1
   and aq.deleted=0
   and aq.id IN (  SELECT 
                                                       oper.idPA
                                                       FROM 
                                                       PDRMYE.TblUnificaRegistro oper
                                                       INNER JOIN PDRMYE.PA asb on oper.idPA = asb.id  )
   ;
   
 
   INSERT INTO PDRMYE.PA(
   id,
   CreadoPor,   ModificadoPor,
	ClaveEstado,
	idMunicipio,
	idEstatus,
	idTipoParticipacion,
	Anio,
	Mes,
	ClavePresupuestal,
	total,
	NumProyecto,
	ConceptoCheque,
	idDivisa,
	Uresp,
	Clasificacion,
   Integrado,
   Detalle
    )
   SELECT 
   VIDPA,
   VIDUSER,   VIDUSER,
   VCLAVEESTADO,
	VIDMUNICIPIO,
	VIDESTATUS,
	VIDTIPOPARTICIPACION,
	VANIO,
	VMES,
	'Múltiples Fondos',
	VTOTAL,
	VNUMPROYECTO,
	VCONCEPTOCHEQUE,
   VIDDIVISA,
	VURESP,
   VCLASIFICACION,
   1,
   1
   FROM dual
   ;
 
 
  INSERT INTO PDRMYE.PADetalle(ModificadoPor,CreadoPor,idPA,idPadre)
  SELECT  VIDUSER,VIDUSER,oper.idPA,VIDPA
  FROM 
  PDRMYE.TblUnificaRegistro oper
  INNER JOIN PDRMYE.PA asb on oper.idPA = asb.id ; 
 
 
 UPDATE PDRMYE.PA SET DELETED= 1 WHERE ID IN (
                                                SELECT 
                                                       oper.idPA
                                                       FROM 
                                                       PDRMYE.TblUnificaRegistro oper
                                                       INNER JOIN PDRMYE.PA asb on oper.idPA = asb.id  
                                             );
 

TRUNCATE TABLE PDRMYE.TblUnificaRegistro;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
