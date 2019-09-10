-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2019 at 03:15 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gcmdb`
--
CREATE DATABASE IF NOT EXISTS `gcmdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `gcmdb`;

-- --------------------------------------------------------

--
-- Table structure for table `consulter`
--

CREATE TABLE IF NOT EXISTS `consulter` (
  `DT_CONS` date NOT NULL,
  `MAT_PAT` int(20) NOT NULL,
  `MAT_MED` int(20) NOT NULL,
  PRIMARY KEY (`MAT_PAT`,`MAT_MED`,`DT_CONS`),
  KEY `MAT_MED` (`MAT_MED`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `contenir`
--

CREATE TABLE IF NOT EXISTS `contenir` (
  `ID_ORD` int(11) NOT NULL,
  `ID_MEC` int(11) NOT NULL,
  `POSOLOGIE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_ORD`,`ID_MEC`),
  KEY `ID_MEC` (`ID_MEC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `examen`
--

CREATE TABLE IF NOT EXISTS `examen` (
  `NUM_EXM` int(11) NOT NULL,
  `MAT_MED` int(20) NOT NULL,
  `MAT_PAT` int(20) NOT NULL,
  `ID_SER` int(11) DEFAULT NULL,
  `NOM_SER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DT_EXM` date DEFAULT NULL,
  `RES_EXM` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`NUM_EXM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `maladie`
--

CREATE TABLE IF NOT EXISTS `maladie` (
  `ID_MALADIE` int(11) NOT NULL,
  `NOM_MALADIE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_MALADIE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `medecin`
--

CREATE TABLE IF NOT EXISTS `medecin` (
  `MAT_MED` int(20) NOT NULL,
  `NOM_MED` varchar(255) COLLATE utf8_bin NOT NULL,
  `PRN_MED` varchar(255) COLLATE utf8_bin NOT NULL,
  `DT_NAIS` date DEFAULT NULL,
  `LIEU_NAIS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NATIONALITE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SPECIALITE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NUM_TEL_FX` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `NUM_TEL_MOB` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`MAT_MED`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `medecin`
--

INSERT INTO `medecin` (`MAT_MED`, `NOM_MED`, `PRN_MED`, `DT_NAIS`, `LIEU_NAIS`, `NATIONALITE`, `ADR`, `SPECIALITE`, `NUM_TEL_FX`, `NUM_TEL_MOB`) VALUES
(1111111111, 'AAAA', 'BBBB', '1974-12-31', 'Batna', 'Algrienne', 'Batna', 'Ophtalmologie', '0101010101', '0505050505');

-- --------------------------------------------------------

--
-- Table structure for table `medicament`
--

CREATE TABLE IF NOT EXISTS `medicament` (
  `ID_MEC` int(11) NOT NULL,
  `NOM_MEC` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DCI_MEC` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_MEC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ordonnance`
--

CREATE TABLE IF NOT EXISTS `ordonnance` (
  `ID_ORD` int(11) NOT NULL,
  `MAT_PAT` int(20) DEFAULT NULL,
  `MAT_MED` int(20) DEFAULT NULL,
  PRIMARY KEY (`ID_ORD`),
  KEY `MAT_PAT` (`MAT_PAT`),
  KEY `MAT_MED` (`MAT_MED`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `MAT_PAT` int(20) NOT NULL,
  `NOM_PAT` varchar(255) COLLATE utf8_bin NOT NULL,
  `PRN_PAT` varchar(255) COLLATE utf8_bin NOT NULL,
  `DT_NAIS` date DEFAULT NULL,
  `LIEU_NAIS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NATIONALITE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROFESSION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NUM_TEL_FX` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `NUM_TEL_MOB` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `ANTECEDANTS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DT_INSCRIPTION` date DEFAULT NULL,
  PRIMARY KEY (`MAT_PAT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`MAT_PAT`, `NOM_PAT`, `PRN_PAT`, `DT_NAIS`, `LIEU_NAIS`, `NATIONALITE`, `ADR`, `PROFESSION`, `NUM_TEL_FX`, `NUM_TEL_MOB`, `ANTECEDANTS`, `DT_INSCRIPTION`) VALUES
(1111111111, 'PPPP', 'pppp', '1980-01-31', 'Batna', 'Algrienne', 'Batna', 'Fonctionnaire', '0101010101', '0505050505', 'aaaaaaaaaaaaa', '2019-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `rendez_vous`
--

CREATE TABLE IF NOT EXISTS `rendez_vous` (
  `NUM_RDV` int(11) NOT NULL,
  `MAT_MED` int(20) DEFAULT NULL,
  `MAT_PAT` int(20) DEFAULT NULL,
  `DT_RDV` date DEFAULT NULL,
  `ID_SER` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUM_RDV`),
  KEY `MAT_MED` (`MAT_MED`),
  KEY `MAT_PAT` (`MAT_PAT`),
  KEY `ID_SER` (`ID_SER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `rendez_vous`
--

INSERT INTO `rendez_vous` (`NUM_RDV`, `MAT_MED`, `MAT_PAT`, `DT_RDV`, `ID_SER`) VALUES
(1, 1111111111, 1111111111, '2000-08-04', 1),
(2, 1111111111, 1111111111, '2019-08-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `ID_SER` int(11) NOT NULL,
  `NOM_SER` varchar(255) COLLATE utf8_bin NOT NULL,
  `TYPE_SER` varchar(255) COLLATE utf8_bin NOT NULL,
  `ADR_SER` varchar(255) COLLATE utf8_bin NOT NULL,
  `NUM_TEL_FX` varchar(30) COLLATE utf8_bin NOT NULL,
  `NUM_TEL_MOB` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_SER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`ID_SER`, `NOM_SER`, `TYPE_SER`, `ADR_SER`, `NUM_TEL_FX`, `NUM_TEL_MOB`) VALUES
(1, 'Ophtalmologie', 'Chirurgie', 'Batna', '0101010101', '0505050505');

-- --------------------------------------------------------

--
-- Table structure for table `souffrir`
--

CREATE TABLE IF NOT EXISTS `souffrir` (
  `ID_MALADIE` int(11) NOT NULL,
  `MAT_PAT` int(20) NOT NULL,
  PRIMARY KEY (`ID_MALADIE`,`MAT_PAT`),
  KEY `MAT_PAT` (`MAT_PAT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
