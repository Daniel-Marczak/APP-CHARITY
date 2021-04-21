CREATE DATABASE  IF NOT EXISTS `charity_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `charity_app`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: charity_app
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_46ccwnsi9409t36lurvtyljak` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'inne'),(2,'kosmetyki'),(3,'książki'),(4,'nowa odzież'),(5,'podręczniki'),(6,'przybory szkolne'),(7,'sprzęt agd'),(8,'sprzęt rtv'),(9,'używana odzież'),(10,'zabawki'),(11,'zeszyty');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_form_message`
--

DROP TABLE IF EXISTS `contact_form_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_form_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_archived` bit(1) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `message` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent` date NOT NULL,
  `surname` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgw52ir1kjys0qetxj99qjvus0` (`user_id`),
  CONSTRAINT `FKgw52ir1kjys0qetxj99qjvus0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_form_message`
--

LOCK TABLES `contact_form_message` WRITE;
/*!40000 ALTER TABLE `contact_form_message` DISABLE KEYS */;
INSERT INTO `contact_form_message` VALUES (2,_binary '\0',_binary '','sdfsdafasfasdp]\\p[]\\\\p[]\\p[]\\p[\\p[','Tomasz','2021-04-06','Skądtytomasz',2),(3,_binary '',_binary '','llkjjhgfff fddgfy fgfyr jjko','Michał','2021-04-06','Michałek',2),(4,_binary '\0',_binary '','jfjf dnkg kdjk kddngg kdnfkd kdnfkd','Tomasz','2021-04-06','Skądtytomasz',NULL),(5,_binary '',_binary '','afdsafasdfasasdfasdfa asdf asdf asdf asdf asdf asdf asdf asdfsdff','Michał','2021-04-06','Michałek',NULL),(6,_binary '\0',_binary '\0','Proszę o kontakt adam.adamski@adamy.pl','Adam','2021-04-06','Adamski',NULL),(7,_binary '\0',_binary '\0','Z tej strony Barbara, proszę o pilny kontakt. Mój nr. tel. to 555-555-555 ','Barbara','2021-04-06','Barabara',NULL),(8,_binary '\0',_binary '\0','Wiadomość od aaa','Aaa','2021-04-06','Aaa',3),(9,_binary '\0',_binary '\0','Wiadomość od BBB','Bbb','2021-04-06','Bbb',4),(10,_binary '\0',_binary '\0','Wiadomość od CCC','Ccc','2021-04-06','Ccc',5),(11,_binary '\0',_binary '','Wiadomość od dd','Ddd','2021-04-06','Ddd',6),(12,_binary '\0',_binary '\0','Wiadomość od Eee','Eee','2021-04-06','Eee',7),(13,_binary '\0',_binary '\0','Wiadomość od fff','Fff','2021-04-06','Fff',8),(14,_binary '\0',_binary '\0','Wiadomość od ggg','Ggg','2021-04-06','Ggg',9),(15,_binary '\0',_binary '\0','Wiadomość od Maja Majewska.','Maja','2021-04-06','Majewska',NULL),(16,_binary '\0',_binary '\0','Wiadomość wiadomość i jeszcze raz wiadomość.','Ala','2021-04-06','Makota',NULL);
/*!40000 ALTER TABLE `contact_form_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `archived` bit(1) DEFAULT NULL,
  `cancelled` date DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collected` date DEFAULT NULL,
  `created` date NOT NULL,
  `edited` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pick_up_comment` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pick_up_date` date NOT NULL,
  `pick_up_time` time NOT NULL,
  `quantity` tinyint NOT NULL,
  `street` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqiaintp9rxqwmmpwj3y5dcwd1` (`institution_id`),
  KEY `FKggycfjlqhvkorwvqrn1eh2jcs` (`status_id`),
  KEY `FK2rx4oikd7rs8ddja8k9xc25my` (`user_id`),
  CONSTRAINT `FK2rx4oikd7rs8ddja8k9xc25my` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKggycfjlqhvkorwvqrn1eh2jcs` FOREIGN KEY (`status_id`) REFERENCES `donation_status` (`id`),
  CONSTRAINT `FKqiaintp9rxqwmmpwj3y5dcwd1` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (1,_binary '',NULL,'Łódź','2021-04-06','2021-04-06',NULL,'796-115-496','brak','2021-04-07','15:47:00',1,'Zgierska 93/105','91-465',2,2,2),(2,_binary '',NULL,'Łódź','2021-04-06','2021-04-06',NULL,'796-115-496','brak','2021-04-22','17:35:00',1,'Zgierska 93/105','91-465',1,2,2),(3,_binary '',NULL,'Łódź','2021-04-06','2021-04-06','2021-04-06','796-334-567','','2021-04-21','13:37:00',11,'Zgierska 93/105','91-465',1,2,2),(4,_binary '\0',NULL,'Miasto Aaa',NULL,'2021-04-06',NULL,'111-111-111','Uwagi 1','2021-06-01','11:11:00',1,'Ulica 1','11-111',1,1,3),(5,_binary '\0',NULL,'Miasto Aaa',NULL,'2021-04-06',NULL,'111-111-111','Uwagi 1','2021-06-01','11:11:00',1,'Ulica 1','11-111',1,1,3),(6,_binary '\0',NULL,'Miasto Aaa',NULL,'2021-04-06',NULL,'111-111-111','Uwagi 1','2021-06-01','11:11:00',1,'Ulica 1','11-111',1,1,3),(7,_binary '\0',NULL,'Miasto Aaa',NULL,'2021-04-06',NULL,'111-111-111','Uwagi 1','2021-06-01','11:11:00',1,'Ulica 1','11-111',1,1,3),(8,_binary '\0',NULL,'Miasto Aaa',NULL,'2021-04-06',NULL,'111-111-111','Uwagi 1','2021-06-01','11:11:00',1,'Ulica 1','11-111',1,1,3),(9,_binary '\0',NULL,'Miasto Aaa',NULL,'2021-04-06',NULL,'111-111-111','Uwagi 1','2021-06-01','11:11:00',1,'Ulica 1','11-111',1,1,3),(10,_binary '\0',NULL,'Miasto Aaa',NULL,'2021-04-06',NULL,'111-111-111','Uwagi 1','2021-06-01','11:11:00',1,'Ulica 1','11-111',1,1,3),(11,_binary '\0',NULL,'Miasto Bbb',NULL,'2021-04-06',NULL,'111-111-111','Uwagi od B','2021-04-14','14:10:00',1,'Ulica 1B','11-111',2,1,4),(12,_binary '\0',NULL,'Miasto Bbb',NULL,'2021-04-06',NULL,'111-111-111','Uwagi od B','2021-04-14','14:10:00',1,'Ulica 1B','11-111',2,1,4),(13,_binary '\0',NULL,'Miasto Bbb',NULL,'2021-04-06',NULL,'111-111-111','Uwagi od B','2021-04-14','14:10:00',1,'Ulica 1B','11-111',2,1,4),(14,_binary '\0',NULL,'Miasto Bbb',NULL,'2021-04-06',NULL,'111-111-111','Uwagi od B','2021-04-14','14:10:00',1,'Ulica 1B','11-111',2,1,4),(15,_binary '\0',NULL,'Miasto Bbb',NULL,'2021-04-06',NULL,'111-111-111','Uwagi od B','2021-04-14','14:10:00',1,'Ulica 1B','11-111',2,1,4),(16,_binary '\0',NULL,'Miasto Bbb',NULL,'2021-04-06',NULL,'111-111-111','Uwagi od B','2021-04-14','14:10:00',1,'Ulica 1B','11-111',2,1,4),(17,_binary '\0',NULL,'Miasto Bbb',NULL,'2021-04-06',NULL,'111-111-111','Uwagi od B','2021-04-14','14:10:00',1,'Ulica 1B','11-111',2,1,4),(18,_binary '\0',NULL,'Miasto Ccc',NULL,'2021-04-06',NULL,'111-111-111','uwagi ccc','2021-04-13','14:14:00',1,'Ulica 1C','11-111',4,1,5),(19,_binary '\0',NULL,'Miasto Ccc',NULL,'2021-04-06',NULL,'111-111-111','uwagi ccc','2021-04-13','14:14:00',1,'Ulica 1C','11-111',4,1,5),(20,_binary '\0',NULL,'Miasto Ccc',NULL,'2021-04-06',NULL,'111-111-111','uwagi ccc','2021-04-13','14:14:00',1,'Ulica 1C','11-111',4,1,5),(21,_binary '\0',NULL,'Miasto Ccc',NULL,'2021-04-06',NULL,'111-111-111','uwagi ccc','2021-04-13','14:14:00',1,'Ulica 1C','11-111',4,1,5),(22,_binary '\0',NULL,'Miasto Ccc',NULL,'2021-04-06',NULL,'111-111-111','uwagi ccc','2021-04-13','14:14:00',1,'Ulica 1C','11-111',4,1,5),(23,_binary '\0',NULL,'Miasto Ccc',NULL,'2021-04-06',NULL,'111-111-111','uwagi ccc','2021-04-13','14:14:00',1,'Ulica 1C','11-111',4,1,5),(24,_binary '\0',NULL,'Miasto Ccc',NULL,'2021-04-06',NULL,'111-111-111','uwagi ccc','2021-04-13','14:14:00',1,'Ulica 1C','11-111',4,1,5),(25,_binary '\0',NULL,'Miasto Ccc',NULL,'2021-04-06',NULL,'111-111-111','uwagi ccc','2021-04-13','14:14:00',1,'Ulica 1C','11-111',4,1,5),(26,_binary '\0',NULL,'Miasto Ddd',NULL,'2021-04-06',NULL,'111-111-111','uwagi od ddd','2021-04-15','14:19:00',1,'Ulica 1d','11-111',1,1,6),(27,_binary '\0',NULL,'Miasto Ddd',NULL,'2021-04-06',NULL,'111-111-111','uwagi od ddd','2021-04-15','14:19:00',1,'Ulica 1d','11-111',1,1,6),(28,_binary '\0',NULL,'Miasto Ddd',NULL,'2021-04-06',NULL,'111-111-111','uwagi od ddd','2021-04-15','14:19:00',1,'Ulica 1d','11-111',1,1,6),(29,_binary '\0',NULL,'Miasto Ddd',NULL,'2021-04-06',NULL,'111-111-111','uwagi od ddd','2021-04-15','14:19:00',1,'Ulica 1d','11-111',1,1,6),(30,_binary '\0',NULL,'Miasto Ddd',NULL,'2021-04-06',NULL,'111-111-111','uwagi od ddd','2021-04-15','14:19:00',1,'Ulica 1d','11-111',1,1,6),(31,_binary '\0',NULL,'Miasto Ddd',NULL,'2021-04-06',NULL,'111-111-111','uwagi od ddd','2021-04-15','14:19:00',1,'Ulica 1d','11-111',1,1,6),(32,_binary '\0',NULL,'Miasto Ddd',NULL,'2021-04-06',NULL,'111-111-111','uwagi od ddd','2021-04-15','14:19:00',1,'Ulica 1d','11-111',1,1,6),(33,_binary '\0',NULL,'Miastoeee',NULL,'2021-04-06',NULL,'11 111-22-33','eee uwagi eee','2021-04-21','17:20:00',1,'Ulica 1e','11-111',1,1,7),(34,_binary '\0',NULL,'Miastoeee',NULL,'2021-04-06',NULL,'11 111-22-33','eee uwagi eee','2021-04-21','17:20:00',1,'Ulica 1e','11-111',1,1,7),(35,_binary '\0',NULL,'Miastoeee',NULL,'2021-04-06',NULL,'11 111-22-33','eee uwagi eee','2021-04-21','17:20:00',1,'Ulica 1e','11-111',1,1,7),(36,_binary '\0',NULL,'Miastoeee',NULL,'2021-04-06',NULL,'11 111-22-33','eee uwagi eee','2021-04-21','17:20:00',1,'Ulica 1e','11-111',1,1,7),(37,_binary '\0',NULL,'Miastoeee',NULL,'2021-04-06',NULL,'11 111-22-33','eee uwagi eee','2021-04-21','17:20:00',1,'Ulica 1e','11-111',1,1,7),(38,_binary '\0',NULL,'Miastoeee',NULL,'2021-04-06',NULL,'11 111-22-33','eee uwagi eee','2021-04-21','17:20:00',1,'Ulica 1e','11-111',1,1,7),(39,_binary '\0',NULL,'Miastoeee',NULL,'2021-04-06',NULL,'11 111-22-33','eee uwagi eee','2021-04-21','17:20:00',1,'Ulica 1e','11-111',1,1,7),(40,_binary '\0',NULL,'Miasto Fff Nad Wisłą',NULL,'2021-04-06',NULL,'123-123-123','uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi','2021-04-14','17:25:00',1,'Ulica 1f/12f','11-111',2,1,8),(41,_binary '\0',NULL,'Miasto Fff Nad Wisłą',NULL,'2021-04-06',NULL,'123-123-123','uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi','2021-04-14','17:25:00',1,'Ulica 1f/12f','11-111',2,1,8),(42,_binary '\0',NULL,'Miasto Fff Nad Wisłą',NULL,'2021-04-06',NULL,'123-123-123','uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi','2021-04-14','17:25:00',1,'Ulica 1f/12f','11-111',2,1,8),(43,_binary '\0',NULL,'Miasto Fff Nad Wisłą',NULL,'2021-04-06',NULL,'123-123-123','uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi','2021-04-14','17:25:00',1,'Ulica 1f/12f','11-111',2,1,8),(44,_binary '\0',NULL,'Miasto Fff Nad Wisłą',NULL,'2021-04-06',NULL,'123-123-123','uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi','2021-04-14','17:25:00',1,'Ulica 1f/12f','11-111',2,1,8),(45,_binary '\0',NULL,'Miasto Fff Nad Wisłą',NULL,'2021-04-06',NULL,'123-123-123','uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi','2021-04-14','17:25:00',1,'Ulica 1f/12f','11-111',2,1,8),(46,_binary '\0',NULL,'Miasto Fff Nad Wisłą',NULL,'2021-04-06',NULL,'123-123-123','uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi uwagi','2021-04-14','17:25:00',1,'Ulica 1f/12f','11-111',2,1,8),(47,_binary '\0',NULL,'Miasto Ggg',NULL,'2021-04-06',NULL,'555-555-555','brak','2021-04-20','18:28:00',1,'Ulica 111G','11-111',2,1,9),(48,_binary '\0',NULL,'Miasto Ggg',NULL,'2021-04-06',NULL,'555-555-555','brak','2021-04-20','18:28:00',1,'Ulica 111G','11-111',2,1,9),(49,_binary '\0',NULL,'Miasto Ggg',NULL,'2021-04-06',NULL,'555-555-555','brak','2021-04-20','18:28:00',1,'Ulica 111G','11-111',2,1,9),(50,_binary '\0',NULL,'Miasto Ggg',NULL,'2021-04-06',NULL,'555-555-555','brak','2021-04-20','18:28:00',1,'Ulica 111G','11-111',2,1,9),(51,_binary '\0',NULL,'Miasto Ggg',NULL,'2021-04-06',NULL,'555-555-555','brak','2021-04-20','18:28:00',1,'Ulica 111G','11-111',2,1,9),(52,_binary '\0',NULL,'Miasto Ggg',NULL,'2021-04-06',NULL,'555-555-555','brak','2021-04-20','18:28:00',1,'Ulica 111G','11-111',2,1,9),(53,_binary '\0',NULL,'Miasto Ggg',NULL,'2021-04-06','2021-04-06','555-555-555','brak uwag po edycji','2021-04-20','18:28:00',1,'Ulica 111G','11-111',1,1,9);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_categories`
--

DROP TABLE IF EXISTS `donation_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation_categories` (
  `donation_id` bigint NOT NULL,
  `categories_id` bigint NOT NULL,
  KEY `FKbuylq65emfd9ybcas2ni6iciq` (`categories_id`),
  KEY `FKeg2047ecjdbxcjlekg2pmhcmw` (`donation_id`),
  CONSTRAINT `FKbuylq65emfd9ybcas2ni6iciq` FOREIGN KEY (`categories_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKeg2047ecjdbxcjlekg2pmhcmw` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_categories`
--

LOCK TABLES `donation_categories` WRITE;
/*!40000 ALTER TABLE `donation_categories` DISABLE KEYS */;
INSERT INTO `donation_categories` VALUES (1,7),(2,3),(3,7),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(6,2),(7,3),(8,4),(9,5),(10,6),(11,8),(11,9),(11,10),(11,11),(12,2),(13,3),(14,4),(15,5),(16,6),(17,7),(18,5),(18,6),(18,7),(19,5),(20,5),(21,6),(22,7),(23,5),(24,6),(25,7),(26,6),(26,7),(26,8),(27,5),(28,6),(29,7),(30,6),(31,7),(32,8),(33,5),(33,6),(33,7),(34,7),(35,8),(36,5),(37,6),(38,7),(39,5),(40,1),(40,2),(40,3),(40,4),(40,5),(40,6),(40,7),(41,8),(42,5),(43,6),(44,7),(45,7),(46,8),(47,1),(47,2),(47,4),(47,5),(48,7),(49,8),(50,1),(51,2),(52,4),(53,6),(53,7),(53,8);
/*!40000 ALTER TABLE `donation_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_status`
--

DROP TABLE IF EXISTS `donation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_status`
--

LOCK TABLES `donation_status` WRITE;
/*!40000 ALTER TABLE `donation_status` DISABLE KEYS */;
INSERT INTO `donation_status` VALUES (1,'awaiting pickup'),(2,'collected'),(3,'cancelled');
/*!40000 ALTER TABLE `donation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qhw15h5f7nc4g3ndva8sory1u` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES (1,'Łódź','Pomoc dla osób nie posiadających miejsca zamieszkania',_binary '','Fundacja \"Bez domu\"'),(2,'Warszawa','Pomoc osobom znajdującym się w trudnej sytuacji życiowej.',_binary '','Fundacja \"Dla Dzieci\"'),(3,'Wrocław','Pomoc osobom znajdującym się w trudnej sytuacji życiowej.',_binary '\0','Fundacja \"Pomagamy wszystkim\"'),(4,'Łódź','Pomoc wszystkim potrzebującym.',_binary '','Fundacja \"Pomoc\"');
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reset_password` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` time NOT NULL,
  `hashed_user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc7c9n421fc9mj9qe4utdwv335` (`user`),
  CONSTRAINT `FKc7c9n421fc9mj9qe4utdwv335` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reset_password`
--

LOCK TABLES `reset_password` WRITE;
/*!40000 ALTER TABLE `reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER'),(3,'ROLE_SUPER_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'charityapp2021@gmail.com',_binary '','Superadmin','$2a$10$LeYEZSS.2dV.UmVZVT1Io.vYtZe2V9pJ4bru0x73Zk.8xVdyY5/16','Superadmin'),(2,'admin@charity.com',_binary '','Admin','$2a$10$LeYEZSS.2dV.UmVZVT1Io.vYtZe2V9pJ4bru0x73Zk.8xVdyY5/16','Admin'),(3,'aaa@alphabet.com',_binary '','Aaa','$2a$10$LeYEZSS.2dV.UmVZVT1Io.vYtZe2V9pJ4bru0x73Zk.8xVdyY5/16','Aaa'),(4,'bbb@alphabet.com',_binary '','Bbb','$2a$10$LeYEZSS.2dV.UmVZVT1Io.vYtZe2V9pJ4bru0x73Zk.8xVdyY5/16','Bbb'),(5,'ccc@alphabet.com',_binary '','Ccc','$2a$10$LeYEZSS.2dV.UmVZVT1Io.vYtZe2V9pJ4bru0x73Zk.8xVdyY5/16','Ccc'),(6,'ddd@alphabet.com',_binary '','Ddd','$2a$10$LeYEZSS.2dV.UmVZVT1Io.vYtZe2V9pJ4bru0x73Zk.8xVdyY5/16','Ddd'),(7,'eee@alphabet.com',_binary '','Eee','$2a$10$LeYEZSS.2dV.UmVZVT1Io.vYtZe2V9pJ4bru0x73Zk.8xVdyY5/16','Eee'),(8,'fff@alphabet.com',_binary '','Fff','$2a$10$LeYEZSS.2dV.UmVZVT1Io.vYtZe2V9pJ4bru0x73Zk.8xVdyY5/16','Fff'),(9,'ggg@alphabet.com',_binary '','Ggg','$2a$10$LeYEZSS.2dV.UmVZVT1Io.vYtZe2V9pJ4bru0x73Zk.8xVdyY5/16','Ggg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (2,1),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(1,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'charity_app'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `auto_delete_reset_passwords` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `auto_delete_reset_passwords` ON SCHEDULE EVERY 1 MINUTE STARTS '2021-04-06 10:40:55' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM reset_password WHERE reset_password.created_time < DATE_SUB(NOW(), INTERVAL 10 MINUTE) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 15:30:16
