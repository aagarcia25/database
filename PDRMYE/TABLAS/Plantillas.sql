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

-- Volcando estructura para tabla PDRMYE.Plantillas
DROP TABLE IF EXISTS `Plantillas`;
CREATE TABLE IF NOT EXISTS `Plantillas` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `referencia` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreadoPor` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ModificadoPor` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla PDRMYE.Plantillas: ~2 rows (aproximadamente)
DELETE FROM `Plantillas`;
/*!40000 ALTER TABLE `Plantillas` DISABLE KEYS */;
INSERT INTO `Plantillas` (`id`, `referencia`, `body`, `CreadoPor`, `ModificadoPor`, `UltimaActualizacion`, `FechaCreacion`, `deleted`) VALUES
	('3b61bd94-660b-11ed-a880-040300000000', '001', '<!DOCTYPE html>\n<html lang="en">\n  <head>\n    <meta charset="UTF-8" />\n  </head>\n\n  <body>\n    <h1>\n      Solicitud de revisión de cálculo\n    </h1>\n      \n   <p><h3> Hola: {{usuarioD}}</h3></p>\n <br /><br />\n   <p><h3> Se solicita su atención para revisar el siguiente cálculo de : {{fondo}}</h3></p>\n    <p><h3>Corespondiente al mes de: {{mes}}, año: {{anio}}</h3></p>\n    <p><h3>Comentario : {{comentario}}</h3></p>\n    \n    <br /><br /><br />\n    Este correo es generado automaticamente  *No Responder*\n    <br />\n\n    <p>  Lliga de acceso al portal: <a href="{{URL}}" target="_blank" rel="noopener noreferrer">Distribución de Recursos</a></p>\n    <br /><br /><br /><br /><br />\n\n    <div align="center">Saludos</div>\n    <div align="center">{{usuarioO}}</div>\n  </body>\n</html>', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '2023-01-27 17:55:25', '2022-11-16 17:03:14', _binary 0x30),
	('46a100c8-a0cf-11ed-802e-2c4138b7dab1', '002', '<!DOCTYPE html>\r\n<html lang="en">\r\n  <head>\r\n    <meta charset="UTF-8" />\r\n  </head>\r\n\r\n  <body>\r\n    <h1>\r\n      {{encabezado}} \r\n    </h1>\r\n      \r\n   <p><h3> Hola: {{usuarioD}}</h3></p>\r\n <br /><br />\r\n   <p><h3> Se solicita su atención.</h3></p>\r\n   <p><h3>  {{descripcion}}</h3></p>\r\n\r\n    \r\n    <br /><br /><br />\r\n    Este correo es generado automaticamente  *No Responder*\r\n    <br />\r\n\r\n    <p>  Lliga de acceso al portal: <a href="{{URL}}" target="_blank" rel="noopener noreferrer">Distribución de Recursos</a></p>\r\n    <br /><br /><br /><br /><br />\r\n\r\n    <div align="center">Saludos</div>\r\n    <div align="center">{{usuarioO}}</div>\r\n     <div align="center">Solicitante</div>\r\n  </body>\r\n</html>', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', '2023-01-30 13:50:45', '2023-01-30 12:52:42', _binary 0x30);
/*!40000 ALTER TABLE `Plantillas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
