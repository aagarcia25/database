
SET @P_ANIO =2023 ,
	 @VSUMARECALCULO=0,
	 @VANIOGARANTIA=2021,
	 @P_FONDO='ISR INMUEBLES';




SELECT PorcentajeDistribucion INTO @VPORCENTAJE FROM PDRMYE.Fondos WHERE CLAVE=@P_FONDO;
SELECT @VPORCENTAJE/100 * @P_IMPORTE INTO @VTOTAL FROM DUAL;
SELECT SUM(isai.importe) INTO @VTOTALISAN  FROM PDRMYE.MunIsai isai WHERE deleted=0;



SELECT 
sum(cpd.Mensual) INTO  @totalactualizado
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
;


SELECT 

 mun.id,
 mun.ClaveEstado,
 mun.Nombre,
 @idFondo,
 @P_ANIO,
 ROUND(tbl_3.Mensual,2)  as distribuido,
 ROUND((isai.importe /@VTOTALISAN) * @totalactualizado ,2) AS distribucionactualizada,
 ROUND(tbl_3.Mensual,2)  -   ROUND((isai.importe /@VTOTALISAN) * @totalactualizado ,2)   AS diferencia,
ROUND( ( tbl_3.Mensual  -   (isai.importe /@VTOTALISAN) * @totalactualizado ) /6 ,2) AS mes
 
-- 
FROM PDRMYE.MunIsai isai 
INNER JOIN PDRMYE.Municipios mun ON mun.id = isai.IdMun AND isai.deleted=0
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


