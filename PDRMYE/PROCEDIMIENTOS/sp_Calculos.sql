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

-- Volcando estructura para procedimiento PDRMYE.sp_Calculos
DROP PROCEDURE IF EXISTS `sp_Calculos`;
DELIMITER //
CREATE PROCEDURE `sp_Calculos`(
	IN `P_FONDO` VARCHAR(50),
	IN `P_USUARIO` CHAR(36),
	IN `P_IMPORTE` DECIMAL(60,2),
	IN `P_ANIO` INT,
	IN `P_MES` INT,
	IN `P_ZERO` TINYINT,
	IN `P_IEJA` DECIMAL(20,6),
	IN `P_TIPOCALCULO` CHAR(36),
	IN `P_IDVERSION` CHAR(36),
	IN `P_DIST` TINYINT
)
BEGIN

/*
SECCION DONDE SE DECLARAN LAS VARIABLES GLOBALES A UTILIZAR 
EN LOS DIFERENTES  CALCULOS DE LOS FONDOS
*/
 DECLARE VVERSION CHAR(36);
 DECLARE VIDAREA CHAR(36);
 DECLARE VIDPERFIL CHAR(36);
 DECLARE VANIO_POBLACION INT DEFAULT 0; -- GUARDA EL ULTIMO AÑO DE LA POBLACION VIGENTE
 DECLARE VTOTAL DECIMAL(30,2);
 DECLARE VIDFONDO CHAR(36);
 DECLARE VIDCALPRIN CHAR(36);
 DECLARE VANIOGARANTIA INT;
 DECLARE VIDESTATUS CHAR(36);
 DECLARE VANIO INT;
 DECLARE VTOTAL_POBLACION INT DEFAULT 0;
 DECLARE VSUMAICV INT;
 DECLARE VMES INT;
 DECLARE VUMA DECIMAL(30,2);
 DECLARE VICVMUL DECIMAL(30,2);
 DECLARE VSUMAGARANTIA DECIMAL(30,2);
 /*ICV*/
 DECLARE VSUMMOV INT;
 DECLARE VTOTALICV DECIMAL(30,2);
 DECLARE VTOTALISN DECIMAL(30,10);
 DECLARE VTOTALISAN DECIMAL(30,2);
 DECLARE VPORCENTAJE DECIMAL(30,2);
/*FISM*/
 DECLARE VSUMFISM2013       DECIMAL(30,20);
 DECLARE VSUMFISMPERSONAS1  DECIMAL(30,20);
 DECLARE VSUMFISMPERSONAS2  DECIMAL(30,20);
 DECLARE COEFICIENTE_COMPOB DECIMAL(30,20);
 DECLARE VVALOR DECIMAL (30,20);
 /*VERSIONES DE FRACCIONES DE ARTICULOS*/
 DECLARE ARTF1 CHAR(36);
 DECLARE ARTF2 CHAR(36);
 DECLARE ARTF3 CHAR(36);
 
  /*FOSEGMUN*/
 
 DECLARE VVALORLE DECIMAL (30,20);
 declare VVALORJA DECIMAL (30,20);
 DECLARE VVALORSESTATALLE INT;
 DECLARE VVALORSESTATALJA INT;
 DECLARE VDIFERENCIALE DECIMAL (30,20);
 DECLARE VDIFERENCIAJA DECIMAL (30,20);
 DECLARE VDISTRMAMLE INT;
 DECLARE VDISTRMANMLE INT;
 DECLARE VDISTRMAMJA INT;
 DECLARE VDISTRMANMJA INT;
 DECLARE VTOTALPOBMAM INT;
 DECLARE VTOTALPOBMANM INT;
 DECLARE VTOTALDISTMAM INT;
 DECLARE VTOTALDISTMANM INT;
 DECLARE VVALORMAM decimal (30,20);
 DECLARE VVALORMANM decimal (30,20);
 DECLARE VMAM DECIMAL (30,20);
 DECLARE VMANM DECIMAL (30,20);
 DECLARE VF_DES_MPAL_MAM DECIMAL (30,20);
 DECLARE VF_DES_MPAL_MANM DECIMAL (30,20);
 DECLARE VPIGUALES DECIMAL (30,20);
 DECLARE VIGUALD DECIMAL(30,20);
 DECLARE VSUMAIGUALMAM DECIMAL (30,20);
 DECLARE VZMAM DECIMAL (30,20);
 DECLARE VART14F1 DECIMAL (30,20);
 DECLARE V0256I DECIMAL (30,20);
 DECLARE VSUM0256I DECIMAL (30,20);
 DECLARE VZMANM DECIMAL (30,20);
 DECLARE V0128I DECIMAL (30,20);
 DECLARE VSUM0128I DECIMAL (30,20);
 DECLARE VSUMA1_5_COFMANM DECIMAL (30,20);
 DECLARE VART14F1MANM DECIMAL (30,20);
  /*FOULT*/
 DECLARE VIGUAL DECIMAL (30,20);
 DECLARE VSUMIGUAL DECIMAL (30,20);
 DECLARE VRESTANTE DECIMAL (30,20);
 DECLARE V50RESTANTE DECIMAL (30,20);
 DECLARE VSUMPOB INT;
 DECLARE VTOTALPARTICIPACIONES DECIMAL(30,2);
 DECLARE VTOTALIEJA DECIMAL(30,2);
 DECLARE VLEYEGRESOS DECIMAL(30,2);
 DECLARE VSUMA1_5_COF DECIMAL(30,20);
 DECLARE VSUMA2_5_COF DECIMAL(30,20);
 DECLARE VTIPOCALCULO VARCHAR(50); 
 DECLARE VIF INT;
 /*
 SECCION PARA INICIALIZAR LAS VARIABLES GLOBALES A UTILIZAR 
 EN LOS DIFERENTES CALCULOS DE LOS FONDOS
 */
 BEGIN 

 SELECT REFERENCIA INTO VTIPOCALCULO FROM PDRMYE.TipoFondosCalculo WHERE ID=P_TIPOCALCULO;
 SELECT YEAR(NOW()) INTO VANIO FROM DUAL;
 SELECT Diario INTO VUMA FROM PDRMYE.Umas WHERE Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='UMA');
 SELECT cast(VALOR as INT)   -1  INTO VANIOGARANTIA FROM PDRMYE.ParametrosGenerales WHERE Nombre='ANIO_OPERACION';
 SELECT MONTH(NOW()) INTO VMES  FROM DUAL;
 SELECT MAX(munp.ANIO) INTO VANIO_POBLACION from PDRMYE.MunPoblacion  munp ;
 SELECT ID INTO VIDFONDO FROM PDRMYE.Fondos WHERE CLAVE=P_FONDO;
 SELECT ID INTO VIDESTATUS FROM PDRMYE.Estatus WHERE DESCRIPCION='INICIO' AND Proceso='6fbbcf10-4b39-11ed-a964-040300000000' ;
 SELECT UUID() INTO VIDCALPRIN FROM DUAL;
 SELECT id INTO VIDAREA FROM PDRMYE.Departamentos WHERE NombreCorto='CPH';
 SELECT id INTO VIDPERFIL  FROM PDRMYE.Perfil WHERE REFERENCIA='ANA';
 SELECT ap.id INTO ARTF1 FROM PDRMYE.ArticuloPrincipal  ap WHERE ap.deleted=0 AND ap.Clave=1 ;
 SELECT ap.id INTO ARTF2 FROM PDRMYE.ArticuloPrincipal  ap WHERE ap.deleted=0 AND ap.Clave=2 ;
 SELECT ap.id INTO ARTF3 FROM PDRMYE.ArticuloPrincipal  ap WHERE ap.deleted=0 AND ap.Clave=3 ;
 
 
 
  -- se obtiene el total de las participaciones pagadas
SELECT 
ifnull(SUM(cp.TotalCompleto),0) * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='DISTRI_PARTICIPACIONES')
INTO VTOTALPARTICIPACIONES
FROM 
PDRMYE.CalculoPrincipal cp
INNER JOIN PDRMYE.Fondos fon ON cp.ClaveFondo = fon.id
INNER JOIN PDRMYE.Estatus es ON es.id = cp.IdEstatus
WHERE cp.deleted=0
AND cp.anio = P_ANIO
AND cp.mes=   P_MES
AND fon.Aportacion=1
AND es.ControlInterno='DAMOP_INICIO' 
;
 
 
 END;
 
 
 

 
 
 
 
 
 
 
 
 
 
 

-- SI EL CALCULO DEBE DE GENERARSE EN CERO ENTRA EN ESTA VALIDACIÓN
IF P_ZERO = 1 THEN

-- INSERTAMOS EL CALCULO PRINCIPAL
 INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
 VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

 INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
 SELECT P_USUARIO,P_USUARIO,VIDCALPRIN,mun.ID,0 FROM  PDRMYE.Municipios mun WHERE mun.deleted=0 ;
 
ELSE
-- PROCESO NORMAL DE CALCULOS

SELECT 
sum(cal.Garantia) INTO VSUMAGARANTIA FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.CalculoGarantia cal ON mun.id = cal.idMunicipio
INNER JOIN PDRMYE.Fondos fondo ON cal.ClaveFondo = fondo.id
WHERE fondo.Clave=P_FONDO
AND cal.Anio=VANIOGARANTIA
;



IF P_FONDO = 'ICV' THEN

SELECT SUM(MOVIMIENTOS) INTO VSUMMOV FROM PDRMYE.MunRefrendos  WHERE ANIO=P_ANIO AND MES=P_MES;
SELECT VSUMMOV * VUMA * 0.60 INTO VTOTALICV FROM DUAL;
-- INSERTAMOS EL CALCULO PRINCIPAL
 
 INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
 VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT P_USUARIO,P_USUARIO,VIDCALPRIN,MUN.ID, (MUNR.MOVIMIENTOS/VSUMMOV) * VTOTALICV FROM 
PDRMYE.MunRefrendos MUNR
INNER JOIN PDRMYE.Municipios MUN ON MUN.ID = MUNR.IdMun
WHERE ANIO=P_ANIO AND MES=P_MES;
 
CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el total del cálculo');
TRUNCATE TABLE PDRMYE.MunRefrendos;


ELSEIF P_FONDO = 'HIDROCARBUROS' THEN

INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT P_USUARIO,P_USUARIO,VIDCALPRIN,MUN.ID,total FROM 
PDRMYE.MunRefrendos MUNR
INNER JOIN PDRMYE.Municipios MUN ON MUN.ID = MUNR.IdMun
WHERE ANIO=P_ANIO AND MES=P_MES;
 
CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el total del cálculo');
TRUNCATE TABLE PDRMYE.MunRefrendos;

ELSEIF P_FONDO = 'ISN100' THEN

 
 
 INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
 VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

INSERT INTO PDRMYE.CalculoTotalDetalle(
	CreadoPor,
	ModificadoPor,
	idCalculoTotal,
	IdMun,
	Mensual
)
SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
MUN.ID,
total
FROM 
PDRMYE.MunRefrendos MUNR
INNER JOIN PDRMYE.Municipios MUN ON MUN.ID = MUNR.IdMun
WHERE ANIO=P_ANIO AND MES=P_MES;
 
CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el total del cálculo');
TRUNCATE TABLE PDRMYE.MunRefrendos;

ELSEIF P_FONDO = 'PREDIAL' THEN

INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT 
P_USUARIO,P_USUARIO,VIDCALPRIN,MUN.ID,total
FROM 
PDRMYE.MunRefrendos MUNR
INNER JOIN PDRMYE.Municipios MUN ON MUN.ID = MUNR.IdMun
WHERE ANIO=P_ANIO AND MES=P_MES;
 
CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el total del cálculo');
TRUNCATE TABLE PDRMYE.MunRefrendos;


ELSEIF P_FONDO = 'ISN' THEN

SELECT PorcentajeDistribucion INTO VPORCENTAJE FROM PDRMYE.Fondos WHERE CLAVE=P_FONDO;
SELECT (VPORCENTAJE/100) * P_IMPORTE INTO VTOTALISN FROM DUAL;


INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT P_USUARIO,P_USUARIO,VIDCALPRIN,mun.id, VTOTALISN * cg.Distribucion FROM
PDRMYE.CalculoGarantia cg
INNER JOIN PDRMYE.Municipios mun ON mun.id = cg.idMunicipio
INNER JOIN PDRMYE.Fondos fon ON fon.id = cg.ClaveFondo
WHERE  fon.Clave='ISN'
AND cg.Anio = VANIOGARANTIA
;
CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el Total del Cálculo');



ELSEIF P_FONDO = 'ISR SALARIOS' THEN


SELECT SUM(isr.importe) INTO VTOTALISAN FROM PDRMYE.MunIsr isr WHERE isr.anio=P_ANIO AND isr.mes=P_MES;


INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);


INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT P_USUARIO,P_USUARIO,VIDCALPRIN,isr.IdMun,isr.importe FROM PDRMYE.MunIsr isr WHERE isr.anio=P_ANIO AND isr.mes=P_MES;
CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el Total del Cálculo');

ELSEIF P_FONDO = 'ISR INMUEBLES' THEN
SELECT PorcentajeDistribucion INTO VPORCENTAJE FROM PDRMYE.Fondos WHERE CLAVE=P_FONDO;
SELECT VPORCENTAJE/100 * P_IMPORTE INTO VTOTAL FROM DUAL;
SELECT SUM(isai.importe) INTO VTOTALISAN FROM PDRMYE.MunIsai isai WHERE deleted=0;


INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT P_USUARIO,P_USUARIO,VIDCALPRIN,isai.IdMun,(isai.importe /VTOTALISAN * VTOTAL) FROM PDRMYE.MunIsai isai WHERE deleted=0;
CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el Total del Cálculo');



ELSEIF P_FONDO = 'FGP' 
    OR P_FONDO = 'FFM70'
    OR P_FONDO = 'IEPS'
    OR P_FONDO = 'FOFIR'
    OR P_FONDO = 'ISAN'
    OR P_FONDO = 'FEXHI'
    OR P_FONDO = 'COMP ISAN'
    OR P_FONDO = 'FEIEF'
	 
THEN
-- SE OBTIENE EL PORCENTAJE A DISTRIBUIR

SELECT PorcentajeDistribucion INTO VPORCENTAJE FROM PDRMYE.Fondos WHERE CLAVE=P_FONDO;
SELECT VPORCENTAJE/100 * P_IMPORTE INTO VTOTAL FROM DUAL;
SELECT if((VTOTAL - VSUMAGARANTIA)<=0,1,2) INTO VIF;

INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);


IF VTIPOCALCULO = 'MENSUAL' THEN

IF  VIF = 1 THEN

INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
mun.id,
tbl_1.garantia 
FROM 
PDRMYE.Municipios mun 
INNER JOIN 
(
SELECT 
mun.id,
mun.Nombre,
cal.Distribucion * VTOTAL AS  garantia
 FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.CalculoGarantia cal ON mun.id = cal.idMunicipio
INNER JOIN PDRMYE.Fondos fondo ON cal.ClaveFondo = fondo.id
WHERE fondo.Clave=P_FONDO
AND cal.Anio = VANIOGARANTIA
)tbl_1 ON tbl_1.id = mun.id
;


ELSE


INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
mun.id,
tbl_1.garantia +tbl_2.total 
FROM 
PDRMYE.Municipios mun 
INNER JOIN 
(
SELECT 
mun.id,
mun.Nombre,
cal.Garantia
 FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.CalculoGarantia cal ON mun.id = cal.idMunicipio
INNER JOIN PDRMYE.Fondos fondo ON cal.ClaveFondo = fondo.id
WHERE fondo.Clave=P_FONDO
AND cal.Anio = VANIOGARANTIA
)tbl_1 ON tbl_1.id = mun.id
INNER JOIN 
(
SELECT 
ad.IdMunicipio AS id,
ad.A1_5_COF,
ad.A1_5_COF * (VTOTAL - VSUMAGARANTIA) AS total
FROM PDRMYE.ArticuloPrincipal ap
INNER JOIN PDRMYE.ArticuloDetalle ad ON ap.id = ad.idArticuloPrincipal
WHERE ap.deleted=0 AND ap.clave=1
)tbl_2 ON tbl_2.id = mun.id
;

END IF;

ELSE




  IF P_DIST = 0 THEN 

  INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
mun.id,
tbl_2.total 
FROM 
PDRMYE.Municipios mun 
INNER JOIN 
(
SELECT 
ad.IdMunicipio AS id,
ad.A1_5_COF,
ad.A1_5_COF * VTOTAL AS total
FROM PDRMYE.ArticuloPrincipal ap
INNER JOIN PDRMYE.ArticuloDetalle ad ON ap.id = ad.idArticuloPrincipal
WHERE ap.deleted=0 AND ap.clave=1
)tbl_2 ON tbl_2.id = mun.id
;

ELSE 

 INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
 SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
mun.id,
tbl_1.garantia 
FROM 
PDRMYE.Municipios mun 
INNER JOIN 
(
SELECT 
mun.id,
mun.Nombre,
cal.Distribucion * VTOTAL AS  garantia
 FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.CalculoGarantia cal ON mun.id = cal.idMunicipio
INNER JOIN PDRMYE.Fondos fondo ON cal.ClaveFondo = fondo.id
WHERE fondo.Clave=P_FONDO
AND cal.Anio = VANIOGARANTIA
)tbl_1 ON tbl_1.id = mun.id
;





END IF;





END IF;




  CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el Total del Cálculo');

ELSEIF P_FONDO = 'FFM30' THEN

SELECT PorcentajeDistribucion INTO VPORCENTAJE FROM PDRMYE.Fondos WHERE CLAVE=P_FONDO;
-- SELECT VPORCENTAJE/100 * P_IMPORTE INTO VTOTAL FROM DUAL;

INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT
P_USUARIO,
P_USUARIO,
VIDCALPRIN, 
mun.id,
tbl.A1_5_COF * P_IMPORTE
FROM 
PDRMYE.Municipios mun
INNER JOIN (
SELECT 
ad.IdMunicipio,
ad.A1_5_COF
FROM PDRMYE.ArticuloPrincipal ap
INNER JOIN PDRMYE.ArticuloDetalle ad ON ap.id = ad.idArticuloPrincipal
WHERE ap.id=P_IDVERSION AND ap.clave=3
) tbl ON tbl.IdMunicipio = mun.id
;


CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el Total del Cálculo');

ELSEIF P_FONDO = 'IEPSGyD' THEN


-- SE OBTIENE EL PORCENTAJE A DISTRIBUIR
SELECT PorcentajeDistribucion INTO VPORCENTAJE FROM PDRMYE.Fondos WHERE CLAVE=P_FONDO;
SELECT VPORCENTAJE/100 * P_IMPORTE INTO VTOTAL FROM DUAL;
-- SELECT VTOTAL - VSUMAGARANTIA INTO VTOTAL FROM DUAL;
-- INSERTAMOS EL CALCULO PRINCIPAL

INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);


-- INSERTAMOS EL DETALLE DEL CALCULO 
INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,	idCalculoTotal,	IdMun,	Mensual)
SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
mun.id,
tbl_2.total 
FROM 
PDRMYE.Municipios mun 
INNER JOIN 
(
SELECT 
ad.IdMunicipio AS id,
ad.A2_6_COF,
(ad.A2_6_COF  * VTOTAL )AS total
FROM PDRMYE.ArticuloPrincipal ap
INNER JOIN PDRMYE.ArticuloDetalle ad ON ap.id = ad.idArticuloPrincipal
WHERE ap.deleted=0 AND ap.clave=2
)tbl_2 ON tbl_2.id = mun.id
;
CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el Total del Cálculo');


ELSEIF P_FONDO ='FORTAMUN' THEN

/*CALCULO*/

SELECT 
SUM(munp.totalPob) INTO VSUMA1_5_COF 
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPoblacion munp ON mun.id = munp.IdMun AND munp.Anio=VANIO_POBLACION;


       
-- INSERTAMOS EL CALCULO PRINCIPAL

INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

INSERT INTO PDRMYE.CalculoTotalDetalle(CreadoPor, ModificadoPor,idCalculoTotal,IdMun,Mensual )
         SELECT 
         P_USUARIO,
         P_USUARIO,
         VIDCALPRIN,
         mun.id,
         (munp.totalPob  / VSUMA1_5_COF )
         * 
			 P_IMPORTE 
          FROM PDRMYE.Municipios mun
          INNER JOIN PDRMYE.MunPoblacion munp ON mun.id= munp.IdMun AND munp.Anio=VANIO_POBLACION;
        
 CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el Total del Cálculo');
       
	
ELSEIF P_FONDO = 'FISM' THEN

SELECT valor   INTO VVALOR            FROM PDRMYE.ParametrosGenerales WHERE Nombre='FISM_MESES';
SELECT SUM(garantia)        INTO VSUMFISM2013      FROM PDRMYE.CalculoGarantia cg WHERE cg.ClaveFondo=VIDFONDO AND cg.anio=2013; 
SELECT SUM(personas)       INTO VSUMFISMPERSONAS1 FROM PDRMYE.MunPobrezaExt p1 WHERE p1.Anio= (SELECT valor   FROM PDRMYE.ParametrosGenerales WHERE Nombre='FISM_POBLACION_2'); 

SELECT 
SUM((p1.CarenciaProm * p1.Personas) / VSUMFISMPERSONAS1    )
 INTO COEFICIENTE_COMPOB FROM PDRMYE.Municipios mun INNER JOIN PDRMYE.MunPobrezaExt p1 
WHERE p1.Anio=(SELECT valor   FROM PDRMYE.ParametrosGenerales WHERE Nombre='FISM_POBLACION_2')
AND mun.id = p1.IdMun; 

SELECT 
sum(p1.Personas / p2.Personas) INTO VSUMFISMPERSONAS2
FROM PDRMYE.Municipios mun 
INNER JOIN PDRMYE.MunPobrezaExt p1 on p1.Anio=(SELECT valor   FROM PDRMYE.ParametrosGenerales WHERE Nombre='FISM_POBLACION_1')
AND mun.id = p1.IdMun 
INNER JOIN PDRMYE.MunPobrezaExt p2 ON  p2.Anio=(SELECT valor   FROM PDRMYE.ParametrosGenerales WHERE Nombre='FISM_POBLACION_2')
AND mun.id = p2.IdMun ;


-- INICIO DE OPERACION 
SELECT UUID() INTO VIDCALPRIN FROM DUAL;     
-- INSERTAMOS EL CALCULO PRINCIPAL
    


INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

INSERT INTO PDRMYE.CalculoTotalDetalle(	     CreadoPor,	     idCalculoTotal,	     IdMun,	     Mensual        )
        
        SELECT
        P_USUARIO,
        VIDCALPRIN,
        mun.id,
       
	 ((cg.Garantia/VVALOR) + (P_IMPORTE - (VSUMFISM2013/VVALOR) ) * ((0.8* COMPOB.a ) + ( 0.2* COMEFI.a )) )  
     
         FROM 
         PDRMYE.Municipios mun
         INNER JOIN PDRMYE.CalculoGarantia cg  ON cg.idMunicipio = mun.id AND cg.Anio=2013
         INNER JOIN 
          (
           SELECT 
            mun.id,
             (p1.CarenciaProm * p1.Personas / VSUMFISMPERSONAS1 ) / COEFICIENTE_COMPOB as a
            FROM PDRMYE.Municipios mun 
            INNER JOIN PDRMYE.MunPobrezaExt p1 WHERE p1.Anio= (SELECT valor   FROM PDRMYE.ParametrosGenerales WHERE Nombre='FISM_POBLACION_2')  AND mun.id = p1.IdMun 
          ) COMPOB ON COMPOB.id = mun.id
          INNER JOIN 
          (
           SELECT 
            mun.id,
            (p1.Personas / p2.Personas)/ VSUMFISMPERSONAS2  AS a
            FROM PDRMYE.Municipios mun 
            INNER JOIN PDRMYE.MunPobrezaExt p1 on p1.Anio= (SELECT valor   FROM PDRMYE.ParametrosGenerales WHERE Nombre='FISM_POBLACION_1')  AND mun.id = p1.IdMun 
            INNER JOIN PDRMYE.MunPobrezaExt p2 ON  p2.Anio=(SELECT valor   FROM PDRMYE.ParametrosGenerales WHERE Nombre='FISM_POBLACION_2')  AND mun.id = p2.IdMun  
           )COMEFI ON COMEFI.id = mun.id;           
        
CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el Total del Cálculo');
      

     
							




-- APORTACIONES ESTATALES

ELSEIF P_FONDO = 'FOSEGMUN' THEN 

 -- CÁLCULO DE DISTRIBUCIÓN DEL FONDO PARA SEGURIDAD PARA LOS MUNICIPIOS
  SELECT SUM(mp.totalPob) INTO VTOTALPOBMAM  FROM PDRMYE.Municipios mun INNER JOIN PDRMYE.MunPoblacion mp on mun.id = mp.IdMun  WHERE MAM = 1 AND mp.anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION'); -- TOTAL POBLACION MAM
  SELECT SUM(mp.totalPob) INTO VTOTALPOBMANM FROM PDRMYE.Municipios mun INNER JOIN PDRMYE.MunPoblacion mp on mun.id = mp.IdMun  WHERE MAM = 0 AND mp.anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION'); -- TOTAL POBLACION 
  SELECT valor   / 12  INTO VVALORLE FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOSEGMUN_DISTRI_EQUITAT_L_EGRESOS';
  SELECT valor   / 12  INTO VVALORJA FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOSEGMUN_DISTRI_EQUITAT_EROG_JAPUESTA';
   
  SELECT (VTOTALPARTICIPACIONES * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOSEGMUN_%DISTRIBUCION')) / 100  into VTOTAL FROM DUAL;
  SELECT P_IEJA * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOSEGMUN_DISTRIBUCION_IEJA')   into VTOTALIEJA FROM DUAL;	 
    
    
  -- INSERTAMOS EL CALCULO PRINCIPAL

INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);
  
INSERT INTO PDRMYE.CalculoTotalDetalle(CreadoPor,ModificadoPor,idCalculoTotal,IdMun,Mensual)
SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
tbl.IdMun,
tbl.a
FROM 
(  
SELECT 
  mun.MAM,
  mun.id as IdMun,
   VVALORLE +
   (VTOTAL - (VVALORLE * 51 ) )     * 0.6    * (munp.totalPob / VTOTALPOBMAM ) +
   VVALORJA +
  (VTOTALIEJA - (VVALORJA * 51 ))  * 0.6    * (munp.totalPob / VTOTALPOBMAM ) AS a
  FROM Municipios mun
  INNER JOIN PDRMYE.MunPoblacion munp ON  mun.id = munp.IdMun AND munp.Anio = (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION')
  WHERE 
  1=1
  AND mun.MAM=1
  
UNION 
SELECT
 mun.MAM,
  mun.id as IdMun,
  VVALORLE +
  (VTOTAL - (VVALORLE * 51 ) )     * 0.4    * (munp.totalPob / VTOTALPOBMANM ) +
  VVALORJA +
  (VTOTALIEJA - (VVALORJA * 51 ))  * 0.4    * (munp.totalPob / VTOTALPOBMANM ) AS a
  FROM Municipios mun
  INNER JOIN PDRMYE.MunPoblacion munp ON  mun.id = munp.IdMun AND munp.Anio = (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION')
  WHERE 
  1=1
  AND mun.MAM=0
  
  )tbl ;
    
    
 CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el total del cálculo'); 





 ELSEIF P_FONDO = 'FODES' THEN 
 

SELECT VALOR INTO VLEYEGRESOS FROM PDRMYE.ParametrosGenerales WHERE Nombre='LEY_EGRESOS';
 
SELECT VTOTALPARTICIPACIONES * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FODES_MPAL_MANM') / 100 into VTOTAL FROM DUAL;
 
IF VTOTAL > VLEYEGRESOS THEN
SELECT VTOTAL INTO VTOTAL;
ELSE 
SELECT VLEYEGRESOS INTO VTOTAL;
END IF;


SELECT 
SUM(ad.A1_5_COF) INTO VVALORMAM
FROM Municipios mun  
inner join ArticuloDetalle ad ON mun.id = ad.IdMunicipio 
INNER JOIN ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal
WHERE  mun.MAM=1 AND ap.deleted = 0   AND ap.Clave=1; 
 
SELECT 
SUM(ad.A1_5_COF)  INTO VVALORMANM
FROM Municipios mun  
inner join ArticuloDetalle ad ON mun.id = ad.IdMunicipio 
INNER JOIN ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal
WHERE  mun.MAM=0 AND ap.deleted = 0   AND ap.Clave=1; 
 


 -- INSERTAMOS EL CALCULO PRINCIPAL


INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);
 
INSERT INTO PDRMYE.CalculoTotalDetalle(	CreadoPor,	ModificadoPor,		idCalculoTotal,			IdMun,				Mensual			)
SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
tbl.IdMun,
tbl.RESULT	
FROM 				
(		
  SELECT 
  mun.MAM,
  mun.id as IdMun,
  mun.Nombre,
  cg.Garantia,
  (ad.A1_5_COF / VVALORMAM ) * (VTOTAL * 0.60), 
  (CASE WHEN ( cg.Garantia / 12) > ((ad.A1_5_COF / VVALORMAM ) * (VTOTAL * 0.60)) THEN
   cg.Garantia/12
    ELSE  
   (ad.A1_5_COF / VVALORMAM ) * (VTOTAL * 0.60) 
    END)
    AS RESULT
  FROM Municipios mun
  INNER JOIN ArticuloDetalle ad ON mun.id = ad.IdMunicipio
  INNER JOIN PDRMYE.ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal AND ap.deleted =0 AND ap.Clave=1
  INNER JOIN CalculoGarantia cg ON mun.id = cg.idMunicipio  AND cg.deleted=0
  INNER JOIN PDRMYE.Fondos fondo ON cg.ClaveFondo = fondo.id
  WHERE 
  1=1
  AND fondo.Clave = P_FONDO
  AND mun.MAM=1
 
  UNION ALL
  
  SELECT 
  mun.MAM,
  mun.id as IdMun,
  mun.Nombre,
  cg.Garantia,
  (ad.A1_5_COF / VVALORMANM ) * (VTOTAL * 0.40),
  (CASE WHEN ( cg.Garantia/ 12) > ((ad.A1_5_COF / VVALORMANM ) * (VTOTAL * 0.40)) THEN cg.Garantia /12 ELSE  (ad.A1_5_COF / VVALORMANM ) * (VTOTAL * 0.40)  END) AS RESULT
  FROM Municipios mun
  INNER JOIN ArticuloDetalle ad ON mun.id = ad.IdMunicipio
  INNER JOIN PDRMYE.ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal AND ap.deleted =0 AND ap.Clave=1
  INNER JOIN CalculoGarantia cg ON mun.id = cg.idMunicipio   AND cg.deleted=0
  INNER JOIN PDRMYE.Fondos fondo ON cg.ClaveFondo = fondo.id
  WHERE 
  1=1
  AND fondo.Clave = P_FONDO
  AND mun.MAM=0
  
   )tbl
  ;

		
  CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el total del cálculo');
 	
 	
 ELSEIF P_FONDO = 'FODEM' THEN 
 -- CÁLCULO DE DISTRIBUCIÓN DEL FONDO DESARROLLO MUNICIPAL
 SELECT (VTOTALPARTICIPACIONES * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FODEM_%DISTRIBUCION')) / 100  into VTOTAL FROM DUAL;
 
 
 SELECT 
 SUM(ad.A1_5_COF) INTO VVALORMAM
 FROM Municipios mun  
 inner join ArticuloDetalle ad ON mun.id = ad.IdMunicipio 
 INNER JOIN ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal
 WHERE  mun.MAM=1 AND ap.deleted = 0   AND ap.Clave=1; 
 
 SELECT 
 SUM(ad.A1_5_COF)  INTO VVALORMANM
 FROM Municipios mun  
 inner join ArticuloDetalle ad ON mun.id = ad.IdMunicipio 
 INNER JOIN ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal
 WHERE  mun.MAM=0 AND ap.deleted = 0   AND ap.Clave=1; 


 
 SELECT  
  SUM((VTOTAL * 0.6) * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FODEM_%DISTRIBUCION_IGUALDAD') / 100) INTO VSUMA1_5_COF
  FROM Municipios mun
  INNER JOIN ArticuloDetalle ad ON mun.id = ad.IdMunicipio
  INNER JOIN PDRMYE.ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal AND ap.deleted =0 AND ap.Clave=1 
  WHERE 
  1=1
  AND mun.MAM=1;
  
   SELECT  
  SUM((VTOTAL * 0.4) * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FODEM_%DISTRIBUCION_IGUALDAD_MANM') / 100) INTO VSUMA2_5_COF
  FROM Municipios mun
  INNER JOIN ArticuloDetalle ad ON mun.id = ad.IdMunicipio
  INNER JOIN PDRMYE.ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal AND ap.deleted =0 AND ap.Clave=1 
  WHERE 
  1=1
  AND mun.MAM=0;
  
  
  

 
INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

 INSERT INTO PDRMYE.CalculoTotalDetalle(CreadoPor,	ModificadoPor,	idCalculoTotal,IdMun,Mensual) 
 SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
tbl.IdMun,
tbl.RESULT	
FROM 	 
  (
  SELECT 
  mun.id as IdMun,
  (VTOTAL * 0.6) * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FODEM_%DISTRIBUCION_IGUALDAD') / 100
  +
  (ad.A1_5_COF / VVALORMAM ) * ((VTOTAL * 0.6) - VSUMA1_5_COF ) RESULT
  
  FROM Municipios mun
  INNER JOIN ArticuloDetalle ad ON mun.id = ad.IdMunicipio
  INNER JOIN PDRMYE.ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal AND ap.deleted =0 AND ap.Clave=1 
  WHERE 
  1=1
  AND mun.MAM=1
  
  UNION ALL
  
   SELECT 
   mun.id as IdMun,
  (VTOTAL * 0.4) * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FODEM_%DISTRIBUCION_IGUALDAD_MANM') / 100
  +
  (ad.A1_5_COF / VVALORMANM ) * ((VTOTAL * 0.4) - VSUMA2_5_COF ) RESULT
  
  FROM Municipios mun
  INNER JOIN ArticuloDetalle ad ON mun.id = ad.IdMunicipio
  INNER JOIN PDRMYE.ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal AND ap.deleted =0 AND ap.Clave=1 
  WHERE 
  1=1
  AND mun.MAM=0
  )tbl
  
  ;
  
  
 


CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el total del cálculo');
	


ELSEIF P_FONDO = 'FOULT' THEN 
 -- CÁLCULO DE DISTRIBUCIÓN DEL FONDO ULTRA CRECIMIENTO
 
 select VTOTALPARTICIPACIONES * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_%DISTRIBUCION')/100 into VTOTAL FROM DUAL;
 SELECT VTOTAL * valor /100 into VIGUAL from PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_F_ULTRA_CREC'; 
 SELECT  VTOTAL - SUM(VIGUAL)  INTO V50RESTANTE FROM PDRMYE.Municipios mun WHERE mun.UltraCrecimiento=1;
 
 SELECT 
 SUM(ad.A1_5_COF)  INTO VSUMA1_5_COF
 FROM Municipios mun  
 inner join ArticuloDetalle ad ON mun.id = ad.IdMunicipio 
 INNER JOIN ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal
 WHERE  ap.deleted = 0  AND mun.UltraCrecimiento = 1 AND ap.Clave=1; 
 
 
-- INSERTAMOS EL CALCULO PRINCIPAL
 
INSERT INTO PDRMYE.CalculoPrincipal(TotalCompleto,id,idEstatus,ClaveFondo,Anio,Mes,ModificadoPor,CreadoPor,Comentario,idAreaAsignado,idPerfilAsignado,idtipo,IdVersionCalculada,IdUsuarioAsignado)
VALUES(P_IMPORTE,VIDCALPRIN,VIDESTATUS,VIDFONDO,P_ANIO,P_MES,P_USUARIO,P_USUARIO,'Inicio de Cálculo',VIDAREA ,VIDPERFIL,P_TIPOCALCULO,ARTF1,P_USUARIO);

 
 INSERT INTO PDRMYE.CalculoTotalDetalle(CreadoPor,	ModificadoPor,	idCalculoTotal,IdMun,Mensual) 
 SELECT 
 P_USUARIO,
 P_USUARIO,
 VIDCALPRIN,
 mun.id,
 VIGUAL +
 (V50RESTANTE/2) * (mp.totalPob / ( 
 SELECT sum(mp.totalPob) FROM PDRMYE.Municipios mun	
 INNER JOIN PDRMYE.MunPoblacion mp ON mun.id = mp.IdMun WHERE mun.UltraCrecimiento = 1
 AND mp.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION')
 ) ) 
 +
 (V50RESTANTE/2) *  (ad.A1_5_COF /  VSUMA1_5_COF)  AS c
 
 FROM PDRMYE.Municipios mun
 INNER JOIN PDRMYE.MunPoblacion mp ON mun.id = mp.IdMun
 INNER JOIN PDRMYE.ArticuloDetalle ad ON mun.id = ad.IdMunicipio
 INNER JOIN ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal AND ap.deleted = 0 AND ap.Clave=1
 WHERE 
 mun.UltraCrecimiento =1	
 AND mp.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION')
 ;
			
 CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALPRIN,'Se actualiza el total del cálculo');	


END IF;


END IF;




END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
