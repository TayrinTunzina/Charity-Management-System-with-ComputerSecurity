-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 03:19 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `charity_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(30) NOT NULL,
  `title` text NOT NULL,
  `topic_id` int(30) DEFAULT NULL,
  `content` text NOT NULL,
  `keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `banner_path` text NOT NULL,
  `upload_dir_code` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = inactive ,1= active',
  `blog_url` text NOT NULL,
  `author_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `topic_id`, `content`, `keywords`, `meta_description`, `banner_path`, `upload_dir_code`, `status`, `blog_url`, `author_id`, `date_created`, `date_updated`) VALUES
(1, 'Donation for disabled people', 1, '&lt;p&gt;&lt;span style=\\&quot;text-align: justify;\\&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae massa quis tellus ullamcorper auctor at in mi. Vestibulum euismod, nulla sit amet rhoncus iaculis, sapien justo sodales purus, nec finibus massa massa eget ante. Maecenas vitae eros in purus dictum porttitor. Integer arcu dui, dictum ac tellus et, ultricies condimentum est. Maecenas rutrum erat tincidunt dui rutrum fermentum. Nullam pretium molestie gravida. Sed mi justo, porta id justo ac, ornare aliquam est. Cras porta nisi eu eleifend tincidunt. Donec malesuada interdum orci sit amet sollicitudin. Maecenas sed augue condimentum justo vulputate interdum vel in lacus.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;text-align: justify;\\&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;div style=\\&quot;text-align: center;\\&quot;&gt;&lt;/div&gt;&lt;div style=\\&quot;\\&quot;&gt;&lt;span style=\\&quot;text-align: justify;\\\\\\&quot;&gt;Quisque sagittis varius magna ac pharetra. Nunc lobortis sapien nisl, ac fringilla enim pellentesque vitae. Vestibulum congue lorem non sapien lobortis iaculis. Sed commodo sit amet turpis sed porta. Phasellus arcu nulla, facilisis in nulla at, pharetra lobortis ligula. Nullam dignissim, nunc eget consectetur facilisis, tortor felis lacinia diam, a vestibulum magna mauris eget mi. Donec tellus ipsum, euismod at hendrerit a, consequat viverra tellus.&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;p&gt;&lt;/p&gt;', 'Sample Keyword, 101, 102, 103', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae massa quis tellus ullamcorper auctor at in mi. Vestibulum euismod, nulla sit amet rhoncus iaculis, sapien justo sodales purus, nec finibus massa massa eget ante.', 'uploads/blog_uploads/banners/1_banner.jpg', 'Zk1pDmHIo2', 1, 'pages/sample_101.php', 1, '2024-08-17 12:56:54', '2024-05-04 03:13:41'),
(2, 'Donations for children', 1, '&lt;h3 style=\\&quot;text-align: center; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Sample Content Only&lt;/h3&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Nullam pulvinar libero id justo faucibus elementum. Donec euismod ante tellus, et pulvinar ipsum tincidunt ac. Proin efficitur eros eu orci imperdiet fringilla. Sed ullamcorper luctus lacus, in varius sapien tincidunt gravida. Praesent elit massa, accumsan a purus id, hendrerit tincidunt risus. Nam luctus dictum ante in pellentesque. Proin eget eros in nisl lacinia semper at faucibus risus. Cras sit amet sagittis risus, non tempus neque. Proin aliquam dignissim augue, eget semper eros ultrices id. In consequat lorem mattis lobortis scelerisque. Fusce lorem arcu, condimentum iaculis nisl sed, mollis commodo nibh. Suspendisse convallis at libero id fermentum.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Etiam ac dolor tincidunt, tincidunt erat vitae, tempor sem. Nulla auctor lectus nisi, non dictum tortor hendrerit at. Proin ultricies aliquam ex, eu facilisis dolor lobortis a. Aenean varius vitae ante at pharetra. Praesent rutrum metus et tellus condimentum sollicitudin. Aenean et euismod risus, vitae tincidunt enim. Cras nec augue massa. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean facilisis semper sapien. Curabitur sem purus, blandit rutrum urna ac, pharetra finibus massa. Morbi pharetra efficitur faucibus. Vivamus scelerisque sem eu nunc vulputate efficitur. Vestibulum porttitor nisi dolor, ut pharetra dui consequat quis.&lt;/p&gt;', 'Sample, Content, Sample 102, keyword', 'Nullam pulvinar libero id justo faucibus elementum. Donec euismod ante tellus, et pulvinar ipsum tincidunt ac. Proin efficitur eros eu orci imperdiet fringilla. Sed ullamcorper luctus lacus, in varius sapien tincidunt gravida', 'uploads/blog_uploads/banners/2_banner.jpg', '', 1, 'pages/sample_102.php', 1, '2024-08-17 13:57:56', '2024-05-04 03:13:24'),
(4, 'test', 2, '', '', '', 'uploads/blog_uploads/banners/4_banner.png', '', 0, 'pages/test.php', 1, '2024-03-12 12:31:42', '2024-05-04 02:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `fund_raised` decimal(10,2) DEFAULT NULL,
  `fund_goal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `blog_id`, `fund_raised`, `fund_goal`) VALUES
(1, 1, '1760.00', '3000.00'),
(2, 4, '400000.00', '400000.00'),
(3, 2, '2185.00', '10000.00');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(30) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `schedule` date NOT NULL,
  `img_path` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `schedule`, `img_path`, `date_created`) VALUES
(1, 'Sample Event', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae massa quis tellus ullamcorper auctor at in mi. Vestibulum euismod, nulla sit amet rhoncus iaculis, sapien justo sodales purus, nec finibus massa massa eget ante. Maecenas vitae eros in purus dictum porttitor. Integer arcu dui, dictum ac tellus et, ultricies condimentum est. Maecenas rutrum erat tincidunt dui rutrum fermentum. Nullam pretium molestie gravida. Sed mi justo, porta id justo ac, ornare aliquam est. Cras porta nisi eu eleifend tincidunt. Donec malesuada interdum orci sit amet sollicitudin. Maecenas sed augue condimentum justo vulputate interdum vel in lacus.', '2021-08-23', 'uploads/events/1.jpg', '2021-08-17 15:16:11'),
(3, 'Event 102', 'Sample Only', '2021-08-25', 'uploads/events/3.jpg', '2021-08-17 15:17:52'),
(4, 'Sample Event 3', 'Sample Event only', '2021-08-30', 'uploads/events/4.jpg', '2021-08-17 15:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `attempts`, `last_attempt`) VALUES
(1, '::1', 0, '2024-05-01 11:01:52'),
(2, '::1', 0, '2024-05-01 11:02:11'),
(3, '::1', 0, '2024-05-01 11:02:14'),
(4, '::1', 0, '2024-05-01 11:02:25'),
(5, '::1', 0, '2024-05-01 11:02:27'),
(6, '::1', 0, '2024-05-01 11:02:30'),
(7, '::1', 0, '2024-05-01 11:02:33'),
(8, '::1', 0, '2024-05-01 11:02:38'),
(9, '::1', 0, '2024-05-01 11:03:05'),
(10, '::1', 0, '2024-05-01 11:15:40'),
(11, '::1', 0, '2024-05-01 11:23:53'),
(12, '::1', 0, '2024-05-01 11:24:04'),
(13, '::1', 0, '2024-05-01 11:24:05'),
(14, '::1', 0, '2024-05-01 11:24:41'),
(15, '::1', 0, '2024-05-01 11:24:52'),
(16, '::1', 0, '2024-05-01 11:25:53'),
(17, '::1', 0, '2024-05-01 11:26:01'),
(18, '::1', 0, '2024-05-01 11:30:01'),
(19, '::1', 0, '2024-05-01 11:30:11'),
(20, '::1', 0, '2024-05-01 11:30:15'),
(21, '::1', 0, '2024-05-01 11:30:33'),
(22, '::1', 0, '2024-05-01 11:32:02'),
(23, '::1', 0, '2024-05-01 11:32:11'),
(24, '::1', 0, '2024-05-01 11:32:17'),
(25, '::1', 0, '2024-05-01 11:32:20'),
(26, '::1', 0, '2024-05-01 11:32:50'),
(27, '::1', 0, '2024-05-01 11:36:59'),
(28, '::1', 0, '2024-05-01 11:37:08'),
(29, '::1', 0, '2024-05-01 11:37:13'),
(30, '::1', 0, '2024-05-01 11:37:15'),
(31, '::1', 0, '2024-05-01 11:37:26'),
(32, '::1', 0, '2024-05-01 11:37:31'),
(33, '::1', 0, '2024-05-01 11:37:33'),
(34, '::1', 0, '2024-05-01 11:37:36'),
(35, '::1', 0, '2024-05-01 11:37:42'),
(36, '::1', 0, '2024-05-01 11:38:13'),
(37, '::1', 0, '2024-05-01 11:38:22'),
(38, '::1', 0, '2024-05-01 11:38:25'),
(39, '::1', 0, '2024-05-01 11:38:27'),
(40, '::1', 0, '2024-05-01 11:39:48'),
(41, '::1', 0, '2024-05-01 11:39:59'),
(42, '::1', 0, '2024-05-01 11:40:01'),
(43, '::1', 0, '2024-05-01 11:40:02'),
(44, '::1', 0, '2024-05-01 11:40:15'),
(45, '::1', 0, '2024-05-01 11:40:37'),
(46, '::1', 0, '2024-05-01 11:40:46'),
(47, '::1', 0, '2024-05-01 11:40:48'),
(48, '::1', 0, '2024-05-01 11:40:50'),
(49, '::1', 0, '2024-05-01 11:40:57'),
(50, '::1', 0, '2024-05-01 11:41:03'),
(51, '::1', 0, '2024-05-01 11:41:16'),
(52, '::1', 0, '2024-05-01 11:41:25'),
(53, '::1', 0, '2024-05-01 11:41:36'),
(54, '::1', 0, '2024-05-01 11:41:40'),
(55, '::1', 0, '2024-05-01 11:41:41'),
(56, '::1', 0, '2024-05-01 11:41:52'),
(57, '::1', 0, '2024-05-01 11:42:02'),
(58, '::1', 0, '2024-05-01 11:42:04'),
(59, '::1', 0, '2024-05-01 11:42:04'),
(60, '::1', 0, '2024-05-01 11:42:12'),
(61, '::1', 0, '2024-05-01 11:42:16'),
(62, '::1', 0, '2024-05-01 11:44:20'),
(63, '::1', 0, '2024-05-01 11:44:29'),
(64, '::1', 0, '2024-05-01 11:44:33'),
(65, '::1', 0, '2024-05-01 11:44:45'),
(66, '::1', 0, '2024-05-01 11:44:46'),
(67, '::1', 0, '2024-05-01 11:44:47'),
(68, '::1', 0, '2024-05-01 11:44:48'),
(69, '::1', 0, '2024-05-01 11:44:49'),
(70, '::1', 0, '2024-05-01 11:44:49'),
(71, '::1', 0, '2024-05-01 11:44:50'),
(72, '::1', 0, '2024-05-01 11:45:26'),
(73, '::1', 0, '2024-05-01 11:46:35'),
(74, '::1', 0, '2024-05-02 17:10:58'),
(75, '::1', 0, '2024-05-02 17:18:57'),
(76, '::1', 0, '2024-05-02 17:19:03'),
(77, '::1', 0, '2024-05-02 17:19:11'),
(78, '::1', 0, '2024-05-02 17:25:39'),
(79, '::1', 0, '2024-05-02 17:35:06'),
(80, '::1', 0, '2024-05-02 17:35:09'),
(81, '::1', 0, '2024-05-02 17:35:40'),
(82, '::1', 0, '2024-05-02 17:58:28'),
(83, '::1', 0, '2024-05-02 17:58:37'),
(84, '::1', 0, '2024-05-02 17:58:55'),
(85, '::1', 0, '2024-05-02 18:48:04'),
(86, '::1', 0, '2024-05-02 18:48:44'),
(87, '::1', 0, '2024-05-02 18:48:47'),
(88, '::1', 0, '2024-05-02 18:51:12'),
(89, '::1', 0, '2024-05-02 18:51:14'),
(90, '::1', 0, '2024-05-02 18:59:03'),
(91, '::1', 0, '2024-05-02 18:59:21'),
(92, '::1', 0, '2024-05-02 19:00:33'),
(93, '::1', 0, '2024-05-02 19:01:06'),
(94, '::1', 0, '2024-05-02 19:01:13'),
(95, '::1', 0, '2024-05-02 19:01:17'),
(96, '::1', 0, '2024-05-02 19:01:29'),
(97, '::1', 0, '2024-05-02 19:01:46'),
(98, '::1', 0, '2024-05-02 21:17:20'),
(99, '::1', 0, '2024-05-02 21:17:26'),
(100, '::1', 0, '2024-05-02 21:29:39'),
(101, '::1', 0, '2024-05-02 21:29:41'),
(102, '::1', 0, '2024-05-03 08:47:34'),
(103, '::1', 0, '2024-05-03 08:49:13'),
(104, '::1', 0, '2024-05-03 08:49:22'),
(105, '::1', 0, '2024-05-03 08:50:03'),
(106, '::1', 0, '2024-05-03 08:55:48'),
(107, '::1', 0, '2024-05-03 08:56:07'),
(108, '::1', 0, '2024-05-03 09:10:38'),
(109, '::1', 0, '2024-05-03 09:10:46'),
(110, '::1', 0, '2024-05-03 09:11:00'),
(111, '::1', 0, '2024-05-03 09:14:43'),
(112, '::1', 0, '2024-05-03 09:15:46'),
(113, '::1', 0, '2024-05-03 09:17:07'),
(114, '::1', 0, '2024-05-03 09:17:16'),
(115, '::1', 0, '2024-05-03 09:17:42'),
(116, '::1', 0, '2024-05-03 09:18:08'),
(117, '::1', 0, '2024-05-03 09:18:51'),
(118, '::1', 0, '2024-05-03 09:25:40'),
(119, '::1', 0, '2024-05-03 09:25:57'),
(120, '::1', 0, '2024-05-03 09:25:59'),
(121, '::1', 0, '2024-05-03 09:26:37'),
(122, '::1', 0, '2024-05-03 09:27:07'),
(123, '::1', 0, '2024-05-03 09:27:39'),
(124, '::1', 0, '2024-05-03 09:34:12'),
(125, '::1', 0, '2024-05-03 09:34:22'),
(126, '::1', 0, '2024-05-03 09:46:51'),
(127, '::1', 0, '2024-05-03 09:48:00'),
(128, '::1', 0, '2024-05-03 09:48:23'),
(129, '::1', 0, '2024-05-03 09:53:31'),
(130, '::1', 0, '2024-05-03 09:53:41'),
(131, '::1', 0, '2024-05-03 09:54:50'),
(132, '::1', 0, '2024-05-03 09:59:07'),
(133, '::1', 0, '2024-05-03 09:59:19'),
(134, '::1', 0, '2024-05-03 10:00:42'),
(135, '::1', 0, '2024-05-03 10:00:47'),
(136, '::1', 0, '2024-05-03 10:02:03'),
(137, '::1', 0, '2024-05-03 10:02:15'),
(138, '::1', 0, '2024-05-03 10:05:13'),
(139, '::1', 0, '2024-05-03 10:05:25'),
(140, '::1', 0, '2024-05-03 10:10:50'),
(141, '::1', 0, '2024-05-03 10:10:59'),
(142, '::1', 0, '2024-05-03 10:12:06'),
(143, '::1', 0, '2024-05-03 10:17:12'),
(144, '::1', 0, '2024-05-03 10:23:35'),
(145, '::1', 0, '2024-05-03 10:23:48'),
(146, '::1', 0, '2024-05-03 10:33:25'),
(147, '::1', 0, '2024-05-03 10:38:26'),
(148, '::1', 0, '2024-05-03 10:38:27'),
(149, '::1', 0, '2024-05-03 10:38:38'),
(150, '::1', 0, '2024-05-03 10:40:24'),
(151, '::1', 0, '2024-05-03 10:48:29'),
(152, '::1', 0, '2024-05-03 10:56:37'),
(153, '::1', 0, '2024-05-03 11:07:06'),
(154, '::1', 0, '2024-05-03 11:07:40'),
(155, '::1', 0, '2024-05-03 11:09:27'),
(156, '::1', 0, '2024-05-03 11:09:31'),
(157, '::1', 0, '2024-05-03 11:10:08'),
(158, '::1', 0, '2024-05-03 11:11:37'),
(159, '::1', 0, '2024-05-03 11:12:27'),
(160, '::1', 0, '2024-05-03 11:13:26'),
(161, '::1', 0, '2024-05-03 11:17:55'),
(162, '::1', 0, '2024-05-03 11:18:53'),
(163, '::1', 0, '2024-05-03 11:23:03'),
(164, '::1', 0, '2024-05-03 11:27:42'),
(165, '::1', 0, '2024-05-03 11:27:44'),
(166, '::1', 0, '2024-05-03 11:28:03'),
(167, '::1', 0, '2024-05-03 11:28:10'),
(168, '::1', 0, '2024-05-03 11:28:56'),
(169, '::1', 0, '2024-05-03 11:30:12'),
(170, '::1', 0, '2024-05-03 11:30:27'),
(171, '::1', 0, '2024-05-03 11:31:47'),
(172, '::1', 0, '2024-05-03 11:36:23'),
(173, '::1', 0, '2024-05-03 11:36:37'),
(174, '::1', 0, '2024-05-03 11:38:45'),
(175, '::1', 0, '2024-05-03 11:39:53'),
(176, '::1', 0, '2024-05-03 11:42:48'),
(177, '::1', 0, '2024-05-03 11:44:01'),
(178, '::1', 0, '2024-05-03 11:44:14'),
(179, '::1', 0, '2024-05-03 11:44:42'),
(180, '::1', 0, '2024-05-03 11:45:56'),
(181, '::1', 0, '2024-05-03 11:46:10'),
(182, '::1', 0, '2024-05-03 11:46:43'),
(183, '::1', 0, '2024-05-03 11:47:32'),
(184, '::1', 0, '2024-05-03 11:47:49'),
(185, '::1', 0, '2024-05-03 11:48:34'),
(186, '::1', 0, '2024-05-03 11:51:11'),
(187, '::1', 0, '2024-05-03 11:51:29'),
(188, '::1', 0, '2024-05-03 11:51:33'),
(189, '::1', 0, '2024-05-03 11:51:40'),
(190, '::1', 0, '2024-05-03 11:51:50'),
(191, '::1', 0, '2024-05-03 11:52:06'),
(192, '::1', 0, '2024-05-03 11:52:23'),
(193, '::1', 0, '2024-05-03 11:53:57'),
(194, '::1', 0, '2024-05-03 11:54:12'),
(195, '::1', 0, '2024-05-03 11:54:37'),
(196, '::1', 0, '2024-05-03 11:55:00'),
(197, '::1', 0, '2024-05-03 11:55:26'),
(198, '::1', 0, '2024-05-03 11:55:43'),
(199, '::1', 0, '2024-05-03 11:55:59'),
(200, '::1', 0, '2024-05-03 12:25:57'),
(201, '::1', 0, '2024-05-03 12:26:21'),
(202, '::1', 0, '2024-05-03 12:26:43'),
(203, '::1', 0, '2024-05-03 12:27:02'),
(204, '::1', 0, '2024-05-03 12:27:33'),
(205, '::1', 0, '2024-05-03 12:27:46'),
(206, '::1', 0, '2024-05-03 12:28:13'),
(207, '::1', 0, '2024-05-03 12:31:08'),
(208, '::1', 0, '2024-05-03 12:31:35'),
(209, '::1', 0, '2024-05-03 12:32:26'),
(210, '::1', 0, '2024-05-03 12:32:30'),
(211, '::1', 0, '2024-05-03 12:36:47'),
(212, '::1', 0, '2024-05-03 12:39:26'),
(213, '::1', 0, '2024-05-03 12:39:57'),
(214, '::1', 0, '2024-05-03 12:39:59'),
(215, '::1', 0, '2024-05-03 12:40:25'),
(216, '::1', 0, '2024-05-03 12:40:31'),
(217, '::1', 0, '2024-05-03 12:41:42'),
(218, '::1', 0, '2024-05-03 12:41:47'),
(219, '::1', 0, '2024-05-03 12:41:52'),
(220, '::1', 0, '2024-05-03 12:42:08'),
(221, '::1', 0, '2024-05-03 12:44:46'),
(222, '::1', 0, '2024-05-03 12:44:54'),
(223, '::1', 0, '2024-05-03 12:46:46'),
(224, '::1', 0, '2024-05-03 12:47:47'),
(225, '::1', 0, '2024-05-03 12:50:44'),
(226, '::1', 0, '2024-05-03 12:54:56'),
(227, '::1', 0, '2024-05-03 12:59:23'),
(228, '::1', 0, '2024-05-03 12:59:29'),
(229, '::1', 0, '2024-05-03 12:59:32'),
(230, '::1', 0, '2024-05-03 12:59:41'),
(231, '::1', 0, '2024-05-03 12:59:55'),
(232, '::1', 0, '2024-05-03 13:40:11'),
(233, '::1', 0, '2024-05-03 13:40:12'),
(234, '::1', 0, '2024-05-03 15:04:31'),
(235, '::1', 0, '2024-05-03 15:07:02'),
(236, '::1', 0, '2024-05-03 15:13:35'),
(237, '::1', 0, '2024-05-03 15:25:54'),
(238, '::1', 0, '2024-05-03 17:09:20'),
(239, '::1', 0, '2024-05-03 18:22:34'),
(240, '::1', 0, '2024-05-03 18:31:09'),
(241, '::1', 0, '2024-05-03 19:47:22'),
(242, '::1', 0, '2024-05-03 20:38:30'),
(243, '::1', 0, '2024-05-03 20:47:48'),
(244, '::1', 0, '2024-05-03 20:49:34'),
(245, '::1', 0, '2024-05-03 20:54:22'),
(246, '::1', 0, '2024-05-03 22:16:46'),
(247, '::1', 0, '2024-05-03 22:17:28'),
(248, '::1', 0, '2024-05-03 23:21:49'),
(249, '::1', 0, '2024-05-05 07:37:20'),
(250, '::1', 0, '2024-05-05 07:37:30'),
(251, '::1', 0, '2024-05-05 07:38:01'),
(252, '::1', 0, '2024-05-05 07:38:06'),
(253, '::1', 0, '2024-05-05 07:40:20'),
(254, '::1', 0, '2024-05-05 07:40:24'),
(255, '::1', 0, '2024-05-05 07:40:25'),
(256, '::1', 0, '2024-05-05 07:40:35'),
(257, '::1', 0, '2024-05-05 07:40:37'),
(258, '::1', 0, '2024-05-05 07:40:46'),
(259, '::1', 0, '2024-05-05 07:41:02'),
(260, '::1', 0, '2024-05-05 08:00:38'),
(261, '::1', 0, '2024-05-05 08:01:45'),
(262, '::1', 0, '2024-05-05 08:03:05'),
(263, '::1', 0, '2024-05-05 08:16:57'),
(264, '::1', 0, '2024-05-05 08:17:01'),
(265, '::1', 0, '2024-05-05 08:17:08'),
(266, '::1', 0, '2024-05-05 08:18:31'),
(267, '::1', 0, '2024-05-05 08:22:49'),
(268, '::1', 0, '2024-05-05 08:22:54'),
(269, '::1', 0, '2024-05-05 08:22:58'),
(270, '::1', 0, '2024-05-05 08:26:00'),
(271, '::1', 0, '2024-05-05 08:26:14'),
(272, '::1', 0, '2024-05-05 08:27:49'),
(273, '::1', 0, '2024-05-05 08:30:18'),
(274, '::1', 0, '2024-05-05 08:30:27'),
(275, '::1', 0, '2024-05-05 08:53:29'),
(276, '::1', 0, '2024-05-05 08:57:20'),
(277, '::1', 0, '2024-05-05 08:57:45'),
(278, '::1', 0, '2024-05-05 08:58:03'),
(279, '::1', 0, '2024-05-05 08:58:18'),
(280, '::1', 0, '2024-05-05 08:59:44'),
(281, '::1', 0, '2024-05-07 06:57:09'),
(282, '::1', 0, '2024-05-08 06:44:48'),
(283, '::1', 0, '2024-05-08 06:47:53'),
(284, '::1', 0, '2024-05-08 07:18:37'),
(285, '::1', 0, '2024-05-08 07:41:41'),
(286, '::1', 0, '2024-05-08 07:43:06'),
(287, '::1', 0, '2024-05-08 07:49:17'),
(288, '::1', 0, '2024-05-08 08:07:52'),
(289, '::1', 0, '2024-05-08 08:22:45'),
(290, '::1', 0, '2024-05-08 08:24:33'),
(291, '::1', 0, '2024-05-10 10:25:19'),
(292, '::1', 0, '2024-05-10 11:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Charity Management System'),
(6, 'short_name', 'Charity Jet'),
(11, 'logo', 'uploads/1629161280_charity_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1629162000_banner.jpg'),
(15, 'welcome_content', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae massa quis tellus ullamcorper auctor at in mi. Vestibulum euismod, nulla sit amet rhoncus iaculis, sapien justo sodales purus, nec finibus massa massa eget ante. Maecenas vitae eros in purus dictum porttitor. Integer arcu dui, dictum ac tellus et, ultricies condimentum est. Maecenas rutrum erat tincidunt dui rutrum fermentum. Nullam pretium molestie gravida. Sed mi justo, porta id justo ac, ornare aliquam est. Cras porta nisi eu eleifend tincidunt. Donec malesuada interdum orci sit amet sollicitudin. Maecenas sed augue condimentum justo vulputate interdum vel in lacus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Quisque sagittis varius magna ac pharetra. Nunc lobortis sapien nisl, ac fringilla enim pellentesque vitae. Vestibulum congue lorem non sapien lobortis iaculis. Sed commodo sit amet turpis sed porta. Phasellus arcu nulla, facilisis in nulla at, pharetra lobortis ligula. Nullam dignissim, nunc eget consectetur facilisis, tortor felis lacinia diam, a vestibulum magna mauris eget mi. Donec tellus ipsum, euismod at hendrerit a, consequat viverra tellus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Pellentesque auctor nunc in pulvinar dignissim. Mauris tempus fringilla ligula, ut facilisis felis euismod ut. Quisque nec sollicitudin felis, ac venenatis elit. Suspendisse at tortor ac leo rutrum maximus. Nulla viverra purus quis arcu suscipit, vitae suscipit orci accumsan. Aliquam sodales, justo vel interdum sodales, nibh libero facilisis lorem, in elementum ex odio non sem. Curabitur vitae blandit felis. In auctor velit eget maximus placerat. Donec quis tellus vestibulum, malesuada magna quis, ultrices lorem.</p>'),
(16, 'home_quote', 'We Care <3');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Inactive, 1=Active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `description`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Health', 'This is a sample topic only for health category.', 1, '2021-08-17 08:51:41', '2021-08-17 08:52:37'),
(2, 'Test 101', '&lt;p&gt;Sample Only&lt;/p&gt;', 1, '2021-08-17 08:53:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `file_path` text NOT NULL,
  `dir_code` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `user_id`, `file_path`, `dir_code`, `date_created`) VALUES
(1, 1, 'uploads/blog_uploads/gInV4MOSIc/1629172196_1.jpg', 'gInV4MOSIc', '2021-08-17 11:49:56'),
(2, 1, 'uploads/blog_uploads/gInV4MOSIc/1629172196_download.jpg', 'gInV4MOSIc', '2021-08-17 11:49:56'),
(3, 1, 'uploads/blog_uploads/qI8ZJiELzQ/1629172988_1.jpg', 'qI8ZJiELzQ', '2021-08-17 12:03:08'),
(4, 1, 'uploads/blog_uploads/qI8ZJiELzQ/1629172988_download.jpg', 'qI8ZJiELzQ', '2021-08-17 12:03:08'),
(5, 1, 'uploads/blog_uploads/vLLU8CyJZd/1629174024_1.jpg', 'vLLU8CyJZd', '2021-08-17 12:20:24'),
(7, 1, 'uploads/blog_uploads/K1dZZqq4SO/1629176614_warehouse-portrait.jpg', 'K1dZZqq4SO', '2021-08-17 13:03:34'),
(8, 1, 'uploads/blog_uploads/YSzqldklKk/1629176691_warehouse-portrait.jpg', 'YSzqldklKk', '2021-08-17 13:04:51'),
(11, 1, 'uploads/blog_uploads/causes_uploads/1629190918_dark-bg.jpg', 'causes_uploads', '2021-08-17 17:01:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `role` enum('admin','donor') NOT NULL DEFAULT 'donor',
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `username`, `email`, `password`, `avatar`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'admin', 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 'uploads/1624240500_avatar.png', '2021-01-20 14:02:37', '2024-05-04 03:59:42'),
(12, 'Harry', 'donor', 'harry123', 'harry@gmail.com', '202cb962ac59075b964b07152d234b70', 'uploads/1710058620_admin.jpg', '2024-03-10 14:16:28', '2024-05-04 04:00:01'),
(13, 'Tayrin Tunzina', 'donor', 'tt', 'ttunzina202145@bscse.uiu.ac.bd', '202cb962ac59075b964b07152d234b70', 'uploads/1714739820_donor_t.jfif', '2024-05-03 18:37:27', '2024-05-10 16:45:52'),
(24, 'Test', 'donor', 'testuser', '', '202cb962ac59075b964b07152d234b70', NULL, '2024-05-08 12:46:59', '2024-05-08 13:17:07');

-- --------------------------------------------------------

--
-- Table structure for table `verification_tokens`
--

CREATE TABLE `verification_tokens` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expiry_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `topic_id_2` (`topic_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_tokens`
--
ALTER TABLE `verification_tokens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `verification_tokens`
--
ALTER TABLE `verification_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
