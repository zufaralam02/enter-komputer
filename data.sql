-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 09, 2024 at 12:51 PM
-- Server version: 8.0.35
-- PHP Version: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enter_komputer`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', '2024-08-08 16:39:16', '2024-08-08 16:39:16'),
(2, 'Minuman', '2024-08-08 16:39:16', '2024-08-08 16:39:16'),
(3, 'Promo', '2024-08-08 16:39:16', '2024-08-08 16:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `price` int DEFAULT '0',
  `items` int DEFAULT NULL,
  `table` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `code`, `price`, `items`, `table`, `created_at`, `updated_at`) VALUES
(1, 'qDQAY6UJ7EfttIY', 87000, 6, 1, '2024-08-09 19:48:07', '2024-08-09 19:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int NOT NULL,
  `order_code` varchar(100) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `price` int DEFAULT '0',
  `quantity` int DEFAULT NULL,
  `price_total` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_code`, `category_id`, `product_id`, `variant_id`, `price`, `quantity`, `price_total`, `created_at`, `updated_at`) VALUES
(1, 'qDQAY6UJ7EfttIY', 2, 3, 3, 12000, 1, 12000, '2024-08-09 19:48:07', '2024-08-09 19:48:07'),
(2, 'qDQAY6UJ7EfttIY', 2, 5, 8, 6000, 1, 6000, '2024-08-09 19:48:07', '2024-08-09 19:48:07'),
(3, 'qDQAY6UJ7EfttIY', 3, 7, 0, 23000, 2, 46000, '2024-08-09 19:48:07', '2024-08-09 19:48:07'),
(4, 'qDQAY6UJ7EfttIY', 2, 4, 5, 8000, 1, 8000, '2024-08-09 19:48:07', '2024-08-09 19:48:07'),
(5, 'qDQAY6UJ7EfttIY', 1, 1, 1, 15000, 1, 15000, '2024-08-09 19:48:07', '2024-08-09 19:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE `printer` (
  `id` int NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `printer`
--

INSERT INTO `printer` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'A', 'Printer Kasir', '2024-08-08 16:56:52', '2024-08-08 16:56:52'),
(2, 'B', 'Printer Dapur (Makanan)', '2024-08-08 16:57:15', '2024-08-08 16:57:15'),
(3, 'C', 'Printer Bar (Minuman)', '2024-08-08 16:57:15', '2024-08-08 16:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int DEFAULT '0',
  `has_variant` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `price`, `has_variant`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mie', 0, '1', '2024-08-08 16:42:00', '2024-08-08 16:42:00'),
(2, 1, 'Nasi Goreng', 15000, '0', '2024-08-08 16:42:00', '2024-08-08 16:42:00'),
(3, 2, 'Jeruk', 0, '1', '2024-08-08 16:42:00', '2024-08-08 16:42:00'),
(4, 2, 'Teh', 0, '1', '2024-08-08 16:42:00', '2024-08-08 16:42:00'),
(5, 2, 'Kopi', 0, '1', '2024-08-08 16:42:00', '2024-08-08 16:42:00'),
(6, 2, 'Extra Es Batu', 2000, '0', '2024-08-08 16:42:00', '2024-08-08 16:42:00'),
(7, 3, 'Nasi Goreng + Jeruk Dingin', 23000, '0', '2024-08-08 16:42:00', '2024-08-08 16:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `table`
--

CREATE TABLE `table` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `table`
--

INSERT INTO `table` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Meja no 1', '2024-08-08 16:59:10', '2024-08-08 16:59:10'),
(2, 'Meja no 2', '2024-08-08 16:59:10', '2024-08-08 16:59:10'),
(3, 'Meja no 3', '2024-08-08 16:59:10', '2024-08-08 16:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `variant`
--

CREATE TABLE `variant` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `variant`
--

INSERT INTO `variant` (`id`, `product_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Goreng', 15000, '2024-08-08 16:48:50', '2024-08-08 16:48:50'),
(2, 1, 'Kuah', 15000, '2024-08-08 16:48:50', '2024-08-08 16:48:50'),
(3, 3, 'Dingin', 12000, '2024-08-08 16:49:39', '2024-08-08 16:49:39'),
(4, 3, 'Panas', 10000, '2024-08-08 16:49:39', '2024-08-08 16:49:39'),
(5, 4, 'Manis', 8000, '2024-08-08 16:50:15', '2024-08-08 16:50:15'),
(6, 4, 'Tawar', 5000, '2024-08-08 16:50:15', '2024-08-08 16:50:15'),
(7, 5, 'Dingin', 8000, '2024-08-08 16:50:54', '2024-08-08 16:50:54'),
(8, 5, 'Panas', 6000, '2024-08-08 16:50:54', '2024-08-08 16:50:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variant`
--
ALTER TABLE `variant`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `printer`
--
ALTER TABLE `printer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `table`
--
ALTER TABLE `table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variant`
--
ALTER TABLE `variant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
