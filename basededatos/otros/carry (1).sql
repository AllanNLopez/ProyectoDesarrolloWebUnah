-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2017 at 09:29 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblarticulos`
--

DROP TABLE IF EXISTS `tblarticulos`;
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

--
-- Truncate table before insert `tblarticulos`
--

TRUNCATE TABLE `tblarticulos`;
-- --------------------------------------------------------

--
-- Table structure for table `tblarticulosordenados`
--

DROP TABLE IF EXISTS `tblarticulosordenados`;
CREATE TABLE `tblarticulosordenados` (
  `codOrden` int(11) NOT NULL,
  `codArticulo` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precioUnitario` decimal(12,2) DEFAULT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL,
  `mapsOrigen` varchar(250) DEFAULT NULL,
  `ubicacionOrigen` varchar(200) DEFAULT NULL,
  `mapsDestino` varchar(250) DEFAULT NULL,
  `ubicacionDestino` varchar(250) DEFAULT NULL,
  `latitudOrigen` float DEFAULT NULL,
  `longitudOrigen` float DEFAULT NULL,
  `latitudDestino` float DEFAULT NULL,
  `longitudDestino` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblarticulosordenados`
--

TRUNCATE TABLE `tblarticulosordenados`;
-- --------------------------------------------------------

--
-- Table structure for table `tblaspirantes`
--

DROP TABLE IF EXISTS `tblaspirantes`;
CREATE TABLE `tblaspirantes` (
  `codAspirante` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `identificacion` varchar(15) NOT NULL,
  `nacimiento` date NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(25) NOT NULL,
  `domicilio` varchar(150) NOT NULL,
  `codTipoAspirante_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblaspirantes`
--

TRUNCATE TABLE `tblaspirantes`;
--
-- Dumping data for table `tblaspirantes`
--

INSERT INTO `tblaspirantes` (`codAspirante`, `nombre`, `apellido`, `identificacion`, `nacimiento`, `telefono`, `correo`, `domicilio`, `codTipoAspirante_fk`) VALUES
(2, 'Juan', 'Gutierrez', '9090-9999-12345', '2017-11-09', '3333399999', 'jias@gmail.com', 'ioiqoowoiw.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategorias`
--

DROP TABLE IF EXISTS `tblcategorias`;
CREATE TABLE `tblcategorias` (
  `codCategoria` int(11) NOT NULL,
  `codDepartamento` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblcategorias`
--

TRUNCATE TABLE `tblcategorias`;
-- --------------------------------------------------------

--
-- Table structure for table `tbldepartamentos`
--

DROP TABLE IF EXISTS `tbldepartamentos`;
CREATE TABLE `tbldepartamentos` (
  `codDepartamento` int(11) NOT NULL,
  `codRubro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbldepartamentos`
--

TRUNCATE TABLE `tbldepartamentos`;
-- --------------------------------------------------------

--
-- Table structure for table `tbldetalles`
--

DROP TABLE IF EXISTS `tbldetalles`;
CREATE TABLE `tbldetalles` (
  `codDetalle` int(11) NOT NULL,
  `detalle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbldetalles`
--

TRUNCATE TABLE `tbldetalles`;
-- --------------------------------------------------------

--
-- Table structure for table `tbldetallesarticulo`
--

DROP TABLE IF EXISTS `tbldetallesarticulo`;
CREATE TABLE `tbldetallesarticulo` (
  `codArticulo` int(11) NOT NULL,
  `codDetalle` int(11) NOT NULL,
  `valor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbldetallesarticulo`
--

TRUNCATE TABLE `tbldetallesarticulo`;
-- --------------------------------------------------------

--
-- Table structure for table `tblempleados`
--

DROP TABLE IF EXISTS `tblempleados`;
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

--
-- Truncate table before insert `tblempleados`
--

TRUNCATE TABLE `tblempleados`;
-- --------------------------------------------------------

--
-- Table structure for table `tblempresafavoritas`
--

DROP TABLE IF EXISTS `tblempresafavoritas`;
CREATE TABLE `tblempresafavoritas` (
  `codItem` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `codEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblempresafavoritas`
--

TRUNCATE TABLE `tblempresafavoritas`;
-- --------------------------------------------------------

--
-- Table structure for table `tblempresas`
--

DROP TABLE IF EXISTS `tblempresas`;
CREATE TABLE `tblempresas` (
  `codEmpresa` int(11) NOT NULL,
  `rtn` varchar(25) DEFAULT NULL,
  `nombreEmpresa` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `actividad` varchar(45) DEFAULT NULL,
  `sitioweb` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `informacion` varchar(200) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `activa` int(11) DEFAULT NULL,
  `codUsuario` int(11) NOT NULL,
  `codRubro` int(11) NOT NULL,
  `mapslatitud` float DEFAULT NULL,
  `mapslongitud` float DEFAULT NULL,
  `mapsregion` varchar(50) DEFAULT NULL,
  `mapsciudad` varchar(50) DEFAULT NULL,
  `mapsdeparamento` varchar(50) DEFAULT NULL,
  `mapspais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblempresas`
--

TRUNCATE TABLE `tblempresas`;
--
-- Dumping data for table `tblempresas`
--

INSERT INTO `tblempresas` (`codEmpresa`, `rtn`, `nombreEmpresa`, `ubicacion`, `actividad`, `sitioweb`, `telefono`, `informacion`, `calificacion`, `activa`, `codUsuario`, `codRubro`, `mapslatitud`, `mapslongitud`, `mapsregion`, `mapsciudad`, `mapsdeparamento`, `mapspais`) VALUES
(5, '1111-1111-111111', 'miempresa', 'Altos del Trapiche.', 'Art. limpieza e higiene', 'miempresa.com', '45454545671', 'Vendemos articulos.', NULL, NULL, 25, 4, 14.0673, -87.1572, 'Residencial Altos del Trapiche', 'Tegucigalpa', 'Departamento de Francisco Morazán', 'Honduras'),
(6, '2222-2222-222222', 'empresaMia', 'Direccion.', 'Alquileres', 'empresamia.com', '99999999123', 'Descripcion.', NULL, NULL, 26, 3, 14.0732, -87.1683, 'Colonia Hato del Medio', 'Tegucigalpa', 'Francisco Morazán Department', 'Honduras'),
(7, '2323-2323-222222', 'Empresa', 'Domicilio.', 'Herramientas', 'empresa.com', '90901234123', 'Descripcion', NULL, NULL, 27, 14, 14.0661, -87.1581, 'Residencial Altos del Trapiche', 'Tegucigalpa', 'Departamento de Francisco Morazán', 'Honduras'),
(8, '1234-1234-121212', 'saulcompany', 'Colonia.', 'Maquinarias', 'saulcompany.org', '69696969696', 'Descripcion.', NULL, NULL, 28, 17, 14.0674, -87.154, 'Residencial Altos del Trapiche', 'Tegucigalpa', 'Departamento de Francisco Morazán', 'Honduras'),
(9, '6767-7878-890121', 'oscompany', 'Domicilio.', 'Art. limpieza e higiene', 'oscompany.org', '89898989123', 'Descripcion.', NULL, NULL, 29, 4, 14.0652, -87.1566, 'Residencial Altos del Trapiche', 'Tegucigalpa', 'Departamento de Francisco Morazán', 'Honduras'),
(10, '4444-4444-444444', 'company', 'Domicilio', 'Deporte y recreación', 'company.co', '89898989123', 'Descripcion', NULL, NULL, 30, 9, 14.0682, -87.159, 'Residencial Altos del Trapiche', 'Tegucigalpa', 'Departamento de Francisco Morazán', 'Honduras');

-- --------------------------------------------------------

--
-- Table structure for table `tblfacturascliente`
--

DROP TABLE IF EXISTS `tblfacturascliente`;
CREATE TABLE `tblfacturascliente` (
  `codFactura` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `efectivo` decimal(12,2) DEFAULT NULL,
  `cambio` decimal(12,2) DEFAULT NULL,
  `codFormaPago` int(11) NOT NULL,
  `codOrden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblfacturascliente`
--

TRUNCATE TABLE `tblfacturascliente`;
-- --------------------------------------------------------

--
-- Table structure for table `tblformapago`
--

DROP TABLE IF EXISTS `tblformapago`;
CREATE TABLE `tblformapago` (
  `codFormaPago` int(11) NOT NULL,
  `formaPago` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblformapago`
--

TRUNCATE TABLE `tblformapago`;
-- --------------------------------------------------------

--
-- Table structure for table `tblhistorialplanes`
--

DROP TABLE IF EXISTS `tblhistorialplanes`;
CREATE TABLE `tblhistorialplanes` (
  `codPlanPago` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `fechaAprobación` date DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `estadoPlan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblhistorialplanes`
--

TRUNCATE TABLE `tblhistorialplanes`;
-- --------------------------------------------------------

--
-- Table structure for table `tblimagenesarticulo`
--

DROP TABLE IF EXISTS `tblimagenesarticulo`;
CREATE TABLE `tblimagenesarticulo` (
  `codImagen` int(11) NOT NULL,
  `nombreImagen` varchar(45) DEFAULT NULL,
  `urlUbicacion` varchar(60) DEFAULT NULL,
  `codArticulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblimagenesarticulo`
--

TRUNCATE TABLE `tblimagenesarticulo`;
-- --------------------------------------------------------

--
-- Table structure for table `tblimagenesperfilempresa`
--

DROP TABLE IF EXISTS `tblimagenesperfilempresa`;
CREATE TABLE `tblimagenesperfilempresa` (
  `codImagen` int(11) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `codEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblimagenesperfilempresa`
--

TRUNCATE TABLE `tblimagenesperfilempresa`;
-- --------------------------------------------------------

--
-- Table structure for table `tblimagenesusuarios`
--

DROP TABLE IF EXISTS `tblimagenesusuarios`;
CREATE TABLE `tblimagenesusuarios` (
  `codImagen` int(11) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `codUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblimagenesusuarios`
--

TRUNCATE TABLE `tblimagenesusuarios`;
-- --------------------------------------------------------

--
-- Table structure for table `tblinfoarticulo`
--

DROP TABLE IF EXISTS `tblinfoarticulo`;
CREATE TABLE `tblinfoarticulo` (
  `codArticulo` int(11) NOT NULL,
  `codCategoria` int(11) NOT NULL,
  `codDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblinfoarticulo`
--

TRUNCATE TABLE `tblinfoarticulo`;
-- --------------------------------------------------------

--
-- Table structure for table `tbllistadeseos`
--

DROP TABLE IF EXISTS `tbllistadeseos`;
CREATE TABLE `tbllistadeseos` (
  `colItem` int(11) NOT NULL,
  `codArticulo` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `fechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbllistadeseos`
--

TRUNCATE TABLE `tbllistadeseos`;
-- --------------------------------------------------------

--
-- Table structure for table `tblordenes`
--

DROP TABLE IF EXISTS `tblordenes`;
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

--
-- Truncate table before insert `tblordenes`
--

TRUNCATE TABLE `tblordenes`;
-- --------------------------------------------------------

--
-- Table structure for table `tblotrocargos`
--

DROP TABLE IF EXISTS `tblotrocargos`;
CREATE TABLE `tblotrocargos` (
  `codCargo` int(11) NOT NULL,
  `concepto` varchar(45) DEFAULT NULL,
  `valor` decimal(2,0) DEFAULT NULL,
  `codFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblotrocargos`
--

TRUNCATE TABLE `tblotrocargos`;
-- --------------------------------------------------------

--
-- Table structure for table `tblplanespago`
--

DROP TABLE IF EXISTS `tblplanespago`;
CREATE TABLE `tblplanespago` (
  `codPlanPago` int(11) NOT NULL,
  `nombrePlan` varchar(45) DEFAULT NULL,
  `precio` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblplanespago`
--

TRUNCATE TABLE `tblplanespago`;
-- --------------------------------------------------------

--
-- Table structure for table `tblrubro`
--

DROP TABLE IF EXISTS `tblrubro`;
CREATE TABLE `tblrubro` (
  `codRubro` int(11) NOT NULL,
  `rubro` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblrubro`
--

TRUNCATE TABLE `tblrubro`;
--
-- Dumping data for table `tblrubro`
--

INSERT INTO `tblrubro` (`codRubro`, `rubro`) VALUES
(1, 'Agricultura y ganadería'),
(2, 'Alimentos y bebidas'),
(3, 'Alquileres'),
(4, 'Art. limpieza e higiene'),
(5, 'Artículos del hogar'),
(6, 'Audiovisuales'),
(7, 'Automotores'),
(8, 'Combustibles y lubricantes'),
(9, 'Deporte y recreación'),
(10, 'Equipo médico y laboratorio'),
(11, 'Construcción y edificación'),
(12, 'Suministros de oficina'),
(13, 'Equipos de seguridad'),
(14, 'Herramientas'),
(15, 'Equipos e insumos de Informática'),
(16, 'Joyería y orfebrería'),
(17, 'Maquinarias'),
(18, 'Publicidad'),
(19, 'Servicio de salud'),
(20, 'Vigilancia y seguridad'),
(21, 'Textil e indumentaria'),
(22, 'Telefonía y comunicaciones'),
(23, 'Compra y venta'),
(24, 'Panadería'),
(25, 'Articulos de belleza');

-- --------------------------------------------------------

--
-- Table structure for table `tbltipoaspirante`
--

DROP TABLE IF EXISTS `tbltipoaspirante`;
CREATE TABLE `tbltipoaspirante` (
  `codTipoAspirante` int(11) NOT NULL,
  `tipoAspirante` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbltipoaspirante`
--

TRUNCATE TABLE `tbltipoaspirante`;
--
-- Dumping data for table `tbltipoaspirante`
--

INSERT INTO `tbltipoaspirante` (`codTipoAspirante`, `tipoAspirante`) VALUES
(1, 'Agente Carry permanente.'),
(2, 'Agente Carry recurrente.');

-- --------------------------------------------------------

--
-- Table structure for table `tbltipoempleado`
--

DROP TABLE IF EXISTS `tbltipoempleado`;
CREATE TABLE `tbltipoempleado` (
  `codTipoEmpleado` int(11) NOT NULL,
  `tipoEmpleado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbltipoempleado`
--

TRUNCATE TABLE `tbltipoempleado`;
-- --------------------------------------------------------

--
-- Table structure for table `tbltipoempresa`
--

DROP TABLE IF EXISTS `tbltipoempresa`;
CREATE TABLE `tbltipoempresa` (
  `codTipoEmpresa` int(11) NOT NULL,
  `tipoEmpresa` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbltipoempresa`
--

TRUNCATE TABLE `tbltipoempresa`;
-- --------------------------------------------------------

--
-- Table structure for table `tbltipousuarios`
--

DROP TABLE IF EXISTS `tbltipousuarios`;
CREATE TABLE `tbltipousuarios` (
  `codTipoUsuario` int(11) NOT NULL,
  `tipoUsuario` varchar(25) DEFAULT NULL,
  `idAcceso` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbltipousuarios`
--

TRUNCATE TABLE `tbltipousuarios`;
--
-- Dumping data for table `tbltipousuarios`
--

INSERT INTO `tbltipousuarios` (`codTipoUsuario`, `tipoUsuario`, `idAcceso`) VALUES
(1, 'Usuario comun', '1'),
(2, 'Usuario empleado', '2'),
(3, 'Usuario empresa', '3');

-- --------------------------------------------------------

--
-- Table structure for table `tbltipovehiculo`
--

DROP TABLE IF EXISTS `tbltipovehiculo`;
CREATE TABLE `tbltipovehiculo` (
  `codTipoVehiculo` int(11) NOT NULL,
  `tipoVehiculo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbltipovehiculo`
--

TRUNCATE TABLE `tbltipovehiculo`;
-- --------------------------------------------------------

--
-- Table structure for table `tblusuarios`
--

DROP TABLE IF EXISTS `tblusuarios`;
CREATE TABLE `tblusuarios` (
  `codUsuario` int(11) NOT NULL,
  `nombres` varchar(25) DEFAULT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(25) DEFAULT NULL,
  `contrasena` varchar(200) DEFAULT NULL,
  `codTipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblusuarios`
--

TRUNCATE TABLE `tblusuarios`;
--
-- Dumping data for table `tblusuarios`
--

INSERT INTO `tblusuarios` (`codUsuario`, `nombres`, `apellidos`, `telefono`, `correo`, `contrasena`, `codTipoUsuario`) VALUES
(1, 'Jesus', 'Daniel', '9999999000', 'c@hotmail.es', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 1),
(2, 'Cesar Eduardo', 'Barahona', '90909090123', 'cb@gmail.com', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 1),
(21, 'je', 'je', '1234567890', 'j@gm.co', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(22, 'je', 'je', '1234567890', 'j@gm.co', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(23, 'Hola', 'Mundo', '1234567890', 'j@gm.co', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(24, 'Hola', 'Mundo', '1234567890', 'j@gm.co', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(25, 'Juan', 'Perez', '9090901231', 'jp@gmail.com', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(26, 'Juan', 'Martinez', '1212123411', 'jm@gmail.com', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(27, 'Rob', 'Martinez', '90901234231', 'rm@gmail.com', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(28, 'Saul', 'Guzman', '90909090123', 'sg@gmail.com', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(29, 'Oswal', 'Sot', '90909090123', 'os@gmail.com', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(30, 'Nelson', 'Nelson', '90909090123', 'nelson@hotmail.co', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblarticulos`
--
ALTER TABLE `tblarticulos`
  ADD PRIMARY KEY (`codArticulo`),
  ADD KEY `fk_tblArticulos_tblEmpresas1_idx` (`codUsuarioPublicador`);

--
-- Indexes for table `tblarticulosordenados`
--
ALTER TABLE `tblarticulosordenados`
  ADD KEY `fk_tblArticulosOrdenados_tblOrdenes1_idx` (`codOrden`),
  ADD KEY `fk_tblArticulosOrdenados_tblArticulos1_idx` (`codArticulo`);

--
-- Indexes for table `tblaspirantes`
--
ALTER TABLE `tblaspirantes`
  ADD PRIMARY KEY (`codAspirante`),
  ADD KEY `fk_tblAspirantes_tblTipoAspirante1_idx` (`codTipoAspirante_fk`);

--
-- Indexes for table `tblcategorias`
--
ALTER TABLE `tblcategorias`
  ADD PRIMARY KEY (`codCategoria`),
  ADD KEY `fk_tblCategorías_tblDepartamentos1_idx` (`codDepartamento`);

--
-- Indexes for table `tbldepartamentos`
--
ALTER TABLE `tbldepartamentos`
  ADD PRIMARY KEY (`codDepartamento`),
  ADD KEY `fk_tblDepartamentos_tblRubro1_idx` (`codRubro`);

--
-- Indexes for table `tbldetalles`
--
ALTER TABLE `tbldetalles`
  ADD PRIMARY KEY (`codDetalle`);

--
-- Indexes for table `tbldetallesarticulo`
--
ALTER TABLE `tbldetallesarticulo`
  ADD KEY `fk_tblDetallesArticulo_tblArticulos1_idx` (`codArticulo`),
  ADD KEY `fk_tblDetallesArticulo_tblDetalles1_idx` (`codDetalle`);

--
-- Indexes for table `tblempleados`
--
ALTER TABLE `tblempleados`
  ADD PRIMARY KEY (`codUsuario`),
  ADD KEY `fk_tblEmpleados_tblUsuarios1_idx` (`codUsuario`),
  ADD KEY `fk_tblEmpleados_tblTipoEmpleado1_idx` (`codTipoEmpleado`),
  ADD KEY `fk_tblEmpleados_tblTipoVehiculo1_idx` (`codTipoVehiculo`);

--
-- Indexes for table `tblempresafavoritas`
--
ALTER TABLE `tblempresafavoritas`
  ADD PRIMARY KEY (`codItem`),
  ADD KEY `fk_tblEmpresaFavoritas_tblUsuarios1_idx` (`codUsuario`),
  ADD KEY `fk_tblEmpresaFavoritas_tblEmpresas1_idx` (`codEmpresa`);

--
-- Indexes for table `tblempresas`
--
ALTER TABLE `tblempresas`
  ADD PRIMARY KEY (`codEmpresa`),
  ADD KEY `fk_tblEmpresas_tblRubro1_idx` (`codRubro`),
  ADD KEY `fk_tblEmpresas_tblUsuarios1_idx` (`codUsuario`);

--
-- Indexes for table `tblfacturascliente`
--
ALTER TABLE `tblfacturascliente`
  ADD PRIMARY KEY (`codFactura`),
  ADD KEY `fk_tblFacturas_tblFormaPago1_idx` (`codFormaPago`),
  ADD KEY `fk_tblFacturas_tblOrdenes1_idx` (`codOrden`);

--
-- Indexes for table `tblformapago`
--
ALTER TABLE `tblformapago`
  ADD PRIMARY KEY (`codFormaPago`);

--
-- Indexes for table `tblhistorialplanes`
--
ALTER TABLE `tblhistorialplanes`
  ADD KEY `fk_tblHistorialPlanes_tblPlanesPago1_idx` (`codPlanPago`),
  ADD KEY `fk_tblHistorialPlanes_tblEmpresas1_idx` (`codUsuario`);

--
-- Indexes for table `tblimagenesarticulo`
--
ALTER TABLE `tblimagenesarticulo`
  ADD PRIMARY KEY (`codImagen`),
  ADD KEY `fk_tblImagenes_tblArticulos1_idx` (`codArticulo`);

--
-- Indexes for table `tblimagenesperfilempresa`
--
ALTER TABLE `tblimagenesperfilempresa`
  ADD PRIMARY KEY (`codImagen`),
  ADD KEY `fk_tblImagenesPerfilEmpresa_tblEmpresas1_idx` (`codEmpresa`);

--
-- Indexes for table `tblimagenesusuarios`
--
ALTER TABLE `tblimagenesusuarios`
  ADD PRIMARY KEY (`codImagen`),
  ADD KEY `fk_tblImagenesUsuarios_tblUsuarios1_idx` (`codUsuario`);

--
-- Indexes for table `tblinfoarticulo`
--
ALTER TABLE `tblinfoarticulo`
  ADD KEY `fk_table1_tblArticulos1_idx` (`codArticulo`),
  ADD KEY `fk_table1_tblCategorias1_idx` (`codCategoria`);

--
-- Indexes for table `tbllistadeseos`
--
ALTER TABLE `tbllistadeseos`
  ADD PRIMARY KEY (`colItem`),
  ADD KEY `fk_tblListaDeseos_tblArticulos1_idx` (`codArticulo`),
  ADD KEY `fk_tblListaDeseos_tblUsuarios1_idx` (`codUsuario`);

--
-- Indexes for table `tblordenes`
--
ALTER TABLE `tblordenes`
  ADD PRIMARY KEY (`codOrden`),
  ADD KEY `fk_tblOrdenes_tblEmpleados1_idx` (`codUsuarioRepartidor`),
  ADD KEY `fk_tblOrdenes_tblUsuarios1_idx` (`codUsuarioCliente`);

--
-- Indexes for table `tblotrocargos`
--
ALTER TABLE `tblotrocargos`
  ADD PRIMARY KEY (`codCargo`),
  ADD KEY `fk_tblOtroCargos_tblFacturas1_idx` (`codFactura`);

--
-- Indexes for table `tblplanespago`
--
ALTER TABLE `tblplanespago`
  ADD PRIMARY KEY (`codPlanPago`);

--
-- Indexes for table `tblrubro`
--
ALTER TABLE `tblrubro`
  ADD PRIMARY KEY (`codRubro`);

--
-- Indexes for table `tbltipoaspirante`
--
ALTER TABLE `tbltipoaspirante`
  ADD PRIMARY KEY (`codTipoAspirante`);

--
-- Indexes for table `tbltipoempleado`
--
ALTER TABLE `tbltipoempleado`
  ADD PRIMARY KEY (`codTipoEmpleado`);

--
-- Indexes for table `tbltipoempresa`
--
ALTER TABLE `tbltipoempresa`
  ADD PRIMARY KEY (`codTipoEmpresa`);

--
-- Indexes for table `tbltipousuarios`
--
ALTER TABLE `tbltipousuarios`
  ADD PRIMARY KEY (`codTipoUsuario`);

--
-- Indexes for table `tbltipovehiculo`
--
ALTER TABLE `tbltipovehiculo`
  ADD PRIMARY KEY (`codTipoVehiculo`);

--
-- Indexes for table `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`codUsuario`),
  ADD KEY `fk_tblUsuarios_tblTipoUsuarios_idx` (`codTipoUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblarticulos`
--
ALTER TABLE `tblarticulos`
  MODIFY `codArticulo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblaspirantes`
--
ALTER TABLE `tblaspirantes`
  MODIFY `codAspirante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tblcategorias`
--
ALTER TABLE `tblcategorias`
  MODIFY `codCategoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbldepartamentos`
--
ALTER TABLE `tbldepartamentos`
  MODIFY `codDepartamento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbldetalles`
--
ALTER TABLE `tbldetalles`
  MODIFY `codDetalle` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblempresafavoritas`
--
ALTER TABLE `tblempresafavoritas`
  MODIFY `codItem` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblempresas`
--
ALTER TABLE `tblempresas`
  MODIFY `codEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tblfacturascliente`
--
ALTER TABLE `tblfacturascliente`
  MODIFY `codFactura` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblformapago`
--
ALTER TABLE `tblformapago`
  MODIFY `codFormaPago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblhistorialplanes`
--
ALTER TABLE `tblhistorialplanes`
  MODIFY `codPlanPago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblimagenesarticulo`
--
ALTER TABLE `tblimagenesarticulo`
  MODIFY `codImagen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblimagenesperfilempresa`
--
ALTER TABLE `tblimagenesperfilempresa`
  MODIFY `codImagen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblimagenesusuarios`
--
ALTER TABLE `tblimagenesusuarios`
  MODIFY `codImagen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbllistadeseos`
--
ALTER TABLE `tbllistadeseos`
  MODIFY `colItem` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblordenes`
--
ALTER TABLE `tblordenes`
  MODIFY `codOrden` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblotrocargos`
--
ALTER TABLE `tblotrocargos`
  MODIFY `codCargo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblplanespago`
--
ALTER TABLE `tblplanespago`
  MODIFY `codPlanPago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblrubro`
--
ALTER TABLE `tblrubro`
  MODIFY `codRubro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbltipoaspirante`
--
ALTER TABLE `tbltipoaspirante`
  MODIFY `codTipoAspirante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbltipoempleado`
--
ALTER TABLE `tbltipoempleado`
  MODIFY `codTipoEmpleado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbltipoempresa`
--
ALTER TABLE `tbltipoempresa`
  MODIFY `codTipoEmpresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbltipousuarios`
--
ALTER TABLE `tbltipousuarios`
  MODIFY `codTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbltipovehiculo`
--
ALTER TABLE `tbltipovehiculo`
  MODIFY `codTipoVehiculo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblusuarios`
--
ALTER TABLE `tblusuarios`
  MODIFY `codUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblarticulos`
--
ALTER TABLE `tblarticulos`
  ADD CONSTRAINT `fk_tblArticulos_tblEmpresas1` FOREIGN KEY (`codUsuarioPublicador`) REFERENCES `tblempresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblarticulosordenados`
--
ALTER TABLE `tblarticulosordenados`
  ADD CONSTRAINT `fk_tblArticulosOrdenados_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblArticulosOrdenados_tblOrdenes1` FOREIGN KEY (`codOrden`) REFERENCES `tblordenes` (`codOrden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblaspirantes`
--
ALTER TABLE `tblaspirantes`
  ADD CONSTRAINT `fk_tblAspirantes_tblTipoAspirante1` FOREIGN KEY (`codTipoAspirante_fk`) REFERENCES `tbltipoaspirante` (`codTipoAspirante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblcategorias`
--
ALTER TABLE `tblcategorias`
  ADD CONSTRAINT `fk_tblCategorías_tblDepartamentos1` FOREIGN KEY (`codDepartamento`) REFERENCES `tbldepartamentos` (`codDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbldepartamentos`
--
ALTER TABLE `tbldepartamentos`
  ADD CONSTRAINT `fk_tblDepartamentos_tblRubro1` FOREIGN KEY (`codRubro`) REFERENCES `tblrubro` (`codRubro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbldetallesarticulo`
--
ALTER TABLE `tbldetallesarticulo`
  ADD CONSTRAINT `fk_tblDetallesArticulo_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblDetallesArticulo_tblDetalles1` FOREIGN KEY (`codDetalle`) REFERENCES `tbldetalles` (`codDetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblempleados`
--
ALTER TABLE `tblempleados`
  ADD CONSTRAINT `fk_tblEmpleados_tblTipoEmpleado1` FOREIGN KEY (`codTipoEmpleado`) REFERENCES `tbltipoempleado` (`codTipoEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblEmpleados_tblTipoVehiculo1` FOREIGN KEY (`codTipoVehiculo`) REFERENCES `tbltipovehiculo` (`codTipoVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblEmpleados_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblempresafavoritas`
--
ALTER TABLE `tblempresafavoritas`
  ADD CONSTRAINT `fk_tblEmpresaFavoritas_tblEmpresas1` FOREIGN KEY (`codEmpresa`) REFERENCES `tblempresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblEmpresaFavoritas_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblempresas`
--
ALTER TABLE `tblempresas`
  ADD CONSTRAINT `fk_tblEmpresas_tblRubro1` FOREIGN KEY (`codRubro`) REFERENCES `tblrubro` (`codRubro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblEmpresas_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblfacturascliente`
--
ALTER TABLE `tblfacturascliente`
  ADD CONSTRAINT `fk_tblFacturas_tblFormaPago1` FOREIGN KEY (`codFormaPago`) REFERENCES `tblformapago` (`codFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblFacturas_tblOrdenes1` FOREIGN KEY (`codOrden`) REFERENCES `tblordenes` (`codOrden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblhistorialplanes`
--
ALTER TABLE `tblhistorialplanes`
  ADD CONSTRAINT `fk_tblHistorialPlanes_tblEmpresas1` FOREIGN KEY (`codUsuario`) REFERENCES `tblempresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblHistorialPlanes_tblPlanesPago1` FOREIGN KEY (`codPlanPago`) REFERENCES `tblplanespago` (`codPlanPago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblimagenesarticulo`
--
ALTER TABLE `tblimagenesarticulo`
  ADD CONSTRAINT `fk_tblImagenes_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblimagenesperfilempresa`
--
ALTER TABLE `tblimagenesperfilempresa`
  ADD CONSTRAINT `fk_tblImagenesPerfilEmpresa_tblEmpresas1` FOREIGN KEY (`codEmpresa`) REFERENCES `tblempresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblimagenesusuarios`
--
ALTER TABLE `tblimagenesusuarios`
  ADD CONSTRAINT `fk_tblImagenesUsuarios_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblinfoarticulo`
--
ALTER TABLE `tblinfoarticulo`
  ADD CONSTRAINT `fk_table1_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_tblCategorias1` FOREIGN KEY (`codCategoria`) REFERENCES `tblcategorias` (`codCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbllistadeseos`
--
ALTER TABLE `tbllistadeseos`
  ADD CONSTRAINT `fk_tblListaDeseos_tblArticulos1` FOREIGN KEY (`codArticulo`) REFERENCES `tblarticulos` (`codArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblListaDeseos_tblUsuarios1` FOREIGN KEY (`codUsuario`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblordenes`
--
ALTER TABLE `tblordenes`
  ADD CONSTRAINT `fk_tblOrdenes_tblEmpleados1` FOREIGN KEY (`codUsuarioRepartidor`) REFERENCES `tblempleados` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblOrdenes_tblUsuarios1` FOREIGN KEY (`codUsuarioCliente`) REFERENCES `tblusuarios` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblotrocargos`
--
ALTER TABLE `tblotrocargos`
  ADD CONSTRAINT `fk_tblOtroCargos_tblFacturas1` FOREIGN KEY (`codFactura`) REFERENCES `tblfacturascliente` (`codFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD CONSTRAINT `fk_tblUsuarios_tblTipoUsuarios` FOREIGN KEY (`codTipoUsuario`) REFERENCES `tbltipousuarios` (`codTipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
