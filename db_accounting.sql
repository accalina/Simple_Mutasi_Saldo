-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2019 at 12:14 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_accounting`
--

-- --------------------------------------------------------

--
-- Table structure for table `mutasi`
--

CREATE TABLE `mutasi` (
  `no` int(11) NOT NULL,
  `activity` varchar(60) NOT NULL,
  `debit` int(11) NOT NULL,
  `credit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mutasi`
--

INSERT INTO `mutasi` (`no`, `activity`, `debit`, `credit`) VALUES
(1, 'Nasabah Lily melakukan Pengisian Dana', 20000, 0),
(2, 'Nasabah Accalina melakukan Pengisian Dana', 50000, 0),
(3, 'Nasabah Accalina melakukan Pengisian Dana', 20000, 0),
(4, 'Nasabah Accalina melakukan Pengisian Dana', 10000, 0),
(5, 'Nasabah Accalina melakukan Pengisian Pulsa', 0, 25000),
(6, 'Nasabah Accalina melakukan Pengisian Pulsa', 0, 25000),
(7, 'Nasabah Accalina melakukan Pengisian Pulsa', 0, 25000),
(8, 'Nasabah Accalina melakukan Pengisian Dana', 200000, 0),
(9, 'Nasabah Accalina melakukan Pengisian Pulsa', 0, 21000),
(10, 'Nasabah William melakukan Pengisian Dana', 400000, 0),
(11, 'Nasabah William melakukan Pengisian Pulsa', 0, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `no` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `saldo` int(11) NOT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`no`, `nama`, `saldo`, `point`) VALUES
(1, 'Accalina', 184000, 2),
(2, 'Lily', 20000, 0),
(3, 'William', 300200, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mutasi`
--
ALTER TABLE `mutasi`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mutasi`
--
ALTER TABLE `mutasi`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
