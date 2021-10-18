-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-10-2021 a las 20:04:14
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `myclass`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `curso` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `nombre`, `apellidos`, `curso`) VALUES
(1, 'Ruben', 'Girela', '4º CSI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id`, `nombre`) VALUES
(1, 'Procesadores de Lenguajes'),
(2, 'Nuevos Paradigmas de Interaccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asig_alumnos`
--

CREATE TABLE `asig_alumnos` (
  `id_alumno` bigint(20) UNSIGNED NOT NULL,
  `id_asignatura` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asig_alumnos`
--

INSERT INTO `asig_alumnos` (`id_alumno`, `id_asignatura`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asig_aulas`
--

CREATE TABLE `asig_aulas` (
  `id_aula` bigint(20) UNSIGNED NOT NULL,
  `id_asignatura` bigint(20) UNSIGNED NOT NULL,
  `dia_semana` int(11) NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asig_aulas`
--

INSERT INTO `asig_aulas` (`id_aula`, `id_asignatura`, `dia_semana`, `hora`) VALUES
(1, 2, 5, '09:30:00'),
(2, 1, 2, '10:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asig_profesores`
--

CREATE TABLE `asig_profesores` (
  `id_profesor` bigint(20) UNSIGNED NOT NULL,
  `id_asignatura` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asig_profesores`
--

INSERT INTO `asig_profesores` (`id_profesor`, `id_asignatura`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aula`
--

CREATE TABLE `aula` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `n_aula` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aula`
--

INSERT INTO `aula` (`id`, `n_aula`) VALUES
(1, '1.5'),
(2, '1.6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_alumno` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`usuario`, `password`, `id_alumno`) VALUES
('ruben', 'ruben', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `nombre`, `apellidos`) VALUES
(1, 'Ramon', 'Lopez'),
(2, 'Marcelino Jose', 'Cabrera');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `asig_alumnos`
--
ALTER TABLE `asig_alumnos`
  ADD PRIMARY KEY (`id_alumno`,`id_asignatura`),
  ADD KEY `fk_alu` (`id_alumno`),
  ADD KEY `id_asignatura` (`id_asignatura`);

--
-- Indices de la tabla `asig_aulas`
--
ALTER TABLE `asig_aulas`
  ADD PRIMARY KEY (`id_aula`,`id_asignatura`),
  ADD KEY `id_asignatura` (`id_asignatura`);

--
-- Indices de la tabla `asig_profesores`
--
ALTER TABLE `asig_profesores`
  ADD PRIMARY KEY (`id_profesor`,`id_asignatura`),
  ADD KEY `id_asignatura` (`id_asignatura`);

--
-- Indices de la tabla `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`usuario`,`id_alumno`),
  ADD KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `aula`
--
ALTER TABLE `aula`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asig_alumnos`
--
ALTER TABLE `asig_alumnos`
  ADD CONSTRAINT `asig_alumnos_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  ADD CONSTRAINT `asig_alumnos_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id`);

--
-- Filtros para la tabla `asig_aulas`
--
ALTER TABLE `asig_aulas`
  ADD CONSTRAINT `asig_aulas_ibfk_1` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id`),
  ADD CONSTRAINT `asig_aulas_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id`);

--
-- Filtros para la tabla `asig_profesores`
--
ALTER TABLE `asig_profesores`
  ADD CONSTRAINT `asig_profesores_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`),
  ADD CONSTRAINT `asig_profesores_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id`);

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
