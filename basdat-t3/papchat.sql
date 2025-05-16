-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: papchatdb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `Add_On`
--

DROP TABLE IF EXISTS `Add_On`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Add_On` (
  `id_pengguna` int NOT NULL,
  `id_room` int NOT NULL,
  `urutan_pengiriman` int NOT NULL,
  `first_x` double NOT NULL,
  `last_x` double NOT NULL,
  `first_y` double NOT NULL,
  `last_y` double NOT NULL,
  `layer` int NOT NULL,
  PRIMARY KEY (`id_pengguna`,`id_room`,`urutan_pengiriman`,`layer`),
  CONSTRAINT `Add_On_id_pengguna_id_room_urutan_pengiriman_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`) REFERENCES `Pap` (`id_pengguna`, `id_room`, `urutan_pengiriman`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Add_On`
--

LOCK TABLES `Add_On` WRITE;
/*!40000 ALTER TABLE `Add_On` DISABLE KEYS */;
INSERT INTO `Add_On` VALUES (3,19,1,0.54,0.84,0.08,0.75,1),(4,20,2,0,0.57,0.08,0.35,1),(12,6,1,0.51,0.63,0.58,0.98,1),(13,14,1,0.58,0.78,0.16,0.86,1),(14,7,1,0.1,0.82,0.52,0.72,1),(14,7,1,0.43,0.49,0.25,0.31,2),(15,15,1,0.12,0.97,0.79,1,1),(15,15,1,0.3,0.77,0.06,0.84,2),(15,15,2,0.46,0.51,0.56,0.88,1),(33,1,2,0.09,0.52,0.4,0.6,1),(33,1,2,0.43,0.63,0.19,0.95,2),(37,2,1,0.16,0.87,0.61,0.81,1),(37,2,1,0.19,0.35,0.24,0.63,2),(37,9,1,0.35,1,0.33,0.69,1),(37,10,1,0.66,0.78,0.28,0.48,1),(44,16,1,0.63,0.83,0.7,0.9,1),(44,16,1,0.08,0.5,0.74,0.94,2),(51,10,1,0.53,0.86,0.67,0.87,1),(51,10,1,0.08,0.97,0.69,0.89,2),(55,6,1,0.32,0.7,0.01,0.34,1),(55,6,1,0.13,0.99,0.73,0.82,2),(55,14,2,0.6,0.72,0.67,0.76,1);
/*!40000 ALTER TABLE `Add_On` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Anggota`
--

DROP TABLE IF EXISTS `Anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Anggota` (
  `id_room` int NOT NULL,
  `id_pengguna` int NOT NULL,
  `tanggal_gabung` datetime(3) NOT NULL,
  PRIMARY KEY (`id_room`,`id_pengguna`),
  KEY `Anggota_id_pengguna_fkey` (`id_pengguna`),
  CONSTRAINT `Anggota_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna` (`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Anggota_id_room_fkey` FOREIGN KEY (`id_room`) REFERENCES `Room_Chat` (`id_room`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anggota`
--

LOCK TABLES `Anggota` WRITE;
/*!40000 ALTER TABLE `Anggota` DISABLE KEYS */;
INSERT INTO `Anggota` VALUES (1,4,'2024-11-02 01:43:44.071'),(1,13,'2025-04-20 04:12:19.511'),(1,24,'2024-11-08 16:26:40.160'),(1,33,'2025-04-01 02:16:07.263'),(1,44,'2024-11-21 07:50:27.612'),(1,49,'2025-04-10 02:14:11.521'),(2,8,'2025-03-18 10:11:26.060'),(2,14,'2025-04-06 04:00:11.512'),(2,37,'2025-04-08 01:08:21.102'),(2,38,'2025-04-02 14:02:30.692'),(2,40,'2025-03-03 07:55:47.156'),(2,54,'2025-04-17 07:52:59.553'),(3,1,'2023-10-02 23:21:54.921'),(3,2,'2025-03-06 02:47:56.308'),(3,3,'2023-11-24 02:57:59.207'),(3,19,'2023-08-24 15:39:31.895'),(3,26,'2024-10-27 08:08:30.468'),(3,30,'2024-02-24 18:29:27.995'),(3,35,'2023-09-14 03:10:23.092'),(3,48,'2023-08-27 08:49:18.829'),(4,9,'2025-03-02 22:50:56.180'),(4,18,'2025-05-02 15:38:00.335'),(4,39,'2024-12-18 01:22:02.396'),(4,44,'2025-03-17 17:48:43.213'),(4,54,'2025-02-16 06:54:32.861'),(5,2,'2024-03-12 22:29:43.693'),(5,16,'2025-01-26 09:07:18.939'),(5,25,'2025-05-11 07:08:45.943'),(5,36,'2023-11-08 05:08:34.018'),(6,8,'2025-05-13 03:41:24.807'),(6,12,'2025-05-08 08:03:59.811'),(6,23,'2025-05-11 05:31:02.499'),(6,29,'2025-05-09 16:04:40.217'),(6,31,'2025-05-02 20:55:01.485'),(6,44,'2025-05-11 15:22:01.769'),(6,50,'2025-05-10 22:07:14.386'),(6,52,'2025-05-02 21:30:54.834'),(6,55,'2025-05-13 02:09:41.246'),(7,1,'2025-04-08 03:15:28.481'),(7,14,'2025-04-03 01:33:58.508'),(7,34,'2025-02-22 23:58:47.164'),(7,42,'2025-05-10 17:01:19.093'),(8,3,'2024-11-07 21:10:26.943'),(8,15,'2025-03-22 15:27:16.529'),(8,17,'2024-12-17 00:37:48.118'),(8,31,'2025-03-19 21:13:56.626'),(8,33,'2024-12-21 11:12:53.116'),(8,47,'2025-01-08 01:46:29.170'),(8,50,'2025-02-18 02:28:51.614'),(8,53,'2025-02-09 07:52:07.024'),(9,3,'2025-04-12 06:37:08.181'),(9,4,'2025-04-21 12:33:11.436'),(9,5,'2025-05-08 14:57:35.183'),(9,9,'2025-05-04 00:00:46.541'),(9,21,'2025-05-12 17:33:08.686'),(9,29,'2025-05-05 15:10:55.533'),(9,34,'2025-05-03 10:08:06.557'),(9,37,'2025-05-15 12:46:11.218'),(9,52,'2025-05-04 13:03:57.425'),(10,6,'2024-12-06 13:49:52.824'),(10,14,'2024-12-27 22:37:51.157'),(10,25,'2025-02-14 21:01:53.623'),(10,34,'2024-09-14 09:45:39.887'),(10,37,'2024-10-07 14:10:22.516'),(10,51,'2025-03-07 07:15:27.883'),(11,20,'2025-03-01 04:36:16.447'),(11,29,'2025-04-04 11:37:37.137'),(12,5,'2025-02-11 22:36:42.053'),(12,9,'2024-08-31 19:51:17.292'),(12,14,'2024-08-22 09:47:30.362'),(12,19,'2024-11-25 23:53:00.783'),(12,29,'2024-08-15 17:14:53.032'),(12,31,'2025-01-20 18:57:51.733'),(12,33,'2024-12-09 18:21:38.376'),(12,42,'2024-08-09 15:45:08.203'),(12,51,'2025-04-07 15:20:52.340'),(12,55,'2025-01-12 20:10:35.539'),(13,13,'2024-09-29 13:59:47.209'),(13,38,'2024-09-10 18:18:31.691'),(14,7,'2024-04-05 18:09:32.430'),(14,13,'2023-11-30 13:48:16.044'),(14,14,'2024-09-25 01:30:13.287'),(14,36,'2023-11-13 07:18:02.828'),(14,38,'2024-12-18 13:17:03.679'),(14,41,'2024-07-18 21:51:50.246'),(14,48,'2024-11-10 00:34:44.590'),(14,50,'2023-09-27 19:33:48.885'),(14,53,'2024-10-22 20:04:22.492'),(14,55,'2025-03-21 19:35:03.158'),(15,2,'2025-02-09 12:14:40.139'),(15,15,'2025-04-29 23:25:18.535'),(15,39,'2025-03-11 20:00:10.541'),(15,41,'2025-05-04 04:33:30.092'),(15,48,'2025-02-15 21:01:40.391'),(15,49,'2025-04-06 12:47:21.143'),(15,53,'2025-03-25 23:07:48.748'),(16,11,'2024-04-20 19:40:01.354'),(16,13,'2024-09-07 08:17:40.512'),(16,14,'2024-10-20 06:19:58.536'),(16,16,'2024-03-24 18:29:57.257'),(16,19,'2024-03-03 09:52:59.970'),(16,20,'2024-04-22 16:03:17.781'),(16,41,'2025-02-26 20:08:44.728'),(16,44,'2024-11-25 14:43:47.359'),(16,55,'2024-04-04 13:44:42.041'),(17,15,'2023-11-30 18:03:23.325'),(17,22,'2024-09-08 11:36:19.675'),(17,47,'2024-10-02 07:50:09.443'),(18,29,'2024-05-22 19:43:05.809'),(18,30,'2024-07-22 06:48:23.057'),(18,47,'2025-04-22 03:35:38.638'),(18,53,'2025-04-26 16:56:35.250'),(19,3,'2024-11-11 00:27:49.244'),(19,6,'2024-11-01 15:43:55.311'),(19,9,'2024-05-22 07:52:47.410'),(19,26,'2024-05-22 16:19:43.631'),(19,49,'2024-05-22 13:29:46.407'),(20,4,'2025-02-17 09:27:58.079'),(20,31,'2025-03-08 19:24:17.294'),(20,38,'2025-05-06 22:07:40.473'),(20,49,'2025-01-01 04:11:17.366'),(20,52,'2025-01-29 23:08:51.259'),(20,55,'2025-02-24 06:16:45.123');
/*!40000 ALTER TABLE `Anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Berteman`
--

DROP TABLE IF EXISTS `Berteman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Berteman` (
  `id_pengguna` int NOT NULL,
  `id_teman` int NOT NULL,
  `runtun` int DEFAULT NULL,
  `tanggal_mulai` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`,`id_teman`),
  KEY `Berteman_id_teman_fkey` (`id_teman`),
  CONSTRAINT `Berteman_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna` (`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Berteman_id_teman_fkey` FOREIGN KEY (`id_teman`) REFERENCES `Pengguna` (`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Berteman`
--

LOCK TABLES `Berteman` WRITE;
/*!40000 ALTER TABLE `Berteman` DISABLE KEYS */;
INSERT INTO `Berteman` VALUES (1,2,76,'2025-04-26 11:44:43.654'),(1,5,NULL,'2023-12-19 03:09:21.452'),(1,11,137,'2024-08-20 09:06:41.929'),(1,17,NULL,'2025-03-26 00:09:23.051'),(1,18,9,'2023-10-07 01:00:06.908'),(1,21,NULL,'2025-03-07 04:03:32.732'),(1,23,197,'2024-03-22 02:35:09.734'),(1,24,94,'2023-12-12 00:20:09.759'),(1,26,36,'2024-08-06 14:10:43.830'),(1,27,87,'2023-09-18 20:08:14.430'),(1,31,NULL,'2025-03-16 22:16:27.826'),(2,5,54,'2025-04-09 21:53:09.984'),(2,30,NULL,'2025-04-20 18:20:51.602'),(3,5,NULL,'2024-10-08 00:56:52.038'),(3,6,NULL,'2024-12-03 11:58:53.330'),(3,7,158,'2024-04-07 14:12:20.714'),(3,9,67,'2023-12-04 01:16:01.799'),(3,24,NULL,'2025-01-19 15:47:48.116'),(3,25,146,'2025-03-13 14:27:11.408'),(3,26,NULL,'2023-09-20 14:43:02.460'),(3,33,128,'2025-05-11 15:26:55.907'),(3,40,151,'2023-03-24 23:00:47.086'),(3,43,NULL,'2025-01-25 17:47:19.152'),(4,5,178,'2025-01-07 11:44:34.293'),(4,14,NULL,'2024-12-06 19:38:47.501'),(4,15,NULL,'2023-12-31 14:52:10.489'),(4,27,NULL,'2024-03-17 20:39:31.847'),(4,39,19,'2024-11-08 13:30:51.408'),(4,48,70,'2023-09-04 08:46:21.026'),(4,50,57,'2025-04-01 03:06:45.747'),(5,12,NULL,'2025-01-26 01:25:12.974'),(5,15,NULL,'2025-01-06 17:40:23.866'),(5,18,68,'2023-05-28 10:55:56.003'),(5,22,93,'2025-04-25 20:32:53.802'),(5,32,58,'2024-11-21 17:10:05.583'),(5,36,85,'2024-01-25 03:39:22.838'),(5,40,NULL,'2023-05-07 02:59:28.180'),(5,41,126,'2024-04-12 23:48:39.295'),(5,43,NULL,'2024-10-18 14:52:44.024'),(5,47,NULL,'2024-07-06 23:47:27.979'),(6,8,NULL,'2025-04-13 22:46:31.957'),(6,39,36,'2025-02-27 06:52:00.279'),(6,52,NULL,'2025-04-12 15:13:52.112'),(7,8,142,'2025-04-25 01:10:35.375'),(7,14,176,'2024-10-30 01:38:13.624'),(7,36,NULL,'2024-09-29 12:44:49.785'),(7,39,53,'2025-02-26 00:46:25.657'),(7,45,177,'2025-03-26 16:23:47.469'),(7,50,1,'2025-04-16 19:13:45.482'),(7,51,176,'2025-05-15 08:07:25.877'),(7,55,60,'2025-03-13 22:20:32.038'),(8,10,NULL,'2025-04-10 17:45:06.069'),(8,11,137,'2025-05-11 06:45:12.492'),(8,12,130,'2025-04-22 16:35:36.347'),(8,17,NULL,'2025-04-18 03:05:58.639'),(8,18,NULL,'2025-04-01 10:43:01.760'),(8,25,NULL,'2025-04-22 17:56:49.046'),(8,31,41,'2025-03-30 23:51:07.448'),(8,37,196,'2025-05-08 20:40:50.697'),(8,43,NULL,'2025-04-29 01:26:54.642'),(8,47,178,'2025-05-12 08:37:18.082'),(9,10,96,'2024-04-29 12:20:43.910'),(9,13,87,'2025-05-10 11:53:47.309'),(9,21,NULL,'2023-09-23 06:38:46.503'),(9,22,24,'2024-09-07 08:16:38.217'),(9,39,NULL,'2024-11-18 06:52:29.206'),(9,41,NULL,'2025-01-06 14:04:46.064'),(9,42,NULL,'2025-05-04 07:11:01.998'),(9,50,30,'2025-04-03 14:25:48.838'),(10,11,173,'2024-08-04 22:16:27.258'),(10,32,130,'2025-01-08 22:14:46.036'),(10,34,33,'2024-08-16 14:46:13.269'),(10,41,4,'2023-11-15 23:28:39.434'),(10,51,NULL,'2025-02-09 11:15:25.098'),(11,17,NULL,'2024-08-14 15:42:17.686'),(11,25,101,'2024-04-07 19:43:07.219'),(11,27,134,'2024-04-27 13:56:47.193'),(11,29,157,'2025-03-31 03:49:13.059'),(11,34,NULL,'2023-05-25 14:56:05.554'),(11,37,96,'2023-02-14 23:18:08.866'),(11,39,NULL,'2025-05-15 07:44:51.409'),(11,47,NULL,'2023-09-17 00:40:22.738'),(12,30,136,'2024-09-09 20:43:41.550'),(12,40,50,'2025-01-22 22:54:16.494'),(13,21,NULL,'2025-05-09 17:02:47.119'),(13,24,NULL,'2025-05-14 01:53:15.473'),(13,38,6,'2025-04-30 15:31:07.362'),(13,45,43,'2025-05-08 04:02:21.826'),(13,52,10,'2025-05-11 04:06:53.293'),(14,16,NULL,'2025-04-16 12:40:06.325'),(14,18,NULL,'2025-01-30 21:00:15.149'),(14,36,NULL,'2025-04-17 03:48:14.541'),(14,38,11,'2025-03-03 07:27:43.125'),(14,39,181,'2024-12-15 03:52:11.707'),(14,48,NULL,'2025-05-03 09:46:29.702'),(14,54,19,'2025-02-18 13:32:06.316'),(14,55,86,'2025-02-20 10:37:28.688'),(15,19,NULL,'2024-07-16 17:20:01.926'),(15,28,123,'2025-04-07 16:58:15.825'),(15,29,162,'2025-02-05 10:27:39.029'),(15,38,NULL,'2025-03-13 07:53:23.565'),(15,48,154,'2024-09-12 05:15:07.904'),(15,49,17,'2024-11-05 03:41:04.328'),(15,53,65,'2023-11-24 10:53:16.243'),(16,48,154,'2025-05-08 18:52:20.335'),(16,55,NULL,'2025-05-11 08:06:33.130'),(17,21,7,'2024-11-08 06:08:55.117'),(17,23,147,'2024-06-07 11:30:38.836'),(17,26,NULL,'2024-12-05 17:56:23.428'),(17,30,NULL,'2024-05-12 06:16:01.040'),(17,36,168,'2024-12-21 01:16:36.293'),(17,39,NULL,'2025-01-26 20:40:55.060'),(17,51,NULL,'2025-04-14 02:17:16.929'),(17,53,15,'2025-03-06 09:19:43.809'),(18,21,133,'2024-02-01 11:42:51.633'),(18,35,NULL,'2025-05-12 02:56:20.855'),(18,37,135,'2023-12-17 13:29:09.514'),(18,38,45,'2024-10-06 03:46:42.472'),(18,44,NULL,'2024-10-31 15:30:22.363'),(18,49,NULL,'2025-04-22 23:06:31.773'),(18,53,41,'2024-06-20 02:47:03.095'),(19,22,153,'2025-04-12 13:59:37.806'),(19,31,NULL,'2025-03-15 02:28:40.206'),(19,32,NULL,'2024-10-28 11:19:40.877'),(19,34,NULL,'2024-09-23 17:40:09.667'),(19,37,NULL,'2024-10-30 02:38:07.716'),(19,45,195,'2024-08-01 06:04:29.249'),(19,47,NULL,'2024-04-11 02:02:56.296'),(19,51,NULL,'2025-02-07 02:47:48.117'),(19,55,88,'2025-04-23 04:39:25.823'),(20,21,189,'2023-12-17 19:24:45.584'),(20,24,112,'2025-02-05 05:54:13.767'),(20,28,NULL,'2024-07-14 04:56:53.410'),(20,37,NULL,'2024-08-06 04:37:18.867'),(20,40,13,'2025-03-20 03:49:04.127'),(20,43,177,'2025-01-09 03:01:50.608'),(20,46,NULL,'2023-07-08 03:28:34.443'),(20,47,NULL,'2024-07-18 06:01:50.919'),(20,50,NULL,'2025-04-06 09:52:20.783'),(20,52,98,'2024-04-13 20:59:45.033'),(20,54,69,'2024-06-05 08:40:24.690'),(21,25,NULL,'2024-12-05 03:59:12.450'),(21,31,150,'2024-05-27 04:56:39.694'),(21,37,23,'2023-11-25 09:44:46.973'),(21,39,119,'2025-05-11 08:31:10.964'),(21,48,69,'2023-08-10 16:15:56.181'),(22,47,134,'2024-12-04 16:55:22.997'),(23,24,15,'2024-03-03 18:42:40.593'),(23,29,180,'2025-01-03 16:58:40.061'),(23,35,NULL,'2025-01-01 14:08:08.821'),(23,41,NULL,'2024-06-15 00:19:54.857'),(23,44,NULL,'2024-03-31 02:45:56.093'),(23,46,NULL,'2024-08-05 19:26:54.661'),(23,51,46,'2025-02-20 19:10:35.876'),(24,34,67,'2024-07-09 21:10:07.288'),(24,35,52,'2025-01-08 04:44:16.474'),(24,36,NULL,'2023-11-01 23:46:10.952'),(24,37,198,'2024-10-06 12:58:50.595'),(24,44,NULL,'2025-02-13 17:09:06.578'),(24,48,92,'2023-02-01 22:05:34.493'),(24,51,170,'2025-02-17 11:26:03.846'),(24,52,NULL,'2024-08-23 23:43:59.568'),(24,54,NULL,'2023-01-20 05:09:09.550'),(25,30,97,'2024-02-09 10:15:39.549'),(25,32,75,'2025-01-12 16:07:21.518'),(25,33,NULL,'2025-05-13 09:33:42.862'),(25,40,NULL,'2024-03-26 23:59:38.141'),(25,42,156,'2025-04-23 18:47:50.817'),(25,43,153,'2024-08-12 01:53:57.053'),(26,33,NULL,'2025-05-11 10:51:49.246'),(26,35,NULL,'2025-05-15 11:22:32.709'),(26,39,NULL,'2024-12-20 01:33:51.393'),(26,49,71,'2025-04-09 14:11:41.708'),(26,50,193,'2025-04-22 02:57:43.835'),(26,54,NULL,'2025-02-23 14:01:12.514'),(27,30,NULL,'2024-04-01 00:10:19.343'),(27,34,NULL,'2023-03-19 21:39:44.311'),(27,40,45,'2024-01-19 07:23:37.043'),(27,44,179,'2024-02-27 21:45:04.420'),(27,45,NULL,'2023-09-25 15:27:56.038'),(27,54,37,'2023-09-02 06:37:14.178'),(28,33,87,'2025-05-13 16:50:53.725'),(28,38,NULL,'2025-03-07 19:56:14.941'),(28,47,194,'2025-05-09 17:06:16.555'),(28,48,NULL,'2025-02-20 02:30:50.343'),(29,42,199,'2025-02-21 02:45:59.071'),(29,49,115,'2025-04-12 01:36:44.598'),(29,50,28,'2025-01-06 19:35:10.311'),(30,31,NULL,'2024-05-07 18:12:38.940'),(30,36,129,'2025-01-11 03:54:46.990'),(31,32,145,'2024-11-28 05:39:52.044'),(31,49,94,'2024-04-14 22:30:34.143'),(32,37,152,'2024-12-14 02:48:19.682'),(32,38,NULL,'2025-03-09 11:26:07.064'),(32,45,NULL,'2024-12-17 03:59:53.694'),(32,47,125,'2025-01-24 15:52:27.914'),(32,54,NULL,'2024-10-16 22:26:18.251'),(32,55,179,'2025-02-06 10:25:29.600'),(33,40,NULL,'2025-05-15 21:52:09.601'),(33,43,96,'2025-05-10 20:57:55.774'),(33,45,NULL,'2025-05-10 20:08:40.161'),(33,49,102,'2025-05-13 05:18:17.058'),(34,40,83,'2023-12-24 12:42:32.884'),(34,48,134,'2024-09-19 13:54:31.393'),(35,36,2,'2025-03-30 10:05:56.559'),(35,38,NULL,'2025-03-22 20:42:13.399'),(35,50,NULL,'2025-03-13 13:49:08.622'),(35,51,171,'2025-02-09 06:25:17.140'),(36,51,186,'2025-02-09 22:03:53.647'),(36,55,NULL,'2025-05-12 19:06:41.629'),(37,52,NULL,'2024-03-30 17:03:02.369'),(37,55,58,'2025-03-03 03:11:15.066'),(38,40,39,'2025-04-29 06:44:01.305'),(38,43,NULL,'2024-10-06 19:59:47.432'),(38,55,1,'2025-04-10 08:39:24.874'),(39,40,NULL,'2025-05-09 00:01:47.303'),(39,43,74,'2025-01-30 22:24:05.665'),(39,44,NULL,'2024-12-18 17:39:09.783'),(39,45,NULL,'2025-02-09 20:57:26.480'),(40,44,170,'2025-04-15 17:47:33.621'),(40,51,NULL,'2025-05-02 19:03:52.072'),(40,53,NULL,'2025-04-22 22:53:39.474'),(41,44,NULL,'2023-10-01 14:12:15.485'),(41,49,9,'2025-04-19 21:04:06.364'),(41,50,NULL,'2025-02-21 22:14:17.027'),(41,52,123,'2024-12-11 18:34:35.725'),(42,44,13,'2025-02-03 07:54:37.302'),(42,49,7,'2025-05-16 03:14:21.894'),(43,46,122,'2024-02-29 02:11:02.475'),(43,50,67,'2025-01-03 06:01:51.277'),(44,46,166,'2025-03-20 13:24:04.334'),(44,49,168,'2025-02-25 03:37:59.140'),(44,52,95,'2023-09-23 12:11:24.627'),(44,54,NULL,'2023-09-22 03:21:22.898'),(46,47,58,'2023-06-25 09:16:10.178'),(46,52,NULL,'2023-10-19 03:48:30.334'),(48,50,NULL,'2025-03-27 18:56:02.852'),(48,51,NULL,'2025-02-21 02:15:07.413'),(49,53,106,'2024-11-24 10:52:37.204'),(50,54,48,'2025-02-16 08:51:36.868'),(50,55,NULL,'2025-04-16 08:26:53.961'),(51,52,NULL,'2025-02-02 13:21:51.544'),(52,55,107,'2025-03-07 23:32:23.231');
/*!40000 ALTER TABLE `Berteman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Caption`
--

DROP TABLE IF EXISTS `Caption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Caption` (
  `teks` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `font_style` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pengguna` int NOT NULL,
  `id_room` int NOT NULL,
  `urutan_pengiriman` int NOT NULL,
  `layer` int NOT NULL,
  PRIMARY KEY (`id_pengguna`,`id_room`,`urutan_pengiriman`,`layer`),
  CONSTRAINT `Caption_id_pengguna_id_room_urutan_pengiriman_layer_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`) REFERENCES `Add_On` (`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caption`
--

LOCK TABLES `Caption` WRITE;
/*!40000 ALTER TABLE `Caption` DISABLE KEYS */;
INSERT INTO `Caption` VALUES ('appositus vilis casus vir adfero','Underline',3,19,1,1),('amet','Bold',4,20,2,1),('arcus aequitas aiunt bestia iste degusto','Italic',12,6,1,1),('tum catena vir turba','Bold',13,14,1,1),('stipes argumentum corona confero','Italic',14,7,1,1),('voveo ea chirographum fugiat angelus cum venio','Bold',14,7,1,2),('cavus solum auctus cursus','Bold',15,15,1,1),('tactus uter tantillus chirographum curiositas','Italic',15,15,1,2),('desolo asperiores','Italic',15,15,2,1),('vindico','Bold',33,1,2,1),('argumentum approbo et desparatus appono desparatus','Italic',33,1,2,2),('eum tardus usitas abundans arbor','Underline',37,2,1,1),('subseco a denuo copiose conforto antepono vacuus','Italic',37,2,1,2),('currus','Underline',37,9,1,1),('decipio atavus','Underline',37,10,1,1),('iure crebro minima decipio accommodo','Italic',44,16,1,1),('vicinus calculus talio pecto sumo','Underline',44,16,1,2),('viridis unde valetudo amicitia repudiandae solus decimus','Bold',51,10,1,1),('terra laborum cetera cetera','Italic',55,6,1,1),('thesis','Italic',55,6,1,2);
/*!40000 ALTER TABLE `Caption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chat`
--

DROP TABLE IF EXISTS `Chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chat` (
  `id_pengguna` int NOT NULL,
  `id_room` int NOT NULL,
  `urutan_pengiriman` int NOT NULL,
  `pesan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pengguna`,`id_room`,`urutan_pengiriman`),
  CONSTRAINT `Chat_id_pengguna_id_room_urutan_pengiriman_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`) REFERENCES `Konten` (`id_pengguna`, `id_room`, `urutan_pengiriman`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chat`
--

LOCK TABLES `Chat` WRITE;
/*!40000 ALTER TABLE `Chat` DISABLE KEYS */;
INSERT INTO `Chat` VALUES (1,7,1,'Verumtamen paulatim summisse.'),(2,3,1,'Voluptates coadunatio tabgo corona uter comedo trans vesica patior baiulus argentum derelinquo coepi calco.'),(2,3,2,'Sonitus quis demo carpo timor claro rem admoneo subnecto coniecto crur stipes corrumpo assentator auxilium adopto usus colligo unus coerceo eveniet anser surculus doloribus corpus decet sollers curto aegrus.'),(2,5,1,'Audacia confugo vesica umbra consequatur bibo vindico desparatus cenaculum voveo adinventitias adnuo ara aeger corroboro derideo error peior depulso vicissitudo.'),(2,5,2,'Antiquus adimpleo cibo laudantium conduco sodalitas quidem barba aegrus celer tibi callide minima pauper usque aliquid comminor vado cogo corroboro canonicus undique custodia bos tardus beatus arguo coadunatio aperte sopor.'),(3,9,1,'Deduco totam patrocinor vesper urbs tandem cuppedia vesper usus conicio vae quas ager.'),(4,1,1,'Cilicium sopor peior subnecto vester amiculum absum tergiversatio consequuntur alo.'),(4,20,1,'Aliquid ultra totidem voco crepusculum umerus varius culpa provident cedo tamdiu convoco adiuvo est ago aliquid vergo vulnero necessitatibus crur consequatur deleniti exercitationem stillicidium tamisium.'),(5,9,1,'Dolorum accusantium desino nobis conturbo aeneus suspendo atavus deficio caritas surgo labore vulgus defleo alter armarium summa verto ciminatio atque.'),(5,12,1,'Copiose decimus traho concido verbera demoror coepi adhuc maxime tondeo vulpes dolorum damnatio deorsum caries odit ratione aveho calco celer maxime.'),(6,19,1,'Terror utique blanditiis decens valetudo avarus debeo barba aperte copia tego aestas depromo nulla vitiosus arbor censura clamo umerus natus varietas deprecator tenus aegrus tabella sollers caecus sono amoveo aeneus.'),(8,2,1,'Nostrum tripudio tollo aureus dolore synagoga correptius tyrannus stabilis peccatus cibus cupiditas talis venio adsum voluptates stips.'),(9,19,1,'Adicio vado nostrum solus coaegresco suffragium debitis cunabula cribro amiculum sortitus temptatio arbitro adipisci labore thesaurus adnuo adopto.'),(11,16,1,'Dedico curto verbera exercitationem canto taedium anser.'),(12,6,2,'Adopto.'),(13,13,1,'Tripudio esse ut conitor vallum ater bos deprimo condico deserunt compello brevis laborum aliqua.'),(13,16,1,'Deripio vix vestigium terreo articulus despecto defaeco congregatio ater cogito repellendus spargo arguo tripudio tempore tui tego facere vinculum dolorem armarium combibo civis adaugeo amiculum.'),(14,10,1,'Vos denuo solus comptus titulus iusto ventus vulpes teneo confido solus tibi sufficio tergum cohaero denuo certe.'),(14,10,2,'Casso crastinus compono vitium amor speculum aggero.'),(14,12,1,'Agnitio.'),(14,14,2,'Arca ea abduco ventus victus aliquid agnitio antiquus antepono sui trucido vel decimus.'),(14,16,1,'Fuga cohibeo caute barba vetus vix sublime taedium.'),(15,8,1,'Ascit demoror sui carbo vitium quam terra aegre toties.'),(15,17,1,'Degero uterque ipsa circumvenio utique vestrum compello congregatio creta vox accedo utpote trucido stips adhaero suadeo cogo ustulo.'),(16,16,1,'Alo claustrum sodalitas vulnero vero currus patruus officia varius aggredior aer vesco praesentium victus deputo paulatim cotidie arguo alo tolero.'),(16,16,2,'Maiores vel tener decerno clam abbas adversus avarus spiculum decet amo celer subiungo vulgaris capto comburo vaco repellendus artificiose taedium surculus demonstro thema arbor audax saepe acies acidus.'),(17,8,1,'Apparatus crepusculum esse vinitor cognatus.'),(18,4,1,'Summisse acies quia cognomen undique templum quaerat arceo quibusdam vociferor attonbitus infit defendo facilis cariosus valde eaque.'),(20,11,1,'Ceno accendo comedo ultra vereor auctus condico earum.'),(20,16,1,'Acervus utrum solio temptatio deficio animi solutio custodia laudantium cibus vos pauper aveho caelum aegre timor suggero corrumpo minus ubi deprimo thymbra audax attollo depraedor delibero tempora aspicio.'),(21,9,1,'Aspernatur unde calamitas ascit vix acerbitas accusamus tabesco fuga tempore calculus bellum carpo capto arbitro cohors bellicus soleo super theologus tutis degero tres temeritas arto attollo caute causa textilis vinitor.'),(21,9,2,'Turbo advoco animi tego possimus vicissitudo tardus absque aegrus somniculosus animi alius cohaero terror truculenter tardus dedecor distinctio amissio capillus repellendus voluptatum.'),(23,6,1,'Decimus aliquam territo attollo thymbra utrum occaecati strenuus volubilis mollitia adhaero argumentum abbas arto nobis subito auctus patior fugiat summa nemo tergum compono depono compono tergeo cado desino.'),(24,1,1,'Cohors supplanto tergo.'),(24,1,2,'Neque acervus tui temptatio antiquus sopor aduro debeo callide modi vitium solum colligo tunc comburo carpo absorbeo atrocitas somniculosus adopto eligendi super aro alo.'),(25,5,1,'Ciminatio dedico cena timidus adsum occaecati ducimus aer comis depopulo iste demergo nisi adflicto aliquam aranea bardus derideo.'),(29,6,1,'Talis quibusdam quas aequus contego valde curatio voco tremo adeptio theologus crur tondeo vergo illo ventus vindico carcer velit in.'),(29,11,1,'Arx uterque suffragium vomica vilitas cerno abbas synagoga demum cupio vulgaris cohaero debeo cupiditas balbus sint urbs viscus facere adamo depraedor concido tonsor volutabrum corrumpo conitor vigor patria.'),(29,18,1,'Cubicularis ultio cetera libero deorsum deprecator argentum veniam ventus amplexus ipsa trepide cursus subnecto tutis incidunt civitas vereor ullus adinventitias aeger demens alius adamo vulgo verus cupiditas tracto.'),(31,6,1,'Creo vereor demulceo totidem adnuo demonstro minus ab repellat vacuus tumultus vero dolorum thalassinus tremo debitis consequatur demum depopulo denique tempora altus aggredior distinctio denuncio solum accusantium tres appello.'),(31,20,1,'Stillicidium consuasor veritatis validus tam colo asperiores bene cogo tero torqueo vesica avaritia triduana perferendis acerbitas valetudo viridis sapiente.'),(33,1,1,'Deleo textus currus clarus comprehendo laudantium vulgaris villa occaecati iusto valens uxor dolorem universe inflammatio aegrotatio.'),(33,8,1,'Aegrus consuasor adeptio supplanto conduco temporibus coepi balbus contego sono molestiae accendo solus tamisium alias conforto vicissitudo suppellex solutio auctor explicabo.'),(34,7,1,'Verto corrumpo appello sto tubineus.'),(36,5,1,'Thymum alias alius ambulo aggero aggero suggero carcer solum sint super agnosco concido vomito adfero aequitas sto crux civitas.'),(38,2,1,'Aptus ars sub pauper.'),(38,13,1,'Stipes angulus cupio acies veniam dolores cruentus conqueror dicta.'),(38,14,1,'Vivo ullam.'),(38,20,1,'At stabilis subnecto vesica vester.'),(38,20,2,'Armarium quo verbum conscendo catena supellex aegrotatio adduco doloribus ascit ago cattus pecto cumque spiritus.'),(39,15,1,'Cohibeo custodia alii ad corrigo autus antea cernuus brevis deleniti strenuus defleo crastinus vomito dedecor causa amoveo calamitas similique accusamus adopto basium dolores arbitro celer delicate.'),(40,2,1,'Tenuis.'),(40,2,2,'Deleo acer numquam accusantium turba rem sursum ager necessitatibus velit civitas suadeo demitto admoveo creator tergum infit arcus cupressus atrocitas aperte catena cum aliqua absque compono usitas tandem sapiente harum.'),(41,14,1,'Depulso territo tabella temporibus undique circumvenio totidem urbs vinitor quam certus tutamen alveus averto versus tactus cavus patria ater.'),(41,16,1,'Uterque tamen utrum adduco demo amplexus culpa arcesso.'),(42,12,1,'Trans usus termes stultus alias.'),(42,12,2,'Avarus colligo praesentium iure vitiosus mollitia teneo candidus harum cursim comes.'),(44,1,1,'Tardus amplitudo cibus animadverto speculum umbra amissio coma spero conicio cuius accedo animus auditor testimonium absconditus centum crustulum deprecator autem temperantia comedo acer.'),(44,4,1,'Torrens antepono labore.'),(44,16,3,'Desino anser socius turbo accommodo colligo asper cognatus eos tabernus voro cavus damno bestia tumultus pectus decumbo.'),(47,8,1,'Complectus tertius praesentium illo velum libero comedo.'),(47,8,2,'Cognomen vigor cornu tepidus.'),(47,17,1,'Catena coniuratio thorax demum tantum agnosco accommodo suggero terebro verbum absens spiculum ver debitis capto casso rerum dens coerceo nam deputo ea dolorem acerbitas tollo stultus venio capillus commodo.'),(47,18,1,'Officiis quae supellex talio argumentum cura tersus capto summa templum at velum absque vinculum vilis bonus comminor.'),(48,3,1,'Commodi denego subnecto cumque ut acceptus cognatus sonitus sodalitas odit advenio virga defetiscor adaugeo certus crastinus depraedor cicuta civis asper.'),(49,1,1,'Cubitum cibus curriculum acidus defleo in asporto canto tergum cunctatio appono eius ab tergiversatio conduco exercitationem tergeo velociter.'),(49,15,1,'Cenaculum testimonium uredo.'),(52,6,1,'Desolo vinculum cado amor animadverto nobis sustineo turpis curso crustulum adulatio.'),(52,20,1,'Cultellus sollicito valde vito carpo virgo tum valeo vulnus nostrum.'),(52,20,2,'Eius absconditus voluptas tamdiu ipsum abeo cicuta verecundia aliquid.'),(53,15,1,'Delibero.'),(54,4,1,'Fuga delibero bis stipes conservo pel reiciendis.'),(55,6,2,'Testimonium caelum trans derideo conscendo aliquam admitto bibo enim vinculum odio facilis umbra tener tener carus terga trepide trepide volva ascit hic venia dedico aeger vulgus ademptio repudiandae.'),(55,14,1,'Ambitus bellicus correptius vesco tristis volutabrum.');
/*!40000 ALTER TABLE `Chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Konten`
--

DROP TABLE IF EXISTS `Konten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Konten` (
  `id_pengguna` int NOT NULL,
  `id_room` int NOT NULL,
  `urutan_pengiriman` int NOT NULL,
  `tipe` enum('PAP','CHAT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_simpan` tinyint(1) NOT NULL DEFAULT '0',
  `waktu_pengiriman` datetime(3) NOT NULL,
  PRIMARY KEY (`id_pengguna`,`id_room`,`urutan_pengiriman`),
  KEY `Konten_id_room_fkey` (`id_room`),
  CONSTRAINT `Konten_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna` (`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Konten_id_room_fkey` FOREIGN KEY (`id_room`) REFERENCES `Room_Chat` (`id_room`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Konten`
--

LOCK TABLES `Konten` WRITE;
/*!40000 ALTER TABLE `Konten` DISABLE KEYS */;
INSERT INTO `Konten` VALUES (1,7,1,'CHAT',1,'2025-04-19 06:25:39.513'),(2,3,1,'CHAT',1,'2025-04-10 20:03:32.209'),(2,3,2,'CHAT',0,'2025-03-16 09:04:30.389'),(2,5,1,'CHAT',0,'2024-09-25 10:45:57.452'),(2,5,2,'CHAT',0,'2024-07-08 12:09:33.435'),(3,9,1,'CHAT',0,'2025-04-26 08:53:49.673'),(3,19,1,'PAP',0,'2025-02-10 08:12:51.925'),(3,19,2,'PAP',0,'2025-04-29 17:13:59.989'),(4,1,1,'CHAT',1,'2024-11-30 00:31:45.165'),(4,20,1,'CHAT',0,'2025-04-04 19:25:05.207'),(4,20,2,'PAP',0,'2025-05-02 18:29:33.797'),(5,9,1,'CHAT',0,'2025-05-14 20:41:09.724'),(5,12,1,'CHAT',0,'2025-03-13 02:48:12.184'),(6,19,1,'CHAT',0,'2025-03-15 07:48:06.199'),(8,2,1,'CHAT',0,'2025-04-12 06:49:51.022'),(8,2,2,'PAP',0,'2025-05-02 11:47:15.160'),(9,12,1,'PAP',0,'2024-11-28 20:09:55.464'),(9,19,1,'CHAT',0,'2024-07-03 16:11:36.154'),(11,16,1,'CHAT',0,'2024-10-11 17:13:50.434'),(12,6,1,'PAP',1,'2025-05-11 11:09:17.807'),(12,6,2,'CHAT',0,'2025-05-15 22:58:37.930'),(13,13,1,'CHAT',0,'2025-01-08 17:59:40.805'),(13,14,1,'PAP',1,'2024-01-15 19:59:03.216'),(13,16,1,'CHAT',0,'2024-10-11 17:45:43.946'),(14,7,1,'PAP',0,'2025-04-04 02:27:28.152'),(14,10,1,'CHAT',0,'2025-03-06 17:13:28.998'),(14,10,2,'CHAT',0,'2025-01-02 19:43:13.242'),(14,12,1,'CHAT',0,'2025-03-03 17:56:35.159'),(14,14,1,'PAP',0,'2024-10-05 15:29:04.216'),(14,14,2,'CHAT',1,'2024-12-15 08:44:13.296'),(14,16,1,'CHAT',0,'2024-12-10 11:48:59.235'),(15,8,1,'CHAT',0,'2025-05-15 00:03:38.037'),(15,15,1,'PAP',0,'2025-05-07 06:35:28.458'),(15,15,2,'PAP',0,'2025-05-14 07:13:19.087'),(15,17,1,'CHAT',0,'2024-01-10 08:59:42.079'),(16,16,1,'CHAT',0,'2024-07-03 21:42:19.629'),(16,16,2,'CHAT',0,'2024-11-22 00:47:15.629'),(17,8,1,'CHAT',0,'2025-05-14 12:00:09.111'),(17,8,2,'PAP',0,'2025-01-06 23:52:34.512'),(18,4,1,'CHAT',0,'2025-05-05 12:14:44.008'),(18,4,2,'PAP',0,'2025-05-08 17:22:24.303'),(20,11,1,'CHAT',0,'2025-04-03 16:18:07.546'),(20,16,1,'CHAT',0,'2025-03-01 21:12:20.469'),(21,9,1,'CHAT',0,'2025-05-13 10:55:18.568'),(21,9,2,'CHAT',0,'2025-05-13 08:42:59.129'),(23,6,1,'CHAT',0,'2025-05-12 16:56:29.334'),(24,1,1,'CHAT',0,'2025-01-02 00:23:19.272'),(24,1,2,'CHAT',1,'2025-02-03 15:44:55.672'),(25,5,1,'CHAT',1,'2025-05-15 19:46:15.607'),(29,6,1,'CHAT',0,'2025-05-13 19:41:16.772'),(29,11,1,'CHAT',0,'2025-04-26 11:37:02.098'),(29,18,1,'CHAT',0,'2024-08-21 07:59:02.857'),(29,18,2,'PAP',1,'2024-08-10 03:44:45.066'),(31,6,1,'CHAT',0,'2025-05-06 18:14:08.001'),(31,20,1,'CHAT',1,'2025-04-01 03:06:38.426'),(33,1,1,'CHAT',0,'2025-05-08 15:54:33.961'),(33,1,2,'PAP',0,'2025-05-15 20:12:23.148'),(33,8,1,'CHAT',0,'2025-01-07 14:39:03.196'),(34,7,1,'CHAT',0,'2025-04-30 22:50:17.098'),(36,5,1,'CHAT',0,'2024-03-13 10:36:41.813'),(37,2,1,'PAP',1,'2025-05-04 16:14:17.529'),(37,9,1,'PAP',1,'2025-05-16 08:27:48.810'),(37,10,1,'PAP',0,'2024-11-02 11:19:17.973'),(38,2,1,'CHAT',0,'2025-05-01 22:30:17.789'),(38,13,1,'CHAT',0,'2025-01-09 05:33:52.153'),(38,14,1,'CHAT',0,'2025-02-26 11:08:25.889'),(38,20,1,'CHAT',0,'2025-05-11 19:19:37.161'),(38,20,2,'CHAT',0,'2025-05-10 19:42:47.970'),(39,15,1,'CHAT',1,'2025-05-15 11:56:38.774'),(40,2,1,'CHAT',0,'2025-04-14 05:25:19.407'),(40,2,2,'CHAT',0,'2025-03-10 14:58:27.440'),(41,14,1,'CHAT',1,'2024-11-15 10:28:08.209'),(41,16,1,'CHAT',0,'2025-03-05 00:51:27.571'),(42,7,1,'PAP',0,'2025-05-14 22:59:47.256'),(42,12,1,'CHAT',0,'2025-03-05 17:01:22.316'),(42,12,2,'CHAT',0,'2025-01-28 21:47:42.706'),(44,1,1,'CHAT',0,'2025-03-24 08:18:11.932'),(44,4,1,'CHAT',0,'2025-04-28 02:37:10.975'),(44,16,1,'PAP',0,'2025-03-15 02:57:17.904'),(44,16,2,'PAP',0,'2025-02-14 20:12:31.434'),(44,16,3,'CHAT',0,'2024-12-21 01:19:57.822'),(47,8,1,'CHAT',0,'2025-02-16 04:36:22.668'),(47,8,2,'CHAT',0,'2025-05-16 00:18:56.639'),(47,17,1,'CHAT',0,'2024-10-12 17:31:33.646'),(47,18,1,'CHAT',0,'2025-05-04 16:26:41.811'),(48,3,1,'CHAT',0,'2023-12-23 12:28:05.385'),(49,1,1,'CHAT',0,'2025-05-07 20:52:58.802'),(49,15,1,'CHAT',0,'2025-04-10 09:57:15.275'),(49,15,2,'PAP',0,'2025-04-30 12:53:49.198'),(50,14,1,'PAP',1,'2024-10-31 06:38:20.843'),(51,10,1,'PAP',1,'2025-03-19 05:31:23.722'),(52,6,1,'CHAT',0,'2025-05-12 14:37:33.244'),(52,20,1,'CHAT',0,'2025-04-15 13:06:04.868'),(52,20,2,'CHAT',0,'2025-04-28 14:19:35.136'),(53,15,1,'CHAT',1,'2025-05-02 11:24:21.104'),(54,4,1,'CHAT',0,'2025-04-12 15:31:17.314'),(55,6,1,'PAP',1,'2025-05-16 01:55:17.340'),(55,6,2,'CHAT',0,'2025-05-15 11:12:52.407'),(55,14,1,'CHAT',0,'2025-04-14 21:03:33.753'),(55,14,2,'PAP',1,'2025-04-05 08:52:41.977');
/*!40000 ALTER TABLE `Konten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Langganan`
--

DROP TABLE IF EXISTS `Langganan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Langganan` (
  `nomor_langganan` int NOT NULL AUTO_INCREMENT,
  `id_pengguna` int NOT NULL,
  `tanggal_langganan` datetime(3) NOT NULL,
  `tanggal_kedaluwarsa` datetime(3) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nomor_langganan`,`id_pengguna`),
  KEY `Langganan_id_pengguna_fkey` (`id_pengguna`),
  CONSTRAINT `Langganan_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna` (`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Langganan`
--

LOCK TABLES `Langganan` WRITE;
/*!40000 ALTER TABLE `Langganan` DISABLE KEYS */;
INSERT INTO `Langganan` VALUES (1,38,'2023-11-14 11:01:28.779','2026-03-01 21:27:30.855','tidak_aktif'),(2,16,'2024-12-25 18:58:00.760','2026-04-29 06:22:59.318','tidak_aktif'),(3,47,'2022-09-11 18:54:37.691','2026-05-13 23:22:34.382','aktif'),(4,20,'2022-08-07 15:29:32.591','2025-12-24 12:44:29.863','tidak_aktif'),(5,44,'2022-08-29 05:39:03.724','2026-03-25 19:09:11.278','aktif'),(6,17,'2023-12-18 09:09:50.045','2026-03-08 14:49:46.721','aktif'),(7,42,'2025-01-07 14:33:11.509','2026-03-17 03:38:18.700','aktif'),(8,36,'2022-04-01 02:41:49.813','2025-12-09 07:53:31.943','aktif'),(9,2,'2024-07-26 21:06:09.299','2025-10-28 06:05:49.412','aktif'),(10,28,'2023-10-13 01:29:08.531','2025-09-23 08:05:57.903','tidak_aktif'),(11,46,'2022-05-28 04:16:49.350','2026-04-18 21:27:43.791','tidak_aktif'),(12,5,'2022-06-06 21:52:43.333','2025-12-12 21:04:26.445','tidak_aktif'),(13,53,'2022-11-09 10:41:45.988','2025-10-15 20:56:35.544','tidak_aktif'),(14,54,'2022-01-31 19:20:12.164','2025-06-19 17:41:58.574','tidak_aktif'),(15,49,'2022-04-26 08:08:37.158','2026-04-03 21:20:07.782','tidak_aktif'),(16,37,'2022-06-03 10:38:58.619','2026-03-04 14:29:57.317','tidak_aktif'),(17,29,'2024-07-13 09:44:17.238','2026-01-23 06:03:38.556','aktif'),(18,34,'2021-09-08 00:28:21.209','2025-10-05 19:33:08.249','aktif'),(19,18,'2022-12-19 05:19:10.335','2025-05-17 02:26:23.763','aktif'),(20,13,'2025-03-15 07:10:18.358','2025-06-13 02:44:38.142','tidak_aktif'),(21,40,'2022-05-23 21:38:42.094','2026-02-25 14:22:11.440','aktif'),(22,19,'2023-08-16 00:06:02.247','2026-05-07 18:47:12.967','aktif'),(23,33,'2024-06-05 17:17:17.058','2025-06-20 06:23:41.413','tidak_aktif'),(24,1,'2023-02-12 02:06:51.691','2025-06-14 18:46:27.767','aktif'),(25,10,'2022-12-01 10:32:34.707','2025-12-06 13:24:17.392','aktif'),(26,48,'2021-12-20 10:46:27.591','2026-05-08 17:27:44.940','tidak_aktif'),(27,23,'2023-04-17 15:33:45.855','2026-01-08 23:14:30.070','aktif'),(28,25,'2023-01-02 02:26:49.134','2025-10-30 22:49:32.412','aktif'),(29,12,'2023-02-16 23:38:47.490','2025-07-09 19:01:08.096','tidak_aktif'),(30,52,'2023-06-10 08:47:55.399','2026-04-19 21:43:30.810','tidak_aktif'),(31,39,'2024-04-09 22:57:11.413','2025-06-29 14:32:54.394','tidak_aktif'),(32,27,'2021-10-23 10:07:39.708','2025-10-25 06:14:48.055','aktif'),(33,6,'2023-12-01 23:19:18.790','2026-04-25 05:30:34.984','aktif'),(34,43,'2023-08-29 18:34:46.704','2025-08-23 03:18:53.638','tidak_aktif'),(35,3,'2021-12-08 12:31:59.511','2026-05-13 09:45:44.876','tidak_aktif'),(36,11,'2022-07-19 15:07:57.808','2025-07-18 13:22:56.697','aktif'),(37,22,'2023-05-20 07:14:56.902','2025-11-06 05:28:45.487','tidak_aktif'),(38,4,'2023-01-14 12:22:39.278','2026-02-17 15:06:17.113','aktif'),(39,14,'2024-07-30 10:59:03.542','2025-06-07 03:31:22.908','aktif'),(40,45,'2022-08-15 12:28:54.566','2026-01-20 14:16:00.499','aktif'),(41,32,'2024-05-25 23:55:39.971','2026-02-24 01:08:10.971','aktif');
/*!40000 ALTER TABLE `Langganan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lens`
--

DROP TABLE IF EXISTS `Lens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lens` (
  `id_lens` int NOT NULL AUTO_INCREMENT,
  `id_lens_type` int NOT NULL,
  `id_pengguna` int NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_rilis` datetime(3) NOT NULL,
  PRIMARY KEY (`id_lens`),
  KEY `Lens_id_lens_type_fkey` (`id_lens_type`),
  KEY `Lens_id_pengguna_fkey` (`id_pengguna`),
  CONSTRAINT `Lens_id_lens_type_fkey` FOREIGN KEY (`id_lens_type`) REFERENCES `Lens_Type` (`id_lens`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Lens_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna` (`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lens`
--

LOCK TABLES `Lens` WRITE;
/*!40000 ALTER TABLE `Lens` DISABLE KEYS */;
INSERT INTO `Lens` VALUES (1,1003,23,'large language models maroon Lens','2023-08-22 02:33:20.643'),(2,1003,23,'models silver Lens','2023-09-05 07:46:26.482'),(3,1002,23,'deliverables sky blue Lens','2022-06-18 13:28:19.136'),(4,1002,23,'e-commerce yellow Lens','2023-10-08 07:47:05.937'),(5,1003,1,'applications yellow Lens','2021-08-05 00:43:14.157'),(6,1001,40,'deliverables red Lens','2020-08-23 09:15:32.235'),(7,1002,47,'partnerships black Lens','2022-01-16 20:16:40.539'),(8,1002,50,'niches mint green Lens','2024-08-21 19:32:12.471'),(9,1002,50,'convergence gold Lens','2023-08-28 06:05:51.021'),(10,1003,50,'partnerships mint green Lens','2023-02-02 18:22:19.864'),(11,1002,50,'paradigms white Lens','2024-07-02 23:48:56.612'),(12,1002,16,'deliverables turquoise Lens','2024-10-23 09:48:34.736'),(13,1001,16,'infrastructures salmon Lens','2024-06-29 01:22:14.830'),(14,1002,48,'models fuchsia Lens','2022-02-01 04:11:19.787'),(15,1002,45,'relationships lime Lens','2020-12-14 05:58:51.681'),(16,1002,45,'convergence green Lens','2021-08-01 04:30:48.898'),(17,1002,45,'networks teal Lens','2022-03-15 13:28:37.611'),(18,1003,45,'deliverables tan Lens','2021-12-09 19:39:53.538'),(19,1001,28,'interfaces gold Lens','2023-03-24 10:26:17.649'),(20,1001,28,'synergies violet Lens','2023-12-14 21:38:08.817'),(21,1002,8,'infrastructures azure Lens','2023-10-18 14:09:14.027'),(22,1001,8,'functionalities turquoise Lens','2023-09-16 00:47:42.328'),(23,1003,20,'channels tan Lens','2022-10-01 11:22:06.658'),(24,1001,20,'models fuchsia Lens','2022-10-04 19:46:01.611'),(25,1002,20,'functionalities cyan Lens','2022-12-15 03:28:40.453'),(26,1002,20,'channels mint green Lens','2023-01-16 01:11:33.116'),(27,1002,14,'metrics maroon Lens','2023-03-01 17:49:39.194'),(28,1001,39,'relationships salmon Lens','2023-01-25 02:47:31.263'),(29,1002,53,'AI salmon Lens','2021-10-30 04:18:40.649'),(30,1003,53,'blockchains black Lens','2023-02-24 00:13:28.211'),(31,1001,53,'lifetime value turquoise Lens','2022-03-18 10:10:03.417'),(32,1002,32,'users purple Lens','2024-05-16 01:21:13.569'),(33,1002,32,'synergies azure Lens','2022-12-25 08:57:00.781'),(34,1002,31,'AI yellow Lens','2023-01-16 20:13:04.834'),(35,1003,31,'platforms azure Lens','2021-06-18 12:03:37.989'),(36,1002,31,'smart contracts pink Lens','2021-06-13 14:21:47.504'),(37,1001,41,'markets mint green Lens','2023-03-02 07:30:29.082'),(38,1003,41,'infrastructures mint green Lens','2021-11-03 22:02:35.717'),(39,1001,41,'communities lime Lens','2021-12-04 04:53:50.284'),(40,1001,29,'blockchains white Lens','2024-03-20 23:25:25.800'),(41,1001,29,'lifetime value lavender Lens','2023-09-05 04:51:07.002'),(42,1003,29,'technologies sky blue Lens','2023-10-02 17:13:17.270'),(43,1002,29,'solutions mint green Lens','2023-08-06 19:14:32.736'),(44,1002,55,'markets white Lens','2024-11-01 18:35:58.702'),(45,1001,55,'relationships maroon Lens','2023-02-14 13:21:29.337'),(46,1001,6,'networks indigo Lens','2023-09-21 06:36:19.744'),(47,1002,6,'large language models magenta Lens','2024-09-11 21:05:45.586'),(48,1001,6,'channels indigo Lens','2023-07-03 09:49:39.147'),(49,1002,49,'blockchains lavender Lens','2021-08-25 03:13:42.540'),(50,1003,49,'networks salmon Lens','2021-03-02 10:42:21.203'),(51,1003,49,'experiences teal Lens','2022-05-07 13:20:58.927'),(52,1001,49,'AI tan Lens','2021-05-21 08:24:54.364'),(53,1001,51,'synergies orchid Lens','2024-07-07 09:01:07.737'),(54,1002,51,'blockchains indigo Lens','2024-04-22 08:06:14.838'),(55,1003,51,'networks olive Lens','2024-01-23 12:34:46.098'),(56,1003,18,'paradigms orchid Lens','2022-08-18 09:02:08.176'),(57,1001,18,'infrastructures orange Lens','2021-09-28 23:58:24.654'),(58,1003,18,'interfaces mint green Lens','2022-05-27 03:48:34.666'),(59,1003,18,'users turquoise Lens','2022-01-19 01:02:52.800'),(60,1003,25,'mindshare lime Lens','2022-07-06 15:52:06.988'),(61,1003,25,'large language models white Lens','2022-05-18 23:33:01.434'),(62,1003,9,'partnerships salmon Lens','2021-07-25 15:11:32.629'),(63,1002,10,'systems indigo Lens','2023-03-09 20:51:34.870'),(64,1001,10,'interfaces tan Lens','2022-05-02 19:45:35.779'),(65,1003,4,'infrastructures black Lens','2021-10-29 19:13:34.390'),(66,1002,4,'channels salmon Lens','2021-04-12 21:41:47.256'),(67,1003,4,'metrics grey Lens','2021-07-14 12:25:02.426'),(68,1003,4,'applications lime Lens','2021-04-14 12:05:13.390'),(69,1001,19,'schemas green Lens','2022-09-13 13:42:19.389'),(70,1002,19,'niches pink Lens','2023-07-16 20:23:04.685'),(71,1002,19,'AI red Lens','2023-03-30 17:17:20.324'),(72,1002,19,'web services pink Lens','2023-07-19 00:36:07.263'),(73,1002,38,'users tan Lens','2022-10-31 01:06:38.695'),(74,1003,38,'relationships fuchsia Lens','2023-01-24 10:21:21.125'),(75,1002,38,'AI cyan Lens','2022-05-09 02:45:05.691'),(76,1003,22,'models orchid Lens','2022-12-16 02:38:10.995'),(77,1001,22,'communities sky blue Lens','2023-06-02 07:06:39.927'),(78,1001,22,'platforms lime Lens','2023-02-22 15:41:57.679'),(79,1002,12,'networks indigo Lens','2021-12-31 21:21:37.612'),(80,1002,12,'users plum Lens','2022-03-18 12:00:04.442'),(81,1002,5,'paradigms maroon Lens','2021-08-05 20:48:39.632'),(82,1002,5,'smart contracts fuchsia Lens','2022-01-05 06:09:26.106'),(83,1001,5,'ROI cyan Lens','2023-03-22 14:58:27.159'),(84,1002,5,'metrics red Lens','2022-11-20 08:28:06.962'),(85,1003,2,'solutions ivory Lens','2024-04-28 08:46:40.508');
/*!40000 ALTER TABLE `Lens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lens_Type`
--

DROP TABLE IF EXISTS `Lens_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lens_Type` (
  `id_lens` int NOT NULL AUTO_INCREMENT,
  `tipe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_lens`),
  UNIQUE KEY `Lens_Type_tipe_key` (`tipe`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lens_Type`
--

LOCK TABLES `Lens_Type` WRITE;
/*!40000 ALTER TABLE `Lens_Type` DISABLE KEYS */;
INSERT INTO `Lens_Type` VALUES (1002,'Background'),(1001,'Face'),(1003,'FaceAndBackground');
/*!40000 ALTER TABLE `Lens_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Level`
--

DROP TABLE IF EXISTS `Level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Level` (
  `id_level` int NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upah_per_bulan` int NOT NULL,
  `lensa_minimum` int NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Level`
--

LOCK TABLES `Level` WRITE;
/*!40000 ALTER TABLE `Level` DISABLE KEYS */;
INSERT INTO `Level` VALUES (0,'Not Rated',0,0),(1,'Bronze',1000000,10),(2,'Silver',2000000,20),(3,'Gold',3000000,30),(4,'Platinum',5000000,50);
/*!40000 ALTER TABLE `Level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lokasi`
--

DROP TABLE IF EXISTS `Lokasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lokasi` (
  `id_pengguna` int NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `waktu_mulai` datetime(3) NOT NULL,
  `waktu_akhir` datetime(3) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pengguna`,`waktu_mulai`),
  CONSTRAINT `Lokasi_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna` (`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lokasi`
--

LOCK TABLES `Lokasi` WRITE;
/*!40000 ALTER TABLE `Lokasi` DISABLE KEYS */;
INSERT INTO `Lokasi` VALUES (3,-13.1612,147.4174,'2022-09-20 06:00:49.150','2022-09-21 05:34:06.117','aktif'),(4,7.1764,-54.2889,'2023-02-12 17:22:35.177',NULL,'tidak_aktif'),(5,-41.3377,-128.737,'2023-04-09 01:02:11.264',NULL,'tidak_aktif'),(9,45.626,132.805,'2023-03-15 14:30:41.028',NULL,'tidak_aktif'),(10,-62.8995,60.5739,'2023-08-11 15:36:37.049',NULL,'aktif'),(11,32.4528,-160.5821,'2022-11-18 19:20:08.639','2022-11-19 16:40:57.795','aktif'),(12,-37.6766,-70.1425,'2023-09-01 14:21:58.426',NULL,'aktif'),(13,-49.2348,156.3172,'2025-04-27 08:30:45.110',NULL,'aktif'),(14,-58.9981,-52.8706,'2024-07-14 10:52:20.649',NULL,'tidak_aktif'),(15,-5.874,58.5163,'2023-08-02 12:08:18.798',NULL,'aktif'),(18,9.4675,22.6895,'2023-02-12 23:56:35.350',NULL,'aktif'),(20,-23.6381,146.8408,'2023-01-06 21:42:56.530',NULL,'aktif'),(23,87.9881,-164.3904,'2023-12-15 03:33:41.851','2023-12-16 15:18:03.831','tidak_aktif'),(24,-3.8158,48.5737,'2022-10-09 08:29:55.114','2022-10-09 18:47:22.670','tidak_aktif'),(25,42.6919,-51.6087,'2023-07-19 22:19:15.037','2023-07-20 13:08:12.031','tidak_aktif'),(26,39.3901,95.6361,'2022-06-08 15:17:39.303','2022-06-09 07:41:13.592','aktif'),(28,56.5253,-169.8582,'2024-06-12 08:50:04.258',NULL,'aktif'),(30,-3.2251,-96.5377,'2024-01-07 12:35:51.454','2024-01-08 01:41:31.183','aktif'),(31,-36.1795,-138.5743,'2023-04-01 10:52:54.348','2023-04-02 10:59:41.729','tidak_aktif'),(32,-6.2985,131.0951,'2024-08-28 20:33:59.777','2024-08-30 13:51:39.308','aktif'),(33,-20.289,-159.3015,'2025-03-26 04:15:24.429','2025-03-27 02:33:09.811','aktif'),(34,-32.4499,27.1175,'2022-07-07 03:32:30.521','2022-07-07 22:38:28.147','aktif'),(35,-80.7931,158.8835,'2024-10-06 10:30:45.108',NULL,'aktif'),(36,73.3736,-58.3671,'2023-01-02 16:06:31.802','2023-01-03 12:10:59.731','aktif'),(37,-85.2875,111.4001,'2022-12-21 10:53:55.503','2022-12-22 04:10:22.939','tidak_aktif'),(39,56.4164,-14.3954,'2024-10-04 19:30:43.448','2024-10-04 20:12:20.138','aktif'),(40,71.7389,45.4241,'2022-06-25 20:08:48.972','2022-06-26 12:19:34.058','tidak_aktif'),(43,40.6467,-12.532,'2023-08-16 02:58:40.079','2023-08-17 04:49:12.344','aktif'),(45,46.599,99.352,'2022-10-05 11:03:02.909',NULL,'aktif'),(50,4.9663,151.103,'2024-11-13 18:31:37.942',NULL,'aktif'),(51,42.3074,24.9427,'2025-01-26 14:35:06.334','2025-01-28 04:17:16.104','aktif'),(53,-64.6387,99.9834,'2023-07-29 17:35:26.239','2023-07-29 21:58:30.211','aktif'),(54,66.9234,-4.5275,'2022-12-21 14:42:07.137','2022-12-22 15:08:15.321','aktif');
/*!40000 ALTER TABLE `Lokasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Overlay`
--

DROP TABLE IF EXISTS `Overlay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Overlay` (
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pengguna` int NOT NULL,
  `id_room` int NOT NULL,
  `urutan_pengiriman` int NOT NULL,
  `layer` int NOT NULL,
  PRIMARY KEY (`id_pengguna`,`id_room`,`urutan_pengiriman`,`layer`),
  CONSTRAINT `Overlay_id_pengguna_id_room_urutan_pengiriman_layer_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`) REFERENCES `Add_On` (`id_pengguna`, `id_room`, `urutan_pengiriman`, `layer`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Overlay`
--

LOCK TABLES `Overlay` WRITE;
/*!40000 ALTER TABLE `Overlay` DISABLE KEYS */;
INSERT INTO `Overlay` VALUES ('Rustic Overlay',4,20,2,1),('Handcrafted Overlay',12,6,1,1),('Practical Overlay',14,7,1,2),('Oriental Overlay',15,15,1,2),('Intelligent Overlay',33,1,2,2),('Sleek Overlay',37,2,1,1),('Oriental Overlay',37,2,1,2),('Gorgeous Overlay',51,10,1,1),('Practical Overlay',51,10,1,2),('Oriental Overlay',55,6,1,1),('Sleek Overlay',55,14,2,1);
/*!40000 ALTER TABLE `Overlay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pap`
--

DROP TABLE IF EXISTS `Pap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pap` (
  `id_pengguna` int NOT NULL,
  `id_room` int NOT NULL,
  `urutan_pengiriman` int NOT NULL,
  `id_lens` int DEFAULT NULL,
  `tipe` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `durasi` int DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`,`id_room`,`urutan_pengiriman`),
  KEY `Pap_id_lens_fkey` (`id_lens`),
  CONSTRAINT `Pap_id_lens_fkey` FOREIGN KEY (`id_lens`) REFERENCES `Lens` (`id_lens`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Pap_id_pengguna_id_room_urutan_pengiriman_fkey` FOREIGN KEY (`id_pengguna`, `id_room`, `urutan_pengiriman`) REFERENCES `Konten` (`id_pengguna`, `id_room`, `urutan_pengiriman`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pap`
--

LOCK TABLES `Pap` WRITE;
/*!40000 ALTER TABLE `Pap` DISABLE KEYS */;
INSERT INTO `Pap` VALUES (3,19,1,77,'foto',NULL),(3,19,2,23,'video',13),(4,20,2,66,'video',6),(8,2,2,22,'foto',NULL),(9,12,1,62,'foto',NULL),(12,6,1,80,'video',60),(13,14,1,27,'foto',NULL),(14,7,1,27,'video',32),(14,14,1,27,'video',8),(15,15,1,81,'foto',NULL),(15,15,2,54,'video',38),(17,8,2,47,'video',56),(18,4,2,59,'video',27),(29,18,2,40,'video',43),(33,1,2,9,'foto',NULL),(37,2,1,67,'foto',NULL),(37,9,1,67,'video',31),(37,10,1,14,'video',7),(42,7,1,14,'foto',NULL),(44,16,1,37,'foto',NULL),(44,16,2,1,'foto',NULL),(49,15,2,51,'foto',NULL),(50,14,1,9,'foto',NULL),(51,10,1,53,'video',19),(55,6,1,45,'foto',NULL),(55,14,2,44,'video',4);
/*!40000 ALTER TABLE `Pap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pengguna`
--

DROP TABLE IF EXISTS `Pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pengguna` (
  `id_pengguna` int NOT NULL AUTO_INCREMENT,
  `id_level` int NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_telepon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` datetime(3) DEFAULT NULL,
  `tanggal_pembuatan` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pengguna`),
  UNIQUE KEY `Pengguna_email_key` (`email`),
  UNIQUE KEY `Pengguna_username_key` (`username`),
  KEY `Pengguna_id_level_fkey` (`id_level`),
  CONSTRAINT `Pengguna_id_level_fkey` FOREIGN KEY (`id_level`) REFERENCES `Level` (`id_level`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pengguna`
--

LOCK TABLES `Pengguna` WRITE;
/*!40000 ALTER TABLE `Pengguna` DISABLE KEYS */;
INSERT INTO `Pengguna` VALUES (1,3,'Vern.0.DuBuque@gmail.com','Vern0.DuBuque39','089799397499','1988-06-24 16:04:15.049','2023-05-08 18:43:13.888','oMXk0qN8lsDuJrO'),(2,2,'Patrick.1_Bosco@yahoo.com','Patrick1.Bosco98','082975397168','1983-09-14 15:22:53.732','2025-04-08 12:44:24.540','HKzWQJYnwQ1ZBDP'),(3,1,'Ruthe.2_Gibson@gmail.com','Ruthe2.Gibson','083528128526','1998-05-13 18:52:17.795','2022-10-25 09:09:36.330','EeH1Ft1uhjVo4Fe'),(4,1,'Braulio.3_Mann60@yahoo.com','Braulio3.Mann','088609791742','1971-08-01 14:16:17.338','2023-03-06 01:08:14.351','MhuHsBCPZlenne6'),(5,2,'Declan.4.Boyer@yahoo.com','Declan4_Boyer23','082562976691','1994-06-27 16:47:56.152','2023-04-17 06:29:57.119','o0fJ3dyIPhKqvfZ'),(6,0,'Elyse.5_Kuhlman@hotmail.com','Elyse5_Kuhlman','084456290449','1960-11-05 09:26:18.534','2024-10-04 14:05:24.764','uPiNkmPJmmUmSER'),(7,0,'Norris.6.Ward20@hotmail.com','Norris6_Ward95','083035129405','1992-08-07 07:28:31.792','2022-09-13 01:39:35.975','Uo3qp9sNRmS4hZw'),(8,1,'Johanna.7_Weber@hotmail.com','Johanna7_Weber','082725863540','1988-05-09 00:53:21.903','2025-03-28 13:11:06.085','Z2A_dCx_XFMODTR'),(9,3,'Kristian.8.Okuneva-Schimmel@yahoo.com','Kristian8_Okuneva-Schimmel13','089310923236','2000-07-16 13:04:26.266','2023-03-25 02:29:13.885','v8paMrTEyM5WoGY'),(10,1,'Wanda.9.Friesen@yahoo.com','Wanda9_Friesen','087240673173','1990-07-02 09:56:52.309','2023-10-02 09:13:06.506','JEjXFhlAIFjKt0E'),(11,1,'Don.10_Mueller@hotmail.com','Don10_Mueller61','080661369824','1970-07-05 01:20:05.373','2022-12-15 13:07:42.714','qrmqiSzQQ6CR6FJ'),(12,3,'Janie.11.Roberts45@yahoo.com','Janie11_Roberts25','084789657931','1979-10-31 11:14:20.107','2023-09-22 03:24:31.178','F48L8sMEJDTB_qf'),(13,4,'Dashawn.12_Yost@hotmail.com','Dashawn12.Yost88','085476449010','1981-10-02 09:04:08.348','2025-04-30 03:51:50.687','bB8GcPWhZ5k35V0'),(14,1,'Nellie.13_Kirlin@gmail.com','Nellie13.Kirlin41','081981134844','1985-04-14 10:35:01.888','2024-09-01 13:08:04.350','wSDCNL2uAF4R2Zw'),(15,1,'Waylon.14_Jenkins@gmail.com','Waylon14.Jenkins','085415744968','1974-12-21 16:15:15.927','2023-09-15 12:14:54.632','BHQkNrXf3FOZhxQ'),(16,4,'Damion.15.Adams@yahoo.com','Damion15_Adams52','086422056464','1974-09-20 00:44:44.880','2025-03-24 05:27:31.835','gsIedQM55axuP9c'),(17,3,'Ronaldo.16_OKon@gmail.com','Ronaldo16.OKon','081764684512','1989-12-20 06:41:51.495','2024-02-20 16:51:56.104','0PFjsISHVYto_wr'),(18,1,'Antwon.17.Ryan55@yahoo.com','Antwon17_Ryan','083134709282','1962-07-16 20:52:23.590','2023-03-21 21:02:30.271','wazWmA_7k6be6tR'),(19,2,'Wilford.18_Reilly-Walker96@hotmail.com','Wilford18.Reilly-Walker40','085916077472','2004-02-06 01:04:37.767','2023-08-19 08:13:21.208','Iop3_73TTOnOHf5'),(20,3,'Giovanna.19_Goldner38@gmail.com','Giovanna19_Goldner','085643961947','1998-11-24 01:21:30.376','2023-03-06 21:51:16.411','UxrLDMgM15Owf_C'),(21,1,'Orion.20_Kuhlman48@yahoo.com','Orion20.Kuhlman74','089313286331','1969-09-27 03:09:36.027','2023-01-30 15:58:32.356','LgsT9LR7sbfNXXY'),(22,4,'Mathias.21.Rippin94@gmail.com','Mathias21.Rippin','085970507852','1976-03-10 09:26:19.429','2024-04-23 06:47:03.592','pnDO6r5IR7dROuP'),(23,0,'Tristian.22.Farrell69@gmail.com','Tristian22.Farrell','084481047282','2000-12-10 20:33:40.515','2024-01-18 23:47:21.033','L_3AKEcXqt301HQ'),(24,0,'Gerson.23.Becker71@gmail.com','Gerson23_Becker90','081664187670','1981-10-18 22:33:04.355','2022-10-12 16:28:16.807','_Wo7GkYUCWdsE6M'),(25,3,'Priscilla.24.Windler95@hotmail.com','Priscilla24_Windler2','082816402997','1989-02-14 12:19:45.592','2023-09-14 21:47:32.790','zAbSMELT8l4NAxc'),(26,3,'Gage.25.Mayer@hotmail.com','Gage25_Mayer55','089755046253','1990-12-09 20:47:51.646','2022-07-10 05:24:27.552','aWWt3UPZ_bJNXrC'),(27,0,'Alvina.26_Miller88@gmail.com','Alvina26.Miller','088634793596','1960-04-07 13:50:30.536','2022-09-08 00:31:08.193','08j_Fir4nBlP8tr'),(28,4,'Adele.27.Fritsch8@gmail.com','Adele27_Fritsch2','083190567842','1968-10-23 13:36:57.783','2024-07-08 09:03:25.072','WHvwDsZCMzmUFba'),(29,1,'Marley.28_Johns@hotmail.com','Marley28.Johns','088232133529','1987-12-12 19:23:48.122','2024-12-02 04:22:40.279','W_mZtuyeJZ12ozl'),(30,4,'Molly.29_Schneider81@hotmail.com','Molly29.Schneider89','084144468764','1986-12-17 23:20:34.706','2024-02-03 00:49:15.852','0i5JURKKZXFoKIW'),(31,4,'Alford.30_Nader@hotmail.com','Alford30_Nader','080838637360','1960-06-03 15:53:18.611','2023-05-23 04:57:20.440','qxJ6t_H6u1wvC72'),(32,4,'Jermain.31.Glover51@gmail.com','Jermain31.Glover','084384575050','2007-04-01 04:11:53.655','2024-10-01 20:48:36.051','jokJ7v3H10tOzAD'),(33,1,'Emerson.32_Durgan@hotmail.com','Emerson32.Durgan48','086772206994','1977-06-11 19:36:00.184','2025-05-10 03:15:31.873','B9S7IiXbLmxpbOj'),(34,0,'Mary.33.Hoeger39@yahoo.com','Mary33.Hoeger','083445000892','1975-05-24 16:36:35.227','2022-07-24 03:56:16.580','onB2QWysS8jxvJC'),(35,0,'Brooke.34.Hamill59@gmail.com','Brooke34.Hamill','089166301678','1977-06-01 13:51:16.879','2024-11-29 04:25:42.443','DNsm3fy6i7kfZJK'),(36,2,'Devon.35.Brakus59@yahoo.com','Devon35_Brakus','088945852841','1990-12-29 08:40:16.702','2023-01-17 08:16:24.406','qV6SLe8WTbGG6Qo'),(37,3,'Nash.36_Hand33@yahoo.com','Nash36.Hand','087693461856','1999-07-01 04:46:39.683','2022-12-25 10:45:31.777','stJdyFpLDsFn0WR'),(38,1,'Carmella.37_Prosacco@gmail.com','Carmella37.Prosacco','084426755280','1997-04-16 08:32:36.533','2024-02-07 17:10:15.721','gfyoFDLmPOsqYCS'),(39,0,'Jasper.38.Heaney19@yahoo.com','Jasper38_Heaney','089587492371','1978-12-13 21:26:02.148','2024-11-08 08:13:49.517','Q6QI7hG9q2FDnGL'),(40,3,'Avery.39.Stokes@yahoo.com','Avery39.Stokes29','089774521798','1988-01-25 04:36:32.135','2022-08-19 12:14:39.520','Sb5OorDvw4FezkI'),(41,0,'Stacey.40.Crona@yahoo.com','Stacey40_Crona37','086771610609','1967-02-14 08:52:13.835','2023-09-29 11:20:16.060','9eEDaeTgsSsV8b0'),(42,2,'Della.41_Kovacek79@gmail.com','Della41.Kovacek94','082468773883','2004-10-17 09:10:56.012','2025-01-24 19:15:23.337','KGgc0osJ2H2iISw'),(43,2,'Lottie.42_OKeefe86@gmail.com','Lottie42_OKeefe','088214007948','1994-04-21 06:52:49.424','2023-09-27 17:23:49.055','AcL2gk3DTjnC0C0'),(44,4,'Sonny.43.Stokes86@hotmail.com','Sonny43.Stokes94','087623335587','1995-11-26 20:28:44.379','2023-01-02 20:27:14.474','noYz0_NgAnp2NfT'),(45,0,'Juvenal.44.Collins57@yahoo.com','Juvenal44_Collins32','081153428901','1997-02-11 20:15:54.682','2022-11-17 11:26:32.008','czFJb3p5bPISDgJ'),(46,2,'Edd.45.Gorczany33@gmail.com','Edd45_Gorczany46','083247915994','2002-04-02 06:26:20.505','2022-06-29 11:05:31.043','urGs5sJW85Ub8bT'),(47,1,'Ashlee.46_Champlin@hotmail.com','Ashlee46_Champlin71','082808924505','2002-09-21 06:26:05.881','2023-04-13 16:22:20.546','x2AUB2wqAvwHgwv'),(48,2,'Kane.47.Walker@yahoo.com','Kane47.Walker','084497205486','1977-10-07 15:16:02.597','2022-11-29 00:02:13.782','7LjSqsLyqU1JFx6'),(49,2,'Jefferey.48.Romaguera63@yahoo.com','Jefferey48_Romaguera','080166835038','1989-07-10 11:07:40.503','2022-09-22 12:28:28.442','BERdLNfCJG6ORz7'),(50,0,'Marion.49.Bauch@yahoo.com','Marion49.Bauch63','089931503265','1984-02-21 03:11:46.411','2024-12-31 07:28:06.089','1_ylObmcMVZC_5L'),(51,0,'Bethany.50_Sawayn21@hotmail.com','Bethany50_Sawayn','084231539387','2003-05-23 16:17:35.029','2025-01-31 21:15:56.212','FIQdH7srL9hqB0r'),(52,3,'Althea.51_Parker@gmail.com','Althea51.Parker48','089810860035','1999-01-21 08:33:54.342','2023-07-15 02:11:09.029','3AJYOb1oH8zh1Xq'),(53,1,'Leanne.52_Fisher64@hotmail.com','Leanne52_Fisher','084091531416','1983-03-10 19:19:12.122','2023-08-24 00:49:06.612','bmRe9ei51r_NSXm'),(54,1,'Yazmin.53_Mills32@yahoo.com','Yazmin53_Mills46','084988638553','1992-10-17 09:43:41.168','2023-01-15 06:29:44.017','xClAtWdSH8ie_bd'),(55,1,'Jakayla.54_Lockman@gmail.com','Jakayla54_Lockman','080859185231','1962-04-10 21:47:28.010','2025-01-26 14:22:53.275','7B40ruBoARl_0I4');
/*!40000 ALTER TABLE `Pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room_Chat`
--

DROP TABLE IF EXISTS `Room_Chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room_Chat` (
  `id_room` int NOT NULL AUTO_INCREMENT,
  `tanggal_buat` datetime(3) NOT NULL,
  PRIMARY KEY (`id_room`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room_Chat`
--

LOCK TABLES `Room_Chat` WRITE;
/*!40000 ALTER TABLE `Room_Chat` DISABLE KEYS */;
INSERT INTO `Room_Chat` VALUES (1,'2024-08-08 20:50:46.884'),(2,'2025-01-09 17:50:53.535'),(3,'2023-07-24 09:49:44.090'),(4,'2024-12-12 08:01:55.940'),(5,'2023-07-11 05:33:52.522'),(6,'2025-05-02 16:03:16.297'),(7,'2025-02-09 00:16:07.982'),(8,'2024-10-26 15:03:21.113'),(9,'2025-04-09 11:39:10.851'),(10,'2024-08-23 02:13:09.159'),(11,'2024-12-17 10:25:49.064'),(12,'2024-07-19 20:36:16.923'),(13,'2024-09-06 14:07:10.107'),(14,'2023-09-10 08:16:57.789'),(15,'2025-02-02 01:36:28.183'),(16,'2024-02-27 20:37:53.636'),(17,'2023-07-14 14:35:14.906'),(18,'2024-04-10 09:49:34.825'),(19,'2024-03-14 11:40:17.699'),(20,'2024-12-24 13:04:20.320');
/*!40000 ALTER TABLE `Room_Chat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-16 12:45:34
