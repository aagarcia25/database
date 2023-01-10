-- --------------------------------------------------------
-- Host:                         10.200.4.111
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

-- Volcando estructura para procedimiento PDRMYE.sp_CalculosAjustes
DROP PROCEDURE IF EXISTS `sp_CalculosAjustes`;
DELIMITER //
CREATE PROCEDURE `sp_CalculosAjustes`(
	IN `P_FONDO` VARCHAR(50),
	IN `P_USUARIO` CHAR(36),
	IN `P_IMPORTE` DECIMAL(20,2),
	IN `P_IDCALCULO` CHAR(36),
	IN `P_IDAJUSTE` CHAR(36)
)
    COMMENT 'Procedimiento para generar los ajustes en los calculos'
BEGIN

DECLARE VSUMA DECIMAL(30,2);
DECLARE VAJUSTE INT;
DECLARE VMES INT;
DECLARE VANIO INT; 
DECLARE VIDCALCULOTOTAL CHAR(36); 
DECLARE VDESCRIPCIONAJUSTE VARCHAR(250); 
 
 
 
-- OBTENEMOS EL AÑO Y EL MES 
SELECT anio,mes INTO VANIO,VMES FROM PDRMYE.CalculoPrincipal WHERE id=P_IDCALCULO;
-- obtenemos la suma del ajuste 
SELECT SUM(importe) INTO VSUMA FROM PDRMYE.TblAjustesFondos
WHERE 
idcalculo=P_IDCALCULO
AND Anio=VANIO
AND idAjuste=P_IDAJUSTE
AND mes=VMES;

SELECT AJ.`keys` INTO VAJUSTE FROM PDRMYE.Ajustes AJ WHERE AJ.id=P_IDAJUSTE;
SELECT AJ.Descripcion INTO VDESCRIPCIONAJUSTE FROM PDRMYE.Ajustes AJ WHERE AJ.id=P_IDAJUSTE;


SELECT DISTINCT cp.id INTO VIDCALCULOTOTAL from
PDRMYE.CalculoTotalDetalle ctd
INNER JOIN PDRMYE.CalculoPrincipal cp ON ctd.idCalculoTotal = cp.id
INNER JOIN PDRMYE.TblAjustesFondos taf ON taf.idCalculo = cp.id AND taf.IdMun = ctd.IdMun
WHERE 
1= 1
AND 
cp.deleted=0
;



-- insertamos la relacion
INSERT INTO PDRMYE.CalculoAjuste(
 	                 ModificadoPor,
	                 CreadoPor,
 	                 idCalculo,
	                 idAjuste,
	                 Total)
SELECT 
P_USUARIO,
P_USUARIO,
P_IDCALCULO,
P_IDAJUSTE,
VSUMA
FROM dual;


IF VAJUSTE = 1 THEN
SELECT 1 FROM DUAL; 
ELSEIF VAJUSTE = 2 THEN
SELECT 1 FROM DUAL; 
ELSEIF VAJUSTE = 3 THEN
SELECT 1 FROM DUAL; 
ELSEIF VAJUSTE = 4 THEN
SELECT 1 FROM DUAL; 
ELSEIF VAJUSTE = 5 THEN
SELECT 1 FROM DUAL; 
ELSEIF VAJUSTE = 6 THEN
SELECT 1 FROM DUAL; 
ELSEIF VAJUSTE = 7 THEN
SELECT 1 FROM DUAL; 
ELSEIF VAJUSTE = 8 THEN

-- COMPENSACIONES FEIEF
UPDATE
PDRMYE.CalculoTotalDetalle ctd
INNER JOIN PDRMYE.CalculoPrincipal cp ON ctd.idCalculoTotal= cp.id
INNER JOIN PDRMYE.TblAjustesFondos taf ON taf.idCalculo = cp.id AND taf.IdMun = ctd.IdMun
SET ctd.CompensacionFEIF = taf.Importe
WHERE 
taf.IdMun = ctd.IdMun
AND  cp.deleted=0
;


ELSEIF VAJUSTE = 9 THEN
-- RETENCIONES FEIEF
UPDATE
PDRMYE.CalculoTotalDetalle ctd
INNER JOIN PDRMYE.CalculoPrincipal cp  ON ctd.idCalculoTotal = cp.id
INNER JOIN PDRMYE.TblAjustesFondos taf ON taf.idCalculo = cp.id AND taf.IdMun = ctd.IdMun
SET ctd.RetencionFEIF = taf.Importe
WHERE 
taf.IdMun = ctd.IdMun
AND  cp.deleted=0
;


ELSEIF VAJUSTE = 10 THEN
-- ajuste estatal
UPDATE
PDRMYE.CalculoTotalDetalle ctd
INNER JOIN PDRMYE.CalculoPrincipal cp ON ctd.idCalculoTotal = cp.id
INNER JOIN PDRMYE.TblAjustesFondos taf ON taf.idCalculo = cp.id AND taf.IdMun = ctd.IdMun
SET ctd.AjusteEstatal = taf.Importe
WHERE 
taf.IdMun = ctd.IdMun
AND  cp.deleted=0
;

ELSEIF VAJUSTE = 11 THEN
SELECT 1 FROM DUAL; 

END IF;






CALL PDRMYE.sp_ActualizaTotalCalculo(VIDCALCULOTOTAL,CONCAT('Se agrega Ajuste ', ' ', VDESCRIPCIONAJUSTE)  );






-- VACIAMOS LA TABLA TEMPORAL
TRUNCATE PDRMYE.TblAjustesFondos;


END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
