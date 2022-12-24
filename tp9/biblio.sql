-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 21 déc. 2020 à 14:47
-- Version du serveur :  5.7.30
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `biblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `id_emprunt` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL,
  `dt_debut` date NOT NULL,
  `dt_retour` date DEFAULT NULL,
  `id_gestionaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`id_emprunt`, `id_etudiant`, `id_livre`, `dt_debut`, `dt_retour`, `id_gestionaire`) VALUES
(6, 14000198, 4, '2020-12-01', '2020-12-05', 1),
(7, 13007921, 10, '2020-12-02', '2020-12-15', 2),
(8, 14000198, 7, '2020-12-06', '2020-12-12', 1),
(9, 14000149, 5, '2020-12-13', '2020-12-16', 1);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `num_apogee` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `image` varchar(45) DEFAULT 'SANS_IMAGE.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`num_apogee`, `nom`, `prenom`, `image`) VALUES
(13003031, 'ALMOUHAK', 'KAOUTAR', '13003031.PNG'),
(13007111, 'AKSBI', 'OUSSAMA', '13007111.PNG'),
(13007921, 'CHTIBY', 'SAFAA', '13007921.PNG'),
(14000054, 'BAHOUMI', 'BASMA', '14000054.PNG'),
(14000108, 'EL ATTAOUI', 'ANAS', '14000108.PNG'),
(14000149, 'BELOUIZA', 'CHARIFA', '14000149.PNG'),
(14000198, 'BOUSFIHA', 'TAREK', '14000198.PNG'),
(14001418, 'BELHAJ', 'ZOUBIDA', '14001418.PNG'),
(14001914, 'ABERCHANE', 'OUMAIMA', '14001914.PNG'),
(14003733, 'EDDOUMY', 'MONCEF', '14003733.PNG');

-- --------------------------------------------------------

--
-- Structure de la table `gestionaire`
--

CREATE TABLE `gestionaire` (
  `id_gestionaire` int(11) NOT NULL,
  `login` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gestionaire`
--

INSERT INTO `gestionaire` (`id_gestionaire`, `login`, `pass`, `nom`, `prenom`) VALUES
(1, 'marso', 'azerty', 'Marso', 'Mohamed'),
(2, 'nouri', 'azerty', 'Nouri', 'Fatiha');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `isbn` int(11) NOT NULL,
  `titre_livre` varchar(100) NOT NULL,
  `auteur` varchar(40) NOT NULL,
  `image_livre` varchar(45) NOT NULL DEFAULT 'SANS_IMAGE.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`isbn`, `titre_livre`, `auteur`, `image_livre`) VALUES
(1, 'LIVRE A', 'Auteur 1', '1.PNG'),
(2, 'LIVRE B', 'Auteur 2', '2.PNG'),
(3, 'LIVRE C', 'Auteur 3', '3.PNG'),
(4, 'LIVRE D', 'Auteur 4', '4.PNG'),
(5, 'LIVRE E', 'Auteur 5', '5.PNG'),
(6, 'LIVRE F', 'Auteur 6', '6.PNG'),
(7, 'LIVRE G', 'Auteur 7', '7.PNG'),
(8, 'LIVRE H', 'Auteur 8', '8.PNG'),
(9, 'LIVRE I', 'Auteur 9', '9.PNG'),
(10, 'LIVRE J', 'Auteur 10', '10.PNG');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`id_emprunt`),
  ADD KEY `id_admin` (`id_gestionaire`),
  ADD KEY `id_gestionaire` (`id_gestionaire`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_livre` (`id_livre`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`num_apogee`);

--
-- Index pour la table `gestionaire`
--
ALTER TABLE `gestionaire`
  ADD PRIMARY KEY (`id_gestionaire`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`isbn`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `id_emprunt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `gestionaire`
--
ALTER TABLE `gestionaire`
  MODIFY `id_gestionaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`num_apogee`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunt_ibfk_3` FOREIGN KEY (`id_gestionaire`) REFERENCES `gestionaire` (`id_gestionaire`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
