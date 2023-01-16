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

-- Volcando estructura para tabla PDRMYE.UsuarioResponsableMunicipio
CREATE TABLE IF NOT EXISTS `UsuarioResponsableMunicipio` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `idUsuario` char(36) NOT NULL,
  `IdMuncipio` char(36) NOT NULL,
  `idUsuarioDelegado` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UsuarioResponsable` (`idUsuario`,`IdMuncipio`),
  KEY `FK2_URM_MUN` (`IdMuncipio`),
  KEY `FK3_URM_DELEGADO` (`idUsuarioDelegado`),
  CONSTRAINT `FK1_URM_USUARIO` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_URM_MUN` FOREIGN KEY (`IdMuncipio`) REFERENCES `Municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3_URM_DELEGADO` FOREIGN KEY (`idUsuarioDelegado`) REFERENCES `Usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='relacionar usuarios responsable con su correspondiente municipio';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
