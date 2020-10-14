-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2020 at 08:51 AM
-- Server version: 8.0.21-0ubuntu0.20.04.4
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rozvrh`
--

-- --------------------------------------------------------

--
-- Table structure for table `c_trieda`
--

CREATE TABLE `c_trieda` (
  `idc_trieda` int NOT NULL,
  `nazov_trieda` varchar(50) COLLATE utf8_slovak_ci NOT NULL,
  `skupina` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `c_trieda`
--

INSERT INTO `c_trieda` (`idc_trieda`, `nazov_trieda`, `skupina`) VALUES
(1, '1.A', 1),
(2, '2.B', 2),
(3, '3.B', 2);

-- --------------------------------------------------------

--
-- Table structure for table `preklad`
--

CREATE TABLE `preklad` (
  `idpreklad` int NOT NULL,
  `jazyk` varchar(2) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `retazec` varchar(100) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `preklad` text CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `preklad`
--

INSERT INTO `preklad` (`idpreklad`, `jazyk`, `retazec`, `preklad`) VALUES
(1, 'sk', 'pfg', 'Programovacie a interaktívne prostredia'),
(2, 'en', 'pfg', 'Programming and interactive environment'),
(3, 'sk', 'nadpis', 'Toto je rozvrh:'),
(4, 'en', 'nadpis', 'This is schedule:');

-- --------------------------------------------------------

--
-- Table structure for table `rozvrh`
--

CREATE TABLE `rozvrh` (
  `idrozvrh` int NOT NULL,
  `den` int NOT NULL,
  `hodina` int NOT NULL,
  `predmet` varchar(20) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `trieda` varchar(2) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `skupina` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `rozvrh`
--

INSERT INTO `rozvrh` (`idrozvrh`, `den`, `hodina`, `predmet`, `trieda`, `skupina`) VALUES
(1, 2, 2, 'pfg', '4b', 2),
(2, 2, 3, 'pfg', '4b', 2),
(3, 2, 1, 'irs', '4b', 2),
(4, 4, 0, 'pro', '3a', 1),
(5, 4, 5, 'tv', '1a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzivatelia`
--

CREATE TABLE `uzivatelia` (
  `iduzivatelia` int NOT NULL,
  `meno` varchar(50) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `priezvisko` varchar(100) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `datum_narodenia` date NOT NULL,
  `id_c_trieda` int NOT NULL DEFAULT '0',
  `logname` varchar(150) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci COMMENT='tabulka 14.10.2020   netusim co robim';

--
-- Dumping data for table `uzivatelia`
--

INSERT INTO `uzivatelia` (`iduzivatelia`, `meno`, `priezvisko`, `datum_narodenia`, `id_c_trieda`, `logname`, `password`) VALUES
(1, 'Matej', 'Holárek', '2003-02-11', 0, 'matej.holarek', 'e6ddfcfdbb8c32baac394a41229fcb18271c5af6'),
(2, 'Joe', 'Lemon', '2002-05-12', 0, 'joe.lemon', 'password'),
(3, 'Natasha', 'Fraser', '2003-05-04', 0, 'natasha.fraser', 'password'),
(4, 'Max', 'Orange', '2002-02-11', 0, 'max.orange', 'password');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `c_trieda`
--
ALTER TABLE `c_trieda`
  ADD PRIMARY KEY (`idc_trieda`);

--
-- Indexes for table `preklad`
--
ALTER TABLE `preklad`
  ADD PRIMARY KEY (`idpreklad`);

--
-- Indexes for table `rozvrh`
--
ALTER TABLE `rozvrh`
  ADD PRIMARY KEY (`idrozvrh`);

--
-- Indexes for table `uzivatelia`
--
ALTER TABLE `uzivatelia`
  ADD PRIMARY KEY (`iduzivatelia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `c_trieda`
--
ALTER TABLE `c_trieda`
  MODIFY `idc_trieda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `preklad`
--
ALTER TABLE `preklad`
  MODIFY `idpreklad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rozvrh`
--
ALTER TABLE `rozvrh`
  MODIFY `idrozvrh` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `uzivatelia`
--
ALTER TABLE `uzivatelia`
  MODIFY `iduzivatelia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
