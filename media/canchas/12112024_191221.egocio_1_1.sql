-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-11-2024 a las 22:45:15
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `negocio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Cargo', 7, 'add_cargo'),
(26, 'Can change Cargo', 7, 'change_cargo'),
(27, 'Can delete Cargo', 7, 'delete_cargo'),
(28, 'Can view Cargo', 7, 'view_cargo'),
(29, 'Can add Departamento', 8, 'add_departamento'),
(30, 'Can change Departamento', 8, 'change_departamento'),
(31, 'Can delete Departamento', 8, 'delete_departamento'),
(32, 'Can view Departamento', 8, 'view_departamento'),
(33, 'Can add Empleado', 9, 'add_empleado'),
(34, 'Can change Empleado', 9, 'change_empleado'),
(35, 'Can delete Empleado', 9, 'delete_empleado'),
(36, 'Can view Empleado', 9, 'view_empleado'),
(37, 'Can add Cancha', 10, 'add_cancha'),
(38, 'Can change Cancha', 10, 'change_cancha'),
(39, 'Can delete Cancha', 10, 'delete_cancha'),
(40, 'Can view Cancha', 10, 'view_cancha'),
(41, 'Can add Cliente', 11, 'add_cliente'),
(42, 'Can change Cliente', 11, 'change_cliente'),
(43, 'Can delete Cliente', 11, 'delete_cliente'),
(44, 'Can view Cliente', 11, 'view_cliente'),
(45, 'Can add Horario', 12, 'add_horario'),
(46, 'Can change Horario', 12, 'change_horario'),
(47, 'Can delete Horario', 12, 'delete_horario'),
(48, 'Can view Horario', 12, 'view_horario'),
(49, 'Can add Reserva', 13, 'add_reserva'),
(50, 'Can change Reserva', 13, 'change_reserva'),
(51, 'Can delete Reserva', 13, 'delete_reserva'),
(52, 'Can view Reserva', 13, 'view_reserva'),
(53, 'Can add Entrenador', 14, 'add_entrenador'),
(54, 'Can change Entrenador', 14, 'change_entrenador'),
(55, 'Can delete Entrenador', 14, 'delete_entrenador'),
(56, 'Can view Entrenador', 14, 'view_entrenador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$NcNgGdPQLG1GjjS0hJZdtq$gZFeRm5GVBjzQ0g9YuDnArWXVmRzj1f2kChwISSPOvw=', '2024-11-04 13:35:37.404102', 1, 'administrador', '', '', 'administrador@correo.cl', 1, 1, '2024-11-02 21:49:17.410355');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancha`
--

DROP TABLE IF EXISTS `cancha`;
CREATE TABLE IF NOT EXISTS `cancha` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `capacidad` int NOT NULL,
  `estado` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `creado` datetime(6) NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `cancha`
--

INSERT INTO `cancha` (`id`, `nombre`, `descripcion`, `tipo`, `capacidad`, `estado`, `creado`, `foto`) VALUES
(1, 'Ronny', 'la cancha perfecta para los 5ta division', 'futbol', 16, 'ocupada', '2024-11-04 12:35:17.000000', 'cancha/todoCancha.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `creado` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `nombre`, `creado`) VALUES
(1, 'Mantenedor', '0000-00-00 00:00:00.000000'),
(2, 'RRHH', '2024-11-02 21:50:03.000000'),
(3, 'administrador', '2024-11-02 21:50:40.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `paterno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `materno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `sexo` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fechaNac` date DEFAULT NULL,
  `creado` datetime(6) NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `run`, `nombre`, `paterno`, `materno`, `sexo`, `fechaNac`, `creado`, `foto`) VALUES
(7, '1231-5', 'qweqweqwe', 'qweqwe', 'qweqwe', 'm', '1992-11-11', '2024-11-04 13:13:03.710868', 'empleados/empledo.png'),
(3, '21672449-6', 'Sebastian', 'Aguilera', 'Aguilera', 'm', '2004-10-01', '2024-11-03 04:01:12.149717', 'empleados/empledo.png'),
(6, '123123-1', 'jeyson', 'care', 'culo', 'm', '1998-11-11', '2024-11-03 22:01:50.656069', 'empleados/empledo.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `codigo` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `creado` datetime(6) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`codigo`, `nombre`, `creado`) VALUES
(1, 'Administracion', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-11-02 21:50:08.258321', '2', 'RRHH', 1, '[{\"added\": {}}]', 7, 1),
(2, '2024-11-02 21:50:47.677882', '3', 'administrador', 1, '[{\"added\": {}}]', 7, 1),
(3, '2024-11-02 22:14:01.340051', '1', 'pne sexo culo sexo culo culo', 1, '[{\"added\": {}}]', 11, 1),
(4, '2024-11-03 04:01:37.474531', '2', 'Sebastian Aguilera Aguilera', 3, '', 11, 1),
(5, '2024-11-04 12:35:51.838868', '1', 'Ronny futbol', 1, '[{\"added\": {}}]', 10, 1),
(6, '2024-11-04 13:00:04.582480', '1', 'Reserva: camilo mal pal catre - Ronny futbol - 2024-11-04 12:00 - 14:59', 1, '[{\"added\": {}}]', 13, 1),
(7, '2024-11-11 15:15:58.954881', '1', 'francisco caiceo malo pal k3', 1, '[{\"added\": {}}]', 14, 1),
(8, '2024-11-11 15:17:19.615775', '2', 'jorge cortes segundo madre', 1, '[{\"added\": {}}]', 14, 1),
(9, '2024-11-11 15:23:02.501396', '3', 'alex dias marin', 1, '[{\"added\": {}}]', 14, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'tiendaApp', 'cargo'),
(8, 'tiendaApp', 'departamento'),
(9, 'tiendaApp', 'empleado'),
(10, 'tiendaApp', 'cancha'),
(11, 'tiendaApp', 'cliente'),
(12, 'tiendaApp', 'horario'),
(13, 'tiendaApp', 'reserva'),
(14, 'tiendaApp', 'entrenador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-10-15 19:48:47.413903'),
(2, 'auth', '0001_initial', '2024-10-15 19:48:48.027012'),
(3, 'admin', '0001_initial', '2024-10-15 19:48:48.221075'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-10-15 19:48:48.229848'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-15 19:48:48.237359'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-10-15 19:48:48.327764'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-10-15 19:48:48.370951'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-10-15 19:48:48.425700'),
(9, 'auth', '0004_alter_user_username_opts', '2024-10-15 19:48:48.435242'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-10-15 19:48:48.483026'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-10-15 19:48:48.483026'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-15 19:48:48.499069'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-10-15 19:48:48.539728'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-15 19:48:48.580110'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-10-15 19:48:48.628803'),
(16, 'auth', '0011_update_proxy_permissions', '2024-10-15 19:48:48.646197'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-15 19:48:48.702412'),
(18, 'sessions', '0001_initial', '2024-10-15 19:48:48.744584'),
(19, 'tiendaApp', '0001_initial', '2024-10-15 19:48:48.968427'),
(20, 'tiendaApp', '0002_empleado_foto_alter_empleado_creado_and_more', '2024-11-02 19:20:40.298006'),
(21, 'tiendaApp', '0003_cancha', '2024-11-02 19:47:19.973863'),
(22, 'tiendaApp', '0004_cliente', '2024-11-02 22:13:07.734283'),
(23, 'tiendaApp', '0005_horario_cancha_foto_alter_cancha_estado_and_more', '2024-11-04 10:29:19.521062'),
(24, 'tiendaApp', '0006_entrenador', '2024-11-11 15:11:50.279779');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2cztmsa26zzl859rzyfz1a88gz45njuv', '.eJxVjDsOwyAQBe9CHSHA_Jwyvc-AWHYJTiKQjF1FuXtsyUXSvpk3bxbitpawdVrCjOzKJLv8bhDTk-oB8BHrvfHU6rrMwA-Fn7TzqSG9bqf7Fyixl_1tZBx11h6TNIMTQipw6DxJCyolpcGnMXsgsSfJWFTZOmcy2jzETEKzzxffzzhk:1t7xF3:ae0VHkEvAQqJJTrQtbsTdSurTwZClpFHLvpnnEVTPMA', '2024-11-18 13:35:37.415327');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `paterno` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `materno` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `sexo` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `codigoEmpleado` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `sueldo` int UNSIGNED NOT NULL,
  `fechaNac` date DEFAULT NULL,
  `creado` datetime(6) NOT NULL,
  `cargo_id` bigint NOT NULL,
  `departamento_id` bigint NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_cargo_id_bb5f1a73` (`cargo_id`),
  KEY `empleado_departamento_id_bf397cb9` (`departamento_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `run`, `nombre`, `paterno`, `materno`, `sexo`, `codigoEmpleado`, `sueldo`, `fechaNac`, `creado`, `cargo_id`, `departamento_id`, `foto`) VALUES
(1, '1-9', 'felipe', 'araya', 'dias', 'm', '123', 2131234, '2004-11-11', '2024-11-02 19:25:16.851256', 2, 1, 'empleados/02112024_221217.png'),
(2, '1-9', 'terrible enrri', 'jot', 'rojo', 'f', '1213133', 123415, '2004-11-11', '2024-11-02 19:40:32.534880', 3, 1, 'empleados/empledo.png'),
(4, '123456-9', 'Sebastian', 'Aguilera', 'Aguilera', 'm', '12', 500000, '2004-10-01', '2024-11-02 21:47:36.213380', 1, 1, 'empleados/empledo.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
CREATE TABLE IF NOT EXISTS `entrenador` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `paterno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `materno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `especialidad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `sexo` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fechaNac` date DEFAULT NULL,
  `creado` datetime(6) NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `entrenador`
--

INSERT INTO `entrenador` (`id`, `run`, `nombre`, `paterno`, `materno`, `especialidad`, `sexo`, `fechaNac`, `creado`, `foto`) VALUES
(2, '2-9', 'jorge', 'cortes', 'segundo madre', 'futbolito', 'm', '2000-01-12', '2024-11-11 15:17:19.609763', 'entrenadores/11112024_151719.png'),
(3, '3-9', 'alex', 'dias', 'marin', 'tenis', 'm', '1992-12-12', '2024-11-11 15:23:02.498407', 'entrenadores/11112024_152302.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

DROP TABLE IF EXISTS `horario`;
CREATE TABLE IF NOT EXISTS `horario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hora_inicio` time(6) NOT NULL,
  `hora_fin` time(6) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `hora_inicio`, `hora_fin`, `precio`) VALUES
(1, '12:00:00.000000', '14:59:00.000000', 25000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `observaciones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `creado` datetime(6) NOT NULL,
  `cancha_id` bigint NOT NULL,
  `cliente_id` bigint NOT NULL,
  `horario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reserva_cancha_id_horario_id_fecha_584de9c0_uniq` (`cancha_id`,`horario_id`,`fecha`),
  KEY `reserva_cancha_id_e608022f` (`cancha_id`),
  KEY `reserva_cliente_id_b1289b29` (`cliente_id`),
  KEY `reserva_horario_id_1b452105` (`horario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
