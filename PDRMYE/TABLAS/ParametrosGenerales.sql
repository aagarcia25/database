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

-- Volcando estructura para tabla PDRMYE.ParametrosGenerales
DROP TABLE IF EXISTS `ParametrosGenerales`;
CREATE TABLE IF NOT EXISTS `ParametrosGenerales` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `deleted` binary(1) NOT NULL DEFAULT '0',
  `UltimaActualizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ModificadoPor` char(36) NOT NULL DEFAULT '1',
  `CreadoPor` char(36) NOT NULL DEFAULT '1',
  `Nombre` varchar(50) NOT NULL DEFAULT '',
  `Valor` varchar(100) NOT NULL DEFAULT '',
  `slug` varchar(100) DEFAULT NULL COMMENT 'Campo para rutas amigables',
  `Descripcion` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Parametros generales configurables de la aplicacion';

-- Volcando datos para la tabla PDRMYE.ParametrosGenerales: ~42 rows (aproximadamente)
DELETE FROM `ParametrosGenerales`;
/*!40000 ALTER TABLE `ParametrosGenerales` DISABLE KEYS */;
INSERT INTO `ParametrosGenerales` (`id`, `deleted`, `UltimaActualizacion`, `FechaCreacion`, `ModificadoPor`, `CreadoPor`, `Nombre`, `Valor`, `slug`, `Descripcion`) VALUES
	('f1b82392-4a41-11ed-ad60-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FISM_MESES', '10', 'CPH', 'Número de meses para la distribución del FISM'),
	('f7ded3e3-4a41-11ed-ad60-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'MESES_FORTAMUN', '12', 'CPH', 'Número de meses para la distribucipón del FORTAMUN'),
	('33c43828-4a51-11ed-ad60-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '5430da9a-71da-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'AppID', '973ecf89-38ff-11ed-aed0-040300000000', 'CGI', 'id de la aplicación'),
	('555908bd-4bd6-11ed-a964-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FISM_POBLACION_1', '2015', 'CPH', 'Parametro que indica el año de la primera variable para el FISM'),
	('5e01d106-4bd6-11ed-a964-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FISM_POBLACION_2', '2020', 'CPH', 'Parametro que indica el año de la segunda variables para el FISM'),
	('a6e2555c-50a4-11ed-ab6c-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '5430da9a-71da-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'LEY_EGRESOS', '36930292', 'CPH', 'Parametro que indica la cantidad de ley de egreso de forma mensual'),
	('fa6d3f45-5970-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FOULT_F_ULTRA_CREC', '3.68', 'CPH', 'de la suma del fondo de Ultracrecimiento a cada uno de los Municipios referidos en el artículo 29 de esta Ley; y'),
	('17e0ccb9-5971-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'F_ULTRA_CREC50%', '0.5', 'CPH', 'El monto que resulte, una vez que se reste lo considerado en la fracción previa, se distribuirá entre los Municipios en un 50% de acuerdo al número de habitantes en los Municipios que establece el artículo 30 de esta Ley, tomando como base la última información estadística con que cuente el INEGI y el restante 50 % de acuerdo al coeficiente de distribución que les resulte a dichos Municipios de la aplicación de la fórmula establecida en el artículo 14 fracción I de esta Ley, normalizando la suma de ellos como el 100 %.'),
	('853d7b79-5a0b-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'F_DES_MPAL_MAM', '0.0256', 'CPH', NULL),
	('d6364089-5a0c-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'F_DES_MPAL%DISTR', '0.0153', 'CPH', ''),
	('e61059d6-5a0d-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'MANM', '0.4', 'CPH', 'Porcentaje de distribución para los municipios del area no metropolitana'),
	('efcdc903-5a0d-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'MAM', '0.6', 'CPH', 'Porcentaje de distribución para los municipios del area metropolitana'),
	('0c757b3a-5a10-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FODES_MPAL_MANM', '1.28', 'CPH', NULL),
	('96bc431d-5a3d-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DIST_EFECT_REC_PRED', '0.5', 'CPH', NULL),
	('b6e9a901-5a3d-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DISTR_POB_TERR', '0.25', 'CPH', NULL),
	('c320b873-5a3d-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DIST_IND_POBR', '0.25', 'CPH', NULL),
	('d2833ac7-5ac5-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FOSEGMUN_DISTRI_EQUITAT_L_EGRESOS', '3000000', 'CPH', NULL),
	('1d1a54a0-5ac6-11ed-a988-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FOSEGMUN_DISTRI_EQUITAT_EROG_JAPUESTA', '1000000', 'CPH', NULL),
	('4fda4e49-607f-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DIST_ISN', '6.28', 'CPH', 'Parametro de Distribución del fondo de ISN'),
	('4c2f5bc4-6539-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'AMBIENTE', 'PRODUCCION', 'CTI', 'Parametro que indica el Ambiente de la Plataforma'),
	('f5982a23-6a8a-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'MONTO_DISTRIBUIDO', '8288380484.62 ', 'CPH', 'Parametro que indica el monto distribuido en partipaciones del año anterior'),
	('cdb386a5-6b7c-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'PO', '2020', 'CPH', 'Población para el calculo de los articulos '),
	('e2d489e8-6b7c-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', 'd1a8f9cd-71db-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'PC', '2022', 'CPH', 'Proyección de Población para el cálculo'),
	('75b0cc3e-6b85-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', 'd1a8f9cd-71db-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'BGt', '2022', 'CPH', 'Parametro de Facturación'),
	('8160b1b3-6b85-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', 'd1a8f9cd-71db-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Ri,t', '2022', 'CPH', 'Parametro que indica el año de la recaudación, para el caso de RPt-1 se al año configurado se le resta uno'),
	('007f1ca1-6b8c-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'PP2i', '2015', 'CPH', 'Parametro de personas en probreza año inmediato anterior de la ultima información publicada por el coneval'),
	('0d0a037e-6b8c-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'PP1i', '2020', 'CPH', 'Parametro de personas en probreza año inmediato  de la ultima información publicada por el coneval'),
	('6984038c-6c3f-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', 'd1a8f9cd-71db-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'UMA', '2023', 'CPH', 'Parametro para el cálculo de ICV'),
	('79c2758a-6f41-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'DISTRI_PARTICIPACIONES', '0.80', 'CPH', 'Parametro para definir el porcentaje de distribucion de las participaciones a las aportaciones'),
	('cf622c36-6f44-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FOULT_%DISTRIBUCION', '0.54', 'CPH', 'Parametro de Porcentaje de distribución para FOULT'),
	('178279d2-6f47-11ed-a880-040300000000', _binary 0x30, '2022-11-28 15:40:44', '2022-11-28 15:40:44', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FOULT_POBLACION', '2020', 'CPH', 'Parametro para obtener el año de la poblacion '),
	('d197bf70-6f71-11ed-a880-040300000000', _binary 0x30, '2022-11-28 16:10:15', '2022-11-28 16:10:15', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FOSEGMUN_%DISTRIBUCION', '1.84', 'CPH', NULL),
	('52a09f23-6f72-11ed-a880-040300000000', _binary 0x30, '2022-11-28 16:13:52', '2022-11-28 16:13:52', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FOSEGMUN_DISTRIBUCION_IEJA', '0.35', 'CPH', 'Parametro de Porcentaje de distribución de IEJA'),
	('d77d4312-6f79-11ed-a880-040300000000', _binary 0x30, '2022-11-28 17:07:41', '2022-11-28 17:07:41', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FODEM_%DISTRIBUCION', '1.53', 'CPH', 'Parametro de Porcentaje para la distribucion del FODEM'),
	('1726c26e-6f7a-11ed-a880-040300000000', _binary 0x30, '2022-11-28 17:09:28', '2022-11-28 17:09:28', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FODEM_%DISTRIBUCION_IGUALDAD', '2.56', 'CPH', NULL),
	('5b34b8bb-6f7d-11ed-a880-040300000000', _binary 0x30, '2022-11-28 17:32:50', '2022-11-28 17:32:50', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FODEM_%DISTRIBUCION_IGUALDAD_MANM', '1.28', 'CPH', NULL),
	('b4058781-8abb-11ed-88bc-040300000000', _binary 0x30, '2023-01-02 10:37:10', '2023-01-02 10:37:10', 'd1a8f9cd-71db-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'ANIO_OPERACION', '2023', 'CPH', 'Parámetro que espesifica el año de operación de la plataforma'),
	('9d3917c8-981b-11ed-88bc-040300000000', _binary 0x30, '2023-01-19 11:06:28', '2023-01-19 11:06:28', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'ANIO_GARANTIA', '2021', 'CPH', 'Año para tomar el porcentaje de garantia'),
	('c24db21d-9825-11ed-88bc-040300000000', _binary 0x30, '2023-01-19 12:19:05', '2023-01-19 12:19:05', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'FOSEGMUN_DISTRIBUCION_DERECHO', '0.35', 'CPH', 'Parametro de porcentaje de Distribución de Impuesto de Derechos'),
	('158e04f0-a27d-11ed-854b-040300000000', _binary 0x30, '2023-02-01 16:09:23', '2023-02-01 16:09:23', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'Login', 'http://10.210.0.28/', 'LOGIN', 'Dirección de Login'),
	('495ff3a0-a7da-11ed-8860-040300000000', _binary 0x30, '2023-02-08 11:59:09', '2023-02-08 11:59:09', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'INFLACION', '7.82', 'CPH', 'Parámetro que determina la inflación para el calculo de ISN'),
	('68082536-a7da-11ed-8860-040300000000', _binary 0x30, '2023-02-08 12:00:00', '2023-02-08 12:00:00', '30adc962-7109-11ed-a880-040300000000', '30adc962-7109-11ed-a880-040300000000', 'CRECIMIENTO', '18.08', 'CPH', 'Parámetro que detrmina el crecimiento para el cálculo de ISN');
/*!40000 ALTER TABLE `ParametrosGenerales` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
