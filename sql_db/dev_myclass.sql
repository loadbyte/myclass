-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 15, 2017 at 03:17 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_myclass`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `as_id` bigint(20) UNSIGNED NOT NULL,
  `as_name` varchar(5000) NOT NULL,
  `as_desc` varchar(5000) NOT NULL,
  `as_dead` varchar(50) NOT NULL,
  `as_c_id` bigint(20) NOT NULL,
  `as_u_id` bigint(20) NOT NULL,
  `as_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assign_submission`
--

CREATE TABLE `assign_submission` (
  `ab_id` bigint(20) UNSIGNED NOT NULL,
  `ab_u_id` bigint(20) NOT NULL,
  `ab_as_id` bigint(20) NOT NULL,
  `ab_sub_url` varchar(5000) NOT NULL,
  `ab_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contribution`
--

CREATE TABLE `contribution` (
  `cn_id` bigint(20) UNSIGNED NOT NULL,
  `cn_u_id` bigint(20) NOT NULL,
  `cn_as_id` bigint(20) NOT NULL,
  `cn_desc` varchar(5000) NOT NULL,
  `cn_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_id` bigint(20) UNSIGNED NOT NULL,
  `c_title` varchar(1000) NOT NULL,
  `c_desc` varchar(5000) NOT NULL,
  `c_u_id` bigint(20) NOT NULL,
  `c_from` varchar(255) NOT NULL,
  `c_to` varchar(255) NOT NULL,
  `c_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`c_id`, `c_title`, `c_desc`, `c_u_id`, `c_from`, `c_to`, `c_ts`) VALUES
(1, 'test course', 'test course desc', 1, '01/August/2017 12:08:09', '01/December/2017 12:12:09', '2017-08-15 13:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrolled`
--

CREATE TABLE `course_enrolled` (
  `ce_id` bigint(20) UNSIGNED NOT NULL,
  `ce_u_id` bigint(20) NOT NULL,
  `ce_c_id` bigint(20) NOT NULL,
  `ce_enrolled_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `g_id` bigint(20) UNSIGNED NOT NULL,
  `g_name` varchar(500) NOT NULL,
  `g_u_id` bigint(20) NOT NULL,
  `g_c_id` bigint(20) NOT NULL,
  `g_status` int(11) NOT NULL DEFAULT '0',
  `g_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `lh_id` bigint(20) UNSIGNED NOT NULL,
  `lh_u_id` bigint(20) NOT NULL,
  `lh_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `studcontrib`
--

CREATE TABLE `studcontrib` (
  `st_id` bigint(20) UNSIGNED NOT NULL,
  `st_as_id` bigint(20) NOT NULL,
  `st_ta_u_id` bigint(20) NOT NULL,
  `st_u_id` bigint(20) NOT NULL,
  `st_desc` varchar(5000) NOT NULL,
  `st_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `tk_id` bigint(20) UNSIGNED NOT NULL,
  `tk_token` varchar(1000) NOT NULL,
  `tk_email` varchar(1000) NOT NULL,
  `tk_used` int(11) NOT NULL DEFAULT '0',
  `tk_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` bigint(20) UNSIGNED NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_email` varchar(255) NOT NULL,
  `u_pass` varchar(255) NOT NULL,
  `u_roll_num` int(11) NOT NULL DEFAULT '0',
  `u_role` int(11) NOT NULL DEFAULT '1',
  `u_default_c_id` bigint(20) NOT NULL DEFAULT '0',
  `u_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `u_name`, `u_email`, `u_pass`, `u_roll_num`, `u_role`, `u_default_c_id`, `u_ts`) VALUES
(1, 'admin', 'admin@myclass.com', 'dd14b9cc821618050366fb5ee5a55e82', 0, 3, 0, '2017-08-15 13:16:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `ug_id` bigint(20) UNSIGNED NOT NULL,
  `ug_u_id` bigint(20) NOT NULL,
  `ug_g_id` bigint(20) NOT NULL,
  `ug_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD UNIQUE KEY `as_id` (`as_id`);

--
-- Indexes for table `assign_submission`
--
ALTER TABLE `assign_submission`
  ADD UNIQUE KEY `ab_id` (`ab_id`);

--
-- Indexes for table `contribution`
--
ALTER TABLE `contribution`
  ADD UNIQUE KEY `cn_id` (`cn_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD UNIQUE KEY `c_id` (`c_id`);

--
-- Indexes for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD UNIQUE KEY `ce_id` (`ce_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD UNIQUE KEY `g_id` (`g_id`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD UNIQUE KEY `lh_id` (`lh_id`);

--
-- Indexes for table `studcontrib`
--
ALTER TABLE `studcontrib`
  ADD UNIQUE KEY `st_id` (`st_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD UNIQUE KEY `tk_id` (`tk_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `u_id` (`u_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD UNIQUE KEY `ug_id` (`ug_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `as_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `assign_submission`
--
ALTER TABLE `assign_submission`
  MODIFY `ab_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contribution`
--
ALTER TABLE `contribution`
  MODIFY `cn_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `c_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  MODIFY `ce_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `g_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `lh_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `studcontrib`
--
ALTER TABLE `studcontrib`
  MODIFY `st_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `tk_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `ug_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
