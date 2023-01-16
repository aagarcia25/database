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

-- Volcando estructura para tabla PDRMYE.Usuarios
CREATE TABLE IF NOT EXISTS `Usuarios` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `idUsuarioCentral` char(36) NOT NULL,
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL,
  `CreadoPor` char(36) NOT NULL DEFAULT '',
  `RutaFoto` varchar(200) DEFAULT NULL,
  `Puesto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `Ubicacion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idDepartamento` char(36) DEFAULT NULL,
  `idPerfil` char(36) DEFAULT NULL,
  `idSolicitud` char(36) NOT NULL,
  `idUResp` char(36) DEFAULT NULL,
  `UsuarioSiregob` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_USUARIO_DEPARTAMENTO` (`idDepartamento`),
  KEY `FK2_USUARIO_PERFIL` (`idPerfil`),
  KEY `FK3_USUARIO_CENTRAL_FK` (`idUsuarioCentral`),
  KEY `FK4_USUARIO_URESP_FK` (`idUResp`),
  CONSTRAINT `FK1_USUARIO_DEPARTAMENTO` FOREIGN KEY (`idDepartamento`) REFERENCES `Departamentos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK2_USUARIO_PERFIL` FOREIGN KEY (`idPerfil`) REFERENCES `Perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK3_USUARIO_CENTRAL_FK` FOREIGN KEY (`idUsuarioCentral`) REFERENCES `TiCentral`.`Usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK4_USUARIO_URESP_FK` FOREIGN KEY (`idUResp`) REFERENCES `UResponsable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
