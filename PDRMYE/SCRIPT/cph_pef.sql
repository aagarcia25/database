/*DROP VIEW IF EXISTS `cph_pef`;

CREATE VIEW
cph_pef AS */
SELECT 
*-- SUM(tbl.observadoimporte)
 FROM (
SELECT 
 distinct
        cp.id  idcalculototal,
        ctd.id idcalculodetalle,
        cp.Anio,
        cp.Mes,
        mes.Descripcion mesdescripcion,
        mun.id idmunicipio,
        mun.ClaveEstado,
        mun.Nombre,
        '02' iddtipofondo,
        tf.Descripcion descripciontipofondo,
        fd.id idfondo,
        fd.Descripcion,
        ftc.id idtipocalculo,
         'Devoluciones' as tipocalculo,
        TRUNCATE(AjusteEstatal,2) observadoimporte,
        0 observadoAjusteEstatal,
		  TRUNCATE(AjusteEstatal,2) AS observadototalImporte,
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
          AND  fd.clave='ISR SALARIOS'
          UNION all
 SELECT 
 distinct
        cp.id  idcalculototal,
        ctd.id idcalculodetalle,
        cp.Anio,
        cp.Mes,
        mes.Descripcion mesdescripcion,
        mun.id idmunicipio,
        mun.ClaveEstado,
        mun.Nombre,
        '01' iddtipofondo,
        tf.Descripcion descripciontipofondo,
        fd.id idfondo,
        fd.Descripcion,
        ftc.id idtipocalculo,
        'Ajuste Estatal' as tipocalculo,
        TRUNCATE(AjusteEstatal,2) observadoimporte,
        0 observadoAjusteEstatal,
		  TRUNCATE(AjusteEstatal,2) observadototalImporte,
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
          AND  fd.clave<>'ISR SALARIOS'
                                                     
     UNION all
     
     SELECT 
 distinct
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
        0 observadoAjusteEstatal,
		  TRUNCATE(ctd.Mensual  ,2) observadototalImporte,
        pefe.Anio pefanio,
        TRUNCATE(pefe.importe,2) peftotalImporte,
        TRUNCATE(pefe.importe,2) - TRUNCATE(ctd.Mensual  ,2) vspefs
         
        FROM 

           PDRMYE.CalculoPrincipal cp 
           LEFT JOIN PDRMYE.CalculoTotalDetalle ctd   ON  cp.id = ctd.idCalculoTotal AND cp.deleted=0 AND ctd.deleted=0
           LEFT JOIN PDRMYE.Fondos fd                 ON fd.id = cp.ClaveFondo	    
			  LEFT JOIN PDRMYE.TipoFondos tf             ON tf.id = fd.Tipo					
			  LEFT JOIN PDRMYE.TipoFondosCalculo ftc     ON cp.idtipo = ftc.id
           LEFT JOIN PDRMYE.Municipios mun            ON ctd.IdMun = mun.id
           LEFT JOIN PDRMYE.Meses mes                 ON mes.mes = cp.Mes
           LEFT JOIN PDRMYE.PEF pefe                  ON pefe.mes = cp.Mes
                                                      AND pefe.Anio = cp.Anio
                                                      AND pefe.ClaveFondo = cp.ClaveFondo 
                                                      AND pefe.idMunicipio = ctd.IdMun AND  ftc.Alias ='Mensual'
                                                     
                                                     
  
    )tbl
     WHERE  tbl.Anio=2022 AND tbl.Mes=9 AND idfondo='ef08ed38-2b0d-11ed-afdb-040300000000' 
	 ORDER BY tbl.Anio,           tbl.Mes asc;
           