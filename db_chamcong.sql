-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2019 at 05:14 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_chamcong`
--

-- --------------------------------------------------------

--
-- Table structure for table `cong`
--

CREATE TABLE `cong` (
  `GiaoVien` char(100) NOT NULL,
  `NgayThang` date NOT NULL,
  `MaLopHP` char(10) NOT NULL,
  `MaPhong` int(3) NOT NULL,
  `Tiet` int(3) NOT NULL,
  `TinhTrang` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `giaovien`
--

CREATE TABLE `giaovien` (
  `MaGiaoVien` char(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `HoTenGiaoVien` varchar(50) NOT NULL,
  `MaKhoaVien` char(10) NOT NULL,
  `SDT` char(15) NOT NULL,
  `Email` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `giaovien`
--

INSERT INTO `giaovien` (`MaGiaoVien`, `HoTenGiaoVien`, `MaKhoaVien`, `SDT`, `Email`) VALUES
('GV01', 'Le Van Thanh', 'KHCNTT', '0123456789', 'abc@gmail.com'),
('GV02', 'Phan Anh Phong', 'KHCNTT', '5646546', 'a@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `giohoc`
--

CREATE TABLE `giohoc` (
  `Tiet` int(2) NOT NULL,
  `ThoiGian` char(6) NOT NULL,
  `KieuGio` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `giohoc`
--

INSERT INTO `giohoc` (`Tiet`, `ThoiGian`, `KieuGio`) VALUES
(1, '02:41', 1),
(2, '07:55', 1),
(3, '08:50', 1),
(4, '09:45', 1),
(5, '10:40', 1),
(6, '13:00', 1),
(7, '13:55', 1),
(8, '14:50', 1),
(9, '15:45', 1),
(10, '16:40', 1),
(1, '06:30', 2),
(2, '07:25', 2),
(3, '08:20', 2),
(4, '09:15', 2),
(5, '10:10', 2),
(6, '13:30', 2),
(7, '14:25', 2),
(8, '15:20', 2),
(9, '16:15', 2),
(10, '17:10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `hocphan`
--

CREATE TABLE `hocphan` (
  `MaHocPhan` char(8) NOT NULL,
  `TenHocPhan` varchar(100) NOT NULL,
  `SoTinChi` int(2) NOT NULL,
  `SoTietTrenTuan` int(2) NOT NULL,
  `MaKhoaVien` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hocphan`
--

INSERT INTO `hocphan` (`MaHocPhan`, `TenHocPhan`, `SoTinChi`, `SoTietTrenTuan`, `MaKhoaVien`) VALUES
('TI20025', 'Hệ điều hành\r\n', 3, 2, 'KHCNTT'),
('TI20081', 'Khai phá dữ liệu\r\n', 3, 2, 'KHCNTT');

-- --------------------------------------------------------

--
-- Table structure for table `input_check`
--

CREATE TABLE `input_check` (
  `id` int(11) NOT NULL,
  `diadiem` varchar(255) NOT NULL,
  `hocphan` varchar(255) NOT NULL,
  `giaovien` varchar(150) NOT NULL,
  `tietbd` int(2) NOT NULL,
  `ngaythang` varchar(15) NOT NULL,
  `gio` varchar(20) NOT NULL,
  `trangthai` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `input_check`
--

INSERT INTO `input_check` (`id`, `diadiem`, `hocphan`, `giaovien`, `tietbd`, `ngaythang`, `gio`, `trangthai`) VALUES
(11, 'Phòng máy 07 (KTCN 503)', 'Hệ điều hành(218)_01_TH2', 'Lê Văn Thành', 3, '2019-04-08', '8:50', b'01'),
(12, 'Phòng máy 08 (KTCN 504)', 'Tin học(218)_03_TH1', 'Lê Quốc Anh', 9, '2019-04-01', '16:00', b'01'),
(13, 'Phòng máy 01 (KTCN 401)', 'Tin học(218)_01_TH3', 'Nguyễn Thị Uyên', 8, '2019-04-15', '14:50', b'01'),
(14, 'Phòng máy 07 (KTCN 503)', 'Hệ điều hành(218)_01_TH2', 'Lê Văn Thành', 3, '2019-04-08', '10:35', b'00'),
(15, 'Phòng máy 08 (KTCN 504)', 'Tin học(218)_03_TH1', 'Lê Quốc Anh', 9, '2019-04-01', '17:00', b'00'),
(16, 'Phòng máy 01 (KTCN 401)', 'Tin học(218)_01_TH3', 'Nguyễn Thị Uyên', 8, '2019-04-15', '17:30', b'00');

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

CREATE TABLE `khoa` (
  `MaKhoa` char(8) NOT NULL,
  `TenKhoaVien` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`MaKhoa`, `TenKhoaVien`) VALUES
('KHCNTT', 'Viện kỹ thuật và công nghệ');

-- --------------------------------------------------------

--
-- Table structure for table `lichhoc`
--

CREATE TABLE `lichhoc` (
  `MaLichHoc` int(5) UNSIGNED NOT NULL,
  `MaGiaoVien` char(10) NOT NULL,
  `MaLopHP` char(10) NOT NULL,
  `TietBD` int(2) NOT NULL,
  `SoTiet` int(2) NOT NULL,
  `NgayBD` date NOT NULL,
  `NgayKT` date NOT NULL,
  `MaPhongHoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lichhoc`
--

INSERT INTO `lichhoc` (`MaLichHoc`, `MaGiaoVien`, `MaLopHP`, `TietBD`, `SoTiet`, `NgayBD`, `NgayKT`, `MaPhongHoc`) VALUES
(1, 'GV01', '1', 6, 2, '2019-03-05', '2019-05-16', 1),
(2, 'GV02', '2', 7, 2, '2019-01-15', '2019-05-09', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lichhoc_all`
--

CREATE TABLE `lichhoc_all` (
  `id` int(11) NOT NULL,
  `MaHocPhan` char(10) NOT NULL,
  `SoTinChi` int(11) NOT NULL,
  `LopHocPhan` varchar(100) NOT NULL,
  `KhoaHoc` char(4) NOT NULL,
  `SoSV` int(11) NOT NULL,
  `HinhThucHoc` char(5) NOT NULL,
  `SoTietTrenTuan` int(11) NOT NULL,
  `ThuNgay` int(11) NOT NULL,
  `TietBD` int(11) NOT NULL,
  `SoTiet` int(11) NOT NULL,
  `PhongHoc` char(100) NOT NULL,
  `NgayBD` char(15) NOT NULL,
  `NgayKT` char(15) NOT NULL,
  `GiaoVien` varchar(100) NOT NULL,
  `KhoaVien` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lichhoc_all`
--

INSERT INTO `lichhoc_all` (`id`, `MaHocPhan`, `SoTinChi`, `LopHocPhan`, `KhoaHoc`, `SoSV`, `HinhThucHoc`, `SoTietTrenTuan`, `ThuNgay`, `TietBD`, `SoTiet`, `PhongHoc`, `NgayBD`, `NgayKT`, `GiaoVien`, `KhoaVien`) VALUES
(1, 'TI20025', 3, 'Hệ điều hành(218)_01_TH2', 'K57', 18, 'TH', 2, 2, 3, 2, 'Phòng máy 07 (KTCN 503)', '04-03-19', '26-05-19', 'Lê Văn Thành', 'Khoa CNTT'),
(2, 'TI20025', 3, 'Hệ điều hành(218)_01_TH3', 'K57', 18, 'TH', 2, 2, 7, 2, 'Phòng máy 07 (KTCN 503)', '04-03-19', '26-05-19', 'Lê Văn Thành', 'Khoa CNTT'),
(3, 'TI20025', 3, 'Hệ điều hành(218)_01_TH4', 'K57', 18, 'TH', 2, 2, 9, 2, 'Phòng máy 07 (KTCN 503)', '04-03-19', '26-05-19', 'Lê Văn Thành', 'Khoa CNTT'),
(4, 'TI20025', 3, 'Hệ điều hành(218)_01_TH1', 'K57', 18, 'TH', 2, 2, 1, 2, 'Phòng máy 07 (KTCN 503)', '04-03-19', '26-05-19', 'Lê Văn Thành', 'Khoa CNTT'),
(5, 'TI20081', 3, 'Khai phá dữ liệu(218)_01_TH2', 'K56', 18, 'TH', 2, 2, 9, 2, 'Phòng máy 04 (KTCN 404)', '04-03-19', '26-05-19', 'Phan Anh Phong', 'Khoa CNTT'),
(6, 'TI20081', 3, 'Khai phá dữ liệu(218)_01_TH1', 'K56', 18, 'TH', 2, 2, 7, 2, 'Phòng máy 04 (KTCN 404)', '04-03-19', '26-05-19', 'Phan Anh Phong', 'Khoa CNTT'),
(7, 'TI20085', 3, 'Công nghệ phần mềm(218)_01_TH1', 'K56', 18, 'TH', 2, 2, 7, 2, 'Phòng máy 06 (KTCN 502)', '04-03-19', '26-05-19', 'Cao Thanh Sơn', 'Khoa CNTT'),
(8, 'TI20085', 3, 'Công nghệ phần mềm(218)_01_TH2', 'K56', 18, 'TH', 2, 2, 9, 2, 'Phòng máy 06 (KTCN 502)', '04-03-19', '26-05-19', 'Cao Thanh Sơn', 'Khoa CNTT'),
(9, 'INF20003', 3, 'Tin học ứng dụng trong Nông lâm ngư và Môi trường(218)_01_TH1_(Cơ sở 2)', 'K59', 20, 'TH', 3, 2, 7, 3, 'PM Cơ sở II_03', '01-04-19', '26-05-19', 'Võ Đức Quang', 'Viện KT-CN'),
(10, 'INF20003', 3, 'Tin học ứng dụng trong Nông lâm ngư và Môi trường(218)_02_TH1_(Cơ sở 2)', 'K59', 20, 'TH', 3, 2, 2, 3, 'PM Cơ sở II_03', '01-04-19', '26-05-19', 'Võ Đức Quang', 'Viện KT-CN'),
(11, 'INF20002', 3, 'Tin học(218)_01_TH1', 'K59', 18, 'TH', 2, 2, 2, 2, 'Phòng máy 01 (KTCN 401)', '04-03-19', '26-05-19', 'Nguyễn Thị Uyên', 'Viện SPTN'),
(12, 'INF20002', 3, 'Tin học(218)_01_TH2', 'K59', 18, 'TH', 2, 2, 6, 2, 'Phòng máy 01 (KTCN 401)', '04-03-19', '26-05-19', 'Nguyễn Thị Uyên', 'Viện SPTN'),
(13, 'INF20002', 3, 'Tin học(218)_01_TH3', 'K59', 18, 'TH', 2, 2, 8, 2, 'Phòng máy 01 (KTCN 401)', '04-03-19', '26-05-19', 'Nguyễn Thị Uyên', 'Viện SPTN'),
(14, 'INF20002', 3, 'Tin học(218)_03_TH3', 'K59', 18, 'TH', 2, 2, 3, 2, 'Phòng máy 08 (KTCN 504)', '04-03-19', '26-05-19', 'Lê Quốc Anh', 'Viện SPTN'),
(15, 'INF20002', 3, 'Tin học(218)_03_TH2', 'K59', 18, 'TH', 2, 2, 1, 2, 'Phòng máy 08 (KTCN 504)', '04-03-19', '26-05-19', 'Lê Quốc Anh', 'Viện SPTN');

-- --------------------------------------------------------

--
-- Table structure for table `lophocphan`
--

CREATE TABLE `lophocphan` (
  `MaLop` int(10) UNSIGNED NOT NULL,
  `MaLopHP` char(10) NOT NULL,
  `MaHocPhan` char(8) NOT NULL,
  `HinhThucLop` char(3) NOT NULL,
  `SoSinhVien` int(3) NOT NULL,
  `MaGiaoVien` char(9) NOT NULL,
  `KhoaHoc` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lophocphan`
--

INSERT INTO `lophocphan` (`MaLop`, `MaLopHP`, `MaHocPhan`, `HinhThucLop`, `SoSinhVien`, `MaGiaoVien`, `KhoaHoc`) VALUES
(1, '01_TH2', 'TI20025', 'TH', 18, 'GV01', 'k57'),
(2, '01_TH2', 'TI20081', 'TH', 18, 'GV02', 'k56');

-- --------------------------------------------------------

--
-- Table structure for table `phonghoc`
--

CREATE TABLE `phonghoc` (
  `MaPhongHoc` int(5) UNSIGNED NOT NULL,
  `SoPhong` int(5) NOT NULL,
  `NhaHoc` char(5) NOT NULL,
  `TenPhong` varchar(20) NOT NULL,
  `TrangThai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phonghoc`
--

INSERT INTO `phonghoc` (`MaPhongHoc`, `SoPhong`, `NhaHoc`, `TenPhong`, `TrangThai`) VALUES
(1, 101, 'A1', 'Nhà học A1-101', 1),
(2, 102, 'A1', 'Nhà học A1-102', 1);

-- --------------------------------------------------------

--
-- Table structure for table `thongke`
--

CREATE TABLE `thongke` (
  `GiaoVien` varchar(100) NOT NULL,
  `LopHocPhan` varchar(100) NOT NULL,
  `Thu` int(11) NOT NULL,
  `PhongHoc` varchar(100) NOT NULL,
  `TrangThai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thongke`
--

INSERT INTO `thongke` (`GiaoVien`, `LopHocPhan`, `Thu`, `PhongHoc`, `TrangThai`) VALUES
('1', '1', 1, '1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cong`
--
ALTER TABLE `cong`
  ADD PRIMARY KEY (`GiaoVien`,`NgayThang`,`Tiet`);

--
-- Indexes for table `giaovien`
--
ALTER TABLE `giaovien`
  ADD PRIMARY KEY (`MaGiaoVien`);

--
-- Indexes for table `hocphan`
--
ALTER TABLE `hocphan`
  ADD PRIMARY KEY (`MaHocPhan`);

--
-- Indexes for table `input_check`
--
ALTER TABLE `input_check`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`MaKhoa`);

--
-- Indexes for table `lichhoc`
--
ALTER TABLE `lichhoc`
  ADD PRIMARY KEY (`MaLichHoc`);

--
-- Indexes for table `lichhoc_all`
--
ALTER TABLE `lichhoc_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lophocphan`
--
ALTER TABLE `lophocphan`
  ADD PRIMARY KEY (`MaLop`);

--
-- Indexes for table `phonghoc`
--
ALTER TABLE `phonghoc`
  ADD PRIMARY KEY (`MaPhongHoc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `input_check`
--
ALTER TABLE `input_check`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `lichhoc`
--
ALTER TABLE `lichhoc`
  MODIFY `MaLichHoc` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lichhoc_all`
--
ALTER TABLE `lichhoc_all`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `lophocphan`
--
ALTER TABLE `lophocphan`
  MODIFY `MaLop` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `phonghoc`
--
ALTER TABLE `phonghoc`
  MODIFY `MaPhongHoc` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
