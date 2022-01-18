-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2021 lúc 12:17 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cine`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(6) UNSIGNED NOT NULL,
  `image` varchar(1000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `link` varchar(1000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Xoa` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cumrap`
--

CREATE TABLE `cumrap` (
  `id` int(6) UNSIGNED NOT NULL,
  `tencum` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `diachi` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `maps` varchar(1000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Xoa` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `cumrap`
--

INSERT INTO `cumrap` (`id`, `tencum`, `diachi`, `maps`, `Xoa`, `created_at`, `updated_at`) VALUES
(21, 'CGV Phú Yên', 'Phú yên', '', 0, '2021-12-14 09:24:34', '2021-12-14 09:24:34'),
(22, 'CGV Quy Nhơn', 'quy nhơn', '', 0, '2021-12-14 09:24:41', '2021-12-14 09:24:41'),
(23, 'Starlight Quy Nhơn', 'quy nhơn', '', 0, '2021-12-14 09:24:51', '2021-12-14 09:24:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `fastfood`
--

CREATE TABLE `fastfood` (
  `id` int(6) UNSIGNED NOT NULL,
  `tenmon` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mota` varchar(500) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `gia` int(11) NOT NULL,
  `image` varchar(1000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Xoa` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `birthday` date NOT NULL,
  `permission` varchar(5) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'user',
  `xoa` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `email`, `pass`, `name`, `phone`, `gender`, `birthday`, `permission`, `xoa`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'admin', 'Administrator', '123', 'Nam', '2000-12-15', 'admin', 0, NULL, '2021-12-12 10:51:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phim`
--

CREATE TABLE `phim` (
  `id` int(6) UNSIGNED NOT NULL,
  `ten` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `poster` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `trailer` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `thoiluong` int(11) NOT NULL,
  `daodien` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `dienvien` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `theloai` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `noidungphim` varchar(3000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ngaycongchieu` date DEFAULT NULL,
  `xoa` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rap`
--

CREATE TABLE `rap` (
  `id` int(6) UNSIGNED NOT NULL,
  `tenrap` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `loairap` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ktngang` int(11) NOT NULL,
  `ktdoc` int(11) NOT NULL,
  `cumrap_id` int(6) UNSIGNED NOT NULL,
  `xoa` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suatchieu`
--

CREATE TABLE `suatchieu` (
  `id` int(6) UNSIGNED NOT NULL,
  `ngay` date NOT NULL,
  `thoidiembatdau` datetime NOT NULL,
  `thoidiemketthuc` datetime NOT NULL,
  `giave` int(11) NOT NULL,
  `phim_id` int(6) UNSIGNED NOT NULL,
  `rap_id` int(6) UNSIGNED NOT NULL,
  `xoa` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ve`
--

CREATE TABLE `ve` (
  `id` int(6) UNSIGNED NOT NULL,
  `suatchieu_id` int(6) UNSIGNED NOT NULL,
  `nguoidung_id` int(6) UNSIGNED NOT NULL,
  `ghe` varchar(3) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `xoa` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ve_food`
--

CREATE TABLE `ve_food` (
  `id` int(6) UNSIGNED NOT NULL,
  `fastfood_id` int(6) UNSIGNED NOT NULL,
  `soluong` int(11) NOT NULL,
  `ve_id` int(6) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cumrap`
--
ALTER TABLE `cumrap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `fastfood`
--
ALTER TABLE `fastfood`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phim`
--
ALTER TABLE `phim`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rap`
--
ALTER TABLE `rap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cumrap_id` (`cumrap_id`);

--
-- Chỉ mục cho bảng `suatchieu`
--
ALTER TABLE `suatchieu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phim_id` (`phim_id`),
  ADD KEY `rap_id` (`rap_id`);

--
-- Chỉ mục cho bảng `ve`
--
ALTER TABLE `ve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nguoidung_id` (`nguoidung_id`),
  ADD KEY `suatchieu_id` (`suatchieu_id`);

--
-- Chỉ mục cho bảng `ve_food`
--
ALTER TABLE `ve_food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fastfood_id` (`fastfood_id`),
  ADD KEY `ve_id` (`ve_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `cumrap`
--
ALTER TABLE `cumrap`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `fastfood`
--
ALTER TABLE `fastfood`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `phim`
--
ALTER TABLE `phim`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `rap`
--
ALTER TABLE `rap`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `suatchieu`
--
ALTER TABLE `suatchieu`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `ve`
--
ALTER TABLE `ve`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `ve_food`
--
ALTER TABLE `ve_food`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `rap`
--
ALTER TABLE `rap`
  ADD CONSTRAINT `rap_ibfk_1` FOREIGN KEY (`cumrap_id`) REFERENCES `cumrap` (`id`);

--
-- Các ràng buộc cho bảng `suatchieu`
--
ALTER TABLE `suatchieu`
  ADD CONSTRAINT `suatchieu_ibfk_1` FOREIGN KEY (`phim_id`) REFERENCES `phim` (`id`),
  ADD CONSTRAINT `suatchieu_ibfk_2` FOREIGN KEY (`rap_id`) REFERENCES `rap` (`id`);

--
-- Các ràng buộc cho bảng `ve`
--
ALTER TABLE `ve`
  ADD CONSTRAINT `ve_ibfk_2` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoidung` (`id`),
  ADD CONSTRAINT `ve_ibfk_3` FOREIGN KEY (`suatchieu_id`) REFERENCES `suatchieu` (`id`);

--
-- Các ràng buộc cho bảng `ve_food`
--
ALTER TABLE `ve_food`
  ADD CONSTRAINT `ve_food_ibfk_1` FOREIGN KEY (`fastfood_id`) REFERENCES `fastfood` (`id`),
  ADD CONSTRAINT `ve_food_ibfk_2` FOREIGN KEY (`ve_id`) REFERENCES `ve` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
