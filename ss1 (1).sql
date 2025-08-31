-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2025 at 05:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ss1`
--

-- --------------------------------------------------------

--
-- Table structure for table `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` varchar(7) NOT NULL,
  `regency_id` varchar(4) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaderboards`
--

CREATE TABLE `leaderboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `kcd` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lost_found`
--

CREATE TABLE `lost_found` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `status` enum('Dicari','Ditemukan','Selesai') NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `waktu` datetime NOT NULL,
  `kontak` varchar(20) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lost_found`
--

INSERT INTO `lost_found` (`id`, `judul`, `status`, `kategori`, `lokasi`, `waktu`, `kontak`, `deskripsi`, `gambar`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'oke1', 'Dicari', 'Pakaian', 'Kantin', '2025-08-07 03:00:00', '08123456789', 'Jaket hilang', '/img/avatar-lost.png', 2929091, '2025-07-20 11:56:08', '2025-08-02 14:41:19'),
(2, 'Ditemukan topi', 'Ditemukan', 'Aksesoris', 'Lab sija', '2025-07-26 23:39:12', '081234567899', '-', '/img/icon-aksesoris.png', 2929091, '2025-07-26 12:39:12', '2025-08-02 09:43:46'),
(3, 'Dicari TWS bluetooth', 'Dicari', 'Elektronik', 'Lapangan Utama', '2025-07-27 08:30:00', '081122334455', '-', '/img/icon-elektronik.png', 2929090, '2025-07-27 07:30:46', '2025-08-02 09:43:21'),
(19, 'Testi 2', 'Dicari', 'Aksesoris', 'Aula 1', '2025-07-30 15:22:00', '08123456789', '-', '/img/1754097788274-bbcam.jpg', 2929090, '2025-07-30 22:22:23', '2025-08-02 09:43:13'),
(20, 'Ditemukan jam tangan di aula 2', 'Ditemukan', 'Elektronik', 'Aula 2', '2025-08-02 01:24:00', '08123456789', '-', '/img/1754097855664-jaemin (1).jpg', 2929089, '2025-08-02 01:24:15', '2025-08-02 01:39:38'),
(21, 'Dicari buku binder hijau', 'Dicari', 'Buku', 'Lapangan Utama', '2025-08-02 08:41:00', '08123456789', 'sampul hijau, ada tulisan welcome di depan, hilang di area lapangan utama dekat gawang, bagi yg menemukan tolong hubungi nomor yg tertera!', '/img/1754099041699-rumah.png', 2929089, '2025-08-02 01:44:01', '2025-08-02 01:44:01'),
(30, 'Testi', 'Dicari', 'Aksesoris', 'Aula 1', '2025-08-02 19:36:00', '08123456789', '-', '/img/1754138181132-chungdam hs.jpg', 2929090, '2025-08-02 12:36:21', '2025-08-02 12:36:21'),
(31, 'halo ada buku hilang', 'Ditemukan', 'Buku', 'Aula 1', '2025-08-02 21:41:00', '08123456789', '-', '/img/1754145722330-boyf j.jpg', 2929091, '2025-08-02 14:42:02', '2025-08-02 14:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `lost_found_notifs`
--

CREATE TABLE `lost_found_notifs` (
  `id` int(10) UNSIGNED NOT NULL,
  `subscription` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `market_places`
--

CREATE TABLE `market_places` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jumlah_klik` int(11) DEFAULT NULL,
  `jumlah_terjual` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `link_tokopedia` varchar(255) DEFAULT NULL,
  `link_bukalapak` varchar(255) DEFAULT NULL,
  `link_shopee` varchar(255) DEFAULT NULL,
  `whatsapp_pic` varchar(255) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_absen`
--

CREATE TABLE `m_absen` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `absen` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `foto_masuk` varchar(255) DEFAULT NULL,
  `waktu_masuk` datetime DEFAULT NULL,
  `foto_pulang` varchar(255) DEFAULT NULL,
  `waktu_pulang` datetime DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `foto_masuk_local` varchar(255) DEFAULT NULL,
  `foto_pulang_local` varchar(255) DEFAULT NULL,
  `masker` tinyint(1) DEFAULT NULL,
  `suhu` varchar(255) DEFAULT NULL,
  `lokasi_masuk` text DEFAULT NULL,
  `lokasi_pulang` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_absen_belum_terdaftar`
--

CREATE TABLE `m_absen_belum_terdaftar` (
  `id` int(10) UNSIGNED NOT NULL,
  `foto` text DEFAULT NULL,
  `suhu` varchar(255) DEFAULT NULL,
  `masker` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `waktu_masuk` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_acara_perusahaan`
--

CREATE TABLE `m_acara_perusahaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `m_perusahaan_id` int(10) UNSIGNED DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `waktu_awal` datetime DEFAULT NULL,
  `waktu_akhir` datetime DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_alumni`
--

CREATE TABLE `m_alumni` (
  `id` int(10) UNSIGNED NOT NULL,
  `jurusan` varchar(255) DEFAULT NULL,
  `tahun_masuk` varchar(255) DEFAULT NULL,
  `pekerjaan` varchar(255) DEFAULT NULL,
  `kantor` varchar(255) DEFAULT NULL,
  `sektor_industri` varchar(255) DEFAULT NULL,
  `sekolah_lanjutan` text DEFAULT NULL,
  `pengalaman` text DEFAULT NULL,
  `sertifikasi_keahlian` text DEFAULT NULL,
  `purnakarya` tinyint(1) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `alamat_perusahaan` varchar(255) DEFAULT NULL,
  `usaha` text DEFAULT NULL,
  `verifikasi` tinyint(1) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `mulai_bekerja` date DEFAULT NULL,
  `posisi` varchar(255) DEFAULT NULL,
  `id_card` text DEFAULT NULL,
  `mulai_usaha` date DEFAULT NULL,
  `bidang_usaha` varchar(255) DEFAULT NULL,
  `posisi_usaha` varchar(255) DEFAULT NULL,
  `alamat_usaha` text DEFAULT NULL,
  `mulai_kuliah` date DEFAULT NULL,
  `fakultas` varchar(255) DEFAULT NULL,
  `prodi` varchar(255) DEFAULT NULL,
  `kartu_mahasiswa` text DEFAULT NULL,
  `program_pendidikan` varchar(255) DEFAULT NULL,
  `kontrak` text DEFAULT NULL,
  `kodepos_perusahaan` varchar(255) DEFAULT NULL,
  `kodepos_usaha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_alur_ppdb`
--

CREATE TABLE `m_alur_ppdb` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_anggota_ekskul`
--

CREATE TABLE `m_anggota_ekskul` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ekstrakurikuler_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_anggota_proyek`
--

CREATE TABLE `m_anggota_proyek` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_proyek_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_anggota_proyek_role`
--

CREATE TABLE `m_anggota_proyek_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_anggota_proyek_id` int(10) UNSIGNED DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_anggota_rombel`
--

CREATE TABLE `m_anggota_rombel` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_anggota_rombel`
--

INSERT INTO `m_anggota_rombel` (`id`, `role`, `dihapus`, `m_user_id`, `m_rombel_id`, `created_at`, `updated_at`, `tanggal_keluar`) VALUES
(1, 'Anggota', 0, 2929091, 54266, '2025-06-29 23:23:44', '2025-06-29 23:23:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_bab`
--

CREATE TABLE `m_bab` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_materi_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_bab_peraturan`
--

CREATE TABLE `m_bab_peraturan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_barang`
--

CREATE TABLE `m_barang` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `merk` varchar(255) DEFAULT NULL,
  `tahun_beli` varchar(255) DEFAULT NULL,
  `asal` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `baik` int(11) DEFAULT NULL,
  `rusak` int(11) DEFAULT NULL,
  `kepemilikan` varchar(255) DEFAULT NULL,
  `nama_pemilik` varchar(255) DEFAULT NULL,
  `m_lokasi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nota` text DEFAULT NULL,
  `verifikasi` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_bobot_nilai`
--

CREATE TABLE `m_bobot_nilai` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `tugas_pts` int(11) DEFAULT NULL,
  `uh_pts` int(11) DEFAULT NULL,
  `uts_pts` int(11) DEFAULT NULL,
  `praktik_pts` int(11) DEFAULT NULL,
  `proyek_pts` int(11) DEFAULT NULL,
  `produk_pts` int(11) DEFAULT NULL,
  `portofolio_pts` int(11) DEFAULT NULL,
  `tugas_pas` int(11) DEFAULT NULL,
  `uh_pas` int(11) DEFAULT NULL,
  `uts_pas` int(11) DEFAULT NULL,
  `uas_pas` int(11) DEFAULT NULL,
  `praktik_pas` int(11) DEFAULT NULL,
  `proyek_pas` int(11) DEFAULT NULL,
  `produk_pas` int(11) DEFAULT NULL,
  `portofolio_pas` int(11) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `m_bobot_nilai`
--

INSERT INTO `m_bobot_nilai` (`id`, `tipe`, `tugas_pts`, `uh_pts`, `uts_pts`, `praktik_pts`, `proyek_pts`, `produk_pts`, `portofolio_pts`, `tugas_pas`, `uh_pas`, `uts_pas`, `uas_pas`, `praktik_pas`, `proyek_pas`, `produk_pas`, `portofolio_pas`, `m_sekolah_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 30, 30, 40, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 12380, '2025-06-29 21:26:59', '2025-06-29 21:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `m_broadcast`
--

CREATE TABLE `m_broadcast` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `kepada` text DEFAULT NULL,
  `tanggal_dibagikan` datetime DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `draft` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lampiran` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_bukti_pelaksanaan_sanksi`
--

CREATE TABLE `m_bukti_pelaksanaan_sanksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `m_sanksi_siswa_id` int(10) UNSIGNED DEFAULT NULL,
  `konfirmasi` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_buku`
--

CREATE TABLE `m_buku` (
  `id` int(10) UNSIGNED NOT NULL,
  `createdate` text DEFAULT NULL,
  `metadatadate` text DEFAULT NULL,
  `creatortool` text DEFAULT NULL,
  `instanceid` text DEFAULT NULL,
  `originaldocumentid` text DEFAULT NULL,
  `documentid` text DEFAULT NULL,
  `renditionclass` text DEFAULT NULL,
  `history` text DEFAULT NULL,
  `derivedfrom` text DEFAULT NULL,
  `format` text DEFAULT NULL,
  `producer` text DEFAULT NULL,
  `trapped` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_buku_tamu`
--

CREATE TABLE `m_buku_tamu` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `no_hp` int(11) DEFAULT NULL,
  `instansi` varchar(255) DEFAULT NULL,
  `bidang` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `province_id` varchar(2) DEFAULT NULL,
  `regency_id` varchar(4) DEFAULT NULL,
  `kodepos` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ttd` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_camera`
--

CREATE TABLE `m_camera` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `waktu_sinkron` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_diskon_pendaftar`
--

CREATE TABLE `m_diskon_pendaftar` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_pendaftar_ppdb_id` int(10) UNSIGNED DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `dihapus` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_disposisi`
--

CREATE TABLE `m_disposisi` (
  `id` int(10) UNSIGNED NOT NULL,
  `penanganan` varchar(255) DEFAULT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `isi` varchar(255) DEFAULT NULL,
  `ttd` varchar(255) DEFAULT NULL,
  `m_surat_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_ditugaskan_pekerjaan`
--

CREATE TABLE `m_ditugaskan_pekerjaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_pekerjaan_proyek_id` int(10) UNSIGNED DEFAULT NULL,
  `m_anggota_proyek_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_dokumen_pembayaran_sekolah`
--

CREATE TABLE `m_dokumen_pembayaran_sekolah` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `m_pembayaran_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_ekstrakurikuler`
--

CREATE TABLE `m_ekstrakurikuler` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `program` text DEFAULT NULL,
  `file` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_fitur_sekolah`
--

CREATE TABLE `m_fitur_sekolah` (
  `id` int(10) UNSIGNED NOT NULL,
  `fitur` text DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_folder_arsip`
--

CREATE TABLE `m_folder_arsip` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `pin` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_gelombang_ppdb`
--

CREATE TABLE `m_gelombang_ppdb` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `dibuka` datetime DEFAULT NULL,
  `ditutup` datetime DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `tes_akademik` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `biaya_pendaftaran` int(11) DEFAULT NULL,
  `m_jalur_ppdb_id` int(10) UNSIGNED DEFAULT NULL,
  `diterima` int(10) UNSIGNED DEFAULT NULL,
  `nama_akun` varchar(255) DEFAULT NULL,
  `norek` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_guru_jurusan`
--

CREATE TABLE `m_guru_jurusan` (
  `id` int(10) UNSIGNED NOT NULL,
  `foto` text DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `m_jurusan_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_histori_aktivitas`
--

CREATE TABLE `m_histori_aktivitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `awal` varchar(255) DEFAULT NULL,
  `akhir` varchar(255) DEFAULT NULL,
  `bawah` varchar(255) DEFAULT NULL,
  `alamat_id` int(11) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_history_jobs`
--

CREATE TABLE `m_history_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_id` int(10) UNSIGNED NOT NULL,
  `m_sekolah_id` int(10) UNSIGNED NOT NULL,
  `job_id` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_industri`
--

CREATE TABLE `m_industri` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `klasifikasi` varchar(255) DEFAULT NULL,
  `jumlah_karyawan` varchar(255) DEFAULT NULL,
  `tautan` text DEFAULT NULL,
  `galeri` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `tahun_kerjasama` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_informasi_gelombang`
--

CREATE TABLE `m_informasi_gelombang` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `pengumuman` datetime DEFAULT NULL,
  `dibuka` datetime DEFAULT NULL,
  `ditutup` datetime DEFAULT NULL,
  `m_gelombang_ppdb_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_informasi_jalur_ppdb`
--

CREATE TABLE `m_informasi_jalur_ppdb` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `biaya` text DEFAULT NULL,
  `m_jalur_ppdb_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_informasi_jurusan`
--

CREATE TABLE `m_informasi_jurusan` (
  `id` int(10) UNSIGNED NOT NULL,
  `banner` text DEFAULT NULL,
  `sambutan` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `cover` text DEFAULT NULL,
  `galeri` text DEFAULT NULL,
  `m_jurusan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_informasi_pekerjaan`
--

CREATE TABLE `m_informasi_pekerjaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_pekerjaan_id` int(10) UNSIGNED DEFAULT NULL,
  `pengalaman` varchar(255) DEFAULT NULL,
  `batas_pengiriman` datetime DEFAULT NULL,
  `pendidikan` varchar(255) DEFAULT NULL,
  `detail_pendidikan` text DEFAULT NULL,
  `keahlian` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `persyaratan_khusus` text DEFAULT NULL,
  `range_gaji` varchar(255) DEFAULT NULL,
  `status_jurusan` varchar(255) DEFAULT NULL,
  `jurusan` text DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `tb` int(11) DEFAULT NULL,
  `usia_minimal` int(11) DEFAULT NULL,
  `usia_maksimal` int(11) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kodepos` varchar(255) DEFAULT NULL,
  `khusus_alumni` tinyint(1) DEFAULT NULL,
  `khusus_difabel` tinyint(1) DEFAULT NULL,
  `buta_warna` tinyint(1) DEFAULT NULL,
  `kacamata` tinyint(1) DEFAULT NULL,
  `tes` tinyint(1) DEFAULT NULL,
  `lokasi_tes` text DEFAULT NULL,
  `kelengkapan_data` tinyint(1) DEFAULT NULL,
  `data_nilai` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_informasi_perusahaan`
--

CREATE TABLE `m_informasi_perusahaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_perusahaan_id` int(10) UNSIGNED DEFAULT NULL,
  `didirikan` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `situs` varchar(255) DEFAULT NULL,
  `jumlah_pekerja` varchar(255) DEFAULT NULL,
  `tentang` text DEFAULT NULL,
  `budaya` text DEFAULT NULL,
  `benefit_karyawan` text DEFAULT NULL,
  `lingkungan_kerja` varchar(255) DEFAULT NULL,
  `busana` varchar(255) DEFAULT NULL,
  `budaya_kerja` varchar(255) DEFAULT NULL,
  `jam_kerja` varchar(255) DEFAULT NULL,
  `nama_pj` varchar(255) DEFAULT NULL,
  `telepon_pj` varchar(255) DEFAULT NULL,
  `email_pj` varchar(255) DEFAULT NULL,
  `registrasi_pj` datetime DEFAULT NULL,
  `youtube` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `github` text DEFAULT NULL,
  `linkedin` text DEFAULT NULL,
  `behace` text DEFAULT NULL,
  `dribble` text DEFAULT NULL,
  `kodepos` varchar(255) DEFAULT NULL,
  `sampul` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `keselarasan` tinyint(1) DEFAULT NULL,
  `istd` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_informasi_sekolah`
--

CREATE TABLE `m_informasi_sekolah` (
  `id` int(10) UNSIGNED NOT NULL,
  `deskripsi_singkat` text DEFAULT NULL,
  `visi` text DEFAULT NULL,
  `misi` text DEFAULT NULL,
  `background_section_mengapa` text DEFAULT NULL,
  `jumlah_siswa` int(11) DEFAULT NULL,
  `jumlah_guru` int(11) DEFAULT NULL,
  `jumlah_kelas` int(11) DEFAULT NULL,
  `thumbnail_profil` text DEFAULT NULL,
  `video_profil` text DEFAULT NULL,
  `background_section_virtual_tour` text DEFAULT NULL,
  `virtual_tour` text DEFAULT NULL,
  `banner_profil` text DEFAULT NULL,
  `deskripsi_sekolah` text DEFAULT NULL,
  `foto_tentang_sekolah` text DEFAULT NULL,
  `pesan_kepsek` text DEFAULT NULL,
  `foto_kepsek` text DEFAULT NULL,
  `sejarah` text DEFAULT NULL,
  `foto_sejarah` text DEFAULT NULL,
  `foto_logo` text DEFAULT NULL,
  `lirik_mars` text DEFAULT NULL,
  `lagu_mars` text DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `gmaps` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `banner_sarpras` text DEFAULT NULL,
  `banner_blog` text DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_jadwal_konsultasi`
--

CREATE TABLE `m_jadwal_konsultasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_pertemuan_bk_id` int(10) UNSIGNED DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_berakhir` time DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_jadwal_mengajar`
--

CREATE TABLE `m_jadwal_mengajar` (
  `id` int(10) UNSIGNED NOT NULL,
  `diubah` tinyint(1) DEFAULT NULL,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jam_mengajar_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_jadwal_mengajar`
--

INSERT INTO `m_jadwal_mengajar` (`id`, `diubah`, `m_mata_pelajaran_id`, `m_rombel_id`, `m_ta_id`, `m_jam_mengajar_id`, `m_sekolah_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 54266, 9290, 1716694, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(2, NULL, NULL, 54266, 9290, 1716695, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(3, NULL, NULL, 54266, 9290, 1716696, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(4, NULL, NULL, 54266, 9290, 1716697, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(5, NULL, NULL, 54266, 9290, 1716698, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(6, NULL, NULL, 54266, 9290, 1716699, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(7, NULL, NULL, 54266, 9290, 1716700, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(8, NULL, NULL, 54266, 9290, 1716701, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(9, NULL, NULL, 54266, 9290, 1716702, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(10, NULL, NULL, 54266, 9290, 1716703, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(11, NULL, NULL, 54266, 9290, 1716704, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(12, NULL, NULL, 54266, 9290, 1716705, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(13, NULL, NULL, 54266, 9290, 1716706, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(14, NULL, NULL, 54266, 9290, 1716707, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(15, NULL, NULL, 54266, 9290, 1716708, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(16, NULL, NULL, 54266, 9290, 1716709, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(17, NULL, NULL, 54266, 9290, 1716710, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(18, NULL, NULL, 54266, 9290, 1716711, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(19, NULL, NULL, 54266, 9290, 1716712, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(20, NULL, NULL, 54266, 9290, 1716713, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(21, NULL, NULL, 54266, 9290, 1716714, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(22, NULL, NULL, 54266, 9290, 1716715, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(23, NULL, NULL, 54266, 9290, 1716716, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(24, NULL, NULL, 54266, 9290, 1716717, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(25, NULL, NULL, 54266, 9290, 1716718, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(26, NULL, NULL, 54266, 9290, 1716719, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(27, NULL, NULL, 54266, 9290, 1716720, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(28, NULL, NULL, 54266, 9290, 1716721, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(29, NULL, NULL, 54266, 9290, 1716722, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(30, NULL, NULL, 54266, 9290, 1716723, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(31, NULL, NULL, 54266, 9290, 1716724, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(32, NULL, NULL, 54266, 9290, 1716725, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(33, NULL, NULL, 54266, 9290, 1716726, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(34, NULL, NULL, 54266, 9290, 1716727, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(35, NULL, NULL, 54266, 9290, 1716728, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(36, NULL, NULL, 54266, 9290, 1716729, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(37, NULL, NULL, 54266, 9290, 1716730, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(38, NULL, NULL, 54266, 9290, 1716731, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(39, NULL, NULL, 54266, 9290, 1716732, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(40, NULL, NULL, 54266, 9290, 1716733, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(41, NULL, NULL, 54266, 9290, 1716734, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(42, NULL, NULL, 54266, 9290, 1716735, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(43, NULL, NULL, 54266, 9290, 1716736, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(44, NULL, NULL, 54266, 9290, 1716737, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(45, NULL, NULL, 54266, 9290, 1716738, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(46, NULL, NULL, 54266, 9290, 1716739, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(47, NULL, NULL, 54266, 9290, 1716740, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(48, NULL, NULL, 54266, 9290, 1716741, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(49, NULL, NULL, 54266, 9290, 1716742, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(50, NULL, NULL, 54266, 9290, 1716743, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(51, NULL, NULL, 54266, 9290, 1716744, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(52, NULL, NULL, 54266, 9290, 1716745, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(53, NULL, NULL, 54266, 9290, 1716746, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(54, NULL, NULL, 54266, 9290, 1716747, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(55, NULL, NULL, 54266, 9290, 1716748, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(56, NULL, NULL, 54266, 9290, 1716749, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(57, NULL, NULL, 54266, 9290, 1716750, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(58, NULL, NULL, 54266, 9290, 1716751, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(59, NULL, NULL, 54266, 9290, 1716752, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(60, NULL, NULL, 54266, 9290, 1716753, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(61, NULL, NULL, 54266, 9290, 1716754, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(62, NULL, NULL, 54266, 9290, 1716755, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(63, NULL, NULL, 54266, 9290, 1716756, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(64, NULL, NULL, 54266, 9290, 1716757, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(65, NULL, NULL, 54266, 9290, 1716758, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(66, NULL, NULL, 54266, 9290, 1716759, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(67, NULL, NULL, 54266, 9290, 1716760, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(68, NULL, NULL, 54266, 9290, 1716761, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(69, NULL, NULL, 54266, 9290, 1716762, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(70, NULL, NULL, 54266, 9290, 1716763, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(71, NULL, NULL, 54266, 9290, 1716764, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(72, NULL, NULL, 54266, 9290, 1716765, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(73, NULL, NULL, 54266, 9290, 1716766, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(74, NULL, NULL, 54266, 9290, 1716767, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(75, NULL, NULL, 54266, 9290, 1716768, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(76, NULL, NULL, 54266, 9290, 1716769, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(77, NULL, NULL, 54266, 9290, 1716770, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(78, NULL, NULL, 54266, 9290, 1716771, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(79, NULL, NULL, 54266, 9290, 1716772, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(80, NULL, NULL, 54266, 9290, 1716773, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(81, NULL, NULL, 54266, 9290, 1716774, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(82, NULL, NULL, 54266, 9290, 1716775, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(83, NULL, NULL, 54266, 9290, 1716776, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(84, NULL, NULL, 54266, 9290, 1716777, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(85, NULL, NULL, 54266, 9290, 1716778, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(86, NULL, NULL, 54266, 9290, 1716779, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(87, NULL, NULL, 54266, 9290, 1716780, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(88, NULL, NULL, 54266, 9290, 1716781, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(89, NULL, NULL, 54266, 9290, 1716782, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(90, NULL, NULL, 54266, 9290, 1716783, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(91, NULL, NULL, 54266, 9290, 1716784, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(92, NULL, NULL, 54266, 9290, 1716785, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(93, NULL, NULL, 54266, 9290, 1716786, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(94, NULL, NULL, 54266, 9290, 1716787, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(95, NULL, NULL, 54266, 9290, 1716788, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(96, NULL, NULL, 54266, 9290, 1716789, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(97, NULL, NULL, 54266, 9290, 1716790, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(98, NULL, NULL, 54266, 9290, 1716791, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(99, NULL, NULL, 54266, 9290, 1716792, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(100, NULL, NULL, 54266, 9290, 1716793, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(101, NULL, NULL, 54266, 9290, 1716794, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(102, NULL, NULL, 54266, 9290, 1716795, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(103, NULL, NULL, 54266, 9290, 1716796, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(104, NULL, NULL, 54266, 9290, 1716797, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(105, NULL, NULL, 54266, 9290, 1716798, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(106, NULL, NULL, 54266, 9290, 1716799, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(107, NULL, NULL, 54266, 9290, 1716800, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(108, NULL, NULL, 54266, 9290, 1716801, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(109, NULL, NULL, 54266, 9290, 1716802, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(110, NULL, NULL, 54266, 9290, 1716803, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(111, NULL, NULL, 54266, 9290, 1716804, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(112, NULL, NULL, 54266, 9290, 1716805, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(113, NULL, NULL, 54266, 9290, 1716806, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(114, NULL, NULL, 54266, 9290, 1716807, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(115, NULL, NULL, 54266, 9290, 1716808, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(116, NULL, NULL, 54266, 9290, 1716809, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(117, NULL, NULL, 54266, 9290, 1716810, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(118, NULL, NULL, 54266, 9290, 1716811, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(119, NULL, NULL, 54266, 9290, 1716812, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(120, NULL, NULL, 54266, 9290, 1716813, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(121, NULL, NULL, 54266, 9290, 1716814, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(122, NULL, NULL, 54266, 9290, 1716815, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(123, NULL, NULL, 54266, 9290, 1716816, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(124, NULL, NULL, 54266, 9290, 1716817, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(125, NULL, NULL, 54266, 9290, 1716818, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(126, NULL, NULL, 54266, 9290, 1716819, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(127, NULL, NULL, 54266, 9290, 1716820, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(128, NULL, NULL, 54266, 9290, 1716821, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(129, NULL, NULL, 54266, 9290, 1716822, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(130, NULL, NULL, 54266, 9290, 1716823, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(131, NULL, NULL, 54266, 9290, 1716824, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(132, NULL, NULL, 54266, 9290, 1716825, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(133, NULL, NULL, 54266, 9290, 1716826, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(134, NULL, NULL, 54266, 9290, 1716827, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(135, NULL, NULL, 54266, 9290, 1716828, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(136, NULL, NULL, 54266, 9290, 1716829, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(137, NULL, NULL, 54266, 9290, 1716830, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(138, NULL, NULL, 54266, 9290, 1716831, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(139, NULL, NULL, 54266, 9290, 1716832, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(140, NULL, NULL, 54266, 9290, 1716833, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(141, NULL, NULL, 54266, 9290, 1716834, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(142, NULL, NULL, 54266, 9290, 1716835, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(143, NULL, NULL, 54266, 9290, 1716836, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(144, NULL, NULL, 54266, 9290, 1716837, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(145, NULL, NULL, 54266, 9290, 1716838, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(146, NULL, NULL, 54266, 9290, 1716839, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(147, NULL, NULL, 54266, 9290, 1716840, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(148, NULL, NULL, 54266, 9290, 1716841, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(149, NULL, NULL, 54266, 9290, 1716842, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(150, NULL, NULL, 54266, 9290, 1716843, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(151, NULL, NULL, 54266, 9290, 1716844, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(152, NULL, NULL, 54266, 9290, 1716845, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(153, NULL, NULL, 54266, 9290, 1716846, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15'),
(154, NULL, NULL, 54266, 9290, 1716847, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `m_jadwal_ppdb`
--

CREATE TABLE `m_jadwal_ppdb` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(20) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `lokasi` text DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `jumlah_pg` int(11) DEFAULT NULL,
  `jumlah_esai` int(11) DEFAULT NULL,
  `jumlah_soal_akm` int(11) DEFAULT NULL,
  `kkm` int(11) DEFAULT NULL,
  `waktu_dibuka` datetime DEFAULT NULL,
  `waktu_ditutup` datetime DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `gmeet` varchar(255) DEFAULT NULL,
  `diacak` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_informasi_gelombang_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `terlihat` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_jadwal_ujian`
--

CREATE TABLE `m_jadwal_ujian` (
  `id` int(10) UNSIGNED NOT NULL,
  `jumlah_pg` int(11) DEFAULT NULL,
  `jumlah_esai` int(11) DEFAULT NULL,
  `jumlah_soal_akm` int(11) DEFAULT NULL,
  `kkm` int(11) DEFAULT NULL,
  `waktu_dibuka` datetime DEFAULT NULL,
  `waktu_ditutup` datetime DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `gmeet` varchar(255) DEFAULT NULL,
  `diacak` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `jumlah_menjodohkan` int(11) DEFAULT NULL,
  `jumlah_uraian` int(11) DEFAULT NULL,
  `jumlah_pg_kompleks` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `tampil_nilai` tinyint(1) DEFAULT NULL,
  `tampil_jawaban` tinyint(1) DEFAULT NULL,
  `jumlah_isian` int(11) DEFAULT NULL,
  `per_siswa` tinyint(1) DEFAULT 0,
  `keluar_tab` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_jalur_ppdb`
--

CREATE TABLE `m_jalur_ppdb` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `dibuka` datetime DEFAULT NULL,
  `ditutup` datetime DEFAULT NULL,
  `biaya` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_jam_mengajar`
--

CREATE TABLE `m_jam_mengajar` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_hari` int(11) DEFAULT NULL,
  `hari` varchar(255) DEFAULT NULL,
  `jam_ke` int(11) DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `istirahat` tinyint(1) DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_jam_mengajar`
--

INSERT INTO `m_jam_mengajar` (`id`, `kode_hari`, `hari`, `jam_ke`, `jam_mulai`, `jam_selesai`, `istirahat`, `m_ta_id`, `m_sekolah_id`, `created_at`, `updated_at`) VALUES
(1716694, 0, 'Minggu', 1, '06:45:00', '07:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716695, 0, 'Minggu', 2, '07:30:00', '08:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716696, 0, 'Minggu', 3, '08:15:00', '09:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716697, 0, 'Minggu', 4, '09:00:00', '09:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716698, 0, 'Minggu', 0, '09:45:00', '10:00:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716699, 0, 'Minggu', 5, '10:00:00', '10:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716700, 0, 'Minggu', 6, '10:45:00', '11:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716701, 0, 'Minggu', 0, '12:15:00', '12:30:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716702, 0, 'Minggu', 7, '12:30:00', '13:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716703, 0, 'Minggu', 8, '13:15:00', '14:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716704, 0, 'Minggu', 9, '14:00:00', '14:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716705, 0, 'Minggu', 10, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716706, 0, 'Minggu', 11, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716707, 0, 'Minggu', 12, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716708, 0, 'Minggu', 13, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716709, 0, 'Minggu', 14, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716710, 0, 'Minggu', 15, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716711, 0, 'Minggu', 16, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716712, 0, 'Minggu', 17, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716713, 0, 'Minggu', 18, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716714, 0, 'Minggu', 19, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716715, 0, 'Minggu', 20, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716716, 1, 'Senin', 1, '06:45:00', '07:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716717, 1, 'Senin', 2, '07:30:00', '08:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716718, 1, 'Senin', 3, '08:15:00', '09:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716719, 1, 'Senin', 4, '09:00:00', '09:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716720, 1, 'Senin', 0, '09:45:00', '10:00:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716721, 1, 'Senin', 5, '10:00:00', '10:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716722, 1, 'Senin', 6, '10:45:00', '11:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716723, 1, 'Senin', 0, '12:15:00', '12:30:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716724, 1, 'Senin', 7, '12:30:00', '13:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716725, 1, 'Senin', 8, '13:15:00', '14:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716726, 1, 'Senin', 9, '14:00:00', '14:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716727, 1, 'Senin', 10, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716728, 1, 'Senin', 11, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716729, 1, 'Senin', 12, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716730, 1, 'Senin', 13, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716731, 1, 'Senin', 14, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716732, 1, 'Senin', 15, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716733, 1, 'Senin', 16, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716734, 1, 'Senin', 17, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716735, 1, 'Senin', 18, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716736, 1, 'Senin', 19, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716737, 1, 'Senin', 20, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716738, 2, 'Selasa', 1, '06:45:00', '07:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716739, 2, 'Selasa', 2, '07:30:00', '08:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716740, 2, 'Selasa', 3, '08:15:00', '09:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716741, 2, 'Selasa', 4, '09:00:00', '09:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716742, 2, 'Selasa', 0, '09:45:00', '10:00:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716743, 2, 'Selasa', 5, '10:00:00', '10:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716744, 2, 'Selasa', 6, '10:45:00', '11:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716745, 2, 'Selasa', 0, '12:15:00', '12:30:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716746, 2, 'Selasa', 7, '12:30:00', '13:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716747, 2, 'Selasa', 8, '13:15:00', '14:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716748, 2, 'Selasa', 9, '14:00:00', '14:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716749, 2, 'Selasa', 10, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716750, 2, 'Selasa', 11, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716751, 2, 'Selasa', 12, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716752, 2, 'Selasa', 13, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716753, 2, 'Selasa', 14, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716754, 2, 'Selasa', 15, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716755, 2, 'Selasa', 16, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716756, 2, 'Selasa', 17, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716757, 2, 'Selasa', 18, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716758, 2, 'Selasa', 19, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716759, 2, 'Selasa', 20, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716760, 3, 'Rabu', 1, '06:45:00', '07:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716761, 3, 'Rabu', 2, '07:30:00', '08:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716762, 3, 'Rabu', 3, '08:15:00', '09:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716763, 3, 'Rabu', 4, '09:00:00', '09:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716764, 3, 'Rabu', 0, '09:45:00', '10:00:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716765, 3, 'Rabu', 5, '10:00:00', '10:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716766, 3, 'Rabu', 6, '10:45:00', '11:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716767, 3, 'Rabu', 0, '12:15:00', '12:30:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716768, 3, 'Rabu', 7, '12:30:00', '13:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716769, 3, 'Rabu', 8, '13:15:00', '14:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716770, 3, 'Rabu', 9, '14:00:00', '14:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716771, 3, 'Rabu', 10, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716772, 3, 'Rabu', 11, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716773, 3, 'Rabu', 12, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716774, 3, 'Rabu', 13, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716775, 3, 'Rabu', 14, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716776, 3, 'Rabu', 15, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716777, 3, 'Rabu', 16, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716778, 3, 'Rabu', 17, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716779, 3, 'Rabu', 18, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716780, 3, 'Rabu', 19, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716781, 3, 'Rabu', 20, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716782, 4, 'Kamis', 1, '06:45:00', '07:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716783, 4, 'Kamis', 2, '07:30:00', '08:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716784, 4, 'Kamis', 3, '08:15:00', '09:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716785, 4, 'Kamis', 4, '09:00:00', '09:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716786, 4, 'Kamis', 0, '09:45:00', '10:00:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716787, 4, 'Kamis', 5, '10:00:00', '10:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716788, 4, 'Kamis', 6, '10:45:00', '11:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716789, 4, 'Kamis', 0, '12:15:00', '12:30:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716790, 4, 'Kamis', 7, '12:30:00', '13:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716791, 4, 'Kamis', 8, '13:15:00', '14:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716792, 4, 'Kamis', 9, '14:00:00', '14:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716793, 4, 'Kamis', 10, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716794, 4, 'Kamis', 11, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716795, 4, 'Kamis', 12, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716796, 4, 'Kamis', 13, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716797, 4, 'Kamis', 14, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716798, 4, 'Kamis', 15, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716799, 4, 'Kamis', 16, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716800, 4, 'Kamis', 17, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716801, 4, 'Kamis', 18, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716802, 4, 'Kamis', 19, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716803, 4, 'Kamis', 20, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716804, 5, 'Jumat', 1, '06:45:00', '07:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716805, 5, 'Jumat', 2, '07:30:00', '08:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716806, 5, 'Jumat', 3, '08:15:00', '09:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716807, 5, 'Jumat', 4, '09:00:00', '09:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716808, 5, 'Jumat', 0, '09:45:00', '10:00:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716809, 5, 'Jumat', 5, '10:00:00', '10:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716810, 5, 'Jumat', 6, '10:45:00', '11:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716811, 5, 'Jumat', 0, '12:15:00', '12:30:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716812, 5, 'Jumat', 7, '12:30:00', '13:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716813, 5, 'Jumat', 8, '13:15:00', '14:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716814, 5, 'Jumat', 9, '14:00:00', '14:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716815, 5, 'Jumat', 10, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716816, 5, 'Jumat', 11, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716817, 5, 'Jumat', 12, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716818, 5, 'Jumat', 13, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716819, 5, 'Jumat', 14, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716820, 5, 'Jumat', 15, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716821, 5, 'Jumat', 16, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716822, 5, 'Jumat', 17, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716823, 5, 'Jumat', 18, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716824, 5, 'Jumat', 19, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716825, 5, 'Jumat', 20, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716826, 6, 'Sabtu', 1, '06:45:00', '07:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716827, 6, 'Sabtu', 2, '07:30:00', '08:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716828, 6, 'Sabtu', 3, '08:15:00', '09:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716829, 6, 'Sabtu', 4, '09:00:00', '09:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716830, 6, 'Sabtu', 0, '09:45:00', '10:00:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716831, 6, 'Sabtu', 5, '10:00:00', '10:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716832, 6, 'Sabtu', 6, '10:45:00', '11:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716833, 6, 'Sabtu', 0, '12:15:00', '12:30:00', 1, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716834, 6, 'Sabtu', 7, '12:30:00', '13:15:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716835, 6, 'Sabtu', 8, '13:15:00', '14:00:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716836, 6, 'Sabtu', 9, '14:00:00', '14:45:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716837, 6, 'Sabtu', 10, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716838, 6, 'Sabtu', 11, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716839, 6, 'Sabtu', 12, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:02'),
(1716840, 6, 'Sabtu', 13, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:03', '2025-06-29 23:16:03'),
(1716841, 6, 'Sabtu', 14, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:03', '2025-06-29 23:16:03'),
(1716842, 6, 'Sabtu', 15, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:03', '2025-06-29 23:16:03'),
(1716843, 6, 'Sabtu', 16, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:03', '2025-06-29 23:16:03'),
(1716844, 6, 'Sabtu', 17, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:03', '2025-06-29 23:16:03'),
(1716845, 6, 'Sabtu', 18, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:03', '2025-06-29 23:16:03'),
(1716846, 6, 'Sabtu', 19, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:03', '2025-06-29 23:16:03'),
(1716847, 6, 'Sabtu', 20, '14:45:00', '15:30:00', 0, 9290, 12380, '2025-06-29 23:16:03', '2025-06-29 23:16:03');

-- --------------------------------------------------------

--
-- Table structure for table `m_jurusan`
--

CREATE TABLE `m_jurusan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `spp` int(11) DEFAULT NULL,
  `sumbangan_sarana_pendidikan` int(11) DEFAULT NULL,
  `kegiatan_osis` int(11) DEFAULT NULL,
  `mpls_jas_almamater` int(11) DEFAULT NULL,
  `seragam_sekolah` int(11) DEFAULT NULL,
  `toolkit_praktek` int(11) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `alumni` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_jurusan`
--

INSERT INTO `m_jurusan` (`id`, `nama`, `kode`, `spp`, `sumbangan_sarana_pendidikan`, `kegiatan_osis`, `mpls_jas_almamater`, `seragam_sekolah`, `toolkit_praktek`, `m_sekolah_id`, `alumni`, `dihapus`, `created_at`, `updated_at`) VALUES
(11487, 'SIJA', 'sija', 0, 0, 0, 0, 0, 0, 12380, NULL, 0, '2025-06-29 23:21:39', '2025-06-29 23:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `m_kalender_pendidikan`
--

CREATE TABLE `m_kalender_pendidikan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `m_label_kalender_id` int(10) UNSIGNED DEFAULT NULL,
  `tanggal_awal` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori`
--

CREATE TABLE `m_kategori` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori_mapel`
--

CREATE TABLE `m_kategori_mapel` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(50) DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori_pekerjaan`
--

CREATE TABLE `m_kategori_pekerjaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_proyek_id` int(10) UNSIGNED DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori_pelanggaran`
--

CREATE TABLE `m_kategori_pelanggaran` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kegiatan`
--

CREATE TABLE `m_kegiatan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kegiatan_galeri`
--

CREATE TABLE `m_kegiatan_galeri` (
  `id` int(10) UNSIGNED NOT NULL,
  `foto` text DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_kegiatan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kegiatan_kalender`
--

CREATE TABLE `m_kegiatan_kalender` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `m_label_kalender_id` int(10) UNSIGNED DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_akhir` time DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `isi_media` text DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `buku_tamu` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keterangan_pkl`
--

CREATE TABLE `m_keterangan_pkl` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `namamitra` varchar(255) DEFAULT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_selesai` datetime DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lamanya` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nilai` varchar(255) DEFAULT NULL,
  `id_card` text DEFAULT NULL,
  `kontrak` text DEFAULT NULL,
  `sertifikat` text DEFAULT NULL,
  `m_perusahaan_id` int(10) UNSIGNED DEFAULT NULL,
  `lokasi_perusahaan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keterangan_rapor`
--

CREATE TABLE `m_keterangan_rapor` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `kelulusan` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `sakit` int(10) UNSIGNED DEFAULT 0,
  `izin` int(10) UNSIGNED DEFAULT 0,
  `alpa` int(10) UNSIGNED DEFAULT 0,
  `telat` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_aktivitas_transaksi`
--

CREATE TABLE `m_keu_aktivitas_transaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_kategori_tipe_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_kategori_arus_kas_id` int(10) UNSIGNED DEFAULT NULL,
  `saldo` varchar(255) DEFAULT NULL,
  `urutan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `laba` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_akun`
--

CREATE TABLE `m_keu_akun` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rek_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `debit` int(11) DEFAULT NULL,
  `kredit` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `saldo_normal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `m_keu_akun`
--

INSERT INTO `m_keu_akun` (`id`, `m_sekolah_id`, `m_rek_sekolah_id`, `nama`, `kode`, `debit`, `kredit`, `dihapus`, `created_at`, `updated_at`, `saldo_normal`) VALUES
(55064, 12380, NULL, 'HARTA', '10000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55065, 12380, NULL, 'AKTIVA LANCAR', '11000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55066, 12380, NULL, 'KAS & BANK', '11100', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55067, 12380, NULL, 'KAS', '11110', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55068, 12380, NULL, 'DANA BOS', '11120', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55069, 12380, NULL, 'DANA PMU', '11130', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55070, 12380, NULL, 'DANA KOMITE', '11140', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55071, 12380, NULL, 'SPP', '11141', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55072, 12380, NULL, 'UANG SERAGAM', '11141', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55073, 12380, NULL, 'UANG UJIAN', '11141', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55074, 12380, NULL, 'PIUTANG', '11200', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55075, 12380, NULL, 'PIUTANG USAHA', '11210', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55076, 12380, NULL, 'PIUTANG KARYAWAN', '11220', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55077, 12380, NULL, 'PIUTANG SISWA', '11230', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55078, 12380, NULL, 'PERLENGKAPAN SEKOLAH', '11300', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55079, 12380, NULL, 'PEMBAYARAN DIMUKA', '11400', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55080, 12380, NULL, 'PENDAPATAN DITERIMA DIMUKA', '11500', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55081, 12380, NULL, 'AKTIVA TETAP', '12000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55082, 12380, NULL, 'TANAH', '12100', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55083, 12380, NULL, 'BANGUNAN', '12200', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55084, 12380, NULL, 'MESIN DAN PERALATAN', '12300', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55085, 12380, NULL, 'SARANA DAN PERLENGKAP', '12400', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55086, 12380, NULL, 'PENYUSUTAN', '12500', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55087, 12380, NULL, 'AKUMULASI PENYUSUTAN BANGUNAN', '12510', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55088, 12380, NULL, 'AKUMULASI PENYUSUTAN MESIN DAN PERALATAN', '12520', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55089, 12380, NULL, 'UTANG', '20000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55090, 12380, NULL, 'UTANG LANCAR', '21000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55091, 12380, NULL, 'UTANG USAHA', '21100', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55092, 12380, NULL, 'UTANG PAJAK', '21200', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55093, 12380, NULL, 'UTANG BANK JATUH TEMPO', '21300', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55094, 12380, NULL, 'UTANG JANGKA PENDEK LAINNYA', '21400', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55095, 12380, NULL, 'UTANG JANGKA PANJANG', '22000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55096, 12380, NULL, 'UTANG BANK', '22100', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55097, 12380, NULL, 'MODAL SAHAM & LABA DITAHAN', '30000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55098, 12380, NULL, 'MODAL', '31000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55099, 12380, NULL, 'LABA DITAHAN', '32000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55100, 12380, NULL, 'PENDAPATAN', '40000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55101, 12380, NULL, 'PENDAPATAN SEKOLAH', '41000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55102, 12380, NULL, 'PENDAPATAN LAINNYA', '42000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55103, 12380, NULL, 'PENDAPATAN BUNGA BANK', '42100', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55104, 12380, NULL, 'PENDAPATAN KOPERASI', '42200', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Kredit'),
(55105, 12380, NULL, 'BEBAN', '50000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55106, 12380, NULL, 'BEA BOS', '51000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55107, 12380, NULL, 'HONOR GURU', '51100', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55108, 12380, NULL, 'BEA PMU', '51100', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55109, 12380, NULL, 'HONOR GURU', '50210', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55110, 12380, NULL, 'PENGADAAN MESIN', '50220', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55111, 12380, NULL, 'BAHAN PRAKTEK', '50230', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55112, 12380, NULL, 'BEA KOMITE', '51300', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55113, 12380, NULL, 'PEMBELIAN SERAGAM', '50310', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55114, 12380, NULL, 'BEBAN GAJI', '51400', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55115, 12380, NULL, 'BEBAN GAJI KARYAWAN', '51410', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55116, 12380, NULL, 'BEBAN GAJI WALI KELAS', '51420', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55117, 12380, NULL, 'BEBAN LISTRIK, AIR, TELEPON', '51500', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55118, 12380, NULL, 'BEBAN INTERNER', '51600', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55119, 12380, NULL, 'BEBAN PERLENGKAPAN', '51700', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55120, 12380, NULL, 'BEBAN SEWA LAHAN PARKIR', '51800', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55121, 12380, NULL, 'BEBAN PERALATAN', '51900', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55122, 12380, NULL, 'BEBAN ASURANSI', '52000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55123, 12380, NULL, 'BEBAN PENYUSUTAN', '521000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55124, 12380, NULL, 'BEBAN PENYUSUTAN PERALATAN DAN MESIN', '52110', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55125, 12380, NULL, 'BEBAN PENYUSUTAN PERALATAN BENGKEL', '52120', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55126, 12380, NULL, 'BEBAN PENYUSUTAN KENDARAAN', '52130', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55127, 12380, NULL, 'BEBAN PENYUSUTAN GEDUNG', '52140', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55128, 12380, NULL, 'BEBAN ADMINISTRASI', '52200', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55129, 12380, NULL, 'BEBAN INVENTARIS', '52300', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55130, 12380, NULL, 'BEBAN PERBAIKAN', '52400', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55131, 12380, NULL, 'BEBAN LAINNYA', '52500', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55132, 12380, NULL, 'BEBAN DISCOUNT FEE', '52600', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55133, 12380, NULL, 'HONOR TIM UJIAN', '52700', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55134, 12380, NULL, 'PAJAK', '80000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55135, 12380, NULL, 'DIVIDEN', '90000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55136, 12380, NULL, 'DIVIDEN', '91000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55137, 12380, NULL, 'UTANG DIVIDEN', '92000', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55138, 12380, NULL, 'KAS YAYASAN', '9991', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55139, 12380, NULL, 'PEMERINTAH PUSAT', '9992', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55140, 12380, NULL, 'PEMDA KARAWANG', '9993', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55141, 12380, NULL, 'YAYASAN JAYABEKA', '9994', NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55142, 12380, NULL, 'AKUMULATIF LABA (RUGI)', NULL, NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55143, 12380, NULL, 'AKKUMULASI PENYUSUTAN', NULL, NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55144, 12380, NULL, 'AKKUMULASI DIVIDEN', NULL, NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit'),
(55145, 12380, NULL, 'DISCOUNT', NULL, NULL, NULL, 0, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 'Debit');

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_jurnal`
--

CREATE TABLE `m_keu_jurnal` (
  `id` int(10) UNSIGNED NOT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_transaksi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_riwayat_pembayaran_siswa_id` int(10) UNSIGNED DEFAULT NULL,
  `saldo` bigint(20) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_rencana_transaksi_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_kategori_arus_kas`
--

CREATE TABLE `m_keu_kategori_arus_kas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_kategori_laba_rugi`
--

CREATE TABLE `m_keu_kategori_laba_rugi` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_kategori_neraca`
--

CREATE TABLE `m_keu_kategori_neraca` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_kategori_tipe_akun`
--

CREATE TABLE `m_keu_kategori_tipe_akun` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pengaturan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_penyusutan_transaksi`
--

CREATE TABLE `m_keu_penyusutan_transaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_keu_transaksi_id` int(10) UNSIGNED DEFAULT NULL,
  `nilai_residu` int(11) DEFAULT NULL,
  `persentase` int(11) DEFAULT NULL,
  `masa_pakai` int(11) DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL,
  `nama_transaksi` varchar(255) DEFAULT NULL,
  `m_keu_akun_debet_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_kredit_id` int(10) UNSIGNED DEFAULT NULL,
  `terakhir_updates` datetime DEFAULT NULL,
  `update_selanjutnya` datetime DEFAULT NULL,
  `dihapus` int(11) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `saldo` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_rumus_arus_kas`
--

CREATE TABLE `m_keu_rumus_arus_kas` (
  `id` int(10) UNSIGNED NOT NULL,
  `rumus` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_rumus_penyusutan`
--

CREATE TABLE `m_keu_rumus_penyusutan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `rumus` text DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_akumulasi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_penyusustan_id` int(10) UNSIGNED DEFAULT NULL,
  `terakhir_updates` date DEFAULT NULL,
  `update_selanjutnya` date DEFAULT NULL,
  `dihapus` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lama` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_rumus_saldo_kas_akhir`
--

CREATE TABLE `m_keu_rumus_saldo_kas_akhir` (
  `id` int(10) UNSIGNED NOT NULL,
  `rumus` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_rumus_saldo_kas_awal`
--

CREATE TABLE `m_keu_rumus_saldo_kas_awal` (
  `id` int(10) UNSIGNED NOT NULL,
  `rumus` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_template_akun`
--

CREATE TABLE `m_keu_template_akun` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `template` mediumtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `m_keu_template_akun`
--

INSERT INTO `m_keu_template_akun` (`id`, `m_sekolah_id`, `template`, `created_at`, `updated_at`) VALUES
(1, 12380, '[{\"id\":55064,\"text\":\"HARTA\",\"children\":[{\"id\":55065,\"text\":\"AKTIVA LANCAR\",\"children\":[{\"id\":55066,\"text\":\"KAS & BANK\",\"children\":[{\"id\":55067,\"text\":\"KAS\"},{\"id\":55068,\"text\":\"DANA BOS\"},{\"id\":55069,\"text\":\"DANA PMU\"},{\"id\":55070,\"text\":\"DANA KOMITE\",\"children\":[{\"id\":55071,\"text\":\"SPP\"},{\"id\":55072,\"text\":\"UANG SERAGAM\"},{\"id\":55073,\"text\":\"UANG UJIAN\"}]}]},{\"id\":55074,\"text\":\"PIUTANG\",\"children\":[{\"id\":55075,\"text\":\"PIUTANG USAHA\"},{\"id\":55076,\"text\":\"PIUTANG KARYAWAN\"},{\"id\":55077,\"text\":\"PIUTANG SISWA\"}]},{\"id\":55078,\"text\":\"PERLENGKAPAN SEKOLAH\"},{\"id\":55079,\"text\":\"PEMBAYARAN DIMUKA\"},{\"id\":55080,\"text\":\"PENDAPATAN DITERIMA DIMUKA\"}]},{\"id\":55081,\"text\":\"AKTIVA TETAP\",\"children\":[{\"id\":55082,\"text\":\"TANAH\"},{\"id\":55083,\"text\":\"BANGUNAN\"},{\"id\":55084,\"text\":\"MESIN DAN PERALATAN\"},{\"id\":55085,\"text\":\"SARANA DAN PERLENGKAP\"},{\"id\":55086,\"text\":\"PENYUSUTAN\",\"children\":[{\"id\":55087,\"text\":\"AKUMULASI PENYUSUTAN BANGUNAN\"},{\"id\":55088,\"text\":\"AKUMULASI PENYUSUTAN MESIN DAN PERALATAN\"}]}]}]},{\"id\":55089,\"text\":\"UTANG\",\"children\":[{\"id\":55090,\"text\":\"UTANG LANCAR\",\"children\":[{\"id\":55091,\"text\":\"UTANG USAHA\"},{\"id\":55092,\"text\":\"UTANG PAJAK\"},{\"id\":55093,\"text\":\"UTANG BANK JATUH TEMPO\"},{\"id\":55094,\"text\":\"UTANG JANGKA PENDEK LAINNYA\"}]},{\"id\":55095,\"text\":\"UTANG JANGKA PANJANG\",\"children\":[{\"id\":55096,\"text\":\"UTANG BANK\"}]}]},{\"id\":55097,\"text\":\"MODAL SAHAM & LABA DITAHAN\",\"children\":[{\"id\":55098,\"text\":\"MODAL\"},{\"id\":55099,\"text\":\"LABA DITAHAN\"}]},{\"id\":55100,\"text\":\"PENDAPATAN\",\"children\":[{\"id\":55101,\"text\":\"PENDAPATAN SEKOLAH\"},{\"id\":55102,\"text\":\"PENDAPATAN LAINNYA\",\"children\":[{\"id\":55103,\"text\":\"PENDAPATAN BUNGA BANK\"},{\"id\":55104,\"text\":\"PENDAPATAN KOPERASI\"}]}]},{\"id\":55105,\"text\":\"BEBAN\",\"children\":[{\"id\":55106,\"text\":\"BEA BOS\",\"children\":[{\"id\":55107,\"text\":\"HONOR GURU\"}]},{\"id\":55108,\"text\":\"BEA PMU\",\"children\":[{\"id\":55109,\"text\":\"HONOR GURU\"},{\"id\":55110,\"text\":\"PENGADAAN MESIN\"},{\"id\":55111,\"text\":\"BAHAN PRAKTEK\"}]},{\"id\":55112,\"text\":\"BEA KOMITE\",\"children\":[{\"id\":55113,\"text\":\"PEMBELIAN SERAGAM\"}]},{\"id\":55114,\"text\":\"BEBAN GAJI\",\"children\":[{\"id\":55115,\"text\":\"BEBAN GAJI KARYAWAN\"},{\"id\":55116,\"text\":\"BEBAN GAJI WALI KELAS\"}]},{\"id\":55117,\"text\":\"BEBAN LISTRIK, AIR, TELEPON\"},{\"id\":55118,\"text\":\"BEBAN INTERNER\"},{\"id\":55119,\"text\":\"BEBAN PERLENGKAPAN\"},{\"id\":55120,\"text\":\"BEBAN SEWA LAHAN PARKIR\"},{\"id\":55121,\"text\":\"BEBAN PERALATAN\"},{\"id\":55122,\"text\":\"BEBAN ASURANSI\"},{\"id\":55123,\"text\":\"BEBAN PENYUSUTAN\",\"children\":[{\"id\":55124,\"text\":\"BEBAN PENYUSUTAN PERALATAN DAN MESIN\"},{\"id\":55125,\"text\":\"BEBAN PENYUSUTAN PERALATAN BENGKEL\"},{\"id\":55126,\"text\":\"BEBAN PENYUSUTAN KENDARAAN\"},{\"id\":55127,\"text\":\"BEBAN PENYUSUTAN GEDUNG\"}]},{\"id\":55128,\"text\":\"BEBAN ADMINISTRASI\"},{\"id\":55129,\"text\":\"BEBAN INVENTARIS\"},{\"id\":55130,\"text\":\"BEBAN PERBAIKAN\"},{\"id\":55131,\"text\":\"BEBAN LAINNYA\"},{\"id\":55132,\"text\":\"BEBAN DISCOUNT FEE\"},{\"id\":55133,\"text\":\"HONOR TIM UJIAN\"}]},{\"id\":55134,\"text\":\"PAJAK\"},{\"id\":55135,\"text\":\"DIVIDEN\",\"children\":[{\"id\":55136,\"text\":\"DIVIDEN\"},{\"id\":55137,\"text\":\"UTANG DIVIDEN\"}]},{\"id\":55138,\"text\":\"KAS YAYASAN\"},{\"id\":55139,\"text\":\"PEMERINTAH PUSAT\"},{\"id\":55140,\"text\":\"PEMDA KARAWANG\"},{\"id\":55141,\"text\":\"YAYASAN JAYABEKA\"},{\"id\":55142,\"text\":\"AKUMULATIF LABA (RUGI)\"},{\"id\":55143,\"text\":\"AKKUMULASI PENYUSUTAN\"},{\"id\":55144,\"text\":\"AKKUMULASI DIVIDEN\"},{\"id\":55145,\"text\":\"DISCOUNT\"}]', '2025-06-29 23:19:41', '2025-06-29 23:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_template_analisis`
--

CREATE TABLE `m_keu_template_analisis` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_keu_transaksi`
--

CREATE TABLE `m_keu_transaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `nomor` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_rencana_transaksi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_barang_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `m_keu_penyusutan_transaksi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_pembayaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_riwayat_pembayaran_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kontak`
--

CREATE TABLE `m_kontak` (
  `id` int(10) UNSIGNED NOT NULL,
  `tu` varchar(255) DEFAULT NULL,
  `keuangan` varchar(255) DEFAULT NULL,
  `kurikulum` varchar(255) DEFAULT NULL,
  `kesiswaan` varchar(255) DEFAULT NULL,
  `sarpras` varchar(255) DEFAULT NULL,
  `humas` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kotak_masuk`
--

CREATE TABLE `m_kotak_masuk` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `m_user_pengirim_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_tujuan_id` int(10) UNSIGNED DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `lmapiran` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_kotak_masuk_komen`
--

CREATE TABLE `m_kotak_masuk_komen` (
  `id` int(10) UNSIGNED NOT NULL,
  `komen` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_kotak_masuk_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_label_kalender`
--

CREATE TABLE `m_label_kalender` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_laporan_prakerin`
--

CREATE TABLE `m_laporan_prakerin` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `waktu_mulai` datetime DEFAULT NULL,
  `waktu_akhir` datetime DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_lokasi`
--

CREATE TABLE `m_lokasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `no_regis` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `lebar` int(11) DEFAULT NULL,
  `panjang` int(11) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_lowongans`
--

CREATE TABLE `m_lowongans` (
  `id` int(10) UNSIGNED NOT NULL,
  `posisi` varchar(255) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `gaji_min` varchar(255) DEFAULT NULL,
  `gaji_max` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `persyaratan_khusus` text DEFAULT NULL,
  `pendidikan` varchar(255) DEFAULT NULL,
  `umur_min` int(11) DEFAULT NULL,
  `umur_max` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `minimal_pengalaman` int(11) DEFAULT NULL,
  `kondisi_fisik` varchar(255) DEFAULT NULL,
  `keterampilan` text DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED NOT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `industri` text DEFAULT NULL,
  `bidang_keahlian` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_mata_pelajaran`
--

CREATE TABLE `m_mata_pelajaran` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `kelompok` varchar(255) DEFAULT NULL,
  `kkm` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_materi`
--

CREATE TABLE `m_materi` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `tingkat` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_jurusan_id` int(10) UNSIGNED DEFAULT NULL,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_mou_perusahaan`
--

CREATE TABLE `m_mou_perusahaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `mulai_kontrak` date DEFAULT NULL,
  `akhir_kontrak` date DEFAULT NULL,
  `kerjasama` text DEFAULT NULL,
  `fasilitas` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `tk_perusahaan_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_mutasi`
--

CREATE TABLE `m_mutasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `waktu_dibuat` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_rek_sekolah_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_notifikasi`
--

CREATE TABLE `m_notifikasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `tanggal_dibuat` datetime DEFAULT NULL,
  `dibaca` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_notifikasi_terjadwal`
--

CREATE TABLE `m_notifikasi_terjadwal` (
  `id` int(10) UNSIGNED NOT NULL,
  `tanggal_dibagikan` datetime DEFAULT NULL,
  `tanggal_cron` varchar(255) DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `tujuan` varchar(255) DEFAULT NULL,
  `dikirim` tinyint(1) DEFAULT 0,
  `diupdate` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `lampiran` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pasal_peraturan`
--

CREATE TABLE `m_pasal_peraturan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `m_bab_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pekerjaan`
--

CREATE TABLE `m_pekerjaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `m_perusahaan_id` int(10) UNSIGNED DEFAULT NULL,
  `jumlah_lowongan` int(11) DEFAULT NULL,
  `jenis` text DEFAULT NULL,
  `bidang` varchar(255) DEFAULT NULL,
  `kontrak_kerja` varchar(255) DEFAULT NULL,
  `mulai_kerja` datetime DEFAULT NULL,
  `akhir_kerja` datetime DEFAULT NULL,
  `province_id` varchar(2) DEFAULT NULL,
  `regency_id` varchar(4) DEFAULT NULL,
  `district_id` varchar(7) DEFAULT NULL,
  `village_id` varchar(10) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pekerjaan_pengumuman`
--

CREATE TABLE `m_pekerjaan_pengumuman` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `m_pekerjaan_id` int(10) UNSIGNED DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `file` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pekerjaan_proyek`
--

CREATE TABLE `m_pekerjaan_proyek` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `prioritas` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `m_kategori_pekerjaan_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pelanggaran`
--

CREATE TABLE `m_pelanggaran` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `m_kategori_pelanggaran_id` int(10) UNSIGNED DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pelaporan_disposisi`
--

CREATE TABLE `m_pelaporan_disposisi` (
  `id` int(10) UNSIGNED NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lampiran` varchar(255) DEFAULT NULL,
  `m_disposisi_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pembayaran`
--

CREATE TABLE `m_pembayaran` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tipe_ujian` varchar(255) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `tanggal_dibuat` datetime DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_rek_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `nama_transaksi` varchar(255) DEFAULT NULL,
  `m_keu_akun_debet_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_kredit_id` int(10) UNSIGNED DEFAULT NULL,
  `nama_transaksi_siswa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pembayaran_kategori`
--

CREATE TABLE `m_pembayaran_kategori` (
  `id` int(10) UNSIGNED NOT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pembayaran_sekolah`
--

CREATE TABLE `m_pembayaran_sekolah` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `mulai_kontrak` date DEFAULT NULL,
  `akhir_kontrak` date DEFAULT NULL,
  `jumlah_pembayaran` int(11) DEFAULT NULL,
  `smarteschool` tinyint(1) DEFAULT 0,
  `internet` tinyint(1) DEFAULT 0,
  `face_recog` tinyint(1) DEFAULT 0,
  `stand_fr` tinyint(1) DEFAULT 0,
  `jumlah_pengguna` int(11) DEFAULT NULL,
  `jumlah_fr` int(11) DEFAULT NULL,
  `jumlah_stand` int(11) DEFAULT NULL,
  `ukuran_bandwidth` int(11) DEFAULT NULL,
  `invoice_bulan` int(11) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal_pembayaran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pembayaran_siswa`
--

CREATE TABLE `m_pembayaran_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `riwayat` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ditangguhkan` datetime DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `tk_pembayaran_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pendaftar_ppdb`
--

CREATE TABLE `m_pendaftar_ppdb` (
  `id` int(10) UNSIGNED NOT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `norek` varchar(255) DEFAULT NULL,
  `nama_pemilik` varchar(255) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `bukti` text DEFAULT NULL,
  `diverifikasi` tinyint(1) DEFAULT 0,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_gelombang_ppdb_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jurusan_1_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jurusan_2_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jurusan_3_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jurusan_4_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jurusan_5_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `pembayaran` text DEFAULT NULL,
  `surat_rekomendasi` text DEFAULT NULL,
  `konfirmasi_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_penerimaan_perusahaan`
--

CREATE TABLE `m_penerimaan_perusahaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `data_siswa` text DEFAULT NULL,
  `surat_tugas` text DEFAULT NULL,
  `mou` text DEFAULT NULL,
  `tk_perusahaan_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_penerimaan_siswa`
--

CREATE TABLE `m_penerimaan_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `lama_pkl` int(11) DEFAULT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_selesai` datetime DEFAULT NULL,
  `m_penerimaan_perusahaan_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jurusan_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_penghargaan`
--

CREATE TABLE `m_penghargaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `tingkat` varchar(255) DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_peringatan_ujian_siswa`
--

CREATE TABLE `m_peringatan_ujian_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `tk_peserta_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `dibaca` varchar(255) DEFAULT NULL,
  `dibaca_guru` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `jawaban` varchar(255) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `tk_jadwal_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_perpus`
--

CREATE TABLE `m_perpus` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `penulis` text DEFAULT NULL,
  `cover` text DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahun_terbit` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `draft` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_buku_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `no_rak` varchar(100) DEFAULT NULL,
  `sumber` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_perpus_komen`
--

CREATE TABLE `m_perpus_komen` (
  `id` int(10) UNSIGNED NOT NULL,
  `komen` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_perpus_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_perpus_tag`
--

CREATE TABLE `m_perpus_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_pertemuan_bk`
--

CREATE TABLE `m_pertemuan_bk` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_guru_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `keperluan` varchar(255) DEFAULT NULL,
  `tanggal_konsultasi` date DEFAULT NULL,
  `media_konsultasi` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `status_selesai` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_perusahaan`
--

CREATE TABLE `m_perusahaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nama_pt` varchar(255) DEFAULT NULL,
  `bidang` varchar(255) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `province_id` varchar(2) DEFAULT NULL,
  `regency_id` varchar(4) DEFAULT NULL,
  `district_id` varchar(7) DEFAULT NULL,
  `village_id` varchar(10) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_post`
--

CREATE TABLE `m_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `konten` text DEFAULT NULL,
  `disembunyikan` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_prakerin_siswa`
--

CREATE TABLE `m_prakerin_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `alamat_perusahaan` varchar(255) DEFAULT NULL,
  `province_id` varchar(2) DEFAULT NULL,
  `regency_id` varchar(4) DEFAULT NULL,
  `district_id` varchar(7) DEFAULT NULL,
  `village_id` varchar(10) DEFAULT NULL,
  `telepon_perusahaan` varchar(255) DEFAULT NULL,
  `kontak_narahubung` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `pembimbing` varchar(255) DEFAULT NULL,
  `tanggal_berangkat` date DEFAULT NULL,
  `tanggal_jemput` date DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `kodepos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_praktik_kerja`
--

CREATE TABLE `m_praktik_kerja` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `siswa` varchar(255) DEFAULT NULL,
  `surat_tugas` varchar(255) DEFAULT NULL,
  `mou` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_predikat_nilai`
--

CREATE TABLE `m_predikat_nilai` (
  `id` int(10) UNSIGNED NOT NULL,
  `predikat` varchar(255) DEFAULT NULL,
  `bb_pengetahuan` int(11) DEFAULT NULL,
  `ba_pengetahuan` int(11) DEFAULT NULL,
  `bb_keterampilan` int(11) DEFAULT NULL,
  `ba_keterampilan` int(11) DEFAULT NULL,
  `sikap` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `m_predikat_nilai`
--

INSERT INTO `m_predikat_nilai` (`id`, `predikat`, `bb_pengetahuan`, `ba_pengetahuan`, `bb_keterampilan`, `ba_keterampilan`, `sikap`, `m_sekolah_id`, `dihapus`, `created_at`, `updated_at`) VALUES
(12724, 'A', 86, 100, 86, 100, 'Sangat Baik', 12380, 0, '2025-06-29 21:26:59', '2025-06-29 21:26:59'),
(12725, 'B', 71, 86, 71, 86, 'Baik', 12380, 0, '2025-06-29 21:26:59', '2025-06-29 21:26:59'),
(12726, 'C', 56, 71, 56, 71, 'Cukup', 12380, 0, '2025-06-29 21:26:59', '2025-06-29 21:26:59'),
(12727, 'D', 0, 56, 0, 56, 'Kurang', 12380, 0, '2025-06-29 21:26:59', '2025-06-29 21:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `m_prestasi`
--

CREATE TABLE `m_prestasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tingkat` int(10) UNSIGNED DEFAULT NULL,
  `peringkat` varchar(255) DEFAULT NULL,
  `lembaga` varchar(255) DEFAULT NULL,
  `tanggal_terbit` varchar(255) DEFAULT NULL,
  `sertifikat_kadaluarsa` varchar(255) DEFAULT NULL,
  `tanggal_kadaluarsa` varchar(255) DEFAULT NULL,
  `id_sertifikat` varchar(255) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_profil_user`
--

CREATE TABLE `m_profil_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `nisn` varchar(255) DEFAULT NULL,
  `nis` varchar(255) DEFAULT NULL,
  `nipd` varchar(255) DEFAULT NULL,
  `nuptk` varchar(100) DEFAULT NULL,
  `agama` varchar(100) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `status_keluarga` varchar(255) DEFAULT NULL,
  `anak_ke` int(11) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `nrk` varchar(100) DEFAULT NULL,
  `status_kepegawaian` varchar(100) DEFAULT NULL,
  `jenis_ptk` varchar(100) DEFAULT NULL,
  `tugas_tambahan` varchar(100) DEFAULT NULL,
  `rt` varchar(100) DEFAULT NULL,
  `rw` varchar(100) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `kelas_diterima` varchar(255) DEFAULT NULL,
  `telp_rumah` varchar(255) DEFAULT NULL,
  `asal_sekolah` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `province_id` varchar(2) DEFAULT NULL,
  `regency_id` varchar(4) DEFAULT NULL,
  `district_id` varchar(7) DEFAULT NULL,
  `village_id` varchar(10) DEFAULT NULL,
  `kodepos` varchar(255) DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `tb` int(11) DEFAULT NULL,
  `bb` int(11) DEFAULT NULL,
  `gol_darah` varchar(255) DEFAULT NULL,
  `buta_warna` tinyint(1) DEFAULT 0,
  `kacamata` varchar(255) DEFAULT NULL,
  `disabilitas` varchar(255) DEFAULT NULL,
  `surat_keterangan_sehat` text DEFAULT NULL,
  `surat_keterangan_buta_warna` text DEFAULT NULL,
  `bahasa` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `pendidikan` text DEFAULT NULL,
  `portofolio` text DEFAULT NULL,
  `prestasi` text DEFAULT NULL,
  `keahlian` text DEFAULT NULL,
  `nama_ayah` varchar(255) DEFAULT NULL,
  `telp_ayah` varchar(255) DEFAULT NULL,
  `alamat_ayah` text DEFAULT NULL,
  `pekerjaan_ayah` varchar(255) DEFAULT NULL,
  `nama_ibu` varchar(255) DEFAULT NULL,
  `telp_ibu` varchar(255) DEFAULT NULL,
  `alamat_ibu` text DEFAULT NULL,
  `pekerjaan_ibu` varchar(255) DEFAULT NULL,
  `nama_wali` varchar(255) DEFAULT NULL,
  `telp_wali` varchar(255) DEFAULT NULL,
  `alamat_wali` text DEFAULT NULL,
  `pekerjaan_wali` varchar(255) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `fisika1` int(11) DEFAULT NULL,
  `fisika2` int(11) DEFAULT NULL,
  `fisika3` int(11) DEFAULT NULL,
  `fisika4` int(11) DEFAULT NULL,
  `fisika5` int(11) DEFAULT NULL,
  `fisika6` int(11) DEFAULT NULL,
  `matematika1` int(11) DEFAULT NULL,
  `matematika2` int(11) DEFAULT NULL,
  `matematika3` int(11) DEFAULT NULL,
  `matematika4` int(11) DEFAULT NULL,
  `matematika5` int(11) DEFAULT NULL,
  `matematika6` int(11) DEFAULT NULL,
  `bindo1` int(11) DEFAULT NULL,
  `bindo2` int(11) DEFAULT NULL,
  `bindo3` int(11) DEFAULT NULL,
  `bindo4` int(11) DEFAULT NULL,
  `bindo5` int(11) DEFAULT NULL,
  `bindo6` int(11) DEFAULT NULL,
  `bing1` int(11) DEFAULT NULL,
  `bing2` int(11) DEFAULT NULL,
  `bing3` int(11) DEFAULT NULL,
  `bing4` int(11) DEFAULT NULL,
  `bing5` int(11) DEFAULT NULL,
  `bing6` int(11) DEFAULT NULL,
  `semester1` text DEFAULT NULL,
  `semester2` text DEFAULT NULL,
  `semester3` text DEFAULT NULL,
  `semester4` text DEFAULT NULL,
  `semester5` text DEFAULT NULL,
  `semester6` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pengalaman` text DEFAULT NULL,
  `nama_panggilan` varchar(255) DEFAULT NULL,
  `no_ijazah` varchar(255) DEFAULT NULL,
  `tahun_ijazah` varchar(255) DEFAULT NULL,
  `file_ijazah` text DEFAULT NULL,
  `alamat_asal_sekolah` varchar(255) DEFAULT NULL,
  `file_ppdb` text DEFAULT NULL,
  `data_absensi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_proyek`
--

CREATE TABLE `m_proyek` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `privasi` tinyint(1) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `m_status_proyek_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_proyek_forum`
--

CREATE TABLE `m_proyek_forum` (
  `id` int(10) UNSIGNED NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_proyek_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_proyek_forum_komen`
--

CREATE TABLE `m_proyek_forum_komen` (
  `id` int(10) UNSIGNED NOT NULL,
  `komen` text DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_proyek_forum` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rapor_ekskul`
--

CREATE TABLE `m_rapor_ekskul` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ekstrakurikuler_id` int(10) UNSIGNED DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_registrasi_akun`
--

CREATE TABLE `m_registrasi_akun` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `verifikasi` tinyint(1) DEFAULT 0,
  `sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rekap`
--

CREATE TABLE `m_rekap` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `m_materi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `teknik` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rekap_rombel`
--

CREATE TABLE `m_rekap_rombel` (
  `id` int(10) UNSIGNED NOT NULL,
  `di_ss` tinyint(1) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_tugas_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rekap_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rek_sekolah`
--

CREATE TABLE `m_rek_sekolah` (
  `id` int(10) UNSIGNED NOT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `norek` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pemasukan` int(10) UNSIGNED DEFAULT 0,
  `pengeluaran` int(10) UNSIGNED DEFAULT 0,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_rek_sekolah`
--

INSERT INTO `m_rek_sekolah` (`id`, `jenis`, `bank`, `norek`, `nama`, `saldo`, `dihapus`, `m_sekolah_id`, `created_at`, `updated_at`, `pemasukan`, `pengeluaran`, `m_keu_akun_id`, `m_rencana_keuangan_id`) VALUES
(3576, 'DANA BOS', 'DKI', '12345', 'DANA BOS', 0, 0, 12380, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 0, 0, 55068, NULL),
(3577, 'DANA PMU', 'DKI', '12345', 'DANA PMU', 0, 0, 12380, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 0, 0, 55069, NULL),
(3578, 'DANA KOMITE', 'DKI', '12346', 'DANA KOMITE', 0, 0, 12380, '2025-06-29 23:19:41', '2025-06-29 23:19:41', 0, 0, 55070, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_aktivitas_trx`
--

CREATE TABLE `m_rencana_aktivitas_trx` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_kategori_tipe_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_kategori_arus_kas_id` int(10) UNSIGNED DEFAULT NULL,
  `saldo` varchar(255) DEFAULT NULL,
  `urutan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `laba` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_jurnal`
--

CREATE TABLE `m_rencana_jurnal` (
  `id` int(10) UNSIGNED NOT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_transaksi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_riwayat_pembayaran_siswa_id` int(10) UNSIGNED DEFAULT NULL,
  `saldo` bigint(20) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_kategori_arus_kas`
--

CREATE TABLE `m_rencana_kategori_arus_kas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_kategori_laba_rugi`
--

CREATE TABLE `m_rencana_kategori_laba_rugi` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_kategori_neraca`
--

CREATE TABLE `m_rencana_kategori_neraca` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_kategori_tipe_akun`
--

CREATE TABLE `m_rencana_kategori_tipe_akun` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pengaturan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_keuangan`
--

CREATE TABLE `m_rencana_keuangan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tanggal_awal` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_rumus_arus_kas`
--

CREATE TABLE `m_rencana_rumus_arus_kas` (
  `id` int(10) UNSIGNED NOT NULL,
  `rumus` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_rumus_laba_rugi`
--

CREATE TABLE `m_rencana_rumus_laba_rugi` (
  `id` int(10) UNSIGNED NOT NULL,
  `rumus` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_rumus_saldo_kas_akhir`
--

CREATE TABLE `m_rencana_rumus_saldo_kas_akhir` (
  `id` int(10) UNSIGNED NOT NULL,
  `rumus` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_rumus_saldo_kas_awal`
--

CREATE TABLE `m_rencana_rumus_saldo_kas_awal` (
  `id` int(10) UNSIGNED NOT NULL,
  `rumus` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rencana_transaksi`
--

CREATE TABLE `m_rencana_transaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `nomor` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_riwayat_pembayaran_siswa`
--

CREATE TABLE `m_riwayat_pembayaran_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `norek` varchar(255) DEFAULT NULL,
  `nama_pemilik` varchar(255) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `bukti` text DEFAULT NULL,
  `dikonfirmasi` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_pembayaran_siswa_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rombel`
--

CREATE TABLE `m_rombel` (
  `id` int(10) UNSIGNED NOT NULL,
  `tingkat` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kelompok` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jurusan_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `kode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_rombel`
--

INSERT INTO `m_rombel` (`id`, `tingkat`, `nama`, `kelompok`, `dihapus`, `m_user_id`, `m_jurusan_id`, `m_ta_id`, `m_sekolah_id`, `created_at`, `updated_at`, `banner`, `deskripsi`, `kode`) VALUES
(54266, 'XI', 'XI sija 1', 'reguler', 0, 2929089, 11487, 9290, 12380, '2025-06-29 23:22:15', '2025-06-29 23:22:15', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_rpp`
--

CREATE TABLE `m_rpp` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `moda` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `tingkat` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `soal` int(11) DEFAULT NULL,
  `waktu` int(11) DEFAULT NULL,
  `kkm` int(11) DEFAULT NULL,
  `penyusun` varchar(255) DEFAULT NULL,
  `m_ujian_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rumus_keu_akun`
--

CREATE TABLE `m_rumus_keu_akun` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `rumus` text DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_rencana_keuangan_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_rumus_laba_rugi`
--

CREATE TABLE `m_rumus_laba_rugi` (
  `id` int(10) UNSIGNED NOT NULL,
  `rumus` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sanksi_pelanggaran`
--

CREATE TABLE `m_sanksi_pelanggaran` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `poin_bawah` int(11) DEFAULT NULL,
  `poin_atas` int(11) DEFAULT NULL,
  `tindak_lanjut` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sanksi_siswa`
--

CREATE TABLE `m_sanksi_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sanksi_pelanggaran_id` int(10) UNSIGNED DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sarpras`
--

CREATE TABLE `m_sarpras` (
  `id` int(10) UNSIGNED NOT NULL,
  `foto` text DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `virtual_tour` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sekolah`
--

CREATE TABLE `m_sekolah` (
  `id` int(10) UNSIGNED NOT NULL,
  `npsn` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) DEFAULT NULL,
  `kabupaten` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kode_pos` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `domain` text DEFAULT NULL,
  `logo_ss` text DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `long` float DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `tingkat` varchar(255) DEFAULT NULL,
  `integrasi` varchar(255) DEFAULT NULL,
  `diintegrasi` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trial` tinyint(1) DEFAULT NULL,
  `gpds` tinyint(1) DEFAULT 0,
  `sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `domain_backup` varchar(100) DEFAULT NULL,
  `link_rapor` varchar(255) DEFAULT NULL,
  `link_web` varchar(255) DEFAULT NULL,
  `link_dapodik` varchar(255) DEFAULT NULL,
  `jumlah_ujian` int(11) DEFAULT 0,
  `jumlah_topik` int(11) DEFAULT 0,
  `gpds_event` varchar(100) DEFAULT NULL,
  `provinsi_id` varchar(255) DEFAULT NULL,
  `kabupaten_ids` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_sekolah`
--

INSERT INTO `m_sekolah` (`id`, `npsn`, `nama`, `provinsi`, `kabupaten`, `kecamatan`, `kelurahan`, `alamat`, `kode_pos`, `status`, `telp`, `email`, `logo`, `domain`, `logo_ss`, `lat`, `long`, `favicon`, `tingkat`, `integrasi`, `diintegrasi`, `created_at`, `updated_at`, `trial`, `gpds`, `sekolah_id`, `domain_backup`, `link_rapor`, `link_web`, `link_dapodik`, `jumlah_ujian`, `jumlah_topik`, `gpds_event`, `provinsi_id`, `kabupaten_ids`) VALUES
(12380, '20231420', 'SMKN 1 CIBINONG', 'Jawa Barat', 'Bogor', 'Cibinong', 'gatau', 'gatau', 'gatau', 'N', NULL, NULL, NULL, 'http://localhost:2025;http://127.0.0.1:2025', NULL, NULL, NULL, NULL, 'SMK', 'whatsapp', 1, NULL, NULL, NULL, 0, 12380, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_sekolah_industri`
--

CREATE TABLE `m_sekolah_industri` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_industri_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sekolah_industris`
--

CREATE TABLE `m_sekolah_industris` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_server`
--

CREATE TABLE `m_server` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `tagihan` varchar(255) DEFAULT NULL,
  `ram` text DEFAULT NULL,
  `cpu` text DEFAULT NULL,
  `storage` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sesbro`
--

CREATE TABLE `m_sesbro` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sikap_rombel`
--

CREATE TABLE `m_sikap_rombel` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_predikat_nilai_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sikap_ditunjukkan_id` varchar(50) DEFAULT NULL,
  `m_sikap_ditingkatkan_id` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sikap_siswa`
--

CREATE TABLE `m_sikap_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sikap_sosial_ditunjukkan_id` varchar(50) DEFAULT NULL,
  `m_sikap_sosial_ditingkatkan_id` varchar(50) DEFAULT NULL,
  `m_sikap_spiritual_ditingkatkan_id` varchar(50) DEFAULT NULL,
  `m_sikap_spiritual_ditunjukkan_id` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sikap_siswa_yadika`
--

CREATE TABLE `m_sikap_siswa_yadika` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `sikap_integritas` varchar(255) DEFAULT NULL,
  `sikap_religius` varchar(255) DEFAULT NULL,
  `nasionalis` varchar(255) DEFAULT NULL,
  `mandiri` varchar(255) DEFAULT NULL,
  `gotong_royong` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sikap_sosial`
--

CREATE TABLE `m_sikap_sosial` (
  `id` int(10) UNSIGNED NOT NULL,
  `sikap` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_sikap_spiritual`
--

CREATE TABLE `m_sikap_spiritual` (
  `id` int(10) UNSIGNED NOT NULL,
  `sikap` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_slider`
--

CREATE TABLE `m_slider` (
  `id` int(10) UNSIGNED NOT NULL,
  `banner` text DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_soal_kuis`
--

CREATE TABLE `m_soal_kuis` (
  `id` int(10) UNSIGNED NOT NULL,
  `pertanyaan` text DEFAULT NULL,
  `pg_a` text DEFAULT NULL,
  `pg_b` text DEFAULT NULL,
  `pg_c` text DEFAULT NULL,
  `pg_d` text DEFAULT NULL,
  `pg_e` text DEFAULT NULL,
  `pg_kj` varchar(255) DEFAULT NULL,
  `rubrik_kj` text DEFAULT NULL,
  `esai` tinyint(1) DEFAULT NULL,
  `esai_kj` text DEFAULT NULL,
  `pembahasan` text DEFAULT NULL,
  `pg_poin` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_topik_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_soal_ujian`
--

CREATE TABLE `m_soal_ujian` (
  `id` int(10) UNSIGNED NOT NULL,
  `kd` text DEFAULT NULL,
  `kd_konten_materi` text DEFAULT NULL,
  `level_kognitif` varchar(255) DEFAULT NULL,
  `bentuk_soal` varchar(255) DEFAULT NULL,
  `akm_konten_materi` text DEFAULT NULL,
  `akm_konteks_materi` text DEFAULT NULL,
  `akm_proses_kognitif` varchar(255) DEFAULT NULL,
  `sumber_buku` varchar(255) DEFAULT NULL,
  `tingkat_kesukaran` varchar(255) DEFAULT NULL,
  `pertanyaan` text DEFAULT NULL,
  `jawaban_a` text DEFAULT NULL,
  `jawaban_b` text DEFAULT NULL,
  `jawaban_c` text DEFAULT NULL,
  `jawaban_d` text DEFAULT NULL,
  `jawaban_e` text DEFAULT NULL,
  `kj_pg` varchar(255) DEFAULT NULL,
  `rubrik_kj` text DEFAULT NULL,
  `pembahasan` text DEFAULT NULL,
  `audio` text DEFAULT NULL,
  `nilai_soal` float(11,2) DEFAULT NULL,
  `opsi_a_uraian` text DEFAULT NULL,
  `opsi_b_uraian` text DEFAULT NULL,
  `kj_uraian` varchar(255) DEFAULT NULL,
  `jawaban_pg_kompleks` varchar(255) DEFAULT NULL,
  `pilihan_menjodohkan` text DEFAULT NULL,
  `soal_menjodohkan` text DEFAULT NULL,
  `bentuk` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `jawaban_benar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_status_proyek`
--

CREATE TABLE `m_status_proyek` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_surat`
--

CREATE TABLE `m_surat` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `asal` varchar(255) DEFAULT NULL,
  `nomor` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `perihal` varchar(255) DEFAULT NULL,
  `keamanan` varchar(255) DEFAULT NULL,
  `isi` varchar(255) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `teruskan` tinyint(1) DEFAULT 0,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_surat_keputusan`
--

CREATE TABLE `m_surat_keputusan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_surat_perusahaan`
--

CREATE TABLE `m_surat_perusahaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `tk_perusahaan_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_surel`
--

CREATE TABLE `m_surel` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `perihal` varchar(255) DEFAULT NULL,
  `m_user_pengirim_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_tujuan_id` int(10) UNSIGNED DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_surel_komen`
--

CREATE TABLE `m_surel_komen` (
  `id` int(10) UNSIGNED NOT NULL,
  `komen` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_surel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_ta`
--

CREATE TABLE `m_ta` (
  `id` int(10) UNSIGNED NOT NULL,
  `tahun` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `nama_kepsek` varchar(255) DEFAULT NULL,
  `nip_kepsek` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal_rapor` date DEFAULT NULL,
  `tanggal_awal` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `tanggal_rapor_mid` date DEFAULT NULL,
  `jam_sinkron` tinyint(1) DEFAULT 0,
  `mapel_sinkron` tinyint(1) DEFAULT 0,
  `rombel_sinkron` tinyint(1) DEFAULT 0,
  `jadwal_sinkron` tinyint(1) DEFAULT 0,
  `tingkat1` varchar(255) DEFAULT NULL,
  `tingkat2` varchar(255) DEFAULT NULL,
  `tingkat3` varchar(255) DEFAULT NULL,
  `tingkat4` varchar(255) DEFAULT NULL,
  `tingkat5` varchar(255) DEFAULT NULL,
  `tingkat6` varchar(255) DEFAULT NULL,
  `save` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_ta`
--

INSERT INTO `m_ta` (`id`, `tahun`, `semester`, `nama_kepsek`, `nip_kepsek`, `aktif`, `dihapus`, `m_sekolah_id`, `created_at`, `updated_at`, `tanggal_rapor`, `tanggal_awal`, `tanggal_akhir`, `tanggal_rapor_mid`, `jam_sinkron`, `mapel_sinkron`, `rombel_sinkron`, `jadwal_sinkron`, `tingkat1`, `tingkat2`, `tingkat3`, `tingkat4`, `tingkat5`, `tingkat6`, `save`) VALUES
(9290, '2025 / 2026', '2', 'Jaka ', '345678982', 1, 0, 12380, '2025-06-29 23:16:02', '2025-06-29 23:16:25', '2025-09-26', '2025-06-29', '2026-06-29', NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_template_deskripsi`
--

CREATE TABLE `m_template_deskripsi` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_predikat_nilai_id` int(10) UNSIGNED DEFAULT NULL,
  `prolog` varchar(255) DEFAULT NULL,
  `epilog` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_template_kesukaran_mapel`
--

CREATE TABLE `m_template_kesukaran_mapel` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `batas_bawah` varchar(255) DEFAULT NULL,
  `batas_atas` varchar(255) DEFAULT NULL,
  `m_materi_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_tes_pekerjaan`
--

CREATE TABLE `m_tes_pekerjaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_pekerjaan_id` int(10) UNSIGNED DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_akhir` time DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(4) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_timeline`
--

CREATE TABLE `m_timeline` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_tugas_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `gmeet` varchar(255) DEFAULT NULL,
  `rpp` text DEFAULT NULL,
  `jurnal` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `lampiran` varchar(255) DEFAULT NULL,
  `tanggal_dibuat` datetime DEFAULT NULL,
  `tanggal_pembagian` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal_akhir` datetime DEFAULT NULL,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_timeline_komen`
--

CREATE TABLE `m_timeline_komen` (
  `id` int(10) UNSIGNED NOT NULL,
  `komen` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_timeline_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_topik`
--

CREATE TABLE `m_topik` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `konten` longtext DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `kuis` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_bab_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_tugas`
--

CREATE TABLE `m_tugas` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `instruksi` text DEFAULT NULL,
  `tanggal_pembagian` date DEFAULT NULL,
  `waktu_pembagian` time DEFAULT NULL,
  `tanggal_pengumpulan` date DEFAULT NULL,
  `waktu_pengumpulan` time DEFAULT NULL,
  `kkm` int(11) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `draft` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `show_nilai` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_ujian`
--

CREATE TABLE `m_ujian` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `tingkat` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_ujian_siswa`
--

CREATE TABLE `m_ujian_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL,
  `uas_id` int(10) UNSIGNED DEFAULT NULL,
  `uts_id` int(10) UNSIGNED DEFAULT NULL,
  `us_id` int(10) UNSIGNED DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `nilai_keterampilan` int(11) DEFAULT NULL,
  `nilai_uts` int(11) DEFAULT NULL,
  `nilai_keterampilan_uts` int(11) DEFAULT NULL,
  `avg_nilai_tugas` int(11) DEFAULT NULL,
  `avg_nilai_ujian` int(11) DEFAULT NULL,
  `avg_praktik` int(11) DEFAULT NULL,
  `avg_proyek` int(11) DEFAULT NULL,
  `avg_produk` int(11) DEFAULT NULL,
  `avg_portofolio` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_ukk_siswa`
--

CREATE TABLE `m_ukk_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `pembimbing` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `nip` varchar(255) DEFAULT NULL,
  `nama_ayah` varchar(255) DEFAULT NULL,
  `nama_ibu` varchar(255) DEFAULT NULL,
  `wa_ayah` varchar(255) DEFAULT NULL,
  `wa_ibu` varchar(255) DEFAULT NULL,
  `nrk` varchar(255) DEFAULT NULL,
  `nuptk` varchar(255) DEFAULT NULL,
  `pangkat` varchar(255) DEFAULT NULL,
  `golongan` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `agama` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `photos` text DEFAULT NULL,
  `home` text DEFAULT NULL,
  `token` text DEFAULT NULL,
  `wa_real` varchar(255) DEFAULT NULL,
  `bagian` varchar(255) DEFAULT NULL,
  `verifikasi` varchar(255) DEFAULT NULL,
  `no_ujian` varchar(255) DEFAULT NULL,
  `kabupaten_ids` text DEFAULT NULL,
  `provinsi_id` varchar(50) DEFAULT NULL,
  `m_ta_id` int(10) UNSIGNED DEFAULT NULL,
  `user_agent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`id`, `nama`, `username`, `whatsapp`, `email`, `password`, `avatar`, `tanggal_lahir`, `role`, `gender`, `nip`, `nama_ayah`, `nama_ibu`, `wa_ayah`, `wa_ibu`, `nrk`, `nuptk`, `pangkat`, `golongan`, `m_sekolah_id`, `dihapus`, `created_at`, `updated_at`, `agama`, `tempat_lahir`, `photos`, `home`, `token`, `wa_real`, `bagian`, `verifikasi`, `no_ujian`, `kabupaten_ids`, `provinsi_id`, `m_ta_id`, `user_agent`) VALUES
(0, 'naomi', 'naomi', 'naomi', 'naomi@gmail.com', '12345678', NULL, NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12380, 1, NULL, '2025-06-29 23:19:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2929088, 'adminsija', 'adminsija', 'adminsija', 'adminsija@gmail.com', '$2a$12$CqsWZvcfmXAozW1z.IVHA.O0Bi/fAxObFoDRBRu1.hvykUctrvIXq', NULL, '2025-06-29', 'admin', 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2929089, 'guruses', NULL, 'guruses', NULL, '$2a$10$FqfaJJiq3GeZX37qUFjdK.c3MU4GGR2I1AQ.n0SB10OHbaDR9VCEW', NULL, NULL, 'guru', 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12380, 0, '2025-06-29 23:18:10', '2025-08-02 19:20:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2929090, 'adminses', NULL, 'adminses', NULL, '$2a$10$vdr.HDUz/1FYnvMGLR2wl.B5BiVjp9unwREpDsb2PsxYcvXMsSdgu', NULL, NULL, 'admin', 'L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12380, 0, '2025-06-29 23:19:12', '2025-08-02 21:40:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2929091, 'siswa1', NULL, 'siswa1', NULL, '$2a$10$iUXEtpWfOCRxQKw9OMysH.r.vQ8OEDRVyqcTkHEOzeEIRRkUeQX6y', NULL, NULL, 'siswa', 'L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12380, 0, '2025-06-29 23:23:44', '2025-07-25 23:30:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` varchar(2) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`) VALUES
('11', 'ACEH'),
('12', 'SUMATERA UTARA'),
('13', 'SUMATERA BARAT'),
('14', 'RIAU'),
('15', 'JAMBI'),
('16', 'SUMATERA SELATAN'),
('17', 'BENGKULU'),
('18', 'LAMPUNG'),
('19', 'KEPULAUAN BANGKA BELITUNG'),
('21', 'KEPULAUAN RIAU'),
('31', 'DKI JAKARTA'),
('32', 'JAWA BARAT'),
('33', 'JAWA TENGAH'),
('34', 'DI YOGYAKARTA'),
('35', 'JAWA TIMUR'),
('36', 'BANTEN'),
('51', 'BALI'),
('52', 'NUSA TENGGARA BARAT'),
('53', 'NUSA TENGGARA TIMUR'),
('61', 'KALIMANTAN BARAT'),
('62', 'KALIMANTAN TENGAH'),
('63', 'KALIMANTAN SELATAN'),
('64', 'KALIMANTAN TIMUR'),
('65', 'KALIMANTAN UTARA'),
('71', 'SULAWESI UTARA'),
('72', 'SULAWESI TENGAH'),
('73', 'SULAWESI SELATAN'),
('74', 'SULAWESI TENGGARA'),
('75', 'GORONTALO'),
('76', 'SULAWESI BARAT'),
('81', 'MALUKU'),
('82', 'MALUKU UTARA'),
('91', 'PAPUA BARAT'),
('93', 'PAPUA SELATAN'),
('94', 'PAPUA'),
('95', 'PAPUA TENGAH'),
('96', 'PAPUA PEGUNUNGAN'),
('97', 'PAPUA BARAT DAYA');

-- --------------------------------------------------------

--
-- Table structure for table `regencies`
--

CREATE TABLE `regencies` (
  `id` varchar(4) NOT NULL,
  `province_id` varchar(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lambang` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sekolah`
--

CREATE TABLE `sekolah` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_prop` varchar(255) DEFAULT NULL,
  `propinsi` varchar(255) DEFAULT NULL,
  `kode_kab_kota` varchar(255) DEFAULT NULL,
  `kabupaten_kota` varchar(255) DEFAULT NULL,
  `kode_kec` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `npsn` varchar(255) DEFAULT NULL,
  `sekolah` varchar(255) DEFAULT NULL,
  `bentuk` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `lintang` varchar(255) DEFAULT NULL,
  `bujur` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sekolah`
--

INSERT INTO `sekolah` (`id`, `kode_prop`, `propinsi`, `kode_kab_kota`, `kabupaten_kota`, `kode_kec`, `kecamatan`, `uuid`, `npsn`, `sekolah`, `bentuk`, `status`, `alamat_jalan`, `lintang`, `bujur`, `created_at`, `updated_at`, `m_sekolah_id`) VALUES
(1, '11', 'Jawa Barat', '27673', 'Bogor', '23987', 'Cibinong', '', NULL, 'SMKN 1 CIBINONG', 'SMK', 'N', 'Jl. Karadenan', NULL, NULL, NULL, NULL, 12380);

-- --------------------------------------------------------

--
-- Table structure for table `sekolah_grades`
--

CREATE TABLE `sekolah_grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `kabupaten` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `jenjang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_replication_2`
--

CREATE TABLE `test_replication_2` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_bank_soal_guru`
--

CREATE TABLE `tk_bank_soal_guru` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_jadwal_ujian`
--

CREATE TABLE `tk_jadwal_ujian` (
  `id` int(10) UNSIGNED NOT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jadwal_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_jawaban_ujian_siswa`
--

CREATE TABLE `tk_jawaban_ujian_siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `jawaban_rubrik_esai` text DEFAULT NULL,
  `jawaban_foto` text DEFAULT NULL,
  `jawaban_pg` varchar(255) DEFAULT NULL,
  `jawaban_esai` text DEFAULT NULL,
  `jawaban_opsi_uraian` varchar(255) DEFAULT NULL,
  `jawaban_uraian` text DEFAULT NULL,
  `jawaban_pg_kompleks` varchar(255) DEFAULT NULL,
  `jawaban_menjodohkan` text DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `dinilai` tinyint(1) DEFAULT NULL,
  `ragu` tinyint(1) DEFAULT NULL,
  `dijawab` tinyint(1) DEFAULT NULL,
  `m_soal_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `tk_peserta_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tk_peserta_ujian_ppdb_id` int(10) UNSIGNED DEFAULT NULL,
  `jawaban_isian` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_kategori_akun_laba_rugi`
--

CREATE TABLE `tk_kategori_akun_laba_rugi` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_keu_kategori_laba_rugi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pengaturan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_kategori_akun_neraca`
--

CREATE TABLE `tk_kategori_akun_neraca` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_keu_kategori_neraca_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pengaturan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_kategori_tipe_akun`
--

CREATE TABLE `tk_kategori_tipe_akun` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_keu_kategori_tipe_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_mapel_rapor`
--

CREATE TABLE `tk_mapel_rapor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kkm2` int(11) DEFAULT NULL,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_kategori_mapel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_predikat_nilai_id` int(10) UNSIGNED DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_materi_kesimpulan`
--

CREATE TABLE `tk_materi_kesimpulan` (
  `id` int(10) UNSIGNED NOT NULL,
  `kesimpulan` text DEFAULT NULL,
  `waktu_mulai` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `dibaca` tinyint(1) DEFAULT NULL,
  `m_topik_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_materi_rombel`
--

CREATE TABLE `tk_materi_rombel` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_materi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_pekerjaan_proyek_aktivitas`
--

CREATE TABLE `tk_pekerjaan_proyek_aktivitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `event` varchar(255) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_pekerjaan_proyek_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_pembayaran_rombel`
--

CREATE TABLE `tk_pembayaran_rombel` (
  `id` int(10) UNSIGNED NOT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_pembayaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_perpus_aktivitas`
--

CREATE TABLE `tk_perpus_aktivitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_perpus_id` int(10) UNSIGNED DEFAULT NULL,
  `aktivitas` varchar(255) DEFAULT NULL,
  `waktu_mulai` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_perpus_mapel`
--

CREATE TABLE `tk_perpus_mapel` (
  `id` int(10) UNSIGNED NOT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_jurusan_id` int(10) UNSIGNED DEFAULT NULL,
  `m_mata_pelajaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_perpus_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_perpus_tag`
--

CREATE TABLE `tk_perpus_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_perpus_tag_id` int(10) UNSIGNED DEFAULT NULL,
  `m_perpus_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_perusahaan_sekolah`
--

CREATE TABLE `tk_perusahaan_sekolah` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_perusahaan_id` int(10) UNSIGNED DEFAULT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_peserta_ujian`
--

CREATE TABLE `tk_peserta_ujian` (
  `id` int(10) UNSIGNED NOT NULL,
  `doc_id` text DEFAULT NULL,
  `waktu_mulai` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `selesai` tinyint(1) DEFAULT NULL,
  `dinilai` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `tk_jadwal_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `m_tugas_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nilai_pg` int(11) DEFAULT NULL,
  `nilai_esai` int(11) DEFAULT NULL,
  `tk_timeline_id` int(10) UNSIGNED DEFAULT NULL,
  `warning` int(11) DEFAULT 0,
  `block` tinyint(1) DEFAULT 0,
  `tk_siswa_ujian_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_peserta_ujian_ppdb`
--

CREATE TABLE `tk_peserta_ujian_ppdb` (
  `id` int(10) UNSIGNED NOT NULL,
  `doc_id` text DEFAULT NULL,
  `waktu_mulai` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `selesai` tinyint(1) DEFAULT NULL,
  `dinilai` tinyint(1) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jadwal_ppdb_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `m_pendaftar_ppdb_id` int(10) UNSIGNED DEFAULT NULL,
  `tk_peserta_ujian_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_post`
--

CREATE TABLE `tk_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_post_id` int(10) UNSIGNED DEFAULT NULL,
  `m_kategori_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_rekap_nilai`
--

CREATE TABLE `tk_rekap_nilai` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `m_rekap_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_rencana_kategori_laba`
--

CREATE TABLE `tk_rencana_kategori_laba` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_rencana_kategori_laba_rugi_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_rencana_kategori_neraca`
--

CREATE TABLE `tk_rencana_kategori_neraca` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_rencana_kategori_neraca_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pengaturan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_rencana_kategori_tipe`
--

CREATE TABLE `tk_rencana_kategori_tipe` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_rencana_kategori_tipe_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `m_keu_akun_id` int(10) UNSIGNED DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_server_sekolah`
--

CREATE TABLE `tk_server_sekolah` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_sekolah_id` int(10) UNSIGNED DEFAULT NULL,
  `m_server_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_siswa_pelanggaran`
--

CREATE TABLE `tk_siswa_pelanggaran` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_pelanggaran_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_pelapor_id` int(10) UNSIGNED DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `tanggal_pelanggaran` datetime DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_siswa_ujian`
--

CREATE TABLE `tk_siswa_ujian` (
  `id` int(10) UNSIGNED NOT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_rombel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_jadwal_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_soal_tugas`
--

CREATE TABLE `tk_soal_tugas` (
  `id` int(10) UNSIGNED NOT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `m_tugas_id` int(10) UNSIGNED DEFAULT NULL,
  `m_soal_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_soal_ujian`
--

CREATE TABLE `tk_soal_ujian` (
  `id` int(10) UNSIGNED NOT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `m_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `m_soal_ujian_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `bentuk_soal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_status_pekerjaan`
--

CREATE TABLE `tk_status_pekerjaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_pekerjaan_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_surat_keputusan_user`
--

CREATE TABLE `tk_surat_keputusan_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_surat_keputusan_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_timeline`
--

CREATE TABLE `tk_timeline` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `waktu_pengumpulan` datetime DEFAULT NULL,
  `waktu_absen` datetime DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `m_timeline_id` int(10) UNSIGNED DEFAULT NULL,
  `absen` varchar(255) DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `dikumpulkan` tinyint(1) DEFAULT NULL,
  `dikembalikan` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_timeline_komen`
--

CREATE TABLE `tk_timeline_komen` (
  `id` int(10) UNSIGNED NOT NULL,
  `komen` text DEFAULT NULL,
  `dihapus` tinyint(1) DEFAULT NULL,
  `tk_timeline_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_timeline_topik`
--

CREATE TABLE `tk_timeline_topik` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_timeline_id` int(10) UNSIGNED DEFAULT NULL,
  `m_topik_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tk_tipe_surel`
--

CREATE TABLE `tk_tipe_surel` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_surel_id` int(10) UNSIGNED DEFAULT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `m_folder_arsip_id` int(10) UNSIGNED DEFAULT NULL,
  `dibaca` tinyint(1) DEFAULT 0,
  `dihapus` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `m_user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `villages`
--

CREATE TABLE `villages` (
  `id` varchar(10) NOT NULL,
  `district_id` varchar(7) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_id_index` (`regency_id`);

--
-- Indexes for table `leaderboards`
--
ALTER TABLE `leaderboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `lost_found`
--
ALTER TABLE `lost_found`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lost_found_notifs`
--
ALTER TABLE `lost_found_notifs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `market_places`
--
ALTER TABLE `market_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_absen`
--
ALTER TABLE `m_absen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_absen_belum_terdaftar`
--
ALTER TABLE `m_absen_belum_terdaftar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_acara_perusahaan`
--
ALTER TABLE `m_acara_perusahaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_perusahaan_id` (`m_perusahaan_id`);

--
-- Indexes for table `m_alumni`
--
ALTER TABLE `m_alumni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_alur_ppdb`
--
ALTER TABLE `m_alur_ppdb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_ta_id` (`m_ta_id`);

--
-- Indexes for table `m_anggota_ekskul`
--
ALTER TABLE `m_anggota_ekskul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_ekstrakurikuler_id` (`m_ekstrakurikuler_id`);

--
-- Indexes for table `m_anggota_proyek`
--
ALTER TABLE `m_anggota_proyek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_proyek_id` (`m_proyek_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_anggota_proyek_role`
--
ALTER TABLE `m_anggota_proyek_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_anggota_proyek_id` (`m_anggota_proyek_id`);

--
-- Indexes for table `m_anggota_rombel`
--
ALTER TABLE `m_anggota_rombel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`);

--
-- Indexes for table `m_bab`
--
ALTER TABLE `m_bab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_materi_id` (`m_materi_id`);

--
-- Indexes for table `m_bab_peraturan`
--
ALTER TABLE `m_bab_peraturan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_lokasi_id` (`m_lokasi_id`),
  ADD KEY `Index 3` (`m_sekolah_id`) USING BTREE;

--
-- Indexes for table `m_bobot_nilai`
--
ALTER TABLE `m_bobot_nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_broadcast`
--
ALTER TABLE `m_broadcast`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_bukti_pelaksanaan_sanksi`
--
ALTER TABLE `m_bukti_pelaksanaan_sanksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sanksi_siswa_id` (`m_sanksi_siswa_id`);

--
-- Indexes for table `m_buku`
--
ALTER TABLE `m_buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_buku_tamu`
--
ALTER TABLE `m_buku_tamu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `regency_id` (`regency_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_camera`
--
ALTER TABLE `m_camera`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_diskon_pendaftar`
--
ALTER TABLE `m_diskon_pendaftar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_pendaftar_ppdb_id` (`m_pendaftar_ppdb_id`);

--
-- Indexes for table `m_disposisi`
--
ALTER TABLE `m_disposisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_surat_id` (`m_surat_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_ditugaskan_pekerjaan`
--
ALTER TABLE `m_ditugaskan_pekerjaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_pekerjaan_proyek_id` (`m_pekerjaan_proyek_id`),
  ADD KEY `m_anggota_proyek_id` (`m_anggota_proyek_id`);

--
-- Indexes for table `m_dokumen_pembayaran_sekolah`
--
ALTER TABLE `m_dokumen_pembayaran_sekolah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_pembayaran_sekolah_id` (`m_pembayaran_sekolah_id`);

--
-- Indexes for table `m_ekstrakurikuler`
--
ALTER TABLE `m_ekstrakurikuler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_fitur_sekolah`
--
ALTER TABLE `m_fitur_sekolah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_folder_arsip`
--
ALTER TABLE `m_folder_arsip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_gelombang_ppdb`
--
ALTER TABLE `m_gelombang_ppdb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_ta_id` (`m_ta_id`),
  ADD KEY `m_jalur_ppdb_id` (`m_jalur_ppdb_id`);

--
-- Indexes for table `m_guru_jurusan`
--
ALTER TABLE `m_guru_jurusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_jurusan_id` (`m_jurusan_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_histori_aktivitas`
--
ALTER TABLE `m_histori_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_history_jobs`
--
ALTER TABLE `m_history_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_history_jobs_m_user_id_foreign` (`m_user_id`),
  ADD KEY `m_history_jobs_m_sekolah_id_foreign` (`m_sekolah_id`);

--
-- Indexes for table `m_industri`
--
ALTER TABLE `m_industri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_informasi_gelombang`
--
ALTER TABLE `m_informasi_gelombang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_gelombang_ppdb_id` (`m_gelombang_ppdb_id`);

--
-- Indexes for table `m_informasi_jalur_ppdb`
--
ALTER TABLE `m_informasi_jalur_ppdb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_jalur_ppdb_id` (`m_jalur_ppdb_id`);

--
-- Indexes for table `m_informasi_jurusan`
--
ALTER TABLE `m_informasi_jurusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_jurusan_id` (`m_jurusan_id`);

--
-- Indexes for table `m_informasi_pekerjaan`
--
ALTER TABLE `m_informasi_pekerjaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_pekerjaan_id` (`m_pekerjaan_id`);

--
-- Indexes for table `m_informasi_perusahaan`
--
ALTER TABLE `m_informasi_perusahaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_perusahaan_id` (`m_perusahaan_id`);

--
-- Indexes for table `m_informasi_sekolah`
--
ALTER TABLE `m_informasi_sekolah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_jadwal_konsultasi`
--
ALTER TABLE `m_jadwal_konsultasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_pertemuan_bk_id` (`m_pertemuan_bk_id`);

--
-- Indexes for table `m_jadwal_mengajar`
--
ALTER TABLE `m_jadwal_mengajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_mata_pelajaran_id` (`m_mata_pelajaran_id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`),
  ADD KEY `m_ta_id` (`m_ta_id`),
  ADD KEY `m_jam_mengajar_id` (`m_jam_mengajar_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_jadwal_ppdb`
--
ALTER TABLE `m_jadwal_ppdb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_informasi_gelombang_id` (`m_informasi_gelombang_id`),
  ADD KEY `m_ujian_id` (`m_ujian_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_jadwal_ujian`
--
ALTER TABLE `m_jadwal_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_ujian_id` (`m_ujian_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_jalur_ppdb`
--
ALTER TABLE `m_jalur_ppdb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_jam_mengajar`
--
ALTER TABLE `m_jam_mengajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_ta_id` (`m_ta_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_jurusan`
--
ALTER TABLE `m_jurusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_kalender_pendidikan`
--
ALTER TABLE `m_kalender_pendidikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_label_kalender_id` (`m_label_kalender_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_kategori_mapel`
--
ALTER TABLE `m_kategori_mapel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`);

--
-- Indexes for table `m_kategori_pekerjaan`
--
ALTER TABLE `m_kategori_pekerjaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_proyek_id` (`m_proyek_id`);

--
-- Indexes for table `m_kategori_pelanggaran`
--
ALTER TABLE `m_kategori_pelanggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_kegiatan`
--
ALTER TABLE `m_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_kegiatan_galeri`
--
ALTER TABLE `m_kegiatan_galeri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_kegiatan_id` (`m_kegiatan_id`);

--
-- Indexes for table `m_kegiatan_kalender`
--
ALTER TABLE `m_kegiatan_kalender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_label_kalender_id` (`m_label_kalender_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keterangan_pkl`
--
ALTER TABLE `m_keterangan_pkl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `Index 3` (`m_ta_id`),
  ADD KEY `Index 4` (`m_perusahaan_id`) USING BTREE;

--
-- Indexes for table `m_keterangan_rapor`
--
ALTER TABLE `m_keterangan_rapor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_ta_id` (`m_ta_id`) USING BTREE;

--
-- Indexes for table `m_keu_aktivitas_transaksi`
--
ALTER TABLE `m_keu_aktivitas_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_keu_kategori_tipe_akun_id` (`m_keu_kategori_tipe_akun_id`),
  ADD KEY `m_keu_kategori_arus_kas_id` (`m_keu_kategori_arus_kas_id`);

--
-- Indexes for table `m_keu_akun`
--
ALTER TABLE `m_keu_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_rek_sekolah_id` (`m_rek_sekolah_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_jurnal`
--
ALTER TABLE `m_keu_jurnal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`),
  ADD KEY `m_keu_transaksi_id` (`m_keu_transaksi_id`),
  ADD KEY `m_riwayat_pembayaran_siswa_id` (`m_riwayat_pembayaran_siswa_id`),
  ADD KEY `m_rencana_transaksi_id` (`m_rencana_transaksi_id`);

--
-- Indexes for table `m_keu_kategori_arus_kas`
--
ALTER TABLE `m_keu_kategori_arus_kas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_kategori_laba_rugi`
--
ALTER TABLE `m_keu_kategori_laba_rugi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_kategori_neraca`
--
ALTER TABLE `m_keu_kategori_neraca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_kategori_tipe_akun`
--
ALTER TABLE `m_keu_kategori_tipe_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_penyusutan_transaksi`
--
ALTER TABLE `m_keu_penyusutan_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_keu_transaksi_id` (`m_keu_transaksi_id`),
  ADD KEY `m_keu_akun_debet_id` (`m_keu_akun_debet_id`),
  ADD KEY `m_keu_akun_kredit_id` (`m_keu_akun_kredit_id`),
  ADD KEY `Index 5` (`m_sekolah_id`) USING BTREE;

--
-- Indexes for table `m_keu_rumus_arus_kas`
--
ALTER TABLE `m_keu_rumus_arus_kas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_rumus_penyusutan`
--
ALTER TABLE `m_keu_rumus_penyusutan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`),
  ADD KEY `m_keu_akun_akumulasi_id` (`m_keu_akun_akumulasi_id`),
  ADD KEY `m_keu_akun_penyusustan_id` (`m_keu_akun_penyusustan_id`);

--
-- Indexes for table `m_keu_rumus_saldo_kas_akhir`
--
ALTER TABLE `m_keu_rumus_saldo_kas_akhir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_rumus_saldo_kas_awal`
--
ALTER TABLE `m_keu_rumus_saldo_kas_awal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_template_akun`
--
ALTER TABLE `m_keu_template_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_template_analisis`
--
ALTER TABLE `m_keu_template_analisis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_keu_transaksi`
--
ALTER TABLE `m_keu_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_transaksi_id` (`m_rencana_transaksi_id`),
  ADD KEY `m_barang_id` (`m_barang_id`),
  ADD KEY `m_keu_penyusutan_transaksi_id` (`m_keu_penyusutan_transaksi_id`),
  ADD KEY `m_pembayaran_id` (`m_pembayaran_id`),
  ADD KEY `m_riwayat_pembayaran_id` (`m_riwayat_pembayaran_id`);

--
-- Indexes for table `m_kontak`
--
ALTER TABLE `m_kontak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_kotak_masuk`
--
ALTER TABLE `m_kotak_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_pengirim_id` (`m_user_pengirim_id`),
  ADD KEY `m_user_tujuan_id` (`m_user_tujuan_id`);

--
-- Indexes for table `m_kotak_masuk_komen`
--
ALTER TABLE `m_kotak_masuk_komen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_kotak_masuk_id` (`m_kotak_masuk_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_label_kalender`
--
ALTER TABLE `m_label_kalender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_laporan_prakerin`
--
ALTER TABLE `m_laporan_prakerin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_lokasi`
--
ALTER TABLE `m_lokasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_lowongans`
--
ALTER TABLE `m_lowongans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_lowongans_m_user_id_foreign` (`m_user_id`);

--
-- Indexes for table `m_mata_pelajaran`
--
ALTER TABLE `m_mata_pelajaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_ta_id` (`m_ta_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_materi`
--
ALTER TABLE `m_materi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_jurusan_id` (`m_jurusan_id`),
  ADD KEY `m_mata_pelajaran_id` (`m_mata_pelajaran_id`);

--
-- Indexes for table `m_mou_perusahaan`
--
ALTER TABLE `m_mou_perusahaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tk_perusahaan_sekolah_id` (`tk_perusahaan_sekolah_id`);

--
-- Indexes for table `m_mutasi`
--
ALTER TABLE `m_mutasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `Index 3` (`m_rek_sekolah_id`);

--
-- Indexes for table `m_notifikasi`
--
ALTER TABLE `m_notifikasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_notifikasi_terjadwal`
--
ALTER TABLE `m_notifikasi_terjadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_pasal_peraturan`
--
ALTER TABLE `m_pasal_peraturan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_bab_id` (`m_bab_id`);

--
-- Indexes for table `m_pekerjaan`
--
ALTER TABLE `m_pekerjaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_perusahaan_id` (`m_perusahaan_id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `regency_id` (`regency_id`),
  ADD KEY `district_id` (`district_id`),
  ADD KEY `village_id` (`village_id`);

--
-- Indexes for table `m_pekerjaan_pengumuman`
--
ALTER TABLE `m_pekerjaan_pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_pekerjaan_id` (`m_pekerjaan_id`);

--
-- Indexes for table `m_pekerjaan_proyek`
--
ALTER TABLE `m_pekerjaan_proyek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_kategori_pekerjaan_id` (`m_kategori_pekerjaan_id`);

--
-- Indexes for table `m_pelanggaran`
--
ALTER TABLE `m_pelanggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_kategori_pelanggaran_id` (`m_kategori_pelanggaran_id`);

--
-- Indexes for table `m_pelaporan_disposisi`
--
ALTER TABLE `m_pelaporan_disposisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_disposisi_id` (`m_disposisi_id`);

--
-- Indexes for table `m_pembayaran`
--
ALTER TABLE `m_pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `Index 3` (`m_rek_sekolah_id`),
  ADD KEY `m_ta_id` (`m_ta_id`),
  ADD KEY `m_keu_akun_debet_id` (`m_keu_akun_debet_id`),
  ADD KEY `m_keu_akun_kredit_id` (`m_keu_akun_kredit_id`);

--
-- Indexes for table `m_pembayaran_kategori`
--
ALTER TABLE `m_pembayaran_kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_pembayaran_sekolah`
--
ALTER TABLE `m_pembayaran_sekolah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_pembayaran_siswa`
--
ALTER TABLE `m_pembayaran_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `tk_pembayaran_rombel_id` (`tk_pembayaran_rombel_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_pendaftar_ppdb`
--
ALTER TABLE `m_pendaftar_ppdb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_gelombang_ppdb_id` (`m_gelombang_ppdb_id`),
  ADD KEY `m_jurusan_1_id` (`m_jurusan_1_id`),
  ADD KEY `m_jurusan_2_id` (`m_jurusan_2_id`),
  ADD KEY `m_jurusan_3_id` (`m_jurusan_3_id`),
  ADD KEY `m_jurusan_4_id` (`m_jurusan_4_id`),
  ADD KEY `m_jurusan_5_id` (`m_jurusan_5_id`),
  ADD KEY `konfirmasi_id` (`konfirmasi_id`);

--
-- Indexes for table `m_penerimaan_perusahaan`
--
ALTER TABLE `m_penerimaan_perusahaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tk_perusahaan_sekolah_id` (`tk_perusahaan_sekolah_id`),
  ADD KEY `m_ta_id` (`m_ta_id`);

--
-- Indexes for table `m_penerimaan_siswa`
--
ALTER TABLE `m_penerimaan_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_penerimaan_perusahaan_id` (`m_penerimaan_perusahaan_id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_jurusan_id` (`m_jurusan_id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`);

--
-- Indexes for table `m_penghargaan`
--
ALTER TABLE `m_penghargaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_peringatan_ujian_siswa`
--
ALTER TABLE `m_peringatan_ujian_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tk_peserta_ujian_id` (`tk_peserta_ujian_id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `tk_jadwal_ujian_id` (`tk_jadwal_ujian_id`);

--
-- Indexes for table `m_perpus`
--
ALTER TABLE `m_perpus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_buku_id` (`m_buku_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_perpus_komen`
--
ALTER TABLE `m_perpus_komen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_perpus_id` (`m_perpus_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_perpus_tag`
--
ALTER TABLE `m_perpus_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_pertemuan_bk`
--
ALTER TABLE `m_pertemuan_bk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_guru_id` (`m_user_guru_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_perusahaan`
--
ALTER TABLE `m_perusahaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `regency_id` (`regency_id`),
  ADD KEY `district_id` (`district_id`),
  ADD KEY `village_id` (`village_id`);

--
-- Indexes for table `m_post`
--
ALTER TABLE `m_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_prakerin_siswa`
--
ALTER TABLE `m_prakerin_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `regency_id` (`regency_id`),
  ADD KEY `district_id` (`district_id`),
  ADD KEY `village_id` (`village_id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_ta_id` (`m_ta_id`);

--
-- Indexes for table `m_praktik_kerja`
--
ALTER TABLE `m_praktik_kerja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_predikat_nilai`
--
ALTER TABLE `m_predikat_nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_prestasi`
--
ALTER TABLE `m_prestasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `Index 4` (`m_ta_id`),
  ADD KEY `Index 5` (`tingkat`);

--
-- Indexes for table `m_profil_user`
--
ALTER TABLE `m_profil_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `regency_id` (`regency_id`),
  ADD KEY `district_id` (`district_id`),
  ADD KEY `village_id` (`village_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_proyek`
--
ALTER TABLE `m_proyek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_status_proyek_id` (`m_status_proyek_id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_proyek_forum`
--
ALTER TABLE `m_proyek_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_proyek_id` (`m_proyek_id`),
  ADD KEY `m_user_id` (`m_user_id`) USING BTREE;

--
-- Indexes for table `m_proyek_forum_komen`
--
ALTER TABLE `m_proyek_forum_komen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_proyek_forum` (`m_proyek_forum`);

--
-- Indexes for table `m_rapor_ekskul`
--
ALTER TABLE `m_rapor_ekskul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_ekstrakurikuler_id` (`m_ekstrakurikuler_id`) USING BTREE;

--
-- Indexes for table `m_registrasi_akun`
--
ALTER TABLE `m_registrasi_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sekolah_id` (`sekolah_id`);

--
-- Indexes for table `m_rekap`
--
ALTER TABLE `m_rekap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_materi_id` (`m_materi_id`),
  ADD KEY `m_ta_id` (`m_ta_id`);

--
-- Indexes for table `m_rekap_rombel`
--
ALTER TABLE `m_rekap_rombel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`),
  ADD KEY `m_tugas_id` (`m_tugas_id`),
  ADD KEY `m_rekap_id` (`m_rekap_id`);

--
-- Indexes for table `m_rek_sekolah`
--
ALTER TABLE `m_rek_sekolah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rencana_aktivitas_trx`
--
ALTER TABLE `m_rencana_aktivitas_trx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_kategori_tipe_akun_id` (`m_rencana_kategori_tipe_akun_id`),
  ADD KEY `m_rencana_kategori_arus_kas_id` (`m_rencana_kategori_arus_kas_id`);

--
-- Indexes for table `m_rencana_jurnal`
--
ALTER TABLE `m_rencana_jurnal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`),
  ADD KEY `m_rencana_transaksi_id` (`m_rencana_transaksi_id`),
  ADD KEY `m_riwayat_pembayaran_siswa_id` (`m_riwayat_pembayaran_siswa_id`);

--
-- Indexes for table `m_rencana_kategori_arus_kas`
--
ALTER TABLE `m_rencana_kategori_arus_kas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rencana_kategori_laba_rugi`
--
ALTER TABLE `m_rencana_kategori_laba_rugi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rencana_kategori_neraca`
--
ALTER TABLE `m_rencana_kategori_neraca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rencana_kategori_tipe_akun`
--
ALTER TABLE `m_rencana_kategori_tipe_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rencana_keuangan`
--
ALTER TABLE `m_rencana_keuangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_rencana_rumus_arus_kas`
--
ALTER TABLE `m_rencana_rumus_arus_kas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rencana_rumus_laba_rugi`
--
ALTER TABLE `m_rencana_rumus_laba_rugi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rencana_rumus_saldo_kas_akhir`
--
ALTER TABLE `m_rencana_rumus_saldo_kas_akhir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rencana_rumus_saldo_kas_awal`
--
ALTER TABLE `m_rencana_rumus_saldo_kas_awal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rencana_transaksi`
--
ALTER TABLE `m_rencana_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_riwayat_pembayaran_siswa`
--
ALTER TABLE `m_riwayat_pembayaran_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_pembayaran_siswa_id` (`m_pembayaran_siswa_id`);

--
-- Indexes for table `m_rombel`
--
ALTER TABLE `m_rombel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_jurusan_id` (`m_jurusan_id`),
  ADD KEY `m_ta_id` (`m_ta_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_rpp`
--
ALTER TABLE `m_rpp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_mata_pelajaran_id` (`m_mata_pelajaran_id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_ta_id` (`m_ta_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`),
  ADD KEY `m_ujian_id` (`m_ujian_id`);

--
-- Indexes for table `m_rumus_keu_akun`
--
ALTER TABLE `m_rumus_keu_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`),
  ADD KEY `m_rencana_keuangan_id` (`m_rencana_keuangan_id`);

--
-- Indexes for table `m_rumus_laba_rugi`
--
ALTER TABLE `m_rumus_laba_rugi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_sanksi_pelanggaran`
--
ALTER TABLE `m_sanksi_pelanggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_sanksi_siswa`
--
ALTER TABLE `m_sanksi_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sanksi_pelanggaran_id` (`m_sanksi_pelanggaran_id`);

--
-- Indexes for table `m_sarpras`
--
ALTER TABLE `m_sarpras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_sekolah`
--
ALTER TABLE `m_sekolah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_sekolah_industri`
--
ALTER TABLE `m_sekolah_industri`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_m_sekolah_industri_m_sekolah` (`m_sekolah_id`),
  ADD KEY `FK_m_sekolah_industri_m_industri` (`m_industri_id`);

--
-- Indexes for table `m_sekolah_industris`
--
ALTER TABLE `m_sekolah_industris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_server`
--
ALTER TABLE `m_server`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_sesbro`
--
ALTER TABLE `m_sesbro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_sikap_rombel`
--
ALTER TABLE `m_sikap_rombel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `Index 5` (`m_predikat_nilai_id`),
  ADD KEY `Index 4` (`m_mata_pelajaran_id`) USING BTREE;

--
-- Indexes for table `m_sikap_siswa`
--
ALTER TABLE `m_sikap_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `Index 3` (`m_ta_id`);

--
-- Indexes for table `m_sikap_siswa_yadika`
--
ALTER TABLE `m_sikap_siswa_yadika`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_ta_id` (`m_ta_id`);

--
-- Indexes for table `m_sikap_sosial`
--
ALTER TABLE `m_sikap_sosial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_sikap_spiritual`
--
ALTER TABLE `m_sikap_spiritual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_slider`
--
ALTER TABLE `m_slider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_soal_kuis`
--
ALTER TABLE `m_soal_kuis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_topik_id` (`m_topik_id`);

--
-- Indexes for table `m_soal_ujian`
--
ALTER TABLE `m_soal_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_status_proyek`
--
ALTER TABLE `m_status_proyek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_surat`
--
ALTER TABLE `m_surat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_surat_keputusan`
--
ALTER TABLE `m_surat_keputusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_ta_id` (`m_ta_id`);

--
-- Indexes for table `m_surat_perusahaan`
--
ALTER TABLE `m_surat_perusahaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tk_perusahaan_sekolah_id` (`tk_perusahaan_sekolah_id`);

--
-- Indexes for table `m_surel`
--
ALTER TABLE `m_surel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_pengirim_id` (`m_user_pengirim_id`),
  ADD KEY `m_user_tujuan_id` (`m_user_tujuan_id`);

--
-- Indexes for table `m_surel_komen`
--
ALTER TABLE `m_surel_komen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_surel_id` (`m_surel_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_ta`
--
ALTER TABLE `m_ta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `m_template_deskripsi`
--
ALTER TABLE `m_template_deskripsi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_mata_pelajaran_id` (`m_mata_pelajaran_id`),
  ADD KEY `m_predikat_nilai_id` (`m_predikat_nilai_id`);

--
-- Indexes for table `m_template_kesukaran_mapel`
--
ALTER TABLE `m_template_kesukaran_mapel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_materi_id` (`m_materi_id`);

--
-- Indexes for table `m_tes_pekerjaan`
--
ALTER TABLE `m_tes_pekerjaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_pekerjaan_id` (`m_pekerjaan_id`);

--
-- Indexes for table `m_timeline`
--
ALTER TABLE `m_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_tugas_id` (`m_tugas_id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_mata_pelajaran_id` (`m_mata_pelajaran_id`);

--
-- Indexes for table `m_timeline_komen`
--
ALTER TABLE `m_timeline_komen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_timeline_id` (`m_timeline_id`);

--
-- Indexes for table `m_topik`
--
ALTER TABLE `m_topik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_bab_id` (`m_bab_id`);

--
-- Indexes for table `m_tugas`
--
ALTER TABLE `m_tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_mata_pelajaran_id` (`m_mata_pelajaran_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `m_ujian_siswa`
--
ALTER TABLE `m_ujian_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_ta_id` (`m_ta_id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_mata_pelajaran_id` (`m_mata_pelajaran_id`),
  ADD KEY `uas_id` (`uas_id`),
  ADD KEY `uts_id` (`uts_id`),
  ADD KEY `us_id` (`us_id`);

--
-- Indexes for table `m_ukk_siswa`
--
ALTER TABLE `m_ukk_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_ta_id` (`m_ta_id`);

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_ta_id` (`m_ta_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regencies`
--
ALTER TABLE `regencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regencies_province_id_index` (`province_id`);

--
-- Indexes for table `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sekolah_grades`
--
ALTER TABLE `sekolah_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sekolah_grades_m_sekolah_id_foreign` (`m_sekolah_id`);

--
-- Indexes for table `test_replication_2`
--
ALTER TABLE `test_replication_2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tk_bank_soal_guru`
--
ALTER TABLE `tk_bank_soal_guru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_ujian_id` (`m_ujian_id`);

--
-- Indexes for table `tk_jadwal_ujian`
--
ALTER TABLE `tk_jadwal_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`),
  ADD KEY `m_jadwal_ujian_id` (`m_jadwal_ujian_id`);

--
-- Indexes for table `tk_jawaban_ujian_siswa`
--
ALTER TABLE `tk_jawaban_ujian_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_soal_ujian_id` (`m_soal_ujian_id`),
  ADD KEY `tk_peserta_ujian_id` (`tk_peserta_ujian_id`),
  ADD KEY `tk_peserta_ujian_ppdb_id` (`tk_peserta_ujian_ppdb_id`);

--
-- Indexes for table `tk_kategori_akun_laba_rugi`
--
ALTER TABLE `tk_kategori_akun_laba_rugi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_keu_kategori_laba_rugi_id` (`m_keu_kategori_laba_rugi_id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`);

--
-- Indexes for table `tk_kategori_akun_neraca`
--
ALTER TABLE `tk_kategori_akun_neraca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_keu_kategori_neraca_id` (`m_keu_kategori_neraca_id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`);

--
-- Indexes for table `tk_kategori_tipe_akun`
--
ALTER TABLE `tk_kategori_tipe_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_keu_kategori_tipe_akun_id` (`m_keu_kategori_tipe_akun_id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`);

--
-- Indexes for table `tk_mapel_rapor`
--
ALTER TABLE `tk_mapel_rapor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_mata_pelajaran_id` (`m_mata_pelajaran_id`),
  ADD KEY `m_kategori_mapel_id` (`m_kategori_mapel_id`),
  ADD KEY `Index 4` (`m_predikat_nilai_id`);

--
-- Indexes for table `tk_materi_kesimpulan`
--
ALTER TABLE `tk_materi_kesimpulan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_topik_id` (`m_topik_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `tk_materi_rombel`
--
ALTER TABLE `tk_materi_rombel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_materi_id` (`m_materi_id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`);

--
-- Indexes for table `tk_pekerjaan_proyek_aktivitas`
--
ALTER TABLE `tk_pekerjaan_proyek_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_pekerjaan_proyek_id` (`m_pekerjaan_proyek_id`);

--
-- Indexes for table `tk_pembayaran_rombel`
--
ALTER TABLE `tk_pembayaran_rombel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_pembayaran_id` (`m_pembayaran_id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `tk_perpus_aktivitas`
--
ALTER TABLE `tk_perpus_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_perpus_id` (`m_perpus_id`);

--
-- Indexes for table `tk_perpus_mapel`
--
ALTER TABLE `tk_perpus_mapel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_jurusan_id` (`m_jurusan_id`),
  ADD KEY `m_mata_pelajaran_id` (`m_mata_pelajaran_id`),
  ADD KEY `m_perpus_id` (`m_perpus_id`);

--
-- Indexes for table `tk_perpus_tag`
--
ALTER TABLE `tk_perpus_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_perpus_tag_id` (`m_perpus_tag_id`),
  ADD KEY `m_perpus_id` (`m_perpus_id`);

--
-- Indexes for table `tk_perusahaan_sekolah`
--
ALTER TABLE `tk_perusahaan_sekolah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_perusahaan_id` (`m_perusahaan_id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`);

--
-- Indexes for table `tk_peserta_ujian`
--
ALTER TABLE `tk_peserta_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `tk_jadwal_ujian_id` (`tk_jadwal_ujian_id`),
  ADD KEY `m_tugas_id` (`m_tugas_id`),
  ADD KEY `tk_timeline_id` (`tk_timeline_id`),
  ADD KEY `tk_siswa_ujian_id` (`tk_siswa_ujian_id`);

--
-- Indexes for table `tk_peserta_ujian_ppdb`
--
ALTER TABLE `tk_peserta_ujian_ppdb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_jadwal_ppdb_id` (`m_jadwal_ppdb_id`),
  ADD KEY `m_pendaftar_ppdb_id` (`m_pendaftar_ppdb_id`),
  ADD KEY `tk_peserta_ujian_id` (`tk_peserta_ujian_id`);

--
-- Indexes for table `tk_post`
--
ALTER TABLE `tk_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_post_id` (`m_post_id`),
  ADD KEY `m_kategori_id` (`m_kategori_id`);

--
-- Indexes for table `tk_rekap_nilai`
--
ALTER TABLE `tk_rekap_nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_rekap_rombel_id` (`m_rekap_rombel_id`);

--
-- Indexes for table `tk_rencana_kategori_laba`
--
ALTER TABLE `tk_rencana_kategori_laba`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_rencana_kategori_laba_rugi_id` (`m_rencana_kategori_laba_rugi_id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`);

--
-- Indexes for table `tk_rencana_kategori_neraca`
--
ALTER TABLE `tk_rencana_kategori_neraca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_rencana_kategori_neraca_id` (`m_rencana_kategori_neraca_id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`);

--
-- Indexes for table `tk_rencana_kategori_tipe`
--
ALTER TABLE `tk_rencana_kategori_tipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_rencana_kategori_tipe_akun_id` (`m_rencana_kategori_tipe_akun_id`),
  ADD KEY `m_keu_akun_id` (`m_keu_akun_id`);

--
-- Indexes for table `tk_server_sekolah`
--
ALTER TABLE `tk_server_sekolah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_sekolah_id` (`m_sekolah_id`),
  ADD KEY `m_server_id` (`m_server_id`);

--
-- Indexes for table `tk_siswa_pelanggaran`
--
ALTER TABLE `tk_siswa_pelanggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_pelanggaran_id` (`m_pelanggaran_id`),
  ADD KEY `m_user_pelapor_id` (`m_user_pelapor_id`);

--
-- Indexes for table `tk_siswa_ujian`
--
ALTER TABLE `tk_siswa_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_rombel_id` (`m_rombel_id`),
  ADD KEY `m_jadwal_ujian_id` (`m_jadwal_ujian_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `tk_soal_tugas`
--
ALTER TABLE `tk_soal_tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_tugas_id` (`m_tugas_id`),
  ADD KEY `m_soal_ujian_id` (`m_soal_ujian_id`);

--
-- Indexes for table `tk_soal_ujian`
--
ALTER TABLE `tk_soal_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_ujian_id` (`m_ujian_id`),
  ADD KEY `m_soal_ujian_id` (`m_soal_ujian_id`);

--
-- Indexes for table `tk_status_pekerjaan`
--
ALTER TABLE `tk_status_pekerjaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_pekerjaan_id` (`m_pekerjaan_id`);

--
-- Indexes for table `tk_surat_keputusan_user`
--
ALTER TABLE `tk_surat_keputusan_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_surat_keputusan_id` (`m_surat_keputusan_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `tk_timeline`
--
ALTER TABLE `tk_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_timeline_id` (`m_timeline_id`);

--
-- Indexes for table `tk_timeline_komen`
--
ALTER TABLE `tk_timeline_komen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tk_timeline_id` (`tk_timeline_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `tk_timeline_topik`
--
ALTER TABLE `tk_timeline_topik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_timeline_id` (`m_timeline_id`),
  ADD KEY `m_topik_id` (`m_topik_id`);

--
-- Indexes for table `tk_tipe_surel`
--
ALTER TABLE `tk_tipe_surel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_surel_id` (`m_surel_id`),
  ADD KEY `m_user_id` (`m_user_id`),
  ADD KEY `m_folder_arsip_id` (`m_folder_arsip_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indexes for table `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `villages_district_id_index` (`district_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaderboards`
--
ALTER TABLE `leaderboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lost_found`
--
ALTER TABLE `lost_found`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `lost_found_notifs`
--
ALTER TABLE `lost_found_notifs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `market_places`
--
ALTER TABLE `market_places`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_absen`
--
ALTER TABLE `m_absen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_absen_belum_terdaftar`
--
ALTER TABLE `m_absen_belum_terdaftar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_acara_perusahaan`
--
ALTER TABLE `m_acara_perusahaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_alumni`
--
ALTER TABLE `m_alumni`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_alur_ppdb`
--
ALTER TABLE `m_alur_ppdb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_anggota_ekskul`
--
ALTER TABLE `m_anggota_ekskul`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_anggota_proyek`
--
ALTER TABLE `m_anggota_proyek`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1197;

--
-- AUTO_INCREMENT for table `m_anggota_proyek_role`
--
ALTER TABLE `m_anggota_proyek_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_anggota_rombel`
--
ALTER TABLE `m_anggota_rombel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_bab`
--
ALTER TABLE `m_bab`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17629;

--
-- AUTO_INCREMENT for table `m_bab_peraturan`
--
ALTER TABLE `m_bab_peraturan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `m_barang`
--
ALTER TABLE `m_barang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13191;

--
-- AUTO_INCREMENT for table `m_bobot_nilai`
--
ALTER TABLE `m_bobot_nilai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_broadcast`
--
ALTER TABLE `m_broadcast`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_bukti_pelaksanaan_sanksi`
--
ALTER TABLE `m_bukti_pelaksanaan_sanksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_buku`
--
ALTER TABLE `m_buku`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT for table `m_buku_tamu`
--
ALTER TABLE `m_buku_tamu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_camera`
--
ALTER TABLE `m_camera`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_diskon_pendaftar`
--
ALTER TABLE `m_diskon_pendaftar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_disposisi`
--
ALTER TABLE `m_disposisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `m_ditugaskan_pekerjaan`
--
ALTER TABLE `m_ditugaskan_pekerjaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_dokumen_pembayaran_sekolah`
--
ALTER TABLE `m_dokumen_pembayaran_sekolah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_ekstrakurikuler`
--
ALTER TABLE `m_ekstrakurikuler`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `m_fitur_sekolah`
--
ALTER TABLE `m_fitur_sekolah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_folder_arsip`
--
ALTER TABLE `m_folder_arsip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_gelombang_ppdb`
--
ALTER TABLE `m_gelombang_ppdb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `m_guru_jurusan`
--
ALTER TABLE `m_guru_jurusan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_histori_aktivitas`
--
ALTER TABLE `m_histori_aktivitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_history_jobs`
--
ALTER TABLE `m_history_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_industri`
--
ALTER TABLE `m_industri`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_informasi_gelombang`
--
ALTER TABLE `m_informasi_gelombang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `m_informasi_jalur_ppdb`
--
ALTER TABLE `m_informasi_jalur_ppdb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_informasi_jurusan`
--
ALTER TABLE `m_informasi_jurusan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_informasi_pekerjaan`
--
ALTER TABLE `m_informasi_pekerjaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_informasi_perusahaan`
--
ALTER TABLE `m_informasi_perusahaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_informasi_sekolah`
--
ALTER TABLE `m_informasi_sekolah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_jadwal_konsultasi`
--
ALTER TABLE `m_jadwal_konsultasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_jadwal_mengajar`
--
ALTER TABLE `m_jadwal_mengajar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `m_jadwal_ppdb`
--
ALTER TABLE `m_jadwal_ppdb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `m_jadwal_ujian`
--
ALTER TABLE `m_jadwal_ujian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59924;

--
-- AUTO_INCREMENT for table `m_jalur_ppdb`
--
ALTER TABLE `m_jalur_ppdb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `m_jam_mengajar`
--
ALTER TABLE `m_jam_mengajar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1716848;

--
-- AUTO_INCREMENT for table `m_jurusan`
--
ALTER TABLE `m_jurusan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11488;

--
-- AUTO_INCREMENT for table `m_kalender_pendidikan`
--
ALTER TABLE `m_kalender_pendidikan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_kategori`
--
ALTER TABLE `m_kategori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_kategori_mapel`
--
ALTER TABLE `m_kategori_mapel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32214;

--
-- AUTO_INCREMENT for table `m_kategori_pekerjaan`
--
ALTER TABLE `m_kategori_pekerjaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1260;

--
-- AUTO_INCREMENT for table `m_kategori_pelanggaran`
--
ALTER TABLE `m_kategori_pelanggaran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `m_kegiatan`
--
ALTER TABLE `m_kegiatan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `m_kegiatan_galeri`
--
ALTER TABLE `m_kegiatan_galeri`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_kegiatan_kalender`
--
ALTER TABLE `m_kegiatan_kalender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keterangan_pkl`
--
ALTER TABLE `m_keterangan_pkl`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keterangan_rapor`
--
ALTER TABLE `m_keterangan_rapor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keu_aktivitas_transaksi`
--
ALTER TABLE `m_keu_aktivitas_transaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keu_akun`
--
ALTER TABLE `m_keu_akun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55146;

--
-- AUTO_INCREMENT for table `m_keu_jurnal`
--
ALTER TABLE `m_keu_jurnal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keu_kategori_arus_kas`
--
ALTER TABLE `m_keu_kategori_arus_kas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `m_keu_kategori_laba_rugi`
--
ALTER TABLE `m_keu_kategori_laba_rugi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `m_keu_kategori_neraca`
--
ALTER TABLE `m_keu_kategori_neraca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `m_keu_kategori_tipe_akun`
--
ALTER TABLE `m_keu_kategori_tipe_akun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `m_keu_penyusutan_transaksi`
--
ALTER TABLE `m_keu_penyusutan_transaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `m_keu_rumus_arus_kas`
--
ALTER TABLE `m_keu_rumus_arus_kas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keu_rumus_penyusutan`
--
ALTER TABLE `m_keu_rumus_penyusutan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keu_rumus_saldo_kas_akhir`
--
ALTER TABLE `m_keu_rumus_saldo_kas_akhir`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keu_rumus_saldo_kas_awal`
--
ALTER TABLE `m_keu_rumus_saldo_kas_awal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keu_template_akun`
--
ALTER TABLE `m_keu_template_akun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_keu_template_analisis`
--
ALTER TABLE `m_keu_template_analisis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_keu_transaksi`
--
ALTER TABLE `m_keu_transaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=876;

--
-- AUTO_INCREMENT for table `m_kontak`
--
ALTER TABLE `m_kontak`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_kotak_masuk`
--
ALTER TABLE `m_kotak_masuk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_kotak_masuk_komen`
--
ALTER TABLE `m_kotak_masuk_komen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_label_kalender`
--
ALTER TABLE `m_label_kalender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3102;

--
-- AUTO_INCREMENT for table `m_laporan_prakerin`
--
ALTER TABLE `m_laporan_prakerin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_lokasi`
--
ALTER TABLE `m_lokasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT for table `m_lowongans`
--
ALTER TABLE `m_lowongans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_mata_pelajaran`
--
ALTER TABLE `m_mata_pelajaran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108836;

--
-- AUTO_INCREMENT for table `m_materi`
--
ALTER TABLE `m_materi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97198;

--
-- AUTO_INCREMENT for table `m_mou_perusahaan`
--
ALTER TABLE `m_mou_perusahaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_mutasi`
--
ALTER TABLE `m_mutasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_notifikasi`
--
ALTER TABLE `m_notifikasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_notifikasi_terjadwal`
--
ALTER TABLE `m_notifikasi_terjadwal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_pasal_peraturan`
--
ALTER TABLE `m_pasal_peraturan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_pekerjaan`
--
ALTER TABLE `m_pekerjaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_pekerjaan_pengumuman`
--
ALTER TABLE `m_pekerjaan_pengumuman`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_pekerjaan_proyek`
--
ALTER TABLE `m_pekerjaan_proyek`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=619;

--
-- AUTO_INCREMENT for table `m_pelanggaran`
--
ALTER TABLE `m_pelanggaran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=763;

--
-- AUTO_INCREMENT for table `m_pelaporan_disposisi`
--
ALTER TABLE `m_pelaporan_disposisi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_pembayaran`
--
ALTER TABLE `m_pembayaran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1951;

--
-- AUTO_INCREMENT for table `m_pembayaran_kategori`
--
ALTER TABLE `m_pembayaran_kategori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_pembayaran_sekolah`
--
ALTER TABLE `m_pembayaran_sekolah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `m_pembayaran_siswa`
--
ALTER TABLE `m_pembayaran_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133998;

--
-- AUTO_INCREMENT for table `m_pendaftar_ppdb`
--
ALTER TABLE `m_pendaftar_ppdb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5992;

--
-- AUTO_INCREMENT for table `m_penerimaan_perusahaan`
--
ALTER TABLE `m_penerimaan_perusahaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `m_penerimaan_siswa`
--
ALTER TABLE `m_penerimaan_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_penghargaan`
--
ALTER TABLE `m_penghargaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `m_peringatan_ujian_siswa`
--
ALTER TABLE `m_peringatan_ujian_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_perpus`
--
ALTER TABLE `m_perpus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=447;

--
-- AUTO_INCREMENT for table `m_perpus_komen`
--
ALTER TABLE `m_perpus_komen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_perpus_tag`
--
ALTER TABLE `m_perpus_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `m_pertemuan_bk`
--
ALTER TABLE `m_pertemuan_bk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `m_perusahaan`
--
ALTER TABLE `m_perusahaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `m_post`
--
ALTER TABLE `m_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1179;

--
-- AUTO_INCREMENT for table `m_prakerin_siswa`
--
ALTER TABLE `m_prakerin_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_praktik_kerja`
--
ALTER TABLE `m_praktik_kerja`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_predikat_nilai`
--
ALTER TABLE `m_predikat_nilai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12728;

--
-- AUTO_INCREMENT for table `m_prestasi`
--
ALTER TABLE `m_prestasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_profil_user`
--
ALTER TABLE `m_profil_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_proyek`
--
ALTER TABLE `m_proyek`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `m_proyek_forum`
--
ALTER TABLE `m_proyek_forum`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `m_proyek_forum_komen`
--
ALTER TABLE `m_proyek_forum_komen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rapor_ekskul`
--
ALTER TABLE `m_rapor_ekskul`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_registrasi_akun`
--
ALTER TABLE `m_registrasi_akun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rekap`
--
ALTER TABLE `m_rekap`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14131;

--
-- AUTO_INCREMENT for table `m_rekap_rombel`
--
ALTER TABLE `m_rekap_rombel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31274;

--
-- AUTO_INCREMENT for table `m_rek_sekolah`
--
ALTER TABLE `m_rek_sekolah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3579;

--
-- AUTO_INCREMENT for table `m_rencana_aktivitas_trx`
--
ALTER TABLE `m_rencana_aktivitas_trx`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rencana_jurnal`
--
ALTER TABLE `m_rencana_jurnal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rencana_kategori_arus_kas`
--
ALTER TABLE `m_rencana_kategori_arus_kas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `m_rencana_kategori_laba_rugi`
--
ALTER TABLE `m_rencana_kategori_laba_rugi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `m_rencana_kategori_neraca`
--
ALTER TABLE `m_rencana_kategori_neraca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `m_rencana_kategori_tipe_akun`
--
ALTER TABLE `m_rencana_kategori_tipe_akun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `m_rencana_keuangan`
--
ALTER TABLE `m_rencana_keuangan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `m_rencana_rumus_arus_kas`
--
ALTER TABLE `m_rencana_rumus_arus_kas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rencana_rumus_laba_rugi`
--
ALTER TABLE `m_rencana_rumus_laba_rugi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rencana_rumus_saldo_kas_akhir`
--
ALTER TABLE `m_rencana_rumus_saldo_kas_akhir`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rencana_rumus_saldo_kas_awal`
--
ALTER TABLE `m_rencana_rumus_saldo_kas_awal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rencana_transaksi`
--
ALTER TABLE `m_rencana_transaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=973;

--
-- AUTO_INCREMENT for table `m_riwayat_pembayaran_siswa`
--
ALTER TABLE `m_riwayat_pembayaran_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46517;

--
-- AUTO_INCREMENT for table `m_rombel`
--
ALTER TABLE `m_rombel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54267;

--
-- AUTO_INCREMENT for table `m_rpp`
--
ALTER TABLE `m_rpp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rumus_keu_akun`
--
ALTER TABLE `m_rumus_keu_akun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_rumus_laba_rugi`
--
ALTER TABLE `m_rumus_laba_rugi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_sanksi_pelanggaran`
--
ALTER TABLE `m_sanksi_pelanggaran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `m_sanksi_siswa`
--
ALTER TABLE `m_sanksi_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `m_sarpras`
--
ALTER TABLE `m_sarpras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_sekolah`
--
ALTER TABLE `m_sekolah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12381;

--
-- AUTO_INCREMENT for table `m_sekolah_industri`
--
ALTER TABLE `m_sekolah_industri`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_sekolah_industris`
--
ALTER TABLE `m_sekolah_industris`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_server`
--
ALTER TABLE `m_server`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_sesbro`
--
ALTER TABLE `m_sesbro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_sikap_rombel`
--
ALTER TABLE `m_sikap_rombel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_sikap_siswa`
--
ALTER TABLE `m_sikap_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_sikap_siswa_yadika`
--
ALTER TABLE `m_sikap_siswa_yadika`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_sikap_sosial`
--
ALTER TABLE `m_sikap_sosial`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_sikap_spiritual`
--
ALTER TABLE `m_sikap_spiritual`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_slider`
--
ALTER TABLE `m_slider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_soal_kuis`
--
ALTER TABLE `m_soal_kuis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_soal_ujian`
--
ALTER TABLE `m_soal_ujian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1075312;

--
-- AUTO_INCREMENT for table `m_status_proyek`
--
ALTER TABLE `m_status_proyek`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_surat`
--
ALTER TABLE `m_surat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1171;

--
-- AUTO_INCREMENT for table `m_surat_keputusan`
--
ALTER TABLE `m_surat_keputusan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `m_surat_perusahaan`
--
ALTER TABLE `m_surat_perusahaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_surel`
--
ALTER TABLE `m_surel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_surel_komen`
--
ALTER TABLE `m_surel_komen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_ta`
--
ALTER TABLE `m_ta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9291;

--
-- AUTO_INCREMENT for table `m_template_deskripsi`
--
ALTER TABLE `m_template_deskripsi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_template_kesukaran_mapel`
--
ALTER TABLE `m_template_kesukaran_mapel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_tes_pekerjaan`
--
ALTER TABLE `m_tes_pekerjaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_timeline`
--
ALTER TABLE `m_timeline`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147252;

--
-- AUTO_INCREMENT for table `m_timeline_komen`
--
ALTER TABLE `m_timeline_komen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_topik`
--
ALTER TABLE `m_topik`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27874;

--
-- AUTO_INCREMENT for table `m_tugas`
--
ALTER TABLE `m_tugas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46418;

--
-- AUTO_INCREMENT for table `m_ujian`
--
ALTER TABLE `m_ujian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55603;

--
-- AUTO_INCREMENT for table `m_ujian_siswa`
--
ALTER TABLE `m_ujian_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_ukk_siswa`
--
ALTER TABLE `m_ukk_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2929092;

--
-- AUTO_INCREMENT for table `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116164;

--
-- AUTO_INCREMENT for table `sekolah_grades`
--
ALTER TABLE `sekolah_grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_replication_2`
--
ALTER TABLE `test_replication_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_bank_soal_guru`
--
ALTER TABLE `tk_bank_soal_guru`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_jadwal_ujian`
--
ALTER TABLE `tk_jadwal_ujian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149620;

--
-- AUTO_INCREMENT for table `tk_jawaban_ujian_siswa`
--
ALTER TABLE `tk_jawaban_ujian_siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_kategori_akun_laba_rugi`
--
ALTER TABLE `tk_kategori_akun_laba_rugi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_kategori_akun_neraca`
--
ALTER TABLE `tk_kategori_akun_neraca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_kategori_tipe_akun`
--
ALTER TABLE `tk_kategori_tipe_akun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_mapel_rapor`
--
ALTER TABLE `tk_mapel_rapor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_materi_kesimpulan`
--
ALTER TABLE `tk_materi_kesimpulan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_materi_rombel`
--
ALTER TABLE `tk_materi_rombel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_pekerjaan_proyek_aktivitas`
--
ALTER TABLE `tk_pekerjaan_proyek_aktivitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_pembayaran_rombel`
--
ALTER TABLE `tk_pembayaran_rombel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7904;

--
-- AUTO_INCREMENT for table `tk_perpus_aktivitas`
--
ALTER TABLE `tk_perpus_aktivitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_perpus_mapel`
--
ALTER TABLE `tk_perpus_mapel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_perpus_tag`
--
ALTER TABLE `tk_perpus_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_perusahaan_sekolah`
--
ALTER TABLE `tk_perusahaan_sekolah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `tk_peserta_ujian`
--
ALTER TABLE `tk_peserta_ujian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2631226;

--
-- AUTO_INCREMENT for table `tk_peserta_ujian_ppdb`
--
ALTER TABLE `tk_peserta_ujian_ppdb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3404;

--
-- AUTO_INCREMENT for table `tk_post`
--
ALTER TABLE `tk_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_rekap_nilai`
--
ALTER TABLE `tk_rekap_nilai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=963056;

--
-- AUTO_INCREMENT for table `tk_rencana_kategori_laba`
--
ALTER TABLE `tk_rencana_kategori_laba`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_rencana_kategori_neraca`
--
ALTER TABLE `tk_rencana_kategori_neraca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_rencana_kategori_tipe`
--
ALTER TABLE `tk_rencana_kategori_tipe`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_server_sekolah`
--
ALTER TABLE `tk_server_sekolah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_siswa_pelanggaran`
--
ALTER TABLE `tk_siswa_pelanggaran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_siswa_ujian`
--
ALTER TABLE `tk_siswa_ujian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_soal_tugas`
--
ALTER TABLE `tk_soal_tugas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_soal_ujian`
--
ALTER TABLE `tk_soal_ujian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_status_pekerjaan`
--
ALTER TABLE `tk_status_pekerjaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_surat_keputusan_user`
--
ALTER TABLE `tk_surat_keputusan_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_timeline`
--
ALTER TABLE `tk_timeline`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4562333;

--
-- AUTO_INCREMENT for table `tk_timeline_komen`
--
ALTER TABLE `tk_timeline_komen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_timeline_topik`
--
ALTER TABLE `tk_timeline_topik`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_tipe_surel`
--
ALTER TABLE `tk_tipe_surel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_regency_id_foreign` FOREIGN KEY (`regency_id`) REFERENCES `regencies` (`id`);

--
-- Constraints for table `leaderboards`
--
ALTER TABLE `leaderboards`
  ADD CONSTRAINT `leaderboards_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `market_places`
--
ALTER TABLE `market_places`
  ADD CONSTRAINT `market_places_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `market_places_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_absen`
--
ALTER TABLE `m_absen`
  ADD CONSTRAINT `m_absen_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_absen_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_absen_belum_terdaftar`
--
ALTER TABLE `m_absen_belum_terdaftar`
  ADD CONSTRAINT `m_absen_belum_terdaftar_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_acara_perusahaan`
--
ALTER TABLE `m_acara_perusahaan`
  ADD CONSTRAINT `m_acara_perusahaan_m_perusahaan_id_foreign` FOREIGN KEY (`m_perusahaan_id`) REFERENCES `m_perusahaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_alumni`
--
ALTER TABLE `m_alumni`
  ADD CONSTRAINT `m_alumni_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_alur_ppdb`
--
ALTER TABLE `m_alur_ppdb`
  ADD CONSTRAINT `m_alur_ppdb_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_alur_ppdb_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_anggota_ekskul`
--
ALTER TABLE `m_anggota_ekskul`
  ADD CONSTRAINT `m_anggota_ekskul_m_ekstrakurikuler_id_foreign` FOREIGN KEY (`m_ekstrakurikuler_id`) REFERENCES `m_ekstrakurikuler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_anggota_ekskul_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_anggota_proyek`
--
ALTER TABLE `m_anggota_proyek`
  ADD CONSTRAINT `m_anggota_proyek_m_proyek_id_foreign` FOREIGN KEY (`m_proyek_id`) REFERENCES `m_proyek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_anggota_proyek_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_anggota_proyek_role`
--
ALTER TABLE `m_anggota_proyek_role`
  ADD CONSTRAINT `m_anggota_proyek_role_m_anggota_proyek_id_foreign` FOREIGN KEY (`m_anggota_proyek_id`) REFERENCES `m_anggota_proyek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_anggota_rombel`
--
ALTER TABLE `m_anggota_rombel`
  ADD CONSTRAINT `m_anggota_rombel_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_anggota_rombel_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_bab`
--
ALTER TABLE `m_bab`
  ADD CONSTRAINT `m_bab_m_materi_id_foreign` FOREIGN KEY (`m_materi_id`) REFERENCES `m_materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_bab_peraturan`
--
ALTER TABLE `m_bab_peraturan`
  ADD CONSTRAINT `m_bab_peraturan_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD CONSTRAINT `FK_m_barang_m_sekolah` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_barang_m_lokasi_id_foreign` FOREIGN KEY (`m_lokasi_id`) REFERENCES `m_lokasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_bobot_nilai`
--
ALTER TABLE `m_bobot_nilai`
  ADD CONSTRAINT `m_bobot_nilai_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_broadcast`
--
ALTER TABLE `m_broadcast`
  ADD CONSTRAINT `m_broadcast_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_broadcast_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_bukti_pelaksanaan_sanksi`
--
ALTER TABLE `m_bukti_pelaksanaan_sanksi`
  ADD CONSTRAINT `m_bukti_pelaksanaan_sanksi_m_sanksi_siswa_id_foreign` FOREIGN KEY (`m_sanksi_siswa_id`) REFERENCES `m_sanksi_siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_buku_tamu`
--
ALTER TABLE `m_buku_tamu`
  ADD CONSTRAINT `m_buku_tamu_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_camera`
--
ALTER TABLE `m_camera`
  ADD CONSTRAINT `m_camera_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_diskon_pendaftar`
--
ALTER TABLE `m_diskon_pendaftar`
  ADD CONSTRAINT `m_diskon_pendaftar_m_pendaftar_ppdb_id_foreign` FOREIGN KEY (`m_pendaftar_ppdb_id`) REFERENCES `m_pendaftar_ppdb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_disposisi`
--
ALTER TABLE `m_disposisi`
  ADD CONSTRAINT `m_disposisi_m_surat_id_foreign` FOREIGN KEY (`m_surat_id`) REFERENCES `m_surat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_disposisi_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_ditugaskan_pekerjaan`
--
ALTER TABLE `m_ditugaskan_pekerjaan`
  ADD CONSTRAINT `m_ditugaskan_pekerjaan_m_anggota_proyek_id_foreign` FOREIGN KEY (`m_anggota_proyek_id`) REFERENCES `m_anggota_proyek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_ditugaskan_pekerjaan_m_pekerjaan_proyek_id_foreign` FOREIGN KEY (`m_pekerjaan_proyek_id`) REFERENCES `m_pekerjaan_proyek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_dokumen_pembayaran_sekolah`
--
ALTER TABLE `m_dokumen_pembayaran_sekolah`
  ADD CONSTRAINT `m_dokumen_pembayaran_sekolah_m_pembayaran_sekolah_id_foreign` FOREIGN KEY (`m_pembayaran_sekolah_id`) REFERENCES `m_pembayaran_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_ekstrakurikuler`
--
ALTER TABLE `m_ekstrakurikuler`
  ADD CONSTRAINT `m_ekstrakurikuler_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_fitur_sekolah`
--
ALTER TABLE `m_fitur_sekolah`
  ADD CONSTRAINT `m_fitur_sekolah_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_folder_arsip`
--
ALTER TABLE `m_folder_arsip`
  ADD CONSTRAINT `m_folder_arsip_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_gelombang_ppdb`
--
ALTER TABLE `m_gelombang_ppdb`
  ADD CONSTRAINT `m_gelombang_ppdb_m_jalur_ppdb_id_foreign` FOREIGN KEY (`m_jalur_ppdb_id`) REFERENCES `m_jalur_ppdb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_gelombang_ppdb_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_gelombang_ppdb_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_guru_jurusan`
--
ALTER TABLE `m_guru_jurusan`
  ADD CONSTRAINT `m_guru_jurusan_m_jurusan_id_foreign` FOREIGN KEY (`m_jurusan_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_guru_jurusan_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_histori_aktivitas`
--
ALTER TABLE `m_histori_aktivitas`
  ADD CONSTRAINT `m_histori_aktivitas_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_histori_aktivitas_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_history_jobs`
--
ALTER TABLE `m_history_jobs`
  ADD CONSTRAINT `m_history_jobs_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_history_jobs_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_industri`
--
ALTER TABLE `m_industri`
  ADD CONSTRAINT `m_industri_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_informasi_gelombang`
--
ALTER TABLE `m_informasi_gelombang`
  ADD CONSTRAINT `m_informasi_gelombang_m_gelombang_ppdb_id_foreign` FOREIGN KEY (`m_gelombang_ppdb_id`) REFERENCES `m_gelombang_ppdb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_informasi_jalur_ppdb`
--
ALTER TABLE `m_informasi_jalur_ppdb`
  ADD CONSTRAINT `m_informasi_jalur_ppdb_m_jalur_ppdb_id_foreign` FOREIGN KEY (`m_jalur_ppdb_id`) REFERENCES `m_jalur_ppdb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_informasi_jurusan`
--
ALTER TABLE `m_informasi_jurusan`
  ADD CONSTRAINT `m_informasi_jurusan_m_jurusan_id_foreign` FOREIGN KEY (`m_jurusan_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_informasi_pekerjaan`
--
ALTER TABLE `m_informasi_pekerjaan`
  ADD CONSTRAINT `m_informasi_pekerjaan_m_pekerjaan_id_foreign` FOREIGN KEY (`m_pekerjaan_id`) REFERENCES `m_pekerjaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_informasi_perusahaan`
--
ALTER TABLE `m_informasi_perusahaan`
  ADD CONSTRAINT `m_informasi_perusahaan_m_perusahaan_id_foreign` FOREIGN KEY (`m_perusahaan_id`) REFERENCES `m_perusahaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_informasi_sekolah`
--
ALTER TABLE `m_informasi_sekolah`
  ADD CONSTRAINT `m_informasi_sekolah_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_jadwal_konsultasi`
--
ALTER TABLE `m_jadwal_konsultasi`
  ADD CONSTRAINT `m_jadwal_konsultasi_m_pertemuan_bk_id_foreign` FOREIGN KEY (`m_pertemuan_bk_id`) REFERENCES `m_pertemuan_bk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_jadwal_mengajar`
--
ALTER TABLE `m_jadwal_mengajar`
  ADD CONSTRAINT `m_jadwal_mengajar_m_jam_mengajar_id_foreign` FOREIGN KEY (`m_jam_mengajar_id`) REFERENCES `m_jam_mengajar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_jadwal_mengajar_m_mata_pelajaran_id_foreign` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `m_jadwal_mengajar_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_jadwal_mengajar_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_jadwal_mengajar_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_jadwal_ppdb`
--
ALTER TABLE `m_jadwal_ppdb`
  ADD CONSTRAINT `m_jadwal_ppdb_m_informasi_gelombang_id_foreign` FOREIGN KEY (`m_informasi_gelombang_id`) REFERENCES `m_informasi_gelombang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_jadwal_ppdb_m_ujian_id_foreign` FOREIGN KEY (`m_ujian_id`) REFERENCES `m_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_jadwal_ppdb_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_jadwal_ujian`
--
ALTER TABLE `m_jadwal_ujian`
  ADD CONSTRAINT `m_jadwal_ujian_m_ujian_id_foreign` FOREIGN KEY (`m_ujian_id`) REFERENCES `m_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_jadwal_ujian_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_jalur_ppdb`
--
ALTER TABLE `m_jalur_ppdb`
  ADD CONSTRAINT `m_jalur_ppdb_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_jam_mengajar`
--
ALTER TABLE `m_jam_mengajar`
  ADD CONSTRAINT `m_jam_mengajar_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_jam_mengajar_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_jurusan`
--
ALTER TABLE `m_jurusan`
  ADD CONSTRAINT `m_jurusan_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kalender_pendidikan`
--
ALTER TABLE `m_kalender_pendidikan`
  ADD CONSTRAINT `m_kalender_pendidikan_m_label_kalender_id_foreign` FOREIGN KEY (`m_label_kalender_id`) REFERENCES `m_label_kalender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_kalender_pendidikan_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD CONSTRAINT `m_kategori_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kategori_mapel`
--
ALTER TABLE `m_kategori_mapel`
  ADD CONSTRAINT `m_kategori_mapel_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kategori_pekerjaan`
--
ALTER TABLE `m_kategori_pekerjaan`
  ADD CONSTRAINT `m_kategori_pekerjaan_m_proyek_id_foreign` FOREIGN KEY (`m_proyek_id`) REFERENCES `m_proyek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kategori_pelanggaran`
--
ALTER TABLE `m_kategori_pelanggaran`
  ADD CONSTRAINT `m_kategori_pelanggaran_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kegiatan`
--
ALTER TABLE `m_kegiatan`
  ADD CONSTRAINT `m_kegiatan_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kegiatan_galeri`
--
ALTER TABLE `m_kegiatan_galeri`
  ADD CONSTRAINT `m_kegiatan_galeri_m_kegiatan_id_foreign` FOREIGN KEY (`m_kegiatan_id`) REFERENCES `m_kegiatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kegiatan_kalender`
--
ALTER TABLE `m_kegiatan_kalender`
  ADD CONSTRAINT `m_kegiatan_kalender_m_label_kalender_id_foreign` FOREIGN KEY (`m_label_kalender_id`) REFERENCES `m_label_kalender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_kegiatan_kalender_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keterangan_pkl`
--
ALTER TABLE `m_keterangan_pkl`
  ADD CONSTRAINT `FK_m_keterangan_pkl_m_perusahaan` FOREIGN KEY (`m_perusahaan_id`) REFERENCES `m_perusahaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_m_keterangan_pkl_m_ta` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keterangan_pkl_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keterangan_rapor`
--
ALTER TABLE `m_keterangan_rapor`
  ADD CONSTRAINT `m_keterangan_rapor_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keterangan_rapor_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_aktivitas_transaksi`
--
ALTER TABLE `m_keu_aktivitas_transaksi`
  ADD CONSTRAINT `m_keu_aktivitas_transaksi_m_keu_kategori_arus_kas_id_foreign` FOREIGN KEY (`m_keu_kategori_arus_kas_id`) REFERENCES `m_keu_kategori_arus_kas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_aktivitas_transaksi_m_keu_kategori_tipe_akun_id_foreign` FOREIGN KEY (`m_keu_kategori_tipe_akun_id`) REFERENCES `m_keu_kategori_tipe_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_aktivitas_transaksi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_akun`
--
ALTER TABLE `m_keu_akun`
  ADD CONSTRAINT `m_keu_akun_m_rek_sekolah_id_foreign` FOREIGN KEY (`m_rek_sekolah_id`) REFERENCES `m_rek_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_akun_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_jurnal`
--
ALTER TABLE `m_keu_jurnal`
  ADD CONSTRAINT `m_keu_jurnal_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_jurnal_m_keu_transaksi_id_foreign` FOREIGN KEY (`m_keu_transaksi_id`) REFERENCES `m_keu_transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_jurnal_m_rencana_transaksi_id_foreign` FOREIGN KEY (`m_rencana_transaksi_id`) REFERENCES `m_rencana_transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_jurnal_m_riwayat_pembayaran_siswa_id_foreign` FOREIGN KEY (`m_riwayat_pembayaran_siswa_id`) REFERENCES `m_riwayat_pembayaran_siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_kategori_arus_kas`
--
ALTER TABLE `m_keu_kategori_arus_kas`
  ADD CONSTRAINT `m_keu_kategori_arus_kas_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_kategori_laba_rugi`
--
ALTER TABLE `m_keu_kategori_laba_rugi`
  ADD CONSTRAINT `FK_m_keu_kategori_laba_rugi_m_sekolah` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_kategori_neraca`
--
ALTER TABLE `m_keu_kategori_neraca`
  ADD CONSTRAINT `m_keu_kategori_neraca_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_kategori_tipe_akun`
--
ALTER TABLE `m_keu_kategori_tipe_akun`
  ADD CONSTRAINT `m_keu_kategori_tipe_akun_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_penyusutan_transaksi`
--
ALTER TABLE `m_keu_penyusutan_transaksi`
  ADD CONSTRAINT `FK_m_keu_penyusutan_transaksi_m_keu_akun` FOREIGN KEY (`m_keu_akun_kredit_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_m_keu_penyusutan_transaksi_m_keu_akun_2` FOREIGN KEY (`m_keu_akun_debet_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_m_keu_penyusutan_transaksi_m_sekolah` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_penyusutan_transaksi_m_keu_transaksi_id_foreign` FOREIGN KEY (`m_keu_transaksi_id`) REFERENCES `m_keu_transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_rumus_arus_kas`
--
ALTER TABLE `m_keu_rumus_arus_kas`
  ADD CONSTRAINT `m_keu_rumus_arus_kas_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_rumus_penyusutan`
--
ALTER TABLE `m_keu_rumus_penyusutan`
  ADD CONSTRAINT `m_keu_rumus_penyusutan_m_keu_akun_akumulasi_id_foreign` FOREIGN KEY (`m_keu_akun_akumulasi_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_rumus_penyusutan_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_rumus_penyusutan_m_keu_akun_penyusustan_id_foreign` FOREIGN KEY (`m_keu_akun_penyusustan_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_rumus_saldo_kas_akhir`
--
ALTER TABLE `m_keu_rumus_saldo_kas_akhir`
  ADD CONSTRAINT `m_keu_rumus_saldo_kas_akhir_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_rumus_saldo_kas_awal`
--
ALTER TABLE `m_keu_rumus_saldo_kas_awal`
  ADD CONSTRAINT `m_keu_rumus_saldo_kas_awal_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_template_akun`
--
ALTER TABLE `m_keu_template_akun`
  ADD CONSTRAINT `m_keu_template_akun_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_template_analisis`
--
ALTER TABLE `m_keu_template_analisis`
  ADD CONSTRAINT `m_keu_template_analisis_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_template_analisis_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_keu_transaksi`
--
ALTER TABLE `m_keu_transaksi`
  ADD CONSTRAINT `m_keu_transaksi_m_barang_id_foreign` FOREIGN KEY (`m_barang_id`) REFERENCES `m_barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_transaksi_m_keu_penyusutan_transaksi_id_foreign` FOREIGN KEY (`m_keu_penyusutan_transaksi_id`) REFERENCES `m_keu_penyusutan_transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_transaksi_m_pembayaran_id_foreign` FOREIGN KEY (`m_pembayaran_id`) REFERENCES `m_pembayaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_transaksi_m_rencana_transaksi_id_foreign` FOREIGN KEY (`m_rencana_transaksi_id`) REFERENCES `m_rencana_transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_keu_transaksi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kontak`
--
ALTER TABLE `m_kontak`
  ADD CONSTRAINT `m_kontak_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kotak_masuk`
--
ALTER TABLE `m_kotak_masuk`
  ADD CONSTRAINT `m_kotak_masuk_m_user_pengirim_id_foreign` FOREIGN KEY (`m_user_pengirim_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_kotak_masuk_m_user_tujuan_id_foreign` FOREIGN KEY (`m_user_tujuan_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_kotak_masuk_komen`
--
ALTER TABLE `m_kotak_masuk_komen`
  ADD CONSTRAINT `m_kotak_masuk_komen_m_kotak_masuk_id_foreign` FOREIGN KEY (`m_kotak_masuk_id`) REFERENCES `m_kotak_masuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_kotak_masuk_komen_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_label_kalender`
--
ALTER TABLE `m_label_kalender`
  ADD CONSTRAINT `m_label_kalender_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_lokasi`
--
ALTER TABLE `m_lokasi`
  ADD CONSTRAINT `m_lokasi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_lowongans`
--
ALTER TABLE `m_lowongans`
  ADD CONSTRAINT `m_lowongans_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_mata_pelajaran`
--
ALTER TABLE `m_mata_pelajaran`
  ADD CONSTRAINT `m_mata_pelajaran_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_mata_pelajaran_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_mata_pelajaran_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_materi`
--
ALTER TABLE `m_materi`
  ADD CONSTRAINT `m_materi_m_jurusan_id_foreign` FOREIGN KEY (`m_jurusan_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_materi_m_mata_pelajaran_id_foreign` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_materi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_materi_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_mou_perusahaan`
--
ALTER TABLE `m_mou_perusahaan`
  ADD CONSTRAINT `m_mou_perusahaan_tk_perusahaan_sekolah_id_foreign` FOREIGN KEY (`tk_perusahaan_sekolah_id`) REFERENCES `tk_perusahaan_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_mutasi`
--
ALTER TABLE `m_mutasi`
  ADD CONSTRAINT `FK_m_mutasi_m_rek_sekolah` FOREIGN KEY (`m_rek_sekolah_id`) REFERENCES `m_rek_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_mutasi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_notifikasi`
--
ALTER TABLE `m_notifikasi`
  ADD CONSTRAINT `m_notifikasi_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pasal_peraturan`
--
ALTER TABLE `m_pasal_peraturan`
  ADD CONSTRAINT `m_pasal_peraturan_m_bab_id_foreign` FOREIGN KEY (`m_bab_id`) REFERENCES `m_bab_peraturan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pekerjaan`
--
ALTER TABLE `m_pekerjaan`
  ADD CONSTRAINT `m_pekerjaan_m_perusahaan_id_foreign` FOREIGN KEY (`m_perusahaan_id`) REFERENCES `m_perusahaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pekerjaan_pengumuman`
--
ALTER TABLE `m_pekerjaan_pengumuman`
  ADD CONSTRAINT `m_pekerjaan_pengumuman_m_pekerjaan_id_foreign` FOREIGN KEY (`m_pekerjaan_id`) REFERENCES `m_pekerjaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pekerjaan_proyek`
--
ALTER TABLE `m_pekerjaan_proyek`
  ADD CONSTRAINT `m_pekerjaan_proyek_m_kategori_pekerjaan_id_foreign` FOREIGN KEY (`m_kategori_pekerjaan_id`) REFERENCES `m_kategori_pekerjaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pelanggaran`
--
ALTER TABLE `m_pelanggaran`
  ADD CONSTRAINT `m_pelanggaran_m_kategori_pelanggaran_id_foreign` FOREIGN KEY (`m_kategori_pelanggaran_id`) REFERENCES `m_kategori_pelanggaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pelaporan_disposisi`
--
ALTER TABLE `m_pelaporan_disposisi`
  ADD CONSTRAINT `m_pelaporan_disposisi_m_disposisi_id_foreign` FOREIGN KEY (`m_disposisi_id`) REFERENCES `m_disposisi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pembayaran`
--
ALTER TABLE `m_pembayaran`
  ADD CONSTRAINT `FK_m_pembayaran_m_rek_sekolah` FOREIGN KEY (`m_rek_sekolah_id`) REFERENCES `m_rek_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pembayaran_m_keu_akun_debet_id_foreign` FOREIGN KEY (`m_keu_akun_debet_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pembayaran_m_keu_akun_kredit_id_foreign` FOREIGN KEY (`m_keu_akun_kredit_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pembayaran_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pembayaran_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pembayaran_kategori`
--
ALTER TABLE `m_pembayaran_kategori`
  ADD CONSTRAINT `m_pembayaran_kategori_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pembayaran_sekolah`
--
ALTER TABLE `m_pembayaran_sekolah`
  ADD CONSTRAINT `m_pembayaran_sekolah_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pembayaran_siswa`
--
ALTER TABLE `m_pembayaran_siswa`
  ADD CONSTRAINT `m_pembayaran_siswa_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pembayaran_siswa_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pembayaran_siswa_tk_pembayaran_rombel_id_foreign` FOREIGN KEY (`tk_pembayaran_rombel_id`) REFERENCES `tk_pembayaran_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pendaftar_ppdb`
--
ALTER TABLE `m_pendaftar_ppdb`
  ADD CONSTRAINT `m_pendaftar_ppdb_konfirmasi_id_foreign` FOREIGN KEY (`konfirmasi_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pendaftar_ppdb_m_gelombang_ppdb_id_foreign` FOREIGN KEY (`m_gelombang_ppdb_id`) REFERENCES `m_gelombang_ppdb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pendaftar_ppdb_m_jurusan_1_id_foreign` FOREIGN KEY (`m_jurusan_1_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pendaftar_ppdb_m_jurusan_2_id_foreign` FOREIGN KEY (`m_jurusan_2_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pendaftar_ppdb_m_jurusan_3_id_foreign` FOREIGN KEY (`m_jurusan_3_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pendaftar_ppdb_m_jurusan_4_id_foreign` FOREIGN KEY (`m_jurusan_4_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pendaftar_ppdb_m_jurusan_5_id_foreign` FOREIGN KEY (`m_jurusan_5_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pendaftar_ppdb_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_penerimaan_perusahaan`
--
ALTER TABLE `m_penerimaan_perusahaan`
  ADD CONSTRAINT `m_penerimaan_perusahaan_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_penerimaan_perusahaan_tk_perusahaan_sekolah_id_foreign` FOREIGN KEY (`tk_perusahaan_sekolah_id`) REFERENCES `tk_perusahaan_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_penerimaan_siswa`
--
ALTER TABLE `m_penerimaan_siswa`
  ADD CONSTRAINT `m_penerimaan_siswa_m_jurusan_id_foreign` FOREIGN KEY (`m_jurusan_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_penerimaan_siswa_m_penerimaan_perusahaan_id_foreign` FOREIGN KEY (`m_penerimaan_perusahaan_id`) REFERENCES `m_penerimaan_perusahaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_penerimaan_siswa_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_penerimaan_siswa_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_penghargaan`
--
ALTER TABLE `m_penghargaan`
  ADD CONSTRAINT `m_penghargaan_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_peringatan_ujian_siswa`
--
ALTER TABLE `m_peringatan_ujian_siswa`
  ADD CONSTRAINT `m_peringatan_ujian_siswa_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_peringatan_ujian_siswa_tk_jadwal_ujian_id_foreign` FOREIGN KEY (`tk_jadwal_ujian_id`) REFERENCES `tk_jadwal_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_peringatan_ujian_siswa_tk_peserta_ujian_id_foreign` FOREIGN KEY (`tk_peserta_ujian_id`) REFERENCES `tk_peserta_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_perpus`
--
ALTER TABLE `m_perpus`
  ADD CONSTRAINT `m_perpus_m_buku_id_foreign` FOREIGN KEY (`m_buku_id`) REFERENCES `m_buku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_perpus_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_perpus_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_perpus_komen`
--
ALTER TABLE `m_perpus_komen`
  ADD CONSTRAINT `m_perpus_komen_m_perpus_id_foreign` FOREIGN KEY (`m_perpus_id`) REFERENCES `m_perpus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_perpus_komen_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_perpus_tag`
--
ALTER TABLE `m_perpus_tag`
  ADD CONSTRAINT `m_perpus_tag_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_perpus_tag_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_pertemuan_bk`
--
ALTER TABLE `m_pertemuan_bk`
  ADD CONSTRAINT `m_pertemuan_bk_m_user_guru_id_foreign` FOREIGN KEY (`m_user_guru_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pertemuan_bk_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_post`
--
ALTER TABLE `m_post`
  ADD CONSTRAINT `m_post_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_post_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_prakerin_siswa`
--
ALTER TABLE `m_prakerin_siswa`
  ADD CONSTRAINT `m_prakerin_siswa_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_prakerin_siswa_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_praktik_kerja`
--
ALTER TABLE `m_praktik_kerja`
  ADD CONSTRAINT `m_praktik_kerja_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_predikat_nilai`
--
ALTER TABLE `m_predikat_nilai`
  ADD CONSTRAINT `m_predikat_nilai_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_prestasi`
--
ALTER TABLE `m_prestasi`
  ADD CONSTRAINT `FK_m_prestasi_m_ta` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_m_prestasi_ss.m_penghargaan` FOREIGN KEY (`tingkat`) REFERENCES `m_penghargaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_prestasi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_prestasi_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_profil_user`
--
ALTER TABLE `m_profil_user`
  ADD CONSTRAINT `m_profil_user_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_proyek`
--
ALTER TABLE `m_proyek`
  ADD CONSTRAINT `m_proyek_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_proyek_m_status_proyek_id_foreign` FOREIGN KEY (`m_status_proyek_id`) REFERENCES `m_status_proyek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_proyek_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_proyek_forum`
--
ALTER TABLE `m_proyek_forum`
  ADD CONSTRAINT `m_proyek_forum_m_proyek_id_foreign` FOREIGN KEY (`m_proyek_id`) REFERENCES `m_proyek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_proyek_forum_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_proyek_forum_komen`
--
ALTER TABLE `m_proyek_forum_komen`
  ADD CONSTRAINT `m_proyek_forum_komen_m_proyek_forum_foreign` FOREIGN KEY (`m_proyek_forum`) REFERENCES `m_proyek_forum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_proyek_forum_komen_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rapor_ekskul`
--
ALTER TABLE `m_rapor_ekskul`
  ADD CONSTRAINT `FK_m_rapor_ekskul_m_ekstrakurikuler` FOREIGN KEY (`m_ekstrakurikuler_id`) REFERENCES `m_ekstrakurikuler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rapor_ekskul_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_registrasi_akun`
--
ALTER TABLE `m_registrasi_akun`
  ADD CONSTRAINT `m_registrasi_akun_sekolah_id_foreign` FOREIGN KEY (`sekolah_id`) REFERENCES `sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rekap`
--
ALTER TABLE `m_rekap`
  ADD CONSTRAINT `m_rekap_m_materi_id_foreign` FOREIGN KEY (`m_materi_id`) REFERENCES `m_materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rekap_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rekap_rombel`
--
ALTER TABLE `m_rekap_rombel`
  ADD CONSTRAINT `m_rekap_rombel_m_rekap_id_foreign` FOREIGN KEY (`m_rekap_id`) REFERENCES `m_rekap` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rekap_rombel_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rekap_rombel_m_tugas_id_foreign` FOREIGN KEY (`m_tugas_id`) REFERENCES `m_tugas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rek_sekolah`
--
ALTER TABLE `m_rek_sekolah`
  ADD CONSTRAINT `m_rek_sekolah_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rek_sekolah_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rek_sekolah_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_aktivitas_trx`
--
ALTER TABLE `m_rencana_aktivitas_trx`
  ADD CONSTRAINT `m_rencana_aktivitas_trx_m_rencana_kategori_arus_kas_id_foreign` FOREIGN KEY (`m_rencana_kategori_arus_kas_id`) REFERENCES `m_rencana_kategori_arus_kas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_aktivitas_trx_m_rencana_kategori_tipe_akun_id_foreign` FOREIGN KEY (`m_rencana_kategori_tipe_akun_id`) REFERENCES `m_rencana_kategori_tipe_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_aktivitas_trx_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_jurnal`
--
ALTER TABLE `m_rencana_jurnal`
  ADD CONSTRAINT `m_rencana_jurnal_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_jurnal_m_rencana_transaksi_id_foreign` FOREIGN KEY (`m_rencana_transaksi_id`) REFERENCES `m_rencana_transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_jurnal_m_riwayat_pembayaran_siswa_id_foreign` FOREIGN KEY (`m_riwayat_pembayaran_siswa_id`) REFERENCES `m_riwayat_pembayaran_siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_kategori_arus_kas`
--
ALTER TABLE `m_rencana_kategori_arus_kas`
  ADD CONSTRAINT `m_rencana_kategori_arus_kas_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_kategori_arus_kas_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_kategori_laba_rugi`
--
ALTER TABLE `m_rencana_kategori_laba_rugi`
  ADD CONSTRAINT `m_rencana_kategori_laba_rugi_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_kategori_laba_rugi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_kategori_neraca`
--
ALTER TABLE `m_rencana_kategori_neraca`
  ADD CONSTRAINT `m_rencana_kategori_neraca_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_kategori_neraca_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_kategori_tipe_akun`
--
ALTER TABLE `m_rencana_kategori_tipe_akun`
  ADD CONSTRAINT `m_rencana_kategori_tipe_akun_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_kategori_tipe_akun_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_keuangan`
--
ALTER TABLE `m_rencana_keuangan`
  ADD CONSTRAINT `m_rencana_keuangan_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_rumus_arus_kas`
--
ALTER TABLE `m_rencana_rumus_arus_kas`
  ADD CONSTRAINT `m_rencana_rumus_arus_kas_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_rumus_arus_kas_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_rumus_laba_rugi`
--
ALTER TABLE `m_rencana_rumus_laba_rugi`
  ADD CONSTRAINT `m_rencana_rumus_laba_rugi_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_rumus_laba_rugi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_rumus_saldo_kas_akhir`
--
ALTER TABLE `m_rencana_rumus_saldo_kas_akhir`
  ADD CONSTRAINT `m_rencana_rumus_saldo_kas_akhir_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_rumus_saldo_kas_akhir_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_rumus_saldo_kas_awal`
--
ALTER TABLE `m_rencana_rumus_saldo_kas_awal`
  ADD CONSTRAINT `m_rencana_rumus_saldo_kas_awal_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_rumus_saldo_kas_awal_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rencana_transaksi`
--
ALTER TABLE `m_rencana_transaksi`
  ADD CONSTRAINT `m_rencana_transaksi_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rencana_transaksi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_riwayat_pembayaran_siswa`
--
ALTER TABLE `m_riwayat_pembayaran_siswa`
  ADD CONSTRAINT `m_riwayat_pembayaran_siswa_m_pembayaran_siswa_id_foreign` FOREIGN KEY (`m_pembayaran_siswa_id`) REFERENCES `m_pembayaran_siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rombel`
--
ALTER TABLE `m_rombel`
  ADD CONSTRAINT `m_rombel_m_jurusan_id_foreign` FOREIGN KEY (`m_jurusan_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rombel_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rombel_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rombel_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rpp`
--
ALTER TABLE `m_rpp`
  ADD CONSTRAINT `m_rpp_m_mata_pelajaran_id_foreign` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rpp_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rpp_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rpp_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rpp_m_ujian_id_foreign` FOREIGN KEY (`m_ujian_id`) REFERENCES `m_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rpp_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rumus_keu_akun`
--
ALTER TABLE `m_rumus_keu_akun`
  ADD CONSTRAINT `m_rumus_keu_akun_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_rumus_keu_akun_m_rencana_keuangan_id_foreign` FOREIGN KEY (`m_rencana_keuangan_id`) REFERENCES `m_rencana_keuangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_rumus_laba_rugi`
--
ALTER TABLE `m_rumus_laba_rugi`
  ADD CONSTRAINT `m_rumus_laba_rugi_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_sanksi_pelanggaran`
--
ALTER TABLE `m_sanksi_pelanggaran`
  ADD CONSTRAINT `m_sanksi_pelanggaran_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_sanksi_siswa`
--
ALTER TABLE `m_sanksi_siswa`
  ADD CONSTRAINT `m_sanksi_siswa_m_sanksi_pelanggaran_id_foreign` FOREIGN KEY (`m_sanksi_pelanggaran_id`) REFERENCES `m_sanksi_pelanggaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_sanksi_siswa_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_sarpras`
--
ALTER TABLE `m_sarpras`
  ADD CONSTRAINT `m_sarpras_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_sekolah_industri`
--
ALTER TABLE `m_sekolah_industri`
  ADD CONSTRAINT `FK_m_sekolah_industri_m_industri` FOREIGN KEY (`m_industri_id`) REFERENCES `m_industri` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_m_sekolah_industri_m_sekolah` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_sikap_rombel`
--
ALTER TABLE `m_sikap_rombel`
  ADD CONSTRAINT `FK_m_sikap_rombel_m_mata_pelajaran` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_m_sikap_rombel_m_predikat_nilai` FOREIGN KEY (`m_predikat_nilai_id`) REFERENCES `m_predikat_nilai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_sikap_rombel_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_sikap_rombel_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_sikap_siswa`
--
ALTER TABLE `m_sikap_siswa`
  ADD CONSTRAINT `FK_m_sikap_siswa_m_ta` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_sikap_siswa_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_sikap_siswa_yadika`
--
ALTER TABLE `m_sikap_siswa_yadika`
  ADD CONSTRAINT `m_sikap_siswa_yadika_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_sikap_siswa_yadika_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_slider`
--
ALTER TABLE `m_slider`
  ADD CONSTRAINT `m_slider_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_soal_kuis`
--
ALTER TABLE `m_soal_kuis`
  ADD CONSTRAINT `m_soal_kuis_m_topik_id_foreign` FOREIGN KEY (`m_topik_id`) REFERENCES `m_topik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_soal_ujian`
--
ALTER TABLE `m_soal_ujian`
  ADD CONSTRAINT `m_soal_ujian_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_surat`
--
ALTER TABLE `m_surat`
  ADD CONSTRAINT `m_surat_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_surat_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_surat_keputusan`
--
ALTER TABLE `m_surat_keputusan`
  ADD CONSTRAINT `m_surat_keputusan_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_surat_keputusan_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_surat_perusahaan`
--
ALTER TABLE `m_surat_perusahaan`
  ADD CONSTRAINT `m_surat_perusahaan_tk_perusahaan_sekolah_id_foreign` FOREIGN KEY (`tk_perusahaan_sekolah_id`) REFERENCES `tk_perusahaan_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_surel`
--
ALTER TABLE `m_surel`
  ADD CONSTRAINT `m_surel_m_user_pengirim_id_foreign` FOREIGN KEY (`m_user_pengirim_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_surel_m_user_tujuan_id_foreign` FOREIGN KEY (`m_user_tujuan_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_surel_komen`
--
ALTER TABLE `m_surel_komen`
  ADD CONSTRAINT `m_surel_komen_m_surel_id_foreign` FOREIGN KEY (`m_surel_id`) REFERENCES `m_surel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_surel_komen_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_ta`
--
ALTER TABLE `m_ta`
  ADD CONSTRAINT `m_ta_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_template_deskripsi`
--
ALTER TABLE `m_template_deskripsi`
  ADD CONSTRAINT `m_template_deskripsi_m_mata_pelajaran_id_foreign` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_template_deskripsi_m_predikat_nilai_id_foreign` FOREIGN KEY (`m_predikat_nilai_id`) REFERENCES `m_predikat_nilai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_template_kesukaran_mapel`
--
ALTER TABLE `m_template_kesukaran_mapel`
  ADD CONSTRAINT `m_template_kesukaran_mapel_m_materi_id_foreign` FOREIGN KEY (`m_materi_id`) REFERENCES `m_materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_tes_pekerjaan`
--
ALTER TABLE `m_tes_pekerjaan`
  ADD CONSTRAINT `m_tes_pekerjaan_m_pekerjaan_id_foreign` FOREIGN KEY (`m_pekerjaan_id`) REFERENCES `m_pekerjaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_timeline`
--
ALTER TABLE `m_timeline`
  ADD CONSTRAINT `m_timeline_m_mata_pelajaran_id_foreign` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_timeline_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_timeline_m_tugas_id_foreign` FOREIGN KEY (`m_tugas_id`) REFERENCES `m_tugas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_timeline_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_timeline_komen`
--
ALTER TABLE `m_timeline_komen`
  ADD CONSTRAINT `m_timeline_komen_m_timeline_id_foreign` FOREIGN KEY (`m_timeline_id`) REFERENCES `m_timeline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_timeline_komen_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_topik`
--
ALTER TABLE `m_topik`
  ADD CONSTRAINT `m_topik_m_bab_id_foreign` FOREIGN KEY (`m_bab_id`) REFERENCES `m_bab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_tugas`
--
ALTER TABLE `m_tugas`
  ADD CONSTRAINT `m_tugas_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD CONSTRAINT `m_ujian_m_mata_pelajaran_id_foreign` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_ujian_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_ujian_siswa`
--
ALTER TABLE `m_ujian_siswa`
  ADD CONSTRAINT `m_ujian_siswa_m_mata_pelajaran_id_foreign` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_ujian_siswa_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_ujian_siswa_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_ujian_siswa_uas_id_foreign` FOREIGN KEY (`uas_id`) REFERENCES `tk_rekap_nilai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_ujian_siswa_us_id_foreign` FOREIGN KEY (`us_id`) REFERENCES `tk_rekap_nilai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_ujian_siswa_uts_id_foreign` FOREIGN KEY (`uts_id`) REFERENCES `tk_rekap_nilai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_ukk_siswa`
--
ALTER TABLE `m_ukk_siswa`
  ADD CONSTRAINT `m_ukk_siswa_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_ukk_siswa_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `m_user`
--
ALTER TABLE `m_user`
  ADD CONSTRAINT `m_user_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_user_m_ta_id_foreign` FOREIGN KEY (`m_ta_id`) REFERENCES `m_ta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `regencies`
--
ALTER TABLE `regencies`
  ADD CONSTRAINT `regencies_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`);

--
-- Constraints for table `sekolah_grades`
--
ALTER TABLE `sekolah_grades`
  ADD CONSTRAINT `sekolah_grades_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_bank_soal_guru`
--
ALTER TABLE `tk_bank_soal_guru`
  ADD CONSTRAINT `tk_bank_soal_guru_m_ujian_id_foreign` FOREIGN KEY (`m_ujian_id`) REFERENCES `m_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_bank_soal_guru_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_jadwal_ujian`
--
ALTER TABLE `tk_jadwal_ujian`
  ADD CONSTRAINT `tk_jadwal_ujian_m_jadwal_ujian_id_foreign` FOREIGN KEY (`m_jadwal_ujian_id`) REFERENCES `m_jadwal_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_jadwal_ujian_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_jawaban_ujian_siswa`
--
ALTER TABLE `tk_jawaban_ujian_siswa`
  ADD CONSTRAINT `tk_jawaban_ujian_siswa_m_soal_ujian_id_foreign` FOREIGN KEY (`m_soal_ujian_id`) REFERENCES `m_soal_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_jawaban_ujian_siswa_tk_peserta_ujian_id_foreign` FOREIGN KEY (`tk_peserta_ujian_id`) REFERENCES `tk_peserta_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_jawaban_ujian_siswa_tk_peserta_ujian_ppdb_id_foreign` FOREIGN KEY (`tk_peserta_ujian_ppdb_id`) REFERENCES `tk_peserta_ujian_ppdb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_kategori_akun_laba_rugi`
--
ALTER TABLE `tk_kategori_akun_laba_rugi`
  ADD CONSTRAINT `tk_kategori_akun_laba_rugi_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_kategori_akun_laba_rugi_m_keu_kategori_laba_rugi_id_foreign` FOREIGN KEY (`m_keu_kategori_laba_rugi_id`) REFERENCES `m_keu_kategori_laba_rugi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_kategori_akun_neraca`
--
ALTER TABLE `tk_kategori_akun_neraca`
  ADD CONSTRAINT `tk_kategori_akun_neraca_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_kategori_akun_neraca_m_keu_kategori_neraca_id_foreign` FOREIGN KEY (`m_keu_kategori_neraca_id`) REFERENCES `m_keu_kategori_neraca` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_kategori_tipe_akun`
--
ALTER TABLE `tk_kategori_tipe_akun`
  ADD CONSTRAINT `tk_kategori_tipe_akun_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_kategori_tipe_akun_m_keu_kategori_tipe_akun_id_foreign` FOREIGN KEY (`m_keu_kategori_tipe_akun_id`) REFERENCES `m_keu_kategori_tipe_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_mapel_rapor`
--
ALTER TABLE `tk_mapel_rapor`
  ADD CONSTRAINT `FK_tk_mapel_rapor_m_predikat_nilai` FOREIGN KEY (`m_predikat_nilai_id`) REFERENCES `m_predikat_nilai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_mapel_rapor_m_kategori_mapel_id_foreign` FOREIGN KEY (`m_kategori_mapel_id`) REFERENCES `m_kategori_mapel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_mapel_rapor_m_mata_pelajaran_id_foreign` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_materi_kesimpulan`
--
ALTER TABLE `tk_materi_kesimpulan`
  ADD CONSTRAINT `tk_materi_kesimpulan_m_topik_id_foreign` FOREIGN KEY (`m_topik_id`) REFERENCES `m_topik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_materi_kesimpulan_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_materi_rombel`
--
ALTER TABLE `tk_materi_rombel`
  ADD CONSTRAINT `tk_materi_rombel_m_materi_id_foreign` FOREIGN KEY (`m_materi_id`) REFERENCES `m_materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_materi_rombel_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_pekerjaan_proyek_aktivitas`
--
ALTER TABLE `tk_pekerjaan_proyek_aktivitas`
  ADD CONSTRAINT `tk_pekerjaan_proyek_aktivitas_m_pekerjaan_proyek_id_foreign` FOREIGN KEY (`m_pekerjaan_proyek_id`) REFERENCES `m_pekerjaan_proyek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_pekerjaan_proyek_aktivitas_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_pembayaran_rombel`
--
ALTER TABLE `tk_pembayaran_rombel`
  ADD CONSTRAINT `tk_pembayaran_rombel_m_pembayaran_id_foreign` FOREIGN KEY (`m_pembayaran_id`) REFERENCES `m_pembayaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_pembayaran_rombel_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_pembayaran_rombel_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_perpus_aktivitas`
--
ALTER TABLE `tk_perpus_aktivitas`
  ADD CONSTRAINT `tk_perpus_aktivitas_m_perpus_id_foreign` FOREIGN KEY (`m_perpus_id`) REFERENCES `m_perpus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_perpus_aktivitas_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_perpus_mapel`
--
ALTER TABLE `tk_perpus_mapel`
  ADD CONSTRAINT `tk_perpus_mapel_m_jurusan_id_foreign` FOREIGN KEY (`m_jurusan_id`) REFERENCES `m_jurusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_perpus_mapel_m_mata_pelajaran_id_foreign` FOREIGN KEY (`m_mata_pelajaran_id`) REFERENCES `m_mata_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_perpus_mapel_m_perpus_id_foreign` FOREIGN KEY (`m_perpus_id`) REFERENCES `m_perpus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_perpus_tag`
--
ALTER TABLE `tk_perpus_tag`
  ADD CONSTRAINT `tk_perpus_tag_m_perpus_id_foreign` FOREIGN KEY (`m_perpus_id`) REFERENCES `m_perpus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_perpus_tag_m_perpus_tag_id_foreign` FOREIGN KEY (`m_perpus_tag_id`) REFERENCES `m_perpus_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_perusahaan_sekolah`
--
ALTER TABLE `tk_perusahaan_sekolah`
  ADD CONSTRAINT `tk_perusahaan_sekolah_m_perusahaan_id_foreign` FOREIGN KEY (`m_perusahaan_id`) REFERENCES `m_perusahaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_perusahaan_sekolah_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_peserta_ujian`
--
ALTER TABLE `tk_peserta_ujian`
  ADD CONSTRAINT `tk_peserta_ujian_m_tugas_id_foreign` FOREIGN KEY (`m_tugas_id`) REFERENCES `m_tugas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_peserta_ujian_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_peserta_ujian_tk_jadwal_ujian_id_foreign` FOREIGN KEY (`tk_jadwal_ujian_id`) REFERENCES `tk_jadwal_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_peserta_ujian_tk_siswa_ujian_id_foreign` FOREIGN KEY (`tk_siswa_ujian_id`) REFERENCES `tk_siswa_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_peserta_ujian_tk_timeline_id_foreign` FOREIGN KEY (`tk_timeline_id`) REFERENCES `tk_timeline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_peserta_ujian_ppdb`
--
ALTER TABLE `tk_peserta_ujian_ppdb`
  ADD CONSTRAINT `tk_peserta_ujian_ppdb_m_jadwal_ppdb_id_foreign` FOREIGN KEY (`m_jadwal_ppdb_id`) REFERENCES `m_jadwal_ppdb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_peserta_ujian_ppdb_m_pendaftar_ppdb_id_foreign` FOREIGN KEY (`m_pendaftar_ppdb_id`) REFERENCES `m_pendaftar_ppdb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_peserta_ujian_ppdb_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_peserta_ujian_ppdb_tk_peserta_ujian_id_foreign` FOREIGN KEY (`tk_peserta_ujian_id`) REFERENCES `tk_peserta_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_post`
--
ALTER TABLE `tk_post`
  ADD CONSTRAINT `tk_post_m_kategori_id_foreign` FOREIGN KEY (`m_kategori_id`) REFERENCES `m_kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_post_m_post_id_foreign` FOREIGN KEY (`m_post_id`) REFERENCES `m_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_rekap_nilai`
--
ALTER TABLE `tk_rekap_nilai`
  ADD CONSTRAINT `tk_rekap_nilai_m_rekap_rombel_id_foreign` FOREIGN KEY (`m_rekap_rombel_id`) REFERENCES `m_rekap_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_rekap_nilai_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_rencana_kategori_laba`
--
ALTER TABLE `tk_rencana_kategori_laba`
  ADD CONSTRAINT `tk_rencana_kategori_laba_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_rencana_kategori_laba_m_rencana_kategori_laba_rugi_id_foreign` FOREIGN KEY (`m_rencana_kategori_laba_rugi_id`) REFERENCES `m_rencana_kategori_laba_rugi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_rencana_kategori_neraca`
--
ALTER TABLE `tk_rencana_kategori_neraca`
  ADD CONSTRAINT `tk_rencana_kategori_neraca_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_rencana_kategori_neraca_m_rencana_kategori_neraca_id_foreign` FOREIGN KEY (`m_rencana_kategori_neraca_id`) REFERENCES `m_rencana_kategori_neraca` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_rencana_kategori_tipe`
--
ALTER TABLE `tk_rencana_kategori_tipe`
  ADD CONSTRAINT `tk_rencana_kategori_tipe_m_keu_akun_id_foreign` FOREIGN KEY (`m_keu_akun_id`) REFERENCES `m_keu_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_rencana_kategori_tipe_m_rencana_kategori_tipe_akun_id_foreign` FOREIGN KEY (`m_rencana_kategori_tipe_akun_id`) REFERENCES `m_rencana_kategori_tipe_akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_server_sekolah`
--
ALTER TABLE `tk_server_sekolah`
  ADD CONSTRAINT `tk_server_sekolah_m_sekolah_id_foreign` FOREIGN KEY (`m_sekolah_id`) REFERENCES `m_sekolah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_server_sekolah_m_server_id_foreign` FOREIGN KEY (`m_server_id`) REFERENCES `m_server` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_siswa_pelanggaran`
--
ALTER TABLE `tk_siswa_pelanggaran`
  ADD CONSTRAINT `tk_siswa_pelanggaran_m_pelanggaran_id_foreign` FOREIGN KEY (`m_pelanggaran_id`) REFERENCES `m_pelanggaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_siswa_pelanggaran_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_siswa_pelanggaran_m_user_pelapor_id_foreign` FOREIGN KEY (`m_user_pelapor_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_siswa_ujian`
--
ALTER TABLE `tk_siswa_ujian`
  ADD CONSTRAINT `tk_siswa_ujian_m_jadwal_ujian_id_foreign` FOREIGN KEY (`m_jadwal_ujian_id`) REFERENCES `m_jadwal_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_siswa_ujian_m_rombel_id_foreign` FOREIGN KEY (`m_rombel_id`) REFERENCES `m_rombel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_siswa_ujian_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_soal_tugas`
--
ALTER TABLE `tk_soal_tugas`
  ADD CONSTRAINT `tk_soal_tugas_m_soal_ujian_id_foreign` FOREIGN KEY (`m_soal_ujian_id`) REFERENCES `m_soal_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_soal_tugas_m_tugas_id_foreign` FOREIGN KEY (`m_tugas_id`) REFERENCES `m_tugas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_soal_ujian`
--
ALTER TABLE `tk_soal_ujian`
  ADD CONSTRAINT `tk_soal_ujian_m_soal_ujian_id_foreign` FOREIGN KEY (`m_soal_ujian_id`) REFERENCES `m_soal_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_soal_ujian_m_ujian_id_foreign` FOREIGN KEY (`m_ujian_id`) REFERENCES `m_ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_status_pekerjaan`
--
ALTER TABLE `tk_status_pekerjaan`
  ADD CONSTRAINT `tk_status_pekerjaan_m_pekerjaan_id_foreign` FOREIGN KEY (`m_pekerjaan_id`) REFERENCES `m_pekerjaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_status_pekerjaan_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_surat_keputusan_user`
--
ALTER TABLE `tk_surat_keputusan_user`
  ADD CONSTRAINT `tk_surat_keputusan_user_m_surat_keputusan_id_foreign` FOREIGN KEY (`m_surat_keputusan_id`) REFERENCES `m_surat_keputusan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_surat_keputusan_user_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_timeline`
--
ALTER TABLE `tk_timeline`
  ADD CONSTRAINT `tk_timeline_m_timeline_id_foreign` FOREIGN KEY (`m_timeline_id`) REFERENCES `m_timeline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_timeline_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_timeline_komen`
--
ALTER TABLE `tk_timeline_komen`
  ADD CONSTRAINT `tk_timeline_komen_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_timeline_komen_tk_timeline_id_foreign` FOREIGN KEY (`tk_timeline_id`) REFERENCES `tk_timeline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_timeline_topik`
--
ALTER TABLE `tk_timeline_topik`
  ADD CONSTRAINT `tk_timeline_topik_m_timeline_id_foreign` FOREIGN KEY (`m_timeline_id`) REFERENCES `m_timeline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_timeline_topik_m_topik_id_foreign` FOREIGN KEY (`m_topik_id`) REFERENCES `m_topik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tk_tipe_surel`
--
ALTER TABLE `tk_tipe_surel`
  ADD CONSTRAINT `tk_tipe_surel_m_surel_id_foreign` FOREIGN KEY (`m_surel_id`) REFERENCES `m_surel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tk_tipe_surel_m_user_id_foreign` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `villages_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
