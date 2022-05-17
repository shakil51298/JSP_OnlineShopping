-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 11:56 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `email` varchar(100) NOT NULL,
  `p_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `mobileNumber` varchar(20) DEFAULT NULL,
  `orderDate` varchar(100) DEFAULT NULL,
  `deliveryDate` varchar(100) DEFAULT NULL,
  `paymentMethod` varchar(100) DEFAULT NULL,
  `t_Id` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`email`, `p_id`, `quantity`, `price`, `total`, `address`, `city`, `state`, `country`, `mobileNumber`, `orderDate`, `deliveryDate`, `paymentMethod`, `t_Id`, `status`) VALUES
('luokainwwn2@gmail.com', 2, 1, 1500, 1500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('luokainwwn2@gmail.com', 4, 1, 9000, 9000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('zohra@gmail.com', 1, 1, 300, 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('zikaiwen01@gmail.com', 4, 2, 9000, 18000, 'dhaka,bangladesh', 'faridpur', 'Alaska', 'United States', '185679099083', '2022-05-01 05:17:20', '2022-05-04 05:17:20.000000', 'Cash on delivery', 'tid23243', 'processing'),
('zikaiwen01@gmail.com', 1, 1, 300, 300, 'dhaka,bangladesh', 'faridpur', 'Alaska', 'United States', '185679099083', '2022-05-01 05:17:20', '2022-05-04 05:17:20.000000', 'Cash on delivery', 'tid23243', 'processing'),
('zikaiwen01@gmail.com', 4, 1, 9000, 9000, 'dhaka,bangladesh', 'Alaska', 'faridpur', 'United States', '185679099083', '2022-05-01 06:16:15', '2022-05-04 06:16:15.000000', 'Cash on delivery', '', 'processing'),
('zikaiwen01@gmail.com', 1, 4, 300, 1200, 'dhaka,bangladesh', 'Alaska', 'faridpur', 'United States', '185679099083', '2022-05-01 06:16:15', '2022-05-04 06:16:15.000000', 'Cash on delivery', '', 'processing'),
('admin@gmail.com', 3, 1, 9000, 9000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('admin@gmail.com', 1, 1, 300, 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rokon1@gmail.com', 1, 1, 300, 300, 'Jiangxi ', 'nanchang', 'nanchang', 'china', '234423454', '2022-05-01 20:01:58', '2022-05-04 20:01:58.000000', 'PayPal', 'te2343', 'processing'),
('rokon1@gmail.com', 3, 1, 9000, 9000, 'Jiangxi ', 'nanchang', 'nanchang', 'china', '234423454', '2022-05-01 20:04:13', '2022-05-04 20:04:13.000000', 'Cash on delivery', '', 'processing'),
('zikaiwen01@gmail.com', 1, 1, 300, 300, 'Jiangxi ', 'nanchang', 'nanchang', 'china', '234423454', '2022-05-01 20:10:29', '2022-05-04 20:10:29.000000', 'Cash on delivery', '45675675765675', 'bill');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `p_name` varchar(300) DEFAULT NULL,
  `p_category` varchar(300) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `p_name`, `p_category`, `price`, `active`) VALUES
(1, 'Nike', 'sport shoes', 300, 'yes'),
(2, 'xiaomi 11', 'phone', 5800, 'yes'),
(3, 'Iphone 13 pro max 256gb ', 'phone', 9000, 'yes'),
(4, 'Iohone 11 128gb ', 'phone', 9000, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_number` bigint(20) DEFAULT NULL,
  `security_questions` varchar(200) DEFAULT NULL,
  `answer` varchar(200) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`name`, `email`, `mobile_number`, `security_questions`, `answer`, `password`, `address`, `state`, `city`, `country`) VALUES
('Kevin', 'luokainwwn2@gmail.com', 234423454, 'what was your first car?', 'Mercerize Benz', 'Kevin12345', 'Jiangxi ', 'nanchang', 'nanchang', 'china'),
('rokon', 'rokon1@gmail.com', 234423454, 'which school did you go?', 'zohra', '12345', 'Jiangxi ', 'nanchang', 'nanchang', 'china'),
('md khalid hossain', 'zikaiwen01@gmail.com', 234423454, 'what is the name of your first pet?', 'shakil', '12345', 'Jiangxi ', 'nanchang', 'nanchang', 'china'),
('Zohra', 'zohra@gmail.com', 234423454, 'what was your first car?', 'zohra', '12345', 'Jiangxi ', 'nanchang', 'nanchang', 'china');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
