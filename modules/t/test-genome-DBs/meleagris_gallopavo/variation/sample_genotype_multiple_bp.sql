-- MySQL dump 10.13  Distrib 5.6.26, for Linux (x86_64)
--
-- Host: mysql-eg-devel-1.ebi.ac.uk    Database: meleagris_gallopavo_variation_83_21
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sample_genotype_multiple_bp`
--

DROP TABLE IF EXISTS `sample_genotype_multiple_bp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_genotype_multiple_bp` (
  `variation_id` int(10) unsigned NOT NULL,
  `subsnp_id` int(15) unsigned DEFAULT NULL,
  `allele_1` varchar(25000) DEFAULT NULL,
  `allele_2` varchar(25000) DEFAULT NULL,
  `sample_id` int(10) unsigned DEFAULT NULL,
  KEY `variation_idx` (`variation_id`),
  KEY `subsnp_idx` (`subsnp_id`),
  KEY `sample_idx` (`sample_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-16 16:46:49
