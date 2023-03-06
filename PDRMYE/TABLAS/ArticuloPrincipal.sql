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

-- Volcando estructura para tabla PDRMYE.ArticuloPrincipal
DROP TABLE IF EXISTS `ArticuloPrincipal`;
CREATE TABLE IF NOT EXISTS `ArticuloPrincipal` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `Version` varchar(255) NOT NULL DEFAULT '1',
  `Clave` int(11) NOT NULL DEFAULT 0,
  `Articulo` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='tabla para guardar información de los articulos';

-- Volcando datos para la tabla PDRMYE.ArticuloPrincipal: ~36 rows (aproximadamente)
DELETE FROM `ArticuloPrincipal`;
/*!40000 ALTER TABLE `ArticuloPrincipal` DISABLE KEYS */;
INSERT INTO `ArticuloPrincipal` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Version`, `Clave`, `Articulo`) VALUES
	('045c0875-9135-11ed-88bc-040300000000', _binary 0x31, '2023-01-11 13:47:59', '2023-01-10 16:20:41', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '13', 1, 'Articulo 14 F I'),
	('097cf111-7d63-11ed-b48e-040300000000', _binary 0x31, '2022-12-16 11:17:20', '2022-12-16 10:59:43', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '3', 3, 'Articulo 14 F III'),
	('0b5e7653-7d65-11ed-b48e-040300000000', _binary 0x31, '2022-12-20 15:54:29', '2022-12-16 11:14:05', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '7', 1, 'Articulo 14 F I'),
	('0d937b3c-8ae4-11ed-88bc-040300000000', _binary 0x31, '2023-01-02 16:07:10', '2023-01-02 15:26:00', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '9', 1, 'Articulo 14 F I'),
	('187c393e-912a-11ed-88bc-040300000000', _binary 0x31, '2023-01-10 16:04:27', '2023-01-10 15:02:30', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '11', 1, 'Articulo 14 F I'),
	('1c47d983-465a-11ed-aea4-040300000000', _binary 0x31, '2022-12-02 10:42:52', '2022-10-07 11:07:13', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '1', 1, 'Articulo 14 F I'),
	('1ef7daf9-7d62-11ed-b48e-040300000000', _binary 0x31, '2022-12-16 11:14:05', '2022-12-16 10:53:09', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '6', 1, 'Articulo 14 F I'),
	('2bda613e-8aea-11ed-88bc-040300000000', _binary 0x31, '2023-01-13 12:47:55', '2023-01-02 16:09:48', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '8', 2, 'Articulo 14 F II'),
	('36d12e09-7d60-11ed-b48e-040300000000', _binary 0x31, '2022-12-16 10:48:57', '2022-12-16 10:39:30', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '4', 1, 'Articulo 14 F I'),
	('37ccb8bf-465a-11ed-aea4-040300000000', _binary 0x31, '2022-12-02 10:47:41', '2022-10-07 11:07:59', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '1', 3, 'Articulo 14 F III'),
	('3b2abebb-48e2-11ed-ad60-040300000000', _binary 0x31, '2022-12-02 10:46:55', '2022-10-10 16:26:39', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '1', 2, 'Articulo 14 F II'),
	('4aab7cb8-7d65-11ed-b48e-040300000000', _binary 0x31, '2022-12-20 16:00:00', '2022-12-16 11:15:51', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '6', 2, 'Articulo 14 F II'),
	('4ff1d14e-7269-11ed-a880-040300000000', _binary 0x31, '2022-12-16 09:46:24', '2022-12-02 10:46:55', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '2', 2, 'Articulo 14 F II'),
	('6256626b-8aea-11ed-88bc-040300000000', _binary 0x31, '2023-01-10 16:26:48', '2023-01-02 16:11:19', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '6', 3, 'Articulo 14 F III'),
	('6b21d8db-7269-11ed-a880-040300000000', _binary 0x31, '2022-12-16 10:59:43', '2022-12-02 10:47:41', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '2', 3, 'Articulo 14 F III'),
	('7b8c07c9-b868-11ed-8002-d89d6776f970', _binary 0x31, '2023-03-01 13:54:37', '2023-03-01 11:37:20', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '17', 1, 'Articulo 14 F I'),
	('7f4ad797-7d65-11ed-b48e-040300000000', _binary 0x31, '2022-12-20 16:00:42', '2022-12-16 11:17:19', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '4', 3, 'Articulo 14 F III'),
	('8890b25c-7d61-11ed-b48e-040300000000', _binary 0x31, '2022-12-16 10:53:09', '2022-12-16 10:48:57', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '5', 1, 'Articulo 14 F I'),
	('a1f70ed8-91e9-11ed-88bc-040300000000', _binary 0x31, '2023-02-03 12:38:26', '2023-01-11 13:53:34', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '15', 1, 'Articulo 14 F I'),
	('a5eb7480-80b1-11ed-a963-040300000000', _binary 0x31, '2023-01-02 16:09:48', '2022-12-20 15:59:59', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '7', 2, 'Articulo 14 F II'),
	('a925d5be-b87b-11ed-8002-d89d6776f970', _binary 0x30, '2023-03-01 13:54:37', '2023-03-01 13:54:37', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '18', 1, 'Articulo 14 F I'),
	('ae8d5311-7d62-11ed-b48e-040300000000', _binary 0x31, '2022-12-16 11:15:51', '2022-12-16 10:57:10', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '5', 2, 'Articulo 14 F II'),
	('b4092b87-9370-11ed-88bc-040300000000', _binary 0x30, '2023-01-13 12:32:58', '2023-01-13 12:32:58', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '8', 3, 'Articulo 14 F III'),
	('b5716c7c-7d59-11ed-b48e-040300000000', _binary 0x31, '2022-12-16 10:57:10', '2022-12-16 09:52:56', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '4', 2, 'Articulo 14 F II'),
	('bed0d54b-7268-11ed-a880-040300000000', _binary 0x31, '2022-12-16 10:36:57', '2022-12-02 10:42:52', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '2', 1, 'Articulo 14 F I'),
	('bf48906a-80b1-11ed-a963-040300000000', _binary 0x31, '2023-01-02 16:11:19', '2022-12-20 16:00:42', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '5', 3, 'Articulo 14 F III'),
	('c0019f83-9132-11ed-88bc-040300000000', _binary 0x31, '2023-01-10 16:20:41', '2023-01-10 16:04:27', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '12', 1, 'Articulo 14 F I'),
	('ca78c89e-9372-11ed-88bc-040300000000', _binary 0x31, '2023-02-03 12:44:53', '2023-01-13 12:47:55', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '9', 2, 'Articulo 14 F II'),
	('cb4b56b8-7d58-11ed-b48e-040300000000', _binary 0x31, '2022-12-16 09:52:56', '2022-12-16 09:46:23', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '3', 2, 'Articulo 14 F II'),
	('cdac1bd8-8ae9-11ed-88bc-040300000000', _binary 0x31, '2023-01-10 15:02:30', '2023-01-02 16:07:10', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '10', 1, 'Articulo 14 F I'),
	('d913e49f-a3f2-11ed-854b-040300000000', _binary 0x30, '2023-02-03 12:44:53', '2023-02-03 12:44:53', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '10', 2, 'Articulo 14 F II'),
	('da2c0c57-91e8-11ed-88bc-040300000000', _binary 0x31, '2023-01-11 13:53:34', '2023-01-11 13:47:59', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '14', 1, 'Articulo 14 F I'),
	('db764d6e-7d5f-11ed-b48e-040300000000', _binary 0x31, '2022-12-16 10:39:30', '2022-12-16 10:36:57', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '3', 1, 'Articulo 14 F I'),
	('df663d55-9135-11ed-88bc-040300000000', _binary 0x31, '2023-01-13 12:32:58', '2023-01-10 16:26:48', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '7', 3, 'Articulo 14 F III'),
	('e0d52915-80b0-11ed-a963-040300000000', _binary 0x31, '2023-01-02 15:26:00', '2022-12-20 15:54:29', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '8', 1, 'Articulo 14 F I'),
	('f1fbf88b-a3f1-11ed-854b-040300000000', _binary 0x31, '2023-03-01 11:37:20', '2023-02-03 12:38:26', '5430da9a-71da-11ed-a880-040300000000', '5430da9a-71da-11ed-a880-040300000000', '16', 1, 'Articulo 14 F I');
/*!40000 ALTER TABLE `ArticuloPrincipal` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
