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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add civil engineering',7,'add_civilengineering'),(26,'Can change civil engineering',7,'change_civilengineering'),(27,'Can delete civil engineering',7,'delete_civilengineering'),(28,'Can view civil engineering',7,'view_civilengineering'),(29,'Can add electrical engineering',8,'add_electricalengineering'),(30,'Can change electrical engineering',8,'change_electricalengineering'),(31,'Can delete electrical engineering',8,'delete_electricalengineering'),(32,'Can view electrical engineering',8,'view_electricalengineering'),(33,'Can add computer engineering',9,'add_computerengineering'),(34,'Can change computer engineering',9,'change_computerengineering'),(35,'Can delete computer engineering',9,'delete_computerengineering'),(36,'Can view computer engineering',9,'view_computerengineering'),(37,'Can add instrumentation engineering',10,'add_instrumentationengineering'),(38,'Can change instrumentation engineering',10,'change_instrumentationengineering'),(39,'Can delete instrumentation engineering',10,'delete_instrumentationengineering'),(40,'Can view instrumentation engineering',10,'view_instrumentationengineering'),(41,'Can add manfacturing engineering',11,'add_manfacturingengineering'),(42,'Can change manfacturing engineering',11,'change_manfacturingengineering'),(43,'Can delete manfacturing engineering',11,'delete_manfacturingengineering'),(44,'Can view manfacturing engineering',11,'view_manfacturingengineering'),(45,'Can add mechanical engineering',12,'add_mechanicalengineering'),(46,'Can change mechanical engineering',12,'change_mechanicalengineering'),(47,'Can delete mechanical engineering',12,'delete_mechanicalengineering'),(48,'Can view mechanical engineering',12,'view_mechanicalengineering');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'registration','civilengineering'),(9,'registration','computerengineering'),(8,'registration','electricalengineering'),(10,'registration','instrumentationengineering'),(11,'registration','manfacturingengineering'),(12,'registration','mechanicalengineering'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-03-04 11:24:08.205758'),(2,'auth','0001_initial','2024-03-04 11:24:09.119986'),(3,'admin','0001_initial','2024-03-04 11:24:09.440279'),(4,'admin','0002_logentry_remove_auto_add','2024-03-04 11:24:09.448802'),(5,'admin','0003_logentry_add_action_flag_choices','2024-03-04 11:24:09.454822'),(6,'contenttypes','0002_remove_content_type_name','2024-03-04 11:24:09.655988'),(7,'auth','0002_alter_permission_name_max_length','2024-03-04 11:24:09.730197'),(8,'auth','0003_alter_user_email_max_length','2024-03-04 11:24:09.751221'),(9,'auth','0004_alter_user_username_opts','2024-03-04 11:24:09.758547'),(10,'auth','0005_alter_user_last_login_null','2024-03-04 11:24:09.811716'),(11,'auth','0006_require_contenttypes_0002','2024-03-04 11:24:09.813716'),(12,'auth','0007_alter_validators_add_error_messages','2024-03-04 11:24:09.820653'),(13,'auth','0008_alter_user_username_max_length','2024-03-04 11:24:09.892899'),(14,'auth','0009_alter_user_last_name_max_length','2024-03-04 11:24:09.966910'),(15,'auth','0010_alter_group_name_max_length','2024-03-04 11:24:10.001076'),(16,'auth','0011_update_proxy_permissions','2024-03-04 11:24:10.014381'),(17,'auth','0012_alter_user_first_name_max_length','2024-03-04 11:24:10.136748'),(18,'registration','0001_initial','2024-03-04 11:24:10.227261'),(19,'registration','0002_delete_customuser','2024-03-04 11:24:10.243232'),(20,'registration','0003_initial','2024-03-04 11:24:10.267828'),(21,'registration','0004_studentsdata_delete_hey','2024-03-04 11:24:10.306510'),(22,'registration','0005_data_delete_studentsdata','2024-03-04 11:24:10.390701'),(23,'registration','0006_remove_data_application_id_remove_data_email_id_and_more','2024-03-04 11:24:10.459354'),(24,'registration','0007_delete_data','2024-03-04 11:24:10.476916'),(25,'sessions','0001_initial','2024-03-04 11:24:10.615462'),(26,'registration','0008_initial','2024-03-04 12:50:06.360403'),(27,'registration','0009_electricalengineering_delete_civilengineering','2024-03-04 13:13:27.912428'),(28,'registration','0010_civilengineering','2024-03-04 13:13:27.927978'),(29,'registration','0011_computerengineering_instrumentationengineering_and_more','2024-03-04 13:19:15.484317'),(30,'registration','0012_delete_civilengineering','2024-03-04 16:21:56.185679'),(31,'registration','0013_civilengineering','2024-03-04 16:22:28.526402');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
  `gender` varchar(10) NOT NULL,
  `percentile` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_civilengineering`
--

LOCK TABLES `registration_civilengineering` WRITE;
/*!40000 ALTER TABLE `registration_civilengineering` DISABLE KEYS */;
INSERT INTO `registration_civilengineering` VALUES (1,1428,'EN23185238','fbjznsfxky@gmail.com','KADAM ANISH ANIL','M',99.411404),(2,1940,'EN23223626','szgozxefgj@gmail.com','PATIL ARNAV AJAY','M',99.2111179),(3,2774,'EN23149998','mswupjxynd@gmail.com','SURYAWANSHI SHIVRAJ SANJAY','M',98.8972243),(4,2941,'EN23173012','cdmlhbpiin@gmail.com','LANJEWAR SAHIL VINOD','M',98.8527647),(5,3272,'EN23217414','ythejtkkdk@gmail.com','AASHVARDHAN SINGH CHAUHAN','M',98.7149343),(6,3301,'EN23145658','miqfpakxqk@gmail.com','DEOGHARE VEDANT RAKESH','M',98.7018851),(7,3396,'EN23173586','djootfvsmm@gmail.com','ANSHUMAN SARANG PATIL','M',98.6673674),(8,3422,'EN23126225','qsgvnmaiwq@gmail.com','OZA OM SUNIL','M',98.6614529),(9,3690,'EN23215591','jrkhuuzeol@gmail.com','PATIL PIYUSH VIJAY','M',98.5636938),(10,3930,'EN23213221','flojewhzde@gmail.com','BHAVESH KAPURE','M',98.4796982),(11,3935,'EN23234117','foalgrhtop@gmail.com','NEHARKAR HARSHAL PREMCHAND','M',98.4796982),(12,3990,'EN23160416','gsimassulr@gmail.com','PAWAR SAIRAJ SANTOSH','M',98.4546548),(13,4102,'EN23112605','otwgsqxcwb@gmail.com','MUSALE HIMALAY KISHOR','M',98.3975197),(14,4172,'EN23116857','itlplbgkff@gmail.com','CHITTORA RITESH PURUSHOTTAM','M',98.3772737),(15,4191,'EN23111306','xzaagvwtlh@gmail.com','TAPKIR VEDANT SANDEEP','M',98.3681757),(16,4362,'EN23214726','ahzxohnwrv@gmail.com','SHAURYEARAJ YUVRAJ NEEMA KUMAR','M',98.2961113),(17,4654,'EN23163281','blkttmeoks@gmail.com','DHAGE ATHARV RAMESH','M',98.192048),(18,4676,'EN23183634','yylsxsrlfz@gmail.com','KEKADE SNEHIT MANOJ','M',98.1917154),(19,4959,'EN23110896','hgescnmboq@gmail.com','CHANAKYA NAVGHARE','M',98.0761344),(20,4998,'EN23129839','xkigvjobuo@gmail.com','ANJALI JADHAV','F',98.0707133),(21,5046,'EN23168100','nwijxjhlqr@gmail.com','WASADE UTKARSH JITENDRA','M',98.0592365),(22,5168,'EN23146388','cckbxodnig@gmail.com','VIBHANDIK KAUSTUBH SANJAY','M',98.0055132),(23,5340,'EN23134835','ipegcciqie@gmail.com','NIRMIT DHARMALE','M',97.9358267),(24,5600,'EN23171272','nuqrkxtdbq@gmail.com','RATHI PRANJAL SANTOSH','F',97.8417807),(25,5691,'EN23201433','bejzvxarer@gmail.com','KOLHE HARIDARSHAN KAILAS','M',97.7965436),(26,5736,'EN23116852','nvqnylgalc@gmail.com','KAKADE SAMEERA SATISH','F',97.7845902),(27,5864,'EN23137499','zqufknrnbi@gmail.com','RITISHAA ANAND','F',97.7443048),(28,6348,'EN23217922','ungfleqjzd@gmail.com','PATIL RASHIKA PRASHANT','F',97.5524607),(29,6423,'EN23223671','spgfemjrcq@gmail.com','GHULE ATHARVA DILIPKUMAR','M',97.5196409),(30,6592,'EN23165665','spimjmcgxk@gmail.com','PADULKAR SHIRISH SUNIL','M',97.4823503);
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
  `gender` varchar(10) NOT NULL,
  `percentile` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_computerengineering`
--

LOCK TABLES `registration_computerengineering` WRITE;
/*!40000 ALTER TABLE `registration_computerengineering` DISABLE KEYS */;
INSERT INTO `registration_computerengineering` VALUES (1,19,'EN23147051','nzgkuntxmr@gmail.com','MEMON SAHIL SOHAIL SALIM','M',99.9918923),(2,20,'EN23131626','adwcfxozse@gmail.com','DUDUSKAR VEDANT MANOJ','M',99.9918251),(3,22,'EN23115055','mdaeepkbco@gmail.com','BORKAR TANISHQ NILESH','M',99.9887938),(4,25,'EN23177796','xpitjujrbz@gmail.com','ARYAN ARUN MEHTA','M',99.9882168),(5,27,'EN23199748','jydhdhbohz@gmail.com','ANUPRIYA KARN','F',99.9878385),(6,29,'EN23122395','flxoerlcmv@gmail.com','GODASE ADITYA VASANT','M',99.9849962),(7,34,'EN23167975','spqszkodsu@gmail.com','PHULE ANJALI RAVI','F',99.9837847),(8,45,'EN23108587','bhldmocuki@gmail.com','DIGHE SAHIL ROHIDAS','M',99.97397),(9,46,'EN23127902','ztbzhxpxye@gmail.com','ABHISHEK ABHAY SINHA','M',99.9738523),(10,59,'EN23118507','ppgndsupyd@gmail.com','KADAM DISHA SUHAS','F',99.9663815),(11,64,'EN23141488','htvwkvcizz@gmail.com','DEODHAR ALHAD KAUSTUBH','M',99.9623735),(12,73,'EN23187710','hakdlktfpp@gmail.com','PATIL BHAGYASHREE RAMDAS','F',99.9587397),(13,84,'EN23158013','gxmfmcomff@gmail.com','SATHAYE AKSHAY SIDDHARTH','M',99.9510855),(14,92,'EN23177806','ddohcrobir@gmail.com','SAGARE MAYURESH RAVINDRA','M',99.9476244),(15,94,'EN23105417','utnvpebebc@gmail.com','JYOTIKA SHARAN','F',99.9473605),(16,105,'EN23141717','pctjlfvqji@gmail.com','INGLE AYUSH BHASKAR','M',99.9410632),(17,108,'EN23131436','nzswbcwywz@gmail.com','NINAD JAYANT SONKUSARE','M',99.9405028),(18,118,'EN23104499','eeowsgjfoc@gmail.com','AMAN BIPIN MORGHADE','M',99.9324831),(19,123,'EN23117272','siopnjwpqz@gmail.com','RIYA ASHUTOSH KULKARNI','F',99.9323206),(20,130,'EN23175735','mnmansbpcz@gmail.com','MOGHE GARGI MANISH','F',99.9285096),(21,139,'EN23130817','piyvgstozc@gmail.com','KARAD TANMAY KANTILAL','M',99.9214454),(22,146,'EN23194619','mttntltcuk@gmail.com','CHAVAN ROHIT SARJERAO','M',99.9176955),(23,147,'EN23176826','nvcrzmrkyy@gmail.com','PAWAR SIDDHI VISHWAMBHAR','F',99.9176955),(24,154,'EN23145959','xypcerotnw@gmail.com','DAVHALE ANSH PRADIP','M',99.9172217),(25,165,'EN23159348','uwsvctewqc@gmail.com','URKUNDE MOHIT BHASKAR','M',99.9102132),(26,179,'EN23129264','weajvhgwpg@gmail.com','DESHMUKH SHARDUL KIRAN','M',99.9018068),(27,180,'EN23123721','fjlzojmgxv@gmail.com','PATIL PARTH SUNIL','M',99.9018068),(28,181,'EN23183380','kltojiatsq@gmail.com','BHOSALE YASHWANT CHANDRAKANT','M',99.901772),(29,182,'EN23210714','bjfadykyhh@gmail.com','ROKADE RITESH DHANANJAY','M',99.8995984),(30,190,'EN23140670','hkxtpywdxc@gmail.com','MANE HARSHWARDHAN MANGESH','M',99.8954092);
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
  `gender` varchar(10) NOT NULL,
  `percentile` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_electricalengineering`
--

LOCK TABLES `registration_electricalengineering` WRITE;
/*!40000 ALTER TABLE `registration_electricalengineering` DISABLE KEYS */;
INSERT INTO `registration_electricalengineering` VALUES (1,690,'EN23224561','xobdrcgbkj@gmail.com','ATHARVA PRASHANT NIJASURE','M',99.6868126),(2,729,'EN23118519','rxcehmdghn@gmail.com','HARSHIT MISRA','M',99.6688866),(3,758,'EN23113538','wrvdcvvtzh@gmail.com','AARYA AJEET MAJALI','F',99.6581667),(4,787,'EN23218171','doazflyfhl@gmail.com','MANDAVKAR MIHIR MADHUKAR','M',99.6503234),(5,898,'EN23125430','cfmuhmeibe@gmail.com','KALE SHREYASH SHYAMRAO','M',99.6032993),(6,906,'EN23251349','zhzfffotey@gmail.com','UTEKAR OM VIJAY','M',99.6021122),(7,932,'EN23139345','yorwvgeqcz@gmail.com','NISHANT PRADHAN','M',99.5953403),(8,940,'EN23122501','jkdhdkwtsn@gmail.com','SHRUSHTI SANJAY THAKARE','F',99.592843),(9,976,'EN23195901','eauieazvxr@gmail.com','SARAF ANIRUDDHA ADITYA','M',99.5743473),(10,1018,'EN23187634','wifmmhyvnq@gmail.com','CHITNIS RAJDEEP HIMANSHU','M',99.5561665),(11,1040,'EN23130973','fvtabmyegd@gmail.com','MAHAJAN VEDASHREE VINAYAK','F',99.5500243),(12,1044,'EN23116801','xyynvlgnam@gmail.com','PRANAV PRASHANT NANKAR','M',99.5500243),(13,1173,'EN23199116','crcvlcmglt@gmail.com','CHAVAN PRATIK PANDURANG','M',99.5017105),(14,1177,'EN23192150','gujzvczhng@gmail.com','KULKARNI ASHUTOSH SHRIPAD','M',99.5017105),(15,1202,'EN23139917','kfmlqdfjkv@gmail.com','PHAPALE SAIDEEP SANTOSH','M',99.492042),(16,1242,'EN23199556','xuzhljieii@gmail.com','SONTAKKE RUJUTA VIJAYANAND','F',99.4725028),(17,1249,'EN23198333','uvfxsrgziw@gmail.com','DESHMUKH MANAS AMOL','M',99.469569),(18,1304,'EN23149304','jbvlfgaeve@gmail.com','KHANDAIT KARTIK NITYANAND','M',99.4594392),(19,1390,'EN23230282','dtoraykixj@gmail.com','KANIRE PRANAV DIPAK','M',99.4199018),(20,1417,'EN23137160','dhmlvzhsgf@gmail.com','TONDGAONKAR ROCHANA MAHESH','F',99.4148537),(21,1422,'EN23146843','aqyubabtti@gmail.com','SHELAR ARCHIT SANTOSH','M',99.4148537),(22,1435,'EN23126231','lnawoghixi@gmail.com','LAVISH ISHWAR PATIL','M',99.4059257),(23,1450,'EN23110431','huntduxgxw@gmail.com','KSHIRSAGAR PRATIK KEDARNATH','M',99.4029851),(24,1456,'EN23227915','kwqkkkxutn@gmail.com','ARYA SHAILESH KARANJKAR','M',99.3979757),(25,1628,'EN23174014','fgmepftmrl@gmail.com','JADHAO SIYA SANJAY','F',99.3276306),(26,1681,'EN23203593','swfnezvwfp@gmail.com','AMBADKAR ISHWARI DNYANESHWAR','F',99.3092834),(27,1726,'EN23150163','dejcapjbwq@gmail.com','BARUDWALE SNEHA PRAVIN','F',99.2929293),(28,1808,'EN23169969','yudfswaguk@gmail.com','DHAVANE GOURAV GURULING','M',99.2604828),(29,2038,'EN23147290','zadnwvcoqz@gmail.com','DHARMADHIKARI ASMI SUHAS','F',99.1702432),(30,2103,'EN23143431','cmdamwvnha@gmail.com','VAIDYA DEEP PREMNARAYAN','M',99.1558828);
/*!40000 ALTER TABLE `registration_electricalengineering` ENABLE KEYS */;
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
  `gender` varchar(10) NOT NULL,
  `percentile` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_instrumentationengineering`
--

LOCK TABLES `registration_instrumentationengineering` WRITE;
/*!40000 ALTER TABLE `registration_instrumentationengineering` DISABLE KEYS */;
INSERT INTO `registration_instrumentationengineering` VALUES (1,1147,'EN23127178','oqgdrstffa@gmail.com','MIRASHI KARTIK ROHIT','M',99.5112047),(2,1318,'EN23115961','pipmtrrhnc@gmail.com','VISPUTE HARDIK KAILAS','M',99.4425739),(3,1382,'EN23141780','ttzpnypkjw@gmail.com','JOSHI NIHAR ASHWIN','M',99.4219002),(4,1689,'EN23159242','pfezlvqalb@gmail.com','KUMBHARKAR SIDDHARTH SANJAY','M',99.3039094),(5,1700,'EN23117638','cwdykvemzk@gmail.com','TIWARI ADITYA SUNIL','M',99.3010423),(6,1734,'EN23212036','xgupjmcmsr@gmail.com','HARKARE SHIVSAMB MANGALKUMAR','M',99.2878714),(7,1775,'EN23100634','taxadhhsvr@gmail.com','GAURANSH KUMAR','M',99.27243),(8,1789,'EN23102354','jrpitqaenk@gmail.com','AWATE HRUSHIKESH GAJANAN','M',99.2630471),(9,2015,'EN23141396','djyrxjahla@gmail.com','MUNJAL AAYUSH RAMESH','M',99.1827433),(10,2089,'EN23121213','jzlqporshk@gmail.com','ARDHAPURKAR ISHAN RAJESH','M',99.1633936),(11,2161,'EN23156717','fjfozddsjm@gmail.com','KINAGE ATHARVA MILIND','M',99.1238065),(12,2332,'EN23106492','pfpryqawma@gmail.com','MAYEKAR AARUSHI MANDAR','F',99.0609406),(13,2357,'EN23136984','lutzallaiu@gmail.com','BHUMI ANIL DAVE','F',99.0554565),(14,2377,'EN23143357','qmfyuhylmt@gmail.com','MOHOKAR RAM SAMEER','M',99.0540185),(15,2543,'EN23168053','gqlgdjznty@gmail.com','KEVALINA BHATTACHARYYA','F',98.9944819),(16,2602,'EN23189943','dfahwitrnu@gmail.com','NAGARKAR APURVAA SHAILESH','F',98.9743798),(17,2812,'EN23116034','gtnzyjcdln@gmail.com','AMEYA DUSANE','M',98.8892492),(18,5444,'EN23130897','dbnqvjjmzx@gmail.com','GHULE KHUSHBOO TUKARAM','F',97.8929149),(19,5493,'EN23176196','twembhrliy@gmail.com','GHUGE ROHAN DINESH','M',97.8717367),(20,5975,'EN23137559','ipusddzglv@gmail.com','NALLA KEITH MESSAICH SUMANT','M',97.6944816),(21,6509,'EN23109373','ojdbfqqgyg@gmail.com','ANUSHREE VITTHAL KOTHE','F',97.497397),(22,8931,'EN23115873','quzjsquuox@gmail.com','GAJBHIYE SAJAG JEEVAK','M',96.5408332),(23,9800,'EN23123342','njacyyctyt@gmail.com','MANUSHREE SONAWANE','F',96.207802),(24,10944,'EN23163825','kngnfffrgi@gmail.com','JADHAV SMITESH SANDEEP','M',95.740678),(25,14740,'EN23138822','beypgyszqb@gmail.com','SHINDE ANUSHKA SATISH','F',94.1664477),(26,27542,'EN23184708','zvaoknkuos@gmail.com','YASH DEEPAK ZENDE','M',88.7549097),(27,33664,'EN23221394','gtjqoqccxv@gmail.com','ILPATE VED MAHENDRA','M',86.0518493),(28,48801,'EN23246109','xweoxzulys@gmail.com','PADAVI AVANI HIRAJI','F',79.4628516),(29,79044,'EN23150533','crhsbwjpgm@gmail.com','JOSHI CHANDRASHEKHAR VIKASRAO','M',62.7898492),(30,136522,'EN23110125','zxyfajacpg@gmail.com','HARSH NAMDEO CHAVAN','M',11.2906846);
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
  `gender` varchar(10) NOT NULL,
  `percentile` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_manfacturingengineering`
--

LOCK TABLES `registration_manfacturingengineering` WRITE;
/*!40000 ALTER TABLE `registration_manfacturingengineering` DISABLE KEYS */;
INSERT INTO `registration_manfacturingengineering` VALUES (1,2488,'EN23174985','wjekctsyvu@gmail.com','POTDAR RAJAS ABHAY','M',99.0182954),(2,2532,'EN23113653','eoefvhaobt@gmail.com','RAY SHUBHAM NAVIN','M',98.9989167),(3,2565,'EN23180235','incvgyapsq@gmail.com','NASERI CHIRAG AMIT','M',98.9936401),(4,2653,'EN23123728','kluevsslqi@gmail.com','ANGRE AARY SANJAY','M',98.9502201),(5,2660,'EN23149014','vgrqinngzt@gmail.com','BAMISHTE APOORV AMOL','M',98.9495197),(6,2743,'EN23126739','tdsaxpkyyr@gmail.com','HARNE NIDHISH KSHITIJ','M',98.9155632),(7,2811,'EN23105613','rgrhpkhgyv@gmail.com','VEDANT SONAWANE','M',98.8892492),(8,2985,'EN23111226','wujjkgopkb@gmail.com','DANDEKAR AMEY VISHWAS','M',98.8256088),(9,3152,'EN23163337','efuujyvezq@gmail.com','GHOGARE SAMARTH SUGRIV','M',98.7654321),(10,3394,'EN23177423','ajwsuglxic@gmail.com','KULKARNI PRANAV ASHOK','M',98.6673674),(11,3480,'EN23186609','lbwfvpzsmt@gmail.com','GOVILKAR CHINMAY RUTURAJ','M',98.6419653),(12,3524,'EN23153487','esucoqjvkb@gmail.com','YASH SHRIVASTAVA','M',98.6179074),(13,3610,'EN23182700','qnvytktgyq@gmail.com','THITE ANURAG DEEPAK','M',98.5811578),(14,3711,'EN23200672','pjiigdnvav@gmail.com','BEDARKAR ATHARVA AMIT','M',98.5633908),(15,3810,'EN23143546','zzpwkexteq@gmail.com','SALGAOKAR ARJUN HEMANT','M',98.5069349),(16,3820,'EN23103632','hxooabhdmt@gmail.com','DEVASHISH GHODKI','M',98.503535),(17,3997,'EN23138705','pyitezknoe@gmail.com','ADITYA SANJEEVI','M',98.4460248),(18,4105,'EN23222254','siaxykqrsr@gmail.com','UPADHYE SHRAVAN SANTOSH','M',98.3975197),(19,4233,'EN23141632','iowtalermw@gmail.com','DANGE SAURISH JAYANT','M',98.3419119),(20,4408,'EN23171215','yravtpnmhw@gmail.com','VED SHAILESH THOMBRE','M',98.2807162),(21,4857,'EN23230235','hzxplnedoo@gmail.com','TANGADPALLIWAR VAMSHI MALLESH','M',98.1183995),(22,4933,'EN23133620','aivjygdvoy@gmail.com','LONBALE TANMAY SURESH','M',98.078661),(23,5375,'EN23128411','bavjglspfx@gmail.com','BRAHMANKAR SUMEDH MANOJ','M',97.9332333),(24,5646,'EN23209881','zgqmgmkwmp@gmail.com','DHAKNE SATYAM SUDHAKAR','M',97.818535),(25,5675,'EN23228831','hhehjyxhdt@gmail.com','KANDALKAR MOHIT MOHANRAO','M',97.8134761),(26,6097,'EN23185978','nvbhzhkkbk@gmail.com','WARKE TOSHIT DEVENDRA','M',97.6528296),(27,6483,'EN23125946','ftpapysyxz@gmail.com','PANDEY ANJALI SANTOSH','F',97.5089387),(28,6507,'EN23102033','pvgafwusvw@gmail.com','ANANYA DAS','F',97.497397),(29,6510,'EN23141713','ootgfwfvny@gmail.com','MAYUR VILAS LOKHANDE','M',97.497397),(30,6520,'EN23147207','axatxziwdw@gmail.com','DAWANGE SIDDHESH SANJAY','M',97.497397);
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
  `gender` varchar(10) NOT NULL,
  `percentile` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_mechanicalengineering`
--

LOCK TABLES `registration_mechanicalengineering` WRITE;
/*!40000 ALTER TABLE `registration_mechanicalengineering` DISABLE KEYS */;
INSERT INTO `registration_mechanicalengineering` VALUES (1,183,'EN23223188','nfuljvsamn@gmail.com','SAHASRABUDDHE MIHIR VINAY','M',99.8995984),(2,360,'EN23140891','plxessjcfj@gmail.com','GUJRATHI SAHIL AKSHAY','M',99.8281723),(3,406,'EN23173180','wqkeqbjrkd@gmail.com','NERLEKAR AKHILESH ROHIT','M',99.8078888),(4,542,'EN23193955','ajaxeckzyp@gmail.com','DHERE ADWAIT DEVENDRA','M',99.7486622),(5,870,'EN23219778','qkiqwfkzhn@gmail.com','PALAV AVANEESH DEEPAK','M',99.6189907),(6,1055,'EN23139025','txsclxatpv@gmail.com','SARTHAK SUHAS DODE','M',99.5498875),(7,1099,'EN23122145','qbsagdbxyo@gmail.com','PARTH RAJESH KALE','M',99.5259059),(8,1150,'EN23219327','qoyfcgodxn@gmail.com','JAIN HEET NILESH','M',99.5112047),(9,1238,'EN23193832','abejmtrjdy@gmail.com','ZILMAR YASH VAIBHAV','M',99.4854674),(10,1367,'EN23193733','gfgstdcrho@gmail.com','NERLEKAR ADITYA SHRIKANT','M',99.4265515),(11,1369,'EN23221104','nggvtatboy@gmail.com','BHAGAT SWARAJ BALASO','M',99.4263487),(12,1420,'EN23110465','hrlvgzbzri@gmail.com','SRUSHTI SURENDRA BAKARE','F',99.4148537),(13,1457,'EN23174117','yaeybydowo@gmail.com','DESHPANDE OJAS SHRINIWAS','M',99.3979757),(14,1482,'EN23104536','mhmirpvuld@gmail.com','BONDE KARAN GIRISH','M',99.3949157),(15,1483,'EN23121959','lzsevblbzu@gmail.com','DESHPANDE SOHAM VIKAS','M',99.3949157),(16,1488,'EN23206488','levorouhqx@gmail.com','CHAFALE SOMENDRA DEVIDAS','M',99.382716),(17,1548,'EN23243660','kbmrgqxmfg@gmail.com','GHODE YOGIRAJ DEEPAK','M',99.3623544),(18,1642,'EN23112879','tyrtpuqmhk@gmail.com','JOSHI SIDDHARTH ADITYA','M',99.3228582),(19,1656,'EN23229050','lyiqxvwmna@gmail.com','AGASHE SUMEDHA SACHIN','F',99.3210803),(20,1658,'EN23158949','hrxadcieno@gmail.com','BHOKARE SUYOG GUNDA','M',99.3210803),(21,1672,'EN23141489','rpapycqqul@gmail.com','MOHAMMED BILAL AZIZ','M',99.3126473),(22,1691,'EN23122483','elpmpesnho@gmail.com','KARANPREET SINGH VIJ','M',99.3039094),(23,1710,'EN23226361','cnsymnkesq@gmail.com','PAWAR VEDANT ASHOK','M',99.2971888),(24,1724,'EN23141546','huwqrewhpf@gmail.com','PEDNEKAR RUHI LAXMESH','F',99.2929293),(25,1728,'EN23197252','ejfupdzzje@gmail.com','JORDAN NATHAN LIONEL','M',99.2929293),(26,1729,'EN23177366','omakgihjgr@gmail.com','DANDE ANISH SHYAM','M',99.2929293),(27,1746,'EN23110652','rfcjffosek@gmail.com','CHAPHALKAR ATHARV SANTOSH','M',99.2878714),(28,1792,'EN23205245','zqeapicmpp@gmail.com','YASH CHITALE','M',99.2630471),(29,1807,'EN23271575','lqinlklwxe@gmail.com','VIVEK MILIND SAWANT','M',99.2604828),(30,1822,'EN23169846','itdugncybh@gmail.com','PATIL SPANDAN MANOJ','M',99.2562844);
/*!40000 ALTER TABLE `registration_mechanicalengineering` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-04 22:40:14
