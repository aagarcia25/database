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

-- Volcando estructura para procedimiento PDRMYE.sp_MigraOperacionesOrganismos
DELIMITER //
CREATE PROCEDURE `sp_MigraOperacionesOrganismos`()
BEGIN

DECLARE Respuesta INT;
DECLARE done INT DEFAULT FALSE;
DECLARE vsuma DECIMAL(30,2);
DECLARE VIDENTIFICADORCABECERA INT;
DECLARE VIDENTIFICADORDETALLE INT;
DECLARE VCOUNT INT;
DECLARE VIDORG CHAR(36);
-- se declara cursor para recorrer la informacion de la tabla    
DECLARE c1 CURSOR FOR (SELECT  DISTINCT	IDENTIFICADORC FROM PDRMYE.TblOrgOper WHERE IDENTIFICADORC IS NOT NULL);
DECLARE CONTINUE HANDLER FOR NOT FOUND,SQLEXCEPTION SET done = TRUE;
   
      

   
   
   
   
   
   
-- insertamos la cabecera 
   
OPEN c1;
  loopc1:LOOP
     fetch c1 INTO VIDENTIFICADORCABECERA;
   -- si no hay mas registros se sale del cursor
       if done then
       leave loopc1;
       END if;   
       
       
       
                      SELECT COUNT(1) INTO VCOUNT FROM PDRMYE.TblOrgOper tbl WHERE tbl.IDENTIFICADORCD =VIDENTIFICADORCABECERA;
       
                      if VCOUNT <> 0 then
                      
                  
                       
                        DELETE  t1,t2 FROM 
                        PDRMYE.ORGDetalle t1
                        INNER JOIN PDRMYE.ORG t2 ON t1.idORG = t2.id
                        WHERE t2.NumOrdenPago=VIDENTIFICADORCABECERA;
                     
                      END if;
                      
       
                       SELECT SUM( tbl.totaldetalle) into vsuma FROM PDRMYE.TblOrgOper tbl WHERE  tbl.IDENTIFICADORCD =VIDENTIFICADORCABECERA;
                       SELECT UUID() INTO VIDORG  ;  
                       INSERT INTO PDRMYE.ORG(
                        id,
                        idOrganismo,
                        ModificadoPor,
                        CreadoPor,
                        idEstatus,
                        Anio,
                        Mes,
                        total,
                        Observaciones,
                        NumProyecto,
                        Uresp,
                        clasificacion,
                        ConceptoCheque,
                        SolEgreso,
                        NumEgreso,
                        NumOrdenPago,
                        NumReqAnticipo,
                        NumAportacion,
                        Cuenta,
                        TipoSolicitud
                        )  
                       SELECT 
                        distinct
                        VIDORG,
                        org.id,
                        tbl.CreadoPor,
                        tbl.CreadoPor,
                        '4d730222-b478-11ed-9bd4-2c4138b7dab1',
                        tbl.Anio,
                        mes.mes,
                        vsuma,
                        tbl.Observaciones,
                        tbl.NumProyecto,
                        ures.id,
                        tbl.clasificacion,
                        tbl.ConceptoCheque,
                         trim(tbl.SolEgreso),
                        trim(tbl.NumEgreso),
                        trim(tbl.NumOrdenPago),
                        trim(tbl.ReqAnticipo),
                        trim(tbl.Aportacion),
                        tbl.Cuenta,
                        case tipo  
                               when 'Solicitud egreso' then 1
                               when 'Egreso' then 2
                               when 'Aportación' then 3
                               when 'Requerimiento de anticipo' then 4
                        END AS tipo
                        FROM PDRMYE.TblOrgOper tbl
                        JOIN PDRMYE.Organismos org ON tbl.Proveedor = org.ClavePSIREGOB
                        JOIN PDRMYE.Meses mes ON mes.mes = tbl.Mes
                        JOIN PDRMYE.UResponsable ures ON UPPER(ures.Clave) = UPPER(tbl.Uresp)
                        WHERE tbl.IDENTIFICADORC=VIDENTIFICADORCABECERA;
 
 
 
                  
                                INSERT INTO PDRMYE.ORGDetalle(
                                 ModificadoPor,
                                 CreadoPor,
                                 idORG,
                                 Descripcion,
                                 Clasificador01,
                                 Clasificador02,
                                 Clasificador03,
                                 Clasificador04,
                                 Clasificador05,
                                 Clasificador06,
                                 Clasificador07,
                                 Clasificador08,
                                 Clasificador09,
                                 Clasificador10,
                                 Clasificador11,
                                 importe,
                                 ConceptoEgreso
                                  )
                                   SELECT 
                                         tbl.CreadoPor,
                                         tbl.CreadoPor,
                                         VIDORG,
                                         tbl.Descripcion,
                                         tbl.Clasificador01,
                                         tbl.Clasificador02,
                                         tbl.Clasificador03,
                                         tbl.Clasificador04,
                                         tbl.Clasificador05,
                                         tbl.Clasificador06,
                                         tbl.Clasificador07,
                                         tbl.Clasificador08,
                                         tbl.Clasificador09,
                                         tbl.Clasificador10,
                                         tbl.Clasificador11,
                                         tbl.totaldetalle,
                                         cce.id
                                   FROM PDRMYE.TblOrgOper tbl 
                                   INNER JOIN PDRMYE.CatConceptoEgreso cce ON upper(trim(tbl.ConceptoEgreso)) = upper(trim(cce.Descripcion))
                                   where tbl.IDENTIFICADORCD =VIDENTIFICADORCABECERA;
                                   
                                   
                                   
                                   
                                   
                                   
                  
    END loop loopc1;
CLOSE c1;
   
   	SET Respuesta = 200;
		SELECT Respuesta,'éxito' AS Mensaje;	

      
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
