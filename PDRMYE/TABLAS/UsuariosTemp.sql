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

-- Volcando estructura para tabla PDRMYE.UsuariosTemp
DROP TABLE IF EXISTS `UsuariosTemp`;
CREATE TABLE IF NOT EXISTS `UsuariosTemp` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
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
  `usuario` varchar(50) DEFAULT NULL,
  `idUsuarioCentral` char(36) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla PDRMYE.UsuariosTemp: ~4 rows (aproximadamente)
DELETE FROM `UsuariosTemp`;
/*!40000 ALTER TABLE `UsuariosTemp` DISABLE KEYS */;
INSERT INTO `UsuariosTemp` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `RutaFoto`, `Puesto`, `Ubicacion`, `idDepartamento`, `idPerfil`, `idSolicitud`, `idUResp`, `UsuarioSiregob`, `usuario`, `idUsuarioCentral`) VALUES
	('09e620ae-b87d-11ed-8002-d89d6776f970', _binary 0x30, '2023-03-01 14:04:29', '2023-03-01 14:04:29', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', NULL, 'Analista', NULL, 'f99fe513-516d-11ed-ab6c-040300000000', 'a80ecf6a-4b33-11ed-a964-040300000000', '09e620ae-b87d-11ed-8002-d89d6776f970', '912be9c9-6c4f-11ed-a880-040300000000', NULL, 'pedroh.salazar', '09e620ae-b87d-11ed-8002-d89d6776f970'),
	('40ad483f-b87d-11ed-8002-d89d6776f970', _binary 0x30, '2023-03-01 14:06:01', '2023-03-01 14:06:01', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', NULL, 'Coordinador', NULL, 'f99fe513-516d-11ed-ab6c-040300000000', 'b6ff3f86-4b33-11ed-a964-040300000000', '40ad483f-b87d-11ed-8002-d89d6776f970', '912be9c9-6c4f-11ed-a880-040300000000', NULL, 'mayela.guajardo', '40ad483f-b87d-11ed-8002-d89d6776f970'),
	('cb993d7a-b84f-11ed-8002-d89d6776f970', _binary 0x30, '2023-03-01 08:40:37', '2023-03-01 08:40:37', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', NULL, 'Analista', NULL, 'f99fe513-516d-11ed-ab6c-040300000000', 'a80ecf6a-4b33-11ed-a964-040300000000', 'cb993d7a-b84f-11ed-8002-d89d6776f970', '912be9c9-6c4f-11ed-a880-040300000000', NULL, 'karla.delgado', 'cb993d7a-b84f-11ed-8002-d89d6776f970'),
	('f739ea4e-b7b0-11ed-8002-d89d6776f970', _binary 0x30, '2023-02-28 13:43:40', '2023-02-28 13:43:40', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', NULL, 'COORDINADOR', NULL, 'f99fe513-516d-11ed-ab6c-040300000000', 'a80ecf6a-4b33-11ed-a964-040300000000', 'f739ea4e-b7b0-11ed-8002-d89d6776f970', '912be9c9-6c4f-11ed-a880-040300000000', NULL, 'monica.gonzalezs', 'f739ea4e-b7b0-11ed-8002-d89d6776f970');
/*!40000 ALTER TABLE `UsuariosTemp` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
