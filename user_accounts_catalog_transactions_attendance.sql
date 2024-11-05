-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: gjc_library_mysql
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account` (
  `school_id` varchar(20) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `year_level` varchar(100) DEFAULT NULL,
  `role` varchar(7) DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `activation_date` datetime(6) DEFAULT NULL,
  `profile_views` int NOT NULL,
  `has_borrowed_book_transaction` tinyint(1) NOT NULL,
  `current_cropped_photo_id` bigint DEFAULT NULL,
  PRIMARY KEY (`school_id`),
  UNIQUE KEY `current_cropped_photo_id` (`current_cropped_photo_id`),
  CONSTRAINT `accounts_account_current_cropped_phot_b1e5e666_fk_accounts_` FOREIGN KEY (`current_cropped_photo_id`) REFERENCES `accounts_accountcroppedphotos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_account_followers`
--

DROP TABLE IF EXISTS `accounts_account_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_followers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_account_id` varchar(20) NOT NULL,
  `to_account_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_followe_from_account_id_to_accou_dff69c0c_uniq` (`from_account_id`,`to_account_id`),
  KEY `accounts_account_fol_to_account_id_e598b658_fk_accounts_` (`to_account_id`),
  CONSTRAINT `accounts_account_fol_from_account_id_f017c79e_fk_accounts_` FOREIGN KEY (`from_account_id`) REFERENCES `accounts_account` (`school_id`),
  CONSTRAINT `accounts_account_fol_to_account_id_e598b658_fk_accounts_` FOREIGN KEY (`to_account_id`) REFERENCES `accounts_account` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_accountcroppedphotos`
--

DROP TABLE IF EXISTS `accounts_accountcroppedphotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accountcroppedphotos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cropped_image_url` varchar(2048) NOT NULL,
  `cropped_avatar_url` varchar(2048) DEFAULT NULL,
  `upload_date` datetime(6) NOT NULL,
  `account_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_accountcrop_account_id_cfe78a8c_fk_accounts_` (`account_id`),
  CONSTRAINT `accounts_accountcrop_account_id_cfe78a8c_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_bookrecord`
--

DROP TABLE IF EXISTS `accounts_bookrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_bookrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `record_type` varchar(15) NOT NULL,
  `datetime` datetime(6) DEFAULT NULL,
  `placing_number` int NOT NULL,
  `transaction_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_bookrecord_transaction_id_50fc68a9_fk_accounts_` (`transaction_id`),
  CONSTRAINT `accounts_bookrecord_transaction_id_50fc68a9_fk_accounts_` FOREIGN KEY (`transaction_id`) REFERENCES `accounts_booktransaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_booktransaction`
--

DROP TABLE IF EXISTS `accounts_booktransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_booktransaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(15) NOT NULL,
  `accession_id` varchar(10) NOT NULL,
  `account_id` varchar(20) NOT NULL,
  `book_id` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_booktransac_accession_id_cfb1806b_fk_tblHoldin` (`accession_id`),
  KEY `accounts_booktransac_account_id_d4823f07_fk_accounts_` (`account_id`),
  KEY `accounts_booktransaction_book_id_62315833_fk_tblCat_controlno` (`book_id`),
  CONSTRAINT `accounts_booktransac_accession_id_cfb1806b_fk_tblHoldin` FOREIGN KEY (`accession_id`) REFERENCES `tblHoldings` (`accession`),
  CONSTRAINT `accounts_booktransac_account_id_d4823f07_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`school_id`),
  CONSTRAINT `accounts_booktransaction_book_id_62315833_fk_tblCat_controlno` FOREIGN KEY (`book_id`) REFERENCES `tblCat` (`controlno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attendance_college`
--

DROP TABLE IF EXISTS `attendance_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_college` (
  `id` char(32) NOT NULL,
  `date` date NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `time_in_date` datetime(6) DEFAULT NULL,
  `time_out_date` datetime(6) DEFAULT NULL,
  `has_already_timed_in` tinyint(1) NOT NULL,
  `has_already_timed_out` tinyint(1) NOT NULL,
  `classification` varchar(10) NOT NULL,
  `random_quote_id` bigint DEFAULT NULL,
  `school_id_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_college_random_quote_id_e2cd70bd_fk_quotes_quote_id` (`random_quote_id`),
  KEY `attendance_college_school_id_id_70bae14a_fk_accounts_` (`school_id_id`),
  CONSTRAINT `attendance_college_random_quote_id_e2cd70bd_fk_quotes_quote_id` FOREIGN KEY (`random_quote_id`) REFERENCES `quotes_quote` (`id`),
  CONSTRAINT `attendance_college_school_id_id_70bae14a_fk_accounts_` FOREIGN KEY (`school_id_id`) REFERENCES `accounts_account` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attendance_highschool`
--

DROP TABLE IF EXISTS `attendance_highschool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_highschool` (
  `id` char(32) NOT NULL,
  `date` date NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `time_in_date` datetime(6) DEFAULT NULL,
  `time_out_date` datetime(6) DEFAULT NULL,
  `has_already_timed_in` tinyint(1) NOT NULL,
  `has_already_timed_out` tinyint(1) NOT NULL,
  `classification` varchar(10) NOT NULL,
  `random_quote_id` bigint DEFAULT NULL,
  `school_id_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_highschoo_random_quote_id_752bd7f8_fk_quotes_qu` (`random_quote_id`),
  KEY `attendance_highschoo_school_id_id_94dc62db_fk_accounts_` (`school_id_id`),
  CONSTRAINT `attendance_highschoo_random_quote_id_752bd7f8_fk_quotes_qu` FOREIGN KEY (`random_quote_id`) REFERENCES `quotes_quote` (`id`),
  CONSTRAINT `attendance_highschoo_school_id_id_94dc62db_fk_accounts_` FOREIGN KEY (`school_id_id`) REFERENCES `accounts_account` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `quotes_quote`
--

DROP TABLE IF EXISTS `quotes_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotes_quote` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `approval_status` varchar(20) NOT NULL,
  `approved_by_id` bigint DEFAULT NULL,
  `posted_by_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quotes_quote_approved_by_id_1ba15b20_fk_users_userprofile_id` (`approved_by_id`),
  KEY `quotes_quote_posted_by_id_b3f94ef4_fk_users_userprofile_id` (`posted_by_id`),
  KEY `quotes_quot_id_de87ab_idx` (`id`),
  CONSTRAINT `quotes_quote_approved_by_id_1ba15b20_fk_users_userprofile_id` FOREIGN KEY (`approved_by_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `quotes_quote_posted_by_id_b3f94ef4_fk_users_userprofile_id` FOREIGN KEY (`posted_by_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblAuthor`
--

DROP TABLE IF EXISTS `tblAuthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblAuthor` (
  `author` varchar(100) NOT NULL,
  `author_code` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`author_code`),
  UNIQUE KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblCat`
--

DROP TABLE IF EXISTS `tblCat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblCat` (
  `controlno` varchar(12) NOT NULL,
  `title` varchar(255) NOT NULL,
  `callno` varchar(50) NOT NULL,
  `edition` varchar(150) DEFAULT NULL,
  `pagination` varchar(50) DEFAULT NULL,
  `publisher` varchar(150) DEFAULT NULL,
  `pubplace` varchar(100) DEFAULT NULL,
  `copyright` varchar(20) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `series_title` varchar(250) DEFAULT NULL,
  `aentry_title` varchar(250) DEFAULT NULL,
  `AEAuthor1Code` int NOT NULL,
  `AEAuthor2Code` int DEFAULT NULL,
  `AEAuthor3Code` int DEFAULT NULL,
  `AuthorCode` int NOT NULL,
  `Subject1Code` int NOT NULL,
  `Subject2Code` int DEFAULT NULL,
  `Subject3Code` int DEFAULT NULL,
  PRIMARY KEY (`controlno`),
  KEY `tblCat_title_9dcd3a_idx` (`title`),
  KEY `tblCat_AEAuthor1Code_17f38a96_fk_tblAuthor_author_code` (`AEAuthor1Code`),
  KEY `tblCat_AEAuthor2Code_10443313_fk_tblAuthor_author_code` (`AEAuthor2Code`),
  KEY `tblCat_AEAuthor3Code_d866b075_fk_tblAuthor_author_code` (`AEAuthor3Code`),
  KEY `tblCat_AuthorCode_934ba02d_fk_tblAuthor_author_code` (`AuthorCode`),
  KEY `tblCat_Subject1Code_f32ad3c9_fk_tblSubject_subject_code` (`Subject1Code`),
  KEY `tblCat_Subject2Code_6bc7eb82_fk_tblSubject_subject_code` (`Subject2Code`),
  KEY `tblCat_Subject3Code_759385cb_fk_tblSubject_subject_code` (`Subject3Code`),
  CONSTRAINT `tblCat_AEAuthor1Code_17f38a96_fk_tblAuthor_author_code` FOREIGN KEY (`AEAuthor1Code`) REFERENCES `tblAuthor` (`author_code`),
  CONSTRAINT `tblCat_AEAuthor2Code_10443313_fk_tblAuthor_author_code` FOREIGN KEY (`AEAuthor2Code`) REFERENCES `tblAuthor` (`author_code`),
  CONSTRAINT `tblCat_AEAuthor3Code_d866b075_fk_tblAuthor_author_code` FOREIGN KEY (`AEAuthor3Code`) REFERENCES `tblAuthor` (`author_code`),
  CONSTRAINT `tblCat_AuthorCode_934ba02d_fk_tblAuthor_author_code` FOREIGN KEY (`AuthorCode`) REFERENCES `tblAuthor` (`author_code`),
  CONSTRAINT `tblCat_Subject1Code_f32ad3c9_fk_tblSubject_subject_code` FOREIGN KEY (`Subject1Code`) REFERENCES `tblSubject` (`subject_code`),
  CONSTRAINT `tblCat_Subject2Code_6bc7eb82_fk_tblSubject_subject_code` FOREIGN KEY (`Subject2Code`) REFERENCES `tblSubject` (`subject_code`),
  CONSTRAINT `tblCat_Subject3Code_759385cb_fk_tblSubject_subject_code` FOREIGN KEY (`Subject3Code`) REFERENCES `tblSubject` (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblHoldings`
--

DROP TABLE IF EXISTS `tblHoldings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblHoldings` (
  `accession` varchar(10) NOT NULL,
  `copy` varchar(10) DEFAULT NULL,
  `controlno` varchar(12) NOT NULL,
  `Location` varchar(15) NOT NULL,
  PRIMARY KEY (`accession`),
  KEY `tblHoldings_controlno_b6d43b92_fk_tblCat_controlno` (`controlno`),
  KEY `tblHoldings_Location_2d9ca5e4_fk_tblLocation_location` (`Location`),
  CONSTRAINT `tblHoldings_controlno_b6d43b92_fk_tblCat_controlno` FOREIGN KEY (`controlno`) REFERENCES `tblCat` (`controlno`),
  CONSTRAINT `tblHoldings_Location_2d9ca5e4_fk_tblLocation_location` FOREIGN KEY (`Location`) REFERENCES `tblLocation` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblLocation`
--

DROP TABLE IF EXISTS `tblLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblLocation` (
  `location` varchar(15) NOT NULL,
  `location_code` int NOT NULL,
  PRIMARY KEY (`location`),
  UNIQUE KEY `location_code` (`location_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblSubject`
--

DROP TABLE IF EXISTS `tblSubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblSubject` (
  `subject` varchar(75) NOT NULL,
  `subject_code` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`subject_code`),
  UNIQUE KEY `subject` (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_pincode`
--

DROP TABLE IF EXISTS `users_pincode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_pincode` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pin_code` longtext,
  `pin_token` longtext,
  `pin_token_date_updated` datetime(6) DEFAULT NULL,
  `failed_attempts` smallint unsigned NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `last_failed_attempt` datetime(6) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_pincode_user_id_c0d6a98d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `users_pincode_chk_1` CHECK ((`failed_attempts` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `onboard1_finished` tinyint(1) DEFAULT NULL,
  `isBookCardPhotoApproved` varchar(20) NOT NULL,
  `account_id` varchar(20) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `users_userprofile_account_id_80fadf83_fk_accounts_` (`account_id`),
  CONSTRAINT `users_userprofile_account_id_80fadf83_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`school_id`),
  CONSTRAINT `users_userprofile_user_id_87251ef1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-25 20:41:16
