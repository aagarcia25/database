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

-- Volcando estructura para procedimiento PDRMYE.sp_DAMOPGeneraAnticiposPrestamo
DELIMITER //
CREATE PROCEDURE `sp_DAMOPGeneraAnticiposPrestamo`()
    COMMENT 'Inserta los anticipos de prestamos'
BEGIN

INSERT INTO PDRMYE.PA(
   CreadoPor,
   ModificadoPor,
   Anio,
   Mes,
   Uresp,
   idMunicipio,
   ClaveEstado,
   total,
   NumProyecto,
   ClaveBeneficiario,
	DescripcionBeneficiario,
	idDivisa,
	idTipoParticipacion,
	Observaciones,
	ConceptoCheque
	
)

SELECT 
us.id,
us.id,
tbl.Anio,
tbl.mes,
ures.id AS ures,
mun.id,
mun.ClaveEstado,
tbl.Importe,
tbl.Proyecto,
tbl.ClaveBeneficiario,
tbl.Beneficiario,
'd7c1ea77-7049-11ed-a880-040300000000' AS idDivisa,
'8a5e35c6-6c52-11ed-a880-040300000000' as idTipoParticipacion,
tbl.Descripcion,
cheque.id  AS ConceptoCheque
FROM 
PDRMYE.TblAnticiposParticipacionesPrest tbl
LEFT JOIN PDRMYE.Usuarios us ON us.id = tbl.idusuario
LEFT JOIN PDRMYE.Municipios mun  ON mun.ClaveEstado = tbl.ClaveEstadoMunicipio
LEFT JOIN PDRMYE.UResponsable ures ON ures.id = us.idUResp
LEFT JOIN PDRMYE.ConceptoCheque cheque ON cheque.ClaveSIREGOB = tbl.ConceptoCheque
;

TRUNCATE TABLE PDRMYE.TblAnticiposParticipacionesPrest;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
