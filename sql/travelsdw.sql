-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 07 mai 2023 à 05:11
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `travelsdw`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `nom_utilisateur` varchar(30) NOT NULL,
  `mot_passe` varchar(10) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `tel` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `nom_utilisateur`, `mot_passe`, `adresse`, `tel`) VALUES
(9, 'Loubari', 'Chaima', 'chimou', 'dddd', 'zaafrania', 2147483647),
(10, 'Loubari', 'Ines', 'inou', 'password', 'Paris', 2147483647),
(11, 'Loubari', 'Hamza', 'hamza', 'password', 'zaafrania', 677895645),
(12, 'Loubari', 'Houssem', 'houssem', 'password', 'zaafrania', 677895643);

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

CREATE TABLE `hotels` (
  `id` int(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `categorie` varchar(30) NOT NULL,
  `adresse` varchar(20) NOT NULL,
  `tel` int(20) NOT NULL,
  `nbr_places` int(20) NOT NULL,
  `id_reservation` int(30) NOT NULL,
  `id_ville` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`id`, `nom`, `categorie`, `adresse`, `tel`, `nbr_places`, `id_reservation`, `id_ville`) VALUES
(1, 'sheraton', 'lux', 'place d\'armes', 677895645, 5, 1, 3),
(3, 'Orient', 'lux', 'Centre ville', 677895644, 2, 2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(30) NOT NULL,
  `date` date NOT NULL,
  `id_client` int(30) DEFAULT NULL,
  `etat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `date`, `id_client`, `etat`) VALUES
(1, '2023-05-06', 9, 'confirmée'),
(2, '2023-05-17', 10, 'Annulee'),
(3, '2023-05-18', 11, 'confirmée'),
(4, '2023-05-30', 12, 'Annulee');

-- --------------------------------------------------------

--
-- Structure de la table `sejour`
--

CREATE TABLE `sejour` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `heure` time(4) NOT NULL,
  `program_detaille` text NOT NULL,
  `id_ville_dep` int(2) NOT NULL,
  `id_ville_arr` int(2) NOT NULL,
  `id_voyage` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sejour`
--

INSERT INTO `sejour` (`id`, `date`, `heure`, `program_detaille`, `id_ville_dep`, `id_ville_arr`, `id_voyage`) VALUES
(1, '2023-05-27', '00:00:20.0000', 'Alger est la capitale de l\'Algérie et la plus grande ville du pays, située sur la côte nord de l\'Afrique, sur la mer Méditerranée. La ville est connue pour son mélange unique de cultures, reflétant son passé riche et mouvementé en tant que point de rencontre pour les peuples et les civilisations. Alger est une ville animée avec des rues étroites, des marchés colorés, des mosquées anciennes et des bâtiments coloniaux français. Parmi les sites les plus célèbres de la ville, on peut citer la Casbah, une vieille ville fortifiée qui abrite des marchés, des musées et des mosquées historiques, la Grande Poste, un bâtiment emblématique du style Art déco, et la mosquée Ketchaoua, une mosquée du XVIe siècle avec une architecture unique. Alger est également une ville moderne avec des centres commerciaux, des restaurants, des plages et une vie nocturne animée.', 3, 5, 1),
(2, '2023-05-20', '00:00:16.0000', 'Paris est la capitale de la France et l\'une des villes les plus célèbres et les plus visitées au monde. La ville est située dans le nord de la France, sur les rives de la Seine. Paris est connue pour son architecture magnifique, sa cuisine raffinée, son art et sa culture. La ville abrite de nombreux sites emblématiques, tels que la Tour Eiffel, l\'Arc de Triomphe, la cathédrale Notre-Dame et le Musée du Louvre, qui abrite la célèbre Joconde de Léonard de Vinci. Paris est également réputée pour ses célèbres boulevards, ses jardins magnifiques et ses cafés animés. La ville est un centre mondial de la mode, de la gastronomie, de l\'art et de la culture, avec de nombreux musées, théâtres et opéras. En somme, Paris est une ville qui combine l\'histoire, l\'art et la modernité, offrant aux visiteurs une expérience inoubliable', 3, 6, 2),
(3, '2023-05-31', '00:00:20.0000', 'Bruxelles est la capitale de la Belgique et une ville cosmopolite située au cœur de l\'Europe. La ville est connue pour ses institutions européennes, ses chocolats, ses frites et sa bière, mais elle offre également une riche histoire et une architecture unique. Bruxelles est le siège de l\'Union européenne et de l\'OTAN, ainsi que d\'un certain nombre d\'organisations internationales. La ville est également célèbre pour sa Grand-Place, un site classé au patrimoine mondial de l\'UNESCO, où l\'on peut admirer des bâtiments historiques tels que l\'Hôtel de Ville et la Maison du Roi. Bruxelles abrite également de nombreux musées, galeries d\'art et théâtres, ainsi que des parcs et des jardins, tels que le parc du Cinquantenaire, qui offrent une évasion de la ville animée. En somme, Bruxelles est une ville fascinante qui combine l\'histoire, la culture et la politique internationale.', 3, 7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(30) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `descripition` varchar(30) NOT NULL,
  `id_ville` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id` int(10) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `descripition` varchar(30) NOT NULL,
  `pays` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `nom`, `descripition`, `pays`) VALUES
(3, 'Annaba', 'Annaba', 'Algerie'),
(5, 'Alger', 'Alger', 'Algerie'),
(6, 'Paris', 'Paris', 'France'),
(7, 'Bruxelles', 'Bruxelles', 'Belgique');

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE `vol` (
  `id` int(30) NOT NULL,
  `numero` int(30) NOT NULL,
  `date` date NOT NULL,
  `heures` int(6) NOT NULL,
  `id_ville_dep` int(20) NOT NULL,
  `id_ville_arr` int(20) NOT NULL,
  `nbr_places` int(30) NOT NULL,
  `id_reservation` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`id`, `numero`, `date`, `heures`, `id_ville_dep`, `id_ville_arr`, `nbr_places`, `id_reservation`) VALUES
(1, 1234, '2023-05-13', 2, 3, 5, 2, 3),
(2, 1235, '2023-05-10', 2, 3, 6, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `voyage`
--

CREATE TABLE `voyage` (
  `id` int(10) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `prix` int(10) NOT NULL,
  `duree` float NOT NULL,
  `nbr_places` int(10) NOT NULL,
  `id_reservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `voyage`
--

INSERT INTO `voyage` (`id`, `designation`, `prix`, `duree`, `nbr_places`, `id_reservation`) VALUES
(1, 'Alger tour', 5000, 3, 5, 4),
(2, 'Paris tour', 6000, 4, 7, 4),
(3, 'Bruxelles tour', 3000, 6, 9, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_reservation`),
  ADD KEY `id_ville` (`id_ville`),
  ADD KEY `id_reservation` (`id_reservation`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_voyage` (`id_voyage`),
  ADD KEY `id_ville_dep` (`id_ville_dep`),
  ADD KEY `id_ville_arr` (`id_ville_arr`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ville` (`id_ville`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vol`
--
ALTER TABLE `vol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_reservation`),
  ADD KEY `id_ville_dep` (`id_ville_dep`),
  ADD KEY `id_ville_arr` (`id_ville_arr`),
  ADD KEY `id_reservation` (`id_reservation`);

--
-- Index pour la table `voyage`
--
ALTER TABLE `voyage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reservation` (`id_reservation`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `sejour`
--
ALTER TABLE `sejour`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `vol`
--
ALTER TABLE `vol`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `voyage`
--
ALTER TABLE `voyage`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_2` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hotels_ibfk_3` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD CONSTRAINT `sejour_ibfk_1` FOREIGN KEY (`id_voyage`) REFERENCES `voyage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sejour_ibfk_2` FOREIGN KEY (`id_ville_dep`) REFERENCES `ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sejour_ibfk_3` FOREIGN KEY (`id_ville_arr`) REFERENCES `ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `site_ibfk_1` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_4` FOREIGN KEY (`id_ville_dep`) REFERENCES `ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vol_ibfk_5` FOREIGN KEY (`id_ville_arr`) REFERENCES `ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vol_ibfk_6` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `voyage`
--
ALTER TABLE `voyage`
  ADD CONSTRAINT `voyage_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
