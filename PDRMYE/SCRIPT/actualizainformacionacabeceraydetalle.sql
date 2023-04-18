
-- SELECT * FROM PDRMYE.PA tbl WHERE tbl.idCalculoPrincipal='789cf8aa-a3f8-11ed-854b-040300000000';

SET @idcalculo='4dde14b3-a3f9-11ed-854b-040300000000';
START TRANSACTION;
DELETE  FROM PDRMYE.PA  WHERE idCalculoPrincipal=@idcalculo;

/*
DELETE  t1,t2 FROM 
PDRMYE.PADetalle t1
INNER JOIN PDRMYE.PA t2 ON t1.idPA = t2.id
WHERE t2.idCalculoPrincipal='5e394ec8-b6d5-11ed-8002-d89d6776f970';
*/

COMMIT;
UPDATE PDRMYE.CalculoPrincipal tbl SET tbl.Procesado=0 WHERE tbl.id=@idcalculo;

CALL `sp_migraCalculo`('6c261f7f-71d9-11ed-a880-040300000000', @idcalculo);