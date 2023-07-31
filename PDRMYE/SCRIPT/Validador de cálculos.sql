SET @P_ANIO =2023 ,@P_FONDO ='FFM30',  @VSUMARECALCULO=0,@VANIOGARANTIA=2021;



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
AND cal.Anio=2021
;


-- NUEVA REGLA CUANDO SE TENGA DE DISTRIBUIR EL AJUSTE DE MENSUAL
/*
SELECT 
ifnull(SUM( cp.Total),0) INTO @VSUMARECALCULO
FROM 
PDRMYE.CalculoPrincipal cp
INNER JOIN  PDRMYE.Estatus es ON es.id = cp.IdEstatus and cp.deleted=0
INNER JOIN  PDRMYE.Fondos fd ON fd.id = cp.ClaveFondo
INNER JOIN  PDRMYE.Meses mes ON mes.mes = cp.Mes
INNER JOIN  PDRMYE.Estatus esr ON esr.id = cp.IdEstatus
INNER JOIN  PDRMYE.TipoFondosCalculo tfc ON cp.idtipo = tfc.id
WHERE cp.anio=@P_ANIO
AND   fd.Clave= @P_FONDO
AND   mes.mes =@P_MES
AND cp.deleted =0
ORDER BY cp.FechaCreacion DESC
;
*/

-- SELECT @VSUMARECALCULO;




SELECT PorcentajeDistribucion INTO @VPORCENTAJE FROM PDRMYE.Fondos WHERE CLAVE=@P_FONDO;

 SELECT @VPORCENTAJE;
SELECT @VPORCENTAJE/100 * @P_IMPORTE INTO @VTOTAL FROM DUAL;
SELECT @P_IMPORTE;

-- SELECT  @VTOTAL + @VSUMARECALCULO INTO @VTOTAL FROM DUAL;
SELECT @VTOTAL;
SELECT if((@VTOTAL - @VSUMAGARANTIA)<=0,1,2) INTO @VIF;


SELECT @VIF;


 -- @VIF = 1 
/*

SELECT 
 mun.id,
 mun.Nombre,
 tbl_1.garantia 
FROM 
PDRMYE.Municipios mun 
INNER JOIN 
(
    SELECT 
      mun.id,
      mun.Nombre,
      cal.Distribucion * @VTOTAL AS  garantia
      FROM 
      PDRMYE.Municipios mun
      INNER JOIN PDRMYE.CalculoGarantia cal ON mun.id = cal.idMunicipio
      INNER JOIN PDRMYE.Fondos fondo ON cal.ClaveFondo = fondo.id
      WHERE fondo.Clave=@P_FONDO
      AND cal.Anio = @VANIOGARANTIA
)tbl_1 ON tbl_1.id = mun.id
;
*/


 -- @VIF = 2


SELECT 
 mun.id,
 mun.Nombre,
 tbl_3.Mensual as distribuido,
 tbl_1.garantia ,
 tbl_2.total ,
 (tbl_1.garantia +tbl_2.total) AS distribucionactualizada,
 (tbl_1.garantia +tbl_2.total) -  tbl_3.Mensual  AS diferencia,
 (((tbl_1.garantia +tbl_2.total) -  tbl_3.Mensual) / 6)  AS mes

FROM 
PDRMYE.Municipios mun 
INNER JOIN 
(
SELECT 
mun.id,
mun.Nombre,
cal.Garantia *6 AS Garantia
 FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.CalculoGarantia cal ON mun.id = cal.idMunicipio
INNER JOIN PDRMYE.Fondos fondo ON cal.ClaveFondo = fondo.id
WHERE fondo.Clave=@P_FONDO
AND cal.Anio = @VANIOGARANTIA

)tbl_1 ON tbl_1.id = mun.id
INNER JOIN 
(
SELECT 
ad.IdMunicipio AS id,
ad.A1_5_COF,
ad.A1_5_COF * ( @VTOTAL - @VSUMAGARANTIA) AS total
FROM PDRMYE.ArticuloPrincipal ap
INNER JOIN PDRMYE.ArticuloDetalle ad ON ap.id = ad.idArticuloPrincipal
WHERE ap.deleted=0 AND ap.clave=3
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
AND cp.anio = 2023
AND fon.Clave=@P_FONDO
 AND cp.Mes IN (1,2,3,4,5,6)
GROUP BY mun.Nombre
)tbl_3 ON  tbl_3.id = mun.id


;



