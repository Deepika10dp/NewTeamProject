-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `district_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `block_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'Arwal',1),(2,'Kaler',1),(3,'Karpi',1),(4,'Kurtha',1),(5,'Sonbhadra Banshi Suryapur',1),(6,'Amarpur',3),(7,'Banka',3),(8,'Barahat',3),(9,'Belhar',3),(10,'Bounsi',3),(11,'Chandan',3),(12,'Dhoraiya',3),(13,'Fullidumer',3),(14,'Katoriya',3),(15,'Rajoun',3),(16,'Sambhuganj',3),(17,'Goradih',4),(18,'Jagdishpur',4),(19,'Nathnagar',4),(20,'Sabour',4),(21,'Shahkund',4),(22,'Sultanganj',4),(23,'Kahalgaon',4),(24,'Pirpainty',4),(25,'Sanhaula',4),(26,'Bihpur',4),(27,'Gopalpur',4),(28,'Ismailpur',4),(29,'Kharik',4),(30,'Narayanpur',4),(31,'Naugachhia',4),(32,'Rangrachowk',4),(33,'Aurangabad',2),(34,'Barun',2),(35,'Navinagar',2),(36,'Kutumba',2),(37,'Madanpur',2),(38,'Deo',2),(39,'Rafiganj',2),(40,'Obra',2),(41,'Daudnagar',2),(42,'Goh',2),(43,'Haspura',2),(44,'Buxar',5),(45,'Itarhi',5),(46,'Chausa',5),(47,'Rajpur',5),(48,'Dumraon',5),(49,'Nawanagar',5),(50,'Brahanpur',5),(51,'Kesath',5),(52,'Chakki',5),(53,'Chougain',5),(54,'Simri',5),(55,'Gaya Sadar',6),(56,'Belaganj',6),(57,'Wazirganj',6),(58,'Manpur',6),(59,'Bodhgaya',6),(60,'Tankuppa',6),(61,'Fatehpur',6),(62,'Konch',6),(63,'Tekari',6),(64,'Guraru',6),(65,'Paraiya',6),(66,'Khizarsarai',6),(67,'Atri',6),(68,'Neemchak Bathani',6),(69,'Mohri',6),(70,'Gurua',6),(71,'Amas',6),(72,'Banke Bazar',6),(73,'Imamganj',6),(74,'Dumariya',6),(75,'Barhat',7),(76,'Chakai',7),(77,'Gidhor',7),(78,'Islamnagar Aliganj',7),(79,'Jamui',7),(80,'Jhajha',7),(81,'Kharia',7),(82,'Laxmipur',7),(83,'Sikandra',7),(84,'Sono',7),(85,'Jehanabad',8),(86,'Makhdumpur',8),(87,'Ghosi',8),(88,'hulasganj',8),(89,'Ratni Faridpur',8),(90,'Modanganj',8),(91,'Kako',8),(92,'Lakhisarai',10),(93,'Barahiya',10),(94,'Halsi',10),(95,'Ramgarh Chowk',10),(96,'Surajgarha',10),(97,'Pipariya',10),(98,'Munger Sadar',11),(99,'Bariarpur',11),(100,'Dharhara',11),(101,'Jamalpur',11),(102,'Kharagpur',11),(103,'Tarapur',11),(104,'Tetiya Bamber',11),(105,'Bihar Sharif',12),(106,'Ben',12),(107,'Asthawan',12),(108,'Bind',12),(109,'Chandi',12),(110,'Ekangarsarai',12),(111,'Giriyak',12),(112,'Harnaut',12),(113,'Hilsa',12),(114,'Islampur',12),(115,'Karai Parsurai',12),(116,'Katrisarai',12),(117,'Nagarnausa',12),(118,'Noorsarai',12),(119,'Parwalpur',12),(120,'Rajgir',12),(121,'Sarmera',12),(122,'Silao',12),(123,'Tharthari',12),(124,'Nawada',13),(125,'Akbarpur',13),(126,'Gobindpur',13),(127,'Hisua',13),(128,'Kashichak',13),(129,'Kawakol',13),(130,'Meskaur',13),(131,'Narhat',13),(132,'Pakribarawan',13),(133,'Rajauli',13),(134,'Roh',13),(135,'Sirdala',13),(136,'Warisaliganj',13),(137,'Patna Sadar',14),(138,'Bakhtiarpur',14),(139,'Barh',14),(140,'Bihta',14),(141,'Bikram',14),(142,'Danapur',14),(143,'Dhanarua',14),(144,'Dulhin Bazar',14),(145,'Fatwah',14),(146,'Khusrupur',14),(147,'Maner',14),(148,'Masaurhi',14),(149,'Mokama',14),(150,'Naubatpur',14),(151,'Paliganj',14),(152,'Pandarak',14),(153,'Phulwari Sharif',14),(154,'Sampatchak',14),(155,'Sasaram',15),(156,'Akorhi Gola',15),(157,'Bikramganj',15),(158,'Chenari',15),(159,'Dawath',15),(160,'Dehri',15),(161,'Dinara',15),(162,'Karakat',15),(163,'Kochas',15),(164,'Nasriganj',15),(165,'Nauhatta',15),(166,'Nokha',15),(167,'Rajpur',15),(168,'Rohtas',15),(169,'Sanjhauli',15),(170,'Tilouthu',15),(171,'Sheikhpura',16),(172,'Ariari',16),(173,'Barbigha',16),(174,'Chewara',16),(175,'Ghat Kusumbha',16),(176,'Shekhopur Sarai',16),(177,'Adhaura',9),(178,'Bhabhua',9),(179,'Bhawanpur',9),(180,'Chainpur',9),(181,'Chand',9),(182,'Rampur',9),(183,'Mohania',9),(184,'Kudra',9),(185,'Durgaw',9);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer` (
  `consumerId` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleId` int DEFAULT NULL,
  PRIMARY KEY (`consumerId`),
  UNIQUE KEY `phone_no` (`phone_no`),
  KEY `role_id_idx` (`roleId`),
  CONSTRAINT `role_id` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Arwal'),(2,'Aurangabad'),(3,'Banka'),(4,'Bhagalpur'),(5,'Buxar'),(6,'Gaya'),(7,'Jamui'),(8,'Jehanabad'),(9,'Kaimur'),(10,'Lakhisarai'),(11,'Munger'),(12,'Nalanda'),(13,'Nawada'),(14,'Patna'),(15,'Rohtas'),(16,'Sheikhpura');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Bhagalpur'),(2,'Magadh'),(3,'Munger'),(4,'Patna');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dues`
--

DROP TABLE IF EXISTS `dues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dues` (
  `consumerId` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `dues_amount` decimal(10,2) DEFAULT '0.00',
  `dues_status` varchar(20) DEFAULT 'Not Due'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dues`
--

LOCK TABLES `dues` WRITE;
/*!40000 ALTER TABLE `dues` DISABLE KEYS */;
INSERT INTO `dues` VALUES ('CNS7656','6754345678',0.00,'Not Due'),('CON5009','9142101898',1000.00,'Dues');
/*!40000 ALTER TABLE `dues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter_details`
--

DROP TABLE IF EXISTS `meter_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meter_details` (
  `meter_id` varchar(50) NOT NULL,
  `app_id` varchar(50) NOT NULL,
  `meter_type` varchar(50) DEFAULT NULL,
  `meter_capacity` varchar(50) DEFAULT NULL,
  `installation_date` date DEFAULT NULL,
  `inspector_name` varchar(45) DEFAULT NULL,
  `inspection_date` date DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `site_status` varchar(45) DEFAULT NULL,
  `confirmation_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`meter_id`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `meter_details_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `new_connection_requests` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter_details`
--

LOCK TABLES `meter_details` WRITE;
/*!40000 ALTER TABLE `meter_details` DISABLE KEYS */;
INSERT INTO `meter_details` VALUES ('MTR1746344144968','APP1745209023731','smart meter','220 volt','2025-05-06','Chanda','2025-04-28','Bankepur','Unsafe','Pending'),('MTR1746344222948','APP1745209526715','smart meter','220 volt','2025-05-01',NULL,NULL,NULL,NULL,NULL),('MTR1746440773013','APP1745209712350','Digital','220 volt','2025-04-30','AatmaVishwas Rai','2025-05-08','Saristabad','Safe','Confirmed');
/*!40000 ALTER TABLE `meter_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_connection_request`
--

DROP TABLE IF EXISTS `new_connection_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_connection_request` (
  `app_id` varchar(100) DEFAULT 'APP123',
  `connectionType` varchar(50) DEFAULT NULL,
  `consumerId` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `houseNo` varchar(100) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(100) DEFAULT NULL,
  `addressLine2` varchar(100) DEFAULT NULL,
  `addressLine3` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `block` varchar(100) DEFAULT NULL,
  `panchayat` varchar(100) DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `division` varchar(100) DEFAULT NULL,
  `subDivision` varchar(100) DEFAULT NULL,
  `section` varchar(100) DEFAULT NULL,
  `tariff` varchar(50) DEFAULT NULL,
  `E_phase` varchar(50) DEFAULT NULL,
  `E_load` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `applicantName` varchar(255) DEFAULT NULL,
  `f_hName` varchar(255) DEFAULT NULL,
  `idProof` varchar(50) DEFAULT NULL,
  `addressProof` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_connection_request`
--

LOCK TABLES `new_connection_request` WRITE;
/*!40000 ALTER TABLE `new_connection_request` DISABLE KEYS */;
INSERT INTO `new_connection_request` VALUES ('APP123','domestic','CON5678','9142101898','abc@gmail.com','123','Saristabad','Patna','Gardanibagh','Anisabad','Patna','80004','aurangabad','arwal','arwal','arwal','arwal','arwal','arwal','domestic','single','220','female','shrii','Ram','aadhar_card','aadhar_card'),('APP1744335123083','domestic','CON5678','9142101898','abc@gmail.com','123','Saristabad','Patna','Gardanibagh','Anisabad','Patna','80004','aurangabad','arwal','arwal','arwal','arwal','arwal','arwal','commercial','single','670','female','shrii','hari','aadhar_card','passport'),('APP1744335416076','commercial','CON123456','6754345678','def@gmail.com','9AB34','Gaziabad','Aara','Punjab','Haryana','Patna','80004','kaimur','arwal','arwal','arwal','arwal','arwal','arwal','commercial','three','220','male','Deepak','Hansmukh','pan_card','voter_id'),('APP1745175056708',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('APP1745323026241',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `new_connection_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_connection_requests`
--

DROP TABLE IF EXISTS `new_connection_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_connection_requests` (
  `app_id` varchar(100) NOT NULL DEFAULT 'APP123',
  `connectionType` varchar(50) DEFAULT NULL,
  `consumerId` varchar(50) NOT NULL DEFAULT 'CON123',
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `houseNo` varchar(100) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(100) DEFAULT NULL,
  `addressLine2` varchar(100) DEFAULT NULL,
  `addressLine3` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `block` varchar(100) DEFAULT NULL,
  `panchayat` varchar(100) DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `division` varchar(100) DEFAULT NULL,
  `subDivision` varchar(100) DEFAULT NULL,
  `section` varchar(100) DEFAULT NULL,
  `tariff` varchar(50) DEFAULT NULL,
  `E_phase` varchar(50) DEFAULT NULL,
  `E_load` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `applicantName` varchar(255) DEFAULT NULL,
  `f_hName` varchar(255) DEFAULT NULL,
  `idProof` varchar(50) DEFAULT NULL,
  `addressProof` varchar(50) DEFAULT NULL,
  `idProofFile` varchar(255) DEFAULT NULL,
  `addressProofFront` varchar(255) DEFAULT NULL,
  `addressProofLast` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `ownershipFirst` varchar(255) DEFAULT NULL,
  `ownershipSecond` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`app_id`,`consumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_connection_requests`
--

LOCK TABLES `new_connection_requests` WRITE;
/*!40000 ALTER TABLE `new_connection_requests` DISABLE KEYS */;
INSERT INTO `new_connection_requests` VALUES ('APP1745209023731','domestic','CON5678','9142101898','abc@gmail.com','45','Saristabad','Patna','Gardanibagh','Anisabad','Patna','678899','munger','arwal','arwal','arwal','arwal','arwal','arwal','commercial','single','670','female','nandu','NhiPata','aadhar_card','driving_license',NULL,NULL,NULL,NULL,NULL,NULL,'2025-05-05 14:11:19',NULL),('APP1745209526715','domestic','CNS7656','6754345678','def@gmail.com','45','Gaziabad','Patna','Punjab','Anisabad','Patna','200003','lakhisarai','arwal','arwal','arwal','arwal','arwal','arwal','commercial','single','220','other','shrii','vali','aadhar_card','voter_id',NULL,NULL,NULL,NULL,NULL,NULL,'2025-05-05 14:11:19',NULL),('APP1745209712350','domestic','CON5009','9142101898','def@gmail.com','45','Gaziabad','Patna','Punjab','Anisabad','Patna','200003','lakhisarai','arwal','arwal','arwal','arwal','arwal','arwal','commercial','single','220','other','hari','prasad','aadhar_card','pan_card',NULL,NULL,NULL,NULL,NULL,NULL,'2025-05-05 14:11:19',NULL);
/*!40000 ALTER TABLE `new_connection_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panchayat`
--

DROP TABLE IF EXISTS `panchayat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panchayat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `block_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_id` (`block_id`),
  CONSTRAINT `panchayat_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2517 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panchayat`
--

LOCK TABLES `panchayat` WRITE;
/*!40000 ALTER TABLE `panchayat` DISABLE KEYS */;
INSERT INTO `panchayat` VALUES (1,'Abgila Panchayat',1),(2,'Amara Panchayat ',1),(3,'Basilpur Panchayat',1),(4,'Bhadasi Panchayat',1),(5,'Fakharpur Panchayat',1),(6,'Khamaini Panchayat',1),(7,'Parasi Panchayat',1),(8,'Payarechak Panchayat',1),(9,'Rampur Panchayat',1),(10,'Sakri Panchayat',1),(11,'Sarouti Panchayat',1),(12,'Sonwarsa Panchayat',1),(13,'Beawon Panchayat',2),(14,' Belsar Panchayat',2),(15,'Injor Panchayat',2),(16,'Ismailpur Koil Panchayat',2),(17,'Jaipur Panchayat',2),(18,'Kamta Panchayat',2),(19,'Mainpura Panchayat',2),(20,'Morth Kaler Panchayat',2),(21,'Pahleja Panchayat',2),(22,'Sohsa Panchayat',2),(23,'South Kaler Panchayat',2),(24,' Teri Panchayat',2),(25,'Usari Panchayat',2),(26,'Walidad Panchayat',2),(27,'Sakri Khurd Panchayat',2),(28,'Aiyara Panchayat',3),(29,'Bambhi Panchayat ',3),(30,'Beikhara Panchayat',3),(31,'Chauhar Panchayat',3),(32,'Dorra Panchayat',3),(33,'Karpi Panchayat',3),(34,'Keyal Panchayat',3),(35,'Kinjir Panchayat',3),(36,'Murarhi Panchayat',3),(37,'Nagwan Panchayat',3),(38,'Narga Panchayat',3),(39,'Pariyari Panchayat',3),(40,'Purainiya Panchayat',3),(41,'Puran Panchayat ',3),(42,'Rampur Chay Panchayat',3),(43,'Rohai Panchayat',3),(44,'Shahar Telpa Panchayat',3),(45,'Khajuri Panchayat',3),(46,'Kochahasa Panchayat',3),(47,'Ahamadpur Harna Panchayat',4),(48,'Bara Panchayat ',4),(49,'Embrahimpur Panchayat',4),(50,'Kodmarae Panchayat',4),(51,'Manikpura Panchayat',4),(52,'Nadaura Panchayat',4),(53,'Nidhwan Panchayat',4),(54,'Pinjrawan Panchayat',4),(55,'Sachae Panchayat',4),(56,'Anua Panchayat',5),(57,'Belaura Panchayat',5),(58,'Chamandih Panchayat',5),(59,'Kharasin Panchayat',5),(60,'Khatangi Panchayat',5),(61,'Mali Panchayat ',5),(62,'Shepur Panchayat',5),(63,'Sonbhdra Panchayat',5),(64,'Bela',33),(65,'Ibrahimpur',33),(66,'Jamhaur',33),(67,'Karma Bhagwan',33),(68,'Khaira Bind',33),(69,'Khaira Mirja',33),(70,'Kurmahan',33),(71,'Manjhar',33),(72,'Naugarh',33),(73,'Ora',33),(74,'Pararwan',33),(75,'Paras Dih',33),(76,'Phesar',33),(77,'Poiwan',33),(78,'Pokhrahan',33),(79,'Badhi Khurd',34),(80,'Bhopatpur',34),(81,'Dhamanee',34),(82,'Dhangai',34),(83,'Dudhar',34),(84,'Gothaulee',34),(85,'Jankop',34),(86,'Kaji Chak',34),(87,'Kanchanpur',34),(88,'Khaira',34),(89,'Kocharh',34),(90,'Meh',34),(91,'Pauthu',34),(92,'Pipra',34),(93,'Riur',34),(94,'Tengara',34),(95,'Ankorha',35),(96,'Bairiya',35),(97,'Bariyavan',35),(98,'Basdiha',35),(99,'Belaien',35),(100,'Chandragargh',35),(101,'Harihar Urdana',35),(102,'Jaihind Tendua',35),(103,'Kanker',35),(104,'Kerka',35),(105,'Khajuri Pandu',35),(106,'Mahuaawan',35),(107,'Majhiawan',35),(108,'Mungia',35),(109,'Naur',35),(110,'Pipra',35),(111,'Rajpur',35),(112,'Ramnagar',35),(113,'Rampur',35),(114,'Simaree Dhamanee',35),(115,'Sonaura',35),(116,'Soree',35),(117,'Tandwa',35),(118,'Thengo',35),(119,'Tol',35),(120,'Amba',36),(121,'Bairaw',36),(122,'Baliya',36),(123,'Bharaundha',36),(124,'Dadhpa',36),(125,'Dumra',36),(126,'Dumri',36),(127,'Gheura',36),(128,'Jagdishpur',36),(129,'Karma Basantpur',36),(130,'Kutumba',36),(131,'Maharajganj',36),(132,'Matpa',36),(133,'Parta',36),(134,'Pipra Bagahi',36),(135,'Risiyp',36),(136,'Sanda',36),(137,'Suhi',36),(138,'Telhara',36),(139,'Verma',36),(140,'Baniya',37),(141,'Beri',37),(142,'Chein Nawada',37),(143,'Dadhpi',37),(144,'Erkikala',37),(145,'Ghatrain',37),(146,'Ghora Dehari',37),(147,'Khiriyawan',37),(148,'Madan Pur',37),(149,'Mahuawan',37),(150,'Manika',37),(151,'Nema Anjan',37),(152,'North Umga',37),(153,'Pipraura',37),(154,'Pirthu',37),(155,'Pirwan',37),(156,'Salaiya',37),(157,'South Umga',37),(158,'War',37),(159,'Banua',38),(160,'Baranda Rampur',38),(161,'Basdiha',38),(162,'Berhani',38),(163,'Berhna',38),(164,'BhawaniPur',38),(165,'Dulare',38),(166,'East Kataki',38),(167,'Eraura',38),(168,'Hasauli',38),(169,'Israur',38),(170,'Kharkani',38),(171,'Pawai',38),(172,'Sarganwan',38),(173,'West Kataki',38),(174,'Arthua',39),(175,'Baghora',39),(176,'Balar',39),(177,'Baligawn',39),(178,'Baur',39),(179,'Bhaduki Kalan',39),(180,'Bhadwa',39),(181,'Bhetaniyan',39),(182,'Charkanwan',39),(183,'Chew',39),(184,'Chobara',39),(185,'Dhosila',39),(186,'Dugul',39),(187,'Gordiha',39),(188,'Itar',39),(189,'Kajpa',39),(190,'Kerap',39),(191,'Kotbara',39),(192,'Latta',39),(193,'Lohara',39),(194,'Pauthu',39),(195,'Pogar',39),(196,'Sihuli',39),(197,'Amilona',40),(198,'Babandih',40),(199,'Bel',40),(200,'Bharub',40),(201,'Chanda',40),(202,'Dihara',40),(203,'Dihri',40),(204,'Gaini',40),(205,'Kanchanpur',40),(206,'Kara',40),(207,'Karsawan',40),(208,'Khudwan',40),(209,'Mahuwan',40),(210,'Malwan',40),(211,'Obra',40),(212,'Ratanpur',40),(213,'Sarsauli',40),(214,'Sonhuli',40),(215,'Tejpura',40),(216,'U.b.',40),(217,'Akorha',41),(218,'Ancha',41),(219,'Arai',41),(220,'Belwan',41),(221,'Chauri',41),(222,'Gordiha',41),(223,'Kanap',41),(224,'Karma',41),(225,'Mahawar',41),(226,'Manar',41),(227,'Sansa',41),(228,'Shamshernagar',41),(229,'Sinduar',41),(230,'Tarar',41),(231,'Tarari',41),(232,'Amari',42),(233,'Baksar',42),(234,'Bantara',42),(235,'Barma Khurd',42),(236,'Bazar Barma',42),(237,'Beraka',42),(238,'Bhurkunda',42),(239,'Chapuk',42),(240,'Dadhapi',42),(241,'Deohara',42),(242,'Dihuri',42),(243,'Fag',42),(244,'Goh',42),(245,'Hasampur',42),(246,'Hathiara',42),(247,'Jhikatia',42),(248,'Malhad',42),(249,'Mirpur',42),(250,'Teap',42),(251,'Uphara',42),(252,'Ahiyapur',43),(253,'Amjhar',43),(254,'Dhusari',43),(255,'Dindir',43),(256,'Dumara',43),(257,'Haspura',43),(258,'Itwan',43),(259,'Jaitpur',43),(260,'Koilwan',43),(261,'Malhara',43),(262,'Piru',43),(263,'Purhara',43),(264,'Sonhathu',43),(265,'Tal',43),(266,'Bajidudi',6),(267,'Ballikitta',6),(268,'Bhadariya',6),(269,'Bharko',6),(270,'Bhikhanpur',6),(271,'Bisanpur',6),(272,'Fatehpur',6),(273,'Garibpur',6),(274,'Gorgama',6),(275,'Kolbujurg',6),(276,'Kushmaha',6),(277,'Lakshmipur Chiraiya',6),(278,'Mahadeopur',6),(279,'Pawai',6),(280,'Ratanpur Makduma',6),(281,'Salempur',6),(282,'Sobhanpur',6),(283,'Sultanpur',6),(284,'Tardih',6),(285,'Bahera',7),(286,'Chhatrapal',7),(287,'Dara',7),(288,'Domuhan',7),(289,'Dudhari',7),(290,'Jamua',7),(291,'Kajhiya',7),(292,'Kakwara',7),(293,'Karma',7),(294,'Lakhnaudi',7),(295,'Lakrikola',7),(296,'Lodham',7),(297,'Raniya Jogidha',7),(298,'Samukhiya',7),(299,'South Kateli',7),(300,'Teliya',7),(301,'Auria',8),(302,'Bhabhangama',8),(303,'Gordhawar',8),(304,'Kharhara',8),(305,'Kharihara',8),(306,'Lourhia Khurd',8),(307,'Mahua',8),(308,'Mirjapur',8),(309,'Narayanpur',8),(310,'Panjwara',8),(311,'Pathra',8),(312,'Sabalpur',8),(313,'Sondiha North',8),(314,'Sondiha South',8),(315,'Bahorna',9),(316,'Basmata',9),(317,'Belhar',9),(318,'Dhouri',9),(319,'Dumariya',9),(320,'Ghorbahiyar',9),(321,'Hathiya Dara',9),(322,'Jhukiliya',9),(323,'Loudiya',9),(324,'Nimiya',9),(325,'Raghunathpur',9),(326,'Rajpur',9),(327,'Ranga',9),(328,'Sahebganj',9),(329,'Srinagar',9),(330,'Surykana-Beldiha',9),(331,'Taraiya',9),(332,'Teliya Kumri',9),(333,'Angaru Jabra',10),(334,'Ashnaha',10),(335,'Babhangama ',10),(336,'Chilkara',10),(337,'Dahua ',10),(338,'Daliya',10),(339,'Faga',10),(340,'Gokula',10),(341,'Kairi',10),(342,'Kudro ',10),(343,'Sanga ',10),(344,'Sanpdahar',10),(345,'Sarua',10),(346,'Sikandarpur',10),(347,'Asuraha',11),(348,'Berfera Tetariya',11),(349,'Birniya',11),(350,'Boda Suiya',11),(351,'Chandan',11),(352,'Chandawari',11),(353,'Dhanubsar',11),(354,'Gouripur',11),(355,'Kaswabaliya (north)',11),(356,'Kaswabaliya (south)',11),(357,'Katsakara (east)',11),(358,'Katsakara (west)',11),(359,'Koriya',11),(360,'Kusumjori',11),(361,'Siljori',11),(362,'Warney (north)',11),(363,'Warney (south)',11),(364,'Ahiro',12),(365,'Batsar',12),(366,'Bhelai',12),(367,'Chalna',12),(368,'Chandadih',12),(369,'Gachiya Basbitta',12),(370,'Ghasiya',12),(371,'Jaipur',12),(372,'Karhariya',12),(373,'Kathbangaon Birbalpur',12),(374,'Kharoundha Jhotha',12),(375,'Kurma',12),(376,'Loungay',12),(377,'Mahila Bishanpur',12),(378,'Makaita Babura',12),(379,'Pair',12),(380,'Rangaon',12),(381,'Sainchak',12),(382,'Sijhat Baliyas',12),(383,'Tahirpur Goura',12),(384,'Bhitiya',13),(385,'Dakshini Kojhi',13),(386,'Fullidumar',13),(387,'Kaitha',13),(388,'Kenduar',13),(389,'Kheshar',13),(390,'Pathdda',13),(391,'Rata',13),(392,'Sadpur',13),(393,'Teliya Pahar',13),(394,'Uttari Kojhi',13),(395,'Barwasni',14),(396,'Basmatta',14),(397,'Bhorsar Bhelwa',14),(398,'Damodara',14),(399,'Dewasi',14),(400,'Ghoramara',14),(401,'Harhar',14),(402,'Jaipur',14),(403,'Jamdaha',14),(404,'Kathoun',14),(405,'Katiyari',14),(406,'Kolhasar',14),(407,'Lakrama',14),(408,'Maniya',14),(409,'Mothawari',14),(410,'Bhawanipur-kathoun',15),(411,'Chilkawar Asouta',15),(412,'Dhayaharna Mahgama',15),(413,'Dhouni-bamdeo',15),(414,'Harchandi Amhara',15),(415,'Kathchatar Lilatari',15),(416,'Khaira',15),(417,'Majhgain Darpa',15),(418,'Morama Bangaon',15),(419,'Nawada Kharouni',15),(420,'Orhara',15),(421,'Parghari-lakra',15),(422,'Rajabar',15),(423,'Rajaun',15),(424,'Sakahara',15),(425,'Sanjha Shyampur',15),(426,'Singhnan',15),(427,'Tilakpur',15),(428,'Baidpur',16),(429,'Barsabad',16),(430,'Bharatshila',16),(431,'Birnaudha',16),(432,'Chhatrahar',16),(433,'Chutiya Belari',16),(434,'Gulni',16),(435,'Jhakhra',16),(436,'Kamatpur',16),(437,'Karsop',16),(438,'Kaswa',16),(439,'Kurma',16),(440,'Maldih',16),(441,'Mirjapur',16),(442,'Pakariya',16),(443,'Parariya',16),(444,'Parmanandpur',16),(445,'Poukari',16),(446,'Ramchua',16),(447,'Agarpur',17),(448,'Agarpur Machhipur',17),(449,'Bishanpur Jichho',17),(450,'Goradih',17),(451,'Kasimpur',17),(452,'Khutaha',17),(453,'Mohanpur',17),(454,'Murhan Jamin',17),(455,'Nadiyama',17),(456,'Pithna',17),(457,'Salpur',17),(458,'Sarath Daharpur',17),(459,'Sonudih Satjori',17),(460,'Tarchha Damuchak',17),(461,'Ustu',17),(462,'Baijani',18),(463,'Baluwa Chak Puraini',18),(464,'Bhawanipur Desari',18),(465,'Chandpur',18),(466,'Imampur',18),(467,'Jagadishpur',18),(468,'Jamni',18),(469,'Khiribandh',18),(470,'Puraini North',18),(471,'Puraini South',18),(472,'Puraini Tola Sonu Chak',18),(473,'Saino',18),(474,'Sanhauli',18),(475,'Shahjangi',18),(476,'Belkhoria',19),(477,'Bhatoria',19),(478,'Bhuwalpur',19),(479,'Bishanrampur',19),(480,'Gosaidaspur',19),(481,'Goura Chouki',19),(482,'Kajraily',19),(483,'Nisf Ambe',19),(484,'Noorpur',19),(485,'Raghopur',19),(486,'Rampur Khurd',19),(487,'Rannuchak Makandpur',19),(488,'Rattipur Bariya',19),(489,'Shankarpur',19),(490,'Baijalpur',20),(491,'Barari',20),(492,'Chandheri',20),(493,'Farka',20),(494,'Fatehpur',20),(495,'Khankitta',20),(496,'Lailakh',20),(497,'Lodipur',20),(498,'Mamalkha',20),(499,'Parghari',20),(500,'Rajandipur',20),(501,'Sardho',20),(502,'Shankarpur',20),(503,'Amba',21),(504,'Basudeopur',21),(505,'Belthu',21),(506,'Bhulni',21),(507,'Dariyapur',21),(508,'Daspur',21),(509,'Dindayal Pur',21),(510,'Govrain',21),(511,'Hajipur',21),(512,'Harnath',21),(513,'Jagaria',21),(514,'Kaswa Kherhi',21),(515,'Khaira',21),(516,'Khulni',21),(517,'Kishanpur Amkhoria',21),(518,'Makanpur',21),(519,'Pair Dominia Mal',21),(520,'Sajour',21),(521,'Sarauni',21),(522,'Abjuganj',22),(523,'Asiyachak',22),(524,'Bhirkhurd',22),(525,'Dhandhi Belari',22),(526,'English Chichraun',22),(527,'Ganganiya',22),(528,'Kamarganj',22),(529,'Katahara',22),(530,'Khanpur',22),(531,'Kherahia',22),(532,'Kheraihiya',22),(533,'Kishanpur',22),(534,'Kumaitha',22),(535,'Maheshi',22),(536,'Masdi',22),(537,'Mirhatti',22),(538,'Nayagaon',22),(539,'Tilakpur',22),(540,'Antichak',23),(541,'Bansi Pur',23),(542,'Bholsar',23),(543,'Birbanna',23),(544,'Dhanoura',23),(545,'Ekchari',23),(546,'Ekdara',23),(547,'Ghogha',23),(548,'Jani Dih',23),(549,'Kairiya',23),(550,'Kishundaspur',23),(551,'Kodwar',23),(552,'Kurma',23),(553,'Lagma',23),(554,'Maheshamunda',23),(555,'Mathura Pur',23),(556,'Mohanpur Goughatta',23),(557,'Nandlal Pur',23),(558,'Ogari',23),(559,'Oriup',23),(560,'Pakki Sarai',23),(561,'Prashsthdih',23),(562,'Ram Pur',23),(563,'Ramjani Pur',23),(564,'Sadanandpur Baisa',23),(565,'Salempur Saini',23),(566,'Shyam Pur',23),(567,'Sinya',23),(568,'Babupur',24),(569,'Bakharpur East',24),(570,'Bakharpur West',24),(571,'Bandhu Jayram',24),(572,'Bara',24),(573,'Ekchari Diyara',24),(574,'Gobindpur',24),(575,'Hardev Chak',24),(576,'Harin Kol',24),(577,'Khavaspur',24),(578,'Kirtania',24),(579,'Manik Pur',24),(580,'Mohan Pur Madhu Ban',24),(581,'Mohanpur',24),(582,'Olapur',24),(583,'Parasbanna',24),(584,'Parshurampur',24),(585,'Pirpainti',24),(586,'Pyalapur',24),(587,'Rajgaon',24),(588,'Rajgaon Araji',24),(589,'Rani Diara',24),(590,'Rifatpur',24),(591,'Rifatpur Simanpur',24),(592,'Roushanpur',24),(593,'Salempur',24),(594,'Shrimatpur Gopalichak',24),(595,'Shrimatpur Hujurnagar',24),(596,'Amdanda',25),(597,'Amdiha',25),(598,'Arar',25),(599,'Bari Naki',25),(600,'Bhuriya Mahiyama',25),(601,'Boda Pathakdih',25),(602,'Dhuabai',25),(603,'Fajilpur Sakrama',25),(604,'Kamalpur Srichak',25),(605,'Madarganj',25),(606,'Madhopur Bathani',25),(607,'Maheshpur Ghanshyamchak',25),(608,'Pothia',25),(609,'Sanhaula',25),(610,'Sanokhar',25),(611,'Silhan Khajuriya',25),(612,'Tarar',25),(613,'Telaundha',25),(614,'Babhangama',26),(615,'Bihpur East',26),(616,'Bihpur Jamalpur',26),(617,'Bihpur Middle',26),(618,'Bihpur South',26),(619,'Dhrampur Ratti',26),(620,'Hario',26),(621,'Jhandapur East',26),(622,'Jhandapur West',26),(623,'Lattipur North',26),(624,'Lattipur South',26),(625,'Marwa East',26),(626,'Marwa West',26),(627,'Abhia Pachagachia',27),(628,'Babu Tola Kamlakund',27),(629,'Dumaria Chaperghat',27),(630,'Gopalpur Dimaha',27),(631,'Gosai Gaown',27),(632,'Makandpur',27),(633,'Saidpur',27),(634,'Sukatia Bazar',27),(635,'Tintanga Karari',27),(636,'Ismailpur Paschimi Bhitha',28),(637,'Ismailpur Purabi Bhitha',28),(638,'Kamla Kund',28),(639,'Narayanpur Laxmipur',28),(640,'Parbatta',28),(641,'Akidatpur',29),(642,'Bhawanpura',29),(643,'Chorhar',29),(644,'Dhoriya Dadpur',29),(645,'Dhrubganj',29),(646,'Got-kharik',29),(647,'Khairpur',29),(648,'Kharik Bazar',29),(649,'Lokmanpur',29),(650,'Raghopur',29),(651,'Telghi',29),(652,'Tulsipur',29),(653,'Usmanpur',29),(654,'Baikatpur Dudhaila',30),(655,'Bhawanipur',30),(656,'Jaipurchuhar West',30),(657,'Jaypurchuhar East',30),(658,'Nagarpara East',30),(659,'Nagarpara North',30),(660,'Nagarpara South',30),(661,'Raipur',30),(662,'Shahzadpur',30),(663,'Sihpur East',30),(664,'Sihpur West',30),(665,'Dholbazza',31),(666,'Jagatpur',31),(667,'Jamunia',31),(668,'Kadwa Diyara',31),(669,'Kahairpur Kadwa',31),(670,'Khagra',31),(671,'Nagrah',31),(672,'Pakra',31),(673,'Punama Pratap Nagar',31),(674,'Tetari',31),(675,'Baisi Jahangirpur',32),(676,'Bania Baisi',32),(677,'Bhawanipur',32),(678,'Koshkipur Sahaura',32),(679,'Madrauni',32),(680,'Murli',32),(681,'Rangra',32),(682,'Sadhua Chapar',32),(683,'Tintanga Diyara North',32),(684,'Tintanga Diyara South',32),(685,'Ahirauli',44),(686,'Baruna',44),(687,'Boksa',44),(688,'Chhotka Nuaon',44),(689,'Churamanpur',44),(690,'Dalsagar',44),(691,'Jagdishpur',44),(692,'Jaso',44),(693,'Kamarpur',44),(694,'Karahansi',44),(695,'Khutahan',44),(696,'Mahadah',44),(697,'Nadaon',44),(698,'Pandeypatti',44),(699,'Sonbarsa',44),(700,'Umarpur',44),(701,'Atrauna',45),(702,'Barka Gaon',45),(703,'Basao Kala',45),(704,'Basudhar',45),(705,'Bijhaura',45),(706,'Bikram English',45),(707,'Chilhar',45),(708,'Hakimpur',45),(709,'Harpur Jaipur',45),(710,'Harpur Jalwansi',45),(711,'Indaur',45),(712,'Itarhi',45),(713,'Kukudha',45),(714,'Narayan Pur',45),(715,'Unwas',45),(716,'Banarpur',46),(717,'Chausa',46),(718,'Chunni',46),(719,'Dehari',46),(720,'Jalilpur',46),(721,'Paliya',46),(722,'Pawni',46),(723,'Rampurkala',46),(724,'Sarenja',46),(725,'Sikraul',46),(726,'Akbarpur',47),(727,'Banni',47),(728,'Barupur',47),(729,'Dewarihya',47),(730,'Dhansoi',47),(731,'Dulfa',47),(732,'Harpur',47),(733,'Hethuan',47),(734,'Kaithhar Kala',47),(735,'Kharahana',47),(736,'Khiri',47),(737,'Mangraon',47),(738,'Matukipur',47),(739,'Nagpur',47),(740,'Rajpur',47),(741,'Rasen Kala',47),(742,'Samahuta',47),(743,'Sikathi',47),(744,'Tiyara',47),(745,'Ariaon',48),(746,'Ataon',48),(747,'Bhojpur Jadid',48),(748,'Bhojpur Kadim',48),(749,'Chhatanwar',48),(750,'Chilhari',48),(751,'Kanjharua',48),(752,'Kasian',48),(753,'Koransarai',48),(754,'Kushalpur',48),(755,'Lakhan Dihra',48),(756,'Mathila',48),(757,'Mugaon',48),(758,'Nandan',48),(759,'Nuaon',48),(760,'Sowan',48),(761,'Athar',49),(762,'Atimi',49),(763,'Babu Ganj English',49),(764,'Giridhar Baraon',49),(765,'Belaon',49),(766,'Belhari',49),(767,'Bhadar',49),(768,'Bhatauli',49),(769,'Karsar',49),(770,'Maniya',49),(771,'Nawanagar',49),(772,'Parmanpur',49),(773,'Rupsagar',49),(774,'Sikraul',49),(775,'Sonbarsha',49),(776,'Waina',49),(777,'Bagen',50),(778,'Bairia',50),(779,'Bararhi',50),(780,'Bhadwar',50),(781,'Brahmpur',50),(782,'Ekrasi',50),(783,'Gahauna',50),(784,'Gayaghat',50),(785,'Harnathpur',50),(786,'Kaithi',50),(787,'Kant',50),(788,'Mahuar',50),(789,'Nimej',50),(790,'North Nainijor',50),(791,'Pokhraha',50),(792,'Raghunathpur',50),(793,'South Nainijor',50),(794,'Yogia',50),(795,'Katiknar',51),(796,'Kesath',51),(797,'Rampur',51),(798,'Arak',52),(799,'Chakki',52),(800,'Chanda',52),(801,'Jawahi Diar',52),(802,'Chaugain',53),(803,'Khewali',53),(804,'Masahariya',53),(805,'Murar',53),(806,'Nachap',53),(807,'Balihar',54),(808,'Dhakaich',54),(809,'Dullahpur',54),(810,'Dumri',54),(811,'Ekauna',54),(812,'Gangauli',54),(813,'Gayghat',54),(814,'Kathar',54),(815,'Kazipur',54),(816,'Keshopur',54),(817,'Kharhatanr',54),(818,'Majhwari',54),(819,'Niyazipur',54),(820,'Paigambarpur',54),(821,'Parari',54),(822,'Rajapur',54),(823,'Rajpur Kalan',54),(824,'Rajpur Kalan Parsanpah',54),(825,'Sahiyar',54),(826,'Simri',54),(827,'Amraha',55),(828,'Aurawan',55),(829,'Bara',55),(830,'Chakand',55),(831,'Churi',55),(832,'Dhansir',55),(833,'Ghuthia',55),(834,'Kandi',55),(835,'Kesaru Dharmpur',55),(836,'Khiriyawan',55),(837,'Korwan',55),(838,'Kujap',55),(839,'Kujapi',55),(840,'Madan Bigha',55),(841,'Naili',55),(842,'Rasalpur',55),(843,'Agandha',56),(844,'Akthu Kachanpur',56),(845,'Bajitpur',56),(846,'Belaganj',56),(847,'Belhadi',56),(848,'Bhalua-i',56),(849,'Bhalua-ii',56),(850,'Chiraila',56),(851,'Irki',56),(852,'Khaneta',56),(853,'Koriyawan',56),(854,'Kormathu',56),(855,'Lakshmipur',56),(856,'Lodipur',56),(857,'Paibigha',56),(858,'Panari',56),(859,'Rauna',56),(860,'Sakir Bigha',56),(861,'Sri Pur',56),(862,'Amethi',57),(863,'Bichchha',57),(864,'Bishun Pur',57),(865,'Ghuriyawan',57),(866,'Jamuawan',57),(867,'Karisowa',57),(868,'Karjara',57),(869,'Kenar Fatehpur',57),(870,'Kenar Paharpur',57),(871,'Kurkihar',57),(872,'Mahugain',57),(873,'Mahuyet',57),(874,'Nawada',57),(875,'Pater Mangrawa',57),(876,'Pura',57),(877,'Sahiya',57),(878,'Tarawan',57),(879,'Bara Gandhar',58),(880,'Bhadeja',58),(881,'Bhore',58),(882,'Gere',58),(883,'Kaiya',58),(884,'Lakhan Pur',58),(885,'Nanauk',58),(886,'Nauranga',58),(887,'Shadi Pur',58),(888,'Sohai Pur',58),(889,'Sonaut',58),(890,'Usari',58),(891,'Atiya',59),(892,'Bara',59),(893,'Basarhi',59),(894,'Gapha Khurd',59),(895,'Ilara',59),(896,'Itara',59),(897,'Jhikatiya',59),(898,'Kanhaul',59),(899,'Kurmawan',59),(900,'Mocharim',59),(901,'Mora Mardana',59),(902,'Mora Tal',59),(903,'Nawan',59),(904,'Shekhwara',59),(905,'Aropur',60),(906,'Bahsapipra',60),(907,'Barsauna',60),(908,'Bhetaura',60),(909,'Chaubar',60),(910,'Dhibar',60),(911,'Gajadharpur',60),(912,'Jagarnathpur',60),(913,'Tankuppa',60),(914,'Utali Bara',60),(915,'Bara',61),(916,'Bhare',61),(917,'Charokhari',61),(918,'Dharhara Kala',61),(919,'Dumari Chati',61),(920,'Jaipur',61),(921,'Kathautiya Kewal',61),(922,'Lodhwe North',61),(923,'Lodhwe South',61),(924,'Mataso',61),(925,'Meyari',61),(926,'Morhe',61),(927,'Nagawa',61),(928,'Naudiha Jhurang',61),(929,'Naudiha Sultanpur',61),(930,'Neemi',61),(931,'Pahar Pur',61),(932,'Salaiya Kala',61),(933,'Adai',62),(934,'Anti',62),(935,'Aslempur',62),(936,'Chabura',62),(937,'Garari',62),(938,'Gauharpur',62),(939,'Kabar',62),(940,'Ker',62),(941,'Khajuri',62),(942,'Konch',62),(943,'Korap',62),(944,'Kurmawan',62),(945,'Manjhiyawan',62),(946,'Parsawan',62),(947,'Simra',62),(948,'Srigawan',62),(949,'Tineri',62),(950,'Utren',62),(951,'Ammakuan',63),(952,'Bhori',63),(953,'Chaita',63),(954,'Chhathawan',63),(955,'Dighaura',63),(956,'Dihura',63),(957,'Jalalpur',63),(958,'Kespa',63),(959,'Khanetu',63),(960,'Law',63),(961,'Mahmanna',63),(962,'Makhdumpur',63),(963,'Mau',63),(964,'Musi',63),(965,'Nepa',63),(966,'Noni',63),(967,'Paluhar',63),(968,'Pura',63),(969,'Rupas Pur',63),(970,'Sanda',63),(971,'Shiv Nagar',63),(972,'Simuara',63),(973,'Barorah',64),(974,'Daboor',64),(975,'Deokali',64),(976,'Diha',64),(977,'Ghatera',64),(978,'Gudru',64),(979,'Kanausi',64),(980,'Konchi',64),(981,'Malpa',64),(982,'Pahra',64),(983,'Rauna',64),(984,'Tilori',64),(985,'Ajmat Ganj',65),(986,'Bagahi',65),(987,'Kapasia',65),(988,'Karhatta',65),(989,'Mangarawan',65),(990,'Manjhiawan',65),(991,'Paraiya Khurd',65),(992,'Puna Kala',65),(993,'Solara',65),(994,'Aima',66),(995,'Bihta',66),(996,'Chiraili',66),(997,'Hathiyawan',66),(998,'Hemara',66),(999,'Horma',66),(1000,'Jamuawan',66),(1001,'Kurwa',66),(1002,'Kutlupur',66),(1003,'Naudiha',66),(1004,'Rauniya',66),(1005,'Sarbahda',66),(1006,'Siswar',66),(1007,'Uchouli',66),(1008,'Chakra',67),(1009,'Dhusri',67),(1010,'Dihuri',67),(1011,'Jiri',67),(1012,'Narawat',67),(1013,'Sahora',67),(1014,'Sirh',67),(1015,'Tetua',67),(1016,'Bathani',68),(1017,'Khukhri',68),(1018,'Mai',68),(1019,'Maniyara',68),(1020,'Naili',68),(1021,'Saren',68),(1022,'Singhaul',68),(1023,'Telari',68),(1024,'Arai',69),(1025,'Dariyapur',69),(1026,'Gehlor',69),(1027,'Jethian',69),(1028,'North Kajoor',69),(1029,'Sarsu',69),(1030,'Sewtar',69),(1031,'South Kajoor',69),(1032,'Tetar',69),(1033,'Barma',70),(1034,'Belauti',70),(1035,'Chilor',70),(1036,'Dubba',70),(1037,'Guneri',70),(1038,'Gurua',70),(1039,'Kaj',70),(1040,'Kolauna',70),(1041,'Manda',70),(1042,'Nadaura',70),(1043,'Nagwan',70),(1044,'Pakri',70),(1045,'Paluhara',70),(1046,'Raghunath Khap',70),(1047,'Rajan',70),(1048,'Simaru',70),(1049,'Akouna',71),(1050,'Amas',71),(1051,'Badki Chilmi',71),(1052,'Jhari',71),(1053,'Kalwan',71),(1054,'Karamdih',71),(1055,'Mahuawan',71),(1056,'Rampur',71),(1057,'Sawnkala',71),(1058,'Baital',72),(1059,'Barheta',72),(1060,'Bihargain',72),(1061,'Goitha',72),(1062,'Lutua',72),(1063,'Pananiya',72),(1064,'Parsawan Khurd',72),(1065,'Roshan Ganj',72),(1066,'Saif Ganj',72),(1067,'Tarwan',72),(1068,'Tilaiya',72),(1069,'Bikopur',73),(1070,'Biraj',73),(1071,'Chhakar Bandha',73),(1072,'Chua Bar',73),(1073,'Dubahal',73),(1074,'Jhikatiya',73),(1075,'Kujesar',73),(1076,'Lawabar',73),(1077,'Malhari',73),(1078,'Manjhauli',73),(1079,'Nagwan',73),(1080,'Naudiha',73),(1081,'Pakriguria',73),(1082,'Salaiya',73),(1083,'Sidhpur',73),(1084,'Bhangia',74),(1085,'Bhokaha',74),(1086,'Chhakarbandha',74),(1087,'Kachar',74),(1088,'Kolhu Bar',74),(1089,'Mahuri',74),(1090,'Manjhauli',74),(1091,'Nandai',74),(1092,'Narayan Pur',74),(1093,'Pankara',74),(1094,'Sewra',74),(1095,'Barhat',75),(1096,'Bariyarpur',75),(1097,'Darah',75),(1098,'Gugaldih',75),(1099,'Katauna',75),(1100,'Lakhai',75),(1101,'Mallehpur',75),(1102,'Numar',75),(1103,'Panro',75),(1104,'Bamdah',76),(1105,'Barmoria',76),(1106,'Bongi',76),(1107,'Chakai',76),(1108,'Chandrmandih',76),(1109,'Chophla',76),(1110,'Dadhwa',76),(1111,'Dulampur',76),(1112,'Farizatadih',76),(1113,'Gajhi',76),(1114,'Ghutbey',76),(1115,'Kalyanpur',76),(1116,'Kiyajori',76),(1117,'Madhopur',76),(1118,'Nauadih',76),(1119,'Nawadih Silfari',76),(1120,'Paranchi',76),(1121,'Pethar Pahri',76),(1122,'Pojha',76),(1123,'Ramchandra Dih',76),(1124,'Ramsingh Dih',76),(1125,'Saroun',76),(1126,'Thadhi',76),(1127,'Gangara',77),(1128,'Kolhua',77),(1129,'Kundhur',77),(1130,'Moura',77),(1131,'Patsanda',77),(1132,'Purbi Guguldih',77),(1133,'Ratanpur',77),(1134,'Sewa',77),(1135,'Abgilla Chaurasa',78),(1136,'Aliganj',78),(1137,'Arha',78),(1138,'Darkha',78),(1139,'Din Nager',78),(1140,'Islamnagar',78),(1141,'Kaitha',78),(1142,'Kaiyar',78),(1143,'Kodwaria',78),(1144,'Kolhana',78),(1145,'Mirgaganj',78),(1146,'Pursunda',78),(1147,'Sahora',78),(1148,'Barhat',79),(1149,'Chakai',79),(1150,'Gidhor',79),(1151,'Islamnagar Aliganj',79),(1152,'Jamui',79),(1153,'Jhajha',79),(1154,'Khaira',79),(1155,'Laxmipur',79),(1156,'Sikandra',79),(1157,'Sono',79),(1158,'Baijla',80),(1159,'Baliyadih',80),(1160,'Barajor',80),(1161,'Barakola',80),(1162,'Borwa',80),(1163,'Chai',80),(1164,'Chhapa',80),(1165,'Dhamna',80),(1166,'Hathia',80),(1167,'Jamu Kharaiya',80),(1168,'Kanan',80),(1169,'Kanaudi',80),(1170,'Karhara',80),(1171,'Karma',80),(1172,'Keshopur',80),(1173,'Khuranda',80),(1174,'Mahapur',80),(1175,'Pairgaha',80),(1176,'Rajla Kala',80),(1177,'Telwa Bazar',80),(1178,'Amari',81),(1179,'Arunwa Bank',81),(1180,'Banpur',81),(1181,'Bela',81),(1182,'Bhimain',81),(1183,'Bisanpur',81),(1184,'Chuan',81),(1185,'Dabil',81),(1186,'Garhi',81),(1187,'Goli',81),(1188,'Gopalpur',81),(1189,'Harkhar',81),(1190,'Harni',81),(1191,'Jhundo',81),(1192,'Jitjhingoi',81),(1193,'Kagesar',81),(1194,'Kendih',81),(1195,'Khaira',81),(1196,'Kharaich',81),(1197,'Mangobandar',81),(1198,'Nim Nawada',81),(1199,'Raipura',81),(1200,'Anantpur',82),(1201,'Chinawaria',82),(1202,'Dighi',82),(1203,'Gaura',82),(1204,'Harla',82),(1205,'Kakan Chaur',82),(1206,'Kala',82),(1207,'Khelar',82),(1208,'Maraiya',82),(1209,'Matia',82),(1210,'Mohanpur',82),(1211,'Najari',82),(1212,'Pidron',82),(1213,'Bhullo',83),(1214,'Bichhwe',83),(1215,'Gokhula- Fatehpur',83),(1216,'Itasagar',83),(1217,'Khar -dih',83),(1218,'Kumar',83),(1219,'Mahadeo -simeria',83),(1220,'Manjosh',83),(1221,'Mathura Pur',83),(1222,'Mircha- Pathak Chak',83),(1223,'Pohe',83),(1224,'Sabal -bigha',83),(1225,'Sighauri',83),(1226,'Babudih',84),(1227,'Balthar',84),(1228,'Belamba',84),(1229,'Chhuchunariya',84),(1230,'Churhait',84),(1231,'Dahiyari',84),(1232,'Dhodhari',84),(1233,'Gandar',84),(1234,'Keshofaraka',84),(1235,'Lakhan Kiyari',84),(1236,'Lalilewar',84),(1237,'Loha',84),(1238,'Maheshwari',84),(1239,'Naiyadih',84),(1240,'Pairamatihana',84),(1241,'Rajaun',84),(1242,'Sarebad',84),(1243,'Sono',84),(1244,'Thamhan',84),(1245,'Amain',85),(1246,'Gonwan',85),(1247,'Jamuk',85),(1248,'Kalpa',85),(1249,'Kinari',85),(1250,'Larsa',85),(1251,'Mandey Bigha',85),(1252,'Mandil',85),(1253,'Muther',85),(1254,'Nauru',85),(1255,'Pandui',85),(1256,'Sevnan',85),(1257,'Sikariya',85),(1258,'Surungapur',85),(1259,'Bela Birra',86),(1260,'Bhaikh',86),(1261,'Chhariyari',86),(1262,'Dakra',86),(1263,'Dharaut',86),(1264,'Dharnai',86),(1265,'E. Saren',86),(1266,'Jagpura',86),(1267,'Jamanganj',86),(1268,'Kachnawan',86),(1269,'Kalanaur',86),(1270,'Kohra',86),(1271,'Kumardih',86),(1272,'Makarpur',86),(1273,'Malathi',86),(1274,'Manjhos',86),(1275,'Punhada',86),(1276,'Rampur',86),(1277,'Solhanda',86),(1278,'Sugaon',86),(1279,'Sumera',86),(1280,'W. Saren',86),(1281,'Ahiasa',87),(1282,'Bharthu',87),(1283,'Ghoshi',87),(1284,'Golakpur',87),(1285,'Kurre',87),(1286,'Lakhawar',87),(1287,'Parawan',87),(1288,'Sahobigha',87),(1289,'Shahpur',87),(1290,'Uber',87),(1291,'Bauri',88),(1292,'Chiri',88),(1293,'Dawthoo',88),(1294,'Keur',88),(1295,'Khudauri',88),(1296,'Kokarsha',88),(1297,'Murgaon',88),(1298,'Suraj Pur',88),(1299,'Tirra',88),(1300,'Jhunathi',89),(1301,'Kansua',89),(1302,'Kaswan',89),(1303,'Lakhapur',89),(1304,'Murhara',89),(1305,'Narayanpur',89),(1306,'Nehalpur',89),(1307,'Noawan',89),(1308,'Pandaul',89),(1309,'Ratni',89),(1310,'Sesamba',89),(1311,'Sikandarpur',89),(1312,'Sohraiya',89),(1313,'Uchita',89),(1314,'Bandhu Ganj',90),(1315,'Deora',90),(1316,'Gandhar',90),(1317,'Jaytipur Kurua',90),(1318,'Modan Ganj',90),(1319,'Naima',90),(1320,'Okari',90),(1321,'Saista Bad',90),(1322,'Amthua',91),(1323,'Bara',91),(1324,'Barawan',91),(1325,'Barhauna',91),(1326,'Damuha',91),(1327,'Derhsaiya',91),(1328,'Khalish Pur',91),(1329,'Maniyawan',91),(1330,'Nerthua',91),(1331,'Nonhi',91),(1332,'Pinjora',91),(1333,'Saidabad Parsain',91),(1334,'Suleman Pur',91),(1335,'Uttar Serthu',91),(1336,'Aathan',177),(1337,'Adhaura',177),(1338,'Babhani Kala',177),(1339,'Barwan Kala',177),(1340,'Chainpura',177),(1341,'Dighar',177),(1342,'Dumrawan',177),(1343,'Jamuninar',177),(1344,'Kolhua',177),(1345,'Sarki',177),(1346,'Sarodag',177),(1347,'Akhalaspur',178),(1348,'Bahuan',178),(1349,'Betari',178),(1350,'Dihara',178),(1351,'Dumdum',178),(1352,'Dumraith',178),(1353,'Jagebarawn',178),(1354,'Kaithi',178),(1355,'Kohari',178),(1356,'Kurasan',178),(1357,'Mahuari',178),(1358,'Mahuat',178),(1359,'Manihari',178),(1360,'Miria',178),(1361,'Miu-sukharipur',178),(1362,'Mokari',178),(1363,'Ratwar',178),(1364,'Ruiya',178),(1365,'Ruppur',178),(1366,'Sikathi',178),(1367,'Sio',178),(1368,'Sonhan',178),(1369,'Bhagwanpur',179),(1370,'Jaitpur Kalan',179),(1371,'Kaser',179),(1372,'Mokaram',179),(1373,'Paharia',179),(1374,'Parhauti',179),(1375,'Ramgarh',179),(1376,'Saraiya',179),(1377,'Tori',179),(1378,'Amaon',180),(1379,'Badhauna',180),(1380,'Biur Manpur',180),(1381,'Chainpur',180),(1382,'Dumarkon',180),(1383,'Isiya',180),(1384,'Jagariyan',180),(1385,'Karjawn',180),(1386,'Madurna',180),(1387,'Majhui',180),(1388,'Merh',180),(1389,'Nandgaon',180),(1390,'Ramgarh',180),(1391,'Sikandarpur',180),(1392,'Sirbit',180),(1393,'Udairampur',180),(1394,'Bharari Kala',181),(1395,'Biuri',181),(1396,'Chand',181),(1397,'Chauri',181),(1398,'Dulahi',181),(1399,'Goin',181),(1400,'Kuddi',181),(1401,'Lohdan',181),(1402,'Parhi',181),(1403,'Shiwrampur',181),(1404,'Sirhira',181),(1405,'Soukhara',181),(1406,'Amaon',182),(1407,'Barkagaon',182),(1408,'Belaon',182),(1409,'Bhitaribandh',182),(1410,'Jalalpur',182),(1411,'Kharenda',182),(1412,'Kurari',182),(1413,'Pasain',182),(1414,'Sabar',182),(1415,'Akorhi',183),(1416,'Akorhi Mela',183),(1417,'Ameth',183),(1418,'Baghini',183),(1419,'Bamhaur Khas',183),(1420,'Barhupar',183),(1421,'Belauri',183),(1422,'Bharkhar',183),(1423,'Bhitti',183),(1424,'Bhokhari',183),(1425,'Dadar',183),(1426,'Dandwas',183),(1427,'Kathej',183),(1428,'Katra Kala',183),(1429,'Mujan',183),(1430,'Panapur',183),(1431,'Shahbazpur',183),(1432,'Usari',183),(1433,'Bahera',184),(1434,'Bhadaula',184),(1435,'Chilbili',184),(1436,'Deoradh Kala Khurd',184),(1437,'Derwan',184),(1438,'Ghataon',184),(1439,'Kharahna',184),(1440,'Meuda',184),(1441,'Neoras',184),(1442,'Pachpokhari',184),(1443,'Sakri',184),(1444,'Salthua',184),(1445,'Sasna',184),(1446,'Siswar',184),(1447,'Awarhiya',185),(1448,'Chehariya',185),(1449,'Chhaw',185),(1450,'Dharhar',185),(1451,'Dumari',185),(1452,'Jewari',185),(1453,'Kalyanpur',185),(1454,'Karnpura',185),(1455,'Khajura',185),(1456,'Khamidaura',185),(1457,'Kharasara',185),(1458,'Masaurha',185),(1459,'Sawath',185),(1460,'Amhara',92),(1461,'Balgudar',92),(1462,'Bilauri',92),(1463,'Damodarpur',92),(1464,'Garhi Bisun Pur',92),(1465,'Kachhiana',92),(1466,'Khagor',92),(1467,'Mahisauna',92),(1468,'Morma',92),(1469,'Sabik Pur',92),(1470,'Ajni Ghat',93),(1471,'Dumri',93),(1472,'Gangasarai',93),(1473,'Girdharpur',93),(1474,'Jaitpur',93),(1475,'Khutaha East',93),(1476,'Khutaha West',93),(1477,'Laxmipur',93),(1478,'Pali',93),(1479,'Ballopur',94),(1480,'Bhanpura',94),(1481,'Dhira',94),(1482,'Geruwa Pursanda',94),(1483,'Halsi',94),(1484,'Kaindi',94),(1485,'Mohaddinagar',94),(1486,'Pratappur',94),(1487,'Sadhmaf',94),(1488,'Shirkhandi',94),(1489,'Aure',95),(1490,'Bhabaria',95),(1491,'Billo',95),(1492,'Nand Nama',95),(1493,'Nongarh',95),(1494,'Sharma',95),(1495,'Surari Imam Nagar',95),(1496,'Tetarhat',95),(1497,'Ali Nagar',96),(1498,'Amarpur',96),(1499,'Arma',96),(1500,'Avgil Rampur',96),(1501,'Bansipur',96),(1502,'Bariyarpur',96),(1503,'Budhauli Bankar',96),(1504,'Chandan Pura',96),(1505,'Chora-rajpur',96),(1506,'Ghosaith',96),(1507,'Kaswa',96),(1508,'Kawadpur',96),(1509,'Khawa Rajpur',96),(1510,'Kiranpur',96),(1511,'Losghani',96),(1512,'Madanpur',96),(1513,'Maheshpur',96),(1514,'Mohammadpur',96),(1515,'Rampur',96),(1516,'Salempur East',96),(1517,'Shree Kishun',96),(1518,'Tajpur',96),(1519,'Toralpur',96),(1520,'Urain',96),(1521,'Mohanpur',97),(1522,'Olipur',97),(1523,'Pipariya',97),(1524,'Ramchandarpur',97),(1525,'Saidpura',97),(1526,'Jankinagar',98),(1527,'Katariya',98),(1528,'Kutlupur Diyara',98),(1529,'Mahuli',98),(1530,'Mai',98),(1531,'Mirzapur Bardah',98),(1532,'Nawagarhi North',98),(1533,'Nawagarhi South',98),(1534,'Shankarpur',98),(1535,'Shrimatpur',98),(1536,'Tarapur Diyara',98),(1537,'Tikarampur',98),(1538,'Zafarnagar',98),(1539,'Bariyarpur (north)',99),(1540,'Bariyarpur (south)',99),(1541,'Binda Diyara (jhoua Bahiyar)',99),(1542,'Binda Diyara (harinmar)',99),(1543,'Binda Diyara (kalyan Tola)',99),(1544,'Karhariya (east)',99),(1545,'Karhariya (south)',99),(1546,'Karhariya (west)',99),(1547,'Nirpur',99),(1548,'Pariya',99),(1549,'Ratanpur',99),(1550,'Amari',100),(1551,'Azimganj',100),(1552,'Bahachoki',100),(1553,'Bangalwa',100),(1554,'Dharahra Mahrana',100),(1555,'Dharahra (south)',100),(1556,'Etwa',100),(1557,'Hemjapur',100),(1558,'Mahgama',100),(1559,'Matadih',100),(1560,'Orabagicha',100),(1561,'Sarobag',100),(1562,'Shivkund',100),(1563,'Bank',101),(1564,'Etahari',101),(1565,'Indrukh (east)',101),(1566,'Indrukh (west)',101),(1567,'Parham',101),(1568,'Patam (east)',101),(1569,'Patam (west)',101),(1570,'Ramnagar',101),(1571,'Rampurkala',101),(1572,'Singhia',101),(1573,'Agrahan',102),(1574,'Bahira',102),(1575,'Baijalpur',102),(1576,'Barauhna',102),(1577,'Barui',102),(1578,'Dariyapur-1',102),(1579,'Dariyapur-2',102),(1580,'Gangta',102),(1581,'Gobadda',102),(1582,'Kaudiya',102),(1583,'Manjhgayn',102),(1584,'Murade',102),(1585,'Mudheri',102),(1586,'Naki',102),(1587,'Ramankabad East',102),(1588,'Ramankabad West',102),(1589,'Rataitha',102),(1590,'Teliadih',102),(1591,'Afjalnagar',103),(1592,'Beladih',103),(1593,'Bihma',103),(1594,'Dhobai',103),(1595,'Ganaili',103),(1596,'Khaira',103),(1597,'Launa',103),(1598,'Manikpur',103),(1599,'Parbhara',103),(1600,'Rampur-bishay',103),(1601,'Bangama',104),(1602,'Banhara',104),(1603,'Bhuna',104),(1604,'Dhauri',104),(1605,'Kesauli',104),(1606,'Nonaji',104),(1607,'Tetia',104),(1608,'Biyawani',105),(1609,'Chhabila Pur',105),(1610,'Dumrawan',105),(1611,'Hargawan',105),(1612,'Korai',105),(1613,'Meghi Ngawan',105),(1614,'Mhammadpur',105),(1615,'Muraura',105),(1616,'Pachauri',105),(1617,'Palat Pura',105),(1618,'Paroha',105),(1619,'Pawa',105),(1620,'Sakraul',105),(1621,'Sarbahdi',105),(1622,'Singthu',105),(1623,'Tetrawan',105),(1624,'Tiuri',105),(1625,'Tungi',105),(1626,'Aant',106),(1627,'Akauna',106),(1628,'Arawan',106),(1629,'Bara',106),(1630,'Ben',106),(1631,'Eksara',106),(1632,'Khaira',106),(1633,'Maijara',106),(1634,'Nohsa',106),(1635,'Amanwan',107),(1636,'Andi',107),(1637,'Dumranwan',107),(1638,'Gilani',107),(1639,'Jana',107),(1640,'Jiar',107),(1641,'Kaila',107),(1642,'Kathari',107),(1643,'Konand',107),(1644,'Mahammadpur',107),(1645,'Malti',107),(1646,'Murgia Chak',107),(1647,'Nerut',107),(1648,'Noanwan',107),(1649,'Oiyav',107),(1650,'Onda',107),(1651,'Sare',107),(1652,'Uganwan',107),(1653,'Bind',108),(1654,'Jahana',108),(1655,'Jamsari',108),(1656,'Kathrahi',108),(1657,'Lodipur',108),(1658,'Tajnipur',108),(1659,'Utarthu',108),(1660,'Amroura',109),(1661,'Araut',109),(1662,'Barhauna',109),(1663,'Belchhi',109),(1664,'Gangaura',109),(1665,'Hasni',109),(1666,'Madhopur',109),(1667,'Mahkar',109),(1668,'Narsanda',109),(1669,'Rukhai',109),(1670,'Salehpur',109),(1671,'Sirnawan',109),(1672,'Tulsigarh',109),(1673,'Amanar Khas',110),(1674,'Aungari',110),(1675,'Badrabad',110),(1676,'Dhurgaon',110),(1677,'Ekangardih',110),(1678,'Gomhar',110),(1679,'Gyas Pur',110),(1680,'Jamuawan',110),(1681,'Keshopur',110),(1682,'Kosiyawan',110),(1683,'Mandachh',110),(1684,'Naryanpur',110),(1685,'Ope',110),(1686,'Parthu',110),(1687,'Soniyawan',110),(1688,'Telhara',110),(1689,'Chorsua',111),(1690,'Gajipur',111),(1691,'Ghosrawan',111),(1692,'Puraini',111),(1693,'Pyarepur',111),(1694,'Raitar',111),(1695,'Sataua',111),(1696,'Basniyawan',112),(1697,'Brah',112),(1698,'Chero',112),(1699,'Chouriya',112),(1700,'Dihri',112),(1701,'Gonawan',112),(1702,'Kolawan',112),(1703,'Lohara',112),(1704,'Mudhari',112),(1705,'Nehusa',112),(1706,'Pachaura',112),(1707,'Pakar',112),(1708,'Powari',112),(1709,'Sartha',112),(1710,'Sudari',112),(1711,'Telmar',112),(1712,'Akabarpur',113),(1713,'Arpa',113),(1714,'Asari',113),(1715,'Bara',113),(1716,'Chiksaura',113),(1717,'Indaut',113),(1718,'Juniyar',113),(1719,'Kamta',113),(1720,'Kapasiawan',113),(1721,'Kawa',113),(1722,'Korawan',113),(1723,'Mirjapur',113),(1724,'Puna',113),(1725,'Reri',113),(1726,'Yogi Pur',113),(1727,'Aatama',114),(1728,'Bardaha',114),(1729,'Bardih',114),(1730,'Bele',114),(1731,'Beshwak',114),(1732,'Bouradih',114),(1733,'Chandhari',114),(1734,'Dhekwaha',114),(1735,'Dhobdiha',114),(1736,'Ichhous',114),(1737,'Kochara',114),(1738,'Mahmuda',114),(1739,'Mohanchak',114),(1740,'Mojaphra',114),(1741,'Panahar',114),(1742,'Panchlowa',114),(1743,'Ranipur',114),(1744,'Sakari',114),(1745,'Sanda',114),(1746,'Sudhi',114),(1747,'Berthu',115),(1748,'Diyawan',115),(1749,'Goundu Bigha',115),(1750,'Karaiparsurai',115),(1751,'Makhdumpur',115),(1752,'Makrauta',115),(1753,'Sandh',115),(1754,'Bilari',116),(1755,'Darweshpura',116),(1756,'Katauna',116),(1757,'Katri',116),(1758,'Maira Barith',116),(1759,'Ariyawan',117),(1760,'Bhuthakhar',117),(1761,'Damodarpur Baldha',117),(1762,'Goraipur',117),(1763,'Kachhiyawan',117),(1764,'Kaila',117),(1765,'Khajura',117),(1766,'Nagarnausa',117),(1767,'Rampur',117),(1768,'Ajaypur',118),(1769,'Andhna',118),(1770,'Barakhurd',118),(1771,'Barara',118),(1772,'Chandasi',118),(1773,'Charuipar',118),(1774,'Daruara',118),(1775,'Doiya',118),(1776,'Jagdishpur Tiari',118),(1777,'Mamurabad',118),(1778,'Meyar',118),(1779,'Muzaffarpur',118),(1780,'Nadiauna',118),(1781,'Nirdur',118),(1782,'Noorsarai',118),(1783,'Paparnousa',118),(1784,'Rasalpur',118),(1785,'Alawan',119),(1786,'Chausanda',119),(1787,'Mai',119),(1788,'Pilichh',119),(1789,'Shivnagar',119),(1790,'Barnousa',120),(1791,'Bhui',120),(1792,'Gorour',120),(1793,'Lodipur',120),(1794,'Meyar',120),(1795,'Nahub',120),(1796,'Nai Pokhar',120),(1797,'Pathroura',120),(1798,'Chero',121),(1799,'Dhanuki',121),(1800,'Husaina',121),(1801,'Isua',121),(1802,'Kenar',121),(1803,'Malawan',121),(1804,'Mirnagar',121),(1805,'Sasaura',121),(1806,'Barakar',122),(1807,'Dharhara',122),(1808,'Ghostawan',122),(1809,'Gorawan',122),(1810,'Gorma',122),(1811,'Kariyanna',122),(1812,'Mahuri',122),(1813,'Nanand',122),(1814,'Nirpur',122),(1815,'Pawadih',122),(1816,'Sabbait',122),(1817,'Amera',123),(1818,'Asta',123),(1819,'Chhariyari',123),(1820,'Jaitpur',123),(1821,'Kachahria',123),(1822,'Naraiyanpur',123),(1823,'Tharthari',123),(1824,'Aanti',124),(1825,'Bhadauni',124),(1826,'Bhadokhara',124),(1827,'Bhagwan Pur',124),(1828,'Dedaur',124),(1829,'Gonawa',124),(1830,'Jamuawan Patwasarai',124),(1831,'Jhunathi',124),(1832,'Kadirganj',124),(1833,'Kena',124),(1834,'Kharant',124),(1835,'Loharpura',124),(1836,'Mahuli',124),(1837,'Nonoura',124),(1838,'Oraina',124),(1839,'Paura',124),(1840,'Samai',124),(1841,'Sonsihari',124),(1842,'Baksanda',125),(1843,'Baliya Buzurg',125),(1844,'Barail',125),(1845,'Barew',125),(1846,'Bhanail Lodipur',125),(1847,'Budhuwa',125),(1848,'Faraha',125),(1849,'Fatehpur',125),(1850,'Gobind Bigha',125),(1851,'Kulana',125),(1852,'Ledaha',125),(1853,'Makhar',125),(1854,'Malikpur Nemdarganj',125),(1855,'Pachganwa',125),(1856,'Pachrukhi',125),(1857,'Paijuna',125),(1858,'Panti',125),(1859,'Parato Karhari',125),(1860,'Sakarpura',125),(1861,'Teyar',125),(1862,'Baksauti',126),(1863,'Baniya Bigha',126),(1864,'Bhawan Pur',126),(1865,'Bishun Pur',126),(1866,'Budhwara',126),(1867,'Gobindpur',126),(1868,'Madhopur',126),(1869,'Sarkanda',126),(1870,'Sughri',126),(1871,'Bagodar',127),(1872,'Chhatihar',127),(1873,'Chitarghatti',127),(1874,'Dhanwa',127),(1875,'Dona',127),(1876,'Hadsa',127),(1877,'Kaithir',127),(1878,'Pacharha',127),(1879,'Sonsa',127),(1880,'Tungi',127),(1881,'Belar',128),(1882,'Birnanwan',128),(1883,'Chandi Nawan',128),(1884,'Khakhari',128),(1885,'Rewara Jagdishpur',128),(1886,'Parwati',128),(1887,'Subhanpur',128),(1888,'Chhabail',129),(1889,'Darawan',129),(1890,'Dewangarh',129),(1891,'Kauakole',129),(1892,'Kewali',129),(1893,'Kharsari',129),(1894,'Lalpur',129),(1895,'Mahudar',129),(1896,'Manjhila',129),(1897,'Nawadih',129),(1898,'Paharpur',129),(1899,'Pali',129),(1900,'Pandey Gangaut',129),(1901,'Sarauni',129),(1902,'Sekhodewra',129),(1903,'Ankri Pandeybigha',130),(1904,'Badosar',130),(1905,'Barat',130),(1906,'Biju Bigha',130),(1907,'Bisiyait',130),(1908,'Meskaur',130),(1909,'Mirzapur',130),(1910,'Rasalpura',130),(1911,'Sahwajpur Saray',130),(1912,'Tetaria',130),(1913,'Babhnaur',131),(1914,'Jamuara',131),(1915,'Khanwan',131),(1916,'Konibar',131),(1917,'Narhat',131),(1918,'Pali Khurd',131),(1919,'Punaul',131),(1920,'Punthar',131),(1921,'Saidapur Gowasa',131),(1922,'Shekhpura',131),(1923,'Aruri',132),(1924,'Belkhunda',132),(1925,'Budhauli',132),(1926,'Datraul',132),(1927,'Dhamaul',132),(1928,'Dheodha',132),(1929,'Dhorah',132),(1930,'Dumrawan',132),(1931,'Gulni',132),(1932,'Jiuri',132),(1933,'Kabla',132),(1934,'Konandpur',132),(1935,'Pakribarawan North',132),(1936,'Pakribarawan South',132),(1937,'Poksi',132),(1938,'Ukaura',132),(1939,'Amawan East',133),(1940,'Amawan West',133),(1941,'Andharbari',133),(1942,'Bahadurpur',133),(1943,'Chitarkoli',133),(1944,'Dhamni',133),(1945,'Farka Buzurg',133),(1946,'Hardia',133),(1947,'Jogya Maran',133),(1948,'Lengura',133),(1949,'Murhaina',133),(1950,'Rajauli East',133),(1951,'Rajauli West',133),(1952,'Sabaiyatand',133),(1953,'Sirodabar',133),(1954,'Takunatand',133),(1955,'Bhatta',134),(1956,'Bhikhanpur',134),(1957,'Chhanaun',134),(1958,'Dumari',134),(1959,'Koshirukhi',134),(1960,'Kunj',134),(1961,'Madra',134),(1962,'Marui',134),(1963,'Morawan',134),(1964,'Nazardih',134),(1965,'Ohari',134),(1966,'Roh',134),(1967,'Samahrigadh',134),(1968,'Siur',134),(1969,'Abdul',135),(1970,'Akauna',135),(1971,'Bandhi',135),(1972,'Bargawn',135),(1973,'Chaubey',135),(1974,'Chaukiya',135),(1975,'Dhiraundh',135),(1976,'Ghaghat',135),(1977,'Khanpura',135),(1978,'Khatangi',135),(1979,'Laund',135),(1980,'Rajan',135),(1981,'Sanrh Majhagawan',135),(1982,'Sirdalla',135),(1983,'Upardih',135),(1984,'Apsand',136),(1985,'Baghi Bardiha',136),(1986,'Birnanwan',136),(1987,'Chakwai',136),(1988,'Dosut',136),(1989,'Hajipur',136),(1990,'Kochgawan',136),(1991,'Kutri',136),(1992,'Makanpur',136),(1993,'Manjaur',136),(1994,'Mohiuddinpur',136),(1995,'Mosama',136),(1996,'Paingari',136),(1997,'Saur',136),(1998,'Shahpur',136),(1999,'Thera',136),(2000,'Fatehpur',137),(2001,'Mahuli',137),(2002,'Marchi',137),(2003,'Nakta Diyara',137),(2004,'Punadih',137),(2005,'Sabalpur',137),(2006,'Sonawa Pur',137),(2007,'Alipur Bihta',138),(2008,'Bidhipur Narauli',138),(2009,'Champa Pur',138),(2010,'Chiraiya Rupas',138),(2011,'Doma',138),(2012,'Ghangah',138),(2013,'Ghoswari',138),(2014,'Hardaspur Diara',138),(2015,'Hidayatpur Saidpur',138),(2016,'Kala Diara',138),(2017,'Karnauti',138),(2018,'Manjhauli',138),(2019,'Missi',138),(2020,'Mogal Pura',138),(2021,'Rupas Mahaji',138),(2022,'Satbhaiya Ram Nagar',138),(2023,'Agwanpur',139),(2024,'Berhana East',139),(2025,'Berhana West',139),(2026,'Bhatgawn',139),(2027,'Dhanwan Mobarakpur',139),(2028,'Ekdanga',139),(2029,'Ibrahimpur',139),(2030,'Nadawan',139),(2031,'Navada',139),(2032,'Rahimpur Rupas',139),(2033,'Rangbigha',139),(2034,'Sarkatti Saidpur',139),(2035,'Shohari',139),(2036,'Anandpur',140),(2037,'Bela',140),(2038,'Bindaul',140),(2039,'Bishunpura',140),(2040,'Dayalpur Daulatpur',140),(2041,'Doulatpur Simri',140),(2042,'Kanchanpur Kharagpur',140),(2043,'Kateshar',140),(2044,'Kouriya',140),(2045,'Kunwa',140),(2046,'Machhalpur Lai',140),(2047,'Makhdumpur',140),(2048,'Mushepur',140),(2049,'Neora',140),(2050,'Painal',140),(2051,'Parev',140),(2052,'Purusottampur Painathi',140),(2053,'Sadisopur',140),(2054,'Sikandarpur',140),(2055,'Sri Chandpur',140),(2056,'Tara Nagar',140),(2057,'Yamunapur',140),(2058,'Akhtyarpur Manjhauli',141),(2059,'Arap',141),(2060,'Beni Bigha',141),(2061,'Birdhaur Berar Katari',141),(2062,'Brah',141),(2063,'Danara Katari',141),(2064,'Datiyana',141),(2065,'Gorkhari',141),(2066,'Haibaspur Gona',141),(2067,'Mahajpura',141),(2068,'Moriyawa Shivgadh',141),(2069,'Naghar',141),(2070,'Patut',141),(2071,'Saidabad Kanpa',141),(2072,'Sunderpur Chauthiyan',141),(2073,'Wazirpur',141),(2074,'Ganghara',142),(2075,'Hathia Kandh',142),(2076,'Hetanpur',142),(2077,'Jamaluddin',142),(2078,'Jamsaut',142),(2079,'Kasim Chak',142),(2080,'Kothawan',142),(2081,'Lakhani Bigha',142),(2082,'Manas',142),(2083,'Mobarakpur-raghurampur',142),(2084,'Patla Pur',142),(2085,'Purani Panapur',142),(2086,'Sarari',142),(2087,'Bahrampur',143),(2088,'Baribigha',143),(2089,'Barni',143),(2090,'Bijaypura',143),(2091,'Chhati',143),(2092,'Deodaha',143),(2093,'Dewan',143),(2094,'Dhanarua',143),(2095,'Gobindpur Baurhi',143),(2096,'Hulaschakbir',143),(2097,'Kosut',143),(2098,'Mai Netaul',143),(2099,'Moriyawan',143),(2100,'Nadwa',143),(2101,'Nimra',143),(2102,'Pabhera',143),(2103,'Patharhat',143),(2104,'Sanda',143),(2105,'Satparsa',143),(2106,'Sonmai',143),(2107,'Achhua Rakasiya',144),(2108,'Ainkhan Bhimnichak',144),(2109,'Bharatpura',144),(2110,'Dhana Nisarpura',144),(2111,'Kab',144),(2112,'Lala Bhadsara',144),(2113,'Narhi Pirhi',144),(2114,'Rajipur',144),(2115,'Sadaweh Dorawan',144),(2116,'Selhauri Belhauri',144),(2117,'Sihi',144),(2118,'Singhara Kopa',144),(2119,'Soniyawan',144),(2120,'Ular Sorampur',144),(2121,'Alawal Pur',145),(2122,'Bali',145),(2123,'Dumari',145),(2124,'Gauri Punda',145),(2125,'Jaita',145),(2126,'Jethuli',145),(2127,'Kolhar',145),(2128,'Mansing Pur',145),(2129,'Masadhi',145),(2130,'Mauji Pur',145),(2131,'Mohiuddin Pur',145),(2132,'Momin Pur',145),(2133,'Pitamberpur',145),(2134,'Rukun Pur',145),(2135,'Usfa',145),(2136,'Alawalpur',146),(2137,'Baikatpur',146),(2138,'Chaura',146),(2139,'Haibatpur',146),(2140,'Hardas Bigha',146),(2141,'Mosim Pur',146),(2142,'Sukarbeg Chak',146),(2143,'Baluwa',147),(2144,'Bank',147),(2145,'Biyapur',147),(2146,'Darwesh Pur North',147),(2147,'Darwesh Pur South',147),(2148,'Gyas Pur',147),(2149,'Khas Pur',147),(2150,'Kita Chauhattar East',147),(2151,'Kita Chauhattar Middle',147),(2152,'Kita Chauhattar West',147),(2153,'Madhopur',147),(2154,'Magar Pal',147),(2155,'Rampur Diyara Tauffir',147),(2156,'Sadikpur',147),(2157,'Sarai',147),(2158,'Sherpur East',147),(2159,'Sherpur West',147),(2160,'Singhara',147),(2161,'Suwarmarwah',147),(2162,'Bara',148),(2163,'Berra',148),(2164,'Bhadaura',148),(2165,'Bhagwanganj',148),(2166,'Bhaiswan',148),(2167,'Chapaur',148),(2168,'Charma',148),(2169,'Daulatpur',148),(2170,'Deoria',148),(2171,'Karay',148),(2172,'Kharant',148),(2173,'Lakhnaur-bedauli',148),(2174,'Nadaul',148),(2175,'Nishiyawan',148),(2176,'Nura',148),(2177,'Rewan',148),(2178,'Shahabad',148),(2179,'Tineri',148),(2180,'Aunta',149),(2181,'Barahpur',149),(2182,'Dariapur',149),(2183,'Hathidah Buzurg',149),(2184,'Kanhaipur',149),(2185,'Kasaha Diyara',149),(2186,'Malpur',149),(2187,'Maranchi (north)',149),(2188,'Maranchi (south)',149),(2189,'Mekra',149),(2190,'Mor (east)',149),(2191,'Mor (west)',149),(2192,'Nauranga Jalalpur',149),(2193,'Rampur Dumra',149),(2194,'Shivnar',149),(2195,'Adla',150),(2196,'Ajwan',150),(2197,'Badi Tengraila',150),(2198,'Bara',150),(2199,'Chak-chechoul',150),(2200,'Chesi',150),(2201,'Chiraura',150),(2202,'Dariyapur',150),(2203,'Dewra',150),(2204,'Faridpur',150),(2205,'Gonwan',150),(2206,'Ibrahimpur',150),(2207,'Jaitipur',150),(2208,'Jamalpura',150),(2209,'Karanja Gowai',150),(2210,'Khajuri',150),(2211,'Nawdiha',150),(2212,'Nawhi',150),(2213,'Savar Chak',150),(2214,'Ajda Sikariya',151),(2215,'Akbarpur Ranipur',151),(2216,'Bherhariya Siyarampur',151),(2217,'Chandhos',151),(2218,'Chiksi',151),(2219,'Dahiya',151),(2220,'Dharhara',151),(2221,'Jamharu Imamganj',151),(2222,'Jarkha',151),(2223,'Kalyanpur Paipura',151),(2224,'Katka Paigambarpur',151),(2225,'Khanpura Taranpur',151),(2226,'Lalganj Sehra',151),(2227,'Madhwan Makhmilpur',151),(2228,'Mahabalipur',151),(2229,'Masaudha Jalpura',151),(2230,'Mouri Piyarpura',151),(2231,'Mera Patouna',151),(2232,'Mudika',151),(2233,'Nadahari Kodahari',151),(2234,'Rampur Nagwan',151),(2235,'Ranipur Kurkuri',151),(2236,'Sarsi Pipardahan',151),(2237,'Sigodi',151),(2238,'Ajgara Bakawan',152),(2239,'Baraune Bathoi',152),(2240,'Bihari Bigha',152),(2241,'Chakjalal',152),(2242,'Dabhawan',152),(2243,'Darwe Bhadaur',152),(2244,'Dhivar',152),(2245,'Gowasa Shekhpura',152),(2246,'Khushhal Chak',152),(2247,'Kondi',152),(2248,'Lemuabad',152),(2249,'Pandarak East',152),(2250,'Pandarak West',152),(2251,'Parsawan',152),(2252,'Raili',152),(2253,'Bhusaula Danapur',153),(2254,'Chilbilli',153),(2255,'Dhiwara',153),(2256,'Gonpura',153),(2257,'Koriayawan',153),(2258,'Kurkuri',153),(2259,'Kurthoul',153),(2260,'Menpura Anda',153),(2261,'Nohsa',153),(2262,'Persa',153),(2263,'Rampur Faridpur',153),(2264,'Sakraicha',153),(2265,'Shorampur',153),(2266,'Suitha',153),(2267,'Chipura',154),(2268,'Kanauji Kachuara',154),(2269,'Kandap Taranpur',154),(2270,'Lanka Kachuara',154),(2271,'Akasi',155),(2272,'Beladhi',155),(2273,'Bhadokhara',155),(2274,'Darigaon',155),(2275,'Dhankara',155),(2276,'Dhaudarh',155),(2277,'Gansadih',155),(2278,'Karserua',155),(2279,'Karup',155),(2280,'Karwandiya',155),(2281,'Mahdi Ganj',155),(2282,'Mokar',155),(2283,'Nahauna',155),(2284,'Rampur',155),(2285,'Samardiha',155),(2286,'Sikaria',155),(2287,'Uchitpur',155),(2288,'Akorhi',156),(2289,'Bagha Khoh',156),(2290,'Balegawan',156),(2291,'Bank',156),(2292,'Bararhi',156),(2293,'Baruna',156),(2294,'Biseni Kala',156),(2295,'Chandi',156),(2296,'Muriar',156),(2297,'Pakaria',156),(2298,'Tet Rarh',156),(2299,'Ghusiya Khurd',157),(2300,'Ghusiyakala',157),(2301,'Jamori',157),(2302,'Jonhi',157),(2303,'Khaira Bhudhar',157),(2304,'Kusumhra',157),(2305,'Mani',157),(2306,'Manpur',157),(2307,'Mohini',157),(2308,'Morauna',157),(2309,'Nonhar',157),(2310,'Shiwpur',157),(2311,'Dewdihi',158),(2312,'Dihriya',158),(2313,'Fulwariya',158),(2314,'Kenar Kala',158),(2315,'Khurmabad',158),(2316,'Malhipur',158),(2317,'Naraina',158),(2318,'Narayanpur',158),(2319,'Pewandi',158),(2320,'Sadokhar',158),(2321,'Ugahani',158),(2322,'Babhnaul',159),(2323,'Dawath',159),(2324,'Dergaun',159),(2325,'Gidha',159),(2326,'Itwan',159),(2327,'Jamsona',159),(2328,'Sahi Naun',159),(2329,'Semari',159),(2330,'Usari',159),(2331,'Barawan',160),(2332,'Berkap',160),(2333,'Bhainsaha',160),(2334,'Bhaluari',160),(2335,'Chaknaha',160),(2336,'Dahaur',160),(2337,'Darihat',160),(2338,'Gangauli',160),(2339,'Jamuhar',160),(2340,'Majhiawan',160),(2341,'Mathuri',160),(2342,'Pahleza',160),(2343,'Patpura',160),(2344,'Akodha',161),(2345,'Arang',161),(2346,'Balia',161),(2347,'Bhanpur',161),(2348,'Bhara Sara',161),(2349,'Bhui',161),(2350,'Bisikala',161),(2351,'Chilhar;uwa',161),(2352,'Gunsej',161),(2353,'Haribans Pur',161),(2354,'Jam Rodh',161),(2355,'Karahansi',161),(2356,'Karanj',161),(2357,'Lilwach',161),(2358,'Maharodh',161),(2359,'Medani Pur',161),(2360,'Rajpur',161),(2361,'Saiser',161),(2362,'Samhuti',161),(2363,'Sarawan',161),(2364,'Tenuaj',161),(2365,'Amartha',162),(2366,'Amona',162),(2367,'Baradih',162),(2368,'Bensagar',162),(2369,'Burhawal',162),(2370,'Chiksil',162),(2371,'Danwar',162),(2372,'Deo',162),(2373,'Dhanhara',162),(2374,'Gamhariya',162),(2375,'Jai Shree',162),(2376,'Karakat',162),(2377,'Manik Parasi',162),(2378,'Kirhi',162),(2379,'Motha',162),(2380,'Munji',162),(2381,'Sakla',162),(2382,'Sikaria',162),(2383,'Sonbarsa',162),(2384,'Agarsi Dihra',163),(2385,'Balathari',163),(2386,'Chitawn',163),(2387,'Chittaini',163),(2388,'Gara',163),(2389,'Kanjar',163),(2390,'Kapasiya',163),(2391,'Kathrai',163),(2392,'Kuchhila',163),(2393,'Laheri',163),(2394,'Narwar',163),(2395,'Nauwan',163),(2396,'Redia',163),(2397,'Saraya',163),(2398,'Amiawar',164),(2399,'Atimi',164),(2400,'Dehari',164),(2401,'Dhanaw',164),(2402,'Itimha',164),(2403,'Kaithi',164),(2404,'Khiriyanw',164),(2405,'Mangrawan',164),(2406,'Parasiya',164),(2407,'Paruri',164),(2408,'Pawani',164),(2409,'Pokharaha',164),(2410,'Bhadara',165),(2411,'Daranagar',165),(2412,'Jadunath Pur',165),(2413,'Jayantipur',165),(2414,'Nauhatta',165),(2415,'Pipardih',165),(2416,'Shahpur',165),(2417,'Tilokhar',165),(2418,'Tiura',165),(2419,'Tiyra Khurd',165),(2420,'Ulli Banahi',165),(2421,'Chanki',166),(2422,'Chhatauna',166),(2423,'Dakshini Baraon',166),(2424,'Dharmpura',166),(2425,'Hathini',166),(2426,'Kadwan',166),(2427,'Kuri',166),(2428,'Moudihan',166),(2429,'Nonsari',166),(2430,'Shrikhinda',166),(2431,'Sisirita',166),(2432,'Sotwa',166),(2433,'Uttari Baraon',166),(2434,'Barawn',167),(2435,'Barna',167),(2436,'Magarwalia',167),(2437,'Parariya',167),(2438,'Rajandih',167),(2439,'Rajpur',167),(2440,'Rotwan',167),(2441,'Shiyawak',167),(2442,'Baknaura',168),(2443,'Banjari',168),(2444,'Nawadih',168),(2445,'Rasul Pur',168),(2446,'Rohtas Garh',168),(2447,'Samohta',168),(2448,'Telcup',168),(2449,'Tumba',168),(2450,'Amaithi',169),(2451,'Chandi English',169),(2452,'Karmaini',169),(2453,'Manjhauli',169),(2454,'Sanjhauli',169),(2455,'Udai Pur',169),(2456,'Bhadokhra',170),(2457,'Chandanpura',170),(2458,'Chitauli',170),(2459,'Hurka',170),(2460,'Indrapuri',170),(2461,'Kerpa',170),(2462,'Ramdihra',170),(2463,'Saraiya',170),(2464,'Sewahi',170),(2465,'Tilouthu East',170),(2466,'Tilouthu West',170),(2467,'Audhey',171),(2468,'Gagari',171),(2469,'Gaway',171),(2470,'Hathiyawan',171),(2471,'Kaithwan',171),(2472,'Kare',171),(2473,'Katari',171),(2474,'Kosra',171),(2475,'Kusumbha',171),(2476,'Lodipur',171),(2477,'Mahsar',171),(2478,'Mehuns',171),(2479,'Pachna',171),(2480,'Pain',171),(2481,'Puraina',171),(2482,'Aifni',172),(2483,'Biman',172),(2484,'Chodhdargah',172),(2485,'Chorvar',172),(2486,'Diha',172),(2487,'Hazratpur Madro',172),(2488,'Husainabad',172),(2489,'Kasar',172),(2490,'Sanaiya',172),(2491,'Varuna',172),(2492,'Jagdishpur',173),(2493,'Kewti',173),(2494,'Kutaut',173),(2495,'Maldah',173),(2496,'Pank',173),(2497,'Pinjri',173),(2498,'Samas Bujurg',173),(2499,'Sarba',173),(2500,'Teus',173),(2501,'Chakandra',174),(2502,'Chhathiyara',174),(2503,'Ekrama',174),(2504,'Lahna',174),(2505,'Lohan',174),(2506,'Siyani',174),(2507,'Bhadausi',175),(2508,'Dihkusumbha',175),(2509,'Gagaur',175),(2510,'Mapho',175),(2511,'Panapur',175),(2512,'Ambari',176),(2513,'Belaw',176),(2514,'Mohabbatpur',176),(2515,'Onama',176),(2516,'Panchi',176);
/*!40000 ALTER TABLE `panchayat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'JEE'),(2,'MI'),(3,'AEE'),(4,'Consumer');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sub_division_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_division_id` (`sub_division_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`sub_division_id`) REFERENCES `sub_division` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'Arwal',1),(2,'Kaler',1),(3,'Atuallah',1),(4,'Kurtha',1),(5,'Banshi',1);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_division`
--

DROP TABLE IF EXISTS `sub_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_division` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `division_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `division_id` (`division_id`),
  CONSTRAINT `sub_division_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_division`
--

LOCK TABLES `sub_division` WRITE;
/*!40000 ALTER TABLE `sub_division` DISABLE KEYS */;
INSERT INTO `sub_division` VALUES (1,'Arwal',2),(2,'Aurangabad',2),(3,'Daudnagar',2),(4,'Gaya Sadar',2),(5,'Neemchak Bathani',2),(6,'Sherghati',2),(7,'Tekari',2),(8,'Jehanabad',2),(9,'Nawada',2),(10,'Rajauli',2),(11,'Banka',1),(12,'Bhagalpur',1),(13,'Kahlgaon',1),(14,'Naugachhia',1),(15,'Jamui',3),(16,'Lakhisarai',3),(17,'Haveli',3),(18,'Kharagpur',3),(19,'Munger',3),(20,'Tarapur',3),(21,'Sheikhpura',3),(22,'Bhabhua',4),(23,'Mohania',4),(24,'Biharsharif',4),(25,'Rajgir',4),(26,'Hilsa',4),(27,'Buxar',4),(28,'Dumraon',4),(29,'Barh',4),(30,'Danapur',4),(31,'Masaurhi',4),(32,'Paliganj',4),(33,'Patna Sadar',4),(34,'Sasaram',4),(35,'Bikramganj',4),(36,'Dehri',4);
/*!40000 ALTER TABLE `sub_division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone_no` (`phone_no`),
  KEY `fk_role` (`role_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('AEE001','AEE','9876543203','aee123',3),('CNS25713B','John Doe','7050913685','doedoe789',4),('CNSA1B33C','Yasrab','9603540582','yasrab123',4),('JEE001','JEE','9876543201','jee123',1),('JEE002','Amit','9876543210','amit123',1),('MI001','MI','9876543202','mi123',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `village_ward`
--

DROP TABLE IF EXISTS `village_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `village_ward` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `panchayat_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `panchayat_id` (`panchayat_id`),
  KEY `fk_section` (`section_id`),
  CONSTRAINT `fk_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  CONSTRAINT `village_ward_ibfk_1` FOREIGN KEY (`panchayat_id`) REFERENCES `panchayat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `village_ward`
--

LOCK TABLES `village_ward` WRITE;
/*!40000 ALTER TABLE `village_ward` DISABLE KEYS */;
INSERT INTO `village_ward` VALUES (1,'Abgila',1,1),(2,'Goura',1,1),(3,'Itawa',1,1),(4,'Rajpur Bishunpur',1,1),(5,'Haibatpur',1,1),(6,'Mohammadpurgahna',2,1),(7,'Kansupur',2,1),(8,'Pipra Bangla',2,1),(9,'Hasanpur Pipra',2,1),(10,'Bania Bigha',2,1),(11,'Amra',2,1),(12,'Bhusura',3,1),(13,'Saifabad',4,1),(14,'Bhadasi',4,1),(15,'Jalpura',4,1),(16,'Pheku Bigha',4,1),(17,'Chiraia Tanr',5,1),(18,'Gaddopur',5,1),(19,'Madanpur Dhawa',5,1),(20,'Makbulpur Raja',5,1),(21,'Bhermpur Khapura',5,1),(22,'Rampur',5,1),(23,'Fakharpur',5,1),(24,'Dhoraha',5,1),(25,'Khamhaini',6,1),(26,'Harna',6,1),(27,'Yakubpur',6,1),(28,'Nasirpur Sarwar',6,1),(29,'Bichlagawan',7,1),(30,'Sumera',7,1),(31,'Chakia',7,1),(32,'Parasi',7,1),(33,'Dangra Ahar',8,1),(34,'Piare Chak',8,1),(35,'Darwesh Pura',8,1),(36,'Sarwan',8,1),(37,'Bazidpur',8,1),(38,'Rampur Waina',9,1),(39,'Fatehpur Saurha',9,1),(40,'Saidpur',9,1),(41,'Bahadurpur',9,1),(42,'Konika',10,1),(43,'Sakri',10,1),(44,'Sonbarsa Makbulpur Alauddin',10,1),(45,'Madan Singhka Bigha',10,1),(46,'Sonbarsa',10,1),(47,'Aslampur Dullah',10,1),(48,'Sarauti',11,1),(49,'Ranapur',11,1),(50,'Rampur Chauram',11,1),(51,'Koriam',12,1),(52,'Bara',12,1),(53,'Satpura',12,1),(54,'Sonbarsa',12,1),(55,'Nawada',13,2),(56,'Belawan',13,2),(57,'Sarwarpur',14,2),(58,'Durgapur',14,2),(59,'Rajpura',14,2),(60,'Belsar',14,2),(61,'Chauki',14,2),(62,'Injor',15,2),(63,'Shahbajpur Dhawai',15,2),(64,'Khaira',15,2),(65,'Goind',15,2),(66,'Kalandara',15,2),(67,'Rupaich',15,2),(68,'Niranjanpur',16,2),(69,'Khushdihra',16,2),(70,'Jamuhari',16,2),(71,'Ismailpur Koil',16,2),(72,'Turkharsa',16,2),(73,'Koilbhupat',16,2),(74,'Koni',17,2),(75,'Jaipur',17,2),(76,'Simbhua',17,2),(77,'Bakhtar',17,2),(78,'Parasrampur',18,2),(79,'Bath',18,2),(80,'Kamta',18,2),(81,'Lodipur',19,2),(82,'Musepur',19,2),(83,'Mainpura',19,2),(84,'Upadhea Bigha',19,2),(85,'Kathrain',19,2),(86,'Wojha Bigha',19,2),(87,'	Agnur ',20,2),(88,'Mehdiyabad',21,2),(89,'Pahleja',21,2),(90,'Fatehabad',21,2),(91,'Masadpur',22,2),(92,'Bhagwanpur',22,2),(93,'Sohsa',22,2),(94,'Kharsa',22,2),(95,'Kaler',23,2),(96,'Kaler',23,2),(97,'Pasrampur',24,2),(98,'Hirdai Chak',24,2),(99,'Teri',24,2),(100,'Hardia',25,2),(101,'Maraila',25,2),(102,'Usri',25,2),(103,'Maneri Bigha',25,2),(104,'Ballopur',26,2),(105,'Makhmulpur',26,2),(106,'Sikandarpur Dhawai',26,2),(107,'Bhikhanpur Dhawai',26,2),(108,'Daulatpur Dhawai',26,2),(109,'Walidad',26,2),(110,'Mahrauli',26,2),(111,'Tawakala',27,2),(112,'Gorkatta',27,2),(113,'Sakri',27,2),(114,'Chauki',27,2),(115,'Masuda',27,2),(116,'Dariyapur',28,3),(117,'Inglish Gulab Singh',28,3),(118,'Patak Chak',28,3),(119,'Aiyara',28,3),(120,'Laraua',28,3),(121,'Kasauti',29,3),(122,'Abgila',29,3),(123,'Bambhai',29,3),(124,'Shekhpura',30,3),(125,'Belkharakhas',30,3),(126,'Chauhar',31,3),(127,'Chauhar Chak',31,3),(128,'Kudrasi',31,3),(129,'Pakri',31,3),(130,'Bazidpur',31,3),(131,'Kutubpur Tera',32,3),(132,'Durra',32,3),(133,'Bara Nathu',32,3),(134,'Rasulpur Tetara',32,3),(135,'Karpi ',33,3),(136,'Keal',34,3),(137,'Kinjar',35,3),(138,'Sohsa',35,3),(139,'Karehri',35,3),(140,'Khojan',35,3),(141,'Nagla',35,3),(142,'Murarhi',36,3),(143,'Mahasi Chak',36,3),(144,'Samanpur Baddo',36,3),(145,'Bara',36,3),(146,'Jhikatia',36,3),(147,'Salarpur',36,3),(148,'Manirampur',36,3),(149,'Bhagwatipur',36,3),(150,'Milki',36,3),(151,'Nagawan',37,3),(152,'Tekari',37,3),(153,'Jhunathi',37,3),(154,'Hajipur',37,3),(155,'Rasulpur Pariyari',37,3),(156,'Salempur',37,3),(157,'Belkhari Chak',38,3),(158,'Nadi Khurd',38,3),(159,'Belkari',38,3),(160,'Narga',38,3),(161,'Kusre',38,3),(162,'Hajipur',38,3),(163,'Mahmadpur Bara',39,3),(164,'Gainari',39,3),(165,'Majidpur',39,3),(166,'Mahmadpura',39,3),(167,'Pariyari',39,3),(168,'Mirzapur',39,3),(169,'Kanaia Chak',39,3),(170,'Purainia Ruknuddin',40,3),(171,'Purainia Shekha',40,3),(172,'Latifpur Paraha',40,3),(173,'Lodipur',40,3),(174,'Masudpur Bara',40,3),(175,'Katesar',41,3),(176,'Puran',41,3),(177,'Jonha',41,3),(178,'Baghra',41,3),(179,'Piraho',42,3),(180,'Rampurchae',42,3),(181,'Khalslpura',43,3),(182,'Kohraul',43,3),(183,'Baroha',43,3),(184,'Bazidpur Karwa',43,3),(185,'Mahpur Bara',43,3),(186,'Rohai',43,3),(187,'Manjhupur',43,3),(188,'Bakhtari',43,3),(189,'Shahar Telpa',44,3),(190,'Khajuri',45,3),(191,'Sarmastpur Newana',45,3),(192,'Karwahankar',45,3),(193,'Ghazipur',45,3),(194,'Pachkesar',45,3),(195,'Makbulpur Angari',46,3),(196,'Angari',46,3),(197,'Angarichak',46,3),(198,'Kochahsa',46,3),(199,'Bazidpur',46,3),(200,'Alawalpur',47,4),(201,'Utranwan',47,4),(202,'Basatpur',47,4),(203,'Ahmadpur Harna',47,4),(204,'Jagdispur',47,4),(205,'Shahopur',47,4),(206,'Lari',47,4),(207,'Makhdumpur',48,4),(208,'Sura',48,4),(209,'Kubri',48,4),(210,'Bara',48,4),(211,'Benipur',48,4),(212,'Khaira',49,4),(213,'Helalpur',49,4),(214,'Ibrahimpur',49,4),(215,'Qamariya Chak',49,4),(216,'Qamariya',49,4),(217,'Dakra',49,4),(218,'Kimdar Chak',49,4),(219,'Narhi',49,4),(220,'Musarhi',50,4),(221,'Madarpur',50,4),(222,'Painathi',50,4),(223,'Dhondar',50,4),(224,'Alawalpur',50,4),(225,'Saidpur',50,4),(226,'Kod Marai',50,4),(227,'Jogiyanala',50,4),(228,'Molna Chak',50,4),(229,'Darheta',50,4),(230,'Manikpur',51,4),(231,'Pirhi',51,4),(232,'Bishunpur',51,4),(233,'Rajepur',51,4),(234,'Koni',51,4),(235,'Gokhulpur',52,4),(236,'Belbhadarpur',52,4),(237,'Harpur',52,4),(238,'Nadaura',52,4),(239,'Salehpur',52,4),(240,'Semuara',52,4),(241,'Shahbazpur',52,4),(242,'Barahiya',52,4),(243,'Baid Bigha',52,4),(244,'Tali',52,4),(245,'Bahbalpur',52,4),(246,'Milki',52,4),(247,'Mahmadpur',52,4),(248,'Salempur',52,4),(249,'Lodipur',53,4),(250,'Chhatoi',53,4),(251,'Nighwan',53,4),(252,'Motipur',54,4),(253,'Gangea',54,4),(254,'Pinjranwan',54,4),(255,'Manikpur',54,4),(256,'Kurkuri',54,4),(257,'Mohibullah Chak',54,4),(258,'Kothiya',54,4),(259,'Molha Chak',55,4),(260,'Partappur',55,4),(261,'Gangapur',55,4),(262,'Phulsathar',55,4),(263,'Sachai',55,4),(264,'Sikaria',55,4),(265,'Nezampur',55,4),(266,'Dharnai',56,5),(267,'Gangapur',56,5),(268,'Anuan',56,5),(269,'Bhagwatipur',56,5),(270,'Sarfar Pur',56,5),(271,'Rampur',56,5),(272,'Doniala',56,5),(273,'Rainath',56,5),(274,'Belaura',57,5),(275,'Saidrampur',57,5),(276,'Koni',57,5),(277,'Sonari',57,5),(278,'Kurmanwan',57,5),(279,'Chand Bigha',58,5),(280,'Chamardih',58,5),(281,'Dharampur',58,5),(282,'Gobindpur',58,5),(283,'Pondil',58,5),(284,'Kutubpur',58,5),(285,'Barahia',58,5),(286,'Bithra',58,5),(287,'Paharpur',59,5),(288,'Kharasin',59,5),(289,'Akranga',59,5),(290,'Akraunja Chak',59,5),(291,'Zindapur',59,5),(292,'Gonpura',60,5),(293,'Majhiawan',60,5),(294,'Dewa Bigha',60,5),(295,'Mobarakpur',60,5),(296,'Khatangi',60,5),(297,'Turuk Telpa',61,5),(298,'Mali',61,5),(299,'Sarbali',62,5),(300,'Daudpur',62,5),(301,'Makhmilpur',62,5),(302,'Sherpur',62,5),(303,'Karwa Balram',62,5),(304,'Gangapur',62,5),(305,'Moglapur',63,5),(306,'Sadipur',63,5),(307,'Sonbhadar',63,5),(308,'Ghazipur',63,5),(309,'Bansi Surajpur',63,5),(310,'Wor Bigha',63,5),(311,'Inguna',64,5),(312,'Tetaria',64,5),(313,'Kusi',64,5),(314,'Parsa',64,5),(315,'Morauli',64,5),(316,'Dhobaul',64,5),(317,'Jarma Khap',64,5),(318,'Bela',64,5),(319,'Bisrampur',64,5),(320,'Tendua',64,5);
/*!40000 ALTER TABLE `village_ward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-05 19:42:07
