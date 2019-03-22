-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-03-2019 a las 00:24:35
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planilla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `codigo_departamento` varchar(10) NOT NULL,
  `nombre_departamento` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`codigo_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

DROP TABLE IF EXISTS `detalle`;
CREATE TABLE IF NOT EXISTS `detalle` (
  `codigo_nomina` varchar(5) NOT NULL,
  `codigo_empleado` varchar(10) NOT NULL,
  `valor_nominadetalle` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo_nomina`,`codigo_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `codigo_empleado` varchar(10) NOT NULL,
  `nombre_empleado` varchar(60) NOT NULL,
  `sueldo_empleado` float DEFAULT NULL,
  `codigo_puesto` varchar(10) NOT NULL,
  `codigo_departamento` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo_puesto`),
  KEY `FK_departamentoempleado` (`codigo_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezado`
--

DROP TABLE IF EXISTS `encabezado`;
CREATE TABLE IF NOT EXISTS `encabezado` (
  `codigo_nomina` varchar(5) NOT NULL,
  PRIMARY KEY (`codigo_nomina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

DROP TABLE IF EXISTS `puesto`;
CREATE TABLE IF NOT EXISTS `puesto` (
  `codigo_puesto` varchar(10) NOT NULL,
  `nombre_puesto` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`codigo_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `codigo_usuario` varchar(15) NOT NULL,
  `nombre_usuario` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`codigo_usuario`, `nombre_usuario`) VALUES
('012', 'Brian');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `FK_encabezadodetalle` FOREIGN KEY (`codigo_nomina`) REFERENCES `encabezado` (`codigo_nomina`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_departamentoempleado` FOREIGN KEY (`codigo_departamento`) REFERENCES `departamento` (`codigo_departamento`),
  ADD CONSTRAINT `FK_puestoempleado` FOREIGN KEY (`codigo_puesto`) REFERENCES `puesto` (`codigo_puesto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
