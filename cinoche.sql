-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 22 jan. 2021 à 18:12
-- Version du serveur :  10.1.29-MariaDB
-- Version de PHP :  7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cinoche`
--
CREATE DATABASE IF NOT EXISTS `cinoche` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cinoche`;

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `num_cine` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `adresse` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cinema`
--

INSERT INTO `cinema` (`num_cine`, `nom`, `adresse`) VALUES
(1, 'Le Renoir', '13100 Aix-en-Provence'),
(2, 'Le Fontenelle', '78160 Marly-le-Roi'),
(3, 'Gaumont Wilson', '31000 Toulouse'),
(4, 'Espace Cin', '93800 Epinay-sur-Seine'),
(7, 'Gaumont Multiplexe', '34000 Montpellier');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `num_film` int(11) NOT NULL,
  `num_ind` int(11) DEFAULT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `annee` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`num_film`, `num_ind`, `titre`, `genre`, `annee`) VALUES
(1, 15, 'Crash', 'Drame', '1996-06-01'),
(2, 15, 'Faux-Semblants', 'Epouvante', '1988-06-10'),
(3, 14, 'Pulp Fiction', 'Policier', '1994-06-16'),
(4, 13, 'Breaking the waves', 'Drame', '1996-06-18'),
(5, 13, 'Dogville', 'Drame', '2002-06-24'),
(6, 12, 'Alamo', 'Western', '1960-05-13'),
(7, 18, 'Dangereusement vôtre', 'Espionnage', '1985-06-07');

-- --------------------------------------------------------

--
-- Structure de la table `individu`
--

DROP TABLE IF EXISTS `individu`;
CREATE TABLE `individu` (
  `num_ind` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `individu`
--

INSERT INTO `individu` (`num_ind`, `nom`, `prenom`) VALUES
(1, 'Kidman', 'Nicole'),
(2, 'Bettany', 'Paul'),
(3, 'Watson', 'Emily'),
(4, 'Skarsgard', 'Stellan'),
(5, 'Travolta', 'John'),
(6, 'L. Jackson', 'Samuel'),
(7, 'Willis', 'Bruce'),
(8, 'Irons', 'Jeremy'),
(9, 'Spader', 'James'),
(10, 'Hunter', 'Holly'),
(11, 'Arquette', 'Rosanna'),
(12, 'Wayne', 'John'),
(13, 'von Trier', 'Lars'),
(14, 'Tarantino', 'Quentin'),
(15, 'Cronenberg', 'David'),
(16, 'Mazursky', 'Paul'),
(17, 'Jones', 'Grace'),
(18, 'Glen', 'John'),
(20, 'Jugnot', 'Gérard'),
(21, 'Arquette', 'Patricia'),
(22, 'Jugnot', 'Arthur');

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

DROP TABLE IF EXISTS `jouer`;
CREATE TABLE `jouer` (
  `num_ind` int(11) NOT NULL,
  `num_film` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `jouer`
--

INSERT INTO `jouer` (`num_ind`, `num_film`, `role`) VALUES
(1, 5, 'Grace'),
(2, 5, 'Tom Edison'),
(3, 4, 'Bess'),
(4, 4, 'Jan'),
(4, 5, 'Chuck'),
(5, 3, 'Vincent Vega'),
(6, 3, 'Jules Winnfield'),
(7, 3, 'Butch Coolidge'),
(8, 2, 'Beverly & Elliot Mantle'),
(9, 1, 'James Ballard'),
(10, 1, 'Helen Remington'),
(11, 1, 'Gabrielle'),
(11, 4, 'bidule'),
(11, 5, 'truc'),
(12, 6, 'le fort'),
(14, 3, 'Le Mari'),
(16, 7, 'May Day');

-- --------------------------------------------------------

--
-- Structure de la table `projection`
--

DROP TABLE IF EXISTS `projection`;
CREATE TABLE `projection` (
  `num_proj` int(11) NOT NULL,
  `num_cine` int(11) NOT NULL,
  `num_film` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `projection`
--

INSERT INTO `projection` (`num_proj`, `num_cine`, `num_film`, `date`) VALUES
(35, 1, 1, '1996-05-07'),
(36, 1, 2, '1988-03-12'),
(37, 1, 4, '1996-08-02'),
(38, 1, 6, '1980-07-05'),
(39, 2, 2, '1990-09-25'),
(40, 2, 4, '1996-09-02'),
(41, 2, 4, '1996-12-02'),
(42, 2, 5, '2002-05-01'),
(43, 2, 5, '2002-05-02'),
(44, 2, 5, '2002-05-03'),
(45, 2, 7, '1985-05-09'),
(46, 3, 3, '1994-11-05'),
(47, 3, 6, '1960-11-09'),
(48, 3, 6, '1990-12-02'),
(49, 4, 3, '1994-04-08'),
(50, 4, 3, '1994-11-06'),
(51, 4, 6, '2002-08-01');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`num_cine`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`num_film`),
  ADD KEY `FK_FILM_REFERENCE_INDIVIDU` (`num_ind`);

--
-- Index pour la table `individu`
--
ALTER TABLE `individu`
  ADD PRIMARY KEY (`num_ind`);

--
-- Index pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD PRIMARY KEY (`num_ind`,`num_film`),
  ADD KEY `FK_JOUER_REFERENCE_FILM` (`num_film`);

--
-- Index pour la table `projection`
--
ALTER TABLE `projection`
  ADD PRIMARY KEY (`num_proj`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cinema`
--
ALTER TABLE `cinema`
  MODIFY `num_cine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `num_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `individu`
--
ALTER TABLE `individu`
  MODIFY `num_ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `jouer`
--
ALTER TABLE `jouer`
  MODIFY `num_ind` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `projection`
--
ALTER TABLE `projection`
  MODIFY `num_proj` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `FK_FILM_REFERENCE_INDIVIDU` FOREIGN KEY (`num_ind`) REFERENCES `individu` (`num_ind`);

--
-- Contraintes pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD CONSTRAINT `FK_JOUER_REFERENCE_FILM` FOREIGN KEY (`num_film`) REFERENCES `film` (`num_film`),
  ADD CONSTRAINT `FK_JOUER_REFERENCE_INDIVIDU` FOREIGN KEY (`num_ind`) REFERENCES `individu` (`num_ind`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
