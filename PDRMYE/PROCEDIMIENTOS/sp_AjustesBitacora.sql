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

-- Volcando estructura para procedimiento PDRMYE.sp_AjustesBitacora
DELIMITER //
CREATE PROCEDURE `sp_AjustesBitacora`(
	IN `P_USUARIO` CHAR(36),
	IN `ID_REGISTRO` CHAR(36)
)
BEGIN


DECLARE VTIPO VARCHAR(100);
DECLARE VIDOPERACION VARCHAR(100);


SELECT TIPO INTO VTIPO FROM PDRMYE.BitacoraAjustes WHERE ID=ID_REGISTRO AND Aplicado = 0;
SELECT BA.IdRegistro INTO VIDOPERACION FROM PDRMYE.BitacoraAjustes BA WHERE BA.ID=ID_REGISTRO AND Aplicado = 0;



IF VTIPO = 'MunPobrezaExt' THEN

UPDATE PDRMYE.MunPobrezaExt MUNP
SET MUNP.Personas=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Personas'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,MUNP.CarenciaProm = ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.CarenciaProm'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
WHERE MUNP.id = VIDOPERACION;

UPDATE PDRMYE.BitacoraAjustes SET APLICADO=1 WHERE ID=ID_REGISTRO AND Aplicado = 0;

ELSEIF VTIPO = 'MunTerritorio' THEN

UPDATE PDRMYE.MunTerritorio MUNT
SET MUNT.Km2=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Km2'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)

WHERE MUNT.id = VIDOPERACION;
UPDATE PDRMYE.BitacoraAjustes SET APLICADO=1 WHERE ID=ID_REGISTRO AND Aplicado = 0;



ELSEIF VTIPO = 'Umas' THEN

UPDATE PDRMYE.Umas um
SET um.Anio=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Anio'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,um.Anual=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Anual'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,um.Diario=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Diario'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,um.Mensual=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Mensual'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)

WHERE um.id = VIDOPERACION;
UPDATE PDRMYE.BitacoraAjustes SET APLICADO=1 WHERE ID=ID_REGISTRO AND Aplicado = 0;

ELSEIF VTIPO = 'MunFacturacion' THEN
UPDATE PDRMYE.MunFacturacion munf
SET munf.Anio=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Anio'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,munf.Facturacion=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Facturacion'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)


WHERE munf.id = VIDOPERACION;
UPDATE PDRMYE.BitacoraAjustes SET APLICADO=1 WHERE ID=ID_REGISTRO AND Aplicado = 0;


ELSEIF VTIPO = 'MunFideicomiso' THEN

UPDATE PDRMYE.MunFideicomiso munfi
SET munfi.Nombre=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Nombre'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,munfi.Porcentaje=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Porcentaje'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,munfi.ClaveBancaria=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.ClaveBancaria'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,munfi.Cuenta=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Cuenta'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)

WHERE munfi.id = VIDOPERACION;
UPDATE PDRMYE.BitacoraAjustes SET APLICADO=1 WHERE ID=ID_REGISTRO AND Aplicado = 0;

ELSEIF VTIPO = 'MunPoblacion' THEN

UPDATE PDRMYE.MunPoblacion munpob
SET munpob.totalPob=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.totalPob'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)


WHERE munpob.id = VIDOPERACION;
UPDATE PDRMYE.BitacoraAjustes SET APLICADO=1 WHERE ID=ID_REGISTRO AND Aplicado = 0;

ELSEIF VTIPO = 'MunPobreza' THEN

UPDATE PDRMYE.MunPobreza munpo
SET munpo.Total=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Total'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,munpo.CarenciaProm=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.CarenciaProm'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)

WHERE munpo.id = VIDOPERACION;
UPDATE PDRMYE.BitacoraAjustes SET APLICADO=1 WHERE ID=ID_REGISTRO AND Aplicado = 0;

ELSEIF VTIPO = 'MunProyec' THEN

UPDATE PDRMYE.MunProyec munpro
SET munpro.anio=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.anio'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,munpro.Pob=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Pob'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,munpro.IdMun=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.IdMun'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)

WHERE munpro.id = VIDOPERACION;
UPDATE PDRMYE.BitacoraAjustes SET APLICADO=1 WHERE ID=ID_REGISTRO AND Aplicado = 0;

ELSEIF VTIPO = 'MunRecaudacion' THEN

UPDATE PDRMYE.MunRecaudacion munre
SET munre.Anio=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Anio'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)
,munre.Recaudacion=   ( SELECT REPLACE(JSON_EXTRACT(SOLICITUD ,'$.Recaudacion'),'"','') FROM PDRMYE.BitacoraAjustes  WHERE ID=ID_REGISTRO AND Aplicado = 0)


WHERE munre.id = VIDOPERACION;
UPDATE PDRMYE.BitacoraAjustes SET APLICADO=1 WHERE ID=ID_REGISTRO AND Aplicado = 0;


END IF;



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
