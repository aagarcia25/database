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

-- Volcando estructura para procedimiento PDRMYE.sp_Solicitudes
DROP PROCEDURE IF EXISTS `sp_Solicitudes`;
DELIMITER //
CREATE PROCEDURE `sp_Solicitudes`(
	IN `P_TIPO` CHAR(36),
	IN `P_USUARIO` CHAR(36)
,
	IN `P_FONDO` CHAR(36),
	IN `P_MUNICIPIO` CHAR(36)





,
	IN `P_COMENTARIO` VARCHAR(100)
)
BEGIN
/* parámetros*/
 DECLARE VIDAREA CHAR(36);
 DECLARE VIDPERFIL CHAR(36);
 DECLARE VTOTAL DECIMAL(30,2);
 DECLARE VIDOP CHAR(36);
 DECLARE VIDESTATUS CHAR(36);
 DECLARE VIDSOLICITUDES CHAR(36);
 
 BEGIN 
 SELECT id INTO VIDESTATUS FROM PDRMYE.Estatus est WHERE est.ControlInterno='DAMOP_INICIO' AND Proceso='6fbbcf10-4b39-11ed-a964-040300000000';
 SELECT UUID() INTO VIDOP FROM DUAL;
 SELECT id INTO VIDAREA FROM PDRMYE.Departamentos WHERE NombreCorto='DAMOP';
 SELECT id INTO VIDPERFIL FROM PDRMYE.Perfil WHERE REFERENCIA='ANA';
 END;
 

 
	INSERT INTO OpCabecera (
	id, ModificadoPor, CreadoPor, IdEstatus, ClaveFondo, Anio, Mes, idPerfilAsignado, idAreaAsignado, Total, TotalCompleto, Comentario, 
	idProveedor, idAcreedor, idMun, idtipo, ClavePresupuestal, llave) 
	VALUES (
	VIDOP, P_USUARIO, P_USUARIO, VIDESTATUS, VIDFONDO, P_ANIO, P_MES, VIDPERFIL, VIDAREA, VTOTAL, VTOTALCOMPLETO, 'OP', VIDPROVEEDOR, VIDACREEDOR, VIDMUN, P_TIPO, VCLAVEPRESUP, VLLAVE);
	
 INSERT INTO PDRMYE.CalculoTotalDetalle(
	CreadoPor,
	ModificadoPor,
	idCalculoTotal,
	IdMun,
	Mensual
)
SELECT 
P_USUARIO,
P_USUARIO,
VIDCALPRIN,
mun.ID,
0
FROM 
 PDRMYE.Municipios mun
WHERE mun.deleted=0 ;



INSERT INTO OpDetalle 
(CreadoPor, 
ModificadoPor,
IdOp, 
IdMun, 
Total, 
Comentario)
VALUES (
P_USUARIO, 
P_USUARIO, 
VIDOP, 
P_MUNICIPIO, 
11.00, 
P_COMENTARIO
);

 SELECT
mun.Nombre, mun.UResponsable, mun.ClavePSIREGOB, mun.ClaveDSIREGOB,
f.Clave,
f.NumProyecto,
cp.Anio, cp.Mes,
e.Descripcion,
paa.total,
paa.ClavePresupuestal
FROM
Municipios mun
INNER JOIN PA paa ON mun.id = paa.idMunicipio
INNER JOIN Fondos f ON f.id = paa.idFondo
INNER JOIN CalculoPrincipal cp ON cp.id = paa.idCalculoPrincipal
INNER JOIN Estatus e ON e.id = paa.idEstatus
WHERE mun.id = P_MUNICIPIO;



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
