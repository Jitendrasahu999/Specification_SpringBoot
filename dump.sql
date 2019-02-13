-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: joneslighting_wms
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lookup_types`
--

DROP TABLE IF EXISTS `lookup_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lookup_types` (
  `code` varchar(30) NOT NULL,
  `meaning` varchar(240) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_types`
--

LOCK TABLES `lookup_types` WRITE;
/*!40000 ALTER TABLE `lookup_types` DISABLE KEYS */;
INSERT INTO `lookup_types` VALUES ('SPCLN_TYPE','Specialisation Type','2018-11-11 00:00:28','2018-11-11 02:13:53',0);
/*!40000 ALTER TABLE `lookup_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_values`
--

DROP TABLE IF EXISTS `lookup_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lookup_values` (
  `lookup_type` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  `display_sequence` int(15) DEFAULT NULL,
  `meaning` varchar(80) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lookup_type`,`code`),
  CONSTRAINT `lookup_values_fk1` FOREIGN KEY (`lookup_type`) REFERENCES `lookup_types` (`code`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_values`
--

LOCK TABLES `lookup_values` WRITE;
/*!40000 ALTER TABLE `lookup_values` DISABLE KEYS */;
INSERT INTO `lookup_values` VALUES ('SPCLN_TYPE','BCKFL',2,'Backfill',_binary '','2018-11-11 00:09:24','2018-11-11 00:09:24',0),('SPCLN_TYPE','ELCTR',5,'Electrician',_binary '','2018-11-11 00:09:24','2018-11-11 00:09:24',0),('SPCLN_TYPE','EXCVN',0,'Excavation',_binary '','2018-11-11 00:09:24','2018-11-11 00:09:24',0),('SPCLN_TYPE','HIAB',4,'Hiab',_binary '','2018-11-11 00:09:24','2018-11-11 00:09:24',0),('SPCLN_TYPE','INSPC',6,'Inspection',_binary '','2018-11-11 00:09:24','2018-11-11 00:09:24',0),('SPCLN_TYPE','JNTNG',1,'Jointing',_binary '','2018-11-11 00:09:24','2018-11-11 00:09:24',0),('SPCLN_TYPE','RNSTM',3,'Reinstatement',_binary '','2018-11-11 00:09:24','2018-11-11 00:09:24',0);
/*!40000 ALTER TABLE `lookup_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` VALUES ('adminapp','mw/adminapp,ms/admin,ms/user','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi','role_super_admin,role_admin','authorization_code,password,refresh_token,implicit',NULL,NULL,86400,86400,'{}',NULL);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_fk2` (`role_id`),
  CONSTRAINT `permission_role_fk1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_fk2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(2,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(3,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(4,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(4,2,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(5,1,'2018-11-08 19:05:55','2018-11-08 19:05:55',0),(5,2,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(6,1,'2018-11-08 19:05:55','2018-11-08 19:05:55',0),(7,1,'2018-11-08 19:05:55','2018-11-08 19:05:55',0),(8,1,'2018-11-08 19:05:55','2018-11-08 19:05:55',0),(8,2,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(9,1,'2018-11-08 19:05:55','2018-11-08 19:05:55',0),(10,1,'2018-11-08 19:05:55','2018-11-08 19:05:55',0),(11,1,'2018-11-08 19:05:55','2018-11-08 19:05:55',0),(11,2,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(12,1,'2018-11-08 19:05:55','2018-11-08 19:05:55',0),(13,1,'2018-11-08 19:05:55','2018-11-08 19:05:55',0),(13,2,'1970-01-01 00:00:00','1970-01-01 00:00:00',0);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'can_delete_user','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(2,'can_create_user','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(3,'can_update_user','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(4,'can_read_user','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(5,'can_view_permissions','2018-11-08 18:59:57','2018-11-08 18:59:57',0),(6,'can_create_role','2018-11-08 18:59:57','2018-11-08 18:59:57',0),(7,'can_edit_role','2018-11-08 18:59:57','2018-11-08 18:59:57',0),(8,'can_view_role','2018-11-08 18:59:57','2018-11-08 18:59:57',0),(9,'can_delete_role','2018-11-08 18:59:57','2018-11-08 18:59:57',0),(10,'can_assign_permissions_to_role','2018-11-08 18:59:57','2018-11-08 18:59:57',0),(11,'can_view_permissions_by_role','2018-11-08 18:59:57','2018-11-08 18:59:57',0),(12,'can_assign_users_to_role','2018-11-08 18:59:57','2018-11-08 18:59:57',0),(13,'can_view_users_by_role','2018-11-08 18:59:57','2018-11-08 18:59:57',0);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role_user` (
  `role_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `role_user_fk2` (`user_id`),
  CONSTRAINT `role_user_fk1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_fk2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(2,3,'1970-01-01 00:00:00','2018-11-16 15:54:29',0),(4,2,'2018-11-19 13:02:04','2018-11-19 13:02:04',0),(5,5,'2018-11-19 00:38:00','2018-11-19 00:38:00',0);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `meaning` varchar(45) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'role_super_admin','Super Admin','1970-01-01 00:00:00','2018-11-18 02:10:09',0),(2,'role_admin','WMS Admin','1970-01-01 00:00:00','2018-11-18 02:10:09',0),(3,'role_financial_admin','Financial Admin','2018-11-16 15:52:36','2018-11-18 02:10:09',0),(4,'role_user','WMS User','2018-11-16 16:07:20','2018-11-18 02:10:09',0),(5,'role_worker','Worker','2018-11-16 16:07:20','2018-11-18 02:10:09',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `team_spl_code` varchar(30) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(24) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_ix1` (`username`),
  UNIQUE KEY `user_ix2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi','admin@example.com','Super','Admin',_binary '',_binary '\0',_binary '\0',_binary '\0','1970-01-01 00:00:00','2018-11-15 15:05:09',0),(2,'user','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi','user@example.com','Some','User',_binary '',_binary '\0',_binary '\0',_binary '\0','1970-01-01 00:00:00','2018-11-19 13:02:04',0),(3,'abdullah','{bcrypt}$2a$10$EZef1KbCs55l5BEgHrBtqu/Q3cM.1XcJLtnCCZQHP29OSeJBe1rym','abdullah@accemy.com','Abdullah','Admin',_binary '',_binary '\0',_binary '\0',_binary '\0','2018-11-09 01:46:08','2018-11-15 15:05:09',0),(5,'worker','{bcrypt}$2a$10$R4GpWlOoPVG3TraeM2dmdeTPXvFtc.D9eDFSA8eNr.YEqBfzRbDne','worker@example.com','Some','Worker',_binary '',_binary '\0',_binary '\0',_binary '\0','2018-11-19 00:38:00','2018-11-19 00:38:00',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_user_role`
--

DROP TABLE IF EXISTS `view_user_role`;
/*!50001 DROP VIEW IF EXISTS `view_user_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_user_role` AS SELECT 
 1 AS `id`,
 1 AS `username`,
 1 AS `email`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `enabled`,
 1 AS `created_on`,
 1 AS `updated_on`,
 1 AS `version`,
 1 AS `role_id`,
 1 AS `role_meaning`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'joneslighting_wms'
--

--
-- Dumping routines for database 'joneslighting_wms'
--

--
-- Final view structure for view `view_user_role`
--

/*!50001 DROP VIEW IF EXISTS `view_user_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_role` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`email` AS `email`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`enabled` AS `enabled`,`u`.`created_on` AS `created_on`,`u`.`updated_on` AS `updated_on`,`u`.`version` AS `version`,`r`.`id` AS `role_id`,`r`.`meaning` AS `role_meaning` from ((`users` `u` join `role_user` `r_u` on((`u`.`id` = `r_u`.`user_id`))) join `roles` `r` on((`r_u`.`role_id` = `r`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-19 13:40:15
