-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2018 at 01:31 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it355-ispit`
--

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `addDate` date DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favouritessongs`
--

CREATE TABLE `favouritessongs` (
  `id` int(11) NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `FAVOURITES_ID` int(11) DEFAULT NULL,
  `SONG_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `ROLEID` int(11) DEFAULT NULL,
  `KORISNIKEMAIL` varchar(512) NOT NULL,
  `KORISNIKPASSWORD` varchar(1024) NOT NULL,
  `KORISNIKIME` varchar(128) DEFAULT NULL,
  `KORISNIKPREZIME` varchar(128) DEFAULT NULL,
  `KORISNIKAKTIVAN` tinyint(1) NOT NULL,
  `KORISNIKREGISTROVAN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `KORISNIKUSERNAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`ROLEID`, `KORISNIKEMAIL`, `KORISNIKPASSWORD`, `KORISNIKIME`, `KORISNIKPREZIME`, `KORISNIKAKTIVAN`, `KORISNIKREGISTROVAN`, `KORISNIKUSERNAME`) VALUES
(1, 'ivan@gmail.com', '123', 'Ivan', 'Ilic', 1, '2018-04-15 20:52:40', 'ivan'),
(2, 'nemanj@gmail.com', '123', 'Nemanja', 'Kuzmanovic', 1, '2018-04-15 20:52:46', 'nemanja');

-- --------------------------------------------------------

--
-- Table structure for table `markatelefona`
--

CREATE TABLE `markatelefona` (
  `MARKAID` int(11) NOT NULL,
  `MARKANAZIV` varchar(256) NOT NULL,
  `MARKAOPIS` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `markatelefona`
--

INSERT INTO `markatelefona` (`MARKAID`, `MARKANAZIV`, `MARKAOPIS`) VALUES
(1, 'lukahe', 'opisjeodlican');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) NOT NULL,
  `song_id` int(11) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rola`
--

CREATE TABLE `rola` (
  `ROLEID` int(11) NOT NULL,
  `ROLENAZIV` varchar(128) NOT NULL,
  `ROLEAKTIVNA` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rola`
--

INSERT INTO `rola` (`ROLEID`, `ROLENAZIV`, `ROLEAKTIVNA`) VALUES
(1, 'ROLE_ADMIN', 1),
(2, 'ROLE_USER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `GENRE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `telefon`
--

CREATE TABLE `telefon` (
  `TELEFONID` int(11) NOT NULL,
  `MARKAID` int(11) DEFAULT NULL,
  `TELEFONNAZIV` varchar(256) NOT NULL,
  `TELEFONOPIS` varchar(2048) NOT NULL,
  `TELEFONMEMORIJA` varchar(256) NOT NULL,
  `TELEFONBRZINAPROCESORA` varchar(256) NOT NULL,
  `TELEFONJACINAKAMERE` int(11) NOT NULL,
  `TELEFONVODOOTPORAN` tinyint(1) NOT NULL,
  `KORISNIKUSERNAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `telefon`
--

INSERT INTO `telefon` (`TELEFONID`, `MARKAID`, `TELEFONNAZIV`, `TELEFONOPIS`, `TELEFONMEMORIJA`, `TELEFONBRZINAPROCESORA`, `TELEFONJACINAKAMERE`, `TELEFONVODOOTPORAN`, `KORISNIKUSERNAME`) VALUES
(1, 1, 'asd', 'gkh', '45', '46', 12, 0, 'ivan'),
(3, 1, 'kl', 'uio', 'hjkl', 'uip', 78, 0, 'ivan'),
(4, 1, 'uyhhj', 'gh', '56', '3', 6, 1, 'ivan'),
(5, 1, 'sjajan', 'odlican', '234', '234', 12, 1, 'ivan');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favouritessongs`
--
ALTER TABLE `favouritessongs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_o1td455wdkf2fvbg7pbyhetu1` (`FAVOURITES_ID`),
  ADD KEY `FK_ayvyh4qerxo9rsbewl56tdlb3` (`SONG_ID`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD UNIQUE KEY `KORISNIKUSERNAME` (`KORISNIKUSERNAME`),
  ADD KEY `FK_RELATIONSHIP_3` (`ROLEID`);

--
-- Indexes for table `markatelefona`
--
ALTER TABLE `markatelefona`
  ADD PRIMARY KEY (`MARKAID`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_hu272gqquv9cit1y8oq4duc4k` (`song_id`),
  ADD KEY `FK_mphu7hmf4s84cegqol66t5mw7` (`user_username`);

--
-- Indexes for table `rola`
--
ALTER TABLE `rola`
  ADD PRIMARY KEY (`ROLEID`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_irg8krdp1nxvi2o91gqpqd7fs` (`GENRE_ID`);

--
-- Indexes for table `telefon`
--
ALTER TABLE `telefon`
  ADD PRIMARY KEY (`TELEFONID`),
  ADD KEY `FK_RELATIONSHIP_2` (`MARKAID`),
  ADD KEY `KORISNIKUSERNAME` (`KORISNIKUSERNAME`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favouritessongs`
--
ALTER TABLE `favouritessongs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `markatelefona`
--
ALTER TABLE `markatelefona`
  MODIFY `MARKAID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rola`
--
ALTER TABLE `rola`
  MODIFY `ROLEID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telefon`
--
ALTER TABLE `telefon`
  MODIFY `TELEFONID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favouritessongs`
--
ALTER TABLE `favouritessongs`
  ADD CONSTRAINT `FK_ayvyh4qerxo9rsbewl56tdlb3` FOREIGN KEY (`SONG_ID`) REFERENCES `songs` (`id`),
  ADD CONSTRAINT `FK_o1td455wdkf2fvbg7pbyhetu1` FOREIGN KEY (`FAVOURITES_ID`) REFERENCES `favourites` (`id`);

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ROLEID`) REFERENCES `rola` (`ROLEID`);

--
-- Constraints for table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `FK_hu272gqquv9cit1y8oq4duc4k` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`),
  ADD CONSTRAINT `FK_mphu7hmf4s84cegqol66t5mw7` FOREIGN KEY (`user_username`) REFERENCES `users` (`username`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `FK_irg8krdp1nxvi2o91gqpqd7fs` FOREIGN KEY (`GENRE_ID`) REFERENCES `genres` (`id`);

--
-- Constraints for table `telefon`
--
ALTER TABLE `telefon`
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`MARKAID`) REFERENCES `markatelefona` (`MARKAID`),
  ADD CONSTRAINT `telefon_ibfk_1` FOREIGN KEY (`KORISNIKUSERNAME`) REFERENCES `korisnik` (`KORISNIKUSERNAME`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
