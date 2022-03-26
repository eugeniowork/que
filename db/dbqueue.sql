-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2022 at 03:30 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbqueue`
--

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id`, `name`, `description`, `created_at`, `updated_at`, `status`) VALUES
(17, 'ACADEMIC INQURIES', 'academic inq.', '2021-11-23', NULL, 1),
(18, 'REQUEST OF DOCS.', 'req. docs', '2021-11-23', NULL, 1),
(20, 'OTHER MATTER', 'OTHER MATTER', '2022-02-04', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `key` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `description`, `key`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Department of Computing and Informatics', 'DCI', 'a', '2016-10-31 10:34:19', '2022-02-05 20:20:34', 1),
(2, 'Department of Business and Accountancy', 'DBA', 'b', '2016-11-09 07:18:01', '2022-02-05 20:20:25', 1),
(8, 'Department of Teachers Education', 'DTE', '3', '2022-02-05 20:21:16', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `display`
--

CREATE TABLE `display` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `direction` varchar(10) DEFAULT 'left',
  `color` varchar(10) DEFAULT '#ffffff',
  `background_color` varchar(10) NOT NULL DEFAULT '#cdcdcd',
  `border_color` varchar(10) NOT NULL DEFAULT '#ffffff',
  `time_format` varchar(20) DEFAULT 'h:i:s A',
  `date_format` varchar(50) DEFAULT 'd M, Y',
  `updated_at` datetime DEFAULT NULL,
  `display` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-single, 2/3-counter,4-department,5-hospital',
  `keyboard_mode` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0-inactive,1-active',
  `sms_alert` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0-inactive, 1-active ',
  `show_note` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-inactive, 1-active ',
  `show_officer` tinyint(1) NOT NULL DEFAULT 1,
  `show_department` tinyint(1) NOT NULL DEFAULT 1,
  `alert_position` int(2) NOT NULL DEFAULT 3,
  `language` varchar(20) DEFAULT 'English'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `display`
--

INSERT INTO `display` (`id`, `message`, `direction`, `color`, `background_color`, `border_color`, `time_format`, `date_format`, `updated_at`, `display`, `keyboard_mode`, `sms_alert`, `show_note`, `show_officer`, `show_department`, `alert_position`, `language`) VALUES
(1, 'Queue Management System', 'left', '#ff0404', '#000000', '#3c8dbc', 'h:i:s A', 'd M, Y', '2021-11-28 15:59:44', 5, 1, 1, 0, 1, 0, 2, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `display_custom`
--

CREATE TABLE `display_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `counters` varchar(64) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '1-active, 2-inactive',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `display_custom`
--

INSERT INTO `display_custom` (`id`, `name`, `description`, `counters`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Floor 1', 'TEST 1', '17', 0, '2020-10-01 03:34:44', '2021-11-29 03:53:49'),
(2, 'Floor 2', 'TEST 2', '6,7,8,9,10', 0, '2020-10-01 03:35:28', '2020-10-01 09:17:20'),
(3, 'Floor 3', 'TEST 3', '18', 0, '2020-10-01 03:35:51', '2021-11-29 03:54:03'),
(4, 'Floor 4', 'TESTS Floor', '19', 0, '2020-10-01 10:11:00', '2021-11-29 03:54:17');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `attachment` varchar(128) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `sender_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unseen, 1=seen, 2=delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `copyright_text` varchar(255) DEFAULT NULL,
  `direction` varchar(10) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `timezone` varchar(32) NOT NULL DEFAULT 'Asia/Dhaka'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `title`, `description`, `logo`, `favicon`, `email`, `phone`, `address`, `copyright_text`, `direction`, `language`, `timezone`) VALUES
(1, 'CITY COLLEGE OF CALAMBA', 'Queue', 'public/assets/img/icons/logo.jpg', 'public/assets/img/icons/favicon.jpg', 'admin@example.com', '+325 252 222', 'CALAMBA ST', 'copyright@2021', NULL, NULL, 'Asia/Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `sms_history`
--

CREATE TABLE `sms_history` (
  `id` int(11) NOT NULL,
  `from` varchar(20) DEFAULT NULL,
  `to` varchar(20) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `response` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_setting`
--

CREATE TABLE `sms_setting` (
  `id` int(11) NOT NULL,
  `provider` varchar(20) NOT NULL DEFAULT 'nexmo',
  `api_key` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `from` varchar(50) DEFAULT NULL,
  `sms_template` text DEFAULT NULL,
  `recall_sms_template` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_setting`
--

INSERT INTO `sms_setting` (`id`, `provider`, `api_key`, `username`, `password`, `from`, `sms_template`, `recall_sms_template`) VALUES
(1, 'clickatell', '-K1xA==', 'jasper', 'jasper24', '11222747358', 'Token No: [TOKEN] \\r\\n Department: [DEPARTMENT], Counter: [COUNTER] and Officer: [OFFICER]. \\r\\n Your waiting no is [WAIT]. \\r\\n [DATE].', 'Please contact urgently. Token No: [TOKEN] \\r\\n Department: [DEPARTMENT], Counter: [COUNTER] and Officer: [OFFICER]. \\r\\n [DATE].');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `token_no` varchar(10) DEFAULT NULL,
  `client_mobile` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `counter_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `note` varchar(512) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_vip` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-pending, 1-complete, 2-stop',
  `sms_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-pending, 1-sent, 2-quick-send'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `token_no`, `client_mobile`, `department_id`, `counter_id`, `user_id`, `note`, `created_by`, `created_at`, `updated_at`, `is_vip`, `status`, `sms_status`) VALUES
(251, 'AA000', '097878787878', 17, 1, 27, NULL, 23, '2021-11-23 19:51:30', '2021-11-23 20:01:19', NULL, 1, 1),
(252, 'AA001', '097878787878', 1, 17, 28, NULL, 23, '2021-11-23 19:51:46', '2021-11-23 20:01:32', NULL, 1, 1),
(253, 'BR000', '032558', 2, 18, 26, NULL, 24, '2021-11-28 22:15:40', '2021-11-28 22:20:01', NULL, 1, 1),
(254, 'BR001', '032559', 2, 18, 26, NULL, 24, '2021-11-28 22:16:57', '2021-11-28 22:20:26', NULL, 1, 1),
(255, 'BR000', '0325589', 2, 18, 27, NULL, 23, '2021-11-30 08:11:18', '2021-11-30 08:12:39', NULL, 1, 1),
(256, 'AA000', '20212911', 1, 17, 30, NULL, 23, '2021-11-30 11:36:36', '2021-11-30 11:46:27', NULL, 1, 1),
(257, 'BR001', '20213011', 2, 18, 31, NULL, 23, '2021-11-30 11:38:13', '2021-11-30 11:46:44', NULL, 1, 1),
(258, 'CO000', '20213111', 3, 19, 32, NULL, 23, '2021-11-30 11:38:28', '2021-11-30 11:46:52', NULL, 1, 1),
(259, 'CO001', '202131', 3, 19, 32, NULL, 23, '2021-11-30 11:42:17', '2021-11-30 11:46:55', NULL, 1, 1),
(260, 'CO002', '202132', 3, 19, 32, NULL, 23, '2021-11-30 11:42:23', '2021-11-30 11:46:58', NULL, 1, 1),
(261, 'AA001', '202129111', 1, 17, 30, NULL, 23, '2021-11-30 12:28:20', '2021-11-30 12:31:40', NULL, 1, 1),
(262, 'BA000', '202129112', 2, 17, 31, NULL, 23, '2021-11-30 12:28:41', '2021-11-30 12:33:08', NULL, 1, 1),
(263, 'CO003', '202129113', 3, 19, 32, NULL, 23, '2021-11-30 12:28:52', '2021-11-30 12:33:29', NULL, 1, 1),
(264, 'BR002', '202129114', 2, 18, 30, NULL, 23, '2021-11-30 12:29:06', '2021-11-30 12:33:43', NULL, 1, 1),
(265, 'BA000', '20212911', 2, 17, 30, NULL, 34, '2022-02-04 22:37:06', '2022-02-04 22:38:04', NULL, 1, 1),
(266, '3R000', '0325589', 8, 18, 30, NULL, 34, '2022-02-05 20:22:24', '2022-02-05 20:28:34', NULL, 1, 1),
(267, 'AA000', '20213011', 1, 17, 30, NULL, 34, '2022-02-05 20:23:05', '2022-02-05 20:28:51', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `token_setting`
--

CREATE TABLE `token_setting` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `counter_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token_setting`
--

INSERT INTO `token_setting` (`id`, `department_id`, `counter_id`, `user_id`, `created_at`, `updated_at`, `status`) VALUES
(7, 1, 1, 2, '2020-05-14 23:43:49', NULL, 1),
(8, 1, 2, 4, '2020-05-14 23:50:42', NULL, 1),
(15, 1, 17, 28, '2021-11-23 19:55:47', NULL, 1),
(16, 2, 18, 26, '2021-11-23 19:56:43', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=officer, 2=staff, 3=client, 5=admin',
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=active,2=inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `department_id`, `mobile`, `photo`, `user_type`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'juviel', 'gomeseria', 'juvielgomeseria@gmail.com', '$2y$10$8sI9NT7fBs8trZg.Ij9Wi.Z81DVyZ/KBlWwoPCnE79lmJ3VecvKjm', 0, '09150589830', 'public/assets/img/users/211123070829.jpg', 5, 'RKreF9hXsRXeI8qiaw3YCawnyinAfIrMQ81pNxGqUOnp0CeyOvEOFgV5I7vX', '2016-10-30 00:00:00', '2022-02-05 22:21:28', 1),
(30, 'window', '1', 'window1@gmail.com', '$2y$10$o8tMotWE8MUF39BbhhDV5.HEpIi08fYlecYGHR6IaoalRdN3yqP8i', 1, '002222', NULL, 1, 'i8SuKiPPzidqg8B8GkOOyQ0FBMgQIzaG6EpFbC2fJXWPx9IPq1p0dafHrqaL', '2021-11-30 00:00:00', '2021-11-29 18:14:27', 1),
(33, 'register', 'queue', 'register@gmail.com', '$2y$10$G2vQ5SG6IAfBbqZVssljBOmgS4onx590kMaCIWA51rKTmOFk33j06', NULL, '002222', NULL, 2, 'TBEZHATA6zWGLoUZoWhFOTqIqMRjnzUS3e5VIWyoA7VqI43g6022SZnxHfFO', '2021-11-30 00:00:00', '2021-11-29 19:34:49', 1),
(34, 'register', '1', 'register1@gmail.com', '$2y$10$Lrs09jxtJAz0IOMnamqVpuuZE41nQB0eoSw0VcLIafOkTQfywZGW6', NULL, '002222', NULL, 2, 'BKnQQ3hRasucmJZhkl2O1UO93bSUJlHa3HoEhOqYIF8JBovqoYI0rzmEuj2z', '2022-02-04 00:00:00', '2022-02-05 22:27:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_social_accounts`
--

CREATE TABLE `user_social_accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider_name` varchar(32) DEFAULT NULL,
  `provider_id` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `display`
--
ALTER TABLE `display`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `display_custom`
--
ALTER TABLE `display_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_history`
--
ALTER TABLE `sms_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_setting`
--
ALTER TABLE `sms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token_setting`
--
ALTER TABLE `token_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_social_accounts`
--
ALTER TABLE `user_social_accounts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `display`
--
ALTER TABLE `display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `display_custom`
--
ALTER TABLE `display_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_history`
--
ALTER TABLE `sms_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `token_setting`
--
ALTER TABLE `token_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_social_accounts`
--
ALTER TABLE `user_social_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
