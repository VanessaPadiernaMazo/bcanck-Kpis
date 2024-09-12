-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-09-2024 a las 00:10:48
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kpis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `ID_Area` int(11) NOT NULL,
  `nombreArea` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`ID_Area`, `nombreArea`) VALUES
(1, 'Developer'),
(2, 'design');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `ID_Cargo` int(11) NOT NULL,
  `nombreCargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`ID_Cargo`, `nombreCargo`) VALUES
(1, 'Analista Desarrollador Junior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `ID_Contrato` int(11) NOT NULL,
  `Tipo_Contrato` varchar(50) NOT NULL,
  `meses_Contrato` int(11) NOT NULL,
  `dias_Contrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`ID_Contrato`, `Tipo_Contrato`, `meses_Contrato`, `dias_Contrato`) VALUES
(2, 'Aprendiz', 6, 128),
(3, 'obra y labor', 18, 540),
(4, 'Termino fijo', 24, 720);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `evaluacion_ID` int(11) NOT NULL,
  `evaluacion_FECHA` date DEFAULT NULL,
  `evaluacion_RESULTADO` varchar(255) DEFAULT NULL,
  `evaluacion_COMENTARIOS` varchar(255) DEFAULT NULL,
  `ID_Grupo3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `ID_Grupo` int(11) NOT NULL,
  `nombreGrupo` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `estadoGrupo` varchar(100) DEFAULT NULL,
  `ID_KPIS1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `ID_Ite` int(11) NOT NULL,
  `Descrip_Ite` varchar(500) NOT NULL,
  `Valor_Ite` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kpi`
--

CREATE TABLE `kpi` (
  `ID_KPI` int(11) NOT NULL,
  `nombre_KPI` varchar(100) DEFAULT NULL,
  `descrip_KPI` varchar(100) DEFAULT NULL,
  `valor_KPI` double DEFAULT NULL,
  `meta_KPI` double DEFAULT NULL,
  `ID_Ite1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacionesautomaticas`
--

CREATE TABLE `notificacionesautomaticas` (
  `ID_NotifiacionesA` int(11) NOT NULL,
  `nombre_NotificacionesA` varchar(100) DEFAULT NULL,
  `diasfinalizar_NotificacionesA` int(11) DEFAULT NULL,
  `mensajes_NotificacionesA` varchar(200) DEFAULT NULL,
  `estado_NotificacionesA` varchar(200) DEFAULT NULL,
  `Tipo_NotificacionesA` varchar(20) DEFAULT NULL,
  `FechaEnvio_NotificacionesM` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacionesmanuales`
--

CREATE TABLE `notificacionesmanuales` (
  `ID_NotifiacionesM` int(11) NOT NULL,
  `nombre_NotificacionesM` varchar(100) DEFAULT NULL,
  `diasfinalizar_NotificacionesM` int(11) DEFAULT NULL,
  `mensajes_NotificacionesM` varchar(200) DEFAULT NULL,
  `estado_NotificacionesM` varchar(200) DEFAULT NULL,
  `Tipo_NotificacionesM` varchar(20) DEFAULT NULL,
  `FechaEnvio_NotificacionesM` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pereva`
--

CREATE TABLE `pereva` (
  `evaluacion_ID1` int(11) DEFAULT NULL,
  `usuarioRed2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisosrol`
--

CREATE TABLE `permisosrol` (
  `ID_PermRol` int(11) NOT NULL,
  `Inicio` tinyint(1) DEFAULT NULL,
  `Perfil` tinyint(1) DEFAULT NULL,
  `CrearUM` tinyint(1) DEFAULT NULL,
  `CrearUI` tinyint(1) DEFAULT NULL,
  `ConsultarEU` tinyint(1) DEFAULT NULL,
  `CrearE` tinyint(1) DEFAULT NULL,
  `ConsultarECreado` tinyint(1) DEFAULT NULL,
  `AgregarInt` tinyint(1) DEFAULT NULL,
  `ConsultarInt` tinyint(1) DEFAULT NULL,
  `EliminarInt` tinyint(1) DEFAULT NULL,
  `CrearKPI` tinyint(1) DEFAULT NULL,
  `CrearItems` tinyint(1) DEFAULT NULL,
  `ConsultarKPIS` tinyint(1) DEFAULT NULL,
  `EvaluarKPIS` tinyint(1) DEFAULT NULL,
  `ConsultarEVKPIS` tinyint(1) DEFAULT NULL,
  `ConsultarIndIndividuales` tinyint(1) DEFAULT NULL,
  `ConsultarIndGrupales` tinyint(1) DEFAULT NULL,
  `CrearProyecto` tinyint(1) DEFAULT NULL,
  `ConsultarProyecto` tinyint(1) DEFAULT NULL,
  `EliminarProyecto` tinyint(1) DEFAULT NULL,
  `CrearNotifi` tinyint(1) DEFAULT NULL,
  `ConsultarNotifi` tinyint(1) DEFAULT NULL,
  `CrearRol` tinyint(1) DEFAULT NULL,
  `CrearArea` tinyint(1) DEFAULT NULL,
  `CrearContrato` tinyint(1) DEFAULT NULL,
  `CrearCargo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisosrol`
--

INSERT INTO `permisosrol` (`ID_PermRol`, `Inicio`, `Perfil`, `CrearUM`, `CrearUI`, `ConsultarEU`, `CrearE`, `ConsultarECreado`, `AgregarInt`, `ConsultarInt`, `EliminarInt`, `CrearKPI`, `CrearItems`, `ConsultarKPIS`, `EvaluarKPIS`, `ConsultarEVKPIS`, `ConsultarIndIndividuales`, `ConsultarIndGrupales`, `CrearProyecto`, `ConsultarProyecto`, `EliminarProyecto`, `CrearNotifi`, `ConsultarNotifi`, `CrearRol`, `CrearArea`, `CrearContrato`, `CrearCargo`) VALUES
(1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0),
(2, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0),
(5, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0),
(6, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0),
(7, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0),
(8, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0),
(9, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0),
(20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permrol`
--

CREATE TABLE `permrol` (
  `ID_Rol2` int(11) DEFAULT NULL,
  `ID_PermRol1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permrol`
--

INSERT INTO `permrol` (`ID_Rol2`, `ID_PermRol1`) VALUES
(5, 8),
(2, 16),
(1, 19),
(4, 20),
(6, 21),
(5, 22),
(3, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `usuarioRed` varchar(50) NOT NULL,
  `CentroCosto` varchar(50) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Num_Documento` varchar(50) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `CCMSID` int(11) DEFAULT NULL,
  `FechaIngresoTP` date DEFAULT NULL,
  `FechaEgresoTP` date DEFAULT NULL,
  `CorreoCorporativo` varchar(50) DEFAULT NULL,
  `Estado_Civil` varchar(50) DEFAULT NULL,
  `Hijos` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Barrio` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Nombre_Institución` varchar(50) DEFAULT NULL,
  `Carrera` varchar(50) DEFAULT NULL,
  `TipoCarrera` varchar(50) DEFAULT NULL,
  `NivelCarrera` varchar(50) DEFAULT NULL,
  `CorreoPersonal` varchar(50) DEFAULT NULL,
  `Plaza` varchar(50) DEFAULT NULL,
  `GrupoSanguineo` varchar(50) DEFAULT NULL,
  `ARP` varchar(50) DEFAULT NULL,
  `EPS` varchar(50) DEFAULT NULL,
  `EquipoCompuesto` varchar(50) DEFAULT NULL,
  `Observaciones` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `IdContrato1` int(11) DEFAULT NULL,
  `ID_Area1` int(11) DEFAULT NULL,
  `ID_Cargo1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`usuarioRed`, `CentroCosto`, `Nombre`, `Apellido`, `FechaNacimiento`, `Num_Documento`, `Telefono`, `CCMSID`, `FechaIngresoTP`, `FechaEgresoTP`, `CorreoCorporativo`, `Estado_Civil`, `Hijos`, `Direccion`, `Barrio`, `Ciudad`, `Nombre_Institución`, `Carrera`, `TipoCarrera`, `NivelCarrera`, `CorreoPersonal`, `Plaza`, `GrupoSanguineo`, `ARP`, `EPS`, `EquipoCompuesto`, `Observaciones`, `Estado`, `IdContrato1`, `ID_Area1`, `ID_Cargo1`) VALUES
('lozanorodriguez.30', 'NA', 'David', 'Lozano', NULL, '1002234563', '3043672379', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `proyecto_ID` int(11) NOT NULL,
  `proyecto_NOMBRE` varchar(100) DEFAULT NULL,
  `proyecto_DESCRIPCION` varchar(255) DEFAULT NULL,
  `proyecto_FECHA_INICIO` date DEFAULT NULL,
  `proyecto_FECHA_FIN` date DEFAULT NULL,
  `proyecto_ESTADO` tinyint(4) DEFAULT NULL,
  `ID_Grupo2` int(11) DEFAULT NULL,
  `proyecto_Semana` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_Rol` int(11) NOT NULL,
  `Nombre_Rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_Rol`, `Nombre_Rol`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'Manager'),
(3, 'Practicante'),
(4, 'Lider'),
(5, 'superManager'),
(6, 'superAdminitrador'),
(9, 'admin'),
(10, 'pere'),
(11, 'pere'),
(13, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Usuario` varchar(50) DEFAULT NULL,
  `Clave` varchar(80) DEFAULT NULL,
  `Estado_Usuario` varchar(10) DEFAULT NULL,
  `ID_Rol1` int(11) DEFAULT NULL,
  `usuarioRed1` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `Usuario`, `Clave`, `Estado_Usuario`, `ID_Rol1`, `usuarioRed1`) VALUES
(1, 'admin', '$2a$10$VlPcqBlICer7JRlVSNIIv.SzOBlT9QxX2eH9rmbVvxiSTzRldmJAK', 'activo', 1, NULL),
(2, 'lozanorodriguez.30', '$2a$10$D.f0LF6yjWvSJ7RHhx20vekXpaLYFaOzdZKCjTBy1uY/vDKWGRg6G', 'activo', 3, 'lozanorodriguez.30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usugrup`
--

CREATE TABLE `usugrup` (
  `ID_Usuario1` int(11) DEFAULT NULL,
  `ID_Grupo1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usunota`
--

CREATE TABLE `usunota` (
  `usuarioRed1A` varchar(50) DEFAULT NULL,
  `ID_NotifiacionesA1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usunotm`
--

CREATE TABLE `usunotm` (
  `usuarioRed1M` varchar(50) DEFAULT NULL,
  `ID_NotifiacionesM1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`ID_Area`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`ID_Cargo`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`ID_Contrato`);

--
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`evaluacion_ID`),
  ADD KEY `ID_Grupo3` (`ID_Grupo3`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`ID_Grupo`),
  ADD KEY `ID_KPIS1` (`ID_KPIS1`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID_Ite`);

--
-- Indices de la tabla `kpi`
--
ALTER TABLE `kpi`
  ADD PRIMARY KEY (`ID_KPI`),
  ADD KEY `ID_Ite1` (`ID_Ite1`);

--
-- Indices de la tabla `notificacionesautomaticas`
--
ALTER TABLE `notificacionesautomaticas`
  ADD PRIMARY KEY (`ID_NotifiacionesA`);

--
-- Indices de la tabla `notificacionesmanuales`
--
ALTER TABLE `notificacionesmanuales`
  ADD PRIMARY KEY (`ID_NotifiacionesM`);

--
-- Indices de la tabla `pereva`
--
ALTER TABLE `pereva`
  ADD KEY `evaluacion_ID1` (`evaluacion_ID1`),
  ADD KEY `usuarioRed2` (`usuarioRed2`);

--
-- Indices de la tabla `permisosrol`
--
ALTER TABLE `permisosrol`
  ADD PRIMARY KEY (`ID_PermRol`);

--
-- Indices de la tabla `permrol`
--
ALTER TABLE `permrol`
  ADD KEY `ID_Rol2` (`ID_Rol2`),
  ADD KEY `ID_PermRol1` (`ID_PermRol1`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`usuarioRed`),
  ADD KEY `IdContrato1` (`IdContrato1`),
  ADD KEY `ID_Area1` (`ID_Area1`),
  ADD KEY `ID_Cargo1` (`ID_Cargo1`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`proyecto_ID`),
  ADD KEY `ID_Grupo2` (`ID_Grupo2`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_Rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD KEY `ID_Rol1` (`ID_Rol1`),
  ADD KEY `usuarioRed1` (`usuarioRed1`);

--
-- Indices de la tabla `usugrup`
--
ALTER TABLE `usugrup`
  ADD KEY `ID_Usuario1` (`ID_Usuario1`),
  ADD KEY `ID_Grupo1` (`ID_Grupo1`);

--
-- Indices de la tabla `usunota`
--
ALTER TABLE `usunota`
  ADD KEY `usuarioRed1A` (`usuarioRed1A`),
  ADD KEY `ID_NotifiacionesA1` (`ID_NotifiacionesA1`);

--
-- Indices de la tabla `usunotm`
--
ALTER TABLE `usunotm`
  ADD KEY `usuarioRed1M` (`usuarioRed1M`),
  ADD KEY `ID_NotifiacionesM1` (`ID_NotifiacionesM1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `ID_Area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `ID_Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `ID_Contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `ID_Grupo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `ID_Ite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisosrol`
--
ALTER TABLE `permisosrol`
  MODIFY `ID_PermRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `evaluaciones_ibfk_1` FOREIGN KEY (`ID_Grupo3`) REFERENCES `grupos` (`ID_Grupo`);

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`ID_KPIS1`) REFERENCES `kpi` (`ID_KPI`);

--
-- Filtros para la tabla `kpi`
--
ALTER TABLE `kpi`
  ADD CONSTRAINT `kpi_ibfk_1` FOREIGN KEY (`ID_Ite1`) REFERENCES `items` (`ID_Ite`);

--
-- Filtros para la tabla `pereva`
--
ALTER TABLE `pereva`
  ADD CONSTRAINT `pereva_ibfk_1` FOREIGN KEY (`evaluacion_ID1`) REFERENCES `evaluaciones` (`evaluacion_ID`),
  ADD CONSTRAINT `pereva_ibfk_2` FOREIGN KEY (`usuarioRed2`) REFERENCES `personas` (`usuarioRed`);

--
-- Filtros para la tabla `permrol`
--
ALTER TABLE `permrol`
  ADD CONSTRAINT `permrol_ibfk_1` FOREIGN KEY (`ID_Rol2`) REFERENCES `rol` (`ID_Rol`),
  ADD CONSTRAINT `permrol_ibfk_2` FOREIGN KEY (`ID_PermRol1`) REFERENCES `permisosrol` (`ID_PermRol`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`IdContrato1`) REFERENCES `contrato` (`ID_Contrato`),
  ADD CONSTRAINT `personas_ibfk_2` FOREIGN KEY (`ID_Area1`) REFERENCES `area` (`ID_Area`),
  ADD CONSTRAINT `personas_ibfk_3` FOREIGN KEY (`ID_Cargo1`) REFERENCES `cargo` (`ID_Cargo`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`ID_Grupo2`) REFERENCES `grupos` (`ID_Grupo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_Rol1`) REFERENCES `rol` (`ID_Rol`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`usuarioRed1`) REFERENCES `personas` (`usuarioRed`);

--
-- Filtros para la tabla `usugrup`
--
ALTER TABLE `usugrup`
  ADD CONSTRAINT `usugrup_ibfk_2` FOREIGN KEY (`ID_Grupo1`) REFERENCES `grupos` (`ID_Grupo`);

--
-- Filtros para la tabla `usunota`
--
ALTER TABLE `usunota`
  ADD CONSTRAINT `usunota_ibfk_1` FOREIGN KEY (`usuarioRed1A`) REFERENCES `personas` (`usuarioRed`),
  ADD CONSTRAINT `usunota_ibfk_2` FOREIGN KEY (`ID_NotifiacionesA1`) REFERENCES `notificacionesautomaticas` (`ID_NotifiacionesA`);

--
-- Filtros para la tabla `usunotm`
--
ALTER TABLE `usunotm`
  ADD CONSTRAINT `usunotm_ibfk_1` FOREIGN KEY (`usuarioRed1M`) REFERENCES `personas` (`usuarioRed`),
  ADD CONSTRAINT `usunotm_ibfk_2` FOREIGN KEY (`ID_NotifiacionesM1`) REFERENCES `notificacionesmanuales` (`ID_NotifiacionesM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
