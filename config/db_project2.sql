-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: db_project2
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `reference_id` int(11) NOT NULL,
  `description` text,
  `image` text,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `reference_id` (`reference_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `article_ibfk_3` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'E-Twon Booster GT 48V',1199,4,1,1,'La BOOSTER GT est la dernière née de chez E-TWOW, fabricant reconnu pour ses trottinettes compactes et légères. La BOOSTER GT reprend tous les éléments qui ont fait le succès de la marque avec des améliorations notables au niveau de la vitesse et du confort. ','/assets/images/scooters/booster1.jpg'),(2,'ES2 Gris Noir Segway',499,5,2,2,'Légère et rapide, la trottinette NINEBOT Segway KickScooter ES2 Gris Noir est un moyen de transport urbain adapté à vos besoins. Connectée à votre mobile, elle contient de nombreuses fonctionnalités. Soyez serein dans tous vos déplacements grâce à sa grande autonomie.','/assets/images/scooters/ninebot1.jpg'),(3,'Zero 2',3490,6,3,3,'La trottinette électrique Zero 11X est la nouvelle trottinette sportive  de la gamme Zero. Elle dispose de deux moteurs pour une puissance totale de 2600w, de suspensions semi-hydrauliques et de freins à disque ventilés, d?une grande vitesse de pointe.','/assets/images/scooters/zero2.png'),(4,'Zero 11X',3490,6,3,4,'La trottinette électrique Zero 11X est la nouvelle trottinette sportive  de la gamme Zero. Elle dispose de deux moteurs pour une puissance totale de 2600w, de suspensions semi-hydrauliques et de freins à disque ventilés, d?une grande vitesse de pointe.','/assets/images/scooters/zero4.jpg'),(5,'Zero 3',3490,6,3,5,'La trottinette électrique Zero 11X est la nouvelle trottinette sportive  de la gamme Zero. Elle dispose de deux moteurs pour une puissance totale de 2600w, de suspensions semi-hydrauliques et de freins à disque ventilés, d?une grande vitesse de pointe.','/assets/images/scooters/zero3.png'),(6,'Zero wee-bot1',3490,6,3,6,'La trottinette électrique Zero 11X est la nouvelle trottinette sportive  de la gamme Zero. Elle dispose de deux moteurs pour une puissance totale de 2600w, de suspensions semi-hydrauliques et de freins à disque ventilés, d?une grande vitesse de pointe.','/assets/images/scooters/wee-bot1.jpg'),(7,'Zero wee-bot2',3490,6,3,7,'La trottinette électrique Zero 11X est la nouvelle trottinette sportive  de la gamme Zero. Elle dispose de deux moteurs pour une puissance totale de 2600w, de suspensions semi-hydrauliques et de freins à disque ventilés, d?une grande vitesse de pointe.','/assets/images/scooters/wee-bot2.jpg'),(8,'Zero wee-bot3',3490,6,3,8,'La trottinette électrique Zero 11X est la nouvelle trottinette sportive  de la gamme Zero. Elle dispose de deux moteurs pour une puissance totale de 2600w, de suspensions semi-hydrauliques et de freins à disque ventilés, d?une grande vitesse de pointe.','/assets/images/scooters/wee-bot3.jpg'),(9,'Zero wee-bot4',3490,6,3,9,'La trottinette électrique Zero 11X est la nouvelle trottinette sportive  de la gamme Zero. Elle dispose de deux moteurs pour une puissance totale de 2600w, de suspensions semi-hydrauliques et de freins à disque ventilés, d?une grande vitesse de pointe.','/assets/images/scooters/wee-bot4.jpg'),(10,'Zero wee-bot5',3490,6,3,10,'La trottinette électrique Zero 11X est la nouvelle trottinette sportive  de la gamme Zero. Elle dispose de deux moteurs pour une puissance totale de 2600w, de suspensions semi-hydrauliques et de freins à disque ventilés, d?une grande vitesse de pointe.','/assets/images/scooters/wee-bot5.jpg'),(11,'Casque cf',59,7,1,11,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque.jpg'),(12,'Casque df',34,7,1,12,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/Casque2.jpg'),(13,'Casque Abus ',32,7,1,13,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque3.jpg'),(14,'Casque Velvet',46,7,1,14,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque4.jpg'),(15,'Casque Hyban',15,7,1,15,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque5.jpg'),(16,'Casque dres',58,7,1,16,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque6.jpg'),(17,'Casque tuo',87,7,1,17,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque7.jpg'),(18,'Casque C5',11,7,1,18,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque.jpg'),(19,'Casque XWS',65,7,1,19,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque3.jpg'),(20,'Casque Hyban12',36,7,1,20,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque5.jpg'),(21,'Casque HTB',59,7,1,21,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque4.jpg'),(22,'Casque HybanAbus ',99,7,1,22,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque.jpg'),(23,'Casque Hyb ',14,7,1,23,'Le casque de pliant Plixi Fit permet, grâce à son pliage en 3, d?être rangé et de se faire tout petit. Outre son pliage rapide et facile ce casque vous offre une sécurité et un confort optimal.','/assets/images/Accessories/casque.jpg'),(24,'Béquille',40,10,1,24,'Gâchette frein Discovery Macfly','/assets/images/spares/bequille.jpg'),(25,'dale',40,10,1,25,'Gâchette frein Discovery Macfly','/assets/images/spares/dale-de-pliage.jpeg'),(26,'Ressort',40,10,1,26,'Gâchette frein Discovery Macfly','/assets/images/spares/Ressort-pour-amortisseur-arri.jpg'),(27,'handle',40,10,1,27,'Gâchette frein Discovery Macfly','/assets/images/spares/handlesblue.jpg'),(28,'Garde boue',40,10,1,28,'Gâchette frein Discovery Macfly','/assets/images/spares/Garde-boue-arri.jpg'),(29,'shoulder',40,10,1,29,'Gâchette frein Discovery Macfly','/assets/images/spares/shoulder-straps-Belt-handle.jpg'),(30,'Tube',40,10,1,30,'Gâchette frein Discovery Macfly','/assets/images/spares/Tube-pivot-colonne-avant.jpg'),(31,'ukaye',40,10,1,31,'Gâchette frein Discovery Macfly','/assets/images/spares/ukaye-bleu.jpg'),(32,'Gâchette frein Discovery Macfly',40,10,1,32,'Gâchette frein Discovery Macfly','/assets/images/spares/Gachette.jpg'),(33,'Gâchette frein Discovery Macfly',40,10,1,33,'Gâchette frein Discovery Macfly','/assets/images/spares/Gachette.jpg'),(34,'dale',40,10,1,34,'Gâchette frein Discovery Macfly','/assets/images/spares/dale-de-pliage.jpeg'),(35,'Garde boue',40,10,1,35,'Gâchette frein Discovery Macfly','/assets/images/spares/Garde-boue-arri.jpg'),(36,'Tube',40,10,1,36,'Gâchette frein Discovery Macfly','/assets/images/spares/Tube-pivot-colonne-avant.jpg'),(37,'Gâchette frein Discovery Macfly',40,10,1,37,'Gâchette frein Discovery Macfly','/assets/images/spares/Gachette.jpg'),(38,'ukaye',40,10,1,38,'Gâchette frein Discovery Macfly','/assets/images/spares/ukaye-bleu.jpg'),(39,'Ressort',40,10,1,39,'Gâchette frein Discovery Macfly','/assets/images/spares/Ressort-pour-amortisseur-arri.jpg'),(40,'Gâchette frein Discovery Macfly',40,10,1,40,'Gâchette frein Discovery Macfly','/assets/images/spares/Gachette.jpg'),(41,'Gâchette frein',35,10,1,41,'Gâchette frein Discovery Macfly','/assets/images/spares/Gachette.jpg'),(42,'Klaxon électrique',19,8,2,42,'Klaxon électrique rond puissant pour trottinette électrique','/assets/images/Accessories/klaxonElectrique.jpg'),(43,'Chargeur Speedway 4',89,9,3,43,'Besoin d\'un chargeur de rechange pour charger votre trottinette de la marque Minimotors ? Ce chargeur vous permettra de charger votre Speedway 4, que vous soyez au bureau ou chez vous ! Supporte une charge maximale de 58V.','/assets/images/Accessories/chargeurScooter.jpg'),(44,'Gâchette frein Discovery Macfly',40,10,1,44,'Gâchette frein Discovery Macfly','/assets/images/spares/Gachette.jpg'),(45,'BÉQUILLE POUR E-TWOW',29,11,2,45,'Béquille facile à fixer','/assets/images/spares/bequille.jpg'),(46,'Poignées ergonomiques pour E-TWOW',39,12,3,46,'Poignées ergonomiques pour E-TWOW','/assets/images/spares/handlesblue.jpg');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Xia'),(2,'Ninabot'),(3,'Zero');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facturation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `facturation_id` (`facturation_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`facturation_id`) REFERENCES `facturation` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartarticle`
--

DROP TABLE IF EXISTS `cartarticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cartarticle_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `cartarticle_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartarticle`
--

LOCK TABLES `cartarticle` WRITE;
/*!40000 ALTER TABLE `cartarticle` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartarticle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_category_id` (`sub_category_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronic Scooter',NULL),(2,'Accessories',NULL),(3,'Spares',NULL),(4,'Xia',1),(5,'Ninabot',1),(6,'Zero',1),(7,'Casque',2),(8,'Klaxon',2),(9,'Chargeur',2),(10,'Frein',3),(11,'Bequille',3),(12,'Poignées',3);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_hexa` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'red'),(2,'black'),(3,'white');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCart` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturation`
--

DROP TABLE IF EXISTS `facturation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_facturation` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `checkout` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_id` (`payment_id`),
  KEY `shipment_id` (`shipment_id`),
  CONSTRAINT `facturation_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `facturation_ibfk_2` FOREIGN KEY (`shipment_id`) REFERENCES `shipment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturation`
--

LOCK TABLES `facturation` WRITE;
/*!40000 ALTER TABLE `facturation` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'CB'),(2,'Paypal'),(3,'Virement');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_reference` int(11) NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `color_id` (`color_id`),
  KEY `size_id` (`size_id`),
  CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  CONSTRAINT `reference_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference`
--

LOCK TABLES `reference` WRITE;
/*!40000 ALTER TABLE `reference` DISABLE KEYS */;
INSERT INTO `reference` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,1,4),(5,5,3,1),(6,6,2,2),(7,7,3,3),(8,8,1,4),(9,9,2,1),(10,10,NULL,NULL),(11,11,NULL,NULL),(12,12,NULL,NULL),(13,13,NULL,NULL),(14,14,NULL,NULL),(15,15,NULL,NULL),(16,16,NULL,NULL),(17,17,NULL,NULL),(18,18,NULL,NULL),(19,19,NULL,NULL),(20,20,NULL,NULL),(21,21,NULL,NULL),(22,22,NULL,NULL),(23,23,NULL,NULL),(24,24,NULL,NULL),(25,25,NULL,NULL),(26,26,NULL,NULL),(27,27,NULL,NULL),(28,28,NULL,NULL),(29,29,NULL,NULL),(30,30,NULL,NULL),(31,31,NULL,NULL),(32,32,NULL,NULL),(33,33,NULL,NULL),(34,34,NULL,NULL),(35,35,NULL,NULL),(36,36,NULL,NULL),(37,37,NULL,NULL),(38,38,NULL,NULL),(39,39,NULL,NULL),(40,40,NULL,NULL),(41,41,NULL,NULL),(42,42,NULL,NULL),(43,43,NULL,NULL),(44,44,NULL,NULL),(45,45,NULL,NULL),(46,46,NULL,NULL);
/*!40000 ALTER TABLE `reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_time` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'S'),(2,'M'),(3,'L'),(4,'XL');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` text,
  `pass` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pierre','martin','pierre@gmail.com','rue de la liberte','pierre');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-20 16:00:44
