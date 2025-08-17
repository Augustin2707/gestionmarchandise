-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 17 août 2025 à 10:26
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `examensgl`
--

-- --------------------------------------------------------

--
-- Structure de la table `marchandises`
--

CREATE TABLE `marchandises` (
  `id` int(11) NOT NULL,
  `type_marchandise` varchar(100) NOT NULL,
  `poids` decimal(10,2) NOT NULL,
  `destination` enum('Comores','Maurice','La Réunion','Seychelles','Mayotte') NOT NULL,
  `date_expedition` date NOT NULL,
  `date_arrivee_prevue` date NOT NULL,
  `statut` enum('En attente','En transit','Livrée','Retardée') DEFAULT 'En attente',
  `client` varchar(100) NOT NULL,
  `contact_client` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marchandises`
--

INSERT INTO `marchandises` (`id`, `type_marchandise`, `poids`, `destination`, `date_expedition`, `date_arrivee_prevue`, `statut`, `client`, `contact_client`, `notes`) VALUES
(2, 'Beloa', 56.00, 'Maurice', '2025-07-29', '2025-07-30', 'Livrée', 'Mr Ratsirahonana', '0326156099', 'bogoss'),
(4, 'Alcool', 10.00, 'La Réunion', '2025-08-10', '2025-08-16', 'En transit', 'Mr Ratsirahonana', '0326156099', 'très fragile'),
(5, 'Moto', 110.00, 'Maurice', '2025-07-31', '2025-08-07', 'Livrée', 'Bien-Venu', '0326156099', 'Fragile'),
(6, 'Fruits', 50.00, 'La Réunion', '2025-08-04', '2025-08-16', 'Livrée', 'Bogossy', '0326156099', 'Mora  simba');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `marchandises`
--
ALTER TABLE `marchandises`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `marchandises`
--
ALTER TABLE `marchandises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
