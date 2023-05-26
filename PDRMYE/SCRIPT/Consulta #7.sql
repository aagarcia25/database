/*

SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_%DISTRIBUCION'

 select 3938175651
 * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_%DISTRIBUCION')/100  FROM DUAL;

SELECT 
ifnull(SUM(cp.TotalCompleto),0) * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='DISTRI_PARTICIPACIONES')

FROM 
PDRMYE.CalculoPrincipal cp
INNER JOIN PDRMYE.Fondos fon ON cp.ClaveFondo = fon.id
INNER JOIN PDRMYE.Estatus es ON es.id = cp.IdEstatus
WHERE cp.deleted=0
AND cp.anio = 2023
AND cp.mes=   5
AND fon.Aportacion=1
-- AND es.ControlInterno='CPH_ENV_VAL' -- 'DAMOP_INICIO' 
;
 
 
 */
 
 
SET @VIGUAL=783931.3366807067;
SET @V50RESTANTE = 11895305.9348507246;
SET @VSUMA1_5_COF=0.34089316391568600735;

SELECT 
 mun.id,
 mun.Nombre,
 @VIGUAL +
 (@V50RESTANTE/2) * (mp.totalPob / ( 
 SELECT sum(mp.totalPob) FROM PDRMYE.Municipios mun	
 INNER JOIN PDRMYE.MunPoblacion mp ON mun.id = mp.IdMun WHERE mun.UltraCrecimiento = 1
 AND mp.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION')
 ) ) 
 +
 (@V50RESTANTE/2) *  (ad.A1_5_COF /  @VSUMA1_5_COF)  AS c
 FROM PDRMYE.Municipios mun
 INNER JOIN PDRMYE.MunPoblacion mp ON mun.id = mp.IdMun
 INNER JOIN PDRMYE.ArticuloDetalle ad ON mun.id = ad.IdMunicipio
 INNER JOIN ArticuloPrincipal ap ON ap.id = ad.idArticuloPrincipal AND ap.deleted = 0 AND ap.Clave=1
 WHERE 
 mun.UltraCrecimiento =1	
 AND mp.Anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION')
 ;