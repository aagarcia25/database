/*DROP VIEW IF EXISTS `cph_pef`;

CREATE VIEW
cph_pef AS */
  SELECT 
        cp.id  idcalculototal,
        ctd.id idcalculodetalle,
        pefe.Anio,
        pefe.Mes,
        mes.Descripcion mesdescripcion,
        mun.id idmunicipio,
        mun.ClaveEstado,
        mun.Nombre,
        tf.id iddtipofondo,
        tf.Descripcion descripciontipofondo,
        fd.id idfondo,
        fd.Descripcion,
        ftc.id idtipocalculo,
        ftc.Descripcion as tipocalculo,
        TRUNCATE(Mensual,2) observadoimporte,
        TRUNCATE(AjusteEstatal,2) observadoAjusteEstatal,
		  TRUNCATE((ctd.Mensual     + ctd.AjusteEstatal ),2) observadototalImporte,
        pefe.Anio pefanio,
        TRUNCATE(pefe.importe,2) peftotalImporte,
        TRUNCATE(pefe.importe,2) - TRUNCATE((ctd.Mensual     + ctd.AjusteEstatal ),2) vspefs
         
        FROM 
        
            PDRMYE.PEF pefe                         
            INNER  JOIN PDRMYE.Meses mes               ON mes.mes = pefe.Mes
            INNER  JOIN PDRMYE.Municipios mun          ON pefe.idMunicipio = mun.id
            INNER  JOIN PDRMYE.Fondos fd               ON fd.id = pefe.ClaveFondo
            INNER  JOIN PDRMYE.TipoFondos tf           ON tf.id = fd.Tipo
		      LEFT   JOIN  PDRMYE.CalculoPrincipal cp    ON  pefe.ClaveFondo = cp.ClaveFondo 
			  	                                           AND pefe.Anio = cp.Anio
			  	                                           AND pefe.Mes =  cp.Mes
			  	                                           AND cp.deleted=0                                     
		      LEFT JOIN PDRMYE.CalculoTotalDetalle ctd   ON  cp.id = ctd.idCalculoTotal
		                                                 AND pefe.idMunicipio = ctd.IdMun
            LEFT JOIN PDRMYE.TipoFondosCalculo ftc   ON cp.idtipo = ftc.id
           
     
				 
            WHERE 1=1
            -- AND pefe.Anio=2023 AND pefe.mes = 1 AND pefe.idMunicipio='6bdfe068-3f7f-11ed-af5a-040300000000'

            ORDER BY pefe.Anio,pefe.Mes asc;