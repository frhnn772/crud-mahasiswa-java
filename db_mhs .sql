-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 03:31 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mhs`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(255) NOT NULL,
  `jumlah_mhs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`id_jurusan`, `nama_jurusan`, `jumlah_mhs`) VALUES
(1, 'Teknik Informatika', 3),
(2, 'Teknik Sipil', 0),
(3, 'Teknik Mesin', 0),
(4, 'Teknik Perkapalan', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `nis` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `tgl_lahir` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `ipk` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`nis`, `nama`, `jenis_kelamin`, `tgl_lahir`, `alamat`, `ipk`, `id_jurusan`, `id_semester`) VALUES
(2132, 'ddsvds', 'Perempuan', '43 dvvevfferv 3433', 'vdfvdfvdfvdvs', 23, 1, 2),
(2509, 'Evelina', 'Perempuan', '18 September 2003', 'Jl Kijang Baru', 42, 4, 2),
(2510, 'Farhan Mulyaputra', 'Laki - Laki', '01 Januari 2005', 'Jl. Hang Jebat', 4, 1, 3),
(2512, 'Fito', 'Laki - Laki', '18 Februari 2004', 'Jl Sungai Pulai', 34, 1, 2),
(2520, 'Syafii', 'Laki - Laki', '18 Februari 2004', 'Jl Sungai Pulai', 34, 4, 2);

--
-- Triggers `tb_mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `hapus` BEFORE DELETE ON `tb_mahasiswa` FOR EACH ROW BEGIN
	UPDATE tb_jurusan SET jumlah_mhs = jumlah_mhs - 1 WHERE id_jurusan = old.id_jurusan;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_jurusan` BEFORE INSERT ON `tb_mahasiswa` FOR EACH ROW BEGIN
    UPDATE tb_jurusan SET jumlah_mhs = jumlah_mhs + 1 WHERE id_jurusan = new.id_jurusan;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_mahasiswa` BEFORE UPDATE ON `tb_mahasiswa` FOR EACH ROW BEGIN
	UPDATE tb_jurusan SET jumlah_mhs = jumlah_mhs - 1 WHERE id_jurusan = old.id_jurusan;
    UPDATE tb_jurusan SET jumlah_mhs = jumlah_mhs + 1 WHERE id_jurusan = new.id_jurusan;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_semester`
--

CREATE TABLE `tb_semester` (
  `id_semester` int(11) NOT NULL,
  `nama_semester` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_semester`
--

INSERT INTO `tb_semester` (`id_semester`, `nama_semester`) VALUES
(1, '1 Semester'),
(2, '2 Semester'),
(3, '3 Semester');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_semester` (`id_semester`);

--
-- Indexes for table `tb_semester`
--
ALTER TABLE `tb_semester`
  ADD PRIMARY KEY (`id_semester`),
  ADD UNIQUE KEY `nama_semester` (`nama_semester`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_semester`
--
ALTER TABLE `tb_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
