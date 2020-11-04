-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2020 a las 10:26:30
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restornwc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acompanamientos`
--

CREATE TABLE `acompanamientos` (
  `ID` int(11) NOT NULL,
  `Detalle` varchar(50) DEFAULT NULL,
  `IdGrupo` int(11) DEFAULT NULL,
  `Precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `ID` int(11) NOT NULL,
  `Detalle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centroproduccion`
--

CREATE TABLE `centroproduccion` (
  `ID` int(11) NOT NULL,
  `Id_sucursal` int(11) NOT NULL,
  `Detalle` varchar(50) DEFAULT NULL,
  `Activo` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

--
-- Volcado de datos para la tabla `centroproduccion`
--

INSERT INTO `centroproduccion` (`ID`, `Id_sucursal`, `Detalle`, `Activo`) VALUES
(1, 1, 'Cocina', 1),
(2, 1, 'Cafeteria', 1),
(3, 1, 'Confitera', 0),
(4, 2, 'Cocina', 1),
(5, 2, 'Cafeteria', 1),
(6, 2, 'Confitera', 0),
(7, 3, 'Cocina', 0),
(8, 3, 'Cafeteria', 1),
(9, 3, 'Confitera', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID` int(11) NOT NULL,
  `Paterno` varchar(20) DEFAULT NULL,
  `Materno` varchar(20) DEFAULT NULL,
  `Nombres` varchar(30) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `NroCelular` int(11) DEFAULT NULL,
  `Pass` tinyblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientesdir`
--

CREATE TABLE `clientesdir` (
  `ID` int(11) NOT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Coordenadas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregados`
--

CREATE TABLE `entregados` (
  `ID` int(11) NOT NULL,
  `IdSucursal` int(11) DEFAULT NULL,
  `IdDPM` varchar(20) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Cant` int(11) DEFAULT NULL,
  `FHPedido` datetime DEFAULT NULL,
  `FHEentrega` datetime DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupermis_secc`
--

CREATE TABLE `grupermis_secc` (
  `IdGrupo` int(11) DEFAULT NULL,
  `IdSeccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupoacomp`
--

CREATE TABLE `grupoacomp` (
  `ID` int(11) DEFAULT NULL,
  `Detalle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupopermisos`
--

CREATE TABLE `grupopermisos` (
  `ID` int(11) NOT NULL,
  `Grupo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `ID` int(11) NOT NULL,
  `Detalle` varchar(30) DEFAULT NULL,
  `Abreviacion` varchar(20) DEFAULT NULL,
  `Estado` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas_cp`
--

CREATE TABLE `mesas_cp` (
  `IdMesa` int(11) DEFAULT NULL,
  `IdCP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pendientes`
--

CREATE TABLE `pendientes` (
  `ID` int(11) NOT NULL,
  `IdSucursal` int(11) DEFAULT NULL,
  `IdDPM` varchar(20) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Cant` int(11) DEFAULT NULL,
  `FHPedido` datetime DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID` int(11) NOT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  `Dependencia` int(11) DEFAULT NULL,
  `Detalle` varchar(100) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Imagen` varchar(200) DEFAULT NULL,
  `IdCP` int(11) DEFAULT NULL,
  `Activo` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prod_acomp`
--

CREATE TABLE `prod_acomp` (
  `IdProducto` int(11) DEFAULT NULL,
  `IdAcomp` int(11) DEFAULT NULL,
  `Obligatorio` tinyint(4) DEFAULT NULL,
  `CantPermitida` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `ID` int(11) NOT NULL,
  `Seccion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `ID` int(11) NOT NULL,
  `Detalle` varchar(50) DEFAULT NULL,
  `Activo` int(11) DEFAULT NULL,
  `Visible` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suc_prod`
--

CREATE TABLE `suc_prod` (
  `IdSucursal` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Visible` tinyint(4) DEFAULT NULL,
  `Delivery` tinyint(4) DEFAULT NULL,
  `PickUp` tinyint(4) DEFAULT NULL,
  `Mesa` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `Nombres` varchar(30) DEFAULT NULL,
  `Paterno` varchar(20) DEFAULT NULL,
  `Materno` varchar(20) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `IdCargo` int(11) DEFAULT NULL,
  `IdCP` int(11) DEFAULT NULL,
  `IdSucursal` int(11) DEFAULT NULL,
  `Pass` tinyblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acompanamientos`
--
ALTER TABLE `acompanamientos`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `centroproduccion`
--
ALTER TABLE `centroproduccion`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `clientesdir`
--
ALTER TABLE `clientesdir`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `entregados`
--
ALTER TABLE `entregados`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD UNIQUE KEY `ID_new` (`ID`) USING BTREE;

--
-- Indices de la tabla `grupopermisos`
--
ALTER TABLE `grupopermisos`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pendientes`
--
ALTER TABLE `pendientes`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acompanamientos`
--
ALTER TABLE `acompanamientos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `centroproduccion`
--
ALTER TABLE `centroproduccion`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientesdir`
--
ALTER TABLE `clientesdir`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entregados`
--
ALTER TABLE `entregados`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupopermisos`
--
ALTER TABLE `grupopermisos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pendientes`
--
ALTER TABLE `pendientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
