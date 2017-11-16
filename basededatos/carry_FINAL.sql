-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2017 at 01:25 PM
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
CREATE DATABASE IF NOT EXISTS `carry` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `carry`;

-- --------------------------------------------------------

--
-- Table structure for table `tblarticulos`
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

--
-- Truncate table before insert `tblarticulos`
--

TRUNCATE TABLE `tblarticulos`;
--
-- Dumping data for table `tblarticulos`
--

INSERT INTO `tblarticulos` (`codArticulo`, `nombreArticulo`, `descripcion`, `precio`, `origenFabricacion`, `saldo`, `fechaPublicacion`, `estado`, `codCategoria`, `codUsuarioPublicador`) VALUES
(3, 'Articulo 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '200.00', 'Origen Fabriacion 1', 100, '2017-01-01', 'Estado 1', 1, 5),
(4, 'Articulo 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '300.00', 'Origen Fabriacion 2', 200, '2017-01-02', 'Estado 2', 2, 5),
(5, 'Articulo 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '400.00', 'Origen Fabriacion 3', 300, '2017-01-03', 'Estado 3', 3, 5),
(6, 'Articulo 5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '500.00', 'Origen Fabriacion 4', 400, '2017-01-04', 'Estado 4', 4, 5),
(7, 'Articulo 6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '600.00', 'Origen Fabriacion 5', 500, '2017-01-01', 'Estado 1', 5, 5),
(8, 'Articulo 7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '700.00', 'Origen Fabriacion 6', 600, '2017-01-02', 'Estado 2', 6, 5),
(9, 'Articulo 8', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '800.00', 'Origen Fabriacion 7', 700, '2017-01-03', 'Estado 3', 7, 5),
(10, 'Articulo 9', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '900.00', 'Origen Fabriacion 8', 800, '2017-01-04', 'Estado 4', 8, 5),
(11, 'Articulo 10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1000.00', 'Origen Fabriacion 9', 900, '2017-01-04', 'Estado 1', 9, 5),
(12, 'Articulo 11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1100.00', 'Origen Fabriacion 10', 1000, '2017-01-04', 'Estado 2', 10, 5),
(13, 'Articulo 12', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1200.00', 'Origen Fabriacion 11', 1100, '2017-01-04', 'Estado 3', 11, 5),
(14, 'Articulo 13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1300.00', 'Origen Fabriacion 12', 1200, '2017-01-04', 'Estado 4', 12, 5),
(15, 'Articulo 14', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1400.00', 'Origen Fabriacion 13', 1300, '2017-01-04', 'Estado 1', 13, 5),
(16, 'Articulo 15', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1500.00', 'Origen Fabriacion 14', 1400, '2017-01-04', 'Estado 2', 14, 5),
(17, 'Articulo 16', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1600.00', 'Origen Fabriacion 15', 1500, '2017-01-04', 'Estado 3', 15, 5),
(18, 'Articulo 17', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1700.00', 'Origen Fabriacion 16', 1600, '2017-01-04', 'Estado 4', 16, 5),
(19, 'Articulo 18', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1800.00', 'Origen Fabriacion 17', 1700, '2017-01-04', 'Estado 1', 17, 5),
(20, 'Articulo 19', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '1900.00', 'Origen Fabriacion 18', 1800, '2017-01-04', 'Estado 2', 18, 5),
(21, 'Articulo 20', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2000.00', 'Origen Fabriacion 19', 1900, '2017-01-04', 'Estado 3', 19, 5),
(22, 'Articulo 21', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2100.00', 'Origen Fabriacion 20', 2000, '2017-01-04', 'Estado 4', 20, 5),
(23, 'Articulo 22', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2200.00', 'Origen Fabriacion 21', 2100, '2017-01-04', 'Estado 1', 21, 5),
(24, 'Articulo 23', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2300.00', 'Origen Fabriacion 22', 2200, '2017-01-04', 'Estado 2', 22, 5),
(25, 'Articulo 24', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2400.00', 'Origen Fabriacion 23', 2300, '2017-01-04', 'Estado 3', 23, 5),
(26, 'Articulo 25', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2500.00', 'Origen Fabriacion 24', 2400, '2017-01-05', 'Estado 4', 24, 5),
(27, 'Articulo 26', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2600.00', 'Origen Fabriacion 25', 2500, '2017-01-05', 'Estado 1', 25, 5),
(28, 'Articulo 27', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2700.00', 'Origen Fabriacion 26', 2600, '2017-01-05', 'Estado 2', 26, 5),
(29, 'Articulo 28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2800.00', 'Origen Fabriacion 27', 2700, '2017-01-05', 'Estado 3', 27, 5),
(30, 'Articulo 29', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '2900.00', 'Origen Fabriacion 28', 2800, '2017-01-05', 'Estado 4', 28, 5),
(31, 'Articulo 30', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3000.00', 'Origen Fabriacion 29', 2900, '2017-01-05', 'Estado 1', 29, 5),
(32, 'Articulo 31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3100.00', 'Origen Fabriacion 30', 3000, '2017-01-05', 'Estado 2', 30, 5),
(33, 'Articulo 32', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3200.00', 'Origen Fabriacion 31', 3100, '2017-01-05', 'Estado 3', 31, 5),
(34, 'Articulo 33', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3300.00', 'Origen Fabriacion 32', 3200, '2017-01-05', 'Estado 4', 32, 5),
(35, 'Articulo 34', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3400.00', 'Origen Fabriacion 33', 3300, '2017-01-05', 'Estado 1', 33, 5),
(36, 'Articulo 35', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3500.00', 'Origen Fabriacion 34', 3400, '2017-01-05', 'Estado 2', 34, 5),
(37, 'Articulo 36', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3600.00', 'Origen Fabriacion 35', 3500, '2017-01-05', 'Estado 3', 35, 5),
(38, 'Articulo 37', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3700.00', 'Origen Fabriacion 36', 3600, '2017-01-05', 'Estado 4', 36, 5),
(39, 'Articulo 38', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3800.00', 'Origen Fabriacion 37', 3700, '2017-01-05', 'Estado 1', 37, 5),
(40, 'Articulo 39', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '3900.00', 'Origen Fabriacion 38', 3800, '2017-01-05', 'Estado 2', 38, 5),
(41, 'Articulo 40', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4000.00', 'Origen Fabriacion 39', 3900, '2017-01-05', 'Estado 3', 39, 5),
(42, 'Articulo 41', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4100.00', 'Origen Fabriacion 40', 4000, '2017-01-05', 'Estado 4', 40, 5),
(43, 'Articulo 42', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4200.00', 'Origen Fabriacion 41', 4100, '2017-01-05', 'Estado 1', 41, 5),
(44, 'Articulo 43', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4300.00', 'Origen Fabriacion 42', 4200, '2017-01-05', 'Estado 2', 42, 5),
(45, 'Articulo 44', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4400.00', 'Origen Fabriacion 43', 4300, '2017-01-05', 'Estado 3', 43, 5),
(46, 'Articulo 45', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4500.00', 'Origen Fabriacion 44', 4400, '2017-01-05', 'Estado 4', 44, 5),
(47, 'Articulo 46', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4600.00', 'Origen Fabriacion 45', 4500, '2017-01-05', 'Estado 1', 45, 5),
(48, 'Articulo 47', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4700.00', 'Origen Fabriacion 46', 4600, '2017-01-05', 'Estado 2', 46, 5),
(49, 'Articulo 48', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4800.00', 'Origen Fabriacion 47', 4700, '2017-01-05', 'Estado 3', 47, 5),
(50, 'Articulo 49', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '4900.00', 'Origen Fabriacion 48', 4800, '2017-01-05', 'Estado 4', 48, 5),
(51, 'Articulo 50', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '5000.00', 'Origen Fabriacion 49', 4900, '2017-01-05', 'Estado 5', 49, 5),
(52, 'Articulo 51', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consequat.', '5100.00', 'Origen Fabriacion 50', 5000, '2017-01-05', 'Estado 6', 50, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tblarticulosordenados`
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
(2, 'Juan', 'Gutierrez', '9090-9999-12345', '2017-11-09', '3333399999', 'jias@gmail.com', 'ioiqoowoiw.', 2),
(3, 'Ramon', 'Rosa', '1111-1111-11111', '1980-03-10', '89898989123', 'rr@gmail.com', 'Domicilio.', 2),
(4, 'Jesus', 'Pineda', '9090-9090-90909', '2017-11-03', '12121234121', 'jpineda@gmail.com', 'Domicilio.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategorias`
--

CREATE TABLE `tblcategorias` (
  `codCategoria` int(11) NOT NULL,
  `codDepartamento` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblcategorias`
--

TRUNCATE TABLE `tblcategorias`;
--
-- Dumping data for table `tblcategorias`
--

INSERT INTO `tblcategorias` (`codCategoria`, `codDepartamento`, `categoria`) VALUES
(1, 1, 'Categoria 1'),
(2, 2, 'Categoria 2'),
(3, 4, 'Categoria 4'),
(4, 5, 'Categoria 5'),
(5, 6, 'Categoria 6'),
(6, 7, 'Categoria 7'),
(7, 8, 'Categoria 8');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartamentos`
--

CREATE TABLE `tbldepartamentos` (
  `codDepartamento` int(11) NOT NULL,
  `codRubro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbldepartamentos`
--

TRUNCATE TABLE `tbldepartamentos`;
--
-- Dumping data for table `tbldepartamentos`
--

INSERT INTO `tbldepartamentos` (`codDepartamento`, `codRubro`) VALUES
(1, 1),
(2, 2),
(4, 4),
(5, 5),
(6, 6),
(7, 9),
(8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbldetalles`
--

CREATE TABLE `tbldetalles` (
  `codDetalle` int(11) NOT NULL,
  `detalle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbldetalles`
--

TRUNCATE TABLE `tbldetalles`;
--
-- Dumping data for table `tbldetalles`
--

INSERT INTO `tbldetalles` (`codDetalle`, `detalle`) VALUES
(1, 'Detalle 1'),
(2, 'Detalle 2'),
(3, 'Detalle 3');

-- --------------------------------------------------------

--
-- Table structure for table `tbldetallesarticulo`
--

CREATE TABLE `tbldetallesarticulo` (
  `codArticulo` int(11) NOT NULL,
  `codDetalle` int(11) NOT NULL,
  `valor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbldetallesarticulo`
--

TRUNCATE TABLE `tbldetallesarticulo`;
--
-- Dumping data for table `tbldetallesarticulo`
--

INSERT INTO `tbldetallesarticulo` (`codArticulo`, `codDetalle`, `valor`) VALUES
(3, 1, 'Valor 1'),
(3, 2, 'Valor 2'),
(4, 1, 'Valor 3'),
(3, 1, 'Valor 4'),
(3, 3, 'Valor 5');

-- --------------------------------------------------------

--
-- Table structure for table `tblempleados`
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

--
-- Truncate table before insert `tblempleados`
--

TRUNCATE TABLE `tblempleados`;
-- --------------------------------------------------------

--
-- Table structure for table `tblempresafavoritas`
--

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
(10, '4444-4444-444444', 'company', 'Domicilio', 'Deporte y recreación', 'company.co', '89898989123', 'Descripcion', NULL, NULL, 30, 9, 14.0682, -87.159, 'Residencial Altos del Trapiche', 'Tegucigalpa', 'Departamento de Francisco Morazán', 'Honduras'),
(11, '1111-1111-111111', 'EMP', 'Altos del Trapiche', 'Construcción y edificación', 'empresa.co.edu', '12121212123', 'Descripcion.', NULL, NULL, 33, 11, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblfacturascliente`
--

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
--
-- Dumping data for table `tblimagenesarticulo`
--

INSERT INTO `tblimagenesarticulo` (`codImagen`, `nombreImagen`, `urlUbicacion`, `codArticulo`) VALUES
(1, 'combo hamburguesa', '../img/comidas/combo-hamburguesa.jpeg', 3),
(2, 'Tacos', '../img/comidas/tacos.jpeg', 4),
(3, 'Pancakes', '../img/comidas/pancakes-2413875_640.jpg', 4),
(4, 'Salmon', '../img/comidas/salmon.jpeg', 5),
(5, 'Fish', '../img/comidas/fish-2366925_640.jpg', 6),
(6, 'Pancakes', '../img/comidas/pancakes-2413875_640.jpg', 7),
(7, 'Laptop HP', '../img/electronics/laptop1.png', 8),
(8, 'Alienware', '../img/electronics/alienware.png', 9),
(9, 'Asus Zephyrus', '../img/electronics/asusZ.jpg', 10),
(10, 'LesPaul', '../img/instrumentos/lesPaul.jpg', 11),
(11, 'LTD', '../img/instrumentos/ltd.jpg', 12),
(12, 'Panadol Forte', '../img/farmacia/panadol.png', 13),
(13, 'Estetoscopio', '../img/farmacia/estetoscopio.jpg', 15),
(14, 'Guantes Latex', '../img/farmacia/guantes.jpg', 14),
(15, 'Samsung J2', '../img/electronics/cellphone.jpeg', 16),
(16, 'Rolex', '../img/relojes/rolex.jpg', 17),
(17, 'Linksys', '../img/electronics/router.jpg', 18);

-- --------------------------------------------------------

--
-- Table structure for table `tblimagenesperfilempresa`
--

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

CREATE TABLE `tblinfoarticulo` (
  `codArticulo` int(11) NOT NULL,
  `codCategoria` int(11) NOT NULL,
  `codDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblinfoarticulo`
--

TRUNCATE TABLE `tblinfoarticulo`;
--
-- Dumping data for table `tblinfoarticulo`
--

INSERT INTO `tblinfoarticulo` (`codArticulo`, `codCategoria`, `codDepartamento`) VALUES
(3, 1, 1),
(4, 2, 2),
(8, 3, 5),
(6, 6, 7),
(11, 3, 6),
(14, 3, 4),
(9, 7, 2),
(3, 7, 5),
(3, 1, 5),
(3, 2, 5),
(4, 3, 6),
(4, 4, 6),
(4, 5, 1),
(5, 6, 1),
(5, 7, 2),
(5, 1, 2),
(6, 2, 3),
(6, 3, 3),
(6, 4, 4),
(7, 5, 4),
(7, 6, 5),
(7, 7, 5),
(8, 1, 6),
(8, 2, 6),
(8, 3, 1),
(9, 4, 1),
(9, 5, 2),
(9, 6, 2),
(10, 7, 3),
(10, 1, 3),
(10, 2, 3),
(11, 3, 5),
(11, 4, 4),
(11, 5, 5),
(12, 6, 6),
(12, 7, 1),
(12, 1, 1),
(13, 2, 1),
(13, 3, 1),
(14, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(16, 1, 1),
(16, 2, 1),
(16, 3, 1),
(17, 4, 1),
(17, 5, 1),
(17, 6, 1),
(18, 7, 1),
(18, 7, 1),
(18, 7, 1),
(3, 7, 5),
(3, 1, 5),
(3, 2, 5),
(4, 3, 6),
(4, 4, 6),
(4, 5, 1),
(5, 6, 1),
(5, 7, 2),
(5, 1, 2),
(6, 2, 3),
(6, 3, 3),
(6, 4, 4),
(7, 5, 4),
(7, 6, 5),
(7, 7, 5),
(8, 1, 6),
(8, 2, 6),
(8, 3, 1),
(9, 4, 1),
(9, 5, 2),
(9, 6, 2),
(10, 7, 3),
(10, 1, 3),
(10, 2, 3),
(11, 3, 5),
(11, 4, 4),
(11, 5, 5),
(12, 6, 6),
(12, 7, 1),
(12, 1, 1),
(13, 2, 1),
(13, 3, 1),
(14, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(16, 1, 1),
(16, 2, 1),
(16, 3, 1),
(17, 4, 1),
(17, 5, 1),
(17, 6, 1),
(18, 7, 1),
(18, 7, 1),
(18, 7, 1),
(3, 7, 5),
(3, 1, 5),
(3, 2, 5),
(4, 3, 6),
(4, 4, 6),
(4, 5, 1),
(5, 6, 1),
(5, 7, 2),
(5, 1, 2),
(6, 2, 3),
(6, 3, 3),
(6, 4, 4),
(7, 5, 4),
(7, 6, 5),
(7, 7, 5),
(8, 1, 6),
(8, 2, 6),
(8, 3, 1),
(9, 4, 1),
(9, 5, 2),
(9, 6, 2),
(10, 7, 3),
(10, 1, 3),
(10, 2, 3),
(11, 3, 5),
(11, 4, 4),
(11, 5, 5),
(12, 6, 6),
(12, 7, 1),
(12, 1, 1),
(13, 2, 1),
(13, 3, 1),
(14, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(16, 1, 1),
(16, 2, 1),
(16, 3, 1),
(17, 4, 1),
(17, 5, 1),
(17, 6, 1),
(18, 7, 1),
(18, 7, 1),
(18, 7, 1),
(19, 7, 1),
(3, 7, 5),
(3, 1, 5),
(3, 2, 5),
(4, 3, 6),
(4, 4, 6),
(4, 5, 1),
(5, 6, 1),
(5, 7, 2),
(5, 1, 2),
(6, 2, 3),
(6, 3, 3),
(6, 4, 4),
(7, 5, 4),
(7, 6, 5),
(7, 7, 5),
(8, 1, 6),
(8, 2, 6),
(8, 3, 1),
(9, 4, 1),
(9, 5, 2),
(9, 6, 2),
(10, 7, 3),
(10, 1, 3),
(10, 2, 3),
(11, 3, 5),
(11, 4, 4),
(11, 5, 5),
(12, 6, 6),
(12, 7, 1),
(12, 1, 1),
(13, 2, 1),
(13, 3, 1),
(14, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(16, 1, 1),
(16, 2, 1),
(16, 3, 1),
(17, 4, 1),
(17, 5, 1),
(17, 6, 1),
(18, 7, 1),
(18, 7, 1),
(18, 7, 1),
(19, 7, 1),
(5, 1, 2),
(6, 2, 3),
(6, 3, 3),
(6, 4, 4),
(7, 5, 4),
(7, 6, 5),
(7, 7, 5),
(8, 1, 6),
(8, 2, 6),
(8, 3, 1),
(9, 4, 1),
(9, 5, 2),
(9, 6, 2),
(10, 7, 3),
(10, 1, 3),
(10, 2, 3),
(11, 3, 5),
(11, 4, 4),
(11, 5, 5),
(12, 6, 6),
(12, 7, 1),
(12, 1, 1),
(13, 2, 1),
(13, 3, 1),
(14, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(16, 1, 1),
(16, 2, 1),
(16, 3, 1),
(17, 4, 1),
(17, 5, 1),
(17, 6, 1),
(18, 7, 1),
(18, 7, 1),
(18, 7, 1),
(19, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbllistadeseos`
--

CREATE TABLE `tbllistadeseos` (
  `colItem` int(11) NOT NULL COMMENT 'Codigo de item en la lista de deseo.',
  `codArticulo` int(11) NOT NULL COMMENT 'Llave del codigo de articulo,',
  `codUsuario` int(11) NOT NULL COMMENT 'Llave identificadora del usuario.',
  `fechaRegistro` date DEFAULT NULL COMMENT 'Fecha en que se agrega el articulo a la lista.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbllistadeseos`
--

TRUNCATE TABLE `tbllistadeseos`;
--
-- Dumping data for table `tbllistadeseos`
--

INSERT INTO `tbllistadeseos` (`colItem`, `codArticulo`, `codUsuario`, `fechaRegistro`) VALUES
(3, 3, 1, '2017-11-15'),
(5, 5, 1, '2017-11-15'),
(6, 10, 1, '2017-11-15'),
(7, 7, 1, '2017-11-15'),
(8, 52, 1, '2017-11-15');

-- --------------------------------------------------------

--
-- Table structure for table `tblordenes`
--

CREATE TABLE `tblordenes` (
  `codOrden` int(11) NOT NULL COMMENT 'Codigo correlativo a la orden.',
  `fecha` date DEFAULT NULL COMMENT 'Fecha de la orden.',
  `codUsuarioRepartidor` int(11) NOT NULL COMMENT 'Identificador del repartidor.',
  `codUsuarioCliente` int(11) NOT NULL COMMENT 'Identificador del cliente.',
  `tiempoEstimado` int(11) DEFAULT NULL COMMENT 'Tiempo estimado de la orden.',
  `tiempoEntrega` int(11) DEFAULT NULL COMMENT 'Tiempo de entrega.',
  `distanciaKms` int(11) DEFAULT NULL COMMENT 'Distancia para la entrega.',
  `cantArticulos` int(11) DEFAULT NULL COMMENT 'Cantidad de artículos.',
  `cantEstaciones` int(11) DEFAULT NULL COMMENT 'Cantidad de estaciones.',
  `costoDeCompra` decimal(12,0) DEFAULT NULL COMMENT 'Costos de compra.',
  `costoDeEntrega` decimal(12,0) DEFAULT NULL COMMENT 'Costos de la entrega.',
  `costoOrden` decimal(12,0) DEFAULT NULL COMMENT 'Costo total de la orden.',
  `estadoOrden` varchar(10) DEFAULT NULL COMMENT 'Estado actual de la orden.',
  `observaciones` varchar(300) DEFAULT NULL COMMENT 'Observaciones.',
  `horaSalida` datetime DEFAULT NULL COMMENT 'Hora de salida del repartidor.',
  `horaEntrega` datetime DEFAULT NULL COMMENT 'Hora de entrega.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblordenes`
--

TRUNCATE TABLE `tblordenes`;
-- --------------------------------------------------------

--
-- Table structure for table `tblotrocargos`
--

CREATE TABLE `tblotrocargos` (
  `codCargo` int(11) NOT NULL COMMENT 'Codigo correlativo al cargo.',
  `concepto` varchar(45) DEFAULT NULL COMMENT 'Concepto del cargo.',
  `valor` decimal(2,0) DEFAULT NULL COMMENT 'Valor del cargo.',
  `codFactura` int(11) NOT NULL COMMENT 'Factura a la que pertenece.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblotrocargos`
--

TRUNCATE TABLE `tblotrocargos`;
-- --------------------------------------------------------

--
-- Table structure for table `tblplanespago`
--

CREATE TABLE `tblplanespago` (
  `codPlanPago` int(11) NOT NULL COMMENT 'Codigo correlativo al plan de pago.',
  `nombrePlan` varchar(45) DEFAULT NULL COMMENT 'Nombre del plan.',
  `precio` decimal(2,0) DEFAULT NULL COMMENT 'Precio del plan.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tblplanespago`
--

TRUNCATE TABLE `tblplanespago`;
-- --------------------------------------------------------

--
-- Table structure for table `tblrubro`
--

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
(30, 'Nelson', 'Nelson', '90909090123', 'nelson@hotmail.co', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(31, 'John', 'Smith', '67676767123', 'jsmith@gmail.com', 'b9425e2ef55272a8eed56471dccd3212b4fdc9b2439adaf8b740efc4c65f8922f5fde0f5d68f233b2075323754cecd446f5a38329ef7917a11550be3a1440c2f', 1),
(32, 'Jesus', 'Pineda', '90909090123', 'jpineda@gmail.com', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 1),
(33, 'Lorem', 'Ipsum', '7878781278', 'li@gmail.com', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 3),
(34, 'John', 'Casablancas', '90909090123', 'johncasa@gmail.com', 'a8bfe36d0a4ed127ca90ae289ee9d58fdf2fce68a530a29d21d24a9eda0b551e7d2ecae5f362bb273422e18de39899e76d6b15ebf05073a6ab603ef7fbba1354', 1);

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
  MODIFY `codArticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `tblaspirantes`
--
ALTER TABLE `tblaspirantes`
  MODIFY `codAspirante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tblcategorias`
--
ALTER TABLE `tblcategorias`
  MODIFY `codCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbldepartamentos`
--
ALTER TABLE `tbldepartamentos`
  MODIFY `codDepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbldetalles`
--
ALTER TABLE `tbldetalles`
  MODIFY `codDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tblempresafavoritas`
--
ALTER TABLE `tblempresafavoritas`
  MODIFY `codItem` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblempresas`
--
ALTER TABLE `tblempresas`
  MODIFY `codEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
  MODIFY `codImagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
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
  MODIFY `colItem` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de item en la lista de deseo.', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tblordenes`
--
ALTER TABLE `tblordenes`
  MODIFY `codOrden` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo correlativo a la orden.';
--
-- AUTO_INCREMENT for table `tblotrocargos`
--
ALTER TABLE `tblotrocargos`
  MODIFY `codCargo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo correlativo al cargo.';
--
-- AUTO_INCREMENT for table `tblplanespago`
--
ALTER TABLE `tblplanespago`
  MODIFY `codPlanPago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo correlativo al plan de pago.';
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
  MODIFY `codUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
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
