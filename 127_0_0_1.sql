-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 05 Mars 2015 à 14:19
-- Version du serveur :  5.6.20
-- Version de PHP :  5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `cdcol`
--

-- --------------------------------------------------------

--
-- Structure de la table `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `interpret` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
`id` bigint(20) unsigned NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Contenu de la table `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `cds`
--
ALTER TABLE `cds`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `cds`
--
ALTER TABLE `cds`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;--
-- Base de données :  `lapire`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(15) unsigned NOT NULL,
  `contenu` text NOT NULL,
  `user_id` int(7) NOT NULL,
  `like` int(7) unsigned NOT NULL,
  `dislike` int(7) unsigned NOT NULL,
  `modere` tinyint(1) NOT NULL DEFAULT '0',
  `quote_id` int(7) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `comments`
--

INSERT INTO `comments` (`id`, `contenu`, `user_id`, `like`, `dislike`, `modere`, `quote_id`, `created_at`, `updated_at`) VALUES
(4, 'commentaire lol', 17, 1, 0, 0, 3, '2015-03-03 16:40:10', '2015-03-03 17:05:39'),
(5, 'test 2 deefefezfze', 17, 0, 0, 1, 3, '2015-03-03 16:42:37', '2015-03-03 17:05:42');

-- --------------------------------------------------------

--
-- Structure de la table `parametres`
--

CREATE TABLE IF NOT EXISTS `parametres` (
`id` int(1) NOT NULL,
  `sloganHome` varchar(200) NOT NULL,
  `quoteHome` varchar(751) NOT NULL,
  `timeRepost` int(3) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `parametres`
--

INSERT INTO `parametres` (`id`, `sloganHome`, `quoteHome`, `timeRepost`) VALUES
(1, 'Alcohol kills slowly. So what? Who''s in a hurry ?', 'Hier, j''ai tellement bu pour mon enterrement de vie de garçon que en me réveillant, j''étais sur le toit d''un hôtel brulé au troisième degrés par le soleil.', 10);

-- --------------------------------------------------------

--
-- Structure de la table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
`id` int(7) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `username` longtext NOT NULL,
  `uid` bigint(20) unsigned NOT NULL,
  `changePseudo` tinyint(1) NOT NULL DEFAULT '0',
  `access_token` varchar(200) NOT NULL,
  `access_token_secret` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `username`, `uid`, `changePseudo`, `access_token`, `access_token_secret`, `created_at`, `updated_at`) VALUES
(5, 18, 'Sébastien Matagne', 777528685677074, 1, 'CAAE9NczN2coBAJMB3v5zr2mZAfFFZBWHdb6dQ74OEkJq89qwK3U2wr8OHDkRKb5Fqg7ZBHLnHfg1Qt2SoN6K1HfBBDgt8YwI3XGZBBZAoNVZAtOxpZAG1zDZAEqRiDSL80FyxBfRPXhmVWl10T3XZAAveCmhivSZBHygmhE8Mm2xqAAGABOacGEv0UOpS0TP1n3y1Lv', '', '2015-02-12 14:21:45', '2015-03-03 16:57:43');

-- --------------------------------------------------------

--
-- Structure de la table `quotes`
--

CREATE TABLE IF NOT EXISTS `quotes` (
`id` int(7) NOT NULL,
  `numero` int(7) DEFAULT NULL,
  `contenu` text NOT NULL,
  `auteur` varchar(200) NOT NULL,
  `like` int(7) NOT NULL DEFAULT '0',
  `dislike` int(7) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `quotes`
--

INSERT INTO `quotes` (`id`, `numero`, `contenu`, `auteur`, `like`, `dislike`, `ip`, `created_at`, `updated_at`) VALUES
(3, 1, 'Hier, test test test ', 'seba2007', 4, 6, '::111', '2015-03-03 16:39:37', '2015-03-03 18:15:54'),
(16, 2, 'Hier, grgergrrr', 'Anonyme', 4, 5, '::1', '2015-03-03 18:00:10', '2015-03-03 18:15:52');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(7) NOT NULL,
  `pseudo` varchar(150) NOT NULL,
  `email` varchar(320) NOT NULL,
  `password` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `token` varchar(200) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `facebook` tinyint(1) NOT NULL DEFAULT '0',
  `changeEmail` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `pseudo`, `email`, `password`, `active`, `role`, `token`, `remember_token`, `facebook`, `changeEmail`, `updated_at`, `created_at`) VALUES
(17, 'seba2007', 'matagne.sebastien@gmail.com', '$2y$10$BvSCUIs0YUpqk85fi1nsleW5KWvUz9saLn0G7ZiFUTGe75MsBDo9O', 1, 'admin', '$2y$10$n0f9T5zgCPm/3cWiWOOhX.u6RjCyi2VQ985hDtW.HCBk1H9WtbEbe', 'NpPJ9IcJyex6BPqmIUIFQ3JMsO6OR7rxhmQyJxmxmLK4h6849mGcJdQ08bQO', 0, 0, '2015-03-03 18:18:49', '2015-02-12 13:51:44'),
(18, 'seba20079', 'matagne.sebastien@gmail.com', '', 0, 'user', '', 'i0ifPncsLIiuKPuiQ1JIS4925WyjrS6ri1Ltzfb9ljEjD88xlcuwYBI8MxsU', 1, 0, '2015-03-03 16:57:50', '2015-02-12 14:21:45');

-- --------------------------------------------------------

--
-- Structure de la table `votescomments`
--

CREATE TABLE IF NOT EXISTS `votescomments` (
`id` int(30) NOT NULL,
  `user_id` int(7) NOT NULL,
  `comment_id` int(7) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `votescomments`
--

INSERT INTO `votescomments` (`id`, `user_id`, `comment_id`, `created_at`, `updated_at`) VALUES
(1, 17, 1, '2015-02-16 21:38:03', '2015-02-16 21:38:03'),
(2, 17, 2, '2015-02-16 21:38:04', '2015-02-16 21:38:04'),
(3, 18, 1, '2015-02-17 17:50:21', '2015-02-17 17:50:21'),
(4, 18, 2, '2015-02-17 17:50:31', '2015-02-17 17:50:31'),
(5, 17, 3, '2015-02-17 20:42:14', '2015-02-17 20:42:14'),
(6, 17, 4, '2015-03-03 16:40:14', '2015-03-03 16:40:14');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `quote_id` (`quote_id`);

--
-- Index pour la table `parametres`
--
ALTER TABLE `parametres`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `profiles`
--
ALTER TABLE `profiles`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `quotes`
--
ALTER TABLE `quotes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `numero` (`numero`), ADD UNIQUE KEY `numero_2` (`numero`), ADD KEY `ip` (`ip`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `votescomments`
--
ALTER TABLE `votescomments`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `quote_id` (`comment_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(15) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `parametres`
--
ALTER TABLE `parametres`
MODIFY `id` int(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `profiles`
--
ALTER TABLE `profiles`
MODIFY `id` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `quotes`
--
ALTER TABLE `quotes`
MODIFY `id` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
MODIFY `id` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `votescomments`
--
ALTER TABLE `votescomments`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `FK_comment_quote` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`),
ADD CONSTRAINT `FK_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `votescomments`
--
ALTER TABLE `votescomments`
ADD CONSTRAINT `FK_votescomments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Base de données :  `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Structure de la table `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
`id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
`id` int(5) unsigned NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=135 ;

--
-- Contenu de la table `pma_column_info`
--

INSERT INTO `pma_column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'waligali', 'users', 'id', '', '', '_', ''),
(2, 'waligali', 'users', 'numUser', '', '', '_', ''),
(3, 'waligali', 'users', 'nom', '', '', '_', ''),
(4, 'waligali', 'users', 'prenom', '', '', '_', ''),
(5, 'waligali', 'users', 'mail', '', '', '_', ''),
(6, 'waligali', 'users', 'password', '', '', '_', ''),
(7, 'waligali', 'users', 'role', '', '', '_', ''),
(8, 'waligali', 'users', 'active', '', '', '_', ''),
(9, 'waligali', 'users', 'token', '', '', '_', ''),
(10, 'waligali', 'users', 'email', '', '', '_', ''),
(11, 'waligali', 'users', 'updated_at', '', '', '_', ''),
(12, 'waligali', 'users', 'created_at', '', '', '_', ''),
(13, 'waligali', 'users', 'remember_token', '', '', '_', ''),
(14, 'waligali', 'categories', 'updated_at', '', '', '_', ''),
(15, 'waligali', 'categories', 'created_at', '', '', '_', ''),
(16, 'waligali', 'trad_categories', 'updated_at', '', '', '_', ''),
(17, 'waligali', 'trad_categories', 'created_at', '', '', '_', ''),
(18, 'waligali', 'articles', 'Id', '', '', '_', ''),
(19, 'waligali', 'articles', 'qteDispo', '', '', '_', ''),
(20, 'waligali', 'articles', 'prix', '', '', '_', ''),
(21, 'waligali', 'articles', 'updated_at', '', '', '_', ''),
(22, 'waligali', 'articles', 'created_at', '', '', '_', ''),
(23, 'waligali', 'articles', 'libFr', '', '', '_', ''),
(35, 'waligali', 'trad_sous_categories', 'updated_at', '', '', '_', ''),
(34, 'waligali', 'trad_sous_categories', 'libArticle', '', '', '_', ''),
(33, 'waligali', 'trad_sous_categories', 'codeLang', '', '', '_', ''),
(31, 'waligali', 'trad_sous_categories', 'Id', '', '', '_', ''),
(32, 'waligali', 'trad_sous_categories', 'articleId', '', '', '_', ''),
(30, 'waligali', 'articles', 'categorieId', '', '', '_', ''),
(36, 'waligali', 'trad_sous_categories', 'created_at', '', '', '_', ''),
(37, 'waligali', 'articles', 'categorie_id', '', '', '_', ''),
(38, 'waligali', 'articles', 'photo', '', '', '_', ''),
(39, 'waligali', 'parametres', 'lienTwitter', '', '', '_', ''),
(40, 'waligali', 'parametres', 'emailContact', '', '', '_', ''),
(41, 'waligali', 'sousCategories', 'id', '', '', '_', ''),
(42, 'waligali', 'sous_categories', 'categorieId', '', '', '_', ''),
(43, 'waligali', 'sous_categories', 'libFr', '', '', '_', ''),
(44, 'waligali', 'sous_categories', 'description', '', '', '_', ''),
(45, 'waligali', 'sous_categories', 'updated_at', '', '', '_', ''),
(46, 'waligali', 'sous_categories', 'created_at', '', '', '_', ''),
(47, 'waligali', 'trad_sous_categories', 'sousCategorieId', '', '', '_', ''),
(48, 'waligali', 'trad_sous_categories', 'libSousCategorie', '', '', '_', ''),
(49, 'waligali', 'articles', 'sousCategorieId', '', '', '_', ''),
(50, 'waligali', 'articles', 'prixId', '', '', '_', ''),
(51, 'waligali', 'articles', 'id', '', '', '_', ''),
(52, 'waligali', 'lignescommandes', 'articleId', '', '', '_', ''),
(53, 'waligali', 'prix', 'id', '', '', '_', ''),
(55, 'waligali', 'prix', 'prix', '', '', '_', ''),
(56, 'waligali', 'prix', 'dateDebut', '', '', '_', ''),
(57, 'waligali', 'prix', 'dateFin', '', '', '_', ''),
(58, 'waligali', 'prix', 'updated_at', '', '', '_', ''),
(59, 'waligali', 'prix', 'created_at', '', '', '_', ''),
(60, 'waligali', 'trad_articles', 'id', '', '', '_', ''),
(61, 'waligali', 'trad_articles', 'articleId', '', '', '_', ''),
(62, 'waligali', 'trad_articles', 'codeLang', '', '', '_', ''),
(63, 'waligali', 'trad_articles', 'libArticle', '', '', '_', ''),
(64, 'waligali', 'trad_articles', 'updated_at', '', '', '_', ''),
(65, 'waligali', 'trad_articles', 'created_at', '', '', '_', ''),
(66, 'waligali', 'articles', 'description', '', '', '_', ''),
(67, 'waligali', 'prix', 'articleId', '', '', '_', ''),
(68, 'waligali', 'sous_categories', 'photo', '', '', '_', ''),
(69, 'waligali', 'articles', 'actif', '', '', '_', ''),
(70, 'waligali', 'sous_categories', 'actif', '', '', '_', ''),
(71, 'waligali', 'news', 'id', '', '', '_', ''),
(72, 'waligali', 'news', 'titreFr', '', '', '_', ''),
(73, 'waligali', 'news', 'updated_at', '', '', '_', ''),
(74, 'waligali', 'news', 'created_at', '', '', '_', ''),
(75, 'waligali', 'trad_news', 'id', '', '', '_', ''),
(76, 'waligali', 'trad_news', 'newsId', '', '', '_', ''),
(77, 'waligali', 'trad_news', 'titre', '', '', '_', ''),
(78, 'waligali', 'trad_news', 'news', '', '', '_', ''),
(79, 'waligali', 'trad_news', 'updated_at', '', '', '_', ''),
(80, 'waligali', 'trad_news', 'created_at', '', '', '_', ''),
(81, 'waligali', 'trad_news', 'codeLang', '', '', '_', ''),
(82, 'lapire', 'users', 'id', '', '', '_', ''),
(83, 'lapire', 'users', 'pseudo', '', '', '_', ''),
(84, 'lapire', 'users', 'email', '', '', '_', ''),
(85, 'lapire', 'users', 'active', '', '', '_', ''),
(92, 'lapire', 'users', 'token', '', '', '_', ''),
(87, 'lapire', 'users', 'remember_token', '', '', '_', ''),
(88, 'lapire', 'users', 'activate', '', '', '_', ''),
(89, 'lapire', 'users', 'updated_at', '', '', '_', ''),
(90, 'lapire', 'users', 'created_at', '', '', '_', ''),
(91, 'lapire', 'users', 'password', '', '', '_', ''),
(93, 'lapire', 'profiles', 'id', '', '', '_', ''),
(94, 'lapire', 'profiles', 'user_id', '', '', '_', ''),
(95, 'lapire', 'profiles', 'username', '', '', '_', ''),
(96, 'lapire', 'profiles', 'uid', '', '', '_', ''),
(97, 'lapire', 'profiles', 'access_token', '', '', '_', ''),
(98, 'lapire', 'profiles', 'access_token_secret', '', '', '_', ''),
(99, 'lapire', 'users', 'facebook', '', '', '_', ''),
(100, 'lapire', 'profiles', 'created_at', '', '', '_', ''),
(101, 'lapire', 'profiles', 'updated_at', '', '', '_', ''),
(102, 'lapire', 'quotes', 'id', '', '', '_', ''),
(103, 'lapire', 'quotes', 'contenu', '', '', '_', ''),
(104, 'lapire', 'quotes', 'auteur', '', '', '_', ''),
(105, 'lapire', 'quotes', 'created_at', '', '', '_', ''),
(106, 'lapire', 'quotes', 'updated_at', '', '', '_', ''),
(107, 'lapire', 'quotes', 'like', '', '', '_', ''),
(108, 'lapire', 'quotes', 'dislike', '', '', '_', ''),
(109, 'lapire', 'quotes', 'nuemro', '', '', '_', ''),
(110, 'lapire', 'quotes', 'numero', '', '', '_', ''),
(111, 'lapire', 'comments', 'id', '', '', '_', ''),
(112, 'lapire', 'comments', 'contenu', '', '', '_', ''),
(113, 'lapire', 'comments', 'user_id', '', '', '_', ''),
(114, 'lapire', 'comments', 'quote_id', '', '', '_', ''),
(115, 'lapire', 'comments', 'created_at', '', '', '_', ''),
(116, 'lapire', 'comments', 'updated_at', '', '', '_', ''),
(117, 'lapire', 'comments', 'like', '', '', '_', ''),
(118, 'lapire', 'comments', 'dislike', '', '', '_', ''),
(119, 'lapire', 'votesComments', 'id', '', '', '_', ''),
(120, 'lapire', 'votesComments', 'user_id', '', '', '_', ''),
(121, 'lapire', 'votesComments', 'quote_id', '', '', '_', ''),
(122, 'lapire', 'votesComments', 'created_at', '', '', '_', ''),
(123, 'lapire', 'votescomments', 'updated_at', '', '', '_', ''),
(124, 'lapire', 'votescomments', 'comment_id', '', '', '_', ''),
(125, 'lapire', 'votescomments', 'id', '', '', '_', ''),
(126, 'lapire', 'profiles', 'changePseudo', '', '', '_', ''),
(127, 'lapire', 'users', 'changeEmail', '', '', '_', ''),
(128, 'lapire', 'quotes', 'ip', '', '', '_', ''),
(129, 'lapire', 'users', 'role', '', '', '_', ''),
(130, 'lapire', 'parametres', 'id', '', '', '_', ''),
(131, 'lapire', 'parametres', 'timeRepost', '', '', '_', ''),
(132, 'lapire', 'parametres', 'sloganHome', '', '', '_', ''),
(133, 'lapire', 'parametres', 'quoteHome', '', '', '_', ''),
(134, 'lapire', 'comments', 'modere', '', '', '_', '');

-- --------------------------------------------------------

--
-- Structure de la table `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Structure de la table `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
`id` bigint(20) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `pma_navigationhiding`
--

CREATE TABLE IF NOT EXISTS `pma_navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Structure de la table `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
`page_nr` int(10) unsigned NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Contenu de la table `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"lapire","table":"quotes"},{"db":"lapire","table":"comments"},{"db":"lapire","table":"parametres"},{"db":"lapire","table":"users"},{"db":"lapire","table":"profiles"},{"db":"waligali","table":"users"},{"db":"lapire","table":"votescomments"},{"db":"lapire","table":"votesComments"}]');

-- --------------------------------------------------------

--
-- Structure de la table `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Structure de la table `pma_savedsearches`
--

CREATE TABLE IF NOT EXISTS `pma_savedsearches` (
`id` int(5) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Structure de la table `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Contenu de la table `pma_table_uiprefs`
--

INSERT INTO `pma_table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'waligali', 'users', '{"CREATE_TIME":"2014-10-05 20:10:46","col_visib":["1","1","1","1","1","1","1","1","1","1","1"]}', '2014-10-05 20:57:43'),
('root', 'lapire', 'users', '{"CREATE_TIME":"2015-02-12 00:59:53","col_visib":["1","1","1","1","1","1","1","1","1","1"]}', '2015-02-15 21:04:02');

-- --------------------------------------------------------

--
-- Structure de la table `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Contenu de la table `pma_userconfig`
--

INSERT INTO `pma_userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2014-10-05 17:36:04', '{"lang":"fr","collation_connection":"utf8mb4_general_ci"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma_usergroups`
--

CREATE TABLE IF NOT EXISTS `pma_usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Structure de la table `pma_users`
--

CREATE TABLE IF NOT EXISTS `pma_users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index pour les tables exportées
--

--
-- Index pour la table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pma_column_info`
--
ALTER TABLE `pma_column_info`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index pour la table `pma_designer_coords`
--
ALTER TABLE `pma_designer_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma_history`
--
ALTER TABLE `pma_history`
 ADD PRIMARY KEY (`id`), ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index pour la table `pma_navigationhiding`
--
ALTER TABLE `pma_navigationhiding`
 ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index pour la table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
 ADD PRIMARY KEY (`page_nr`), ADD KEY `db_name` (`db_name`);

--
-- Index pour la table `pma_recent`
--
ALTER TABLE `pma_recent`
 ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma_relation`
--
ALTER TABLE `pma_relation`
 ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`), ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index pour la table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index pour la table `pma_table_coords`
--
ALTER TABLE `pma_table_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index pour la table `pma_table_info`
--
ALTER TABLE `pma_table_info`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma_table_uiprefs`
--
ALTER TABLE `pma_table_uiprefs`
 ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index pour la table `pma_tracking`
--
ALTER TABLE `pma_tracking`
 ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index pour la table `pma_userconfig`
--
ALTER TABLE `pma_userconfig`
 ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma_usergroups`
--
ALTER TABLE `pma_usergroups`
 ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index pour la table `pma_users`
--
ALTER TABLE `pma_users`
 ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma_column_info`
--
ALTER TABLE `pma_column_info`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT pour la table `pma_history`
--
ALTER TABLE `pma_history`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
MODIFY `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT;--
-- Base de données :  `test`
--
--
-- Base de données :  `waligali`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
`id` int(5) NOT NULL,
  `sousCategorieId` int(2) NOT NULL,
  `libFr` varchar(40) NOT NULL,
  `qteDispo` int(2) NOT NULL,
  `prixId` int(5) NOT NULL,
  `photo` varchar(400) NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT '1',
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`id`, `sousCategorieId`, `libFr`, `qteDispo`, `prixId`, `photo`, `actif`, `updated_at`, `created_at`) VALUES
(1, 1, 'Soie blanche', 17, 1, 'test.png', 1, '2014-10-22', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(2) NOT NULL,
  `libFr` varchar(40) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `libFr`, `updated_at`, `created_at`) VALUES
(1, 'Poules d''ornement', '2014-10-21', '0000-00-00'),
(2, 'Poules pondeuses', '0000-00-00', '0000-00-00'),
(3, 'Matériel avicole', '0000-00-00', '0000-00-00'),
(4, 'Aliment', '2014-10-21', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
`id` int(6) NOT NULL,
  `userId` int(8) NOT NULL,
  `accomptePaye` tinyint(1) NOT NULL,
  `communicationPaiement` varchar(400) NOT NULL,
  `total` decimal(7,2) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`id`, `userId`, `accomptePaye`, `communicationPaiement`, `total`, `updated_at`, `created_at`) VALUES
(1, 1, 1, '13-10-2014-Matagne-1', '25.00', '2014-10-19', '2014-10-13'),
(3, 1, 1, '15-10-2014-Matagne-3', '25.00', '2014-10-19', '2014-10-15'),
(4, 1, 1, '20-10-2014-Matagne-4', '25.00', '2014-10-22', '2014-10-20'),
(5, 1, 0, '22-10-2014-Matagne-5', '75.00', '2014-10-22', '2014-10-22');

-- --------------------------------------------------------

--
-- Structure de la table `liens`
--

CREATE TABLE IF NOT EXISTS `liens` (
`id` int(11) NOT NULL,
  `lien` varchar(500) NOT NULL,
  `libLien` varchar(500) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `liens`
--

INSERT INTO `liens` (`id`, `lien`, `libLien`, `created_at`, `updated_at`) VALUES
(1, 'http://www.test.com', 'abcd', '0000-00-00', '2014-10-16'),
(3, 'http://www.test.com', 'Test', '2014-10-16', '2014-10-16');

-- --------------------------------------------------------

--
-- Structure de la table `lignescommandes`
--

CREATE TABLE IF NOT EXISTS `lignescommandes` (
`id` int(10) NOT NULL,
  `articleId` int(5) NOT NULL,
  `commandeId` int(6) NOT NULL,
  `qte` int(3) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `lignescommandes`
--

INSERT INTO `lignescommandes` (`id`, `articleId`, `commandeId`, `qte`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 1, '2014-10-13', '2014-10-13'),
(3, 1, 3, 1, '2014-10-15', '2014-10-15'),
(4, 1, 4, 1, '2014-10-20', '2014-10-20'),
(5, 1, 5, 3, '2014-10-22', '2014-10-22');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_06_183512_create_password_reminders_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`id` int(4) NOT NULL,
  `titreFr` varchar(500) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `news`
--

INSERT INTO `news` (`id`, `titreFr`, `updated_at`, `created_at`) VALUES
(1, 'Titre un peu beaucoup trop ? long ', '2014-10-18', '2014-10-18'),
(2, 'News2', '2014-10-19', '2014-10-19');

-- --------------------------------------------------------

--
-- Structure de la table `parametres`
--

CREATE TABLE IF NOT EXISTS `parametres` (
`id` int(1) NOT NULL,
  `pourcAccompte` int(3) NOT NULL,
  `numCompte` varchar(30) NOT NULL,
  `lienFacebook` varchar(535) NOT NULL,
  `lienTwitter` varchar(535) NOT NULL,
  `emailContact` varchar(50) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `parametres`
--

INSERT INTO `parametres` (`id`, `pourcAccompte`, `numCompte`, `lienFacebook`, `lienTwitter`, `emailContact`, `updated_at`, `created_at`) VALUES
(1, 10, 'BE25 123456783', 'https://fr-fr.facebook.com/pages/WaliGali-%C3%A9levage-de-poules-dornement/654148604650699', '#', 'florent@delarbre.biz', '2014-10-15', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `password_reminders`
--

CREATE TABLE IF NOT EXISTS `password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prix`
--

CREATE TABLE IF NOT EXISTS `prix` (
`id` int(5) NOT NULL,
  `articleId` int(5) NOT NULL,
  `prix` decimal(5,2) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `prix`
--

INSERT INTO `prix` (`id`, `articleId`, `prix`, `dateDebut`, `dateFin`, `updated_at`, `created_at`) VALUES
(1, 1, '25.00', '2014-10-11', '2014-10-31', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `sous_categories`
--

CREATE TABLE IF NOT EXISTS `sous_categories` (
`id` int(2) NOT NULL,
  `categorieId` int(2) NOT NULL,
  `libFr` varchar(40) NOT NULL,
  `photo` varchar(400) NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT '1',
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Contenu de la table `sous_categories`
--

INSERT INTO `sous_categories` (`id`, `categorieId`, `libFr`, `photo`, `actif`, `updated_at`, `created_at`) VALUES
(1, 1, 'Soie', 'test.png', 1, '2014-10-10', '0000-00-00'),
(2, 1, 'Bantam de Pekin', '', 1, '0000-00-00', '0000-00-00'),
(3, 1, 'Hollandaise à huppe', '', 1, '0000-00-00', '0000-00-00'),
(4, 1, 'Nagasaki', '', 1, '0000-00-00', '0000-00-00'),
(5, 1, 'Combatant Anglais', '', 1, '0000-00-00', '0000-00-00'),
(6, 1, 'Houdan', '', 1, '0000-00-00', '0000-00-00'),
(7, 1, 'Cochin', '', 1, '0000-00-00', '0000-00-00'),
(8, 1, 'Sebright', '', 1, '0000-00-00', '0000-00-00'),
(9, 2, 'Brune', '', 1, '0000-00-00', '0000-00-00'),
(10, 2, 'Noir herminée brune', '', 1, '0000-00-00', '0000-00-00'),
(11, 2, 'Blanche herminée noir', '', 1, '0000-00-00', '0000-00-00'),
(12, 2, 'Bleu', '', 1, '0000-00-00', '0000-00-00'),
(13, 2, 'Eurocana', '', 1, '0000-00-00', '0000-00-00'),
(14, 2, 'Marans', '', 1, '0000-00-00', '0000-00-00'),
(15, 2, 'Druffler', '', 1, '0000-00-00', '0000-00-00'),
(16, 3, 'Abreuvoir', '', 1, '0000-00-00', '0000-00-00'),
(17, 3, 'Mangeoire', '', 1, '0000-00-00', '0000-00-00'),
(18, 3, 'Chauffage', '', 1, '0000-00-00', '0000-00-00'),
(19, 4, 'Poule', '', 1, '0000-00-00', '0000-00-00'),
(20, 4, 'Chevaux', '', 1, '0000-00-00', '0000-00-00'),
(21, 4, 'Mouton', '', 1, '0000-00-00', '0000-00-00'),
(22, 4, 'Chèvre', '', 1, '0000-00-00', '0000-00-00'),
(23, 4, 'Lapin', '', 1, '0000-00-00', '0000-00-00'),
(24, 4, 'Chien', '', 1, '0000-00-00', '0000-00-00'),
(25, 4, 'Chat', '', 1, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `trad_articles`
--

CREATE TABLE IF NOT EXISTS `trad_articles` (
`id` int(10) NOT NULL,
  `articleId` int(5) NOT NULL,
  `codeLang` varchar(2) NOT NULL,
  `libArticle` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `trad_articles`
--

INSERT INTO `trad_articles` (`id`, `articleId`, `codeLang`, `libArticle`, `description`, `updated_at`, `created_at`) VALUES
(1, 1, 'fr', 'Soie blanche', 'test 2', '0000-00-00', '0000-00-00'),
(2, 1, 'nl', 'Soie blanche[NL]', '', '0000-00-00', '0000-00-00'),
(3, 1, 'en', 'Soie blanche[EN]', '', '0000-00-00', '0000-00-00'),
(4, 1, 'de', 'Soie blanche[DE]', '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `trad_categories`
--

CREATE TABLE IF NOT EXISTS `trad_categories` (
`id` int(2) NOT NULL,
  `categorieId` int(2) NOT NULL,
  `codeLang` varchar(2) NOT NULL,
  `libCategorie` varchar(40) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `trad_categories`
--

INSERT INTO `trad_categories` (`id`, `categorieId`, `codeLang`, `libCategorie`, `updated_at`, `created_at`) VALUES
(1, 1, 'fr', 'Poules d''ornement', '2014-10-21', '0000-00-00'),
(2, 1, 'nl', 'Poules d''ornement[NL]', '2014-10-21', '0000-00-00'),
(3, 1, 'en', 'Poules d''ornement[EN]', '2014-10-21', '0000-00-00'),
(4, 1, 'de', 'Poules d''ornement[DE]', '2014-10-21', '0000-00-00'),
(5, 2, 'fr', 'Poules pondeuses', '0000-00-00', '0000-00-00'),
(6, 2, 'nl', 'Poules pondeuses[NL]', '0000-00-00', '0000-00-00'),
(7, 2, 'en', 'Poules pondeuses[EN]', '0000-00-00', '0000-00-00'),
(8, 2, 'de', 'Poules pondeuses[DE]', '0000-00-00', '0000-00-00'),
(9, 3, 'fr', 'Matériel avicole', '0000-00-00', '0000-00-00'),
(10, 3, 'nl', 'Matériel avicole[NL]', '0000-00-00', '0000-00-00'),
(11, 3, 'en', 'Matériel avicole[EN]', '0000-00-00', '0000-00-00'),
(12, 3, 'de', 'Matériel avicole[DE]', '0000-00-00', '0000-00-00'),
(13, 4, 'fr', 'Aliment', '2014-10-21', '0000-00-00'),
(14, 4, 'nl', 'Aliment[NL]', '2014-10-21', '0000-00-00'),
(15, 4, 'en', 'Aliment[EN]', '2014-10-21', '0000-00-00'),
(16, 4, 'de', 'Aliment[DE]', '2014-10-21', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `trad_home`
--

CREATE TABLE IF NOT EXISTS `trad_home` (
`id` int(2) NOT NULL,
  `codeLang` varchar(2) NOT NULL,
  `homePage` text NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `trad_home`
--

INSERT INTO `trad_home` (`id`, `codeLang`, `homePage`, `updated_at`, `created_at`) VALUES
(1, 'fr', '<h1>Bienvenue</h1>\r\n\r\n<h2><br />\r\nblablablablablablablablablablablablablablablablablablablablablablablablablabla</h2>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n', '2014-10-16', '0000-00-00'),
(2, 'nl', '<h1>Bienvenue NL</h1>\r\n\r\n<h2>blablablablablablablablablablablablablablablablablablablablablablablablablabla</h2>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n', '2014-10-16', '0000-00-00'),
(3, 'en', '<h1>Bienvenue En</h1>\r\n\r\n<h2><br />\r\nblablablablablablablablablablablablablablablablablablablablablablablablablabla</h2>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n', '2014-10-16', '0000-00-00'),
(4, 'de', '<h1>Bienvenue &nbsp;DE</h1>\r\n\r\n<h2>blablablablablablablablablablablablablablablablablablablablablablablablablabla</h2>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n\r\n<p>blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla</p>\r\n', '2014-10-16', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `trad_news`
--

CREATE TABLE IF NOT EXISTS `trad_news` (
`id` int(5) NOT NULL,
  `newsId` int(4) NOT NULL,
  `codeLang` varchar(2) NOT NULL,
  `titre` varchar(500) NOT NULL,
  `news` text NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `trad_news`
--

INSERT INTO `trad_news` (`id`, `newsId`, `codeLang`, `titre`, `news`, `updated_at`, `created_at`) VALUES
(1, 1, 'fr', 'Titre un peu beaucoup trop ? long ', 'Voici une nouvelle qui fait plusieurs mot afin de tester la longueur dans la page d''accueil.', '2014-10-18', '2014-10-18'),
(2, 1, 'nl', 'TitreNl 2', 'News Nl 2', '2014-10-18', '2014-10-18'),
(3, 1, 'en', 'Titre En  2', 'News En 2', '2014-10-18', '2014-10-18'),
(4, 1, 'de', 'Titre De 2', 'News De 2', '2014-10-18', '2014-10-18'),
(5, 2, 'fr', 'News2', 'efefefzefzzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzef', '2014-10-19', '2014-10-19'),
(6, 2, 'nl', 'efzefz', 'efzefzefzezefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzef', '2014-10-19', '2014-10-19'),
(7, 2, 'en', 'fzefzef', 'zefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzef', '2014-10-19', '2014-10-19'),
(8, 2, 'de', 'zefzefzef', 'zefzefze  fzefzefzezefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzef', '2014-10-19', '2014-10-19'),
(9, 3, 'fr', 'zefzef   zefzefzefzef   zefzefzefzef   zefzef', 'zefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzef', '2014-10-19', '2014-10-19'),
(10, 3, 'nl', 'zefzef   zefzefzefzef   zefzefzefzef   zefzef', 'zefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzef', '2014-10-19', '2014-10-19'),
(11, 3, 'en', 'zefzef   zefzefzefzef   zefzefzefzef   zefzef', 'zefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzef', '2014-10-19', '2014-10-19'),
(12, 3, 'de', 'zefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzef', 'zefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzefzefzef   zefzef', '2014-10-19', '2014-10-19');

-- --------------------------------------------------------

--
-- Structure de la table `trad_sous_categories`
--

CREATE TABLE IF NOT EXISTS `trad_sous_categories` (
`id` int(2) NOT NULL,
  `sousCategorieId` int(2) NOT NULL,
  `codeLang` varchar(2) NOT NULL,
  `libSousCategorie` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- Contenu de la table `trad_sous_categories`
--

INSERT INTO `trad_sous_categories` (`id`, `sousCategorieId`, `codeLang`, `libSousCategorie`, `description`, `updated_at`, `created_at`) VALUES
(1, 1, 'fr', 'Soie', 'test', '0000-00-00', '0000-00-00'),
(2, 1, 'nl', 'Soie[NL]', '', '0000-00-00', '0000-00-00'),
(3, 1, 'en', 'Soie[EN]', '', '0000-00-00', '0000-00-00'),
(4, 1, 'de', 'Soie[DE]', '', '0000-00-00', '0000-00-00'),
(5, 2, 'fr', 'Bantam de Pekin', '', '0000-00-00', '0000-00-00'),
(6, 2, 'nl', 'Bantam de Pekin[NL]', '', '0000-00-00', '0000-00-00'),
(7, 2, 'en', 'Bantam de Pekin[EN]', '', '0000-00-00', '0000-00-00'),
(8, 2, 'de', 'Bantam de Pekin[DE]', '', '0000-00-00', '0000-00-00'),
(9, 3, 'fr', 'Hollandaise à huppe', '', '0000-00-00', '0000-00-00'),
(10, 3, 'nl', 'Hollandaise à huppe[NL]', '', '0000-00-00', '0000-00-00'),
(11, 3, 'en', 'Hollandaise à huppe[EN]', '', '0000-00-00', '0000-00-00'),
(12, 3, 'de', 'Hollandaise à huppe[DE]', '', '0000-00-00', '0000-00-00'),
(13, 4, 'fr', 'Nagasaki', '', '0000-00-00', '0000-00-00'),
(14, 4, 'nl', 'Nagasaki[NL]', '', '0000-00-00', '0000-00-00'),
(15, 4, 'en', 'Nagasaki[EN]', '', '0000-00-00', '0000-00-00'),
(16, 4, 'de', 'Nagasaki[DE]', '', '0000-00-00', '0000-00-00'),
(17, 5, 'fr', 'Combatant Anglais', '', '0000-00-00', '0000-00-00'),
(18, 5, 'nl', 'Combatant Anglais[NL]', '', '0000-00-00', '0000-00-00'),
(19, 5, 'en', 'Combatant Anglais[EN]', '', '0000-00-00', '0000-00-00'),
(20, 5, 'de', 'Combatant Anglais[DE]', '', '0000-00-00', '0000-00-00'),
(21, 6, 'fr', 'Houdan', '', '0000-00-00', '0000-00-00'),
(22, 6, 'nl', 'Houdan[NL]', '', '0000-00-00', '0000-00-00'),
(23, 6, 'en', 'Houdan[EN]', '', '0000-00-00', '0000-00-00'),
(24, 6, 'de', 'Houdan[DE]', '', '0000-00-00', '0000-00-00'),
(25, 7, 'fr', 'Cochin', '', '0000-00-00', '0000-00-00'),
(26, 7, 'nl', 'Cochin[NL]', '', '0000-00-00', '0000-00-00'),
(27, 7, 'en', 'Cochin[EN]', '', '0000-00-00', '0000-00-00'),
(28, 7, 'de', 'Cochin[DE]', '', '0000-00-00', '0000-00-00'),
(29, 8, 'fr', 'Sebright', '', '0000-00-00', '0000-00-00'),
(30, 8, 'nl', 'Sebright[NL]', '', '0000-00-00', '0000-00-00'),
(31, 8, 'en', 'Sebright[EN]', '', '0000-00-00', '0000-00-00'),
(32, 8, 'de', 'Sebright[DE]', '', '0000-00-00', '0000-00-00'),
(33, 9, 'fr', 'Brune', '', '0000-00-00', '0000-00-00'),
(34, 9, 'nl', 'Brune[NL]', '', '0000-00-00', '0000-00-00'),
(35, 9, 'en', 'Brune[EN]', '', '0000-00-00', '0000-00-00'),
(36, 9, 'DE', 'Brune[DE]', '', '0000-00-00', '0000-00-00'),
(37, 10, 'fr', 'Noir herminée brune', '', '0000-00-00', '0000-00-00'),
(38, 10, 'nl', 'Noir herminée brune[NL]', '', '0000-00-00', '0000-00-00'),
(39, 10, 'en', 'Noir herminée brune[EN]', '', '0000-00-00', '0000-00-00'),
(40, 10, 'DE', 'Noir herminée brune[DE]', '', '0000-00-00', '0000-00-00'),
(41, 11, 'fr', 'Blanche herminée noir', '', '0000-00-00', '0000-00-00'),
(42, 11, 'nl', 'Blanche herminée noir[NL]', '', '0000-00-00', '0000-00-00'),
(43, 11, 'en', 'Blanche herminée noir[EN]', '', '0000-00-00', '0000-00-00'),
(44, 11, 'DE', 'Blanche herminée noir[DE]', '', '0000-00-00', '0000-00-00'),
(45, 12, 'fr', 'Bleu', '', '0000-00-00', '0000-00-00'),
(46, 12, 'nl', 'Bleu[NL]', '', '0000-00-00', '0000-00-00'),
(47, 12, 'en', 'Bleu[EN]', '', '0000-00-00', '0000-00-00'),
(48, 12, 'DE', 'Bleu[DE]', '', '0000-00-00', '0000-00-00'),
(49, 13, 'fr', 'Eurocana', '', '0000-00-00', '0000-00-00'),
(50, 13, 'nl', 'Eurocana[NL]', '', '0000-00-00', '0000-00-00'),
(51, 13, 'en', 'Eurocana[EN]', '', '0000-00-00', '0000-00-00'),
(52, 13, 'DE', 'Eurocana[DE]', '', '0000-00-00', '0000-00-00'),
(53, 14, 'fr', 'Marans', '', '0000-00-00', '0000-00-00'),
(54, 14, 'nl', 'Marans[NL]', '', '0000-00-00', '0000-00-00'),
(55, 14, 'en', 'Marans[EN]', '', '0000-00-00', '0000-00-00'),
(56, 14, 'DE', 'Marans[DE]', '', '0000-00-00', '0000-00-00'),
(57, 15, 'fr', 'Druffler', '', '0000-00-00', '0000-00-00'),
(58, 15, 'nl', 'Druffler[NL]', '', '0000-00-00', '0000-00-00'),
(59, 15, 'en', 'Druffler[EN]', '', '0000-00-00', '0000-00-00'),
(60, 15, 'DE', 'Druffler[DE]', '', '0000-00-00', '0000-00-00'),
(61, 16, 'fr', 'Abreuvoir', '', '0000-00-00', '0000-00-00'),
(62, 16, 'nl', 'Abreuvoir[NL]', '', '0000-00-00', '0000-00-00'),
(63, 16, 'en', 'Abreuvoir[EN]', '', '0000-00-00', '0000-00-00'),
(64, 16, 'DE', 'Abreuvoir[DE]', '', '0000-00-00', '0000-00-00'),
(65, 17, 'fr', 'Mangeoire', '', '0000-00-00', '0000-00-00'),
(66, 17, 'nl', 'Mangeoire[NL]', '', '0000-00-00', '0000-00-00'),
(67, 17, 'en', 'Mangeoire[EN]', '', '0000-00-00', '0000-00-00'),
(68, 17, 'DE', 'Mangeoire[DE]', '', '0000-00-00', '0000-00-00'),
(69, 18, 'fr', 'Chauffage', '', '0000-00-00', '0000-00-00'),
(70, 18, 'nl', 'Chauffage[NL]', '', '0000-00-00', '0000-00-00'),
(71, 18, 'en', 'Chauffage[EN]', '', '0000-00-00', '0000-00-00'),
(72, 18, 'DE', 'Chauffage[DE]', '', '0000-00-00', '0000-00-00'),
(73, 19, 'fr', 'Poule', '', '0000-00-00', '0000-00-00'),
(74, 19, 'nl', 'Poule[NL]', '', '0000-00-00', '0000-00-00'),
(75, 19, 'en', 'Poule[EN]', '', '0000-00-00', '0000-00-00'),
(76, 19, 'DE', 'Poule[DE]', '', '0000-00-00', '0000-00-00'),
(77, 20, 'fr', 'Chevaux', '', '0000-00-00', '0000-00-00'),
(78, 20, 'nl', 'Chevaux[NL]', '', '0000-00-00', '0000-00-00'),
(79, 20, 'en', 'Chevaux[EN]', '', '0000-00-00', '0000-00-00'),
(80, 20, 'DE', 'Chevaux[DE]', '', '0000-00-00', '0000-00-00'),
(81, 21, 'fr', 'Mouton', '', '0000-00-00', '0000-00-00'),
(82, 21, 'nl', 'Mouton[NL]', '', '0000-00-00', '0000-00-00'),
(83, 21, 'en', 'Mouton[EN]', '', '0000-00-00', '0000-00-00'),
(84, 21, 'DE', 'Mouton[DE]', '', '0000-00-00', '0000-00-00'),
(85, 22, 'fr', 'Chèvre', '', '0000-00-00', '0000-00-00'),
(86, 22, 'nl', 'Chèvre[NL]', '', '0000-00-00', '0000-00-00'),
(87, 22, 'en', 'Chèvre[EN]', '', '0000-00-00', '0000-00-00'),
(88, 22, 'DE', 'Chèvre[DE]', '', '0000-00-00', '0000-00-00'),
(89, 23, 'fr', 'Lapin', '', '0000-00-00', '0000-00-00'),
(90, 23, 'nl', 'Lapin[NL]', '', '0000-00-00', '0000-00-00'),
(91, 23, 'en', 'Lapin[EN]', '', '0000-00-00', '0000-00-00'),
(92, 23, 'DE', 'Lapin[DE]', '', '0000-00-00', '0000-00-00'),
(93, 24, 'fr', 'Chien', '', '0000-00-00', '0000-00-00'),
(94, 24, 'nl', 'Chien[NL]', '', '0000-00-00', '0000-00-00'),
(95, 24, 'en', 'Chien[EN]', '', '0000-00-00', '0000-00-00'),
(96, 24, 'DE', 'Chien[DE]', '', '0000-00-00', '0000-00-00'),
(97, 25, 'fr', 'Chat', '', '0000-00-00', '0000-00-00'),
(98, 25, 'nl', 'Chat[NL]', '', '0000-00-00', '0000-00-00'),
(99, 25, 'en', 'Chat[EN]', '', '0000-00-00', '0000-00-00'),
(100, 25, 'DE', 'Chat[DE]', '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(5) NOT NULL,
  `numUser` int(8) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(200) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  `remember_token` varchar(200) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `numUser`, `nom`, `prenom`, `email`, `password`, `role`, `active`, `token`, `updated_at`, `created_at`, `remember_token`) VALUES
(1, 20140001, 'Matagne', 'Sébastien', 'matagne.sebastien@gmail.com', '$2y$10$n0f9T5zgCPm/3cWiWOOhX.u6RjCyi2VQ985hDtW.HCBk1H9WtbEbe', 'admin', 1, '93cd4d3fe84973a1e8356b9fd313388af707e948', '2014-10-22', '2014-10-07', 'qoDuzuiOom5CcvsgdWAX0sQu4uIc4bxO7fw2tBArKssqSh8cgsCCMwhsw3Se');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
 ADD PRIMARY KEY (`id`), ADD KEY `categorieId` (`sousCategorieId`), ADD KEY `categorieId_2` (`sousCategorieId`), ADD KEY `prixId` (`prixId`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
 ADD PRIMARY KEY (`id`), ADD KEY `userId` (`userId`);

--
-- Index pour la table `liens`
--
ALTER TABLE `liens`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignescommandes`
--
ALTER TABLE `lignescommandes`
 ADD PRIMARY KEY (`id`), ADD KEY `articleId` (`articleId`), ADD KEY `commandeId` (`commandeId`);

--
-- Index pour la table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `parametres`
--
ALTER TABLE `parametres`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reminders`
--
ALTER TABLE `password_reminders`
 ADD KEY `password_reminders_email_index` (`email`), ADD KEY `password_reminders_token_index` (`token`);

--
-- Index pour la table `prix`
--
ALTER TABLE `prix`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sous_categories`
--
ALTER TABLE `sous_categories`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_SousCategories_categorieId` (`categorieId`);

--
-- Index pour la table `trad_articles`
--
ALTER TABLE `trad_articles`
 ADD PRIMARY KEY (`id`), ADD KEY `articleId` (`articleId`);

--
-- Index pour la table `trad_categories`
--
ALTER TABLE `trad_categories`
 ADD PRIMARY KEY (`id`), ADD KEY `categorieId` (`categorieId`);

--
-- Index pour la table `trad_home`
--
ALTER TABLE `trad_home`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `trad_news`
--
ALTER TABLE `trad_news`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `trad_sous_categories`
--
ALTER TABLE `trad_sous_categories`
 ADD PRIMARY KEY (`id`), ADD KEY `articleId` (`sousCategorieId`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `liens`
--
ALTER TABLE `liens`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `lignescommandes`
--
ALTER TABLE `lignescommandes`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `news`
--
ALTER TABLE `news`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `parametres`
--
ALTER TABLE `parametres`
MODIFY `id` int(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `prix`
--
ALTER TABLE `prix`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `sous_categories`
--
ALTER TABLE `sous_categories`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `trad_articles`
--
ALTER TABLE `trad_articles`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `trad_categories`
--
ALTER TABLE `trad_categories`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `trad_home`
--
ALTER TABLE `trad_home`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `trad_news`
--
ALTER TABLE `trad_news`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `trad_sous_categories`
--
ALTER TABLE `trad_sous_categories`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
ADD CONSTRAINT `fk_article_prixId` FOREIGN KEY (`prixId`) REFERENCES `prix` (`id`),
ADD CONSTRAINT `fk_article_souscatId` FOREIGN KEY (`sousCategorieId`) REFERENCES `sous_categories` (`id`);

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `lignescommandes`
--
ALTER TABLE `lignescommandes`
ADD CONSTRAINT `fk_lignesCommandes_articleId` FOREIGN KEY (`articleId`) REFERENCES `articles` (`id`),
ADD CONSTRAINT `fk_lignesCommandes_commandeId` FOREIGN KEY (`commandeId`) REFERENCES `commandes` (`id`);

--
-- Contraintes pour la table `sous_categories`
--
ALTER TABLE `sous_categories`
ADD CONSTRAINT `FK_SousCategories_categorieId` FOREIGN KEY (`categorieId`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `trad_articles`
--
ALTER TABLE `trad_articles`
ADD CONSTRAINT `fk_tradArt_articleId` FOREIGN KEY (`articleId`) REFERENCES `articles` (`id`);

--
-- Contraintes pour la table `trad_categories`
--
ALTER TABLE `trad_categories`
ADD CONSTRAINT `FK_TradCategorie_categorieId` FOREIGN KEY (`categorieId`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `trad_sous_categories`
--
ALTER TABLE `trad_sous_categories`
ADD CONSTRAINT `fk_tradSousCat_SousCatId` FOREIGN KEY (`sousCategorieId`) REFERENCES `trad_sous_categories` (`id`);
--
-- Base de données :  `webauth`
--

-- --------------------------------------------------------

--
-- Structure de la table `user_pwd`
--

CREATE TABLE IF NOT EXISTS `user_pwd` (
  `name` char(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pass` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `user_pwd`
--

INSERT INTO `user_pwd` (`name`, `pass`) VALUES
('xampp', 'wampp');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `user_pwd`
--
ALTER TABLE `user_pwd`
 ADD PRIMARY KEY (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
