-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bekasmadoo
-- ------------------------------------------------------
-- Server version	5.5.35-0+wheezy1

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
-- Table structure for table `glastopf_events`
--

DROP TABLE IF EXISTS `glastopf_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glastopf_events` (
  `id` int(11) unsigned NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
  `time` datetime NOT NULL,
  `source` int(11) unsigned NOT NULL,
  `request_url` varchar(500) DEFAULT NULL,
  `request_raw` text,
  `pattern` varchar(20) DEFAULT NULL,
  `filename` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`,`sensor`),
  KEY `source` (`source`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glastopf_events`
--

LOCK TABLES `glastopf_events` WRITE;
/*!40000 ALTER TABLE `glastopf_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `glastopf_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kippo_auth`
--

DROP TABLE IF EXISTS `kippo_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kippo_auth` (
  `id` int(11) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
  `session` char(32) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `timestamp` datetime NOT NULL,
  UNIQUE KEY `id` (`id`,`sensor`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kippo_auth`
--

LOCK TABLES `kippo_auth` WRITE;
/*!40000 ALTER TABLE `kippo_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `kippo_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kippo_clients`
--

DROP TABLE IF EXISTS `kippo_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kippo_clients` (
  `id` int(4) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
  `version` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`id`,`sensor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kippo_clients`
--

LOCK TABLES `kippo_clients` WRITE;
/*!40000 ALTER TABLE `kippo_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `kippo_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kippo_downloads`
--

DROP TABLE IF EXISTS `kippo_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kippo_downloads` (
  `id` int(11) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
  `session` char(32) NOT NULL,
  `timestamp` datetime NOT NULL,
  `url` text NOT NULL,
  `outfile` text NOT NULL,
  UNIQUE KEY `id` (`id`,`sensor`),
  KEY `session` (`session`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kippo_downloads`
--

LOCK TABLES `kippo_downloads` WRITE;
/*!40000 ALTER TABLE `kippo_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `kippo_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kippo_input`
--

DROP TABLE IF EXISTS `kippo_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kippo_input` (
  `id` int(11) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
  `session` char(32) NOT NULL,
  `timestamp` datetime NOT NULL,
  `realm` varchar(50) DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `input` text NOT NULL,
  UNIQUE KEY `id` (`id`,`sensor`),
  KEY `session` (`session`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kippo_input`
--

LOCK TABLES `kippo_input` WRITE;
/*!40000 ALTER TABLE `kippo_input` DISABLE KEYS */;
/*!40000 ALTER TABLE `kippo_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kippo_sessions`
--

DROP TABLE IF EXISTS `kippo_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kippo_sessions` (
  `id` char(32) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime DEFAULT NULL,
  `ip` int(11) unsigned NOT NULL,
  `termsize` varchar(7) DEFAULT NULL,
  `client` int(4) DEFAULT NULL,
  UNIQUE KEY `id` (`id`,`sensor`),
  KEY `ip` (`ip`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kippo_sessions`
--

LOCK TABLES `kippo_sessions` WRITE;
/*!40000 ALTER TABLE `kippo_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `kippo_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kippo_ttylog`
--

DROP TABLE IF EXISTS `kippo_ttylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kippo_ttylog` (
  `id` int(11) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
  `session` char(32) NOT NULL,
  `ttylog` mediumblob NOT NULL,
  UNIQUE KEY `id` (`id`,`sensor`),
  KEY `session` (`session`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kippo_ttylog`
--

LOCK TABLES `kippo_ttylog` WRITE;
/*!40000 ALTER TABLE `kippo_ttylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `kippo_ttylog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-07  0:15:50
