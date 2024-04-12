-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
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
-- Table structure for table `Amenities_attendance`
--

DROP TABLE IF EXISTS `Amenities_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amenities_attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `date_of_leave` varchar(20) NOT NULL,
  `is_attending_morning` tinyint(1) NOT NULL,
  `is_attending_night` tinyint(1) NOT NULL,
  `is_penalty` tinyint(1) NOT NULL,
  `is_penalty_morning` tinyint(1) NOT NULL,
  `is_penalty_night` tinyint(1) NOT NULL,
  `month` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Amenities_attendance_user_id_f375858a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Amenities_attendance_user_id_f375858a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amenities_attendance`
--

LOCK TABLES `Amenities_attendance` WRITE;
/*!40000 ALTER TABLE `Amenities_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Amenities_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Amenities_meal`
--

DROP TABLE IF EXISTS `Amenities_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amenities_meal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `day_of_week` varchar(10) NOT NULL,
  `morning_meal_name` varchar(100) NOT NULL,
  `dinner_meal_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amenities_meal`
--

LOCK TABLES `Amenities_meal` WRITE;
/*!40000 ALTER TABLE `Amenities_meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Amenities_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Amenities_messbills`
--

DROP TABLE IF EXISTS `Amenities_messbills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amenities_messbills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `month` int NOT NULL,
  `bill_status_is_paid` tinyint(1) NOT NULL,
  `bill_amount` int NOT NULL,
  `month_name` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Amenities_messbills_user_id_527acc84_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Amenities_messbills_user_id_527acc84_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amenities_messbills`
--

LOCK TABLES `Amenities_messbills` WRITE;
/*!40000 ALTER TABLE `Amenities_messbills` DISABLE KEYS */;
/*!40000 ALTER TABLE `Amenities_messbills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminrole_checkinout`
--

DROP TABLE IF EXISTS `adminrole_checkinout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminrole_checkinout` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mis` int NOT NULL,
  `year` varchar(100) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `check_in_time` datetime(6) DEFAULT NULL,
  `check_out_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminrole_checkinout`
--

LOCK TABLES `adminrole_checkinout` WRITE;
/*!40000 ALTER TABLE `adminrole_checkinout` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminrole_checkinout` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Admin'),(7,'clinic'),(4,'inventory'),(5,'laundry'),(6,'mess'),(2,'Student'),(3,'warden');
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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add civil engineering',7,'add_civilengineering'),(26,'Can change civil engineering',7,'change_civilengineering'),(27,'Can delete civil engineering',7,'delete_civilengineering'),(28,'Can view civil engineering',7,'view_civilengineering'),(29,'Can add electrical engineering',8,'add_electricalengineering'),(30,'Can change electrical engineering',8,'change_electricalengineering'),(31,'Can delete electrical engineering',8,'delete_electricalengineering'),(32,'Can view electrical engineering',8,'view_electricalengineering'),(33,'Can add computer engineering',9,'add_computerengineering'),(34,'Can change computer engineering',9,'change_computerengineering'),(35,'Can delete computer engineering',9,'delete_computerengineering'),(36,'Can view computer engineering',9,'view_computerengineering'),(37,'Can add instrumentation engineering',10,'add_instrumentationengineering'),(38,'Can change instrumentation engineering',10,'change_instrumentationengineering'),(39,'Can delete instrumentation engineering',10,'delete_instrumentationengineering'),(40,'Can view instrumentation engineering',10,'view_instrumentationengineering'),(41,'Can add manfacturing engineering',11,'add_manfacturingengineering'),(42,'Can change manfacturing engineering',11,'change_manfacturingengineering'),(43,'Can delete manfacturing engineering',11,'delete_manfacturingengineering'),(44,'Can view manfacturing engineering',11,'view_manfacturingengineering'),(45,'Can add mechanical engineering',12,'add_mechanicalengineering'),(46,'Can change mechanical engineering',12,'change_mechanicalengineering'),(47,'Can delete mechanical engineering',12,'delete_mechanicalengineering'),(48,'Can view mechanical engineering',12,'view_mechanicalengineering'),(49,'Can add application',13,'add_application'),(50,'Can change application',13,'change_application'),(51,'Can delete application',13,'delete_application'),(52,'Can view application',13,'view_application'),(53,'Can add check in out',14,'add_checkinout'),(54,'Can change check in out',14,'change_checkinout'),(55,'Can delete check in out',14,'delete_checkinout'),(56,'Can view check in out',14,'view_checkinout'),(57,'Can add room',15,'add_room'),(58,'Can change room',15,'change_room'),(59,'Can delete room',15,'delete_room'),(60,'Can view room',15,'view_room'),(61,'Can add roommate request',16,'add_roommaterequest'),(62,'Can change roommate request',16,'change_roommaterequest'),(63,'Can delete roommate request',16,'delete_roommaterequest'),(64,'Can view roommate request',16,'view_roommaterequest'),(65,'Can add first year',17,'add_firstyear'),(66,'Can change first year',17,'change_firstyear'),(67,'Can delete first year',17,'delete_firstyear'),(68,'Can view first year',17,'view_firstyear'),(69,'Can add second year',18,'add_secondyear'),(70,'Can change second year',18,'change_secondyear'),(71,'Can delete second year',18,'delete_secondyear'),(72,'Can view second year',18,'view_secondyear'),(73,'Can add second_ year',19,'add_second_year'),(74,'Can change second_ year',19,'change_second_year'),(75,'Can delete second_ year',19,'delete_second_year'),(76,'Can view second_ year',19,'view_second_year'),(77,'Can add third_ year',20,'add_third_year'),(78,'Can change third_ year',20,'change_third_year'),(79,'Can delete third_ year',20,'delete_third_year'),(80,'Can view third_ year',20,'view_third_year'),(81,'Can add fourth_ year',21,'add_fourth_year'),(82,'Can change fourth_ year',21,'change_fourth_year'),(83,'Can delete fourth_ year',21,'delete_fourth_year'),(84,'Can view fourth_ year',21,'view_fourth_year'),(85,'Can add final year',22,'add_finalyear'),(86,'Can change final year',22,'change_finalyear'),(87,'Can delete final year',22,'delete_finalyear'),(88,'Can view final year',22,'view_finalyear'),(89,'Can add third year',23,'add_thirdyear'),(90,'Can change third year',23,'change_thirdyear'),(91,'Can delete third year',23,'delete_thirdyear'),(92,'Can view third year',23,'view_thirdyear'),(93,'Can add maintenance request',24,'add_maintenancerequest'),(94,'Can change maintenance request',24,'change_maintenancerequest'),(95,'Can delete maintenance request',24,'delete_maintenancerequest'),(96,'Can view maintenance request',24,'view_maintenancerequest'),(97,'Can add maintenance request image',25,'add_maintenancerequestimage'),(98,'Can change maintenance request image',25,'change_maintenancerequestimage'),(99,'Can delete maintenance request image',25,'delete_maintenancerequestimage'),(100,'Can view maintenance request image',25,'view_maintenancerequestimage'),(101,'Can add preference',26,'add_preference'),(102,'Can change preference',26,'change_preference'),(103,'Can delete preference',26,'delete_preference'),(104,'Can view preference',26,'view_preference'),(105,'Can add selected dates',27,'add_selecteddates'),(106,'Can change selected dates',27,'change_selecteddates'),(107,'Can delete selected dates',27,'delete_selecteddates'),(108,'Can view selected dates',27,'view_selecteddates'),(109,'Can add booking',28,'add_booking'),(110,'Can change booking',28,'change_booking'),(111,'Can delete booking',28,'delete_booking'),(112,'Can view booking',28,'view_booking'),(113,'Can add guest_room',29,'add_guest_room'),(114,'Can change guest_room',29,'change_guest_room'),(115,'Can delete guest_room',29,'delete_guest_room'),(116,'Can view guest_room',29,'view_guest_room'),(117,'Can add guest room',30,'add_guestroom'),(118,'Can change guest room',30,'change_guestroom'),(119,'Can delete guest room',30,'delete_guestroom'),(120,'Can view guest room',30,'view_guestroom'),(121,'Can add check in out',31,'add_checkinout'),(122,'Can change check in out',31,'change_checkinout'),(123,'Can delete check in out',31,'delete_checkinout'),(124,'Can view check in out',31,'view_checkinout'),(125,'Can add meal',32,'add_meal'),(126,'Can change meal',32,'change_meal'),(127,'Can delete meal',32,'delete_meal'),(128,'Can view meal',32,'view_meal'),(129,'Can add attendance',33,'add_attendance'),(130,'Can change attendance',33,'change_attendance'),(131,'Can delete attendance',33,'delete_attendance'),(132,'Can view attendance',33,'view_attendance'),(133,'Can add mess bills',34,'add_messbills'),(134,'Can change mess bills',34,'change_messbills'),(135,'Can delete mess bills',34,'delete_messbills'),(136,'Can view mess bills',34,'view_messbills');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$lg88FYIHK325qmYn3qKtHj$JJPG6VLTtbnsRIgzOOtwMOoZtK3G5kH3cVU3ZTR8Iso=','2024-03-05 04:02:45.434630',0,'gundaditya','','','aditya@gmail.com',0,1,'2024-03-05 04:02:17.757003'),(2,'pbkdf2_sha256$720000$c1xUFeJxMzXjhTg3Rg6AGk$kxy5Zh3OTqTp0H2Dtuxf8fju5HdgbO3ulkxQhcSQIHw=','2024-03-05 10:41:33.095148',0,'riteshdav','','','aditya@gmail.com',0,1,'2024-03-05 10:13:55.570353'),(3,'pbkdf2_sha256$720000$VAYMYyth8oRjBx0gGZrlOS$7ZAcb3UiSEMXtZcqSZ4gaInH7LQpHDpU6zoq61KvR7Q=','2024-03-06 12:36:57.242650',0,'jayko@2004','','','aditya@gmail.com',0,1,'2024-03-06 12:36:35.353551'),(4,'pbkdf2_sha256$720000$H4Rd8ORzLXnBQDGz7eKMB1$XKi2e7hZ2lT+M3Uwlf8rfzWUNUrPaJM/5IkLGwghp6E=','2024-03-27 01:52:20.569355',0,'adityagund','','','aditya@gmail.com',0,1,'2024-03-07 11:34:51.995379'),(5,'pbkdf2_sha256$720000$1znVuExbmnrBj0VAfsC2zr$MpEShIyLCCdOaOHQhiY5QpJFcrz9hzFVQ/CUvusq6Jk=','2024-03-28 23:36:16.940597',0,'EN23147051','','','gundaditya014@gmail.com',0,1,'2024-03-27 02:09:19.394270'),(10,'pbkdf2_sha256$720000$WmtnDHJXsZJNFTtv4jq2vK$d9ebMuH1dFjDC6f27CEWxBONJj7MKXGsaYO2L22cqXg=','2024-03-28 23:40:01.215572',0,'EN23131626','','','gundaditya014@gmail.com',0,1,'2024-03-27 19:34:42.803957'),(13,'pbkdf2_sha256$720000$USxp9JyNkt6VmHUfI2DlPE$9W2seHynro4A137n9PNisoF3QrtAAerSgjN3fJvX42U=',NULL,0,'EN23115055','','','gundaditya014@gmail.com',0,1,'2024-03-28 23:35:47.183126'),(16,'pbkdf2_sha256$720000$l6C6P5O4xfg0yDoUQlBkyM$+syPh6JjCDvmWJtna4u1HPVeh1OhWsCzSQupvLcwqD0=','2024-04-02 14:46:32.078895',0,'EN23177796','','','gundaditya014@gmail.com',0,1,'2024-03-28 23:47:22.610955'),(18,'pbkdf2_sha256$720000$l4uWiA2sC2ZFiAoRG2YNKu$xM8cWTzJvjy4Aclk5nUp/HrWmN2JkL6Byvt+Y7qchfQ=','2024-04-01 04:15:11.517385',0,'EN23167975','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-01 04:09:17.750510'),(20,'pbkdf2_sha256$720000$0uQbQW8W8tjmskovPieXzT$cx/uqN8aH+jXCJ4q9sWF/tbP6RyNwKTqLs2uU+d0mlM=','2024-04-01 04:23:45.163928',0,'EN23108587','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-01 04:21:52.235563'),(21,'pbkdf2_sha256$720000$W5oVVBX8Ie7rgQGLmpVlVN$EThphzkRZJMthiDik8fT1cXsnOBYrrJOBr8va55AiJo=',NULL,0,'EN23141717','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-01 04:46:38.753615'),(22,'pbkdf2_sha256$260000$cte7wvs9nwKUovAqB1nHU0$oQVaeihqzxcSdOv90mcakkpYkEZfs3uVXOkgc/WgsQ4=','2024-04-04 13:53:15.437574',0,'EN23185238','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-04 13:52:05.150803'),(23,'pbkdf2_sha256$260000$BLhL9GpgpGIjfCFerjBdAC$0yKI3nUHLXK1zp5/95yvtm69JEp+joMC+fP+uaiGcKY=','2024-04-12 08:52:24.942559',1,'avadhoot','','','',1,1,'2024-04-05 03:57:31.448178'),(24,'pbkdf2_sha256$260000$kuRfGsQzYWUT3rGBsV2fr6$K7wA9pcTyCNuxxmDPCp1h7dgOqcs+4jrZdDWV90ZmIM=','2024-04-12 03:24:10.195300',0,'warden@1','','','abc@gmail.com',0,1,'2024-04-05 03:58:12.317398'),(25,'pbkdf2_sha256$260000$Qq8VI2kx2GY2JFcmKDW9H4$MEPdJT7LGvJO+BKMLwud56wcCZt+TaklEwE8KMYfPwk=','2024-04-12 08:54:44.157805',0,'112101002','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-05 06:06:13.306792'),(26,'pbkdf2_sha256$260000$8eSoPUI2qKXOnIBg8tmqhR$t/l2KI5r/mX6TYO8JHPyaM1EBvYVSzTPgh2p+1jp+NQ=',NULL,0,'112101042','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-06 07:52:05.637889'),(27,'pbkdf2_sha256$260000$3YrjhzQJHYb2WVF0W0Aws2$TASXMbnuq8YEKmXTpRsYUWh5Ht1jKOA7RP8colq4r3Y=','2024-04-11 14:57:50.853752',0,'112101004','','','avadhootsghewade4757@gmail.com',0,1,'2024-04-06 07:56:01.442513'),(28,'pbkdf2_sha256$260000$s6nrut7jvKfW8iMt0rc6nr$gZKF4lzB+cVEu4vPixXasEWCNC9ivSCq305KoNSWOtQ=',NULL,0,'234','','','a@gmail.com',0,1,'2024-04-10 10:53:20.267793'),(31,'pbkdf2_sha256$260000$9ZYtLU4wPaQeg3ju7exq2e$ooKLTNFT5Cxr3z88smlCwLA6hxcVGt14B5hZwNvGa7M=',NULL,0,'daskj','','','jkj@gasj.jslk',0,1,'2024-04-12 06:37:38.055624'),(32,'pbkdf2_sha256$260000$LTFI260tuhSg6Vfi8RFg46$+8Czd7oUC0nFo02eNcyX1KGxVyS+CrLNICkYmuwm96c=','2024-04-12 07:22:37.434678',1,'coepMess@2024','','','',0,1,'2024-04-12 07:00:54.000000'),(33,'pbkdf2_sha256$260000$dKrZjFyc3cgFLU9Wk2kwNL$V3WbSN7LQuuul6Gr151proDuEG6nxeMhhCM6IGOOv5I=','2024-04-12 08:46:54.340905',0,'suyog','','','jasjkf@gklml.com',0,1,'2024-04-12 07:15:18.187800'),(34,'pbkdf2_sha256$260000$sGim1XEn4YgmuJFzFVqBJF$sR11zBRuM4kELErOJO6cQrtszd5K7LUDO3K4zOxQdBk=','2024-04-12 08:54:01.531051',0,'aditya','','','dsfj@gaasdf.com',0,1,'2024-04-12 08:52:48.778235');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,21,2),(2,22,2),(3,24,1),(4,25,2),(5,26,2),(6,27,2),(7,28,1),(10,31,3),(11,33,6),(12,34,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,32,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-12 04:08:05.182018','29','coepMess@2024',1,'[{\"added\": {}}]',4,23),(2,'2024-04-12 04:08:22.005773','29','coepMess@2024',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,23),(3,'2024-04-12 06:25:30.124665','3','warden',1,'[{\"added\": {}}]',3,23),(4,'2024-04-12 06:38:47.729080','4','inventory',1,'[{\"added\": {}}]',3,23),(5,'2024-04-12 06:38:52.187520','5','laundry',1,'[{\"added\": {}}]',3,23),(6,'2024-04-12 06:39:06.867681','6','mess',1,'[{\"added\": {}}]',3,23),(7,'2024-04-12 06:39:17.405354','7','clinic',1,'[{\"added\": {}}]',3,23),(8,'2024-04-12 07:00:55.058043','32','coepMess@2024',1,'[{\"added\": {}}]',4,23),(9,'2024-04-12 07:01:05.760833','32','coepMess@2024',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,23),(10,'2024-04-12 07:03:56.526816','32','coepMess@2024',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,23);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(31,'adminrole','checkinout'),(33,'Amenities','attendance'),(32,'Amenities','meal'),(34,'Amenities','messbills'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(28,'guest','booking'),(29,'guest','guest_room'),(30,'guest','guestroom'),(14,'registration','checkinout'),(7,'registration','civilengineering'),(9,'registration','computerengineering'),(8,'registration','electricalengineering'),(22,'registration','finalyear'),(17,'registration','firstyear'),(21,'registration','fourth_year'),(10,'registration','instrumentationengineering'),(11,'registration','manfacturingengineering'),(12,'registration','mechanicalengineering'),(19,'registration','second_year'),(18,'registration','secondyear'),(27,'registration','selecteddates'),(20,'registration','third_year'),(23,'registration','thirdyear'),(6,'sessions','session'),(13,'shortlisting','application'),(26,'shortlisting','preference'),(15,'shortlisting','room'),(16,'shortlisting','roommaterequest'),(24,'studentrole','maintenancerequest'),(25,'studentrole','maintenancerequestimage');
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-03-04 11:24:08.205758'),(2,'auth','0001_initial','2024-03-04 11:24:09.119986'),(3,'admin','0001_initial','2024-03-04 11:24:09.440279'),(4,'admin','0002_logentry_remove_auto_add','2024-03-04 11:24:09.448802'),(5,'admin','0003_logentry_add_action_flag_choices','2024-03-04 11:24:09.454822'),(6,'contenttypes','0002_remove_content_type_name','2024-03-04 11:24:09.655988'),(7,'auth','0002_alter_permission_name_max_length','2024-03-04 11:24:09.730197'),(8,'auth','0003_alter_user_email_max_length','2024-03-04 11:24:09.751221'),(9,'auth','0004_alter_user_username_opts','2024-03-04 11:24:09.758547'),(10,'auth','0005_alter_user_last_login_null','2024-03-04 11:24:09.811716'),(11,'auth','0006_require_contenttypes_0002','2024-03-04 11:24:09.813716'),(12,'auth','0007_alter_validators_add_error_messages','2024-03-04 11:24:09.820653'),(13,'auth','0008_alter_user_username_max_length','2024-03-04 11:24:09.892899'),(14,'auth','0009_alter_user_last_name_max_length','2024-03-04 11:24:09.966910'),(15,'auth','0010_alter_group_name_max_length','2024-03-04 11:24:10.001076'),(16,'auth','0011_update_proxy_permissions','2024-03-04 11:24:10.014381'),(17,'auth','0012_alter_user_first_name_max_length','2024-03-04 11:24:10.136748'),(18,'registration','0001_initial','2024-03-04 11:24:10.227261'),(19,'registration','0002_delete_customuser','2024-03-04 11:24:10.243232'),(20,'registration','0003_initial','2024-03-04 11:24:10.267828'),(21,'registration','0004_studentsdata_delete_hey','2024-03-04 11:24:10.306510'),(22,'registration','0005_data_delete_studentsdata','2024-03-04 11:24:10.390701'),(23,'registration','0006_remove_data_application_id_remove_data_email_id_and_more','2024-03-04 11:24:10.459354'),(24,'registration','0007_delete_data','2024-03-04 11:24:10.476916'),(25,'sessions','0001_initial','2024-03-04 11:24:10.615462'),(26,'registration','0008_initial','2024-03-04 12:50:06.360403'),(27,'registration','0009_electricalengineering_delete_civilengineering','2024-03-04 13:13:27.912428'),(28,'registration','0010_civilengineering','2024-03-04 13:13:27.927978'),(29,'registration','0011_computerengineering_instrumentationengineering_and_more','2024-03-04 13:19:15.484317'),(30,'registration','0012_delete_civilengineering','2024-03-04 16:21:56.185679'),(31,'registration','0013_civilengineering','2024-03-04 16:22:28.526402'),(32,'registration','0014_civilengineering_verification_status_and_more','2024-03-05 05:20:28.658022'),(33,'shortlisting','0001_initial','2024-03-05 05:20:28.742938'),(34,'shortlisting','0002_rename_application_no_application_application_id','2024-03-05 05:20:28.771636'),(35,'registration','0002_alter_civilengineering_verified','2024-03-12 13:37:59.848115'),(36,'registration','0003_alter_civilengineering_verified','2024-03-12 13:37:59.860504'),(37,'registration','0004_civilengineering_newfield','2024-03-12 13:37:59.895898'),(38,'registration','0005_remove_civilengineering_newfield','2024-03-12 13:37:59.912892'),(39,'registration','0006_auto_20240312_1908','2024-03-12 13:39:02.618396'),(40,'shortlisting','0002_auto_20240312_1908','2024-03-12 13:39:02.627936'),(41,'registration','0014_auto_20240305_2210','2024-03-12 13:41:59.472753'),(42,'registration','0015_auto_20240305_2213','2024-03-12 13:41:59.619771'),(43,'registration','0016_merge_20240312_1911','2024-03-12 13:41:59.625294'),(44,'registration','0017_remove_civilengineering_verification_status_and_more','2024-03-12 13:41:59.789396'),(45,'registration','0016_admin','2024-03-27 01:03:38.846284'),(46,'registration','0017_checkinout_delete_admin','2024-03-27 01:03:38.882851'),(47,'registration','0018_checkinout_mis_checkinout_year_and_more','2024-03-27 01:03:38.944247'),(48,'registration','0019_rename_reson_checkinout_reason','2024-03-27 01:03:38.972307'),(49,'registration','0020_alter_checkinout_check_out_time','2024-03-27 01:03:39.026720'),(50,'registration','0021_alter_checkinout_check_out_time','2024-03-27 01:03:39.031039'),(51,'registration','0022_alter_checkinout_check_out_time','2024-03-27 01:03:39.068057'),(52,'registration','0018_auto_20240323_1759','2024-03-27 01:03:39.755841'),(53,'registration','0023_merge_20240325_1337','2024-03-27 01:03:39.760360'),(54,'registration','0024_alter_checkinout_mis','2024-03-27 01:03:39.766791'),(55,'shortlisting','0003_auto_20240325_1525','2024-03-27 01:03:39.841491'),(56,'registration','0025_firstyear','2024-04-01 10:37:29.385980'),(57,'registration','0026_delete_firstyear','2024-04-01 10:52:17.293009'),(58,'registration','0027_firstyear','2024-04-01 13:15:45.324256'),(59,'registration','0028_secondyear','2024-04-02 05:28:23.866513'),(60,'registration','0028_second_year','2024-04-03 02:59:13.334714'),(61,'registration','0029_third_year','2024-04-03 04:34:30.933227'),(62,'registration','0030_delete_third_year','2024-04-03 04:40:08.459433'),(63,'registration','0031_third_year','2024-04-03 04:40:27.269935'),(64,'registration','0032_delete_third_year','2024-04-03 04:50:54.750945'),(65,'registration','0033_third_year','2024-04-03 04:51:10.707334'),(66,'registration','0034_delete_third_year','2024-04-03 04:53:24.078680'),(67,'registration','0035_third_year','2024-04-03 04:53:33.855289'),(68,'registration','0036_delete_third_year','2024-04-03 04:54:42.964534'),(69,'registration','0037_third_year','2024-04-03 04:54:50.661665'),(70,'registration','0038_delete_third_year','2024-04-03 04:57:01.488050'),(71,'registration','0039_third_year','2024-04-03 04:57:11.370376'),(72,'registration','0040_fourth_year','2024-04-03 12:09:41.807248'),(73,'registration','0041_delete_fourth_year','2024-04-03 12:23:46.761606'),(74,'registration','0042_fourth_year','2024-04-03 12:23:58.965254'),(75,'registration','0025_finalyear_firstyear_secondyear_thirdyear','2024-04-03 20:22:56.275214'),(76,'registration','0026_alter_secondyear_rank','2024-04-04 06:50:17.972097'),(77,'registration','0027_auto_20240404_0653','2024-04-04 06:53:32.865710'),(78,'registration','0028_auto_20240404_1131','2024-04-04 13:33:52.741933'),(79,'shortlisting','0004_auto_20240404_1322','2024-04-04 13:33:52.865147'),(80,'studentrole','0001_initial','2024-04-05 05:41:07.715895'),(81,'studentrole','0002_auto_20240405_1027','2024-04-05 10:27:20.208170'),(82,'studentrole','0003_auto_20240405_1204','2024-04-05 12:04:08.272142'),(83,'studentrole','0004_alter_maintenancerequestimage_image','2024-04-05 12:17:30.883077'),(84,'shortlisting','0005_preference','2024-04-08 10:47:33.389221'),(85,'shortlisting','0006_alter_preference_leader_rank','2024-04-08 14:47:40.124036'),(86,'registration','0029_finalyear_alloted_firstyear_alloted_and_more','2024-04-09 11:55:43.377019'),(87,'registration','0030_remove_finalyear_alloted_remove_firstyear_alloted_and_more','2024-04-09 11:55:43.653315'),(88,'registration','0031_selecteddates','2024-04-09 11:55:43.810233'),(89,'registration','0032_selecteddates_verification_period','2024-04-09 11:55:43.916231'),(90,'shortlisting','0005_room_alloted','2024-04-09 11:55:44.069040'),(91,'shortlisting','0006_remove_room_alloted','2024-04-09 11:55:44.174804'),(92,'shortlisting','0007_merge_20240409_1029','2024-04-09 11:55:44.196403'),(93,'guest','0001_initial','2024-04-09 13:40:38.978099'),(94,'guest','0002_booking_approved','2024-04-10 04:01:51.143425'),(95,'guest','0003_booking_id_proof','2024-04-10 05:08:47.102547'),(96,'guest','0004_alter_booking_id_proof','2024-04-10 09:26:28.036880'),(97,'guest','0005_alter_booking_id_proof','2024-04-10 09:40:50.582491'),(98,'studentrole','0003_alter_maintenancerequest_image','2024-04-10 16:50:29.060894'),(99,'adminrole','0001_initial','2024-04-11 05:00:49.617475'),(100,'registration','0033_delete_checkinout','2024-04-11 05:00:49.687600'),(101,'guest','0006_booking_charges','2024-04-11 09:37:05.502893'),(102,'shortlisting','0008_preference_alloted_room_room_alloted_room','2024-04-12 03:23:40.815202'),(103,'Amenities','0001_initial','2024-04-12 04:00:55.410572'),(104,'registration','0034_auto_20240412_1455','2024-04-12 09:25:53.907416');
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
INSERT INTO `django_session` VALUES ('3jd3utd0oawyifj8uto2a90exsvv23an','.eJxVjEEOwiAQRe_C2hA6UxBcuvcMZBhAqoYmpV0Z7y5NutDte-__t_C0rcVvLS1-iuIiQIvTLwzEz1R3Ex9U77Pkua7LFOSeyMM2eZtjel2P9u-gUCt9zQYdpJwNYlbAaDmeUZFToRNjbXQaiTlS1gA6j2gGwAGpOwp6TOLzBf_sN6E:1rvCgG:dq3K8jjq08QCQuyT8RrD3jeRc79Q-_FS3XGjKLV8W6I','2024-04-26 08:54:44.172091'),('818up88xts2jh5216f82ga9uts7vziku','.eJxVjMsOwiAQAP-FsyE8FqEevfsNZGEXqRqalPZk_HdD0oNeZybzFhH3rca98xpnEhdhvDj9woT5yW0YemC7LzIvbVvnJEciD9vlbSF-XY_2b1Cx1_ENwOyLB6V1Mc5pCwrK2aLKlnHSBqxWmMkkZw0WC5ypKB0YgqFJBfH5AudsN1w:1ruunj:6vjSbFBqggEg6dhP7G76rVph1oBlglY6F2vNxyExud8','2024-04-25 13:49:15.591623'),('8mvyy6e27d3k5i8ihju5wayg7gd0pmqs','.eJxVjMsOwiAQRf-FtSHlDS7d-w1kZgCpGkhKuzL-uzbpQrf3nHNfLMK21riNvMQ5sTOTgZ1-RwR65LaTdId265x6W5cZ-a7wgw5-7Sk_L4f7d1Bh1G-thBJmQvSStPXotQ3OEIjgwBsgYVI2ZCeUinQxAQo6n7QuGUELkJa9P_NaOAY:1rv8DQ:_jisSb97M7KccEZ9ZoAJnwWOhJ5q3o_AL78-oK0MIiw','2024-04-26 04:08:40.590033'),('llfi96c8cikex1t8qao031wped4ltjjg','e30:1rv7L8:aI1SJVIJEP96krAUnckiyclYNlymFeeJzh3gCWg_r_c','2024-04-26 03:12:34.666023'),('meztcagcqdfbr50ike16fi0r7xk4f747','.eJxVjEEOwiAQRe_C2hA6UxBcuvcMZBhAqoYmpV0Z7y5NutDte-__t_C0rcVvLS1-iuIiQIvTLwzEz1R3Ex9U77Pkua7LFOSeyMM2eZtjel2P9u-gUCt9zQYdpJwNYlbAaDmeUZFToRNjbXQaiTlS1gA6j2gGwAGpOwp6TOLzBf_sN6E:1rsypT:arxP2Thwu3-V0w7MIyslm8tAH14ZCZZEPs1RuynqlKQ','2024-04-20 05:43:03.858646'),('n63jwj6j53q5lukqjogl6ubjnm1eu0jk','.eJxVjMsOwiAQRf-FtSHlDS7d-w1kZgCpGkhKuzL-uzbpQrf3nHNfLMK21riNvMQ5sTOTgZ1-RwR65LaTdId265x6W5cZ-a7wgw5-7Sk_L4f7d1Bh1G-thBJmQvSStPXotQ3OEIjgwBsgYVI2ZCeUinQxAQo6n7QuGUELkJa9P_NaOAY:1rv8Ki:j-XsB2q7UXh5WTILp5lOYKh1ykg53tYx9rRsffAZAn0','2024-04-26 04:16:12.360146'),('pcfjs0mi0zh3td1rviwkx5mz9jdwtkc2','.eJxVjDEOAiEQRe9CbQgIDGBp7xnIzICyaiBZdivj3XWTLbT9773_EgnXpaZ1lDlNWZyEMeLwOxLyo7SN5Du2W5fc2zJPJDdF7nTIS8_led7dv4OKo35rYDJeFYUImY8qkCOIMZSrgRwDQyjeuYzGWVDaeWV11KQVsTZg0bJ4fwADwzdv:1rvCMJ:1M8IuFJTRC8aoXu2KndeXmAq59hAiKDtV-UGqJm601g','2024-04-26 08:34:07.981092'),('q9ds9szq1z4tmvhs09s7nvwzhr5xjuo4','e30:1rv7SR:eUu_TVPl3vB2P09OVvuhclPI3PP3SMov8f9P4HetF80','2024-04-26 03:20:07.914292'),('qjef6oqbmoy1le3g3erjjxv0iv76n1o1','.eJxVjEEOwiAQRe_C2hBKhwIu3XsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWGsTpd4xID647SXestyap1XWZo9wVedAury3x83K4fwcFe_nWQJQnopF8coqtVU6jSYMa9cRZgWFnotdMxlmg7LKKAGA90-AzujGK9wcUBjhK:1ruAe4:cndcHWGMNn_IksQLOKTXSHcVUL6Qr6h1eygsVpx0Ptw','2024-04-23 12:32:12.141410'),('vhgzkv54vkfr4xbj35g84unkjuvduv1k','.eJxVjMsOwiAQRf-FtSE8hBlcuu83EGAGqZo2Ke3K-O_apAvd3nPOfYmYtrXFrfMSRxIXob04_Y45lQdPO6F7mm6zLPO0LmOWuyIP2uUwEz-vh_t30FJv39qiOlttA6AOVSmNmE3yxFA1ayK0UHMu4KtRwOhL5uIcJAXG1oDkxPsD6Kw3uw:1rrfPE:HOvR1NmRbl8Sf--_tfno9EwwTAaLRh7fnhHhcQGXsco','2024-04-16 14:46:32.086090'),('wc4bv9ot9c8bbfv0q2yf21uaze6cvuog','.eJxVjDkOwjAUBe_iGlneF0r6nMH63wsOIFuKkwpxdxIpBbRvZt6bBNjWGraRlzAnciVSkcvviBCfuR0kPaDdO429rcuM9FDoSQedesqv2-n-HVQYda-141ZIrxgWZEyAZrZIm3QEYdAa51TEHKMt3DOhLc87Ug6KQS0ZGE8-X-3kN6U:1rvCel:E5f2X2mPbz3XqoqLXZZ85DLuKUGKCoBBtTSNN-U7r78','2024-04-26 08:53:11.703770'),('yna2tg64ka4go3ry3eyw1fxjyfaef5bz','.eJxVjEEOwiAQRe_C2hBKhwIu3XsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWGsTpd4xID647SXestyap1XWZo9wVedAury3x83K4fwcFe_nWQJQnopF8coqtVU6jSYMa9cRZgWFnotdMxlmg7LKKAGA90-AzujGK9wcUBjhK:1ruAkQ:FmUKS6EeifCXCmDJP_K8ExEeyfrN22bWtWdixlhRMpY','2024-04-23 12:38:46.252688');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_booking`
--

DROP TABLE IF EXISTS `guest_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `guest_name` varchar(100) NOT NULL,
  `guest_email` varchar(254) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `id_proof` varchar(100) DEFAULT NULL,
  `charges` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `guest_booking_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `guest_guestroom` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_booking`
--

LOCK TABLES `guest_booking` WRITE;
/*!40000 ALTER TABLE `guest_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_guestroom`
--

DROP TABLE IF EXISTS `guest_guestroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_guestroom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_number` varchar(10) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_guestroom`
--

LOCK TABLES `guest_guestroom` WRITE;
/*!40000 ALTER TABLE `guest_guestroom` DISABLE KEYS */;
INSERT INTO `guest_guestroom` VALUES (7,'21',2),(8,'22',2),(9,'31',3),(10,'32',3),(11,'41',4),(12,'42',4);
/*!40000 ALTER TABLE `guest_guestroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_finalyear`
--

DROP TABLE IF EXISTS `registration_finalyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_finalyear` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rank` double NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  `caste` varchar(10) DEFAULT NULL,
  `payment_done` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_finalyear_user_id_7da64df2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_finalyear`
--

LOCK TABLES `registration_finalyear` WRITE;
/*!40000 ALTER TABLE `registration_finalyear` DISABLE KEYS */;
INSERT INTO `registration_finalyear` VALUES (101,3.16,'111801022','student1_civil_engineering@example.com','HADWE PAYAL RAJESH',0,1,'CivilEngineering',NULL,'OPEN',0),(102,8.11,'112001001','student2_civil_engineering@example.com','AARTI SANJAY GOLANDE',0,1,'CivilEngineering',NULL,'OBC',0),(103,9.39,'112001002','student3_civil_engineering@example.com','AKHILESH VIJAY NIMSADE',0,1,'CivilEngineering',NULL,'EWS',0),(104,6.7,'112001003','student4_civil_engineering@example.com','AMBADE SAMYAK RAJEEV',0,1,'CivilEngineering',NULL,'OPEN',0),(105,8.68,'112001004','student5_civil_engineering@example.com','ARYAN RAHUL RAMTEKE',0,1,'CivilEngineering',NULL,'SC',0),(106,7.59,'112001005','student6_civil_engineering@example.com','ASWALE KALYANI SANJIV',0,1,'CivilEngineering',NULL,'SC',0),(107,7.11,'112001006','student7_civil_engineering@example.com','BHAGWAT MITESH GAJANAN',0,1,'CivilEngineering',NULL,'SC',0),(108,8.56,'112001007','student8_civil_engineering@example.com','BHANGE VISHAKHA VISHNU',0,1,'CivilEngineering',NULL,'EWS',0),(109,7.2,'112001008','student9_civil_engineering@example.com','BHOSALE ASHISH VILAS',0,1,'CivilEngineering',NULL,'OBC',0),(110,7.6,'112001009','student10_civil_engineering@example.com','BHOSALE PRATIK DATTATRAYA',0,1,'CivilEngineering',NULL,'SC',0),(111,7.2,'112001010','student11_civil_engineering@example.com','CHAVAN VIDYA NAMDEO',0,0,'CivilEngineering',NULL,'OPEN',0),(112,6.22,'112001031','student12_civil_engineering@example.com','LOHARE SHANTANU ASHOK',0,0,'CivilEngineering',NULL,'SC',0),(113,7.43,'112001012','student13_civil_engineering@example.com','CHOPADE SAKSHI SANJAY',0,0,'CivilEngineering',NULL,'OBC',0),(114,5.68,'112001013','student14_civil_engineering@example.com','DHAMAL NIKHIL SURYAKANT',0,0,'CivilEngineering',NULL,'OBC',0),(115,4.91,'112001014','student15_civil_engineering@example.com','DINDORE SANJANA SURESH',0,0,'CivilEngineering',NULL,'OBC',0),(116,6.08,'112001016','student16_civil_engineering@example.com','GAIKWAD PRATIK HANMANT',0,0,'CivilEngineering',NULL,'SC',0),(117,7.51,'112001017','student17_civil_engineering@example.com','GIRI RUSHIKESH PRAKASH',0,0,'CivilEngineering',NULL,'EWS',0),(118,6.53,'112001018','student18_civil_engineering@example.com','GODASE ANUJ GOVIND',0,0,'CivilEngineering',NULL,'OBC',0),(119,7.59,'112001019','student19_civil_engineering@example.com','GOURAV B KUMAR',0,0,'CivilEngineering',NULL,'EWS',0),(120,7.84,'112001020','student20_civil_engineering@example.com','ISAL SAMIKSHA ASHOKRAO',0,0,'CivilEngineering',NULL,'OBC',0),(121,7.18,'112001021','student21_civil_engineering@example.com','JADHAO VALLARY SANJAY',0,0,'CivilEngineering',NULL,'OPEN',0),(122,7.98,'112001022','student22_civil_engineering@example.com','JADHAV MANAS DEEPAK',0,0,'CivilEngineering',NULL,'EWS',0),(123,8.13,'112001023','student23_civil_engineering@example.com','JAGTAP AKHILESH BIBHISHAN',0,0,'CivilEngineering',NULL,'OBC',0),(124,8.09,'112001024','student24_civil_engineering@example.com','JOSHI ADITYA ANUP',0,0,'CivilEngineering',NULL,'OPEN',0),(125,7.98,'112001025','student25_civil_engineering@example.com','KALAMBARKAR VINAYA VASANT',0,0,'CivilEngineering',NULL,'OBC',0),(126,7.94,'112001026','student26_civil_engineering@example.com','KAMDI VIVEK BHIMRAO',0,0,'CivilEngineering',NULL,'OBC',0),(127,8.46,'112001027','student27_civil_engineering@example.com','KENJALE BHARAT ANIL',0,0,'CivilEngineering',NULL,'SC',0),(128,7.88,'112001028','student28_civil_engineering@example.com','KHIRADE PRATIK PRABHU',0,0,'CivilEngineering',NULL,'OPEN',0),(129,7.7,'112001029','student29_civil_engineering@example.com','KU TEJAL KEDAR',0,0,'CivilEngineering',NULL,'EWS',0),(130,5.53,'112001030','student30_civil_engineering@example.com','LIJONTHUNG R OVUNG',0,0,'CivilEngineering',NULL,'OPEN',0),(301,6.82,'111803066','student1_computer_engineering@example.com','KULAL AKHIL RATNAKAR',0,1,'ComputerEngineering',NULL,'OBC',0),(302,5.55,'111803085','student2_computer_engineering@example.com','NIMISH GAUTAM MORE',0,1,'ComputerEngineering',NULL,'SC',0),(303,5.6,'111903029','student3_computer_engineering@example.com','CHETAN GAJANAN BHANUSE',0,1,'ComputerEngineering',NULL,'OBC',0),(304,6.36,'111903032','student4_computer_engineering@example.com','GEET CHANDRABHUSHAN SALAME',0,1,'ComputerEngineering',NULL,'OPEN',0),(305,7.63,'111903052','student5_computer_engineering@example.com','NIRLEPA TUKARAM SHINDE',0,1,'ComputerEngineering',NULL,'OPEN',0),(306,7.39,'111903123','student6_computer_engineering@example.com','VIDHI RAJESH SHAH',0,1,'ComputerEngineering',NULL,'EWS',0),(307,6.95,'111903144','student7_computer_engineering@example.com','DNYANESHWAR TANAJI GOMSALE',0,1,'ComputerEngineering',NULL,'SC',0),(308,5.72,'111903149','student8_computer_engineering@example.com','PRAJYOT TANAJI KALE',0,1,'ComputerEngineering',NULL,'SC',0),(309,8.23,'112003001','student9_computer_engineering@example.com','ADHAL MRUNALI MARUTI',0,1,'ComputerEngineering',NULL,'OBC',0),(310,7.49,'112003002','student10_computer_engineering@example.com','ADITYA ATUL MUZUMDAR',0,1,'ComputerEngineering',NULL,'OPEN',0),(311,7.97,'112003003','student11_computer_engineering@example.com','ADKINE KEDAR AJAY',0,0,'ComputerEngineering',NULL,'OPEN',0),(312,7.62,'112003004','student12_computer_engineering@example.com','ADVAIT PRASHANT KARMALKAR',0,0,'ComputerEngineering',NULL,'OPEN',0),(313,8.5,'112003005','student13_computer_engineering@example.com','AGARAWAL SHIKHAR DHIRENDRA',0,0,'ComputerEngineering',NULL,'OBC',0),(314,8.94,'112003006','student14_computer_engineering@example.com','AGRAWAL ANSHUL PRADEEP',0,0,'ComputerEngineering',NULL,'SC',0),(315,5.2,'112003007','student15_computer_engineering@example.com','ALI B DESHMUKH',0,0,'ComputerEngineering',NULL,'OBC',0),(316,8.1,'112003008','student16_computer_engineering@example.com','ANIKA B CHAWLA',0,0,'ComputerEngineering',NULL,'SC',0),(317,6.74,'112003009','student17_computer_engineering@example.com','ANKUR B DHOK',0,0,'ComputerEngineering',NULL,'OBC',0),(318,8.18,'112003010','student18_computer_engineering@example.com','ANUSHKA VIJAYKUMAR NAIK',0,0,'ComputerEngineering',NULL,'SC',0),(319,8.09,'112003011','student19_computer_engineering@example.com','ARYAN B PESHION',0,0,'ComputerEngineering',NULL,'OPEN',0),(320,7.56,'112003012','student20_computer_engineering@example.com','BAAD PRAJAKTA PRADIP',0,0,'ComputerEngineering',NULL,'SC',0),(321,8.69,'112003013','student21_computer_engineering@example.com','BAKLIWAL B AAGAM',0,0,'ComputerEngineering',NULL,'OPEN',0),(322,9.03,'112003014','student22_computer_engineering@example.com','BANGAD GOURAV NANDKUMAR',0,0,'ComputerEngineering',NULL,'OPEN',0),(323,7.62,'112003015','student23_computer_engineering@example.com','BARGE PARAM PURUSHOTTAM',0,0,'ComputerEngineering',NULL,'OBC',0),(324,8.75,'112003016','student24_computer_engineering@example.com','BARVE NINAD MILIND',0,0,'ComputerEngineering',NULL,'OPEN',0),(325,7.75,'112003017','student25_computer_engineering@example.com','BHABAD NAYAN SURYABHAN',0,0,'ComputerEngineering',NULL,'SC',0),(326,7.6,'112003018','student26_computer_engineering@example.com','BHALEKAR RUPESH DEVIDAS',0,0,'ComputerEngineering',NULL,'OPEN',0),(327,8.08,'112003019','student27_computer_engineering@example.com','BHILARE PRATHAMESH SUNIL',0,0,'ComputerEngineering',NULL,'EWS',0),(328,8.16,'112003020','student28_computer_engineering@example.com','BORADE GAYATRI GANESH',0,0,'ComputerEngineering',NULL,'EWS',0),(329,9.03,'112003021','student29_computer_engineering@example.com','BORNARE ADITYA SHANKAR',0,0,'ComputerEngineering',NULL,'SC',0),(330,7.4,'112003022','student30_computer_engineering@example.com','BURBURE YASH RATNADIP',0,0,'ComputerEngineering',NULL,'EWS',0),(501,7.8,'112005001','student1_electrical_engineering@example.com','BANKAR RUSHIPRASAD RAJARAM',0,1,'ElectricalEngineering',NULL,'SC',0),(502,8.49,'112005002','student2_electrical_engineering@example.com','BELOKAR YASH DHANANJAY',0,1,'ElectricalEngineering',NULL,'SC',0),(503,8.38,'112005004','student3_electrical_engineering@example.com','BHAMARE JIDNYASA JITENDRA',0,1,'ElectricalEngineering',NULL,'EWS',0),(504,8.26,'112005005','student4_electrical_engineering@example.com','BHOSALE ADITYA SHAHAJI',0,1,'ElectricalEngineering',NULL,'OBC',0),(505,6.7,'112005006','student5_electrical_engineering@example.com','BHOSALE VIKRAMADITYA CHANDRAKANT',0,1,'ElectricalEngineering',NULL,'OPEN',0),(506,6.93,'112005008','student6_electrical_engineering@example.com','BHUJBAL ANIKET RAOSAHEB',0,1,'ElectricalEngineering',NULL,'OBC',0),(507,8.23,'112005009','student7_electrical_engineering@example.com','CHAUDHARI JHARNA SANJAY',0,1,'ElectricalEngineering',NULL,'EWS',0),(508,8.19,'112005010','student8_electrical_engineering@example.com','CHAUDHARI TEJAS SATISH',0,1,'ElectricalEngineering',NULL,'SC',0),(509,7.39,'112005011','student9_electrical_engineering@example.com','DEO PRATHAMESH UMESH',0,1,'ElectricalEngineering',NULL,'OBC',0),(510,7.88,'112005013','student10_electrical_engineering@example.com','GANDOLE NIKITA GANGADHAR',0,1,'ElectricalEngineering',NULL,'OBC',0),(511,9.67,'112005014','student11_electrical_engineering@example.com','GOSAVI SHEKHAR PRAMOD',0,0,'ElectricalEngineering',NULL,'OPEN',0),(512,7.57,'112005015','student12_electrical_engineering@example.com','GOURAV B CHANGOTRA',0,0,'ElectricalEngineering',NULL,'OPEN',0),(513,7.74,'112005016','student13_electrical_engineering@example.com','ISHITA B KULKARNI',0,0,'ElectricalEngineering',NULL,'OPEN',0),(514,7.13,'112005018','student14_electrical_engineering@example.com','JAGTAP SAMRAT JITENDRA',0,0,'ElectricalEngineering',NULL,'SC',0),(515,7.85,'112005019','student15_electrical_engineering@example.com','JAGTAP UDAYSING MORESHWAR',0,0,'ElectricalEngineering',NULL,'OBC',0),(516,8.57,'112005020','student16_electrical_engineering@example.com','JOGI ANUJ RAVINDRA',0,0,'ElectricalEngineering',NULL,'SC',0),(517,9.3,'112005021','student17_electrical_engineering@example.com','KADAM PRATIDNYA PRAKASH',0,0,'ElectricalEngineering',NULL,'OPEN',0),(518,7.72,'112005022','student18_electrical_engineering@example.com','KALE SHRADDHA PRATAP',0,0,'ElectricalEngineering',NULL,'OPEN',0),(519,7.16,'112005023','student19_electrical_engineering@example.com','KAMTHE ADITI KAILAS',0,0,'ElectricalEngineering',NULL,'SC',0),(520,7.14,'112005024','student20_electrical_engineering@example.com','KATRE YOGESH NANAKJI',0,0,'ElectricalEngineering',NULL,'OBC',0),(521,8.02,'112005025','student21_electrical_engineering@example.com','KHUSHI B JAIN',0,0,'ElectricalEngineering',NULL,'SC',0),(522,6.72,'112005026','student22_electrical_engineering@example.com','KOTHULE AMOL UTTAM',0,0,'ElectricalEngineering',NULL,'OBC',0),(523,7.19,'112005027','student23_electrical_engineering@example.com','KUDALE ABHISHEK ANILKUMAR',0,0,'ElectricalEngineering',NULL,'SC',0),(524,6.45,'112005028','student24_electrical_engineering@example.com','MADAKE MAYURI KAILAS',0,0,'ElectricalEngineering',NULL,'SC',0),(525,8.03,'112005030','student25_electrical_engineering@example.com','MAHAJAN HARSHALI NILESH',0,0,'ElectricalEngineering',NULL,'SC',0),(526,6.06,'112005031','student26_electrical_engineering@example.com','MALVE APOORV RAJENDRA',0,0,'ElectricalEngineering',NULL,'OBC',0),(527,6.65,'112005032','student27_electrical_engineering@example.com','MULE PRATIKSHA DNYANOBA',0,0,'ElectricalEngineering',NULL,'OPEN',0),(528,8.58,'112005033','student28_electrical_engineering@example.com','NADAR VINISHA DAVID',0,0,'ElectricalEngineering',NULL,'OPEN',0),(529,6.68,'112005034','student29_electrical_engineering@example.com','NALAWADE BHAGYASHRI SANJAY',0,0,'ElectricalEngineering',NULL,'SC',0),(530,6.85,'112005036','student30_electrical_engineering@example.com','NIKALJE AYUSH VIJAYKUMAR',0,0,'ElectricalEngineering',NULL,'OBC',0),(901,4.01,'111909031','student1_instrumentation_engineering@example.com','SUKHADA MANOJ GARUD',0,1,'InstrumentationEngineering',NULL,'EWS',0),(902,7.96,'112009001','student2_instrumentation_engineering@example.com','ABHINAV B VERMA',0,1,'InstrumentationEngineering',NULL,'EWS',0),(903,7.41,'112009002','student3_instrumentation_engineering@example.com','AHER OM GANESH',0,1,'InstrumentationEngineering',NULL,'OPEN',0),(904,5.38,'112009003','student4_instrumentation_engineering@example.com','ANKIT PRAKASH ADHAU',0,1,'InstrumentationEngineering',NULL,'OPEN',0),(905,8.6,'112009004','student5_instrumentation_engineering@example.com','AVINASH BALASO KADAM',0,1,'InstrumentationEngineering',NULL,'SC',0),(906,7.93,'112009006','student6_instrumentation_engineering@example.com','CHATE OM SHIRISH',0,1,'InstrumentationEngineering',NULL,'SC',0),(907,6.8,'112009007','student7_instrumentation_engineering@example.com','CHAVAN ANUSHKA ANANT',0,1,'InstrumentationEngineering',NULL,'OBC',0),(908,7.08,'112009008','student8_instrumentation_engineering@example.com','DANGAT JAYASHRI SURESH',0,1,'InstrumentationEngineering',NULL,'SC',0),(909,7.88,'112009009','student9_instrumentation_engineering@example.com','DIKE AAYUSH SHRIRANG',0,1,'InstrumentationEngineering',NULL,'OBC',0),(910,7.72,'112009010','student10_instrumentation_engineering@example.com','DOLAS PRIYA RAMESH',0,1,'InstrumentationEngineering',NULL,'EWS',0),(911,7.41,'112009011','student11_instrumentation_engineering@example.com','GAGANDEEP B SINGH',0,0,'InstrumentationEngineering',NULL,'SC',0),(912,6.95,'112009012','student12_instrumentation_engineering@example.com','GIRI SRUSHTI INDRESH',0,0,'InstrumentationEngineering',NULL,'SC',0),(913,8.63,'112009014','student13_instrumentation_engineering@example.com','JAIN PRATHAM SANDEEP',0,0,'InstrumentationEngineering',NULL,'OBC',0),(914,8.13,'112009015','student14_instrumentation_engineering@example.com','JANJAL RITESH VILAS',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(915,8.91,'112009016','student15_instrumentation_engineering@example.com','JOSHI PARTH NITIN',0,0,'InstrumentationEngineering',NULL,'SC',0),(916,6.47,'112009018','student16_instrumentation_engineering@example.com','MADHUR B SWAMI',0,0,'InstrumentationEngineering',NULL,'EWS',0),(917,7.12,'112009019','student17_instrumentation_engineering@example.com','NAGARE VIVEK VINAYAK',0,0,'InstrumentationEngineering',NULL,'OBC',0),(918,7.95,'112009020','student18_instrumentation_engineering@example.com','NARWADE KOMAL VISHWANATHRAO',0,0,'InstrumentationEngineering',NULL,'SC',0),(919,7.78,'112009021','student19_instrumentation_engineering@example.com','PATIL AKASH SUNIL',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(920,6.88,'112009022','student20_instrumentation_engineering@example.com','RAJPUT VIVEKSING MAHESH',0,0,'InstrumentationEngineering',NULL,'OBC',0),(921,6.99,'112009023','student21_instrumentation_engineering@example.com','RASHINKAR ANUSHKA ARUN',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(922,7.34,'112009024','student22_instrumentation_engineering@example.com','SANA RIYAZ SHIKALGAR',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(923,5.28,'112009025','student23_instrumentation_engineering@example.com','SANVI B TIKOO',0,0,'InstrumentationEngineering',NULL,'EWS',0),(924,6.91,'112009026','student24_instrumentation_engineering@example.com','SARDAR YOGESH MADHAV',0,0,'InstrumentationEngineering',NULL,'EWS',0),(925,7.07,'112009027','student25_instrumentation_engineering@example.com','SATHE TRUPTI ARUN',0,0,'InstrumentationEngineering',NULL,'SC',0),(926,8.03,'112009030','student26_instrumentation_engineering@example.com','TANISHA B ABHANGE',0,0,'InstrumentationEngineering',NULL,'EWS',0),(927,8.18,'112009031','student27_instrumentation_engineering@example.com','VASAGADE VARAD MAHAVIR',0,0,'InstrumentationEngineering',NULL,'EWS',0),(928,8.43,'112009033','student28_instrumentation_engineering@example.com','YOSHIT SANTOSH TAPAR',0,0,'InstrumentationEngineering',NULL,'EWS',0),(929,6.5,'112009034','student29_instrumentation_engineering@example.com','AKASH GANPATRAO DIKONDWAR',0,0,'InstrumentationEngineering',NULL,'OBC',0),(930,8.71,'112009035','student30_instrumentation_engineering@example.com','GADGIL MANAS SURENDRA',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(1001,5.7,'111910061','student1_mechanical_engineering@example.com','NAMRATA NILKANTH RAJMANE',0,1,'MechanicalEngineering',NULL,'SC',0),(1002,4.41,'111910133','student2_mechanical_engineering@example.com','ADVAITA PRAVIN BAKSHI',0,1,'MechanicalEngineering',NULL,'EWS',0),(1003,6.1,'111910143','student3_mechanical_engineering@example.com','ROHITH DHARSAN RAJAN',0,1,'MechanicalEngineering',NULL,'OPEN',0),(1004,8.3,'112010001','student4_mechanical_engineering@example.com','ABHISHEK ANIL KHANDALE',0,1,'MechanicalEngineering',NULL,'SC',0),(1005,4.99,'112010002','student5_mechanical_engineering@example.com','ABHISHEK VIJAY KULKARNI',0,1,'MechanicalEngineering',NULL,'EWS',0),(1006,6.49,'112010003','student6_mechanical_engineering@example.com','AKHADE SUMIT LAXMAN',0,1,'MechanicalEngineering',NULL,'EWS',0),(1007,7.24,'112010004','student7_mechanical_engineering@example.com','ANDHALE MOHIT SANTOSH',0,1,'MechanicalEngineering',NULL,'EWS',0),(1008,7.38,'112010005','student8_mechanical_engineering@example.com','ATHARVA ANIL JOSHI',0,1,'MechanicalEngineering',NULL,'SC',0),(1009,6.61,'112010006','student9_mechanical_engineering@example.com','ATHAVALE MAYUR ABHAY',0,1,'MechanicalEngineering',NULL,'OPEN',0),(1010,6.66,'112010007','student10_mechanical_engineering@example.com','BAHUL B RAINA',0,1,'MechanicalEngineering',NULL,'EWS',0),(1011,7.96,'112010008','student11_mechanical_engineering@example.com','BALESHGOL APEKSHA MARUTI',0,0,'MechanicalEngineering',NULL,'EWS',0),(1012,8.49,'112010009','student12_mechanical_engineering@example.com','BHAGAT ISHA JAYDEEP',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1013,6.97,'112010010','student13_mechanical_engineering@example.com','BHAGYASHRI RAVINDRA JEKATE',0,0,'MechanicalEngineering',NULL,'SC',0),(1014,8.01,'112010012','student14_mechanical_engineering@example.com','BHATI HITESHKUMAR BHIMARAM',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1015,8.38,'112010013','student15_mechanical_engineering@example.com','BHOIR VINEET SANTOSH',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1016,6.76,'112010015','student16_mechanical_engineering@example.com','BHOR VEDANT NANASAHEB',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1017,7.69,'112010016','student17_mechanical_engineering@example.com','BIYANI RAM DINESH',0,0,'MechanicalEngineering',NULL,'SC',0),(1018,8.05,'112010017','student18_mechanical_engineering@example.com','BODHE ATHARV VIJAY',0,0,'MechanicalEngineering',NULL,'OBC',0),(1019,8.13,'112010018','student19_mechanical_engineering@example.com','BRAHMANKAR OM SURENDRA',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1020,5.8,'112010019','student20_mechanical_engineering@example.com','CHAUDHARI KUNAL ANANDA',0,0,'MechanicalEngineering',NULL,'OBC',0),(1021,8.38,'112010020','student21_mechanical_engineering@example.com','CHAVAN KARTIK SANJAY',0,0,'MechanicalEngineering',NULL,'SC',0),(1022,6.62,'112010021','student22_mechanical_engineering@example.com','CHERKULWAR RITIK RAVINDRA',0,0,'MechanicalEngineering',NULL,'EWS',0),(1023,7.51,'112010022','student23_mechanical_engineering@example.com','CHINMAY VIVEK CHAVAN',0,0,'MechanicalEngineering',NULL,'OBC',0),(1024,6.03,'112010023','student24_mechanical_engineering@example.com','CHIRAYU DNYANESHWAR AHIRRAO',0,0,'MechanicalEngineering',NULL,'EWS',0),(1025,7.01,'112010025','student25_mechanical_engineering@example.com','DABHADE SAAHIL VISHAL',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1026,7.22,'112010026','student26_mechanical_engineering@example.com','DAHOTRE VIPUL GAJANAN',0,0,'MechanicalEngineering',NULL,'OBC',0),(1027,7.16,'112010027','student27_mechanical_engineering@example.com','DEORE DHRUV MILIND',0,0,'MechanicalEngineering',NULL,'SC',0),(1028,7.39,'112010028','student28_mechanical_engineering@example.com','DESHMUKH TANVI RAJENDRA',0,0,'MechanicalEngineering',NULL,'EWS',0),(1029,8.37,'112010030','student29_mechanical_engineering@example.com','DEWADA SAGAR KISAN',0,0,'MechanicalEngineering',NULL,'EWS',0),(1030,7.95,'112010031','student30_mechanical_engineering@example.com','DHUMAL ATHARVA RAVINDRA',0,0,'MechanicalEngineering',NULL,'EWS',0),(1301,8.95,'112013001','student1_manufacturing_engineering@example.com','ABHISHEK BASAVARAJ KASAMULE',0,1,'ManufacturingEngineering',NULL,'OPEN',0),(1302,7.38,'112013002','student2_manufacturing_engineering@example.com','ADITYA B SANJU',0,1,'ManufacturingEngineering',NULL,'SC',0),(1303,8.88,'112013004','student3_manufacturing_engineering@example.com','AMRUTKAR RAJ VINAYAK',0,1,'ManufacturingEngineering',NULL,'EWS',0),(1304,6.83,'112013005','student4_manufacturing_engineering@example.com','ANISH KIRANKUMAR JAGTAP',0,1,'ManufacturingEngineering',NULL,'OPEN',0),(1305,7.37,'112013006','student5_manufacturing_engineering@example.com','ATTAR AMAAN RIYAJAHMAD',0,1,'ManufacturingEngineering',NULL,'EWS',0),(1306,8.14,'112013007','student6_manufacturing_engineering@example.com','BAVISKAR KUSHAL SADASHIV',0,1,'ManufacturingEngineering',NULL,'OPEN',0),(1307,7.44,'112013008','student7_manufacturing_engineering@example.com','BIRARI PIYUSH UMESH',0,1,'ManufacturingEngineering',NULL,'SC',0),(1308,6.41,'112013010','student8_manufacturing_engineering@example.com','BORADE YASH LAXMAN',0,1,'ManufacturingEngineering',NULL,'OBC',0),(1309,8.95,'112013011','student9_manufacturing_engineering@example.com','DHANANJAY ASHOK GUJARATHI',0,1,'ManufacturingEngineering',NULL,'OPEN',0),(1310,6.76,'112013012','student10_manufacturing_engineering@example.com','DHARMALE VAIBHAVI PRAMOD',0,1,'ManufacturingEngineering',NULL,'OBC',0),(1311,7.34,'112013013','student11_manufacturing_engineering@example.com','GANDAGE PRITHVIRAJ SHIVKUMAR',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1312,6.24,'112013015','student12_manufacturing_engineering@example.com','GITE KOMAL KAILAS',0,0,'ManufacturingEngineering',NULL,'OBC',0),(1313,8.18,'112013016','student13_manufacturing_engineering@example.com','GOSAVI ABHAY CHANDRASHEKHAR',0,0,'ManufacturingEngineering',NULL,'SC',0),(1314,7.25,'112013018','student14_manufacturing_engineering@example.com','JADHAV VIRAJ RAMRAO',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1315,7.52,'112013019','student15_manufacturing_engineering@example.com','JAIN AAYUSH KAILASH',0,0,'ManufacturingEngineering',NULL,'OBC',0),(1316,6.58,'112013021','student16_manufacturing_engineering@example.com','JAY B TIPARE',0,0,'ManufacturingEngineering',NULL,'OBC',0),(1317,6.72,'112013022','student17_manufacturing_engineering@example.com','JHAWAR NANDAN LAXMIKANT',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1318,8.34,'112013023','student18_manufacturing_engineering@example.com','JOSHI MADHURA SANTOSH',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1319,7.32,'112013025','student19_manufacturing_engineering@example.com','KHEDKAR SHREE SACHIN',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1320,6.6,'112013027','student20_manufacturing_engineering@example.com','KOLI MRUDULA VITTHAL',0,0,'ManufacturingEngineering',NULL,'OBC',0),(1321,6.51,'112013028','student21_manufacturing_engineering@example.com','KULKARNI SHREYAS PRAVEEN',0,0,'ManufacturingEngineering',NULL,'SC',0),(1322,8.25,'112013029','student22_manufacturing_engineering@example.com','KULKARNI VAISHNAVI SHRIPAD',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1323,8.03,'112013031','student23_manufacturing_engineering@example.com','MAHAJAN ARYAMAN MUKESH',0,0,'ManufacturingEngineering',NULL,'OBC',0),(1324,8.06,'112013032','student24_manufacturing_engineering@example.com','MAHAJAN SHALMALEE ARUN',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1325,7.77,'112013033','student25_manufacturing_engineering@example.com','MAHARNOR APPASAHEB ASHOK',0,0,'ManufacturingEngineering',NULL,'OBC',0),(1326,8.04,'112013034','student26_manufacturing_engineering@example.com','MALLIKA PRAVIN MAHESHKAR',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1327,7.03,'112013036','student27_manufacturing_engineering@example.com','MARIA ARYAN ROHIT',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1328,7.25,'112013037','student28_manufacturing_engineering@example.com','MESHRAM SEJAL PRAMOD',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1329,6.99,'112013038','student29_manufacturing_engineering@example.com','MHASKE PAVANKUMAR YADAV',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1330,6.75,'112013039','student30_manufacturing_engineering@example.com','MORADE SHARVARI SUNIL',0,0,'ManufacturingEngineering',NULL,'OBC',0);
/*!40000 ALTER TABLE `registration_finalyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_firstyear`
--

DROP TABLE IF EXISTS `registration_firstyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_firstyear` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rank` int NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  `caste` varchar(10) DEFAULT NULL,
  `payment_done` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_firstyear_user_id_e13ba54a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_firstyear`
--

LOCK TABLES `registration_firstyear` WRITE;
/*!40000 ALTER TABLE `registration_firstyear` DISABLE KEYS */;
INSERT INTO `registration_firstyear` VALUES (101,1428,'EN23185238','avadhootsghewade4757@gmail.com','KADAM ANISH ANIL',1,1,'CivilEngineering',22,'OPEN',0),(102,1940,'EN23223626','patil.ajay.5nj9bksm@gmail.com','PATIL ARNAV AJAY',0,1,'CivilEngineering',NULL,'OPEN',0),(103,2774,'EN23149998','suryawanshi.sanjay.q5vdncd9@gmail.com','SURYAWANSHI SHIVRAJ SANJAY',0,1,'CivilEngineering',NULL,'EWS',0),(104,2941,'EN23173012','lanjewar.vinod.1e8fiklu@gmail.com','LANJEWAR SAHIL VINOD',0,1,'CivilEngineering',NULL,'OPEN',0),(105,3272,'EN23217414','aashvardhan.chauhan.cy109khs@gmail.com','AASHVARDHAN SINGH CHAUHAN',0,1,'CivilEngineering',NULL,'EWS',0),(106,3301,'EN23145658','deoghare.rakesh.af0t17dl@gmail.com','DEOGHARE VEDANT RAKESH',0,1,'CivilEngineering',NULL,'OBC',0),(107,3396,'EN23173586','anshuman.patil.gvc7wd31@gmail.com','ANSHUMAN SARANG PATIL',0,1,'CivilEngineering',NULL,'EWS',0),(108,3422,'EN23126225','oza.sunil.df9e7mff@gmail.com','OZA OM SUNIL',0,1,'CivilEngineering',NULL,'SC',0),(109,3690,'EN23215591','patil.vijay.i8tl65nw@gmail.com','PATIL PIYUSH VIJAY',0,1,'CivilEngineering',NULL,'SC',0),(110,3930,'EN23213221','bhavesh.kapure.7a7eycay@gmail.com','BHAVESH KAPURE',0,1,'CivilEngineering',NULL,'EWS',0),(111,3935,'EN23234117','neharkar.premchand.hq2ads3t@gmail.com','NEHARKAR HARSHAL PREMCHAND',0,0,'CivilEngineering',NULL,'OPEN',0),(112,3990,'EN23160416','pawar.santosh.crtt5i8b@gmail.com','PAWAR SAIRAJ SANTOSH',0,0,'CivilEngineering',NULL,'OPEN',0),(113,4102,'EN23112605','musale.kishor.0kh61nla@gmail.com','MUSALE HIMALAY KISHOR',0,0,'CivilEngineering',NULL,'EWS',0),(114,4172,'EN23116857','chittora.purushottam.yn2fm4k2@gmail.com','CHITTORA RITESH PURUSHOTTAM',0,0,'CivilEngineering',NULL,'OPEN',0),(115,4191,'EN23111306','tapkir.sandeep.ww31kb05@gmail.com','TAPKIR VEDANT SANDEEP',0,0,'CivilEngineering',NULL,'OBC',0),(116,4362,'EN23214726','shauryearaj.kumar.g6310tx4@gmail.com','SHAURYEARAJ YUVRAJ NEEMA KUMAR',0,0,'CivilEngineering',NULL,'OPEN',0),(117,4654,'EN23163281','dhage.ramesh.jgw4c7pq@gmail.com','DHAGE ATHARV RAMESH',0,0,'CivilEngineering',NULL,'OPEN',0),(118,4676,'EN23183634','kekade.manoj.ogsb6i7l@gmail.com','KEKADE SNEHIT MANOJ',0,0,'CivilEngineering',NULL,'OPEN',0),(119,4959,'EN23110896','chanakya.navghare.t82di6of@gmail.com','CHANAKYA NAVGHARE',0,0,'CivilEngineering',NULL,'OPEN',0),(120,4998,'EN23129839','anjali.jadhav.g4zgmf62@gmail.com','ANJALI JADHAV',0,0,'CivilEngineering',NULL,'OBC',0),(121,5046,'EN23168100','wasade.jitendra.xqkq6fea@gmail.com','WASADE UTKARSH JITENDRA',0,0,'CivilEngineering',NULL,'EWS',0),(122,5168,'EN23146388','vibhandik.sanjay.3xz3x9zo@gmail.com','VIBHANDIK KAUSTUBH SANJAY',0,0,'CivilEngineering',NULL,'SC',0),(123,5340,'EN23134835','nirmit.dharmale.6i1xp6e2@gmail.com','NIRMIT DHARMALE',0,0,'CivilEngineering',NULL,'EWS',0),(124,5600,'EN23171272','rathi.santosh.2cqdaigg@gmail.com','RATHI PRANJAL SANTOSH',0,0,'CivilEngineering',NULL,'OBC',0),(125,5691,'EN23201433','kolhe.kailas.m02aoxvy@gmail.com','KOLHE HARIDARSHAN KAILAS',0,0,'CivilEngineering',NULL,'OPEN',0),(126,5736,'EN23116852','kakade.satish.7d3snbdp@gmail.com','KAKADE SAMEERA SATISH',0,0,'CivilEngineering',NULL,'EWS',0),(127,5864,'EN23137499','ritishaa.anand.dsnaqsna@gmail.com','RITISHAA ANAND',0,0,'CivilEngineering',NULL,'EWS',0),(128,6348,'EN23217922','patil.prashant.t4ade0sz@gmail.com','PATIL RASHIKA PRASHANT',0,0,'CivilEngineering',NULL,'OBC',0),(129,6423,'EN23223671','ghule.dilipkumar.u3wbcaq2@gmail.com','GHULE ATHARVA DILIPKUMAR',0,0,'CivilEngineering',NULL,'EWS',0),(130,6592,'EN23165665','padulkar.sunil.1ikcpz1l@gmail.com','PADULKAR SHIRISH SUNIL',0,0,'CivilEngineering',NULL,'EWS',0),(301,19,'EN23147051','memon.salim.76az06sr@gmail.com','MEMON SAHIL SOHAIL SALIM',0,1,'ComputerEngineering',NULL,'OBC',0),(302,20,'EN23131626','duduskar.manoj.5cdy6cp4@gmail.com','DUDUSKAR VEDANT MANOJ',0,1,'ComputerEngineering',NULL,'OBC',0),(303,22,'EN23115055','borkar.nilesh.3v8iwtkk@gmail.com','BORKAR TANISHQ NILESH',0,1,'ComputerEngineering',NULL,'OBC',0),(304,25,'EN23177796','aryan.mehta.g62yl4ji@gmail.com','ARYAN ARUN MEHTA',0,1,'ComputerEngineering',NULL,'EWS',0),(305,27,'EN23199748','anupriya.karn.pvvz8yg7@gmail.com','ANUPRIYA KARN',0,1,'ComputerEngineering',NULL,'OPEN',0),(306,29,'EN23122395','godase.vasant.cdthia2a@gmail.com','GODASE ADITYA VASANT',0,1,'ComputerEngineering',NULL,'OPEN',0),(307,34,'EN23167975','phule.ravi.ekxmuen1@gmail.com','PHULE ANJALI RAVI',0,1,'ComputerEngineering',NULL,'EWS',0),(308,45,'EN23108587','dighe.rohidas.tnb2kmrz@gmail.com','DIGHE SAHIL ROHIDAS',0,1,'ComputerEngineering',NULL,'OBC',0),(309,46,'EN23127902','abhishek.sinha.aiftea49@gmail.com','ABHISHEK ABHAY SINHA',0,1,'ComputerEngineering',NULL,'OBC',0),(310,59,'EN23118507','kadam.suhas.4pmb8x3r@gmail.com','KADAM DISHA SUHAS',0,1,'ComputerEngineering',NULL,'OPEN',0),(311,64,'EN23141488','deodhar.kaustubh.ukwhjuef@gmail.com','DEODHAR ALHAD KAUSTUBH',0,0,'ComputerEngineering',NULL,'EWS',0),(312,73,'EN23187710','patil.ramdas.ka6iha97@gmail.com','PATIL BHAGYASHREE RAMDAS',0,0,'ComputerEngineering',NULL,'OPEN',0),(313,84,'EN23158013','sathaye.siddharth.9559wffw@gmail.com','SATHAYE AKSHAY SIDDHARTH',0,0,'ComputerEngineering',NULL,'OPEN',0),(314,92,'EN23177806','sagare.ravindra.ratih7a9@gmail.com','SAGARE MAYURESH RAVINDRA',0,0,'ComputerEngineering',NULL,'SC',0),(315,94,'EN23105417','jyotika.sharan.3hvp0u8r@gmail.com','JYOTIKA SHARAN',0,0,'ComputerEngineering',NULL,'OPEN',0),(316,105,'EN23141717','ingle.bhaskar.f6cjefxy@gmail.com','INGLE AYUSH BHASKAR',0,0,'ComputerEngineering',NULL,'OPEN',0),(317,108,'EN23131436','ninad.sonkusare.8ukvijm5@gmail.com','NINAD JAYANT SONKUSARE',0,0,'ComputerEngineering',NULL,'EWS',0),(318,118,'EN23104499','aman.morghade.32t9y1re@gmail.com','AMAN BIPIN MORGHADE',0,0,'ComputerEngineering',NULL,'OPEN',0),(319,123,'EN23117272','riya.kulkarni.h5hledqj@gmail.com','RIYA ASHUTOSH KULKARNI',0,0,'ComputerEngineering',NULL,'OBC',0),(320,130,'EN23175735','moghe.manish.kxbw1rrx@gmail.com','MOGHE GARGI MANISH',0,0,'ComputerEngineering',NULL,'SC',0),(321,139,'EN23130817','karad.kantilal.2ti7m02b@gmail.com','KARAD TANMAY KANTILAL',0,0,'ComputerEngineering',NULL,'SC',0),(322,146,'EN23194619','chavan.sarjerao.f931hyug@gmail.com','CHAVAN ROHIT SARJERAO',0,0,'ComputerEngineering',NULL,'EWS',0),(323,147,'EN23176826','pawar.vishwambhar.qnl4wsts@gmail.com','PAWAR SIDDHI VISHWAMBHAR',0,0,'ComputerEngineering',NULL,'OPEN',0),(324,154,'EN23145959','davhale.pradip.rpgcse1j@gmail.com','DAVHALE ANSH PRADIP',0,0,'ComputerEngineering',NULL,'SC',0),(325,165,'EN23159348','urkunde.bhaskar.op3xyo6o@gmail.com','URKUNDE MOHIT BHASKAR',0,0,'ComputerEngineering',NULL,'SC',0),(326,179,'EN23129264','deshmukh.kiran.3ze1ixf6@gmail.com','DESHMUKH SHARDUL KIRAN',0,0,'ComputerEngineering',NULL,'EWS',0),(327,180,'EN23123721','patil.sunil.4fbjy9vu@gmail.com','PATIL PARTH SUNIL',0,0,'ComputerEngineering',NULL,'SC',0),(328,181,'EN23183380','bhosale.chandrakant.8herbdba@gmail.com','BHOSALE YASHWANT CHANDRAKANT',0,0,'ComputerEngineering',NULL,'OPEN',0),(329,182,'EN23210714','rokade.dhananjay.2l8vw4ng@gmail.com','ROKADE RITESH DHANANJAY',0,0,'ComputerEngineering',NULL,'OBC',0),(330,190,'EN23140670','mane.mangesh.2q03qrok@gmail.com','MANE HARSHWARDHAN MANGESH',0,0,'ComputerEngineering',NULL,'SC',0),(501,690,'EN23224561','atharva.nijasure.ifdmqxx6@gmail.com','ATHARVA PRASHANT NIJASURE',0,1,'ElectricalEngineering',NULL,'OBC',0),(502,729,'EN23118519','harshit.misra.qznhyl4e@gmail.com','HARSHIT MISRA',0,1,'ElectricalEngineering',NULL,'OPEN',0),(503,758,'EN23113538','aarya.majali.z1obuxxs@gmail.com','AARYA AJEET MAJALI',0,1,'ElectricalEngineering',NULL,'EWS',0),(504,787,'EN23218171','mandavkar.madhukar.ausommfm@gmail.com','MANDAVKAR MIHIR MADHUKAR',0,1,'ElectricalEngineering',NULL,'OBC',0),(505,898,'EN23125430','kale.shyamrao.zw93yk9n@gmail.com','KALE SHREYASH SHYAMRAO',0,1,'ElectricalEngineering',NULL,'OBC',0),(506,906,'EN23251349','utekar.vijay.hxdmjm8o@gmail.com','UTEKAR OM VIJAY',0,1,'ElectricalEngineering',NULL,'OPEN',0),(507,932,'EN23139345','nishant.pradhan.fme190dl@gmail.com','NISHANT PRADHAN',0,1,'ElectricalEngineering',NULL,'SC',0),(508,940,'EN23122501','shrushti.thakare.37fsywul@gmail.com','SHRUSHTI SANJAY THAKARE',0,1,'ElectricalEngineering',NULL,'OPEN',0),(509,976,'EN23195901','saraf.aditya.9xmok1kj@gmail.com','SARAF ANIRUDDHA ADITYA',0,1,'ElectricalEngineering',NULL,'OPEN',0),(510,1018,'EN23187634','chitnis.himanshu.92oxvpeh@gmail.com','CHITNIS RAJDEEP HIMANSHU',0,1,'ElectricalEngineering',NULL,'EWS',0),(511,1040,'EN23130973','mahajan.vinayak.jt4witfl@gmail.com','MAHAJAN VEDASHREE VINAYAK',0,0,'ElectricalEngineering',NULL,'EWS',0),(512,1044,'EN23116801','pranav.nankar.kyd8w5jd@gmail.com','PRANAV PRASHANT NANKAR',0,0,'ElectricalEngineering',NULL,'EWS',0),(513,1173,'EN23199116','chavan.pandurang.7ifh2yoz@gmail.com','CHAVAN PRATIK PANDURANG',0,0,'ElectricalEngineering',NULL,'OBC',0),(514,1177,'EN23192150','kulkarni.shripad.f58udm9q@gmail.com','KULKARNI ASHUTOSH SHRIPAD',0,0,'ElectricalEngineering',NULL,'OPEN',0),(515,1202,'EN23139917','phapale.santosh.8tc5dqqb@gmail.com','PHAPALE SAIDEEP SANTOSH',0,0,'ElectricalEngineering',NULL,'OPEN',0),(516,1242,'EN23199556','sontakke.vijayanand.ewk5nfdj@gmail.com','SONTAKKE RUJUTA VIJAYANAND',0,0,'ElectricalEngineering',NULL,'OBC',0),(517,1249,'EN23198333','deshmukh.amol.hiid2gxi@gmail.com','DESHMUKH MANAS AMOL',0,0,'ElectricalEngineering',NULL,'OBC',0),(518,1304,'EN23149304','khandait.nityanand.2tdvsx40@gmail.com','KHANDAIT KARTIK NITYANAND',0,0,'ElectricalEngineering',NULL,'OPEN',0),(519,1390,'EN23230282','kanire.dipak.4psmmyjx@gmail.com','KANIRE PRANAV DIPAK',0,0,'ElectricalEngineering',NULL,'OPEN',0),(520,1417,'EN23137160','tondgaonkar.mahesh.hfwvotrb@gmail.com','TONDGAONKAR ROCHANA MAHESH',0,0,'ElectricalEngineering',NULL,'OPEN',0),(521,1422,'EN23146843','shelar.santosh.5m514i5k@gmail.com','SHELAR ARCHIT SANTOSH',0,0,'ElectricalEngineering',NULL,'OBC',0),(522,1435,'EN23126231','lavish.patil.zfd4hjzk@gmail.com','LAVISH ISHWAR PATIL',0,0,'ElectricalEngineering',NULL,'OBC',0),(523,1450,'EN23110431','kshirsagar.kedarnath.w6tiz1qr@gmail.com','KSHIRSAGAR PRATIK KEDARNATH',0,0,'ElectricalEngineering',NULL,'SC',0),(524,1456,'EN23227915','arya.karanjkar.83zdixly@gmail.com','ARYA SHAILESH KARANJKAR',0,0,'ElectricalEngineering',NULL,'OPEN',0),(525,1628,'EN23174014','jadhao.sanjay.949xyzpl@gmail.com','JADHAO SIYA SANJAY',0,0,'ElectricalEngineering',NULL,'OPEN',0),(526,1681,'EN23203593','ambadkar.dnyaneshwar.74kdendy@gmail.com','AMBADKAR ISHWARI DNYANESHWAR',0,0,'ElectricalEngineering',NULL,'OBC',0),(527,1726,'EN23150163','barudwale.pravin.wq5ztnhm@gmail.com','BARUDWALE SNEHA PRAVIN',0,0,'ElectricalEngineering',NULL,'EWS',0),(528,1808,'EN23169969','dhavane.guruling.6ykh3qev@gmail.com','DHAVANE GOURAV GURULING',0,0,'ElectricalEngineering',NULL,'OBC',0),(529,2038,'EN23147290','dharmadhikari.suhas.lz2zsfvw@gmail.com','DHARMADHIKARI ASMI SUHAS',0,0,'ElectricalEngineering',NULL,'OBC',0),(530,2103,'EN23143431','vaidya.premnarayan.ykgzatct@gmail.com','VAIDYA DEEP PREMNARAYAN',0,0,'ElectricalEngineering',NULL,'EWS',0),(901,1147,'EN23127178','mirashi.rohit.8xr61s6m@gmail.com','MIRASHI KARTIK ROHIT',0,1,'InstrumentationEngineering',NULL,'OPEN',0),(902,1318,'EN23115961','vispute.kailas.h9hnolje@gmail.com','VISPUTE HARDIK KAILAS',0,1,'InstrumentationEngineering',NULL,'EWS',0),(903,1382,'EN23141780','joshi.ashwin.07talmis@gmail.com','JOSHI NIHAR ASHWIN',0,1,'InstrumentationEngineering',NULL,'EWS',0),(904,1689,'EN23159242','kumbharkar.sanjay.fjcwhpfn@gmail.com','KUMBHARKAR SIDDHARTH SANJAY',0,1,'InstrumentationEngineering',NULL,'EWS',0),(905,1700,'EN23117638','tiwari.sunil.wfbki58w@gmail.com','TIWARI ADITYA SUNIL',0,1,'InstrumentationEngineering',NULL,'SC',0),(906,1734,'EN23212036','harkare.mangalkumar.vdaf9a0w@gmail.com','HARKARE SHIVSAMB MANGALKUMAR',0,1,'InstrumentationEngineering',NULL,'OBC',0),(907,1775,'EN23100634','gauransh.kumar.8w9nwmy8@gmail.com','GAURANSH KUMAR',0,1,'InstrumentationEngineering',NULL,'EWS',0),(908,1789,'EN23102354','awate.gajanan.qnsvzl1h@gmail.com','AWATE HRUSHIKESH GAJANAN',0,1,'InstrumentationEngineering',NULL,'OPEN',0),(909,2015,'EN23141396','munjal.ramesh.d98ssppl@gmail.com','MUNJAL AAYUSH RAMESH',0,1,'InstrumentationEngineering',NULL,'OBC',0),(910,2089,'EN23121213','ardhapurkar.rajesh.spb2fzg0@gmail.com','ARDHAPURKAR ISHAN RAJESH',0,1,'InstrumentationEngineering',NULL,'EWS',0),(911,2161,'EN23156717','kinage.milind.rdlkh7n6@gmail.com','KINAGE ATHARVA MILIND',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(912,2332,'EN23106492','mayekar.mandar.s4f3v7cd@gmail.com','MAYEKAR AARUSHI MANDAR',0,0,'InstrumentationEngineering',NULL,'OBC',0),(913,2357,'EN23136984','bhumi.dave.azua1y6q@gmail.com','BHUMI ANIL DAVE',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(914,2377,'EN23143357','mohokar.sameer.rhw1ah7j@gmail.com','MOHOKAR RAM SAMEER',0,0,'InstrumentationEngineering',NULL,'SC',0),(915,2543,'EN23168053','kevalina.bhattacharyya.uhsvwvab@gmail.com','KEVALINA BHATTACHARYYA',0,0,'InstrumentationEngineering',NULL,'EWS',0),(916,2602,'EN23189943','nagarkar.shailesh.ichv46ri@gmail.com','NAGARKAR APURVAA SHAILESH',0,0,'InstrumentationEngineering',NULL,'SC',0),(917,2812,'EN23116034','ameya.dusane.gxr7duwe@gmail.com','AMEYA DUSANE',0,0,'InstrumentationEngineering',NULL,'SC',0),(918,5444,'EN23130897','ghule.tukaram.s9wdn8m6@gmail.com','GHULE KHUSHBOO TUKARAM',0,0,'InstrumentationEngineering',NULL,'SC',0),(919,5493,'EN23176196','ghuge.dinesh.qjeyi80s@gmail.com','GHUGE ROHAN DINESH',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(920,5975,'EN23137559','nalla.sumant.l30ryb6s@gmail.com','NALLA KEITH MESSAICH SUMANT',0,0,'InstrumentationEngineering',NULL,'EWS',0),(921,6509,'EN23109373','anushree.kothe.ms91lqi5@gmail.com','ANUSHREE VITTHAL KOTHE',0,0,'InstrumentationEngineering',NULL,'SC',0),(922,8931,'EN23115873','gajbhiye.jeevak.yk0737h4@gmail.com','GAJBHIYE SAJAG JEEVAK',0,0,'InstrumentationEngineering',NULL,'SC',0),(923,9800,'EN23123342','manushree.sonawane.6e8wwhuc@gmail.com','MANUSHREE SONAWANE',0,0,'InstrumentationEngineering',NULL,'OBC',0),(924,10944,'EN23163825','jadhav.sandeep.24z2kbv2@gmail.com','JADHAV SMITESH SANDEEP',0,0,'InstrumentationEngineering',NULL,'OBC',0),(925,14740,'EN23138822','shinde.satish.s8dzfmi5@gmail.com','SHINDE ANUSHKA SATISH',0,0,'InstrumentationEngineering',NULL,'SC',0),(926,27542,'EN23184708','yash.zende.q0f2pg3i@gmail.com','YASH DEEPAK ZENDE',0,0,'InstrumentationEngineering',NULL,'OBC',0),(927,33664,'EN23221394','ilpate.mahendra.kcrrqloz@gmail.com','ILPATE VED MAHENDRA',0,0,'InstrumentationEngineering',NULL,'OBC',0),(928,48801,'EN23246109','padavi.hiraji.tggyrqb5@gmail.com','PADAVI AVANI HIRAJI',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(929,79044,'EN23150533','joshi.vikasrao.rkxrxz1i@gmail.com','JOSHI CHANDRASHEKHAR VIKASRAO',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(930,136522,'EN23110125','harsh.chavan.3xyb13q6@gmail.com','HARSH NAMDEO CHAVAN',0,0,'InstrumentationEngineering',NULL,'OBC',0),(1001,183,'EN23223188','sahasrabuddhe.vinay.mypf6gfe@gmail.com','SAHASRABUDDHE MIHIR VINAY',0,1,'MechanicalEngineering',NULL,'OBC',0),(1002,360,'EN23140891','gujrathi.akshay.vacjgeev@gmail.com','GUJRATHI SAHIL AKSHAY',0,1,'MechanicalEngineering',NULL,'OPEN',0),(1003,406,'EN23173180','nerlekar.rohit.vza59u6e@gmail.com','NERLEKAR AKHILESH ROHIT',0,1,'MechanicalEngineering',NULL,'OPEN',0),(1004,542,'EN23193955','dhere.devendra.9niaav02@gmail.com','DHERE ADWAIT DEVENDRA',0,1,'MechanicalEngineering',NULL,'SC',0),(1005,870,'EN23219778','palav.deepak.ayvm3kww@gmail.com','PALAV AVANEESH DEEPAK',0,1,'MechanicalEngineering',NULL,'OBC',0),(1006,1055,'EN23139025','sarthak.dode.6nrnvlt0@gmail.com','SARTHAK SUHAS DODE',0,1,'MechanicalEngineering',NULL,'OBC',0),(1007,1099,'EN23122145','parth.kale.a7myb1m5@gmail.com','PARTH RAJESH KALE',0,1,'MechanicalEngineering',NULL,'SC',0),(1008,1150,'EN23219327','jain.nilesh.4qvwi4el@gmail.com','JAIN HEET NILESH',0,1,'MechanicalEngineering',NULL,'OPEN',0),(1009,1238,'EN23193832','zilmar.vaibhav.et21s3lh@gmail.com','ZILMAR YASH VAIBHAV',0,1,'MechanicalEngineering',NULL,'OPEN',0),(1010,1367,'EN23193733','nerlekar.shrikant.ek5i07cp@gmail.com','NERLEKAR ADITYA SHRIKANT',0,1,'MechanicalEngineering',NULL,'EWS',0),(1011,1369,'EN23221104','bhagat.balaso.isgkj7j6@gmail.com','BHAGAT SWARAJ BALASO',0,0,'MechanicalEngineering',NULL,'SC',0),(1013,1457,'EN23174117','deshpande.shriniwas.vhrwczlu@gmail.com','DESHPANDE OJAS SHRINIWAS',0,0,'MechanicalEngineering',NULL,'EWS',0),(1014,1482,'EN23104536','bonde.girish.zxsokcv3@gmail.com','BONDE KARAN GIRISH',0,0,'MechanicalEngineering',NULL,'OBC',0),(1015,1483,'EN23121959','deshpande.vikas.urkivoig@gmail.com','DESHPANDE SOHAM VIKAS',0,0,'MechanicalEngineering',NULL,'SC',0),(1016,1488,'EN23206488','chafale.devidas.3d3tiqk9@gmail.com','CHAFALE SOMENDRA DEVIDAS',0,0,'MechanicalEngineering',NULL,'EWS',0),(1017,1548,'EN23243660','ghode.deepak.m12u3oqz@gmail.com','GHODE YOGIRAJ DEEPAK',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1018,1642,'EN23112879','joshi.aditya.nftjtpcr@gmail.com','JOSHI SIDDHARTH ADITYA',0,0,'MechanicalEngineering',NULL,'SC',0),(1019,1656,'EN23229050','agashe.sachin.hz3veshe@gmail.com','AGASHE SUMEDHA SACHIN',0,0,'MechanicalEngineering',NULL,'OBC',0),(1020,1658,'EN23158949','bhokare.gunda.3gvvswxb@gmail.com','BHOKARE SUYOG GUNDA',0,0,'MechanicalEngineering',NULL,'EWS',0),(1021,1672,'EN23141489','mohammed.aziz.w64ojm30@gmail.com','MOHAMMED BILAL AZIZ',0,0,'MechanicalEngineering',NULL,'OBC',0),(1022,1691,'EN23122483','karanpreet.vij.tzawb4xx@gmail.com','KARANPREET SINGH VIJ',0,0,'MechanicalEngineering',NULL,'OBC',0),(1023,1710,'EN23226361','pawar.ashok.ti6ywf69@gmail.com','PAWAR VEDANT ASHOK',0,0,'MechanicalEngineering',NULL,'OBC',0),(1024,1724,'EN23141546','pednekar.laxmesh.jyualsey@gmail.com','PEDNEKAR RUHI LAXMESH',0,0,'MechanicalEngineering',NULL,'EWS',0),(1025,1728,'EN23197252','jordan.lionel.0cc7cf95@gmail.com','JORDAN NATHAN LIONEL',0,0,'MechanicalEngineering',NULL,'OBC',0),(1026,1729,'EN23177366','dande.shyam.y0bxzaxf@gmail.com','DANDE ANISH SHYAM',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1027,1746,'EN23110652','chaphalkar.santosh.g9by2uac@gmail.com','CHAPHALKAR ATHARV SANTOSH',0,0,'MechanicalEngineering',NULL,'OBC',0),(1028,1792,'EN23205245','yash.chitale.4vhpvmhv@gmail.com','YASH CHITALE',0,0,'MechanicalEngineering',NULL,'OBC',0),(1029,1807,'EN23271575','vivek.sawant.6o2n4zhg@gmail.com','VIVEK MILIND SAWANT',0,0,'MechanicalEngineering',NULL,'EWS',0),(1030,1822,'EN23169846','patil.manoj.q3bcj7ej@gmail.com','PATIL SPANDAN MANOJ',0,0,'MechanicalEngineering',NULL,'SC',0),(1301,2488,'EN23174985','potdar.abhay.7ri12bzj@gmail.com','POTDAR RAJAS ABHAY',0,1,'ManufacturingEngineering',NULL,'OBC',0),(1302,2532,'EN23113653','ray.navin.ha25yu02@gmail.com','RAY SHUBHAM NAVIN',0,1,'ManufacturingEngineering',NULL,'SC',0),(1303,2565,'EN23180235','naseri.amit.i3oe0eg2@gmail.com','NASERI CHIRAG AMIT',0,1,'ManufacturingEngineering',NULL,'SC',0),(1304,2653,'EN23123728','angre.sanjay.ijh10mmf@gmail.com','ANGRE AARY SANJAY',0,1,'ManufacturingEngineering',NULL,'OPEN',0),(1305,2660,'EN23149014','bamishte.amol.3nm1pohe@gmail.com','BAMISHTE APOORV AMOL',0,1,'ManufacturingEngineering',NULL,'SC',0),(1306,2743,'EN23126739','harne.kshitij.snqf9v5x@gmail.com','HARNE NIDHISH KSHITIJ',0,1,'ManufacturingEngineering',NULL,'OBC',0),(1308,2985,'EN23111226','dandekar.vishwas.kshee06v@gmail.com','DANDEKAR AMEY VISHWAS',0,1,'ManufacturingEngineering',NULL,'OPEN',0),(1309,3152,'EN23163337','ghogare.sugriv.2zrh3njb@gmail.com','GHOGARE SAMARTH SUGRIV',0,1,'ManufacturingEngineering',NULL,'SC',0),(1310,3394,'EN23177423','kulkarni.ashok.tymxujps@gmail.com','KULKARNI PRANAV ASHOK',0,1,'ManufacturingEngineering',NULL,'OBC',0),(1311,3480,'EN23186609','govilkar.ruturaj.swoe2g86@gmail.com','GOVILKAR CHINMAY RUTURAJ',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1312,3524,'EN23153487','yash.shrivastava.d8dhlaf0@gmail.com','YASH SHRIVASTAVA',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1313,3610,'EN23182700','thite.deepak.fb7mem6i@gmail.com','THITE ANURAG DEEPAK',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1314,3711,'EN23200672','bedarkar.amit.88va6yek@gmail.com','BEDARKAR ATHARVA AMIT',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1315,3810,'EN23143546','salgaokar.hemant.m7tg70er@gmail.com','SALGAOKAR ARJUN HEMANT',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1316,3820,'EN23103632','devashish.ghodki.8ggir0gi@gmail.com','DEVASHISH GHODKI',0,0,'ManufacturingEngineering',NULL,'SC',0),(1317,3997,'EN23138705','aditya.sanjeevi.t8iiajqw@gmail.com','ADITYA SANJEEVI',0,0,'ManufacturingEngineering',NULL,'SC',0),(1319,4233,'EN23141632','dange.jayant.t63qxeeg@gmail.com','DANGE SAURISH JAYANT',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1320,4408,'EN23171215','ved.thombre.521klq11@gmail.com','VED SHAILESH THOMBRE',0,0,'ManufacturingEngineering',NULL,'SC',0),(1321,4857,'EN23230235','tangadpalliwar.mallesh.u480w17b@gmail.com','TANGADPALLIWAR VAMSHI MALLESH',0,0,'ManufacturingEngineering',NULL,'OBC',0),(1322,4933,'EN23133620','lonbale.suresh.9e69un3i@gmail.com','LONBALE TANMAY SURESH',0,0,'ManufacturingEngineering',NULL,'OBC',0),(1323,5375,'EN23128411','brahmankar.manoj.42kcudzv@gmail.com','BRAHMANKAR SUMEDH MANOJ',0,0,'ManufacturingEngineering',NULL,'SC',0),(1324,5646,'EN23209881','dhakne.sudhakar.jtvy2a79@gmail.com','DHAKNE SATYAM SUDHAKAR',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1325,5675,'EN23228831','kandalkar.mohanrao.b0skvwyy@gmail.com','KANDALKAR MOHIT MOHANRAO',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1326,6097,'EN23185978','warke.devendra.sx02to9i@gmail.com','WARKE TOSHIT DEVENDRA',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1327,6483,'EN23125946','pandey.santosh.w0bc642d@gmail.com','PANDEY ANJALI SANTOSH',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1328,6507,'EN23102033','ananya.das.z53x0lt1@gmail.com','ANANYA DAS',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1329,6510,'EN23141713','mayur.lokhande.bk95jt9g@gmail.com','MAYUR VILAS LOKHANDE',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1330,6520,'EN23147207','dawange.sanjay.16p8rrzp@gmail.com','DAWANGE SIDDHESH SANJAY',0,0,'ManufacturingEngineering',NULL,'EWS',0);
/*!40000 ALTER TABLE `registration_firstyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_secondyear`
--

DROP TABLE IF EXISTS `registration_secondyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_secondyear` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `rank` double NOT NULL,
  `application_id` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `selected` tinyint(1) DEFAULT '0',
  `branch` varchar(100) DEFAULT NULL,
  `caste` varchar(10) DEFAULT NULL,
  `payment_done` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_secondyear`
--

LOCK TABLES `registration_secondyear` WRITE;
/*!40000 ALTER TABLE `registration_secondyear` DISABLE KEYS */;
INSERT INTO `registration_secondyear` VALUES (101,25,4.44,'112101002','avadhootsghewade4757@gmail.com','AJAY XYZ DESHMUKH',1,1,'CivilEngineering','OBC',0),(102,27,2.74,'112101004','avadhootsghewade4757@gmail.com','AKETO G SHOHE',1,1,'CivilEngineering','OPEN',0),(103,NULL,6.37,'112101009','student3_civil_engineering@example.com','BHERDE MAHENDRA DAMODAR',0,1,'CivilEngineering','SC',0),(104,NULL,4.37,'112101040','student4_civil_engineering@example.com','NIKA M ZHIMO',0,1,'CivilEngineering','SC',0),(105,NULL,3.16,'112101060','student5_civil_engineering@example.com','ROHAN RAVINDRA NAWALE',0,1,'CivilEngineering','SC',0),(106,NULL,3.84,'612201001','student6_civil_engineering@example.com','AKASH XYZ PANDITA',0,1,'CivilEngineering','EWS',0),(107,NULL,8.78,'612201002','student7_civil_engineering@example.com','BAROTE SAKSHI CHANDRASHEKHAR',0,1,'CivilEngineering','EWS',0),(108,NULL,6.57,'612201003','student8_civil_engineering@example.com','BHAVYA RAJESH MODI',0,1,'CivilEngineering','SC',0),(109,NULL,5.35,'612201004','student9_civil_engineering@example.com','BHOPALE ANIRUDDHA RAJENDRA',0,1,'CivilEngineering','SC',0),(110,NULL,8.2,'612201005','student10_civil_engineering@example.com','BORADE ARYA GANESH',0,1,'CivilEngineering','OPEN',0),(111,NULL,8.42,'612201006','student11_civil_engineering@example.com','CHAJED LAKSH GIRISHKUMAR',0,0,'CivilEngineering','SC',0),(112,NULL,4.14,'612201007','student12_civil_engineering@example.com','CHAKRAWARTI SIDDHI VIJAY',0,0,'CivilEngineering','OBC',0),(113,NULL,5.04,'612201008','student13_civil_engineering@example.com','CHAUDHARI KUNAL SHANKAR',0,0,'CivilEngineering','SC',0),(114,NULL,4.88,'612201009','student14_civil_engineering@example.com','CHAVAN OM DATTARAO',0,0,'CivilEngineering','OPEN',0),(115,NULL,6.43,'612201010','student15_civil_engineering@example.com','CHAVAN SACHIN DIGAMBAR',0,0,'CivilEngineering','EWS',0),(116,NULL,6.75,'612201011','student16_civil_engineering@example.com','CHAVAN SUMIT PRASHANT',0,0,'CivilEngineering','EWS',0),(117,NULL,6.89,'612201012','student17_civil_engineering@example.com','CHAVAN VEDANTI DATTATRAY',0,0,'CivilEngineering','OPEN',0),(118,NULL,3.79,'612201013','student18_civil_engineering@example.com','CHOBAO XYZ TUNGOE',0,0,'CivilEngineering','EWS',0),(119,NULL,7.51,'612201014','student19_civil_engineering@example.com','CHOUGULE ADITYA RAMESH',0,0,'CivilEngineering','OPEN',0),(120,NULL,5.51,'612201015','student20_civil_engineering@example.com','DANI B DUNIYA',0,0,'CivilEngineering','OBC',0),(121,NULL,6.68,'612201016','student21_civil_engineering@example.com','DANISH XYZ KABEER',0,0,'CivilEngineering','EWS',0),(122,NULL,7.06,'612201017','student22_civil_engineering@example.com','DESHMUKH RANA SANJAY',0,0,'CivilEngineering','EWS',0),(123,NULL,6.57,'612201018','student23_civil_engineering@example.com','DHANDE SHAMLI SURENDRA',0,0,'CivilEngineering','SC',0),(124,NULL,5.49,'612201019','student24_civil_engineering@example.com','DHARKAR VIRAJ PRAKASH',0,0,'CivilEngineering','SC',0),(125,NULL,5.75,'612201020','student25_civil_engineering@example.com','DHONDGE KARTIK ANANDA',0,0,'CivilEngineering','SC',0),(126,NULL,3.29,'612201021','student26_civil_engineering@example.com','GADGE SANKET SANJAY',0,0,'CivilEngineering','OBC',0),(127,NULL,7.92,'612201022','student27_civil_engineering@example.com','GAIDHANI SHARWARI MAHESH',0,0,'CivilEngineering','SC',0),(128,NULL,7.77,'612201023','student28_civil_engineering@example.com','GAIKWAD DHANANJAY RAMESH',0,0,'CivilEngineering','EWS',0),(129,NULL,5.45,'612201024','student29_civil_engineering@example.com','GHADGE TANMAY RAHUL',0,0,'CivilEngineering','SC',0),(130,NULL,5.2,'612201025','student30_civil_engineering@example.com','GHODKE NAMAN BIRUDEV',0,0,'CivilEngineering','OBC',0),(301,NULL,4.94,'112103115','student1_computer_engineering@example.com','RAUT EKTAA MANIKLAL',0,1,'ComputerEngineering','OBC',0),(302,NULL,9.31,'612203054','student2_computer_engineering@example.com','NIKAM AVIRAJ AJAY',0,1,'ComputerEngineering','OPEN',0),(303,NULL,6.94,'612203001','student3_computer_engineering@example.com','AADITYA SAMEER ZAVAR',0,1,'ComputerEngineering','SC',0),(304,NULL,6.28,'612203002','student4_computer_engineering@example.com','AARNAV KAUSHAL SANGHAVI',0,1,'ComputerEngineering','SC',0),(305,NULL,8.7,'612203003','student5_computer_engineering@example.com','ADEEB IDRIS MURTAZA',0,1,'ComputerEngineering','EWS',0),(306,NULL,8,'612203004','student6_computer_engineering@example.com','ADITI RAJENDRA PATIL',0,1,'ComputerEngineering','SC',0),(307,NULL,5.63,'612203005','student7_computer_engineering@example.com','ADVAIT SUJIT WANKHADE',0,1,'ComputerEngineering','SC',0),(308,NULL,5.33,'612203006','student8_computer_engineering@example.com','AGHAV VAIBHAV RAJESH',0,1,'ComputerEngineering','OBC',0),(309,NULL,6.53,'612203007','student9_computer_engineering@example.com','AKASH G MESTHA',0,1,'ComputerEngineering','OPEN',0),(310,NULL,9.42,'612203008','student10_computer_engineering@example.com','ANISH DAYANAND SHETTY',0,1,'ComputerEngineering','EWS',0),(311,NULL,8,'612203009','student11_computer_engineering@example.com','ARAGANJI SHREYA SHIVANAND',0,0,'ComputerEngineering','OPEN',0),(312,NULL,8.52,'612203010','student12_computer_engineering@example.com','ARLIMAR SUYOG RAJESH',0,0,'ComputerEngineering','OBC',0),(313,NULL,9.06,'612203011','student13_computer_engineering@example.com','ARNAV B PRASAD',0,0,'ComputerEngineering','EWS',0),(314,NULL,8.94,'612203013','student14_computer_engineering@example.com','ATHARVA PRADEEP SARDESAI',0,0,'ComputerEngineering','OPEN',0),(315,NULL,8.13,'612203014','student15_computer_engineering@example.com','BADVE MALHAR ANAND',0,0,'ComputerEngineering','OPEN',0),(316,NULL,8.56,'612203015','student16_computer_engineering@example.com','BANGAD SURABHI MAHESH',0,0,'ComputerEngineering','SC',0),(317,NULL,7.31,'612203016','student17_computer_engineering@example.com','BANKAR ARNAV MAHESH',0,0,'ComputerEngineering','OPEN',0),(318,NULL,7.8,'612203017','student18_computer_engineering@example.com','BHAGWAT ONKAR BHAGWAN',0,0,'ComputerEngineering','OBC',0),(319,NULL,8.41,'612203018','student19_computer_engineering@example.com','BHARGAV SANJEEV GEJJI',0,0,'ComputerEngineering','OBC',0),(320,NULL,6.45,'612203019','student20_computer_engineering@example.com','BHATKANDE SHASHANK SHIVAJI',0,0,'ComputerEngineering','EWS',0),(321,NULL,7.14,'612203020','student21_computer_engineering@example.com','BHOSALE HRISHIKESH UMESH',0,0,'ComputerEngineering','SC',0),(322,NULL,8.94,'612203021','student22_computer_engineering@example.com','BHOSALE PRAJWAL PRABODH',0,0,'ComputerEngineering','SC',0),(323,NULL,7.23,'612203022','student23_computer_engineering@example.com','BORHADE AYUSH DATTATRAY',0,0,'ComputerEngineering','OPEN',0),(324,NULL,7.55,'612203023','student24_computer_engineering@example.com','CHANDRATREYA PRACHETAS SUJIT',0,0,'ComputerEngineering','OBC',0),(325,NULL,3.95,'612203024','student25_computer_engineering@example.com','CHAPNE CHANDRADEEP UMESH',0,0,'ComputerEngineering','EWS',0),(326,NULL,7.83,'612203025','student26_computer_engineering@example.com','CHAUDHARI NIDHI NANDKUMAR',0,0,'ComputerEngineering','SC',0),(327,NULL,8.89,'612203026','student27_computer_engineering@example.com','CHAUDHARY AVNISH RAJIV',0,0,'ComputerEngineering','SC',0),(328,NULL,8.83,'612203027','student28_computer_engineering@example.com','CHAVAN SUMEDH MAHAVEER',0,0,'ComputerEngineering','SC',0),(329,NULL,9.17,'612203028','student29_computer_engineering@example.com','CHHATRE TANMAY AJIT',0,0,'ComputerEngineering','SC',0),(330,NULL,7.19,'612203029','student30_computer_engineering@example.com','CHINMAY XYZ BARVE',0,0,'ComputerEngineering','OPEN',0),(501,NULL,3.69,'112105065','student1_electrical_engineering@example.com','TUPLONDHE NIVEDITA SUNIL',0,1,'ElectricalEngineering','OPEN',0),(502,NULL,5.48,'612205001','student2_electrical_engineering@example.com','ABHISHEK ANNASO KALE',0,1,'ElectricalEngineering','OPEN',0),(503,NULL,4.87,'612205002','student3_electrical_engineering@example.com','ADITYA MAHESH WARUNGSHE',0,1,'ElectricalEngineering','SC',0),(504,NULL,7.75,'612205003','student4_electrical_engineering@example.com','ANJALI B VISHWAKARMA',0,1,'ElectricalEngineering','SC',0),(505,NULL,8.41,'612205004','student5_electrical_engineering@example.com','APOORV B JADHAV',0,1,'ElectricalEngineering','SC',0),(506,NULL,5.62,'612205005','student6_electrical_engineering@example.com','AVHAD SRUSHTI DIGAMBAR',0,1,'ElectricalEngineering','SC',0),(507,NULL,5.46,'612205006','student7_electrical_engineering@example.com','BADGUJAR MITESH VISHWASRAO',0,1,'ElectricalEngineering','OPEN',0),(508,NULL,8.11,'612205007','student8_electrical_engineering@example.com','BHAGWAT PAARTH VIKAS',0,1,'ElectricalEngineering','EWS',0),(509,NULL,4.82,'612205008','student9_electrical_engineering@example.com','BHOSALE VIDUR DASHARATH',0,1,'ElectricalEngineering','SC',0),(510,NULL,7.7,'612205009','student10_electrical_engineering@example.com','BHUSARI TANVI DINESH',0,1,'ElectricalEngineering','OPEN',0),(511,NULL,6.3,'612205010','student11_electrical_engineering@example.com','BIRIA DHANASHREE KAPIL',0,0,'ElectricalEngineering','OPEN',0),(512,NULL,6.6,'612205012','student12_electrical_engineering@example.com','CHAUDHARI SMRUTI NILESH',0,0,'ElectricalEngineering','OBC',0),(513,NULL,7.92,'612205013','student13_electrical_engineering@example.com','DALVI ATHARVA SANJAY',0,0,'ElectricalEngineering','OPEN',0),(514,NULL,8.06,'612205014','student14_electrical_engineering@example.com','DAMLE SHRUTEE VINAY',0,0,'ElectricalEngineering','OBC',0),(515,NULL,9.11,'612205015','student15_electrical_engineering@example.com','DESHMUKH YASHWANT VINAY',0,0,'ElectricalEngineering','SC',0),(516,NULL,8.84,'612205016','student16_electrical_engineering@example.com','DESHPANDE SHREERANG RAJESH',0,0,'ElectricalEngineering','OBC',0),(517,NULL,6.94,'612205017','student17_electrical_engineering@example.com','DHIKALE TEJAS HIRAMAN',0,0,'ElectricalEngineering','EWS',0),(518,NULL,7.98,'612205018','student18_electrical_engineering@example.com','DIGRASKAR PRANAV PRAKASHRAO',0,0,'ElectricalEngineering','SC',0),(519,NULL,8.14,'612205019','student19_electrical_engineering@example.com','DONGRE PRATIK RAGHUNATH',0,0,'ElectricalEngineering','SC',0),(520,NULL,5.48,'612205020','student20_electrical_engineering@example.com','FARTADE YASH SANJAY',0,0,'ElectricalEngineering','EWS',0),(521,NULL,8.3,'612205021','student21_electrical_engineering@example.com','GHOTGALKAR TANVI DURGESH',0,0,'ElectricalEngineering','EWS',0),(522,NULL,5.17,'612205022','student22_electrical_engineering@example.com','HIMANSU SEKHAR HATI',0,0,'ElectricalEngineering','OBC',0),(523,NULL,6,'612205023','student23_electrical_engineering@example.com','IMTIYAZ B HUSSAIN',0,0,'ElectricalEngineering','OPEN',0),(524,NULL,5.03,'612205024','student24_electrical_engineering@example.com','INWATE ADITYA JAGDISH',0,0,'ElectricalEngineering','OPEN',0),(525,NULL,5.86,'612205025','student25_electrical_engineering@example.com','JADHAV NAMRATA BHIMRAO',0,0,'ElectricalEngineering','OBC',0),(526,NULL,4.35,'612205026','student26_electrical_engineering@example.com','JADHAV OMKAR DINESH',0,0,'ElectricalEngineering','EWS',0),(527,NULL,7.94,'612205027','student27_electrical_engineering@example.com','JOSHI MEGHA AMARENDRA',0,0,'ElectricalEngineering','EWS',0),(528,NULL,6.59,'612205028','student28_electrical_engineering@example.com','KAIVALYA B RAUT',0,0,'ElectricalEngineering','OBC',0),(529,NULL,7.11,'612205030','student29_electrical_engineering@example.com','KAMBLE PRANAV KIRAN',0,0,'ElectricalEngineering','OBC',0),(530,NULL,7.13,'612205031','student30_electrical_engineering@example.com','KARE SANIKA SARJERAO',0,0,'ElectricalEngineering','OBC',0),(901,NULL,4.87,'112109007','student1_instrumentation_engineering@example.com','GADEKAR VAISHNAVI VIJAY',0,1,'InstrumentationEngineering','EWS',0),(902,NULL,3.89,'112109017','student2_instrumentation_engineering@example.com','KULMETHE SAHIL BHUJANGRAO',0,1,'InstrumentationEngineering','OBC',0),(903,NULL,6.41,'112109040','student3_instrumentation_engineering@example.com','LANDE VEDANT VIJAY',0,1,'InstrumentationEngineering','EWS',0),(904,NULL,7.81,'612209001','student4_instrumentation_engineering@example.com','ADITYA ANAND SINGH',0,1,'InstrumentationEngineering','EWS',0),(905,NULL,5.68,'612209002','student5_instrumentation_engineering@example.com','AMAR JAGANNATH SANAP',0,1,'InstrumentationEngineering','OBC',0),(906,NULL,7.49,'612209003','student6_instrumentation_engineering@example.com','ARORA VANSHIKA KAMAL',0,1,'InstrumentationEngineering','OBC',0),(907,NULL,6.4,'612209004','student7_instrumentation_engineering@example.com','ARYAN KEDAR KULKARNI',0,1,'InstrumentationEngineering','EWS',0),(908,NULL,7.03,'612209005','student8_instrumentation_engineering@example.com','BANKAR TUSHAR SOPAN',0,1,'InstrumentationEngineering','OPEN',0),(909,NULL,6.05,'612209006','student9_instrumentation_engineering@example.com','BURADKAR SATVIK SANDEEP',0,1,'InstrumentationEngineering','EWS',0),(910,NULL,3.96,'612209007','student10_instrumentation_engineering@example.com','CHAUDHARY ABHAY NARESH',0,1,'InstrumentationEngineering','OBC',0),(911,NULL,7.43,'612209008','student11_instrumentation_engineering@example.com','CHAURPAGAR VAIBHAVI SOPAN',0,0,'InstrumentationEngineering','OBC',0),(912,NULL,9.1,'612209009','student12_instrumentation_engineering@example.com','DAMLE ADITYA VINAY',0,0,'InstrumentationEngineering','OPEN',0),(913,NULL,8.97,'612209010','student13_instrumentation_engineering@example.com','DANDEKAR PARAM RAHUL',0,0,'InstrumentationEngineering','EWS',0),(914,NULL,7.16,'612209011','student14_instrumentation_engineering@example.com','DESAI JAASHAK DIVYESH',0,0,'InstrumentationEngineering','OPEN',0),(915,NULL,3.82,'612209012','student15_instrumentation_engineering@example.com','DHANGARE AMIT BALKRUSHNA',0,0,'InstrumentationEngineering','OBC',0),(916,NULL,5.98,'612209013','student16_instrumentation_engineering@example.com','DHANWADE UDAY NARAYAN',0,0,'InstrumentationEngineering','EWS',0),(917,NULL,4.7,'612209014','student17_instrumentation_engineering@example.com','DHORMARE VISHAL GORAKSHNATH',0,0,'InstrumentationEngineering','OBC',0),(918,NULL,6.44,'612209015','student18_instrumentation_engineering@example.com','DISHA XYZ DIXIT',0,0,'InstrumentationEngineering','EWS',0),(919,NULL,8.79,'612209016','student19_instrumentation_engineering@example.com','GHISAD ANEESH SANDEEP',0,0,'InstrumentationEngineering','SC',0),(920,NULL,8.79,'612209017','student20_instrumentation_engineering@example.com','GURAV ATHARVA RAJENDRA',0,0,'InstrumentationEngineering','SC',0),(921,NULL,8.56,'612209018','student21_instrumentation_engineering@example.com','HINGANE NANDINI PRAKASH',0,0,'InstrumentationEngineering','EWS',0),(922,NULL,7.71,'612209019','student22_instrumentation_engineering@example.com','HITESH B SAMANTARAY',0,0,'InstrumentationEngineering','OPEN',0),(923,NULL,8.08,'612209020','student23_instrumentation_engineering@example.com','JAITIRTH VISHVESH PAGE',0,0,'InstrumentationEngineering','EWS',0),(924,NULL,8.35,'612209021','student24_instrumentation_engineering@example.com','JOGIPETHKAR SANIKA SHRINIWAS',0,0,'InstrumentationEngineering','EWS',0),(925,NULL,3.81,'612209022','student25_instrumentation_engineering@example.com','KADAM SHREERAM ASHOK',0,0,'InstrumentationEngineering','OBC',0),(926,NULL,8.35,'612209023','student26_instrumentation_engineering@example.com','KESKAR SHRUTI AMOL',0,0,'InstrumentationEngineering','OPEN',0),(927,NULL,5.54,'612209024','student27_instrumentation_engineering@example.com','KHUSHAL B BANSAL',0,0,'InstrumentationEngineering','SC',0),(928,NULL,5.35,'612209025','student28_instrumentation_engineering@example.com','KORE VAIBHAVI RAVIKIRAN',0,0,'InstrumentationEngineering','OBC',0),(929,NULL,6.98,'612209026','student29_instrumentation_engineering@example.com','KULKARNI AVDHUT VINAYAK',0,0,'InstrumentationEngineering','OBC',0),(930,NULL,8.76,'612209028','student30_instrumentation_engineering@example.com','LUNKAD MOHAK PAWAN',0,0,'InstrumentationEngineering','SC',0),(1001,NULL,2.72,'112110024','student1_mechanical_engineering@example.com','CHAUDHARI PINAL NITIN',0,1,'MechanicalEngineering','OPEN',0),(1002,NULL,3.42,'112110034','student2_mechanical_engineering@example.com','DARADE HRUSHIKESH SHRIMANT',0,1,'MechanicalEngineering','OPEN',0),(1003,NULL,3.69,'112110070','student3_mechanical_engineering@example.com','MAHESHKAR MANAUTI BHOJRAJ',0,1,'MechanicalEngineering','SC',0),(1004,NULL,3.73,'112110082','student4_mechanical_engineering@example.com','MUSALE CHIRAG PRADIP',0,1,'MechanicalEngineering','OBC',0),(1005,NULL,3.18,'112110089','student5_mechanical_engineering@example.com','PANDAV HARSHIKANT RAJESH',0,1,'MechanicalEngineering','OPEN',0),(1006,NULL,4.29,'112110126','student6_mechanical_engineering@example.com','SONAVANE AVADHOOT SHAILESH',0,1,'MechanicalEngineering','OPEN',0),(1007,NULL,3.63,'112110149','student7_mechanical_engineering@example.com','SONAWANE HARSH PRAKASH',0,1,'MechanicalEngineering','SC',0),(1008,NULL,6.92,'612210001','student8_mechanical_engineering@example.com','AAKRUTI XYZ TIWARI',0,1,'MechanicalEngineering','EWS',0),(1009,NULL,8.62,'612210002','student9_mechanical_engineering@example.com','AARYA SANDEEP KENDALE',0,1,'MechanicalEngineering','SC',0),(1010,NULL,5.89,'612210003','student10_mechanical_engineering@example.com','ABHISHEK XYZ DESAI',0,1,'MechanicalEngineering','OBC',0),(1011,NULL,6.72,'612210004','student11_mechanical_engineering@example.com','ADWAIT MILIND DIVEKAR',0,0,'MechanicalEngineering','EWS',0),(1012,NULL,8.75,'612210005','student12_mechanical_engineering@example.com','AMBEKAR TEJ ANURAG',0,0,'MechanicalEngineering','SC',0),(1013,NULL,7.48,'612210006','student13_mechanical_engineering@example.com','ANIKET B NARAYAN',0,0,'MechanicalEngineering','EWS',0),(1014,NULL,3.4,'612210007','student14_mechanical_engineering@example.com','ANMOL B RAINA',0,0,'MechanicalEngineering','EWS',0),(1015,NULL,8.63,'612210008','student15_mechanical_engineering@example.com','ANSHIL XYZ EVEREN',0,0,'MechanicalEngineering','OPEN',0),(1016,NULL,5.31,'612210009','student16_mechanical_engineering@example.com','ARADHYE GIRISH ATUL',0,0,'MechanicalEngineering','OBC',0),(1017,NULL,7.32,'612210010','student17_mechanical_engineering@example.com','ARYA PRADEEP THORAT',0,0,'MechanicalEngineering','OPEN',0),(1018,NULL,7.23,'612210011','student18_mechanical_engineering@example.com','ARYAN KUMAR BINDROO',0,0,'MechanicalEngineering','EWS',0),(1019,NULL,8.12,'612210012','student19_mechanical_engineering@example.com','ATHARVA XYZ NENE',0,0,'MechanicalEngineering','EWS',0),(1020,NULL,7.88,'612210013','student20_mechanical_engineering@example.com','ATHARVA B SOMAIYA',0,0,'MechanicalEngineering','OPEN',0),(1021,NULL,7.82,'612210016','student21_mechanical_engineering@example.com','AVHAD SIDDHI PRAMOD',0,0,'MechanicalEngineering','SC',0),(1022,NULL,7.23,'612210017','student22_mechanical_engineering@example.com','AYUSH XYZ PARASHAR',0,0,'MechanicalEngineering','OBC',0),(1023,NULL,7.75,'612210018','student23_mechanical_engineering@example.com','AYUSH XYZ TOMAR',0,0,'MechanicalEngineering','OBC',0),(1024,NULL,6.49,'612210019','student24_mechanical_engineering@example.com','BAGADE PRANAV PRADIP',0,0,'MechanicalEngineering','OBC',0),(1025,NULL,5.82,'612210020','student25_mechanical_engineering@example.com','BANCHOD AADITYA VINAYAK',0,0,'MechanicalEngineering','OBC',0),(1026,NULL,8.75,'612210021','student26_mechanical_engineering@example.com','BANKAR ASHWIN CHANDRAKANT',0,0,'MechanicalEngineering','SC',0),(1027,NULL,6.17,'612210022','student27_mechanical_engineering@example.com','BEJEKAR SOHAM SANTOSHKUMAR',0,0,'MechanicalEngineering','EWS',0),(1028,NULL,9.15,'612210023','student28_mechanical_engineering@example.com','BHAGWAT DARSHAN MAHESH',0,0,'MechanicalEngineering','OBC',0),(1029,NULL,7.54,'612210024','student29_mechanical_engineering@example.com','BHAGWAT MIHIKA PRASHANT',0,0,'MechanicalEngineering','OBC',0),(1030,NULL,6.97,'612210025','student30_mechanical_engineering@example.com','BHALERAO SWAPNIL KIRAN',0,0,'MechanicalEngineering','OPEN',0),(1301,NULL,4.22,'112113031','student1_manufacturing_engineering@example.com','KHARAT SAMIKSHA SHAMRAO',0,1,'ManufacturingEngineering','OBC',0),(1302,NULL,3,'112113037','student2_manufacturing_engineering@example.com','MAHAJAN SHRUTI GOPICHAND',0,1,'ManufacturingEngineering','EWS',0),(1303,NULL,3.63,'112113055','student3_manufacturing_engineering@example.com','SOLANKE SAKSHI SANTOSH',0,1,'ManufacturingEngineering','OPEN',0),(1304,NULL,4.3,'112113058','student4_manufacturing_engineering@example.com','TAKALKAR ADITYA SWAMI',0,1,'ManufacturingEngineering','OPEN',0),(1305,NULL,8.92,'612213114','student5_manufacturing_engineering@example.com','ATUL BANWARILAL PODDAR',0,1,'ManufacturingEngineering','EWS',0),(1306,NULL,7.88,'612213001','student6_manufacturing_engineering@example.com','AKSHAT CHANDRAKANT DAKHANE',0,1,'ManufacturingEngineering','OBC',0),(1307,NULL,7.48,'612213002','student7_manufacturing_engineering@example.com','AMBEKAR ABHISHEK GANESH',0,1,'ManufacturingEngineering','OPEN',0),(1308,NULL,5.83,'612213003','student8_manufacturing_engineering@example.com','ARNAV KAVISH WARHADE',0,1,'ManufacturingEngineering','SC',0),(1309,NULL,4.7,'612213004','student9_manufacturing_engineering@example.com','ATHARVA PRAVIN SHINGANE',0,1,'ManufacturingEngineering','OPEN',0),(1310,NULL,8.16,'612213005','student10_manufacturing_engineering@example.com','AZEEM LIYAKAT MAGDUM',0,1,'ManufacturingEngineering','OBC',0),(1311,NULL,5.88,'612213006','student11_manufacturing_engineering@example.com','BALDAWA ISHAAN RADHESHYAM',0,0,'ManufacturingEngineering','OPEN',0),(1312,NULL,3.94,'612213007','student12_manufacturing_engineering@example.com','BALLAL SHARDUL AVINASH',0,0,'ManufacturingEngineering','EWS',0),(1313,NULL,6.59,'612213009','student13_manufacturing_engineering@example.com','BHAGAT UMEED SAMUDRA',0,0,'ManufacturingEngineering','OBC',0),(1314,NULL,6.89,'612213010','student14_manufacturing_engineering@example.com','BHAISWAR SAHIL MUKESH',0,0,'ManufacturingEngineering','OPEN',0),(1315,NULL,8.27,'612213011','student15_manufacturing_engineering@example.com','BHANDARI HARSHALI SANJAY',0,0,'ManufacturingEngineering','EWS',0),(1316,NULL,5.33,'612213012','student16_manufacturing_engineering@example.com','BHUTADA SHRAVAN VIJAY',0,0,'ManufacturingEngineering','EWS',0),(1317,NULL,6.84,'612213013','student17_manufacturing_engineering@example.com','BIDKAR ANUSHKA PRALHAD',0,0,'ManufacturingEngineering','EWS',0),(1318,NULL,5.49,'612213014','student18_manufacturing_engineering@example.com','BIRUTE YUVRAJ AJAY',0,0,'ManufacturingEngineering','SC',0),(1319,NULL,8.39,'612213015','student19_manufacturing_engineering@example.com','BIYANI NITYA KAMALKISHOR',0,0,'ManufacturingEngineering','EWS',0),(1320,NULL,6.47,'612213016','student20_manufacturing_engineering@example.com','BORSE OM JEEVAN',0,0,'ManufacturingEngineering','OPEN',0),(1321,NULL,8.03,'612213017','student21_manufacturing_engineering@example.com','CHAURE ROHIT MADHUKAR',0,0,'ManufacturingEngineering','SC',0),(1322,NULL,4.53,'612213018','student22_manufacturing_engineering@example.com','CHAVAN KAUSTUBH RAKESH',0,0,'ManufacturingEngineering','EWS',0),(1323,NULL,5.92,'612213019','student23_manufacturing_engineering@example.com','CHOPADE SAYALI SANDESH',0,0,'ManufacturingEngineering','SC',0),(1324,NULL,5.28,'612213020','student24_manufacturing_engineering@example.com','CHORE VARUN SUNIL',0,0,'ManufacturingEngineering','EWS',0),(1325,NULL,5.45,'612213021','student25_manufacturing_engineering@example.com','DADGE SHUBHAM SHIVANAND',0,0,'ManufacturingEngineering','OBC',0),(1326,NULL,4.86,'612213022','student26_manufacturing_engineering@example.com','DAHALE AADITYA ANNASAHEB',0,0,'ManufacturingEngineering','SC',0),(1327,NULL,5.36,'612213023','student27_manufacturing_engineering@example.com','DATAR AJAY BHARAT',0,0,'ManufacturingEngineering','SC',0),(1328,NULL,6.94,'612213024','student28_manufacturing_engineering@example.com','DEVASHISH PREMRAJ RADE',0,0,'ManufacturingEngineering','OBC',0),(1329,NULL,7.47,'612213025','student29_manufacturing_engineering@example.com','DHODAMANI PRANAV GURABASAPPA',0,0,'ManufacturingEngineering','SC',0),(1330,NULL,7.13,'612213026','student30_manufacturing_engineering@example.com','DHOOT ATHARV PURUSHOTTAMDAS',0,0,'ManufacturingEngineering','OPEN',0);
/*!40000 ALTER TABLE `registration_secondyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_selecteddates`
--

DROP TABLE IF EXISTS `registration_selecteddates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_selecteddates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `registration_period` varchar(100) NOT NULL,
  `selected_students_list` date NOT NULL,
  `preference_selection_date` varchar(100) NOT NULL,
  `final_room_allotment` date NOT NULL,
  `verification_period` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_selecteddates`
--

LOCK TABLES `registration_selecteddates` WRITE;
/*!40000 ALTER TABLE `registration_selecteddates` DISABLE KEYS */;
INSERT INTO `registration_selecteddates` VALUES (1,'2024-04-09 to 2024-04-11','2024-04-12','2024-04-13 to 2024-04-15','2024-04-16','2024-04-17 to 2024-04-20');
/*!40000 ALTER TABLE `registration_selecteddates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_thirdyear`
--

DROP TABLE IF EXISTS `registration_thirdyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_thirdyear` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rank` double NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  `caste` varchar(10) DEFAULT NULL,
  `payment_done` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_thirdyear_user_id_41e5fe1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_thirdyear`
--

LOCK TABLES `registration_thirdyear` WRITE;
/*!40000 ALTER TABLE `registration_thirdyear` DISABLE KEYS */;
INSERT INTO `registration_thirdyear` VALUES (101,6.69,'112101042','avadhootsghewade4757@gmail.com','PARSAWAT TEJAS MANOJ',1,1,'CivilEngineering',26,'OPEN',0),(102,7.93,'112101043','student2_civil_engineering@example.com','PATIL HARSHADA YUVRAJ',0,1,'CivilEngineering',NULL,'EWS',0),(103,6.92,'112101044','student3_civil_engineering@example.com','PATIL PIYUSH JITESH',0,1,'CivilEngineering',NULL,'OPEN',0),(104,6.11,'112101045','student4_civil_engineering@example.com','PATIL RISHIKESH VILAS',0,1,'CivilEngineering',NULL,'SC',0),(105,7.06,'112101046','student5_civil_engineering@example.com','PATIL RUSHIKESH YUVARAJ',0,1,'CivilEngineering',NULL,'OPEN',0),(106,8.35,'112101047','student6_civil_engineering@example.com','PATIL SMITA PRAKASH',0,1,'CivilEngineering',NULL,'OBC',0),(107,7.27,'112101048','student7_civil_engineering@example.com','PATIL SWAPNIL DHANANJAY',0,1,'CivilEngineering',NULL,'SC',0),(108,8.3,'112101049','student8_civil_engineering@example.com','PATIL VAISHNAVI SHARAD',0,1,'CivilEngineering',NULL,'EWS',0),(109,7.76,'112101050','student9_civil_engineering@example.com','PAWAR ADITYA VIKRAM',0,1,'CivilEngineering',NULL,'EWS',0),(110,6.64,'112101051','student10_civil_engineering@example.com','PEMA B TSOMU',0,1,'CivilEngineering',NULL,'EWS',0),(111,6.26,'112101052','student11_civil_engineering@example.com','PILLEWAR VAIBHAV RAJESHWAR',0,0,'CivilEngineering',NULL,'EWS',0),(112,7.09,'112101053','student12_civil_engineering@example.com','PRASAD GOPAL KUMAR',0,0,'CivilEngineering',NULL,'EWS',0),(113,6.39,'112101054','student13_civil_engineering@example.com','PRATHAMESH B DHOMSE',0,0,'CivilEngineering',NULL,'OBC',0),(114,7.78,'112101055','student14_civil_engineering@example.com','PRATIK B ROTHE',0,0,'CivilEngineering',NULL,'SC',0),(115,7.86,'112101056','student15_civil_engineering@example.com','PRATIMA PRAKASHSINGH RAJPUT',0,0,'CivilEngineering',NULL,'OPEN',0),(116,6.84,'112101057','student16_civil_engineering@example.com','RAMTEKE ANUSHKA AVINASH',0,0,'CivilEngineering',NULL,'OBC',0),(117,6.31,'112101058','student17_civil_engineering@example.com','RAMTEKE ARYAN DINESH',0,0,'CivilEngineering',NULL,'EWS',0),(118,7.3,'112101059','student18_civil_engineering@example.com','REVATI NAGOSING CHANDEL',0,0,'CivilEngineering',NULL,'SC',0),(119,6.45,'112101061','student19_civil_engineering@example.com','SAHARE VAISHNAVI BABU',0,0,'CivilEngineering',NULL,'OBC',0),(120,4.91,'112101063','student20_civil_engineering@example.com','SHANTANU B KHANANDE',0,0,'CivilEngineering',NULL,'SC',0),(121,7.84,'112101064','student21_civil_engineering@example.com','SHINDE ONKAR SHRIKANT',0,0,'CivilEngineering',NULL,'SC',0),(122,8.03,'112101065','student22_civil_engineering@example.com','SHINDE RADHA SURYAKANT',0,0,'CivilEngineering',NULL,'OPEN',0),(123,7.7,'112101066','student23_civil_engineering@example.com','SHUBHAM HANSRAJ AVHAD',0,0,'CivilEngineering',NULL,'OBC',0),(124,7.73,'112101067','student24_civil_engineering@example.com','SHWETGOURI SHIVAJIRAO JADHAV',0,0,'CivilEngineering',NULL,'OPEN',0),(125,6.38,'112101068','student25_civil_engineering@example.com','SOMANI SANKALP ATUL',0,0,'CivilEngineering',NULL,'OBC',0),(126,7.27,'112101069','student26_civil_engineering@example.com','SUDE MAYURI BHALCHANDRA',0,0,'CivilEngineering',NULL,'EWS',0),(127,6.08,'112101071','student27_civil_engineering@example.com','TIRPUDE OJAS KARTIK',0,0,'CivilEngineering',NULL,'OBC',0),(128,7.73,'112101073','student28_civil_engineering@example.com','VARUN B GUPTA',0,0,'CivilEngineering',NULL,'OBC',0),(129,6.78,'112101074','student29_civil_engineering@example.com','WAGHMARE ARYAN SHASHIKANT',0,0,'CivilEngineering',NULL,'OBC',0),(130,6.55,'112101075','student30_civil_engineering@example.com','WANKHADE SAHIL PRADNYAKAR',0,0,'CivilEngineering',NULL,'OBC',0),(301,7.07,'112103001','student1_computer_engineering@example.com','AARYA ROHIT KAWALAY',0,1,'ComputerEngineering',NULL,'SC',0),(302,6.15,'112103002','student2_computer_engineering@example.com','AAYUSH SHRIKANT ATHAWALE',0,1,'ComputerEngineering',NULL,'SC',0),(303,6.65,'112103003','student3_computer_engineering@example.com','ABHANG ANUJ PRAVIN',0,1,'ComputerEngineering',NULL,'SC',0),(304,9.31,'112103004','student4_computer_engineering@example.com','ABHINAV B KURULE',0,1,'ComputerEngineering',NULL,'OPEN',0),(305,6.45,'112103006','student5_computer_engineering@example.com','AISHWARYA PRAKASH KOLI',0,1,'ComputerEngineering',NULL,'SC',0),(306,8.49,'112103007','student6_computer_engineering@example.com','AJABE VISHAL ASHOK',0,1,'ComputerEngineering',NULL,'OPEN',0),(307,8.23,'112103008','student7_computer_engineering@example.com','AMAAN NAYEEM JAMADAR',0,1,'ComputerEngineering',NULL,'OBC',0),(308,6.02,'112103009','student8_computer_engineering@example.com','ANANTA DINESH HATWAR',0,1,'ComputerEngineering',NULL,'SC',0),(309,5.23,'112103010','student9_computer_engineering@example.com','ANAS NASIR SHAIKH',0,1,'ComputerEngineering',NULL,'OPEN',0),(310,7.65,'112103011','student10_computer_engineering@example.com','ANUSHKA VINOD MORE',0,1,'ComputerEngineering',NULL,'OBC',0),(311,9.42,'112103012','student11_computer_engineering@example.com','APTE MOHIT PARAG',0,0,'ComputerEngineering',NULL,'EWS',0),(312,5.65,'112103013','student12_computer_engineering@example.com','ARU PAWAN JAGANNATH',0,0,'ComputerEngineering',NULL,'EWS',0),(313,7.86,'112103014','student13_computer_engineering@example.com','ARYAN SHIRISH THAKRE',0,0,'ComputerEngineering',NULL,'EWS',0),(314,9.32,'112103015','student14_computer_engineering@example.com','ATHARVA ASHUTOSH MUTSADDI',0,0,'ComputerEngineering',NULL,'OPEN',0),(315,8.67,'112103016','student15_computer_engineering@example.com','AYUSH SAGAR AMBHORKAR',0,0,'ComputerEngineering',NULL,'OBC',0),(316,7.18,'112103017','student16_computer_engineering@example.com','BADARKHE HARIOM DNYANESHWAR',0,0,'ComputerEngineering',NULL,'OBC',0),(317,8.41,'112103018','student17_computer_engineering@example.com','BADGUJAR VAISHNAVI RAVINDRA',0,0,'ComputerEngineering',NULL,'OBC',0),(318,7.2,'112103019','student18_computer_engineering@example.com','BAVISKAR ADITYA PRAMOD',0,0,'ComputerEngineering',NULL,'OPEN',0),(319,8.57,'112103020','student19_computer_engineering@example.com','BHAGYASHREE LOMESH PATIL',0,0,'ComputerEngineering',NULL,'EWS',0),(320,5.86,'112103021','student20_computer_engineering@example.com','BHARGAVA DAKSHA NEERAJ',0,0,'ComputerEngineering',NULL,'SC',0),(321,8.73,'112103022','student21_computer_engineering@example.com','BHATKHANDE SHREYA SANDEEP',0,0,'ComputerEngineering',NULL,'EWS',0),(322,6.22,'112103023','student22_computer_engineering@example.com','BHOPALE SNEHAL PANDURANG',0,0,'ComputerEngineering',NULL,'SC',0),(323,6.34,'112103024','student23_computer_engineering@example.com','BHOSALE ABHIJEET AVINASH',0,0,'ComputerEngineering',NULL,'OPEN',0),(324,6.57,'112103025','student24_computer_engineering@example.com','BHOSALE PARAS CHANDRAKANT',0,0,'ComputerEngineering',NULL,'SC',0),(325,7.76,'112103026','student25_computer_engineering@example.com','BONGIRWAR YASH MILIND',0,0,'ComputerEngineering',NULL,'OPEN',0),(326,8.02,'112103027','student26_computer_engineering@example.com','BOSE SNEHASISH SUBRATO',0,0,'ComputerEngineering',NULL,'OPEN',0),(327,8.76,'112103028','student27_computer_engineering@example.com','CHAUDHARI VIPUL SANJAY',0,0,'ComputerEngineering',NULL,'OPEN',0),(328,7.47,'112103029','student28_computer_engineering@example.com','CHIDRAWAR KRISHNA GAJANAN',0,0,'ComputerEngineering',NULL,'OPEN',0),(329,9.51,'112103030','student29_computer_engineering@example.com','CHOUDHARY ADITYA PRASHANT',0,0,'ComputerEngineering',NULL,'OPEN',0),(330,7.58,'112103031','student30_computer_engineering@example.com','DATAR PRANAV PARAG',0,0,'ComputerEngineering',NULL,'EWS',0),(501,5.49,'111905073','student1_electrical_engineering@example.com','YOMDA B ORI',0,1,'ElectricalEngineering',NULL,'OPEN',0),(502,8.69,'112105062','student2_electrical_engineering@example.com','SHAIKH JUNAID ASLAM',0,1,'ElectricalEngineering',NULL,'EWS',0),(503,8.39,'112105001','student3_electrical_engineering@example.com','AAKANKSHA SHRINIVAS ADONI',0,1,'ElectricalEngineering',NULL,'OPEN',0),(504,5.6,'112105002','student4_electrical_engineering@example.com','AGRE RUPALI BHAIRU',0,1,'ElectricalEngineering',NULL,'OBC',0),(505,5.54,'112105003','student5_electrical_engineering@example.com','ANISH B PANDITH',0,1,'ElectricalEngineering',NULL,'OPEN',0),(506,7.96,'112105004','student6_electrical_engineering@example.com','ARYAN B KANSE',0,1,'ElectricalEngineering',NULL,'SC',0),(507,8.29,'112105005','student7_electrical_engineering@example.com','ATHARVA RAVINDRA JOSHI',0,1,'ElectricalEngineering',NULL,'SC',0),(508,7.91,'112105006','student8_electrical_engineering@example.com','AWCHAR DARSHANSINGH KAWARSINGH',0,1,'ElectricalEngineering',NULL,'EWS',0),(509,3.58,'112105007','student9_electrical_engineering@example.com','BAGADE ABHISHEK VIJAY',0,1,'ElectricalEngineering',NULL,'OPEN',0),(510,6.72,'112105008','student10_electrical_engineering@example.com','BAGAL DIVYA RAMKRISHNA',0,1,'ElectricalEngineering',NULL,'SC',0),(511,7.16,'112105009','student11_electrical_engineering@example.com','BEHARE PRAJWAL RAJENDRA',0,0,'ElectricalEngineering',NULL,'SC',0),(512,7.47,'112105010','student12_electrical_engineering@example.com','BHAGWAT ANUJA AVINASH',0,0,'ElectricalEngineering',NULL,'OBC',0),(513,7.87,'112105011','student13_electrical_engineering@example.com','BHAGWAT ATHARVA ULHAS',0,0,'ElectricalEngineering',NULL,'SC',0),(514,6.62,'112105015','student14_electrical_engineering@example.com','DHAIT ANIKET GIRISH',0,0,'ElectricalEngineering',NULL,'EWS',0),(515,5.13,'112105016','student15_electrical_engineering@example.com','DIKKAR RUSHIKESH GOPAL',0,0,'ElectricalEngineering',NULL,'EWS',0),(516,6.2,'112105017','student16_electrical_engineering@example.com','GACCHE SANCHI MILIND',0,0,'ElectricalEngineering',NULL,'SC',0),(517,6.4,'112105018','student17_electrical_engineering@example.com','GADEKAR SAKSHI BHASKAR',0,0,'ElectricalEngineering',NULL,'OPEN',0),(518,4.35,'112105019','student18_electrical_engineering@example.com','GAGANDEEP X Y',0,0,'ElectricalEngineering',NULL,'SC',0),(519,4.48,'112105020','student19_electrical_engineering@example.com','GAJANKUSH NIKIL VIJAY',0,0,'ElectricalEngineering',NULL,'EWS',0),(520,6.29,'112105021','student20_electrical_engineering@example.com','GHADGE TANISHQ CHANDRAKANT',0,0,'ElectricalEngineering',NULL,'SC',0),(521,6.79,'112105022','student21_electrical_engineering@example.com','GHAYTIDAK SHIVRAJ MANOHAR',0,0,'ElectricalEngineering',NULL,'SC',0),(522,8.04,'112105023','student22_electrical_engineering@example.com','GHEJI SANJAY KASHAPA',0,0,'ElectricalEngineering',NULL,'OBC',0),(523,8.49,'112105024','student23_electrical_engineering@example.com','GIRASE MOHIT RANJITSINGH',0,0,'ElectricalEngineering',NULL,'EWS',0),(524,9.22,'112105025','student24_electrical_engineering@example.com','GODBOLE ATHARVA VINAY',0,0,'ElectricalEngineering',NULL,'SC',0),(525,7.98,'112105026','student25_electrical_engineering@example.com','HOLKAR SUMIT SUDHAKAR',0,0,'ElectricalEngineering',NULL,'SC',0),(526,5.75,'112105027','student26_electrical_engineering@example.com','INGALE YASHWANT RAJENDRA',0,0,'ElectricalEngineering',NULL,'SC',0),(527,4.45,'112105028','student27_electrical_engineering@example.com','JAWALE SAMEER SANJAY',0,0,'ElectricalEngineering',NULL,'OBC',0),(528,7.78,'112105029','student28_electrical_engineering@example.com','KADAM VAISHNAVEE JAYSING',0,0,'ElectricalEngineering',NULL,'OBC',0),(529,7.31,'112105030','student29_electrical_engineering@example.com','KAMBLE SWARNIM SURESH',0,0,'ElectricalEngineering',NULL,'OBC',0),(530,7.31,'112105032','student30_electrical_engineering@example.com','KHAN IBRAHIM ANWAR',0,0,'ElectricalEngineering',NULL,'OPEN',0),(901,5.72,'112009040','student1_instrumentation_engineering@example.com','MADAKE ANUP AVINASH',0,1,'InstrumentationEngineering',NULL,'OPEN',0),(902,7.33,'112109001','student2_instrumentation_engineering@example.com','ADITYA VIJAYKUMAR AGRE',0,1,'InstrumentationEngineering',NULL,'SC',0),(903,7.3,'112109002','student3_instrumentation_engineering@example.com','AMBHORE ADITYA MADHAV',0,1,'InstrumentationEngineering',NULL,'EWS',0),(904,7.74,'112109003','student4_instrumentation_engineering@example.com','BADUGU B MEDHA',0,1,'InstrumentationEngineering',NULL,'OBC',0),(905,7.03,'112109004','student5_instrumentation_engineering@example.com','DAWANE UTKARSHA ASHOKKUMAR',0,1,'InstrumentationEngineering',NULL,'SC',0),(906,7.28,'112109005','student6_instrumentation_engineering@example.com','DESHPANDE SHAUNAK PARESH',0,1,'InstrumentationEngineering',NULL,'OBC',0),(907,7.1,'112109006','student7_instrumentation_engineering@example.com','FATAK KIRTI CHANDRAKANT',0,1,'InstrumentationEngineering',NULL,'OBC',0),(908,8.26,'112109008','student8_instrumentation_engineering@example.com','GANDHI RAHUL RAJENDRA',0,1,'InstrumentationEngineering',NULL,'SC',0),(909,6.38,'112109009','student9_instrumentation_engineering@example.com','GOKHALE SUYOG SUDHIR',0,1,'InstrumentationEngineering',NULL,'SC',0),(910,4.53,'112109010','student10_instrumentation_engineering@example.com','HARODE CHAITRA LALIT',0,1,'InstrumentationEngineering',NULL,'OBC',0),(911,8.12,'112109011','student11_instrumentation_engineering@example.com','INDURKAR MOHIT MANOJ',0,0,'InstrumentationEngineering',NULL,'SC',0),(912,6.09,'112109012','student12_instrumentation_engineering@example.com','INGALE PARTH KISHOR',0,0,'InstrumentationEngineering',NULL,'SC',0),(913,6.24,'112109013','student13_instrumentation_engineering@example.com','INGOLE YATHARTH SANJAY',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(914,7.57,'112109014','student14_instrumentation_engineering@example.com','JADHAV SHWETA RAJENDRA',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(915,5.19,'112109015','student15_instrumentation_engineering@example.com','JANYAA ARIYA TIKOO',0,0,'InstrumentationEngineering',NULL,'EWS',0),(916,7.62,'112109016','student16_instrumentation_engineering@example.com','JOSHI HRISHIKESH SANDEEP',0,0,'InstrumentationEngineering',NULL,'OBC',0),(917,6.49,'112109020','student17_instrumentation_engineering@example.com','LOKHANDE SHRAVANI NAVNATH',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(918,7.45,'112109021','student18_instrumentation_engineering@example.com','LONEKAR GANGASAGAR SAYGONDA',0,0,'InstrumentationEngineering',NULL,'OBC',0),(919,8.07,'112109023','student19_instrumentation_engineering@example.com','NAIK CHINMAY SACHIN',0,0,'InstrumentationEngineering',NULL,'EWS',0),(920,7.44,'112109025','student20_instrumentation_engineering@example.com','NEGLUR ATHARVA RAVISHANKAR',0,0,'InstrumentationEngineering',NULL,'EWS',0),(921,6.49,'112109026','student21_instrumentation_engineering@example.com','PATARE HRUTUJA SANDEEP',0,0,'InstrumentationEngineering',NULL,'OBC',0),(922,7.71,'112109027','student22_instrumentation_engineering@example.com','RAI DEV RAJKUMAR',0,0,'InstrumentationEngineering',NULL,'EWS',0),(923,6.33,'112109028','student23_instrumentation_engineering@example.com','RAJPUT ABHAY BAHADUR',0,0,'InstrumentationEngineering',NULL,'SC',0),(924,6.14,'112109029','student24_instrumentation_engineering@example.com','RATHOD TANMAYEE MURLIDHAR',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(925,9.36,'112109030','student25_instrumentation_engineering@example.com','SAHASRABUDHE NISHANT AMIT',0,0,'InstrumentationEngineering',NULL,'SC',0),(926,6.16,'112109031','student26_instrumentation_engineering@example.com','SAROWARE AYUSH SANDIP',0,0,'InstrumentationEngineering',NULL,'OBC',0),(927,7.44,'112109032','student27_instrumentation_engineering@example.com','SATBADRE ANSHUL ANAND',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(928,6.5,'112109033','student28_instrumentation_engineering@example.com','SAURABH GAJANAN SHINDE',0,0,'InstrumentationEngineering',NULL,'OPEN',0),(929,4.36,'112109034','student29_instrumentation_engineering@example.com','SHITIZ B RAJPUT',0,0,'InstrumentationEngineering',NULL,'EWS',0),(930,4.5,'112109035','student30_instrumentation_engineering@example.com','SURKULE PURVA LAXMAN',0,0,'InstrumentationEngineering',NULL,'SC',0),(1001,5.52,'112010011','student1_mechanical_engineering@example.com','BHANDARE ABHISHEK SOPANRAO',0,1,'MechanicalEngineering',NULL,'EWS',0),(1002,4.99,'112010024','student2_mechanical_engineering@example.com','CHOUDHARY YOGESH PARMESHWAR',0,1,'MechanicalEngineering',NULL,'EWS',0),(1003,4.99,'112010058','student3_mechanical_engineering@example.com','KAMWAMANG B LYTTAND',0,1,'MechanicalEngineering',NULL,'OBC',0),(1004,7.57,'112110001','student4_mechanical_engineering@example.com','ABHYANKAR AMAN DEEPESH',0,1,'MechanicalEngineering',NULL,'OBC',0),(1005,6.94,'112110002','student5_mechanical_engineering@example.com','ADITI BHASKAR KARADE',0,1,'MechanicalEngineering',NULL,'EWS',0),(1006,2.8,'112110003','student6_mechanical_engineering@example.com','ADITYA SUKHDEO SAYAM',0,1,'MechanicalEngineering',NULL,'OPEN',0),(1007,3.81,'112110004','student7_mechanical_engineering@example.com','ADVAITH B HARI',0,1,'MechanicalEngineering',NULL,'SC',0),(1008,6.28,'112110005','student8_mechanical_engineering@example.com','AJINKYA PRAMOD NAIK',0,1,'MechanicalEngineering',NULL,'EWS',0),(1009,5.67,'112110006','student9_mechanical_engineering@example.com','ALDAR PRAVIN BIRA',0,1,'MechanicalEngineering',NULL,'SC',0),(1010,3.31,'112110007','student10_mechanical_engineering@example.com','AMBEKAR MANASWI ARUN',0,1,'MechanicalEngineering',NULL,'OPEN',0),(1011,6.64,'112110008','student11_mechanical_engineering@example.com','AMIT VIJAY PAWAR',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1012,7.08,'112110009','student12_mechanical_engineering@example.com','ANIKET B RAINA',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1013,6.85,'112110010','student13_mechanical_engineering@example.com','ANIKET VILAS KARALE',0,0,'MechanicalEngineering',NULL,'EWS',0),(1014,5.15,'112110011','student14_mechanical_engineering@example.com','ANISH BANDU RAMTEKE',0,0,'MechanicalEngineering',NULL,'SC',0),(1015,6.55,'112110012','student15_mechanical_engineering@example.com','ANISH PRAKASH PATIL',0,0,'MechanicalEngineering',NULL,'SC',0),(1016,4.99,'112110013','student16_mechanical_engineering@example.com','ANMOL RAVIKANT MARATHE',0,0,'MechanicalEngineering',NULL,'OBC',0),(1017,8.56,'112110014','student17_mechanical_engineering@example.com','ATTARDE KUNAL TRIMBAK',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1018,5.72,'112110015','student18_mechanical_engineering@example.com','AVHAD SAKSHI RAVINDRA',0,0,'MechanicalEngineering',NULL,'SC',0),(1019,4.41,'112110016','student19_mechanical_engineering@example.com','AYUSH B GOYAL',0,0,'MechanicalEngineering',NULL,'OBC',0),(1020,7.73,'112110017','student20_mechanical_engineering@example.com','BACCHE PRATHAMESH SANJAY',0,0,'MechanicalEngineering',NULL,'SC',0),(1021,8.13,'112110018','student21_mechanical_engineering@example.com','BANTHIA VEDANT HARSHAL',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1022,6.87,'112110019','student22_mechanical_engineering@example.com','BARVE UNNATI VAIBHAV',0,0,'MechanicalEngineering',NULL,'OBC',0),(1023,6.91,'112110020','student23_mechanical_engineering@example.com','BHANDARI SAMYAK SANJAY',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1024,7.48,'112110021','student24_mechanical_engineering@example.com','BHIDE ATHARVA HRISHIKESH',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1025,4.12,'112110022','student25_mechanical_engineering@example.com','BHOIR ANAY RAMDAS',0,0,'MechanicalEngineering',NULL,'OBC',0),(1026,7.08,'112110023','student26_mechanical_engineering@example.com','BHUJBAL YASHODHAN BALKRISHNA',0,0,'MechanicalEngineering',NULL,'EWS',0),(1027,8.1,'112110025','student27_mechanical_engineering@example.com','CHAUDHARI RUTVIK RAJESHWAR',0,0,'MechanicalEngineering',NULL,'OBC',0),(1028,7.41,'112110026','student28_mechanical_engineering@example.com','CHAVAN PARTH PRASHANT',0,0,'MechanicalEngineering',NULL,'EWS',0),(1029,6.95,'112110027','student29_mechanical_engineering@example.com','CHAVAN RUSHIKESH VILAS',0,0,'MechanicalEngineering',NULL,'OBC',0),(1030,6.33,'112110028','student30_mechanical_engineering@example.com','CHINMAY PRASHANT DESHPANDE',0,0,'MechanicalEngineering',NULL,'OPEN',0),(1301,4.3,'112013024','student1_manufacturing_engineering@example.com','KARHALE GAJANAN RAMCHANDRA',0,1,'ManufacturingEngineering',NULL,'OBC',0),(1302,4.55,'112013035','student2_manufacturing_engineering@example.com','MANDAKE AISHWARYA VIJAY',0,1,'ManufacturingEngineering',NULL,'EWS',0),(1303,4.9,'112013068','student3_manufacturing_engineering@example.com','WAIRAGADE SUPREET NARENDRA',0,1,'ManufacturingEngineering',NULL,'OBC',0),(1304,6.7,'112113001','student4_manufacturing_engineering@example.com','ADITYA SURYAKANT RAUT',0,1,'ManufacturingEngineering',NULL,'SC',0),(1305,9.08,'112113002','student5_manufacturing_engineering@example.com','ADITYAN B ARUMUGANAINAR',0,1,'ManufacturingEngineering',NULL,'EWS',0),(1306,7.69,'112113005','student6_manufacturing_engineering@example.com','BEDRE ANUJ ARUNRAO',0,1,'ManufacturingEngineering',NULL,'SC',0),(1307,7.33,'112113006','student7_manufacturing_engineering@example.com','BHANDARI AAYUSH ANAND',0,1,'ManufacturingEngineering',NULL,'SC',0),(1308,6.14,'112113007','student8_manufacturing_engineering@example.com','CHANDAK HARSHA ANAND',0,1,'ManufacturingEngineering',NULL,'OPEN',0),(1309,7.13,'112113008','student9_manufacturing_engineering@example.com','DABADE VAIDEHI VITTHAL',0,1,'ManufacturingEngineering',NULL,'EWS',0),(1310,4.63,'112113009','student10_manufacturing_engineering@example.com','DAHALE PRATIK DEVENDRA',0,1,'ManufacturingEngineering',NULL,'SC',0),(1311,6.72,'112113010','student11_manufacturing_engineering@example.com','DAWARE PRATOD ANIRUDDHA',0,0,'ManufacturingEngineering',NULL,'OBC',0),(1312,6.58,'112113011','student12_manufacturing_engineering@example.com','DEOBHANKAR ANUSHKA ANIL',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1313,6.6,'112113012','student13_manufacturing_engineering@example.com','DESHMUKH ATHARAW MAHESH',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1314,6.66,'112113014','student14_manufacturing_engineering@example.com','DHAKULKAR PRIYA PRADEEP',0,0,'ManufacturingEngineering',NULL,'SC',0),(1315,4.88,'112113015','student15_manufacturing_engineering@example.com','DUMANA MANTHAN NAMDEV',0,0,'ManufacturingEngineering',NULL,'SC',0),(1316,4.9,'112113016','student16_manufacturing_engineering@example.com','GAJANKUSH ANIKET VIJAY',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1317,5.8,'112113017','student17_manufacturing_engineering@example.com','GONDASE KUNDAN MAHENDRA',0,0,'ManufacturingEngineering',NULL,'SC',0),(1318,8.2,'112113019','student18_manufacturing_engineering@example.com','GUJARATHI BHAKTI MANISH',0,0,'ManufacturingEngineering',NULL,'SC',0),(1319,8.13,'112113020','student19_manufacturing_engineering@example.com','HARDAS SOHAM HARSHAD',0,0,'ManufacturingEngineering',NULL,'SC',0),(1320,6.72,'112113022','student20_manufacturing_engineering@example.com','HOLE PRANAV ASHOK',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1321,6.72,'112113023','student21_manufacturing_engineering@example.com','HULYALKAR MUKTA SHRINIVAS',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1322,8.3,'112113024','student22_manufacturing_engineering@example.com','JANE SOHAM NITIN',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1323,6.06,'112113026','student23_manufacturing_engineering@example.com','JORI SAI MARTAND',0,0,'ManufacturingEngineering',NULL,'SC',0),(1324,8.14,'112113027','student24_manufacturing_engineering@example.com','JOSHI ADITI ANAY',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1325,7.79,'112113028','student25_manufacturing_engineering@example.com','KAJGIKAR RUGVED ASHISH',0,0,'ManufacturingEngineering',NULL,'SC',0),(1326,5.26,'112113029','student26_manufacturing_engineering@example.com','KALE PRATHAMESH PURUSHOTTAM',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1327,8.16,'112113030','student27_manufacturing_engineering@example.com','KASWA SAKET DHIRENDRA',0,0,'ManufacturingEngineering',NULL,'OPEN',0),(1328,8.12,'112113032','student28_manufacturing_engineering@example.com','KOUSTUB VINOD PATIL',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1329,6.23,'112113038','student29_manufacturing_engineering@example.com','MAINKAR MIHIR SUDHIR',0,0,'ManufacturingEngineering',NULL,'EWS',0),(1330,7.79,'112113039','student30_manufacturing_engineering@example.com','MANDHARE SMRUTI SUNIL',0,0,'ManufacturingEngineering',NULL,'OPEN',0);
/*!40000 ALTER TABLE `registration_thirdyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortlisting_preference`
--

DROP TABLE IF EXISTS `shortlisting_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortlisting_preference` (
  `room_id` int NOT NULL,
  `leader` varchar(10) NOT NULL,
  `leader_rank` int NOT NULL,
  `engineering_branch` varchar(100) NOT NULL,
  `preferences` json NOT NULL,
  `alloted_room` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  CONSTRAINT `shortlisting_preference_room_id_eac482b5_fk_shortlisting_room_id` FOREIGN KEY (`room_id`) REFERENCES `shortlisting_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortlisting_preference`
--

LOCK TABLES `shortlisting_preference` WRITE;
/*!40000 ALTER TABLE `shortlisting_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `shortlisting_preference` ENABLE KEYS */;
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
  `year` varchar(10) DEFAULT NULL,
  `alloted_room` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortlisting_room`
--

LOCK TABLES `shortlisting_room` WRITE;
/*!40000 ALTER TABLE `shortlisting_room` DISABLE KEYS */;
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
  `year` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortlisting_roommaterequest`
--

LOCK TABLES `shortlisting_roommaterequest` WRITE;
/*!40000 ALTER TABLE `shortlisting_roommaterequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `shortlisting_roommaterequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentrole_maintenancerequest`
--

DROP TABLE IF EXISTS `studentrole_maintenancerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentrole_maintenancerequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `fulfilled` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user` varchar(10) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentrole_maintenancerequest`
--

LOCK TABLES `studentrole_maintenancerequest` WRITE;
/*!40000 ALTER TABLE `studentrole_maintenancerequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentrole_maintenancerequest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-12 15:29:46
