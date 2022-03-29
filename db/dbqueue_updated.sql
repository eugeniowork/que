-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2022 at 01:42 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id`, `name`, `description`, `created_at`, `updated_at`, `status`) VALUES
(21, 'Request for Diploma', 'request for diploma', '2022-03-27', NULL, 1),
(22, 'Request for TOR', 'request for tor', '2022-03-27', NULL, 1),
(23, 'Transfer Credential', 'transfer credential', '2022-03-27', NULL, 1),
(24, 'True Copy of Grades', 'true copy of grades', '2022-03-27', NULL, 1),
(25, 'Inquiries', 'Inquiries', '2022-03-27', NULL, 1);

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
  `status` tinyint(1) NOT NULL DEFAULT '1'
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
  `message` text,
  `direction` varchar(10) DEFAULT 'left',
  `color` varchar(10) DEFAULT '#ffffff',
  `background_color` varchar(10) NOT NULL DEFAULT '#cdcdcd',
  `border_color` varchar(10) NOT NULL DEFAULT '#ffffff',
  `time_format` varchar(20) DEFAULT 'h:i:s A',
  `date_format` varchar(50) DEFAULT 'd M, Y',
  `updated_at` datetime DEFAULT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-single, 2/3-counter,4-department,5-hospital',
  `keyboard_mode` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-inactive,1-active',
  `sms_alert` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-inactive, 1-active ',
  `show_note` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inactive, 1-active ',
  `show_officer` tinyint(1) NOT NULL DEFAULT '1',
  `show_department` tinyint(1) NOT NULL DEFAULT '1',
  `alert_position` int(2) NOT NULL DEFAULT '3',
  `language` varchar(20) DEFAULT 'English'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `display`
--

INSERT INTO `display` (`id`, `message`, `direction`, `color`, `background_color`, `border_color`, `time_format`, `date_format`, `updated_at`, `display`, `keyboard_mode`, `sms_alert`, `show_note`, `show_officer`, `show_department`, `alert_position`, `language`) VALUES
(1, 'Queue Management System', 'right', '#000000', '#ffffff', '#3c8dbc', 'h:i:s A', 'F j, Y', '2022-03-28 14:49:41', 5, 1, 1, 0, 1, 0, 1, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `display_custom`
--

CREATE TABLE `display_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `counters` varchar(64) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1-active, 2-inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `display_custom`
--

INSERT INTO `display_custom` (`id`, `name`, `description`, `counters`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Floor 1', 'TEST 1', '17', 2, '2020-10-01 03:34:44', '2022-03-28 09:55:25'),
(2, 'Floor 2', 'TEST 2', '6,7,8,9,10', 2, '2020-10-01 03:35:28', '2022-03-28 09:55:26'),
(3, 'Floor 3', 'TEST 3', '18', 2, '2020-10-01 03:35:51', '2022-03-28 09:55:27'),
(4, 'Floor 4', 'TESTS Floor', '19', 2, '2020-10-01 10:11:00', '2022-03-28 09:55:28');

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
  `sender_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete'
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
(1, 'CITY COLLEGE OF CALAMBA', 'Queue', 'public/assets/img/icons/logo.jpg', 'public/assets/img/icons/favicon.jpg', 'admin@example.com', '+325 252 222', 'CALAMBA ST', 'copyright@2021', NULL, NULL, 'Asia/Taipei');

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
  `sms_template` text,
  `recall_sms_template` text
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
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `counter_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `note` varchar(512) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_vip` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-pending, 1-now serving, 2-complete, 3-stop',
  `sms_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-pending, 1-sent, 2-quick-send'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `token_no`, `client_mobile`, `firstname`, `lastname`, `course`, `department_id`, `counter_id`, `user_id`, `note`, `type`, `created_by`, `created_at`, `updated_at`, `is_vip`, `status`, `sms_status`) VALUES
(322, '001', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:22', '2022-03-29 17:39:33', NULL, 1, 1),
(323, '002', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:31', NULL, NULL, 0, 0),
(324, '003', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:33', NULL, NULL, 0, 0),
(325, '004', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:35', NULL, NULL, 0, 0),
(326, '005', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:37', NULL, NULL, 0, 0),
(327, '006', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:38', NULL, NULL, 0, 0),
(328, '007', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:40', NULL, NULL, 0, 0),
(329, '008', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:41', NULL, NULL, 0, 0),
(330, '009', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:43', NULL, NULL, 0, 0),
(331, '010', '123', 'test', 'test', 'Computer Science', 1, 21, 30, NULL, 'Student', 33, '2022-03-29 17:29:44', NULL, NULL, 0, 0),
(332, '011', '123', 'test', 'test', 'Accountancy', 2, 21, 38, NULL, 'Student', 33, '2022-03-29 17:29:54', NULL, NULL, 0, 0),
(333, '012', '123', 'test', 'test', 'Secondary Education (English Language Education)', 8, 21, 37, NULL, 'Student', 33, '2022-03-29 17:29:59', NULL, NULL, 0, 0),
(334, '013', NULL, 'test', 'test', '', NULL, 21, 39, NULL, 'Admin/Professor', 33, '2022-03-29 17:30:06', NULL, NULL, 0, 0),
(335, '014', NULL, 'test', 'test', '', NULL, 21, 39, NULL, 'Admin/Professor', 33, '2022-03-29 17:30:11', NULL, NULL, 0, 0),
(336, '015', NULL, 'test', 'test', '', NULL, 21, 39, NULL, 'Admin/Professor', 33, '2022-03-29 17:30:14', NULL, NULL, 0, 0),
(337, '016', '123', 'test', 'test', 'Accounting Information Systems', 2, 21, 38, NULL, 'Student', 33, '2022-03-29 17:30:25', NULL, NULL, 0, 0),
(338, '017', '123', 'test', 'test', 'Accounting Information Systems', 2, 21, 38, NULL, 'Student', 33, '2022-03-29 17:30:26', NULL, NULL, 0, 0),
(339, '018', '123', 'test', 'test', 'Secondary Education (Math Education)', 8, 21, 37, NULL, 'Student', 33, '2022-03-29 17:30:35', NULL, NULL, 0, 0),
(340, '019', '123', 'test', 'test', 'Secondary Education (Math Education)', 8, 21, 37, NULL, 'Student', 33, '2022-03-29 17:30:37', NULL, NULL, 0, 0),
(341, '020', '123', 'test', 'test', 'Secondary Education (Math Education)', 8, 21, 37, NULL, 'Student', 33, '2022-03-29 17:30:52', NULL, NULL, 0, 0),
(342, '021', '123', 'test', 'test', 'Secondary Education (Math Education)', 8, 21, 37, NULL, 'Student', 33, '2022-03-29 17:30:54', NULL, NULL, 0, 0);

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
  `status` tinyint(1) NOT NULL DEFAULT '1'
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
  `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=officer, 2=staff, 3=client, 5=admin, 6=it assistant',
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `department_id`, `mobile`, `photo`, `user_type`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'juviel', 'gomeseria', 'juvielgomeseria@gmail.com', '$2y$10$8sI9NT7fBs8trZg.Ij9Wi.Z81DVyZ/KBlWwoPCnE79lmJ3VecvKjm', 0, '09150589830', 'public/assets/img/users/211123070829.jpg', 5, 'nAkXq6yRHARkRs35REetKzr61X1mRgx8IHSQkuZyd5S8IWwsTW0VqaWgKc4h', '2016-10-30 00:00:00', '2022-03-29 00:23:37', 1),
(30, 'Window 1', 'DCI', 'window1@gmail.com', '$2y$10$o8tMotWE8MUF39BbhhDV5.HEpIi08fYlecYGHR6IaoalRdN3yqP8i', 1, '002222', NULL, 1, 'i8SuKiPPzidqg8B8GkOOyQ0FBMgQIzaG6EpFbC2fJXWPx9IPq1p0dafHrqaL', '2021-11-30 00:00:00', '2022-03-26 20:48:39', 1),
(33, 'register', 'queue', 'register@gmail.com', '$2y$10$G2vQ5SG6IAfBbqZVssljBOmgS4onx590kMaCIWA51rKTmOFk33j06', NULL, '002222', NULL, 2, '5jynxDRaH1XBiVy4hjhQMs7Jv5h0LdvOM7IU4T8RKKtPKnI3EPbSAu94vCiS', '2021-11-30 00:00:00', '2022-03-29 00:11:26', 1),
(34, 'register', '1', 'register1@gmail.com', '$2y$10$Lrs09jxtJAz0IOMnamqVpuuZE41nQB0eoSw0VcLIafOkTQfywZGW6', NULL, '002222', NULL, 2, 'BKnQQ3hRasucmJZhkl2O1UO93bSUJlHa3HoEhOqYIF8JBovqoYI0rzmEuj2z', '2022-02-04 00:00:00', '2022-02-05 22:27:06', 1),
(37, 'Window 2', 'DTE', 'window2@gmail.com', '$2y$10$QltURzhBkjLIphWJlp2/B.6c/EeKs0Bq1jGz31mWVvMSsNloinSHe', NULL, '09', NULL, 1, NULL, '2022-03-26 00:00:00', '2022-03-26 20:48:35', 1),
(38, 'Window 3', 'DBA', 'window3@gmail.com', '$2y$10$mg0M/eMIkLfxoz3MPt6m2u6aSc44VThRdXp3Ai6EawrMfALLyAKUm', NULL, '09', NULL, 1, NULL, '2022-03-26 00:00:00', '2022-03-26 20:48:27', 1),
(39, 'Window 4', 'Non-Student', 'window4@gmail.com', '$2y$10$fXK6HSpXMxELc8nOHtf85uhmasSf3M8tAiUY8GievZfaX5M0GFzQW', NULL, '09', NULL, 1, 'p7xDpPqpJiH7xPAh1TAzgNd3Tb5b6WQ0WuTrx4fkr2v4bacLcSaniim0Hhvc', '2022-03-26 00:00:00', '2022-03-28 23:36:55', 1),
(40, 'test admin', 'test admin', 'testadmin@gmail.com', '$2y$10$2oZ9jF7pwltJLBddneOmUOd1wdVjDut1bHwMRxXZUkYT1hz5CVK2W', NULL, '09', NULL, 5, 'OJnjoRrR3jszGtwSl2ToVRnbEtRUKG7cbnbHljYkWyAfLjDNahy6OWcZxBWV', '2022-03-27 00:00:00', '2022-03-27 13:20:25', 1),
(41, 'it', 'assistant', 'itassistant@gmail.com', '$2y$10$t38OOSjHSbBk87R2kkcJzu8SpLBHZ/mj7q8NcH6qhkZ/LK43bhh4C', NULL, '09', NULL, 6, 'QxFk3k31aITRGrmgdu46iXvgnBVB0IVa5GfTCiG2x6ojeZCsOZ11FQLkcmw4', '2022-03-27 00:00:00', '2022-03-27 14:53:40', 1),
(42, 'sa', 'asd', 'asd@gmail.com', '$2y$10$fB0WJ94mhkKQw443tM7O1OsFjGXAV/gfVrueioEc3BESCo9O.Q3na', NULL, '09208823665', NULL, 6, NULL, '2022-03-27 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_social_accounts`
--

CREATE TABLE `user_social_accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider_name` varchar(32) DEFAULT NULL,
  `provider_id` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_history`
--
ALTER TABLE `sms_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `token_setting`
--
ALTER TABLE `token_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user_social_accounts`
--
ALTER TABLE `user_social_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
