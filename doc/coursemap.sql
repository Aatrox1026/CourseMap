-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-06-30 13:29:34
-- 伺服器版本： 10.4.17-MariaDB
-- PHP 版本： 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `coursemap`
--

-- --------------------------------------------------------

--
-- 資料表結構 `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` char(50) NOT NULL,
  `description` char(100) NOT NULL,
  `level` char(50) NOT NULL,
  `dname` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `course`
--

INSERT INTO `course` (`id`, `name`, `description`, `level`, `dname`) VALUES
(1, 'c1', 'desc', 'test', 'd1'),
(2, 'c2', 'desc', 'test', 'd2');

-- --------------------------------------------------------

--
-- 資料表結構 `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'd1'),
(2, 'd2');

-- --------------------------------------------------------

--
-- 資料表結構 `field`
--

CREATE TABLE `field` (
  `id` int(11) NOT NULL,
  `name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `field`
--

INSERT INTO `field` (`id`, `name`) VALUES
(1, 'f1'),
(2, 'f2');

-- --------------------------------------------------------

--
-- 資料表結構 `mapping_course_reference`
--

CREATE TABLE `mapping_course_reference` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `mapping_course_reference`
--

INSERT INTO `mapping_course_reference` (`id`, `cid`, `rid`) VALUES
(3, 1, 1),
(4, 1, 2),
(5, 2, 3),
(6, 2, 4);

-- --------------------------------------------------------

--
-- 資料表結構 `mapping_field_department_course`
--

CREATE TABLE `mapping_field_department_course` (
  `id` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `mapping_field_department_course`
--

INSERT INTO `mapping_field_department_course` (`id`, `fid`, `did`, `cid`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `reference`
--

CREATE TABLE `reference` (
  `id` int(11) NOT NULL,
  `name` char(50) NOT NULL,
  `type` char(50) NOT NULL,
  `link` char(100) DEFAULT NULL,
  `description` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `reference`
--

INSERT INTO `reference` (`id`, `name`, `type`, `link`, `description`) VALUES
(1, 'r1', 'test', NULL, NULL),
(2, 'r2', 'test', NULL, NULL),
(3, 'r3', 'test', NULL, NULL),
(4, 'r4', 'test', NULL, NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `dname` (`dname`);

--
-- 資料表索引 `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 資料表索引 `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 資料表索引 `mapping_course_reference`
--
ALTER TABLE `mapping_course_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `rid` (`rid`);

--
-- 資料表索引 `mapping_field_department_course`
--
ALTER TABLE `mapping_field_department_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fid` (`fid`),
  ADD KEY `did` (`did`),
  ADD KEY `cid` (`cid`);

--
-- 資料表索引 `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `field`
--
ALTER TABLE `field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `mapping_course_reference`
--
ALTER TABLE `mapping_course_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `mapping_field_department_course`
--
ALTER TABLE `mapping_field_department_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `reference`
--
ALTER TABLE `reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dname`) REFERENCES `department` (`name`);

--
-- 資料表的限制式 `mapping_course_reference`
--
ALTER TABLE `mapping_course_reference`
  ADD CONSTRAINT `mapping_course_reference_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `mapping_course_reference_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `reference` (`id`);

--
-- 資料表的限制式 `mapping_field_department_course`
--
ALTER TABLE `mapping_field_department_course`
  ADD CONSTRAINT `mapping_field_department_course_ibfk_1` FOREIGN KEY (`fid`) REFERENCES `field` (`id`),
  ADD CONSTRAINT `mapping_field_department_course_ibfk_2` FOREIGN KEY (`did`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `mapping_field_department_course_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `course` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
