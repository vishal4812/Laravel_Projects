-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 06, 2021 at 12:39 AM
-- Server version: 5.7.35-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(41, '2014_10_12_000000_create_users_table', 1),
(42, '2014_10_12_100000_create_password_resets_table', 1),
(43, '2019_08_19_000000_create_failed_jobs_table', 1),
(44, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(45, '2021_10_01_170905_create_user_logins_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\UserLogin', '23fef3d0-2609-11ec-8911-1fa26f50af8f', 'tokens', 'b734a7d9ac7fdfd94ce52f95d9c27622f035746e5ee7038443eae881de8b8a21', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(2, 'App\\Models\\UserLogin', '24063330-2609-11ec-ac4a-ab715673733d', 'tokens', 'ccd643101bebf98ec4b443a7d9733e708e0d5f47222f0259289917db5f86c54f', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(3, 'App\\Models\\UserLogin', '2409fbd0-2609-11ec-821b-612d7a548e85', 'tokens', '1b7722b7217834872c4c959499ee7d2368952903865157ece34cebdcad9ce2b6', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(4, 'App\\Models\\UserLogin', '240c8fc0-2609-11ec-a022-efd56d65146f', 'tokens', '88975ed00823017de35cfbe9dff7a8e1e7b63446f6879d27256ce611c8b92d45', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(5, 'App\\Models\\UserLogin', '240f0860-2609-11ec-b453-650e473da362', 'tokens', '40675c2c0a95ff3e692988f4680dcc697c0e6880c24e9952f6a9a9297f54e6c9', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(6, 'App\\Models\\UserLogin', '24119480-2609-11ec-bf03-d1fe69782a75', 'tokens', '16902e03278b1bd51a20eadd4978bcb412e29d1cd2155b1e209777d52ed9f978', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(7, 'App\\Models\\UserLogin', '241406e0-2609-11ec-a04e-53e7449ffe3b', 'tokens', 'cd6c27cb5a30593b06a990ceadd506f8042c2db64d354218fd0e3dbc02fdab73', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(8, 'App\\Models\\UserLogin', '241862c0-2609-11ec-8e28-f3f79e272cd9', 'tokens', '1f450a599b8861fa90b29d7d4c1c6a86e86a31eab75d8cc8a32800637859014a', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(9, 'App\\Models\\UserLogin', '241b0f10-2609-11ec-9c5d-8547a7543986', 'tokens', '1ff907727e3ca6defe317f04651e864c64efd8229ab5411262507d43edbfe493', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(10, 'App\\Models\\UserLogin', '241dba60-2609-11ec-af7b-1b812677c89c', 'tokens', '46ad11b587f461797715be9e53db260217e91561e68d9163c529b43a769f75e2', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(11, 'App\\Models\\UserLogin', '2420b7c0-2609-11ec-93cf-0b12d22e9c5a', 'tokens', '5cf7e18ba5c59c088bc169966c34a8336e683ced710bb04511135dde74210e3a', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(12, 'App\\Models\\UserLogin', '242367f0-2609-11ec-a130-e5ce9267df1c', 'tokens', '4b0d371cd74e9f6276b7702a01406f6f8f87caf719c95f918088b3abac346a12', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(13, 'App\\Models\\UserLogin', '24261de0-2609-11ec-98b3-5b8b47345b8e', 'tokens', 'f087a0883ea10ce37745d67941aa070de3188f46d0b81bc9b2ee4d61dbf3f545', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(14, 'App\\Models\\UserLogin', '24287540-2609-11ec-992a-e97702e1c91d', 'tokens', 'ebeab8f85d5821ef60abb5aa215f1d56a966486e45975c923e684a253abaaafc', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(15, 'App\\Models\\UserLogin', '242b0aa0-2609-11ec-a8ee-69a833334d8a', 'tokens', '8269f99f415ef4e201adbc6feade1daca4d250c3faecc75ffbce8a4cf511bf0b', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(16, 'App\\Models\\UserLogin', '242d83d0-2609-11ec-8741-7b89ad3a8d8c', 'tokens', '448b6f662a25f22cb1e8122d0a16aae89795bf9107be572a0f9ca429874803d8', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(17, 'App\\Models\\UserLogin', '242fede0-2609-11ec-a814-dfb9156adca2', 'tokens', '06b80afb0fb5c9eb152c363d7834e3945fce00601ff7b7289cb5e44db32e39e1', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(18, 'App\\Models\\UserLogin', '24325cf0-2609-11ec-9a50-71bebaaba47e', 'tokens', '6de76b6f5308a28954d7730b78f3511673e6958767b63f7010b3bbe2e5f0e6f1', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(19, 'App\\Models\\UserLogin', '2434da50-2609-11ec-8b98-977916eee4c6', 'tokens', '955588babaa8af86246e8705622054f39f8f9744c230c843fef844a38f19e89c', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
(20, 'App\\Models\\UserLogin', '24371b60-2609-11ec-b7a1-d98ebf3ec280', 'tokens', '6a4e60c5a69a3cfcd9d38b483717750f60dc680443eb7a45bccaa305a6b064da', '[\"access:account\"]', NULL, '2021-10-05 12:52:04', '2021-10-05 12:52:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified_status` tinyint(1) NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`uuid`, `email`, `verified_status`, `token`, `url`, `role`, `created_at`, `updated_at`) VALUES
('23fef3d0-2609-11ec-8911-1fa26f50af8f', 'YBFLXwdgVG9OWoN2ugLf@gmail.com', 0, '1|RIm9a4H5gFyhGAzMzXj25uajxRLKfKotNoYNY6DZ', 'http://localhost:3000/account?uuid=23fef3d0-2609-11ec-8911-1fa26f50af8f&expires=1633459924&signature=26cdd53d970a414fdb7021575abea768', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('24063330-2609-11ec-ac4a-ab715673733d', 'bdDpJFOy64uM5eeGK3Dk@gmail.com', 0, '2|qjnXibU6rSyMxb5BvtMvwFUUKGKY47xQ4SbILfpy', 'http://localhost:3000/account?uuid=24063330-2609-11ec-ac4a-ab715673733d&expires=1633459924&signature=88ca9cc0a3998db81238385e3d604992', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('2409fbd0-2609-11ec-821b-612d7a548e85', '4vPaXuX0nq2hnFsfsP1P@gmail.com', 0, '3|ZdgIVDiraxoyOb46gTNug96bkAYsxAOvBXVgB0oI', 'http://localhost:3000/account?uuid=2409fbd0-2609-11ec-821b-612d7a548e85&expires=1633459924&signature=872ea42bf4672c1e787288d88843577c', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('240c8fc0-2609-11ec-a022-efd56d65146f', 'hTLMfU6HMI4Xe7P1SO3U@gmail.com', 0, '4|Jk1OiUO4IBYxfcLXOD45OYL2KWYmSzL0cNBDLzmW', 'http://localhost:3000/account?uuid=240c8fc0-2609-11ec-a022-efd56d65146f&expires=1633459924&signature=da7eca718833b6db2a02c3ec86065452', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('240f0860-2609-11ec-b453-650e473da362', 'pryzlU9rUEJM4g3rvJMO@gmail.com', 0, '5|mBRBnunvgAk8qCvFjDe7rYk2rLw0QYPps5S9kQdS', 'http://localhost:3000/account?uuid=240f0860-2609-11ec-b453-650e473da362&expires=1633459924&signature=0af410cdd9bc06869178aad267f1be4f', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('24119480-2609-11ec-bf03-d1fe69782a75', 'W2F6Lo5gLVeIMT2Ju6z2@gmail.com', 0, '6|FOIJVxJP3XSt6NU4HDTrWF3gZSeXmsIxBYIRiFoa', 'http://localhost:3000/account?uuid=24119480-2609-11ec-bf03-d1fe69782a75&expires=1633459924&signature=51a69729f5ff6a71bd9549e2552c79fa', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('241406e0-2609-11ec-a04e-53e7449ffe3b', 'EJ8K20RymwTN5tGI0xme@gmail.com', 0, '7|ip87LzSkAJbYle1TmHQjeUy9E1JCUcsc5PsR069F', 'http://localhost:3000/account?uuid=241406e0-2609-11ec-a04e-53e7449ffe3b&expires=1633459924&signature=3f12474a36259325484494efe4ae1003', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('241862c0-2609-11ec-8e28-f3f79e272cd9', 'wuZELWJB7voIaMtssTok@gmail.com', 0, '8|UUp1nWNaCuCa7WNc3XQHtMUl584ILwzdhi3u6uoS', 'http://localhost:3000/account?uuid=241862c0-2609-11ec-8e28-f3f79e272cd9&expires=1633459924&signature=c31e7e1811ffdcfc740789c1e125ed17', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('241b0f10-2609-11ec-9c5d-8547a7543986', 'y0NyAghEOl4yBccAJu1d@gmail.com', 0, '9|4dvLJN9IicepDoro6oNUVrq87x9s414lPuEJT0O5', 'http://localhost:3000/account?uuid=241b0f10-2609-11ec-9c5d-8547a7543986&expires=1633459924&signature=4a4c5a09120de2685eae59559fcb44b8', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('241dba60-2609-11ec-af7b-1b812677c89c', '9tGY4Gu97R2dMpmtDVFI@gmail.com', 0, '10|ovWDU3z9nUeMEGG9Aj114aRqYi8tsQTriMAx4TIv', 'http://localhost:3000/account?uuid=241dba60-2609-11ec-af7b-1b812677c89c&expires=1633459924&signature=7c21e1d90ecbfaef7c9d2e2e1506ab38', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('2420b7c0-2609-11ec-93cf-0b12d22e9c5a', 'S1yrqb4oBMHUcIjYhS4S@gmail.com', 0, '11|FYhwjA09TAHmB348lzR5zfrcaJDsE2mCmEi1uCQg', 'http://localhost:3000/account?uuid=2420b7c0-2609-11ec-93cf-0b12d22e9c5a&expires=1633459924&signature=3b0e3ef6ad93f9c349947aafdb50438c', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('242367f0-2609-11ec-a130-e5ce9267df1c', 'ZoXHBsxgrJIGNx7xC7ak@gmail.com', 0, '12|2Syx8lizsfgRriubFm6cfum8DuOClmxQZWcX7FLI', 'http://localhost:3000/account?uuid=242367f0-2609-11ec-a130-e5ce9267df1c&expires=1633459924&signature=174e18456cfd31112a14c6ea7912ac40', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('24261de0-2609-11ec-98b3-5b8b47345b8e', '40VQ7Z66cccmYm2BMYb3@gmail.com', 0, '13|Ojb9piSoMKqt5N4idlyOeDeakogmlbmvLaZdIUcC', 'http://localhost:3000/account?uuid=24261de0-2609-11ec-98b3-5b8b47345b8e&expires=1633459924&signature=e40c892a863046438b2bea8883af3bd4', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('24287540-2609-11ec-992a-e97702e1c91d', 'MwiahwVWVHpEyoXfun2Q@gmail.com', 0, '14|ZiOw1jAMKbfKLxdqEXLkyHgV5uH0QGvytQr2DFGg', 'http://localhost:3000/account?uuid=24287540-2609-11ec-992a-e97702e1c91d&expires=1633459924&signature=119eb9b93534c3036bcb6e238bb7573e', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('242b0aa0-2609-11ec-a8ee-69a833334d8a', 'tg6WstB01PRNS2DG6mcp@gmail.com', 0, '15|tedJyJaS7IQ6y7WXdJEWXISXOSG1EWMPuYV9R6mZ', 'http://localhost:3000/account?uuid=242b0aa0-2609-11ec-a8ee-69a833334d8a&expires=1633459924&signature=c3d6e7510e1c22618fd23124f94ceb50', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('242d83d0-2609-11ec-8741-7b89ad3a8d8c', 'CyK4oK4uz3aHNBeMEkz1@gmail.com', 0, '16|Jg8ECkxtGpWGypmSLMo7Ij6Iv9DVmEjLUSStp60r', 'http://localhost:3000/account?uuid=242d83d0-2609-11ec-8741-7b89ad3a8d8c&expires=1633459924&signature=78f1091387f41b6451cc03b7c60e05af', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('242fede0-2609-11ec-a814-dfb9156adca2', 'O1sxz5fQe66hHOeJZLUC@gmail.com', 0, '17|JXvKaXwSRhx4bpfQTp3OMo2ySc5Mie2BTTS50Rae', 'http://localhost:3000/account?uuid=242fede0-2609-11ec-a814-dfb9156adca2&expires=1633459924&signature=f85fda94b2643050ee2f28a897a41dc9', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('24325cf0-2609-11ec-9a50-71bebaaba47e', 'EJZ8UigHQgCJs0r0lpfU@gmail.com', 0, '18|OOBRnUo0MztRqRrH8pXmHNDsRhceZXPFvBgd5lws', 'http://localhost:3000/account?uuid=24325cf0-2609-11ec-9a50-71bebaaba47e&expires=1633459924&signature=5e78a48d9e67e84c0b97b95921c2fc12', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('2434da50-2609-11ec-8b98-977916eee4c6', 'NVSUkgt7Y191qboP5KGB@gmail.com', 0, '19|qXFrcgmsoqPZw6oRwc3OSUiKOihCiIRsqzKcgqTM', 'http://localhost:3000/account?uuid=2434da50-2609-11ec-8b98-977916eee4c6&expires=1633459924&signature=e305fb674400f07f37103fcd7272a93c', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04'),
('24371b60-2609-11ec-b7a1-d98ebf3ec280', 'fh5qKlX95A0XKR38X7Wo@gmail.com', 0, '20|xHorzKPBhqITHH3fx6CwTr6duklkudZP8UqIoVG6', 'http://localhost:3000/account?uuid=24371b60-2609-11ec-b7a1-d98ebf3ec280&expires=1633459924&signature=deb46dc7450445b7c174c76f7b4d84cd', 'user', '2021-10-05 12:52:04', '2021-10-05 12:52:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `user_logins_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
