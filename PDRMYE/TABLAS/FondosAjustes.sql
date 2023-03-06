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

-- Volcando estructura para tabla PDRMYE.FondosAjustes
DROP TABLE IF EXISTS `FondosAjustes`;
CREATE TABLE IF NOT EXISTS `FondosAjustes` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `idFondo` char(36) NOT NULL,
  `idAjuste` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_FA_FONDO` (`idFondo`),
  KEY `FK2_FA_AJUSTE` (`idAjuste`),
  CONSTRAINT `FK1_FA_FONDO` FOREIGN KEY (`idFondo`) REFERENCES `Fondos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_FA_AJUSTE` FOREIGN KEY (`idAjuste`) REFERENCES `Ajustes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabla para Guardar la Relación de los fondos con sus ajustes permitidos';

-- Volcando datos para la tabla PDRMYE.FondosAjustes: ~12 rows (aproximadamente)
DELETE FROM `FondosAjustes`;
/*!40000 ALTER TABLE `FondosAjustes` DISABLE KEYS */;
INSERT INTO `FondosAjustes` (`id`, `idFondo`, `idAjuste`) VALUES
	('08287418-726e-11ed-a880-040300000000', '24c8d568-2b0e-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('4269b7a6-70e0-11ed-a880-040300000000', '0818a311-2b0e-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('65038ed9-7282-11ed-a880-040300000000', 'ef08ed38-2b0d-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('741e4fbc-726f-11ed-a880-040300000000', '10a84694-2b0e-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('b107e12c-8c48-11ed-88bc-040300000000', '53d4812f-2b0e-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('c1ef84a5-95f0-11ed-88bc-040300000000', 'b9237c4d-3507-11ed-aed0-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('c45b62eb-822f-11ed-a963-040300000000', 'fa97f121-2b0d-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('e205136d-9845-11ed-88bc-040300000000', '7a8d2721-2b0f-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('e92fe5d7-6b5c-11ed-8793-040300000000', 'da89175f-2b0d-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('f5371dff-7271-11ed-a880-040300000000', '1c8df2da-2b0e-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('fa46d3f6-7271-11ed-a880-040300000000', '2fc1d686-2b0e-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000'),
	('fe668b4d-7271-11ed-a880-040300000000', '383627ad-2b0e-11ed-afdb-040300000000', 'bebf472f-4361-11ed-aea4-040300000000');
/*!40000 ALTER TABLE `FondosAjustes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
