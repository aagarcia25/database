  DROP VIEW IF EXISTS `cph_pef`;

CREATE VIEW
cph_pef AS 
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
           LEFT JOIN PDRMYE.PEF pefe                  ON pefe.mes = cp.Mes
                                                      AND pefe.Anio = cp.Anio
                                                      AND pefe.ClaveFondo = cp.ClaveFondo 
                                                      AND pefe.idMunicipio = mun.id
     
	 ORDER BY cp.Anio,
           cp.Mes asc;
           