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

-- Volcando estructura para tabla PDRMYE.UsuarioRol
DROP TABLE IF EXISTS `UsuarioRol`;
CREATE TABLE IF NOT EXISTS `UsuarioRol` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `idUsuario` char(36) NOT NULL DEFAULT '',
  `idRol` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Índice 3` (`idUsuario`,`idRol`),
  KEY `FK2_UR_ROL` (`idRol`),
  CONSTRAINT `FK2_UR_ROL` FOREIGN KEY (`idRol`) REFERENCES `Roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_UR_USUARIO` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
