-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Abr-2018 às 12:27
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perfplace`
--
CREATE DATABASE IF NOT EXISTS `perfplace` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `perfplace`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cafe_style`
--

CREATE TABLE `cafe_style` (
  `c_id` int(10) UNSIGNED NOT NULL,
  `c_name` varchar(100) NOT NULL,
  `c_pagename` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cafe_style`
--

INSERT INTO `cafe_style` (`c_id`, `c_name`, `c_pagename`) VALUES
(1, 'Rock and Roll', 'Rock.html'),
(2, 'Snack bar', 'snackbar.html'),
(3, 'Discoteca', 'discotec.html'),
(4, 'Hip Hop', ''),
(5, 'Jazz', 'jazz.html');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coffees`
--

CREATE TABLE `coffees` (
  `c_id` int(10) UNSIGNED NOT NULL,
  `c_name` varchar(100) NOT NULL,
  `c_rating` int(1) NOT NULL,
  `c_location` varchar(255) NOT NULL,
  `c_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `food`
--

CREATE TABLE `food` (
  `f_id` int(10) UNSIGNED NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `f_pagename` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `food`
--

INSERT INTO `food` (`f_id`, `f_name`, `f_pagename`) VALUES
(1, 'Tradicional Portuguesa', 'caseiro.html'),
(2, 'Mexicana', 'mexicano.html'),
(3, 'Italiano', 'Italiano.html'),
(4, 'Chines', ''),
(5, 'Gourmet', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `restaurantes`
--

CREATE TABLE `restaurantes` (
  `r_id` int(10) UNSIGNED NOT NULL,
  `r_name` varchar(100) NOT NULL,
  `r_rating` int(1) NOT NULL,
  `r_location` varchar(255) NOT NULL,
  `r_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `restaurantes_food`
--

CREATE TABLE `restaurantes_food` (
  `rf_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `food_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `u_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `register_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`u_id`, `username`, `password`, `email`, `register_date`) VALUES
(1, 'eduardo', '1234', 'sadsadasd@gmail.com', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cafe_style`
--
ALTER TABLE `cafe_style`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `coffees`
--
ALTER TABLE `coffees`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `restaurantes`
--
ALTER TABLE `restaurantes`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `restaurantes_food`
--
ALTER TABLE `restaurantes_food`
  ADD PRIMARY KEY (`rf_id`);

--
-- Indexes for table `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
