


SET @P_ANIO =2023 ,@P_FONDO ='FOFIR', @P_MES=7 , @VSUMARECALCULO=0;
SET @P_IMPORTE=404062750.00;



SELECT 
sum(cal.Garantia) INTO @VSUMAGARANTIA FROM 
PDRMYE.Municipios mun
INNER JOIN PDRMYE.CalculoGarantia cal ON mun.id = cal.idMunicipio
INNER JOIN PDRMYE.Fondos fondo ON cal.ClaveFondo = fondo.id
WHERE fondo.Clave=P_FONDO
AND cal.Anio=2021
;


-- NUEVA REGLA CUANDO SE TENGA DE DISTRIBUIR EL AJUSTE DE MENSUAL
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


SELECT @VSUMARECALCULO;




SELECT PorcentajeDistribucion INTO @VPORCENTAJE FROM PDRMYE.Fondos WHERE CLAVE=@P_FONDO;

SELECT @VSUMARECALCULO;
SELECT @VPORCENTAJE/100 * @P_IMPORTE INTO VTOTAL FROM DUAL;
SELECT @P_IMPORTE;

SELECT  @VTOTAL + @VSUMARECALCULO INTO VTOTAL FROM DUAL;

SELECT if((@VTOTAL - @VSUMAGARANTIA)<=0,1,2) INTO VIF;





IF  VIF = 1 THEN


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


ELSE


SELECT 

 mun.id,
 mun.Nombre,
tbl_1.garantia +tbl_2.total -ifnull(tbl_3.total,0)
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
WHERE ap.deleted=0 AND ap.clave=1
)tbl_2 ON tbl_2.id = mun.id
LEFT JOIN (
      SELECT 
      mun.id,
      mun.Nombre,
      ifnull(SUM( cpd.Mensual),0) total
      FROM 
      PDRMYE.CalculoPrincipal cp
      INNER JOIN PDRMYE.CalculoTotalDetalle cpd ON cp.id = cpd.idCalculoTotal 
      INNER JOIN PDRMYE.Municipios mun ON mun.id = cpd.IdMun
      INNER JOIN  PDRMYE.Estatus es ON es.id = cp.IdEstatus and cp.deleted=0
      INNER JOIN  PDRMYE.Fondos fd ON fd.id = cp.ClaveFondo
      INNER JOIN  PDRMYE.Meses mes ON mes.mes = cp.Mes
      INNER JOIN  PDRMYE.Estatus esr ON esr.id = cp.IdEstatus
      INNER JOIN  PDRMYE.TipoFondosCalculo tfc ON cp.idtipo = tfc.id
      WHERE cp.anio=@P_ANIO
      AND   fd.Clave=@P_FONDO
      AND   mes.mes = qP_MES
      AND cp.deleted=0
      GROUP BY mun.id
      ORDER BY mun.OrdenSFTGNL asc
)tbl_3 ON tbl_3.id = mun.id
;



