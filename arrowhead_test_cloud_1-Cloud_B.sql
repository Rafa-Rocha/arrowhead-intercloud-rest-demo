-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: arrowhead_test_cloud_1
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.36-MariaDB

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
-- Table structure for table `arrowhead_cloud`
--

DROP TABLE IF EXISTS `arrowhead_cloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arrowhead_cloud` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `authentication_info` varchar(2047) DEFAULT NULL,
  `cloud_name` varchar(255) NOT NULL,
  `gatekeeper_service_uri` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `is_secure` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9cjou6d7x3w0pvnnb27bc4c4d` (`operator`,`cloud_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrowhead_cloud`
--

LOCK TABLES `arrowhead_cloud` WRITE;
/*!40000 ALTER TABLE `arrowhead_cloud` DISABLE KEYS */;
INSERT INTO `arrowhead_cloud` VALUES (19,'192.168.60.22',NULL,'Cloud-1','gatekeeper','cloud-1-operator',8446,'N'),(20,'192.168.60.62',NULL,'Cloud-2','gatekeeper','cloud-2-operator',8446,'N');
/*!40000 ALTER TABLE `arrowhead_cloud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrowhead_service`
--

DROP TABLE IF EXISTS `arrowhead_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arrowhead_service` (
  `id` bigint(20) NOT NULL,
  `service_definition` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKg90gjpqpv7tpmy1eou5u4umyk` (`service_definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrowhead_service`
--

LOCK TABLES `arrowhead_service` WRITE;
/*!40000 ALTER TABLE `arrowhead_service` DISABLE KEYS */;
INSERT INTO `arrowhead_service` VALUES (21,'IndoorTemperature'),(3,'InsecureAuthorizationControl'),(27,'InsecureConnectToConsumer'),(24,'InsecureConnectToProvider'),(2,'InsecureEventPublishing'),(15,'InsecureEventSubscription'),(1,'InsecureGlobalServiceDiscovery'),(13,'InsecureInterCloudNegotiations'),(4,'InsecureOrchestrationService'),(29,'InsecureSessionManagement'),(14,'InsecureTokenGeneration');
/*!40000 ALTER TABLE `arrowhead_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrowhead_service_interfaces`
--

DROP TABLE IF EXISTS `arrowhead_service_interfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arrowhead_service_interfaces` (
  `arrowhead_service_id` bigint(20) NOT NULL,
  `interfaces` varchar(255) DEFAULT NULL,
  KEY `FKsb09f6kft101e8rixhm5t53f3` (`arrowhead_service_id`),
  CONSTRAINT `FKsb09f6kft101e8rixhm5t53f3` FOREIGN KEY (`arrowhead_service_id`) REFERENCES `arrowhead_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrowhead_service_interfaces`
--

LOCK TABLES `arrowhead_service_interfaces` WRITE;
/*!40000 ALTER TABLE `arrowhead_service_interfaces` DISABLE KEYS */;
INSERT INTO `arrowhead_service_interfaces` VALUES (4,'JSON'),(3,'JSON'),(2,'JSON'),(1,'JSON'),(13,'JSON'),(14,'JSON'),(15,'JSON'),(21,'XML'),(21,'JSON'),(24,'JSON'),(27,'JSON'),(29,'JSON');
/*!40000 ALTER TABLE `arrowhead_service_interfaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrowhead_system`
--

DROP TABLE IF EXISTS `arrowhead_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arrowhead_system` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `authentication_info` varchar(2047) DEFAULT NULL,
  `port` int(11) NOT NULL,
  `system_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKjiab72gx1c0711gjfr39mhck9` (`system_name`,`address`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrowhead_system`
--

LOCK TABLES `arrowhead_system` WRITE;
/*!40000 ALTER TABLE `arrowhead_system` DISABLE KEYS */;
INSERT INTO `arrowhead_system` VALUES (0,'192.168.60.22',NULL,8080,'client1'),(5,'0.0.0.0',NULL,8444,'AUTHORIZATION'),(6,'0.0.0.0',NULL,8448,'gatekeeper'),(7,'0.0.0.0',NULL,8440,'ORCHESTRATOR'),(8,'0.0.0.0',NULL,8454,'EVENT_HANDLER'),(25,'0.0.0.0',NULL,8452,'GATEWAY'),(94,'192.168.60.62',NULL,8460,'InsecureTemperatureSensor'),(146,'0.0.0.0',NULL,8460,'InsecureTemperatureSensor');
/*!40000 ALTER TABLE `arrowhead_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker`
--

DROP TABLE IF EXISTS `broker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `is_secure` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker`
--

LOCK TABLES `broker` WRITE;
/*!40000 ALTER TABLE `broker` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_filter`
--

DROP TABLE IF EXISTS `event_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_filter` (
  `id` bigint(20) NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `event_type` varchar(255) NOT NULL,
  `match_metadata` char(1) DEFAULT NULL,
  `notify_uri` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `consumer_system_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKbkos27fkducgbn6rxqty2k6n1` (`event_type`,`consumer_system_id`),
  KEY `FK8k1vieqrr0cxw4x0ubocsrrpo` (`consumer_system_id`),
  CONSTRAINT `FK8k1vieqrr0cxw4x0ubocsrrpo` FOREIGN KEY (`consumer_system_id`) REFERENCES `arrowhead_system` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_filter`
--

LOCK TABLES `event_filter` WRITE;
/*!40000 ALTER TABLE `event_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_filter_metadata`
--

DROP TABLE IF EXISTS `event_filter_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_filter_metadata` (
  `filter_id` bigint(20) NOT NULL,
  `metadata_value` varchar(2047) DEFAULT NULL,
  `metadata_key` varchar(255) NOT NULL,
  PRIMARY KEY (`filter_id`,`metadata_key`),
  CONSTRAINT `FK1iu2vhxo8211io6weiwryguib` FOREIGN KEY (`filter_id`) REFERENCES `event_filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_filter_metadata`
--

LOCK TABLES `event_filter_metadata` WRITE;
/*!40000 ALTER TABLE `event_filter_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_filter_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_filter_sources_list`
--

DROP TABLE IF EXISTS `event_filter_sources_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_filter_sources_list` (
  `filter_id` bigint(20) NOT NULL,
  `sources_id` bigint(20) NOT NULL,
  PRIMARY KEY (`filter_id`,`sources_id`),
  UNIQUE KEY `UK_nbe4wrcv5w6rga8uc6t0cb0ck` (`sources_id`),
  CONSTRAINT `FK7gulo44n997tr1146xxi2xhfe` FOREIGN KEY (`sources_id`) REFERENCES `arrowhead_system` (`id`),
  CONSTRAINT `FKqihrii4ab12xo3oxp5d5pb77j` FOREIGN KEY (`filter_id`) REFERENCES `event_filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_filter_sources_list`
--

LOCK TABLES `event_filter_sources_list` WRITE;
/*!40000 ALTER TABLE `event_filter_sources_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_filter_sources_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (216),(216),(216);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inter_cloud_authorization`
--

DROP TABLE IF EXISTS `inter_cloud_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inter_cloud_authorization` (
  `id` bigint(20) NOT NULL,
  `consumer_cloud_id` bigint(20) NOT NULL,
  `arrowhead_service_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKj4pymxepq7mf82wx7f8e4hd9b` (`consumer_cloud_id`,`arrowhead_service_id`),
  KEY `FKsh4gbm0vs76weoq1lti6awtwf` (`arrowhead_service_id`),
  CONSTRAINT `FKsh4gbm0vs76weoq1lti6awtwf` FOREIGN KEY (`arrowhead_service_id`) REFERENCES `arrowhead_service` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKsw50x8tjybx1jjrkj6aamxt8c` FOREIGN KEY (`consumer_cloud_id`) REFERENCES `arrowhead_cloud` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inter_cloud_authorization`
--

LOCK TABLES `inter_cloud_authorization` WRITE;
/*!40000 ALTER TABLE `inter_cloud_authorization` DISABLE KEYS */;
INSERT INTO `inter_cloud_authorization` VALUES (0,19,21);
/*!40000 ALTER TABLE `inter_cloud_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intra_cloud_authorization`
--

DROP TABLE IF EXISTS `intra_cloud_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intra_cloud_authorization` (
  `id` bigint(20) NOT NULL,
  `consumer_system_id` bigint(20) NOT NULL,
  `provider_system_id` bigint(20) NOT NULL,
  `arrowhead_service_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK4ie5ps7a6w40iqdte0u53mw1u` (`consumer_system_id`,`provider_system_id`,`arrowhead_service_id`),
  KEY `FKt01tq84ypy16yfpt2q9v7qn2b` (`provider_system_id`),
  KEY `FK1nx371ky16pl2rl0f4hk3puk4` (`arrowhead_service_id`),
  CONSTRAINT `FK1nx371ky16pl2rl0f4hk3puk4` FOREIGN KEY (`arrowhead_service_id`) REFERENCES `arrowhead_service` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK58r9imuaq3dy3o96w5xcxkemh` FOREIGN KEY (`consumer_system_id`) REFERENCES `arrowhead_system` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKt01tq84ypy16yfpt2q9v7qn2b` FOREIGN KEY (`provider_system_id`) REFERENCES `arrowhead_system` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intra_cloud_authorization`
--

LOCK TABLES `intra_cloud_authorization` WRITE;
/*!40000 ALTER TABLE `intra_cloud_authorization` DISABLE KEYS */;
INSERT INTO `intra_cloud_authorization` VALUES (0,0,94,21);
/*!40000 ALTER TABLE `intra_cloud_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neighbor_cloud`
--

DROP TABLE IF EXISTS `neighbor_cloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neighbor_cloud` (
  `cloud_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cloud_id`),
  CONSTRAINT `FK9j46xue240bjfr6u5vvi3qsmi` FOREIGN KEY (`cloud_id`) REFERENCES `arrowhead_cloud` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neighbor_cloud`
--

LOCK TABLES `neighbor_cloud` WRITE;
/*!40000 ALTER TABLE `neighbor_cloud` DISABLE KEYS */;
INSERT INTO `neighbor_cloud` VALUES (19);
/*!40000 ALTER TABLE `neighbor_cloud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orchestration_store`
--

DROP TABLE IF EXISTS `orchestration_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orchestration_store` (
  `id` bigint(20) NOT NULL,
  `is_default` char(1) DEFAULT NULL,
  `instruction` varchar(255) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `consumer_system_id` bigint(20) NOT NULL,
  `provider_cloud_id` bigint(20) DEFAULT NULL,
  `provider_system_id` bigint(20) NOT NULL,
  `arrowhead_service_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK328vwkn9l8phjq4j276wb13w9` (`arrowhead_service_id`,`consumer_system_id`,`priority`,`is_default`),
  KEY `FKg9jtg1go2yety7s6qimnbqdtc` (`consumer_system_id`),
  KEY `FK4as8nlx9s4a6a9r6y4oswj5do` (`provider_cloud_id`),
  KEY `FK1a9yusgvqs0jrna2y8cgdeusb` (`provider_system_id`),
  CONSTRAINT `FK1a9yusgvqs0jrna2y8cgdeusb` FOREIGN KEY (`provider_system_id`) REFERENCES `arrowhead_system` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK4as8nlx9s4a6a9r6y4oswj5do` FOREIGN KEY (`provider_cloud_id`) REFERENCES `arrowhead_cloud` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKg9jtg1go2yety7s6qimnbqdtc` FOREIGN KEY (`consumer_system_id`) REFERENCES `arrowhead_system` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKnjr4mytp6bipwyc9sv9y1ip51` FOREIGN KEY (`arrowhead_service_id`) REFERENCES `arrowhead_service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orchestration_store`
--

LOCK TABLES `orchestration_store` WRITE;
/*!40000 ALTER TABLE `orchestration_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `orchestration_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orchestration_store_attributes`
--

DROP TABLE IF EXISTS `orchestration_store_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orchestration_store_attributes` (
  `store_entry_id` bigint(20) NOT NULL,
  `attribute_value` varchar(2047) DEFAULT NULL,
  `attribute_key` varchar(255) NOT NULL,
  PRIMARY KEY (`store_entry_id`,`attribute_key`),
  CONSTRAINT `FKrtqe93seoude4elrqmk1qdowj` FOREIGN KEY (`store_entry_id`) REFERENCES `orchestration_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orchestration_store_attributes`
--

LOCK TABLES `orchestration_store_attributes` WRITE;
/*!40000 ALTER TABLE `orchestration_store_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `orchestration_store_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `own_cloud`
--

DROP TABLE IF EXISTS `own_cloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `own_cloud` (
  `cloud_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cloud_id`),
  CONSTRAINT `FKr3avkpkrx88jt4atfmxewqkl8` FOREIGN KEY (`cloud_id`) REFERENCES `arrowhead_cloud` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `own_cloud`
--

LOCK TABLES `own_cloud` WRITE;
/*!40000 ALTER TABLE `own_cloud` DISABLE KEYS */;
INSERT INTO `own_cloud` VALUES (20);
/*!40000 ALTER TABLE `own_cloud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_registry`
--

DROP TABLE IF EXISTS `service_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_registry` (
  `id` bigint(20) NOT NULL,
  `end_of_validity` datetime DEFAULT NULL,
  `metadata` varchar(255) DEFAULT NULL,
  `service_uri` varchar(255) DEFAULT NULL,
  `udp` char(1) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `arrowhead_service_id` bigint(20) NOT NULL,
  `provider_system_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK3q3tqiu7f92u946p33plj5fxq` (`arrowhead_service_id`,`provider_system_id`),
  KEY `FK4lc944mp4x24pr09wuxbb08ky` (`provider_system_id`),
  CONSTRAINT `FK4lc944mp4x24pr09wuxbb08ky` FOREIGN KEY (`provider_system_id`) REFERENCES `arrowhead_system` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKr0x7pvbi16w5b6ao6q43t606p` FOREIGN KEY (`arrowhead_service_id`) REFERENCES `arrowhead_service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_registry`
--

LOCK TABLES `service_registry` WRITE;
/*!40000 ALTER TABLE `service_registry` DISABLE KEYS */;
INSERT INTO `service_registry` VALUES (204,NULL,NULL,'gateway/connectToProvider','N',1,24,25),(205,NULL,NULL,'gateway/connectToConsumer','N',1,27,25),(206,NULL,NULL,'eventhandler/publish','N',1,2,8),(207,NULL,NULL,'gatekeeper/init_gsd','N',1,1,6),(208,NULL,NULL,'gateway/management','N',1,29,25),(209,NULL,NULL,'eventhandler/subscription','N',1,15,8),(210,NULL,NULL,'gatekeeper/init_icn','N',1,13,6),(211,NULL,NULL,'orchestrator/orchestration','N',1,4,7),(212,NULL,NULL,'authorization','N',1,3,5),(213,NULL,NULL,'authorization/token','N',1,14,5),(215,NULL,'unit=celsius','temperature','N',1,21,94);
/*!40000 ALTER TABLE `service_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'arrowhead_test_cloud_1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-30 11:50:02
