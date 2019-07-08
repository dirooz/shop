-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2019 at 08:56 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

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
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `title_url` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `text` text COLLATE utf8_persian_ci DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `links` text COLLATE utf8_persian_ci DEFAULT NULL,
  `tag` text COLLATE utf8_persian_ci DEFAULT NULL,
  `img` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `download_times` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `download_number` int(3) DEFAULT NULL,
  `download_size` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `title_url`, `text`, `view`, `status`, `price`, `time`, `order_number`, `links`, `tag`, `img`, `download_times`, `download_number`, `download_size`) VALUES
(4, 'sddsad', 'sddsad', '', 0, 1, NULL, 1562494430, 0, '', '', 'upload/1562494430.jpg', '', NULL, ''),
(5, 'fgg', 'fgg', '', 0, 2, NULL, 1562563971, 0, '', '', NULL, '', NULL, ''),
(6, 'jsjs', 'jsjs', '', 0, 1, NULL, 1562565513, 0, '', '', NULL, '', NULL, ''),
(7, 'fdgfdg', 'fdgfdg', '', 0, 1, NULL, 1562568043, 0, '', '', NULL, '', NULL, '');

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
(17, 7, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
