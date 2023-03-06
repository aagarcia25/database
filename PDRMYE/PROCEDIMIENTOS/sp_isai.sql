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

-- Volcando estructura para procedimiento PDRMYE.sp_isai
DELIMITER //
CREATE PROCEDURE `sp_isai`()
    COMMENT 'Actualiza el coeficiente del isai'
BEGIN


DECLARE VTOTAL DECIMAL(30,2);
DECLARE VVERSION INT;

SELECT SUM(muni.Importe) into VTOTAL FROM  PDRMYE.MunIsai muni WHERE muni.deleted=0;
SELECT IFNULL(max(muni.Version),0) INTO VVERSION FROM PDRMYE.MunIsai muni;

UPDATE PDRMYE.MunIsai muni SET muni.Version= VVERSION +1 WHERE muni.deleted=0;

UPDATE PDRMYE.MunIsai muni
SET muni.Coeficiente= muni.Importe/VTOTAL
WHERE muni.deleted=0
AND muni.Version= VVERSION +1
;



END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
