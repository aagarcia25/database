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

-- Volcando estructura para procedimiento PDRMYE.sp_Articulos
DROP PROCEDURE IF EXISTS `sp_Articulos`;
DELIMITER //
CREATE PROCEDURE `sp_Articulos`(
	IN `P_CLAVE` INT,
	IN `P_USUARIO` CHAR(36),
	IN `P_ANIO` INT,
	IN `P_IMPORTE` DECIMAL(20,2)
)
    COMMENT 'Procedimiento que se encarga de generar los articulos utilizados por el calculo'
BEGIN

DECLARE VIDANT CHAR(36);
DECLARE VID CHAR(36);
DECLARE VNUMVERSION INT;
 -- ART 1 F3
DECLARE VSUMA_ER DECIMAL(30,20);
DECLARE VSUMA_TASA DECIMAL(30,20); 
DECLARE VSUMA_R DECIMAL(30,20);
DECLARE VTOTAL_POBLACION_POBREZA  DECIMAL(30,20);
DECLARE VTOTAL_F1 DECIMAL(30,20);
DECLARE VTOTAL_F3 DECIMAL(30,20);
DECLARE VTOTAL_ERP  DECIMAL(30,20);
DECLARE VTOTALPOBREZA  DECIMAL(30,20);
DECLARE VTOTALINTENSIDAD  DECIMAL(30,20);
DECLARE VTOTALINTENSIDAD2  DECIMAL(30,20);
DECLARE VSUMAMEJORA  DECIMAL(30,20);
DECLARE VSUMADIP     DECIMAL(30,20);
DECLARE VTOTALEDPM  DECIMAL(30,20);
-- ART 1 F1
DECLARE VTOTALEFICIENTE  DECIMAL(30,20);
-- ART 1 F2
DECLARE VTOTALF2  DECIMAL(30,20);
DECLARE VTOTAL_KM DECIMAL(30,20);
DECLARE VTOTAL_POBLACION_PROYECCION DECIMAL(30,20);
DECLARE VTOTAL_POBLACION  DECIMAL(30,20);


SET div_precision_increment = 20;
SELECT VERSION  into VNUMVERSION FROM PDRMYE.ArticuloPrincipal WHERE Clave=P_CLAVE AND deleted=0;
SELECT UUID() INTO VID FROM DUAL;

IF P_CLAVE = 1 THEN

BEGIN



SELECT SUM(mun.Km2) INTO VTOTAL_KM FROM PDRMYE.MunTerritorio mun WHERE mun.deleted=0;

SELECT 
sum(munp2.totalPob) INTO VTOTAL_POBLACION
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPoblacion munp2 ON mun.id = munp2.IdMun AND munp2.deleted=0 AND munp2.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PO') 
where mun.deleted=0
AND   munp2.deleted=0
;


SELECT 
SUM(munp.Total)  INTO VTOTAL_POBLACION_POBREZA 
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPobreza munp ON mun.id = munp.IdMun AND munp.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP1i') 
where mun.deleted=0
AND munp.deleted=0
;


SELECT 
sum(munp2.Total) INTO VTOTALPOBREZA
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPobreza munp2 ON mun.id = munp2.IdMun AND munp2.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP1i') 
where mun.deleted=0
AND munp2.deleted=0
;

SELECT
SUM((munr.Recaudacion /munf.Facturacion) * munr.Recaudacion )INTO VTOTALEFICIENTE
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunFacturacion munf ON mun.id = munf.IdMun AND munf.Anio =(SELECT VALOR -1 FROM PDRMYE.ParametrosGenerales WHERE Nombre='BGt') 
INNER JOIN PDRMYE.MunRecaudacion munr ON mun.id = munr.IdMun AND munr.Anio =(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
where munf.deleted=0
AND munr.deleted=0
AND mun.deleted=0
ORDER BY mun.ClaveEstado ASC;

SELECT 
sum(munp2.CarenciaProm * munp2.Total /VTOTALPOBREZA) INTO VTOTALINTENSIDAD
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPobreza munp2 ON mun.id = munp2.IdMun AND munp2.deleted=0   AND munp2.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP1i') 
where munp2.deleted=0
AND mun.deleted=0

;

SELECT 
SUM(munp2.CarenciaProm * (munp2.Total / VTOTALPOBREZA)) INTO VTOTALINTENSIDAD2
FROM
PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPobreza munp2 ON mun.id = munp2.IdMun AND munp2.deleted=0   AND munp2.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP1i') 
where mun.deleted=0
AND munp2.deleted=0
;


SELECT 
sum(munp1.Total / munp2.Total)INTO VSUMAMEJORA
FROM
PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPobreza munp1 ON mun.id = munp1.IdMun AND munp1.deleted=0  AND munp1.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP2i')   
INNER JOIN PDRMYE.MunPobreza munp2 ON mun.id = munp2.IdMun AND munp2.deleted=0  AND munp2.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP1i')
where mun.deleted=0
AND munp1.deleted=0 
AND munp2.deleted=0 
;


SELECT 
SUM(
(P_IMPORTE *  0.25) * 0.85 * ((munp2.CarenciaProm * (munp2.Total / VTOTALPOBREZA)) /VTOTALINTENSIDAD) 
+
 (P_IMPORTE * 0.25) * 0.15 * ((munp1.Total / munp2.Total) /VSUMAMEJORA)  
) INTO VSUMADIP

FROM
PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPobreza munp1 ON mun.id = munp1.IdMun AND munp1.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP2i')   
INNER JOIN PDRMYE.MunPobreza munp2 ON mun.id = munp2.IdMun AND munp2.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP1i') 
WHERE
 mun.deleted=0
AND munp1.deleted=0 
AND munp2.deleted=0 
;


-- SE OBTIENE EL TOTAL
SELECT 
SUM(CRP.r1) + SUM(CPT.r2) + SUM(CIMP.r3) INTO VTOTAL_F1
FROM 
PDRMYE.Municipios mun
INNER JOIN 
(
SELECT 
mun.id,
(P_IMPORTE * 0.5) * ((munr.Recaudacion /munf.Facturacion) * munr.Recaudacion) / VTOTALEFICIENTE AS r1
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunFacturacion munf ON mun.id = munf.IdMun AND munf.Anio = (SELECT VALOR -1  FROM PDRMYE.ParametrosGenerales WHERE Nombre='BGt') 
INNER JOIN PDRMYE.MunRecaudacion munr ON mun.id = munr.IdMun AND munr.Anio = (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
where
mun.deleted=0
AND munf.deleted=0 
AND munr.deleted=0 
ORDER BY mun.ClaveEstado ASC
) CRP ON mun.id = CRP.id
INNER JOIN 
(
SELECT 
mun.id,
 (P_IMPORTE * 0.25) * ( ((munp.totalPob/VTOTAL_POBLACION) * 0.85) + ((munt.Km2 / VTOTAL_KM) * 0.15))  AS r2
FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunTerritorio  munt ON mun.id = munt.IdMun
INNER JOIN PDRMYE.MunPoblacion munp ON munp.IdMun = mun.id AND munp.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PO')  
where
mun.deleted=0
AND munt.deleted=0 
AND munp.deleted=0 
ORDER BY mun.ClaveEstado ASC

) CPT ON mun.id = CPT.id 

INNER JOIN (
SELECT 
mun.id,
(P_IMPORTE * 0.25)
*
(((P_IMPORTE *0.25) *0.85 * ((munp2.CarenciaProm * (munp2.Total / VTOTAL_POBLACION_POBREZA)) /VTOTALINTENSIDAD) 
+
 (P_IMPORTE *0.25) * 0.15 * ((munp1.Total / munp2.Total) /VSUMAMEJORA)
) /
VSUMADIP ) AS r3

FROM
PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPobreza munp1 ON mun.id = munp1.IdMun AND munp1.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP2i')   
INNER JOIN PDRMYE.MunPobreza munp2 ON mun.id = munp2.IdMun AND munp2.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP1i') 
where
mun.deleted=0
AND munp1.deleted=0 
AND munp2.deleted=0 
ORDER BY mun.ClaveEstado ASC
)CIMP ON mun.id = CIMP.id  
;
-- CONTINUA CON LA CONSULTA



INSERT INTO PDRMYE.ArticuloPrincipal(id,ModificadoPor,CreadoPor,Version,Clave,Articulo)
VALUES(VID,P_USUARIO,P_USUARIO,VNUMVERSION + 1,P_CLAVE,'Articulo 14 F I');


INSERT INTO PDRMYE.ArticuloDetalle(
ModificadoPor,
CreadoPor,
idArticuloPrincipal,
IdMunicipio,
Facturacion1,
Recaudacion1,
ProporcionRecaudacion,
RecaudacionPonderada,
CoeficienteEfectividadReca,
Poblacion,
EstructuraPoblacion1,
EstructuraPoblacion2,
Territorio,
EstructuraTerritorio1,
EstructuraTerritorio2,
CoeficienteTerritorio,
Pobreza1,
Pobreza2,
Carencia1,
Incidencia,
Intensidad,
ProporcionIntensidad,
DisPobreza,
MejoraPobreza,
ProporcionPobreza,
DisEficacia,
DisPobreza15,
CoeficientePobreza,
A1_1,
A1_2,
A1_3,
A1_4,
A1_5_COF
)
SELECT 
P_USUARIO,
P_USUARIO,
VID,
mun.id,
CRP.A,
CRP.B,
CRP.C,
CRP.D,
CRP.E,
CPT.A,
CPT.B,
CPT.C,
CPT.D,
CPT.E,
CPT.F,
CPT.G,
CIMP.A,
CIMP.B,
CIMP.C,
CIMP.D,
CIMP.E,
CIMP.F,
CIMP.g,
CIMP.h,
CIMP.j,
CIMP.k,
CIMP.l,
CIMP.m,
CRP.r1,
CPT.r2,
CIMP.r3,
CRP.r1 + CPT.r2 + CIMP.r3 ,
((CRP.r1 + CPT.r2 + CIMP.r3) / VTOTAL_F1) 

FROM 
PDRMYE.Municipios mun
INNER JOIN 
(

SELECT 
mun.id,
munf.Facturacion AS A,
munr.Recaudacion AS B,
(munr.Recaudacion /munf.Facturacion )AS C,
(munr.Recaudacion /munf.Facturacion) * munr.Recaudacion AS D,
((munr.Recaudacion /munf.Facturacion) * munr.Recaudacion) / VTOTALEFICIENTE AS E,
(P_IMPORTE * 0.5) * ((munr.Recaudacion /munf.Facturacion) * munr.Recaudacion) / VTOTALEFICIENTE AS r1
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunFacturacion munf ON mun.id = munf.IdMun AND munf.Anio =  (SELECT VALOR -1 FROM PDRMYE.ParametrosGenerales WHERE Nombre='BGt')  
INNER JOIN PDRMYE.MunRecaudacion munr ON mun.id = munr.IdMun AND munr.Anio =  (SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
where
mun.deleted=0
AND munf.deleted=0 
AND munr.deleted=0 
ORDER BY mun.ClaveEstado ASC

) CRP ON mun.id = CRP.id
INNER JOIN 

(
SELECT 
mun.id,
munp.totalPob AS A,
munp.totalPob/VTOTAL_POBLACION AS B,
(munp.totalPob/VTOTAL_POBLACION) * 0.85 AS C,
munt.Km2 AS D,
munt.Km2 / VTOTAL_KM AS E,
(munt.Km2 / VTOTAL_KM) * 0.15 AS F,
((munp.totalPob/VTOTAL_POBLACION) * 0.85) + ((munt.Km2 / VTOTAL_KM) * 0.15) AS G,
(P_IMPORTE * 0.25) * ( ((munp.totalPob/VTOTAL_POBLACION) * 0.85) + ((munt.Km2 / VTOTAL_KM) * 0.15))  AS r2
FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunTerritorio  munt ON mun.id = munt.IdMun
INNER JOIN PDRMYE.MunPoblacion munp ON munp.IdMun = mun.id AND munp.deleted=0 AND  munp.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='PO')
WHERE 
mun.deleted=0
AND munt.deleted=0 
AND munp.deleted=0 
ORDER BY mun.ClaveEstado ASC
) CPT ON mun.id = CPT.id 

INNER JOIN (
SELECT 
mun.id,
munp1.Total AS a ,
munp2.Total AS b ,
munp2.CarenciaProm AS c,
munp2.Total / VTOTAL_POBLACION_POBREZA AS d, 
munp2.CarenciaProm * (munp2.Total / VTOTAL_POBLACION_POBREZA) AS e ,
(munp2.CarenciaProm * (munp2.Total / VTOTAL_POBLACION_POBREZA)) /VTOTALINTENSIDAD  AS f,
(P_IMPORTE *0.25) *0.85 * ((munp2.CarenciaProm * (munp2.Total / VTOTAL_POBLACION_POBREZA)) /VTOTALINTENSIDAD)  AS g, 
munp1.Total / munp2.Total AS h,
(munp1.Total / munp2.Total) /VSUMAMEJORA AS j,
 (P_IMPORTE *0.25) * 0.15 * ((munp1.Total / munp2.Total) /VSUMAMEJORA) AS k,
(P_IMPORTE *0.25) *0.85 * ((munp2.CarenciaProm * (munp2.Total / VTOTAL_POBLACION_POBREZA)) /VTOTALINTENSIDAD) 
+
 (P_IMPORTE *0.25) * 0.15 * ((munp1.Total / munp2.Total) /VSUMAMEJORA)  AS l,

(
(P_IMPORTE *0.25) *0.85 * ((munp2.CarenciaProm * (munp2.Total / VTOTAL_POBLACION_POBREZA)) /VTOTALINTENSIDAD) 
+
 (P_IMPORTE *0.25) * 0.15 * ((munp1.Total / munp2.Total) /VSUMAMEJORA)
) /
VSUMADIP AS m,

(P_IMPORTE * 0.25)
*

(((P_IMPORTE *0.25) *0.85 * ((munp2.CarenciaProm * (munp2.Total / VTOTAL_POBLACION_POBREZA)) /VTOTALINTENSIDAD) 
+
 (P_IMPORTE *0.25) * 0.15 * ((munp1.Total / munp2.Total) /VSUMAMEJORA)
) /
VSUMADIP )
AS r3

FROM
PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPobreza munp1 ON mun.id = munp1.IdMun AND munp1.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP2i')
INNER JOIN PDRMYE.MunPobreza munp2 ON mun.id = munp2.IdMun AND munp2.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='PP1i')
WHERE 
mun.deleted=0
AND munp1.deleted=0 
AND munp2.deleted=0 
ORDER BY mun.ClaveEstado ASC
)CIMP ON mun.id = CIMP.id  
GROUP BY mun.id
;



-- SE ACTUALIZA LA VERSION ANTERIOR A NO ACTIVA
  UPDATE PDRMYE.ArticuloPrincipal SET DELETED=1 WHERE Clave=P_CLAVE AND VERSION=VNUMVERSION;


END;

ELSEIF P_CLAVE = 2 THEN


SELECT 
SUM(munp.totalPob) INTO VTOTAL_POBLACION 
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPoblacion munp ON mun.id = munp.IdMun AND munp.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='PO')
WHERE mun.deleted=0
AND   munp.deleted=0
;

SELECT 
sum(mpy.Pob) INTO VTOTAL_POBLACION_PROYECCION
FROM PDRMYE.MunProyec mpy WHERE mpy.anio = (SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='PC')
and mpy.deleted=0

;


SELECT 
SUM((munp.totalPob / VTOTAL_POBLACION) * (P_IMPORTE *0.35)  +
(mpy.Pob / VTOTAL_POBLACION_PROYECCION) * (P_IMPORTE *0.35) +
cp.A1_5_COF * (P_IMPORTE * 0.30)) INTO VTOTALF2
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPoblacion munp ON mun.id = munp.IdMun AND munp.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='PO')
INNER JOIN PDRMYE.MunProyec mpy ON mpy.IdMun = mun.id AND mpy.anio =  (SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='PC')
INNER JOIN (
SELECT 
ad.IdMunicipio,
ad.A1_5_COF
FROM PDRMYE.ArticuloPrincipal ap
INNER JOIN PDRMYE.ArticuloDetalle ad ON ap.id = ad.idArticuloPrincipal
WHERE ap.deleted=0 AND ap.clave=1 
) cp ON cp.IdMunicipio = mun.id
WHERE 
mun.deleted=0
AND munp.deleted=0 
AND mpy.deleted=0 
;



INSERT INTO PDRMYE.ArticuloPrincipal(id,ModificadoPor,CreadoPor,Version,Clave,Articulo)
VALUES(VID,P_USUARIO,P_USUARIO,VNUMVERSION + 1,P_CLAVE,'Articulo 14 F II');


INSERT INTO PDRMYE.ArticuloDetalle(
	ModificadoPor,
	CreadoPor,
	idArticuloPrincipal,
	IdMunicipio,
	Poblacion,
	Proyeccion,
	Coeficientepoblacion,
	Coeficienteproyeccion,
	A2_1,
	A2_2,
	A2_3,
	A2_4,
	A2_5,
	A2_6_COF
)


SELECT 
P_USUARIO,
P_USUARIO,
VID,
mun.id,
munp.totalPob,
mpy.Pob,
munp.totalPob / VTOTAL_POBLACION ,
mpy.Pob / VTOTAL_POBLACION_PROYECCION ,
cp.A1_5_COF ,
(munp.totalPob / VTOTAL_POBLACION) * (P_IMPORTE *0.35)  ,
(mpy.Pob / VTOTAL_POBLACION_PROYECCION) * (P_IMPORTE *0.35) ,
cp.A1_5_COF * (P_IMPORTE * 0.30) ,
(munp.totalPob / VTOTAL_POBLACION) * (P_IMPORTE *0.35)  +
(mpy.Pob / VTOTAL_POBLACION_PROYECCION) * (P_IMPORTE *0.35) +
cp.A1_5_COF * (P_IMPORTE * 0.30) ,
((munp.totalPob / VTOTAL_POBLACION) * (P_IMPORTE *0.35)  +
(mpy.Pob / VTOTAL_POBLACION_PROYECCION) * (P_IMPORTE *0.35) +
cp.A1_5_COF * (P_IMPORTE * 0.30)) / VTOTALF2

FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunPoblacion munp ON mun.id = munp.IdMun AND munp.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='PO')
INNER JOIN PDRMYE.MunProyec mpy ON mpy.IdMun = mun.id AND mpy.anio =  (SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='PC')
INNER JOIN (
SELECT 
ad.IdMunicipio,
ad.A1_5_COF
FROM PDRMYE.ArticuloPrincipal ap
INNER JOIN PDRMYE.ArticuloDetalle ad ON ap.id = ad.idArticuloPrincipal
WHERE ap.deleted=0 AND ap.clave=1 
) cp ON cp.IdMunicipio = mun.id

WHERE 
 mun.deleted=0
AND munp.deleted=0 
AND mpy.deleted=0 
ORDER BY mun.ClaveEstado ASC
;



-- SE ACTUALIZA LA VERSION ANTERIOR A NO ACTIVA
UPDATE PDRMYE.ArticuloPrincipal SET DELETED=1 WHERE Clave=P_CLAVE AND VERSION=VNUMVERSION;


ELSEIF P_CLAVE = 3 THEN



SELECT 
SUM((RIT1.Recaudacion/ BGT1.Facturacion)) ,SUM(RIT1.Recaudacion)  INTO VSUMA_ER,VSUMA_R
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunFacturacion BGT1 ON mun.id = BGT1.IdMun AND BGT1.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='BGt') 
INNER JOIN PDRMYE.MunRecaudacion RIT1 ON mun.id = RIT1.IdMun AND RIT1.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
INNER JOIN PDRMYE.MunRecaudacion RIT2 ON mun.id = RIT2.IdMun AND RIT2.Anio=(SELECT VALOR -1 FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
WHERE mun.ArtF3=1
AND mun.deleted=0
AND BGT1.deleted=0 
AND RIT1.deleted=0 
AND RIT2.deleted=0 
;


-- obtenemos la suma de las tasas mayores a cero
SELECT 
SUM((CASE WHEN ((RIT1.Recaudacion / RIT2.Recaudacion) -1) < 0 THEN null ELSE ((RIT1.Recaudacion / RIT2.Recaudacion) -1) END)) INTO VSUMA_TASA
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunFacturacion BGT1 ON mun.id = BGT1.IdMun AND BGT1.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='BGt') 
INNER JOIN PDRMYE.MunRecaudacion RIT1 ON mun.id = RIT1.IdMun AND RIT1.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
INNER JOIN PDRMYE.MunRecaudacion RIT2 ON mun.id = RIT2.IdMun AND RIT2.Anio=(SELECT VALOR -1 FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
WHERE mun.ArtF3=1
AND mun.deleted=0
AND BGT1.deleted=0 
AND RIT1.deleted=0 
AND RIT2.deleted=0 
;


SELECT 
SUM(
((P_IMPORTE * .5)  *  (((RIT1.Recaudacion/ BGT1.Facturacion) / VSUMA_ER))) +
((P_IMPORTE * .3)  *   (CASE WHEN ((RIT1.Recaudacion / RIT2.Recaudacion) -1) < 0 THEN 0 ELSE (  ((RIT1.Recaudacion / RIT2.Recaudacion) -1) /VSUMA_TASA)  END)  ) +
( P_IMPORTE  * .2) *  (RIT1.Recaudacion/VSUMA_R) 
) INTO VTOTAL_F3
FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunFacturacion BGT1 ON mun.id = BGT1.IdMun AND BGT1.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='BGt') 
INNER JOIN PDRMYE.MunRecaudacion RIT1 ON mun.id = RIT1.IdMun AND RIT1.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
INNER JOIN PDRMYE.MunRecaudacion RIT2 ON mun.id = RIT2.IdMun AND RIT2.Anio=(SELECT VALOR -1 FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
WHERE mun.ArtF3=1
AND mun.deleted=0
AND BGT1.deleted=0 
AND RIT1.deleted=0 
AND RIT2.deleted=0 

;


INSERT INTO PDRMYE.ArticuloPrincipal(id,ModificadoPor,CreadoPor,Version,Clave,Articulo)
VALUES(VID,P_USUARIO,P_USUARIO,VNUMVERSION + 1,P_CLAVE,'Articulo 14 F III');


INSERT INTO PDRMYE.ArticuloDetalle(
	ModificadoPor,
	CreadoPor,
	idArticuloPrincipal,
	IdMunicipio,
   Facturacion1,
	Recaudacion1,
	Recaudacion2,
	EficienciaRecaudatoria,
	CoeficienteEficienciaRecaudatoria,
	Tasa1,
	Tasa2,
	CoeficienteCrecimientoRecaudacion,
	CoeficienteimpuestoPredial,
	A1_1,
	A1_2,
	A1_3,
	A1_4,
	A1_5_COF
)
 -- calculo del coeficiente
 
SELECT 
P_USUARIO,
P_USUARIO,
VID,
mun.id,
BGT1.Facturacion AS a,
RIT1.Recaudacion AS b,
(RIT1.Recaudacion/ BGT1.Facturacion) AS c,
(RIT1.Recaudacion/ BGT1.Facturacion) / VSUMA_ER AS d,
RIT2.Recaudacion AS e,
(RIT1.Recaudacion / RIT2.Recaudacion) -1  AS f,
(RIT1.Recaudacion / RIT2.Recaudacion) -1  ,
(CASE WHEN ((RIT1.Recaudacion / RIT2.Recaudacion) -1) < 0 THEN 0 ELSE (  ((RIT1.Recaudacion / RIT2.Recaudacion) -1) /VSUMA_TASA)  END) AS h,
RIT1.Recaudacion/VSUMA_R as i,
((P_IMPORTE * .5)  *  (((RIT1.Recaudacion/ BGT1.Facturacion) / VSUMA_ER))) AS j,
((P_IMPORTE * .3)  *   (CASE WHEN ((RIT1.Recaudacion / RIT2.Recaudacion) -1) < 0 THEN 0 ELSE (  ((RIT1.Recaudacion / RIT2.Recaudacion) -1) /VSUMA_TASA)  END)  )  AS k ,
( P_IMPORTE  * .2) *  (RIT1.Recaudacion/VSUMA_R) AS M,

((P_IMPORTE * .5)  *  (((RIT1.Recaudacion/ BGT1.Facturacion) / VSUMA_ER))) +
((P_IMPORTE * .3)  *   (CASE WHEN ((RIT1.Recaudacion / RIT2.Recaudacion) -1) < 0 THEN 0 ELSE (  ((RIT1.Recaudacion / RIT2.Recaudacion) -1) /VSUMA_TASA)  END)  ) +
( P_IMPORTE  * .2) *  (RIT1.Recaudacion/VSUMA_R) AS N,

(
((P_IMPORTE * .5)  *  (((RIT1.Recaudacion/ BGT1.Facturacion) / VSUMA_ER))) +
((P_IMPORTE * .3)  *   (CASE WHEN ((RIT1.Recaudacion / RIT2.Recaudacion) -1) < 0 THEN 0 ELSE (  ((RIT1.Recaudacion / RIT2.Recaudacion) -1) /VSUMA_TASA)  END)  ) +
( P_IMPORTE  * .2) *  (RIT1.Recaudacion/VSUMA_R) 
)
/VTOTAL_F3

FROM PDRMYE.Municipios mun
INNER JOIN PDRMYE.MunFacturacion BGT1 ON mun.id = BGT1.IdMun AND BGT1.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='BGt') 
INNER JOIN PDRMYE.MunRecaudacion RIT1 ON mun.id = RIT1.IdMun AND RIT1.Anio=(SELECT VALOR FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
INNER JOIN PDRMYE.MunRecaudacion RIT2 ON mun.id = RIT2.IdMun AND RIT2.Anio=(SELECT VALOR -1 FROM PDRMYE.ParametrosGenerales WHERE Nombre='Ri,t') 
WHERE mun.ArtF3=1
AND mun.deleted=0
AND BGT1.deleted=0 
AND RIT1.deleted=0 
AND RIT2.deleted=0 
;


-- se insertan los municipios que no estan habilitados

INSERT INTO PDRMYE.ArticuloDetalle(
	ModificadoPor,
	CreadoPor,
	idArticuloPrincipal,
	IdMunicipio,
   Facturacion1,
	Recaudacion1,
	Recaudacion2,
	EficienciaRecaudatoria,
	CoeficienteEficienciaRecaudatoria,
	Tasa1,
	Tasa2,
	CoeficienteCrecimientoRecaudacion,
	CoeficienteimpuestoPredial,
	A1_1,
	A1_2,
	A1_3,
	A1_4,
	A1_5_COF
)
 -- calculo del coeficiente
SELECT 
P_USUARIO,
P_USUARIO,
VID,
mun.id,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
FROM PDRMYE.Municipios mun
WHERE ArtF3=0;

-- SE ACTUALIZA LA VERSION ANTERIOR A NO ACTIVA
UPDATE PDRMYE.ArticuloPrincipal SET DELETED=1 WHERE Clave=P_CLAVE AND VERSION=VNUMVERSION;

END IF;



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
