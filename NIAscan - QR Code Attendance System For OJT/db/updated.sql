-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2025 at 05:05 PM
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
-- Table structure for table `barangays`
--

CREATE TABLE `barangays` (
  `id` int(11) NOT NULL,
  `barangay_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangays`
--

INSERT INTO `barangays` (`id`, `barangay_name`) VALUES
(1, 'Bay-ang'),
(2, 'Bayabas'),
(3, 'Cabinet'),
(4, 'Calamba'),
(5, 'Comagascas'),
(6, 'Kauswagan'),
(7, 'La Union'),
(8, 'Mabini'),
(9, 'Mahaba'),
(10, 'Mahayahay'),
(11, 'Poblacion 1'),
(12, 'Poblacion 2'),
(13, 'Poblacion 3'),
(14, 'Poblacion 4'),
(15, 'Poblacion 5'),
(16, 'Sanghan'),
(17, 'Soriano'),
(18, 'Tandan'),
(19, 'Tolosa'),
(20, 'Katugasan'),
(21, 'Ambago'),
(22, 'Ampayon'),
(23, 'Anticala'),
(24, 'Antongalon'),
(25, 'Baan Km. 3'),
(26, 'Baan Riverside'),
(27, 'Bading'),
(28, 'Bancasi'),
(29, 'Banza'),
(30, 'Bitan-ag'),
(31, 'Bobon'),
(32, 'Bonbon'),
(33, 'Bugabus'),
(34, 'Dumalagan'),
(35, 'Doongan'),
(36, 'Golden Ribbon'),
(37, 'Holy Redeemer'),
(38, 'Imadejas'),
(39, 'Kinamlutan'),
(40, 'Lemon'),
(41, 'Libertad'),
(42, 'Los Angeles'),
(43, 'Lumbocan'),
(44, 'Mahogany'),
(45, 'Mahay'),
(46, 'Mambalili'),
(47, 'Mandamo'),
(48, 'Masao'),
(49, 'New Society Village'),
(50, 'Obrero'),
(51, 'Pagatpatan'),
(52, 'Pelaez'),
(53, 'Pinamanculan'),
(54, 'Salvacion'),
(55, 'San Ignacio'),
(56, 'San Mateo'),
(57, 'San Vicente'),
(58, 'Sumile'),
(59, 'Tagabaca'),
(60, 'Taguibo'),
(61, 'Taligaman'),
(62, 'Tiniwisan'),
(63, 'Upper Doongan'),
(64, 'Villa Kananga'),
(65, 'Villa Matias'),
(66, 'Zillovia');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `city_name`) VALUES
(1, 'Cabadbaran City'),
(2, 'Butuan City');

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
(22, 'Maria Teresa Presillas', 909584824, 'FSUU', '4th year', 'Tourism', '', '', '', 'okok', 480, 'Maria Teresa Presillas.jpg'),
(23, 'Carlo Maneja', 2147483647, 'FSUU', '3rd Year', 'Tourism', 'Caraga (Region XIII)', 'Cabadbaran City', 'Bay-ang', 'purok 1', 400, 'Carlo Maneja.jpg'),
(24, 'Joshua', 2147483647, 'FSUU', '4th Year', 'Tourism', 'Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)', 'Butuan City', 'Sanghan', 'purok 1', 213, 'Joshua.jpg'),
(25, 'Daryll Cabagay', 2147483647, 'CSU', '4th Year', 'BSIT', 'Central Luzon (Region III)', 'Butuan City', 'Sanghan', 'prsa', 600, 'Daryll Cabagay.jpg'),
(26, 'Espie Appari', 2147483647, 'CSU', '4th Year', 'Engineering', 'Cordillera Administrative Region (CAR)', 'Cabadbaran City', 'Sanghan', 'sad', 800, 'Espie Appari.jpg'),
(27, 'adfasdasd', 2147483647, 'asdasdasd', 'asd12312', 'asdasd', 'Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)', 'Butuan City', 'Katugasan', '21312312', 13123123, 'adfasdasd.jpg'),
(28, 'asdasdzczxczx', 12312312, 'xzczxczxc', 'zxczx', '12312zxc', 'Cordillera Administrative Region (CAR)', 'Cabadbaran City', 'Soriano', 'sad', 213, 'asdasdzczxczx.jpg'),
(29, 'mnmnmnmm', 21312312, 'nmnmnm', 'mnmnmn', 'mnmnmn', 'SOCCSKSARGEN (Region XII)', 'Butuan City', 'Banza', '21312', 23214, 'mnmnmnmm.jpg'),
(30, '12321312', 2131233, '123123', '213123', '1231231', 'Caraga (Region XIII)', 'Butuan City', 'Soriano', '12312', 1, '12321312.jpg'),
(31, 'tytytyt', 0, 'tytyt', '132', 'ytyty', 'Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)', 'Cabadbaran City', 'Comagascas', '123', 234324, 'tytytyt.jpg'),
(32, 'qqqqqqqqqq', 0, 'qqqq', 'qq', 'qqq', 'Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)', 'Butuan City', 'Sanghan', '12312', 21312, 'qqqqqqqqqq.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `region_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `region_name`) VALUES
(1, 'Ilocos Region (Region I)'),
(2, 'Cagayan Valley (Region II)'),
(3, 'Central Luzon (Region III)'),
(4, 'CALABARZON (Region IV-A)'),
(5, 'MIMAROPA (Region IV-B)'),
(6, 'Bicol Region (Region V)'),
(7, 'Western Visayas (Region VI)'),
(8, 'Central Visayas (Region VII)'),
(9, 'Eastern Visayas (Region VIII)'),
(10, 'Zamboanga Peninsula (Region IX)'),
(11, 'Northern Mindanao (Region X)'),
(12, 'Davao Region (Region XI)'),
(13, 'SOCCSKSARGEN (Region XII)'),
(14, 'Caraga (Region XIII)'),
(15, 'Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)'),
(16, 'Cordillera Administrative Region (CAR)'),
(17, 'National Capital Region (NCR)');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `id` int(125) NOT NULL,
  `name` varchar(125) NOT NULL,
  `shorten` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `name`, `shorten`) VALUES
(1, 'AMA Computer Learning Center College Of Butuan', 'ACLC ');

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
-- Indexes for table `barangays`
--
ALTER TABLE `barangays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ojt`
--
ALTER TABLE `ojt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
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
-- AUTO_INCREMENT for table `barangays`
--
ALTER TABLE `barangays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ojt`
--
ALTER TABLE `ojt`
  MODIFY `id` int(125) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(125) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
