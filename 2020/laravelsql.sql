-- --------------------------------------------------------
-- 호스트:                          192.168.10.10
-- 서버 버전:                        5.7.28-0ubuntu0.18.04.4 - (Ubuntu)
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- laravel 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `laravel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `laravel`;

-- 테이블 laravel.articles 구조 내보내기
CREATE TABLE IF NOT EXISTS `articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_user_id_foreign` (`user_id`),
  CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel.articles:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `user_id`, `title`, `excerpt`, `body`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Sapiente dolores occaecati molestiae.', 'Consequatur recusandae at nihil et aut cum.', 'Maxime ipsum sunt est voluptatem. Officiis quia incidunt voluptatem accusantium odit et facilis. Ab totam eos velit ut placeat eius dolorum nulla.', '2020-03-25 14:54:21', '2020-03-25 14:54:21'),
	(2, 1, 'Tempora fuga suscipit odit eaque aut consequuntur.', 'Ipsam rem dignissimos voluptatem modi assumenda earum.', 'Quas nostrum voluptatem voluptatum dolorem enim reprehenderit. Aspernatur veniam qui maxime eos. Et odio autem quia ea earum. Libero eos placeat ut voluptatem repudiandae.', '2020-03-25 14:54:21', '2020-03-25 14:54:21'),
	(3, 1, 'Nulla eius ut amet dolores nemo ut possimus.', 'Magni at tempore quia quia cum.', 'Quia eum ipsum ut occaecati eum modi fugiat. Vitae aut vero nihil expedita. Nisi ratione laudantium eaque et.', '2020-03-25 14:54:21', '2020-03-25 14:54:21'),
	(4, 2, 'Harum et a sunt iure veniam alias et.', 'Ut ipsa dolorem sit reiciendis ratione.', 'Laboriosam sit amet unde aut totam mollitia a. Hic voluptatum aut voluptas omnis incidunt ut corrupti. Molestias voluptas sint voluptatem culpa totam harum.', '2020-03-25 14:54:25', '2020-03-25 14:54:25'),
	(5, 2, 'Voluptatem quia est omnis enim qui sint est.', 'Nulla qui eum explicabo ut.', 'Qui ratione minus ut occaecati quo nisi. Fugit id omnis et sed quisquam et sint.', '2020-03-25 14:54:25', '2020-03-25 14:54:25'),
	(6, 2, 'Libero qui quia maxime facere hic.', 'Magnam rem saepe eos.', 'Doloribus quibusdam ipsam voluptate itaque. Debitis corporis consectetur totam sed nobis. Iure qui iusto et quis beatae modi. Quasi id ab ut illo.', '2020-03-25 14:54:25', '2020-03-25 14:54:25');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- 테이블 laravel.article_tag 구조 내보내기
CREATE TABLE IF NOT EXISTS `article_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_tag_article_id_tag_id_unique` (`article_id`,`tag_id`),
  KEY `article_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `article_tag_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel.article_tag:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` (`id`, `article_id`, `tag_id`, `created_at`, `updated_at`) VALUES
	(1, 4, 3, '2020-03-25 14:55:46', '2020-03-25 14:55:48'),
	(2, 4, 2, '2020-03-25 14:55:57', '2020-03-25 14:55:58'),
	(3, 1, 3, '2020-03-25 14:56:05', '2020-03-25 14:56:06'),
	(4, 1, 1, '2020-03-25 14:56:13', '2020-03-25 14:56:14');
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;

-- 테이블 laravel.assignments 구조 내보내기
CREATE TABLE IF NOT EXISTS `assignments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed_at` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel.assignments:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;

-- 테이블 laravel.failed_jobs 구조 내보내기
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel.failed_jobs:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- 테이블 laravel.migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel.migrations:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(15, '2014_10_12_000000_create_users_table', 1),
	(16, '2019_08_19_000000_create_failed_jobs_table', 1),
	(17, '2020_03_23_174124_create_posts_table', 1),
	(18, '2020_03_23_174731_add_title_to_posts_table', 1),
	(19, '2020_03_23_175157_create_projects_table', 1),
	(20, '2020_03_23_175311_create_assignments_table', 1),
	(21, '2020_03_24_140459_create_articles_table', 1),
	(22, '2020_03_25_142421_create_tags_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- 테이블 laravel.posts 구조 내보내기
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel.posts:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- 테이블 laravel.projects 구조 내보내기
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel.projects:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;

-- 테이블 laravel.tags 구조 내보내기
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel.tags:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'php', '2020-03-25 14:55:02', '2020-03-25 14:55:04'),
	(2, 'laravel', '2020-03-25 14:55:20', '2020-03-25 14:55:21'),
	(3, 'edu', '2020-03-25 14:55:25', '2020-03-25 14:55:25');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- 테이블 laravel.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel.users:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Harvey Zieme PhD', 'anna.larkin@example.org', '2020-03-25 14:53:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VjQDuuE0W9', '2020-03-25 14:53:53', '2020-03-25 14:53:53'),
	(2, 'Aaron Emard II', 'ortiz.conner@example.org', '2020-03-25 14:53:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YLrSdyMUza', '2020-03-25 14:53:53', '2020-03-25 14:53:53'),
	(3, 'Keith Tromp', 'mtoy@example.com', '2020-03-25 14:53:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'v22VjgeG72', '2020-03-25 14:53:53', '2020-03-25 14:53:53'),
	(4, 'Prof. Tatum Walsh II', 'ena89@example.net', '2020-03-25 14:53:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'y4h8kNw18W', '2020-03-25 14:53:53', '2020-03-25 14:53:53'),
	(5, 'Kenna Yundt I', 'lenora.jacobi@example.com', '2020-03-25 14:53:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JUSdk4Sbsy', '2020-03-25 14:53:53', '2020-03-25 14:53:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
