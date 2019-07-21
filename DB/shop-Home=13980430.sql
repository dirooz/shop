-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2019 at 07:57 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_persian_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_persian_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '8', 1563372045),
('author', '7', 1563372045);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_persian_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_persian_ci,
  `rule_name` varchar(64) COLLATE utf8_persian_ci DEFAULT NULL,
  `data` text COLLATE utf8_persian_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1563372045, 1563372045),
('author', 1, NULL, NULL, NULL, 1563372045, 1563372045),
('createPost', 2, 'create a post', NULL, NULL, 1563372045, 1563372045),
('updatePost', 2, 'update a post', NULL, NULL, 1563372045, 1563372045);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_persian_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'author'),
('admin', 'updatePost'),
('author', 'createPost');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_persian_ci NOT NULL,
  `data` text COLLATE utf8_persian_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `cat_ename` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cat_name`, `cat_ename`, `parent_id`) VALUES
(6, 'اموزش فریم ورک', 'framework', 0),
(7, 'dsvfdsf', 'dsfsf', 0),
(8, 'zczc', 'zxcxds', 6),
(9, 'fsdfdsfsdf', 'fdsfdsfsdf', 7),
(10, 'fvdsfsfds', 'fdsfdsfdsf', 7),
(11, 'aaaaaa', 'aa', 0),
(12, 'aaaaaa', 'aa', 0),
(13, 'vbvc', 'cvbcb', 13),
(14, 'aaaaaa', 'aa', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_persian_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1563029406),
('m190713_045441_create_session_table', 1563029410),
('m190713_152227_create_users_table', 1563031636);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `title_url` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `text` text COLLATE utf8_persian_ci,
  `view` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `links` text COLLATE utf8_persian_ci,
  `tag` text COLLATE utf8_persian_ci,
  `img` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `download_times` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `download_number` int(3) DEFAULT NULL,
  `download_size` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `title_url`, `text`, `view`, `status`, `price`, `time`, `order_number`, `links`, `tag`, `img`, `download_times`, `download_number`, `download_size`) VALUES
(9, 'محصول جدید', 'محصول-جدید', '', 0, 1, NULL, 1563029486, 0, '', '', 'upload/1563029486.jpg', '', NULL, ''),
(10, 'محصول2', 'محصول2', '', 0, 1, NULL, 1563029523, 0, '', '', 'upload/1563029523.jpg', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `product_id`, `category_id`) VALUES
(1, 6, 6),
(2, 6, 8),
(3, 6, 7),
(12, 7, 6),
(13, 7, 8),
(14, 7, 9),
(15, 7, 10),
(16, 7, 12),
(17, 7, 14),
(18, 8, 11),
(19, 8, 12),
(20, 8, 14),
(21, 9, 9),
(22, 9, 10),
(23, 10, 9),
(24, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `expire`, `data`) VALUES
('lf1p2d1trqe8qe550mme2cuhkr', 1563030856, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030857, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030868, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030868, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030870, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030873, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030874, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030874, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030875, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030876, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030877, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030877, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030879, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030881, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030882, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030882, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030883, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030888, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030888, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030890, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030892, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030893, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030893, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030894, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030895, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030896, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030898, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030899, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030900, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030927, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030928, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030929, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030942, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030944, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030964, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030965, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030966, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030974, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030976, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030978, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030980, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030981, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030982, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030984, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030985, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030985, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030987, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030987, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030988, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030991, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563030992, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563031804, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563031806, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563031810, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563031811, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563031813, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563031814, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563032596, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563032607, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563032609, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563032611, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563032612, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563032613, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563032640, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563032641, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563032705, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033142, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033143, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033144, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033145, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033147, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033148, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033162, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033164, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033166, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033167, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033241, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033242, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033280, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033282, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033284, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033285, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033378, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033379, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033426, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563033428, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563041913, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563041914, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042161, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042163, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042264, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042265, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042416, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042418, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042547, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042548, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042930, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563042931, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043004, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043004, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043037, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043039, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043046, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043120, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043122, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043124, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043126, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043128, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043133, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043136, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043139, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043145, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043148, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043158, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043173, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043194, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043197, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043218, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043226, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043235, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043240, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043242, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043521, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043526, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043527, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043530, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043532, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043541, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043542, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043548, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043552, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043554, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043561, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043562, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563043564, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563044148, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563044153, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563044163, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563044169, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563044173, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563044175, 0x5f5f666c6173687c613a303a7b7d),
('lf1p2d1trqe8qe550mme2cuhkr', 1563044176, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371189, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371191, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371205, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371206, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371335, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371336, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371370, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371371, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371444, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563371446, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563372785, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563372786, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563372802, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563372804, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563372908, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563372910, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563373009, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563373010, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563373318, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563373319, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563373486, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563373545, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563373546, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563373550, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563373554, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377317, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377320, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377322, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377325, 0x5f5f666c6173687c613a313a7b733a31363a226d6573736167655f7265676973746572223b693a313b7d6d6573736167655f72656769737465727c733a34383a22d8abd8a8d8aa20d986d8a7d98520d8a8d8a720d985d988d981d982db8cd8aa20d8a7d986d8acd8a7d98520d8b4d8af2e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377326, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377331, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377339, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377348, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377353, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377355, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377357, 0x5f5f666c6173687c613a313a7b733a31363a226d6573736167655f7265676973746572223b693a313b7d6d6573736167655f72656769737465727c733a34383a22d8abd8a8d8aa20d986d8a7d98520d8a8d8a720d985d988d981d982db8cd8aa20d8a7d986d8acd8a7d98520d8b4d8af2e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377359, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377488, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377490, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377496, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377497, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377910, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377911, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377929, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377931, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377937, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377939, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377981, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377982, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377984, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377985, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377986, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563377988, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563378150, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563378152, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563378159, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563378161, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381034, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381035, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381037, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381401, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381403, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381417, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381418, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381420, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381649, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381650, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381650, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381652, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381662, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381663, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563381665, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382092, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382093, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382104, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382105, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382109, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382110, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382126, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382128, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382130, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382131, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382143, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382145, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382146, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382317, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382319, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382334, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382335, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382604, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382605, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382612, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382614, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382618, 0x5f5f666c6173687c613a313a7b733a373a2273756363657373223b693a2d313b7d737563636573737c733a34323a22436865636b20796f757220656d61696c20666f72206675727468657220696e737472756374696f6e732e223b),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382619, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563382621, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563383410, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563383412, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563383413, 0x5f5f666c6173687c613a303a7b7d),
('eafecrqsfsjc3k0hss15rkcl2s', 1563383415, 0x5f5f666c6173687c613a303a7b7d);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_persian_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `password_hash`, `password_reset_token`, `email`, `username`, `auth_key`, `role`) VALUES
(2, 'user', 'user', '$2y$13$wDYMfAZeg8nzOiUoB/soWOIqVQH0repS3GO/jCrQ0YjfkopK6UBG2', 'GbfCOZl1qIAAyjuu9F6gYp27vicx4bmV_1563381177', 'user@user.ir', NULL, 'Bn82Y8ZIQQpIBxRHl2dJHKicNOvqX_hI', 'user'),
(3, 'admin', 'admin', '$2y$13$rStT/K/MLDTYutJUavAqs..8ucQ7TmzqIwE6ZMZ3E/0L9hwRPmYku', '90sOlwJn4Zjx-g1UdtZCCIQeltzQ9fmI_1563380221', 'h.abdollahzadeh20@gmail.com', NULL, 'WCg7dFy2ciEaDrqVx4lcetFh87tRITL7', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
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
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
