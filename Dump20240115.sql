-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sales
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` varchar(50) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `order_count` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('02-1137231','Andie','Dampit',6),('15-0555193','Sutherlan','Dongshangguan',4),('17-9826606','Cybill','Huaibei',6),('23-0581020','Stephine','Bandera',9),('29-0813345','Jock','Frederiksberg',5),('31-7775741','Meredithe','Fengjiang',8),('36-4985773','Ginevra','Pajapita',1),('40-2510020','Stacey','Baisha',1),('41-5178437','Drucy','Trelleborg',3),('52-3535014','Izaak','Mugumu',5),('53-0525345','Reggie','Timóteo',2),('54-2364648','Lesya','Khorostkiv',4),('61-9760745','Frankie','Okuta',3),('66-1570441','Riobard','Clones',7),('71-4595008','Yettie','Mora',10),('71-7937313','Rodge','Stockholm',10),('72-1705612','Jillian','Luhansk',5),('72-9932424','Christie','Surulangun Rawas',6),('74-0511441','Osgood','Dobřany',8),('75-3153045','Lira','Tongliao',9),('77-7174697','Janka','Junyang',8),('84-5692031','Brenden','Sabanalarga',5),('90-7608988','Thor','As Suqaylibīyah',1),('94-7031101','Andie','Baitu',9),('95-8839983','Pippy','Sayama',2);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expired_products`
--

DROP TABLE IF EXISTS `expired_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expired_products` (
  `product_id` int NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expired_products`
--

LOCK TABLES `expired_products` WRITE;
/*!40000 ALTER TABLE `expired_products` DISABLE KEYS */;
INSERT INTO `expired_products` VALUES (1,'Sugar - Brown','2022-10-31'),(2,'Tea - Herbal I Love Lemon','2022-05-04'),(3,'Cloves - Ground','2023-03-26'),(4,'Trout - Rainbow, Frozen','2021-07-06'),(5,'Lychee','2021-12-14'),(6,'Yogurt - Strawberry, 175 Gr','2021-02-05'),(7,'Dates','2021-03-15'),(8,'Potatoes - Fingerling 4 Oz','2023-08-18'),(9,'Pork - Sausage, Medium','2023-06-08'),(10,'Chicken Giblets','2022-01-16');
/*!40000 ALTER TABLE `expired_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,3),(2,2,8),(3,3,8),(4,4,1),(5,5,8),(6,6,8),(7,7,1),(8,8,6),(9,9,8),(10,10,6),(11,1,10),(12,2,10),(13,3,10),(14,4,1),(15,5,9),(16,6,10),(17,7,7),(18,8,1),(19,9,6),(20,10,1),(21,1,9),(22,3,5),(23,4,6),(24,5,2),(25,10,3);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-01-17','61-9760745'),(2,'2021-09-07','52-3535014'),(3,'2022-02-16','02-1137231'),(4,'2023-07-04','84-5692031'),(5,'2021-07-25','54-2364648'),(6,'2022-02-22','95-8839983'),(7,'2022-07-30','40-2510020'),(8,'2021-11-26','36-4985773'),(9,'2023-11-25','90-7608988'),(10,'2023-03-05','71-4595008'),(11,'2021-06-04','71-7937313'),(12,'2023-02-14','77-7174697'),(13,'2021-08-01','15-0555193'),(14,'2021-05-14','31-7775741'),(15,'2023-01-23','41-5178437'),(16,'2021-05-28','17-9826606'),(17,'2023-04-10','72-9932424'),(18,'2021-05-26','72-1705612'),(19,'2021-04-04','75-3153045'),(20,'2021-12-18','94-7031101'),(21,'2021-05-23','53-0525345'),(22,'2023-04-07','66-1570441'),(23,'2021-12-03','23-0581020'),(24,'2023-02-13','29-0813345'),(25,'2021-11-30','74-0511441');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'maestro',40,1),(2,'jcb',57,2),(3,'diners-club-enroute',73,3),(4,'jcb',30,4),(5,'china-unionpay',67,5),(6,'visa-electron',78,6),(7,'jcb',47,7),(8,'jcb',16,8),(9,'diners-club-carte-blanche',89,9),(10,'visa',32,10),(11,'jcb',16,11),(12,'diners-club-enroute',21,12),(13,'jcb',28,13),(14,'mastercard',51,14),(15,'visa',47,15),(16,'diners-club-enroute',44,16),(17,'jcb',24,17),(18,'mastercard',35,18),(19,'jcb',30,19),(20,'china-unionpay',85,20),(21,'visa-electron',37,21),(22,'solo',67,22),(23,'mastercard',45,23),(24,'jcb',18,24),(25,'jcb',68,25);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Sugar - Brown',66.52),(2,'Tea - Herbal I Love Lemon',10.73),(3,'Cloves - Ground',56.41),(4,'Trout - Rainbow, Frozen',54.27),(5,'Lychee',54.62),(6,'Yogurt - Strawberry, 175 Gr',81.97),(7,'Dates',32.79),(8,'Potatoes - Fingerling 4 Oz',35.62),(9,'Pork - Sausage, Medium',42.65),(10,'Chicken Giblets',12.21);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-15 21:37:15
