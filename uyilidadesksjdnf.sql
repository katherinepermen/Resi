-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2025 a las 03:00:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejido`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utilidades`
--

CREATE TABLE `utilidades` (
  `id_utilidad` int(11) NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `anio` year(4) NOT NULL,
  `tipo_reparto` varchar(50) NOT NULL,
  `fecha_registro` date NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `utilidades`
--

INSERT INTO `utilidades` (`id_utilidad`, `monto`, `anio`, `tipo_reparto`, `fecha_registro`, `id_user`) VALUES
(1, 300.00, '2024', 'primer_reparto', '2025-09-30', 3),
(2, 600.00, '2025', 'segundo_reparto', '2025-09-03', 3),
(3, 600.00, '2024', 'reparto_finiquito', '2025-09-01', 3),
(4, 100.00, '0000', 'finiquito_utlilidades', '0000-00-00', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `utilidades`
--
ALTER TABLE `utilidades`
  ADD PRIMARY KEY (`id_utilidad`),
  ADD KEY `utilidades_id_user_foreign` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `utilidades`
--
ALTER TABLE `utilidades`
  MODIFY `id_utilidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `utilidades`
--
ALTER TABLE `utilidades`
  ADD CONSTRAINT `utilidades_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_USER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
