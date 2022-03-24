-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 22, 2022 at 09:29 PM
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
-- Database: `stab9778_dev_kreatora_db`
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
(8, NULL, 50, 5, 7, 90000, 100000, '2021-10-26 03:36:24', '2021-10-26 03:36:24'),
(10, NULL, 50, 5, NULL, 200000, NULL, '2021-10-26 03:36:45', '2021-10-26 03:36:45'),
(11, NULL, 50, 5, NULL, 10000, NULL, '2021-10-26 03:36:53', '2021-10-26 03:36:53'),
(12, NULL, 50, 5, NULL, 250000, NULL, '2021-10-28 13:50:09', '2021-10-28 13:50:09');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `campaign_category_id` int(10) UNSIGNED DEFAULT NULL,
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
(21, 4, 8, 'In ipsam rem quos.', 'Velit hic voluptatem illum aspernatur corrupti ut laudantium. Et sed atque ipsa delectus voluptatibus.', 'Voluptate corporis ad laborum ea. Voluptas rerum accusamus quidem dolore sit accusamus.', NULL, 77230, '2010-05-31 09:24:42', '2022-05-23 13:11:01', 'waiting_list', NULL, '2021-10-13 14:09:57', '2021-10-13 14:09:57', NULL),
(22, 6, 8, 'Numquam nulla ut est esse.', 'Iste consequatur et alias repudiandae cumque. Placeat architecto numquam qui molestiae nesciunt aut similique. Accusantium ex assumenda eum et accusantium.', 'Accusantium eos modi est quisquam aut. Sunt quidem excepturi numquam qui dolore hic non.', NULL, 291105, '1974-07-09 01:13:42', '2022-06-13 12:41:13', 'waiting_list', NULL, '2021-10-13 14:09:57', '2021-10-13 14:09:57', NULL),
(24, 5, 8, 'In voluptatum velit odio.', 'Ratione magnam soluta vel fugiat fugiat. Amet deserunt sit rerum assumenda. Iusto doloremque accusamus libero aliquid assumenda aut delectus. Reprehenderit libero ad occaecati.', 'Et ea et hic id quia enim. Repellendus quidem saepe illo debitis minima dolorem suscipit qui.', NULL, 202677, '2015-04-01 14:35:42', '2022-02-28 13:52:04', 'waiting_list', NULL, '2021-10-13 14:09:57', '2021-10-13 14:09:57', NULL),
(25, 3, 8, 'Alias a recusandae qui ea corporis.', 'Temporibus officia et et adipisci. Recusandae est molestiae voluptatibus necessitatibus reprehenderit. Quis in ducimus beatae unde aliquid.', 'Maxime illum velit fugiat blanditiis. Alias iure repellat voluptate incidunt minima et enim.', NULL, 120769, '2010-10-05 10:27:25', '2022-04-21 16:22:08', 'waiting_list', NULL, '2021-10-13 14:09:57', '2021-10-13 14:09:57', NULL),
(28, 2, 8, 'Consequuntur ipsa aut sit.', 'Praesentium ad repellendus consequatur ab eveniet impedit. Ut magni sed debitis enim. Dolorem reiciendis aut omnis reprehenderit neque labore explicabo. Non consequuntur aut aut est omnis similique. Mollitia commodi quasi ut laborum libero.', 'Fuga non fugiat ut dicta. Est cumque quia maxime molestiae autem.', NULL, 420551, '1998-08-24 22:46:12', '2022-06-26 12:18:17', 'waiting_list', NULL, '2021-10-13 14:11:07', '2021-10-13 14:11:07', NULL),
(31, 6, 8, 'Suscipit qui rerum.', 'Consequatur incidunt iusto unde dolore reiciendis. Cum quidem repellendus dignissimos fuga quae. Ut inventore dolorem laboriosam eaque voluptatem.', 'Non ut temporibus omnis et a atque et. Libero repellat magni neque. Dolore eos quis non.', NULL, 380433, '1976-11-26 20:53:45', '2022-08-21 15:46:39', 'waiting_list', NULL, '2021-10-13 14:11:07', '2021-10-13 14:11:07', NULL),
(35, 3, 8, 'Sint ut dolorem.', 'Vitae consequatur voluptas nulla deserunt eos vitae dolore magnam quasi earum consequatur qui est.', 'Sit repellendus sint facilis eum quis. Ea possimus architecto rerum non illum et excepturi.', NULL, 196960, '1974-03-29 19:48:38', '2022-04-04 21:36:50', 'waiting_list', NULL, '2021-10-13 14:11:30', '2021-10-13 14:11:30', NULL),
(44, 4, 20, 'Officia voluptatem veniam veniam voluptas.', 'Deserunt minima molestias qui dolor libero consequuntur et velit ducimus ipsa officia.', 'Quos ducimus dolores inventore soluta aliquam. Architecto ut voluptas deleniti iure aliquam.', 'Expedita fuga a et repudiandae. Tenetur omnis perspiciatis nam facere.', 380282, '1979-11-24 17:17:00', '2022-06-11 03:35:00', 'waiting_list', NULL, '2021-10-16 23:50:00', '2022-03-19 14:41:15', NULL),
(45, 4, 8, 'Laborum quidem.', 'Modi nulla quod consequatur est alias non.', 'Sunt aut dolores ullam saepe aut ea. Reprehenderit illum doloribus animi.', 'Aut pariatur ullam itaque. Incidunt assumenda ut iste blanditiis.', 450000, '1985-12-26 00:25:18', '2022-05-21 02:22:09', 'waiting_list', NULL, '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(46, 5, 8, 'Inventore qui quidem.', 'Non laborum accusamus est consequatur aperiam nostrum vero odio architecto.', 'Laborum et non aperiam labore dolores. Totam animi quia illo repellendus at nobis unde.', 'Et quia ab ad harum accusantium ex. Unde unde voluptatem reprehenderit optio natus quasi enim.', 352909, '2007-06-07 20:37:00', '2022-01-27 14:45:00', 'waiting_list', '\"[\\\"campaigns\\\\\\/March2022\\\\\\/MIwkvqh9pCl42S00Vwi4.jpeg\\\",\\\"campaigns\\\\\\/March2022\\\\\\/qtZHYRQPQhN4YGijvwFi.jpg\\\"]\"', '2021-10-16 23:50:00', '2022-03-11 13:52:30', NULL),
(47, 6, 20, 'Dicta ut quis qui reprehenderit.', 'Voluptatem non totam quisquam qui occaecati rerum sit ducimus quasi.', 'Natus sint sed et sit cum. Nesciunt consequuntur velit est fugit numquam.', 'Quaerat quia omnis voluptas eos tempora. Et sunt numquam veniam aut magni.', 428593, '2021-08-09 13:35:00', '2021-11-02 21:14:00', 'waiting_list', NULL, '2021-10-16 23:50:00', '2022-03-19 14:41:26', NULL),
(48, 6, 8, 'Saepe id enim tenetur.', 'Neque velit minima omnis omnis ducimus eos explicabo alias et enim itaque.', 'Impedit architecto cupiditate ab non. Minima et est sit non nemo.', 'Et rerum nostrum beatae totam. Non et blanditiis eos unde dignissimos.', 157361, '1992-03-02 04:05:49', '2022-01-02 01:03:37', 'waiting_list', NULL, '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(49, 4, 20, 'Magni eos aut iure perferendis.', 'Facilis nostrum voluptatem et sit ipsa non dolore error.', 'Vel exercitationem et dolorem. Voluptates maiores ab modi saepe non.', 'Similique suscipit labore quam dignissimos itaque molestiae. Ipsam dolor quasi qui iste laudantium.', 385004, '2001-07-04 16:09:00', '2022-05-11 21:31:00', 'waiting_list', NULL, '2021-10-16 23:50:00', '2022-03-19 14:42:15', NULL),
(50, 6, 8, 'Commodi animi fugit corporis.', 'Dolorem sed quibusdam et qui libero voluptas in praesentium ut dolores temporibus sapiente porro vitae.', 'Autem cupiditate recusandae vitae beatae. Aut et quas similique ipsa autem rem eligendi quaerat.', 'Tempora nostrum fuga sed numquam. Eveniet magni dolores et praesentium necessitatibus molestias ad.', 1000000, '2004-12-13 04:30:19', '2022-02-23 13:58:05', 'waiting_list', NULL, '2021-10-16 23:50:11', '2021-10-16 23:50:11', NULL),
(51, 6, 20, 'Ad quidem nostrum soluta.', 'Repudiandae dignissimos facere quo fuga minima et explicabo corporis.', 'A perspiciatis totam commodi mollitia. Ea voluptate nam minus autem magnam ratione ut.', 'Aut quia et rerum a neque sunt odio. Placeat sint aspernatur mollitia inventore.', 77778, '1997-12-14 06:24:00', '2022-01-09 10:14:00', 'waiting_list', NULL, '2021-10-16 23:50:00', '2022-03-19 14:41:39', NULL),
(52, 2, 20, 'Voluptatibus deserunt et asperiores.', 'Dignissimos ut et minus animi aliquam ut et quas deserunt consequatur non ratione eum.', 'Ipsa et magni aliquid. Tempore inventore eum sed. Et sit aliquid consequatur quaerat odio.', 'Nihil ducimus sunt quasi magnam. Porro provident perferendis maxime sit iusto quia aut esse.', 247954, '1989-09-22 21:49:00', '2022-09-06 07:11:00', 'waiting_list', NULL, '2021-10-16 23:50:00', '2022-03-19 14:42:30', NULL),
(53, 5, 22, 'Eveniet incidunt ut.', 'Et excepturi hic incidunt et voluptatem eaque aperiam et hic autem quia.', 'Nesciunt accusantium molestias et ea. Eos eos aut sit voluptatem quasi.', 'Est qui quo eveniet dolorum. Enim sunt veniam consequatur qui. Dolores minus voluptatem vitae eos.', 80758, '1998-10-06 19:29:00', '2022-06-24 19:56:00', 'waiting_list', '[\\\"campaigns\\\\\\/March2022\\\\\\/U4Hg8nolUgmRGnnJ86d9.jpeg\\\",\\\"campaigns\\\\\\/March2022\\\\\\/vLRJompysjLn5cbWATpZ.jpg\\\",\\\"campaigns\\\\\\/March2022\\\\\\/YHj9lNp5ZgutCuPX4C4G.jpg\\\"]', '2021-10-16 23:50:00', '2022-03-19 14:42:53', NULL),
(54, 5, 22, 'Percobaan 1', 'deskripsi pendek nomor 1', 'deskripsi panjang nmomor 1', 'ini resiko pertama', 10000000, NULL, NULL, NULL, '\"[\\\"campaigns\\\\\\/March2022\\\\\\/uyGmcixl0Qt1KKg1a7wp.webp\\\",\\\"campaigns\\\\\\/March2022\\\\\\/51whEh4UCYYByyig28Bk.png\\\"]\"', '2022-03-11 13:43:00', '2022-03-19 14:41:03', NULL),
(55, 2, NULL, 'Game Tebak Abjad Untuk anak anak', 'Game yang sangat di rekopmendasikan untuk anak anak yang sedang belajar mengenal abjad', 'Game yang sangat di rekopmendasikan untuk anak anak yang sedang belajar mengenal abjad', 'tidak begitu seru', 75000000, '2022-03-14 17:00:00', '2022-04-29 17:00:00', NULL, '\"[\\\"campaigns\\\\\\/Game_146619.jpeg\\\",\\\"campaigns\\\\\\/Game_154555.jpeg\\\"]\"', '2022-03-13 15:26:32', '2022-03-13 15:50:14', '2022-03-13 15:50:14'),
(56, 2, 20, 'Game Tebak Abjad Untuk anak anak', 'Game yang sangat di rekopmendasikan untuk anak anak yang sedang belajar mengenal abjad', 'Game yang sangat di rekopmendasikan untuk anak anak yang sedang belajar mengenal abjad', 'tidak begitu seru', 75000000, '2022-03-14 17:00:00', '2022-04-29 17:00:00', NULL, '\"[\\\"campaigns\\\\\\/Game_649811.jpeg\\\",\\\"campaigns\\\\\\/Game_873270.jpeg\\\"]\"', '2022-03-13 15:50:00', '2022-03-20 14:03:15', '2022-03-13 15:50:00'),
(57, 2, 22, 'Game PES 2022', 'short desc', 'longglong', 'sda', 500000000, '2022-03-30 17:00:00', '2022-05-27 17:00:00', NULL, '\"[\\\"campaigns\\\\\\/March2022\\\\\\/izi7prGwayyvA0144y8f.png\\\"]\"', '2022-03-20 13:58:00', '2022-03-20 14:03:03', '2022-02-28 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_categories`
--

CREATE TABLE `campaign_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_categories`
--

INSERT INTO `campaign_categories` (`id`, `sorting`, `name`, `description`, `created_at`, `updated_at`) VALUES
(8, 1, 'Aksi', NULL, '2021-10-13 01:56:00', '2022-03-19 13:23:30'),
(20, 3, 'Simulasi', NULL, '2022-03-19 13:22:00', '2022-03-19 14:36:10'),
(21, 4, 'Lainnya', NULL, '2022-03-19 13:22:00', '2022-03-19 14:36:17'),
(22, 2, 'Olahraga', NULL, '2022-03-19 13:38:00', '2022-03-19 14:36:04');

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
(30, NULL, NULL, NULL, 'hai', '2021-11-15 09:05:34', '2021-11-15 09:05:34'),
(31, NULL, NULL, NULL, 'hai', '2021-11-15 09:05:34', '2021-11-15 09:05:34'),
(32, NULL, NULL, NULL, 'hai', '2021-11-15 09:05:34', '2021-11-15 09:05:34'),
(33, NULL, NULL, NULL, 'hai', '2021-11-15 09:05:34', '2021-11-15 09:05:34'),
(34, NULL, NULL, NULL, 'hai', '2021-11-15 09:05:35', '2021-11-15 09:05:35'),
(35, NULL, NULL, NULL, 'hai', '2021-11-15 09:05:35', '2021-11-15 09:05:35'),
(36, NULL, NULL, NULL, 'hai', '2021-11-15 09:05:35', '2021-11-15 09:05:35'),
(37, NULL, NULL, NULL, 'hai', '2021-11-15 09:05:35', '2021-11-15 09:05:35');

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
(56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(57, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(58, 7, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(59, 7, 'campaign_category_id', 'number', 'Campaign Category Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(60, 7, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 6),
(61, 7, 'short_desc', 'text', 'Short Desc', 0, 1, 1, 1, 1, 1, '{}', 7),
(62, 7, 'long_desc', 'text', 'Long Desc', 0, 1, 1, 1, 1, 1, '{}', 8),
(63, 7, 'risk', 'text', 'Risk', 0, 1, 1, 1, 1, 1, '{}', 9),
(64, 7, 'goal', 'text', 'Goal', 0, 1, 1, 1, 1, 1, '{}', 10),
(65, 7, 'start', 'timestamp', 'Start', 0, 1, 1, 1, 1, 1, '{}', 11),
(66, 7, 'end', 'timestamp', 'End', 0, 1, 1, 1, 1, 1, '{}', 12),
(67, 7, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 13),
(68, 7, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 0, '{}', 14),
(69, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 15),
(70, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
(71, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 17),
(72, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(73, 8, 'sorting', 'number', 'Sorting', 0, 1, 1, 1, 1, 1, '{}', 2),
(74, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(75, 8, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(76, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(77, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(78, 7, 'campaign_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"backer_users\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(79, 7, 'campaign_belongsto_campaign_category_relationship', 'relationship', 'campaign_categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\CampaignCategory\",\"table\":\"campaign_categories\",\"type\":\"belongsTo\",\"column\":\"campaign_category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"backer_users\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3);

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
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(7, 'campaigns', 'campaigns', 'Campaign', 'Campaigns', 'voyager-polaroid', 'App\\Campaign', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-03-11 13:29:36', '2022-03-19 14:39:49'),
(8, 'campaign_categories', 'campaign-categories', 'Campaign Category', 'Campaign Categories', 'voyager-categories', 'App\\CampaignCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"sorting\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-03-19 12:50:22', '2022-03-19 13:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED DEFAULT NULL,
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
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2021-09-22 20:58:05', '2022-03-19 12:53:35', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-09-22 20:58:05', '2021-09-22 20:58:05', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2021-09-22 20:58:05', '2022-03-19 12:53:35', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2021-09-22 20:58:05', '2022-03-19 12:53:35', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2021-09-22 20:58:05', '2022-03-19 12:53:35', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2021-09-22 20:58:05', '2022-03-19 12:53:35', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2021-09-22 20:58:05', '2022-03-19 12:53:35', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2021-09-22 20:58:05', '2022-03-19 12:53:35', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2021-09-22 20:58:06', '2022-03-19 12:53:35', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2021-09-22 20:58:06', '2022-03-19 12:53:35', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2021-09-22 20:58:06', '2022-03-19 12:53:35', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2021-09-22 20:58:06', '2022-03-19 12:53:35', 'voyager.hooks', NULL),
(15, 1, 'Campaigns', '/admin/campaigns', '_self', 'voyager-polaroid', '#000000', 17, 2, '2022-03-11 13:38:55', '2022-03-19 12:53:39', NULL, ''),
(16, 1, 'Campaign Categories', '/admin/campaign-categories', '_self', 'voyager-categories', '#000000', 17, 1, '2022-03-19 12:52:58', '2022-03-19 12:55:01', NULL, ''),
(17, 1, 'Campaign', '', '_self', 'voyager-news', '#000000', NULL, 10, '2022-03-19 12:53:25', '2022-03-19 12:53:39', NULL, '');

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
('00eb05d215b592593697448c80fecc71a4fb5c29ff4e597da417cc83d1411fbfd5e753b208392e5d', 5, 1, 'nApp', '[]', 0, '2021-12-26 11:57:30', '2021-12-26 11:57:30', '2022-12-26 18:57:30'),
('01922e1fee57ea78fe8712bf56d716f26a7268dc73a1e401afc167b40445ad6511923305a37969e1', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:06:35', '2021-12-23 15:06:35', '2022-12-23 22:06:35'),
('0a4f2f97177f14cc3caa77917accb9cb99d523e9f597d69ea23f75471566ffb0f0da4a29b0c867d6', 2, 1, 'nApp', '[]', 0, '2021-09-30 09:55:56', '2021-09-30 09:55:56', '2022-09-30 16:55:56'),
('0ea9e12abc1b25e4f8a4da2268379c33920e37ec1354dfd14a7d2a8256a49585d04fce8dadaccd04', 19, 1, 'nApp', '[]', 0, '2021-11-30 16:05:06', '2021-11-30 16:05:06', '2022-11-30 23:05:06'),
('1165404c8d508aacbd57017aff8f12a02160d2f3fa3f3322322ea04acf34abad8b499ba36939d643', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:07:48', '2021-12-23 15:07:48', '2022-12-23 22:07:48'),
('14e0b7abd3fb34feee815a0e6b6cf008404a44a76c688187feee0b7ed314fcd2539ae48eb0e8fb3a', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:32:30', '2021-12-23 15:32:30', '2022-12-23 22:32:30'),
('18ba73b6f1b6893f16f033cb30a9b91b3ffb6032cbb12f7b84044c78d69cbd08d6aa96531fa2fdeb', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:00:24', '2021-12-23 15:00:24', '2022-12-23 22:00:24'),
('1af2e3edc6ed2c3c42e686818cc6339615f1fdf018fe267712af691095e37704165e175892a3efdf', 5, 1, 'nApp', '[]', 0, '2021-10-13 02:01:59', '2021-10-13 02:01:59', '2022-10-13 09:01:59'),
('1b32136723e61046e9a0916404a72413fe454adc210bb80887dfe7e293e682a399e2cc491d312294', 5, 1, 'nApp', '[]', 0, '2021-10-18 22:24:31', '2021-10-18 22:24:31', '2022-10-19 05:24:31'),
('1ef5f4e35c4505060bb717f702ed8814696da3dfbd1d9b9a75bb4d20878313270ea2e311a9b656ea', 19, 1, 'nApp', '[]', 0, '2021-11-21 08:56:27', '2021-11-21 08:56:27', '2022-11-21 15:56:27'),
('1f8348ee3c75ce559144ad67480948a54ae5482369c578a39ac362e78714a45d74e05700115633dc', 5, 1, 'nApp', '[]', 0, '2021-12-26 23:47:36', '2021-12-26 23:47:36', '2022-12-27 06:47:36'),
('22692adffbeb709304b39229873df4cf9c160039dfdefc7261295bdce8a0bfbed3186a0508f6f25b', 19, 1, 'nApp', '[]', 0, '2021-12-11 05:37:34', '2021-12-11 05:37:34', '2022-12-11 12:37:34'),
('301f5322c10040d02f772899ad794348e03bc3378b5470447b78c6ddcb6ccc6f3a6ad4080a410c2a', 22, 3, 'nApp', '[]', 0, '2022-03-20 07:24:05', '2022-03-20 07:24:05', '2023-03-20 14:24:05'),
('30fa0794a985f469c162964600af9c9ff3139ed791e7bd41ff6d14ec5c2b8b6bdc2f3c978248f4b2', 5, 1, 'nApp', '[]', 0, '2021-11-28 15:59:50', '2021-11-28 15:59:50', '2022-11-28 22:59:50'),
('3823920a1f1bf82beaf2ed845233f1e931d33888b04c2aaa4eee7e636f3a162625fd6e59803bee63', 5, 1, 'nApp', '[]', 0, '2021-12-25 03:29:34', '2021-12-25 03:29:34', '2022-12-25 10:29:34'),
('3ca469d73aeb08ea6c55b219a71890ca0b8ac6bb1ff02e66b9bd07470aa5ff8e9f7bf7649d79dba5', 19, 1, 'nApp', '[]', 0, '2021-11-19 09:11:07', '2021-11-19 09:11:07', '2022-11-19 16:11:07'),
('3cefda49e6fcc57ecfe0ec5e8b905f1071ef9c6bd4b4975a6c2aa1d67dbc25cd5c99a123b3352826', 5, 1, 'nApp', '[]', 0, '2021-12-27 08:01:21', '2021-12-27 08:01:21', '2022-12-27 15:01:21'),
('3e575fe4db20ec0fdac59024220e5037f49bbea1a1a23ea540de97ac3b4f2cce8e6bac7fad22fe32', 19, 1, 'nApp', '[]', 0, '2021-11-08 09:13:28', '2021-11-08 09:13:28', '2022-11-08 16:13:28'),
('40e6b63075383ea785e1a13da2b81beab5c3b5ec9eb23d10e81f154ca8f79aa5ca381079ff659baf', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:04:08', '2021-12-23 15:04:08', '2022-12-23 22:04:08'),
('42b506944b97012b3232e371db18ce1c1d3a820ab7f81043b6e5d31e638e54d3a49956150c88a261', 19, 1, 'nApp', '[]', 0, '2021-11-09 04:43:40', '2021-11-09 04:43:40', '2022-11-09 11:43:40'),
('43a7b915bd2e88ee006e6476240b8ee60183e83c900c5ab0053aa5e1abbae27e49d2e3f6ac3dbd07', 2, 3, 'nApp', '[]', 0, '2022-03-18 05:57:12', '2022-03-18 05:57:12', '2023-03-18 12:57:12'),
('44473255ccdd3a482f2a6bedffbddbcfc8a79019cd0a28c51fdc5ebeb6dd52c51c84c19689a92200', 5, 1, 'nApp', '[]', 0, '2022-03-13 14:48:20', '2022-03-13 14:48:20', '2023-03-13 21:48:20'),
('457f6f7722a6fd473ce02318e5541505314a994dc1358593ab68f6e636b743c9ed3d74a44f74b4f1', 5, 1, 'nApp', '[]', 0, '2021-12-27 07:53:51', '2021-12-27 07:53:51', '2022-12-27 14:53:51'),
('51f92418d26ef78e7a42a13910e3748dcadf514ac42df43b95260f8e5347c190cb9508c75f263a41', 5, 1, 'nApp', '[]', 0, '2021-10-26 15:17:55', '2021-10-26 15:17:55', '2022-10-26 22:17:55'),
('52156b440ce90e50a3ce5095876f20bccdae3e26bc2aea670d75e212bc33d4a4590c53d97559a1e5', 5, 1, 'nApp', '[]', 0, '2021-12-27 06:22:34', '2021-12-27 06:22:34', '2022-12-27 13:22:34'),
('5490ace050f1c5a8e7435485da0684b9c5ef35504b9c1f8b8753c90b43dc81fad6016864318fec0c', 5, 1, 'nApp', '[]', 0, '2021-10-17 00:02:41', '2021-10-17 00:02:41', '2022-10-17 07:02:41'),
('599f5b62e3ebf4ac90ac18d245bda31aad045d048148805f5cc4533b4dcdd3dafe7f4e2af2c63070', 19, 1, 'nApp', '[]', 0, '2021-11-21 08:18:15', '2021-11-21 08:18:15', '2022-11-21 15:18:15'),
('5bdf397e7af2dc9fe4b7a5798451d818edef41d63007a84f229de673d32fe87e929b7d84a505c2a3', 5, 1, 'nApp', '[]', 0, '2021-10-13 01:56:42', '2021-10-13 01:56:42', '2022-10-13 08:56:42'),
('61becb034a9bb47b9b61092018983c102f96f01ff97509444c8cb2a7b20950731c8354f1ab47e8bd', 22, 3, 'nApp', '[]', 0, '2022-03-20 13:19:54', '2022-03-20 13:19:54', '2023-03-20 20:19:54'),
('62ede33f27c36ff72540ba224e40307e2178763836347da760ec57c68e163056ac55ee2951c3ec22', 2, 2, NULL, '[]', 0, '2021-09-29 23:25:12', '2021-09-29 23:25:12', '2022-09-30 06:25:12'),
('62f57237c814ef06e692618fec515d1050d5c0d4eab2b880e5aca90545a7e5c63251a0a7e756b5a7', 5, 1, 'nApp', '[]', 0, '2021-12-27 06:44:57', '2021-12-27 06:44:57', '2022-12-27 13:44:57'),
('63743d83b0378676e87de96b3d5584da374730898dd19dd114db824e62be646be4af15ef12fef309', 5, 1, 'nApp', '[]', 0, '2021-12-23 14:56:36', '2021-12-23 14:56:36', '2022-12-23 21:56:36'),
('6a9617f23b9f85d49b58ac27a6281ffb326f3f26d89931ac2c1aa0b55ee9c7cac286965f79c0c80b', 6, 1, 'nApp', '[]', 0, '2021-10-01 06:54:06', '2021-10-01 06:54:06', '2022-10-01 13:54:06'),
('6f63e31d34b0309a2e27661ae5d1dc3e34b6e7695ed32d789f4a2eec2f7b343a050068c610169a90', 5, 1, 'nApp', '[]', 0, '2021-12-27 07:38:17', '2021-12-27 07:38:17', '2022-12-27 14:38:17'),
('6fc37ba761076c16fe77b986f7b146f0c1e065cfb25192d368fc62fbcae3edd376427c39dbaaad74', 5, 1, 'nApp', '[]', 0, '2021-11-19 00:14:57', '2021-11-19 00:14:57', '2022-11-19 07:14:57'),
('7068470bbd8605caed993fe2657ce2e4bfaef0f6f599010b1d114fd8fd2af7f171138442ff668188', 5, 1, 'nApp', '[]', 0, '2021-12-27 06:46:37', '2021-12-27 06:46:37', '2022-12-27 13:46:37'),
('7182e42f6a3cfc8996e9fc5431d51d956331e6489e41988be63f28fdfe576e766d41e03873c4927b', 25, 3, 'nApp', '[]', 0, '2022-03-19 14:49:59', '2022-03-19 14:49:59', '2023-03-19 21:49:59'),
('72adc83b9ca1a44f2fe62c36b484ce5cdefed0f32244622bd456113193d9d24b81c427c8e8a27c18', 5, 1, 'nApp', '[]', 0, '2021-10-12 23:44:38', '2021-10-12 23:44:38', '2022-10-13 06:44:38'),
('7830dd53ec80ddb6429c0fb253c9adbc01fb53695d9e8931e0101490e5ae6259be6b8b9b6280d0b2', 5, 1, 'nApp', '[]', 0, '2021-11-18 10:04:57', '2021-11-18 10:04:57', '2022-11-18 17:04:57'),
('785ab61782d0bda6ddb8bc8931a8e40044b459e32b1e9b0e9019b909c44542c2518e4a7909ec31be', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:08:21', '2021-12-23 15:08:21', '2022-12-23 22:08:21'),
('79aa2094dc295673dbee0abc0d47b92cbdf94a26c9e8d5c7f5cf13fdce0e214240c0efbe75c41fba', 19, 1, 'nApp', '[]', 0, '2021-11-30 14:20:26', '2021-11-30 14:20:26', '2022-11-30 21:20:26'),
('7a27fde672c73088da86ab739f35fafe608cf97f1725e60813a7e4e130a8e2fd174611efbb5e0efc', 2, 1, NULL, '[]', 0, '2021-09-29 22:54:22', '2021-09-29 22:54:22', '2022-09-30 05:54:22'),
('82bdba385b4869a3518755fa2df0a929e3bb5b176f2e96e9762bfb6b0bb8e77ed0afe1c795398966', 2, 3, 'nApp', '[]', 0, '2022-03-14 16:33:35', '2022-03-14 16:33:35', '2023-03-14 23:33:35'),
('86df01704b3bcdc1f395c4aa68b396cfa0f9824cef10d33560bfcc7b55fe4dc78a2b4f9d20b8c682', 5, 1, 'nApp', '[]', 0, '2021-12-27 06:50:13', '2021-12-27 06:50:13', '2022-12-27 13:50:13'),
('8ca1991b3b5ae46c64fa6cae485f726629afea41ade926c911b6e1c72296326244a9e337e4436ae4', 5, 1, 'nApp', '[]', 0, '2021-11-20 00:12:35', '2021-11-20 00:12:35', '2022-11-20 07:12:35'),
('8da805c90d3c95e975bfa537b2dfa3dcddca7f2daa883ff8236d78219c93d0b3a68c41bee61debf4', 2, 3, 'nApp', '[]', 0, '2022-03-13 15:14:43', '2022-03-13 15:14:43', '2023-03-13 22:14:43'),
('912b008cd8763ec9df0a0968b9f0d3a398ba6e4ee114a6ab77f3da18ed6f78ec9ca8bb671c9e6576', 2, 3, 'nApp', '[]', 0, '2022-03-18 06:09:06', '2022-03-18 06:09:06', '2023-03-18 13:09:06'),
('92d042e40ce1d6657535c203b2daeae1d7cf4246be0c4969d4f980941f6ba3708cdca32b2beb9dfc', 5, 1, 'nApp', '[]', 0, '2021-11-11 07:46:27', '2021-11-11 07:46:27', '2022-11-11 14:46:27'),
('94a908d12143ea5483dfe9f018837dc96fa912e37ad5ee25b6b86f18ff20f70822fc9f717ef358c9', 19, 1, 'nApp', '[]', 0, '2021-11-21 05:37:15', '2021-11-21 05:37:15', '2022-11-21 12:37:15'),
('94da5849917361065b47824fc809257ca54fb8206b3abebe5089a87bd52530c21fb12ef84b9604f4', 6, 1, 'nApp', '[]', 0, '2021-10-01 06:50:11', '2021-10-01 06:50:11', '2022-10-01 13:50:11'),
('98e8f3d8bab15359597898fa1cd7649d90de7b8329a385e7d7bd567dcec72b06dae1ae5def396b4a', 19, 1, 'nApp', '[]', 0, '2021-11-30 11:28:48', '2021-11-30 11:28:48', '2022-11-30 18:28:48'),
('9ca332964a02d89e6fda717be1ac9864faca32e7a49aa42e90d51f68848d2154f0759c0f3b467c05', 19, 1, 'nApp', '[]', 0, '2021-11-15 09:04:43', '2021-11-15 09:04:43', '2022-11-15 16:04:43'),
('a32ebba55970f81173324c16817f4e6a5d99fc3479e8c909e4f2e3c3301aaa58dba2d9a6c1d241f2', 2, 3, 'nApp', '[]', 0, '2022-03-15 17:21:06', '2022-03-15 17:21:06', '2023-03-16 00:21:06'),
('a3ae200123187b531007e1535daeae523a9d1ed656c715f629e66a1b5e2ba2262ed2332cf7f3d5fe', 5, 1, 'nApp', '[]', 0, '2021-11-11 08:01:23', '2021-11-11 08:01:23', '2022-11-11 15:01:23'),
('a4fd3828fda351ff05ca04fc56d166492e538a2b0572fc8d3a941a358604e16b87820a0f2720b201', 2, 3, 'nApp', '[]', 0, '2022-03-18 06:03:59', '2022-03-18 06:03:59', '2023-03-18 13:03:59'),
('a61caab48474b92739ee1963d7a0732ed31aeed34efc17c357e6deaf62548afae7fdbe3374d2b89a', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:05:38', '2021-12-23 15:05:38', '2022-12-23 22:05:38'),
('ac6f448733fc696354d115a06d1909bdec99267eda3da7578c3688aa7cc289705834fc216d01132d', 27, 3, 'nApp', '[]', 0, '2022-03-20 13:52:59', '2022-03-20 13:52:59', '2023-03-20 20:52:59'),
('ac8383160dd25eba66942942929e6b5ae6b2579e3aaed9c0a9c43f98a33d9eaaf1df25a167cda7e5', 5, 1, 'nApp', '[]', 0, '2021-12-26 11:50:01', '2021-12-26 11:50:01', '2022-12-26 18:50:01'),
('ac8c11d12a009e9ce3a458968203b43c009e3b51c9862b68124f42a77856958a0d706286930810f4', 5, 1, 'nApp', '[]', 0, '2021-10-25 14:07:48', '2021-10-25 14:07:48', '2022-10-25 21:07:48'),
('ac965915f0d9c7ea41f6d47d184770fd49db14f588fd4627227f76b6c0eee3a0b310aa36da349019', 2, 3, 'nApp', '[]', 0, '2022-03-18 05:52:32', '2022-03-18 05:52:32', '2023-03-18 12:52:32'),
('b10db215a4821b33fb69b1d4ec60d718bd4caf56d0fe51c8cb647c652f241ef27b2e0f5cbfdccddd', 2, 1, 'nApp', '[]', 0, '2021-09-29 22:57:08', '2021-09-29 22:57:08', '2022-09-30 05:57:08'),
('b18e9aa4a0de1c195e4a3c214531fe2302cb7cca37776c34ed44e212c98354f85452f59c28f4b643', 2, 1, 'nApp', '[]', 0, '2022-03-13 14:58:13', '2022-03-13 14:58:13', '2023-03-13 21:58:13'),
('b66a9205da4cd6143c1d38f9ea3e4baa4d22a4457a87eabc9e58b11f757a2b0a84ea0f16963a73f1', 7, 1, 'nApp', '[]', 0, '2021-10-04 04:36:05', '2021-10-04 04:36:05', '2022-10-04 11:36:05'),
('b951c4b891d9f2e760e59476a7e97e109b28dd854bc8bf85139fc5c6aff54391a21fae0bb0ec6226', 5, 1, 'nApp', '[]', 0, '2021-11-14 15:56:24', '2021-11-14 15:56:24', '2022-11-14 22:56:24'),
('b9d82b45d2b76da226d6c677e8bbf8aa20cb028c8c418f5b980b43acffd41326d71314a0486701b5', 2, 3, 'nApp', '[]', 0, '2022-03-18 05:50:56', '2022-03-18 05:50:56', '2023-03-18 12:50:56'),
('ba0afd34362651d31a651c4f7e00b73420574cd02131bd6768dc124d9c2fd93cedaeb087c898957a', 2, 1, 'nApp', '[]', 0, '2021-09-30 00:50:04', '2021-09-30 00:50:04', '2022-09-30 07:50:04'),
('bd3ed801ed22882c928e66add30d51b2028dcc12c519c04c59415c9ffba4aa9afb4e1200abf29282', 5, 1, 'nApp', '[]', 0, '2021-10-19 10:04:57', '2021-10-19 10:04:57', '2022-10-19 17:04:57'),
('c021df553e6840e3d6c4c58552f1e9ab0a08c3673f01140e755dec674bdfef677f15dddf709da84f', 2, 1, 'nApp', '[]', 0, '2021-10-14 12:50:26', '2021-10-14 12:50:26', '2022-10-14 19:50:26'),
('c15e3fefadc1a55fc33b1109f917f70e9daa70851d4ce1f2b0aa31417cb35cc6733773ff7d1588a8', 19, 1, 'nApp', '[]', 0, '2021-12-01 05:00:36', '2021-12-01 05:00:36', '2022-12-01 12:00:36'),
('c680c377da753579918ae9b5aa9db9cded09f651ee511e6e9743f57d6b7005efff443dc3c12a6104', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:05:13', '2021-12-23 15:05:13', '2022-12-23 22:05:13'),
('c89ea0822bf4a95fe74fb486957045102f87fba960d0e2b9a7a41d778bac7b08bd50c8e7d55e9be7', 19, 1, 'nApp', '[]', 0, '2021-11-30 14:25:34', '2021-11-30 14:25:34', '2022-11-30 21:25:34'),
('ce6a2247151ef419473dc0d1e2ba5af9f6f2d62c273b449aa49c680ace23f63aea9c575c434500e3', 5, 1, 'nApp', '[]', 0, '2021-10-25 13:50:43', '2021-10-25 13:50:43', '2022-10-25 20:50:43'),
('d02ede39e9b6b96cf8bb0ffad229f769fa30e786ec6f54516344a4e13cb0d4c6bc7e17b3d0602c86', 5, 1, 'nApp', '[]', 0, '2021-09-30 09:52:30', '2021-09-30 09:52:30', '2022-09-30 16:52:30'),
('d0dcdc0edd17e8d9188a37e5d22e2113bfa32ab3e4e8bd0fef523a6d5e6bed17a72a0bfad542a0cc', 2, 3, 'nApp', '[]', 0, '2022-03-17 14:27:26', '2022-03-17 14:27:26', '2023-03-17 21:27:26'),
('d17acbe752697bda53d2c51879b3cbead9e42d77bb335884289064cdbe5b2088a388508a9ef95bf0', 7, 1, 'nApp', '[]', 0, '2021-10-13 02:03:22', '2021-10-13 02:03:22', '2022-10-13 09:03:22'),
('d3127823e2c7fee1f8774f48f6c242ccf6a8b24b5804bef94ce5d97316461b58e8052aa59e0c3c7f', 5, 1, 'nApp', '[]', 0, '2021-10-13 04:15:46', '2021-10-13 04:15:46', '2022-10-13 11:15:46'),
('d496473b85d5cbbb566ddf3ad7bd5d4b4198e673f8fd2ffe71f76023da805b12f7d3d479a0854a81', 5, 1, 'nApp', '[]', 0, '2021-09-30 01:00:05', '2021-09-30 01:00:05', '2022-09-30 08:00:05'),
('d8a4382befc1e86a9caf68a217ba7b035238ee664746987a31933789dba81744c35572c90225ef27', 2, 1, 'nApp', '[]', 0, '2021-10-14 09:47:22', '2021-10-14 09:47:22', '2022-10-14 16:47:22'),
('db6d861cbeab53843daa3bca73b8cdcd8b1ac7c4247b0306b986baa8be82b67b774ea26e00790046', 19, 1, 'nApp', '[]', 0, '2021-11-30 16:07:30', '2021-11-30 16:07:30', '2022-11-30 23:07:30'),
('e51469fc9c94d08fe50894005b3e26d12f933c1a548b533def198b772e7ab7aae27419d189970ce8', 2, 1, 'nApp', '[]', 0, '2021-09-29 23:05:21', '2021-09-29 23:05:21', '2022-09-30 06:05:21'),
('e575195b9d4056256c69d6cfa7bf2f59d1b78602c30248dda9d2be8ef68b21faf57602df6bd46501', 19, 1, 'nApp', '[]', 0, '2021-11-12 11:04:15', '2021-11-12 11:04:15', '2022-11-12 18:04:15'),
('e71b19b826eeee65e360712fe2d980ecc5f73a74f43c4b9aee6bf9b2491fac567a2d3d565668f381', 5, 1, 'nApp', '[]', 0, '2021-12-27 06:22:41', '2021-12-27 06:22:41', '2022-12-27 13:22:41'),
('e96f3b37d073823d71eb8c9063654acd94a063e33adca4df8395c648fbb384154b847cccdad7e07e', 5, 1, 'nApp', '[]', 0, '2021-10-26 15:19:03', '2021-10-26 15:19:03', '2022-10-26 22:19:03'),
('ebf14cecbf59fa40765a344ce3942eab607780607cc677257d8ec814decd72649a7276352f9cd4b6', 5, 1, 'nApp', '[]', 0, '2021-10-12 23:42:31', '2021-10-12 23:42:31', '2022-10-13 06:42:31'),
('f064ae7ac8a54ddc55b7399d9f9dcec698a3981dff737624f0cc08e8360e52ea32229cffc37afe9f', 5, 1, 'nApp', '[]', 0, '2021-12-26 11:50:09', '2021-12-26 11:50:09', '2022-12-26 18:50:09'),
('f07db2db623507dcd9e32517f336d151810c7f8f9d2e3f19511cba5631829af128a654cced240fd7', 5, 1, 'nApp', '[]', 0, '2021-12-27 06:46:01', '2021-12-27 06:46:01', '2022-12-27 13:46:01'),
('f33e138d25b5f598240d9f6b99d2597be7ac7564e29875cd68fb520139b83ee4f48d075e4f289385', 5, 1, 'nApp', '[]', 0, '2021-12-25 03:29:25', '2021-12-25 03:29:25', '2022-12-25 10:29:25'),
('f61a9a6f8d318904a2861ca6de21201f4df43ff5a6b0579bec6634337ef759e075967d08be59d8c2', 5, 1, 'nApp', '[]', 0, '2021-11-15 03:30:19', '2021-11-15 03:30:19', '2022-11-15 10:30:19'),
('f7677dd7889fbe2698aa95912f8a0df2311a72ec5a95f0f7a36a65eb46dc4716295878c940336da7', 6, 1, 'nApp', '[]', 0, '2021-10-01 06:55:23', '2021-10-01 06:55:23', '2022-10-01 13:55:23'),
('f86ad14e26608ce8289f7406740397d226adaae646f34b3f7af4d5fd34ce6c67e414cd990dd51fad', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:02:31', '2021-12-23 15:02:31', '2022-12-23 22:02:31'),
('f873857e5fd53d6e54bba7f50762c6ddf5edf7b579df1433c802b564f0f102d21101f809a458df5c', 5, 1, 'nApp', '[]', 0, '2021-12-23 15:12:24', '2021-12-23 15:12:24', '2022-12-23 22:12:24'),
('f89e221cd599f21bca88a987bb199305394857e6f0688cd08d3fcecabf1747eb9969bcbdc402fc08', 22, 3, 'nApp', '[]', 0, '2022-03-20 14:06:38', '2022-03-20 14:06:38', '2023-03-20 21:06:38'),
('f9dbe11818752d8107b4ab5903c863cf30a67d4e3981b103dc5782a0e8fde1b77ab884adf8f828d2', 5, 1, 'nApp', '[]', 0, '2021-12-27 08:04:41', '2021-12-27 08:04:41', '2022-12-27 15:04:41'),
('fe0234bf54710d32656660f021fd2c80f46d476ea2356c31fbed39a7ea15163b66fc438352133940', 2, 3, 'nApp', '[]', 0, '2022-03-18 05:55:41', '2022-03-18 05:55:41', '2023-03-18 12:55:41');

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
(2, NULL, 'Kreatora Password Grant Client', 'Cnk1PTwan5ExLt2sD8GmewgaMCii1uijLo7iZTv7', 'http://localhost', 0, 1, 0, '2021-09-29 19:35:56', '2021-09-29 19:35:56'),
(3, NULL, 'Kreatora Personal Access Client', 'ksnzcTQCaFLOPKarzNPnrOJ6tWIFn9Emd0p8Ulv7', 'http://localhost', 1, 0, 0, '2022-03-13 15:14:19', '2022-03-13 15:14:19'),
(4, NULL, 'Kreatora Password Grant Client', 'JgWdqZUxAiMoV0knMn1knHdvAtKgmXzrIhSJaD8r', 'http://localhost', 0, 1, 0, '2022-03-13 15:14:19', '2022-03-13 15:14:19');

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
(1, 1, '2021-09-29 19:35:56', '2021-09-29 19:35:56'),
(2, 3, '2022-03-13 15:14:19', '2022-03-13 15:14:19');

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
(3, NULL, '61780ef88225fb52ee44fdbc', '619131beb3035va13', 'beny', '889089999875484', 'MANDIRI', 150000, 'virtual_account', 'PENDING', NULL, '2021-11-15 08:56:46', NULL, '2021-11-14 15:56:48', '2021-11-14 15:56:48'),
(4, NULL, '61780ef88225fb52ee44fdbc', '6191d4a43b402va14', 'beny', '889089999038307', 'MANDIRI', 150000, 'virtual_account', 'PENDING', NULL, '2021-11-15 20:31:48', NULL, '2021-11-15 03:31:50', '2021-11-15 03:31:50'),
(5, NULL, '61780ef88225fb52ee44fdbc', '61920cbcd1705va15', 'sidex', '107669999157832', 'BCA', 30000, 'virtual_account', 'PENDING', NULL, '2021-11-16 00:31:08', NULL, '2021-11-15 07:31:09', '2021-11-15 07:31:09'),
(6, NULL, '61780ef88225fb52ee44fdbc', '61920d48607b1va16', 'beny', '889089999917648', 'MANDIRI', 150000, 'virtual_account', 'PENDING', NULL, '2021-11-16 00:33:28', NULL, '2021-11-15 07:33:29', '2021-11-15 07:33:29'),
(7, NULL, '61780ef88225fb52ee44fdbc', '61920f06f3cc9va17', 'sidex', '107669999614009', 'BCA', 30000, 'virtual_account', 'PENDING', NULL, '2021-11-16 00:40:54', NULL, '2021-11-15 07:40:56', '2021-11-15 07:40:56'),
(8, NULL, '61780ef88225fb52ee44fdbc', '61921c5985e0dva18', 'XDT-sidex', '8808999916822430', 'BNI', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 01:37:45', NULL, '2021-11-15 08:37:47', '2021-11-15 08:37:47'),
(9, NULL, '61780ef88225fb52ee44fdbc', '61921e234020bva19', 'sidex', '107669999792061', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 01:45:23', NULL, '2021-11-15 08:45:24', '2021-11-15 08:45:24'),
(10, NULL, '61780ef88225fb52ee44fdbc', '61921e2482062va20', 'sidex', '107669999491491', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 01:45:24', NULL, '2021-11-15 08:45:25', '2021-11-15 08:45:25'),
(11, NULL, '61780ef88225fb52ee44fdbc', '619223c463cdbva21', 'sidex', '107669999444159', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:24', NULL, '2021-11-15 09:09:25', '2021-11-15 09:09:25'),
(12, NULL, '61780ef88225fb52ee44fdbc', '619223c4ebf78va22', 'sidex', '107669999518432', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:24', NULL, '2021-11-15 09:09:25', '2021-11-15 09:09:25'),
(13, NULL, '61780ef88225fb52ee44fdbc', '619223d66ac3eva23', 'sidex', '107669999390642', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:42', NULL, '2021-11-15 09:09:43', '2021-11-15 09:09:43'),
(14, NULL, '61780ef88225fb52ee44fdbc', '619223d744e99va24', 'sidex', '107669999016410', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:43', NULL, '2021-11-15 09:09:44', '2021-11-15 09:09:44'),
(15, NULL, '61780ef88225fb52ee44fdbc', '619223d78cab0va25', 'sidex', '107669999629448', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:43', NULL, '2021-11-15 09:09:44', '2021-11-15 09:09:44'),
(16, NULL, '61780ef88225fb52ee44fdbc', '619223d7a2650va26', 'sidex', '107669999663327', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:43', NULL, '2021-11-15 09:09:44', '2021-11-15 09:09:44'),
(17, NULL, '61780ef88225fb52ee44fdbc', '619223d832662va27', 'sidex', '107669999026159', 'BCA', 10000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:09:44', NULL, '2021-11-15 09:09:45', '2021-11-15 09:09:45'),
(18, NULL, '61780ef88225fb52ee44fdbc', '61922400f40d5va28', 'sidex', '107669999088116', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:24', NULL, '2021-11-15 09:10:26', '2021-11-15 09:10:26'),
(19, NULL, '61780ef88225fb52ee44fdbc', '6192240187efava29', 'sidex', '107669999051597', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:25', NULL, '2021-11-15 09:10:26', '2021-11-15 09:10:26'),
(20, NULL, '61780ef88225fb52ee44fdbc', '61922401b3d8bva30', 'sidex', '107669999772521', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:25', NULL, '2021-11-15 09:10:26', '2021-11-15 09:10:26'),
(21, NULL, '61780ef88225fb52ee44fdbc', '61922401d498bva31', 'sidex', '107669999502993', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:25', NULL, '2021-11-15 09:10:26', '2021-11-15 09:10:26'),
(22, NULL, '61780ef88225fb52ee44fdbc', '619224020d5b3va32', 'sidex', '107669999793501', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:10:26', NULL, '2021-11-15 09:10:27', '2021-11-15 09:10:27'),
(23, NULL, '61780ef88225fb52ee44fdbc', '61922725407b5va33', 'sidex', '107669999022272', 'BCA', 90000, 'virtual_account', 'PENDING', NULL, '2021-11-16 02:23:49', NULL, '2021-11-15 09:23:50', '2021-11-15 09:23:50'),
(24, NULL, '61780ef88225fb52ee44fdbc', '619395f92fa1cva34', 'sidex', '107669999317300', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:28:57', NULL, '2021-11-16 11:28:58', '2021-11-16 11:28:58'),
(25, NULL, '61780ef88225fb52ee44fdbc', '619395fb3605fva35', 'sidex', '107669999439958', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:28:59', NULL, '2021-11-16 11:29:00', '2021-11-16 11:29:00'),
(26, NULL, '61780ef88225fb52ee44fdbc', '619395fb55741va36', 'sidex', '107669999140203', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:28:59', NULL, '2021-11-16 11:29:00', '2021-11-16 11:29:00'),
(27, NULL, '61780ef88225fb52ee44fdbc', '619395fb76903va37', 'sidex', '107669999102502', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:28:59', NULL, '2021-11-16 11:29:00', '2021-11-16 11:29:00'),
(28, NULL, '61780ef88225fb52ee44fdbc', '619395fc1d4f4va39', 'sidex', '107669999673666', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:29:00', NULL, '2021-11-16 11:29:01', '2021-11-16 11:29:01'),
(29, NULL, '61780ef88225fb52ee44fdbc', '619395fc1657eva38', 'sidex', '107669999426494', 'BCA', 100000, 'virtual_account', 'PENDING', NULL, '2021-11-17 04:29:00', NULL, '2021-11-16 11:29:01', '2021-11-16 11:29:01'),
(30, NULL, '61780ef88225fb52ee44fdbc', '6197aa8142c9bva40', 'sidex', '107669999152086', 'BCA', 1000000, 'virtual_account', 'PENDING', NULL, '2021-11-20 06:45:37', NULL, '2021-11-19 13:45:38', '2021-11-19 13:45:38'),
(31, NULL, '61780ef88225fb52ee44fdbc', '6197ac35eb798va41', 'XDT-sidex', '8808999966532326', 'BNI', 90000, 'virtual_account', 'PENDING', NULL, '2021-11-20 06:52:53', NULL, '2021-11-19 13:52:55', '2021-11-19 13:52:55'),
(32, NULL, '61780ef88225fb52ee44fdbc', '6199ec3d179eeva42', 'sidexyuj', '107669999913832', 'BCA', 90000, 'virtual_account', 'PENDING', NULL, '2021-11-21 23:50:37', NULL, '2021-11-21 06:50:38', '2021-11-21 06:50:38'),
(33, NULL, NULL, '61a3a7f6952da-xen-43', NULL, NULL, 'ID_SHOPEEPAY', 150000, 'e_wallet', 'PENDING', NULL, NULL, NULL, '2021-11-28 16:01:59', '2021-11-28 16:01:59'),
(34, NULL, '61780ef88225fb52ee44fdbc', '61a64472a3ea9-xen-44', 'sidexyuj', '107669999905691', 'BCA', 20000, 'virtual_account', 'PENDING', NULL, '2021-12-01 08:34:10', NULL, '2021-11-30 15:34:11', '2021-11-30 15:34:11');

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
(41, 'browse_hooks', NULL, '2021-09-22 20:58:06', '2021-09-22 20:58:06'),
(42, 'browse_campaigns', 'campaigns', '2022-03-11 13:29:36', '2022-03-11 13:29:36'),
(43, 'read_campaigns', 'campaigns', '2022-03-11 13:29:36', '2022-03-11 13:29:36'),
(44, 'edit_campaigns', 'campaigns', '2022-03-11 13:29:36', '2022-03-11 13:29:36'),
(45, 'add_campaigns', 'campaigns', '2022-03-11 13:29:36', '2022-03-11 13:29:36'),
(46, 'delete_campaigns', 'campaigns', '2022-03-11 13:29:36', '2022-03-11 13:29:36'),
(47, 'browse_campaign_categories', 'campaign_categories', '2022-03-19 12:50:22', '2022-03-19 12:50:22'),
(48, 'read_campaign_categories', 'campaign_categories', '2022-03-19 12:50:22', '2022-03-19 12:50:22'),
(49, 'edit_campaign_categories', 'campaign_categories', '2022-03-19 12:50:22', '2022-03-19 12:50:22'),
(50, 'add_campaign_categories', 'campaign_categories', '2022-03-19 12:50:22', '2022-03-19 12:50:22'),
(51, 'delete_campaign_categories', 'campaign_categories', '2022-03-19 12:50:22', '2022-03-19 12:50:22');

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
(40, 3),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1);

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
  `campaign_id` int(10) UNSIGNED DEFAULT NULL,
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
  `campaign_id` int(10) UNSIGNED DEFAULT NULL,
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
(1, 1, 'Admin', 'admin@admin.com', 'users/March2022/A4PDNjlsHhfBnvAu1rPa.jpg', '$2y$10$q3RCVvSqN4xk/AxA43WxCeBhg44Svpr1HFk0I4GgxB8gYK3p2Wnia', 'xxOhpMYgmZPJmxA9hIUhT5czpMnJrakFW2jY42X2KWlhiq4rBAMYTJ74bQ16', '2021-10-04 04:35:57', '{\"locale\":\"en\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-22 20:58:06', '2022-03-11 03:01:21', NULL),
(2, 3, 'Kreator', 'kreator@gmail.com', 'users/default.png', '$2y$10$nAUQVd.Iab7LlQ5l1HhykuOYFv5q03GRN7pH3AZlNqXphc/qNjsYW', NULL, '2021-10-04 04:35:57', '{\"locale\":\"en\"}', '08112222000111', 'JL Kreasi No 99', NULL, NULL, 'male', '112233445', 'users/ktp_Kreator_701681.jpg', NULL, '2021-09-29 20:56:54', '2022-03-18 05:55:41', NULL),
(3, 2, 'Baker', 'baker@gmail.com', 'users/default.png', '$2y$10$nIZNZ6E.r4VuKD/jh1FyX.zsNd0xOeselIqyID4ziHDd9DX8JzUJe', 'zVu3xlaBZJeT5c6JazJwGtHgccxgc1Y9LPJCA5fRHXb3IbhohCoFfh3uYtvi', '2021-10-04 04:35:57', '{\"locale\":\"en\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-29 20:56:54', '2021-09-29 20:56:54', NULL),
(4, 3, 'Ahmad Saputra', 'ahmad@gmail.com', 'users/default.png', '$2y$10$SMPAl63ScGXHvRmZQIrpsuNffsHjJJV/A84dkDdhtp9aXLYo07pOS', NULL, '2021-10-04 04:35:57', '{\"locale\":\"en\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-30 00:59:53', '2021-09-30 02:45:35', NULL),
(5, 2, 'Beny Dollodolo', 'beny@gmail.com', 'users/March2022/4QwETicFc6xSubu0I7Y8.jpeg', '$2y$10$88Up2pgUc8XrY8kaYLJb4OTmwjPkBKiMkja5ouAMNptxlcQVtEWdG', '175478', '2021-10-04 04:35:57', '{\"locale\":\"en\"}', '08123456789', 'JL Mangga Dua Jakarta', NULL, NULL, 'male', NULL, NULL, 'fcm 2', '2021-09-30 09:57:09', '2022-03-13 14:48:20', NULL),
(6, 3, 'Cheril Aulia Saputri', 'cheril@gmail.com', 'users/default.png', '$2y$10$SMPAl63ScGXHvRmZQIrpsuNffsHjJJV/A84dkDdhtp9aXLYo07pOS', NULL, '2021-10-04 04:35:57', '{\"locale\":\"en\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-04 04:34:28', '2021-10-04 04:37:52', NULL),
(18, 2, 'Elang', 'elang@gmail.com', 'users/March2022/kffwEZZ6U5BGdVlnVUvY.jpeg', '$2y$10$HLW3V7rYvhMjiHgo7W377usNUdQnU/1DWf8wJvFBj42zc.OhKftVm', '523076', NULL, '{\"locale\":\"en\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-14 09:45:12', '2022-03-11 02:50:19', '2021-10-04 04:37:52'),
(21, 2, 'as', 'as@gmail.com', 'users/default.png', '$2y$10$Z2JLmk7u4wDzl7Bh1UnXPu851.2MM15FJINk5xy6KqjzNsl/T1AY2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-11 13:28:30', '2022-03-11 13:28:30', NULL),
(22, 2, 'sidex', 'ivan.sidiq.is@gmail.com', 'users/default.png', '$2y$10$Fx7pn.BNyTO6pfWxVdmXV.nTl3AvuqCklIK03ykSyNazFutihSzeq', NULL, '2022-03-18 07:08:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-18 07:00:32', '2022-03-18 07:08:10', NULL),
(23, 2, 'ivan', 'ivan.msidiq@gmail.com', 'users/default.png', '$2y$10$zU9Zhd0PBzY9hTDBmP/bbulCOPy8PJcH..vifj6ypU2q46BQsJRzm', NULL, '2022-03-18 07:08:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-18 07:05:20', '2022-03-18 07:08:22', NULL),
(24, 2, 'dexy', 'ivan@mailinator.com', 'users/default.png', '$2y$10$eF9UvRGHZuIGYsNjqxrjUevkzP2vPm8LpgcEZcEex60GAwT9hXUVy', '8470', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-18 07:27:10', '2022-03-18 07:27:10', NULL),
(25, 2, 'Sena Broto', 'senabroto1@gmail.com', 'users/default.png', '$2y$10$T7Ey7dyJEQO3RWEuYn57UOGA/Xw7NHWeW9ufihynp523PWfkVb56O', NULL, '2022-03-19 14:49:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-19 14:48:13', '2022-03-19 14:49:45', NULL),
(27, 2, 'Nuwas DT', 'nuwasdzarrin3@gmail.com', 'users/default.png', '$2y$10$5r6RU6gTA27JbCGuBRLY..eDxjzeSQIR5g.QdhACH61Fq1EwLvVtC', NULL, '2022-03-20 13:52:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-20 13:52:13', '2022-03-20 13:52:38', NULL);

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
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'IDR',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `uuid`, `user_id`, `balance`, `currency`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 5, '100000', 'IDR', 'saved', '2021-12-27 04:57:22', '2021-12-27 04:57:22', NULL),
(2, NULL, 22, '0', 'IDR', NULL, '2022-03-18 07:00:32', '2022-03-18 07:00:32', NULL),
(3, NULL, 23, '0', 'IDR', NULL, '2022-03-18 07:05:20', '2022-03-18 07:05:20', NULL),
(4, NULL, 24, '0', 'IDR', NULL, '2022-03-18 07:27:10', '2022-03-18 07:27:10', NULL),
(5, NULL, 25, '0', 'IDR', NULL, '2022-03-19 14:48:13', '2022-03-19 14:48:13', NULL),
(6, NULL, NULL, '0', 'IDR', NULL, '2022-03-20 13:27:04', '2022-03-20 13:27:04', NULL),
(7, NULL, 27, '0', 'IDR', NULL, '2022-03-20 13:52:13', '2022-03-20 13:52:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_histories`
--

CREATE TABLE `wallet_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `wallet_id` int(10) UNSIGNED DEFAULT NULL,
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `campaign_categories`
--
ALTER TABLE `campaign_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `campaigns_campaign_category_id_foreign` FOREIGN KEY (`campaign_category_id`) REFERENCES `campaign_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `campaigns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

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
  ADD CONSTRAINT `faqs_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `faqs_user_answer_id_foreign` FOREIGN KEY (`user_answer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `faqs_user_question_id_foreign` FOREIGN KEY (`user_question_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

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
  ADD CONSTRAINT `rewards_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `updates`
--
ALTER TABLE `updates`
  ADD CONSTRAINT `updates_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

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
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  ADD CONSTRAINT `wallet_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `wallet_histories_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
