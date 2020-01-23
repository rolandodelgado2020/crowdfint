-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-01-2020 a las 16:10:00
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crowdfint`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'prueba', 'prueba', '2020-01-02 22:52:57', '2020-01-02 22:52:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_posts`
--

DROP TABLE IF EXISTS `category_posts`;
CREATE TABLE IF NOT EXISTS `category_posts` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `category_posts_post_id_index` (`post_id`),
  KEY `category_posts_category_id_index` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `category_posts`
--

INSERT INTO `category_posts` (`post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', '2019-12-30 23:34:40', '2019-12-30 23:34:40'),
(2, 'user', '2019-12-30 23:34:40', '2019-12-30 23:34:40'),
(3, 'juan', '2020-01-02 20:40:41', '2020-01-02 20:40:41'),
(4, 'juani', '2020-01-02 20:43:47', '2020-01-02 20:43:47'),
(5, 'rolandodel', '2020-01-02 21:35:40', '2020-01-02 21:35:40'),
(6, 'damian', '2020-01-07 17:37:24', '2020-01-07 17:37:24'),
(7, 'juanca', '2020-01-11 02:51:15', '2020-01-11 02:51:15'),
(8, 'eduardo', '2020-01-11 03:14:03', '2020-01-11 03:14:03'),
(9, 'guille', '2020-01-11 11:28:16', '2020-01-11 11:28:16'),
(10, 'vicky', '2020-01-11 11:40:03', '2020-01-11 11:40:03'),
(11, 'ivan', '2020-01-11 14:12:14', '2020-01-11 14:12:14'),
(12, 'dani', '2020-01-13 14:48:49', '2020-01-13 14:48:49'),
(13, 'sdfsdf', '2020-01-13 15:47:28', '2020-01-13 15:47:28'),
(14, 'fljsdañl', '2020-01-13 15:48:59', '2020-01-13 15:48:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'CROWDFINT Blog', '', '_self', 'fas fa-blog', NULL, NULL, 1, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'blog', NULL),
(2, 1, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 2, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'home', NULL),
(3, 1, 'Categorías', '', '_self', 'fas fa-folder', NULL, NULL, 3, '2019-12-30 23:34:40', '2019-12-30 23:34:40', NULL, NULL),
(4, 1, 'Crear categoría', '', '_self', NULL, NULL, 3, 1, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'categories.create', NULL),
(5, 1, 'Mostrar categorías', '', '_self', NULL, NULL, 3, 2, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'categories.index', NULL),
(6, 1, 'Etiquetas', '', '_self', 'fas fa-tags', NULL, NULL, 4, '2019-12-30 23:34:40', '2019-12-30 23:34:40', NULL, NULL),
(7, 1, 'Crear etiqueta', '', '_self', NULL, NULL, 6, 1, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'tags.create', NULL),
(8, 1, 'Mostrar etiquetas', '', '_self', NULL, NULL, 6, 2, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'tags.index', NULL),
(9, 1, 'Permisos', '', '_self', 'fas fa-key', NULL, NULL, 5, '2019-12-30 23:34:40', '2019-12-30 23:34:40', NULL, NULL),
(10, 1, 'Crear permiso', '', '_self', NULL, NULL, 9, 1, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'permissions.create', NULL),
(11, 1, 'Mostrar permisos', '', '_self', NULL, NULL, 9, 2, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'permissions.index', NULL),
(12, 1, 'Mostrar grupos de permisos', '', '_self', NULL, NULL, 9, 3, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'permission_groups.index', NULL),
(13, 1, 'Crear grupos de permisos', '', '_self', NULL, NULL, 9, 4, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'permission_groups.create', NULL),
(14, 1, 'Publicaciones', '', '_self', 'fas fa-newspaper', NULL, NULL, 6, '2019-12-30 23:34:40', '2019-12-30 23:34:40', NULL, NULL),
(15, 1, 'Crear publicación', '', '_self', NULL, NULL, 14, 1, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'posts.create', NULL),
(16, 1, 'Mostrar publicaciones', '', '_self', 'fas fa-newspaper', NULL, 14, 2, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'posts.index', NULL),
(17, 1, 'Roles', '', '_self', 'fas fa-scroll', NULL, NULL, 7, '2019-12-30 23:34:40', '2019-12-30 23:34:40', NULL, NULL),
(18, 1, 'Crear rol', '', '_self', NULL, NULL, 17, 1, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'roles.create', NULL),
(19, 1, 'Mostrar roles', '', '_self', NULL, NULL, 17, 2, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'roles.index', NULL),
(20, 1, 'Usuarios', '', '_self', 'fas fa-users', NULL, NULL, 8, '2019-12-30 23:34:40', '2019-12-30 23:34:40', NULL, NULL),
(21, 1, 'Mostrar usuarios', '', '_self', NULL, NULL, 20, 1, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'users.index', NULL),
(22, 1, 'Herramientas', '', '_self', 'fas fa-tools', NULL, NULL, 9, '2019-12-30 23:34:40', '2019-12-30 23:34:40', NULL, NULL),
(23, 1, 'Menu Builder', '', '_self', 'fas fa-list', NULL, 22, 1, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'menus.index', NULL),
(24, 2, 'CROWDFINT Blog', '', '_self', 'fas fa-blog', NULL, NULL, 1, '2019-12-30 23:34:40', '2019-12-30 23:34:40', 'blog', NULL),
(26, 3, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-02 20:40:41', '2020-01-02 20:40:41', 'home', NULL),
(27, 4, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-02 20:43:47', '2020-01-02 20:43:47', 'home', NULL),
(28, 2, 'Mostrar publicaciones\r\n', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-02 20:43:47', '2020-01-02 20:43:47', 'posts.index', NULL),
(29, 5, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-02 21:35:40', '2020-01-02 21:35:40', 'home', NULL),
(30, 5, 'Mostrar publicaciones\r\n', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-02 21:35:40', '2020-01-02 21:35:40', 'posts.index', NULL),
(32, 6, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-07 17:37:24', '2020-01-07 17:37:24', 'home', NULL),
(33, 3, 'Proyectos', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-07 17:37:24', '2020-01-07 17:37:24', 'post.list', NULL),
(34, 7, '', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-11 02:51:15', '2020-01-11 02:51:15', 'home', NULL),
(35, 7, 'Proyectos', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-11 02:51:15', '2020-01-11 02:51:15', 'post.list', NULL),
(36, 8, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-11 03:14:03', '2020-01-11 03:14:03', 'home', NULL),
(37, 8, 'Proyectos', 'posts.list', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-11 03:14:03', '2020-01-11 03:14:03', 'posts.list', NULL),
(38, 9, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-11 11:28:16', '2020-01-11 11:28:16', 'home', NULL),
(39, 9, 'Mostrar Publicaciones', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-11 11:28:16', '2020-01-11 11:28:16', 'posts.list', NULL),
(40, 10, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-11 11:40:03', '2020-01-11 11:40:03', 'home', NULL),
(41, 10, 'Mostrar Publicaciones', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-11 11:40:03', '2020-01-11 11:40:03', 'posts.index', NULL),
(42, 11, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-11 14:12:14', '2020-01-11 14:12:14', 'home', NULL),
(43, 11, 'Mostrar Publicaciones', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-11 14:12:14', '2020-01-11 14:12:14', 'posts.index', NULL),
(44, 12, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-13 14:48:49', '2020-01-13 14:48:49', 'home', NULL),
(45, 12, 'Mostrar Publicaciones', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-13 14:48:49', '2020-01-13 14:48:49', 'posts.index', NULL),
(46, 13, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-13 15:47:28', '2020-01-13 15:47:28', 'home', NULL),
(47, 13, 'Mostrar Publicaciones', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-13 15:47:28', '2020-01-13 15:47:28', 'posts.index', NULL),
(48, 14, 'Tablero', '', '_self', 'fas fa-tachometer-alt', NULL, NULL, 1, '2020-01-13 15:48:59', '2020-01-13 15:48:59', 'home', NULL),
(49, 14, 'Mostrar Publicaciones', '', '_self', 'fas fa-newspaper', NULL, NULL, 2, '2020-01-13 15:48:59', '2020-01-13 15:48:59', 'posts.index', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_05_19_173453_create_menu_table', 1),
(4, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(5, '2019_02_19_213423_create_permission_tables', 1),
(6, '2019_02_20_132220_add_username_to_users_table', 1),
(7, '2019_02_22_170347_create_posts_table', 1),
(8, '2019_02_22_171836_create_tags_table', 1),
(9, '2019_02_22_171934_create_categories_table', 1),
(10, '2019_02_22_172136_create_category_posts_table', 1),
(11, '2019_02_22_172239_create_post_tags_table', 1),
(12, '2019_03_13_154946_add_description_to_roles_table', 1),
(13, '2019_03_14_150226_add_description_to_permissions_table', 1),
(14, '2019_04_03_102517_add_protected_to_permissions_table', 1),
(15, '2019_04_22_115322_add_protected_to_roles_table', 1),
(16, '2019_04_24_144750_create_permission_groups', 1),
(17, '2019_07_15_080318_add_group_id_to_permissions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(22, 'App\\User', 6),
(37, 'App\\User', 5),
(38, 'App\\User', 5),
(39, 'App\\User', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 1),
(3, 'App\\User', 2),
(3, 'App\\User', 3),
(3, 'App\\User', 4),
(3, 'App\\User', 5),
(3, 'App\\User', 6),
(3, 'App\\User', 7),
(3, 'App\\User', 8),
(3, 'App\\User', 9),
(3, 'App\\User', 10),
(3, 'App\\User', 11),
(3, 'App\\User', 12),
(3, 'App\\User', 13),
(3, 'App\\User', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origenfondos`
--

DROP TABLE IF EXISTS `origenfondos`;
CREATE TABLE IF NOT EXISTS `origenfondos` (
  `id_origen_fondos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_origen_fondos`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `origenfondos`
--

INSERT INTO `origenfondos` (`id_origen_fondos`, `nombre`, `descripcion`) VALUES
(1, 'Transferencia Bancaria', ''),
(2, 'Deposito con tarjeta credito o debito', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `iso`, `nombre`) VALUES
(1, 'AF', 'Afganistán'),
(2, 'AX', 'Islas Gland'),
(3, 'AL', 'Albania'),
(4, 'DE', 'Alemania'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antártida'),
(9, 'AG', 'Antigua y Barbuda'),
(10, 'AN', 'Antillas Holandesas'),
(11, 'SA', 'Arabia Saudí'),
(12, 'DZ', 'Argelia'),
(13, 'AR', 'Argentina'),
(14, 'AM', 'Armenia'),
(15, 'AW', 'Aruba'),
(16, 'AU', 'Australia'),
(17, 'AT', 'Austria'),
(18, 'AZ', 'Azerbaiyán'),
(19, 'BS', 'Bahamas'),
(20, 'BH', 'Bahréin'),
(21, 'BD', 'Bangladesh'),
(22, 'BB', 'Barbados'),
(23, 'BY', 'Bielorrusia'),
(24, 'BE', 'Bélgica'),
(25, 'BZ', 'Belice'),
(26, 'BJ', 'Benin'),
(27, 'BM', 'Bermudas'),
(28, 'BT', 'Bhután'),
(29, 'BO', 'Bolivia'),
(30, 'BA', 'Bosnia y Herzegovina'),
(31, 'BW', 'Botsuana'),
(32, 'BV', 'Isla Bouvet'),
(33, 'BR', 'Brasil'),
(34, 'BN', 'Brunéi'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'CV', 'Cabo Verde'),
(39, 'KY', 'Islas Caimán'),
(40, 'KH', 'Camboya'),
(41, 'CM', 'Camerún'),
(42, 'CA', 'Canadá'),
(43, 'CF', 'República Centroafricana'),
(44, 'TD', 'Chad'),
(45, 'CZ', 'República Checa'),
(46, 'CL', 'Chile'),
(47, 'CN', 'China'),
(48, 'CY', 'Chipre'),
(49, 'CX', 'Isla de Navidad'),
(50, 'VA', 'Ciudad del Vaticano'),
(51, 'CC', 'Islas Cocos'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoras'),
(54, 'CD', 'República Democrática del Congo'),
(55, 'CG', 'Congo'),
(56, 'CK', 'Islas Cook'),
(57, 'KP', 'Corea del Norte'),
(58, 'KR', 'Corea del Sur'),
(59, 'CI', 'Costa de Marfil'),
(60, 'CR', 'Costa Rica'),
(61, 'HR', 'Croacia'),
(62, 'CU', 'Cuba'),
(63, 'DK', 'Dinamarca'),
(64, 'DM', 'Dominica'),
(65, 'DO', 'República Dominicana'),
(66, 'EC', 'Ecuador'),
(67, 'EG', 'Egipto'),
(68, 'SV', 'El Salvador'),
(69, 'AE', 'Emiratos Árabes Unidos'),
(70, 'ER', 'Eritrea'),
(71, 'SK', 'Eslovaquia'),
(72, 'SI', 'Eslovenia'),
(73, 'ES', 'España'),
(74, 'UM', 'Islas ultramarinas de Estados Unidos'),
(75, 'US', 'Estados Unidos'),
(76, 'EE', 'Estonia'),
(77, 'ET', 'Etiopía'),
(78, 'FO', 'Islas Feroe'),
(79, 'PH', 'Filipinas'),
(80, 'FI', 'Finlandia'),
(81, 'FJ', 'Fiyi'),
(82, 'FR', 'Francia'),
(83, 'GA', 'Gabón'),
(84, 'GM', 'Gambia'),
(85, 'GE', 'Georgia'),
(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur'),
(87, 'GH', 'Ghana'),
(88, 'GI', 'Gibraltar'),
(89, 'GD', 'Granada'),
(90, 'GR', 'Grecia'),
(91, 'GL', 'Groenlandia'),
(92, 'GP', 'Guadalupe'),
(93, 'GU', 'Guam'),
(94, 'GT', 'Guatemala'),
(95, 'GF', 'Guayana Francesa'),
(96, 'GN', 'Guinea'),
(97, 'GQ', 'Guinea Ecuatorial'),
(98, 'GW', 'Guinea-Bissau'),
(99, 'GY', 'Guyana'),
(100, 'HT', 'Haití'),
(101, 'HM', 'Islas Heard y McDonald'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong'),
(104, 'HU', 'Hungría'),
(105, 'IN', 'India'),
(106, 'ID', 'Indonesia'),
(107, 'IR', 'Irán'),
(108, 'IQ', 'Iraq'),
(109, 'IE', 'Irlanda'),
(110, 'IS', 'Islandia'),
(111, 'IL', 'Israel'),
(112, 'IT', 'Italia'),
(113, 'JM', 'Jamaica'),
(114, 'JP', 'Japón'),
(115, 'JO', 'Jordania'),
(116, 'KZ', 'Kazajstán'),
(117, 'KE', 'Kenia'),
(118, 'KG', 'Kirguistán'),
(119, 'KI', 'Kiribati'),
(120, 'KW', 'Kuwait'),
(121, 'LA', 'Laos'),
(122, 'LS', 'Lesotho'),
(123, 'LV', 'Letonia'),
(124, 'LB', 'Líbano'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libia'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lituania'),
(129, 'LU', 'Luxemburgo'),
(130, 'MO', 'Macao'),
(131, 'MK', 'ARY Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MY', 'Malasia'),
(134, 'MW', 'Malawi'),
(135, 'MV', 'Maldivas'),
(136, 'ML', 'Malí'),
(137, 'MT', 'Malta'),
(138, 'FK', 'Islas Malvinas'),
(139, 'MP', 'Islas Marianas del Norte'),
(140, 'MA', 'Marruecos'),
(141, 'MH', 'Islas Marshall'),
(142, 'MQ', 'Martinica'),
(143, 'MU', 'Mauricio'),
(144, 'MR', 'Mauritania'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'México'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldavia'),
(149, 'MC', 'Mónaco'),
(150, 'MN', 'Mongolia'),
(151, 'MS', 'Montserrat'),
(152, 'MZ', 'Mozambique'),
(153, 'MM', 'Myanmar'),
(154, 'NA', 'Namibia'),
(155, 'NR', 'Nauru'),
(156, 'NP', 'Nepal'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Níger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Isla Norfolk'),
(162, 'NO', 'Noruega'),
(163, 'NC', 'Nueva Caledonia'),
(164, 'NZ', 'Nueva Zelanda'),
(165, 'OM', 'Omán'),
(166, 'NL', 'Países Bajos'),
(167, 'PK', 'Pakistán'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestina'),
(170, 'PA', 'Panamá'),
(171, 'PG', 'Papúa Nueva Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Perú'),
(174, 'PN', 'Islas Pitcairn'),
(175, 'PF', 'Polinesia Francesa'),
(176, 'PL', 'Polonia'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'GB', 'Reino Unido'),
(181, 'RE', 'Reunión'),
(182, 'RW', 'Ruanda'),
(183, 'RO', 'Rumania'),
(184, 'RU', 'Rusia'),
(185, 'EH', 'Sahara Occidental'),
(186, 'SB', 'Islas Salomón'),
(187, 'WS', 'Samoa'),
(188, 'AS', 'Samoa Americana'),
(189, 'KN', 'San Cristóbal y Nevis'),
(190, 'SM', 'San Marino'),
(191, 'PM', 'San Pedro y Miquelón'),
(192, 'VC', 'San Vicente y las Granadinas'),
(193, 'SH', 'Santa Helena'),
(194, 'LC', 'Santa Lucía'),
(195, 'ST', 'Santo Tomé y Príncipe'),
(196, 'SN', 'Senegal'),
(197, 'CS', 'Serbia y Montenegro'),
(198, 'SC', 'Seychelles'),
(199, 'SL', 'Sierra Leona'),
(200, 'SG', 'Singapur'),
(201, 'SY', 'Siria'),
(202, 'SO', 'Somalia'),
(203, 'LK', 'Sri Lanka'),
(204, 'SZ', 'Suazilandia'),
(205, 'ZA', 'Sudáfrica'),
(206, 'SD', 'Sudán'),
(207, 'SE', 'Suecia'),
(208, 'CH', 'Suiza'),
(209, 'SR', 'Surinam'),
(210, 'SJ', 'Svalbard y Jan Mayen'),
(211, 'TH', 'Tailandia'),
(212, 'TW', 'Taiwán'),
(213, 'TZ', 'Tanzania'),
(214, 'TJ', 'Tayikistán'),
(215, 'IO', 'Territorio Británico del Océano Índico'),
(216, 'TF', 'Territorios Australes Franceses'),
(217, 'TL', 'Timor Oriental'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad y Tobago'),
(222, 'TN', 'Túnez'),
(223, 'TC', 'Islas Turcas y Caicos'),
(224, 'TM', 'Turkmenistán'),
(225, 'TR', 'Turquía'),
(226, 'TV', 'Tuvalu'),
(227, 'UA', 'Ucrania'),
(228, 'UG', 'Uganda'),
(229, 'UY', 'Uruguay'),
(230, 'UZ', 'Uzbekistán'),
(231, 'VU', 'Vanuatu'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Islas Vírgenes Británicas'),
(235, 'VI', 'Islas Vírgenes de los Estados Unidos'),
(236, 'WF', 'Wallis y Futuna'),
(237, 'YE', 'Yemen'),
(238, 'DJ', 'Yibuti'),
(239, 'ZM', 'Zambia'),
(240, 'ZW', 'Zimbabue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protected` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_group_id_foreign` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `group_id`, `name`, `description`, `guard_name`, `protected`, `created_at`, `updated_at`) VALUES
(1, 2, 'dashboard.view', 'Tablero', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(2, 3, 'categories.list', 'Mostrar categorías', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(3, 3, 'categories.create', 'Crear categorías', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(4, 3, 'categories.edit', 'Modificar categorías', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(5, 3, 'categories.destroy', 'Eliminar categorías', 'web', 1, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(6, 4, 'menus.list', 'Mostrar menus', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(7, 4, 'menus.create', 'Crear menus', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(8, 4, 'menus.edit', 'Modificar menus', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(9, 4, 'menus.destroy', 'Eliminar menus', 'web', 1, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(10, 4, 'menus.items.list', 'Mostrar elementos de menus', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(11, 4, 'menus.items.create', 'Crear elementos de menus', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(12, 4, 'menus.items.edit', 'Modificar elementos de menus', 'web', 0, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(13, 4, 'menus.items.destroy', 'Eliminar elementos de menus', 'web', 1, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(14, 5, 'permissions.list', 'Mostrar permisos', 'web', 1, '2019-12-30 23:34:40', '2019-12-30 23:34:41'),
(15, 5, 'permissions.create', 'Crear permisos', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(16, 5, 'permissions.edit', 'Modificar permisos', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(17, 5, 'permissions.destroy', 'Eliminar permisos', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(18, 5, 'permission_groups.list', 'Mostrar grupos de permisos', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(19, 5, 'permission_groups.create', 'Crear grupos de permisos', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(20, 5, 'permission_groups.edit', 'Modificar grupos de permisos', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(21, 5, 'permission_groups.destroy', 'Eliminar grupos de permisos', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(22, 6, 'posts.list', 'Mostrar publicaciones', 'web', 0, '2019-12-30 23:34:41', '2020-01-14 20:08:54'),
(23, 6, 'posts.create', 'Crear publicaciones', 'web', 0, '2019-12-30 23:34:41', '2020-01-14 20:08:54'),
(24, 6, 'posts.edit', 'Modificar publicaciones', 'web', 0, '2019-12-30 23:34:41', '2020-01-14 20:08:54'),
(25, 6, 'posts.destroy', 'Eliminar publicaciones', 'web', 1, '2019-12-30 23:34:41', '2020-01-14 20:08:54'),
(26, 7, 'roles.list', 'Mostrar roles', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(27, 7, 'roles.create', 'Crear roles', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(28, 7, 'roles.edit', 'Modificar roles', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(29, 7, 'roles.destroy', 'Eliminar roles', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(30, 8, 'tags.list', 'Mostrar etiquetas', 'web', 0, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(31, 8, 'tags.create', 'Crear etiquetas', 'web', 0, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(32, 8, 'tags.edit', 'Modificar etiquetas', 'web', 0, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(33, 8, 'tags.destroy', 'Eliminar etiquetas', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(34, 9, 'users.list', 'Mostrar usuarios', 'web', 0, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(35, 9, 'users.edit', 'Modificar usuarios', 'web', 0, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(36, 9, 'users.destroy', 'Eliminar usuarios', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(37, 6, 'posts.payment', 'invertir proyectos', 'web', 0, '2020-01-02 03:00:00', '2020-01-14 20:08:54'),
(38, 6, 'posts.registro_financiero', 'registra datos financieros del usuario', 'web', 0, '2020-01-11 03:00:00', '2020-01-14 20:08:54'),
(39, 6, 'posts.registro_financiero_guardar', 'registro_financiero_guardar', 'web', 0, '2020-01-14 20:07:14', '2020-01-14 20:08:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_groups`
--

DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE IF NOT EXISTS `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Estándar', '2019-12-30 23:34:40', '2020-01-14 20:08:54'),
(2, 'General', '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(3, 'Categorías', '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(4, 'Menús', '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(5, 'Permisos', '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(6, 'Publicaciones', '2019-12-30 23:34:41', '2020-01-14 20:08:54'),
(7, 'Roles', '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(8, 'Etiquetas', '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(9, 'Usuarios', '2019-12-30 23:34:41', '2019-12-30 23:34:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `posted_by` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `porcentaje` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meses` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_posted_by_foreign` (`posted_by`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `title`, `subtitle`, `slug`, `body`, `status`, `posted_by`, `image`, `created_at`, `updated_at`, `porcentaje`, `meses`) VALUES
(1, 'NEXT PAMPA', 'RENTABILIDAD EN DOLARES', 'ALQUILER TEMPORARIO', '<p><em>Proyecto escrito y publicado por Agropecuaria Surmax S.A.</em></p>\r\n\r\n<p>SeSocio en la producci&oacute;n y comercializaci&oacute;n de ganado bovino a corral. Obten&eacute;&nbsp;una rentabilidad anual en d&oacute;lares del 14% fijo, con pago semestral. El capital invertido va a destinarse a la compra de terneros para ser engordados dentro de un corral cerrado y posteriormente lo venderemos el mismo en el mercado interno. El proyecto dura 1 a&ntilde;o, y se pagan los intereses de manera semestral.</p>', 1, 1, 'pampa.jpg', '2020-01-02 23:00:00', '2020-01-02 23:02:16', '20- 30', 36),
(2, 'ALTOS DE AÑELO ', 'RENTABILIDAD EN DOLARES', 'ALQUILER TEMPORARIO', '36 MESES', 0, 1, 'yYkFqmGCG7qv0CBu8gv0ZWKGyB7JTcpRA1Q2ixem.jpeg', NULL, NULL, '22- 32', 24),
(3, 'NEXT BUSTAMANTE', 'RENTABILIDAD EN DOLARES', 'DESARROLLO DEL POZO', '<p><em>Proyecto escrito y publicado por Agropecuaria Surmax S.A.</em></p>\r\n\r\n<p>SeSocio en la producci&oacute;n y comercializaci&oacute;n de ganado bovino a corral. Obten&eacute;&nbsp;una rentabilidad anual en d&oacute;lares del 14% fijo, con pago semestral. El capital invertido va a destinarse a la compra de terneros para ser engordados dentro de un corral cerrado y posteriormente lo venderemos el mismo en el mercado interno. El proyecto dura 1 a&ntilde;o, y se pagan los intereses de manera semestral.</p>', 1, 1, 'bustamante.jpg', '2020-01-02 23:00:00', '2020-01-02 23:02:16', '25- 35', 36),
(9, 'ESTANCCIA VILLA MARIA', 'RENTABILIDAD EN DOLARES', 'ALQUILER TEMPORARIO', '<p><em>Proyecto escrito y publicado por Agropecuaria Surmax S.A.</em></p>\r\n\r\n<p>SeSocio en la producci&oacute;n y comercializaci&oacute;n de ganado bovino a corral. Obten&eacute;&nbsp;una rentabilidad anual en d&oacute;lares del 14% fijo, con pago semestral. El capital invertido va a destinarse a la compra de terneros para ser engordados dentro de un corral cerrado y posteriormente lo venderemos el mismo en el mercado interno. El proyecto dura 1 a&ntilde;o, y se pagan los intereses de manera semestral.</p>', 1, 1, 'estancia.jpg', '2020-01-02 23:00:00', '2020-01-02 23:02:16', '30- 40', 36),
(10, 'ALTOS DE AÑELO III', 'RENTABILIDAD EN DOLARES', 'ALQUILER TEMPORARIO', '36 MESES', 0, 1, 'yYkFqmGCG7qv0CBu8gv0ZWKGyB7JTcpRA1Q2ixem.jpeg', NULL, NULL, '25 - 35', 24),
(11, 'NEXT BUSTAMANTE II', 'RENTABILIDAD EN DOLARES', 'DESARROLLO DEL POZO', '<p><em>Proyecto escrito y publicado por Agropecuaria Surmax S.A.</em></p>\r\n\r\n<p>SeSocio en la producci&oacute;n y comercializaci&oacute;n de ganado bovino a corral. Obten&eacute;&nbsp;una rentabilidad anual en d&oacute;lares del 14% fijo, con pago semestral. El capital invertido va a destinarse a la compra de terneros para ser engordados dentro de un corral cerrado y posteriormente lo venderemos el mismo en el mercado interno. El proyecto dura 1 a&ntilde;o, y se pagan los intereses de manera semestral.</p>', 1, 1, 'bustamante2.jpg', '2020-01-02 23:00:00', '2020-01-02 23:02:16', '25 - 35', 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE IF NOT EXISTS `post_tags` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `post_tags_post_id_index` (`post_id`),
  KEY `post_tags_tag_id_index` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registracion_estados`
--

DROP TABLE IF EXISTS `registracion_estados`;
CREATE TABLE IF NOT EXISTS `registracion_estados` (
  `id_registracion_estados` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_registracion_estados`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `registracion_estados`
--

INSERT INTO `registracion_estados` (`id_registracion_estados`, `nombre_estado`) VALUES
(1, 'usuario inicial completa.'),
(2, 'registracion fincanciera completa.'),
(3, 'registracion financiera incompleta.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_financieros`
--

DROP TABLE IF EXISTS `registro_financieros`;
CREATE TABLE IF NOT EXISTS `registro_financieros` (
  `id_udf` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `id_origen_fondos` int(11) NOT NULL,
  `correo_paypal` varchar(270) NOT NULL,
  `politicamente_expuesta` tinyint(1) DEFAULT NULL,
  `cuenta_bancaria_eeuu` varchar(50) DEFAULT NULL,
  `fecha_registro_financiero` date DEFAULT NULL,
  PRIMARY KEY (`id_udf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protected` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `protected`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'Super administrador', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(2, 'admin', 'Administrador', 'web', 1, '2019-12-30 23:34:41', '2019-12-30 23:34:41'),
(3, 'user', 'Usuario general', 'web', 0, '2019-12-30 23:34:41', '2020-01-11 14:23:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(22, 3),
(37, 3),
(38, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'prueba', 'prueba', '2020-01-02 22:53:22', '2020-01-02 22:53:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

DROP TABLE IF EXISTS `tipo_movimiento`;
CREATE TABLE IF NOT EXISTS `tipo_movimiento` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_movimiento`
--

INSERT INTO `tipo_movimiento` (`id_tipo`, `nombre`, `descripcion`) VALUES
(1, 'Inversion', 'Invierte un monto en un proyecto.'),
(2, 'Transferencia', 'Transfiere dinero'),
(3, 'Deposito', 'tarjeta de crédito o transferencia'),
(4, 'Retiro', 'por PayPal o Cuenta Bancaria'),
(5, 'Interes', 'Trimestral, semestral, anual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `apellidoynombre` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` int(11) DEFAULT NULL,
  `cuil` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `foto_cara` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo_paypal` varchar(280) COLLATE utf8mb4_unicode_ci NOT NULL,
  `politicamente_expuesta` tinyint(1) NOT NULL,
  `cuenta_bancaria_eeuu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origen_fondos` tinyint(1) NOT NULL,
  `id_registracion_estado` int(11) NOT NULL DEFAULT 1,
  `fecha_registro_financiero` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `apellidoynombre`, `documento`, `cuil`, `fecha_nacimiento`, `id_pais`, `foto_cara`, `correo_paypal`, `politicamente_expuesta`, `cuenta_bancaria_eeuu`, `origen_fondos`, `id_registracion_estado`, `fecha_registro_financiero`) VALUES
(1, 'Administrador', 'admin@gmail.com', 'administrator', NULL, '$2y$10$mMYzfC8A98aXecS91ZeAW.GrWtCgCmU/F3iiAquKjL838WRvfoXEq', 'XXKf7ReAPVmczNt8so7MJWTcuyXHZbB23VBOuBb46PUNPTSHUCEVZrk5tc5Q', '2019-12-30 23:34:41', '2019-12-30 23:34:41', '', NULL, NULL, NULL, NULL, '', '', 0, '', 0, 1, '0000-00-00'),
(2, 'Usuario', 'user@gmail.com', 'user', NULL, '$2y$10$mMYzfC8A98aXecS91ZeAW.GrWtCgCmU/F3iiAquKjL838WRvfoXEq', 'Y7NZtlrQo2WDQPGL5Iznlt6sjSs3XMDBknxGhdPp1GruBteUJmse3XMBso6j', '2019-12-30 23:34:41', '2019-12-30 23:34:41', '', NULL, NULL, NULL, NULL, '', '', 0, '', 0, 1, '0000-00-00'),
(3, 'juan', 'juan@gmail.com', 'juan', NULL, '$2y$10$2KbrKeuKbsOWEPqgpc.Wr.w/QrHs7K8SWsoH1Ck5P3QIrCG2/Wauq', NULL, '2020-01-02 20:40:41', '2020-01-02 20:40:41', '', NULL, NULL, NULL, NULL, '', '', 0, '', 0, 1, '0000-00-00'),
(4, 'juani', 'juani@gmail.com', 'juani', NULL, '$2y$10$QRrhf4k9rNwmcdYeSlyGJuKNmIrdtnj/T92Os9SuFF499vXTO2u/G', 'f3NBLSwjFuzE704WTnDUvxFe7iviw42xvWZanlf4JYdWMDyVEfEYIaTJp7eZ', '2020-01-02 20:43:47', '2020-01-02 20:43:47', '', NULL, NULL, NULL, NULL, '', '', 0, '', 0, 1, '0000-00-00'),
(5, 'rolandodel', 'rolandodel@gmail.com', 'rolandodel', NULL, '$2y$10$qGxRSqKryfpcMI4XAgsvGeADIV1H18PajHqGEOyC7jkcyT2gxxAQm', 'vSlCTjAx7IRHkGASuhZ7qYyvnk87q8Rsr0gUJbMXcbtj2UN1oq0DdC5aic9r', '2020-01-02 21:35:40', '2020-01-14 20:08:32', '', NULL, NULL, NULL, NULL, '', '', 0, '', 0, 1, '0000-00-00'),
(6, 'damian', 'damian@gmail.com', 'damian', NULL, '$2y$10$odh795Tw30v64yeKocOtV.6nBDee.K30KdiicmRZdmyDxZwGDzWkW', '3ssFPjqjh4hur3VxxzqNYvCtzvqTUc42prvl5uGPcxSYK5VAGHgIUXUofPm7', '2020-01-07 17:37:23', '2020-01-07 17:37:23', '', NULL, NULL, NULL, NULL, '', '', 0, '', 0, 1, '0000-00-00'),
(7, 'juan carlos', 'juanca@gmail.com', 'juanca', NULL, '$2y$10$.nArt0IUkwyUtoD1.DGfwOgkdv7tLgPyGFOwUrtB.3t1n6VAk2Kzu', 'rEgoRgm8zKwhwV0chDzzJTUkDIQIlhqjv1DgfhM63QQWy4OiIed1oCcogxX8', '2020-01-11 02:51:14', '2020-01-11 02:51:14', '', NULL, NULL, NULL, NULL, NULL, '', 0, '', 0, 1, '0000-00-00'),
(8, 'eduardo gargui', 'eduardo@gmail.com', 'eduardo', NULL, '$2y$10$wGjgRjESWqb4dbzu8DE9M.P83aThfCG62cOX9PZaLXE.zLcfcP6jm', '8Nquz1ZTJWVb5pzK8EfGoyfD9fI6kl7XRfXXEH2oR1uqErgGzNoAaEjczPYK', '2020-01-11 03:14:03', '2020-01-11 03:14:03', '', NULL, NULL, NULL, NULL, NULL, '', 0, '', 0, 1, '0000-00-00'),
(9, 'guillermo', 'guillermo@gmail.com', 'guille', NULL, '$2y$10$iAtMZOQRXmOuV/T.Q/.PRO640Kq2zjxNVGVmcE4SqD/caYHCFTqa.', 'n7xTXqRQ8SQQKjNdnquNDu0NZ2xRkrrWegPPeKPjUjFHbvAJseb6QlPzNWcq', '2020-01-11 11:28:16', '2020-01-11 11:28:16', '', NULL, NULL, NULL, NULL, NULL, '', 0, '', 0, 1, '0000-00-00'),
(10, 'victoria', 'victoria@gmail.com', 'vicky', NULL, '$2y$10$DWYhyNPHJsrk7WwmjcZSQezBGwOqGSC7yu.LoCB1rJuCi.K9uolUu', '4TCZy7BPgK6aaAwHz8jZhKyc3zebUyxW4eCuuIB5Eq9MOLMgYCYecA0m17GB', '2020-01-11 11:40:03', '2020-01-11 11:40:03', '', NULL, NULL, NULL, NULL, NULL, '', 0, '', 0, 1, '0000-00-00'),
(11, 'ivan', 'ivan@gmail.com', 'ivan', NULL, '$2y$10$QeT2hoEoSrSsOvlVTkPWvOe5BSEg6pa77JiX8cXt4hJD8eJ3I2wE.', 'kJQoxnKipmUhWwQVPN8059bc7713d1zPdik3p2o64lcRigZMbEISuYMDVZVM', '2020-01-11 14:12:14', '2020-01-11 14:12:14', '', NULL, NULL, NULL, NULL, NULL, '', 0, '', 0, 1, '0000-00-00'),
(12, 'daniela', 'dani@gmail.com', 'dani', NULL, '$2y$10$HATzXTDFCK9BxACp8lgGbuw.btnSSY4vqUHDSuA8DxicwKakYlrYe', 'nFqXmgMhHYJPTejLVv4LpAqeSlmL4f6BBSpE7eJFRXEXIw6kpp0d2COV1QTn', '2020-01-13 14:48:49', '2020-01-13 14:48:49', '', NULL, NULL, NULL, NULL, NULL, '', 0, '', 0, 1, '0000-00-00'),
(13, 'saddasd', 'aa@a.com', 'sdfsdf', NULL, '$2y$10$uZDtPZe2iXAcJr9cIFVo9.zprlSdcnj5u3aXMMW6kX38paf4xs96.', 'lwKtimX75GUbmqjORqxdm9C8Nww81xdhosKj1BJ7Kaaf7F2dnpAr5VeTFP7q', '2020-01-13 15:47:28', '2020-01-13 15:47:28', '', NULL, NULL, NULL, NULL, NULL, '', 0, '', 0, 1, '0000-00-00'),
(14, 'ljsa', 'jlfsdjf@gmail.com', 'fljsdañl', NULL, '$2y$10$NMaoW0/FyJjv80ZAxVGwWuwPbaERzBU31H6SYuAzniKf2jElmxUAS', '9Z3cffdOGQgnBhSnRctiAxPAVl2e5YP2Trr1ZLeL9JHZPv3UiimziuW3ilXS', '2020-01-13 15:48:59', '2020-01-13 15:48:59', '', NULL, NULL, NULL, NULL, NULL, '', 0, '', 0, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_movimientos`
--

DROP TABLE IF EXISTS `user_movimientos`;
CREATE TABLE IF NOT EXISTS `user_movimientos` (
  `id_movimientos` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_tipo_movimiento` int(11) NOT NULL,
  `fecha_movimiento` date NOT NULL,
  `monto_usd` float DEFAULT NULL,
  `detalle_movimiento` varchar(300) DEFAULT NULL,
  `estado_movimiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_movimientos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_saldos`
--

DROP TABLE IF EXISTS `user_saldos`;
CREATE TABLE IF NOT EXISTS `user_saldos` (
  `id_saldos` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `fecha_ult_saldo` int(11) NOT NULL,
  `saldo_dolar` int(11) NOT NULL,
  PRIMARY KEY (`id_saldos`),
  UNIQUE KEY `id_saldos` (`id_saldos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
