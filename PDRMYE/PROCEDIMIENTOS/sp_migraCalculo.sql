-- --------------------------------------------------------
-- Host:                         10.210.0.29
-- Versión del servidor:         10.8.6-MariaDB - MariaDB Server
-- SO del servidor:              Linux
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para procedimiento PDRMYE.sp_migraCalculo
DELIMITER //
CREATE PROCEDURE `sp_migraCalculo`(
	IN `P_USUARIO` CHAR(36),
	IN `P_IDCALCULO` CHAR(36)
)
    COMMENT 'migra el calculo'
BEGIN



DECLARE VEGRESO INT(1);


SELECT FD.Egreso INTO VEGRESO FROM PDRMYE.CalculoPrincipal CP JOIN PDRMYE.Fondos FD ON CP.ClaveFondo = FD.id WHERE CP.id=P_IDCALCULO;




IF VEGRESO = 1 THEN 


INSERT INTO PDRMYE.PA(
	idCalculoPrincipal,
	idCalculoDetalle,
	ClaveEstado,
	idMunicipio,
	idTipoCalculo,
	idFondo,
	idEstatus,
	idTipoParticipacion,
	Anio,
	Mes,
	ClavePresupuestal,
	total,
	NumProyecto,
	ConceptoEgreso,
	ConceptoCheque,
	idDivisa,
	Uresp,
	clasificacion
	
)

SELECT
 cp.id AS id,
 ctd.id AS iddetalle,
 mun.ClaveEstado AS ClaveEstado,
 mun.id AS IdMunicipio,
 tfc.id,
 fd.id ,
 'a2d2adfc-8e12-11ed-a98c-040300000000',
 'b85ef35d-6c52-11ed-a880-040300000000',
 cp.Anio AS Anio,
 mes.mes AS nummes,
REPLACE((TRIM(CONCAT(
 ifnull(fd.Clasificador01,'x'),
 '.',
 ifnull(fd.Clasificador02,'x'),
 '.',
 ifnull(fd.Clasificador03,'x'),
 '.',
 ifnull(fd.Clasificador04,'x'),
 '.',
 ifnull(fd.Clasificador05,'x'),
 '.',
 ifnull(fd.Clasificador06,'x'),
 '.',
ifnull( fd.Clasificador07,'x'),
 '.',
ifnull( fd.Clasificador08,'x'),
 '.',
ifnull( fd.Clasificador09,'x'),
 '.',
ifnull( mun.Clasificador10,'x'),
 '.',
ifnull( fd.Clasificador11,'x')
 ) ) ),CHAR(13, 10), '') as ClavePresupuestal,
 
 ctd.Mensual + 
 ctd.PrimerAjuste +
 ctd.SegundoAjuste +
 ctd.TercerAjuste + 
 ctd.CuartoAjuste + 
 ctd.AjusteAnual +
 ctd.AjusteSemestral + 
 ctd.AjusteDefinitivo +
 ctd.AjusteEstatal +
 ctd.AjusteFofir + 
 ctd.CompensacionFEIF + 
 ctd.RetencionFEIF AS total,
 fd.NumProyecto,
 fd.ConceptoEgreso,
 '45b5080b-74df-11ed-aad1-040300000000',
 'd7c1ea77-7049-11ed-a880-040300000000',
 '912be9c9-6c4f-11ed-a880-040300000000',
 fd.ClasificacionOP
FROM CalculoPrincipal cp
JOIN CalculoTotalDetalle ctd ON(cp.id = ctd.idCalculoTotal)
-- JOIN Estatus es ON(es.id = cp.IdEstatus AND cp.deleted = 0)
JOIN Fondos fd ON(fd.id = cp.ClaveFondo)
JOIN Meses mes ON(mes.mes = cp.Mes)
-- JOIN Estatus esr ON(esr.id = cp.IdEstatus)
JOIN Municipios mun ON(mun.id = ctd.IdMun)
JOIN TipoFondos tp ON(tp.id = fd.Tipo )
JOIN TipoFondosCalculo tfc ON(tfc.id = cp.idtipo)
WHERE 1 = 1
AND   cp.id= P_IDCALCULO
AND   cp.Procesado=0
AND (
 ctd.Mensual + 
 ctd.PrimerAjuste +
 ctd.SegundoAjuste +
 ctd.TercerAjuste + 
 ctd.CuartoAjuste + 
 ctd.AjusteAnual +
 ctd.AjusteSemestral + 
 ctd.AjusteDefinitivo +
 ctd.AjusteEstatal +
 ctd.AjusteFofir + 
 ctd.CompensacionFEIF + 
 ctd.RetencionFEIF
) <> 0
ORDER BY cp.Anio,mes.mes;


ELSE

INSERT INTO PDRMYE.PA(
	idCalculoPrincipal,
	idCalculoDetalle,
   CreadoPor,
   ModificadoPor,
   Anio,
   Mes,
   Uresp,
   idMunicipio,
   ClaveEstado,
   total,
   NumProyecto,
	idDivisa,
	idTipoParticipacion,
	ConceptoAnticipo,
   idTipoCalculo,
	idFondo,
	idEstatus
	
)

SELECT
 cp.id AS id,
 ctd.id AS iddetalle,
 P_USUARIO,
 P_USUARIO,
 cp.Anio AS Anio,
 mes.mes AS nummes,
 '912be9c9-6c4f-11ed-a880-040300000000',
 mun.id AS IdMunicipio,
 mun.ClaveEstado AS ClaveEstado,
 ctd.Mensual + 
 ctd.PrimerAjuste +
 ctd.SegundoAjuste +
 ctd.TercerAjuste + 
 ctd.CuartoAjuste + 
 ctd.AjusteAnual +
 ctd.AjusteSemestral + 
 ctd.AjusteDefinitivo +
 ctd.AjusteEstatal +
 ctd.AjusteFofir + 
 ctd.CompensacionFEIF + 
 ctd.RetencionFEIF AS total,
 fd.NumProyecto,
 'd7c1ea77-7049-11ed-a880-040300000000' AS idDivisa,
 '8a5e35c6-6c52-11ed-a880-040300000000' as idTipoParticipacion,
 3,
 tfc.id,
 fd.id ,
 'a2d2adfc-8e12-11ed-a98c-040300000000'
FROM CalculoPrincipal cp
JOIN CalculoTotalDetalle ctd ON(cp.id = ctd.idCalculoTotal)
-- JOIN Estatus es ON(es.id = cp.IdEstatus AND cp.deleted = 0)
JOIN Fondos fd ON(fd.id = cp.ClaveFondo)
JOIN Meses mes ON(mes.mes = cp.Mes)
-- JOIN Estatus esr ON(esr.id = cp.IdEstatus)
JOIN Municipios mun ON(mun.id = ctd.IdMun)
JOIN TipoFondos tp ON(tp.id = fd.Tipo )
JOIN TipoFondosCalculo tfc ON(tfc.id = cp.idtipo)
WHERE 1 = 1
AND   cp.id= P_IDCALCULO
AND   cp.Procesado=0
AND   ctd.Mensual <> 0
ORDER BY cp.Anio,mes.mes;



END IF;

-- SE PROCESA EL CALCULO
UPDATE PDRMYE.CalculoPrincipal  CP SET  CP.Procesado=1 WHERE CP.id=P_IDCALCULO;






END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
