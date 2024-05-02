-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 01, 2024 at 07:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `topic_id`, `content`, `keywords`, `meta_description`, `banner_path`, `upload_dir_code`, `status`, `blog_url`, `author_id`, `date_created`, `date_updated`) VALUES
(1, 'Sample 101', 1, '&lt;p&gt;&lt;span style=\\&quot;text-align: justify;\\&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae massa quis tellus ullamcorper auctor at in mi. Vestibulum euismod, nulla sit amet rhoncus iaculis, sapien justo sodales purus, nec finibus massa massa eget ante. Maecenas vitae eros in purus dictum porttitor. Integer arcu dui, dictum ac tellus et, ultricies condimentum est. Maecenas rutrum erat tincidunt dui rutrum fermentum. Nullam pretium molestie gravida. Sed mi justo, porta id justo ac, ornare aliquam est. Cras porta nisi eu eleifend tincidunt. Donec malesuada interdum orci sit amet sollicitudin. Maecenas sed augue condimentum justo vulputate interdum vel in lacus.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;text-align: justify;\\&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;div style=\\&quot;text-align: center;\\&quot;&gt;&lt;img style=\\&quot;width: 625px; height: 416.667px;\\&quot; src=\\&quot;http://localhost/charity/uploads/blog_uploads/Zk1pDmHIo2/1629176073_1.jpg\\&quot;&gt;&lt;/div&gt;&lt;div style=\\&quot;\\&quot;&gt;&lt;span style=\\&quot;text-align: justify;\\\\\\&quot;&gt;Quisque sagittis varius magna ac pharetra. Nunc lobortis sapien nisl, ac fringilla enim pellentesque vitae. Vestibulum congue lorem non sapien lobortis iaculis. Sed commodo sit amet turpis sed porta. Phasellus arcu nulla, facilisis in nulla at, pharetra lobortis ligula. Nullam dignissim, nunc eget consectetur facilisis, tortor felis lacinia diam, a vestibulum magna mauris eget mi. Donec tellus ipsum, euismod at hendrerit a, consequat viverra tellus.&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;p&gt;&lt;/p&gt;', 'Sample Keyword, 101, 102, 103', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae massa quis tellus ullamcorper auctor at in mi. Vestibulum euismod, nulla sit amet rhoncus iaculis, sapien justo sodales purus, nec finibus massa massa eget ante.', 'uploads/blog_uploads/banners/1_banner.jpg', 'Zk1pDmHIo2', 1, 'pages/sample_101.php', 1, '2021-08-17 12:56:54', '2021-08-17 13:17:35'),
(2, 'Sample 102', 1, '&lt;h3 style=\\&quot;text-align: center; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Sample Content Only&lt;/h3&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Nullam pulvinar libero id justo faucibus elementum. Donec euismod ante tellus, et pulvinar ipsum tincidunt ac. Proin efficitur eros eu orci imperdiet fringilla. Sed ullamcorper luctus lacus, in varius sapien tincidunt gravida. Praesent elit massa, accumsan a purus id, hendrerit tincidunt risus. Nam luctus dictum ante in pellentesque. Proin eget eros in nisl lacinia semper at faucibus risus. Cras sit amet sagittis risus, non tempus neque. Proin aliquam dignissim augue, eget semper eros ultrices id. In consequat lorem mattis lobortis scelerisque. Fusce lorem arcu, condimentum iaculis nisl sed, mollis commodo nibh. Suspendisse convallis at libero id fermentum.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Etiam ac dolor tincidunt, tincidunt erat vitae, tempor sem. Nulla auctor lectus nisi, non dictum tortor hendrerit at. Proin ultricies aliquam ex, eu facilisis dolor lobortis a. Aenean varius vitae ante at pharetra. Praesent rutrum metus et tellus condimentum sollicitudin. Aenean et euismod risus, vitae tincidunt enim. Cras nec augue massa. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean facilisis semper sapien. Curabitur sem purus, blandit rutrum urna ac, pharetra finibus massa. Morbi pharetra efficitur faucibus. Vivamus scelerisque sem eu nunc vulputate efficitur. Vestibulum porttitor nisi dolor, ut pharetra dui consequat quis.&lt;/p&gt;', 'Sample, Content, Sample 102, keyword', 'Nullam pulvinar libero id justo faucibus elementum. Donec euismod ante tellus, et pulvinar ipsum tincidunt ac. Proin efficitur eros eu orci imperdiet fringilla. Sed ullamcorper luctus lacus, in varius sapien tincidunt gravida', 'uploads/blog_uploads/banners/2_banner.jpg', '', 0, 'pages/sample_102.php', 1, '2021-08-17 13:57:56', '2024-03-15 01:31:30'),
(4, 'test', 2, '', '', '', '', '', 0, 'pages/test.php', 1, '2024-03-12 12:31:42', '2024-03-12 13:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `fund_raised` decimal(10,2) DEFAULT 0.00,
  `fund_goal` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount_donated` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `blog_id`, `fund_raised`, `fund_goal`, `user_id`, `amount_donated`) VALUES
(1, 1, 500.00, 3000.00, NULL, 0.00),
(2, 4, 400000.00, 400000.00, NULL, 0.00);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `attempts`, `last_attempt`) VALUES
(1, '::1', 0, '2024-05-01 17:01:52'),
(2, '::1', 0, '2024-05-01 17:02:11'),
(3, '::1', 0, '2024-05-01 17:02:14'),
(4, '::1', 0, '2024-05-01 17:02:25'),
(5, '::1', 0, '2024-05-01 17:02:27'),
(6, '::1', 0, '2024-05-01 17:02:30'),
(7, '::1', 0, '2024-05-01 17:02:33'),
(8, '::1', 0, '2024-05-01 17:02:38'),
(9, '::1', 0, '2024-05-01 17:03:05'),
(10, '::1', 0, '2024-05-01 17:15:40'),
(11, '::1', 0, '2024-05-01 17:23:53'),
(12, '::1', 0, '2024-05-01 17:24:04'),
(13, '::1', 0, '2024-05-01 17:24:05'),
(14, '::1', 0, '2024-05-01 17:24:41'),
(15, '::1', 0, '2024-05-01 17:24:52'),
(16, '::1', 0, '2024-05-01 17:25:53'),
(17, '::1', 0, '2024-05-01 17:26:01'),
(18, '::1', 0, '2024-05-01 17:30:01'),
(19, '::1', 0, '2024-05-01 17:30:11'),
(20, '::1', 0, '2024-05-01 17:30:15'),
(21, '::1', 0, '2024-05-01 17:30:33'),
(22, '::1', 0, '2024-05-01 17:32:02'),
(23, '::1', 0, '2024-05-01 17:32:11'),
(24, '::1', 0, '2024-05-01 17:32:17'),
(25, '::1', 0, '2024-05-01 17:32:20'),
(26, '::1', 0, '2024-05-01 17:32:50'),
(27, '::1', 0, '2024-05-01 17:36:59'),
(28, '::1', 0, '2024-05-01 17:37:08'),
(29, '::1', 0, '2024-05-01 17:37:13'),
(30, '::1', 0, '2024-05-01 17:37:15'),
(31, '::1', 0, '2024-05-01 17:37:26'),
(32, '::1', 0, '2024-05-01 17:37:31'),
(33, '::1', 0, '2024-05-01 17:37:33'),
(34, '::1', 0, '2024-05-01 17:37:36'),
(35, '::1', 0, '2024-05-01 17:37:42'),
(36, '::1', 0, '2024-05-01 17:38:13'),
(37, '::1', 0, '2024-05-01 17:38:22'),
(38, '::1', 0, '2024-05-01 17:38:25'),
(39, '::1', 0, '2024-05-01 17:38:27'),
(40, '::1', 0, '2024-05-01 17:39:48'),
(41, '::1', 0, '2024-05-01 17:39:59'),
(42, '::1', 0, '2024-05-01 17:40:01'),
(43, '::1', 0, '2024-05-01 17:40:02'),
(44, '::1', 0, '2024-05-01 17:40:15'),
(45, '::1', 0, '2024-05-01 17:40:37'),
(46, '::1', 0, '2024-05-01 17:40:46'),
(47, '::1', 0, '2024-05-01 17:40:48'),
(48, '::1', 0, '2024-05-01 17:40:50'),
(49, '::1', 0, '2024-05-01 17:40:57'),
(50, '::1', 0, '2024-05-01 17:41:03'),
(51, '::1', 0, '2024-05-01 17:41:16'),
(52, '::1', 0, '2024-05-01 17:41:25'),
(53, '::1', 0, '2024-05-01 17:41:36'),
(54, '::1', 0, '2024-05-01 17:41:40'),
(55, '::1', 0, '2024-05-01 17:41:41'),
(56, '::1', 0, '2024-05-01 17:41:52'),
(57, '::1', 0, '2024-05-01 17:42:02'),
(58, '::1', 0, '2024-05-01 17:42:04'),
(59, '::1', 0, '2024-05-01 17:42:04'),
(60, '::1', 0, '2024-05-01 17:42:12'),
(61, '::1', 0, '2024-05-01 17:42:16'),
(62, '::1', 0, '2024-05-01 17:44:20'),
(63, '::1', 0, '2024-05-01 17:44:29'),
(64, '::1', 0, '2024-05-01 17:44:33'),
(65, '::1', 0, '2024-05-01 17:44:45'),
(66, '::1', 0, '2024-05-01 17:44:46'),
(67, '::1', 0, '2024-05-01 17:44:47'),
(68, '::1', 0, '2024-05-01 17:44:48'),
(69, '::1', 0, '2024-05-01 17:44:49'),
(70, '::1', 0, '2024-05-01 17:44:49'),
(71, '::1', 0, '2024-05-01 17:44:50'),
(72, '::1', 0, '2024-05-01 17:45:26'),
(73, '::1', 0, '2024-05-01 17:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `user_id`, `file_path`, `dir_code`, `date_created`) VALUES
(1, 1, 'uploads/blog_uploads/gInV4MOSIc/1629172196_1.jpg', 'gInV4MOSIc', '2021-08-17 11:49:56'),
(2, 1, 'uploads/blog_uploads/gInV4MOSIc/1629172196_download.jpg', 'gInV4MOSIc', '2021-08-17 11:49:56'),
(3, 1, 'uploads/blog_uploads/qI8ZJiELzQ/1629172988_1.jpg', 'qI8ZJiELzQ', '2021-08-17 12:03:08'),
(4, 1, 'uploads/blog_uploads/qI8ZJiELzQ/1629172988_download.jpg', 'qI8ZJiELzQ', '2021-08-17 12:03:08'),
(5, 1, 'uploads/blog_uploads/vLLU8CyJZd/1629174024_1.jpg', 'vLLU8CyJZd', '2021-08-17 12:20:24'),
(6, 1, 'uploads/blog_uploads/Zk1pDmHIo2/1629176073_1.jpg', 'Zk1pDmHIo2', '2021-08-17 12:54:33'),
(7, 1, 'uploads/blog_uploads/K1dZZqq4SO/1629176614_warehouse-portrait.jpg', 'K1dZZqq4SO', '2021-08-17 13:03:34'),
(8, 1, 'uploads/blog_uploads/YSzqldklKk/1629176691_warehouse-portrait.jpg', 'YSzqldklKk', '2021-08-17 13:04:51'),
(10, 1, 'uploads/blog_uploads/Zk1pDmHIo2/1629176847_warehouse-portrait.jpg', 'Zk1pDmHIo2', '2021-08-17 13:07:27'),
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
  `password` varchar(100) NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `username`, `password`, `avatar`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', '2021-01-20 14:02:37', '2024-03-09 12:50:51'),
(11, 'Tayrin', 'donor', 'tt', '202cb962ac59075b964b07152d234b70', NULL, '2024-03-10 14:15:40', NULL),
(12, 'Harry', 'donor', 'harry123', '202cb962ac59075b964b07152d234b70', 'uploads/1710058620_admin.jpg', '2024-03-10 14:16:28', '2024-03-10 14:17:05');

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
  ADD KEY `blog_id` (`blog_id`),
  ADD KEY `fk_user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

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
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
