START TRANSACTION;
INSERT INTO PADetalle
 
 (  `ModificadoPor`, 
	 `CreadoPor`,
	 `idPA`,
	 `Clasificador01`,
	 `Clasificador02`,
	 `Clasificador03`, 
	 `Clasificador04`, 
	 `Clasificador05`,
	 `Clasificador06`,
	 `Clasificador07`, 
	 `Clasificador08`, 
	 `Clasificador09`, 
	 `Clasificador10`, 
	 `Clasificador11`, 
	 `importe`,
	 `ConceptoEgreso`,
	 `NumProyecto`)
SELECT
tbl.ModificadoPor,
tbl.CreadoPor,
tbl.id,
fon.Clasificador01,
fon.Clasificador02,
fon.Clasificador03,
fon.Clasificador04,
fon.Clasificador05,
fon.Clasificador06,
fon.Clasificador07,
fon.Clasificador08,
fon.Clasificador09,
mun.Clasificador10,
fon.Clasificador11,
tbl.total,
egreso.id,
tbl.NumProyecto
/* VIDUSER,
 VIDUSER,
 VID,
 pad.Clasificador01,
 pad.Clasificador02,
 pad.Clasificador03, 
 pad.Clasificador04, 
 pad.Clasificador05,
 pad.Clasificador06,
 pad.Clasificador07, 
 pad.Clasificador08, 
 pad.Clasificador09, 
 pad.Clasificador10, 
 pad.Clasificador11, 
 VTOTAL,
 pad.ConceptoEgreso,
 pad.NumProyecto*/
FROM PDRMYE.PA tbl
INNER JOIN PDRMYE.Fondos fon ON tbl.idFondo = fon.id
INNER JOIN PDRMYE.Municipios mun ON mun.id = tbl.idMunicipio
INNER JOIN PDRMYE.CatConceptoEgreso egreso ON egreso.Clave = tbl.ConceptoEgreso
WHERE 1 = 1
and tbl.deleted=0
AND tbl.NumOper
IN (
1705

)
-- AND tbl.idEstatus= 'a2d2adfc-8e12-11ed-a98c-040300000000'
;

COMMIT;
