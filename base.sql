-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.24 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица personal.cabinet
DROP TABLE IF EXISTS `cabinet`;
CREATE TABLE IF NOT EXISTS `cabinet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `finish_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cabinet_users` (`user_id`),
  CONSTRAINT `FK_cabinet_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы personal.cabinet: ~2 rows (приблизительно)
INSERT INTO `cabinet` (`id`, `user_id`, `finish_at`) VALUES
	(1, 4, '2022-08-18 11:41:39'),
	(3, 10, '2022-08-18 11:43:22');

-- Дамп структуры для таблица personal.cms_apicustom
DROP TABLE IF EXISTS `cms_apicustom`;
CREATE TABLE IF NOT EXISTS `cms_apicustom` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permalink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `responses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_apicustom: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.cms_apikey
DROP TABLE IF EXISTS `cms_apikey`;
CREATE TABLE IF NOT EXISTS `cms_apikey` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `screetkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int DEFAULT NULL,
  `status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_apikey: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.cms_dashboard
DROP TABLE IF EXISTS `cms_dashboard`;
CREATE TABLE IF NOT EXISTS `cms_dashboard` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_dashboard: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.cms_email_queues
DROP TABLE IF EXISTS `cms_email_queues`;
CREATE TABLE IF NOT EXISTS `cms_email_queues` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_email_queues: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.cms_email_templates
DROP TABLE IF EXISTS `cms_email_templates`;
CREATE TABLE IF NOT EXISTS `cms_email_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_email_templates: ~0 rows (приблизительно)
INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
	(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2022-08-08 05:51:00', NULL);

-- Дамп структуры для таблица personal.cms_logs
DROP TABLE IF EXISTS `cms_logs`;
CREATE TABLE IF NOT EXISTS `cms_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_cms_users` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_logs: ~26 rows (приблизительно)
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
	(1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/manager/users/edit-save/10', 'Update data demo at Users Management', '<table class="table table-striped"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>id_chat</td><td></td><td></td></tr><tr><td>status</td><td>0</td><td></td></tr><tr><td>username</td><td></td><td></td></tr><tr><td>first_name</td><td></td><td></td></tr><tr><td>t_date</td><td>2022-07-07 11:57:29</td><td></td></tr><tr><td>t_password</td><td>$2y$10$dTurkvN1gdQTnW1v1X1DreV8EcPCs/hw5eedJs1TKer637ptaZtxO</td><td></td></tr><tr><td>user_hash</td><td></td><td></td></tr><tr><td>image</td><td></td><td></td></tr><tr><td>role_id</td><td>100</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>password</td><td>$2y$10$n5ybq0tc9HHzl5RpzfuNXenW9G5mILu9sGD1l3vlJX8BPSYvQUVne</td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr><tr><td>two_factor_secret</td><td></td><td></td></tr><tr><td>two_factor_recovery_codes</td><td></td><td></td></tr><tr><td>two_factor_confirmed_at</td><td></td><td></td></tr><tr><td>current_team_id</td><td></td><td></td></tr><tr><td>profile_photo_path</td><td></td><td></td></tr><tr><td>id_cms_privileges</td><td>1</td><td>2</td></tr><tr><td>photo</td><td></td><td>uploads/10/2022-08/user_02.jpg</td></tr></tbody></table>', 10, '2022-08-15 08:36:31', NULL),
	(2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/manager/users/edit-save/4', 'Update data dev at Users Management', '<table class="table table-striped"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>id_chat</td><td></td><td></td></tr><tr><td>status</td><td>99</td><td></td></tr><tr><td>username</td><td></td><td></td></tr><tr><td>first_name</td><td></td><td></td></tr><tr><td>t_date</td><td>2022-07-26 12:29:06</td><td></td></tr><tr><td>user_hash</td><td></td><td></td></tr><tr><td>image</td><td></td><td></td></tr><tr><td>role_id</td><td>0</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>password</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr><tr><td>two_factor_secret</td><td></td><td></td></tr><tr><td>two_factor_recovery_codes</td><td></td><td></td></tr><tr><td>two_factor_confirmed_at</td><td></td><td></td></tr><tr><td>current_team_id</td><td></td><td></td></tr><tr><td>profile_photo_path</td><td></td><td></td></tr><tr><td>id_cms_privileges</td><td>1</td><td>3</td></tr><tr><td>photo</td><td></td><td>uploads/10/2022-08/user_7.jpg</td></tr></tbody></table>', 10, '2022-08-15 08:36:48', NULL),
	(3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/manager/users/delete/11', 'Delete data R898 at Users Management', '', 10, '2022-08-15 08:37:03', NULL),
	(4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/manager/menu_management/add-save', 'Add New Data Личные кабинеты at Menu Management', '', 10, '2022-08-15 08:59:15', NULL),
	(5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/manager/menu_management/delete/4', 'Delete data Личные кабинеты at Menu Management', '', 10, '2022-08-15 09:01:30', NULL),
	(6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/manager/users/edit-save/1', 'Update data admin at Users Management', '<table class="table table-striped"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>id_chat</td><td></td><td></td></tr><tr><td>status</td><td>100</td><td></td></tr><tr><td>username</td><td></td><td></td></tr><tr><td>first_name</td><td></td><td></td></tr><tr><td>t_date</td><td>2022-07-26 12:28:56</td><td></td></tr><tr><td>t_password</td><td>$2y$10$cWRNIky5ZJJ7AsqYbLqiX.eGurbg61M7v9ED2RUgOj20ISBH11SoG</td><td></td></tr><tr><td>user_hash</td><td></td><td></td></tr><tr><td>image</td><td></td><td></td></tr><tr><td>role_id</td><td>0</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>password</td><td>$2y$10$n5ybq0tc9HHzl5RpzfuNXenW9G5mILu9sGD1l3vlJX8BPSYvQUVne</td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr><tr><td>two_factor_secret</td><td></td><td></td></tr><tr><td>two_factor_recovery_codes</td><td></td><td></td></tr><tr><td>two_factor_confirmed_at</td><td></td><td></td></tr><tr><td>current_team_id</td><td></td><td></td></tr><tr><td>profile_photo_path</td><td></td><td></td></tr><tr><td>photo</td><td></td><td>uploads/10/2022-08/user8.jpg</td></tr><tr><td>phone</td><td></td><td></td></tr></tbody></table>', 10, '2022-08-15 09:34:52', NULL),
	(7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-15 11:39:51', NULL),
	(8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-15 11:39:51', NULL),
	(9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-15 11:42:01', NULL),
	(10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-15 11:42:01', NULL),
	(11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-16 03:32:01', NULL),
	(12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-16 03:32:01', NULL),
	(13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-16 04:00:51', NULL),
	(14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-16 04:00:51', NULL),
	(15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-16 04:02:39', NULL),
	(16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-16 04:02:39', NULL),
	(17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-17 05:22:13', NULL),
	(18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-17 05:22:13', NULL),
	(19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'https://todo.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-17 05:24:39', NULL),
	(20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'https://todo.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-17 05:24:39', NULL),
	(21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-17 06:40:59', NULL),
	(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-17 06:40:59', NULL),
	(23, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-17 08:02:05', NULL),
	(24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-17 08:02:05', NULL),
	(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0', 'http://personal.local/admin/usersAdmin', 'Try view the data :name at Личные кабинеты', '', 10, '2022-08-17 08:05:32', NULL),
	(26, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0', 'http://personal.local/admin/usersAdmin', 'Try view the data :name at Личные кабинеты', '', 10, '2022-08-17 08:05:38', NULL),
	(27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 03:03:57', NULL),
	(28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 03:03:57', NULL),
	(29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 05:56:08', NULL),
	(30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 05:56:08', NULL),
	(31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 05:56:16', NULL),
	(32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 05:56:16', NULL),
	(33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-18 05:56:21', NULL),
	(34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'wmstr2007@yandex.ru login with IP Address 127.0.0.1', '', 10, '2022-08-18 05:56:21', NULL),
	(35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 05:56:35', NULL),
	(36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 05:56:35', NULL),
	(37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 05:56:54', NULL),
	(38, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru login with IP Address 127.0.0.1', '', 1, '2022-08-18 05:56:54', NULL),
	(39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 06:49:38', NULL),
	(40, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 06:49:38', NULL),
	(41, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 06:49:49', NULL),
	(42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 06:49:49', NULL),
	(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 06:57:55', NULL),
	(44, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 06:57:55', NULL),
	(45, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 07:09:52', NULL),
	(46, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 07:09:52', NULL),
	(47, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 07:13:52', NULL),
	(48, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 07:13:52', NULL),
	(49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 07:14:45', NULL),
	(50, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-18 07:14:45', NULL),
	(51, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-19 04:09:37', NULL),
	(52, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/login', 'admin@b2bot.ru логин по IP 127.0.0.1', '', 1, '2022-08-19 04:09:37', NULL),
	(53, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://personal.local/cabinets/edit/3', 'Обновите Сидоров Сидр Сидорович в Личные кабинеты', '<table class="table table-striped"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>id_chat</td><td></td><td></td></tr><tr><td>status</td><td>0</td><td></td></tr><tr><td>username</td><td></td><td></td></tr><tr><td>first_name</td><td></td><td></td></tr><tr><td>t_date</td><td>2022-07-07 11:57:29</td><td></td></tr><tr><td>t_login</td><td>demo</td><td></td></tr><tr><td>t_password</td><td>$2y$10$dTurkvN1gdQTnW1v1X1DreV8EcPCs/hw5eedJs1TKer637ptaZtxO</td><td></td></tr><tr><td>user_hash</td><td></td><td></td></tr><tr><td>image</td><td></td><td></td></tr><tr><td>role_id</td><td>100</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>password</td><td>$2y$10$n5ybq0tc9HHzl5RpzfuNXenW9G5mILu9sGD1l3vlJX8BPSYvQUVne</td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr><tr><td>two_factor_secret</td><td></td><td></td></tr><tr><td>two_factor_recovery_codes</td><td></td><td></td></tr><tr><td>two_factor_confirmed_at</td><td></td><td></td></tr><tr><td>current_team_id</td><td></td><td></td></tr><tr><td>profile_photo_path</td><td></td><td></td></tr><tr><td>photo</td><td>uploads/10/2022-08/user_02.jpg</td><td></td></tr><tr><td>phone</td><td>72613246324</td><td></td></tr></tbody></table>', 1, '2022-08-19 04:10:04', NULL);

-- Дамп структуры для таблица personal.cms_menus
DROP TABLE IF EXISTS `cms_menus`;
CREATE TABLE IF NOT EXISTS `cms_menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int DEFAULT NULL,
  `sorting` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_menus: ~2 rows (приблизительно)
INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
	(6, 'Личные кабинеты', 'Route', 'AdminUsersAdminControllerGetIndex', NULL, 'fa fa-user', 0, 1, 0, 1, 2, '2022-08-15 09:20:54', NULL);

-- Дамп структуры для таблица personal.cms_menus_privileges
DROP TABLE IF EXISTS `cms_menus_privileges`;
CREATE TABLE IF NOT EXISTS `cms_menus_privileges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_menus` int DEFAULT NULL,
  `id_cms_privileges` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_menus_privileges: ~1 rows (приблизительно)
INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
	(1, 6, 1);

-- Дамп структуры для таблица personal.cms_moduls
DROP TABLE IF EXISTS `cms_moduls`;
CREATE TABLE IF NOT EXISTS `cms_moduls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_moduls: ~12 rows (приблизительно)
INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2022-08-08 05:51:00', NULL, NULL),
	(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2022-08-08 05:51:00', NULL, NULL),
	(15, 'Личные кабинеты', 'fa fa-glass', 'cabinets', 'users', 'AdminUsersAdminController', 0, 0, '2022-08-15 09:20:54', NULL, NULL);

-- Дамп структуры для таблица personal.cms_notifications
DROP TABLE IF EXISTS `cms_notifications`;
CREATE TABLE IF NOT EXISTS `cms_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_users` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_notifications: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.cms_privileges
DROP TABLE IF EXISTS `cms_privileges`;
CREATE TABLE IF NOT EXISTS `cms_privileges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_privileges: ~4 rows (приблизительно)
INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
	(1, 'Super Administrator', 0, 'skin-red', '2022-08-08 05:51:00', NULL),
	(2, 'User', 0, 'skin-blue', NULL, NULL),
	(3, 'Administrator', 0, 'skin-blue', NULL, NULL),
	(4, 'Root', 1, 'skin-blue-light', NULL, NULL);

-- Дамп структуры для таблица personal.cms_privileges_roles
DROP TABLE IF EXISTS `cms_privileges_roles`;
CREATE TABLE IF NOT EXISTS `cms_privileges_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int DEFAULT NULL,
  `id_cms_moduls` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_privileges_roles: ~16 rows (приблизительно)
INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
	(1, 1, 0, 0, 0, 0, 1, 1, '2022-08-08 05:51:00', NULL),
	(2, 1, 1, 1, 1, 1, 1, 2, '2022-08-08 05:51:00', NULL),
	(3, 0, 1, 1, 1, 1, 1, 3, '2022-08-08 05:51:00', NULL),
	(4, 1, 1, 1, 1, 1, 1, 4, '2022-08-08 05:51:00', NULL),
	(5, 1, 1, 1, 1, 1, 1, 5, '2022-08-08 05:51:00', NULL),
	(6, 1, 1, 1, 1, 1, 1, 6, '2022-08-08 05:51:00', NULL),
	(7, 1, 1, 1, 1, 1, 1, 7, '2022-08-08 05:51:00', NULL),
	(8, 1, 1, 1, 1, 1, 1, 8, '2022-08-08 05:51:00', NULL),
	(9, 1, 1, 1, 1, 1, 1, 9, '2022-08-08 05:51:00', NULL),
	(10, 1, 1, 1, 1, 1, 1, 10, '2022-08-08 05:51:00', NULL),
	(11, 1, 0, 1, 0, 1, 1, 11, '2022-08-08 05:51:00', NULL),
	(12, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
	(13, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
	(14, 1, 1, 1, 1, 1, 4, 4, NULL, NULL),
	(15, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
	(16, 1, 1, 1, 1, 1, 1, 15, NULL, NULL);

-- Дамп структуры для таблица personal.cms_settings
DROP TABLE IF EXISTS `cms_settings`;
CREATE TABLE IF NOT EXISTS `cms_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_input_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_settings: ~16 rows (приблизительно)
INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
	(1, 'login_background_color', NULL, 'text', NULL, 'Input hexacode', '2022-08-08 05:51:00', NULL, 'Login Register Style', 'Login Background Color'),
	(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2022-08-08 05:51:00', NULL, 'Login Register Style', 'Login Font Color'),
	(3, 'login_background_image', NULL, 'upload_image', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Login Register Style', 'Login Background Image'),
	(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Email Setting', 'Email Sender'),
	(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2022-08-08 05:51:00', NULL, 'Email Setting', 'Mail Driver'),
	(6, 'smtp_host', '', 'text', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Email Setting', 'SMTP Host'),
	(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2022-08-08 05:51:00', NULL, 'Email Setting', 'SMTP Port'),
	(8, 'smtp_username', '', 'text', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Email Setting', 'SMTP Username'),
	(9, 'smtp_password', '', 'text', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Email Setting', 'SMTP Password'),
	(10, 'appname', 'CRUDBooster', 'text', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Application Setting', 'Application Name'),
	(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2022-08-08 05:51:00', NULL, 'Application Setting', 'Default Paper Print Size'),
	(12, 'logo', '', 'upload_image', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Application Setting', 'Logo'),
	(13, 'favicon', '', 'upload_image', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Application Setting', 'Favicon'),
	(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2022-08-08 05:51:00', NULL, 'Application Setting', 'API Debug Mode'),
	(15, 'google_api_key', '', 'text', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Application Setting', 'Google API Key'),
	(16, 'google_fcm_key', '', 'text', NULL, NULL, '2022-08-08 05:51:00', NULL, 'Application Setting', 'Google FCM Key');

-- Дамп структуры для таблица personal.cms_statistics
DROP TABLE IF EXISTS `cms_statistics`;
CREATE TABLE IF NOT EXISTS `cms_statistics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_statistics: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.cms_statistic_components
DROP TABLE IF EXISTS `cms_statistic_components`;
CREATE TABLE IF NOT EXISTS `cms_statistic_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_statistics` int DEFAULT NULL,
  `componentID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.cms_statistic_components: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.failed_jobs: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.migrations: ~29 rows (приблизительно)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_08_07_145904_add_table_cms_apicustom', 1),
	(4, '2016_08_07_150834_add_table_cms_dashboard', 1),
	(5, '2016_08_07_151210_add_table_cms_logs', 1),
	(6, '2016_08_07_151211_add_details_cms_logs', 1),
	(7, '2016_08_07_152014_add_table_cms_privileges', 1),
	(8, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
	(9, '2016_08_07_152320_add_table_cms_settings', 1),
	(10, '2016_08_07_152421_add_table_cms_users', 1),
	(11, '2016_08_07_154624_add_table_cms_menus_privileges', 1),
	(12, '2016_08_07_154624_add_table_cms_moduls', 1),
	(13, '2016_08_17_225409_add_status_cms_users', 1),
	(14, '2016_08_20_125418_add_table_cms_notifications', 1),
	(15, '2016_09_04_033706_add_table_cms_email_queues', 1),
	(16, '2016_09_16_035347_add_group_setting', 1),
	(17, '2016_09_16_045425_add_label_setting', 1),
	(18, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
	(19, '2016_10_01_141740_add_method_type_apicustom', 1),
	(20, '2016_10_01_141846_add_parameters_apicustom', 1),
	(21, '2016_10_01_141934_add_responses_apicustom', 1),
	(22, '2016_10_01_144826_add_table_apikey', 1),
	(23, '2016_11_14_141657_create_cms_menus', 1),
	(24, '2016_11_15_132350_create_cms_email_templates', 1),
	(25, '2016_11_15_190410_create_cms_statistics', 1),
	(26, '2016_11_17_102740_create_cms_statistic_components', 1),
	(27, '2017_06_06_164501_add_deleted_at_cms_moduls', 1),
	(28, '2019_08_19_000000_create_failed_jobs_table', 1),
	(29, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- Дамп структуры для таблица personal.page
DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы personal.page: ~0 rows (приблизительно)
INSERT INTO `page` (`id`, `url`, `text`) VALUES
	(1, '/ppp', '<p>ывфпыфвп</p><p>ыфвпыфвп</p><p>ывфпрывфп</p><p>ывфпрыфвпр</p><p><br></p>');

-- Дамп структуры для таблица personal.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.password_resets: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы personal.personal_access_tokens: ~0 rows (приблизительно)

-- Дамп структуры для таблица personal.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_chat` varchar(50) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_password` varchar(100) DEFAULT NULL,
  `user_hash` varchar(200) DEFAULT NULL,
  `image` int DEFAULT NULL,
  `role_id` int NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `id_chat` (`id_chat`),
  KEY `status` (`status`),
  KEY `first_name` (`first_name`),
  KEY `t_login` (`t_login`),
  KEY `t_password` (`t_password`),
  KEY `user_hash` (`user_hash`),
  KEY `role_id` (`role_id`),
  KEY `email` (`email`),
  KEY `email_verified_at` (`email_verified_at`),
  KEY `remember_token` (`remember_token`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы personal.users: ~3 rows (приблизительно)
INSERT INTO `users` (`id`, `name`, `id_chat`, `status`, `username`, `first_name`, `t_date`, `t_login`, `t_password`, `user_hash`, `image`, `role_id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `current_team_id`, `profile_photo_path`, `id_cms_privileges`, `photo`, `phone`) VALUES
	(1, 'Иванов Иван Иванович', NULL, 100, '', NULL, '2022-07-26 09:28:56', 'admin', '$2y$10$cWRNIky5ZJJ7AsqYbLqiX.eGurbg61M7v9ED2RUgOj20ISBH11SoG', NULL, NULL, 0, 'admin@b2bot.ru', NULL, '$2y$10$n5ybq0tc9HHzl5RpzfuNXenW9G5mILu9sGD1l3vlJX8BPSYvQUVne', NULL, NULL, '2022-08-18 06:24:05', NULL, NULL, NULL, NULL, NULL, 1, 'uploads/10/2022-08/user8.jpg', '79023438040'),
	(4, 'Петров Петр Петрович', NULL, 99, '', NULL, '2022-07-26 09:29:06', 'dev', '$2y$10$cWRNIky5ZJJ7AsqYbLqiX.eGurbg61M7v9ED2RUgOj20ISBH11SoG', NULL, NULL, 0, 'dev@b2bot.ru', NULL, '$2y$10$n5ybq0tc9HHzl5RpzfuNXenW9G5mILu9sGD1l3vlJX8BPSYvQUVne', NULL, NULL, '2022-08-17 11:38:11', NULL, NULL, NULL, NULL, NULL, 2, 'uploads/10/2022-08/user_7.jpg', '79023438041'),
	(10, 'Сидоров Сидр Сидорович', NULL, 0, '', NULL, '2022-07-07 08:57:29', 'demo', '$2y$10$dTurkvN1gdQTnW1v1X1DreV8EcPCs/hw5eedJs1TKer637ptaZtxO', NULL, NULL, 100, 'wmstr2007@yandex.ru', NULL, '$2y$10$n5ybq0tc9HHzl5RpzfuNXenW9G5mILu9sGD1l3vlJX8BPSYvQUVne', NULL, NULL, '2022-08-19 04:10:04', NULL, NULL, NULL, NULL, NULL, 3, 'uploads/10/2022-08/user_02.jpg', '72613246324');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
