-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2019 at 05:51 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galeri_market`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` char(6) NOT NULL,
  `nama_admin` varchar(20) NOT NULL,
  `gaji` int(7) NOT NULL,
  `id_pengelola` char(6) NOT NULL,
  `username` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `gaji`, `id_pengelola`, `username`) VALUES
('OW_001', 'Bagas Pangestu', 7000000, 'Pg_001', '12345'),
('OW_002', 'Yudi Gunawan', 8000000, 'Pg_001', '11223'),
('OW_003', 'M Suva Rahadiyan', 6900000, 'Pg_001', '33221');

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `username` char(5) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`username`, `password`) VALUES
('11122', 'Pengelola'),
('11223', 'admin2'),
('12345', 'admin1'),
('33221', 'admin3');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(5) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `jumlah_stok` int(3) NOT NULL,
  `harga` int(5) NOT NULL,
  `id_pemasok` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `jumlah_stok`, `harga`, `id_pemasok`) VALUES
('P001', 'Rinto 10 Tangan', 10, 15000, 'S003'),
('P002', 'Gorengan', 15, 1000, 'S002'),
('P003', 'Tipe-Ex', 5, 7000, 'S001'),
('P004', 'Sasa Micin', 7, 2000, 'S003'),
('P005', 'Pena Standard', 12, 2500, 'S001');

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `id_pemasok` char(5) NOT NULL,
  `nama_perusahaan` varchar(20) NOT NULL,
  `nama_kontak` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`id_pemasok`, `nama_perusahaan`, `nama_kontak`) VALUES
('S001', 'PT.Surya Kencana', 'Ujang'),
('S002', 'PT.Mau Aja Lah', 'Eka'),
('S003', 'PT.Wings Of Freedom', 'Sueb');

-- --------------------------------------------------------

--
-- Table structure for table `pengelola`
--

CREATE TABLE `pengelola` (
  `id_pengelola` char(6) NOT NULL,
  `nama_pengelola` varchar(20) NOT NULL,
  `alamat_pengelola` varchar(30) NOT NULL,
  `username` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengelola`
--

INSERT INTO `pengelola` (`id_pengelola`, `nama_pengelola`, `alamat_pengelola`, `username`) VALUES
('Pg_001', 'Aceng', 'Jl Lapas Raya, Way Huwi, nomor', '11122');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(6) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `id_admin` char(6) NOT NULL,
  `id_barang` char(5) NOT NULL,
  `jumlah_beli` int(3) NOT NULL,
  `harga` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `username` (`username`),
  ADD KEY `id_pengelola` (`id_pengelola`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_pemasok` (`id_pemasok`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id_pemasok`);

--
-- Indexes for table `pengelola`
--
ALTER TABLE `pengelola`
  ADD PRIMARY KEY (`id_pengelola`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`username`) REFERENCES `akun` (`username`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`id_pengelola`) REFERENCES `pengelola` (`id_pengelola`);

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id_pemasok`);

--
-- Constraints for table `pengelola`
--
ALTER TABLE `pengelola`
  ADD CONSTRAINT `pengelola_ibfk_1` FOREIGN KEY (`username`) REFERENCES `akun` (`username`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
