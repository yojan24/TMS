-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tms
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `job_no` int unsigned NOT NULL,
  `entry_date` varchar(15) NOT NULL,
  `dock_charges` int NOT NULL,
  `crane_charges` int NOT NULL,
  `dock_exam` int NOT NULL,
  `steamer_agent` int NOT NULL,
  `good_charges` int NOT NULL,
  `unload_charges` int NOT NULL,
  `liftoff_charges` int NOT NULL,
  `agency_charges` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`job_no`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`job_no`) REFERENCES `requiremenrt` (`job_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,'2021-12-13',1234,3214,6547,7894,12345,123,325,12500,50000),(2,'2021-10-14',1236,3256,1502,1000,3256,350,350,12000,50000);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_list`
--

DROP TABLE IF EXISTS `broker_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broker_list` (
  `Agent_Name` varchar(20) NOT NULL,
  `Agent_Address` varchar(50) DEFAULT NULL,
  `Agent_Contact` int NOT NULL,
  `Agent_Since` date DEFAULT NULL,
  `Agent_Rating` int DEFAULT NULL,
  `Agent_Email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Agent_Name`),
  UNIQUE KEY `Broker_Email_UNIQUE` (`Agent_Email`),
  UNIQUE KEY `Broker_Contact_UNIQUE` (`Agent_Contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_list`
--

LOCK TABLES `broker_list` WRITE;
/*!40000 ALTER TABLE `broker_list` DISABLE KEYS */;
INSERT INTO `broker_list` VALUES ('abc logistics','abc',1234567890,'1990-01-01',5,'abc@gmail.com'),('bcd logistics','bcd',1231231235,'1990-02-05',5,'bcd@gmail.com'),('cde','cde',789456123,'1922-06-23',4,'cde@gmail.com'),('def','def',789545612,'2001-02-25',2,'def@gmail.com'),('efg','efg',1597534565,'2002-05-15',3,'efg@gmail.com'),('fgh','fgh',500045654,'2005-05-06',1,'fgh@gmail.com'),('ghi','ghi',456789123,'2003-05-08',1,'ghi@gmail.com'),('hij','hij',1789456123,'2010-09-15',1,'hij@gmail.com'),('xyz','xyz',1594561237,'1990-12-12',NULL,'xyz@gmail.com');
/*!40000 ALTER TABLE `broker_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_agency`
--

DROP TABLE IF EXISTS `list_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_agency` (
  `Agent_Name` varchar(50) DEFAULT NULL,
  `Agent_Address` varchar(50) DEFAULT NULL,
  `Agent_Contact` int DEFAULT NULL,
  `Agent_Since` varchar(40) DEFAULT NULL,
  `Agent_Rating` varchar(10) DEFAULT NULL,
  `Agent_Email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_agency`
--

LOCK TABLES `list_agency` WRITE;
/*!40000 ALTER TABLE `list_agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `list_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_order`
--

DROP TABLE IF EXISTS `place_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_order` (
  `user_name` varchar(20) DEFAULT NULL,
  `broker_name` varchar(20) DEFAULT NULL,
  `package_type` varchar(10) DEFAULT NULL,
  `pacakage_weight` int DEFAULT NULL,
  `pickup_add` varchar(50) DEFAULT NULL,
  `drop_add` varchar(50) DEFAULT NULL,
  `route` varchar(20) DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  KEY `place_order_ibfk_1` (`user_name`),
  KEY `place_order_ibfk_2` (`broker_name`),
  CONSTRAINT `place_order_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `signup` (`user_name`),
  CONSTRAINT `place_order_ibfk_2` FOREIGN KEY (`broker_name`) REFERENCES `broker_list` (`Agent_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_order`
--

LOCK TABLES `place_order` WRITE;
/*!40000 ALTER TABLE `place_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requiremenrt`
--

DROP TABLE IF EXISTS `requiremenrt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requiremenrt` (
  `job_no` int unsigned NOT NULL,
  `c_name` varchar(20) DEFAULT NULL,
  `cont` int DEFAULT NULL,
  `pr_type` varchar(20) DEFAULT NULL,
  `pack_type` varchar(20) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `ac_weight` int NOT NULL,
  `unit` varchar(10) NOT NULL,
  `gr_weight` int NOT NULL,
  `unit1` varchar(45) NOT NULL,
  `arr_date` varchar(20) DEFAULT NULL,
  `pickup_add` varchar(100) DEFAULT NULL,
  `del_add` varchar(100) DEFAULT NULL,
  `route` varchar(20) DEFAULT NULL,
  `v_c_name` varchar(50) DEFAULT NULL,
  `v_no` varchar(50) DEFAULT NULL,
  `v_type` varchar(50) DEFAULT NULL,
  `truck_dim` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`job_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requiremenrt`
--

LOCK TABLES `requiremenrt` WRITE;
/*!40000 ALTER TABLE `requiremenrt` DISABLE KEYS */;
INSERT INTO `requiremenrt` VALUES (1,'g',563,'Toys','sdfg',45,45,'',45,'','2021-05-05','ererg','erge','egrg','reg','12','Closed Body Truck','125'),(2,'xyz',987456,'Toys','box',320,25,'',220,'','2021-02-12','shbcudb chjb dc','d s hfdhjbdhsdn','dsh h','ert','mh-09 bh-8976','Heavy Open Body Truck','45-67-90'),(3,'wer',1230456,'Toys','box',123,1236,'Tons',5555,'Tons','2021-12-23','sfdvfedvd','cdsv c','csdc','sdv','sdvs','Heavy Open Body Truck','21x22x30'),(23,'tyup',98745632,'Machine','open',2,120,'Kg',120,'Kg','2021-12-30','2323232hbgcfrxedzwszwsz','hfc trjfxrc ghj hj bujibnhgc ffgc hbbbb','rtdrjc ','poiuy','MH-03 BH-9087','Heavy Open Body Truck','20L X 15W X 10H');
/*!40000 ALTER TABLE `requiremenrt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signup` (
  `user_name` varchar(40) NOT NULL,
  `user_pass` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup`
--

LOCK TABLES `signup` WRITE;
/*!40000 ALTER TABLE `signup` DISABLE KEYS */;
INSERT INTO `signup` VALUES ('12','[C@2278e404','yojan','paka'),('yojan','yojan123','Yojan','Pawade'),('yojans','password','yojan','pawade');
/*!40000 ALTER TABLE `signup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-21 15:19:25
