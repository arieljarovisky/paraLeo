-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 14:42:43
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `candidatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `nacimiento` date NOT NULL,
  `residencia` varchar(300) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `email` varchar(250) NOT NULL,
  `estado` varchar(300) NOT NULL,
  `telefono` int(14) NOT NULL,
  `nombre_archivo` varchar(250) NOT NULL,
  `perfil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id`, `nombre`, `nacimiento`, `residencia`, `descripcion`, `email`, `estado`, `telefono`, `nombre_archivo`, `perfil_id`) VALUES
(13, 'josecito', '1999-04-21', 'Argentina', 'lorem ipsum', 'josecito@gmail.com', 'Por ingresar', 1154616161, '', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(200) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `comentario` varchar(400) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `id_candidato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `usuario`, `imagen`, `comentario`, `fecha`, `id_candidato`) VALUES
(13, 'ariel jarovisky', 'https://static-00.iconduck.com/assets.00/person-circle-icon-256x256-e5dbsxlg.png', 'Hola pirulo\r\n', '2022-11-14 16:41:46', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habildad_por_candidato`
--

CREATE TABLE `habildad_por_candidato` (
  `id` int(11) NOT NULL,
  `candidato_id` int(11) NOT NULL,
  `habilidad_por_perfil` int(11) NOT NULL,
  `puntaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `habildad_por_candidato`
--

INSERT INTO `habildad_por_candidato` (`id`, `candidato_id`, `habilidad_por_perfil`, `puntaje`) VALUES
(3, 13, 37, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades`
--

CREATE TABLE `habilidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `soft` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `habilidades`
--

INSERT INTO `habilidades` (`id`, `nombre`, `soft`) VALUES
(37, 'PHP', 1),
(39, 'JAVA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades_por_perfil`
--

CREATE TABLE `habilidades_por_perfil` (
  `id` int(11) NOT NULL,
  `habilidad_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `habilidades_por_perfil`
--

INSERT INTO `habilidades_por_perfil` (`id`, `habilidad_id`, `perfil_id`) VALUES
(16, 37, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `autor` varchar(200) NOT NULL,
  `mensaje` varchar(400) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `imagen`, `autor`, `mensaje`, `estado`, `fecha`) VALUES
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' cargo el candidato ariel', 1, '2022-11-02 12:06:46'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-02 12:14:49'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-02 13:21:20'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' modifico el candidato ariel', 1, '2022-11-04 11:35:37'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' modifico el candidato ariel', 1, '2022-11-04 11:42:43'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-10 11:28:23'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-10 14:40:28'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-11 09:39:16'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-11 09:39:18'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-11 09:39:20'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-11 09:39:23'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-11 09:39:26'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-11 09:39:29'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-11 09:39:33'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' Hizo un comentario en el candidato ariel', 1, '2022-11-11 09:39:36'),
(0, 'https://static-00.iconduck.com/assets.00/person-circle-icon-256x256-e5dbsxlg.png', 'ariel jarovisky', ' Hizo un comentario en el candidato josecito', 1, '2022-11-14 16:41:46'),
(0, 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 'Ariel Jarovisky', ' cargo el candidato ariel', 1, '2022-11-14 16:44:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `nombre_perfil` varchar(300) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `requisitos` varchar(300) NOT NULL,
  `empresa` varchar(300) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `nombre_perfil`, `descripcion`, `requisitos`, `empresa`, `fecha`) VALUES
(11, 'Desarrollador Java', 'esta es la descripcion', 'Liderazgo', 'Eldar', '2022-11-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `google_uid` varchar(300) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `full_name` varchar(300) NOT NULL,
  `gender` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `picture` varchar(300) NOT NULL,
  `verifiedEmail` tinyint(1) NOT NULL,
  `token` varchar(300) NOT NULL,
  `super_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `google_uid`, `first_name`, `last_name`, `full_name`, `gender`, `email`, `picture`, `verifiedEmail`, `token`, `super_admin`) VALUES
(1, '', 'Ariel', 'Jarovisky', 'Ariel Jarovisky', '', 'ariel.jarovisky@eldars.com.ar', 'https://lh3.googleusercontent.com/a/ALm5wu0TcAsfpWq4DB1mWa0ftXT8XKyYJzFFhXxywXSG=s96-c', 1, '108864882444926782129', 1),
(2, '', 'Jose Luis', 'Rigolino', 'Jose Luis Rigolino', '', 'jose.rigolino@eldars.com.ar', 'https://lh3.googleusercontent.com/a/ALm5wu1Mi7sx9YaK-EJtptToWQsAZ03abtYhjMa7xLB9=s96-c', 1, '108734424679300218164', 0),
(3, '', 'Pablo', 'Perez', 'Pablo Perez', '', 'pablo.perez@eldars.com.ar', 'https://lh3.googleusercontent.com/a/ALm5wu3oTkFzqRD3ToSSe6RQ-lk2Dgd5v_vUq4ZdBbF1=s96-c', 1, '106462630485014694568', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_fiserv`
--

CREATE TABLE `users_fiserv` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `apellido` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `contrasena` varchar(300) NOT NULL,
  `imagen` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users_fiserv`
--

INSERT INTO `users_fiserv` (`id`, `nombre`, `apellido`, `email`, `contrasena`, `imagen`) VALUES
(1, 'ariel', 'jarovisky', 'ariel@gmail.com', '1234', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_perfilid` (`id`),
  ADD KEY `fkperfilid` (`perfil_id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idcandidato` (`id_candidato`);

--
-- Indices de la tabla `habildad_por_candidato`
--
ALTER TABLE `habildad_por_candidato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidato_id` (`candidato_id`),
  ADD KEY `habilidad_por_perfil` (`habilidad_por_perfil`);

--
-- Indices de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `habilidades_por_perfil`
--
ALTER TABLE `habilidades_por_perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `habilidad_id` (`habilidad_id`),
  ADD KEY `perfil_id` (`perfil_id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_fiserv`
--
ALTER TABLE `users_fiserv`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `habildad_por_candidato`
--
ALTER TABLE `habildad_por_candidato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `habilidades_por_perfil`
--
ALTER TABLE `habilidades_por_perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users_fiserv`
--
ALTER TABLE `users_fiserv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD CONSTRAINT `fkperfilid` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_idcandidato` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habildad_por_candidato`
--
ALTER TABLE `habildad_por_candidato`
  ADD CONSTRAINT `habildad_por_candidato_ibfk_1` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `habildad_por_candidato_ibfk_2` FOREIGN KEY (`habilidad_por_perfil`) REFERENCES `habilidades_por_perfil` (`habilidad_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habilidades_por_perfil`
--
ALTER TABLE `habilidades_por_perfil`
  ADD CONSTRAINT `habilidades_por_perfil_ibfk_1` FOREIGN KEY (`habilidad_id`) REFERENCES `habilidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `habilidades_por_perfil_ibfk_2` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
