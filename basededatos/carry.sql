-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2017 a las 07:44:08
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carry`
--
CREATE DATABASE IF NOT EXISTS `carry` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `carry`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblarticulos`
--

CREATE TABLE `tblarticulos` (
  `codArticulo` int(11) NOT NULL,
  `nombreArticulo` varchar(45) NOT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `origenFabricacion` varchar(45) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `fechaPublicacion` date DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `codCategoria` int(11) NOT NULL,
  `codUsuarioPublicador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblarticulosordenados`
--

CREATE TABLE `tblarticulosordenados` (
  `codOrden` int(11) NOT NULL,
  `codArticulo` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precioUnitario` decimal(12,2) DEFAULT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL,
  `mapsOrigen` varchar(250) DEFAULT NULL,
  `ubicacionOrigen` varchar(200) DEFAULT NULL,
  `mapsDestino` varchar(250) DEFAULT NULL,
  `ubicacionDestino` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcategorias`
--

CREATE TABLE `tblcategorias` (
  `codCategoria` int(11) NOT NULL,
  `codDepartamento` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldepartamentos`
--

CREATE TABLE `tbldepartamentos` (
  `codDepartamento` int(11) NOT NULL,
  `codRubro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetalles`
--

CREATE TABLE `tbldetalles` (
  `codDetalle` int(11) NOT NULL,
  `detalle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetallesarticulo`
--

CREATE TABLE `tbldetallesarticulo` (
  `codArticulo` int(11) NOT NULL,
  `codDetalle` int(11) NOT NULL,
  `valor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempleados`
--

CREATE TABLE `tblempleados` (
  `identificacion` varchar(15) NOT NULL,
  `nacimiento` date DEFAULT NULL,
  `domicilio` varchar(150) DEFAULT NULL,
  `telefonos` varchar(45) DEFAULT NULL,
  `codUsuario` int(11) NOT NULL,
  `salario` decimal(2,0) DEFAULT NULL,
  `codTipoEmpleado` int(11) NOT NULL,
  `codTipoVehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempresafavoritas`
--

CREATE TABLE `tblempresafavoritas` (
  `codItem` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `codEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempresas`
--

CREATE TABLE `tblempresas` (
  `codEmpresa` int(11) NOT NULL,
  `rtn` varchar(25) DEFAULT NULL,
  `nombreEmpresa` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `longitud` varchar(200) DEFAULT NULL,
  `latitud` varchar(200) DEFAULT NULL,
  `region` varchar(200) DEFAULT NULL,
  `ciudad` varchar(200) DEFAULT NULL,
  `departamento` varchar(200) DEFAULT NULL,
  `pais` varchar(200) DEFAULT NULL,
  `actividad` varchar(45) DEFAULT NULL,
  `sitioweb` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `informacion` varchar(200) DEFAULT NULL,
  `codRubro` int(11) NOT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `activa` int(11) DEFAULT NULL,
  `codUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblfacturascliente`
--

CREATE TABLE `tblfacturascliente` (
  `codFactura` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `efectivo` decimal(12,2) DEFAULT NULL,
  `cambio` decimal(12,2) DEFAULT NULL,
  `codFormaPago` int(11) NOT NULL,
  `codOrden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblformapago`
--

CREATE TABLE `tblformapago` (
  `codFormaPago` int(11) NOT NULL,
  `formaPago` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblhistorialplanes`
--

CREATE TABLE `tblhistorialplanes` (
  `codPlanPago` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `fechaAprobación` date DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `estadoPlan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblimagenesarticulo`
--

CREATE TABLE `tblimagenesarticulo` (
  `codImagen` int(11) NOT NULL,
  `nombreImagen` varchar(45) DEFAULT NULL,
  `urlUbicacion` varchar(60) DEFAULT NULL,
  `codArticulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblimagenesperfilempresa`
--

CREATE TABLE `tblimagenesperfilempresa` (
  `codImagen` int(11) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `codEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblimagenesusuarios`
--

CREATE TABLE `tblimagenesusuarios` (
  `codImagen` int(11) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `codUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblinfoarticulo`
--

CREATE TABLE `tblinfoarticulo` (
  `codArticulo` int(11) NOT NULL,
  `codCategoria` int(11) NOT NULL,
  `codDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbllistadeseos`
--

CREATE TABLE `tbllistadeseos` (
  `colItem` int(11) NOT NULL,
  `codArticulo` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `fechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblordenes`
--

CREATE TABLE `tblordenes` (
  `codOrden` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `codUsuarioRepartidor` int(11) NOT NULL,
  `codUsuarioCliente` int(11) NOT NULL,
  `tiempoEstimado` int(11) DEFAULT NULL,
  `tiempoEntrega` int(11) DEFAULT NULL,
  `distanciaKms` int(11) DEFAULT NULL,
  `cantArticulos` int(11) DEFAULT NULL,
  `cantEstaciones` int(11) DEFAULT NULL,
  `costoDeCompra` decimal(12,2) DEFAULT NULL,
  `costoDeEntrega` decimal(12,2) DEFAULT NULL,
  `costoOrden` decimal(12,2) DEFAULT NULL,
  `estadoOrden` varchar(10) DEFAULT NULL,
  `observaciones` varchar(300) DEFAULT NULL,
  `horaSalida` datetime DEFAULT NULL,
  `horaEntrega` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblotrocargos`
--

CREATE TABLE `tblotrocargos` (
  `codCargo` int(11) NOT NULL,
  `concepto` varchar(45) DEFAULT NULL,
  `valor` decimal(2,0) DEFAULT NULL,
  `codFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblplanespago`
--

CREATE TABLE `tblplanespago` (
  `codPlanPago` int(11) NOT NULL,
  `nombrePlan` varchar(45) DEFAULT NULL,
  `precio` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrubro`
--

CREATE TABLE `tblrubro` (
  `codRubro` int(11) NOT NULL,
  `rubro` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipoempleado`
--

CREATE TABLE `tbltipoempleado` (
  `codTipoEmpleado` int(11) NOT NULL,
  `tipoEmpleado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipoempresa`
--

CREATE TABLE `tbltipoempresa` (
  `codTipoEmpresa` int(11) NOT NULL,
  `tipoEmpresa` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipousuarios`
--

CREATE TABLE `tbltipousuarios` (
  `codTipoUsuario` int(11) NOT NULL,
  `tipoUsuario` varchar(25) DEFAULT NULL,
  `idAcceso` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipovehiculo`
--

CREATE TABLE `tbltipovehiculo` (
  `codTipoVehiculo` int(11) NOT NULL,
  `tipoVehiculo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `codUsuario` int(11) NOT NULL,
  `nombres` varchar(25) DEFAULT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(25) DEFAULT NULL,
  `contrasena` varchar(16) DEFAULT NULL,
  `codTipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblarticulos`
--
ALTER TABLE `tblarticulos`
  ADD PRIMARY KEY (`codArticulo`),
  ADD KEY `fk_tblArticulos_tblEmpresas1_idx` (`codUsuarioPublicador`);

--
-- Indices de la tabla `tblarticulosordenados`
--
ALTER TABLE `tblarticulosordenados`
  ADD KEY `fk_tblArticulosOrdenados_tblOrdenes1_idx` (`codOrden`),
  ADD KEY `fk_tblArticulosOrdenados_tblArticulos1_idx` (`codArticulo`);

--
-- Indices de la tabla `tblcategorias`
--
ALTER TABLE `tblcategorias`
  ADD PRIMARY KEY (`codCategoria`),
  ADD KEY `fk_tblCategorías_tblDepartamentos1_idx` (`codDepartamento`);

--
-- Indices de la tabla `tbldepartamentos`
--
ALTER TABLE `tbldepartamentos`
  ADD PRIMARY KEY (`codDepartamento`),
  ADD KEY `fk_tblDepartamentos_tblRubro1_idx` (`codRubro`);

--
-- Indices de la tabla `tbldetalles`
--
ALTER TABLE `tbldetalles`
  ADD PRIMARY KEY (`codDetalle`);

--
-- Indices de la tabla `tbldetallesarticulo`
--
ALTER TABLE `tbldetallesarticulo`
  ADD KEY `fk_tblDetallesArticulo_tblArticulos1_idx` (`codArticulo`),
  ADD KEY `fk_tblDetallesArticulo_tblDetalles1_idx` (`codDetalle`);

--
-- Indices de la tabla `tblempleados`
--
ALTER TABLE `tblempleados`
  ADD PRIMARY KEY (`codUsuario`),
  ADD KEY `fk_tblEmpleados_tblUsuarios1_idx` (`codUsuario`),
  ADD KEY `fk_tblEmpleados_tblTipoEmpleado1_idx` (`codTipoEmpleado`),
  ADD KEY `fk_tblEmpleados_tblTipoVehiculo1_idx` (`codTipoVehiculo`);

--
-- Indices de la tabla `tblempresafavoritas`
--
ALTER TABLE `tblempresafavoritas`
  ADD PRIMARY KEY (`codItem`),
  ADD KEY `fk_tblEmpresaFavoritas_tblUsuarios1_idx` (`codUsuario`),
  ADD KEY `fk_tblEmpresaFavoritas_tblEmpresas1_idx` (`codEmpresa`);

--
-- Indices de la tabla `tblempresas`
--
ALTER TABLE `tblempresas`
  ADD PRIMARY KEY (`codEmpresa`),
  ADD KEY `fk_tblEmpresas_tblRubro1_idx` (`codRubro`),
  ADD KEY `fk_tblEmpresas_tblUsuarios1_idx` (`codUsuario`);

--
-- Indices de la tabla `tblfacturascliente`
--
ALTER TABLE `tblfacturascliente`
  ADD PRIMARY KEY (`codFactura`),
  ADD KEY `fk_tblFacturas_tblFormaPago1_idx` (`codFormaPago`),
  ADD KEY `fk_tblFacturas_tblOrdenes1_idx` (`codOrden`);

--
-- Indices de la tabla `tblformapago`
--
ALTER TABLE `tblformapago`
  ADD PRIMARY KEY (`codFormaPago`);

--
-- Indices de la tabla `tblhistorialplanes`
--
ALTER TABLE `tblhistorialplanes`
  ADD KEY `fk_tblHistorialPlanes_tblPlanesPago1_idx` (`codPlanPago`),
  ADD KEY `fk_tblHistorialPlanes_tblEmpresas1_idx` (`codUsuario`);

--
-- Indices de la tabla `tblimagenesarticulo`
--
ALTER TABLE `tblimagenesarticulo`
  ADD PRIMARY KEY (`codImagen`),
  ADD KEY `fk_tblImagenes_tblArticulos1_idx` (`codArticulo`);

--
-- Indices de la tabla `tblimagenesperfilempresa`
--
ALTER TABLE `tblimagenesperfilempresa`
  ADD PRIMARY KEY (`codImagen`),
  ADD KEY `fk_tblImagenesPerfilEmpresa_tblEmpresas1_idx` (`codEmpresa`);

--
-- Indices de la tabla `tblimagenesusuarios`
--
ALTER TABLE `tblimagenesusuarios`
  ADD PRIMARY KEY (`codImagen`),
  ADD KEY `fk_tblImagenesUsuarios_tblUsuarios1_idx` (`codUsuario`);

--
-- Indices de la tabla `tblinfoarticulo`
--
ALTER TABLE `tblinfoarticulo`
  ADD KEY `fk_table1_tblArticulos1_idx` (`codArticulo`),
  ADD KEY `fk_table1_tblCategorias1_idx` (`codCategoria`);

--
-- Indices de la tabla `tbllistadeseos`
--
ALTER TABLE `tbllistadeseos`
  ADD PRIMARY KEY (`colItem`),
  ADD KEY `fk_tblListaDeseos_tblArticulos1_idx` (`codArticulo`),
  ADD KEY `fk_tblListaDeseos_tblUsuarios1_idx` (`codUsuario`);

--
-- Indices de la tabla `tblordenes`
--
ALTER TABLE `tblordenes`
  ADD PRIMARY KEY (`codOrden`),
  ADD KEY `fk_tblOrdenes_tblEmpleados1_idx` (`codUsuarioRepartidor`),
  ADD KEY `fk_tblOrdenes_tblUsuarios1_idx` (`codUsuarioCliente`);

--
-- Indices de la tabla `tblotrocargos`
--
ALTER TABLE `tblotrocargos`
  ADD PRIMARY KEY (`codCargo`),
  ADD KEY `fk_tblOtroCargos_tblFacturas1_idx` (`codFactura`);

--
-- Indices de la tabla `tblplanespago`
--
ALTER TABLE `tblplanespago`
  ADD PRIMARY KEY (`codPlanPago`);

--
-- Indices de la tabla `tblrubro`
--
ALTER TABLE `tblrubro`
  ADD PRIMARY KEY (`codRubro`);

--
-- Indices de la tabla `tbltipoempleado`
--
ALTER TABLE `tbltipoempleado`
  ADD PRIMARY KEY (`codTipoEmpleado`);

--
-- Indices de la tabla `tbltipoempresa`
--
ALTER TABLE `tbltipoempresa`
  ADD PRIMARY KEY (`codTipoEmpresa`);

--
-- Indices de la tabla `tbltipousuarios`
--
ALTER TABLE `tbltipousuarios`
  ADD PRIMARY KEY (`codTipoUsuario`);

--
-- Indices de la tabla `tbltipovehiculo`
--
ALTER TABLE `tbltipovehiculo`
  ADD PRIMARY KEY (`codTipoVehiculo`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`codUsuario`),
  ADD KEY `fk_tblUsuarios_tblTipoUsuarios_idx` (`codTipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbltipoempleado`
--
ALTER TABLE `tbltipoempleado`
  MODIFY `codTipoEmpleado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbltipoempresa`
--
ALTER TABLE `tbltipoempresa`
  MODIFY `codTipoEmpresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblarticulos`
--
ALTER TABLE `tblarticulos`
  ADD CONSTRAINT `fk_tblArticulos_tblEmpresas1` FOREIGN KEY (`codUsuarioPublicador`) REFERENCES `tblempresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblarticulosordenados`
--
ALTER TABLE `tblarticulosordenados`
  ADD CONSTRAINT `fk_tblArticulosOrdenados_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblArticulosOrdenados_tblOrdenes1` FOREIGN KEY (`codOrden`) REFERENCES `tblordenes` (`codOrden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblcategorias`
--
ALTER TABLE `tblcategorias`
  ADD CONSTRAINT `fk_tblCategorías_tblDepartamentos1` FOREIGN KEY (`codDepartamento`) REFERENCES `tbldepartamentos` (`codDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbldepartamentos`
--
ALTER TABLE `tbldepartamentos`
  ADD CONSTRAINT `fk_tblDepartamentos_tblRubro1` FOREIGN KEY (`codRubro`) REFERENCES `tblrubro` (`codRubro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbldetallesarticulo`
--
ALTER TABLE `tbldetallesarticulo`
  ADD CONSTRAINT `fk_tblDetallesArticulo_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblDetallesArticulo_tblDetalles1` FOREIGN KEY (`codDetalle`) REFERENCES `tbldetalles` (`codDetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblempleados`
--
ALTER TABLE `tblempleados`
  ADD CONSTRAINT `fk_tblEmpleados_tblTipoEmpleado1` FOREIGN KEY (`codTipoEmpleado`) REFERENCES `tbltipoempleado` (`codTipoEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblEmpleados_tblTipoVehiculo1` FOREIGN KEY (`codTipoVehiculo`) REFERENCES `tbltipovehiculo` (`codTipoVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblEmpleados_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblempresafavoritas`
--
ALTER TABLE `tblempresafavoritas`
  ADD CONSTRAINT `fk_tblEmpresaFavoritas_tblEmpresas1` FOREIGN KEY (`codEmpresa`) REFERENCES `tblempresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblEmpresaFavoritas_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblempresas`
--
ALTER TABLE `tblempresas`
  ADD CONSTRAINT `fk_tblEmpresas_tblRubro1` FOREIGN KEY (`codRubro`) REFERENCES `tblrubro` (`codRubro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblEmpresas_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblfacturascliente`
--
ALTER TABLE `tblfacturascliente`
  ADD CONSTRAINT `fk_tblFacturas_tblFormaPago1` FOREIGN KEY (`codFormaPago`) REFERENCES `tblformapago` (`codFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblFacturas_tblOrdenes1` FOREIGN KEY (`codOrden`) REFERENCES `tblordenes` (`codOrden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblhistorialplanes`
--
ALTER TABLE `tblhistorialplanes`
  ADD CONSTRAINT `fk_tblHistorialPlanes_tblEmpresas1` FOREIGN KEY (`codUsuario`) REFERENCES `tblempresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblHistorialPlanes_tblPlanesPago1` FOREIGN KEY (`codPlanPago`) REFERENCES `tblplanespago` (`codPlanPago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblimagenesarticulo`
--
ALTER TABLE `tblimagenesarticulo`
  ADD CONSTRAINT `fk_tblImagenes_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblimagenesperfilempresa`
--
ALTER TABLE `tblimagenesperfilempresa`
  ADD CONSTRAINT `fk_tblImagenesPerfilEmpresa_tblEmpresas1` FOREIGN KEY (`codEmpresa`) REFERENCES `tblempresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblimagenesusuarios`
--
ALTER TABLE `tblimagenesusuarios`
  ADD CONSTRAINT `fk_tblImagenesUsuarios_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblinfoarticulo`
--
ALTER TABLE `tblinfoarticulo`
  ADD CONSTRAINT `fk_table1_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_tblCategorias1` FOREIGN KEY (`codCategoria`) REFERENCES `tblcategorias` (`codCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbllistadeseos`
--
ALTER TABLE `tbllistadeseos`
  ADD CONSTRAINT `fk_tblListaDeseos_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblListaDeseos_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblordenes`
--
ALTER TABLE `tblordenes`
  ADD CONSTRAINT `fk_tblOrdenes_tblEmpleados1` FOREIGN KEY (`codUsuarioRepartidor`) REFERENCES `tblempleados` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblOrdenes_tblUsuarios1` FOREIGN KEY (`codUsuarioCliente`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblotrocargos`
--
ALTER TABLE `tblotrocargos`
  ADD CONSTRAINT `fk_tblOtroCargos_tblFacturas1` FOREIGN KEY (`codFactura`) REFERENCES `tblfacturascliente` (`codFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD CONSTRAINT `fk_tblUsuarios_tblTipoUsuarios` FOREIGN KEY (`codTipoUsuario`) REFERENCES `tbltipousuarios` (`codTipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
