-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-10-2024 a las 21:43:22
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `negocito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

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
(36, 'Can view Empleado', 9, 'view_empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_spanish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$6zLPnrIiaPIUVhjAwEczeO$BC/dAEMitATZw/CVFBml65hPq1Sh/RthgyfiJOHJUbM=', '2024-10-15 20:06:24.320376', 1, 'administrador', '', '', 'administrador@correo.cl', 1, 1, '2024-10-08 21:08:25.513102');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `creado` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `nombre`, `creado`) VALUES
(1, 'Vendedor', '2024-10-08 21:18:35.000000'),
(2, 'Bodeguero', '2024-10-08 21:18:50.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `codigo` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `creado` datetime(6) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`codigo`, `nombre`, `creado`) VALUES
(1, 'Ventas', '2024-10-08 21:19:02.000000'),
(2, 'Bodega', '2024-10-08 21:19:09.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_spanish_ci,
  `object_repr` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_spanish_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-10-08 21:18:47.530808', '1', 'Vendedor', 1, '[{\"added\": {}}]', 7, 1),
(2, '2024-10-08 21:18:56.287333', '2', 'Bodeguero', 1, '[{\"added\": {}}]', 7, 1),
(3, '2024-10-08 21:19:07.520654', '1', 'Ventas', 1, '[{\"added\": {}}]', 8, 1),
(4, '2024-10-08 21:19:13.864962', '2', 'Bodega', 1, '[{\"added\": {}}]', 8, 1),
(5, '2024-10-08 21:19:24.639894', '1', 'Alan Brito delgado', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

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
(9, 'tiendaApp', 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-10-08 21:05:22.223989'),
(2, 'auth', '0001_initial', '2024-10-08 21:05:22.620577'),
(3, 'admin', '0001_initial', '2024-10-08 21:05:22.759608'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-10-08 21:05:22.764617'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-08 21:05:22.769599'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-10-08 21:05:22.828621'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-10-08 21:05:22.860624'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-10-08 21:05:22.887628'),
(9, 'auth', '0004_alter_user_username_opts', '2024-10-08 21:05:22.896617'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-10-08 21:05:22.931620'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-10-08 21:05:22.932621'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-08 21:05:22.939623'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-10-08 21:05:22.969623'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-08 21:05:23.000620'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-10-08 21:05:23.026295'),
(16, 'auth', '0011_update_proxy_permissions', '2024-10-08 21:05:23.032305'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-08 21:05:23.062295'),
(18, 'sessions', '0001_initial', '2024-10-08 21:05:23.091294'),
(19, 'tiendaApp', '0001_initial', '2024-10-08 21:05:23.301946'),
(20, 'tiendaApp', '0002_empleado_foto_alter_empleado_creado_and_more', '2024-10-29 21:24:54.634386');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `session_data` longtext COLLATE utf8_spanish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('s1nhiklrjgpt2i3zdsasrvndnfyl5ua2', '.eJxVjDsOwjAQBe_iGlnrT2yHkp4zRLvrDQkgW4qTCnF3iJQC2jcz76UG3NZp2Josw5zVWRl1-t0I-SFlB_mO5VY117IuM-ld0Qdt-lqzPC-H-3cwYZu-dXQ-pgTIDhH86IkC55gAJDmAnruMzM5Y44InTp0ZkyUJlqUHsuLU-wPXCDe4:1syHSM:rKhkwZPmBAalrJYh59Yub7dTIlFG8P3ZBtnydfuYdqc', '2024-10-22 21:09:22.095296'),
('ztuzsk19hveamd3e0t18nh7tmcxwz0d3', '.eJxVjDsOwjAQBe_iGlnrT2yHkp4zRLvrDQkgW4qTCnF3iJQC2jcz76UG3NZp2Josw5zVWRl1-t0I-SFlB_mO5VY117IuM-ld0Qdt-lqzPC-H-3cwYZu-dXQ-pgTIDhH86IkC55gAJDmAnruMzM5Y44InTp0ZkyUJlqUHsuLU-wPXCDe4:1t0noG:MbsmTa2k8_ZLSnYWxmlQ9yPWp08xoJ5_dtDqkcEQ8f4', '2024-10-29 20:06:24.321923');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `paterno` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `materno` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `codigoEmpleado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `sueldo` int UNSIGNED NOT NULL,
  `fechaNac` date DEFAULT NULL,
  `creado` datetime(6) NOT NULL,
  `cargo_id` bigint NOT NULL,
  `departamento_id` bigint NOT NULL,
  `foto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_cargo_id_bb5f1a73` (`cargo_id`),
  KEY `empleado_departamento_id_bf397cb9` (`departamento_id`)
) ;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `run`, `nombre`, `paterno`, `materno`, `sexo`, `codigoEmpleado`, `sueldo`, `fechaNac`, `creado`, `cargo_id`, `departamento_id`, `foto`) VALUES
(1, '13258756-9', 'Alan', 'Brito', 'delgado', 'm', '101', 500000, '2000-10-09', '2024-10-08 21:17:48.000000', 1, 1, 'empleados/empledo.png'),
(2, '123-4', 'Armando', 'Bronca', 'Segura', 'm', '401', 620000, '2001-12-15', '2024-10-22 19:46:26.874212', 2, 2, 'empleados/empledo.png'),
(3, '123-4', 'Armando', 'Bronca', 'Segura', 'm', '401', 620000, '2001-12-15', '2024-10-22 19:58:43.416526', 2, 2, 'empleados/empledo.png'),
(5, '456-7', 'Zoila', 'Cerda', 'Roja', 'f', '403', 650000, '1995-12-12', '2024-10-22 20:27:55.565789', 1, 1, 'empleados/empledo.png'),
(8, '632-5', 'Kevincinio', 'Broncas', 'Terrible', 'f', '449', 1500001, '2004-05-05', '2024-10-22 20:56:48.238353', 2, 2, 'empleados/29102024_214203.PNG');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
