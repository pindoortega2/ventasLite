-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla ventaslite.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.categories: ~4 rows (aproximadamente)
INSERT INTO `categories` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'CURSOS', 'https://dummyimage.com/200x150/5c5756/fff', '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(2, 'TENIS', 'https://dummyimage.com/200x150/5c5756/fff', '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(3, 'CELULARES', 'https://dummyimage.com/200x150/5c5756/fff', '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(4, 'COMPUTADORAS', 'https://dummyimage.com/200x150/5c5756/fff', '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(18, 'Laravel 9', NULL, '2022-11-28 04:54:15', '2022-11-28 04:54:24'),
	(19, 'lavadoras', NULL, '2022-12-24 05:55:28', '2022-12-24 05:55:28');

-- Volcando estructura para tabla ventaslite.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxpayer_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.companies: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ventaslite.denominations
CREATE TABLE IF NOT EXISTS `denominations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('BILLETE','MONEDA','OTRO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BILLETE',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.denominations: ~12 rows (aproximadamente)
INSERT INTO `denominations` (`id`, `type`, `value`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'BILLETE', '1000', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(2, 'BILLETE', '500', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(3, 'BILLETE', '200', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(4, 'BILLETE', '100', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(5, 'BILLETE', '50', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(6, 'BILLETE', '20', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(7, 'MONEDA', '10', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(8, 'MONEDA', '5', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(9, 'MONEDA', '2', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(10, 'MONEDA', '1', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(11, 'MONEDA', '0.5', NULL, '2022-11-20 09:09:35', '2022-11-20 09:09:35'),
	(12, 'OTRO', '0', NULL, '2022-11-20 09:09:35', '2022-11-29 06:38:40');

-- Volcando estructura para tabla ventaslite.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ventaslite.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.migrations: ~0 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_11_19_225536_create_categories_table', 1),
	(6, '2022_11_19_225729_create_denominations_table', 1),
	(7, '2022_11_19_225852_create_companies_table', 1),
	(8, '2022_11_19_230002_create_products_table', 1),
	(9, '2022_11_19_230056_create_sales_table', 1),
	(10, '2022_11_19_230324_create_sale_details_table', 1),
	(11, '2022_12_15_145907_create_permission_tables', 2);

-- Volcando estructura para tabla ventaslite.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.model_has_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ventaslite.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.model_has_roles: ~5 rows (aproximadamente)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(3, 'App\\Models\\User', 1),
	(8, 'App\\Models\\User', 5),
	(3, 'App\\Models\\User', 6),
	(3, 'App\\Models\\User', 7),
	(3, 'App\\Models\\User', 8);

-- Volcando estructura para tabla ventaslite.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ventaslite.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.permissions: ~6 rows (aproximadamente)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Category_index', 'web', '2022-12-16 04:00:23', '2022-12-16 04:00:23'),
	(2, 'Product_index', 'web', '2022-12-16 04:00:57', '2022-12-16 04:00:57'),
	(6, 'Category_Create', 'web', '2023-02-09 03:23:01', '2023-02-09 03:23:01'),
	(7, 'Category_Destroy', 'web', '2023-02-09 03:23:34', '2023-02-09 03:23:34'),
	(8, 'Category_Update', 'web', '2023-02-09 03:24:22', '2023-02-09 03:24:22'),
	(9, 'Category_Search', 'web', '2023-02-09 03:34:43', '2023-02-09 03:53:27');

-- Volcando estructura para tabla ventaslite.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ventaslite.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` int NOT NULL,
  `alerts` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.products: ~6 rows (aproximadamente)
INSERT INTO `products` (`id`, `name`, `barcode`, `cost`, `price`, `stock`, `alerts`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
	(4, 'PC GAMMER 1', '123', 790.00, 40.00, 0, 10, 'pcgamer.png', 4, '2022-11-20 09:09:35', '2022-12-29 06:56:09'),
	(9, 'Laravel 8', '1234', 20.00, 40.00, 2, 12, NULL, 18, '2022-11-29 01:41:23', '2022-12-27 09:15:13'),
	(10, 'LiveWire', '12345', 300.00, 500.00, 198, 20, NULL, 1, '2022-11-29 02:15:58', '2022-12-27 09:15:44'),
	(12, 'iphone 11 nuevo', '123456', 200.00, 300.00, 4, 4, NULL, 3, '2022-11-29 02:48:50', '2022-12-27 05:11:03'),
	(13, 'este es otra prueba', '1234567', 12.00, 34.00, 5, 3, NULL, 3, '2022-11-29 02:51:28', '2022-11-29 02:51:28'),
	(14, 'prueba 2', '12345678', 67.00, 89.00, 8, 7, NULL, 1, '2022-11-29 02:52:49', '2023-02-08 03:13:06'),
	(15, 'Producto 2', '123456789', 67.00, 99.00, 39, 7, NULL, 4, '2022-11-29 02:53:26', '2023-02-08 03:13:06'),
	(16, 'Producto nuevo', '12', 20.00, 30.00, 52, 10, NULL, 3, '2022-12-14 22:53:25', '2022-12-27 08:48:48'),
	(17, 'laravel new api', '123a', 10.00, 20.00, 18, 5, NULL, 1, '2022-12-15 20:07:33', '2023-02-08 03:08:43'),
	(18, 'lavadora 1', '123b', 100.00, 300.00, 92, 10, NULL, 19, '2022-12-24 05:56:00', '2023-02-08 03:08:43');

-- Volcando estructura para tabla ventaslite.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.roles: ~5 rows (aproximadamente)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(3, 'Admin', 'web', '2022-12-15 21:19:01', '2022-12-15 21:19:01'),
	(4, 'Supervisor', 'web', '2022-12-15 21:23:43', '2022-12-15 21:23:43'),
	(5, 'Bodega', 'web', '2022-12-15 21:24:14', '2022-12-15 21:24:14'),
	(6, 'Ventas', 'web', '2022-12-15 21:24:25', '2022-12-15 21:24:25'),
	(7, 'Ejecutivo', 'web', '2022-12-15 21:24:36', '2022-12-15 21:24:36'),
	(8, 'Empleado', 'web', '2022-12-17 00:19:14', '2022-12-17 00:19:14');

-- Volcando estructura para tabla ventaslite.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.role_has_permissions: ~8 rows (aproximadamente)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 3),
	(2, 3),
	(6, 3),
	(7, 3),
	(8, 3),
	(9, 3),
	(2, 6),
	(1, 8);

-- Volcando estructura para tabla ventaslite.sales
CREATE TABLE IF NOT EXISTS `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `items` int NOT NULL,
  `cash` decimal(10,2) NOT NULL,
  `change` decimal(10,2) NOT NULL,
  `status` enum('PAID','PENDING','CANCELLED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PAID',
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_user_id_foreign` (`user_id`),
  CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.sales: ~11 rows (aproximadamente)
INSERT INTO `sales` (`id`, `total`, `items`, `cash`, `change`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 90.00, 3, 90.00, 0.00, 'PAID', 1, '2022-12-15 12:21:26', '2022-12-15 12:21:26'),
	(2, 30.00, 0, 30.00, 0.00, 'PAID', 1, '2022-12-15 19:02:47', '2022-12-15 19:02:47'),
	(3, 60.00, 2, 60.00, 0.00, 'PAID', 1, '2022-12-15 19:04:29', '2022-12-15 19:04:29'),
	(4, 40.00, 0, 40.00, 0.00, 'PAID', 1, '2022-12-24 05:54:09', '2022-12-24 05:54:09'),
	(5, 60.00, 2, 60.00, 0.00, 'PAID', 1, '2022-12-27 08:48:48', '2022-12-27 08:48:48'),
	(6, 40.00, 1, 40.00, 0.00, 'PAID', 1, '2022-12-27 09:15:13', '2022-12-27 09:15:13'),
	(7, 1000.00, 2, 1000.00, 0.00, 'PAID', 1, '2022-12-27 09:15:44', '2022-12-27 09:15:44'),
	(8, 600.00, 2, 600.00, 0.00, 'PAID', 1, '2022-12-27 09:33:25', '2022-12-27 09:33:25'),
	(9, 20.00, 1, 20.00, 0.00, 'PAID', 1, '2022-12-27 04:36:21', '2022-12-27 04:36:21'),
	(10, 120.00, 3, 120.00, 0.00, 'PAID', 1, '2022-12-27 04:39:41', '2022-12-27 04:39:41'),
	(11, 900.00, 3, 900.00, 0.00, 'PAID', 1, '2022-12-27 04:40:00', '2022-12-27 04:40:00'),
	(12, 900.00, 3, 1000.00, 100.00, 'PAID', 1, '2022-12-27 04:40:19', '2022-12-27 04:40:19'),
	(13, 1200.00, 4, 1200.00, 0.00, 'PAID', 5, '2022-12-27 05:11:03', '2022-12-27 05:11:03'),
	(14, 40.00, 0, 40.00, 0.00, 'PAID', 1, '2022-12-29 06:56:09', '2022-12-29 06:56:09'),
	(15, 620.00, 3, 620.00, 0.00, 'PAID', 1, '2023-02-08 03:08:43', '2023-02-08 03:08:43'),
	(16, 188.00, 0, 188.00, 0.00, 'PAID', 1, '2023-02-08 03:13:06', '2023-02-08 03:13:06');

-- Volcando estructura para tabla ventaslite.sale_details
CREATE TABLE IF NOT EXISTS `sale_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `sale_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_details_product_id_foreign` (`product_id`),
  KEY `sale_details_sale_id_foreign` (`sale_id`),
  CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.sale_details: ~19 rows (aproximadamente)
INSERT INTO `sale_details` (`id`, `price`, `quantity`, `product_id`, `sale_id`, `created_at`, `updated_at`) VALUES
	(1, 30.00, 3.00, 16, 1, '2022-12-15 12:21:26', '2022-12-15 12:21:26'),
	(2, 30.00, 1.00, 16, 2, '2022-12-15 19:02:47', '2022-12-15 19:02:47'),
	(3, 30.00, 2.00, 16, 3, '2022-12-15 19:04:29', '2022-12-15 19:04:29'),
	(4, 40.00, 1.00, 4, 4, '2022-12-24 05:54:09', '2022-12-24 05:54:09'),
	(5, 30.00, 2.00, 16, 5, '2022-12-27 08:48:48', '2022-12-27 08:48:48'),
	(6, 40.00, 1.00, 9, 6, '2022-12-27 09:15:13', '2022-12-27 09:15:13'),
	(7, 500.00, 2.00, 10, 7, '2022-12-27 09:15:44', '2022-12-27 09:15:44'),
	(8, 300.00, 2.00, 12, 8, '2022-12-27 09:33:25', '2022-12-27 09:33:25'),
	(9, 20.00, 1.00, 17, 9, '2022-12-27 04:36:21', '2022-12-27 04:36:21'),
	(10, 40.00, 3.00, 4, 10, '2022-12-27 04:39:41', '2022-12-27 04:39:41'),
	(11, 300.00, 3.00, 12, 11, '2022-12-27 04:40:00', '2022-12-27 04:40:00'),
	(12, 300.00, 3.00, 18, 12, '2022-12-27 04:40:19', '2022-12-27 04:40:19'),
	(13, 300.00, 1.00, 12, 13, '2022-12-27 05:11:03', '2022-12-27 05:11:03'),
	(14, 300.00, 3.00, 18, 13, '2022-12-27 05:11:03', '2022-12-27 05:11:03'),
	(15, 40.00, 1.00, 4, 14, '2022-12-29 06:56:09', '2022-12-29 06:56:09'),
	(16, 20.00, 1.00, 17, 15, '2023-02-08 03:08:43', '2023-02-08 03:08:43'),
	(17, 300.00, 2.00, 18, 15, '2023-02-08 03:08:43', '2023-02-08 03:08:43'),
	(18, 89.00, 1.00, 14, 16, '2023-02-08 03:13:06', '2023-02-08 03:13:06'),
	(19, 99.00, 1.00, 15, 16, '2023-02-08 03:13:06', '2023-02-08 03:13:06');

-- Volcando estructura para tabla ventaslite.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Locked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla ventaslite.users: ~4 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `phone`, `email`, `profile`, `status`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Andres Ortega', '3511159550', 'andres@gmail.com', 'Admin', 'Active', NULL, '$2y$10$fvHmGXiYemk/NQinRsjOWuYZAozvdi6Br6zI9Upee6CS/ee4u3ypy', NULL, NULL, '2022-11-20 09:09:35', '2023-02-09 03:52:28'),
	(5, 'Mario', '1234567890', 'mario@gmail.com', 'Empleado', 'Active', NULL, '$2y$10$fXlyMge9MjjL7HL7gqdOb.QjN4YLkro3P1PeeYict7A5e1n3aegi6', NULL, NULL, '2022-12-17 00:01:43', '2023-02-09 04:41:09'),
	(6, 'Fernando', '0987654321', 'fernando@gmail.com', 'Admin', 'Active', NULL, '$2y$10$mib8y60N0DOvPLkCMPxFM.J/guAzi0T89gfTBMirkh2cOXfn9hdvu', NULL, NULL, '2022-12-17 00:02:40', '2022-12-17 01:56:44'),
	(7, 'Luis', '0987890909', 'luis@gmail.com', 'Empleado', 'Active', NULL, '$2y$10$G8gyqbDGUttWLmdozyeLJ.WrJHp6Iq1WWkqCyl02./xFgBc6DQ.WW', NULL, NULL, '2022-12-17 00:15:24', '2023-02-09 04:22:44'),
	(8, 'Milena', '809766543', 'milena@gmail.com', 'Empleado', 'Active', NULL, '$2y$10$nHjXhtluD0Ci1BPej9J8vOelW6eV45Q6N3jQena8Udr.MUXP7Iq2C', NULL, NULL, '2022-12-17 00:19:59', '2022-12-17 00:26:13');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
