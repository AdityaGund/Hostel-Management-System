-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: studentapplication
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `studentapplication`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `studentapplication` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `studentapplication`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Admin'),(2,'Student');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add civil engineering',7,'add_civilengineering'),(26,'Can change civil engineering',7,'change_civilengineering'),(27,'Can delete civil engineering',7,'delete_civilengineering'),(28,'Can view civil engineering',7,'view_civilengineering'),(29,'Can add electrical engineering',8,'add_electricalengineering'),(30,'Can change electrical engineering',8,'change_electricalengineering'),(31,'Can delete electrical engineering',8,'delete_electricalengineering'),(32,'Can view electrical engineering',8,'view_electricalengineering'),(33,'Can add computer engineering',9,'add_computerengineering'),(34,'Can change computer engineering',9,'change_computerengineering'),(35,'Can delete computer engineering',9,'delete_computerengineering'),(36,'Can view computer engineering',9,'view_computerengineering'),(37,'Can add instrumentation engineering',10,'add_instrumentationengineering'),(38,'Can change instrumentation engineering',10,'change_instrumentationengineering'),(39,'Can delete instrumentation engineering',10,'delete_instrumentationengineering'),(40,'Can view instrumentation engineering',10,'view_instrumentationengineering'),(41,'Can add manfacturing engineering',11,'add_manfacturingengineering'),(42,'Can change manfacturing engineering',11,'change_manfacturingengineering'),(43,'Can delete manfacturing engineering',11,'delete_manfacturingengineering'),(44,'Can view manfacturing engineering',11,'view_manfacturingengineering'),(45,'Can add mechanical engineering',12,'add_mechanicalengineering'),(46,'Can change mechanical engineering',12,'change_mechanicalengineering'),(47,'Can delete mechanical engineering',12,'delete_mechanicalengineering'),(48,'Can view mechanical engineering',12,'view_mechanicalengineering'),(49,'Can add application',13,'add_application'),(50,'Can change application',13,'change_application'),(51,'Can delete application',13,'delete_application'),(52,'Can view application',13,'view_application'),(53,'Can add check in out',14,'add_checkinout'),(54,'Can change check in out',14,'change_checkinout'),(55,'Can delete check in out',14,'delete_checkinout'),(56,'Can view check in out',14,'view_checkinout'),(57,'Can add room',15,'add_room'),(58,'Can change room',15,'change_room'),(59,'Can delete room',15,'delete_room'),(60,'Can view room',15,'view_room'),(61,'Can add roommate request',16,'add_roommaterequest'),(62,'Can change roommate request',16,'change_roommaterequest'),(63,'Can delete roommate request',16,'delete_roommaterequest'),(64,'Can view roommate request',16,'view_roommaterequest'),(65,'Can add first year',17,'add_firstyear'),(66,'Can change first year',17,'change_firstyear'),(67,'Can delete first year',17,'delete_firstyear'),(68,'Can view first year',17,'view_firstyear');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$lg88FYIHK325qmYn3qKtHj$JJPG6VLTtbnsRIgzOOtwMOoZtK3G5kH3cVU3ZTR8Iso=','2024-03-05 04:02:45.434630',0,'gundaditya','','','aditya@gmail.com',0,1,'2024-03-05 04:02:17.757003'),(2,'pbkdf2_sha256$720000$c1xUFeJxMzXjhTg3Rg6AGk$kxy5Zh3OTqTp0H2Dtuxf8fju5HdgbO3ulkxQhcSQIHw=','2024-03-05 10:41:33.095148',0,'riteshdav','','','aditya@gmail.com',0,1,'2024-03-05 10:13:55.570353'),(3,'pbkdf2_sha256$720000$VAYMYyth8oRjBx0gGZrlOS$7ZAcb3UiSEMXtZcqSZ4gaInH7LQpHDpU6zoq61KvR7Q=','2024-03-06 12:36:57.242650',0,'jayko@2004','','','aditya@gmail.com',0,1,'2024-03-06 12:36:35.353551'),(4,'pbkdf2_sha256$720000$H4Rd8ORzLXnBQDGz7eKMB1$XKi2e7hZ2lT+M3Uwlf8rfzWUNUrPaJM/5IkLGwghp6E=','2024-03-27 01:52:20.569355',0,'adityagund','','','aditya@gmail.com',0,1,'2024-03-07 11:34:51.995379'),(5,'pbkdf2_sha256$720000$1znVuExbmnrBj0VAfsC2zr$MpEShIyLCCdOaOHQhiY5QpJFcrz9hzFVQ/CUvusq6Jk=','2024-03-28 23:36:16.940597',0,'EN23147051','','','gundaditya014@gmail.com',0,1,'2024-03-27 02:09:19.394270'),(10,'pbkdf2_sha256$720000$WmtnDHJXsZJNFTtv4jq2vK$d9ebMuH1dFjDC6f27CEWxBONJj7MKXGsaYO2L22cqXg=','2024-03-28 23:40:01.215572',0,'EN23131626','','','gundaditya014@gmail.com',0,1,'2024-03-27 19:34:42.803957'),(13,'pbkdf2_sha256$720000$USxp9JyNkt6VmHUfI2DlPE$9W2seHynro4A137n9PNisoF3QrtAAerSgjN3fJvX42U=',NULL,0,'EN23115055','','','gundaditya014@gmail.com',0,1,'2024-03-28 23:35:47.183126'),(16,'pbkdf2_sha256$720000$l6C6P5O4xfg0yDoUQlBkyM$+syPh6JjCDvmWJtna4u1HPVeh1OhWsCzSQupvLcwqD0=','2024-03-29 00:25:47.512139',0,'EN23177796','','','gundaditya014@gmail.com',0,1,'2024-03-28 23:47:22.610955'),(18,'pbkdf2_sha256$720000$l4uWiA2sC2ZFiAoRG2YNKu$xM8cWTzJvjy4Aclk5nUp/HrWmN2JkL6Byvt+Y7qchfQ=','2024-04-01 04:15:11.517385',0,'EN23167975','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-01 04:09:17.750510'),(20,'pbkdf2_sha256$720000$0uQbQW8W8tjmskovPieXzT$cx/uqN8aH+jXCJ4q9sWF/tbP6RyNwKTqLs2uU+d0mlM=','2024-04-01 04:23:45.163928',0,'EN23108587','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-01 04:21:52.235563'),(21,'pbkdf2_sha256$720000$W5oVVBX8Ie7rgQGLmpVlVN$EThphzkRZJMthiDik8fT1cXsnOBYrrJOBr8va55AiJo=',NULL,0,'EN23141717','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-01 04:46:38.753615');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,21,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'registration','checkinout'),(7,'registration','civilengineering'),(9,'registration','computerengineering'),(8,'registration','electricalengineering'),(17,'registration','firstyear'),(10,'registration','instrumentationengineering'),(11,'registration','manfacturingengineering'),(12,'registration','mechanicalengineering'),(6,'sessions','session'),(13,'shortlisting','application'),(15,'shortlisting','room'),(16,'shortlisting','roommaterequest');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-03-04 11:24:08.205758'),(2,'auth','0001_initial','2024-03-04 11:24:09.119986'),(3,'admin','0001_initial','2024-03-04 11:24:09.440279'),(4,'admin','0002_logentry_remove_auto_add','2024-03-04 11:24:09.448802'),(5,'admin','0003_logentry_add_action_flag_choices','2024-03-04 11:24:09.454822'),(6,'contenttypes','0002_remove_content_type_name','2024-03-04 11:24:09.655988'),(7,'auth','0002_alter_permission_name_max_length','2024-03-04 11:24:09.730197'),(8,'auth','0003_alter_user_email_max_length','2024-03-04 11:24:09.751221'),(9,'auth','0004_alter_user_username_opts','2024-03-04 11:24:09.758547'),(10,'auth','0005_alter_user_last_login_null','2024-03-04 11:24:09.811716'),(11,'auth','0006_require_contenttypes_0002','2024-03-04 11:24:09.813716'),(12,'auth','0007_alter_validators_add_error_messages','2024-03-04 11:24:09.820653'),(13,'auth','0008_alter_user_username_max_length','2024-03-04 11:24:09.892899'),(14,'auth','0009_alter_user_last_name_max_length','2024-03-04 11:24:09.966910'),(15,'auth','0010_alter_group_name_max_length','2024-03-04 11:24:10.001076'),(16,'auth','0011_update_proxy_permissions','2024-03-04 11:24:10.014381'),(17,'auth','0012_alter_user_first_name_max_length','2024-03-04 11:24:10.136748'),(18,'registration','0001_initial','2024-03-04 11:24:10.227261'),(19,'registration','0002_delete_customuser','2024-03-04 11:24:10.243232'),(20,'registration','0003_initial','2024-03-04 11:24:10.267828'),(21,'registration','0004_studentsdata_delete_hey','2024-03-04 11:24:10.306510'),(22,'registration','0005_data_delete_studentsdata','2024-03-04 11:24:10.390701'),(23,'registration','0006_remove_data_application_id_remove_data_email_id_and_more','2024-03-04 11:24:10.459354'),(24,'registration','0007_delete_data','2024-03-04 11:24:10.476916'),(25,'sessions','0001_initial','2024-03-04 11:24:10.615462'),(26,'registration','0008_initial','2024-03-04 12:50:06.360403'),(27,'registration','0009_electricalengineering_delete_civilengineering','2024-03-04 13:13:27.912428'),(28,'registration','0010_civilengineering','2024-03-04 13:13:27.927978'),(29,'registration','0011_computerengineering_instrumentationengineering_and_more','2024-03-04 13:19:15.484317'),(30,'registration','0012_delete_civilengineering','2024-03-04 16:21:56.185679'),(31,'registration','0013_civilengineering','2024-03-04 16:22:28.526402'),(32,'registration','0014_civilengineering_verification_status_and_more','2024-03-05 05:20:28.658022'),(33,'shortlisting','0001_initial','2024-03-05 05:20:28.742938'),(34,'shortlisting','0002_rename_application_no_application_application_id','2024-03-05 05:20:28.771636'),(35,'registration','0002_alter_civilengineering_verified','2024-03-12 13:37:59.848115'),(36,'registration','0003_alter_civilengineering_verified','2024-03-12 13:37:59.860504'),(37,'registration','0004_civilengineering_newfield','2024-03-12 13:37:59.895898'),(38,'registration','0005_remove_civilengineering_newfield','2024-03-12 13:37:59.912892'),(39,'registration','0006_auto_20240312_1908','2024-03-12 13:39:02.618396'),(40,'shortlisting','0002_auto_20240312_1908','2024-03-12 13:39:02.627936'),(41,'registration','0014_auto_20240305_2210','2024-03-12 13:41:59.472753'),(42,'registration','0015_auto_20240305_2213','2024-03-12 13:41:59.619771'),(43,'registration','0016_merge_20240312_1911','2024-03-12 13:41:59.625294'),(44,'registration','0017_remove_civilengineering_verification_status_and_more','2024-03-12 13:41:59.789396'),(45,'registration','0016_admin','2024-03-27 01:03:38.846284'),(46,'registration','0017_checkinout_delete_admin','2024-03-27 01:03:38.882851'),(47,'registration','0018_checkinout_mis_checkinout_year_and_more','2024-03-27 01:03:38.944247'),(48,'registration','0019_rename_reson_checkinout_reason','2024-03-27 01:03:38.972307'),(49,'registration','0020_alter_checkinout_check_out_time','2024-03-27 01:03:39.026720'),(50,'registration','0021_alter_checkinout_check_out_time','2024-03-27 01:03:39.031039'),(51,'registration','0022_alter_checkinout_check_out_time','2024-03-27 01:03:39.068057'),(52,'registration','0018_auto_20240323_1759','2024-03-27 01:03:39.755841'),(53,'registration','0023_merge_20240325_1337','2024-03-27 01:03:39.760360'),(54,'registration','0024_alter_checkinout_mis','2024-03-27 01:03:39.766791'),(55,'shortlisting','0003_auto_20240325_1525','2024-03-27 01:03:39.841491'),(56,'registration','0025_firstyear','2024-04-01 10:37:29.385980'),(57,'registration','0026_delete_firstyear','2024-04-01 10:52:17.293009'),(58,'registration','0027_firstyear','2024-04-01 13:15:45.324256');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1rn6uu69e8j6dajpg84pvke14nf6565r','.eJxVj81OxDAMhN-lZ1Tlx9lsOCHQHuEVKuevDbRJlbS7B8S746JFgps133g8_uwG3Ldp2FuoQ_LdYydY9_BXtOg-Qj6If8c8lt6VvNVk-8PS32nrX4sP8_Pd-y9gwjbR9hk8cKWFQ3NmwaKP3AkF3kjg9sQigIpKeIbB0uSUM9ycJGfAlLQmRgq9hppicrilkgdHBylWgzQgCIYF00wCXtFPpWxtnMINfQCt9NN4QGq-kBHXdf4N-fn48iYkB665Jrpia7dSD50LCepEmq2Y3fHDS1nWfQv1kseUA7XJY_f1DVuqaJs:1rr9XC:PQwOcTRxAtqGGpGrJBU5iPCjZs40GMdeReB2JpYT6Q8','2024-04-15 04:44:38.669354');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_checkinout`
--

DROP TABLE IF EXISTS `registration_checkinout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_checkinout` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `check_in_time` datetime(6) NOT NULL,
  `check_out_time` datetime(6) NOT NULL,
  `mis` int NOT NULL,
  `year` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_checkinout`
--

LOCK TABLES `registration_checkinout` WRITE;
/*!40000 ALTER TABLE `registration_checkinout` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_checkinout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_civilengineering`
--

DROP TABLE IF EXISTS `registration_civilengineering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_civilengineering` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank` int NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percentile` double NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_civilengineering_user_id_6361b73b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_civilengineering`
--

LOCK TABLES `registration_civilengineering` WRITE;
/*!40000 ALTER TABLE `registration_civilengineering` DISABLE KEYS */;
INSERT INTO `registration_civilengineering` VALUES (1,1428,'EN23185238','fbjznsfxky@gmail.com','KADAM ANISH ANIL',99.411404,1,1,NULL),(2,1940,'EN23223626','szgozxefgj@gmail.com','PATIL ARNAV AJAY',99.2111179,1,1,NULL),(3,2774,'EN23149998','mswupjxynd@gmail.com','SURYAWANSHI SHIVRAJ SANJAY',98.8972243,1,1,NULL),(4,2941,'EN23173012','cdmlhbpiin@gmail.com','LANJEWAR SAHIL VINOD',98.8527647,1,1,NULL),(5,3272,'EN23217414','ythejtkkdk@gmail.com','AASHVARDHAN SINGH CHAUHAN',98.7149343,1,1,NULL),(6,3301,'EN23145658','miqfpakxqk@gmail.com','DEOGHARE VEDANT RAKESH',98.7018851,1,1,NULL),(7,3396,'EN23173586','djootfvsmm@gmail.com','ANSHUMAN SARANG PATIL',98.6673674,1,1,NULL),(8,3422,'EN23126225','qsgvnmaiwq@gmail.com','OZA OM SUNIL',98.6614529,1,1,NULL),(9,3690,'EN23215591','jrkhuuzeol@gmail.com','PATIL PIYUSH VIJAY',98.5636938,1,1,NULL),(10,3930,'EN23213221','flojewhzde@gmail.com','BHAVESH KAPURE',98.4796982,1,1,NULL),(11,3935,'EN23234117','foalgrhtop@gmail.com','NEHARKAR HARSHAL PREMCHAND',98.4796982,0,0,NULL),(12,3990,'EN23160416','gsimassulr@gmail.com','PAWAR SAIRAJ SANTOSH',98.4546548,0,0,NULL),(13,4102,'EN23112605','otwgsqxcwb@gmail.com','MUSALE HIMALAY KISHOR',98.3975197,0,0,NULL),(14,4172,'EN23116857','itlplbgkff@gmail.com','CHITTORA RITESH PURUSHOTTAM',98.3772737,0,0,NULL),(15,4191,'EN23111306','xzaagvwtlh@gmail.com','TAPKIR VEDANT SANDEEP',98.3681757,0,0,NULL),(16,4362,'EN23214726','ahzxohnwrv@gmail.com','SHAURYEARAJ YUVRAJ NEEMA KUMAR',98.2961113,0,0,NULL),(17,4654,'EN23163281','blkttmeoks@gmail.com','DHAGE ATHARV RAMESH',98.192048,0,0,NULL),(18,4676,'EN23183634','yylsxsrlfz@gmail.com','KEKADE SNEHIT MANOJ',98.1917154,0,0,NULL),(19,4959,'EN23110896','hgescnmboq@gmail.com','CHANAKYA NAVGHARE',98.0761344,0,0,NULL),(20,4998,'EN23129839','xkigvjobuo@gmail.com','ANJALI JADHAV',98.0707133,0,0,NULL),(21,5046,'EN23168100','nwijxjhlqr@gmail.com','WASADE UTKARSH JITENDRA',98.0592365,0,0,NULL),(22,5168,'EN23146388','cckbxodnig@gmail.com','VIBHANDIK KAUSTUBH SANJAY',98.0055132,0,0,NULL),(23,5340,'EN23134835','ipegcciqie@gmail.com','NIRMIT DHARMALE',97.9358267,0,0,NULL),(24,5600,'EN23171272','nuqrkxtdbq@gmail.com','RATHI PRANJAL SANTOSH',97.8417807,0,0,NULL),(25,5691,'EN23201433','bejzvxarer@gmail.com','KOLHE HARIDARSHAN KAILAS',97.7965436,0,0,NULL),(26,5736,'EN23116852','nvqnylgalc@gmail.com','KAKADE SAMEERA SATISH',97.7845902,0,0,NULL),(27,5864,'EN23137499','zqufknrnbi@gmail.com','RITISHAA ANAND',97.7443048,0,0,NULL),(28,6348,'EN23217922','ungfleqjzd@gmail.com','PATIL RASHIKA PRASHANT',97.5524607,0,0,NULL),(29,6423,'EN23223671','spgfemjrcq@gmail.com','GHULE ATHARVA DILIPKUMAR',97.5196409,0,0,NULL),(30,6592,'EN23165665','spimjmcgxk@gmail.com','PADULKAR SHIRISH SUNIL',97.4823503,0,0,NULL);
/*!40000 ALTER TABLE `registration_civilengineering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_computerengineering`
--

DROP TABLE IF EXISTS `registration_computerengineering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_computerengineering` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank` int NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percentile` double NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_compute_user_id_5d5695c5_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_computerengineering`
--

LOCK TABLES `registration_computerengineering` WRITE;
/*!40000 ALTER TABLE `registration_computerengineering` DISABLE KEYS */;
INSERT INTO `registration_computerengineering` VALUES (1,19,'EN23147051','gundaditya014@gmail.com','MEMON SAHIL SOHAIL SALIM',99.9918923,1,1,NULL),(2,20,'EN23131626','gundaditya014@gmail.com','DUDUSKAR VEDANT MANOJ',99.9918251,1,1,NULL),(3,22,'EN23115055','gundaditya014@gmail.com','BORKAR TANISHQ NILESH',99.9887938,1,1,NULL),(4,25,'EN23177796','gundaditya014@gmail.com','ARYAN ARUN MEHTA',99.9882168,1,1,NULL),(5,27,'EN23199748','jydhdhbohz@gmail.com','ANUPRIYA KARN',99.9878385,1,1,NULL),(6,29,'EN23122395','flxoerlcmv@gmail.com','GODASE ADITYA VASANT',99.9849962,1,1,NULL),(7,34,'EN23167975','avadhootsghewade4757@gmail.com','PHULE ANJALI RAVI',99.9837847,1,1,NULL),(8,45,'EN23108587','avadhootsghewade4757@gmail.com','DIGHE SAHIL ROHIDAS',99.97397,1,1,NULL),(9,46,'EN23127902','ztbzhxpxye@gmail.com','ABHISHEK ABHAY SINHA',99.9738523,1,1,NULL),(10,59,'EN23118507','ppgndsupyd@gmail.com','KADAM DISHA SUHAS',99.9663815,1,1,NULL),(11,64,'EN23141488','htvwkvcizz@gmail.com','DEODHAR ALHAD KAUSTUBH',99.9623735,0,0,NULL),(12,73,'EN23187710','hakdlktfpp@gmail.com','PATIL BHAGYASHREE RAMDAS',99.9587397,0,0,NULL),(13,84,'EN23158013','gxmfmcomff@gmail.com','SATHAYE AKSHAY SIDDHARTH',99.9510855,0,0,NULL),(14,92,'EN23177806','ddohcrobir@gmail.com','SAGARE MAYURESH RAVINDRA',99.9476244,0,0,NULL),(15,94,'EN23105417','utnvpebebc@gmail.com','JYOTIKA SHARAN',99.9473605,0,0,NULL),(16,105,'EN23141717','avadhootsghewade4757@gmail.com','INGLE AYUSH BHASKAR',99.9410632,0,1,21),(17,108,'EN23131436','nzswbcwywz@gmail.com','NINAD JAYANT SONKUSARE',99.9405028,0,0,NULL),(18,118,'EN23104499','eeowsgjfoc@gmail.com','AMAN BIPIN MORGHADE',99.9324831,0,0,NULL),(19,123,'EN23117272','siopnjwpqz@gmail.com','RIYA ASHUTOSH KULKARNI',99.9323206,0,0,NULL),(20,130,'EN23175735','mnmansbpcz@gmail.com','MOGHE GARGI MANISH',99.9285096,0,0,NULL),(21,139,'EN23130817','piyvgstozc@gmail.com','KARAD TANMAY KANTILAL',99.9214454,0,0,NULL),(22,146,'EN23194619','mttntltcuk@gmail.com','CHAVAN ROHIT SARJERAO',99.9176955,0,0,NULL),(23,147,'EN23176826','nvcrzmrkyy@gmail.com','PAWAR SIDDHI VISHWAMBHAR',99.9176955,0,0,NULL),(24,154,'EN23145959','xypcerotnw@gmail.com','DAVHALE ANSH PRADIP',99.9172217,0,0,NULL),(25,165,'EN23159348','uwsvctewqc@gmail.com','URKUNDE MOHIT BHASKAR',99.9102132,0,0,NULL),(26,179,'EN23129264','weajvhgwpg@gmail.com','DESHMUKH SHARDUL KIRAN',99.9018068,0,0,NULL),(27,180,'EN23123721','fjlzojmgxv@gmail.com','PATIL PARTH SUNIL',99.9018068,0,0,NULL),(28,181,'EN23183380','kltojiatsq@gmail.com','BHOSALE YASHWANT CHANDRAKANT',99.901772,0,0,NULL),(29,182,'EN23210714','bjfadykyhh@gmail.com','ROKADE RITESH DHANANJAY',99.8995984,0,0,NULL),(30,190,'EN23140670','hkxtpywdxc@gmail.com','MANE HARSHWARDHAN MANGESH',99.8954092,0,0,NULL);
/*!40000 ALTER TABLE `registration_computerengineering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_electricalengineering`
--

DROP TABLE IF EXISTS `registration_electricalengineering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_electricalengineering` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank` int NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percentile` double NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_electri_user_id_4abbfe62_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_electricalengineering`
--

LOCK TABLES `registration_electricalengineering` WRITE;
/*!40000 ALTER TABLE `registration_electricalengineering` DISABLE KEYS */;
INSERT INTO `registration_electricalengineering` VALUES (1,690,'EN23224561','xobdrcgbkj@gmail.com','ATHARVA PRASHANT NIJASURE',99.6868126,1,1,NULL),(2,729,'EN23118519','rxcehmdghn@gmail.com','HARSHIT MISRA',99.6688866,1,1,NULL),(3,758,'EN23113538','wrvdcvvtzh@gmail.com','AARYA AJEET MAJALI',99.6581667,1,1,NULL),(4,787,'EN23218171','doazflyfhl@gmail.com','MANDAVKAR MIHIR MADHUKAR',99.6503234,1,1,NULL),(5,898,'EN23125430','cfmuhmeibe@gmail.com','KALE SHREYASH SHYAMRAO',99.6032993,1,1,NULL),(6,906,'EN23251349','zhzfffotey@gmail.com','UTEKAR OM VIJAY',99.6021122,1,1,NULL),(7,932,'EN23139345','yorwvgeqcz@gmail.com','NISHANT PRADHAN',99.5953403,1,1,NULL),(8,940,'EN23122501','jkdhdkwtsn@gmail.com','SHRUSHTI SANJAY THAKARE',99.592843,1,1,NULL),(9,976,'EN23195901','eauieazvxr@gmail.com','SARAF ANIRUDDHA ADITYA',99.5743473,1,1,NULL),(10,1018,'EN23187634','wifmmhyvnq@gmail.com','CHITNIS RAJDEEP HIMANSHU',99.5561665,1,1,NULL),(11,1040,'EN23130973','fvtabmyegd@gmail.com','MAHAJAN VEDASHREE VINAYAK',99.5500243,0,0,NULL),(12,1044,'EN23116801','xyynvlgnam@gmail.com','PRANAV PRASHANT NANKAR',99.5500243,0,0,NULL),(13,1173,'EN23199116','crcvlcmglt@gmail.com','CHAVAN PRATIK PANDURANG',99.5017105,0,0,NULL),(14,1177,'EN23192150','gujzvczhng@gmail.com','KULKARNI ASHUTOSH SHRIPAD',99.5017105,0,0,NULL),(15,1202,'EN23139917','kfmlqdfjkv@gmail.com','PHAPALE SAIDEEP SANTOSH',99.492042,0,0,NULL),(16,1242,'EN23199556','xuzhljieii@gmail.com','SONTAKKE RUJUTA VIJAYANAND',99.4725028,0,0,NULL),(17,1249,'EN23198333','uvfxsrgziw@gmail.com','DESHMUKH MANAS AMOL',99.469569,0,0,NULL),(18,1304,'EN23149304','jbvlfgaeve@gmail.com','KHANDAIT KARTIK NITYANAND',99.4594392,0,0,NULL),(19,1390,'EN23230282','dtoraykixj@gmail.com','KANIRE PRANAV DIPAK',99.4199018,0,0,NULL),(20,1417,'EN23137160','dhmlvzhsgf@gmail.com','TONDGAONKAR ROCHANA MAHESH',99.4148537,0,0,NULL),(21,1422,'EN23146843','aqyubabtti@gmail.com','SHELAR ARCHIT SANTOSH',99.4148537,0,0,NULL),(22,1435,'EN23126231','lnawoghixi@gmail.com','LAVISH ISHWAR PATIL',99.4059257,0,0,NULL),(23,1450,'EN23110431','huntduxgxw@gmail.com','KSHIRSAGAR PRATIK KEDARNATH',99.4029851,0,0,NULL),(24,1456,'EN23227915','kwqkkkxutn@gmail.com','ARYA SHAILESH KARANJKAR',99.3979757,0,0,NULL),(25,1628,'EN23174014','fgmepftmrl@gmail.com','JADHAO SIYA SANJAY',99.3276306,0,0,NULL),(26,1681,'EN23203593','swfnezvwfp@gmail.com','AMBADKAR ISHWARI DNYANESHWAR',99.3092834,0,0,NULL),(27,1726,'EN23150163','dejcapjbwq@gmail.com','BARUDWALE SNEHA PRAVIN',99.2929293,0,0,NULL),(28,1808,'EN23169969','yudfswaguk@gmail.com','DHAVANE GOURAV GURULING',99.2604828,0,0,NULL),(29,2038,'EN23147290','zadnwvcoqz@gmail.com','DHARMADHIKARI ASMI SUHAS',99.1702432,0,0,NULL),(30,2103,'EN23143431','cmdamwvnha@gmail.com','VAIDYA DEEP PREMNARAYAN',99.1558828,0,0,NULL);
/*!40000 ALTER TABLE `registration_electricalengineering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_firstyear`
--

DROP TABLE IF EXISTS `registration_firstyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_firstyear` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank` int NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percentile` double NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_firstyear_user_id_e13ba54a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_firstyear`
--

LOCK TABLES `registration_firstyear` WRITE;
/*!40000 ALTER TABLE `registration_firstyear` DISABLE KEYS */;
INSERT INTO `registration_firstyear` VALUES (1,1428,'EN23185238','fbjznsfxky@gmail.com','KADAM ANISH ANIL',99.411404,1,1,'CivilEngineering',NULL),(2,1940,'EN23223626','szgozxefgj@gmail.com','PATIL ARNAV AJAY',99.2111179,1,1,'CivilEngineering',NULL),(3,2774,'EN23149998','mswupjxynd@gmail.com','SURYAWANSHI SHIVRAJ SANJAY',98.8972243,1,1,'CivilEngineering',NULL),(4,2941,'EN23173012','cdmlhbpiin@gmail.com','LANJEWAR SAHIL VINOD',98.8527647,1,1,'CivilEngineering',NULL),(5,3272,'EN23217414','ythejtkkdk@gmail.com','AASHVARDHAN SINGH CHAUHAN',98.7149343,1,1,'CivilEngineering',NULL),(6,3301,'EN23145658','miqfpakxqk@gmail.com','DEOGHARE VEDANT RAKESH',98.7018851,1,1,'CivilEngineering',NULL),(7,3396,'EN23173586','djootfvsmm@gmail.com','ANSHUMAN SARANG PATIL',98.6673674,1,1,'CivilEngineering',NULL),(8,3422,'EN23126225','qsgvnmaiwq@gmail.com','OZA OM SUNIL',98.6614529,1,1,'CivilEngineering',NULL),(9,3690,'EN23215591','jrkhuuzeol@gmail.com','PATIL PIYUSH VIJAY',98.5636938,1,1,'CivilEngineering',NULL),(10,3930,'EN23213221','flojewhzde@gmail.com','BHAVESH KAPURE',98.4796982,1,1,'CivilEngineering',NULL),(11,3935,'EN23234117','foalgrhtop@gmail.com','NEHARKAR HARSHAL PREMCHAND',98.4796982,0,0,'CivilEngineering',NULL),(12,3990,'EN23160416','gsimassulr@gmail.com','PAWAR SAIRAJ SANTOSH',98.4546548,0,0,'CivilEngineering',NULL),(13,4102,'EN23112605','otwgsqxcwb@gmail.com','MUSALE HIMALAY KISHOR',98.3975197,0,0,'CivilEngineering',NULL),(14,4172,'EN23116857','itlplbgkff@gmail.com','CHITTORA RITESH PURUSHOTTAM',98.3772737,0,0,'CivilEngineering',NULL),(15,4191,'EN23111306','xzaagvwtlh@gmail.com','TAPKIR VEDANT SANDEEP',98.3681757,0,0,'CivilEngineering',NULL),(16,4362,'EN23214726','ahzxohnwrv@gmail.com','SHAURYEARAJ YUVRAJ NEEMA KUMAR',98.2961113,0,0,'CivilEngineering',NULL),(17,4654,'EN23163281','blkttmeoks@gmail.com','DHAGE ATHARV RAMESH',98.192048,0,0,'CivilEngineering',NULL),(18,4676,'EN23183634','yylsxsrlfz@gmail.com','KEKADE SNEHIT MANOJ',98.1917154,0,0,'CivilEngineering',NULL),(19,4959,'EN23110896','hgescnmboq@gmail.com','CHANAKYA NAVGHARE',98.0761344,0,0,'CivilEngineering',NULL),(20,4998,'EN23129839','xkigvjobuo@gmail.com','ANJALI JADHAV',98.0707133,0,0,'CivilEngineering',NULL),(21,5046,'EN23168100','nwijxjhlqr@gmail.com','WASADE UTKARSH JITENDRA',98.0592365,0,0,'CivilEngineering',NULL),(22,5168,'EN23146388','cckbxodnig@gmail.com','VIBHANDIK KAUSTUBH SANJAY',98.0055132,0,0,'CivilEngineering',NULL),(23,5340,'EN23134835','ipegcciqie@gmail.com','NIRMIT DHARMALE',97.9358267,0,0,'CivilEngineering',NULL),(24,5600,'EN23171272','nuqrkxtdbq@gmail.com','RATHI PRANJAL SANTOSH',97.8417807,0,0,'CivilEngineering',NULL),(25,5691,'EN23201433','bejzvxarer@gmail.com','KOLHE HARIDARSHAN KAILAS',97.7965436,0,0,'CivilEngineering',NULL),(26,5736,'EN23116852','nvqnylgalc@gmail.com','KAKADE SAMEERA SATISH',97.7845902,0,0,'CivilEngineering',NULL),(27,5864,'EN23137499','zqufknrnbi@gmail.com','RITISHAA ANAND',97.7443048,0,0,'CivilEngineering',NULL),(28,6348,'EN23217922','ungfleqjzd@gmail.com','PATIL RASHIKA PRASHANT',97.5524607,0,0,'CivilEngineering',NULL),(29,6423,'EN23223671','spgfemjrcq@gmail.com','GHULE ATHARVA DILIPKUMAR',97.5196409,0,0,'CivilEngineering',NULL),(30,6592,'EN23165665','spimjmcgxk@gmail.com','PADULKAR SHIRISH SUNIL',97.4823503,0,0,'CivilEngineering',NULL),(31,690,'EN23224561','xobdrcgbkj@gmail.com','ATHARVA PRASHANT NIJASURE',99.6868126,1,1,'ElectricalEngineering',NULL),(32,729,'EN23118519','rxcehmdghn@gmail.com','HARSHIT MISRA',99.6688866,1,1,'ElectricalEngineering',NULL),(33,758,'EN23113538','wrvdcvvtzh@gmail.com','AARYA AJEET MAJALI',99.6581667,1,1,'ElectricalEngineering',NULL),(34,787,'EN23218171','doazflyfhl@gmail.com','MANDAVKAR MIHIR MADHUKAR',99.6503234,1,1,'ElectricalEngineering',NULL),(35,898,'EN23125430','cfmuhmeibe@gmail.com','KALE SHREYASH SHYAMRAO',99.6032993,1,1,'ElectricalEngineering',NULL),(36,906,'EN23251349','zhzfffotey@gmail.com','UTEKAR OM VIJAY',99.6021122,1,1,'ElectricalEngineering',NULL),(37,932,'EN23139345','yorwvgeqcz@gmail.com','NISHANT PRADHAN',99.5953403,1,1,'ElectricalEngineering',NULL),(38,940,'EN23122501','jkdhdkwtsn@gmail.com','SHRUSHTI SANJAY THAKARE',99.592843,1,1,'ElectricalEngineering',NULL),(39,976,'EN23195901','eauieazvxr@gmail.com','SARAF ANIRUDDHA ADITYA',99.5743473,1,1,'ElectricalEngineering',NULL),(40,1018,'EN23187634','wifmmhyvnq@gmail.com','CHITNIS RAJDEEP HIMANSHU',99.5561665,1,1,'ElectricalEngineering',NULL),(41,1040,'EN23130973','fvtabmyegd@gmail.com','MAHAJAN VEDASHREE VINAYAK',99.5500243,0,0,'ElectricalEngineering',NULL),(42,1044,'EN23116801','xyynvlgnam@gmail.com','PRANAV PRASHANT NANKAR',99.5500243,0,0,'ElectricalEngineering',NULL),(43,1173,'EN23199116','crcvlcmglt@gmail.com','CHAVAN PRATIK PANDURANG',99.5017105,0,0,'ElectricalEngineering',NULL),(44,1177,'EN23192150','gujzvczhng@gmail.com','KULKARNI ASHUTOSH SHRIPAD',99.5017105,0,0,'ElectricalEngineering',NULL),(45,1202,'EN23139917','kfmlqdfjkv@gmail.com','PHAPALE SAIDEEP SANTOSH',99.492042,0,0,'ElectricalEngineering',NULL),(46,1242,'EN23199556','xuzhljieii@gmail.com','SONTAKKE RUJUTA VIJAYANAND',99.4725028,0,0,'ElectricalEngineering',NULL),(47,1249,'EN23198333','uvfxsrgziw@gmail.com','DESHMUKH MANAS AMOL',99.469569,0,0,'ElectricalEngineering',NULL),(48,1304,'EN23149304','jbvlfgaeve@gmail.com','KHANDAIT KARTIK NITYANAND',99.4594392,0,0,'ElectricalEngineering',NULL),(49,1390,'EN23230282','dtoraykixj@gmail.com','KANIRE PRANAV DIPAK',99.4199018,0,0,'ElectricalEngineering',NULL),(50,1417,'EN23137160','dhmlvzhsgf@gmail.com','TONDGAONKAR ROCHANA MAHESH',99.4148537,0,0,'ElectricalEngineering',NULL),(51,1422,'EN23146843','aqyubabtti@gmail.com','SHELAR ARCHIT SANTOSH',99.4148537,0,0,'ElectricalEngineering',NULL),(52,1435,'EN23126231','lnawoghixi@gmail.com','LAVISH ISHWAR PATIL',99.4059257,0,0,'ElectricalEngineering',NULL),(53,1450,'EN23110431','huntduxgxw@gmail.com','KSHIRSAGAR PRATIK KEDARNATH',99.4029851,0,0,'ElectricalEngineering',NULL),(54,1456,'EN23227915','kwqkkkxutn@gmail.com','ARYA SHAILESH KARANJKAR',99.3979757,0,0,'ElectricalEngineering',NULL),(55,1628,'EN23174014','fgmepftmrl@gmail.com','JADHAO SIYA SANJAY',99.3276306,0,0,'ElectricalEngineering',NULL),(56,1681,'EN23203593','swfnezvwfp@gmail.com','AMBADKAR ISHWARI DNYANESHWAR',99.3092834,0,0,'ElectricalEngineering',NULL),(57,1726,'EN23150163','dejcapjbwq@gmail.com','BARUDWALE SNEHA PRAVIN',99.2929293,0,0,'ElectricalEngineering',NULL),(58,1808,'EN23169969','yudfswaguk@gmail.com','DHAVANE GOURAV GURULING',99.2604828,0,0,'ElectricalEngineering',NULL),(59,2038,'EN23147290','zadnwvcoqz@gmail.com','DHARMADHIKARI ASMI SUHAS',99.1702432,0,0,'ElectricalEngineering',NULL),(60,2103,'EN23143431','cmdamwvnha@gmail.com','VAIDYA DEEP PREMNARAYAN',99.1558828,0,0,'ElectricalEngineering',NULL),(61,19,'EN23147051','gundaditya014@gmail.com','MEMON SAHIL SOHAIL SALIM',99.9918923,1,1,'ComputerEngineering',NULL),(62,20,'EN23131626','gundaditya014@gmail.com','DUDUSKAR VEDANT MANOJ',99.9918251,1,1,'ComputerEngineering',NULL),(63,22,'EN23115055','gundaditya014@gmail.com','BORKAR TANISHQ NILESH',99.9887938,1,1,'ComputerEngineering',NULL),(64,25,'EN23177796','gundaditya014@gmail.com','ARYAN ARUN MEHTA',99.9882168,1,1,'ComputerEngineering',NULL),(65,27,'EN23199748','jydhdhbohz@gmail.com','ANUPRIYA KARN',99.9878385,1,1,'ComputerEngineering',NULL),(66,29,'EN23122395','flxoerlcmv@gmail.com','GODASE ADITYA VASANT',99.9849962,1,1,'ComputerEngineering',NULL),(67,34,'EN23167975','avadhootsghewade4757@gmail.com','PHULE ANJALI RAVI',99.9837847,1,1,'ComputerEngineering',NULL),(68,45,'EN23108587','avadhootsghewade4757@gmail.com','DIGHE SAHIL ROHIDAS',99.97397,1,1,'ComputerEngineering',NULL),(69,46,'EN23127902','ztbzhxpxye@gmail.com','ABHISHEK ABHAY SINHA',99.9738523,1,1,'ComputerEngineering',NULL),(70,59,'EN23118507','ppgndsupyd@gmail.com','KADAM DISHA SUHAS',99.9663815,1,1,'ComputerEngineering',NULL),(71,64,'EN23141488','htvwkvcizz@gmail.com','DEODHAR ALHAD KAUSTUBH',99.9623735,0,0,'ComputerEngineering',NULL),(72,73,'EN23187710','hakdlktfpp@gmail.com','PATIL BHAGYASHREE RAMDAS',99.9587397,0,0,'ComputerEngineering',NULL),(73,84,'EN23158013','gxmfmcomff@gmail.com','SATHAYE AKSHAY SIDDHARTH',99.9510855,0,0,'ComputerEngineering',NULL),(74,92,'EN23177806','ddohcrobir@gmail.com','SAGARE MAYURESH RAVINDRA',99.9476244,0,0,'ComputerEngineering',NULL),(75,94,'EN23105417','utnvpebebc@gmail.com','JYOTIKA SHARAN',99.9473605,0,0,'ComputerEngineering',NULL),(76,105,'EN23141717','avadhootsghewade4757@gmail.com','INGLE AYUSH BHASKAR',99.9410632,1,0,'ComputerEngineering',21),(77,108,'EN23131436','nzswbcwywz@gmail.com','NINAD JAYANT SONKUSARE',99.9405028,0,0,'ComputerEngineering',NULL),(78,118,'EN23104499','eeowsgjfoc@gmail.com','AMAN BIPIN MORGHADE',99.9324831,0,0,'ComputerEngineering',NULL),(79,123,'EN23117272','siopnjwpqz@gmail.com','RIYA ASHUTOSH KULKARNI',99.9323206,0,0,'ComputerEngineering',NULL),(80,130,'EN23175735','mnmansbpcz@gmail.com','MOGHE GARGI MANISH',99.9285096,0,0,'ComputerEngineering',NULL),(81,139,'EN23130817','piyvgstozc@gmail.com','KARAD TANMAY KANTILAL',99.9214454,0,0,'ComputerEngineering',NULL),(82,146,'EN23194619','mttntltcuk@gmail.com','CHAVAN ROHIT SARJERAO',99.9176955,0,0,'ComputerEngineering',NULL),(83,147,'EN23176826','nvcrzmrkyy@gmail.com','PAWAR SIDDHI VISHWAMBHAR',99.9176955,0,0,'ComputerEngineering',NULL),(84,154,'EN23145959','xypcerotnw@gmail.com','DAVHALE ANSH PRADIP',99.9172217,0,0,'ComputerEngineering',NULL),(85,165,'EN23159348','uwsvctewqc@gmail.com','URKUNDE MOHIT BHASKAR',99.9102132,0,0,'ComputerEngineering',NULL),(86,179,'EN23129264','weajvhgwpg@gmail.com','DESHMUKH SHARDUL KIRAN',99.9018068,0,0,'ComputerEngineering',NULL),(87,180,'EN23123721','fjlzojmgxv@gmail.com','PATIL PARTH SUNIL',99.9018068,0,0,'ComputerEngineering',NULL),(88,181,'EN23183380','kltojiatsq@gmail.com','BHOSALE YASHWANT CHANDRAKANT',99.901772,0,0,'ComputerEngineering',NULL),(89,182,'EN23210714','bjfadykyhh@gmail.com','ROKADE RITESH DHANANJAY',99.8995984,0,0,'ComputerEngineering',NULL),(90,190,'EN23140670','hkxtpywdxc@gmail.com','MANE HARSHWARDHAN MANGESH',99.8954092,0,0,'ComputerEngineering',NULL),(91,1147,'EN23127178','oqgdrstffa@gmail.com','MIRASHI KARTIK ROHIT',99.5112047,1,1,'InstrumentationEngineering',NULL),(92,1318,'EN23115961','pipmtrrhnc@gmail.com','VISPUTE HARDIK KAILAS',99.4425739,1,1,'InstrumentationEngineering',NULL),(93,1382,'EN23141780','ttzpnypkjw@gmail.com','JOSHI NIHAR ASHWIN',99.4219002,1,1,'InstrumentationEngineering',NULL),(94,1689,'EN23159242','pfezlvqalb@gmail.com','KUMBHARKAR SIDDHARTH SANJAY',99.3039094,1,1,'InstrumentationEngineering',NULL),(95,1700,'EN23117638','cwdykvemzk@gmail.com','TIWARI ADITYA SUNIL',99.3010423,1,1,'InstrumentationEngineering',NULL),(96,1734,'EN23212036','xgupjmcmsr@gmail.com','HARKARE SHIVSAMB MANGALKUMAR',99.2878714,1,1,'InstrumentationEngineering',NULL),(97,1775,'EN23100634','taxadhhsvr@gmail.com','GAURANSH KUMAR',99.27243,1,1,'InstrumentationEngineering',NULL),(98,1789,'EN23102354','jrpitqaenk@gmail.com','AWATE HRUSHIKESH GAJANAN',99.2630471,1,1,'InstrumentationEngineering',NULL),(99,2015,'EN23141396','djyrxjahla@gmail.com','MUNJAL AAYUSH RAMESH',99.1827433,1,1,'InstrumentationEngineering',NULL),(100,2089,'EN23121213','jzlqporshk@gmail.com','ARDHAPURKAR ISHAN RAJESH',99.1633936,1,1,'InstrumentationEngineering',NULL),(101,2161,'EN23156717','fjfozddsjm@gmail.com','KINAGE ATHARVA MILIND',99.1238065,0,0,'InstrumentationEngineering',NULL),(102,2332,'EN23106492','pfpryqawma@gmail.com','MAYEKAR AARUSHI MANDAR',99.0609406,0,0,'InstrumentationEngineering',NULL),(103,2357,'EN23136984','lutzallaiu@gmail.com','BHUMI ANIL DAVE',99.0554565,0,0,'InstrumentationEngineering',NULL),(104,2377,'EN23143357','qmfyuhylmt@gmail.com','MOHOKAR RAM SAMEER',99.0540185,0,0,'InstrumentationEngineering',NULL),(105,2543,'EN23168053','gqlgdjznty@gmail.com','KEVALINA BHATTACHARYYA',98.9944819,0,0,'InstrumentationEngineering',NULL),(106,2602,'EN23189943','dfahwitrnu@gmail.com','NAGARKAR APURVAA SHAILESH',98.9743798,0,0,'InstrumentationEngineering',NULL),(107,2812,'EN23116034','gtnzyjcdln@gmail.com','AMEYA DUSANE',98.8892492,0,0,'InstrumentationEngineering',NULL),(108,5444,'EN23130897','dbnqvjjmzx@gmail.com','GHULE KHUSHBOO TUKARAM',97.8929149,0,0,'InstrumentationEngineering',NULL),(109,5493,'EN23176196','twembhrliy@gmail.com','GHUGE ROHAN DINESH',97.8717367,0,0,'InstrumentationEngineering',NULL),(110,5975,'EN23137559','ipusddzglv@gmail.com','NALLA KEITH MESSAICH SUMANT',97.6944816,0,0,'InstrumentationEngineering',NULL),(111,6509,'EN23109373','ojdbfqqgyg@gmail.com','ANUSHREE VITTHAL KOTHE',97.497397,0,0,'InstrumentationEngineering',NULL),(112,8931,'EN23115873','quzjsquuox@gmail.com','GAJBHIYE SAJAG JEEVAK',96.5408332,0,0,'InstrumentationEngineering',NULL),(113,9800,'EN23123342','njacyyctyt@gmail.com','MANUSHREE SONAWANE',96.207802,0,0,'InstrumentationEngineering',NULL),(114,10944,'EN23163825','kngnfffrgi@gmail.com','JADHAV SMITESH SANDEEP',95.740678,0,0,'InstrumentationEngineering',NULL),(115,14740,'EN23138822','beypgyszqb@gmail.com','SHINDE ANUSHKA SATISH',94.1664477,0,0,'InstrumentationEngineering',NULL),(116,27542,'EN23184708','zvaoknkuos@gmail.com','YASH DEEPAK ZENDE',88.7549097,0,0,'InstrumentationEngineering',NULL),(117,33664,'EN23221394','gtjqoqccxv@gmail.com','ILPATE VED MAHENDRA',86.0518493,0,0,'InstrumentationEngineering',NULL),(118,48801,'EN23246109','xweoxzulys@gmail.com','PADAVI AVANI HIRAJI',79.4628516,0,0,'InstrumentationEngineering',NULL),(119,79044,'EN23150533','crhsbwjpgm@gmail.com','JOSHI CHANDRASHEKHAR VIKASRAO',62.7898492,0,0,'InstrumentationEngineering',NULL),(120,136522,'EN23110125','zxyfajacpg@gmail.com','HARSH NAMDEO CHAVAN',11.2906846,0,0,'InstrumentationEngineering',NULL),(121,2488,'EN23174985','wjekctsyvu@gmail.com','POTDAR RAJAS ABHAY',99.0182954,1,1,'ManfacturingEngineering',NULL),(122,2532,'EN23113653','eoefvhaobt@gmail.com','RAY SHUBHAM NAVIN',98.9989167,1,1,'ManfacturingEngineering',NULL),(123,2565,'EN23180235','incvgyapsq@gmail.com','NASERI CHIRAG AMIT',98.9936401,1,1,'ManfacturingEngineering',NULL),(124,2653,'EN23123728','kluevsslqi@gmail.com','ANGRE AARY SANJAY',98.9502201,1,1,'ManfacturingEngineering',NULL),(125,2660,'EN23149014','vgrqinngzt@gmail.com','BAMISHTE APOORV AMOL',98.9495197,1,1,'ManfacturingEngineering',NULL),(126,2743,'EN23126739','tdsaxpkyyr@gmail.com','HARNE NIDHISH KSHITIJ',98.9155632,1,1,'ManfacturingEngineering',NULL),(127,2811,'EN23105613','rgrhpkhgyv@gmail.com','VEDANT SONAWANE',98.8892492,1,1,'ManfacturingEngineering',NULL),(128,2985,'EN23111226','wujjkgopkb@gmail.com','DANDEKAR AMEY VISHWAS',98.8256088,1,1,'ManfacturingEngineering',NULL),(129,3152,'EN23163337','efuujyvezq@gmail.com','GHOGARE SAMARTH SUGRIV',98.7654321,1,1,'ManfacturingEngineering',NULL),(130,3394,'EN23177423','ajwsuglxic@gmail.com','KULKARNI PRANAV ASHOK',98.6673674,0,0,'ManfacturingEngineering',NULL),(131,3480,'EN23186609','lbwfvpzsmt@gmail.com','GOVILKAR CHINMAY RUTURAJ',98.6419653,0,0,'ManfacturingEngineering',NULL),(132,3524,'EN23153487','esucoqjvkb@gmail.com','YASH SHRIVASTAVA',98.6179074,0,0,'ManfacturingEngineering',NULL),(133,3610,'EN23182700','qnvytktgyq@gmail.com','THITE ANURAG DEEPAK',98.5811578,0,0,'ManfacturingEngineering',NULL),(134,3711,'EN23200672','pjiigdnvav@gmail.com','BEDARKAR ATHARVA AMIT',98.5633908,0,0,'ManfacturingEngineering',NULL),(135,3810,'EN23143546','zzpwkexteq@gmail.com','SALGAOKAR ARJUN HEMANT',98.5069349,0,0,'ManfacturingEngineering',NULL),(136,3820,'EN23103632','hxooabhdmt@gmail.com','DEVASHISH GHODKI',98.503535,0,0,'ManfacturingEngineering',NULL),(137,3997,'EN23138705','pyitezknoe@gmail.com','ADITYA SANJEEVI',98.4460248,0,0,'ManfacturingEngineering',NULL),(138,4105,'EN23222254','siaxykqrsr@gmail.com','UPADHYE SHRAVAN SANTOSH',98.3975197,0,0,'ManfacturingEngineering',NULL),(139,4233,'EN23141632','iowtalermw@gmail.com','DANGE SAURISH JAYANT',98.3419119,0,0,'ManfacturingEngineering',NULL),(140,4408,'EN23171215','yravtpnmhw@gmail.com','VED SHAILESH THOMBRE',98.2807162,0,0,'ManfacturingEngineering',NULL),(141,4857,'EN23230235','hzxplnedoo@gmail.com','TANGADPALLIWAR VAMSHI MALLESH',98.1183995,0,0,'ManfacturingEngineering',NULL),(142,4933,'EN23133620','aivjygdvoy@gmail.com','LONBALE TANMAY SURESH',98.078661,0,0,'ManfacturingEngineering',NULL),(143,5375,'EN23128411','bavjglspfx@gmail.com','BRAHMANKAR SUMEDH MANOJ',97.9332333,0,0,'ManfacturingEngineering',NULL),(144,5646,'EN23209881','zgqmgmkwmp@gmail.com','DHAKNE SATYAM SUDHAKAR',97.818535,0,0,'ManfacturingEngineering',NULL),(145,5675,'EN23228831','hhehjyxhdt@gmail.com','KANDALKAR MOHIT MOHANRAO',97.8134761,0,0,'ManfacturingEngineering',NULL),(146,6097,'EN23185978','nvbhzhkkbk@gmail.com','WARKE TOSHIT DEVENDRA',97.6528296,0,0,'ManfacturingEngineering',NULL),(147,6483,'EN23125946','ftpapysyxz@gmail.com','PANDEY ANJALI SANTOSH',97.5089387,1,1,'ManfacturingEngineering',NULL),(148,6507,'EN23102033','pvgafwusvw@gmail.com','ANANYA DAS',97.497397,0,0,'ManfacturingEngineering',NULL),(149,6510,'EN23141713','ootgfwfvny@gmail.com','MAYUR VILAS LOKHANDE',97.497397,0,0,'ManfacturingEngineering',NULL),(150,6520,'EN23147207','axatxziwdw@gmail.com','DAWANGE SIDDHESH SANJAY',97.497397,0,0,'ManfacturingEngineering',NULL),(151,183,'EN23223188','nfuljvsamn@gmail.com','SAHASRABUDDHE MIHIR VINAY',99.8995984,1,1,'MechanicalEngineering',NULL),(152,360,'EN23140891','plxessjcfj@gmail.com','GUJRATHI SAHIL AKSHAY',99.8281723,1,1,'MechanicalEngineering',NULL),(153,406,'EN23173180','wqkeqbjrkd@gmail.com','NERLEKAR AKHILESH ROHIT',99.8078888,1,1,'MechanicalEngineering',NULL),(154,542,'EN23193955','ajaxeckzyp@gmail.com','DHERE ADWAIT DEVENDRA',99.7486622,1,1,'MechanicalEngineering',NULL),(155,870,'EN23219778','qkiqwfkzhn@gmail.com','PALAV AVANEESH DEEPAK',99.6189907,1,1,'MechanicalEngineering',NULL),(156,1055,'EN23139025','txsclxatpv@gmail.com','SARTHAK SUHAS DODE',99.5498875,1,1,'MechanicalEngineering',NULL),(157,1099,'EN23122145','qbsagdbxyo@gmail.com','PARTH RAJESH KALE',99.5259059,1,1,'MechanicalEngineering',NULL),(158,1150,'EN23219327','qoyfcgodxn@gmail.com','JAIN HEET NILESH',99.5112047,1,1,'MechanicalEngineering',NULL),(159,1238,'EN23193832','abejmtrjdy@gmail.com','ZILMAR YASH VAIBHAV',99.4854674,1,1,'MechanicalEngineering',NULL),(160,1367,'EN23193733','gfgstdcrho@gmail.com','NERLEKAR ADITYA SHRIKANT',99.4265515,1,1,'MechanicalEngineering',NULL),(161,1369,'EN23221104','nggvtatboy@gmail.com','BHAGAT SWARAJ BALASO',99.4263487,0,0,'MechanicalEngineering',NULL),(162,1420,'EN23110465','hrlvgzbzri@gmail.com','SRUSHTI SURENDRA BAKARE',99.4148537,0,0,'MechanicalEngineering',NULL),(163,1457,'EN23174117','yaeybydowo@gmail.com','DESHPANDE OJAS SHRINIWAS',99.3979757,0,0,'MechanicalEngineering',NULL),(164,1482,'EN23104536','mhmirpvuld@gmail.com','BONDE KARAN GIRISH',99.3949157,0,0,'MechanicalEngineering',NULL),(165,1483,'EN23121959','lzsevblbzu@gmail.com','DESHPANDE SOHAM VIKAS',99.3949157,0,0,'MechanicalEngineering',NULL),(166,1488,'EN23206488','levorouhqx@gmail.com','CHAFALE SOMENDRA DEVIDAS',99.382716,0,0,'MechanicalEngineering',NULL),(167,1548,'EN23243660','kbmrgqxmfg@gmail.com','GHODE YOGIRAJ DEEPAK',99.3623544,0,0,'MechanicalEngineering',NULL),(168,1642,'EN23112879','tyrtpuqmhk@gmail.com','JOSHI SIDDHARTH ADITYA',99.3228582,0,0,'MechanicalEngineering',NULL),(169,1656,'EN23229050','lyiqxvwmna@gmail.com','AGASHE SUMEDHA SACHIN',99.3210803,0,0,'MechanicalEngineering',NULL),(170,1658,'EN23158949','hrxadcieno@gmail.com','BHOKARE SUYOG GUNDA',99.3210803,0,0,'MechanicalEngineering',NULL),(171,1672,'EN23141489','rpapycqqul@gmail.com','MOHAMMED BILAL AZIZ',99.3126473,0,0,'MechanicalEngineering',NULL),(172,1691,'EN23122483','elpmpesnho@gmail.com','KARANPREET SINGH VIJ',99.3039094,0,0,'MechanicalEngineering',NULL),(173,1710,'EN23226361','cnsymnkesq@gmail.com','PAWAR VEDANT ASHOK',99.2971888,0,0,'MechanicalEngineering',NULL),(174,1724,'EN23141546','huwqrewhpf@gmail.com','PEDNEKAR RUHI LAXMESH',99.2929293,0,0,'MechanicalEngineering',NULL),(175,1728,'EN23197252','ejfupdzzje@gmail.com','JORDAN NATHAN LIONEL',99.2929293,0,0,'MechanicalEngineering',NULL),(176,1729,'EN23177366','omakgihjgr@gmail.com','DANDE ANISH SHYAM',99.2929293,0,0,'MechanicalEngineering',NULL),(177,1746,'EN23110652','rfcjffosek@gmail.com','CHAPHALKAR ATHARV SANTOSH',99.2878714,0,0,'MechanicalEngineering',NULL),(178,1792,'EN23205245','zqeapicmpp@gmail.com','YASH CHITALE',99.2630471,0,0,'MechanicalEngineering',NULL),(179,1807,'EN23271575','lqinlklwxe@gmail.com','VIVEK MILIND SAWANT',99.2604828,0,0,'MechanicalEngineering',NULL),(180,1822,'EN23169846','itdugncybh@gmail.com','PATIL SPANDAN MANOJ',99.2562844,0,0,'MechanicalEngineering',NULL);
/*!40000 ALTER TABLE `registration_firstyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_instrumentationengineering`
--

DROP TABLE IF EXISTS `registration_instrumentationengineering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_instrumentationengineering` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank` int NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percentile` double NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_instrum_user_id_cde473d2_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_instrumentationengineering`
--

LOCK TABLES `registration_instrumentationengineering` WRITE;
/*!40000 ALTER TABLE `registration_instrumentationengineering` DISABLE KEYS */;
INSERT INTO `registration_instrumentationengineering` VALUES (1,1147,'EN23127178','oqgdrstffa@gmail.com','MIRASHI KARTIK ROHIT',99.5112047,1,1,NULL),(2,1318,'EN23115961','pipmtrrhnc@gmail.com','VISPUTE HARDIK KAILAS',99.4425739,1,1,NULL),(3,1382,'EN23141780','ttzpnypkjw@gmail.com','JOSHI NIHAR ASHWIN',99.4219002,1,1,NULL),(4,1689,'EN23159242','pfezlvqalb@gmail.com','KUMBHARKAR SIDDHARTH SANJAY',99.3039094,1,1,NULL),(5,1700,'EN23117638','cwdykvemzk@gmail.com','TIWARI ADITYA SUNIL',99.3010423,1,1,NULL),(6,1734,'EN23212036','xgupjmcmsr@gmail.com','HARKARE SHIVSAMB MANGALKUMAR',99.2878714,1,1,NULL),(7,1775,'EN23100634','taxadhhsvr@gmail.com','GAURANSH KUMAR',99.27243,1,1,NULL),(8,1789,'EN23102354','jrpitqaenk@gmail.com','AWATE HRUSHIKESH GAJANAN',99.2630471,1,1,NULL),(9,2015,'EN23141396','djyrxjahla@gmail.com','MUNJAL AAYUSH RAMESH',99.1827433,1,1,NULL),(10,2089,'EN23121213','jzlqporshk@gmail.com','ARDHAPURKAR ISHAN RAJESH',99.1633936,1,1,NULL),(11,2161,'EN23156717','fjfozddsjm@gmail.com','KINAGE ATHARVA MILIND',99.1238065,0,0,NULL),(12,2332,'EN23106492','pfpryqawma@gmail.com','MAYEKAR AARUSHI MANDAR',99.0609406,0,0,NULL),(13,2357,'EN23136984','lutzallaiu@gmail.com','BHUMI ANIL DAVE',99.0554565,0,0,NULL),(14,2377,'EN23143357','qmfyuhylmt@gmail.com','MOHOKAR RAM SAMEER',99.0540185,0,0,NULL),(15,2543,'EN23168053','gqlgdjznty@gmail.com','KEVALINA BHATTACHARYYA',98.9944819,0,0,NULL),(16,2602,'EN23189943','dfahwitrnu@gmail.com','NAGARKAR APURVAA SHAILESH',98.9743798,0,0,NULL),(17,2812,'EN23116034','gtnzyjcdln@gmail.com','AMEYA DUSANE',98.8892492,0,0,NULL),(18,5444,'EN23130897','dbnqvjjmzx@gmail.com','GHULE KHUSHBOO TUKARAM',97.8929149,0,0,NULL),(19,5493,'EN23176196','twembhrliy@gmail.com','GHUGE ROHAN DINESH',97.8717367,0,0,NULL),(20,5975,'EN23137559','ipusddzglv@gmail.com','NALLA KEITH MESSAICH SUMANT',97.6944816,0,0,NULL),(21,6509,'EN23109373','ojdbfqqgyg@gmail.com','ANUSHREE VITTHAL KOTHE',97.497397,0,0,NULL),(22,8931,'EN23115873','quzjsquuox@gmail.com','GAJBHIYE SAJAG JEEVAK',96.5408332,0,0,NULL),(23,9800,'EN23123342','njacyyctyt@gmail.com','MANUSHREE SONAWANE',96.207802,0,0,NULL),(24,10944,'EN23163825','kngnfffrgi@gmail.com','JADHAV SMITESH SANDEEP',95.740678,0,0,NULL),(25,14740,'EN23138822','beypgyszqb@gmail.com','SHINDE ANUSHKA SATISH',94.1664477,0,0,NULL),(26,27542,'EN23184708','zvaoknkuos@gmail.com','YASH DEEPAK ZENDE',88.7549097,0,0,NULL),(27,33664,'EN23221394','gtjqoqccxv@gmail.com','ILPATE VED MAHENDRA',86.0518493,0,0,NULL),(28,48801,'EN23246109','xweoxzulys@gmail.com','PADAVI AVANI HIRAJI',79.4628516,0,0,NULL),(29,79044,'EN23150533','crhsbwjpgm@gmail.com','JOSHI CHANDRASHEKHAR VIKASRAO',62.7898492,0,0,NULL),(30,136522,'EN23110125','zxyfajacpg@gmail.com','HARSH NAMDEO CHAVAN',11.2906846,0,0,NULL);
/*!40000 ALTER TABLE `registration_instrumentationengineering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_manfacturingengineering`
--

DROP TABLE IF EXISTS `registration_manfacturingengineering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_manfacturingengineering` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank` int NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percentile` double NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_manfact_user_id_a0d8f283_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_manfacturingengineering`
--

LOCK TABLES `registration_manfacturingengineering` WRITE;
/*!40000 ALTER TABLE `registration_manfacturingengineering` DISABLE KEYS */;
INSERT INTO `registration_manfacturingengineering` VALUES (1,2488,'EN23174985','wjekctsyvu@gmail.com','POTDAR RAJAS ABHAY',99.0182954,1,1,NULL),(2,2532,'EN23113653','eoefvhaobt@gmail.com','RAY SHUBHAM NAVIN',98.9989167,1,1,NULL),(3,2565,'EN23180235','incvgyapsq@gmail.com','NASERI CHIRAG AMIT',98.9936401,1,1,NULL),(4,2653,'EN23123728','kluevsslqi@gmail.com','ANGRE AARY SANJAY',98.9502201,1,1,NULL),(5,2660,'EN23149014','vgrqinngzt@gmail.com','BAMISHTE APOORV AMOL',98.9495197,1,1,NULL),(6,2743,'EN23126739','tdsaxpkyyr@gmail.com','HARNE NIDHISH KSHITIJ',98.9155632,1,1,NULL),(7,2811,'EN23105613','rgrhpkhgyv@gmail.com','VEDANT SONAWANE',98.8892492,1,1,NULL),(8,2985,'EN23111226','wujjkgopkb@gmail.com','DANDEKAR AMEY VISHWAS',98.8256088,1,1,NULL),(9,3152,'EN23163337','efuujyvezq@gmail.com','GHOGARE SAMARTH SUGRIV',98.7654321,1,1,NULL),(10,3394,'EN23177423','ajwsuglxic@gmail.com','KULKARNI PRANAV ASHOK',98.6673674,0,0,NULL),(11,3480,'EN23186609','lbwfvpzsmt@gmail.com','GOVILKAR CHINMAY RUTURAJ',98.6419653,0,0,NULL),(12,3524,'EN23153487','esucoqjvkb@gmail.com','YASH SHRIVASTAVA',98.6179074,0,0,NULL),(13,3610,'EN23182700','qnvytktgyq@gmail.com','THITE ANURAG DEEPAK',98.5811578,0,0,NULL),(14,3711,'EN23200672','pjiigdnvav@gmail.com','BEDARKAR ATHARVA AMIT',98.5633908,0,0,NULL),(15,3810,'EN23143546','zzpwkexteq@gmail.com','SALGAOKAR ARJUN HEMANT',98.5069349,0,0,NULL),(16,3820,'EN23103632','hxooabhdmt@gmail.com','DEVASHISH GHODKI',98.503535,0,0,NULL),(17,3997,'EN23138705','pyitezknoe@gmail.com','ADITYA SANJEEVI',98.4460248,0,0,NULL),(18,4105,'EN23222254','siaxykqrsr@gmail.com','UPADHYE SHRAVAN SANTOSH',98.3975197,0,0,NULL),(19,4233,'EN23141632','iowtalermw@gmail.com','DANGE SAURISH JAYANT',98.3419119,0,0,NULL),(20,4408,'EN23171215','yravtpnmhw@gmail.com','VED SHAILESH THOMBRE',98.2807162,0,0,NULL),(21,4857,'EN23230235','hzxplnedoo@gmail.com','TANGADPALLIWAR VAMSHI MALLESH',98.1183995,0,0,NULL),(22,4933,'EN23133620','aivjygdvoy@gmail.com','LONBALE TANMAY SURESH',98.078661,0,0,NULL),(23,5375,'EN23128411','bavjglspfx@gmail.com','BRAHMANKAR SUMEDH MANOJ',97.9332333,0,0,NULL),(24,5646,'EN23209881','zgqmgmkwmp@gmail.com','DHAKNE SATYAM SUDHAKAR',97.818535,0,0,NULL),(25,5675,'EN23228831','hhehjyxhdt@gmail.com','KANDALKAR MOHIT MOHANRAO',97.8134761,0,0,NULL),(26,6097,'EN23185978','nvbhzhkkbk@gmail.com','WARKE TOSHIT DEVENDRA',97.6528296,0,0,NULL),(27,6483,'EN23125946','ftpapysyxz@gmail.com','PANDEY ANJALI SANTOSH',97.5089387,1,1,NULL),(28,6507,'EN23102033','pvgafwusvw@gmail.com','ANANYA DAS',97.497397,0,0,NULL),(29,6510,'EN23141713','ootgfwfvny@gmail.com','MAYUR VILAS LOKHANDE',97.497397,0,0,NULL),(30,6520,'EN23147207','axatxziwdw@gmail.com','DAWANGE SIDDHESH SANJAY',97.497397,0,0,NULL);
/*!40000 ALTER TABLE `registration_manfacturingengineering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_mechanicalengineering`
--

DROP TABLE IF EXISTS `registration_mechanicalengineering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_mechanicalengineering` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank` int NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percentile` double NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_mechani_user_id_ef339683_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_mechanicalengineering`
--

LOCK TABLES `registration_mechanicalengineering` WRITE;
/*!40000 ALTER TABLE `registration_mechanicalengineering` DISABLE KEYS */;
INSERT INTO `registration_mechanicalengineering` VALUES (1,183,'EN23223188','nfuljvsamn@gmail.com','SAHASRABUDDHE MIHIR VINAY',99.8995984,1,1,NULL),(2,360,'EN23140891','plxessjcfj@gmail.com','GUJRATHI SAHIL AKSHAY',99.8281723,1,1,NULL),(3,406,'EN23173180','wqkeqbjrkd@gmail.com','NERLEKAR AKHILESH ROHIT',99.8078888,1,1,NULL),(4,542,'EN23193955','ajaxeckzyp@gmail.com','DHERE ADWAIT DEVENDRA',99.7486622,1,1,NULL),(5,870,'EN23219778','qkiqwfkzhn@gmail.com','PALAV AVANEESH DEEPAK',99.6189907,1,1,NULL),(6,1055,'EN23139025','txsclxatpv@gmail.com','SARTHAK SUHAS DODE',99.5498875,1,1,NULL),(7,1099,'EN23122145','qbsagdbxyo@gmail.com','PARTH RAJESH KALE',99.5259059,1,1,NULL),(8,1150,'EN23219327','qoyfcgodxn@gmail.com','JAIN HEET NILESH',99.5112047,1,1,NULL),(9,1238,'EN23193832','abejmtrjdy@gmail.com','ZILMAR YASH VAIBHAV',99.4854674,1,1,NULL),(10,1367,'EN23193733','gfgstdcrho@gmail.com','NERLEKAR ADITYA SHRIKANT',99.4265515,1,1,NULL),(11,1369,'EN23221104','nggvtatboy@gmail.com','BHAGAT SWARAJ BALASO',99.4263487,0,0,NULL),(12,1420,'EN23110465','hrlvgzbzri@gmail.com','SRUSHTI SURENDRA BAKARE',99.4148537,0,0,NULL),(13,1457,'EN23174117','yaeybydowo@gmail.com','DESHPANDE OJAS SHRINIWAS',99.3979757,0,0,NULL),(14,1482,'EN23104536','mhmirpvuld@gmail.com','BONDE KARAN GIRISH',99.3949157,0,0,NULL),(15,1483,'EN23121959','lzsevblbzu@gmail.com','DESHPANDE SOHAM VIKAS',99.3949157,0,0,NULL),(16,1488,'EN23206488','levorouhqx@gmail.com','CHAFALE SOMENDRA DEVIDAS',99.382716,0,0,NULL),(17,1548,'EN23243660','kbmrgqxmfg@gmail.com','GHODE YOGIRAJ DEEPAK',99.3623544,0,0,NULL),(18,1642,'EN23112879','tyrtpuqmhk@gmail.com','JOSHI SIDDHARTH ADITYA',99.3228582,0,0,NULL),(19,1656,'EN23229050','lyiqxvwmna@gmail.com','AGASHE SUMEDHA SACHIN',99.3210803,0,0,NULL),(20,1658,'EN23158949','hrxadcieno@gmail.com','BHOKARE SUYOG GUNDA',99.3210803,0,0,NULL),(21,1672,'EN23141489','rpapycqqul@gmail.com','MOHAMMED BILAL AZIZ',99.3126473,0,0,NULL),(22,1691,'EN23122483','elpmpesnho@gmail.com','KARANPREET SINGH VIJ',99.3039094,0,0,NULL),(23,1710,'EN23226361','cnsymnkesq@gmail.com','PAWAR VEDANT ASHOK',99.2971888,0,0,NULL),(24,1724,'EN23141546','huwqrewhpf@gmail.com','PEDNEKAR RUHI LAXMESH',99.2929293,0,0,NULL),(25,1728,'EN23197252','ejfupdzzje@gmail.com','JORDAN NATHAN LIONEL',99.2929293,0,0,NULL),(26,1729,'EN23177366','omakgihjgr@gmail.com','DANDE ANISH SHYAM',99.2929293,0,0,NULL),(27,1746,'EN23110652','rfcjffosek@gmail.com','CHAPHALKAR ATHARV SANTOSH',99.2878714,0,0,NULL),(28,1792,'EN23205245','zqeapicmpp@gmail.com','YASH CHITALE',99.2630471,0,0,NULL),(29,1807,'EN23271575','lqinlklwxe@gmail.com','VIVEK MILIND SAWANT',99.2604828,0,0,NULL),(30,1822,'EN23169846','itdugncybh@gmail.com','PATIL SPANDAN MANOJ',99.2562844,0,0,NULL);
/*!40000 ALTER TABLE `registration_mechanicalengineering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortlisting_room`
--

DROP TABLE IF EXISTS `shortlisting_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortlisting_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student1` varchar(10) DEFAULT NULL,
  `student2` varchar(10) DEFAULT NULL,
  `student3` varchar(10) DEFAULT NULL,
  `student4` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortlisting_room`
--

LOCK TABLES `shortlisting_room` WRITE;
/*!40000 ALTER TABLE `shortlisting_room` DISABLE KEYS */;
INSERT INTO `shortlisting_room` VALUES (1,'EN23167975','EN23108587',NULL,NULL);
/*!40000 ALTER TABLE `shortlisting_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortlisting_roommaterequest`
--

DROP TABLE IF EXISTS `shortlisting_roommaterequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortlisting_roommaterequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender_application_id` varchar(10) NOT NULL,
  `receiver_application_id` varchar(10) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortlisting_roommaterequest`
--

LOCK TABLES `shortlisting_roommaterequest` WRITE;
/*!40000 ALTER TABLE `shortlisting_roommaterequest` DISABLE KEYS */;
INSERT INTO `shortlisting_roommaterequest` VALUES (1,'EN23131626','EN23147051',0,'2024-03-28 06:24:27.217214'),(2,'EN23147051','EN23115055',0,'2024-03-28 23:36:57.932455'),(3,'EN23131626','EN23115055',0,'2024-03-28 23:40:23.170525'),(4,'EN23131626','EN23177796',0,'2024-03-28 23:48:01.546056'),(5,'EN23177796','EN23115055',0,'2024-03-29 00:27:21.026052'),(6,'EN23177796','EN23147051',0,'2024-03-29 00:27:40.305032'),(8,'EN23167975','EN23115055',0,'2024-04-01 04:17:32.929058'),(9,'EN23167975','EN23131626',0,'2024-04-01 04:17:37.883836'),(10,'EN23167975','EN23147051',0,'2024-04-01 04:18:44.678701'),(11,'EN23167975','EN23177796',0,'2024-04-01 04:19:25.976445'),(12,'EN23167975','EN23108587',1,'2024-04-01 04:22:27.139191'),(13,'EN23108587','EN23177796',0,'2024-04-01 04:28:53.589034'),(14,'EN23108587','EN23115055',0,'2024-04-01 04:29:06.646045'),(15,'EN23108587','EN23131626',0,'2024-04-01 07:50:27.038912'),(16,'EN23108587','EN23147051',0,'2024-04-01 07:50:31.946289');
/*!40000 ALTER TABLE `shortlisting_roommaterequest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 19:02:26
