-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2025 at 04:08 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traning`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 'App\\Models\\Post', 'created', 35, 'App\\Models\\User', 37, '{\"attributes\":{\"title\":\"Test\",\"description\":\"**Test for uploading image.**\",\"image\":\"images\\/01J740WCJ0TP02AEZRJZT67RMY.jpg\",\"user_id\":14}}', NULL, '2024-09-06 12:57:39', '2024-09-06 12:57:39'),
(2, 'default', 'created', 'App\\Models\\Post', 'created', 36, 'App\\Models\\User', 37, '{\"attributes\":{\"title\":\"Test\",\"description\":\"**Test for uploading image.**\",\"image\":\"images\\/01J740YX2V4XG9CVQ29PMMPW32.jpg\",\"user_id\":14}}', NULL, '2024-09-06 12:59:01', '2024-09-06 12:59:01'),
(3, 'default', 'created', 'App\\Models\\Post', 'created', 37, 'App\\Models\\User', 22, '{\"attributes\":{\"title\":\"Dokkan release a new unit\",\"description\":\"Dokkan just released a new goku ssj3 card and it\'s looks fire\",\"image\":\"images\\/T7Pw70AjfkJSH7zYeEaJ_goku.jpg\",\"user_id\":22}}', NULL, '2024-09-06 13:21:55', '2024-09-06 13:21:55'),
(4, 'default', 'created', 'App\\Models\\Post', 'created', 38, 'App\\Models\\User', 22, '{\"attributes\":{\"title\":\"Dokkan release a new unit\",\"description\":\"Dokkan just released a new goku ssj3 card and it\'s looks fire\",\"image\":\"images\\/4oE0Kur9wr19X7AYcrNV_goku.jpg\",\"user_id\":22}}', NULL, '2024-09-06 13:23:20', '2024-09-06 13:23:20'),
(5, 'default', 'created', 'App\\Models\\Post', 'created', 39, 'App\\Models\\User', 22, '{\"attributes\":{\"title\":\"Dokkan release a new unit\",\"description\":\"Dokkan just released a new goku ssj3 card and it\'s looks fire\",\"image\":\"images\\/JHUmI7H0qMaOISWasMjI_goku.jpg\",\"user_id\":22}}', NULL, '2024-09-06 13:32:01', '2024-09-06 13:32:01'),
(6, 'default', 'deleted', 'App\\Models\\Post', 'deleted', 34, 'App\\Models\\User', 37, '{\"old\":{\"title\":\"real madrid draw in their first match\",\"description\":\"real madrid draw in their first match in the la liga \\\"it\'s a marthon not a race\\\" !!!\",\"image\":\"images\\/ZpED04ERhPjjVvfmBZcy_first-match.jpg\",\"user_id\":14}}', NULL, '2024-09-06 13:51:42', '2024-09-06 13:51:42'),
(7, 'default', 'deleted', 'App\\Models\\Post', 'deleted', 35, 'App\\Models\\User', 37, '{\"old\":{\"title\":\"Test\",\"description\":\"**Test for uploading image.**\",\"image\":\"images\\/01J740WCJ0TP02AEZRJZT67RMY.jpg\",\"user_id\":14}}', NULL, '2024-09-06 13:51:42', '2024-09-06 13:51:42'),
(8, 'default', 'deleted', 'App\\Models\\Post', 'deleted', 36, 'App\\Models\\User', 37, '{\"old\":{\"title\":\"Test\",\"description\":\"**Test for uploading image.**\",\"image\":\"images\\/01J740YX2V4XG9CVQ29PMMPW32.jpg\",\"user_id\":14}}', NULL, '2024-09-06 13:51:42', '2024-09-06 13:51:42'),
(9, 'default', 'deleted', 'App\\Models\\Post', 'deleted', 37, 'App\\Models\\User', 37, '{\"old\":{\"title\":\"Dokkan release a new unit\",\"description\":\"Dokkan just released a new goku ssj3 card and it\'s looks fire\",\"image\":\"images\\/T7Pw70AjfkJSH7zYeEaJ_goku.jpg\",\"user_id\":22}}', NULL, '2024-09-06 13:51:42', '2024-09-06 13:51:42'),
(10, 'default', 'deleted', 'App\\Models\\Post', 'deleted', 38, 'App\\Models\\User', 37, '{\"old\":{\"title\":\"Dokkan release a new unit\",\"description\":\"Dokkan just released a new goku ssj3 card and it\'s looks fire\",\"image\":\"images\\/4oE0Kur9wr19X7AYcrNV_goku.jpg\",\"user_id\":22}}', NULL, '2024-09-06 13:51:42', '2024-09-06 13:51:42'),
(11, 'default', 'deleted', 'App\\Models\\Post', 'deleted', 39, 'App\\Models\\User', 37, '{\"old\":{\"title\":\"Dokkan release a new unit\",\"description\":\"Dokkan just released a new goku ssj3 card and it\'s looks fire\",\"image\":\"images\\/JHUmI7H0qMaOISWasMjI_goku.jpg\",\"user_id\":22}}', NULL, '2024-09-06 13:51:42', '2024-09-06 13:51:42'),
(12, 'default', 'created', 'App\\Models\\Post', 'created', 40, 'App\\Models\\User', 22, '{\"attributes\":{\"title\":\"Dokkan release a new unit\",\"description\":\"Dokkan just released a new goku ssj3 card and it\'s looks fire\",\"image\":\"images\\/IRTNbWQaw8FBoeavfnuA_goku.jpg\",\"user_id\":22}}', NULL, '2024-09-06 13:52:03', '2024-09-06 13:52:03'),
(13, 'default', 'created', 'App\\Models\\Post', 'created', 41, 'App\\Models\\User', 37, '{\"attributes\":{\"title\":\"Test\",\"description\":\"Dokkan Battle\",\"image\":\"01J744DDHZYA9T8K48TBWSCHF7.png\",\"user_id\":22}}', NULL, '2024-09-06 13:59:23', '2024-09-06 13:59:23'),
(14, 'default', 'deleted', 'App\\Models\\Post', 'deleted', 41, 'App\\Models\\User', 37, '{\"old\":{\"title\":\"Test\",\"description\":\"Dokkan Battle\",\"image\":\"01J744DDHZYA9T8K48TBWSCHF7.png\",\"user_id\":22}}', NULL, '2024-09-06 14:00:52', '2024-09-06 14:00:52'),
(15, 'default', 'created', 'App\\Models\\Post', 'created', 42, 'App\\Models\\User', 37, '{\"attributes\":{\"title\":\"Test\",\"description\":\"Dokkan Battle goku\",\"image\":\"images\\/01J744HY6KAE914FEMZQFXTBM8.png\",\"user_id\":22}}', NULL, '2024-09-06 14:01:51', '2024-09-06 14:01:51'),
(16, 'default', 'deleted', 'App\\Models\\Post', 'deleted', 42, 'App\\Models\\User', 37, '{\"old\":{\"title\":\"Test\",\"description\":\"Dokkan Battle goku\",\"image\":\"images\\/01J744HY6KAE914FEMZQFXTBM8.png\",\"user_id\":22}}', NULL, '2024-09-07 02:29:14', '2024-09-07 02:29:14'),
(17, 'default', 'created', 'App\\Models\\User', 'created', 40, NULL, NULL, '{\"attributes\":{\"name\":\"Mr.obay\",\"email\":\"obay@gmail.com\",\"gender\":\"male\",\"is_admin\":0}}', NULL, '2024-09-07 02:32:53', '2024-09-07 02:32:53'),
(18, 'default', 'updated', 'App\\Models\\User', 'updated', 37, 'App\\Models\\User', 37, '{\"attributes\":{\"name\":\"Mr.Riyadh\",\"email\":\"riyadh@admin.com\",\"gender\":\"male\",\"is_admin\":1},\"old\":{\"name\":\"Mr.Riyadh\",\"email\":\"riyadh@admin.com\",\"gender\":\"male\",\"is_admin\":1}}', NULL, '2024-09-07 02:39:42', '2024-09-07 02:39:42'),
(19, 'default', 'updated', 'App\\Models\\Post', 'updated', 1, 'App\\Models\\User', 37, '{\"attributes\":{\"title\":\"Voluptatem voluptatibus consectetur autem dolorem.\",\"description\":\"Quidem dicta maiores aut quisquam necessitatibus.\\nHi\",\"image\":\"images\\/01J75G76FZ4PMP7K23TZ98M0NK.png\",\"user_id\":7},\"old\":{\"title\":\"Voluptatem voluptatibus consectetur autem dolorem.\",\"description\":\"Quidem dicta maiores aut quisquam necessitatibus.\",\"image\":\"https:\\/\\/via.placeholder.com\\/640x480.png\\/00aabb?text=sed\",\"user_id\":7}}', NULL, '2024-09-07 02:44:56', '2024-09-07 02:44:56'),
(20, 'default', 'updated', 'App\\Models\\User', 'updated', 37, 'App\\Models\\User', 37, '{\"attributes\":{\"name\":\"Mr.Riyadh\",\"email\":\"riyadh@admin.com\",\"gender\":\"male\",\"is_admin\":1},\"old\":{\"name\":\"Mr.Riyadh\",\"email\":\"riyadh@admin.com\",\"gender\":\"male\",\"is_admin\":1}}', NULL, '2024-09-07 02:45:55', '2024-09-07 02:45:55'),
(21, 'default', 'created', 'App\\Models\\User', 'created', 41, NULL, NULL, '{\"attributes\":{\"name\":\"Mr.mohammad\",\"email\":\"moahmmad@admin.com\",\"gender\":\"male\",\"is_admin\":1}}', NULL, '2024-09-07 02:46:26', '2024-09-07 02:46:26'),
(22, 'default', 'updated', 'App\\Models\\User', 'updated', 41, 'App\\Models\\User', 41, '{\"attributes\":{\"name\":\"Mr.mohammad\",\"email\":\"moahmmad@admin.com\",\"gender\":\"male\",\"is_admin\":1},\"old\":{\"name\":\"Mr.mohammad\",\"email\":\"moahmmad@admin.com\",\"gender\":\"male\",\"is_admin\":1}}', NULL, '2024-09-07 02:46:39', '2024-09-07 02:46:39'),
(23, 'default', 'updated', 'App\\Models\\User', 'updated', 41, NULL, NULL, '{\"attributes\":{\"name\":\"Mr.mohammad\",\"email\":\"moahmmad@admin.com\",\"gender\":\"male\",\"is_admin\":1},\"old\":{\"name\":\"Mr.mohammad\",\"email\":\"moahmmad@admin.com\",\"gender\":\"male\",\"is_admin\":1}}', NULL, '2024-09-07 02:47:45', '2024-09-07 02:47:45'),
(24, 'default', 'updated', 'App\\Models\\User', 'updated', 41, 'App\\Models\\User', 41, '{\"attributes\":{\"name\":\"Mr.mohammad\",\"email\":\"moahmmad@admin.com\",\"gender\":\"male\",\"is_admin\":1},\"old\":{\"name\":\"Mr.mohammad\",\"email\":\"moahmmad@admin.com\",\"gender\":\"male\",\"is_admin\":1}}', NULL, '2024-09-07 13:05:09', '2024-09-07 13:05:09'),
(25, 'default', 'created', 'App\\Models\\User', 'created', 42, NULL, NULL, '{\"attributes\":{\"name\":\"Mr.meefee\",\"email\":\"meefee@admin.com\",\"gender\":\"male\",\"is_admin\":1}}', NULL, '2024-09-07 13:06:41', '2024-09-07 13:06:41'),
(26, 'default', 'updated', 'App\\Models\\User', 'updated', 42, 'App\\Models\\User', 42, '{\"attributes\":{\"name\":\"Mr.meefee\",\"email\":\"meefee@admin.com\",\"gender\":\"male\",\"is_admin\":1},\"old\":{\"name\":\"Mr.meefee\",\"email\":\"meefee@admin.com\",\"gender\":\"male\",\"is_admin\":1}}', NULL, '2024-09-07 13:07:49', '2024-09-07 13:07:49'),
(27, 'default', 'updated', 'App\\Models\\User', 'updated', 40, NULL, NULL, '{\"attributes\":{\"name\":\"Mr.obay\",\"email\":\"obay@gmail.com\",\"gender\":\"male\",\"is_admin\":0},\"old\":{\"name\":\"Mr.obay\",\"email\":\"obay@gmail.com\",\"gender\":\"male\",\"is_admin\":0}}', NULL, '2024-09-12 13:05:58', '2024-09-12 13:05:58'),
(28, 'default', 'updated', 'App\\Models\\User', 'updated', 14, NULL, NULL, '{\"attributes\":{\"name\":\"Mr.basel\",\"email\":\"basel@gmail.com\",\"gender\":\"male\",\"is_admin\":0},\"old\":{\"name\":\"Mr.basel\",\"email\":\"basel@gmail.com\",\"gender\":\"male\",\"is_admin\":0}}', NULL, '2024-09-13 02:59:43', '2024-09-13 02:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('57f7f3b1a5eda95047056a7b164ee2b48cb995a5', 'i:1;', 1725490490),
('57f7f3b1a5eda95047056a7b164ee2b48cb995a5:timer', 'i:1725490490;', 1725490490),
('5b384ce32d8cdef02bc3a139d4cac0a22bb029e8', 'i:1;', 1725493136),
('5b384ce32d8cdef02bc3a139d4cac0a22bb029e8:timer', 'i:1725493136;', 1725493136),
('5c785c036466adea360111aa28563bfd556b5fba', 'i:1;', 1726207243),
('5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1726207243;', 1726207243),
('62dcdddd2131784090e8a5916c260a90678e71b3', 'i:2;', 1725688075),
('62dcdddd2131784090e8a5916c260a90678e71b3:timer', 'i:1725688075;', 1725688075),
('761f22b2c1593d0bb87e0b606f990ba4974706de', 'i:1;', 1725688059),
('761f22b2c1593d0bb87e0b606f990ba4974706de:timer', 'i:1725688059;', 1725688059),
('92cfceb39d57d914ed8b14d0e37643de0797ae56', 'i:1;', 1725725329),
('92cfceb39d57d914ed8b14d0e37643de0797ae56:timer', 'i:1725725329;', 1725725329),
('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1736845144),
('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1736845144;', 1736845144),
('a9fbebefddd2d08da2a1a58fb83678623d112f91', 'i:1;', 1725725260),
('a9fbebefddd2d08da2a1a58fb83678623d112f91:timer', 'i:1725725260;', 1725725260),
('c9648cc0cb3d6646e566f360255b7283d9012d02', 'i:2;', 1725688115),
('c9648cc0cb3d6646e566f360255b7283d9012d02:timer', 'i:1725688115;', 1725688115),
('ca3512f4dfa95a03169c5a670a4c91a19b3077b4', 'i:1;', 1725493575),
('ca3512f4dfa95a03169c5a670a4c91a19b3077b4:timer', 'i:1725493575;', 1725493575),
('cb7a1d775e800fd1ee4049f7dca9e041eb9ba083', 'i:1;', 1725687952),
('cb7a1d775e800fd1ee4049f7dca9e041eb9ba083:timer', 'i:1725687952;', 1725687952),
('theme', 's:7:\"default\";', 2041085328),
('theme_color', 's:7:\"fuchsia\";', 2052205240);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Personal', '2024-07-10 05:26:47', '2024-07-10 05:26:47'),
(2, 'Work', '2024-07-10 05:26:47', '2024-07-10 05:26:47'),
(3, 'Hobby', '2024-07-10 05:26:47', '2024-07-10 05:26:47'),
(4, 'Sport', '2024-08-25 10:25:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

CREATE TABLE `category_post` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_post`
--

INSERT INTO `category_post` (`category_id`, `post_id`) VALUES
(1, 5),
(1, 4),
(2, 3),
(3, 9),
(1, 5),
(2, 4),
(2, 7),
(3, 2),
(2, 8),
(3, 5),
(3, 9),
(2, 4),
(1, 10),
(2, 3),
(1, 2),
(4, 33),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"80b97e31-2bcb-4765-883c-5912a47bfa2d\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:37;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:219:\\\"http:\\/\\/127.0.0.1:8000\\/admin\\/password-reset\\/reset?email=riyadh%40admin.com&token=e58f3be5c25d6fd1191474bff7e19a1861e2e66ebd114e7605b23f9b6624ef52&signature=4f30969d23a6678ba78a9d2940099d8b394f9e134c12765c6408559bb22ac081\\\";s:5:\\\"token\\\";s:64:\\\"e58f3be5c25d6fd1191474bff7e19a1861e2e66ebd114e7605b23f9b6624ef52\\\";s:2:\\\"id\\\";s:36:\\\"92d5eaed-8fff-4325-aaeb-ec3e8569a614\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1725486507, 1725486507),
(2, 'default', '{\"uuid\":\"a90d2d8f-403d-4e2f-a439-7a3bd5b10be7\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\VerifyEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:37;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:39:\\\"Filament\\\\Notifications\\\\Auth\\\\VerifyEmail\\\":2:{s:3:\\\"url\\\";s:191:\\\"http:\\/\\/127.0.0.1:8000\\/admin\\/email-verification\\/verify\\/37\\/39dadd634192d0da79cea7e29643486259987ba4?expires=1725490146&signature=4ba41548caad932c5a5c316ce802ff4cdf229de1308d38420a4a794602655c11\\\";s:2:\\\"id\\\";s:36:\\\"73199f6d-0dab-4f31-a8a9-2900b1ded120\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1725486546, 1725486546),
(3, 'default', '{\"uuid\":\"b3e429b4-704a-4101-b407-0518a736205a\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:37;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:219:\\\"http:\\/\\/127.0.0.1:8000\\/admin\\/password-reset\\/reset?email=riyadh%40admin.com&token=bf94eb31e87416eee3f43007f561e5683dbda0af5bcd1b412a55569377842a68&signature=1194515c695a1c1230d6c76f1d3923c835f9b02ef19a9550aa7b4e671763bb23\\\";s:5:\\\"token\\\";s:64:\\\"bf94eb31e87416eee3f43007f561e5683dbda0af5bcd1b412a55569377842a68\\\";s:2:\\\"id\\\";s:36:\\\"84fe3c3a-963d-4dce-abd8-b1e366d2084d\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1725490399, 1725490399);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_07_10_072845_create_posts_table', 1),
(5, '2024_07_10_073048_create_categories_table', 1),
(6, '2024_07_10_073413_create_category_post_table', 1),
(7, '2024_08_22_075240_create_personal_access_tokens_table', 2),
(8, '2024_09_02_090545_make_gender_password_nullable_in_users_table', 3),
(9, '2024_09_02_220016_create_providers_table', 4),
(13, '2024_09_04_205951_create_permissions_table', 5),
(14, '2024_09_04_210120_add_is_admin_to_users_table', 5),
(15, '2024_09_04_210226_create_permission_user_table', 5),
(16, '2024_09_05_055053_create_activity_log_table', 6),
(17, '2024_09_05_055054_add_event_column_to_activity_log_table', 6),
(18, '2024_09_05_055055_add_batch_uuid_column_to_activity_log_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('basel@gmail.com', '$2y$12$IDUhcVIYSM3cY7Pvns.qZOp2rFOl2BANUeSX5habw81soULAcC1em', '2024-08-28 14:32:59'),
('dina@gmail.com', '$2y$12$Qg5l3.01p4WXcnqoyCes2OR9PTeQxi4kjm8m.pG7nPUTGuhB.c3eO', '2024-08-28 11:45:06'),
('riyadh@admin.com', '$2y$12$ATHwjhgFkazW7hXWi/vNKOUHlDg2R6.dUWfoyHfwvC12mOQCBYfKe', '2024-09-04 19:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(29, 'App\\Models\\User', 35, 'Basel Token', 'e2739931aa0e3a287453b3eae3942889968881f19ec0cbae42ceac638200b2e9', '[\"*\"]', NULL, NULL, '2024-09-02 20:55:01', '2024-09-02 20:55:01'),
(30, 'App\\Models\\User', 32, 'Ms.nora Token', '11a9b4752ccb4d50594da4e4f762eeeb6b76ffc833783145c293552c1e3305ac', '[\"*\"]', NULL, NULL, '2024-09-04 19:57:02', '2024-09-04 19:57:02'),
(32, 'App\\Models\\User', 22, 'Mr.ali Token', 'f2065183044a858d7f9cd2a13a4140c520cbaaa21e923a35b3546d5e7b9e6e93', '[\"*\"]', '2024-09-06 13:58:08', NULL, '2024-09-06 13:31:48', '2024-09-06 13:58:08'),
(34, 'App\\Models\\User', 40, 'Mr.obay Token', '540811977d5240405ea7235c73c0ef275548f351e9d31a1295131c438f3f0c45', '[\"*\"]', '2024-09-12 13:20:20', NULL, '2024-09-12 13:06:21', '2024-09-12 13:20:20'),
(36, 'App\\Models\\User', 14, 'Mr.basel Token', '3f270508866f5b76ac509d9dd9a4fc9924dbb0e282e4c88901f3fbc7b3d7c8c4', '[\"*\"]', '2024-09-13 02:59:59', NULL, '2024-09-13 02:53:17', '2024-09-13 02:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Voluptatem voluptatibus consectetur autem dolorem.', 'Quidem dicta maiores aut quisquam necessitatibus.\nHi', 'images/01J75G76FZ4PMP7K23TZ98M0NK.png', 7, '2024-07-10 05:26:28', '2024-09-07 02:44:56'),
(2, 'Qui dicta sed soluta.', 'Maxime porro eum harum nam ut.', 'https://via.placeholder.com/640x480.png/0088cc?text=repellendus', 1, '2024-07-10 05:26:28', '2024-07-10 05:26:28'),
(3, 'Aut ut laboriosam et.', 'Consectetur beatae quidem non modi omnis.', 'https://via.placeholder.com/640x480.png/00ee66?text=aut', 6, '2024-07-10 05:26:28', '2024-07-10 05:26:28'),
(4, 'Autem rem et nihil.', 'Quaerat omnis nobis delectus nostrum ut et.', 'https://via.placeholder.com/640x480.png/00aaff?text=odit', 6, '2024-07-10 05:26:28', '2024-07-10 05:26:28'),
(5, 'Est eaque rerum beatae at aut.', 'Et quia hic nesciunt odio.', 'https://via.placeholder.com/640x480.png/0099ee?text=ea', 9, '2024-07-10 05:26:28', '2024-07-10 05:26:28'),
(6, 'Nesciunt sint dolorem dolor.', 'Sint modi repudiandae qui expedita.', 'https://via.placeholder.com/640x480.png/0011cc?text=velit', 2, '2024-07-10 05:26:28', '2024-07-10 05:26:28'),
(7, 'Iure omnis et.', 'Animi ut doloremque vero distinctio.', 'https://via.placeholder.com/640x480.png/00ffff?text=cumque', 4, '2024-07-10 05:26:28', '2024-07-10 05:26:28'),
(8, 'At vitae eos.', 'Sed reiciendis sed velit est.', 'https://via.placeholder.com/640x480.png/003322?text=perspiciatis', 9, '2024-07-10 05:26:28', '2024-07-10 05:26:28'),
(9, 'Quaerat et eos.', 'Rerum quidem et voluptas aut.', 'https://via.placeholder.com/640x480.png/007744?text=nobis', 10, '2024-07-10 05:26:28', '2024-07-10 05:26:28'),
(10, 'Commodi assumenda perferendis omnis.', 'Porro sit hic consequuntur voluptatem.', 'https://via.placeholder.com/640x480.png/007744?text=qui', 8, '2024-07-10 05:26:28', '2024-07-10 05:26:28'),
(33, 'real madrid draw in their first match', 'real madrid draw in their first match in the la liga \"it\'s a marthon not a race\" !!!', 'images/fQIokAr5clZJxUNgiHfF_first-match.jpg', 14, '2024-08-28 17:47:49', '2024-08-28 17:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `provider_id`, `provider_name`, `provider_token`, `provider_refresh_token`, `user_id`, `created_at`, `updated_at`) VALUES
(8, '105820559', 'github', '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', NULL, 35, '2024-09-02 20:54:38', '2024-09-02 20:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5AjLnWSe7E3xh2vt0sQqyi7EXYsSdUOKIfxnTTuv', 37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 OPR/115.0.0.0', 'YTo5OntzOjY6Il90b2tlbiI7czo0MDoibHRPMDFyQ1RITzYxM3pKTGl4QkJsNjdtMmVlN2xYNHI1R0w2VHJKUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wb3N0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozNztzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJGNpV08yeG9tN1pqWU80SFBNUExWa3VFM1RaSmE4WlVFc1d1d3ZPdm84cWpIU2h6U3FCQjhhIjtzOjY6ImxvY2FsZSI7czoyOiJhciI7czo4OiJmaWxhbWVudCI7YTowOnt9czo2OiJ0YWJsZXMiO2E6MTp7czoyNToiTGlzdFBvc3RzX3RvZ2dsZWRfY29sdW1ucyI7YTo3OntzOjU6InRpdGxlIjtiOjE7czoxMToiZGVzY3JpcHRpb24iO2I6MTtzOjU6ImltYWdlIjtiOjE7czo0OiJ1c2VyIjthOjE6e3M6NDoibmFtZSI7YjoxO31zOjEwOiJjYXRlZ29yaWVzIjthOjE6e3M6NDoibmFtZSI7YjowO31zOjEwOiJjcmVhdGVkX2F0IjtiOjA7czoxMDoidXBkYXRlZF9hdCI7YjowO319fQ==', 1736845802);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `gender`, `password`, `remember_token`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'Kyler Olson', 'marcellus77@example.org', NULL, 'male', '$2y$12$85KewO9XVdjYvTXmj/t9LetJi.plWM7nZgiS9P5DeCYWmQaNIGbTq', NULL, 0, '2024-07-10 05:26:04', '2024-07-10 05:26:04'),
(2, 'Estella Fahey', 'strosin.katrine@example.org', NULL, 'female', '$2y$12$MdJub5uK4fupEqvnFijm/OeYsnJl9CKPnWIzW3At1i/RPoooQPiRy', NULL, 0, '2024-07-10 05:26:04', '2024-07-10 05:26:04'),
(3, 'Tyree Friesen', 'fmayer@example.com', NULL, 'male', '$2y$12$ethxZMx5X3BroIlPVyy9ueJ/ThX/3YcRH76nKG1ukW8xsn3/qNe6S', NULL, 0, '2024-07-10 05:26:05', '2024-07-10 05:26:05'),
(4, 'Rupert Bednar', 'ines.reichel@example.com', NULL, 'male', '$2y$12$6EAJ/U6A9JdLeub46ZctCOV2s/WqjsD73YhJei0oDzxqMTlfrF1yi', NULL, 0, '2024-07-10 05:26:05', '2024-07-10 05:26:05'),
(5, 'Norberto Heaney DDS', 'homenick.camila@example.net', NULL, 'male', '$2y$12$pSzJ0X/gfyw7vBTS/4wJFOiFwduST23w5jfToN19.w7HW3wer6qdu', NULL, 0, '2024-07-10 05:26:05', '2024-07-10 05:26:05'),
(6, 'Greta Terry', 'ulices82@example.org', NULL, 'female', '$2y$12$PjV.OXlvMuCuVuESQVUr1uHvYP0iZ5el8BuFPONjl/obTzoRoGG8m', NULL, 0, '2024-07-10 05:26:05', '2024-07-10 05:26:05'),
(7, 'Dorthy Brakus IV', 'ilene.goldner@example.org', NULL, 'male', '$2y$12$QQu2i3lp2IBenai2UrCCdO/4NqUIhf.yiGPf4.HcSMa5EvVEAJQ0u', NULL, 0, '2024-07-10 05:26:05', '2024-07-10 05:26:05'),
(8, 'Kiara Rutherford', 'uoconner@example.com', NULL, 'female', '$2y$12$mahrgTbeK4chdF3WghZxjOrmAjii/KogjjyuGG6MujImQN4uKNkHG', NULL, 0, '2024-07-10 05:26:06', '2024-07-10 05:26:06'),
(9, 'Elvie Bednar', 'justina.olson@example.org', NULL, 'female', '$2y$12$yJkIh92/CbVSGcn4IBSZi.E1aeq/7bxyPP/zZU9SvN0NNSonZpEQe', NULL, 0, '2024-07-10 05:26:06', '2024-07-10 05:26:06'),
(10, 'Charley Mosciski', 'bridgette.lueilwitz@example.org', NULL, 'male', '$2y$12$yMqfUvc5J5ofmwYR3qc1JOtzsdhoNUXZy0Z2H73Jr7pMLGHfV2ICC', NULL, 0, '2024-07-10 05:26:06', '2024-07-10 05:26:06'),
(13, 'basel', 'baselzanon@gmail.com', NULL, 'male', '$2y$12$VdcnYQ.NYkkqAsCn9L4FY.QBBKq/bcWXdBTqIYOekdLx7Jtbvteq2', NULL, 0, '2024-08-24 14:45:00', '2024-08-24 14:45:00'),
(14, 'basel', 'basel@gmail.com', '2024-09-13 02:59:43', 'male', '$2y$12$3qdWmEu0t/gpTCSBMRdu1OgVqBiK0xEDTuin9c19fqx.KGdd7D5bm', NULL, 0, '2024-08-24 14:47:16', '2024-09-13 02:59:43'),
(22, 'ali', 'ali@gmail.com', '2024-08-28 04:43:11', 'male', '$2y$12$WiRotnoHfhwgUQgxSzPFvuvMUYsGgmBYaf7Ido2umE0qe3rvbGpJC', NULL, 0, '2024-08-27 20:50:10', '2024-08-28 04:43:11'),
(23, 'dina', 'dina@gmail.com', '2024-08-28 05:56:28', 'female', '$2y$12$oQ2L536vldNpNBTZ0f4u6etIM1fDOa5Va81Z9vZn2i88cK.A0WH5i', NULL, 0, '2024-08-28 04:45:34', '2024-08-28 05:56:28'),
(32, 'nora', 'nora@gmail.com', '2024-09-01 14:37:52', 'female', '$2y$12$.CF19AFZnpib2eMsqHk4KOoXhRrYXibAovBz6PCbkTWWPQ4JFIBAS', 'DTFVZMz1WU8vLj76Qi9VK73QmFDQC1QOE48lVjPqK5ptGUSFAbjdUr3OTPYH', 1, '2024-09-01 14:37:44', '2024-09-04 19:55:32'),
(35, 'Basel', 'baselzanon8@gmail.com', NULL, NULL, NULL, NULL, 0, '2024-09-02 20:49:35', '2024-09-02 20:55:01'),
(37, 'Riyadh', 'riyadh@admin.com', '2024-09-04 19:54:02', 'male', '$2y$12$ciWO2xom7ZjYO4HPMPLVkuE3TZJa8ZUEsWuwvOvo8qjHShzSqBB8a', 'D1FwP54U5pbul0eRVKHb80RE1nMfgJ5E8qgg6Lkg2K3Y7rNGck7sh98CKjuO', 1, '2024-09-04 18:26:45', '2024-09-05 08:33:49'),
(40, 'obay', 'obay@gmail.com', NULL, 'male', '$2y$12$ck44PUROlpnPt3vMpLKy0OabhTOfkoaMb7l4k/s30.WGQXr2qArg2', NULL, 0, '2024-09-07 02:32:53', '2024-09-12 13:05:58'),
(41, 'mohammad', 'moahmmad@admin.com', '2024-09-07 02:46:39', 'male', '$2y$12$Lp260aZmwaU9dJlRuCud7uiVBboqqZTTMg9O7AWth4BP8bReL6oBC', '640nd3xE1KR2OWZtDZFNXPjCuwOhQRo4g2RPMFhYg2Ckl7NpHK1RJAh897wN', 1, '2024-09-07 02:46:26', '2024-09-07 02:47:45'),
(42, 'meefee', 'meefee@admin.com', '2024-09-07 13:07:49', 'male', '$2y$12$93q8z1Et6oeWUNRQYtc0oeZHGHRiwubEiZA7FhC06W/otmpSWuReK', NULL, 1, '2024-09-07 13:06:40', '2024-09-07 13:07:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_post`
--
ALTER TABLE `category_post`
  ADD KEY `category_post_category_id_foreign` (`category_id`),
  ADD KEY `category_post_post_id_foreign` (`post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_post`
--
ALTER TABLE `category_post`
  ADD CONSTRAINT `category_post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
