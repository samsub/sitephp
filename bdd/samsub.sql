-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 02 Novembre 2017 à 14:52
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `samsub`
--

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE `news` (
  `newsid` int(11) NOT NULL,
  `titre` varchar(25) NOT NULL,
  `auteur` int(11) NOT NULL,
  `datepublication` date NOT NULL,
  `datefinpublication` date NOT NULL,
  `etatpublication` tinyint(1) NOT NULL,
  `contenu` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `news`
--

INSERT INTO `news` (`newsid`, `titre`, `auteur`, `datepublication`, `datefinpublication`, `etatpublication`, `contenu`) VALUES
(1, 'Première news', 0, '0000-00-00', '0000-00-00', 0, '<p>Première news</p>');

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE `rubrique` (
  `rubriqueid` int(11) NOT NULL,
  `titre` varchar(40) NOT NULL,
  `contenu` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rubrique`
--

INSERT INTO `rubrique` (`rubriqueid`, `titre`, `contenu`) VALUES
(1, 'Tarifs et inscriptions', '<h2>COTISATIONS SAISON 2017-2018</h2>\n<table class="table table-bordered" style="width: 703px;">\n<tbody>\n<tr>\n<td style="width: 591px;">Nouvel Adhérent</td>\n<td style="width: 126px; text-align: center;">205 €</td>\n</tr>\n<tr>\n<td style="width: 591px;">Renouvellement d\'adhésion</td>\n<td style="width: 126px; text-align: center;">145 €</td>\n</tr>\n<tr>\n<td style="width: 591px;">Enfant (-15 ans)</td>\n<td style="width: 126px; text-align: center;">105 €</td>\n</tr>\n<tr>\n<td style="width: 591px;">Dirigeant, Encadrant, Equipe matériel Adhérent du conseil des Anciens</td>\n<td style="width: 126px; text-align: center;">105 €</td>\n</tr>\n<tr>\n<td style="width: 591px;">Adhésion Passager</td>\n<td style="width: 126px; text-align: center;">145 €</td>\n</tr>\n</tbody>\n</table>\n<h2>DOSSIER D\'INSCRIPTION</h2>\n<p>Futurs Adhérents, vous pouvez télécharger grâce au lien en bas de cette page les éléments nécessaires à votre dossier d\'inscription.<br><span style="font-family: verdana, geneva, sans-serif; font-size: 12pt; color: #ff0000;">Le nombre de places dans les groupes de formation étant limité, les dossiers complets, accompagnés du règlement, seront pris en priorité.</span></p>\n<h2>CONDITIONS D\'INSCRIPTION</h2><h2>\n<ul>\n<li>Savoir nager avec aisance 50 mètres</li>\n<li>Être âgé de 10 ans avant le 31 Décembre 2017.</li>\n</ul>\n</h2><h2>JOURS D\'INSCRIPTION</h2>\n<ul>\n<li>Le samedi 2 septembre 2017 sur le stand SAM Subaquatique lors de la journée SAM EXPO (Stade Robert Brettes - Mérignac).</li>\n<li>Les Jeudi 7, 14 et 21 septembre 2017, à partir de 19h00, au secrétariat de la section (Stade nautique Jean Badet - Mérignac</li>\n</ul>\n<h2>DOSSIER D\'INSCRIPTION</h2>\n<ul>\n<li>1 photo d\'identité (inscrivez votre nom au dos)</li>\n<li>La fiche de Renseignement Adhérent SAM Subaquatique dûment remplie</li>\n<li><strong><u>Pour les adultes</u></strong> : la photocopie du certificat médical de NON CONTRE-INDICATION à la pratique de la plongée sous-marine.<br>\n<strong>Pour une inscription aux groupes de formation niveaux 1, 2 ou 3</strong> (sauf enfant de -15 ans) le certificat médical pourra être délivré par un médecin généraliste. <em>Toutefois nous vous encourageons vivement à consulter un médecin fédéral, médecin du sport ou médecin diplômé médecine subaquatique et/ou hyperbare</em><em>.</em><br> <strong>Pour les autres groupes de formation et la compétition de N.A.P., </strong>il devra être délivré <strong>par un médecin fédéral ou un médecin du sport ou un médecin diplômé médecine subaquatique et/ou hyperbare. </strong><br>Liste des médecins dans le dossier d\'inscription.</li>\n<li><strong><u>Pour les enfants (-15 ans)</u></strong> : Le certificat médical de NON CONTRE-INDICATION à la pratique de la plongée sous-marine devra être délivré par <strong>un médecin fédéral ou un médecin diplômé médecine subaquatique et/ou hyperbare. </strong><em>(Liste des médecins dans le dossier inscription en téléchargement en bas de page). Nous vous conseillons de faire effectuer une audiotympanométrie</em>.</li>\n<li>1 autorisation parentale pour les mineurs.</li>\n<li>Si vous êtes déjà pratiquant, la photocopie de votre dernier diplôme de plongée ou de votre carte de niveau.</li>\n<li>1 chèque, à l\'ordre de "SAM SUBAQUATIQUE", du montant de la cotisation.</li>\n</ul>\n<p><span style="color: #ff0000;">Conservez les originaux des certificats médicaux et audiotympanométrie</span></p>\n<h2>QUE COMPREND VOTRE ADHÉSION ?</h2>\n<ul>\n<li>La licence fédérale (FFESSM) avec son assurance responsabilité civile (envoyée directement à votre domicile)</li>\n<li>L\'assurance complémentaire (loisir 2) (Facultatif)</li>\n<li>L\'adhésion annuelle au SAM (SPORT ATHLÉTIQUE MÉRIGNACAIS)</li>\n<li>Les cours et entraînements piscine délivrés par des moniteurs diplômés, et l\'accès au stade nautique J. Badet les lundi de 20h00 à 22h00 et jeudi de 19h00 à 22h00</li>\n<li>L\'utilisation du matériel du SAM Subaquatique dans le cadre des activités (entraînements en piscine et plongées Club en milieux naturels)</li>\n<li>Le gonflage au local du club de la bouteille de plongée de l\'adhérent</li>\n<li>La possibilité de participer aux activités, stages et sorties organisés par le club.</li>\n</ul>\n<p><strong>TOUTE ADHÉSION IMPLIQUE LE RESPECT DU RÈGLEMENT INTERNE DE LA SECTION ET DE SON FONCTIONNEMENT.</strong></p>\n<p><span style="font-family: verdana, geneva, sans-serif; font-size: 12pt; color: #000000;"><a style="color: #000000;" href="images/sampledata/doc_inscription/Inscription_2017_2018.pdf"><img src="images/sampledata/doc_inscription/icone_pdf.gif" alt="" height="67" width="67">Dossier d\'inscription</a></span></p>'),
(2, 'L\'encadrement', '<p>L\'encadrement</p><p>Liste des encadrants:</p><ul><li>Niveau 1</li><li>Niveau 2</li><li>Niveau 3</li></ul><p><br></p>'),
(3, 'Qui sommes-nous?', '<h2>Vous voulez explorer le Monde du Silence ?</h2>\n<p>Club associatif, la section Subaquatique du SAM, affiliée à la Fédération Française d\'Etudes et Sports Sous-Marins (FFESSM), vous propose :</p>\n<ul style="list-style-type: square;">\n<li>La découverte de la plongée sous-marine en scaphandre autonome à l\'air</li>\n<li>Apprentissage et perfectionnement</li>\n<li>Formation à tous les niveaux de plongeurs</li>\n<li>Préparation aux diplômes d\'encadrement</li>\n<li>Initiation à la photo et biologie sous-marine</li>\n<li>Formation à la plongée Nitrox</li>\n<li>Formation à la Nage avec Palmes en piscine et en milieu naturel</li>\n</ul>\n<p>Adhérent ou visiteur, n\'hésitez pas à parcourir ce site. Vous y trouverez renseignements et conseils pratiques sur la section Subaquatique.</p>\n<p>N\'hésitez pas à nous contacter (par mail) ou à venir nous rendre pour poser vos questions ou nous faire part de vos remarques et suggestions.</p>\n<p>Bonne visite</p>\n<p><iframe width="560" height="315" src="https://www.youtube.com/embed/yCbtPVFv9zE" frameborder="0" allowfullscreen></iframe></p>\n\n<p> </p>\n<p><img src="images/sampledata/parks/animals/dolphin.gif" alt="" /></p>'),
(4, 'Agenda de la SUB', '<iframe src="https://calendar.google.com/calendar/embed?src=auredouard2013@gmail.com'),
(7, 'L\'histoire du SAM Subaquatique', '<p>Fondé en 1972, le SAM Subaquatique, section du SAM Omnisports ...</p>'),
(8, 'Infos pratiques', '<p>Infos pratiques</p>'),
(9, 'Nous localiser', '<p>Stade Nautique Jean Badet<br>\nAvenue du Truc<br>\n33700 MERIGNAC<br>\n</p>\n<p>e-mail : <a href="mailto:samsub-merignac@gmail.com">samsub-merignac@gmail.com</a></p>\n<h3>Entrainements :</h3>\n<p>Grand bassin</p>\n<ul>\n<li>Lundi : 20h00-22h00</li>\n<li>Jeudi : 19h00-20h00</li>\n</ul>\n<p> <a href="https://www.google.fr/maps/place/Stade Nautique de Mérignac/@44.8531806,-0.6619933,4767m/data=!3m1!1e3!4m5!3m4!1s0xd54d9df4fbd0b0f:0xe72515742cf547e6!8m2!3d44.8478407!4d-0.6543409?hl=fr" target="_blank" rel="noopener noreferrer"><img src="images/Gifs/Plan-google.png" alt=""></a>\n<br>\n<br>\n</p>\n<p><img src="images/Gifs/loisir-plongeur-00013.gif" alt=""></p>');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `login` varchar(30) NOT NULL,
  `motdepasse` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newsid`);

--
-- Index pour la table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`rubriqueid`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `news`
--
ALTER TABLE `news`
  MODIFY `newsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `rubriqueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
