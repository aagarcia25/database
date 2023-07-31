-- FOSEGMUN

SET  @P_IEJA= 51051081 ,@P_DERECHOyE=2879193;

/*
SELECT 
ifnull(SUM(cp.TotalCompleto),0) * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='DISTRI_PARTICIPACIONES')
-- INTO @VTOTALPARTICIPACIONES
FROM 
PDRMYE.CalculoPrincipal cp
INNER JOIN PDRMYE.Fondos fon ON cp.ClaveFondo = fon.id
INNER JOIN PDRMYE.Estatus es ON es.id = cp.IdEstatus
WHERE cp.deleted=0
AND cp.anio = 2023
AND cp.mes=   7
AND fon.Aportacion=1
-- AND es.ControlInterno='CPH_ENV_VAL' -- 'DAMOP_INICIO' 
;
 */
 
 -- CÁLCULO DE DISTRIBUCIÓN DEL FONDO PARA SEGURIDAD PARA LOS MUNICIPIOS
  SELECT SUM(mp.totalPob) INTO @VTOTALPOBMAM  
  FROM PDRMYE.Municipios mun 
  INNER JOIN PDRMYE.MunPoblacion mp on mun.id = mp.IdMun  
  WHERE MAM = 1 
  AND mp.anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION'); -- TOTAL POBLACION MAM
   SELECT @VTOTALPOBMAM;
   
  SELECT SUM(mp.totalPob) INTO @VTOTALPOBMANM FROM PDRMYE.Municipios mun 
  INNER JOIN PDRMYE.MunPoblacion mp on mun.id = mp.IdMun  WHERE 
  MAM = 0 AND mp.anio=(SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION'); -- TOTAL POBLACION 
  SELECT @VTOTALPOBMANM;

  SELECT TRUNCATE(valor   / 12,2)  INTO @VVALORLE FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOSEGMUN_DISTRI_EQUITAT_L_EGRESOS';
  SELECT @VVALORLE;
  
  SELECT TRUNCATE(valor   / 12,2)  INTO @VVALORJA FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOSEGMUN_DISTRI_EQUITAT_EROG_JAPUESTA';
  SELECT @VVALORJA;
  
  SELECT TRUNCATE((4714640542.400001 * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOSEGMUN_%DISTRIBUCION')) / 100,2)  INTO @VTOTAL FROM DUAL;
  SELECT @VTOTAL;
  
  SELECT TRUNCATE(@P_IEJA * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOSEGMUN_DISTRIBUCION_IEJA'),2)   INTO @VTOTALIEJA FROM DUAL;	 
  SELECT @VTOTALIEJA;
  
  SELECT TRUNCATE(@P_DERECHOyE * (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOSEGMUN_DISTRIBUCION_DERECHO'),2)   INTO @VTOTALDERECHO FROM DUAL;	 
  SELECT @VTOTALDERECHO;
  
    
  -- INSERTAMOS EL CALCULO PRINCIPAL
  
SELECT MunPobreza
tbl.IdMun,
tbl.Nombre,
tbl.a
FROM 
(  
SELECT 
  mun.Nombre,
  mun.MAM,
  mun.id as IdMun,
 
  
  
  @VVALORLE +
  (@VTOTAL - (TRUNCATE(@VVALORLE * 51,6) ) )     * 0.60    * (munp.totalPob / @VTOTALPOBMAM ) +
  @VVALORJA +
  (@VTOTALIEJA - (@VVALORJA * 51 ))  * 0.6    * (munp.totalPob / @VTOTALPOBMAM ) +
  ((@VTOTALDERECHO * 0.6 )* (munp.totalPob / @VTOTALPOBMAM ))
  AS a
  FROM Municipios mun
  INNER JOIN PDRMYE.MunPoblacion munp ON  mun.id = munp.IdMun AND munp.Anio = (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION')
  WHERE 
  1=1
  AND mun.MAM=1
  /*
UNION 
SELECT
  mun.Nombre,
  mun.MAM,
  mun.id as IdMun,
  @VVALORLE +
  (@VTOTAL - (@VVALORLE * 51 ) )     * 0.4    * (munp.totalPob / @VTOTALPOBMANM ) +
  @VVALORJA +
  (@VTOTALIEJA - (@VVALORJA * 51 ))  * 0.4    * (munp.totalPob / @VTOTALPOBMANM )+
  ((@VTOTALDERECHO * 0.4) * (munp.totalPob / @VTOTALPOBMANM )) 
  AS a
  FROM Municipios mun
  INNER JOIN PDRMYE.MunPoblacion munp ON  mun.id = munp.IdMun AND munp.Anio = (SELECT VALOR  FROM PDRMYE.ParametrosGenerales WHERE Nombre='FOULT_POBLACION')
  WHERE 
  1=1
  AND mun.MAM=0*/
  
  )tbl ;
    