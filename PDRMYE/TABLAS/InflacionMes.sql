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

-- Volcando estructura para tabla PDRMYE.InflacionMes
DROP TABLE IF EXISTS `InflacionMes`;
CREATE TABLE IF NOT EXISTS `InflacionMes` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `Anio` int(4) NOT NULL,
  `Mes` int(2) NOT NULL,
  `Inflacion` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de la inflación y crecimiento por mes';

-- Volcando datos para la tabla PDRMYE.InflacionMes: ~13 rows (aproximadamente)
DELETE FROM `InflacionMes`;
/*!40000 ALTER TABLE `InflacionMes` DISABLE KEYS */;
INSERT INTO `InflacionMes` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Anio`, `Mes`, `Inflacion`) VALUES
	('06184f8b-3475-11ed-aed0-040300000000', _binary 0x31, '2022-11-30 17:44:14', '2022-09-14 16:34:33', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2022, 7, 14.00),
	('06da4a49-2b06-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:27:12', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 11, 7.37),
	('0fee8ca9-2b06-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:27:28', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 12, 7.36),
	('9e325cd6-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-12-09 09:43:43', '2022-09-02 11:24:04', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', 2021, 1, 3.50),
	('b20c1031-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:24:50', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 2, 3.76),
	('babab2cd-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:25:05', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 3, 4.67),
	('c4117d87-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:25:20', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 4, 6.08),
	('cab93a83-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:25:31', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 5, 5.89),
	('d428e59f-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:25:47', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 6, 5.88),
	('db4d7b6d-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:25:59', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 7, 5.81),
	('e56a990c-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:26:16', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 8, 5.59),
	('f64a468b-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:26:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 9, 6.00),
	('ff25a815-2b05-11ed-afdb-040300000000', _binary 0x30, '2022-11-30 17:44:14', '2022-09-02 11:26:59', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 2021, 10, 6.24);
/*!40000 ALTER TABLE `InflacionMes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
