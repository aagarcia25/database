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

-- Volcando estructura para procedimiento PDRMYE.sp_DistribuirFideicomisos
DROP PROCEDURE IF EXISTS `sp_DistribuirFideicomisos`;
DELIMITER //
CREATE PROCEDURE `sp_DistribuirFideicomisos`(
	IN `P_IDREGISTRO` CHAR(36),
	IN `P_USUARIO` CHAR(36)
)
    COMMENT 'Procedimiento que distribuye un registro entre sus fideicomisos'
BEGIN

/*RUTINA QUE DISTRIBUYE UNA PARTICION ENTRE LOS FIDEICOMISOS DE UN MUNICIPIO*/
DECLARE done INT DEFAULT FALSE;


DECLARE VIDUNICIPIO CHAR(36);
DECLARE VClaveSiregob VARCHAR(50);
DECLARE VPorcentaje DECIMAL(20,2);
DECLARE VNombre VARCHAR(150);
DECLARE VTOTAL  DECIMAL(30,2);
DECLARE VRESTAPORCENAJE DECIMAL(20,2);

 /*SE DECLARA CURSOR PARA AREGLO DE MESES*/

DECLARE c1 CURSOR FOR (SELECT ClaveSiregob,Porcentaje ,Nombre FROM PDRMYE.MunFideicomiso MUNF WHERE MUNF.IdMun=VIDUNICIPIO);
DECLARE CONTINUE HANDLER FOR NOT FOUND,SQLEXCEPTION SET done = TRUE;

SELECT IDMUNICIPIO ,TOTAL INTO VIDUNICIPIO,VTOTAL FROM PDRMYE.PA WHERE ID=P_IDREGISTRO;


OPEN c1;
  loopc1:LOOP
     fetch c1 INTO VClaveSiregob,VPorcentaje,VNombre;

   -- si no hay mas registros se sale del cursor
       if done then
       leave loopc1;
       END if;
       


INSERT INTO PDRMYE.PA(
   CreadoPor,
   ModificadoPor,
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
	Clasificacion,
	ClaveBeneficiario,
	DescripcionBeneficiario
	
)
      SELECT
      P_USUARIO,
      P_USUARIO,
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
	total *  VPorcentaje / 100,
	NumProyecto,
	ConceptoEgreso,
	ConceptoCheque,
	idDivisa,
	Uresp,
	Clasificacion,
	VClaveSiregob,
	VNombre
	FROM PDRMYE.PA WHERE ID=P_IDREGISTRO;




  END loop loopc1;
CLOSE c1;


-- SUMAMOS LA DISTRIBUCION DE LOS MUNICIPIOS

SELECT 100 - SUM(Porcentaje)   INTO  VRESTAPORCENAJE FROM PDRMYE.MunFideicomiso MUNF WHERE MUNF.IdMun=VIDUNICIPIO;


UPDATE PDRMYE.PA SET total = total *  VRESTAPORCENAJE / 100 ,ModificadoPor= P_USUARIO WHERE ID=P_IDREGISTRO;




END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
