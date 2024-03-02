-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Mar 2024 pada 15.15
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bkskanic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telepon` varchar(255) NOT NULL,
  `problem` varchar(255) NOT NULL,
  `option` varchar(255) NOT NULL,
  `consultation` varchar(255) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_start` varchar(255) NOT NULL,
  `booking_end` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `id_users`, `name`, `email`, `no_telepon`, `problem`, `option`, `consultation`, `booking_date`, `booking_start`, `booking_end`, `created_at`, `updated_at`) VALUES
(1, 15, 'alfa', 'alfa@gmail.com', '083838', 'ngantuk', 'level 1', 'ada', '2023-08-11', '10.10', '10.30', '2024-02-27 07:26:25', '2024-02-27 07:26:25'),
(2, 15, 'shalwa', 'shalwa@gmail.com', '08457', 'haa', 'aa', 'aa', '2024-03-12', '10.30', '11.30', '2024-02-29 09:32:53', '2024-02-29 09:32:53'),
(3, 15, 'aku', 'aku@gmail.com', '0808880', 'asdasda', 'qwqw', 'asdasd', '2024-03-02', '20:55', '22:58', '2024-03-02 03:55:12', '2024-03-02 03:55:12'),
(4, 15, 'aku', 'aku@gmail.com', '0808880', 'asdasda', 'qwqw', 'asdasd', '2024-03-02', '20:55', '22:58', '2024-03-02 03:55:25', '2024-03-02 03:55:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_users` bigint(20) UNSIGNED NOT NULL,
  `chat` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `histories`
--

CREATE TABLE `histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `history_booking` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(14, '2024_01_20_094757_create_permission_tables', 1),
(15, '2024_01_24_134742_create_submissions_table', 1),
(16, '2024_01_24_134936_create_bookings_table', 1),
(17, '2024_01_24_134945_create_chats_table', 1),
(18, '2024_01_24_135002_create_histories_table', 1),
(19, '2024_02_05_130624_add_email_to_submissions_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 14),
(1, 'App\\Models\\User', 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'posts.index', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(2, 'posts.create', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(3, 'posts.edit', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(4, 'posts.delete', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(5, 'categories.index', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(6, 'categories.create', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(7, 'categories.edit', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(8, 'categories.delete', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(9, 'sliders.index', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(10, 'sliders.create', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(11, 'sliders.delete', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(12, 'roles.index', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(13, 'roles.create', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54'),
(14, 'roles.edit', 'api', '2024-01-24 07:42:55', '2024-01-24 07:42:55'),
(15, 'roles.delete', 'api', '2024-01-24 07:42:55', '2024-01-24 07:42:55'),
(16, 'permissions.index', 'api', '2024-01-24 07:42:55', '2024-01-24 07:42:55'),
(17, 'users.index', 'api', '2024-01-24 07:42:55', '2024-01-24 07:42:55'),
(18, 'users.create', 'api', '2024-01-24 07:42:55', '2024-01-24 07:42:55'),
(19, 'users.edit', 'api', '2024-01-24 07:42:55', '2024-01-24 07:42:55'),
(20, 'users.delete', 'api', '2024-01-24 07:42:55', '2024-01-24 07:42:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'api', '2024-01-24 07:42:54', '2024-01-24 07:42:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `submissions`
--

CREATE TABLE `submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `masalah` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `sebagai` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `submissions`
--

INSERT INTO `submissions` (`id`, `nama`, `email`, `nama_siswa`, `masalah`, `kelas`, `deskripsi`, `sebagai`, `created_at`, `updated_at`) VALUES
(1, 'nazma', 'nazma@gmail.com', 'nazma', 'nazma', 'nazma', 'nazma', 'nazma', '2024-02-05 06:30:54', '2024-02-05 06:30:54'),
(2, 'nazma', 'nazma@gmail.com', 'nazma', 'nazma', 'nazma', 'nazma', 'nazma', '2024-02-21 18:22:54', '2024-02-21 18:22:54'),
(3, 'nazma', 'nazma@gmail.com', 'nazma', 'nazma', 'nazma', 'nazma', 'nazma', '2024-02-27 05:59:16', '2024-02-27 05:59:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Coy Keebler', 'shawn95@example.org', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'IMAGtbzdLd', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(2, 'Ronaldo Gleason', 'mauricio.tromp@example.com', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'uJkJvkPyOq', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(3, 'Prof. Patrick Rogahn I', 'sarina01@example.net', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'phO8D1JlBw', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(4, 'Prof. Lacy Tremblay DDS', 'celestine88@example.net', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'QQc1E2tBq6', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(5, 'Prof. Leanne Harber I', 'hubert.wisozk@example.org', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', '0HlvoKVzhS', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(6, 'Leonor Wiegand', 'imurray@example.org', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'vmCOO3gh6Y', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(7, 'Vince Purdy', 'rodger15@example.com', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'vvBkGZoO8m', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(8, 'Kole Schimmel', 'damion14@example.com', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'MDyBojbWEe', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(9, 'Addie Kovacek', 'georgette91@example.net', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'NfRopFqPgr', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(10, 'Freddy Feeney', 'johan.carroll@example.net', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'F36z5DHzmS', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(11, 'Test User', 'test@example.com', '2024-01-24 07:42:56', '$2y$12$wMQ5prcTuDhZ7VhOFpILJ.YJASmrjE//XWVV/owAdQfNksL2JiTli', 'q1olxi3wjG', '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(12, 'Administrator', 'admin@gmail.com', NULL, '$2y$12$BaPFCFG5QkD1bg02qUb2SebOczr3okIXojLVsxDRA279JtvcraItq', NULL, '2024-01-24 07:42:56', '2024-01-24 07:42:56'),
(13, 'shalwa', 'shalwa123@gmail.com', NULL, '$2y$12$q/27/miji/6Mz7ZgxpKASOKCWgjWc9gD9K4YYGmvgeqptkcBzj/de', NULL, '2024-02-14 21:39:59', '2024-02-14 21:39:59'),
(14, 'shalwa', 'shalwa@gmail.com', NULL, '$2y$12$QbIDD/38hfZSD9I5lTgIHeb4F8oBEkg75Iy5sWoO5QbuXoj/fnfBu', NULL, '2024-02-14 21:40:43', '2024-02-14 21:40:43'),
(15, 'aku', 'aku@gmail.com', NULL, '$2y$12$3qgL8FI.G6qaupiOrvhZquhURptaJsRKNkCEZFLLG7MYmU9PWgYPe', NULL, '2024-02-20 19:39:47', '2024-02-20 19:39:47'),
(16, 'salwa', 'salwa@gmail.com', NULL, '$2y$12$moI0xlsWNWrZabELD1jPdOJhjKHFRtnujuqx33T5JRI05nMFQLasm', NULL, '2024-02-29 08:58:23', '2024-02-29 08:58:23');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_id_users_foreign` (`id_users`);

--
-- Indeks untuk tabel `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_id_users_foreign` (`id_users`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `histories_history_booking_foreign` (`history_booking`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `histories`
--
ALTER TABLE `histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_id_users_foreign` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_id_users_foreign` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `histories`
--
ALTER TABLE `histories`
  ADD CONSTRAINT `histories_history_booking_foreign` FOREIGN KEY (`history_booking`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
