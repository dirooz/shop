-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2019 at 01:04 PM
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
(14, 'aaaaaa', 'aa', 0),
(15, 'aaaaaa', 'aa', 0),
(16, 'aaaaaa', 'aa', 0);

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
('m000000_000000_base', 1562995244),
('m190713_045441_create_session_table', 1562995258),
('m190713_152227_create_users_table', 1563077428);

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
(11, 'محصول جدید', 'محصول-جدید', '', 0, 1, 630000, 1563011183, 0, '', '', 'upload/1563011183.jpg', '', NULL, ''),
(12, 'محصول 2', 'محصول-2', '', 0, 1, 560000, 1563011210, 0, '', '', 'upload/1563011210.jpg', '', NULL, '');

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
(12, 7, 6),
(13, 7, 8),
(14, 7, 9),
(15, 7, 10),
(16, 7, 12),
(17, 7, 14),
(18, 6, 6),
(19, 6, 8),
(20, 6, 7),
(27, 12, 7),
(28, 12, 9),
(29, 12, 10),
(30, 11, 9),
(31, 11, 10),
(32, 11, 11);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(40) COLLATE utf8_persian_ci NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `expire`, `data`) VALUES
('g0vishaeahb35ui6frqqst30bv', 1563014579, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014635, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014640, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014702, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014703, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014705, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014705, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014761, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014868, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014871, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563014875, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015924, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015928, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015938, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015939, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015943, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015956, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015956, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015958, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015961, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015968, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015968, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015971, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015971, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015972, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015973, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015973, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015974, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015974, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015977, 0x5f5f666c6173687c613a303a7b7d),
('g0vishaeahb35ui6frqqst30bv', 1563015983, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563078878, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563078886, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563078898, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079155, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079160, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079167, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079171, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079174, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079176, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079181, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079182, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079184, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079191, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079192, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079339, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563079392, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080125, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080126, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080128, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080132, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080136, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080140, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080148, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080150, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080150, 0x5f5f666c6173687c613a313a7b733a31363a226d6573736167655f7265676973746572223b693a313b7d6d6573736167655f72656769737465727c733a34383a22d8abd8a8d8aa20d986d8a7d98520d8a8d8a720d985d988d981d982db8cd8aa20d8a7d986d8acd8a7d98520d8b4d8af2e223b),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080186, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080191, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563080192, 0x5f5f666c6173687c613a313a7b733a31363a226d6573736167655f7265676973746572223b693a313b7d6d6573736167655f72656769737465727c733a34383a22d8abd8a8d8aa20d986d8a7d98520d8a8d8a720d985d988d981d982db8cd8aa20d8a7d986d8acd8a7d98520d8b4d8af2e223b),
('vk72obcsuua6uvfbnsq2tc49kr', 1563084159, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563084163, 0x5f5f666c6173687c613a303a7b7d),
('vk72obcsuua6uvfbnsq2tc49kr', 1563089082, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563102651, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563102657, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563102668, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103468, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103496, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103504, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103508, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103511, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103522, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103525, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103527, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103528, 0x5f5f666c6173687c613a313a7b733a31363a226d6573736167655f7265676973746572223b693a313b7d6d6573736167655f72656769737465727c733a34383a22d8abd8a8d8aa20d986d8a7d98520d8a8d8a720d985d988d981d982db8cd8aa20d8a7d986d8acd8a7d98520d8b4d8af2e223b),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103534, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103544, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103545, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a343b),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103567, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103567, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a343b),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103567, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103567, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a343b),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103574, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103574, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a343b),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103574, 0x5f5f666c6173687c613a303a7b7d),
('747s2j9e8sdr1pbmalcmcf6an1', 1563103575, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a343b);

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
(1, 'نام', 'نام خانوادگی', '$2y$13$dMGfE2TUeKNLiHtX5UoyWulXTWF698kDcUA3jCt6qKQBG39eqCEb6', NULL, 'hfghghg@hjkkj.com', NULL, 'vxpppp0fymcQx0HeFkCM-kYP-gEVTSqu', 'user'),
(2, 'نام', 'نام خانوادگی', '$2y$13$93pk/sKYQmqaxBWMrQ/olOd6CLb34mMZhhnHvhRJtr0CxXh.1IcJm', NULL, 'hfghghg@hjkj.com', NULL, 'dA2HKYFD3ZWipabvkEddQKyloRbzuvcJ', 'user'),
(3, 'نام', 'نام خانوادگی', '$2y$13$kIwlPhB95Bmm2sF2J3eXwuLrcNNT1xS/cuiUWmNSX47OqOBldwr06', NULL, 'hghg@hjkj.com', NULL, '4Zj_4AFEOufWbs99tRw_HauVudSElhdZ', 'user'),
(4, 'حسین', 'عبد', '$2y$13$Cf5KYiRUInwArn2YSxSYvONkIrX0ECh3c54dBe7hSkpC31Z5sOkD2', NULL, 'aaa@bbb.com', NULL, '6KIUHcpYZA6Qy79CCnb9YwO6iddQnWm9', 'user');

--
-- Indexes for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
