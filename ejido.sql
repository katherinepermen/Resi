
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2025 a las 00:53:34
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
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` int(11) NOT NULL,
  `id_ejidatario` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `fecha_original` date DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `nueva_fecha` date DEFAULT NULL,
  `fecha_realizo` date DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado_actividad` varchar(50) NOT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `sueldo` decimal(8,2) NOT NULL,
  `horario` varchar(15) NOT NULL,
  `dias` varchar(20) NOT NULL,
  `imagen_ident` varchar(255) NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_multa`
--

CREATE TABLE `catalogo_multa` (
  `id_multa_c` int(11) NOT NULL,
  `monto` bigint(20) NOT NULL,
  `anio` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date DEFAULT NULL,
  `id_elimino` int(11) DEFAULT NULL,
  `id_modifico` int(11) DEFAULT NULL,
  `id_creo` int(11) DEFAULT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catalogo_multa`
--

INSERT INTO `catalogo_multa` (`id_multa_c`, `monto`, `anio`, `tipo`, `fecha_registro`, `fecha_modificado`, `fecha_creo`, `id_elimino`, `id_modifico`, `id_creo`, `fecha_eliminado`, `id_usuario`, `id_user`) VALUES
(1, 700, 2025, 'Descuento faenas de saneamient', '2025-10-02', '2025-10-15', '2025-10-03', NULL, 3, 3, NULL, NULL, 3),
(2, 0, 2025, 'Descuento faenas de aprovecham', '2025-10-02', '2025-10-03', '2025-10-01', NULL, 3, 3, NULL, NULL, 3),
(3, 0, 2025, 'Descuento asambleas', '2025-10-02', '2025-10-03', '2025-10-01', NULL, 3, 3, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dato_historico`
--

CREATE TABLE `dato_historico` (
  `id_dato_h` int(11) NOT NULL,
  `evidencias` varchar(250) NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `id_descuento` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `descuento` double NOT NULL,
  `id_ejidatario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejidatario`
--

CREATE TABLE `ejidatario` (
  `id_ejidatario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `num_ejidatario` int(11) NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `id_eliminado` varchar(50) DEFAULT NULL,
  `id_modificado` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejidatario`
--

INSERT INTO `ejidatario` (`id_ejidatario`, `id_usuario`, `num_ejidatario`, `fecha_eliminado`, `fecha_modificado`, `fecha_creo`, `id_eliminado`, `id_modificado`, `id_creo`) VALUES
(1, 1, 1234, NULL, NULL, '0000-00-00', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evidencia_dato_hist`
--

CREATE TABLE `evidencia_dato_hist` (
  `id_evidencia` int(11) NOT NULL,
  `id_dato_h` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario_programa`
--

CREATE TABLE `formulario_programa` (
  `id_for_pro` int(11) NOT NULL,
  `id_ejidatario` int(11) NOT NULL,
  `superficie` varchar(30) NOT NULL,
  `topografia` varchar(30) NOT NULL,
  `tipo_suelo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_actividad`
--

CREATE TABLE `gestion_actividad` (
  `id_actividad` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `duracion` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `participantes` int(11) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL,
  `id_administrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id_imagen` int(11) NOT NULL,
  `id_ejidatario` int(11) NOT NULL,
  `nombre_imagen` varchar(255) NOT NULL,
  `ruta_imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(5, '2025_09_15_002515_0001_01_01_000000_create_users_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pase_lista`
--

CREATE TABLE `pase_lista` (
  `id_pase_l` int(11) NOT NULL,
  `asistencia` tinyint(1) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_ejidatario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` double NOT NULL,
  `motivo` varchar(250) NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `id_ejidatario` int(11) NOT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `id_programa` int(11) NOT NULL,
  `id_ejidatario` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `modalidad` varchar(30) NOT NULL,
  `cobertura` varchar(40) NOT NULL,
  `vigencia` varchar(40) NOT NULL,
  `beneficiarios` int(11) NOT NULL,
  `tipo_de_programa` varchar(40) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_ejidatario`
--

CREATE TABLE `relacion_ejidatario` (
  `id_relacion` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparto_utilidad`
--

CREATE TABLE `reparto_utilidad` (
  `id_reparto_uti` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `estado` varchar(10) NOT NULL,
  `fecha_rep` date NOT NULL,
  `num_rep` int(11) NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL,
  `id_utilidad_ejidatario` int(11) NOT NULL,
  `id_utilidad` int(11) NOT NULL,
  `id_ejidatario` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `tipo_rol` varchar(15) NOT NULL,
  `id_creo` varchar(50) NOT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('gVmIAYiUrt4Pz4NyCGMbqFasfxFuod623jf6mC8C', 3, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaUtUY2JXaXB6OVhLUnloODhROWNZZHpmZ09NWUgxbVdIUVh4WTBIbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcmltZXItcmVwYXJ0byI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzYwMDQ3Mjk2O319', 1760049494),
('PYJd8KrZCk4iSWH6YkkiTOtyGWjDHafaVi1I9xPK', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVHNTOXh1ZHY5YlFSYnd1dzNOR2xqdkxYNjhPWjZYMVRRUHB4VmRoNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcmltZXItcmVwYXJ0byI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzU5NTEwMTc3O319', 1759513667),
('T8zyxzpAgB5Bc5mJJLc0ee7RrOgo8CLqHsHClsAe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlI5ZzB0UFc3UGFRQWFUa2M3Wmk2SlJRcHJQNnFMTHBOaVpONTV5WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1760047268),
('ToCefxLy2Y3WkoW2NOBg0hi0mW669eP4mHIy4eCn', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmxlaDdpUG05QURWMlZtbVlZRjRoVjBTZWpZV3lTWFVwT1VEbHZBayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3QvcHVibGljL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760048984);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucesor`
--

CREATE TABLE `sucesor` (
  `id_sucesor` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido_paterno` varchar(25) NOT NULL,
  `apellido_materno` varchar(25) NOT NULL,
  `parentesco` varchar(25) NOT NULL,
  `id_ejidatario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'pepe', 'josjosjos065@gmail.com', NULL, '$2y$12$gSb0WopHRqSZJYTHdrlLn.l.UDQW2h4tOxZmufyglamAgFxo3EfgC', NULL, '2025-09-15 06:07:44', '2025-09-15 06:07:44'),
(2, 'katherine', 'perezkathh8@gmail.com', NULL, '$2y$12$nTwx3bCYECI9MDUeqDfws.iTR0NYBMqunoRhbBQco.lfVLmDNiel.', NULL, '2025-09-15 07:53:41', '2025-09-15 07:53:41'),
(3, 'Jose', 'josjosjos0651@gmail.com', NULL, '$2y$12$.KjLXQv4WJClcwWOUsYaR.QZvcUg2P2shsDjKS/K6LFlzpQaT10aq', NULL, '2025-09-15 11:25:23', '2025-09-15 11:25:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido_paterno` varchar(30) NOT NULL,
  `apellido_materno` varchar(30) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL,
  `contrasenia` varchar(15) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `fecha_modificado` date DEFAULT NULL,
  `fecha_creo` date NOT NULL,
  `id_elimino` varchar(50) DEFAULT NULL,
  `id_modifico` varchar(50) DEFAULT NULL,
  `id_creo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido_paterno`, `apellido_materno`, `nombre_usuario`, `contrasenia`, `telefono`, `fecha_eliminado`, `fecha_modificado`, `fecha_creo`, `id_elimino`, `id_modifico`, `id_creo`) VALUES
(1, 'katherine', 'perez ', 'mendoza', 'pepe', '123456789', '2345678', NULL, NULL, '0000-00-00', NULL, NULL, '');

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
(1, 0.00, '2025', 'primer_reparto', '2025-10-02', 3),
(2, 0.00, '2025', 'segundo_reparto', '2025-09-03', 3),
(3, 600.00, '2024', 'reparto_finiquito', '2025-09-02', 3),
(4, 0.00, '2024', 'finiquito_utilidades', '2025-10-22', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utilidad_ejidatario`
--

CREATE TABLE `utilidad_ejidatario` (
  `id_utilidad_ejidatario` int(11) NOT NULL,
  `id_ejidatario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `utilidad_ejidatario`
--

INSERT INTO `utilidad_ejidatario` (`id_utilidad_ejidatario`, `id_ejidatario`) VALUES
(1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`),
  ADD KEY `ejidatario_actividad_fk` (`id_ejidatario`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD KEY `usuario_administrador_fk` (`id_usuario`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `catalogo_multa`
--
ALTER TABLE `catalogo_multa`
  ADD PRIMARY KEY (`id_multa_c`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_usuario_2` (`id_usuario`);

--
-- Indices de la tabla `dato_historico`
--
ALTER TABLE `dato_historico`
  ADD PRIMARY KEY (`id_dato_h`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`id_descuento`),
  ADD KEY `ejidatario_descuento_fk` (`id_ejidatario`);

--
-- Indices de la tabla `ejidatario`
--
ALTER TABLE `ejidatario`
  ADD PRIMARY KEY (`id_ejidatario`),
  ADD KEY `usuario_ejidatario_fk` (`id_usuario`);

--
-- Indices de la tabla `evidencia_dato_hist`
--
ALTER TABLE `evidencia_dato_hist`
  ADD PRIMARY KEY (`id_evidencia`),
  ADD KEY `dato_historico_evidencia_dato_hist_fk` (`id_dato_h`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `formulario_programa`
--
ALTER TABLE `formulario_programa`
  ADD PRIMARY KEY (`id_for_pro`),
  ADD KEY `ejidatario_formulario_programa_fk` (`id_ejidatario`);

--
-- Indices de la tabla `gestion_actividad`
--
ALTER TABLE `gestion_actividad`
  ADD PRIMARY KEY (`id_actividad`),
  ADD KEY `administrador_gestion_actividad_fk` (`id_administrador`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `ejidatario_imagen_fk` (`id_ejidatario`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pase_lista`
--
ALTER TABLE `pase_lista`
  ADD PRIMARY KEY (`id_pase_l`),
  ADD KEY `ejidatario_pase_lista_fk` (`id_ejidatario`),
  ADD KEY `actividad_pase_lista_fk` (`id_actividad`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `ejidatario_prestamo_fk` (`id_ejidatario`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`id_programa`),
  ADD KEY `ejidatario_programa_fk` (`id_ejidatario`);

--
-- Indices de la tabla `relacion_ejidatario`
--
ALTER TABLE `relacion_ejidatario`
  ADD PRIMARY KEY (`id_relacion`),
  ADD KEY `usuario_relacion_ejidatario_fk` (`id_usuario`),
  ADD KEY `rol_relacion_ejidatario_fk` (`id_rol`);

--
-- Indices de la tabla `reparto_utilidad`
--
ALTER TABLE `reparto_utilidad`
  ADD PRIMARY KEY (`id_reparto_uti`),
  ADD KEY `utilidad_reparto_utilidad_fk` (`id_utilidad`),
  ADD KEY `ejidatario_reparto_utilidad_fk` (`id_ejidatario`),
  ADD KEY `utilidad_ejidatario_reparto_utilidad_fk` (`id_utilidad_ejidatario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `sucesor`
--
ALTER TABLE `sucesor`
  ADD PRIMARY KEY (`id_sucesor`),
  ADD KEY `ejidatario_sucesor_fk` (`id_ejidatario`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `utilidades`
--
ALTER TABLE `utilidades`
  ADD PRIMARY KEY (`id_utilidad`),
  ADD KEY `utilidades_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `utilidad_ejidatario`
--
ALTER TABLE `utilidad_ejidatario`
  ADD PRIMARY KEY (`id_utilidad_ejidatario`),
  ADD KEY `ejidatario_utilidad_ejidatario_fk` (`id_ejidatario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo_multa`
--
ALTER TABLE `catalogo_multa`
  MODIFY `id_multa_c` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `dato_historico`
--
ALTER TABLE `dato_historico`
  MODIFY `id_dato_h` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `id_descuento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejidatario`
--
ALTER TABLE `ejidatario`
  MODIFY `id_ejidatario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `evidencia_dato_hist`
--
ALTER TABLE `evidencia_dato_hist`
  MODIFY `id_evidencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formulario_programa`
--
ALTER TABLE `formulario_programa`
  MODIFY `id_for_pro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gestion_actividad`
--
ALTER TABLE `gestion_actividad`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pase_lista`
--
ALTER TABLE `pase_lista`
  MODIFY `id_pase_l` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `id_programa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `relacion_ejidatario`
--
ALTER TABLE `relacion_ejidatario`
  MODIFY `id_relacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reparto_utilidad`
--
ALTER TABLE `reparto_utilidad`
  MODIFY `id_reparto_uti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucesor`
--
ALTER TABLE `sucesor`
  MODIFY `id_sucesor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `utilidades`
--
ALTER TABLE `utilidades`
  MODIFY `id_utilidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `utilidad_ejidatario`
--
ALTER TABLE `utilidad_ejidatario`
  MODIFY `id_utilidad_ejidatario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `ejidatario_actividad_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `usuario_administrador_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `catalogo_multa`
--
ALTER TABLE `catalogo_multa`
  ADD CONSTRAINT `catalogo_multa_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `catalogo_multa_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_USER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD CONSTRAINT `ejidatario_descuento_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ejidatario`
--
ALTER TABLE `ejidatario`
  ADD CONSTRAINT `usuario_ejidatario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evidencia_dato_hist`
--
ALTER TABLE `evidencia_dato_hist`
  ADD CONSTRAINT `dato_historico_evidencia_dato_hist_fk` FOREIGN KEY (`id_dato_h`) REFERENCES `dato_historico` (`id_dato_h`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `formulario_programa`
--
ALTER TABLE `formulario_programa`
  ADD CONSTRAINT `ejidatario_formulario_programa_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gestion_actividad`
--
ALTER TABLE `gestion_actividad`
  ADD CONSTRAINT `administrador_gestion_actividad_fk` FOREIGN KEY (`id_administrador`) REFERENCES `administrador` (`id_administrador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `ejidatario_imagen_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pase_lista`
--
ALTER TABLE `pase_lista`
  ADD CONSTRAINT `actividad_pase_lista_fk` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ejidatario_pase_lista_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `ejidatario_prestamo_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `programa`
--
ALTER TABLE `programa`
  ADD CONSTRAINT `ejidatario_programa_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `relacion_ejidatario`
--
ALTER TABLE `relacion_ejidatario`
  ADD CONSTRAINT `rol_relacion_ejidatario_fk` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_relacion_ejidatario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reparto_utilidad`
--
ALTER TABLE `reparto_utilidad`
  ADD CONSTRAINT `ejidatario_reparto_utilidad_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `utilidad_ejidatario_reparto_utilidad_fk` FOREIGN KEY (`id_utilidad_ejidatario`) REFERENCES `utilidad_ejidatario` (`id_utilidad_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `utilidad_reparto_utilidad_fk` FOREIGN KEY (`id_utilidad`) REFERENCES `utilidad` (`id_utilidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucesor`
--
ALTER TABLE `sucesor`
  ADD CONSTRAINT `ejidatario_sucesor_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `utilidades`
--
ALTER TABLE `utilidades`
  ADD CONSTRAINT `utilidades_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_USER`);

--
-- Filtros para la tabla `utilidad_ejidatario`
--
ALTER TABLE `utilidad_ejidatario`
  ADD CONSTRAINT `ejidatario_utilidad_ejidatario_fk` FOREIGN KEY (`id_ejidatario`) REFERENCES `ejidatario` (`id_ejidatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
