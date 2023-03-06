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

-- Volcando estructura para tabla PDRMYE.TblAjustesFondos
DROP TABLE IF EXISTS `TblAjustesFondos`;
CREATE TABLE IF NOT EXISTS `TblAjustesFondos` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `Mes` int(2) NOT NULL,
  `Anio` int(4) NOT NULL,
  `Importe` decimal(20,2) NOT NULL DEFAULT 0.00,
  `IdMun` char(36) NOT NULL,
  `IdFondo` char(36) NOT NULL,
  `idAjuste` char(36) NOT NULL,
  `idCalculo` char(36) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_TBLAJUSTESFONDOS_ID` (`IdMun`) USING BTREE,
  KEY `FK2_TBLAJUSTESFONDOS_CLAVE` (`IdFondo`),
  KEY `FK3_TBLAJUSTESFONDOS_AJUSTE` (`idAjuste`),
  KEY `FK4_TBLAJUSTEFONDOS_CALCULO` (`idCalculo`),
  CONSTRAINT `FK1_TBLAJUSTESFONDOS_ID` FOREIGN KEY (`IdMun`) REFERENCES `Municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_TBLAJUSTESFONDOS_CLAVE` FOREIGN KEY (`IdFondo`) REFERENCES `Fondos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3_TBLAJUSTESFONDOS_AJUSTE` FOREIGN KEY (`idAjuste`) REFERENCES `Ajustes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK4_TBLAJUSTEFONDOS_CALCULO` FOREIGN KEY (`idCalculo`) REFERENCES `CalculoPrincipal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla de paso para guardar la informacion de los ajustes';

-- Volcando datos para la tabla PDRMYE.TblAjustesFondos: ~0 rows (aproximadamente)
DELETE FROM `TblAjustesFondos`;
/*!40000 ALTER TABLE `TblAjustesFondos` DISABLE KEYS */;
/*!40000 ALTER TABLE `TblAjustesFondos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
