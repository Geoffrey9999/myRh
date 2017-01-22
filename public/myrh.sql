-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 22 Janvier 2017 à 19:17
-- Version du serveur :  10.1.16-MariaDB
-- Version de PHP :  7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `myrh`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '1',
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `admins`
--

INSERT INTO `admins` (`id`, `login`, `firstname`, `lastname`, `password`, `mail`, `is_admin`, `password_digest`, `created_at`, `updated_at`) VALUES
(1, 'root', 'root', 'root', 'root', 'root@msn.com', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'toto', 'momo', 'momo', '7d81f7b2b6', 'toutoune_sk8@hotmail.com', 0, NULL, '2017-01-21 12:53:35', '2017-01-21 12:58:15'),
(17, 'marcel', 'samba', 'toto', '0c4f03c840', 'geoffrey.leborges@gmail.com', 1, NULL, '2017-01-21 13:23:07', '2017-01-21 13:23:16');

-- --------------------------------------------------------

--
-- Structure de la table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2017-01-10 17:08:04', '2017-01-10 17:08:04');

-- --------------------------------------------------------

--
-- Structure de la table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `company_location`) VALUES
(1, 'Epitech', 'Kremlin Bicetre'),
(2, 'Microsoft', 'Tours'),
(3, 'Webacademie', 'Paris'),
(4, 'WebForce lol', 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `instances`
--

CREATE TABLE `instances` (
  `id` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `companie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `instances`
--

INSERT INTO `instances` (`id`, `date`, `companie_id`) VALUES
(2, '19/5/2017', 2),
(4, '20/1/2017', 1),
(5, '21/6/2017', 4);

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `template` text,
  `instance_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `questions`
--

INSERT INTO `questions` (`id`, `name`, `template`, `instance_id`) VALUES
(7, 'fsfsd', '<div><label>qsdqsqdpspodqoqds</label><textarea type="text" name="fsfsd"></textarea></div>', 2),
(8, 'dqsdqsdqs', '<div><label>qsdqsds</label><textarea type="text" name="dqsdqsdqs"></textarea></div>', 2),
(10, 'pppp', '<div><label>fjpofjpgs</label><textarea type="text" name="pppp"></textarea></div>', 2),
(11, 'salama', '<div><label>ftest</label></div>', 4),
(14, 'test', '<div><label>dqsdqsdqs</label><textarea type="text" name="test"></textarea></div>', 2);

-- --------------------------------------------------------

--
-- Structure de la table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20170110163130'),
('20170111103116'),
('20170111122437'),
('20170111130255'),
('20170112135130'),
('20170116160543'),
('20170116160746'),
('20170118095752'),
('20170118130205'),
('20170118130403'),
('20170118141523'),
('20170118141910'),
('20170119171554'),
('20170119171846'),
('20170119173331'),
('20170120104248'),
('20170120155154'),
('20170120182544');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `id_instance` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `birthdate`, `mail`, `id_instance`, `created_at`, `updated_at`) VALUES
(4, 'sjfoqsfhqoOHIOH', 'iohioho', '1111-11-11', 'toutoune_sk8@hotmail.com', '2', '2017-01-20 14:57:48', '2017-01-20 14:57:48'),
(5, 'jognn', 'oosos', '1111-11-11', 'lnqsld@msn.Com', '2', '2017-01-21 13:24:01', '2017-01-21 13:24:01'),
(6, 'fsqfjqpofjeq', 'pojfsdpofsdp', '1111-11-11', 'ofhspf@msn.com', '4', '2017-01-21 13:25:09', '2017-01-21 13:25:09');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `instances`
--
ALTER TABLE `instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_instances_on_companies_id` (`companie_id`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_questions_on_instance_id` (`instance_id`);

--
-- Index pour la table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `instances`
--
ALTER TABLE `instances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `instances`
--
ALTER TABLE `instances`
  ADD CONSTRAINT `fk_rails_9749ad038d` FOREIGN KEY (`companie_id`) REFERENCES `companies` (`id`);

--
-- Contraintes pour la table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_rails_bb0a8b2ab7` FOREIGN KEY (`instance_id`) REFERENCES `instances` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
