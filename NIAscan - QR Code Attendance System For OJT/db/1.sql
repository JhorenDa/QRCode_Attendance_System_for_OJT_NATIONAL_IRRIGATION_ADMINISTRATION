-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2025 at 04:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nia`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(125) NOT NULL,
  `fullName` varchar(125) NOT NULL,
  `userName` varchar(125) NOT NULL,
  `passWord` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fullName`, `userName`, `passWord`) VALUES
(1, 'Jhoren Mondejar Paña', 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `fullName` varchar(155) NOT NULL,
  `morning_time_in` time(6) NOT NULL,
  `morning_time_out` time(6) NOT NULL,
  `afternoon_time_in` time(6) NOT NULL,
  `afternoon_time_out` time(6) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `fullName`, `morning_time_in`, `morning_time_out`, `afternoon_time_in`, `afternoon_time_out`, `date`) VALUES
(8, 'Jhoren Paña', '08:32:54.111625', '08:32:54.111625', '00:00:00.000000', '00:00:00.000000', '2025-03-14'),
(9, 'Jhoren Paña', '00:00:00.000000', '00:00:00.000000', '00:00:00.000000', '14:54:29.489197', '2025-04-03'),
(10, 'Jhoren Paña', '00:00:00.000000', '00:00:00.000000', '14:27:36.103957', '00:00:00.000000', '2025-04-04'),
(11, 'Jerson Butawan', '10:23:49.568319', '00:00:00.000000', '00:00:00.000000', '00:00:00.000000', '2025-04-10'),
(12, 'Jerson Butawan', '00:00:00.000000', '00:00:00.000000', '21:31:02.172963', '00:00:00.000000', '2025-04-11');

-- --------------------------------------------------------

--
-- Table structure for table `ojt`
--

CREATE TABLE `ojt` (
  `id` int(125) NOT NULL,
  `name` varchar(123) NOT NULL,
  `contact` int(11) NOT NULL,
  `school` varchar(123) NOT NULL,
  `grade_lvl` varchar(123) NOT NULL,
  `course` varchar(123) NOT NULL,
  `region` varchar(123) NOT NULL,
  `city` varchar(123) NOT NULL,
  `brgy` varchar(123) NOT NULL,
  `street` varchar(123) NOT NULL,
  `ojt_hours` int(123) NOT NULL,
  `path` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ojt`
--

INSERT INTO `ojt` (`id`, `name`, `contact`, `school`, `grade_lvl`, `course`, `region`, `city`, `brgy`, `street`, `ojt_hours`, `path`) VALUES
(18, 'Jhoren Paña', 2147483647, 'ACLC COLLEGE OF BUTUAN', '4', 'BSIT', 'Select Region', 'Select City', 'Select Barangay', 'p1 Bay ang', 600, 'Jhoren Paña.jpg'),
(20, 'Maria Teresa Presillas', 2147483647, 'FSUU', '4th Year', 'Tourism', 'Select Region', 'Select City', 'Select Barangay', 'Bay ang', 600, 'Maria Teresa Presillas.jpg'),
(21, 'Jerson Butawan', 21312, 'FSUU', '', 'Tourism', 'Select Region', 'Select City', 'Select Barangay', 'sadasd', 50, 'Jerson Butawan.jpg'),
(22, 'Maria Teresa Presillas', 909584824, 'FSUU', '4th year', 'Tourism', '', '', '', 'okok', 480, 'Maria Teresa Presillas.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ojt`
--
ALTER TABLE `ojt`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(125) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ojt`
--
ALTER TABLE `ojt`
  MODIFY `id` int(125) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
