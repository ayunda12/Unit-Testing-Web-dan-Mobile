-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Nov 2021 pada 03.33
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dyahayusalon`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `id_booking` varchar(10) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `bukti_bayar` varchar(200) NOT NULL,
  `jumlah_bayar` int(8) NOT NULL,
  `keterangan_bayar` varchar(20) NOT NULL,
  `tgl_booking` date NOT NULL,
  `waktu_booking` time NOT NULL,
  `harga_paket` int(8) NOT NULL,
  `tgl_acara` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri`
--

CREATE TABLE `galeri` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `galeri`
--

INSERT INTO `galeri` (`id`, `foto`, `keterangan`) VALUES
(7, 'b.jpg', '<p>Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak.&nbsp;</p>\r\n'),
(9, 'membuat-form-login-min.png', '<p>ss</p>\r\n'),
(10, 'gpl.png', ''),
(12, 'call.jpg', ''),
(13, 'w2.jpg', ''),
(14, 'student-849822_1920.jpg', ''),
(15, 'bglyn.jpg', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_acara` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan`
--

CREATE TABLE `layanan` (
  `id` int(11) NOT NULL,
  `nama_layanan` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `gambar` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `layanan`
--

INSERT INTO `layanan` (`id`, `nama_layanan`, `keterangan`, `gambar`) VALUES
(12, 'Sound System', '', 'png-transparent-computer-icons-sound-icon-symbol-electro-house-miscellaneous-angle-text-removebg-preview.png'),
(13, 'Photo & Video', '', '27-279183_download-camera-icon-add-photo-icon-png-clipart-removebg-preview.png'),
(14, 'Mua Make Up', '', '3494231-removebg-preview.png'),
(15, 'Tenda & Dekorasi', '', 'download__1_-removebg-preview.png'),
(16, 'Busana Pengantin', '', 'download-removebg-preview.png'),
(17, 'Perawatan Rambut dan Wajah', '<p>Perawatan Wajah seperti facial dan masker kecantikan lainnya</p>\r\n', 'png-clipart-beauty-parlour-hair-care-computer-icons-black-hair-hair-black-hair-hand-removebg-preview.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `detail` text NOT NULL,
  `gambar` varchar(500) NOT NULL,
  `harga` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `detail`, `gambar`, `harga`) VALUES
(16, 'paket kusuma', '<p>mm</p>\r\n', 'download.png', 21474836),
(17, 'ayunda', '<p>nn</p>\r\n', 'download.png', 2147483),
(20, 'qq', '<p>qq</p>\r\n', 'f3.jpg', 11111111);

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimoni`
--

CREATE TABLE `testimoni` (
  `id_testimoni` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_upload` date NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `testimoni`
--

INSERT INTO `testimoni` (`id_testimoni`, `id_user`, `tgl_upload`, `keterangan`) VALUES
(7, 2, '2021-11-28', 'aaaa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `level` int(1) NOT NULL DEFAULT 2,
  `foto` varchar(255) NOT NULL DEFAULT 'default.png',
  `alamat` varchar(200) NOT NULL,
  `no_telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`, `foto`, `alamat`, `no_telp`) VALUES
(1, 'Ayunda kusuma wardani', 'adminku', '123456', 1, 'WhatsApp Image 2020-09-28 at 10.00.12 AM.jpeg', 'Dusun Beteng Sidomekar, kecamatan Semboro, Kabupaten Jember,68157', ''),
(2, 'user', 'user', 'user', 2, 'f3.jpg', '', ''),
(12, 'ayundakusuma', 'mikidung', '12345', 2, '1.jpeg', 'Dusun Beteng Sidomekar, kecamatan Semboro, Kabupaten Jember,68157', '0897655555555'),
(13, 'aa', 'miki123', '12345', 2, '1.jpeg', 'aaaa', '0922222');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `id_paket` (`id_paket`),
  ADD KEY `id_pelanggan` (`id_user`);

--
-- Indeks untuk tabel `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indeks untuk tabel `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id_testimoni`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id_testimoni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
