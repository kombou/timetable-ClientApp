-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 16 oct. 2018 à 15:56
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bd_timetable`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `IDCLASSE` int(11) NOT NULL AUTO_INCREMENT,
  `IDFILIERE` int(11) NOT NULL,
  `CODGRADE` varchar(5) NOT NULL,
  `NIVEAU` varchar(10) NOT NULL,
  `IDSPECIALITE` int(11) NOT NULL,
  PRIMARY KEY (`IDCLASSE`),
  UNIQUE KEY `IDFILIERE` (`IDFILIERE`,`CODGRADE`,`NIVEAU`,`IDSPECIALITE`),
  KEY `CODGRADE` (`CODGRADE`),
  KEY `IDSPECIALITE` (`IDSPECIALITE`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`IDCLASSE`, `IDFILIERE`, `CODGRADE`, `NIVEAU`, `IDSPECIALITE`) VALUES
(1, 1, 'L', '1', 4),
(2, 1, 'L', '2', 1),
(3, 1, 'L', '2', 2),
(4, 1, 'L', '2', 3),
(5, 1, 'L', '3', 1),
(6, 1, 'L', '3', 2),
(7, 1, 'L', '3', 3),
(8, 1, 'M', '4', 4),
(9, 2, 'L', '1', 4),
(10, 2, 'L', '2', 4),
(14, 2, 'L', '3', 4),
(11, 2, 'L', '3', 5),
(12, 2, 'L', '3', 6),
(13, 2, 'L', '3', 7);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(255) NOT NULL,
  `passhash` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `imgSrc` varchar(255) DEFAULT NULL,
  `profil` int(11) NOT NULL DEFAULT '0',
  `confirmation_token` varchar(60) DEFAULT NULL,
  `confirmated_at` datetime DEFAULT NULL,
  `reset_token` varchar(60) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matricule` (`matricule`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `matricule`, `passhash`, `email`, `imgSrc`, `profil`, `confirmation_token`, `confirmated_at`, `reset_token`, `reset_at`, `status`) VALUES
(1, '14O2306', '654B67B69A4B77002804D67E2E5857BCF4AE79B18B10C2A977766D8B44816D7B8F8B799CA21BF8F9A08E1C817C0541A3BDB79926567296DD4961C8858F875EC7', 'yvan.kombou@gmail.com', 'yvan.png', 0, '', '2018-09-27 03:29:40', '', '2018-10-01 15:19:34', 1),
(19, '15T2309', 'DF42A2C3B765D0BAACE5ADC08077D7F65002409B619077F2662EE2FC19FB7518DDC56C78C3EB4CA8BC739BC3E945B4318C2F29D3D2B3EC4A374C5E7E0B98167A', 'armelsauvy00@gmail.com', NULL, 0, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWX', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `connect`
--

DROP TABLE IF EXISTS `connect`;
CREATE TABLE IF NOT EXISTS `connect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(255) NOT NULL,
  `connectTime` date NOT NULL,
  `deconnectTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(60) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id`, `matricule`, `nom`, `prenom`) VALUES
(1, '00E01', 'KOUOKAM', 'Etienne'),
(2, '00E02', 'ABESSOLO', 'Ghislain'),
(3, '00E03', 'AMINOU', 'Halidou'),
(4, '00E04', 'NKONDOCK', 'Nicolas'),
(5, '00E05', 'MONTHE', 'Valerie'),
(6, '00E06', 'TSOPZE', 'Nobert'),
(7, '00E07', 'DOMGA', 'Rodrigue'),
(8, '00E08', 'HAMZA', 'Adamou'),
(9, '00E09', 'TINDO', 'Gibert'),
(10, '00E10', 'JIOMEKONG', 'Fidel'),
(11, '00E11', 'KIMBI', 'Xaviera'),
(12, '00E12', 'EBELE', 'Serge');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `MATRICULE` varchar(15) NOT NULL,
  `NOM` varchar(100) NOT NULL,
  `SEXE` char(1) NOT NULL,
  `PERE` varchar(50) DEFAULT NULL,
  `MERE` varchar(50) DEFAULT NULL,
  `ADRESSE` varchar(100) DEFAULT NULL,
  `DATENAISSANCE` varchar(30) DEFAULT NULL,
  `CODNAT` char(5) DEFAULT NULL,
  `CODPROVINCE` char(5) DEFAULT NULL,
  `VILLENAISSANCE` varchar(100) DEFAULT NULL,
  `DIPLOME` varchar(10) DEFAULT NULL,
  `SESSION` int(11) DEFAULT NULL,
  `DATEINS` datetime DEFAULT NULL,
  `LANGUE` char(1) DEFAULT NULL,
  `REFUGIE` int(11) DEFAULT NULL,
  `handicape` int(11) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `AccessFailedCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`MATRICULE`),
  KEY `CODNAT` (`CODNAT`),
  KEY `CODPROVINCE` (`CODPROVINCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`MATRICULE`, `NOM`, `SEXE`, `PERE`, `MERE`, `ADRESSE`, `DATENAISSANCE`, `CODNAT`, `CODPROVINCE`, `VILLENAISSANCE`, `DIPLOME`, `SESSION`, `DATEINS`, `LANGUE`, `REFUGIE`, `handicape`, `telephone`, `AccessFailedCount`) VALUES
('14O2306', 'KOMBOU', 'M', 'KOUAHOU Mathieu', 'JOUENGOU Charlotte', 'Yaoundé/Jouvence', '13/06/1995', 'CMR', 'CE', 'Yaoundé', 'BAC', 2014, '2018-09-18 00:00:00', 'F', 0, 0, '697527241', NULL),
('15F2813', 'KONO FRANCOISE JOCELYNE', 'F', 'KONO', 'KONO', 'YAOUNDE', '11-11-1994', 'CMR', 'CE', 'DOUALA', 'BAC', 2015, '2015-09-09 08:44:36', 'F', 0, 0, '693184567', NULL),
('15J2655', 'NZEULEU ULRICH RUBIN', 'M', 'NZEULEU', 'NZEULEU', 'YAOUNDE', '06-05-1995', 'CMR', 'OU', 'YAOUNDE', 'BAC', 2015, '2015-09-09 08:44:36', 'F', 0, 0, '695390226', NULL),
('15J2658', 'NYATCHO TONYA FRANK', 'M', 'NYATCHO', 'TONYA', 'YAOUNDE', '14-04-1997', 'CMR', 'SD', 'YAOUNDE', 'BAC', 2015, '2015-09-09 08:44:36', 'F', 0, 0, '694154892', NULL),
('15J2660', 'MOUBE SIGNE', 'M', 'MOUBE', 'SIGNE', 'BAFOUSSAM', '11-09-1996', 'CMR', 'ES', 'EBOLOWA', 'BAC', 2013, '2015-09-09 08:44:36', 'F', 0, 0, '695147820', NULL),
('15J2921', 'KAMELA KAMELA ALESTERD', 'M', 'KAMELA', 'KAMELA', 'BAFOUSSAM', '7-05-1994', 'TCHD', 'LT', 'BAFOUSSAM', 'BAC', 2015, '2015-09-09 08:44:36', 'F', 0, 0, '657894208', NULL),
('15Q2838', 'MVOGO ELOBO RODRIGU', 'M', 'MVOGO', 'ELOBE', 'YOUNDE', '05-01-1996', 'CMR', 'CE', 'EBOLOWA', 'BAC', 2015, '2015-09-09 08:44:36', 'F', 0, 0, '654230148', NULL),
('15T2267', 'OUOKAM KAMDEM PAULIN', 'M', 'KOUOKAM', 'KAMDEM', 'DOUALA', '07-04-1997', 'NGR', 'LT', 'BAFANG', 'BAC', 2011, '2015-09-09 08:44:36', 'E', 0, 0, '699081495', NULL),
('15T2309', 'FEDOOUNG SANOU ARMEL', 'M', 'SANOU', 'JIOFACK', 'YAOUNDE', '06-03-1997', 'CMR', 'OU', 'BAFOUSSAM', 'BAC', 2015, '2015-09-09 08:44:36', 'E', 0, 0, '695390226', NULL),
('15T2337', 'GOUEND NICK JOEL', 'M', 'GOUEND', 'GOUENDE', 'YAOUNDE', '03-07-1999', 'CMR', 'CE', 'YAOUNDE', 'BAC', 2010, '2015-09-09 08:44:36', 'F', 0, 0, '663626162', NULL),
('15T2441', 'GUIMFAC MARTIN DIVIN', 'M', 'GUIMFAC', 'IPUPA', 'YAOUNDE', '07-03-1996', 'CNG', 'CE', 'BRAZZAVILLE', 'BAC', 2015, '2015-09-09 08:44:36', 'F', 0, 0, '693184346', NULL),
('15T2592', 'FONKOUO SANOU LOIC', 'M', 'SANOU', 'JIOFACK', 'YAOUNDE', '06-03-1997', 'CMR', 'OU', 'BAFOUSSAM', 'BAC', 2015, '2015-09-09 08:44:36', 'E', 0, 0, '699986211', NULL),
('15T2687', 'NDJAKA MBAH EUGENE ULRICH', 'M', 'MBAH', 'NDJAKA', 'YABASSI', '31-07-1995', 'CMR', 'SD', 'YABASSI', 'BAC', 2015, '2015-09-09 08:44:36', 'F', 0, 0, '691966876', NULL),
('15T2892', 'KENGO NKEMZEM BENITO', 'M', 'KENGO', 'NKEMZEM', 'YAOUNDE', '14-05-1997', 'SNG', 'ES', 'YAOUNDE', 'BAC', 2015, '2015-09-09 08:44:36', 'F', 0, 0, '698854521', NULL),
('15U2156', 'DOUNGUE METABOU COSTA', 'M', 'DOUNGUE', 'METABOU', 'MBOUDA', '04-01-1997', 'GBN', 'OU', 'MBOUDA', 'BAC', 2015, '2015-09-09 08:44:36', 'F', 0, 0, '656219516', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

DROP TABLE IF EXISTS `filiere`;
CREATE TABLE IF NOT EXISTS `filiere` (
  `IDFILIERE` int(11) NOT NULL AUTO_INCREMENT,
  `CODFILIERE` varchar(10) NOT NULL,
  `NOM` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDFILIERE`),
  UNIQUE KEY `filiere_index1402` (`CODFILIERE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`IDFILIERE`, `CODFILIERE`, `NOM`, `NAME`) VALUES
(1, 'ICT4D', 'ICT', 'INFORMATION COMMUNICATION TECHNOLOGY FOR DEVELOPMENT'),
(2, 'INF', 'INFO', 'INFORMATIQUE FONDAMENTALE');

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `CODGRADE` varchar(5) NOT NULL,
  `INTITULE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODGRADE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `grade`
--

INSERT INTO `grade` (`CODGRADE`, `INTITULE`) VALUES
('D', 'Doctorat'),
('L', 'Licence'),
('M', 'Master');

-- --------------------------------------------------------

--
-- Structure de la table `inscrit`
--

DROP TABLE IF EXISTS `inscrit`;
CREATE TABLE IF NOT EXISTS `inscrit` (
  `IDCLASSE` int(11) NOT NULL,
  `MATRICULE` varchar(15) NOT NULL,
  `ANNEE` int(11) NOT NULL,
  PRIMARY KEY (`IDCLASSE`,`MATRICULE`,`ANNEE`),
  KEY `MATRICULE` (`MATRICULE`),
  KEY `ANNEE` (`ANNEE`),
  KEY `IDCLASSE` (`IDCLASSE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `inscrit`
--

INSERT INTO `inscrit` (`IDCLASSE`, `MATRICULE`, `ANNEE`) VALUES
(1, '15T2309', 2016),
(1, '15T2441', 2016),
(1, '15T2592', 2016),
(1, '15T2687', 2016),
(2, '15J2658', 2017),
(2, '15T2309', 2017),
(2, '15T2441', 2017),
(2, '15T2592', 2017),
(2, '15T2687', 2017),
(3, '15J2658', 2017),
(3, '15T2309', 2017),
(3, '15T2441', 2017),
(3, '15T2592', 2017),
(3, '15T2687', 2017),
(4, '15J2658', 2017),
(4, '15T2309', 2017),
(4, '15T2441', 2017),
(4, '15T2592', 2017),
(4, '15T2687', 2017),
(5, '15J2658', 2018),
(5, '15T2309', 2018),
(5, '15T2441', 2018),
(5, '15T2592', 2018),
(5, '15T2687', 2018),
(6, '15J2658', 2018),
(6, '15T2309', 2018),
(6, '15T2441', 2018),
(6, '15T2592', 2018),
(6, '15T2687', 2018),
(7, '15J2658', 2018),
(7, '15T2309', 2018),
(7, '15T2441', 2018),
(7, '15T2592', 2018),
(7, '15T2687', 2018);

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

DROP TABLE IF EXISTS `jour`;
CREATE TABLE IF NOT EXISTS `jour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jour`
--

INSERT INTO `jour` (`id`, `nom`) VALUES
(1, 'LUNDI'),
(2, 'MARDI'),
(3, 'MERCREDI'),
(4, 'JEUDI'),
(5, 'VENDREDI'),
(6, 'SAMEDI');

-- --------------------------------------------------------

--
-- Structure de la table `mention`
--

DROP TABLE IF EXISTS `mention`;
CREATE TABLE IF NOT EXISTS `mention` (
  `CODMENTION` char(3) NOT NULL,
  `VALEURMIN` decimal(5,2) NOT NULL,
  `VALEURMAX` decimal(5,2) NOT NULL,
  `QUALITEPOINTS` decimal(5,2) DEFAULT '0.00',
  `ETAT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CODMENTION`,`VALEURMIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mention`
--

INSERT INTO `mention` (`CODMENTION`, `VALEURMIN`, `VALEURMAX`, `QUALITEPOINTS`, `ETAT`) VALUES
('A', '80.00', '100.00', '4.00', 0),
('A-', '75.00', '79.00', '3.70', 0),
('B', '65.00', '69.00', '3.00', 0),
('B+', '70.00', '74.00', '3.30', 0),
('B-', '60.00', '64.00', '2.70', 0),
('C', '50.00', '54.00', '2.00', 0),
('C+', '55.00', '59.00', '2.30', 0),
('C-', '45.00', '49.00', '1.70', 0),
('D', '35.00', '39.00', '1.00', 0),
('D+', '40.00', '44.00', '1.30', 0),
('E', '30.00', '34.00', '0.00', 0),
('F', '0.00', '29.00', '0.00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `moyennes`
--

DROP TABLE IF EXISTS `moyennes`;
CREATE TABLE IF NOT EXISTS `moyennes` (
  `MATRICULE` varchar(15) NOT NULL,
  `IDUE` int(10) UNSIGNED NOT NULL,
  `IDSEMESTRE` int(11) NOT NULL,
  `ANNEE` int(11) NOT NULL,
  `MOYENNE` decimal(6,2) DEFAULT NULL,
  `CODMENTION` varchar(3) DEFAULT NULL,
  `CREDIT` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `QdP` decimal(6,2) NOT NULL DEFAULT '0.00',
  `Decision` varchar(5) NOT NULL DEFAULT 'NC',
  PRIMARY KEY (`MATRICULE`,`IDUE`,`IDSEMESTRE`,`ANNEE`),
  KEY `IDUE` (`IDUE`),
  KEY `FK_moyennes_3` (`CODMENTION`),
  KEY `ANNEE` (`ANNEE`),
  KEY `IDSEMESTRE` (`IDSEMESTRE`),
  KEY `MATRICULE` (`MATRICULE`),
  KEY `MOYENNE` (`MOYENNE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `moyennes`
--

INSERT INTO `moyennes` (`MATRICULE`, `IDUE`, `IDSEMESTRE`, `ANNEE`, `MOYENNE`, `CODMENTION`, `CREDIT`, `QdP`, `Decision`) VALUES
('15J2658', 1, 1, 2018, '74.00', 'B+', 6, '3.30', 'CA'),
('15J2658', 2, 1, 2018, '50.00', 'C', 6, '2.00', 'CA'),
('15J2658', 12, 2, 2018, '55.00', 'C+', 6, '2.30', 'CA'),
('15J2658', 13, 2, 2018, '60.00', 'B-', 6, '2.70', 'CA'),
('15J2658', 19, 1, 2017, '50.00', 'C', 6, '2.00', 'CA'),
('15J2658', 20, 1, 2017, '45.00', 'C-', 6, '1.70', 'CANT'),
('15J2658', 21, 2, 2017, '69.00', 'B', 5, '3.00', 'CA'),
('15J2658', 25, 1, 2016, '48.00', 'C-', 6, '1.70', 'CANT'),
('15J2658', 26, 1, 2016, '50.00', 'C', 5, '2.00', 'CA'),
('15J2658', 28, 2, 2016, '80.00', 'A', 6, '4.00', 'CA'),
('15J2658', 29, 2, 2016, '75.00', 'A-', 6, '3.70', 'CA'),
('15T2309', 1, 1, 2018, '70.00', 'B+', 6, '3.30', 'CA'),
('15T2309', 2, 1, 2018, '50.00', 'C', 6, '2.00', 'CA'),
('15T2309', 12, 2, 2018, '60.00', 'B-', 6, '2.70', 'CA'),
('15T2309', 13, 2, 2018, '40.00', 'D+', 6, '1.30', 'CANT'),
('15T2309', 19, 1, 2017, '65.00', 'B', 6, '3.00', 'CA'),
('15T2309', 20, 1, 2017, '60.00', 'B-', 6, '2.70', 'CA'),
('15T2309', 21, 2, 2017, '80.00', 'A', 5, '4.00', 'CA'),
('15T2309', 25, 1, 2016, '55.00', 'C+', 6, '2.30', 'CA'),
('15T2309', 26, 1, 2016, '49.00', 'C-', 5, '1.70', 'CANT'),
('15T2309', 28, 2, 2016, '50.00', 'C', 6, '2.00', 'CA'),
('15T2309', 29, 2, 2016, '55.00', 'C+', 6, '2.30', 'CA'),
('15T2441', 1, 1, 2018, '74.00', 'B+', 6, '3.30', 'CA'),
('15T2441', 2, 1, 2018, '45.00', 'C-', 6, '1.70', 'CANT'),
('15T2441', 12, 2, 2018, '50.00', 'C', 6, '2.00', 'CA'),
('15T2441', 13, 2, 2018, '55.00', 'C+', 6, '2.30', 'CA'),
('15T2441', 19, 1, 2017, '65.00', 'B', 6, '3.00', 'CA'),
('15T2441', 20, 1, 2017, '60.00', 'B-', 6, '2.70', 'CA'),
('15T2441', 21, 2, 2017, '55.00', 'C+', 5, '2.30', 'CA'),
('15T2441', 25, 1, 2016, '48.00', 'C-', 6, '1.70', 'CANT'),
('15T2441', 26, 1, 2016, '55.00', 'C+', 5, '2.30', 'CA'),
('15T2441', 28, 2, 2016, '80.00', 'A', 6, '4.00', 'CA'),
('15T2441', 29, 2, 2016, '50.00', 'C', 6, '2.00', 'CA'),
('15T2592', 1, 1, 2018, '70.00', 'B+', 6, '3.30', 'CA'),
('15T2592', 2, 1, 2018, '50.00', 'C', 6, '2.00', 'CA'),
('15T2592', 13, 2, 2018, '55.00', 'C+', 6, '2.30', 'CA'),
('15T2592', 19, 1, 2017, '45.00', 'C-', 6, '1.70', 'CANT'),
('15T2592', 20, 1, 2017, '30.00', 'E', 6, '0.00', 'NC'),
('15T2592', 21, 2, 2017, '68.00', 'B', 5, '3.00', 'CA'),
('15T2592', 25, 1, 2016, '48.00', 'C-', 6, '1.70', 'CANT'),
('15T2592', 26, 1, 2016, '50.00', 'C', 5, '2.00', 'CA'),
('15T2592', 28, 2, 2016, '53.00', 'C', 6, '2.00', 'CA'),
('15T2592', 29, 2, 2016, '80.00', 'A', 6, '4.00', 'CA'),
('15T2687', 1, 1, 2018, '55.00', 'C+', 6, '2.30', 'CA'),
('15T2687', 2, 1, 2018, '65.00', 'B', 6, '3.00', 'CA'),
('15T2687', 12, 2, 2018, '50.00', 'C', 6, '2.00', 'CA'),
('15T2687', 13, 2, 2018, '55.00', 'C+', 5, '2.30', 'CA'),
('15T2687', 19, 1, 2017, '65.00', 'B', 6, '3.00', 'CA'),
('15T2687', 20, 1, 2017, '60.00', 'B-', 6, '2.70', 'CA'),
('15T2687', 21, 2, 2017, '55.00', 'C+', 5, '2.30', 'CA'),
('15T2687', 25, 1, 2016, '48.00', 'C-', 6, '1.70', 'CANT'),
('15T2687', 26, 1, 2016, '55.00', 'C+', 5, '2.30', 'CA'),
('15T2687', 28, 2, 2016, '80.00', 'A', 6, '4.00', 'CA'),
('15T2687', 29, 2, 2016, '50.00', 'C', 6, '2.00', 'CA');

-- --------------------------------------------------------

--
-- Structure de la table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
CREATE TABLE IF NOT EXISTS `nationalite` (
  `CODNAT` char(5) NOT NULL,
  `PAYS` varchar(100) NOT NULL,
  `COUNTRY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODNAT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `nationalite`
--

INSERT INTO `nationalite` (`CODNAT`, `PAYS`, `COUNTRY`) VALUES
('CMR', 'CAMEROUN', 'CAMEROON'),
('CNG', 'CONGO', 'CONGO'),
('GBN', 'GABON', 'GABON'),
('GHA', 'GHANA', 'GHANA'),
('GUI', 'GUINEE', 'GUINEE'),
('NGR', 'NIGERIA', 'NIGERIA'),
('NIGER', 'NIGER', 'NIGER'),
('SNG', 'SENEGAL', 'SENEGAL'),
('TCHD', 'TCHAD', 'TCHAD');

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `NIVEAU` varchar(10) NOT NULL,
  `DESCRIPTION` varchar(50) NOT NULL,
  PRIMARY KEY (`NIVEAU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`NIVEAU`, `DESCRIPTION`) VALUES
('1', 'Licence 1'),
('2', 'Licence 2'),
('3', 'Licence 3'),
('4', 'Master 1'),
('5', 'Master 2'),
('6', 'Doctorat 1'),
('7', 'Doctorat 2'),
('8', 'Doctorat 3');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `IDUE` int(10) UNSIGNED NOT NULL,
  `MATRICULE` varchar(15) NOT NULL,
  `CODEEVALUATION` varchar(255) NOT NULL,
  `IDSEMESTRE` int(11) NOT NULL,
  `ANNEE` int(11) NOT NULL,
  `ANONYMAT` varchar(10) DEFAULT NULL,
  `NOTE` decimal(12,9) DEFAULT NULL,
  PRIMARY KEY (`IDUE`,`MATRICULE`,`CODEEVALUATION`,`IDSEMESTRE`,`ANNEE`),
  KEY `MATRICULE` (`MATRICULE`),
  KEY `CODEEVALUATION` (`CODEEVALUATION`),
  KEY `ANNEE` (`ANNEE`),
  KEY `IDSEMESTRE` (`IDSEMESTRE`),
  KEY `IDUE` (`IDUE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`IDUE`, `MATRICULE`, `CODEEVALUATION`, `IDSEMESTRE`, `ANNEE`, `ANONYMAT`, `NOTE`) VALUES
(1, '15J2658', 'CC', 1, 2018, NULL, '28.000000000'),
(1, '15J2658', 'EE', 1, 2018, NULL, '21.000000000'),
(1, '15J2658', 'TP', 1, 2018, NULL, '12.000000000'),
(1, '15T2309', 'CC', 1, 2018, '', '20.000000000'),
(1, '15T2309', 'EE', 1, 2018, '1', '40.000000000'),
(1, '15T2309', 'TP', 1, 2018, NULL, '20.000000000'),
(1, '15T2441', 'CC', 1, 2018, NULL, '24.000000000'),
(1, '15T2441', 'EE', 1, 2018, NULL, '20.000000000'),
(1, '15T2441', 'TP', 1, 2018, NULL, '21.000000000'),
(1, '15T2592', 'CC', 1, 2018, NULL, '12.000000000'),
(1, '15T2592', 'EE', 1, 2018, NULL, '28.000000000'),
(1, '15T2592', 'TP', 1, 2018, NULL, '20.000000000'),
(1, '15T2687', 'CC', 1, 2018, NULL, '20.000000000'),
(1, '15T2687', 'EE', 1, 2018, NULL, '26.000000000'),
(1, '15T2687', 'TP', 1, 2018, NULL, '29.000000000'),
(2, '15J2658', 'CC', 1, 2018, NULL, '21.000000000'),
(2, '15J2658', 'EE', 1, 2018, '12', '21.000000000'),
(2, '15J2658', 'TP', 1, 2018, NULL, '12.000000000'),
(2, '15T2309', 'CC', 1, 2018, NULL, '28.000000000'),
(2, '15T2309', 'EE', 1, 2018, NULL, '30.000000000'),
(2, '15T2309', 'TP', 1, 2018, NULL, '30.000000000'),
(2, '15T2441', 'CC', 1, 2018, NULL, '20.000000000'),
(2, '15T2441', 'EE', 1, 2018, NULL, '29.000000000'),
(2, '15T2441', 'TP', 1, 2018, NULL, '21.000000000'),
(2, '15T2592', 'CC', 1, 2018, NULL, '10.000000000'),
(2, '15T2592', 'EE', 1, 2018, NULL, '29.000000000'),
(2, '15T2592', 'TP', 1, 2018, NULL, '20.000000000'),
(2, '15T2687', 'CC', 1, 2018, NULL, '28.000000000'),
(2, '15T2687', 'EE', 1, 2018, NULL, '26.000000000'),
(2, '15T2687', 'TP', 1, 2018, NULL, '26.000000000'),
(12, '15J2658', 'CC', 2, 2018, NULL, '12.000000000'),
(12, '15J2658', 'EE', 2, 2018, NULL, '23.000000000'),
(12, '15J2658', 'TP', 2, 2018, '30', '30.000000000'),
(12, '15T2309', 'CC', 2, 2018, NULL, '12.000000000'),
(12, '15T2309', 'EE', 2, 2018, '5', '28.000000000'),
(12, '15T2309', 'TP', 2, 2018, '1', '14.000000000'),
(12, '15T2441', 'CC', 2, 2018, NULL, '12.000000000'),
(12, '15T2441', 'EE', 2, 2018, NULL, '24.000000000'),
(12, '15T2441', 'TP', 2, 2018, NULL, '17.000000000'),
(12, '15T2592', 'CC', 2, 2018, NULL, '21.000000000'),
(12, '15T2592', 'EE', 2, 2018, NULL, '21.000000000'),
(12, '15T2592', 'TP', 2, 2018, NULL, '32.000000000'),
(12, '15T2687', 'CC', 2, 2018, NULL, '26.000000000'),
(12, '15T2687', 'EE', 2, 2018, NULL, '24.000000000'),
(12, '15T2687', 'TP', 2, 2018, NULL, '29.000000000'),
(13, '15J2658', 'CC', 2, 2018, NULL, '21.000000000'),
(13, '15J2658', 'EE', 2, 2018, NULL, '32.000000000'),
(13, '15J2658', 'TP', 2, 2018, NULL, '21.000000000'),
(13, '15T2309', 'CC', 2, 2018, '', '12.000000000'),
(13, '15T2309', 'EE', 2, 2018, '1', '5.000000000'),
(13, '15T2309', 'TP', 2, 2018, NULL, '9.000000000'),
(13, '15T2441', 'CC', 2, 2018, NULL, '24.000000000'),
(13, '15T2441', 'EE', 2, 2018, NULL, '21.000000000'),
(13, '15T2441', 'TP', 2, 2018, NULL, '19.000000000'),
(13, '15T2592', 'CC', 2, 2018, NULL, '16.000000000'),
(13, '15T2592', 'EE', 2, 2018, NULL, '32.000000000'),
(13, '15T2592', 'TP', 2, 2018, NULL, '5.000000000'),
(13, '15T2687', 'CC', 2, 2018, NULL, '24.000000000'),
(13, '15T2687', 'EE', 2, 2018, NULL, '23.000000000'),
(13, '15T2687', 'TP', 2, 2018, NULL, '21.000000000'),
(19, '15J2658', 'CC', 1, 2017, NULL, '21.000000000'),
(19, '15J2658', 'EE', 1, 2017, NULL, '21.000000000'),
(19, '15J2658', 'TP', 1, 2017, NULL, '28.000000000'),
(19, '15T2309', 'CC', 1, 2017, NULL, '12.000000000'),
(19, '15T2309', 'EE', 1, 2017, NULL, '23.000000000'),
(19, '15T2309', 'TP', 1, 2017, NULL, '22.000000000'),
(19, '15T2441', 'CC', 1, 2017, NULL, '28.000000000'),
(19, '15T2441', 'EE', 1, 2017, NULL, '19.000000000'),
(19, '15T2441', 'TP', 1, 2017, NULL, '24.000000000'),
(19, '15T2592', 'CC', 1, 2017, NULL, '15.000000000'),
(19, '15T2592', 'EE', 1, 2017, NULL, '30.000000000'),
(19, '15T2592', 'TP', 1, 2017, NULL, '25.000000000'),
(19, '15T2687', 'CC', 1, 2017, NULL, '21.000000000'),
(19, '15T2687', 'EE', 1, 2017, NULL, '25.000000000'),
(19, '15T2687', 'TP', 1, 2017, NULL, '24.000000000'),
(20, '15J2658', 'CC', 1, 2017, NULL, '23.000000000'),
(20, '15J2658', 'EE', 1, 2017, '29', '29.000000000'),
(20, '15J2658', 'TP', 1, 2017, NULL, '25.000000000'),
(20, '15T2309', 'CC', 1, 2017, NULL, '14.000000000'),
(20, '15T2309', 'EE', 1, 2017, NULL, '35.000000000'),
(20, '15T2309', 'TP', 1, 2017, NULL, '20.000000000'),
(20, '15T2441', 'CC', 1, 2017, NULL, '25.000000000'),
(20, '15T2441', 'EE', 1, 2017, NULL, '19.000000000'),
(20, '15T2441', 'TP', 1, 2017, NULL, '24.000000000'),
(20, '15T2592', 'CC', 1, 2017, NULL, '19.000000000'),
(20, '15T2592', 'EE', 1, 2017, NULL, '28.000000000'),
(20, '15T2592', 'TP', 1, 2017, NULL, '29.000000000'),
(20, '15T2687', 'CC', 1, 2017, NULL, '19.000000000'),
(20, '15T2687', 'EE', 1, 2017, NULL, '24.000000000'),
(20, '15T2687', 'TP', 1, 2017, NULL, '24.000000000'),
(21, '15J2658', 'CC', 2, 2017, NULL, '12.000000000'),
(21, '15J2658', 'EE', 2, 2017, NULL, '29.000000000'),
(21, '15J2658', 'TP', 2, 2017, NULL, '24.000000000'),
(21, '15T2309', 'CC', 2, 2017, NULL, '10.000000000'),
(21, '15T2309', 'EE', 2, 2017, NULL, '25.000000000'),
(21, '15T2309', 'TP', 2, 2017, NULL, '15.000000000'),
(21, '15T2441', 'CC', 2, 2017, NULL, '28.000000000'),
(21, '15T2441', 'EE', 2, 2017, NULL, '20.000000000'),
(21, '15T2441', 'TP', 2, 2017, NULL, '19.000000000'),
(21, '15T2592', 'CC', 2, 2017, NULL, '18.000000000'),
(21, '15T2592', 'EE', 2, 2017, NULL, '26.000000000'),
(21, '15T2592', 'TP', 2, 2017, NULL, '24.000000000'),
(21, '15T2687', 'CC', 2, 2017, NULL, '28.000000000'),
(21, '15T2687', 'EE', 2, 2017, NULL, '30.000000000'),
(21, '15T2687', 'TP', 2, 2017, NULL, '28.000000000'),
(25, '15J2658', 'CC', 1, 2016, NULL, '18.000000000'),
(25, '15J2658', 'EE', 1, 2016, NULL, '18.000000000'),
(25, '15J2658', 'TP', 1, 2016, NULL, '29.000000000'),
(25, '15T2309', 'CC', 1, 2016, NULL, '19.000000000'),
(25, '15T2309', 'EE', 1, 2016, NULL, '25.000000000'),
(25, '15T2309', 'TP', 1, 2016, NULL, '20.000000000'),
(25, '15T2441', 'CC', 1, 2016, NULL, '15.000000000'),
(25, '15T2441', 'EE', 1, 2016, NULL, '24.000000000'),
(25, '15T2441', 'TP', 1, 2016, NULL, '21.000000000'),
(25, '15T2592', 'CC', 1, 2016, NULL, '23.000000000'),
(25, '15T2592', 'EE', 1, 2016, NULL, '24.000000000'),
(25, '15T2592', 'TP', 1, 2016, NULL, '12.000000000'),
(25, '15T2687', 'CC', 1, 2016, NULL, '20.000000000'),
(25, '15T2687', 'EE', 1, 2016, NULL, '24.000000000'),
(25, '15T2687', 'TP', 1, 2016, NULL, '20.000000000'),
(26, '15J2658', 'CC', 1, 2016, NULL, '13.000000000'),
(26, '15J2658', 'EE', 1, 2016, NULL, '28.000000000'),
(26, '15J2658', 'TP', 1, 2016, NULL, '24.000000000'),
(26, '15T2309', 'CC', 1, 2016, NULL, '12.000000000'),
(26, '15T2309', 'EE', 1, 2016, NULL, '18.000000000'),
(26, '15T2309', 'TP', 1, 2016, NULL, '19.000000000'),
(26, '15T2441', 'CC', 1, 2016, NULL, '15.000000000'),
(26, '15T2441', 'EE', 1, 2016, NULL, '24.000000000'),
(26, '15T2441', 'TP', 1, 2016, NULL, '20.000000000'),
(26, '15T2592', 'CC', 1, 2016, NULL, '15.000000000'),
(26, '15T2592', 'EE', 1, 2016, NULL, '12.000000000'),
(26, '15T2592', 'TP', 1, 2016, NULL, '35.000000000'),
(26, '15T2687', 'CC', 1, 2016, NULL, '17.000000000'),
(26, '15T2687', 'EE', 1, 2016, NULL, '28.000000000'),
(26, '15T2687', 'TP', 1, 2016, NULL, '23.000000000'),
(28, '15J2658', 'CC', 2, 2016, NULL, '18.000000000'),
(28, '15J2658', 'EE', 2, 2016, NULL, '24.000000000'),
(28, '15J2658', 'TP', 2, 2016, NULL, '24.000000000'),
(28, '15T2309', 'CC', 2, 2016, NULL, '20.000000000'),
(28, '15T2309', 'EE', 2, 2016, NULL, '21.000000000'),
(28, '15T2309', 'TP', 2, 2016, NULL, '20.000000000'),
(28, '15T2441', 'CC', 2, 2016, NULL, '20.000000000'),
(28, '15T2441', 'EE', 2, 2016, NULL, '21.000000000'),
(28, '15T2441', 'TP', 2, 2016, NULL, '18.000000000'),
(28, '15T2592', 'CC', 2, 2016, NULL, '21.000000000'),
(28, '15T2592', 'EE', 2, 2016, NULL, '21.000000000'),
(28, '15T2592', 'TP', 2, 2016, NULL, '32.000000000'),
(28, '15T2687', 'CC', 2, 2016, NULL, '24.000000000'),
(28, '15T2687', 'EE', 2, 2016, NULL, '24.000000000'),
(28, '15T2687', 'TP', 2, 2016, NULL, '20.000000000'),
(29, '15J2658', 'CC', 2, 2016, NULL, '21.000000000'),
(29, '15J2658', 'EE', 2, 2016, NULL, '24.000000000'),
(29, '15J2658', 'TP', 2, 2016, NULL, '30.000000000'),
(29, '15T2309', 'CC', 2, 2016, NULL, '22.000000000'),
(29, '15T2309', 'EE', 2, 2016, NULL, '23.000000000'),
(29, '15T2309', 'TP', 2, 2016, NULL, '20.000000000'),
(29, '15T2441', 'CC', 2, 2016, NULL, '27.000000000'),
(29, '15T2441', 'EE', 2, 2016, NULL, '13.000000000'),
(29, '15T2441', 'TP', 2, 2016, NULL, '29.000000000'),
(29, '15T2592', 'CC', 2, 2016, NULL, '21.000000000'),
(29, '15T2592', 'EE', 2, 2016, NULL, '32.000000000'),
(29, '15T2592', 'TP', 2, 2016, NULL, '21.000000000'),
(29, '15T2687', 'CC', 2, 2016, NULL, '27.000000000'),
(29, '15T2687', 'EE', 2, 2016, NULL, '24.000000000'),
(29, '15T2687', 'TP', 2, 2016, NULL, '19.000000000');

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(255) NOT NULL,
  `sms` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_ibfk_1` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `heure_debut` int(2) NOT NULL,
  `minute_debut` int(2) NOT NULL,
  `heure_fin` int(2) NOT NULL,
  `minute_fin` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `periode`
--

INSERT INTO `periode` (`id`, `heure_debut`, `minute_debut`, `heure_fin`, `minute_fin`) VALUES
(1, 7, 0, 9, 55),
(2, 10, 5, 12, 45),
(3, 13, 5, 15, 55),
(4, 16, 5, 18, 45),
(5, 19, 5, 21, 5);

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

DROP TABLE IF EXISTS `programme`;
CREATE TABLE IF NOT EXISTS `programme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IDCLASSE` int(11) NOT NULL,
  `IDUE` int(11) UNSIGNED NOT NULL,
  `enseignant` int(11) NOT NULL,
  `ANNEE` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `CATEGORIE` int(11) NOT NULL DEFAULT '0',
  `CREDIT` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`IDCLASSE`,`IDUE`,`ANNEE`),
  UNIQUE KEY `id_2` (`id`),
  KEY `IDUE` (`IDUE`),
  KEY `id` (`id`),
  KEY `programme_ibfk_3` (`enseignant`),
  KEY `programme_ibfk_4` (`semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `programme`
--

INSERT INTO `programme` (`id`, `IDCLASSE`, `IDUE`, `enseignant`, `ANNEE`, `semestre`, `CATEGORIE`, `CREDIT`) VALUES
(1, 1, 25, 1, 2016, 1, 0, 6),
(2, 1, 26, 1, 2016, 1, 0, 5),
(3, 1, 27, 1, 2016, 1, 0, 5),
(4, 1, 28, 1, 2016, 1, 0, 6),
(5, 1, 29, 1, 2016, 1, 0, 6),
(6, 2, 19, 1, 2017, 1, 0, 6),
(7, 2, 20, 1, 2017, 1, 0, 6),
(8, 2, 21, 1, 2017, 1, 0, 5),
(9, 2, 23, 1, 2017, 1, 0, 6),
(10, 2, 24, 1, 2017, 1, 0, 3),
(11, 3, 19, 1, 2017, 1, 0, 6),
(12, 3, 20, 1, 2017, 1, 0, 6),
(13, 3, 23, 1, 2017, 1, 0, 6),
(14, 3, 24, 1, 2017, 1, 0, 3),
(15, 4, 19, 1, 2017, 1, 0, 6),
(16, 4, 20, 1, 2017, 1, 0, 6),
(17, 4, 21, 1, 2017, 1, 0, 5),
(18, 4, 23, 1, 2017, 1, 0, 6),
(19, 4, 24, 1, 2017, 1, 0, 3),
(20, 5, 1, 1, 2018, 1, 0, 6),
(21, 5, 2, 1, 2018, 1, 0, 6),
(22, 5, 3, 1, 2018, 1, 0, 6),
(23, 5, 4, 1, 2018, 1, 0, 6),
(24, 5, 5, 1, 2018, 1, 0, 3),
(25, 5, 6, 1, 2018, 1, 0, 3),
(26, 5, 7, 1, 2018, 1, 0, 6),
(27, 5, 8, 1, 2018, 1, 0, 6),
(28, 5, 9, 1, 2018, 1, 0, 6),
(29, 5, 10, 1, 2018, 1, 0, 6),
(30, 5, 11, 1, 2018, 1, 0, 6),
(31, 5, 12, 1, 2018, 1, 0, 6),
(32, 5, 14, 1, 2018, 1, 0, 6),
(33, 5, 15, 1, 2018, 1, 0, 6),
(34, 5, 16, 1, 2018, 1, 0, 6),
(35, 5, 17, 1, 2018, 1, 0, 6),
(36, 5, 18, 1, 2018, 1, 0, 6),
(37, 6, 1, 1, 2018, 1, 0, 6),
(38, 6, 2, 1, 2018, 1, 0, 6),
(39, 6, 3, 1, 2018, 1, 0, 6),
(40, 6, 4, 1, 2018, 1, 0, 6),
(41, 6, 5, 1, 2018, 1, 0, 3),
(42, 6, 6, 1, 2018, 1, 0, 3),
(43, 6, 7, 1, 2018, 1, 0, 6),
(44, 6, 8, 1, 2018, 1, 0, 6),
(45, 6, 9, 1, 2018, 1, 0, 6),
(46, 6, 10, 1, 2018, 1, 0, 6),
(47, 6, 11, 1, 2018, 1, 0, 6),
(48, 6, 12, 1, 2018, 1, 0, 6),
(49, 6, 13, 1, 2018, 1, 0, 6),
(50, 6, 14, 1, 2018, 1, 0, 6),
(51, 6, 15, 1, 2018, 1, 0, 6),
(52, 6, 16, 1, 2018, 1, 0, 6),
(53, 6, 17, 1, 2018, 1, 0, 6),
(54, 6, 18, 1, 2018, 1, 0, 6),
(55, 7, 1, 1, 2018, 1, 0, 6),
(56, 7, 2, 1, 2018, 1, 0, 6),
(57, 7, 3, 1, 2018, 1, 0, 6),
(58, 7, 4, 1, 2018, 1, 0, 6),
(59, 7, 5, 1, 2018, 1, 0, 3),
(60, 7, 6, 1, 2018, 1, 0, 3),
(61, 7, 7, 1, 2018, 1, 0, 6),
(62, 7, 8, 1, 2018, 1, 0, 6),
(63, 7, 10, 1, 2018, 1, 0, 6),
(64, 7, 11, 1, 2018, 1, 0, 6),
(65, 7, 12, 1, 2018, 1, 0, 6),
(66, 7, 13, 1, 2018, 1, 0, 6),
(67, 7, 14, 1, 2018, 1, 0, 6),
(68, 7, 15, 1, 2018, 1, 0, 6),
(69, 7, 16, 1, 2018, 1, 0, 6),
(70, 7, 17, 1, 2018, 1, 0, 6),
(71, 7, 18, 1, 2018, 1, 0, 6),
(72, 11, 36, 4, 2019, 1, 0, 6),
(73, 11, 37, 5, 2019, 1, 0, 5),
(74, 11, 44, 2, 2019, 1, 0, 6),
(75, 11, 45, 10, 2019, 1, 0, 6),
(76, 12, 32, 3, 2019, 1, 0, 5),
(77, 12, 38, 4, 2019, 1, 0, 6),
(78, 12, 41, 7, 2019, 1, 0, 6),
(79, 12, 42, 8, 2019, 1, 0, 6),
(80, 13, 33, 4, 2019, 1, 0, 6),
(81, 13, 38, 4, 2019, 1, 0, 6),
(82, 13, 48, 12, 2019, 1, 0, 3),
(83, 13, 49, 10, 2019, 1, 0, 3),
(84, 14, 30, 1, 2019, 1, 0, 6),
(85, 14, 31, 2, 2019, 1, 0, 5),
(86, 14, 34, 1, 2019, 1, 0, 6),
(87, 14, 35, 1, 2019, 1, 0, 6),
(88, 14, 39, 1, 2019, 1, 0, 3),
(89, 14, 40, 6, 2019, 1, 0, 6),
(90, 14, 43, 9, 2019, 1, 0, 3),
(91, 14, 46, 11, 2019, 1, 0, 5),
(92, 14, 47, 4, 2019, 1, 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `CODPROVINCE` char(5) NOT NULL,
  `NOMPROVINCE` varchar(50) NOT NULL,
  `PROVNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODPROVINCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `province`
--

INSERT INTO `province` (`CODPROVINCE`, `NOMPROVINCE`, `PROVNAME`) VALUES
('CE', 'CENTRE', 'CENTRE'),
('ES', 'EST', 'EST'),
('LT', 'LITTORAL', 'LITTORAL'),
('ND', 'NORD', 'NORD'),
('OU', 'OUEST', 'OUEST'),
('SD', 'SUD', 'SUD');

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

DROP TABLE IF EXISTS `resultat`;
CREATE TABLE IF NOT EXISTS `resultat` (
  `IDCLASSE` int(11) NOT NULL AUTO_INCREMENT,
  `MATRICULE` varchar(10) NOT NULL,
  `ANNEE` int(11) NOT NULL,
  `SEMESTRE` int(1) NOT NULL DEFAULT '3',
  `CREDITCAP` varchar(200) DEFAULT NULL,
  `CREDITCHOISIS` varchar(200) DEFAULT NULL,
  `POURCENTCAP` varchar(200) DEFAULT NULL,
  `MGP` varchar(200) DEFAULT NULL,
  `DECISION` varchar(200) DEFAULT NULL,
  `NEWIDCLASSE` int(11) DEFAULT NULL,
  `GRADE` varchar(11) DEFAULT 'L',
  `NEWGRADE` varchar(11) DEFAULT 'L',
  PRIMARY KEY (`IDCLASSE`,`MATRICULE`,`ANNEE`,`SEMESTRE`),
  KEY `MATRICULE` (`MATRICULE`),
  KEY `resultat_ibkgg_2` (`SEMESTRE`),
  KEY `resultat_ik_2` (`GRADE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `resultat`
--

INSERT INTO `resultat` (`IDCLASSE`, `MATRICULE`, `ANNEE`, `SEMESTRE`, `CREDITCAP`, `CREDITCHOISIS`, `POURCENTCAP`, `MGP`, `DECISION`, `NEWIDCLASSE`, `GRADE`, `NEWGRADE`) VALUES
(1, '15T2309', 2016, 1, '60', '60', '100%', '2,5', 'ADMIS', 3, 'L', 'L'),
(1, '15T2592', 2016, 3, '70', '60', '100%', '2,90', 'ADMIS', 2, 'L', 'L'),
(2, '15T2592', 2017, 3, '60', '60', '100%', '2,6', 'ADMIS', 5, 'L', 'L'),
(3, '15T2309', 2017, 3, '50', '60', '90%', '1,90', 'ECHEC', 3, 'L', 'L'),
(3, '15T2309', 2018, 3, '80', '60', '100%', '3', 'ADMIS', 6, 'L', 'L'),
(6, '15T2309', 2019, 3, '70', '60', '100%', '2,84', 'ADMIS', 8, 'L', 'M');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `capacite` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `nom`, `capacite`) VALUES
(1, 'S58', 80),
(2, 'AIII', 150),
(3, 'S006', 60),
(4, 'A250', 300);

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
CREATE TABLE IF NOT EXISTS `semestre` (
  `IDSEMESTRE` int(1) NOT NULL,
  `DESCRIPTION` varchar(15) NOT NULL,
  PRIMARY KEY (`IDSEMESTRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `semestre`
--

INSERT INTO `semestre` (`IDSEMESTRE`, `DESCRIPTION`) VALUES
(1, 'SEMESTRE 1'),
(2, 'SEMESTRE 2'),
(3, 'SEMESTRE 3'),
(4, 'SEMESTRE 4');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `IDSPECIALITE` int(11) NOT NULL AUTO_INCREMENT,
  `IDFILIERE` int(11) NOT NULL,
  `CODSPECIALITE` varchar(14) NOT NULL DEFAULT '',
  `INTITULE` varchar(255) NOT NULL,
  `ENTITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDSPECIALITE`),
  UNIQUE KEY `options_index1395` (`CODSPECIALITE`,`IDFILIERE`),
  KEY `IDFILIERE` (`IDFILIERE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`IDSPECIALITE`, `IDFILIERE`, `CODSPECIALITE`, `INTITULE`, `ENTITLE`) VALUES
(1, 1, 'GENILO', 'GENILOGICIEL', 'SYSTEM INFORMATION'),
(2, 1, 'RESEAUX', 'RESEAUX INFORMATIQUES', 'INFORMATICS NETWORKS'),
(3, 1, 'SECURITE', 'SECURITE INFORMATIQUE', 'INFORMATIC SECURITY'),
(4, 1, 'AUCUNE', 'AUCUNE', 'NONE'),
(5, 2, 'GENILO', 'GENILOGICIEL', 'SYSTEM INFORMATION'),
(6, 2, 'RESEAUX', 'RESEAUX INFORMATIQUES', 'INFORMATICS NETWORKS'),
(7, 2, 'SECURITE', 'SECURITE INFORMATIQUE', 'INFORMATIC SECURITY');

-- --------------------------------------------------------

--
-- Structure de la table `time`
--

DROP TABLE IF EXISTS `time`;
CREATE TABLE IF NOT EXISTS `time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IDPROGRAMME` int(11) NOT NULL,
  `IDSALLE` int(11) NOT NULL,
  `IDPERIODE` int(11) NOT NULL,
  `IDJOUR` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`IDPROGRAMME`,`IDSALLE`,`IDPERIODE`,`IDJOUR`),
  KEY `IDPROGRAMME` (`IDPROGRAMME`,`IDSALLE`,`IDPERIODE`),
  KEY `time_ibfk_2` (`IDPERIODE`),
  KEY `time_ibfk3` (`IDSALLE`),
  KEY `time_ibfk_4` (`IDJOUR`),
  KEY `IDPROGRAMME_2` (`IDPROGRAMME`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `time`
--

INSERT INTO `time` (`id`, `IDPROGRAMME`, `IDSALLE`, `IDPERIODE`, `IDJOUR`) VALUES
(1, 86, 1, 1, 1),
(4, 73, 3, 1, 3),
(5, 76, 3, 1, 4),
(9, 81, 3, 1, 5),
(3, 84, 2, 2, 2),
(6, 85, 4, 2, 4),
(7, 80, 3, 3, 4),
(8, 72, 3, 4, 4),
(2, 86, 2, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `typeevaluation`
--

DROP TABLE IF EXISTS `typeevaluation`;
CREATE TABLE IF NOT EXISTS `typeevaluation` (
  `CODEEVALUATION` varchar(255) NOT NULL,
  `NOM` varchar(255) NOT NULL,
  `NOTE` double DEFAULT NULL,
  PRIMARY KEY (`CODEEVALUATION`,`NOM`),
  KEY `CODEEVALUATION` (`CODEEVALUATION`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typeevaluation`
--

INSERT INTO `typeevaluation` (`CODEEVALUATION`, `NOM`, `NOTE`) VALUES
('CC', 'CONTROLE CONTINU', 30),
('TP', 'TRAVAUX PRATIQUES', 30),
('EE', 'EXAMEN DE SESSIION NORMALE', 40);

-- --------------------------------------------------------

--
-- Structure de la table `ue`
--

DROP TABLE IF EXISTS `ue`;
CREATE TABLE IF NOT EXISTS `ue` (
  `IdUE` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `IDFILIERE` int(11) DEFAULT NULL,
  `CODUE` varchar(10) NOT NULL,
  `INTITULE` varchar(512) NOT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `ANNEE` int(11) NOT NULL,
  PRIMARY KEY (`IdUE`) USING BTREE,
  UNIQUE KEY `CODUE` (`CODUE`,`IDFILIERE`,`ANNEE`),
  KEY `IDFILIERE` (`IDFILIERE`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ue`
--

INSERT INTO `ue` (`IdUE`, `IDFILIERE`, `CODUE`, `INTITULE`, `TITLE`, `ANNEE`) VALUES
(1, 1, 'ICT301', 'ICT 301 Software Architecture & Design', 'ICT 301 Software Architecture & Design', 2018),
(2, 1, 'ICT303', 'ICT 303 Data Communications and Security', 'ICT 303 Data Communications and Security', 2018),
(3, 1, 'ICT305', 'Web Application Development ', 'Web Application Development ', 2018),
(4, 1, 'ICT307 ', 'Computer Systems Engineering', 'Computer Systems Engineering', 2018),
(5, 1, 'ENGL303', ' English III', ' English III', 2018),
(6, 1, 'FRAN303', 'Français III', 'Français III', 2018),
(7, 1, 'ICT313', 'Cyber and Internet Security', 'Cyber and Internet Security', 2018),
(8, 1, 'ICT315', 'Network Application Development', 'Network Application Development', 2018),
(9, 1, 'ICT317', 'Information System', 'Information System', 2018),
(10, 1, 'ICT300', 'Internship', 'Internship', 2018),
(11, 1, 'ICT302', 'Introduction to Artificial Intelligence', 'Introduction to Artificial Intelligence', 2018),
(12, 1, 'ICT304', 'Software Testing and Deployment', 'Software Testing and Deployment', 2018),
(13, 1, 'ICT306', 'Business Intelligence', 'Business Intelligence', 2018),
(14, 1, 'ICT308', 'Software Development in Java II', 'Software Development in Java II', 2018),
(15, 1, 'ICT310', 'Professional Issues in IT', 'Professional Issues in IT', 2018),
(16, 1, 'ICT314', 'Computer Forensics and Incident Response ', 'Computer Forensics and Incident Response ', 2018),
(17, 1, 'ICT316', 'Digital communication', 'Digital communication', 2018),
(18, 1, 'ICT318', 'Java Enterprise Edition', 'Java Enterprise Edition', 2018),
(19, 1, 'ICT203', 'Database Systems', 'Database Systems', 2017),
(20, 1, 'ICT201', 'Introduction to Software Engineering', 'Introduction to Software Engineering', 2017),
(21, 1, 'ICT205', 'Introduction to Programming in .NET ', 'Introduction to Programming in .NET ', 2017),
(23, 1, 'ICT213', 'Introduction to Computer Security and Risk Management', 'Introduction to Computer Security and Risk Management', 2017),
(24, 1, 'ENGL203', 'English II', 'English II', 2017),
(25, 1, 'ICT105', 'Introduction to algorithms', 'Introduction to algorithms', 2016),
(26, 1, 'ICT107', 'Mathematics for computer science I', 'Mathematics for computer science I', 2016),
(27, 1, 'ICT109', 'Discrete Mathematics I', 'Discrete Mathematics I', 2016),
(28, 1, 'ICT101', 'Introduction to Business Information Systems  ', 'Introduction to Business Information Systems  ', 2016),
(29, 1, 'ICT103', 'Introduction to Programming ', 'Introduction to Programming ', 2016),
(30, 2, 'INFO301', 'ICT 301 Theorie des langages et compilation', 'INFO 301 Theorie des langages et compilation', 2019),
(31, 2, 'INFO303', 'ICT 303 Data Modélisation des Systems d\'Information', 'INFO 303 Data Modélisation des Systems d\'Information', 2019),
(32, 2, 'INFO307', 'Installation et deploiement des réseaux', ' INFO 307 Installation et deploiement des réseaux', 2019),
(33, 2, 'INFO325 ', 'Introduction a la securité informatique', 'INFO 325 Introduction a la securité informatique', 2019),
(34, 2, 'ENGL303', ' English III', ' English III', 2019),
(35, 2, 'FRAN303', 'Français III', 'Français III', 2019),
(36, 2, 'INFO311', 'ERP et System d\'information', 'INFO 311 ERP et System d\'information', 2019),
(37, 2, 'INFO313', 'Business Intelligence et Systeme', 'INFO 313 Business Intelligence et Systeme', 2019),
(38, 2, 'INFO323', 'Investigation numérique I', 'INFO 323 Investigation numérique I', 2019),
(39, 2, 'INFO302', 'Bases de données', 'INFO 302 Bases de données', 2019),
(40, 2, 'INFO304', 'Algorithmique et complexité', 'INFO 304 Algorithmique et complexité', 2019),
(41, 2, 'INFO310', 'Services réseaux', 'INFO 310 Services réseaux', 2019),
(42, 2, 'INFO312', 'Administration Systeme et réseaux', 'INFO 312 Administration Systeme et réseaux', 2019),
(43, 2, 'INFO318', 'Programmation Systeme', 'INFO 318 Programmation Systeme', 2019),
(44, 2, 'INFO314', 'Outils de genie logiciel', 'INFO 314 Outils de genie logiciel', 2019),
(45, 2, 'INFO316', 'Technique de Programmation avance', 'INFO 316 Technique de Programmation avance', 2019),
(46, 2, 'INFO320', 'Test de logiciel et assurance qualité', 'INFO 320 Test de logiciel et assurance qualité', 2019),
(47, 2, 'INFO326', 'Investigation numérique II', 'INFO 326 Investigation numérique II', 2019),
(48, 2, 'INFO328', 'Introduction a la cryptographie', 'INFO 328 Introduction a la cryptographie', 2019),
(49, 2, 'INFO322', 'Securité des applications web', 'INFO 322 Securité des applications web', 2019);

-- --------------------------------------------------------

--
-- Structure de la table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE IF NOT EXISTS `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`CODGRADE`) REFERENCES `grade` (`CODGRADE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classe_ibfk_zz` FOREIGN KEY (`IDFILIERE`) REFERENCES `filiere` (`IDFILIERE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `etudiant` (`MATRICULE`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`CODNAT`) REFERENCES `nationalite` (`CODNAT`),
  ADD CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`CODPROVINCE`) REFERENCES `province` (`CODPROVINCE`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `inscrit`
--
ALTER TABLE `inscrit`
  ADD CONSTRAINT `resultat_ibfk_j` FOREIGN KEY (`IDCLASSE`) REFERENCES `classe` (`IDCLASSE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resultat_ibfk_jj` FOREIGN KEY (`MATRICULE`) REFERENCES `etudiant` (`MATRICULE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `moyennes`
--
ALTER TABLE `moyennes`
  ADD CONSTRAINT `resultag` FOREIGN KEY (`MATRICULE`) REFERENCES `etudiant` (`MATRICULE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resultage` FOREIGN KEY (`IDSEMESTRE`) REFERENCES `semestre` (`IDSEMESTRE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resultatl` FOREIGN KEY (`IDUE`) REFERENCES `ue` (`IdUE`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`IDUE`) REFERENCES `ue` (`IdUE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`MATRICULE`) REFERENCES `etudiant` (`MATRICULE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notes_ibfk_3` FOREIGN KEY (`IDSEMESTRE`) REFERENCES `semestre` (`IDSEMESTRE`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `etudiant` (`MATRICULE`);

--
-- Contraintes pour la table `programme`
--
ALTER TABLE `programme`
  ADD CONSTRAINT `programme_ibfk_1` FOREIGN KEY (`IDUE`) REFERENCES `ue` (`IdUE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `programme_ibfk_2` FOREIGN KEY (`IDCLASSE`) REFERENCES `classe` (`IDCLASSE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `programme_ibfk_3` FOREIGN KEY (`enseignant`) REFERENCES `enseignant` (`id`),
  ADD CONSTRAINT `programme_ibfk_4` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`IDSEMESTRE`);

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `resultat_ibfk_1` FOREIGN KEY (`IDCLASSE`) REFERENCES `classe` (`IDCLASSE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resultat_ibfk_2` FOREIGN KEY (`MATRICULE`) REFERENCES `etudiant` (`MATRICULE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resultat_ibkgg_2` FOREIGN KEY (`SEMESTRE`) REFERENCES `semestre` (`IDSEMESTRE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resultat_ik_2` FOREIGN KEY (`GRADE`) REFERENCES `grade` (`CODGRADE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD CONSTRAINT `specialite_ibfk_tiken` FOREIGN KEY (`IDFILIERE`) REFERENCES `filiere` (`IDFILIERE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `time`
--
ALTER TABLE `time`
  ADD CONSTRAINT `time_ibfk3` FOREIGN KEY (`IDSALLE`) REFERENCES `salle` (`id`),
  ADD CONSTRAINT `time_ibfk_1` FOREIGN KEY (`IDPROGRAMME`) REFERENCES `programme` (`id`),
  ADD CONSTRAINT `time_ibfk_2` FOREIGN KEY (`IDPERIODE`) REFERENCES `periode` (`id`),
  ADD CONSTRAINT `time_ibfk_4` FOREIGN KEY (`IDJOUR`) REFERENCES `jour` (`id`);

--
-- Contraintes pour la table `ue`
--
ALTER TABLE `ue`
  ADD CONSTRAINT `ue_ibfk_1` FOREIGN KEY (`IDFILIERE`) REFERENCES `filiere` (`IDFILIERE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
