
SET @P_ANIO =2023 ,
	 @VSUMARECALCULO=0,
	 @VANIOGARANTIA=2021,
	 @P_FONDO='FGP';


SELECT 
distinct
SUM(cp.TotalCompleto) INTO @P_IMPORTE
FROM 
PDRMYE.CalculoPrincipal cp
INNER JOIN PDRMYE.CalculoTotalDetalle cpd ON cp.id = cpd.idCalculoTotal
INNER JOIN PDRMYE.Fondos fon ON cp.ClaveFondo = fon.id
INNER JOIN PDRMYE.Estatus es ON es.id = cp.IdEstatus
INNER JOIN PDRMYE.Municipios mun ON mun.id = cpd.IdMun
WHERE cp.deleted=0
AND cp.anio = @P_ANIO 
AND fon.Clave=@P_FONDO
 AND cp.Mes IN (1,2,3,4,5,6)
GROUP BY fon.Clave,mun.Nombre
;



SELECT 
sum(cal.Garantia) * 6 INTO @VSUMAGARANTIA FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.CalculoGarantia cal ON mun.id = cal.idMunicipio
INNER JOIN PDRMYE.Fondos fondo ON cal.ClaveFondo = fondo.id
WHERE fondo.Clave=@P_FONDO
AND cal.Anio=@VANIOGARANTIA
AND cal.deleted=0
;


SELECT PorcentajeDistribucion ,id  INTO @VPORCENTAJE, @idFondo FROM PDRMYE.Fondos WHERE CLAVE=@P_FONDO;

SELECT @VPORCENTAJE/100 * @P_IMPORTE INTO @VTOTAL FROM DUAL;
SELECT if((@VTOTAL - @VSUMAGARANTIA)<=0,1,2) INTO @VIF;





SELECT 
 mun.id,
 mun.ClaveEstado,
 mun.Nombre,
 @idFondo,
 @P_ANIO,
ROUND(tbl_1.tes,2)  ,
ROUND(tbl_1.tes *6 ,2) ,
 tbl_2.A1_5_COF,
 
 ROUND(tbl_3.Mensual,2)  as distribuido,
 ROUND(tbl_1.garantia +tbl_2.total,2)  AS distribucionactualizada,
 ROUND((tbl_1.garantia +tbl_2.total) -  tbl_3.Mensual,2)   AS diferencia,
 ROUND((((tbl_1.garantia +tbl_2.total) -  tbl_3.Mensual) / 6),2)  AS mes


FROM 
PDRMYE.Municipios mun 
INNER JOIN 
(
SELECT 
mun.id,
mun.Nombre,
cal.Garantia AS tes,
cal.Garantia *6  AS Garantia
 FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.CalculoGarantia cal ON mun.id = cal.idMunicipio
INNER JOIN PDRMYE.Fondos fondo ON cal.ClaveFondo = fondo.id
WHERE fondo.Clave=@P_FONDO
AND cal.Anio = @VANIOGARANTIA
AND cal.deleted =0
)tbl_1 ON tbl_1.id = mun.id
INNER JOIN 
(
SELECT 
ad.IdMunicipio AS id,
round(ad.A1_5_COF,10) AS A1_5_COF,
round(ad.A1_5_COF,10) * ( @VTOTAL - @VSUMAGARANTIA) AS total
FROM PDRMYE.ArticuloPrincipal ap
INNER JOIN PDRMYE.ArticuloDetalle ad ON ap.id = ad.idArticuloPrincipal
WHERE ap.deleted=0 AND ap.clave=1
)tbl_2 ON tbl_2.id = mun.id
INNER JOIN 
(
SELECT 
mun.id,
mun.Nombre,
sum(cpd.Mensual) AS  Mensual
FROM 
PDRMYE.CalculoPrincipal cp
INNER JOIN PDRMYE.CalculoTotalDetalle cpd ON cp.id = cpd.idCalculoTotal
INNER JOIN PDRMYE.Fondos fon ON cp.ClaveFondo = fon.id
INNER JOIN PDRMYE.Estatus es ON es.id = cp.IdEstatus
INNER JOIN PDRMYE.Municipios mun ON mun.id = cpd.IdMun
WHERE cp.deleted=0
AND cp.anio = @P_ANIO
AND fon.Clave=@P_FONDO
 AND cp.Mes IN (1,2,3,4,5,6)
GROUP BY mun.Nombre
)tbl_3 ON  tbl_3.id = mun.id
;

