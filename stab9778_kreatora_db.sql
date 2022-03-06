-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 28, 2022 at 11:39 PM
-- Server version: 10.2.41-MariaDB-cll-lve
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stab9778_kreatora_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `backer_users`
--

CREATE TABLE `backer_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `index` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `reward_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `tip` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backer_users`
--

INSERT INTO `backer_users` (`id`, `index`, `campaign_id`, `user_id`, `reward_id`, `amount`, `tip`, `created_at`, `updated_at`) VALUES
(1, NULL, 45, 5, 3, 60000, 40000, '2021-10-26 02:57:03', '2021-10-26 02:57:03'),
(2, NULL, 45, 5, NULL, 150000, NULL, '2021-10-26 02:57:46', '2021-10-26 02:57:46'),
(3, NULL, 45, 5, NULL, 200000, NULL, '2021-10-26 02:58:08', '2021-10-26 02:58:08'),
(4, NULL, 45, 5, 5, 80000, NULL, '2021-10-26 02:59:39', '2021-10-26 02:59:39'),
(5, NULL, 50, 5, 4, 50000, 20000, '2021-10-26 03:35:29', '2021-10-26 03:35:29'),
(6, NULL, 50, 5, 4, 50000, NULL, '2021-10-26 03:35:37', '2021-10-26 03:35:37'),
(7, NULL, 50, 5, 4, 50000, 40000, '2021-10-26 03:35:51', '2021-10-26 03:35:51'),
(8, NULL, 50, 5, 7, 90000, 100000, '2021-10-26 03:36:24', '2021-10-26 03:36:24'),
(9, NULL, 50, 5, 7, 90000, NULL, '2021-10-26 03:36:32', '2021-10-26 03:36:32'),
(10, NULL, 50, 5, NULL, 200000, NULL, '2021-10-26 03:36:45', '2021-10-26 03:36:45'),
(11, NULL, 50, 5, NULL, 10000, NULL, '2021-10-26 03:36:53', '2021-10-26 03:36:53'),
(12, NULL, 50, 5, NULL, 250000, NULL, '2021-10-28 13:50:09', '2021-10-28 13:50:09'),
(13, NULL, 50, 5, NULL, 150000, NULL, '2021-11-14 15:56:46', '2021-11-14 15:56:46'),
(14, NULL, 50, 5, NULL, 150000, NULL, '2021-11-15 03:31:48', '2021-11-15 03:31:48'),
(15, NULL, 50, 19, NULL, 30000, NULL, '2021-11-15 07:31:08', '2021-11-15 07:31:08'),
(16, NULL, 50, 5, NULL, 150000, NULL, '2021-11-15 07:33:28', '2021-11-15 07:33:28'),
(17, NULL, 50, 19, NULL, 30000, NULL, '2021-11-15 07:40:54', '2021-11-15 07:40:54'),
(18, NULL, 50, 19, NULL, 90000, 10000, '2021-11-15 08:37:45', '2021-11-15 08:37:45'),
(19, NULL, 50, 19, NULL, 90000, 10000, '2021-11-15 08:45:23', '2021-11-15 08:45:23'),
(20, NULL, 50, 19, NULL, 90000, 10000, '2021-11-15 08:45:24', '2021-11-15 08:45:24'),
(21, NULL, 50, 19, NULL, 10000, NULL, '2021-11-15 09:09:24', '2021-11-15 09:09:24'),
(22, NULL, 50, 19, NULL, 10000, NULL, '2021-11-15 09:09:24', '2021-11-15 09:09:24'),
(23, NULL, 50, 19, NULL, 10000, NULL, '2021-11-15 09:09:42', '2021-11-15 09:09:42'),
(24, NULL, 50, 19, NULL, 10000, NULL, '2021-11-15 09:09:43', '2021-11-15 09:09:43'),
(25, NULL, 50, 19, NULL, 10000, NULL, '2021-11-15 09:09:43', '2021-11-15 09:09:43'),
(26, NULL, 50, 19, NULL, 10000, NULL, '2021-11-15 09:09:43', '2021-11-15 09:09:43'),
(27, NULL, 50, 19, NULL, 10000, NULL, '2021-11-15 09:09:44', '2021-11-15 09:09:44'),
(28, NULL, 50, 19, NULL, 90000, 10000, '2021-11-15 09:10:24', '2021-11-15 09:10:24'),
(29, NULL, 50, 19, NULL, 90000, 10000, '2021-11-15 09:10:25', '2021-11-15 09:10:25'),
(30, NULL, 50, 19, NULL, 90000, 10000, '2021-11-15 09:10:25', '2021-11-15 09:10:25'),
(31, NULL, 50, 19, NULL, 90000, 10000, '2021-11-15 09:10:25', '2021-11-15 09:10:25'),
(32, NULL, 50, 19, NULL, 90000, 10000, '2021-11-15 09:10:26', '2021-11-15 09:10:26'),
(33, NULL, 50, 19, NULL, 90000, NULL, '2021-11-15 09:23:49', '2021-11-15 09:23:49'),
(34, NULL, 50, 19, NULL, 90000, 10000, '2021-11-16 11:28:57', '2021-11-16 11:28:57'),
(35, NULL, 50, 19, NULL, 90000, 10000, '2021-11-16 11:28:59', '2021-11-16 11:28:59'),
(36, NULL, 50, 19, NULL, 90000, 10000, '2021-11-16 11:28:59', '2021-11-16 11:28:59'),
(37, NULL, 50, 19, NULL, 90000, 10000, '2021-11-16 11:28:59', '2021-11-16 11:28:59'),
(38, NULL, 50, 19, NULL, 90000, 10000, '2021-11-16 11:29:00', '2021-11-16 11:29:00'),
(39, NULL, 50, 19, NULL, 90000, 10000, '2021-11-16 11:29:00', '2021-11-16 11:29:00'),
(40, NULL, 50, 19, NULL, 1000000, NULL, '2021-11-19 13:45:37', '2021-11-19 13:45:37'),
(41, NULL, 50, 19, NULL, 90000, NULL, '2021-11-19 13:52:53', '2021-11-19 13:52:53'),
(42, NULL, 50, 19, NULL, 90000, NULL, '2021-11-21 06:50:37', '2021-11-21 06:50:37'),
(43, NULL, 50, 5, NULL, 150000, NULL, '2021-11-28 16:01:58', '2021-11-28 16:01:58'),
(44, NULL, 50, 19, NULL, 20000, NULL, '2021-11-30 15:34:10', '2021-11-30 15:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `campaign_category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_desc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `risk` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goal` double DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `status` enum('waiting_list','accepted','rejected','canceled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `campaign_category_id`, `title`, `short_desc`, `long_desc`, `risk`, `goal`, `start`, `end`, `status`, `images`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 4, 9, 'Officia qui quia et dolorem.', 'Et adipisci enim rem molestiae omnis. Id sunt repellat repellendus quisquam dolorem. Sapiente itaque reprehenderit sed.', 'Cum aperiam perspiciatis dolorem dolorem in et. Natus et harum expedita odio molestias.', NULL, 262976, '2007-10-19 19:41:29', '2022-04-02 19:58:58', 'waiting_list', '[\"posts/post4-medium.jpg\", \"posts/post4-medium.jpg\"]', '2021-10-13 14:08:07', '2021-10-13 14:08:07', NULL),
(18, 5, 9, 'Commodi temporibus maiores pariatur.', 'Autem reiciendis nihil deleniti omnis optio dignissimos dignissimos. Vitae voluptas quia repellat. Dolores eum laudantium dolor quibusdam nam sapiente qui.', 'Velit explicabo qui nisi dolorem ut libero nisi maxime. Fugit perspiciatis modi deleniti.', NULL, 377636, '2009-08-05 06:35:48', '2022-09-07 17:13:35', 'waiting_list', '[\"posts/post2-medium.jpg\", \"posts/post1-medium.jpg\"]', '2021-10-13 14:08:07', '2021-10-13 14:08:07', NULL),
(19, 2, 7, 'Et ut pariatur.', 'Architecto nemo qui sed non nisi. Et doloremque molestiae molestiae id et. Velit consequatur porro doloribus voluptatibus eum. Doloremque voluptas voluptatem assumenda assumenda nemo blanditiis.', 'Velit eum voluptatem voluptas. Corrupti aperiam reiciendis delectus repellendus eum.', NULL, 350163, '1986-07-14 00:23:22', '2022-07-01 21:26:07', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-13 14:08:07', '2021-10-13 14:08:07', NULL),
(21, 4, 8, 'In ipsam rem quos.', 'Velit hic voluptatem illum aspernatur corrupti ut laudantium. Et sed atque ipsa delectus voluptatibus.', 'Voluptate corporis ad laborum ea. Voluptas rerum accusamus quidem dolore sit accusamus.', NULL, 77230, '2010-05-31 09:24:42', '2022-05-23 13:11:01', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post2-medium.jpg\"]', '2021-10-13 14:09:57', '2021-10-13 14:09:57', NULL),
(22, 6, 8, 'Numquam nulla ut est esse.', 'Iste consequatur et alias repudiandae cumque. Placeat architecto numquam qui molestiae nesciunt aut similique. Accusantium ex assumenda eum et accusantium.', 'Accusantium eos modi est quisquam aut. Sunt quidem excepturi numquam qui dolore hic non.', NULL, 291105, '1974-07-09 01:13:42', '2022-06-13 12:41:13', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post4-medium.jpg\"]', '2021-10-13 14:09:57', '2021-10-13 14:09:57', NULL),
(23, 6, 9, 'Ea omnis dolorum repudiandae reiciendis voluptas.', 'Commodi sequi cum quidem id ullam omnis. Cumque saepe ratione iusto ut sed minima aspernatur.', 'Aut at ipsam quasi voluptas totam quaerat repudiandae. Ea in doloremque sapiente assumenda.', NULL, 64343, '1972-05-20 16:41:32', '2022-08-13 12:33:40', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-13 14:09:57', '2021-10-13 14:09:57', NULL),
(24, 5, 8, 'In voluptatum velit odio.', 'Ratione magnam soluta vel fugiat fugiat. Amet deserunt sit rerum assumenda. Iusto doloremque accusamus libero aliquid assumenda aut delectus. Reprehenderit libero ad occaecati.', 'Et ea et hic id quia enim. Repellendus quidem saepe illo debitis minima dolorem suscipit qui.', NULL, 202677, '2015-04-01 14:35:42', '2022-02-28 13:52:04', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post4-medium.jpg\"]', '2021-10-13 14:09:57', '2021-10-13 14:09:57', NULL),
(25, 3, 8, 'Alias a recusandae qui ea corporis.', 'Temporibus officia et et adipisci. Recusandae est molestiae voluptatibus necessitatibus reprehenderit. Quis in ducimus beatae unde aliquid.', 'Maxime illum velit fugiat blanditiis. Alias iure repellat voluptate incidunt minima et enim.', NULL, 120769, '2010-10-05 10:27:25', '2022-04-21 16:22:08', 'waiting_list', '[\"posts/post2-medium.jpg\", \"posts/post1-medium.jpg\"]', '2021-10-13 14:09:57', '2021-10-13 14:09:57', NULL),
(27, 5, 7, 'Laboriosam provident fuga possimus.', 'Praesentium enim velit natus veritatis nemo qui doloremque. Impedit ea eius neque quis necessitatibus. Totam corrupti a quod blanditiis. Aut assumenda sapiente sunt earum et nesciunt nihil. Corrupti ex doloribus dolor dolor aut id.', 'Exercitationem eos enim illo illo quidem esse sint. Quos est voluptas et autem quae.', NULL, 454372, '1971-08-28 20:06:20', '2022-08-01 02:01:20', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post4-medium.jpg\"]', '2021-10-13 14:11:07', '2021-10-13 14:11:07', NULL),
(28, 2, 8, 'Consequuntur ipsa aut sit.', 'Praesentium ad repellendus consequatur ab eveniet impedit. Ut magni sed debitis enim. Dolorem reiciendis aut omnis reprehenderit neque labore explicabo. Non consequuntur aut aut est omnis similique. Mollitia commodi quasi ut laborum libero.', 'Fuga non fugiat ut dicta. Est cumque quia maxime molestiae autem.', NULL, 420551, '1998-08-24 22:46:12', '2022-06-26 12:18:17', 'waiting_list', '[\"posts/post2-medium.jpg\", \"posts/post1-medium.jpg\"]', '2021-10-13 14:11:07', '2021-10-13 14:11:07', NULL),
(29, 4, 9, 'Assumenda eveniet nostrum voluptatem ut.', 'Ratione ut ullam non illum. Ea enim est consequuntur voluptatem non magnam. Quasi rerum voluptatibus quis nihil eius odit. Aliquid sunt possimus ipsa modi.', 'In officiis autem aut eum nemo. Architecto tempora eos quos similique unde.', NULL, 253034, '2005-08-03 01:00:31', '2021-11-12 15:57:11', 'waiting_list', '[\"posts/post4-medium.jpg\", \"posts/post2-medium.jpg\"]', '2021-10-13 14:11:07', '2021-10-13 14:11:07', NULL),
(30, 4, 7, 'Ex rerum quia.', 'Inventore reprehenderit ab culpa eum quo rerum. Omnis et qui id et vitae ut excepturi. Illum sapiente voluptatem quisquam magni. Quo veniam nobis tempora ipsum dolor illo.', 'Quasi ex ut ut ab. At nihil assumenda officia est temporibus est. Velit sit nulla est.', NULL, 409382, '1984-11-04 15:06:50', '2021-12-12 19:09:36', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post1-medium.jpg\"]', '2021-10-13 14:11:07', '2021-10-13 14:11:07', NULL),
(31, 6, 8, 'Suscipit qui rerum.', 'Consequatur incidunt iusto unde dolore reiciendis. Cum quidem repellendus dignissimos fuga quae. Ut inventore dolorem laboriosam eaque voluptatem.', 'Non ut temporibus omnis et a atque et. Libero repellat magni neque. Dolore eos quis non.', NULL, 380433, '1976-11-26 20:53:45', '2022-08-21 15:46:39', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-13 14:11:07', '2021-10-13 14:11:07', NULL),
(32, 5, 7, 'Reprehenderit cupiditate quo sunt commodi.', 'Officia expedita suscipit illo excepturi impedit. Omnis dolorum aperiam vero perspiciatis. Suscipit id nobis doloribus veritatis debitis quibusdam quaerat. Et totam sequi alias maiores in ex.', 'Sed doloremque voluptate quaerat ut ea. Facilis ut repellendus quae.', NULL, 166970, '1970-10-25 22:12:27', '2022-04-28 22:12:07', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post2-medium.jpg\"]', '2021-10-13 14:11:07', '2021-10-13 14:11:07', NULL),
(33, 6, 7, 'Esse ex dolor.', 'Et dolores velit sunt numquam voluptatibus. Consectetur sit debitis nihil recusandae alias. Architecto ut vero nihil nulla ut non sit facere.', 'Eum doloremque harum et laudantium sit. Porro illo et omnis nihil omnis.', NULL, 159898, '1976-05-15 09:48:32', '2022-06-12 20:33:49', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-13 14:11:07', '2021-10-13 14:11:07', NULL),
(34, 2, 9, 'Maiores mollitia aspernatur eius.', 'Voluptate eum quod nulla quia dolorem mollitia fuga quasi.', 'Vel rerum illo aliquam nihil. Fugiat molestiae consequatur et illo.', NULL, 171288, '1995-01-09 12:27:34', '2022-04-10 11:34:35', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(35, 3, 8, 'Sint ut dolorem.', 'Vitae consequatur voluptas nulla deserunt eos vitae dolore magnam quasi earum consequatur qui est.', 'Sit repellendus sint facilis eum quis. Ea possimus architecto rerum non illum et excepturi.', NULL, 196960, '1974-03-29 19:48:38', '2022-04-04 21:36:50', 'waiting_list', '[\"posts/post2-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(36, 4, 9, 'Modi qui doloremque et.', 'Eaque autem aut rerum distinctio distinctio ullam dolor ex quos amet quia quia.', 'Non sint ex vitae qui veniam quis. Et quos at fugiat facilis eos fugiat. Est quo aperiam non et.', NULL, 75458, '1989-04-26 03:42:45', '2022-08-10 02:11:32', 'waiting_list', '[\"posts/post2-medium.jpg\", \"posts/post2-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(37, 6, 9, 'Voluptatibus ut minima in.', 'Natus nesciunt et sed voluptatem et consequatur recusandae.', 'Temporibus optio sit et distinctio sunt molestiae. Maiores quae aut autem ea quo optio.', NULL, 129224, '1999-12-17 22:23:22', '2022-09-13 19:27:50', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post1-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(38, 3, 9, 'Est quos aut.', 'Odio laborum rerum laudantium cumque expedita laboriosam excepturi in eum rerum eos dignissimos minima.', 'Quisquam aperiam tenetur quidem. Quia recusandae eum dolores consequatur deleniti tempore.', NULL, 375383, '2008-03-16 23:17:46', '2021-11-23 19:42:22', 'waiting_list', '[\"posts/post2-medium.jpg\", \"posts/post4-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(39, 6, 7, 'Temporibus nam et.', 'Unde deleniti aut labore ut architecto omnis est et vel qui rerum vel.', 'Corrupti quaerat occaecati dolorem et et quos. Sed voluptates deleniti voluptate.', NULL, 355065, '1993-01-25 22:39:38', '2021-12-02 23:00:44', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post2-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(40, 4, 9, 'Beatae vitae rerum illo est.', 'Veritatis dolor quia corrupti qui est officia vel nostrum earum nisi beatae corporis quisquam.', 'Eos vitae atque blanditiis id. Sed exercitationem quisquam rem quo qui molestiae sunt.', NULL, 232203, '1993-05-04 07:04:04', '2022-09-17 16:56:25', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post1-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(41, 6, 7, 'Exercitationem sed quidem.', 'Quam magni exercitationem nemo esse modi voluptas eum voluptate.', 'Minus fuga commodi est. Saepe consequuntur dicta nihil. Blanditiis eveniet sed a aut quaerat.', NULL, 288118, '2013-02-20 00:41:49', '2022-05-10 00:38:39', 'waiting_list', '[\"posts/post4-medium.jpg\", \"posts/post1-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(42, 2, 9, 'Repudiandae exercitationem dolore.', 'Sit iste consequuntur quia excepturi qui id reiciendis sit.', 'Aliquid et eum excepturi sed praesentium reiciendis. Expedita magnam sed illo ex nostrum.', NULL, 449108, '1987-03-08 18:23:42', '2022-05-25 07:26:52', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post2-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(43, 3, 9, 'Odio tempora harum porro.', 'Neque mollitia est id et quia natus et dolores.', 'Dolorum dolores sint vel corrupti fugiat eos. Et magni ipsa rerum et blanditiis enim reprehenderit.', NULL, 209712, '2019-08-09 17:21:15', '2022-03-17 19:46:39', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post2-medium.jpg\"]', '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(44, 4, 7, 'Officia voluptatem veniam veniam voluptas.', 'Deserunt minima molestias qui dolor libero consequuntur et velit ducimus ipsa officia.', 'Quos ducimus dolores inventore soluta aliquam. Architecto ut voluptas deleniti iure aliquam.', 'Expedita fuga a et repudiandae. Tenetur omnis perspiciatis nam facere.', 380282, '1979-11-24 17:17:10', '2022-06-11 03:35:00', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post4-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(45, 4, 8, 'Laborum quidem.', 'Modi nulla quod consequatur est alias non.', 'Sunt aut dolores ullam saepe aut ea. Reprehenderit illum doloribus animi.', 'Aut pariatur ullam itaque. Incidunt assumenda ut iste blanditiis.', 450000, '1985-12-26 00:25:18', '2022-05-21 02:22:09', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(46, 5, 8, 'Inventore qui quidem.', 'Non laborum accusamus est consequatur aperiam nostrum vero odio architecto.', 'Laborum et non aperiam labore dolores. Totam animi quia illo repellendus at nobis unde.', 'Et quia ab ad harum accusantium ex. Unde unde voluptatem reprehenderit optio natus quasi enim.', 352909, '2007-06-07 20:37:14', '2022-01-27 14:45:07', 'waiting_list', '[\"posts/post4-medium.jpg\", \"posts/post4-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(47, 6, 9, 'Dicta ut quis qui reprehenderit.', 'Voluptatem non totam quisquam qui occaecati rerum sit ducimus quasi.', 'Natus sint sed et sit cum. Nesciunt consequuntur velit est fugit numquam.', 'Quaerat quia omnis voluptas eos tempora. Et sunt numquam veniam aut magni.', 428593, '2021-08-09 13:35:55', '2021-11-02 21:14:49', 'waiting_list', '[\"posts/post2-medium.jpg\", \"posts/post4-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(48, 6, 8, 'Saepe id enim tenetur.', 'Neque velit minima omnis omnis ducimus eos explicabo alias et enim itaque.', 'Impedit architecto cupiditate ab non. Minima et est sit non nemo.', 'Et rerum nostrum beatae totam. Non et blanditiis eos unde dignissimos.', 157361, '1992-03-02 04:05:49', '2022-01-02 01:03:37', 'waiting_list', '[\"posts/post2-medium.jpg\", \"posts/post2-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(49, 4, 9, 'Magni eos aut iure perferendis.', 'Facilis nostrum voluptatem et sit ipsa non dolore error.', 'Vel exercitationem et dolorem. Voluptates maiores ab modi saepe non.', 'Similique suscipit labore quam dignissimos itaque molestiae. Ipsam dolor quasi qui iste laudantium.', 385004, '2001-07-04 16:09:24', '2022-05-11 21:31:04', 'waiting_list', '[\"posts/post4-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(50, 6, 8, 'Commodi animi fugit corporis.', 'Dolorem sed quibusdam et qui libero voluptas in praesentium ut dolores temporibus sapiente porro vitae.', 'Autem cupiditate recusandae vitae beatae. Aut et quas similique ipsa autem rem eligendi quaerat.', 'Tempora nostrum fuga sed numquam. Eveniet magni dolores et praesentium necessitatibus molestias ad.', 1000000, '2004-12-13 04:30:19', '2022-02-23 13:58:05', 'waiting_list', '[\"posts/post2-medium.jpg\", \"posts/post1-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(51, 6, 9, 'Ad quidem nostrum soluta.', 'Repudiandae dignissimos facere quo fuga minima et explicabo corporis.', 'A perspiciatis totam commodi mollitia. Ea voluptate nam minus autem magnam ratione ut.', 'Aut quia et rerum a neque sunt odio. Placeat sint aspernatur mollitia inventore.', 77778, '1997-12-14 06:24:20', '2022-01-09 10:14:27', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(52, 2, 9, 'Voluptatibus deserunt et asperiores.', 'Dignissimos ut et minus animi aliquam ut et quas deserunt consequatur non ratione eum.', 'Ipsa et magni aliquid. Tempore inventore eum sed. Et sit aliquid consequatur quaerat odio.', 'Nihil ducimus sunt quasi magnam. Porro provident perferendis maxime sit iusto quia aut esse.', 247954, '1989-09-22 21:49:06', '2022-09-06 07:11:29', 'waiting_list', '[\"posts/post1-medium.jpg\", \"posts/post1-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(53, 5, 9, 'Eveniet incidunt ut.', 'Et excepturi hic incidunt et voluptatem eaque aperiam et hic autem quia.', 'Nesciunt accusantium molestias et ea. Eos eos aut sit voluptatem quasi.', 'Est qui quo eveniet dolorum. Enim sunt veniam consequatur qui. Dolores minus voluptatem vitae eos.', 80758, '1998-10-06 19:29:53', '2022-06-24 19:56:16', 'waiting_list', '[\"posts/post3-medium.jpg\", \"posts/post3-medium.jpg\"]', '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_categories`
--

CREATE TABLE `campaign_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_categories`
--

INSERT INTO `campaign_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(7, 'technology', NULL, '2021-10-13 01:56:18', '2021-10-13 01:56:18'),
(8, 'game', NULL, '2021-10-13 01:56:18', '2021-10-13 01:56:18'),
(9, 'art', NULL, '2021-10-13 01:56:18', '2021-10-13 01:56:18');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_comments`
--

CREATE TABLE `campaign_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `campaign_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_comments`
--

INSERT INTO `campaign_comments` (`id`, `parent_id`, `campaign_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, NULL, 52, 6, 'Expedita sint aut ut numquam fuga tenetur accusantium molestiae veniam aliquid ducimus ut voluptas.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(2, NULL, 45, 4, 'Natus veniam voluptatum ad recusandae quo repellat sapiente velit qui et autem et dolores.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(3, NULL, 52, 5, 'Voluptatibus eaque maxime fugiat perferendis consequuntur nulla adipisci.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(4, NULL, 49, 5, 'Praesentium voluptatum sed quaerat vel et voluptatem.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(5, NULL, 49, 4, 'Qui assumenda omnis deserunt aut cupiditate adipisci similique.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(6, NULL, 47, 6, 'Optio voluptatibus ut ad quia non dolore qui qui amet qui.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(7, NULL, 48, 3, 'Amet cumque reprehenderit ut sit qui voluptatem.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(8, NULL, 50, 6, 'Veritatis ipsa cupiditate magni quia nam nemo.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(9, NULL, 50, 4, 'Quod minima sint quidem et quisquam fuga.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(10, NULL, 44, 5, 'Illo et reiciendis nulla quae et nostrum.', '2021-10-20 23:39:43', '2021-10-20 23:39:43'),
(11, 2, 53, 5, 'Expedita iusto ea et perferendis aliquid omnis aliquid eum qui voluptatem enim earum.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(12, 1, 44, 6, 'Quas quibusdam ad possimus distinctio quia officia.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(13, 9, 50, 2, 'Aut est aliquid qui voluptas nesciunt omnis.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(14, 7, 51, 4, 'In quo numquam et architecto facilis quae et iste dicta.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(15, 4, 46, 4, 'Sunt et maiores asperiores eaque consequatur magnam.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(16, 10, 44, 3, 'Non eligendi nesciunt porro rerum enim atque maxime natus adipisci id inventore.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(17, 2, 45, 5, 'Sed velit sint neque voluptatem earum laudantium ipsam.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(18, 6, 44, 3, 'Beatae qui aspernatur inventore impedit culpa et harum et tenetur.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(19, 9, 46, 5, 'Ut quibusdam quo dolores eaque aspernatur illum.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(20, 7, 47, 5, 'Assumenda doloribus voluptatem et delectus accusamus ut doloremque eum.', '2021-10-20 23:40:31', '2021-10-20 23:40:31'),
(21, NULL, 45, NULL, 'Saya suka dengan inovasi ini teruskan dan saya akan mendukung', '2021-10-21 04:13:12', '2021-10-21 04:13:12'),
(22, 21, 45, NULL, 'Saya Sepakat dengan anda, saya pasti mendukung selalu', '2021-10-21 04:14:31', '2021-10-21 04:14:31'),
(23, 21, 45, NULL, 'ganti lagi komentar-komentar saya sumbang 100 jt untuk ide kalian. semoga sukses dan laris manis', '2021-10-21 04:15:24', '2021-10-21 04:22:47'),
(24, NULL, 45, NULL, 'Inovasi masa kini yang akan membantu perkerjaan kita dalam mengelola lahan pertanian. Teruskan kawan kawan, saya mendukung', '2021-10-21 04:17:10', '2021-10-21 04:17:10'),
(25, NULL, 45, NULL, 'Inovasi masa kini yang akan membantu perkerjaan kita dalam mengelola lahan pertanian. Teruskan kawan kawan, saya mendukung', '2021-11-12 09:24:15', '2021-11-12 09:24:15'),
(26, NULL, 50, NULL, 'test', '2021-11-12 09:37:27', '2021-11-12 09:37:27'),
(27, NULL, 50, NULL, 'tes lagi', '2021-11-12 09:43:29', '2021-11-12 09:43:29'),
(28, NULL, 50, NULL, 'tes lago 2', '2021-11-12 09:44:28', '2021-11-12 09:44:28'),
(29, NULL, 50, NULL, 'bagus sekali, mantab jiwa..', '2021-11-12 12:59:11', '2021-11-12 12:59:11'),
(30, NULL, 17, NULL, 'hai', '2021-11-15 09:05:34', '2021-11-15 09:05:34'),
(31, NULL, 17, NULL, 'hai', '2021-11-15 09:05:34', '2021-11-15 09:05:34'),
(32, NULL, 17, NULL, 'hai', '2021-11-15 09:05:34', '2021-11-15 09:05:34'),
(33, NULL, 17, NULL, 'hai', '2021-11-15 09:05:34', '2021-11-15 09:05:34'),
(34, NULL, 17, NULL, 'hai', '2021-11-15 09:05:35', '2021-11-15 09:05:35'),
(35, NULL, 17, NULL, 'hai', '2021-11-15 09:05:35', '2021-11-15 09:05:35'),
(36, NULL, 17, NULL, 'hai', '2021-11-15 09:05:35', '2021-11-15 09:05:35'),
(37, NULL, 17, NULL, 'hai', '2021-11-15 09:05:35', '2021-11-15 09:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-09-22 20:58:06', '2021-09-22 20:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, NULL, 12),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(23, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(24, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(25, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(26, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(27, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(28, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(30, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(31, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(32, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(33, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(34, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(35, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(36, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(37, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(38, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(39, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(40, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(41, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(42, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(43, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(44, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(45, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(46, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(47, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(48, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(49, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(50, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(51, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(52, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(53, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(54, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(55, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-09-22 20:58:06', '2021-09-22 20:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED NOT NULL,
  `user_question_id` int(10) UNSIGNED DEFAULT NULL,
  `user_answer_id` int(10) UNSIGNED DEFAULT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `campaign_id`, `user_question_id`, `user_answer_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(3, 47, 6, 2, 'Dolor rerum non vero.?', 'Et nisi praesentium ullam voluptatibus delectus voluptas sapiente necessitatibus nihil.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(4, 44, 3, 4, 'Doloribus eos accusantium hic repellendus ipsa aliquam.?', 'Assumenda et quis quibusdam aspernatur ea quae totam necessitatibus at corrupti fuga perferendis.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(5, 47, 4, 3, 'Non eius voluptas impedit sit.?', 'Tenetur velit ad molestiae commodi eius eos delectus.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(6, 48, 2, 2, 'Provident nemo totam harum accusamus eaque deserunt.?', 'Alias nobis ullam aut amet libero consequatur.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(7, 52, 3, 2, 'Aut et non praesentium suscipit a voluptate.?', 'Dolores impedit vel itaque non placeat quas non assumenda.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(8, 46, 2, 6, 'Labore voluptatem facere repellendus quia voluptas earum.?', 'Consequatur consectetur repudiandae quas exercitationem est quaerat excepturi vel debitis magni.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(9, 47, 3, 3, 'Itaque nemo ea nemo et exercitationem.?', 'Eius ut officia aut quisquam nam id nobis libero omnis qui quae iste.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(10, 45, 3, 4, 'Consequatur ipsa inventore perferendis qui sint.?', 'Et accusantium soluta error quia nam commodi consectetur magni ratione ea.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(11, 52, 4, 5, 'Qui est quia qui ut.?', 'Minima suscipit sit doloremque nulla dignissimos laboriosam perspiciatis.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(12, 45, 4, 3, 'Magnam maxime nihil eveniet laudantium enim.?', 'Accusantium facere ipsam recusandae et consequatur aperiam dolores.', '2021-10-16 23:59:49', '2021-10-16 23:59:49'),
(13, 47, 5, 5, 'Apakah saya nanti juga akan dapat bagi hasil bila berkontribusi di program ini?', 'Pasti anda akan mendapat bagi hasil berupa prosentase dari keuntungan.', '2021-10-17 00:07:07', '2021-10-17 00:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-09-22 20:58:05', '2021-09-22 20:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-09-22 20:58:05', '2021-09-22 20:58:05', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-09-22 20:58:06', '2021-09-22 20:58:06', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-09-22 20:58:06', '2021-09-22 20:58:06', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-09-22 20:58:06', '2021-09-22 20:58:06', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-09-22 20:58:06', '2021-09-22 20:58:06', 'voyager.hooks', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(9, '2016_06_01_000004_create_oauth_clients_table', 1),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(11, '2016_10_21_190000_create_roles_table', 1),
(12, '2016_10_21_190000_create_settings_table', 1),
(13, '2016_11_30_135954_create_permission_table', 1),
(14, '2016_11_30_141208_create_permission_role_table', 1),
(15, '2016_12_26_201236_data_types__add__server_side', 1),
(16, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(17, '2017_01_14_005015_create_translations_table', 1),
(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(20, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(21, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(22, '2017_08_05_000000_add_group_to_settings_table', 1),
(23, '2017_11_26_013050_add_user_role_relationship', 1),
(24, '2017_11_26_015000_create_user_roles_table', 1),
(25, '2018_03_11_000000_add_user_settings', 1),
(26, '2018_03_14_000000_add_details_to_data_types_table', 1),
(27, '2018_03_16_000000_make_settings_value_nullable', 1),
(28, '2016_01_01_000000_create_pages_table', 2),
(29, '2016_01_01_000000_create_posts_table', 2),
(30, '2016_02_15_204651_create_categories_table', 2),
(31, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(37, '2021_09_27_101213_add_phone_to_users_table', 3),
(39, '2021_10_04_114823_create_campaign_categories_table', 4),
(40, '2021_10_13_091307_create_campaigns_table', 5),
(41, '2021_10_14_165830_create_faqs_table', 6),
(42, '2021_10_17_072620_create_rewards_table', 7),
(43, '2021_10_19_164107_create_updates_table', 8),
(45, '2021_10_21_062225_create_campaign_comments_table', 9),
(46, '2021_10_26_070304_create_backer_users_table', 10),
(48, '2021_10_27_142924_create_payments_table', 11),
(49, '2021_11_10_091112_create_wallets_table', 12),
(50, '2021_11_10_091143_create_wallet_histories_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0a4f2f97177f14cc3caa77917accb9cb99d523e9f597d69ea23f75471566ffb0f0da4a29b0c867d6', 2, 1, 'nApp', '[]', 0, '2021-09-30 09:55:56', '2021-09-30 09:55:56', '2022-09-30 16:55:56'),
('0ea9e12abc1b25e4f8a4da2268379c33920e37ec1354dfd14a7d2a8256a49585d04fce8dadaccd04', 19, 1, 'nApp', '[]', 0, '2021-11-30 16:05:06', '2021-11-30 16:05:06', '2022-11-30 23:05:06'),
('1af2e3edc6ed2c3c42e686818cc6339615f1fdf018fe267712af691095e37704165e175892a3efdf', 5, 1, 'nApp', '[]', 0, '2021-10-13 02:01:59', '2021-10-13 02:01:59', '2022-10-13 09:01:59'),
('1b32136723e61046e9a0916404a72413fe454adc210bb80887dfe7e293e682a399e2cc491d312294', 5, 1, 'nApp', '[]', 0, '2021-10-18 22:24:31', '2021-10-18 22:24:31', '2022-10-19 05:24:31'),
('1ef5f4e35c4505060bb717f702ed8814696da3dfbd1d9b9a75bb4d20878313270ea2e311a9b656ea', 19, 1, 'nApp', '[]', 0, '2021-11-21 08:56:27', '2021-11-21 08:56:27', '2022-11-21 15:56:27'),
('22692adffbeb709304b39229873df4cf9c160039dfdefc7261295bdce8a0bfbed3186a0508f6f25b', 19, 1, 'nApp', '[]', 0, '2021-12-11 05:37:34', '2021-12-11 05:37:34', '2022-12-11 12:37:34'),
('30fa0794a985f469c162964600af9c9ff3139ed791e7bd41ff6d14ec5c2b8b6bdc2f3c978248f4b2', 5, 1, 'nApp', '[]', 0, '2021-11-28 15:59:50', '2021-11-28 15:59:50', '2022-11-28 22:59:50'),
('3ca469d73aeb08ea6c55b219a71890ca0b8ac6bb1ff02e66b9bd07470aa5ff8e9f7bf7649d79dba5', 19, 1, 'nApp', '[]', 0, '2021-11-19 09:11:07', '2021-11-19 09:11:07', '2022-11-19 16:11:07'),
('3e575fe4db20ec0fdac59024220e5037f49bbea1a1a23ea540de97ac3b4f2cce8e6bac7fad22fe32', 19, 1, 'nApp', '[]', 0, '2021-11-08 09:13:28', '2021-11-08 09:13:28', '2022-11-08 16:13:28'),
('413aa7683c25c4d629f0ae6171cef99c6b4d4cbdb29027aae4d021e9c162e7b682f75259b1378b47', 5, 1, 'nApp', '[]', 0, '2022-02-28 12:54:54', '2022-02-28 12:54:54', '2023-02-28 19:54:54'),
('42b506944b97012b3232e371db18ce1c1d3a820ab7f81043b6e5d31e638e54d3a49956150c88a261', 19, 1, 'nApp', '[]', 0, '2021-11-09 04:43:40', '2021-11-09 04:43:40', '2022-11-09 11:43:40'),
('51f92418d26ef78e7a42a13910e3748dcadf514ac42df43b95260f8e5347c190cb9508c75f263a41', 5, 1, 'nApp', '[]', 0, '2021-10-26 15:17:55', '2021-10-26 15:17:55', '2022-10-26 22:17:55'),
('5490ace050f1c5a8e7435485da0684b9c5ef35504b9c1f8b8753c90b43dc81fad6016864318fec0c', 5, 1, 'nApp', '[]', 0, '2021-10-17 00:02:41', '2021-10-17 00:02:41', '2022-10-17 07:02:41'),
('599f5b62e3ebf4ac90ac18d245bda31aad045d048148805f5cc4533b4dcdd3dafe7f4e2af2c63070', 19, 1, 'nApp', '[]', 0, '2021-11-21 08:18:15', '2021-11-21 08:18:15', '2022-11-21 15:18:15'),
('5bdf397e7af2dc9fe4b7a5798451d818edef41d63007a84f229de673d32fe87e929b7d84a505c2a3', 5, 1, 'nApp', '[]', 0, '2021-10-13 01:56:42', '2021-10-13 01:56:42', '2022-10-13 08:56:42'),
('62ede33f27c36ff72540ba224e40307e2178763836347da760ec57c68e163056ac55ee2951c3ec22', 2, 2, NULL, '[]', 0, '2021-09-29 23:25:12', '2021-09-29 23:25:12', '2022-09-30 06:25:12'),
('6a9617f23b9f85d49b58ac27a6281ffb326f3f26d89931ac2c1aa0b55ee9c7cac286965f79c0c80b', 6, 1, 'nApp', '[]', 0, '2021-10-01 06:54:06', '2021-10-01 06:54:06', '2022-10-01 13:54:06'),
('6fc37ba761076c16fe77b986f7b146f0c1e065cfb25192d368fc62fbcae3edd376427c39dbaaad74', 5, 1, 'nApp', '[]', 0, '2021-11-19 00:14:57', '2021-11-19 00:14:57', '2022-11-19 07:14:57'),
('72adc83b9ca1a44f2fe62c36b484ce5cdefed0f32244622bd456113193d9d24b81c427c8e8a27c18', 5, 1, 'nApp', '[]', 0, '2021-10-12 23:44:38', '2021-10-12 23:44:38', '2022-10-13 06:44:38'),
('7830dd53ec80ddb6429c0fb253c9adbc01fb53695d9e8931e0101490e5ae6259be6b8b9b6280d0b2', 5, 1, 'nApp', '[]', 0, '2021-11-18 10:04:57', '2021-11-18 10:04:57', '2022-11-18 17:04:57'),
('79aa2094dc295673dbee0abc0d47b92cbdf94a26c9e8d5c7f5cf13fdce0e214240c0efbe75c41fba', 19, 1, 'nApp', '[]', 0, '2021-11-30 14:20:26', '2021-11-30 14:20:26', '2022-11-30 21:20:26'),
('7a27fde672c73088da86ab739f35fafe608cf97f1725e60813a7e4e130a8e2fd174611efbb5e0efc', 2, 1, NULL, '[]', 0, '2021-09-29 22:54:22', '2021-09-29 22:54:22', '2022-09-30 05:54:22'),
('8ca1991b3b5ae46c64fa6cae485f726629afea41ade926c911b6e1c72296326244a9e337e4436ae4', 5, 1, 'nApp', '[]', 0, '2021-11-20 00:12:35', '2021-11-20 00:12:35', '2022-11-20 07:12:35'),
('92d042e40ce1d6657535c203b2daeae1d7cf4246be0c4969d4f980941f6ba3708cdca32b2beb9dfc', 5, 1, 'nApp', '[]', 0, '2021-11-11 07:46:27', '2021-11-11 07:46:27', '2022-11-11 14:46:27'),
('94a908d12143ea5483dfe9f018837dc96fa912e37ad5ee25b6b86f18ff20f70822fc9f717ef358c9', 19, 1, 'nApp', '[]', 0, '2021-11-21 05:37:15', '2021-11-21 05:37:15', '2022-11-21 12:37:15'),
('94da5849917361065b47824fc809257ca54fb8206b3abebe5089a87bd52530c21fb12ef84b9604f4', 6, 1, 'nApp', '[]', 0, '2021-10-01 06:50:11', '2021-10-01 06:50:11', '2022-10-01 13:50:11'),
('98e8f3d8bab15359597898fa1cd7649d90de7b8329a385e7d7bd567dcec72b06dae1ae5def396b4a', 19, 1, 'nApp', '[]', 0, '2021-11-30 11:28:48', '2021-11-30 11:28:48', '2022-11-30 18:28:48'),
('9ca332964a02d89e6fda717be1ac9864faca32e7a49aa42e90d51f68848d2154f0759c0f3b467c05', 19, 1, 'nApp', '[]', 0, '2021-11-15 09:04:43', '2021-11-15 09:04:43', '2022-11-15 16:04:43'),
('a3ae200123187b531007e1535daeae523a9d1ed656c715f629e66a1b5e2ba2262ed2332cf7f3d5fe', 5, 1, 'nApp', '[]', 0, '2021-11-11 08:01:23', '2021-11-11 08:01:23', '2022-11-11 15:01:23'),
('ac8c11d12a009e9ce3a458968203b43c009e3b51c9862b68124f42a77856958a0d706286930810f4', 5, 1, 'nApp', '[]', 0, '2021-10-25 14:07:48', '2021-10-25 14:07:48', '2022-10-25 21:07:48'),
('b10db215a4821b33fb69b1d4ec60d718bd4caf56d0fe51c8cb647c652f241ef27b2e0f5cbfdccddd', 2, 1, 'nApp', '[]', 0, '2021-09-29 22:57:08', '2021-09-29 22:57:08', '2022-09-30 05:57:08'),
('b66a9205da4cd6143c1d38f9ea3e4baa4d22a4457a87eabc9e58b11f757a2b0a84ea0f16963a73f1', 7, 1, 'nApp', '[]', 0, '2021-10-04 04:36:05', '2021-10-04 04:36:05', '2022-10-04 11:36:05'),
('b951c4b891d9f2e760e59476a7e97e109b28dd854bc8bf85139fc5c6aff54391a21fae0bb0ec6226', 5, 1, 'nApp', '[]', 0, '2021-11-14 15:56:24', '2021-11-14 15:56:24', '2022-11-14 22:56:24'),
('ba0afd34362651d31a651c4f7e00b73420574cd02131bd6768dc124d9c2fd93cedaeb087c898957a', 2, 1, 'nApp', '[]', 0, '2021-09-30 00:50:04', '2021-09-30 00:50:04', '2022-09-30 07:50:04'),
('bd3ed801ed22882c928e66add30d51b2028dcc12c519c04c59415c9ffba4aa9afb4e1200abf29282', 5, 1, 'nApp', '[]', 0, '2021-10-19 10:04:57', '2021-10-19 10:04:57', '2022-10-19 17:04:57'),
('c021df553e6840e3d6c4c58552f1e9ab0a08c3673f01140e755dec674bdfef677f15dddf709da84f', 2, 1, 'nApp', '[]', 0, '2021-10-14 12:50:26', '2021-10-14 12:50:26', '2022-10-14 19:50:26'),
('c15e3fefadc1a55fc33b1109f917f70e9daa70851d4ce1f2b0aa31417cb35cc6733773ff7d1588a8', 19, 1, 'nApp', '[]', 0, '2021-12-01 05:00:36', '2021-12-01 05:00:36', '2022-12-01 12:00:36'),
('c89ea0822bf4a95fe74fb486957045102f87fba960d0e2b9a7a41d778bac7b08bd50c8e7d55e9be7', 19, 1, 'nApp', '[]', 0, '2021-11-30 14:25:34', '2021-11-30 14:25:34', '2022-11-30 21:25:34'),
('ce6a2247151ef419473dc0d1e2ba5af9f6f2d62c273b449aa49c680ace23f63aea9c575c434500e3', 5, 1, 'nApp', '[]', 0, '2021-10-25 13:50:43', '2021-10-25 13:50:43', '2022-10-25 20:50:43'),
('d02ede39e9b6b96cf8bb0ffad229f769fa30e786ec6f54516344a4e13cb0d4c6bc7e17b3d0602c86', 5, 1, 'nApp', '[]', 0, '2021-09-30 09:52:30', '2021-09-30 09:52:30', '2022-09-30 16:52:30'),
('d17acbe752697bda53d2c51879b3cbead9e42d77bb335884289064cdbe5b2088a388508a9ef95bf0', 7, 1, 'nApp', '[]', 0, '2021-10-13 02:03:22', '2021-10-13 02:03:22', '2022-10-13 09:03:22'),
('d3127823e2c7fee1f8774f48f6c242ccf6a8b24b5804bef94ce5d97316461b58e8052aa59e0c3c7f', 5, 1, 'nApp', '[]', 0, '2021-10-13 04:15:46', '2021-10-13 04:15:46', '2022-10-13 11:15:46'),
('d496473b85d5cbbb566ddf3ad7bd5d4b4198e673f8fd2ffe71f76023da805b12f7d3d479a0854a81', 5, 1, 'nApp', '[]', 0, '2021-09-30 01:00:05', '2021-09-30 01:00:05', '2022-09-30 08:00:05'),
('d8a4382befc1e86a9caf68a217ba7b035238ee664746987a31933789dba81744c35572c90225ef27', 2, 1, 'nApp', '[]', 0, '2021-10-14 09:47:22', '2021-10-14 09:47:22', '2022-10-14 16:47:22'),
('db6d861cbeab53843daa3bca73b8cdcd8b1ac7c4247b0306b986baa8be82b67b774ea26e00790046', 19, 1, 'nApp', '[]', 0, '2021-11-30 16:07:30', '2021-11-30 16:07:30', '2022-11-30 23:07:30'),
('e51469fc9c94d08fe50894005b3e26d12f933c1a548b533def198b772e7ab7aae27419d189970ce8', 2, 1, 'nApp', '[]', 0, '2021-09-29 23:05:21', '2021-09-29 23:05:21', '2022-09-30 06:05:21'),
('e575195b9d4056256c69d6cfa7bf2f59d1b78602c30248dda9d2be8ef68b21faf57602df6bd46501', 19, 1, 'nApp', '[]', 0, '2021-11-12 11:04:15', '2021-11-12 11:04:15', '2022-11-12 18:04:15'),
('e96f3b37d073823d71eb8c9063654acd94a063e33adca4df8395c648fbb384154b847cccdad7e07e', 5, 1, 'nApp', '[]', 0, '2021-10-26 15:19:03', '2021-10-26 15:19:03', '2022-10-26 22:19:03'),
('ebf14cecbf59fa40765a344ce3942eab607780607cc677257d8ec814decd72649a7276352f9cd4b6', 5, 1, 'nApp', '[]', 0, '2021-10-12 23:42:31', '2021-10-12 23:42:31', '2022-10-13 06:42:31'),
('f61a9a6f8d318904a2861ca6de21201f4df43ff5a6b0579bec6634337ef759e075967d08be59d8c2', 5, 1, 'nApp', '[]', 0, '2021-11-15 03:30:19', '2021-11-15 03:30:19', '2022-11-15 10:30:19'),
('f7677dd7889fbe2698aa95912f8a0df2311a72ec5a95f0f7a36a65eb46dc4716295878c940336da7', 6, 1, 'nApp', '[]', 0, '2021-10-01 06:55:23', '2021-10-01 06:55:23', '2022-10-01 13:55:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Kreatora Personal Access Client', 'FiWGb2SYqPVAx4KISwZddyeoHQPJ507Ch90hD32T', 'http://localhost', 1, 0, 0, '2021-09-29 19:35:56', '2021-09-29 19:35:56'),
(2, NULL, 'Kreatora Password Grant Client', 'Cnk1PTwan5ExLt2sD8GmewgaMCii1uijLo7iZTv7', 'http://localhost', 0, 1, 0, '2021-09-29 19:35:56', '2021-09-29 19:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-09-29 19:35:56', '2021-09-29 19:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('34c3b94666c3d10f3807493319131c2d4b105e5f641c6db948818751dfa33928f05302eb8cde949d', '62ede33f27c36ff72540ba224e40307e2178763836347da760ec57c68e163056ac55ee2951c3ec22', 0, '2022-09-30 06:25:12');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-09-22 20:58:06', '2021-09-22 20:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `backer_user_id` int(10) UNSIGNED DEFAULT NULL,
  `owner_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `transaction_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `backer_user_id`, `owner_id`, `external_id`, `name`, `account_number`, `bank_code`, `amount`, `channel`, `status`, `noted`, `expiration_date`, `transaction_time`, `created_at`, `updated_at`) VALUES
(1, 10, '61780ef88225fb52ee44fdbc', '61791380d30efva10', 'beny', '889089999099080', 'MANDIRI', 200000, 'virtual_account', 'PENDING', NULL, '2021-10-28 01:53:20', NULL, '2021-10-27 08:53:22', '2021-10-27 08:53:22'),
(2, 12, '61780ef88225fb52ee44fdbc', '617aaac856981va12', 'XDT-beny', '8808999958047308', 'BNI', 250000, 'virtual_account', 'PENDING', NULL, '2021-10-29 06:51:04', NULL, '2021-10-28 13:51:06', '2021-10-28 13:51:06'),
(3, 13, '61780ef88225fb52ee44fdbc', '619131beb3035va13', 'beny', '889089999875484', 'MANDIRI', 150000, 'virtual_account', 'PENDING', NULL, '2021-11-15 08:56:46', NULL, '2021-11-14 15:56:48', '2021-11-14 15:56:48'),
(4, 14, '61780ef88225fb52ee44fdbc', '6191d4a43b402va14', 'beny', '889089999038307', 'MANDIRI', 150000, 'virtual_account', 'PENDING', NULL, '2021-11-15 20:31:48', NULL, '2021-11-15 03:31:50', '2021-11-15 03:31:50'),
(5, 15, '61780ef88225fb52ee44fdbc', '61920cbcd1705va15', 'sidex', '107669999157832', 'BCA', 30000, 'virtual_account', 'PENDING', NULL, '2021-11-16 00:31:08', NULL, '2021-11-15 07:31:09', '2021-11-15 07:31:09'),
(6, 16, '61780ef88225fb52ee44fdbc', '61920d48607b1va16', 'beny', '889089999917648', 'MANDIRI', 150000, 'virtual_account', 'PENDING', NULL, '2021-11-16 00:33:28', NULL, '2021-11-15 07:33:29', '2021-11-15 07:33:29'),
(7, 17, '61780ef88225fb52ee44fdbc', '61920f06f3cc9va17', 'sidex', '107669999614009', 'BCA', 30000, 'virtual_account', 'PENDING', NULL, '2021-11-16 00:40:54', NULL, '2021-11-15 07:40:56', '2021-11-15 07:40:56'),
(8, 18, '61780ef88225fb52ee44fdbc', '61921c5985e0dva18', 'XDT-sidex', '8808999916822430', 'BNI', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 01:37:45', NULL, '2021-11-15 08:37:47', '2021-11-15 08:37:47'),
(9, 19, '61780ef88225fb52ee44fdbc', '61921e234020bva19', 'sidex', '107669999792061', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 01:45:23', NULL, '2021-11-15 08:45:24', '2021-11-15 08:45:24'),
(10, 20, '61780ef88225fb52ee44fdbc', '61921e2482062va20', 'sidex', '107669999491491', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 01:45:24', NULL, '2021-11-15 08:45:25', '2021-11-15 08:45:25'),
(11, 21, '61780ef88225fb52ee44fdbc', '619223c463cdbva21', 'sidex', '107669999444159', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:24', NULL, '2021-11-15 09:09:25', '2021-11-15 09:09:25'),
(12, 22, '61780ef88225fb52ee44fdbc', '619223c4ebf78va22', 'sidex', '107669999518432', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:24', NULL, '2021-11-15 09:09:25', '2021-11-15 09:09:25'),
(13, 23, '61780ef88225fb52ee44fdbc', '619223d66ac3eva23', 'sidex', '107669999390642', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:42', NULL, '2021-11-15 09:09:43', '2021-11-15 09:09:43'),
(14, 24, '61780ef88225fb52ee44fdbc', '619223d744e99va24', 'sidex', '107669999016410', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:43', NULL, '2021-11-15 09:09:44', '2021-11-15 09:09:44'),
(15, 25, '61780ef88225fb52ee44fdbc', '619223d78cab0va25', 'sidex', '107669999629448', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:43', NULL, '2021-11-15 09:09:44', '2021-11-15 09:09:44'),
(16, 26, '61780ef88225fb52ee44fdbc', '619223d7a2650va26', 'sidex', '107669999663327', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:43', NULL, '2021-11-15 09:09:44', '2021-11-15 09:09:44'),
(17, 27, '61780ef88225fb52ee44fdbc', '619223d832662va27', 'sidex', '107669999026159', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:44', NULL, '2021-11-15 09:09:45', '2021-11-15 09:09:45'),
(18, 28, '61780ef88225fb52ee44fdbc', '61922400f40d5va28', 'sidex', '107669999088116', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:24', NULL, '2021-11-15 09:10:26', '2021-11-15 09:10:26'),
(19, 29, '61780ef88225fb52ee44fdbc', '6192240187efava29', 'sidex', '107669999051597', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:25', NULL, '2021-11-15 09:10:26', '2021-11-15 09:10:26'),
(20, 30, '61780ef88225fb52ee44fdbc', '61922401b3d8bva30', 'sidex', '107669999772521', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:25', NULL, '2021-11-15 09:10:26', '2021-11-15 09:10:26'),
(21, 31, '61780ef88225fb52ee44fdbc', '61922401d498bva31', 'sidex', '107669999502993', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:25', NULL, '2021-11-15 09:10:26', '2021-11-15 09:10:26'),
(22, 32, '61780ef88225fb52ee44fdbc', '619224020d5b3va32', 'sidex', '107669999793501', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:26', NULL, '2021-11-15 09:10:27', '2021-11-15 09:10:27'),
(23, 33, '61780ef88225fb52ee44fdbc', '61922725407b5va33', 'sidex', '107669999022272', 'BCA', 90000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:23:49', NULL, '2021-11-15 09:23:50', '2021-11-15 09:23:50'),
(24, 34, '61780ef88225fb52ee44fdbc', '619395f92fa1cva34', 'sidex', '107669999317300', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:28:57', NULL, '2021-11-16 11:28:58', '2021-11-16 11:28:58'),
(25, 35, '61780ef88225fb52ee44fdbc', '619395fb3605fva35', 'sidex', '107669999439958', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:28:59', NULL, '2021-11-16 11:29:00', '2021-11-16 11:29:00'),
(26, 36, '61780ef88225fb52ee44fdbc', '619395fb55741va36', 'sidex', '107669999140203', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:28:59', NULL, '2021-11-16 11:29:00', '2021-11-16 11:29:00'),
(27, 37, '61780ef88225fb52ee44fdbc', '619395fb76903va37', 'sidex', '107669999102502', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:28:59', NULL, '2021-11-16 11:29:00', '2021-11-16 11:29:00'),
(28, 39, '61780ef88225fb52ee44fdbc', '619395fc1d4f4va39', 'sidex', '107669999673666', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:29:00', NULL, '2021-11-16 11:29:01', '2021-11-16 11:29:01'),
(29, 38, '61780ef88225fb52ee44fdbc', '619395fc1657eva38', 'sidex', '107669999426494', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:29:00', NULL, '2021-11-16 11:29:01', '2021-11-16 11:29:01'),
(30, 40, '61780ef88225fb52ee44fdbc', '6197aa8142c9bva40', 'sidex', '107669999152086', 'BCA', 1000000, 'virtual_account', 'PENDING', NULL, '2021-11-20 06:45:37', NULL, '2021-11-19 13:45:38', '2021-11-19 13:45:38'),
(31, 41, '61780ef88225fb52ee44fdbc', '6197ac35eb798va41', 'XDT-sidex', '8808999966532326', 'BNI', 90000, 'virtual_account', 'PENDING', NULL, '2021-11-20 06:52:53', NULL, '2021-11-19 13:52:55', '2021-11-19 13:52:55'),
(32, 42, '61780ef88225fb52ee44fdbc', '6199ec3d179eeva42', 'sidexyuj', '107669999913832', 'BCA', 90000, 'virtual_account', 'PENDING', NULL, '2021-11-21 23:50:37', NULL, '2021-11-21 06:50:38', '2021-11-21 06:50:38'),
(33, 43, NULL, '61a3a7f6952da-xen-43', NULL, NULL, 'ID_SHOPEEPAY', 150000, 'e_wallet', 'PENDING', NULL, NULL, NULL, '2021-11-28 16:01:59', '2021-11-28 16:01:59'),
(34, 44, '61780ef88225fb52ee44fdbc', '61a64472a3ea9-xen-44', 'sidexyuj', '107669999905691', 'BCA', 20000, 'virtual_account', 'PENDING', NULL, '2021-12-01 08:34:10', NULL, '2021-11-30 15:34:11', '2021-11-30 15:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(2, 'browse_bread', NULL, '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(3, 'browse_database', NULL, '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(4, 'browse_media', NULL, '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(5, 'browse_compass', NULL, '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(6, 'browse_menus', 'menus', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(7, 'read_menus', 'menus', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(8, 'edit_menus', 'menus', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(9, 'add_menus', 'menus', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(10, 'delete_menus', 'menus', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(11, 'browse_roles', 'roles', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(12, 'read_roles', 'roles', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(13, 'edit_roles', 'roles', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(14, 'add_roles', 'roles', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(15, 'delete_roles', 'roles', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(16, 'browse_users', 'users', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(17, 'read_users', 'users', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(18, 'edit_users', 'users', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(19, 'add_users', 'users', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(20, 'delete_users', 'users', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(21, 'browse_settings', 'settings', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(22, 'read_settings', 'settings', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(23, 'edit_settings', 'settings', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(24, 'add_settings', 'settings', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(25, 'delete_settings', 'settings', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(26, 'browse_categories', 'categories', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(27, 'read_categories', 'categories', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(28, 'edit_categories', 'categories', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(29, 'add_categories', 'categories', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(30, 'delete_categories', 'categories', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(31, 'browse_posts', 'posts', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(32, 'read_posts', 'posts', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(33, 'edit_posts', 'posts', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(34, 'add_posts', 'posts', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(35, 'delete_posts', 'posts', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(36, 'browse_pages', 'pages', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(37, 'read_pages', 'pages', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(38, 'edit_pages', 'pages', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(39, 'add_pages', 'pages', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(40, 'delete_pages', 'pages', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(41, 'browse_hooks', NULL, '2021-09-22 20:58:06', '2021-09-22 20:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(39, 3),
(40, 1),
(40, 3);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-22 20:58:06', '2021-09-22 20:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_donation` double DEFAULT NULL,
  `max_backer` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `campaign_id`, `title`, `description`, `min_donation`, `max_backer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 46, 'Dukung dengan Donasi (tanpa hadiah)', 'Mendukung tanpa hadiah, khusus untuk para backer super ikhlas dan percaya pada kemampuan kreator untuk mewujudkan kreasinya.', NULL, NULL, '2021-10-17 00:39:58', '2021-10-17 00:39:58', NULL),
(2, 53, 'Dukung dengan Donasi (tanpa hadiah)', 'Mendukung tanpa hadiah, khusus untuk para backer super ikhlas dan percaya pada kemampuan kreator untuk mewujudkan kreasinya.', NULL, NULL, '2021-10-17 00:39:58', '2021-10-17 00:39:58', NULL),
(3, 45, 'Dukung dengan Donasi (tanpa hadiah)', 'Mendukung tanpa hadiah, khusus untuk para backer super ikhlas dan percaya pada kemampuan kreator untuk mewujudkan kreasinya.', NULL, NULL, '2021-10-17 00:39:58', '2021-10-17 00:39:58', NULL),
(4, 50, 'Dukung dengan Donasi (tanpa hadiah)', 'Mendukung tanpa hadiah, khusus untuk para backer super ikhlas dan percaya pada kemampuan kreator untuk mewujudkan kreasinya.', NULL, NULL, '2021-10-17 00:39:58', '2021-10-17 00:39:58', NULL),
(5, 45, 'Ab sint non beatae pariatur.', 'Quas ab ex repudiandae voluptatem dolor voluptatem.', 80000, 50, '2021-10-17 00:39:58', '2021-10-17 00:39:58', NULL),
(7, 50, 'Qui molestiae dolor earum.', 'Dolorem et rem mollitia ipsa maxime sit.', 90000, 48, '2021-10-17 00:39:58', '2021-10-17 00:39:58', NULL),
(8, 51, 'Dukung dengan Donasi (tanpa hadiah)', 'Mendukung tanpa hadiah, khusus untuk para backer super ikhlas dan percaya pada kemampuan kreator untuk mewujudkan kreasinya.', NULL, NULL, '2021-10-17 00:39:58', '2021-10-17 00:39:58', NULL),
(9, 53, 'Sunt recusandae.', 'A et reiciendis est neque deleniti consequuntur dolorem qui incidunt et perferendis voluptatem aliquam.', 90000, 49, '2021-10-17 00:39:58', '2021-10-17 00:39:58', NULL),
(10, 49, 'Dukung dengan Donasi (tanpa hadiah)', 'Mendukung tanpa hadiah, khusus untuk para backer super ikhlas dan percaya pada kemampuan kreator untuk mewujudkan kreasinya.', NULL, NULL, '2021-10-17 00:39:58', '2021-10-17 00:39:58', NULL),
(11, 46, 'Sepeda Listrik Mini Premium', 'Ini adalah reward untuk backer kami yang baik hati berupa sepada listrik masa kini', 4000000, 50, '2021-10-18 22:29:09', '2021-10-18 22:35:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(2, 'user', 'Backer', '2021-09-22 20:58:05', '2021-09-22 20:58:05'),
(3, 'creator', 'Kreator', '2021-10-14 07:06:54', '2021-10-14 07:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-09-22 20:58:06', '2021-09-22 20:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED NOT NULL,
  `index` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `campaign_id`, `index`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 52, '100', 'Voluptatem saepe placeat autem.', 'Qui alias officiis commodi et dolore error magni laudantium occaecati sit reprehenderit laborum quasi voluptates qui omnis quam eos.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(2, 45, '50', 'Architecto rerum fugit.', 'Quaerat eligendi veniam quia maxime ipsum repudiandae sunt est cum non eum ullam consequatur quis officia repudiandae illo omnis ipsa.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(3, 51, '63', 'Commodi sunt quia aut.', 'Neque corporis nesciunt aut distinctio minima aut consectetur quasi repellendus.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(4, 48, '44', 'Ad et.', 'Voluptatem quis tenetur quaerat laudantium blanditiis rerum ducimus incidunt consectetur minima error voluptatibus esse impedit.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(5, 47, '9', 'Eligendi est ab.', 'Libero modi quis officiis porro consequatur dolor at libero in ea accusamus numquam iure numquam itaque est magnam.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(6, 50, '73', 'Ut facere est.', 'Rem culpa eos et ut quia quia debitis esse dolore quos.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(7, 49, '18', 'Et non porro.', 'Praesentium quaerat enim soluta consequatur quia repudiandae ea perferendis non aperiam qui illo consequatur minima esse pariatur ipsum quia voluptatem.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(8, 51, '86', 'Nam et consequatur in assumenda.', 'Alias commodi in autem et est nisi nemo debitis id non sit cupiditate ut earum vel odio nihil delectus eos eum.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(9, 49, '89', 'Voluptatem rerum deserunt dolores.', 'Beatae sit in nemo deserunt cumque nostrum illum consectetur ipsam quisquam non earum fugiat voluptatibus possimus sed vel non qui.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(10, 47, '86', 'Perspiciatis earum nulla vero.', 'Sed et molestias vero dolorum incidunt voluptate voluptatem sunt perspiciatis blanditiis voluptatem corrupti eaque est velit similique.', '2021-10-19 09:48:19', '2021-10-19 09:48:19'),
(13, 47, '3', 'Update For Campaign 47', 'ini adalah update deskripsi gaes', '2021-10-19 10:12:36', '2021-10-19 10:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','prefer_not_to_tell') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ktp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `email_verified_at`, `settings`, `phone`, `address`, `latitude`, `longitude`, `gender`, `bank_account`, `ktp`, `fcm_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$q3RCVvSqN4xk/AxA43WxCeBhg44Svpr1HFk0I4GgxB8gYK3p2Wnia', 'vfa70gRTDxeNVOqwW3iu5szY35kKE0fOEUXLhCYAYo65c6Y7nZd5OD3IRuDY', '2021-10-04 04:35:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-22 20:58:06', '2021-09-22 20:58:06', NULL),
(2, 3, 'Kreator', 'kreator@gmail.com', 'users/default.png', '$2y$10$nAUQVd.Iab7LlQ5l1HhykuOYFv5q03GRN7pH3AZlNqXphc/qNjsYW', NULL, '2021-10-04 04:35:57', NULL, '08112222000111', 'JL Kreasi No 99', NULL, NULL, 'male', '112233445', 'users/ktp_Kreator_701681.jpg', NULL, '2021-09-29 20:56:54', '2021-10-14 09:48:19', NULL),
(3, 2, 'Baker', 'baker@gmail.com', 'users/default.png', '$2y$10$nIZNZ6E.r4VuKD/jh1FyX.zsNd0xOeselIqyID4ziHDd9DX8JzUJe', 'zVu3xlaBZJeT5c6JazJwGtHgccxgc1Y9LPJCA5fRHXb3IbhohCoFfh3uYtvi', '2021-10-04 04:35:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-29 20:56:54', '2021-09-29 20:56:54', NULL),
(4, 3, 'Ahmad Saputra', 'ahmad@gmail.com', 'users/default.png', '$2y$10$SMPAl63ScGXHvRmZQIrpsuNffsHjJJV/A84dkDdhtp9aXLYo07pOS', NULL, '2021-10-04 04:35:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-30 00:59:53', '2021-09-30 02:45:35', NULL),
(5, 2, 'Beny Dollodolo', 'beny@gmail.com', 'users/November2021/8crWtLCQNuwipBEM6tse.jpg', '$2y$10$88Up2pgUc8XrY8kaYLJb4OTmwjPkBKiMkja5ouAMNptxlcQVtEWdG', '175478', '2021-10-04 04:35:57', '{\"locale\":\"en\"}', '08123456789', 'JL Mangga Dua Jakarta', NULL, NULL, 'male', NULL, NULL, 'fcm 2', '2021-09-30 09:57:09', '2022-02-28 12:54:54', NULL),
(6, 3, 'Cheril Aulia Saputri', 'cheril@gmail.com', 'users/default.png', '$2y$10$SMPAl63ScGXHvRmZQIrpsuNffsHjJJV/A84dkDdhtp9aXLYo07pOS', NULL, '2021-10-04 04:35:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-04 04:34:28', '2021-10-04 04:37:52', NULL),
(18, 2, 'Elang', 'elang@gmail.com', 'users/default.png', '$2y$10$Rf/XZHtfaAHHKRiJIXRZVuwC2Cc/TE785kScqtdyO2zchz85sDFdO', '523076', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-14 09:45:12', '2021-10-14 09:45:12', '2021-10-04 04:37:52'),
(19, 3, 'sidexyuj', 'ivan.sidiq.is@gmail.com', 'users/default.png', '$2y$10$oesWFDxIzWHRhx8CIjA.IO7fSAmULbledO1dx.9NdXot7RGT4R4uO', NULL, '2021-10-07 02:11:56', NULL, '6778', 'gggg', NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-07 02:10:58', '2021-11-21 06:36:11', NULL),
(20, 2, 'sidexa', 'ivan.msidiq@gmail.com', 'users/default.png', '$2y$10$9txipLRptNIsBUwoCBzf2.xncjQev8hssz3OyApadyCJlzy2fZ8qO', '791038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-07 12:46:44', '2021-10-07 12:46:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'IDR',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_histories`
--

CREATE TABLE `wallet_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `wallet_id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noted` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backer_users`
--
ALTER TABLE `backer_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backer_users_campaign_id_foreign` (`campaign_id`),
  ADD KEY `backer_users_user_id_foreign` (`user_id`),
  ADD KEY `backer_users_reward_id_foreign` (`reward_id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_user_id_foreign` (`user_id`),
  ADD KEY `campaigns_campaign_category_id_foreign` (`campaign_category_id`);

--
-- Indexes for table `campaign_categories`
--
ALTER TABLE `campaign_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_comments`
--
ALTER TABLE `campaign_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_comments_parent_id_foreign` (`parent_id`),
  ADD KEY `campaign_comments_campaign_id_foreign` (`campaign_id`),
  ADD KEY `campaign_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_campaign_id_foreign` (`campaign_id`),
  ADD KEY `faqs_user_question_id_foreign` (`user_question_id`),
  ADD KEY `faqs_user_answer_id_foreign` (`user_answer_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_backer_user_id_foreign` (`backer_user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rewards_campaign_id_foreign` (`campaign_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updates_campaign_id_foreign` (`campaign_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_histories_user_id_foreign` (`user_id`),
  ADD KEY `wallet_histories_wallet_id_foreign` (`wallet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backer_users`
--
ALTER TABLE `backer_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `campaign_categories`
--
ALTER TABLE `campaign_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `campaign_comments`
--
ALTER TABLE `campaign_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `backer_users`
--
ALTER TABLE `backer_users`
  ADD CONSTRAINT `backer_users_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `backer_users_reward_id_foreign` FOREIGN KEY (`reward_id`) REFERENCES `rewards` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `backer_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_campaign_category_id_foreign` FOREIGN KEY (`campaign_category_id`) REFERENCES `campaign_categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `campaigns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `campaign_comments`
--
ALTER TABLE `campaign_comments`
  ADD CONSTRAINT `campaign_comments_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `campaign_comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `campaign_comments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `campaign_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `faqs_user_answer_id_foreign` FOREIGN KEY (`user_answer_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `faqs_user_question_id_foreign` FOREIGN KEY (`user_question_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_backer_user_id_foreign` FOREIGN KEY (`backer_user_id`) REFERENCES `backer_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rewards`
--
ALTER TABLE `rewards`
  ADD CONSTRAINT `rewards_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `updates`
--
ALTER TABLE `updates`
  ADD CONSTRAINT `updates_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  ADD CONSTRAINT `wallet_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `wallet_histories_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
