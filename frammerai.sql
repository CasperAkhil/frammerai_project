-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: frammerai
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

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
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (18,'Aarav Sharma','aarav.sharma@gmail.com','9876543210','2024-11-21 10:29:56'),(19,'Vivaan Verma','vivaan.verma@yahoo.com','9123456789','2024-11-21 10:29:56'),(20,'Aditya Patel','aditya.patel@rediffmail.com','9876123456','2024-11-21 10:29:56'),(21,'Krishna Gupta','krishna.gupta@outlook.com','9876541234','2024-11-21 10:29:56'),(22,'Ishaan Singh','ishaan.singh@india.com','9765432189','2024-11-21 10:29:56'),(23,'Diya Reddy','diya.reddy@gmail.com','9876549876','2024-11-21 10:29:56'),(24,'Ananya Kumar','ananya.kumar@yahoo.com','9876012345','2024-11-21 10:29:56'),(25,'Aarohi Chopra','aarohi.chopra@rediffmail.com','9987654321','2024-11-21 10:29:56'),(26,'Meera Joshi','meera.joshi@outlook.com','9765432901','2024-11-21 10:29:56'),(27,'Saanvi Mehta','saanvi.mehta@india.com','9876543102','2024-11-21 10:29:56'),(28,'Rahul Mishra','rahul.mishra@gmail.com','9876123904','2024-11-21 10:29:56'),(29,'Rajesh Das','rajesh.das@yahoo.com','9876102348','2024-11-21 10:29:56'),(30,'Kiran Nair','kiran.nair@rediffmail.com','9123456780','2024-11-21 10:29:56'),(31,'Priya Iyer','priya.iyer@outlook.com','9876023490','2024-11-21 10:29:56'),(32,'Sneha Pandey','sneha.pandey@india.com','9876549870','2024-11-21 10:29:56'),(33,'Aarav Patel','aarav.patel@gmail.com','9765432108','2024-11-21 10:29:56'),(34,'Vivaan Singh','vivaan.singh@yahoo.com','9876541098','2024-11-21 10:29:56'),(35,'Aditya Reddy','aditya.reddy@rediffmail.com','9123456782','2024-11-21 10:29:56'),(36,'Krishna Kumar','krishna.kumar@outlook.com','9876123045','2024-11-21 10:29:56'),(37,'Ishaan Chopra','ishaan.chopra@india.com','9876541203','2024-11-21 10:29:56'),(38,'Diya Joshi','diya.joshi@gmail.com','9876541987','2024-11-21 10:29:56'),(39,'Ananya Mehta','ananya.mehta@yahoo.com','9876109876','2024-11-21 10:29:56'),(40,'Aarohi Mishra','aarohi.mishra@rediffmail.com','9876023498','2024-11-21 10:29:56'),(41,'Meera Das','meera.das@outlook.com','9876543120','2024-11-21 10:29:56'),(42,'Saanvi Nair','saanvi.nair@india.com','9876542098','2024-11-21 10:29:56'),(43,'Rahul Iyer','rahul.iyer@gmail.com','9123456781','2024-11-21 10:29:56'),(44,'Rajesh Pandey','rajesh.pandey@yahoo.com','9876123048','2024-11-21 10:29:56'),(45,'Kiran Sharma','kiran.sharma@rediffmail.com','9876102987','2024-11-21 10:29:56'),(46,'Priya Verma','priya.verma@outlook.com','9876543198','2024-11-21 10:29:56'),(47,'Sneha Patel','sneha.patel@india.com','9876541089','2024-11-21 10:29:56'),(48,'Aarav Gupta','aarav.gupta@gmail.com','9876123049','2024-11-21 10:29:56'),(49,'Vivaan Mehta','vivaan.mehta@yahoo.com','9876541023','2024-11-21 10:29:56'),(50,'Aditya Joshi','aditya.joshi@rediffmail.com','9876123098','2024-11-21 10:29:56'),(51,'Krishna Iyer','krishna.iyer@outlook.com','9876543129','2024-11-21 10:29:56'),(52,'Ishaan Das','ishaan.das@india.com','9876540987','2024-11-21 10:29:56'),(53,'Diya Nair','diya.nair@gmail.com','9123456701','2024-11-21 10:29:56'),(54,'Ananya Pandey','ananya.pandey@yahoo.com','9876102938','2024-11-21 10:29:56'),(55,'Aarohi Sharma','aarohi.sharma@rediffmail.com','9876541029','2024-11-21 10:29:56'),(56,'Meera Verma','meera.verma@outlook.com','9876543087','2024-11-21 10:29:56'),(57,'Saanvi Patel','saanvi.patel@india.com','9876123097','2024-11-21 10:29:56'),(58,'Rahul Gupta','rahul.gupta@gmail.com','9876541208','2024-11-21 10:29:56'),(59,'Rajesh Mehta','rajesh.mehta@yahoo.com','9123456710','2024-11-21 10:29:56'),(60,'Kiran Mishra','kiran.mishra@rediffmail.com','9876541090','2024-11-21 10:29:56'),(61,'Priya Das','priya.das@outlook.com','9876541290','2024-11-21 10:29:56'),(62,'Sneha Nair','sneha.nair@india.com','9876123090','2024-11-21 10:29:56'),(63,'Aarav Iyer','aarav.iyer@gmail.com','9876541980','2024-11-21 10:29:56'),(64,'Vivaan Pandey','vivaan.pandey@yahoo.com','9876102909','2024-11-21 10:29:56'),(65,'Aditya Sharma','aditya.sharma@rediffmail.com','9876541098','2024-11-21 10:29:56'),(66,'Krishna Verma','krishna.verma@outlook.com','9876541989','2024-11-21 10:29:56');
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-21 16:30:57
