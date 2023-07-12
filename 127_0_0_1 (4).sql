-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-07-2023 a las 19:42:31
-- Versión del servidor: 8.0.33
-- Versión de PHP: 7.4.3-4ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebascodo`
--
CREATE DATABASE IF NOT EXISTS `pruebascodo` DEFAULT CHARACTER SET utf8mb4;
USE `pruebascodo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_c` int NOT NULL,
  `dni` int NOT NULL,
  `cant_p` int NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_c`, `dni`, `cant_p`, `importe`) VALUES
(1, 11, 0, 0),
(2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detVentas`
--

CREATE TABLE `detVentas` (
  `id` int NOT NULL,
  `nFactura` int NOT NULL,
  `id_p` int NOT NULL,
  `cantidad` int NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detVentas`
--

INSERT INTO `detVentas` (`id`, `nFactura`, `id_p`, `cantidad`, `importe`) VALUES
(1, 1, 1, 2, 9000),
(2, 2, 2, 1, 3200),
(3, 3, 1, 1, 4500),
(4, 4, 1, 1, 4500),
(5, 6, 8, 2, 3200),
(6, 6, 8, 2, 3200),
(7, 7, 7, 2, 1500),
(8, 8, 7, 2, 1500),
(9, 9, 1, 2, 9000),
(10, 2, 2, 1, 3200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_carrito`
--

CREATE TABLE `det_carrito` (
  `id_d` int NOT NULL,
  `id_c` int NOT NULL,
  `id_p` int NOT NULL,
  `cant` int NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `det_carrito`
--

INSERT INTO `det_carrito` (`id_d`, `id_c`, `id_p`, `cant`, `importe`) VALUES
(1, 1, 1, 1, 0),
(2, 1, 2, 1, 0),
(3, 1, 1, 1, 0),
(4, 1, 1, 1, 0),
(5, 1, 1, 1, 0),
(6, 1, 2, 1, 0),
(7, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_p` int NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_p`, `descripcion`, `precio`) VALUES
(1, 'bolsa de papa x30', 4500),
(2, 'bolsa cebolla x 18 k', 3200),
(3, 'Azúcar', 650),
(5, 'fideo', 600),
(6, 'Arroz', 450),
(7, 'Yerba', 750),
(9, 'papafritas', 25000),
(10, 'mermelada', 800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `dni` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pass` varchar(15) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`dni`, `nombre`, `apellido`, `username`, `pass`) VALUES
(11, 'prueba', 'prueba', 'prueba', '123'),
(222, 'Juan', 'Perez', 'gff', '123'),
(4444, '4444', '55', '45', '444'),
(22222, 'Juan', 'Perez', 'gff', '123'),
(22234, 'ana', 'bell', 'abell', 'anass'),
(999999, '4444', '55', '45', '444'),
(40564351, 'rosa', 'paz', 'rpaz', '147'),
(40564359, 'ROSA', 'PAZ', 'RPAZ', '12347'),
(43234567, 'juana', 'lopez', 'jlopez', '1234'),
(201256987, 'JUANA', 'LOPEZ', 'JLOPEZ', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios2`
--

CREATE TABLE `usuarios2` (
  `dni` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pass` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios2`
--

INSERT INTO `usuarios2` (`dni`, `nombre`, `apellido`, `username`, `pass`) VALUES
(45794658, 'renzo', 'juez', 'rjuez', '147');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `nFactura` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cliente` varchar(50) NOT NULL,
  `monto` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`nFactura`, `fecha`, `cliente`, `monto`) VALUES
(1, '2023-07-11 00:00:00', 'juan', 9010),
(2, '2023-07-11 00:00:00', 'juana', 6410),
(3, '2023-07-11 00:00:00', 'marcos', 4510),
(4, '2023-07-11 00:00:00', 'ana', 4500),
(6, '2023-07-11 00:00:00', 'jorge', 6400),
(7, '2023-07-12 00:00:00', 'juan', 1500),
(8, '2023-07-11 00:00:00', 'Nico', 1500),
(9, '2023-07-12 00:00:00', 'sergio', 9000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_c`);

--
-- Indices de la tabla `detVentas`
--
ALTER TABLE `detVentas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `det_carrito`
--
ALTER TABLE `det_carrito`
  ADD PRIMARY KEY (`id_d`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_p`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `usuarios2`
--
ALTER TABLE `usuarios2`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`nFactura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_c` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detVentas`
--
ALTER TABLE `detVentas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `det_carrito`
--
ALTER TABLE `det_carrito`
  MODIFY `id_d` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_p` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
