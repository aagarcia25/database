 /*DROP VIEW IF EXISTS cph_pef_02;

CREATE VIEW
cph_pef_02 AS */

SELECT  * FROM (
 SELECT 
        cp.id  idcalculototal,
        ctd.id idcalculodetalle,
        cp.Anio,
        cp.Mes,
        mes.Descripcion mesdescripcion,
        mun.id idmunicipio,
        mun.ClaveEstado,
        mun.Nombre,
        tf.id iddtipofondo,
        tf.Descripcion descripciontipofondo,
        fd.id idfondo,
        fd.Descripcion,
        ftc.id idtipocalculo,
        ftc.Alias as tipocalculo,
        TRUNCATE(Mensual,2) observadoimporte,
        TRUNCATE(AjusteEstatal,2) observadoAjusteEstatal,
		  TRUNCATE((ctd.Mensual     + ctd.AjusteEstatal ),2) observadototalImporte,
        pefe.Anio pefanio,
        TRUNCATE(pefe.importe,2) peftotalImporte,
        TRUNCATE(pefe.importe,2) - TRUNCATE((ctd.Mensual     + ctd.AjusteEstatal ),2) vspefs
         
        FROM 

           PDRMYE.CalculoPrincipal cp 
           LEFT JOIN PDRMYE.CalculoTotalDetalle ctd   ON  cp.id = ctd.idCalculoTotal AND cp.deleted=0 AND ctd.deleted=0
           LEFT JOIN PDRMYE.Fondos fd                 ON fd.id = cp.ClaveFondo	    
			  LEFT JOIN PDRMYE.TipoFondos tf             ON tf.id = fd.Tipo					
			  LEFT JOIN PDRMYE.TipoFondosCalculo ftc     ON cp.idtipo = ftc.id
           LEFT JOIN PDRMYE.Municipios mun            ON ctd.IdMun = mun.id
           LEFT JOIN PDRMYE.Meses mes                 ON mes.mes = cp.Mes
           LEFT JOIN PDRMYE.PEF pefe                  ON mes.mes = cp.Mes
                                                      AND pefe.Anio = cp.Anio
                                                      AND pefe.Mes = cp.Mes
                                                      AND pefe.ClaveFondo = cp.ClaveFondo 
                                                      AND pefe.idMunicipio = mun.id
                                            
         
           
  UNION ALL
  
  SELECT 
        cp.id  idcalculototal,
        ctd.id idcalculodetalle,
        cp.Anio,
        cp.Mes,
        mes.Descripcion mesdescripcion,
        mun.id idmunicipio,
        mun.ClaveEstado,
        mun.Nombre,
        tf.id iddtipofondo,
        'AJUSTE ESTATAL' descripciontipofondo,
        fd.id idfondo,
        fd.Descripcion,
        ftc.id idtipocalculo,
        ftc.Alias as tipocalculo,
        TRUNCATE(AjusteEstatal,2) observadoimporte,
        0 observadoAjusteEstatal,
		  0 observadototalImporte,
        0 pefanio,
        0 peftotalImporte,
        0 vspefs
         
        FROM 

           PDRMYE.CalculoPrincipal cp 
           LEFT JOIN PDRMYE.CalculoTotalDetalle ctd   ON  cp.id = ctd.idCalculoTotal AND cp.deleted=0 AND ctd.deleted=0
           LEFT JOIN PDRMYE.Fondos fd                 ON fd.id = cp.ClaveFondo	    
			  LEFT JOIN PDRMYE.TipoFondos tf             ON tf.id = fd.Tipo					
			  LEFT JOIN PDRMYE.TipoFondosCalculo ftc     ON cp.idtipo = ftc.id
           LEFT JOIN PDRMYE.Municipios mun            ON ctd.IdMun = mun.id
           LEFT JOIN PDRMYE.Meses mes                 ON mes.mes = cp.Mes
          
           WHERE AjusteEstatal <> 0                                 
    )tbl     
	/* WHERE   tbl.Anio=2023 AND  tbl.Mes=7
	 AND tbl.idfondo='da89175f-2b0d-11ed-afdb-040300000000'
	 AND tbl.idmunicipio='6bbaefc2-3f7f-11ed-af5a-040300000000'
	 */
			  ORDER BY tbl.Anio,
           tbl.Mes asc
           
           
           
        