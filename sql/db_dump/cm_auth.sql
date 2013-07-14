-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: cm_auth
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `gmlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sessionkey` longtext,
  `v` longtext,
  `s` longtext,
  `email` text,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `failed_logins` int(11) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active_realm_id` int(11) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mutetime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_gmlevel` (`gmlevel`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Account System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'ADMINISTRATOR','a34b29541b87b7e4823683ce6c7bf6ae68beaaac',3,'','0','0','','2006-04-25 10:18:56','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0),(2,'GAMEMASTER','7841e21831d7c6bc0b57fbe7151eb82bd65ea1f9',2,'','0','0','','2006-04-25 10:18:56','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0),(3,'MODERATOR','a7f5fbff0b4eec2d6b6e78e38e8312e64d700008',1,'','0','0','','2006-04-25 10:19:35','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0),(5,'FROID','747529b11b2ad0fc6bad77954c23665ff8f80af0',3,'8E663FEC8EE9287A91A076AE67600986FA99B09AEB049E3C2F9A7D1BBDA9B7304812A67C6A12F49A','12B12FA5FE1DC1E73D4892D8D6F2E4534C4919FE692CCDCBABF23D97D79785D3','D4EC7551F7B90BCDE64101FA9FCFD31F05DD24DCD5BF36D41BCA2F95A687E641','tmvFroid@gmail.com','2013-05-16 02:50:30','127.0.0.1',0,0,'2013-07-14 14:40:01',0,2,0,0),(8,'TEST','3D0D99423E31FCC67A6745EC89D70D700344BC76',0,'8434FA5B2B3E9FF1775A158427581D6692BCAC40D222F49898CC08DC8179F915B7C45873708CFF58','8262732C68E009F26B18D387652F52065AFB93991429980C0C35DC981A83CF0C','F9EBF4CF5FEA1358EDC2D627929E8FB80612E53C6D3C57A8391AA211849CA167',NULL,'2013-07-09 20:30:17','127.0.0.1',0,0,'2013-07-10 04:38:06',0,2,0,0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_banned`
--

DROP TABLE IF EXISTS `account_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_banned` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` bigint(40) NOT NULL DEFAULT '0',
  `unbandate` bigint(40) NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_banned`
--

LOCK TABLES `account_banned` WRITE;
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
INSERT INTO `account_banned` VALUES (3,1369683543,1369773544,'','No reason',0);
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_banned` (
  `ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `bandate` bigint(40) NOT NULL,
  `unbandate` bigint(40) NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Banned IPs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_banned`
--

LOCK TABLES `ip_banned` WRITE;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_acc_creation_captcha`
--

DROP TABLE IF EXISTS `mw_acc_creation_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_acc_creation_captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(200) NOT NULL DEFAULT '',
  `key` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_acc_creation_captcha`
--

LOCK TABLES `mw_acc_creation_captcha` WRITE;
/*!40000 ALTER TABLE `mw_acc_creation_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `mw_acc_creation_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_account_extend`
--

DROP TABLE IF EXISTS `mw_account_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_account_extend` (
  `account_id` int(10) unsigned NOT NULL,
  `account_level` smallint(3) NOT NULL DEFAULT '1',
  `theme` smallint(3) NOT NULL DEFAULT '0',
  `last_visit` int(25) DEFAULT NULL,
  `registration_ip` varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT '0.0.0.0',
  `activation_code` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `secret_q1` text CHARACTER SET latin1,
  `secret_a1` text CHARACTER SET latin1,
  `secret_q2` text CHARACTER SET latin1,
  `secret_a2` text CHARACTER SET latin1,
  `web_points` int(3) NOT NULL DEFAULT '0',
  `points_earned` int(11) NOT NULL DEFAULT '0',
  `points_spent` int(11) NOT NULL DEFAULT '0',
  `date_points` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `points_today` int(11) NOT NULL DEFAULT '0',
  `total_donations` varchar(5) CHARACTER SET latin1 NOT NULL DEFAULT '0.00',
  `total_votes` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_account_extend`
--

LOCK TABLES `mw_account_extend` WRITE;
/*!40000 ALTER TABLE `mw_account_extend` DISABLE KEYS */;
INSERT INTO `mw_account_extend` VALUES (1,1,0,NULL,'0.0.0.0',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'0',0,'0.00',0),(2,1,0,NULL,'0.0.0.0',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'0',0,'0.00',0),(3,1,0,NULL,'0.0.0.0',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'0',0,'0.00',0),(4,1,0,NULL,'0.0.0.0',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'0',0,'0.00',0),(5,4,1,1372430777,'0.0.0.0',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'0',0,'0.00',0);
/*!40000 ALTER TABLE `mw_account_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_account_groups`
--

DROP TABLE IF EXISTS `mw_account_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_account_groups` (
  `account_level` smallint(2) NOT NULL DEFAULT '1',
  `title` text CHARACTER SET latin1,
  PRIMARY KEY (`account_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_account_groups`
--

LOCK TABLES `mw_account_groups` WRITE;
/*!40000 ALTER TABLE `mw_account_groups` DISABLE KEYS */;
INSERT INTO `mw_account_groups` VALUES (1,'Guest'),(2,'Member'),(3,'Admin'),(4,'Super Admin'),(5,'Banned');
/*!40000 ALTER TABLE `mw_account_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_account_keys`
--

DROP TABLE IF EXISTS `mw_account_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_account_keys` (
  `id` int(11) unsigned NOT NULL,
  `key` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `assign_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_account_keys`
--

LOCK TABLES `mw_account_keys` WRITE;
/*!40000 ALTER TABLE `mw_account_keys` DISABLE KEYS */;
INSERT INTO `mw_account_keys` VALUES (5,'90cd4ac6e06b82ea13a715df2c506bf101102817',1369581400);
/*!40000 ALTER TABLE `mw_account_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_db_version`
--

DROP TABLE IF EXISTS `mw_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_db_version` (
  `dbver` varchar(20) NOT NULL DEFAULT '',
  `dbdate` int(10) unsigned NOT NULL DEFAULT '0',
  `entry` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_db_version`
--

LOCK TABLES `mw_db_version` WRITE;
/*!40000 ALTER TABLE `mw_db_version` DISABLE KEYS */;
INSERT INTO `mw_db_version` VALUES ('1.0a',1292781212,1);
/*!40000 ALTER TABLE `mw_db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_donate_packages`
--

DROP TABLE IF EXISTS `mw_donate_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_donate_packages` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `cost` varchar(11) CHARACTER SET latin1 NOT NULL DEFAULT '1.00',
  `points` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_donate_packages`
--

LOCK TABLES `mw_donate_packages` WRITE;
/*!40000 ALTER TABLE `mw_donate_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mw_donate_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_donate_transactions`
--

DROP TABLE IF EXISTS `mw_donate_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_donate_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `account` int(8) DEFAULT NULL,
  `item_number` int(11) DEFAULT NULL,
  `buyer_email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `payment_type` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `pending_reason` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `reason_code` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `amount` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `item_given` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_donate_transactions`
--

LOCK TABLES `mw_donate_transactions` WRITE;
/*!40000 ALTER TABLE `mw_donate_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mw_donate_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_faq`
--

DROP TABLE IF EXISTS `mw_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_faq` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET latin1 NOT NULL,
  `answer` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_faq`
--

LOCK TABLES `mw_faq` WRITE;
/*!40000 ALTER TABLE `mw_faq` DISABLE KEYS */;
INSERT INTO `mw_faq` VALUES (1,'What version of World of Warcraft is required to play on the Wastelands?','World of Warcraft patch 3.3.5a is necessary to play on our server. Any expansion can be used, although we advise having both TBC and WoTLK expansions before playing.');
/*!40000 ALTER TABLE `mw_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_gallery`
--

DROP TABLE IF EXISTS `mw_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_gallery` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `img` text NOT NULL,
  `comment` text NOT NULL,
  `autor` text NOT NULL,
  `date` date NOT NULL,
  `cat` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=cp1251 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_gallery`
--

LOCK TABLES `mw_gallery` WRITE;
/*!40000 ALTER TABLE `mw_gallery` DISABLE KEYS */;
INSERT INTO `mw_gallery` VALUES (1,'Mangosweb_wall.jpg','Test Wallpaper','MangosWeb','0000-00-00','wallpaper'),(2,'Mangosweb_scr.jpg','Test Screenshot','MangosWeb','0000-00-00','screenshot');
/*!40000 ALTER TABLE `mw_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_gallery_ssotd`
--

DROP TABLE IF EXISTS `mw_gallery_ssotd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_gallery_ssotd` (
  `image` varchar(50) NOT NULL,
  `date` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_gallery_ssotd`
--

LOCK TABLES `mw_gallery_ssotd` WRITE;
/*!40000 ALTER TABLE `mw_gallery_ssotd` DISABLE KEYS */;
INSERT INTO `mw_gallery_ssotd` VALUES ('Mangosweb_scr.jpg','13.06.28');
/*!40000 ALTER TABLE `mw_gallery_ssotd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_menu_items`
--

DROP TABLE IF EXISTS `mw_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_menu_items` (
  `menu_id` int(3) NOT NULL DEFAULT '1',
  `link_title` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `order` int(3) NOT NULL DEFAULT '1',
  `account_level` int(3) NOT NULL DEFAULT '1',
  `guest_only` int(3) NOT NULL DEFAULT '0',
  `id` int(3) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_menu_items`
--

LOCK TABLES `mw_menu_items` WRITE;
/*!40000 ALTER TABLE `mw_menu_items` DISABLE KEYS */;
INSERT INTO `mw_menu_items` VALUES (1,'News','./',1,1,0,1),(1,'RSS','rss.php',2,1,0,2),(2,'Register','?p=account&sub=register',1,1,1,3),(2,'Admin Panel','?p=admin',1,3,0,4),(7,'Vote','?p=vote',1,2,0,5),(7,'Shop','?p=shop',3,2,0,6),(2,'Manage Account','?p=account',2,2,0,7),(4,'Server Characters','?p=server&sub=chars',2,1,0,8),(4,'Players Online','?p=server&sub=playersonline',3,1,0,9),(8,'FAQ','?p=support&sub=faq',1,1,0,10),(7,'Donate','?p=donate',2,2,0,11),(4,'Realm Status','?p=server&sub=realmstatus',1,1,0,12),(2,'Account Restore','?p=account&sub=restore',2,1,1,13),(4,'Top Kills','?p=server&sub=topkills',1,1,0,14),(3,'Game Guide','?p=game&sub=guide',1,1,0,15);
/*!40000 ALTER TABLE `mw_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_news`
--

DROP TABLE IF EXISTS `mw_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_news` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET latin1,
  `message` longtext CHARACTER SET latin1,
  `posted_by` text CHARACTER SET latin1,
  `post_time` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_news`
--

LOCK TABLES `mw_news` WRITE;
/*!40000 ALTER TABLE `mw_news` DISABLE KEYS */;
INSERT INTO `mw_news` VALUES (1,'Welcome!','<p>Welcome to the Wastelands server!</p>','Wilson212',1288727884),(2,'test','<p>test</p>','FROID',1369667420);
/*!40000 ALTER TABLE `mw_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_online`
--

DROP TABLE IF EXISTS `mw_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `user_name` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT 'Guest',
  `user_ip` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '0.0.0.0',
  `logged` int(10) NOT NULL DEFAULT '0',
  `currenturl` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT './',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_online`
--

LOCK TABLES `mw_online` WRITE;
/*!40000 ALTER TABLE `mw_online` DISABLE KEYS */;
INSERT INTO `mw_online` VALUES (2,5,'FROID','127.0.0.1',1372430788,'/mangoswebv3/?p=shop');
/*!40000 ALTER TABLE `mw_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_pms`
--

DROP TABLE IF EXISTS `mw_pms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_pms` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `message` text,
  `sender_id` int(8) unsigned NOT NULL DEFAULT '0',
  `posted` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(15) DEFAULT '0.0.0.0',
  `showed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_pms`
--

LOCK TABLES `mw_pms` WRITE;
/*!40000 ALTER TABLE `mw_pms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mw_pms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_regkeys`
--

DROP TABLE IF EXISTS `mw_regkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_regkeys` (
  `id` smallint(9) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL DEFAULT '0',
  `used` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_regkeys`
--

LOCK TABLES `mw_regkeys` WRITE;
/*!40000 ALTER TABLE `mw_regkeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `mw_regkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_secret_questions`
--

DROP TABLE IF EXISTS `mw_secret_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_secret_questions` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `question` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_secret_questions`
--

LOCK TABLES `mw_secret_questions` WRITE;
/*!40000 ALTER TABLE `mw_secret_questions` DISABLE KEYS */;
INSERT INTO `mw_secret_questions` VALUES (1,'What is your mothers maiden name?'),(2,'What is your favorite color?'),(3,'What street did you grow up on?'),(4,'What is your fathers middle name?'),(5,'What is the name of your first pet?');
/*!40000 ALTER TABLE `mw_secret_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_shop_items`
--

DROP TABLE IF EXISTS `mw_shop_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_shop_items` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `item_number` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `itemset` int(10) NOT NULL DEFAULT '0',
  `gold` int(25) NOT NULL DEFAULT '0',
  `quanity` int(25) NOT NULL DEFAULT '1',
  `desc` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `wp_cost` varchar(5) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `realms` int(100) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_shop_items`
--

LOCK TABLES `mw_shop_items` WRITE;
/*!40000 ALTER TABLE `mw_shop_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mw_shop_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_vote_sites`
--

DROP TABLE IF EXISTS `mw_vote_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_vote_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `votelink` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `reset_time` int(16) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_vote_sites`
--

LOCK TABLES `mw_vote_sites` WRITE;
/*!40000 ALTER TABLE `mw_vote_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `mw_vote_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mw_voting`
--

DROP TABLE IF EXISTS `mw_voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mw_voting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_ip` varchar(30) NOT NULL,
  `site` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mw_voting`
--

LOCK TABLES `mw_voting` WRITE;
/*!40000 ALTER TABLE `mw_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `mw_voting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmcharacters`
--

DROP TABLE IF EXISTS `realmcharacters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmcharacters` (
  `realmid` int(11) unsigned NOT NULL DEFAULT '0',
  `acctid` bigint(20) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm Character Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmcharacters`
--

LOCK TABLES `realmcharacters` WRITE;
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
INSERT INTO `realmcharacters` VALUES (1,1,0),(1,2,0),(1,3,0),(1,4,0),(1,5,4),(2,5,6),(1,8,1),(2,8,0);
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmd_db_version`
--

DROP TABLE IF EXISTS `realmd_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmd_db_version` (
  `required_10008_01_realmd_realmd_db_version` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Last applied sql update to DB';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmd_db_version`
--

LOCK TABLES `realmd_db_version` WRITE;
/*!40000 ALTER TABLE `realmd_db_version` DISABLE KEYS */;
INSERT INTO `realmd_db_version` VALUES (NULL);
/*!40000 ALTER TABLE `realmd_db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmlist`
--

DROP TABLE IF EXISTS `realmlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `port` int(11) NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `realmflags` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT 'Supported masks: 0x1 (invalid, not show in realm list), 0x2 (offline, set by mangosd), 0x4 (show version and build), 0x20 (new players), 0x40 (recommended)',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `realmbuilds` varchar(64) NOT NULL DEFAULT '',
  `site_enabled` int(3) NOT NULL DEFAULT '0',
  `ra_info` varchar(355) NOT NULL DEFAULT 'type;port;username;password',
  `dbinfo` varchar(355) NOT NULL DEFAULT '127.0.0.1;3306;username;password;DBCharacter;127.0.0.1;3306;username;password;DBWorld' COMMENT 'Database info to THIS row',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmlist`
--

LOCK TABLES `realmlist` WRITE;
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` VALUES (1,'Wasteland','127.0.0.1',8085,1,2,2,0,0.02,'12340 ',1,'type;port;username;password','localhost;3306;root;vegar;cm_characters;localhost;3306;root;vegar;cm_world;'),(2,'Macbook','71.187.70.93',8085,1,0,2,0,0,'12340 ',0,'type;port;username;password','127.0.0.1;3306;username;password;DBCharacter;127.0.0.1;3306;username;password;DBWorld');
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uptime`
--

DROP TABLE IF EXISTS `uptime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uptime` (
  `realmid` int(11) unsigned NOT NULL,
  `starttime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `startstring` varchar(64) NOT NULL DEFAULT '',
  `uptime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Uptime system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uptime`
--

LOCK TABLES `uptime` WRITE;
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
INSERT INTO `uptime` VALUES (1,1368672615,'2013-05-15 22:50:15',347401,1),(1,1369020465,'2013-05-19 23:27:45',1092600,1),(1,1370113619,'2013-06-01 15:06:59',5401,1),(1,1370119362,'2013-06-01 16:42:42',0,0),(2,1370119422,'2013-06-01 16:43:42',600,1),(1,1370120256,'2013-06-01 16:57:36',224400,1),(1,1370346121,'2013-06-04 07:42:01',117601,1),(1,1370476228,'2013-06-05 19:50:28',10201,1),(1,1370486967,'2013-06-05 22:49:27',217806,1),(1,1370705183,'2013-06-08 11:26:23',210000,1),(1,1370915436,'2013-06-10 21:50:36',601,1),(1,1370916362,'2013-06-10 22:06:02',0,0),(1,1370916534,'2013-06-10 22:08:54',0,0),(1,1370917022,'2013-06-10 22:17:02',0,0),(1,1370917211,'2013-06-10 22:20:11',65400,1),(1,1370982926,'2013-06-11 16:35:26',601,1),(1,1370983862,'2013-06-11 16:51:02',0,0),(1,1370984339,'2013-06-11 16:58:59',600,1),(1,1370985445,'2013-06-11 17:17:25',2400,1),(1,1370988111,'2013-06-11 18:01:51',0,0),(1,1370988265,'2013-06-11 18:04:25',74400,1),(1,1371062812,'2013-06-12 14:46:52',600,1),(1,1371063440,'2013-06-12 14:57:20',86401,1),(1,1371149867,'2013-06-13 14:57:47',180001,1),(1,1371330355,'2013-06-15 17:05:55',267600,1),(1,1371598139,'2013-06-18 19:28:59',0,0),(1,1371598599,'2013-06-18 19:36:39',0,0),(1,1371598945,'2013-06-18 19:42:25',259800,1),(1,1371859381,'2013-06-21 20:03:01',145200,1),(1,1372004991,'2013-06-23 12:29:51',0,0),(1,1372005397,'2013-06-23 12:36:37',300000,1),(1,1372306437,'2013-06-27 00:13:57',720602,1),(1,1373027569,'2013-07-05 08:32:49',114001,1),(1,1373142018,'2013-07-06 16:20:18',316800,1),(2,1373459049,'2013-07-10 08:24:09',310200,1),(2,1373769944,'2013-07-13 22:45:44',0,0),(2,1373770385,'2013-07-13 22:53:05',600,1),(2,1373771213,'2013-07-13 23:06:53',4201,1),(2,1373776015,'2013-07-14 00:26:55',3000,1),(2,1373779296,'2013-07-14 01:21:36',31800,1),(2,1373811721,'2013-07-14 10:22:01',601,1),(2,1373812407,'2013-07-14 10:33:27',0,0),(2,1373812746,'2013-07-14 10:39:06',600,1),(2,1373813728,'2013-07-14 10:55:28',31800,0);
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-14 19:49:53
